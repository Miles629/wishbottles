import QtQuick 2.2
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.13
import TCPClient 1.0

Window {

    id:clientshow
    visible: true
    width: 1280
    height: 800
    //    TCPClient{
    //        id:tcp
    //    }
    AnimatedImage {
        id: cshowImage
        x: 0
        y: 0
        width: 1280
        height: 800
        source: "backgrounds/csshow.jpg"
    }

    Item {

        //CoverFlow
        //滑动动画展示
        id:coverFlow
        anchors.fill: parent
        model: model

        property ListModel model
        property int itemCount:3


        PathView{
            id:xhpathView
            transformOrigin: Item.Center

            model:coverFlow.model
            delegate:delegate

            path:coverFlowPath
            pathItemCount:coverFlow.itemCount
            anchors.fill:parent
            preferredHighlightBegin:0.5
            preferredHighlightEnd:0.5

        }


        Path{
            id:coverFlowPath
            startX:0
            startY:coverFlow.height/3
            PathAttribute{name:"iconZ";value:0}
            PathAttribute{name:"iconAngle";value:70}
            PathAttribute{name:"iconScale";value:0.6}

            PathLine{x:coverFlow.width*0.5;y:coverFlow.height/3;  }
            PathAttribute{name:"iconZ";value:100}
            PathAttribute{name:"iconAngle";value:0}
            PathAttribute{name:"iconScale";value:1.0}

            PathLine{x:coverFlow.width;y:coverFlow.height/3;}
            PathAttribute{name:"iconZ";value:0}
            PathAttribute{name:"iconAngle";value:-70}
            PathAttribute{name:"iconScale";value:0.6}
            PathPercent{value:1.0}
        }



    }

    AnimatedImage {
        id: img_tohome
        x: 21
        y: 17
        width: 40
        height: 40
        source: "icons/fanhui.png"

        MouseArea {
            id: ma_cstohome
            width: 40
            height: 40
            onClicked:{
                $TCPClient.showw();
                clientshow.hide();
                //参见登录成功到clientshow

            }
        }

    }

    ListModel{
        id:model
        //           ListElement{
        //               name:"小叮当"
        //               xinyuan:"我要当太空人，爷爷奶奶可高兴了，给了我最爱的喜之狼果冻"
        //           }
        //           ListElement{
        //               name:"小快乐"
        //               xinyuan:"我要当太空人，爷爷奶奶可高兴了，给了我最爱的喜之狼果冻"
        //           }
        //           ListElement{
        //               name:"小淘气"
        //               xinyuan:"我要当太空人，爷爷奶奶可高兴了，给了我最爱的喜之狼果冻"
        //           }
        //           ListElement{
        //               name:"马小跳"
        //               xinyuan:"我要当太空人，爷爷奶奶可高兴了，给了我最爱的喜之狼果冻"
        //           }

    }

    AnimatedImage {
        id: animatedImage
        x: 600
        y: 6
        width: 60
        height: 63
        source: "icons/home.png"

        MouseArea {
            id: ma_cshowtoc
            width: 59
            height: 63
            onClicked:
            {
                pageloader_cshowtoc.source="Client.qml"
                // clientshow.visible=false

                cshowImage.visible=false
                coverFlow.visible=false
                $TCPClient.ctocs();

            }

        }

        Connections{
            target: $TCPClient
            onCstoc:{

                coverFlow.visible=true
                cshowImage.visible=true
            }
        }

    }

    Component{
        id:delegate;
        Item {
            //Mydelegate
            id:delegateItem
            width:420
            height:300
            z:PathView.iconZ
            scale:PathView.iconScale


            Rectangle{
                id:dlgImg
                color: "#ffffcc"
                opacity: 0.4
                radius: 6
                //source:url
                width:delegateItem.width
                height:delegateItem.height

            }

            Column{
                //spacing: 60
                Text {
                    //显示用户名
                    text: "【"+name+"】"
                    anchors.leftMargin: 20
                    font.bold: false
                    font.pixelSize: 22
                    color: "#8e3e1f"
                    font.family: "微软雅黑"


                }
                Text {
                    //显示心愿、、这里写的有结构性的错误诶~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                   x:parent.x+10
                    text: "    "+xinyuan
                    width: 400
                    // anchors.left: parent
                    // anchors.leftMargin: 8
                    color: "#ffffff"
                    wrapMode: Text.WordWrap
                    font.bold: false
                    font.pixelSize: 24
                    font.family: "微软雅黑"


                }
                //               Rectangle{
                //                   id:space
                //                   width: parent.width
                //                   height: 400
                //                   color: "blue"
                //               }





            }
            Rectangle {
                id: showPL
                //               anchors.bottom: parent
                x:270//518
                y: 340//436
                width: 100
                height: 34
                color: ma_showPL.containsMouse?"#c85d44":"#dec674"
                radius: 6
                Text {
                    id: chakan
                    anchors.centerIn: parent
                    text: qsTr("查看评论")
                    font.family: "微软雅黑"
                }
                MouseArea{
                    id:ma_showPL
                    width:parent.width
                    height: parent.height
                    onClicked:{
                        //xhpathView.currentIndex
                        //👆这是当前的索引值
                        pageloader_wypl.visible=false
                        pageloader_showpl.visible=true
                        $TCPClient.cread()
                        pageloader_showpl.source="Show_pinglun.qml"
                        $TCPClient.cread()
                        //并对show_pinglun.qml页面中的评论初始化
                        $TCPClient.showpl(xhpathView.currentIndex)
                    }
                }

            }

            Rectangle {
                id: woyaoPL
                //anchors.bottom: parent
                x: 60//518
                y: 340
                //436
                width: 100
                height: 34
                color: ma_woyaoPL.containsMouse?"#c85d44":"#dec674"
                radius: 6

                Text {
                    id: pinglun
                    anchors.centerIn: parent
                    text: qsTr("我要评论")
                    font.family: "微软雅黑"
                }
                MouseArea{
                    id:ma_woyaoPL
                    width:parent.width
                    height: parent.height
                    onClicked: {
                        pageloader_showpl.visible=false
                        pageloader_wypl.visible=true
                        pageloader_wypl.source="Woyao_PL.qml"
                        $TCPClient.wypl(xhpathView.currentIndex)


                    }
                }

            }





            //可能有错的地方
            transform:Rotation{
                origin.x:dlgImg.width/2
                origin.y:dlgImg.height/2
                axis{x:0;y:1;z:0}
                angle:delegateItem.PathView.iconAngle
            }
        }
    }
    //    function addItem(){
    //        ;
    //    }   //                xhpathView.append({
    //                     name:$TCPClient.rename(),
    //                     xinyuan:$TCPClient.remsg()
    //                                  });

    //            }
    //                xhpathView.append({
    //                     name:$TCPClient.rename(),
    //                     xinyuan:$TCPClient.remsg()
    //                                  });



    Connections{
        target: $TCPClient
        onJishi:{
            xhpathView.model.append({

                                         name:$TCPClient.jishiname(),
                                        xinyuan:$TCPClient.jishixy()
                                    });
        }
    }

    Connections
    {
        target: $TCPClient
        onClosew:
        {
            //ask for count
            $TCPClient.askcount()

        }
    }
    Connections
    {
        target: $TCPClient
        onShowc:
        {

            // var showcount=$TCPClient.recount()
            $TCPClient.cread()
            //            for(var i=1;i<showcount;i++)
            //            {
            if($TCPClient.ren()<=$TCPClient.recount())
            {
                $TCPClient.cread()
                //ask for msg
                $TCPClient.askmsg($TCPClient.ren())
                $TCPClient.nadd1()
            }

        }
    }
    Connections
    {
        target: $TCPClient
        onAgain:
        {

            //var showcount=$TCPClient.recount()
            $TCPClient.cread()
            if($TCPClient.ren()<=$TCPClient.recount())
            {
                $TCPClient.cread()
                //ask for msg
                $TCPClient.askmsg($TCPClient.ren())
                $TCPClient.nadd1()


            }
        }
    }
    Connections
    {
        target: $TCPClient
        onAppen:
        {
            xhpathView.model.append({
                                        name:$TCPClient.rename(),
                                        xinyuan:$TCPClient.remsg()
                                    });
            $TCPClient.reask()

        }
    }

    Connections{
        target: $TCPClient
        onHidecs:{
            coverFlow.visible=true
            clientshow.show()
        }
    }

    Connections{
        target: $TCPClient
        onResuc:{

//            coverFlow.visible=true
            clientshow.show()
        }
    }

    Connections{
        target: $TCPClient
        onShowplpl:{
            pageloader_showplpl.source="Woyao_PL.qml"

        }
    }
//    Connections
//    {
//        target: $TCPClient
//        onGetplnum:
//        {
//            $TCPClient.wypl(xhpathView.currentIndex);
//        }
//    }

    //【【【界面跳转】】】
    Loader{
        id:pageloader_showpl
        x: 0
        y: 0
        width: 650
        height: 300

    }

    Loader{
        id:pageloader_wypl
        x: 316
        y: 501
        width: 567
        height: 247

    }
    Loader{
        id:pageloader_cshowtoc
        width: 1280
        height: 800

    }

    Loader{
        id:pageloader_showplpl
        x:316
        y:501
        width: 650
        height: 290

    }




    //1.单击client.qml的发送时，让pathView调用这里的add()函数
    //2、这样直接append()如果再次打开显示不了怎么办？我每次开机的时候都要把数据库的东西导出吗？





}
