import 'package:flutter/material.dart';
import 'package:flutter_application_1/functions/fetchrates.dart';
import '../models/rates.dart';

class Home extends StatefulWidget {
 const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formkey = GlobalKey<FormState>();
  late Future<RatesModle> result;

  @override
  void initState() {
    super.initState();
    result = fetchrates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
/*------------------------------------------------*/
      body: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: FutureBuilder<RatesModle>(
                future: result,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                  {
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  return Text(snapshot.data!.rates.toString(),style:const TextStyle(color :Colors.white),);
                }
                
                ),
          ),
        ),
      ),
/*------------------------------------------------*/
    /*  bottomNavigationBar:
          Center(child: Container(color: Colors.black, child:const Text('data'))),*/
    );
  }
}
