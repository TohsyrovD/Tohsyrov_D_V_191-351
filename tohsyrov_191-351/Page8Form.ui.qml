import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12 //для настройки стиля Material



Page { // ЛР 8. Авторизация JWT. Настройка SSL/TLS-соединения (HTTPS).

    //property string url: "https://127.0.0.1:5000"
    property string url: "http://dima44.pythonanywhere.com"
    property string token: ""

    function login(){
        let xhr = new XMLHttpRequest
        xhr.open('GET', url + "/login?login=" + username.text + "&password=" + password.text)
        xhr.responseType = 'json'
        console.log(url+"/login?login=" + username.text + "&password=" + password.text)
        xhr.onload = function(){
            let response = JSON.parse(xhr.responseText)

            if (response.token) {
                response_area.text = response.token
                token = response.token
            }
            else if(response.message) response_area.text = response.message
            else response_area.text = xhr.responseText

        }
        xhr.send()
    }

    function getinfo(){
        let xhr = new XMLHttpRequest
        xhr.open('GET', url + "/secret_page?token=" + token)
        xhr.responseType = 'json'
        xhr.onload = function(){
            let response = JSON.parse(xhr.responseText)  //распарсинг этого JSON'а, отображаем токен на экране
            if(response.current_time) {
                response_area.text = "Current time: " + response.current_time + "\n"
                response_area.text += "Message: " + response.message
                b64_img.source = "data:image/jpg;base64," + response.img
            }
            else if(response.message) response_area.text = response.message
            else response_area.text = xhr.responseText
        }
        xhr.send()

    }


    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 5
        anchors.topMargin: 10
        Text{
            text: "Имя"
            Layout.fillWidth: true
            Layout.fillHeight: false
            Layout.alignment: Qt.AlignBottom
            color: "white"
            font.pixelSize: 16
        }
        TextField{
            id: username
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignTop
            font.pixelSize: 13
            color: "#000000"
        }
        Text{
            text: "Пароль"
            Layout.fillWidth: true
            Layout.fillHeight: false
            Layout.alignment: Qt.AlignBottom
            Layout.topMargin: 0
            Layout.bottomMargin: 0
            color: "white"
            font.pixelSize: 16
        }
        RowLayout{
            Layout.fillWidth: true
            Layout.fillHeight: false
            Layout.alignment: Qt.AlignTop
            Layout.topMargin: 0
            TextField{
                id: password
                Layout.fillWidth: true
                echoMode: TextInput.Password
                color: "#000000"
                maximumLength: 32
            }
            Button{
                onClicked: {
                    password.echoMode == TextInput.Password ? password.echoMode=TextInput.Normal : password.echoMode = TextInput.Password
                }

                icon.color: "#000000"
            }
        }
        RowLayout{
            Layout.alignment: Qt.AlignHCenter
            Button{
                text: "login"
                onClicked: {
                    if(username.text && password.text)
                        login()
                }
            }
            Button{
                text: "get info"
                onClicked: {
                    getinfo()
                }
            }
        }
        TextArea{
            Layout.fillWidth: true
            id: response_area
            readOnly: true
            wrapMode: Text.WrapAnywhere
        }
        Item{
            Layout.fillWidth: true
            Layout.fillHeight: true
            Image {
                id: b64_img
                width: parent.width
                height: parent.height
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectFit
            }
        }

    }

}
