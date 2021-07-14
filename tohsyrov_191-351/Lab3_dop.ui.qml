import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12 //для настройки стиля Material
import QtCharts 2.3


Page { // ЛР доп 3. Графики.

    ColumnLayout{
        anchors.fill: parent
        ChartView {
            visible: true /*{
                if(women==0 && men==0) {
                    false
                } else true
            }*/
            Layout.fillWidth: true
            Layout.fillHeight: true
            legend.labelColor: "white"
            legend.font.pixelSize: 16
            legend.font.weight: "DemiBold"
            legend.visible: true
            backgroundColor: "transparent"
            antialiasing: true

            PieSeries {
                id: pieSeries
                PieSlice {
                    label: "муж"
                    value: men
                    color: "blue"
                }
                PieSlice {
                    label: "жен"
                    value: women
                    color: "red"
                }

            }
        }

        Label{
            Layout.alignment: Qt.AlignHCenter
            text: "Нет данных"
            visible: true /*{
                if(women==0 && men==0) {
                    true
                } else false
            }*/
            font.pixelSize: 20
        }
    }



}
