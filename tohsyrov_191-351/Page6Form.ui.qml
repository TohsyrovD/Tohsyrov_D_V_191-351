import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12 //для настройки стиля Material
import QtQuick.Dialogs 1.3


Page {// ЛР 6. Шифрование данных на стороне клиента.
    Connections {
            target: cryptoController // Указываем целевое соединение

            onSendToQml: {
                encrypted_textarea1.text += qsTr(decrypted_text)
            }
    }


    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 5
        anchors.topMargin: 10
        Text{
            text: "Введите ключ:"
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
                id: cipher_key
                Layout.fillWidth: true
                echoMode: TextInput.Password
                color: "#31b1da"
                maximumLength: 32
            }
            Button{
                onClicked: {
                    cipher_key.echoMode == TextInput.Password ? cipher_key.echoMode=TextInput.Normal : cipher_key.echoMode = TextInput.Password
                }
                icon.source: "img/eye.png"
                icon.color: "#31b1da"
            }
        }
        Text{
            text: "Имя файла:"
            Layout.fillWidth: true
            Layout.fillHeight: false
            Layout.alignment: Qt.AlignBottom
            color: "white"
            font.pixelSize: 16
        }
        TextField{
            id: filename
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignTop
            //text: fileDialog1.fileUrl
            font.pixelSize: 13
            color: "white"
        }

        Button{
            Layout.alignment: Qt.AlignHCenter
            text: "Выберите файл"
            onClicked: fileDialog1.visible=true
        }
        FileDialog{
            id: fileDialog1
            onFileUrlChanged: filename.text = fileUrl
        }

        RowLayout{
            Layout.alignment: Qt.AlignHCenter



            Button{
                text: "Зашифровать"
                onClicked: {
                    let encr_key
                    cipher_key.text.length == 32 ? encr_key=cipher_key.text : encr_key= String(cipher_key.text) + "0".repeat(32-cipher_key.text.length)
                    cryptoController.encryptFile(encr_key, filename.text)
                }
            }
            Button{
                text: "Расшифровать"
                onClicked: {
                    encrypted_textarea1.text = ""
                    let encr_key
                    cipher_key.text.length == 32 ? encr_key=cipher_key.text : encr_key= String(cipher_key.text) + "0".repeat(32-cipher_key.text.length)
                    cryptoController.decryptFile(encr_key, filename.text)

                }
            }


        }
        ScrollView{
            Layout.fillWidth: true
            Layout.fillHeight: true
            TextArea{
                id: encrypted_textarea1
                objectName: "encrypted_textarea"
                readOnly: true
                wrapMode: Text.WordWrap
            }

        }
    }





    GridView {
           id: grid
           visible: false
           anchors.fill: parent
           cellWidth: lab6.width/2;
           cellHeight: lab6.width/2

           delegate: Rectangle {
               ColumnLayout {
                   anchors.fill: parent
                   RowLayout {
                       Image {
                           id: imageGrid
                           source: photo
                           smooth: true
                       }

                       ColumnLayout {
                           Label {
                               text: name
                               font.pixelSize: 11
                               font.bold: true
                           }

                           Label {
                               text: screen_name
                               font.pixelSize: 11
                               font.bold: true
                               color: "#9f9f9f"

                           }
                           Label {
                               text: type
                               Layout.alignment: Qt.AlignLeft
                               font.pixelSize: 11
                               color: "#9f9f9f"
                           }

                           Label {
                               text:'id:'+ id
                               Layout.alignment: Qt.AlignLeft
                               font.pixelSize: 11
                               color: "#9f9f9f"
                           }
                           Label {
                               text:'Количество участников:'+ members_count
                               Layout.alignment: Qt.AlignLeft
                               font.pixelSize: 11
                               color: "#9f9f9f"
                           }
                       }

                   }
               }

           }
           model: GroupModel
       }

}

