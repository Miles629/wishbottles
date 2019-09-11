import QtQuick 2.0
import TCPClient 1.0

Item {
    id:register_failed
    width: 400
    height: 250
    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 400
        height: 250
        color: "#eae8e8"
        opacity: 1
    }

    Rectangle {
        id: rectangle1
        x: 152
        y: 183
        width: 96
        height: 38
        color: "#2c49aa"
        radius: 6
        anchors.horizontalCenter: parent.horizontalCenter
        opacity: 0.8

        Text {
            id: element
            x: 19
            y: 13
            width: 46
            height: 17
            color: "#ffffff"
            text: "确  定"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "微软雅黑"
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            font.bold: false
            //font.family: "Courier"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 17
        }
    }

    MouseArea {
        id: mouseArea
        x: 150
        y: 183
        width: 100
        height: 38
        onClicked:
        {
            register_failed.visible=false
           // pageLoader_ToLogin.source = "Register.qml"
        }
    }

    Connections{
        target: $TCPClient
        onShowlf: register_failed.visible=true
    }


    Text {
        id: element1
        x: 110
        y: 101
        width: 157
        height: 22
        text: qsTr("该用户名已存在，请重试！")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.verticalCenterOffset: -10
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "微软雅黑"
        font.pixelSize: 17
    }

}
