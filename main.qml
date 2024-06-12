import QtQuick 2.14
import QtQuick.Controls 1.4
import QtQuick.Window 2.14

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: "Change Background"

    property bool capsLockEnabled: executeCapsLock
    property bool numLockEnabled: executeNumLock
    property string capssLockEnabled: "есть"
    property string numsLockEnabled: "есть"
    property string kkk: "возможно"
    property string ggg: " "

    function toggleIndicator(key) {
        switch (key) {
        case Qt.Key_CapsLock:
            //capsLockEnabled = executeCapsLock;
            if (capsLockEnabled == false)
            {
                capsLockEnabled = true
                capssLockEnabled = "включен"
            }
            else{
                capsLockEnabled = false
                capssLockEnabled = "отключен"
            }
            break;

        case Qt.Key_NumLock:
            //numLockEnabled = executeNumLock;
            if (numLockEnabled == false)
            {
                numLockEnabled = true
                numsLockEnabled = "включен"
            }
            else if(numLockEnabled == true){
                numLockEnabled = false
                numsLockEnabled = "отключен"
            }
            break;
        }
    }

    function disableAllIndicators() {
        kkk = "успешно"
        myobj.driver3Call();
    }

    TabView {
        anchors.fill: parent

        Tab {
            title: "Фон"
            Rectangle {
                color: "transparent"
                anchors.fill: parent
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        parent.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
                        mouse.accepted = false;
                    }
                }
                Column{
                    anchors.centerIn: parent
                    Text {
                        color: "chocolate"
                        text: "Нажми на меня!!! А когда надоест нажми Tab и стрелочку вверх."
                        font.pixelSize: 16
                    }
                    Text {
                        color: "chocolate"
                        text: "CapsLock: " + capssLockEnabled
                        font.pixelSize: 16
                    }
                    Text {
                        color: "chocolate"
                        text: "NumLock: " + numsLockEnabled
                        font.pixelSize: 16
                    }
                    Text {
                        color: "chocolate"
                        text: "Отключение всех индикаторов...: " + kkk
                        font.pixelSize: 16
                    }
                    Text {
                        color: "chocolate"
                        text: ggg
                        font.pixelSize: 16
                    }
                }
            }
        }
        Keys.onPressed: {
            if (event.key === Qt.Key_1) {
                disableAllIndicators();
            } else if (event.key === Qt.Key_Up) {
                ggg = "Нажмите клавишу включения любого индикатора клавиатуры"
            } else if (event.key === Qt.Key_CapsLock || event.key === Qt.Key_NumLock) {
                toggleIndicator(event.key);
            }
        }

        Tab {
            title: "Размер окна"
            Rectangle {
                color: "transparent"
                anchors.fill: parent
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        parent.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
                        mouse.accepted = false; // Предотвращаем переключение вкладок при клике
                    }
                }
                Column {
                    anchors.centerIn: parent
                    spacing: 10
                    Text {
                        text: "Width: " + ApplicationWindow.width
                        font.pixelSize: 16
                    }
                    Text {
                        text: "Height: " + ApplicationWindow.height
                        font.pixelSize: 16
                    }
                }
                Text {
                    anchors.centerIn: parent
                    color: "chocolate"
                    text: "Нажми на меня!!!"
                }
            }
        }

        Tab
        {
            title: "dmesg"
            id: page5
            visible: true
            Rectangle {
                anchors.fill: parent
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        parent.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
                        mouse.accepted = false; // Предотвращаем переключение вкладок при клике
                    }
                }
                width: 100; height: 100
                ScrollView{
                    anchors.fill: parent
                    Text {
                        color: "black"
                        text: page5Text
                    }
                }
            }
        }

        Tab
        {
            title: "/proc/devices"
            id: page1
            visible: true
            Rectangle {
                anchors.fill: parent
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        parent.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
                        mouse.accepted = false; // Предотвращаем переключение вкладок при клике
                    }
                }
                width: 100; height: 100
                ScrollView{
                    anchors.fill: parent
                    Text {
                        color: "black"
                        text: page1Text
                    }
                }
            }
        }

        Tab
        {
            title: "/proc/cpuinfo"
            id: page2
            visible: false
            Rectangle {
                anchors.fill: parent

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        parent.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
                        mouse.accepted = false; // Предотвращаем переключение вкладок при клике
                    }
                }
                width: 100; height: 100
                visible: true
                ScrollView{
                    anchors.fill: parent
                    Text {
                        color: "black"
                        text: page2Text
                    }
                }
            }
        }

        Tab
        {
            title: "/proc/meminfo"
            id: page3
            visible: false
            Rectangle {
                anchors.fill: parent
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        parent.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
                        mouse.accepted = false; // Предотвращаем переключение вкладок при клике
                    }
                }
                width: 100; height: 100
                visible: true
                ScrollView{
                    anchors.fill: parent
                    Text {
                        color: "black"
                        text: page3Text
                        wrapMode: Text.WordWrap
                    }
                }
            }
        }

        Tab
        {
            title: "Алгоритм"
            id: page6
            visible: true
            Rectangle {
                anchors.fill: parent
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        parent.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
                        mouse.accepted = false; // Предотвращаем переключение вкладок при клике
                    }
                }
                width: 100; height: 100
                ScrollView{
                    anchors.fill: parent
                    Text {
                        color: "black"
                        text: page6Text
                    }
                }
            }
        }
    }
}
