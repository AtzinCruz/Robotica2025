import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    title: "Up Robotics Control Interface"
    width: Qt.application.screens[0].width  // Obtiene el ancho de la pantalla
    height: Qt.application.screens[0].height // Obtiene la altura de la pantalla

    Image{
        id:Background
        anchors.fill: parent
        source: "../Images/Background.png"
    }
} 