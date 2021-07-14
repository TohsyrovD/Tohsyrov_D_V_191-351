import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12 //для настройки стиля Material
import QtMultimedia 5.15

ApplicationWindow {
    id: root
    width: 640
    height: 480
    visible: true

    signal doFetch()

    property var updateData: function(data) {
        console.log("updateData called")
    }

    signal dataReceived(string data)

    property string accessToken: ""

    property int men: 0
    property int women: 0

    function setUrl(url, params){
        for (let param in params) {
            url += param + "=" + params[param]+"&"
        }
        return url;
    }

//    Connections{
//     target: httpcontroller
//            function onToQML3(str2){
//                accessToken.text = str2;
//            }
//        }
    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        ColorAnimation {
            from: "white"
            to: "black"
            duration: 200
        }

        Page1Form {
        }

        Page2Form {
        }

        Page3Form {
        }

        Page4Form {
        }

        Page5Form {
        }

        Page6Form {
        }

        Page7Form {
        }

        Page8Form {
        }

        Lab1_dop {
        }

        Lab3_dop {
        }



    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Page 1")
        }
        TabButton {
            text: qsTr("Page 2")
        }
        TabButton {
            text: qsTr("Page 3")
        }
        TabButton {
            text: qsTr("Page 4")
        }
        TabButton {
            text: qsTr("Page 5")
        }

        TabButton {
            text: qsTr("Page 6")
        }
        TabButton {
            text: qsTr("Page 7")
        }
        TabButton {
            text: qsTr("Page 8+")
        }

        TabButton {
            text: qsTr("L1_dop")
        }

        TabButton {
            text: qsTr("L3_dop")
        }
    }
}
