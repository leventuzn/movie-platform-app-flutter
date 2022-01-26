import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movie_platform_app/models/content.dart';
import 'package:movie_platform_app/models/popular.dart';
import 'package:movie_platform_app/widgets/home_screen/popular_content.dart';

/// List
/// Displays list of popular contents according to given content type.
class PopularList extends StatefulWidget {
  PopularList({Key? key, required this.contentType}) : super(key: key);

  final ContentType contentType;

  @override
  State<PopularList> createState() => _PopularListState();
}

class _PopularListState extends State<PopularList> {
  List<Popular> populars = List.empty(growable: true);
  int _page = 1;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Content.ofType(widget.contentType).getPopulars(_page).then(
      (popularContents) {
        setState(() {
          populars.addAll(popularContents);
        });
      },
    );

    _scrollController.addListener(
      () async {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          var hasInternet = await InternetConnectionChecker().hasConnection;
          if (hasInternet) {
            Content.ofType(widget.contentType).getPopulars(++_page).then(
              (popularContents) {
                setState(() {
                  populars.addAll(popularContents);
                });
              },
            );
          }
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _contentName = Content.ofType(widget.contentType).name;

    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Popular ${_contentName}s',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 225,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              itemCount: populars.length,
              itemBuilder: (BuildContext context, int index) {
                return PopularContent(popular: populars[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
