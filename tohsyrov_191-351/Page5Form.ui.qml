import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtWebView 1.15
import QtGraphicalEffects 1.12

Page {//ЛР №5: Запросы по REST API.

    width: 600
    height: 400
    ListModel { //модель для ListView-список,  ListModel-данные
        id: listmodel1
    }


    // метод GET
    function sendRequest(url, method) {
        let xhr = new XMLHttpRequest
        xhr.open(method, url)
        xhr.responseType = 'json'
        xhr.send()
        xhr.onload = function() {
            let records = JSON.parse(xhr.responseText)
            for (let record of records.response.items) {
                //console.log(record.id)
                let friend_info = {}
                friend_info["id"] = record.id
                friend_info["first_name"] = record.first_name
                friend_info["last_name"] = record.last_name
                friend_info["online"] = record.online
                friend_info["photo"] = record.photo_100
                listmodel1.append(friend_info) //заполняем модель

                //для лабы по графикам:
                if(record.sex===1) women++
                if(record.sex===2) men++
            }
        }
    }


    ColumnLayout{
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.fill: parent


        ListView{
            id: listview1
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.topMargin: 5
            spacing: 10
            clip: true
            model: listmodel1 // откуда берутся данные
            delegate: Rectangle { // сам делегат ( прямоугольнки с данными)
                width: listview1.width
                color: "#222122"
                height: 80
                RowLayout{
                    anchors.fill: parent
                    Rectangle{
                        Layout.fillHeight: true
                        Layout.preferredWidth: 70
                        Layout.alignment: Qt.AlignLeft
                        Layout.leftMargin: 20
                        Layout.topMargin: 5
                        Layout.bottomMargin: 5
                        radius: 100
                        Image {
                            source: photo
                            width: parent.width
                            height: parent.height
                            fillMode: Image.PreserveAspectFit
                            layer.enabled: true
                            layer.effect: OpacityMask { //для округления картинки
                                maskSource: parent
                            }
                        }
                    }


                    Text {
                        Layout.fillWidth: true
                        Layout.leftMargin: 15
                        Layout.alignment: Qt.AlignLeft
                        horizontalAlignment: Text.AlignLeft
                        text: first_name + " " + last_name
                        font.pixelSize: 15
                        font.weight: "DemiBold"
                        color: '#31b1da'

                    }
                    Rectangle{
                        Layout.preferredWidth: 16
                        Layout.preferredHeight: 16
                        Layout.alignment: Qt.AlignRight
                        Layout.rightMargin: 5
                        radius: 8
                        color: online ? "#669903" : "#990303"
                    }
                }
            }
        }

        Button{
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignBottom
            text: "Get Data"
            onClicked: {
                accessToken ? {} : lab4_tab_btn.checked = true
                if(accessToken) {
                    let url = "https://api.vk.com/method/friends.get?"
                    let params = {
                        "access_token": accessToken,
                        "user_id": "186922144",
                        "fields": "photo_100,online,sex",
                        "v": "5.53"
                    }
                    url = setUrl(url, params)
                    console.log(url)
                    sendRequest(url, "GET") // отправляет гет запрос по заданному Url
                }
            }
        }
    }
}
