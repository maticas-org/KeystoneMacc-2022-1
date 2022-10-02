import 'package:flutter/material.dart';
import '../constants.dart';
import '../responsive/web/example_routing.dart';
import 'ButtonMenu.dart';


class Menu extends StatelessWidget {
  
  const Menu({super.key });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: menuColorBackgr,
      elevation: 0,
      child: Column(
        children: [
          InkWell(
            onTap: (){Navigator.of(context).pushNamed('/');},
            child:const DrawerHeader(
            child: null,
            decoration: BoxDecoration(
                    color: menuColorBackgr,
                    image: DecorationImage(
                      image: AssetImage("/images/logoApp.png")),
          ))
          ),
          ButtonMenu(icono: Icons.add_task, texto:'E X P O R T   S E L E C T E D\nD A T A ', answer: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const ExampleRoutingDesktop()));}), 
          ButtonMenu(icono: Icons.file_download, texto:'E X P O R T   A L L  D A T A ', answer: (){Navigator.of(context).pushNamed('/');}),
          ButtonMenu(icono: Icons.settings, texto:'S E T T I N G S', answer: (){debugPrint('3');}),
          ButtonMenu(icono: Icons.info, texto:'A B O U T', answer: (){debugPrint('4');}),
          ButtonMenu(icono: Icons.logout, texto:'L O G O U T', answer:(){debugPrint('5');}),
        ],
      ),
    );
  }
}