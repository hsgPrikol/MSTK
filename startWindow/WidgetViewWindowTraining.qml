import QtQuick 2.8
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Extras 2.0
import QtQuick.Scene3D 2.0
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
//import QtQuick3D 1.15

import Qt3D.Extras 2.12

Rectangle {
    color: "transparent"
    width: 500
    height: 500
//    visible: false
    signal signalView3dExit


//    MouseArea {
//        anchors.fill: parent
//        //acceptedButtons: Qt.LeftButton | Qt.RightButton
//        //hoverEnabled: true
//        //enabled: true

//        onMouseXChanged: {
//            print("moveX")
//        }

//        onMouseYChanged: {
//            print("moveY")
//        }

//        onClicked: {
//                     if (mouse.button == Qt.RightButton)
//                         print("right")
//                         //parent.color = 'blue';
//                     else
//                         //parent.color = 'red';
//                         print("left")

//        }

//    }

//    ObjectPicker {

//        id: baseCuboidPicker
//            hoverEnabled: true
//            dragEnabled: true
//            enabled: true

//        onClicked: {

//                         parent.color = 'red';

//        }
//    }






    Scene3D {
        anchors.fill: parent
        focus: true
        aspects: ["input", "logic"]
        cameraAspectRatioMode: Scene3D.AutomaticAspectRatio





//        ObjectPicker {
//            id: objectPicker
//            hoverEnabled: true
//            dragEnabled: true
//            enabled: true

//            onPressed: {
////                rotationAnimation.running = !rotationAnimation.running
//            }


//        }


        Entity {


            Camera {
                id: camera
                nearPlane: 0.1
                farPlane: 1000.0
                position: Qt.vector3d(0.0, 0.0, 800.0)

                upVector: Qt.vector3d(0.0, 1.0, 0.0)
                viewCenter: Qt.vector3d(0.0, 0.0, 0.0)
            }

//            FirstPersonCameraController {
//                camera: camera
//                linearSpeed: 1000.0
//                acceleration: 0.1
//                deceleration: 1.0
//            }

            //FirstPersonCameraController{}

            OrbitCameraController {
                id: orbitCameraController
                camera: camera
                linearSpeed: 0.0
                //lookSpeed: 0.0
                //acceleration: 0.1
                //deceleration: 1.0
            }

            RenderSettings {
                activeFrameGraph:
                    ForwardRenderer {
                    camera: camera
                    clearColor: "transparent"
                }

//                renderPolicy: RenderSettings.Always
            }

            InputSettings {

            }

//            PointLight {
//                id: mainLight
//                color: "red"
//                intensity: 0.5
//                enabled: true


//                Transform {
//                    id: positionMainLight
//                    translation: Qt.vector3d(0, 0, 0)
//                    rotationX: 0
//                    rotationY: 0
//                    rotationZ: 0
//                }
//            }

//            DirectionalLight {
//                id: mainLight
//                color: "red"
//                worldDirection: Qt.vector3d(1, -1, -1)
//        //color:  "#afafff"
//        //worldDirection: Qt.vector3d(0, 0, 0)

//            }



            Entity {
                id: mainLight

                DirectionalLight {
                    id: directionalLight_1
                    //color: "red"
                    worldDirection: Qt.vector3d(-1, -1, -1)
                }

                DirectionalLight {
                    id: directionalLight_2
                    //color: "red"
                    worldDirection: Qt.vector3d(1, 1, 1)
                }

//                PointLight {
//                    id: pointLight
//                    color: "red"
//                }

//                SpotLight {
//                    id: spotLight
//                    color: "red"
//                    localDirection: Qt.vector3d(0, -1, 0)
//                    intensity: 1
//                }

//                Transform {
//                    id: transformMainLight
//                    translation: Qt.vector3d(0, 1000, 0)
//                }




                components: [directionalLight_1, directionalLight_2]
            }



            components: [mainLight]



//            Entity {
//                PhongMaterial {
//                    id: phongMaterial
//                    ambient: Qt.rgba(0.3, 0.3, 0.3, 1.0)
//                    diffuse: Qt.rgba(1, 1, 1, 1)
//                }

//                SphereMesh {
//                    id: sphereMesh
//                    radius: 6
//                }

//                Transform {
//                    id: sphereTransform
//                    property real myParam: 0
//                    matrix: {
//                        var mat = Qt.matrix4x4();
//                        mat.rotate(myParam, Qt.vector3d(0, 1, 0));
//                        mat.translate(Qt.vector3d(24, 0, 0));
//                        return mat;
//                    }
//                }

//                components: [sphereMesh, phongMaterial, sphereTransform]


//                NumberAnimation {
//                    target: sphereTransform
//                    property: "myParam"
//                    duration: 10000
//                    from: 0
//                    to: 360
//                    loops: Animation.Infinite
//                    running: true
//                }
//            }

            Entity {
                id: entityCopter

                //DefaultMaterial

                PhongMaterial {
                    id: phongMaterial
                    ambient: Qt.rgba(0.4, 0.4, 0.4, 1)
                    //ambient: "red"
                    //diffuse: Qt.rgba(1, 1, 1, 1)
                    //specular: Qt.rgba(1, 1, 1, 1)
                    //shininess: 0.0
                }

//                DiffuseSpecularMaterial {
//                                    id: baseCuboidMaterial
//                                    ambient: "red"
//                                    //shininess: 100
//                                }

//                GoochMaterial
//                {
//                    id: baseMaterial
//                    alpha: 1.0
//                    diffuse: "red"
//                    specular: "red"
//                    warm: "red"
//                    cool: "red"
//                    beta: 1.0
//                    shininess: 1.0
//                }

                Mesh {
                    id: sphereMesh
                    source: "qrc:/model/copter.obj"
                }


                Transform {
                    id: sphereMeshTransform
                    rotationX: 0
                    rotationY: 0
                    rotationZ: 0
                    translation: Qt.vector3d(0, 0, 0)
                }

                RotationAnimation {
                    id: rotationAnimation
                    target: sphereMeshTransform
                    properties: "rotationY"
                    loops: Animation.Infinite
                    from: 0
                    to: 360
                    duration: 10000
                    running: false
                }

                components: [sphereMesh, phongMaterial, sphereMeshTransform, rotationAnimation]
            }

            //components: [mouse]

//            Entity {
//                PlaneMesh {
//                    id: qw1
//                    width: 10000
//                    height: 10000

//                }

//                Transform {
//                    id: qw3
//                    translation: Qt.vector3d(0, -50, 0)
//                }

//                PhongMaterial {
//                    id: qw2
//                    ambient: Qt.rgba(0.7, 0.7, 0.7, 1.0)
//                    //ambient: "red"
//                    diffuse: Qt.rgba(1, 1, 1, 1)
//                    //specular: Qt.rgba(1, 1, 1, 1)
//                    //shininess: 0.0
//                }


//                components: [qw1, qw2, qw3]

//            }

        }

    }

    ParallelAnimation {

        id: parallelAnimationOut
        loops: 1
        running: false

        NumberAnimation {
            target: camera
            property: "viewCenter.x"
            duration: 500
            from: camera.upVector.x
            to: camera.upVector.x * 500
            easing.type: Easing.InOutCubic
        }

        NumberAnimation {
            target: camera
            property: "viewCenter.y"
            duration: 500
            from: camera.upVector.y
            to: camera.upVector.y * 500
            easing.type: Easing.InOutCubic
        }

        NumberAnimation {
            target: camera
            property: "viewCenter.z"
            duration: 500
            from: camera.upVector.z
            to: camera.upVector.z * 500
            easing.type: Easing.InOutCubic
        }

        onStarted: {
            orbitCameraController.enabled = false
        }

        onStopped: {

            //тут обновление информации о хитах для конкретного дрона

            parallelAnimationIn.running = true
        }
    }

    ParallelAnimation {

        id: parallelAnimationIn
        loops: 1
        running: false

        NumberAnimation {
            target: camera
            property: "viewCenter.x"
            duration: 500
            from: camera.upVector.x * 500
            to: camera.upVector.x
            easing.type: Easing.InOutCubic
        }

        NumberAnimation {
            target: camera
            property: "viewCenter.y"
            duration: 500
            from: camera.upVector.y * 500
            to: camera.upVector.y
            easing.type: Easing.InOutCubic
        }

        NumberAnimation {
            target: camera
            property: "viewCenter.z"
            duration: 500
            from: camera.upVector.z * 500
            to: camera.upVector.z
            easing.type: Easing.InOutCubic
        }

        onStopped: {
            orbitCameraController.enabled = true
        }
    }

//    SequentialAnimation {
//        id: sequentialAnimation
//        loops: 1








////        NumberAnimation {
////            target: camera
////            property: "viewCenter.y"
////            duration: 500
////            from: 0
////            to: 500
//////            easing.type: Easing.OutCubic
////        }

////        NumberAnimation {
////            target: camera
////            property: "viewCenter.y"
////            duration: 500
////            from: 500
////            to: 0
//////            easing.type: Easing.InCubic
////        }

//        //running: false


////        onAnimationsChanged: {
////            print("ch")
////        }

//        onStarted: {
//            print("onStartedSequentialAnimation")
//            orbitCameraController.enabled = false
//        }

//        onStopped: {
//            print("onStoppedSequentialAnimation")
//            orbitCameraController.enabled = true
//        }



////        onFinished: {
////            orbitCameraController.enabled = true
////        }
//    }

//    Vector3dAnimation {
//        id: vector3dAnimation_1
//        from: Qt.vector3d(0, 0, 1000)
//        to: Qt.vector3d(0, 0, 0)
//        duration: 1000
//        property: "translation"
//        target: sphereMeshTransform
//        //loops: Animation.Infinite
//        running: true
//    }

//    Vector3dAnimation {
//        id: vector3dAnimation_2
//        from: Qt.vector3d(0, 0, 0)
//        to: Qt.vector3d(0, 0, 1000)
//        duration: 1000
//        property: "translation"
//        target: sphereMeshTransform
//        //loops: Animation.Infinite
//        running: true
//    }

//    NumberAnimation {
//        id: numberAnimationForLight
//        target: spotLight
//        property: "linearAttenuation"
//        duration: 5000
//        from: 0.0
//        to: 1.0
//        loops: 1

//        onStarted: {
//            console.log("new loop")
//        }
//    }

    ColorAnimation {
        id: tetetet
        from: Qt.rgba(0, 0, 0)
        to: Qt.rgba(Math.random(0, 255), Math.random(0, 255), Math.random(0, 255))
        duration: 200
        property: "ambient"
        target: phongMaterial

        loops: Animation.Infinite

        running: false
    }

    Keys.onPressed: {
        if (event.key === Qt.Key_A)
        {
            transformMainLight.translation.y += 10

            console.log(transformMainLight.translation);
            event.accepted = true;
        }

        if (event.key === Qt.Key_D)
        {
            transformMainLight.translation.y -= 10

            console.log(transformMainLight.translation);
            event.accepted = true;
        }

        if (event.key === Qt.Key_W)
        {
            positionMainLight.translation.z += 10

            console.log(positionMainLight.translation);
            event.accepted = true;
        }

        if (event.key === Qt.Key_S)
        {
            positionMainLight.translation.z -= 10

            console.log(positionMainLight.translation);
            event.accepted = true;
        }

        if (event.key === Qt.Key_Down)
        {
            positionMainLight.translation.y -= 10

            console.log(positionMainLight.translation);
            event.accepted = true;
        }

        if (event.key === Qt.Key_Up)
        {
            positionMainLight.translation.y += 10

            console.log(positionMainLight.translation);
            event.accepted = true;
        }

        if (event.key === Qt.Key_Right)
        {
            mainLight.intensity += 0.1

            console.log(mainLight.intensity);
            event.accepted = true;
        }

        if (event.key === Qt.Key_Left)
        {
            mainLight.intensity -= 0.1

            console.log(mainLight.intensity);
            event.accepted = true;
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        enabled: true

        onClicked:
        {
            //sphereMeshTransform.rotationX = sphereMeshTransform.rotationX + 25;
            //phongMaterial.enabled = false;
            //phongMaterial.setEnabled(false)
            //phongMaterial.destroy()

            //entityCopter.components.

//            print("work")
            //vector3dAnimation_1.running = !(vector3dAnimation_1.running)

            parallelAnimationOut.running = true
            //print(parallelAnimationOut.alwaysRunToEnd)

//            console.log("constantAttenuation   " + spotLight.constantAttenuation)
//            console.log("cutOffAngle   " + spotLight.cutOffAngle)
//            console.log("linearAttenuation   " + spotLight.linearAttenuation)
//            console.log("localDirection   " + spotLight.localDirection)
//            console.log("quadraticAttenuation   " + spotLight.quadraticAttenuation)

            //camera.viewCenter.y = camera.viewCenter.y + 100

            //phongMaterial.ambient =  Qt.rgba(Math.random(), Math.random(), Math.random())

            //print(vector3dAnimation_1.running)
        }
    }




}
