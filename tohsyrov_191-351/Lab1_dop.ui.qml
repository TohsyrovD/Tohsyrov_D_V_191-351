import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12 //для настройки стиля Material
import QtGraphicalEffects 1.12
import QtQuick.Dialogs 1.3


Page {//ЛР доп. 1. Графические эффекты.


    RowLayout{ //
        id: switch_effect_buttons
        anchors.topMargin: 2
        anchors.horizontalCenter: parent.horizontalCenter
        RadioButton{
            id: zoomblur_btn
            text: "ZoomBlur"
            checked: true
            font.pixelSize: 12
        }
        RadioButton{
            id: innershadow_btn
            text: "InnerShadow"
            font.pixelSize: 12
        }
        RadioButton{
            id: huesaturation_btn
            text: "HueSaturation"
            font.pixelSize: 12
        }
    }

    ColumnLayout{
        anchors.top: switch_effect_buttons.bottom
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.topMargin: zoomblur_btn.checked ? 24 : 0
        Item{
            Layout.fillWidth: true
            Layout.fillHeight: true

            Image{
                id: sample1
                source: "images/image1.jpg"
                fillMode: Image.PreserveAspectFit
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                height: parent.height
            }
            ZoomBlur{
                visible: zoomblur_btn.checked
                id: zoomblur
                anchors.fill: sample1
                source: sample1
                samples: zoomblur_samples.value
                length: zoomblur_length.value
                horizontalOffset: zoomblur_horoffset.value
                verticalOffset: zoomblur_veroffset.value
                transparentBorder: transparentBorder_switch.checked
            }
            InnerShadow {
                visible: innershadow_btn.checked
                anchors.fill: sample1
                radius: innershadow_radius.value
                samples: innershadow_samples.value
                horizontalOffset: innershadow_veroffset.value
                verticalOffset: innershadow_horoffset.value
                fast: innershadow_fast.checked
                spread: innershadow_spread.value
                color: "#ff0000"
                source: sample1
            }
            HueSaturation {
                visible: huesaturation_btn.checked
                anchors.fill: sample1
                source: sample1
                hue: huesaturation_hue.value
                saturation: huesaturation_saturation.value
                lightness: huesaturation_lightness.value
            }
        }

        ColumnLayout{
            id: zoomblur_properties
            visible: zoomblur_btn.checked
            Layout.fillWidth: true
            Layout.margins: 10

            RowLayout{
                Text{
                    text: "Length"
                    color: "white"
                    font.pixelSize: 14
                }
                Slider {
                    id: zoomblur_length
                    Layout.fillWidth: true
                    from: 0
                    value: 0
                    to: 48
                    stepSize: 1
                }
                Text{
                    text: zoomblur_length.value
                    color: "white"
                    font.pixelSize: 14
                }
                Text{
                    text: "Samples"
                    color: "white"
                    font.pixelSize: 14
                }
                Slider {
                    id: zoomblur_samples
                    Layout.fillWidth: true
                    from: 0
                    value: 24
                    to: 24
                    stepSize: 1
                }
                Text{
                    text: zoomblur_samples.value
                    color: "white"
                    font.pixelSize: 14
                }
            }

            RowLayout{
                Text{
                    text: "Horizontal offset"
                    color: "white"
                    font.pixelSize: 14
                }
                Slider {
                    id: zoomblur_horoffset
                    Layout.fillWidth: true
                    from: -100
                    value: 0
                    to: 100
                    stepSize: 1
                }
                Text{
                    text: zoomblur_horoffset.value
                    color: "white"
                    font.pixelSize: 14
                }
            }
            RowLayout{
                Text{
                    text: "Vertical offset"
                    color: "white"
                    font.pixelSize: 14
                }
                Slider {
                    id: zoomblur_veroffset
                    Layout.fillWidth: true
                    from: -100
                    value: 0
                    to: 100
                    stepSize: 1
                }
                Text{
                    text: zoomblur_veroffset.value
                    color: "white"
                    font.pixelSize: 14
                }
            }
            RowLayout{
                Layout.alignment: Qt.AlignHCenter
                Text{
                    text: "transparentBorder"
                    color: "white"
                    font.pixelSize: 14
                }

                Switch{
                    id: transparentBorder_switch
                }
            }
        }

        ColumnLayout{
            id: innershadow_properties
            visible: innershadow_btn.checked
            Layout.fillWidth: true
            Layout.margins: 10

            RowLayout{
                Text{
                    text: "Radius"
                    color: "white"
                    font.pixelSize: 14
                }
                Slider {
                    id: innershadow_radius
                    Layout.fillWidth: true
                    from: 0
                    value: 0
                    to: 12
                }
                Text{
                    text: innershadow_radius.value.toFixed(2)
                    color: "white"
                    font.pixelSize: 14
                }
                Text{
                    text: "Spread"
                    color: "white"
                    font.pixelSize: 14
                }
                Slider {
                    id: innershadow_spread
                    Layout.fillWidth: true
                    from: 0
                    value: 0.5
                    to: 1
                }
                Text{
                    text: innershadow_spread.value.toFixed(2)
                    color: "white"
                    font.pixelSize: 14
                }
            }

            RowLayout{
                Text{
                    text: "Horizontal offset"
                    color: "white"
                    font.pixelSize: 14
                }
                Slider {
                    id: innershadow_horoffset
                    Layout.fillWidth: true
                    from: -100
                    value: 0
                    to: 100
                    stepSize: 1
                }
                Text{
                    text: innershadow_horoffset.value
                    color: "white"
                    font.pixelSize: 14
                }
            }
            RowLayout{
                Text{
                    text: "Vertical offset"
                    color: "white"
                    font.pixelSize: 14
                }
                Slider {
                    id: innershadow_veroffset
                    Layout.fillWidth: true
                    from: -100
                    value: 0
                    to: 100
                    stepSize: 1
                }
                Text{
                    text: innershadow_veroffset.value
                    color: "white"
                    font.pixelSize: 14
                }
            }
            RowLayout{
                Text{
                    text: "Samples"
                    color: "white"
                    font.pixelSize: 14
                }
                Slider {
                    id: innershadow_samples
                    Layout.fillWidth: true
                    from: 0
                    value: 0
                    to: 32
                    stepSize: 1
                }
                Text{
                    text: innershadow_samples.value//.toFixed(2)
                    color: "white"
                    font.pixelSize: 14
                }
                Text{
                    text: "Fast"
                    color: "white"
                    font.pixelSize: 14
                }
                Switch{
                    id: innershadow_fast
                }
            }

        }
        ColumnLayout{
            id: huesaturation_properties
            visible: huesaturation_btn.checked
            Layout.fillWidth: true
            Layout.margins: 10

            RowLayout{
                Text{
                    text: "Hue"
                    color: "white"
                    font.pixelSize: 14
                }
                Slider {
                    id: huesaturation_hue
                    Layout.fillWidth: true
                    from: -1.0
                    value: 0.0
                    to: 1.0
                }
                Text{
                    text: huesaturation_hue.value.toFixed(2)
                    color: "white"
                    font.pixelSize: 14
                }
            }

            RowLayout{
                Text{
                    text: "Lightness"
                    color: "white"
                    font.pixelSize: 14
                }
                Slider {
                    id: huesaturation_lightness
                    Layout.fillWidth: true
                    from: -1.0
                    value: 0.0
                    to: 1.0
                }
                Text{
                    text: huesaturation_lightness.value.toFixed(2)
                    color: "white"
                    font.pixelSize: 14
                }
            }
            RowLayout{
                Text{
                    text: "Saturation"
                    color: "white"
                    font.pixelSize: 14
                }
                Slider {
                    id: huesaturation_saturation
                    Layout.fillWidth: true
                    from: -1.0
                    value: 0.0
                    to: 1.0
                }
                Text{
                    text: huesaturation_saturation.value.toFixed(2)
                    color: "white"
                    font.pixelSize: 14
                }
            }

        }
    }

}
