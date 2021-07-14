import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtWebView 1.15


Page {//ЛР №4: Аутентификация OAuth2.
    width: 600
    height: 400

    ColumnLayout{
        anchors.bottom: parent.bottom
        anchors.fill: parent

        Rectangle {
            id: rect_web
            Layout.fillWidth: true
            Layout.fillHeight: true
            visible: false

            WebView {
                id: webview1
                anchors.fill: parent
                onLoadingChanged: {
                    console.log(webview1.url)
                    let url = String(webview1.url)
                    if(url.includes("access_token")) {
                        console.log()
                        let start = url.indexOf("access_token")+"access_token".length+1
                        let end = url.indexOf("&", start)
                        let token = url.slice(start, end)
                        access_token.text = token
                        accessToken = token
                        rect_web.visible = false
                    }
                }
            }
        }
        Button{
            id: auth_button
            Layout.alignment: Qt.AlignHCenter
            text: rect_web.visible==true? "Назад": "Авторизация в VK";
            icon.source: rect_web.visible==false? "img/icons/Social-media_VK.png" : ""
//            icon.color: "#31b1da"
            onClicked: {
                let params = {
                    client_id: "7828854",
                    redirect_uri: "https://oauth.vk.com/blank.html",
                    scope: "friends",
                    response_type: "token"
                }
                let url = "https://oauth.vk.com/authorize?"
                rect_web.visible==true ? {} : webview1.url = setUrl(url, params);
                rect_web.visible = rect_web.visible==true ? false: true;
            }
        }

        Text{
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignBottom
            horizontalAlignment: TextInput.AlignHCenter
            text: "Access token: "
            color: "white"
            font.pixelSize: 16
//            font.weight: "DemiBold"
        }
        TextField{
            id: access_token
            Layout.margins: 3
            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
            horizontalAlignment: TextInput.AlignHCenter
//            color: "#31b1da"
//            font.weight: "DemiBold"
            font.pixelSize: 14
//            readOnly: true
            wrapMode: TextEdit.WrapAnywhere
            property string accesstoken: access_token.text
        }
    }
}

