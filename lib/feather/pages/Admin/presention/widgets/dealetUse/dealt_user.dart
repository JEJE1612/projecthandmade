import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../show_catg/widgets/custom_bar.dart';

class DealtAllUser extends StatefulWidget {
  const DealtAllUser({super.key});

  @override
  State<DealtAllUser> createState() => _DealtAllUserState();
}

class _DealtAllUserState extends State<DealtAllUser> {
  @override
  void initState() {
    getClientstream();
    searchword.addListener(_onSearchChange);
    super.initState();
  }

  _onSearchChange() {
    print('nnnnnnnnnnnnnnnn');
    searchResultlist();
  }

  TextEditingController searchword = TextEditingController();
  List allresult = [];
  List resultlist = [];
  List<String> emailblock = [''];
  getClientstream() async {
    var data = await FirebaseFirestore.instance
        .collection('user')
        .orderBy('name')
        .get();
    setState(() {
      allresult = data.docs;
    });
    searchResultlist();
  }

  searchResultlist() {
    var showResult = [];
    if (searchword.text != '') {
      for (var userSnapShot in allresult) {
        var name = userSnapShot['name'].toString().toLowerCase();
        if (name.contains(searchword.text.toLowerCase())) {
          showResult.add(userSnapShot);
        }
      }
    } else {
      showResult = List.from(allresult);
    }
    setState(() {
      resultlist = showResult;
    });
  }

  @override
  void dispose() {
    searchword.removeListener(_onSearchChange);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    getClientstream();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(
              text: "remove user",
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: CupertinoSearchTextField(
                controller: searchword,
              ),
            ),
            Expanded(
                child: ListViewDealtConsultant(
              resultlist: resultlist,
            )),
          ],
        ),
      ),
    );
  }
}

class ListViewDealtConsultant extends StatelessWidget {
  const ListViewDealtConsultant({
    super.key,
    required this.resultlist,
  });

  final List resultlist;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: 2,
      ),
      itemBuilder: (context, index) {
        return DealtItemslist(
          resultlist: resultlist,
          index: index,
        );
      },
      itemCount: resultlist.length,
    );
  }
}

class DealtItemslist extends StatelessWidget {
  const DealtItemslist({
    super.key,
    required this.resultlist,
    required this.index,
  });

  final List resultlist;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      child: ListTile(
        leading: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                resultlist[index]['image'],
              ),
            ),
          ),
        ),
        title: Text(
          resultlist[index]['name'],
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        trailing: CircleAvatar(
          backgroundColor: Colors.grey,
          child: IconButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection("user")
                  .doc(resultlist[index]['uid'])
                  .delete()
                  .then((_) {
                print('done');
              });

              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
