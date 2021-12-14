import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_application_1/api.dart';
import 'package:flutter_application_1/youtube_player.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

String _img = "https://i.ytimg.com/vi/W_BzCGhcwO8/mqdefault.jpg";
List<String> _listImg = List.filled(21, "0");
List<String> _listTitle = List.filled(21, "Love Babbar");
List<String> _listVideoId = List.filled(21, "WgMPrLX-zsA");
String _title = "Justin Roy";
String _description = "abcd";

class ApiData {
  Future<String> getData() async {
    var url = Uri.parse(VideoApi.api);
    http.Response response = await http.get(url);
    var responseData;
    if (response.statusCode == 200) {
      responseData = json.decode(response.body);
    }
    // This Loop Add the thumbnails Imgages..
    for (int i = 0; i < _listImg.length; i++) {
      _listImg[i] =
          responseData["items"][i]["snippet"]["thumbnails"]["medium"]["url"];
    }
    // This Loop Add the Title..
    for (int i = 0; i < _listTitle.length; i++) {
      _listTitle[i] = responseData["items"][i]["snippet"]["title"];
    }
    // This Loop Add the VideoId..
    for (int i = 0; i < _listVideoId.length; i++) {
      _listVideoId[i] = responseData["items"][i]["id"]["videoId"];
    }
    return "welcome";
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  ApiData apiData = ApiData();
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _getDataFromInternet();
  }

  _getDataFromInternet() async {
    await apiData.getData();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const CircularProgressIndicator(
            strokeWidth: 2.0,
          )
        : Scaffold(
            appBar: AppBar(
              title: Text("data"),
            ),
            body: ListView.builder(
                itemCount: _listImg.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 150,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        cachedImg(index),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Text(
                            _listTitle[index],
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          );
  }

  Widget cachedImg(int indx) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => YoutubePlayerScreen(
                _listImg[indx], _listTitle[indx], _listVideoId[indx]),
          ),
        );
      },
      child: CachedNetworkImage(
        height: 180,
        width: 180,
        imageUrl: _listImg == null ? _img : _listImg[indx],
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
