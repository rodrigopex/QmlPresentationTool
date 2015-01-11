#include "qmlhighlighter.h"
#include <QColor>

void QMLHighlighter::highlightBlock(const QString &text)
{
    QTextCharFormat keywordFormat;
    keywordFormat.setForeground(QColor("#d7ffaf")); // Identifier
    QTextCharFormat typeFormat;
    typeFormat.setForeground(QColor("#d33682")); // Type
    QTextCharFormat commentFormat;
    commentFormat.setForeground(QColor("#859900")); // Comment
    QTextCharFormat numericConstantFormat;
    numericConstantFormat.setForeground(QColor("#cb4b16")); // Constant
    QTextCharFormat stringConstantFormat;
    stringConstantFormat.setForeground(QColor("#2aa198"));

    QTextCharFormat propertyFormat;
    propertyFormat.setForeground(QColor("#cb4b16"));

    QRegExp type("\\b[A-Z][A-Za-z]+\\b");
    QRegExp numericConstant("[0-9]+\\.?[0-9]*");
    QRegExp stringConstant("['\"].*['\"]");//Not multiline strings, but they're rare
    QRegExp lineComment("//[^\n]*");
    QRegExp startComment("/\\*");
    QRegExp endComment("\\*/");

    QRegExp property("\\w*\\.?\\w+:");

    applyBasicHighlight(text, property, propertyFormat);
    applyBasicHighlight(text, type, typeFormat);
    applyBasicHighlight(text, numericConstant, numericConstantFormat);
    applyBasicHighlight(text, stringConstant, stringConstantFormat);
    applyBasicHighlight(text, lineComment, commentFormat);

    setCurrentBlockState(0);

    int startIndex = 0;
    if (previousBlockState() != 1)
        startIndex = text.indexOf(startComment);

    while (startIndex >= 0) {
        int endIndex = text.indexOf(endComment, startIndex);
        int commentLength;
        if (endIndex == -1) {
            setCurrentBlockState(1);
            commentLength = text.length() - startIndex;
        } else {
            commentLength = endIndex - startIndex
                + endComment.matchedLength();
        }
        setFormat(startIndex, commentLength, commentFormat);
        startIndex = text.indexOf(startComment,
                startIndex + commentLength);
    }

}

void QMLHighlighter::applyBasicHighlight(const QString &text, QRegExp &re, QTextCharFormat &format)
{
    int index = text.indexOf(re);
    while (index >= 0) {
        int length = re.matchedLength();
        setFormat(index, length, format);
        index = text.indexOf(re, index + length);
    }
}
