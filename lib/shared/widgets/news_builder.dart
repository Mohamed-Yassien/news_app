import 'package:flutter/material.dart';

import 'article_item.dart';

Widget newsBuilder(list, {bool isSearch = false}) {

  return list.isEmpty
      ?  isSearch ?  Container() :  const Center(
          child: CircularProgressIndicator(),
        )
      : ListView.separated(
          itemBuilder: (context, index) => articleItem(list[index], context),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20,
            ),
            child: Divider(
              color: Colors.grey[300],
              height: 1,
            ),
          ),
          itemCount: list.length,
          physics: const BouncingScrollPhysics(),
        );
}
