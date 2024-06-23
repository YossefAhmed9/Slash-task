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
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.black,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: 3.5),
                          child: SlashCubit.get(context).icons[index],
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  '${CategoriesModel.fromJson(SlashCubit.get(context).categories, index).name.toString()}',
                  style: Styles.font14.copyWith(
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                )
              ],
            ),
          );
        });
  }
}
