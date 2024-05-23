import 'package:countries_flag/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountriesFlagData extends StatelessWidget {
   CountriesFlagData({Key? key}) : super(key: key);

    Network network = Network();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white60,
        child: FutureBuilder(
          future: network.getFlagesData(),
          builder: (context, snapshot){
            if(!snapshot.hasData){
              return Center(child: Text("Loading..."),);
            }else{
              return ListView.builder(
                  itemCount: snapshot.data!.data.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                         height: height * .3,
                          width: width,
                          child: Column(
                            children: [
                              Container(
                                height: height * .25,
                                  child: SvgPicture.network(network.model!.data[index].flag.toString(),fit: BoxFit.cover,),),
                              Text(snapshot.data!.data[index].name.toString()),
                            Divider(thickness: 2,)
                            ],
                          )),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
