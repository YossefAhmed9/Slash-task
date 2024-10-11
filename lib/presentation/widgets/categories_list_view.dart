import 'package:flutter/material.dart';

import '../../data/models/categories_model.dart';
import '../../domain/bloc/cubit.dart';
import '../utils/styles.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: SlashCubit.get(context).categoriesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.black,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 3.5),
                          child: SlashCubit.get(context).icons[index],

                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  textAlign: TextAlign.center,
                  CategoriesModel.fromJson(SlashCubit.get(context).categories, index).name.toString(),
                  style: Styles.font14.copyWith(
textBaseline: TextBaseline.ideographic,

                    color: Colors.black,overflow: TextOverflow.ellipsis
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          );
        });
  }
}
