import QtQuick 2.0

Item {
    id:login_notconnect
    width: 400
    height: 250
    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 400
        height: 250
        color: "#eae8e8"
        opacity: 0.9
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
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: "微软雅黑"
            anchors.horizontalCenterOffset: 0
            font.bold: false
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 17
        }

        MouseArea {
            id: mouseArea
            x: 0
            y: 0
            width: 96
            height: 38
            onClicked: login_notconnect.visible=false;

        }
    }

    Connections{
        target: $TCPClient
        onShowln:login_notconnect.visible=true;
    }

    Text {
        id: element1
        x: 110
        y: 101
        width: 157
        height: 22
        text: qsTr("您尚未连接到服务器")
        anchors.verticalCenterOffset: -12
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        font.family: "微软雅黑"
        font.pixelSize: 17
    }
}
