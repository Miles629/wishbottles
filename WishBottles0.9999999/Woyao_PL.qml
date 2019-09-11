import QtQuick 2.0
import TCPClient 1.0
Item {
    width: 650
    height: 290
    Rectangle {
        id: recEdit
        x: 0
        y: 73
        width: 650
        height: 137
        color: "#ffffff"
        radius: 6

        TextEdit {
            id: textEdit
            x: 8
            y: 8
            width: 626
            height: 121
            font.pixelSize: 22
            font.family: "微软雅黑"
            wrapMode: TextEdit.WordWrap
        }
    }

    Row {
        //【【【表情添加区】】】
        id: biaoqing
        x: 17
        y: 8
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
                onClicked: textEdit.text=textEdit.text+ qsTr("😀")

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
                onClicked: textEdit.text=textEdit.text+ qsTr("😔")
            }
        }

        Text {
            id: shangxin
            width: 61
            height: 60
            text: qsTr("😟")
            font.pixelSize: 37

            MouseArea {
                id: ma_shangxin
                x: 0
                y: 0
                width: 53
                height: 59
                onClicked: textEdit.text=textEdit.text+ qsTr("😟")
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
                onClicked: textEdit.text=textEdit.text+ qsTr("😭")
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
                onClicked: textEdit.text=textEdit.text+ qsTr("😃")
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
                onClicked: textEdit.text=textEdit.text+ qsTr("😊")
            }
        }
    }

    Rectangle {
        id: recSend
        x: 451
        y: 231
        width: 175
        height: 35
        color: "#c85d44"
        radius: 6
        opacity: 0.8

        Text {
            id: element
            x: 51
            y: 6
            width: 74
            height: 23
            color: "#ffffff"
            text: qsTr("发   送")
            font.family: "微软雅黑"
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 19
        }
      MouseArea{
          id:ma_send
          width: 175
          height: 35
          onClicked:
            //这里把评论加到数据库里
          {
              $TCPClient.pinglun(textEdit.text)
          }
      }
    }

Connections
{
    target: $TCPClient
    onCleartxt:
    {
        textEdit.text="";
    }
}
Connections
{
    target: $TCPClient
    onAtxinhao:
    {
        textEdit.text="@"+$TCPClient.reatname();
        //$TCPClient.reatname()的返回值就是name
    }
}

}
