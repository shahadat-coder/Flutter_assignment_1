import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      darkTheme:ThemeData(primarySwatch: Colors.teal),
      color: Colors.cyan,
      home: HomeActivity(),
    );
  }
}
class HomeActivity extends StatelessWidget{
  const HomeActivity({super.key});

  MySnackBar(massege,context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(massege))
    );


  }


  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Ostad App"),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text:"Page-1",icon: Icon(Icons.access_alarms),),
              Tab(text:"Page-2",icon: Icon(Icons.account_balance_wallet_outlined),),
              Tab(text:"Page-3",icon: Icon(Icons.account_box_rounded),),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("Hello! I'm page-1"),),
            Center(child: Text("Hello! I'm page-2")),
            Center(child: Text("Hello! I'm page-3")),
          ],
        ),



        floatingActionButton: FloatingActionButton(
          onPressed: (){MySnackBar("Floting", context);},
          elevation: 10,
          child: Icon(Icons.add),
          backgroundColor: Colors.teal,


        ),


        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home"),
            BottomNavigationBarItem(icon: Icon(Icons.wallet),label:"Wallet"),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_sharp),label:"Profile"),
          ],
          onTap: (int Index){
            if(Index == 0){
              MySnackBar("Home", context);
            }
            if(Index == 1){
              MySnackBar("Wallet", context);
            }
            if(Index == 2){
              MySnackBar("Profile", context);
            }
          },
        ),

        drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                    padding: EdgeInsets.all(0),
                    child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(color: Colors.white),
                      accountName: Text("Md. Shahadat Hossain"),
                      accountEmail: Text ("info@gmail.com"),
                      currentAccountPicture: Image.network("https://scontent.fdac24-4.fna.fbcdn.net/v/t39.30808-6/338136872_937644247670348_7580779140609348408_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=174925&_nc_eui2=AeFQp431Ku414L8G-LTElV_IT_BrNUNN0tpP8Gs1Q03S2oAIlnN5GaA0Z9ilr356V-sa3XLjX6L9-_wcwoc54iD7&_nc_ohc=QtYf0lf-jB0AX8qBbx8&_nc_ht=scontent.fdac24-4.fna&oh=00_AfDPR4ddVElLadCJRdZq6MyGabNkR4Tc5WYeOcwwKS2aPw&oe=6481713A"),
                    )
                ),
                ListTile (title: Text("Setting"),leading: Icon(Icons.settings),),
                ListTile(title: Text("Notification"),leading: Icon(Icons.notification_add),),
                ListTile(title: Text("Store"),leading: Icon(Icons.store),),
                ListTile(title: Text("Help"),leading: Icon(Icons.help),),

              ],
            )
        ),
      ),
    );
  }

}
