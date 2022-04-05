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

import "../"

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


    property int rotationXEntityCopter: 135
    property int rotationYEntityCopter: 25
    property int rotationZEntityCopter: 0

    property real scaleEntityCopter: 0.55

    property vector3d translationEntityCopter: Qt.vector3d(0.0, 10.0, 0.0)

    function addHitEntityCopter(zone, newColor)
    {

//        console.log("ЭТО БЛЯТЬ РАБОТАЕТ")

        switch (zone)
        {

        case 0:
        {
            phongMaterial_C.ambient = newColor
            break
        }

        case 1:
        {
            phongMaterial_F.ambient = newColor
            break
        }

        case 2:
        {
            phongMaterial_FL.ambient = newColor
            break
        }

        case 3:
        {
            phongMaterial_FP.ambient = newColor
            break
        }

        case 4:
        {
            phongMaterial_LB.ambient = newColor
            break
        }

        case 5:
        {
            phongMaterial_PB.ambient = newColor
            break
        }

        case 6:
        {
            phongMaterial_SLF.ambient = newColor
            break
        }

        case 7:
        {
            phongMaterial_SLT.ambient = newColor
            break
        }

        case 8:
        {
            phongMaterial_SPF.ambient = newColor
            break
        }

        case 9:
        {
            phongMaterial_SPT.ambient = newColor
            break
        }

        case 10:
        {
            phongMaterial_T.ambient = newColor
            break
        }

        case 11:
        {
            phongMaterial_TL.ambient = newColor
            break
        }

        case 12:
        {
            phongMaterial_TP.ambient = newColor
            break
        }

        }

        //
    }


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
                farPlane: 1500.0
                position: Qt.vector3d(0.0, 0.0, 500.0)

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
                id: entityCopter_C

                PhongMaterial {
                    id: phongMaterial_C
                    ambient: Qt.rgba(0.4, 0.4, 0.4, 1)
                }

                Mesh {
                    id: c_obj
                    source: "qrc:/model/C.obj"
                }

                Transform {
                    id: sphereMeshTransform_C
                    rotationX: rotationXEntityCopter
                    rotationY: rotationYEntityCopter
                    rotationZ: rotationZEntityCopter
                    translation: translationEntityCopter
                    scale: scaleEntityCopter
                }

                Component.onCompleted:
                {
                    console.log(rotationXentityCopter)
                    console.log(sphereMeshTransform_C.rotationX)
                    console.log("test")
                }

                components: [c_obj, phongMaterial_C, sphereMeshTransform_C]
            }

            Entity {
                id: entityCopter_F

                PhongMaterial {
                    id: phongMaterial_F
                    ambient: Qt.rgba(0.4, 0.4, 0.4, 1)
                }

                Mesh {
                    id: f_obj
                    source: "qrc:/model/F.obj"
                }

                Transform {
                    id: sphereMeshTransform_F
                    rotationX: rotationXEntityCopter
                    rotationY: rotationYEntityCopter
                    rotationZ: rotationZEntityCopter
                    translation: translationEntityCopter
                    scale: scaleEntityCopter
                }

                components: [f_obj, phongMaterial_F, sphereMeshTransform_F]
            }

            Entity {
                id: entityCopter_FL

                PhongMaterial {
                    id: phongMaterial_FL
                    ambient: Qt.rgba(0.4, 0.4, 0.4, 1)
                }

                Mesh {
                    id: fl_obj
                    source: "qrc:/model/FL.obj"
                }

                Transform {
                    id: sphereMeshTransform_FL
                    rotationX: rotationXEntityCopter
                    rotationY: rotationYEntityCopter
                    rotationZ: rotationZEntityCopter
                    translation: translationEntityCopter
                    scale: scaleEntityCopter
                }

                components: [fl_obj, phongMaterial_FL, sphereMeshTransform_FL]
            }

            Entity {
                id: entityCopter_FP

                PhongMaterial {
                    id: phongMaterial_FP
                    ambient: Qt.rgba(0.4, 0.4, 0.4, 1)
                }

                Mesh {
                    id: fp_obj
                    source: "qrc:/model/FP.obj"
                }

                Transform {
                    id: sphereMeshTransform_FP
                    rotationX: rotationXEntityCopter
                    rotationY: rotationYEntityCopter
                    rotationZ: rotationZEntityCopter
                    translation: translationEntityCopter
                    scale: scaleEntityCopter
                }

                components: [fp_obj, phongMaterial_FP, sphereMeshTransform_FP]
            }

            Entity {
                id: entityCopter_LB

                PhongMaterial {
                    id: phongMaterial_LB
                    ambient: Qt.rgba(0.4, 0.4, 0.4, 1)
                }

                Mesh {
                    id: lb_obj
                    source: "qrc:/model/LB.obj"
                }

                Transform {
                    id: sphereMeshTransform_LB
                    rotationX: rotationXEntityCopter
                    rotationY: rotationYEntityCopter
                    rotationZ: rotationZEntityCopter
                    translation: translationEntityCopter
                    scale: scaleEntityCopter
                }

                components: [lb_obj, phongMaterial_LB, sphereMeshTransform_LB]
            }

            Entity {
                id: entityCopter_NOJKI

                PhongMaterial {
                    id: phongMaterial_NOJKI
                    ambient: Qt.rgba(0.4, 0.4, 0.4, 1)
                }

                Mesh {
                    id: nojki_obj
                    source: "qrc:/model/Nojki.obj"
                }

                Transform {
                    id: sphereMeshTransform_NOJKI
                    rotationX: rotationXEntityCopter
                    rotationY: rotationYEntityCopter
                    rotationZ: rotationZEntityCopter
                    translation: translationEntityCopter
                    scale: scaleEntityCopter
                }

                components: [nojki_obj, phongMaterial_NOJKI, sphereMeshTransform_NOJKI]
            }

            Entity {
                id: entityCopter_PB

                PhongMaterial {
                    id: phongMaterial_PB
                    ambient: Qt.rgba(0.4, 0.4, 0.4, 1)
                }

                Mesh {
                    id: pb_obj
                    source: "qrc:/model/PB.obj"
                }

                Transform {
                    id: sphereMeshTransform_PB
                    rotationX: rotationXEntityCopter
                    rotationY: rotationYEntityCopter
                    rotationZ: rotationZEntityCopter
                    translation: translationEntityCopter
                    scale: scaleEntityCopter
                }

                components: [pb_obj, phongMaterial_PB, sphereMeshTransform_PB]
            }

            Entity {
                id: entityCopter_SLF

                PhongMaterial {
                    id: phongMaterial_SLF
                    ambient: Qt.rgba(0.4, 0.4, 0.4, 1)
                }

                Mesh {
                    id: slf_obj
                    source: "qrc:/model/SLF+.obj"
                }

                Transform {
                    id: sphereMeshTransform_SLF
                    rotationX: rotationXEntityCopter
                    rotationY: rotationYEntityCopter
                    rotationZ: rotationZEntityCopter
                    translation: translationEntityCopter
                    scale: scaleEntityCopter
                }

                components: [slf_obj, phongMaterial_SLF, sphereMeshTransform_SLF]
            }

            Entity {
                id: entityCopter_SLT

                PhongMaterial {
                    id: phongMaterial_SLT
                    ambient: Qt.rgba(0.4, 0.4, 0.4, 1)
                }

                Mesh {
                    id: slt_obj
                    source: "qrc:/model/SLT+.obj"
                }

                Transform {
                    id: sphereMeshTransform_SLT
                    rotationX: rotationXEntityCopter
                    rotationY: rotationYEntityCopter
                    rotationZ: rotationZEntityCopter
                    translation: translationEntityCopter
                    scale: scaleEntityCopter
                }

                components: [slt_obj, phongMaterial_SLT, sphereMeshTransform_SLT]
            }

            Entity {
                id: entityCopter_SPF

                PhongMaterial {
                    id: phongMaterial_SPF
                    ambient: Qt.rgba(0.4, 0.4, 0.4, 1)
                }

                Mesh {
                    id: spf_obj
                    source: "qrc:/model/SPF+.obj"
                }

                Transform {
                    id: sphereMeshTransform_SPF
                    rotationX: rotationXEntityCopter
                    rotationY: rotationYEntityCopter
                    rotationZ: rotationZEntityCopter
                    translation: translationEntityCopter
                    scale: scaleEntityCopter
                }

                components: [spf_obj, phongMaterial_SPF, sphereMeshTransform_SPF]
            }

            Entity {
                id: entityCopter_SPT

                PhongMaterial {
                    id: phongMaterial_SPT
                    ambient: Qt.rgba(0.4, 0.4, 0.4, 1)
                }

                Mesh {
                    id: spt_obj
                    source: "qrc:/model/SPT+.obj"
                }

                Transform {
                    id: sphereMeshTransform_SPT
                    rotationX: rotationXEntityCopter
                    rotationY: rotationYEntityCopter
                    rotationZ: rotationZEntityCopter
                    translation: translationEntityCopter
                    scale: scaleEntityCopter
                }

                components: [spt_obj, phongMaterial_SPT, sphereMeshTransform_SPT]
            }

            Entity {
                id: entityCopter_T

                PhongMaterial {
                    id: phongMaterial_T
                    ambient: Qt.rgba(0.4, 0.4, 0.4, 1)
                }

                Mesh {
                    id: t_obj
                    source: "qrc:/model/T.obj"
                }

                Transform {
                    id: sphereMeshTransform_T
                    rotationX: rotationXEntityCopter
                    rotationY: rotationYEntityCopter
                    rotationZ: rotationZEntityCopter
                    translation: translationEntityCopter
                    scale: scaleEntityCopter
                }

                components: [t_obj, phongMaterial_T, sphereMeshTransform_T]
            }

            Entity {
                id: entityCopter_TL

                PhongMaterial {
                    id: phongMaterial_TL
                    ambient: Qt.rgba(0.4, 0.4, 0.4, 1)
                }

                Mesh {
                    id: tl_obj
                    source: "qrc:/model/TL.obj"
                }

                Transform {
                    id: sphereMeshTransform_TL
                    rotationX: rotationXEntityCopter
                    rotationY: rotationYEntityCopter
                    rotationZ: rotationZEntityCopter
                    translation: translationEntityCopter
                    scale: scaleEntityCopter
                }

                components: [tl_obj, phongMaterial_TL, sphereMeshTransform_TL]
            }


            Entity {
                id: entityCopter_TP

                PhongMaterial {
                    id: phongMaterial_TP
                    ambient: Qt.rgba(0.4, 0.4, 0.4, 1)
                }

                Mesh {
                    id: tp_obj
                    source: "qrc:/model/TP.obj"
                }

                Transform {
                    id: sphereMeshTransform_TP
                    rotationX: rotationXEntityCopter
                    rotationY: rotationYEntityCopter
                    rotationZ: rotationZEntityCopter
                    translation: translationEntityCopter
                    scale: scaleEntityCopter
                }

                components: [tp_obj, phongMaterial_TP, sphereMeshTransform_TP]
            }
            //            Entity {
            //                id: entityCopter

            //                PhongMaterial {
            //                    id: phongMaterial
            //                    ambient: Qt.rgba(0.4, 0.4, 0.4, 1)
            //                }



            //                Mesh {
            //                    id: c_obj
            //                    source: "qrc:/model/C.obj"
            //                }

            //                Mesh {
            //                    id: f_obj
            //                    source: "qrc:/model/F.obj"
            //                }

            //                Mesh {
            //                    id: fl_obj
            //                    source: "qrc:/model/FL.obj"
            //                }

            //                Mesh {
            //                    id: fp_obj
            //                    source: "qrc:/model/FP.obj"
            //                }

            //                Mesh {
            //                    id: lb_obj
            //                    source: "qrc:/model/LB.obj"
            //                }

            //                Mesh {
            //                    id: nojki_obj
            //                    source: "qrc:/model/Nojki.obj"
            //                }

            //                Mesh {
            //                    id: pb_obj
            //                    source: "qrc:/model/PB.obj"
            //                }

            //                Mesh {
            //                    id: slf_obj
            //                    source: "qrc:/model/SLF.obj"
            //                }

            //                Mesh {
            //                    id: slt_obj
            //                    source: "qrc:/model/SLT.obj"
            //                }

            //                Mesh {
            //                    id: spf_obj
            //                    source: "qrc:/model/SPF.obj"
            //                }

            //                Mesh {
            //                    id: spt_obj
            //                    source: "qrc:/model/SPT.obj"
            //                }

            //                Mesh {
            //                    id: t_obj
            //                    source: "qrc:/model/T.obj"
            //                }

            //                Mesh {
            //                    id: tl_obj
            //                    source: "qrc:/model/TL.obj"
            //                }

            //                Mesh {
            //                    id: tp_obj
            //                    source: "qrc:/model/TP.obj"
            //                }


            //                Transform {
            //                    id: sphereMeshTransform
            //                    rotationX: 0
            //                    rotationY: 0
            //                    rotationZ: 0
            //                    translation: Qt.vector3d(0, 0, 0)
            //                }

            //                RotationAnimation {
            //                    id: rotationAnimation
            //                    target: sphereMeshTransform
            //                    properties: "rotationY"
            //                    loops: Animation.Infinite
            //                    from: 0
            //                    to: 360
            //                    duration: 10000
            //                    running: false
            //                }

            //                components: [c_obj, /*f_obj,*/ fl_obj, /*fp_obj, lb_obj, nojki_obj, pb_obj, slf_obj, slt_obj, spf_obj, spt_obj, t_obj, tl_obj, tp_obj,*/ phongMaterial, sphereMeshTransform, rotationAnimation]
            //            }

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

