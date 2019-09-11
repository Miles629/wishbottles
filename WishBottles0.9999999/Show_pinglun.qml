import QtQuick 2.0
import TCPClient 1.0
Item {
    id:showpl
    width: 650
    height: 236
    ListView{
        id:list_pinglun
        x: 324
        y: 506
        width: 650
        height: parent.height
        spacing: 10
        delegate: plDelegate
        model:xhmodel

    }

    Component{
        id:plDelegate

        Rectangle{
            id:plrectangle
            width:650
            height: showpinglun.contentHeight+25
            //height: 236
            color: "#ffffff"
            opacity: 0.7
            radius: 6
            Column{
              //  spacing: 20
//                Text {
//                    text: "   "+name
//                    color: "#b69968"   //记得改颜色
//                    font.family: "微软雅黑"
//                    font.pixelSize: 18
//                    wrapMode: Text.WordWrap

//                }
                Rectangle{
                    width: 620
                    height: 10
                    color: "blue"
                    opacity: 0
                }

                Text {

                    x:parent.x+20
                    y:parent.y+20
                    id:showpinglun
                    text:pinglun
                    width: 620
                    color: "#b4533c"   //记得改颜色
                    font.family: "微软雅黑"
                    font.pointSize: 10
                    wrapMode: Text.WordWrap

                }

            }

            MouseArea{
                id:ma_clickpl

                width:650
                height: showpinglun.contentHeight+25
                onDoubleClicked: {
                    $TCPClient.plindex(list_pinglun.currentIndex)
                    $TCPClient.showplpl1()
                    //pageloader_plpl.source="Woyao_PL.qml"
                    $TCPClient.hidepl1()

                }

            }

        }
    }



    ListModel{
       id:xhmodel
       //这两个element到时候要删掉
//       ListElement{
//           name:""
//           pinglun:"lalal"
//       }
//       ListElement{
//           name:""
//           pinglun:"lalal2"
//       }
   }


//    function addPL(){
//        xhmodel.append({
//         "name":"",   //此处获取当前索引值对应的评论人用户名
//         "pinglun":""  //此处获取当前索引值对应的一条评论
//                    });
//    }




//    Loader{
//        id:pageloader_plpl
//        x: 400
//        y: 500
//        width: 781
//        height: 397

//    }

    Connections
    {
        target: $TCPClient
        onShowpl2:
        {
            xhmodel.clear();
            $TCPClient.resetpln()
            $TCPClient.askplc()
        }
    }

    Connections
    {
        target: $TCPClient
        onAfterplc:
        {

            // var showcount=$TCPClient.recount()
            $TCPClient.cread()
//            for(var i=1;i<showcount;i++)
//            {
                if($TCPClient.repln()<=$TCPClient.replc())
                {
                $TCPClient.cread()
            //ask for msg
                $TCPClient.plmsg($TCPClient.repln())
                    $TCPClient.plnadd1()
                }
//                xhpathView.append({
//                     name:$TCPClient.rename(),
//                     xinyuan:$TCPClient.remsg()
//                                  });

//            }
        }
    }
    Connections
    {
        target: $TCPClient
        onPlagain:
        {

             //var showcount=$TCPClient.recount()
            $TCPClient.cread()
            if($TCPClient.repln()<=$TCPClient.replc())
            {
                $TCPClient.cread()
            //ask for msg
                $TCPClient.plmsg($TCPClient.repln())
                     $TCPClient.plnadd1()
//                xhpathView.append({
//                     name:$TCPClient.rename(),
//                     xinyuan:$TCPClient.remsg()
//                                  });

            }
        }
    }
    Connections
    {
        target: $TCPClient
        onAddpl:
        {



            //以上是我加的内容
                xhmodel.append({

                     pinglun:$TCPClient.repl()
                                  });
                $TCPClient.reaskpl()

        }
    }

    Connections{
        target: $TCPClient
        onHidepl:showpl.visible=false
    }






}
