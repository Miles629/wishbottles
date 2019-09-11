import QtQuick 2.0

Item {
    id:login_failed
    visible: true
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
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
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

        Text {
            id: element1
            x: 108
            y: 114
            width: 258
            height: 22
            text: qsTr("用户名或密码错误，请重试！")
            anchors.verticalCenterOffset: -10
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: "微软雅黑"
            font.pixelSize: 17
        }



        MouseArea {
            id: mouseArea
            x: 150
            y: 183
            width: 100
            height: 38
            onClicked:
            {
                 pageloader_tologin1.source = "Login.qml"
                login_failed.visible=false

            }
        }

//        Loader{
//            id:pageloader_ToClient
//            width: 20
//            height: 30

//        }


        Loader{
            id:pageloader_tologin1
            width: 1280
            height: 800
        }

    }

}
