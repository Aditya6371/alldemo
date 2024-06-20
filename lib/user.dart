import 'package:alldemo/api/api.dart';
import 'package:alldemo/widget/drawer.dart';
import '../Model/model.dart';
import 'package:flutter/material.dart';

class userApi extends StatefulWidget {
  const userApi({super.key});
  static const routeName = "/userscreen";
  @override
  State<userApi> createState() => _userApiState();
}

class _userApiState extends State<userApi> {
  user? userdata;
  void getdata() async {
    var data = await Api.callGetApi('https://reqres.in/api/users?page=2');
    setState(() {
      userdata = user.fromJson(data);
    });
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text("User"),
        ),
        drawer: DrawerWidget(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: userdata == null
                ? const CircularProgressIndicator()
                : ListView.builder(
                    itemCount: userdata!.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Data userData = userdata!.data![index];
                      return ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CircleAvatar(
                            child: Image.network(userData.avatar ?? ''),
                          ),
                        ),
                        title:
                            Text("${userData.firstName} ${userData.lastName}"),
                        subtitle: Text(userData.email ?? ''),
                      );
                    },
                  ),
          ),
        ));
  }
}