//    ColorAnimation {
//        id: tetetet
//        from: Qt.rgba(0, 0, 0)
//        to: Qt.rgba(Math.random(0, 255), Math.random(0, 255), Math.random(0, 255))
//        duration: 200
//        property: "ambient"
//        target: phongMaterial

//        loops: Animation.Infinite

//        running: false
//    }

//    Keys.onPressed: {
//        if (event.key === Qt.Key_Q)
//        {
//            console.log("Q")

//            //for (var i = 0; i < mainClass.getCountTargets(); i++)
//            {
//                mainClass.newHit(0, 0)
//            }

//            event.accepted = true;
//        }

//        if (event.key === Qt.Key_A)
//        {
//            console.log("A")

//            //for (var i = 0; i < mainClass.getCountTargets(); i++)
//            {
//                mainClass.newHit(1, 0)
//            }

//            event.accepted = true;
//        }

//        if (event.key === Qt.Key_Z)
//        {
//            console.log("Z")

//            //for (var i = 0; i < mainClass.getCountTargets(); i++)
//            {
//                mainClass.newHit(2, 0)
//            }

//            event.accepted = true;
//        }

//        if (event.key === Qt.Key_W)
//        {
//            console.log("W")

////            for (var i = 0; i < mainClass.getCountTargets(); i++)
//            {
//                mainClass.newHit(3, 1)
//            }

