import 'package:flutter/material.dart';
import 'package:meditation_app/models/item.dart';
import 'package:meditation_app/style/styleText.dart';
import 'package:audioplayers/audioplayers.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioPlayer audio = AudioPlayer();
  @override
  void initState(){
    audio = AudioPlayer();
    super.initState();
  }
  @override
  void dispose(){
    audio.dispose();
    super.dispose();
  }
  Future<void> playstop() async{
    await audio.stop();
  }
  Future<void> playMusic(int index) async {
   // await audio.dispose();
    try{
      await audio.stop();
      print('Ishlayapti');
      await audio.play(AssetSource(lists[index].music));

    }catch(e){
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
         duration: Duration(seconds: 2),
         backgroundColor: Colors.deepPurple.shade500,
         content:  Text('It works in one-hand mode.', style: TextStyle(color: Colors.white, fontSize: 20),)));
    }
    // for(int i=0; i<lists.length; i++){
    //   if(lists[i].isplay){
    //     await audio.play(AssetSource(lists[i].music));
    //   }
    // }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){
          showDialog(context: context, builder: (_){
            return AlertDialog(
              elevation: 20,
              shadowColor: Colors.blue.shade800,
              backgroundColor: Colors.deepPurple.shade300,
              content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height*0.3,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                     Center(child: Text(' 𝑖𝑡 𝑖𝑠 𝑓𝑜𝑟 𝑦𝑜𝑢 𝑓𝑟𝑜𝑚  ', style: TextStyle(fontSize: 30, color: Colors.white),)),
                     Center(child: Text(' 𝑆ℎ𝑎ℎ𝑏𝑜𝑧𝑏𝑒𝑘 ', style: TextStyle(fontSize: 30, color: Colors.white),)),
                     ],
                  ),
                ),
              ),
            );
          });
        }, icon: Icon(Icons.info, color: Colors.blue, size: 30,))],
        backgroundColor: Colors.deepPurple.shade500,
        elevation: 0,
        centerTitle: true,
        title: Text('Meditation', style: TextStyle(color: ThemeColor.lightColor, fontSize: 30, fontWeight: FontWeight.w300),),),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: lists.length,
        itemBuilder: (context,index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 8,left: 8,bottom: 0),
          child: Card(
            elevation: 50,
            shadowColor: Colors.deepPurple.shade800,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/3,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.white,
                        Colors.deepPurple.shade700]
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(lists[index].image),
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(lists[index].name, style: TextStyle(color: ThemeColor.lightColor, fontSize: 30),),
                    IconButton(onPressed: ()async {
                      if(lists[index].isplay==true){
                        setState(() {
                          lists[index].isplay = false;
                        });
                       playstop();
                      }else{
                      if(lists[index].isplay==false){
                        setState(() {
                          lists[index].isplay = true;
                          for(int i=0; i<lists.length; i++){
                            if(index!=i){
                              lists[i].isplay = false;
                            }
                          }
                        });
                        playMusic(index);}
                      }
                    }, icon: Icon(lists[index].isplay ?Icons.pause : Icons.play_arrow_rounded , color: Colors.white, size: 35,))
                  ],
                ),
              ),
            ),
          ),
        );
      },
      ),
    );
  }
}
