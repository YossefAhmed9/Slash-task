import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/models/product_model.dart';
import '../../domain/bloc/cubit.dart';
import '../utils/styles.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: SizedBox(
              height: 200,
              width: 150,
              child: Container(
                decoration: BoxDecoration(color: Colors.grey.shade50,borderRadius: BorderRadius.circular(25)),
                child: Column(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 60,
                      child:  Align(
                        alignment: Alignment.topLeft,
                        child: Image.network(
                            '${ProductModel.fromJson(SlashCubit.get(context).products, index).image.toString()}'),
                      ),
                    ),

                    Text(
                      '${ProductModel.fromJson(SlashCubit.get(context).products, index).name.toString()}',
                      style: Styles.font20.copyWith(fontSize: 12,overflow: TextOverflow.ellipsis,),maxLines: 2,),
                    Row(
                      children: [
                        Text(
                          'EGP ',
                          style: Styles.font14.copyWith(
                              color: Colors.black),
                        ),
                        Text(
                          '${ProductModel.fromJson(SlashCubit.get(context).products, index).price.toString()}',
                          style: Styles.font14.copyWith(
                              color: Colors.black),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_circle,
                              color: Colors.black,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