//            event.accepted = true;
//        }

//        if (event.key === Qt.Key_S)
//        {
//            console.log("S")

////            for (var i = 0; i < mainClass.getCountTargets(); i++)
//            {
//                mainClass.newHit(4, 1)
//            }

//            event.accepted = true;
//        }

//        if (event.key === Qt.Key_X)
//        {
//            console.log("X")

////            for (var i = 0; i < mainClass.getCountTargets(); i++)
//            {
//                mainClass.newHit(5, 1)
//            }

//            event.accepted = true;
//        }

//        if (event.key === Qt.Key_E)
//        {
//            console.log("E")

////            for (var i = 0; i < mainClass.getCountTargets(); i++)
//            {
//                mainClass.newHit(6, 2)
//            }

//            event.accepted = true;
//        }

//        if (event.key === Qt.Key_D)
//        {
//            console.log("D")

////            for (var i = 0; i < mainClass.getCountTargets(); i++)
//            {
//                mainClass.newHit(7, 2)
//            }

//            event.accepted = true;
//        }

//        if (event.key === Qt.Key_C)
//        {
//            console.log("C")

////            for (var i = 0; i < mainClass.getCountTargets(); i++)
//            {
//                mainClass.newHit(8, 2)
//            }

//            event.accepted = true;
//        }

