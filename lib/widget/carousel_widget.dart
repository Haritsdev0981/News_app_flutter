import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/model/article.dart';
import 'package:hello_world/screen/detailpage.dart';
import 'package:hello_world/utils/utils.dart';

class CarouselWidget extends StatefulWidget {
  final List<Article> articleList;

  CarouselWidget(this.articleList);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  late List<Widget> imageSlider;

  @override
  void initState() {
    //disni kita ingin membuat widget bernama imageSlider
    //kemudian imageSlider tersebut akan berisikan list dari articleList
    //Untuk mengkonversi daftar string di atas ke dalam daftar widget imageSlider
    //kita dapat emnggunakan metode map() dan toList(). Dengan metode map ()
    //kita dapat menggunakan setiap string untuk menghasilkan widget imageSlider baru
    //dan dengan metode toList(),
    //Anda dapat mengonversikan objek iterable yang dikembalikan oleh metode map()
    //ke dalam objek list sebenarnya.
    imageSlider = widget.articleList.map((vArticle) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                article: vArticle,
              ),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.all(10),
          //stack = untuk tumpukan widget
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: NetworkImage(vArticle.urlToImage),
                        fit: BoxFit.cover)),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [
                          0.1,
                          0.9
                        ],
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.white.withOpacity(0.1)
                        ])),
              ),
              Positioned(
                bottom: 30,
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vArticle.title,
                        style: titleArticleHeadline.copyWith(fontSize: 12),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        vArticle.author,
                        style: authorDateArticleHeadline.copyWith(fontSize: 10),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        items: imageSlider,
        options: CarouselOptions(
          autoPlay: true,
          viewportFraction: 1
        ),
      ),
    );
  }
}
