import 'package:flutter/material.dart';
import 'package:movie_api/screen/modal/movie_modal.dart';
import 'package:movie_api/screen/provider/movie_provider.dart';
import 'package:provider/provider.dart';


class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  MovieProvider? movieProviderfalse;
  MovieProvider? movieProvidertrue;
  @override
  Widget build(BuildContext context) {
    movieProviderfalse=Provider.of<MovieProvider>(context,listen: false);
    movieProvidertrue=Provider.of<MovieProvider>(context,listen: true);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: double.infinity,
              child: TextField(
                controller: movieProviderfalse!.txtserch,
                decoration: InputDecoration(
                    hintText: "Enter the movie name",
                    helperStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(
                        color: Colors.white54, fontSize: 14),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    prefixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          movieProvidertrue!.getData();
                        });
                      },
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    )),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 20,),



          FutureBuilder(
            builder: (context, snapshot) {

              if(snapshot.hasError)
                {
                  return Text("${snapshot.error}");

                }
              else if(snapshot.hasData)
                {
                  Movie? movie=snapshot.data;
                  return Expanded(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: Expanded(
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                          itemBuilder: (context, index) {
                          return Expanded(
                            child: Column(
                                children: [
                                  Container(
                                    height: 170,
                                    width: 160,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        border: Border.all(color: Colors.black12, width: 1)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 120,
                                            width: 160,
                                            child: Image.network(
                                              "${movie!.d![index].i?.imageUrl}",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text("Id :-${movie!.d![index]. id}",style: TextStyle(color: Colors.white54),),
                                          ],
                                        ),
                                        Text("Rank No:- ${movie!.d![index].rank}",style: TextStyle(color: Colors.white70),)
                                      ],
                                    ),
                                  )



                                ],
                              ),
                          );


                        },itemCount: movie!.d?.length,),
                      ),
                    ),
                  );

                }
              return Center(
                child: Container(
                  height: 50,
                    width: 50,
                    child: CircularProgressIndicator()),
              );

            },
            future: movieProviderfalse!.getData(),
          ),
        ],
      ),
    ));
  }
}