//        if (event.key === Qt.Key_R)
//        {
//            console.log("R")

////            for (var i = 0; i < mainClass.getCountTargets(); i++)
//            {
//                mainClass.newHit(9, 0)
//            }

//            event.accepted = true;
//        }

//        if (event.key === Qt.Key_F)
//        {
//            console.log("F")

////            for (var i = 0; i < mainClass.getCountTargets(); i++)
//            {
//                mainClass.newHit(10, 1)
//            }

//            event.accepted = true;
//        }

//        if (event.key === Qt.Key_V)
//        {
//            console.log("V")

////            for (var i = 0; i < mainClass.getCountTargets(); i++)
//            {
//                mainClass.newHit(11, 2)
//            }

//            event.accepted = true;
//        }

//        if (event.key === Qt.Key_T)
//        {
//            console.log("T")

////            for (var i = 0; i < mainClass.getCountTargets(); i++)
//            {
//                mainClass.newHit(12, 0)
//            }

//            event.accepted = true;
//        }
//    }

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

            //parallelAnimationOut.running = true
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

        Component.onCompleted: {
            mainClass.setStartColor(phongMaterial_F.ambient)
            mainClass.onNewHitCopterUpdateColor.connect(addHitEntityCopter)
            console.log("Ты сюда зашел?")
//            mainClass.onTestNewHit.connect(addHitEntityCopterTest)

//            console.log("connect!!!!!!!!!!!!!!!!!")
        }
    }




}
