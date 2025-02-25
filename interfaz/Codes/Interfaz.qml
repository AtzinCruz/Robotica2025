import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Layouts 1.15

ApplicationWindow{
    visible: true
    title: "Up Robotics Control Interface"
    width: Qt.application.screens[0].width  // Obtiene el ancho de la pantalla
    height: Qt.application.screens[0].height // Obtiene la altura de la pantalla

    Rectangle{
        anchors.fill: parent
        color: "#000000"
        
    }

    Image{//Background
        id:background
        anchors.fill: parent
        source: "../Images/Background.png"
        opacity: 0.6
    }

    Rectangle{//Header
        id:header
        width: Qt.application.screens[0].width
        height: Qt.application.screens[0].height/10
        color: "#000000"

        RowLayout{
            

            Button{//Mode button
                id: mode_button


                background: Rectangle{
                    color: "transparent"
                    width: 40
                    height: 40
                }

                    contentItem: Image{
                        source: "../Images/Mode_Button.png"
                    }

                    onClicked:{
                        arm_mode_button.visible = !arm_mode_button.visible
                        home_mode_button.visible = !home_mode_button.visible
                        movement_mode_button.visible = !movement_mode_button.visible
                        
                    }
            }

                Button{//Arm Modes button
                    id: arm_mode_button
                    visible: false


                    background: Rectangle{
                        color: "transparent"
                        width: 40
                        height: 40
                    }

                        contentItem: Image{
                            source: "../Images/Arm_Mode_Button.png"
                        }

                        onClicked:{
                            arm_mode.visible =! arm_mode.visible
                            
                        }
                }

                Button{//Home Mode button
                    id: home_mode_button
                    visible: false


                    background: Rectangle{
                        color: "transparent"
                        width: 40
                        height: 40
                    }

                        contentItem: Image{
                            source: "../Images/Home_Mode_Button.png"
                        }

                        onClicked:{
                            
                        }
                }

                Button{//Movement Mode button
                    id: movement_mode_button
                    visible: false


                    background: Rectangle{
                        color: "transparent"
                        width: 40
                        height: 40
                    }

                        contentItem: Image{
                            source: "../Images/Movement_Mode_Button.png"
                        }

                        onClicked:{
                            move_mode.visible = !move_mode.visible
                            
                        }
                }
        }  
    }

        Rectangle{
            id:arm_mode
            visible: false
            width: Qt.application.screens[0].width
            height: Qt.application.screens[0].height            
            color: "#000000"

                Image{//Background
                    id:background_arm
                    anchors.fill: parent
                    source: "../Images/Background.png"
                    opacity: 0.6
                }

                Rectangle{//Header
                    id:header_arm
                    width: Qt.application.screens[0].width
                    height: Qt.application.screens[0].height/10
                    color: "#000000"

                    RowLayout{
                        

                        Button{//Mode button
                            id: mode_button_arm


                            background: Rectangle{
                                color: "transparent"
                                width: 40
                                height: 40
                            }

                                contentItem: Image{
                                    source: "../Images/Mode_Button.png"
                                }

                                onClicked:{
                                    arm_mode_button.visible = !arm_mode_button.visible
                                    home_mode_button.visible = !home_mode_button.visible
                                    movement_mode_button.visible = !movement_mode_button.visible
                                    
                                }
                        }

                            Button{//Arm Modes button
                                id: arm_mode_button_arm
                                visible: false


                                background: Rectangle{
                                    color: "transparent"
                                    width: 40
                                    height: 40
                                }

                                    contentItem: Image{
                                        source: "../Images/Arm_Mode_Button.png"
                                    }

                                    onClicked:{
                                        arm_mode.visible =! arm_mode.visible
                                        
                                    }
                            }

                            Button{//Home Mode button
                                id: home_mode_button_arm
                                visible: false


                                background: Rectangle{
                                    color: "transparent"
                                    width: 40
                                    height: 40
                                }

                                    contentItem: Image{
                                        source: "../Images/Home_Mode_Button.png"
                                    }

                                    onClicked:{
                                        
                                    }
                            }

                            Button{//Movement Mode button
                                id: movement_mode_button_arm
                                visible: false


                                background: Rectangle{
                                    color: "transparent"
                                    width: 40
                                    height: 40
                                }

                                    contentItem: Image{
                                        source: "../Images/Movement_Mode_Button.png"
                                    }

                                    onClicked:{
                                        move_mode.visible = !move_mode.visible
                                        
                                    }
                            }
                    }  
                }



        }

        Rectangle{
            id:move_mode
            visible: false
            width: Qt.application.screens[0].width
            height: Qt.application.screens[0].height
            anchors.topMargin:Qt.application.screens[0].height
        }
        

    }
