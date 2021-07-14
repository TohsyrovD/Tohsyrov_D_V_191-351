import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 600
    height: 400


    header: Label {
        id:label
        height: 50
        text: qsTr("Макдоналдс")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10


        Image {
            id: image
            x: 550
            y: -7
            width: 50
            height: 50
            source: "341-3414499_brand-logo-mcdonalds-logo-circle-clipart (1).png"
            fillMode: Image.PreserveAspectFit
            anchors.right:label.right
            anchors.top:label.top
            anchors.bottom:label.bottom

        }
    }






    Grid {
        id: grid
        anchors.fill: parent



        TextField {
            width: parent.width
            height: 40
            id: textField
            horizontalAlignment: Text.AlignHCenter
            transformOrigin: Item.Center
            placeholderText: qsTr("Вставьте текст")
            anchors.top: label.bottom
            color: "#808080"

        }


        CheckBox {
            id: checkBox
            x: 50
            y: 71
            text: qsTr("Check Box")
            anchors.top: textField.bottom
            anchors.left:grid.left
            anchors.topMargin:20
            anchors.leftMargin:100
            anchors.right:tumbler.left
            anchors.bottom: progressBar.top
        }

        ProgressBar {
            id: progressBar
            x: 191
            y: 165
            value: 0.5
            anchors.top: checkBox.bottom
            anchors.left:grid.left
            anchors.topMargin:15
            anchors.rightMargin:50
            anchors.leftMargin:100
            anchors.right:tumbler.left
            anchors.bottom:rangeSlider.top
        }

        RangeSlider {
            id: rangeSlider
            x: 191
            y: 206
            second.value: 0.75
            first.value: 0.25
            anchors.left:grid.left
            anchors.rightMargin:50
            anchors.leftMargin:100
            anchors.right:tumbler.left

        }



        TextArea {
            id: textArea
            x: 600
            y: 122
            width: 200
            placeholderText: qsTr("Text Area")
            anchors.topMargin: 15
            anchors.top: rangeSlider.bottom
//            anchors.bottom: grid.bottom
            anchors.left: grid.left
            anchors.leftMargin:100
            anchors.right:tumbler.left


        }

        Tumbler {
            id: tumbler
            x: 50
            y: 130
            model: 10
            anchors.top: textField.bottom
            anchors.right: grid.right
            anchors.topMargin:15
            anchors.rightMargin:100
        }


    }


}
