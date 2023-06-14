import QtQuick 2.15
import QtQuick.Window
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15
import SerialPort 1.0
import SuperlumBS840 1.0

Window {
    id: windows
    visible: true
    width: 400
    height: 300

    SerialPort {
        id: serialPort
    }

    SuperlumBS840{
        id: superlumBS840
    }

    Loader { id: mainLoader }


    RowLayout
    {
        spacing: 0

        Rectangle
        {
            border.width: 1
            Layout.preferredWidth : windows.width/4
            Layout.preferredHeight : windows.height

            ColumnLayout
            {
                anchors.centerIn: parent
                spacing: 10

                Button
                {
                    text: "settings"
                    onClicked:
                    {
                        mainLoader.source = ""
                        mainLoader.source = "settings.qml"
                    }
                }
            }
        }

        Rectangle
        {
            border.width: 1
            Layout.preferredWidth : windows.width*3/4
            Layout.preferredHeight : windows.height

            ColumnLayout
            {
                spacing: 20
                anchors.centerIn: parent

                Text {
                    id: sweepControl
                    Layout.alignment: Qt.AlignHCenter
                    text: qsTr("SWEEP CONTROL")
                }

                RowLayout
                {
                    // 버튼 3개: single tone, single sweep, continuous sweep
                   Button {
                       id: singleToneButton
                       text: "Single Tone"
                       width: 150
                       height: 50
                       background: Rectangle {
                           radius: singleToneButton.checked ? 0 : 25
                           color: singleToneButton.checked ? "steelblue" : "lightgray"
                       }

                       onClicked: {
                           singleToneButton.checked = true
                           singleSweepButton.checked = false
                           continuousSweepButton.checked = false
                       }
                   }

                   Button {
                       id: singleSweepButton
                       text: "Single Sweep"
                       width: 150
                       height: 50
                       background: Rectangle {
                           radius: singleSweepButton.checked ? 0 : 25
                           color: singleSweepButton.checked ? "steelblue" : "lightgray"
                       }

                       onClicked: {
                           singleToneButton.checked = false
                           singleSweepButton.checked = true
                           continuousSweepButton.checked = false
                       }
                   }

                   Button {
                       id: continuousSweepButton
                       text: "Continuous Sweep"
                       width: 150
                       height: 50
                       background: Rectangle {
                           radius: continuousSweepButton.checked ? 0 : 25
                           color: continuousSweepButton.checked ? "steelblue" : "lightgray"
                       }

                       onClicked: {
                           singleToneButton.checked = false
                           singleSweepButton.checked = false
                           continuousSweepButton.checked = true
                       }
                   }
                }


            }
        }
    }
}
