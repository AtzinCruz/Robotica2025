import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

ApplicationWindow { // Initialize main window
    id: armWindow
    visible: true
    width: 1920
    height: 1080
    title : "Up Robotics Interface"

    FocusScope{
        id: root
        anchors.fill: parent
        focus : true

        Rectangle{ //Background
            width: parent.width
            height: parent.height
        
            Image{ //Background Image
                anchors.fill: parent
                source: "../Background.png"
                fillMode: Image.PreserveAspectcrop

                }
        }


        Rectangle {  // Header
            id: header
            x: 0
            y: 0
            width: 1920
            height: 80
            color: "#2b2929"
        }

        
        Button { //Motor Id Button
            id: change_motor_id
            x: 1000
            y: 15
            text: qsTr("")
            flat: false
            background: Rectangle{
                color: "transparent"
                width: 40
                height: 40
                radius: 20
                }
            
                contentItem: Image{
                    source: "../ID.png"
                
                }

                onClicked:{
                    motors_menu.visible = !motors_menu.visible
                }
        }

        Rectangle { //Motor Id Entry Background
            id : motor_id_background
            width: 40
            height: 25
            x:1060
            y:29
            color: "#000000"
            radius:5
        }
         
        TextInput{ // Text input that changes the motor id
            id: motor_id
            width: 40
            x: 1064
            y : 32
            color : "#ffffff"
            font.styleName: "Thin"
            text: String("000")
        }
    
    
        Rectangle{//Motors menu
            id: motors_menu
            width: 200
            height: 220
            x:780
            y:60
            color:"#b7aeae"
            opacity:0.6
            visible: false 
            radius: 15

            Button{ //RIght band button
                id: right_band
                x: 10
                y: 10
                text: qsTr("")
                flat: false
                background: Rectangle{
                    color: "transparent"
                    width: 160
                    height: 40
                    radius: 20
                }

                contentItem: Image{
                    source: "../motor_banda_derecha.png"
                    
                }

                onClicked:{
                    pyInterface.rightBand(motor_id.text)
                    warnings.color ="#fb7118"
                    notification_content.text = ("Right Band Motor ID Updated with value "+ motor_id.text+"\n")
                    warnings_text.text += ("Right Band Motor ID Updated with value "+ motor_id.text+"\n")
                    warnings.visible = !warnings.visible
                    motors_menu.visible= !motors_menu.visible
                    rightBand_info_data.text= motor_id.text
                    resetNotification.start()
                }
            }
        
            Button{//Left band button
                id: left_band
                x: 10
                y: 60
                text: qsTr("")
                flat: false
                background: Rectangle{
                    color: "transparent"
                    width: 160
                    height: 40
                    radius: 20
                }

                    contentItem: Image{
                        source: "../motor_banda_izquierda.png"
                        
                    }

                    onClicked:{
                        pyInterface.leftBand(motor_id.text)
                        warnings.color ="#fb7118"
                        notification_content.text = ("Left Band Motor ID Updated with value " + motor_id.text)
                        warnings_text.text += ("Left Band Motor ID Updated with value " + motor_id.text + "\n")
                        warnings.visible = !warnings.visible
                        motors_menu.visible= !motors_menu.visible
                        leftBand_info_data.text = motor_id.text
                        resetNotification.start()
                    }
            }

            Button{// Front Flipper Button
                id: front_Flipper
                x: 10
                y: 110
                text: qsTr("")
                flat: false
                background: Rectangle{
                    color: "transparent"
                    width: 160
                    height: 40
                    radius: 20
                }

                contentItem: Image{
                    source: "../motor_fllipper_delantero.png"
                    
                }

                onClicked:{
                    pyInterface.frontFlipper(motor_id.text)
                    warnings.color ="#fb7118"
                    notification_content.text = ("Front Flipper Motor ID Updated with value "+ motor_id.text)
                    warnings_text.text += ("Front Flipper Motor ID Updated with value "+ motor_id.text+"\n")
                    warnings.visible = !warnings.visible
                    motors_menu.visible= !motors_menu.visible
                    frontFlipper_info_data.text = motor_id.text
                    resetNotification.start()

                }
            }

            Button{ //Back Flipper Button
                id: back_flipper
                x: 10
                y: 160
                text: qsTr("")
                flat: false
                background: Rectangle{
                    color: "transparent"
                    width: 160
                    height: 40
                    radius: 20
                }

                contentItem: Image{
                    source: "../motor_flipper_trasero.png"
                    
                }

                onClicked:{
                    pyInterface.backFlipper(motor_id.text)
                    warnings.color ="#fb7118"
                    notification_content.text = ("Back Flipper Motor ID Updated with value "+ motor_id.text)
                    warnings_text.text += ("Back Flipper Motor ID Updated with value "+ motor_id.text+"\n")
                    warnings.visible = !warnings.visible
                    motors_menu.visible= !motors_menu.visible
                    backFlipper_info_data.text = motor_id.text
                    resetNotification.start()

                }
            }
        }
    
        Button { // Mode button
            id: change_mode
            x: 10
            y: 15
            text: qsTr("")
            flat: false
            background: Rectangle{
                color: "transparent"
                width: 40
                height: 40
                radius: 20
            }
            
                contentItem: Image{
                    source: "../mode.png"
                    
                }

                onClicked:{
                    mode_menu.visible = !mode_menu.visible
                    
                    }
        }


        Rectangle{ //Mode Menu
            id: mode_menu
            width: 230
            height: 80
            x:150
            y:15
            color:"#000000"
            opacity:0.6
            visible: false 
            radius: 15

            Button{//Arm mode button
                id: arm_mode_button
                x: 10
                y: 10
                text: qsTr("")
                flat: false
                background: Rectangle{
                    color: "transparent"
                    width: 160
                    height: 60
                    radius: 20
                }

                contentItem: Image{
                    source: "../arm_button.png"
                    
                }
                onClicked:{
                    
                }
            }
        
            Button{//Movement mode button
                id: movement_mode_button
                x: 80
                y: 10
                text: qsTr("")
                flat: false
                background: Rectangle{
                    color: "transparent"
                    width: 160
                    height: 60
                    radius: 20
                }

                    contentItem: Image{
                        source: "../movement_button.png"
                        
                    }

                    onClicked:{
                        mainLoader.source = "Movement.qml"
                    }
            }

            Button{//Home mode button
                id: home_button
                x: 150
                y: 10
                text: qsTr("")
                flat: false
                background: Rectangle{
                    color: "transparent"
                    width: 160
                    height: 60
                    radius: 20
                }

                    contentItem: Image{
                        source: "../home_button.png"
                    }

                    onClicked:{
                        mainWindow.targetPage = "Home.qml"
                    }
            }
        }

        Rectangle { //Arm Control Box
            id: armcontrol
            x: 10
            y: 100
            width: 300
            height: 340
            opacity: 0.5
            color: "#1d1d1b"
            radius: 49
        

        
            Slider { // First SLider that control x position
                id: control_x
                x: 25
                y: 96
                width: 250
                height: 30
                from: 0
                to: 150
                value: 75

                onValueChanged:{
                    set_value_x.text = String(Math.round(value))
                    value = (Math.round(value))
                    }
            }

            TextInput{ // Text input that changes the first slider value
                id: set_value_x
                width: 50
                x: 25
                y : 130
                color : "#ffffff"
                text: String(control_x.value)

                    onTextChanged: {
                        var newValue = parseFloat(text);
                        if (!isNaN(newValue) && newValue >= control_x.from && newValue <= control_x.to) {
                            control_x.value = newValue;  // Sincronizar el Slider con el valor del TextInput
                        }
                    }
            }

            Slider { // Second slider that control y position
                id: control_y
                x: 25
                y: 168
                width: 250
                height: 30
                from: 0
                to: 150
                value: 75

                    onValueChanged:{
                        set_value_y.text = String(Math.round(value))
                        value = (Math.round(value))
                        }
            }

            TextInput{ // Text input that changes the second slider value
                id: set_value_y
                width: 50
                x: 25
                y : 202
                color : "#ffffff"
                text: String(control_y.value)

                    onTextChanged: {
                        var newValue = parseFloat(text);
                        if (!isNaN(newValue) && newValue >= control_y.from && newValue <= control_y.to) {
                            control_y.value = newValue;  // Sincronizar el Slider con el valor del TextInput
                        }
                    }
            }
        
            Slider { // Third slider that control z position
                id: control_z
                x: 25
                y: 240
                width: 250
                height: 30
                from: 0
                to: 150
                value: 75

                    onValueChanged:{
                        set_value_z.text = String(Math.round(value))
                        value = (Math.round(value))
                        }
            }

            TextInput{ // Text input that changes the third slider value
                id: set_value_z
                width: 50
                x: 25
                y : 274
                color : "#ffffff"
                text: String(control_z.value)

                    onTextChanged: {
                        var newValue = parseFloat(text);
                        if (!isNaN(newValue) && newValue >= control_z.from && newValue <= control_z.to) {
                            control_z.value = newValue; 
                        }
                    }
            }
        
            Button { // Button that extracts every slider value and conects it to python
                id: arm_changes
                x: 80
                y: 288
                text: qsTr("Apply Changes")
                flat: false
                background: Rectangle{
                    color: "#857663"
                    radius: 10
                }
                
                    contentItem: Text{  
                        text: parent.text
                        color: "white"
                        font.pixelSize: 20
                        font.styleName: "Thin"
                    }

                    onClicked:{
                        pyInterface.getSlidersValues(control_x.value, control_y.value, control_z.value)
                        warnings_text.text = "Robot Arm Position Updated \n"
                    }
            }

        
            Button { // Button that reset the sliders value
                id: arm_reset
                x: 230
                y: 288
                text: qsTr("R")
                flat: false
                background: Rectangle{
                    color: "#857663"
                    radius: 10
                }
            
                    contentItem: Text{
                        text: parent.text
                        color: "white"
                        font.pixelSize: 20
                        font.styleName: "Thin"
                    }

                    onClicked:{
                        control_x.value = 75
                        control_y.value = 75
                        control_z.value = 75
                        pyInterface.getSlidersValues(control_x.value, control_y.value, control_z.value)
                        warnings_text.text = "Robot Arm Position Reseted \n"
                    } 
            }

            Text { // arm control box title
                id: arm_controtitle
                x: 63
                y: 30
                color: "#ffffff"
                text: qsTr("Arm Position")
                font.pixelSize: 28
                font.styleName: "Bold"
                font.bold: true
            }
        }
     

        Rectangle {// Voltage bar 1
            id : voltage_bar1
            x: 1050
            y: 100
            color:"#edd01f"
            width: 35
            height:150
            radius: 10
        }

        Rectangle{ // Voltage bar 2
            id : voltage_bar2
            x: 1050
            y: 100
            color:"#000000"
            width: 35
            height:50
            opacity: 0.5
            radius:10
        }

        Rectangle{ //Amperage bar 1
            id : amperage_bar1
            x: 1100
            y: 100
            color:"#057fff"
            width: 35
            height:150
            radius:10
        }

        Rectangle{ // Amperage bar 2
            id : amperage_bar2
            x: 1100
            y: 100
            color:"#000000"
            width: 35
            height:50
            opacity: 0.5
            radius: 10
        }

        Button { // Voltage button
            id: voltage
            x: 1040
            y: 260
            text: qsTr("")
            flat: false
            background: Rectangle{
                color: "transparent"
                width: 40
                height: 40
                radius: 20
            }
            
                contentItem: Image{
                    source: "../Voltage.png"
                }
        }

        Button { //Amperage button
            id: amperage
            x: 1090
            y: 260
            text: qsTr("")
            flat: false
            background: Rectangle{
                color: "transparent"
                width: 40
                height: 40
                radius: 20
            }
            
                contentItem: Image{
                    source: "../Amperage.png"
                }
        } 

        Rectangle {//motors id info
            id:info_motors
            width: 240
            height: 70
            x:1110
            y:5
            color: "#1d1d1b"
            radius: 20
            

    
                Grid {
                    anchors.fill: parent
                    anchors.margins: 5 // Margen interno
                    rows: 2
                    columns: 4
                    spacing: 10 // Espacio entre los elementos

                    Text {

                        id: rightBand_info
                        text: "Right Band"
                        font.pixelSize: 14 
                        color: "#ffffff" 
                        font.bold: true 
                    }

                    Text {

                        id:rightBand_info_data
                        text: "67"
                        font.pixelSize: 14 
                        color: "#ffffff" 
                        font.bold: true 
                    }

                    Text {

                        id: leftBand_info
                        text: "Left Band"
                        font.pixelSize: 14 
                        color: "#ffffff" 
                        font.bold: true 
                    }

                    Text {

                        id:leftBand_info_data
                        text: "88"
                        font.pixelSize: 14 
                        color: "#ffffff"
                        font.bold: true 
                    }

                    Text {

                        id: frontFlipper_info
                        text: "Front Flipper"
                        font.pixelSize: 14 
                        color: "#ffffff"
                        font.bold: true 
                    }

                    Text {

                        id: frontFlipper_info_data
                        text: "67"
                        font.pixelSize: 14 
                        color: "#ffffff" 
                        font.bold: true 
                    }

                    Text {

                        id: backFlipper_info
                        text: "Back Flipper"
                        font.pixelSize: 14 
                        color: "#ffffff" 
                        font.bold: true
                    }

                    Text {

                        id: backFlipper_info_data
                        text: "67"
                        font.pixelSize: 14 
                        color: "#ffffff" 
                        font.bold: true 
                    }
                }
            }

        Rectangle { // Genral info
            id:info
            width: 200
            height: 200
            x:1150
            y:100
            color: "#1d1d1b"
            radius: 20
            

        
                Grid {
                    anchors.fill: parent
                    anchors.margins: 5 
                    rows: 5
                    columns: 2
                    spacing: 10 

                        Text {

                            id:latency
                            text: "Latency"
                            font.pixelSize: 14 
                            color: "#ffffff" 
                            font.bold: true 
                        }

                        Text {

                            id:latency_data
                            text: "4 mss"
                            font.pixelSize: 14 
                            color: "#ffffff" 
                            font.bold: true 
                        }

                        Text {

                            id: battery
                            text: "Battery"
                            font.pixelSize: 14 
                            color: "#ffffff" 
                            font.bold: true 
                        }

                        Text {

                            id:battery_data
                            text: "76%"
                            font.pixelSize: 14 
                            color: "#ffffff" 
                            font.bold: true 
                        }

                        Text {

                            id: speed
                            text: "Speed"
                            font.pixelSize: 14 
                            color: "#ffffff" 
                            font.bold: true 
                        }

                        Text {

                            id:speed_data
                            text: "15 km/h"
                            font.pixelSize: 14 
                            color: "#ffffff" 
                            font.bold: true 
                        }

                        Text {

                            id: orientation
                            text: "Orientation"
                            font.pixelSize: 14 
                            color: "#ffffff" 
                            font.bold: true 
                        }

                        Text {

                            id:orientation_data
                            text: "Ne"
                            font.pixelSize: 14 
                            color: "#ffffff" 
                            font.bold: true 
                        }

                        Text {

                            id: lidar
                            text: "Lidar"
                            font.pixelSize: 14 
                            color: "#ffffff" 
                            font.bold: true 
                        }

                        Text {

                            id:lidar_data
                            text: "Working"
                            font.pixelSize: 14 
                            color: "#ffffff" 
                            font.bold: true 
                        }
                    }
        }


        Rectangle{ //obeject detection Info Box
            id: lidar_box
            x:10
            y:460
            width:300
            height: 120
            color: "#000000"
            radius: 20
            border.width: 2
            border.color:"#00ff03"

            Text{
                id:object_box_title
                x:10
                y:5
                text:"Object Detection"
                font.pixelSize: 20
                color:"#00ff03"
                font.bold: true
                
            }

            Text{
                id: object_box_text
                x:10
                y:30
                text:"Object Detected"
                font.pixelSize: 15
                color:"#00ff03"
                font.bold: false
                
            }

            Text{
                id: object_box_distance1
                x:10
                y:50
                text:"Distance:"
                font.pixelSize: 15
                color:"#00ff03"
                font.bold: false
                
            }

            Text{
                id: object_box_distance2
                x:74
                y:50
                text:"5m"
                font.pixelSize: 15
                color:"#00ff03"
                font.bold: false
                
            }
            Text{
                id: object_box_size1
                x:10
                y:70
                text:"Size:"
                font.pixelSize: 15
                color:"#00ff03"
                font.bold: false
                
            }

            Text{
                id: object_box_size2
                x:40
                y:70
                text:"Medium"
                font.pixelSize: 15
                color:"#00ff03"
                font.bold: false
                
            }

            Image{
                id:object_detected
                x:180
                y:10
                source: "../object.png"
               
            }

        }

    Text{//timer
        id:mision_timer
        x: 220
        y: 600
        text: "30"
        font.pixelSize: 30
        color: "#ffffff"
        font.bold:true

    }

    Button{
        text: "iniciar"
        x:200
        y:640
        background: Rectangle{
                color: "transparent"
                width: 40
                height: 40
                radius: 20
            }
            
            contentItem: Image{
                id: buttonplay
                source: "..//play.png"
                
            }

        
        onClicked:{
            mision_timer.text = timer_entry.text
            countdownTimer.remainingTime = timer_entry.text
            countdownTimer.start()
        }
    }

    Timer{
        id: countdownTimer
        interval:1000
        repeat: true
        running: false
        property int remainingTime: 30

        onTriggered:{
            if(remainingTime>0){
                remainingTime -=1
                mision_timer.text = countdownTimer.remainingTime
            }
        }
    }

     Rectangle{
        id : timer_entry_background
        width: 40
        height: 25
        x:255
        y:650
        color: "#1d1d1b"
        radius:5

     }    
    TextInput{ // Text input that changes the motor id
            id: timer_entry
            width: 40
            x: 255
            y : 650
            color : "#ffffff"
            text: String("0")
    }




    
     Button { //Front  button
            id: front
            x: 45
            y: 600
            text: qsTr("")
            flat: false
            background: Rectangle{
                color: "transparent"
                width: 40
                height: 40
                radius: 20
            }
            
            contentItem: Image{
                id : buttonfront
                source: "../front.png"
                
            }

        onClicked: {
                buttonfront.source = "../frontchanged.png"
                resetButtonfront.start()
                
            }

        Timer{
                id: resetButtonfront
                interval: 200
                repeat: false
                onTriggered:{
                    buttonfront.source = "../front.png"
                    
                }
            }
        
        }

     Button { //Back button
            id: back
            x: 45
            y: 645
            text: qsTr("")
            flat: false
            background: Rectangle{
                color: "transparent"
                width: 40
                height: 40
                radius: 20
            }
            
            contentItem: Image{
                id : buttonback
                source: "../back.png"
                
            }
            
            onClicked: {
                buttonback.source = "../backchanged.png"
                resetButtonback.start()
                
            }

        Timer{
                id: resetButtonback
                interval: 200
                repeat: false
                onTriggered:{
                    buttonback.source = "../back.png"
                    
                }
            }
        }

     Button { //Front1 button
            id: front1
            x: 105
            y: 600
            text: qsTr("")
            flat: false
            background: Rectangle{
                color: "transparent"
                width: 40
                height: 40
                radius: 20
            }
            
            contentItem: Image{
                id: buttonfront1
                source: "../front.png"
                
            }

        onClicked: {
                buttonfront1.source = "../frontchanged.png"
                resetButtonfront1.start()
                
            }

        Timer{
                id: resetButtonfront1
                interval: 200
                repeat: false
                onTriggered:{
                    buttonfront1.source = "../front.png"
                    
                }
            }
        
       }

     Button { //Back1 button
            id: back1
            x: 105
            y: 645
            text: qsTr("")
            flat: false
            background: Rectangle{
                color: "transparent"
                width: 40
                height: 40
                radius: 20
            }
            
            contentItem: Image{
                id: buttonback1
                source: "../back.png"
                
            }            
            
       onClicked: {
                buttonback1.source = "../backchanged.png"
                resetButtonback1.start()
                
            }

        Timer{
                id: resetButtonback1
                interval: 200
                repeat: false
                onTriggered:{
                    buttonback1.source = "../back.png"
                    
                }
            }
        }

     Button { //Left button
            id: left
            x: 10
            y: 622.5
            text: qsTr("")
            flat: false
            background: Rectangle{
                color: "transparent"
                width: 40
                height: 40
                radius: 20
            }
            
            contentItem: Image{
                id: leftbutton
                source: "../Left.png"
                
            }
        onClicked: {
                leftbutton.source = "../leftchanged.png"
                resetButtonleft.start()
                
            }

        Timer{
                id: resetButtonleft
                interval: 200
                repeat: false
                onTriggered:{
                    leftbutton.source = "../Left.png"
                    
                }
            }

        }
    
     Button { //Right button
            id: right
            x: 140
            y: 622.5
            text: qsTr("")
            flat: false
            background: Rectangle{
                color: "transparent"
                width: 40
                height: 40
                radius: 20
            }
            
            contentItem: Image{
                id: buttonright
                source: "..//Right.png"
                
            }

        onClicked: {
                buttonright.source = "../rightchanged.png"
                resetButtonright.start()
                
            }

        Timer{
                id: resetButtonright
                interval: 200
                repeat: false
                onTriggered:{
                    buttonright.source = "../Right.png"
                    
                }
            }

        }
        
        Rectangle{ //Notifications
            id: warnings
            x: 500
            y: 20
            width: 350
            height: 120
            color: "#c00a0a"
            radius: 15
            opacity: 0.5
            visible: false

            Text{
                id: notification_header 
                x: 130
                y: 10
                width: 200
                height: 60
                text: qsTr("Warning")
                font.pixelSize: 20
                font.styleName: "Thin"
                font.bold: true
                color: "White"
            }
             
            Text{
                id: notification_content
                x: 25
                y: 45
                width: 200
                height: 40
                text: qsTr("")
                font.pixelSize: 15
                font.styleName: "Thin"
                font.bold: true
                color: "White"
            }
        }

        Rectangle { // Warnings box
        id: warnings_box
        x: 1000
        y: 380
        width: 350
        height: 300
        opacity: 0.8
        color: "#1d1d1b"
        radius: 40


        Button { // robi button
            id: robi
            x: 10
            y: 20
            text: qsTr("")
            flat: false
            background: Rectangle{
                color: "transparent"
                width: 60
                height: 60
                radius: 20
            }
            
                contentItem: Image{
                    source: "../RoBi.png"
                }

                onClicked:{
                    pyInterface.assistant()
                    
                }
        }


        Text { // warnings box title
            id: warningstitle
            x: 80
            y: 40
            color: "White"
            text: qsTr("RoBi Up Robotics Voice Assistant")
            font.pixelSize: 15
            font.bold: true
        }
        
        TextArea{ // text area that shows the warning *need changes
            x:10
            y:100
            width:280
            height:220
            id: warnings_text
            readOnly:true
            wrapMode: Text.WordWrap
            placeholderText: "Welcome to UP Robotics Interface"
            color:"#ffffff"

            onTextChanged:{
                
            }

            

        }
        Image{
            id: effect1
            x:0
            y:200
            source:"../robi_effect1.png"
        

        }

        }

        Timer{ //Reset notification timer
        id: resetNotification
        interval: 1000
        repeat: false
        onTriggered:{
            warnings.visible = !warnings.visible
            warnings.color ="#c00a0a"
        }
             }

        Timer{//Clear Warnings timer
            id: clearWarnings
            interval: 60000
            repeat: true
            running: true
            onTriggered:{
                warnings_text.text = " "
            }
        }

    Loader{
        id:mainLoader
        anchors.fill: parent
    }

     Keys.onPressed: (event) => {
       if (event.key === Qt.Key_Return || event.key === Qt.Key_W) {
            front.clicked()
            
        } else if (event.key === Qt.Key_Return || event.key === Qt.Key_S) {
           back.clicked()
        }else if (event.key === Qt.Key_Return || event.key === Qt.Key_Up){
            front1.clicked()
        }else if (event.key === Qt.Key_Return || event.key === Qt.Key_Down){
            back1.clicked()
        }else if (event.key === Qt.Key_Return || event.key === Qt.Key_Left){
            left.clicked()
        }else if (event.key === Qt.Key_Return || event.key === Qt.Key_Right){
            right.clicked()
        }
}
}} 
