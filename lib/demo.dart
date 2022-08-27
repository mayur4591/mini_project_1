import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  late ArCoreController controller= ArCoreController();
  var img=const AssetImage('assets/img.jpg');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tsting Ar'),
      ),
      body: ArCoreView(
        onArCoreViewCreated: onARViewCreated,
        enableTapRecognizer: true,
      ),
    );
  }
   onARViewCreated(ArCoreController cont){
    controller=cont;
    controller.onPlaneTap=controlOnPlaneTap;

  }
  void controlOnPlaneTap(List<ArCoreHitTestResult> result)
  {
    final hit=result.first;
    addItemImage(hit);
  }

  void _addCube(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Color.fromARGB(120, 66, 134, 244),
      metallic: 1.0,
    );
    final cube = ArCoreCube(
      materials: [material],
      size: Vector3(0.5, 0.5, 0.5),
    );
    final node = ArCoreNode(
      shape: cube,
      position: Vector3(-0.5, 0.5, -3.5),
    );

    controller.addArCoreNode(node);
  }
  void _addCylinder(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Color.fromRGBO(30,129,7,1),
      reflectance: 1.0,
    );
    final cylinder = ArCoreCylinder(
      materials: [material],
      radius: 0.5,
      height: 0.3,
    );
    final node = ArCoreNode(
      shape: cylinder,
      position: Vector3(0.0, -0.5, -2.0),
    );
    controller.addArCoreNode(node);
  }

  void _addSphere(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Color.fromARGB(120, 66, 134, 244),
    );
    final sphere = ArCoreSphere(
      materials: [material],
      radius: 0.1,
    );
    final node = ArCoreNode(
      shape: sphere,
      position: Vector3(0, 0, -1.5),
    );
    controller.addArCoreNode(node);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  Future addItemImage(ArCoreHitTestResult hitResult) async {
    final byte=(await rootBundle.load('assets/img.jpg')).buffer.asUint8List();


    final imageItem=ArCoreNode(
      image: ArCoreImage(bytes: byte,width: 600,height: 600),
      position: hitResult.pose.translation+Vector3(0.0,0.0,0.0),
      rotation: hitResult.pose.rotation+Vector4(0.0,0.0,0.0,0.0)
    );
    controller.addArCoreNode(imageItem);
  }
}
