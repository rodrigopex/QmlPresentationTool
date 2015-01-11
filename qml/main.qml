import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

import "presentation"

ApplicationWindow {
    id: win
    visible: true
    width: 640
    height: 480
    title: qsTr("Qt Mobile 101")

    OpacityTransitionPresentation {
        anchors.fill: parent
        SlideCounter {}
        Clock {}
        Slide {
            title: "Qt Quick"
            GridLayout {
                anchors.fill: parent
                columns: 2
                Rectangle {
                    color: "#0f0"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    opacity: saturate.containsMouse ? 0.8 : 0.2
                    Behavior on opacity {
                        NumberAnimation { duration: 300 }
                    }

                    MouseArea {
                        id: saturate
                        anchors.fill: parent
                        hoverEnabled: true
                    }
                }
                Rectangle {
                    opacity: 0.2
                    color: "#ff0"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    MouseArea {
                        id: shadow
                        anchors.fill: parent
                        hoverEnabled: true
                    }
                }
                Rectangle {
                    opacity: 0.2
                    color: "#0ff"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    MouseArea {
                        id: blur
                        anchors.fill: parent
                        hoverEnabled: true
                    }
                }
                Rectangle {
                    opacity: 0.2
                    color: "#fff"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    MouseArea {
                        id: reflect
                        anchors.fill: parent
                        hoverEnabled: true
                    }
                }
            }
            Image {
                id: logo
                visible: false
                source: "qrc:/assets/images/qt_logo.png"
                width: 80
                height: 80
                fillMode: Image.PreserveAspectFit
            }
            DropShadow {
                //visible: shadow.containsMouse
                opacity: touch.containsMouse ? 1.0 : 0.3
                anchors.fill: logo
                horizontalOffset: 3
                verticalOffset: 3
                radius: 8.0
                samples: 16
                color: "#80000000"
                source: logo
                Behavior on scale {
                    NumberAnimation { duration: 1000; easing.type: Easing.OutBack }
                }
                scale: touch.pressed ? 1.4 : 1.0
                MouseArea {
                    id: touch
                    anchors.fill: parent
                    drag.axis: Drag.XAndYAxis
                    drag.target: logo
                    propagateComposedEvents: true
                    preventStealing: true
                    onPressed: {
                        //                        mouse.accepted = false
                    }
                    onReleased: {
                        mouse.accepted = false

                    }

                    hoverEnabled: true
                }
            }
        }

        Slide {
            centeredText: "<b><big><big><big>Qt Mobile 101</big></big></big></b><br><br>Rodrigo Peixoto<br><small><small><small>rodrigopeixoto@usepiggo.com</small></small></small>"
        }
        Slide {
            title: qsTr("Quem é o instrutor?")
            content: [
                "Formado em Engenharia de Computação na UFPE",
                "Mestre em Modelagem Computacional do Conhecimento",
                "Professor do Instituto de Computação - UFAL",
                "Co-fundador do Piggo (troco eletrônico)",
                "Experiências:",
                " C.E.S.A.R.",
                " Itautec",
                " Consultoria - destaques 1Click2Eat e US Air Force",
                " BlackBerry"
            ]
        }
        //        Slide {
        //            title: "Code editor inside presentation"
        //            CodeEditor {
        //                codeId: "slide01"
        //                anchors.fill: parent
        //            }
        //        }
        Slide {
            title: qsTr("O que é C++/Qt?")
            content: [
                "Framework de desenvolvimento multi-plataforma escrito em C++",
                " Atinge as plataformas mais usadas no mundo",
                " Alta performance",
                " Torna C++ fácil de usar e prover tipos \"primitivos\" proderosos",
                " Introspecção",
                " Comunicação inter-objetos",
                " Gerenciamento \"automático\" de memória",
                "Quase uma nova linguagem em cima de C++"
            ]
        }
        Slide {
            title: qsTr("Quem usa Qt?")
            content: [
                " Google Earth",
                " Microsoft Skype",
                " Spotify",
                " Ubuntu Phone",
                " Altera Quartus (FPGA)",
                " BlackBerry 10",
                " Samsung Tizen",
                " Meego",
                " Vitual Box",
                " QNX",
                " ..."
            ]
        }
        Slide {
            title: qsTr("Onde Qt roda?")
            content: [
                "Smartphones",
                " Apple devices - iPhone, iPad, iPod Touch",
                " Android",
                " Windows Phone",
                " BlackBerry",
                "Desktop",
                " Linux",
                " Windows",
                " Mac OSX",
                "Sistemas embarcados"
            ]
        }
        Slide {
            title: qsTr("Licenças ao gosto do desenvolvedor")
            content: [
                "GPL",
                " O código tem que ser aberto",
                " Mudanças no Qt tem que voltar para a comunidade",
                "LGPL",
                " O código pode ser aberto ou fechado",
                " Mudanças no Qt tem que voltar para a comunidade",
                "Comercial",
                " O projeto pode ser fechado",
                " Mudanças no Qt podem ser manter mantidas privadas"

            ]
        }
        Slide {
            title: qsTr("Módulos de Qt")
            FullImage {
                source: "qrc:/assets/images/qt_modules.png"
                caption: "Módulos convencionais"
            }
        }
        Slide {
            title: qsTr("Como funciona?")
            content: [
                "CPU + GPU",
                "Parte gráfica roda GPU usando OpenGL",
                "O restante na CPU",
                "Performático (60 FPS)",
                "Duas threads independentes"
            ]
        }
        Slide {
            title: qsTr("Qt visão geral")
            FullImage {
                source: "qrc:/assets/images/qt.png"
                caption: ""
            }
        }
        Slide {
            centeredText: "<b>Qt Quick</b>"
        }

        Slide {
            title: "Qt Quick"
            content: [
                "Criado para que Designers pudessem trabalhar em suas próprias interfaces",
                "Foco em interface de toque",
                "Baseada em JavaScript",
                "Fácil aprendizado"
            ]
        }
        Slide {
            title: "Qt Quick"
            content: [
                "Integração natural com C++",
                "Integração natural com OpenGL",
                "Alta performance - 60 FPS",
                "Animações e efeitos",
                "Componentes padrão (botões, janelas, dialogs, label, etc)",
                "Layouts dinâmicos"
            ]
        }
        Slide {
            title: "Qt Quick"
            content: [
                "Exemplos...",
                "Esta apresentação foi feita em C++/Qt usando Qt Quick!!!"
            ]
        }
        Slide {
            title: "Qt Quick - Introdução"
            content: [
                "View",
                " Descrição",
                " Comportamento",
                "Descreve a interface gráfica",
                " O que os elementos são",
                "  Qt Markup language - QML",
                " Como eles reagem",
                "  JavaScript",
                "Árvore de elementos"
            ]
            SideImage {
                source: "qrc:/assets/images/qt_tree.png"
                caption: "Retângulo com alguns filhos"
            }
        }
        Slide {
            title: "Qt Quick - Elementos"
            content: [
                "Elementos são etruturas em na linguagem de markup (QML)",
                " Conjunto de propriedades",
                " Elementos visuais",
                "  Rectangle, Text, TextInput, ...",
                " Elementos não visuais",
                "  Estados, transições, gradientes, caminhos, ...",
                "Item é a base de todos os visuais",
                " Posição, dimensões, agrupamento de itens, ...",
                " Usado como container"
            ]
        }
        Slide {
            title: "Qt Quick - Elementos II"
            content: [
                "Elementos são descritos por propriedades",
                " Nome + Valor",
                "  Valores default",
                "  Tipos definidos ou não (var)",
                " Separados por ';' ou quebra de linha",
                " Usadas para",
                "  Identificar elementos (id)",
                "  Customizar a aparência de elementos",
                "  Alterar o comportamento de elementos"
            ]
        }
        Slide {
            title: "Qt Quick - Exemplo 1"
            CodeEditor {
                codeId: "Exemplo01"
            }
        }
        Slide {
            title: "Qt Quick - Propriedades"
            content: [
                "Propriedades podem ser",
                " Padrão",
                "  x: 30",
                " Agrupadas",
                "  font.pixelSize: 20",
                " De identificação",
                "  id: container",
                " Anexadas",
                "  Layout.fillWidth: true //Detalhes em breve",
                " Customizadas",
                "  property string name: \"fulano\""
            ]
        }
        Slide {
            title: "Qt Quick - Exemplo 2"
            CodeEditor {
                codeId: "Exemplo02"
            }
        }
        Slide {
            title: "Qt Quick - Propriedades II"
            content: [
                "Propriedados podem ser dos tipos",
                " Number: 10 e 4.6",
                " Boolean: true e false",
                " String: \"Isso é uma string\"",
                " Constante: AlignLeft",
                " Lista: [...]",
                " Script",
                " Outros tipos mais complexos",
                "  colors, dates, times, rects, points, sizes, 3Dvectors",
                "  Normalmente criados usando um construtor"
            ]
        }

        Slide {
            title: "Qt Quick - Exemplo 3"
            CodeEditor {
                codeId: "Exemplo03"
            }
        }
        Slide {
            title: "Qt Quick - Resumo"
            content: [
                " QML define a UI usando elementos e propriedades",
                "  Elementos são estruturas em QML",
                "  Itens são elementos visuais",
                " Elementos padrão possuem propriedades e métodos",
                "  Propriedades podem receber valores diferentes do default",
                "  O valor das propriedades podem ser expressões/scripts",
                "  id identifica os elementos",
                " Propriedades podem ser conectadas (bound)",
                "  Quando uma muda a as propriedades conectadas mudam também",
                " Elementos podem ter métodos",
                " Uma grande gama de tipos é fornecida para uso"
            ]
        }
        Slide {
            title: "Qt Quick - Perguntas"
            content: [
                //"Como carregar um módulo QML?",
                "Qual a difença entre Rectangle e width?",
                "Elementos podem ser agrupados? Como?",
                "Como criar elementos com uma identidade?",
                "Como podemos referenciar um outro component? Como seria o código?",
                "O que significa <i>property binding</i>? Como funciona?"
            ]
        }
        /*TODO: aproveitar esse trecho
        Slide {
            title: "Qt Creator - introdução rápida"
            content: [
                "Criar um projeto Qt",
                "Criar um arquivo QML",
                "Executar o projeto"
            ]
        }*/

        Slide {
            title: "Qt Quick - Exercício 01"
            content: [
                "Recrie o Item",
                "Use apenas Retângulos",
                "Não precisa ser exato"
            ]
            SideImage {
                source: "qrc:/assets/images/qt_exercicio_01.png"
            }
        }
        Slide {
            title: "Qt Quick - Solução 01"
            CodeEditor {
                codeId: "Solucao01"
            }
        }

        Slide {
            title: "Qt Quick - Conceitos básicos de Qt"
            content: [
                "Todo elemento é um objeto e herda de QObject",
                "Todo QObject possui a relação Pai-Filho",
                "O objeto pai em QML é obtido através do id parent",
                "Todo objeto pode ter métodos - aqui funções de JavaScript",
                "console.log é uma função usada para debug"
            ]
        }
        Slide {
            title: "Qt Quick - Exemplo 04"
            CodeEditor {
                codeId: "Exemplo04"
            }
        }
        Slide {
            title: "Qt Quick - Conceitos básicos de Qt"
            content: [
                "Signals e slots",
                " Comunicação entre objetos",
                " Acontece de forma assíncrona, facilita o uso de threads",
                " 1 signal pode ser ligado a n signals e n slots ao mesmo tempo",
                "",
                "MouseArea - Componente que possibilita receber eventos do mouse",
                "Ao ser construído um elemento emite o sinal Component.completed()"
            ]
        }
        Slide {
            title: "Qt Quick - Exemplo 05"
            CodeEditor {
                codeId: "Exemplo05"
            }
        }
        Slide {
            title: "Qt Quick - Conceitos básicos de Qt"
            content: [
                "Então como se dá o <i>binding</i> de propriedades? Alguma idéia?",
                "O escopo de uma variável é por arquivo no elemento raíz",
                "Para acessar propriedades de outros objetos será necessário sempre usar o id",
                "A ordem não interfere no escopo, apenas na visibilidade",
                "Elementos criados depois serão colocados mais acima dos posteriores",
                " Imagine uma pilha de elementos"
            ]
        }
        Slide {
            title: "Qt Quick - Exemplo 06"
            CodeEditor {
                codeId: "Exemplo06"
            }
        }
        Slide {
            title: "Qt Quick - Layouts"
            content: [
                " <i>Anchor-based Layouts</i>",
                " Tradicionais Row, Column e Grid",
                " Sistema de ancoragem",
                "  left, right, top, bottom",
                "  fill, centerIn, baseline",
                "  verticalCenter, horizontalCenter"
            ]
            SideImage {
                source: "qrc:/assets/images/anchors.png"
                caption: "Ancoragens possíveis"
            }
        }
        Slide {
            title: "Qt Quick - Exemplo 07"
            CodeEditor {
                codeId: "Exemplo07"
            }
        }
        Slide {
            title: "Qt Quick - Exemplo 08"
            CodeEditor {
                codeId: "Exemplo08"
            }
        }
        Slide {
            title: "Qt Quick - Layouts margens"
            content: [
                " Margens para uma ancoragem",
                " topMargin, bottomMargin",
                " leftMargin, rightMargin",
                " margins"
            ]
            SideImage {
                source: "qrc:/assets/images/margins.png"
                caption: "Ancoragens possíveis"
            }
        }
        Slide {
            title: "Qt Quick - Exemplo 09"
            CodeEditor {
                codeId: "Exemplo09"
            }
        }
        Slide {
            title: "Qt Quick - Exercício 02"
            content: [
                "Recrie o Item",
                "Use anchors",
                "Use apenas Rectangles",
                ""
            ]
            SideImage {
                source: "qrc:/assets/images/qt_exercicio_02.svg"
            }
        }
        Slide {
            title: "Qt Quick - Solução 02"
            CodeEditor {
                codeId: "Solucao02"
            }
        }
    }
}
