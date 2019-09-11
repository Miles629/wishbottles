import QtQuick 2.0
import QtQuick.Controls 2.5
import XD 1.0

Item {
    id:xdView
    visible: true
    width: 1280
    height: 800

    ScrollView {
        id: scrollView
        x: 0
        y: 0
        width: 1280
        height: 800

        ScrollBar {
            id: vbar1
            x: 1252
            y: 208
            width: 28
            height: 800
            anchors.topMargin: 0
            anchors.rightMargin: -1264
            anchors.bottomMargin: -790
            orientation: Qt.Vertical
            size: txtEdit.height
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            active: hovered || pressed
        }
    }

    AnimatedImage {
        id: background
        x: 0
        y: 0
        width: 1280
        height: 800
        source: "/backgrounds/xd3.jpg"
    }

//        // 滚动条

//        Rectangle {

//            id: scrollbar

//            anchors.right: view.right

//            anchors.top: view.top

//            width: 10

//            height: view.height

//            color: "lightgray"

//            clip: true



//            // 按钮

//            Rectangle {

//                id: button

//                x: 0

//                //view.visibleArea.yPosition表示一个变量,初始值为0,滚动条滚到底部时最大

//                y: view.visibleArea.yPosition * scrollbar.height

//                width: 10

//                //滚动按钮的长度为view.height/view.contentHeight*scrollbar.height;与下方代码等价

//                height: view.visibleArea.heightRatio * scrollbar.height;

//                color: "green"



//                // 鼠标区域

//                MouseArea {

//                    id: mouseArea

//                    anchors.fill: button

//                    //使得按钮可以上下拖动

//                    drag.target: button

//                    drag.axis: Drag.YAxis

//                    drag.minimumY: 0

//                    drag.maximumY: scrollbar.height - button.height



//                    // 拖动

//                    onMouseYChanged: {

//                        view.contentY = button.y / scrollbar.height * view.contentHeight

//                    }

//                }

//            }



//    }




    Rectangle {
        id: mb
        x: 0
        y: 0
        width: 1288
        height: 808
        color: "#454343"
        opacity: 0.4
    }

        Row {
            //【【【表情添加区】】】
            id: biaoqing
            x: 136
            y: 114
            width: 379
            height: 59

            Text {
                id: liezui
                width: 61
                height: 60
                text: qsTr("😀")
                font.pixelSize: 37


                MouseArea {
                    id: ma_liezui
                    x: 0
                    y: 0
                    width: 58
                    height: 59
                    onClicked: textInput.text=textInput.text+ qsTr("😀")

                }
            }

            Text {
                id: zhoumei
                width: 61
                height: 60
                text: qsTr("😔")
                font.pixelSize: 37

                MouseArea {
                    id: ma_zhoumei
                    x: 0
                    y: 0
                    width: 54
                    height: 59
                    onClicked: textInput.text=textInput.text+ qsTr("😔")
                }
            }

            Text {
                id: shangxin
                width: 61
                height: 60
                text: qsTr("😟")
                font.pixelSize: 37
                font.family:"微软雅黑"


                MouseArea {
                    id: ma_shangxin
                    x: 0
                    y: 0
                    width: 53
                    height: 59
                    onClicked: textInput.text=textInput.text+ qsTr("😟")
                }
            }

            Text {
                id: kuqi
                width: 61
                height: 60
                text: qsTr("😭")
                font.pixelSize: 37

                MouseArea {
                    id: ma_kuqi
                    x: 0
                    y: 0
                    width: 59
                    height: 59
                    onClicked: textInput.text=textInput.text+ qsTr("😭")
                }
            }

            Text {
                id: daxiao
                width: 61
                height: 60
                text: qsTr("😃")
                font.pixelSize: 37

                MouseArea {
                    id: ma_daxiao
                    x: 0
                    y: 0
                    width: 60
                    height: 59
                    onClicked: textInput.text=textInput.text+ qsTr("😃")
                }
            }

            Text {
                id: weixiao
                width: 61
                height: 60
                text: qsTr("😊")
                font.pixelSize: 37

                MouseArea {
                    id: ma_weixiao
                    x: 0
                    y: 0
                    width: 64
                    height: 59
                    onClicked: textInput.text=textInput.text+ qsTr("😊")
                }
            }







        }


        Column{
            y:200
            spacing: 20
            Rectangle {
                //【【【编辑框】】】
                id: txtEdit
                x: 136
                y: 189
                width: 970
                height: textInput.contentHeight>140?txtEdit.height+30:156;
                color: "#ffffff"
                radius: 6
                opacity: 0.7

                //            Flickable{
                //                id:flick0

                //            }

                TextEdit {
                    id: textInput
                    x: 8
                    y: 8
                    width: 954
                    height: 140
                    wrapMode: Text.WordWrap
                    font.pixelSize: 22
                    font.family:"微软雅黑"
                    focus: true
                    ScrollBar {
                        id: vbar
                        x: 936
                        //                    hoverEnabled: true
                        active: hovered || pressed
                        orientation: Qt.Vertical
                        size: txtEdit.height
                        width: 18
                        anchors.top: parent.top
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                    }
                }

            }


            Rectangle {
                //【【【发送按钮】】】
                id: send
                x: ma_XDsend.containsMouse?895:897//897
                y: ma_XDsend.containsMouse?355:358//358
                width: ma_XDsend.containsMouse?206:200//200
                height: ma_XDsend.containsMouse?48:44//44
                color: ma_XDsend.containsMouse?"#c85d44":"#dcb95e"
                radius: 6

                Text {
                    id: element
                    x: 55
                    y: 24
                    width: 96
                    height: 33
                    color: "#ffffff"
                    text: qsTr("发  送")
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 24
                    font.family: "微软雅黑"
                }

                MouseArea {
                    id: ma_XDsend
                    x: 0
                    y: 0
                    width: 200
                    height: 44
                    onClicked:{
                        //xdListView.addItem()
                        //textInput.text.replace("")
                        //点击发送，保存信息
                        $XD.sendContent(textInput.text);
//                        textInput.text="";
//                        $XD.resetnum()
//                        $XD.getlstc();
                        //引发三件事情
                      //  $XD.yinfa3();
                    }
                }
            }




            //        Rectangle{
            //            id: txtShow
            //            x: 136
            //            y: 415
            //            width: 970
            //            height: 347//改成设置自适应的高度
            //            color: "#ffffff"
            //            radius: 8
            //            opacity: 0.7


            //        }
            Component{
                id:xdDelegate
                Rectangle{
                    id:wrapper
                    width:parent.width
                    height: txtdate.height+txtxinyuan.height+25;//此处高度自适应
                    color: "#ffffff"
                    opacity: 0.7
                    radius: 6
                    Column{
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 6
                        Text {
                            id:txtdate
                            x:parent.x+10
                            text: "   "+date
                            width: parent.width
                            color: "#6e6b41"
                            font.pixelSize: 16
                            font.family: "微软雅黑"


                        }
                        Text {
                            id:txtxinyuan
                            text:"   "+xinyuan
                            x:parent.x+10

                            color: "#b4533c"
                            width: 945
                            font.pixelSize: 19
                            font.family: "微软雅黑"
                            wrapMode: Text.WordWrap

                        }

                    }
                }
            }

            ListView{
                id:xdListView
                x: 136
                y: 415
                width: 970
                height: 347
                delegate: xdDelegate;
                spacing: 10
                model: ListModel{
                    id:xdmodel
//                    ListElement{
//                        date:"2019-06-27"
//                        xinyuan:"我要当太空人，爷爷奶奶可高兴了，给了我爱吃的喜之郎果冻！"
//                    }
//                    ListElement{
//                        date:"2019-06-28"
//                        xinyuan:"好高兴啊，又吃成长快乐了！"
//                    }
                }



              //  function addItem(){



                    //并且把input新写的内容导入到txt
              //  }

            }
        }
        MouseArea {
            id: ma_back
            x: 60
            y: 64
            width: 47
            height: 47
            onClicked: {
                pageloader_returnToWelcom.source="welcome.qml"
                //
            }

            Rectangle{

                AnimatedImage {
                    id: fanhui
                    x: 0
                    y: -10
                    width: 40
                    height: 42
                    opacity: 0.8
                    source: "icons/fanhui.png"

                }

            }
        }


        Loader{
            id:pageloader_returnToWelcom
            width: 1280
            height: 800

        }



//        Connections{
//            target: $XD
//            onFasong:
//                $XD.saveTxt()
//        }



        Connections
        {
            target:$XD
            onSign1:
            { $XD.bug()
                $XD.resetnum()

                if($XD.renum()<=(($XD.relstc()-1)/2))
                {
                    //写一个判断当前date是否为\n
                    if($XD.judge($XD.renum()))
                    {
                        $XD.loading($XD.renum())
                        $XD.bug()

                    $XD.numadd1()
                    }
                }
                $XD.ssign2()
               // $XD.againxd()


            }
        }
        Connections
        {
            target:$XD
            onSign3:
            { $XD.bug()
                if($XD.renum()<=(($XD.relstc()-1)/2))
                {$XD.bug()
                    //写一个判断当前date是否为\n
                    if($XD.judge($XD.renum()))
                    {$XD.bug()
                        $XD.loading($XD.renum())

//                xdmodel.append(
//                            {

//                                date:$XD.sendDate()

////                                    Qt.formatDateTime(new Date(), "yyyy-MM-dd")

//                                //getTime()
//                                ,
//                                xinyuan:$XD.sendXinyuan()
//                            });
                    $XD.numadd1()
                         $XD.ssign2()
                    }
                }



            }
        }
        Connections
        {
            target: $XD
            onSign2:{
            xdmodel.append(
                        {

                            date:$XD.sendDate()

//                                    Qt.formatDateTime(new Date(), "yyyy-MM-dd")

                            //getTime()
                            ,
                            xinyuan:$XD.sendXinyuan()
                        });
                $XD.next()
            }
        }




//        //[[星星闪烁动画]]
//        Rectangle {
//            id: huxi1
//            x: 200
//            y: 100
//            width: 35
//            height: 35
//            color: Qt.rgba(255,255,255,0)
//            Timer {
//                id: areaTimer
//                property bool stateFlag: true
//                interval: 1000; running: true; repeat: true
//                onTriggered:  {
//                    console.log("areaTimer trigger")
//                    if(stateFlag) {
//                        huxi1.state = "end";
//                    } else {
//                        huxi1.state = "begin";
//                    }
//                    stateFlag = !stateFlag;
//                }
//            }

//            Image {
//                id: img
//                x: 32
//                y: 8
//                width: parent.width
//                height: width
//                fillMode: Image.PreserveAspectFit
//                opacity: 1
//                source: "images/star3.png"
//            }

//            state: "begin"
//            states: [
//                State {
//                    name: "begin"
//                    PropertyChanges { target: img; opacity: 1.0 }
//                },
//                State {
//                    name: "end"
//                    PropertyChanges { target: img; opacity: 0.0 }
//                }
//            ]
//            transitions: [
//                Transition {
//                    from: "begin"; to: "end"
//                    PropertyAnimation {target: img; properties: "opacity"; duration: 1000}
//                },
//                Transition {
//                    from: "end"; to: "begin"
//                    PropertyAnimation {target: img; properties: "opacity"; duration: 1000}
//                }
//            ]
//        }


//        Rectangle {
//            id: huxi2
//            x: 800
//            y: 30
//            width: 34
//            height: 40
//            color: Qt.rgba(255,255,255,0)
//            Timer {
//                id: areaTimer2
//                property bool stateFlag: true
//                interval: 1000; running: true; repeat: true
//                onTriggered:  {
//                    console.log("areaTimer trigger")
//                    if(stateFlag) {
//                        huxi2.state = "end";
//                    } else {
//                        huxi2.state = "begin";
//                    }
//                    stateFlag = !stateFlag;
//                }
//            }

//            Image {
//                id: img2
//                x: 33
//                y: 8
//                width: parent.width
//                height: width
//                fillMode: Image.PreserveAspectFit
//                opacity: 0.85
//                source: "images/star5.png"
//            }

//            state: "begin"
//            states: [
//                State {
//                    name: "begin"
//                    PropertyChanges { target: img2; opacity: 0.0 }
//                },
//                State {
//                    name: "end"
//                    PropertyChanges { target: img2; opacity: 0.85 }
//                }
//            ]
//            transitions: [
//                Transition {
//                    from: "begin"; to: "end"
//                    PropertyAnimation {target: img2; properties: "opacity"; duration: 2000}
//                },
//                Transition {
//                    from: "end"; to: "begin"
//                    PropertyAnimation {target: img2; properties: "opacity"; duration: 2000}
//                }
//            ]
//        }


        Connections{
            target: $XD
            onXinhao3:{
                xdmodel.append(
                            {

                                date:Qt.formatDateTime(new Date(), "yyyy-MM-dd")


    //                                    Qt.formatDateTime(new Date(), "yyyy-MM-dd")

                                //getTime()
                                ,
                                xinyuan:textInput.text
                            });
                textInput.text=""

            }
        }





    }






