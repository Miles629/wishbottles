import QtQuick 2.2
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

//import QtQuick.Controls.Styles 1.4

Window {
    id:start
    visible: true

    width: 1280
    height: 800
AnimatedImage {
    id: animatedImage
    x: 0
    y: 0
    width: 1278
    height: 800
    source: "backgrounds/start4.gif"
}

MouseArea{
    id:clicketowel
    visible: true

    width: 1280
    height: 800
    onClicked: pageLoader_welcome.source="welcome.qml"

}
Connections
{
    target: $TCPClient
    onClosew:
    {
        start.hide()
    }
}

Connections{
    target: $TCPClient
    onShoww:{

        start.show()
        $TCPClient.logintr1();
    }
}

Loader
{
    id: pageLoader_welcome
    x: 0
    y: 0
    width: 1278
    height: 798
}





//更新，又一次尝试写进去socket，socket放在类login里面，
//报错不停地报错，凌晨两点整完成debug
    //可以运行但是同时显示了两个页面且功能未测试




}
