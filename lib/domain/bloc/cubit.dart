import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slash/domain/bloc/states.dart';
import 'package:slash/domain/network/remote/api_constants.dart';

import '../network/remote/dio_helper.dart';

class SlashCubit extends Cubit<SlashStates> {
  SlashCubit() : super(SlashInitState());

  static SlashCubit get(context) => BlocProvider.of(context);
  int navBarIndex=0;

void changeNavBarIndex(int index){
  navBarIndex=index;
  emit(ChangeNavBarIndexState());
}
  var banners;
  List bannersList=[];
  void getBanners() async {
    emit(SlashGetBannersLoadingState());
    await DioHelper.getData(url: ApiConstants.getBanners).then((value) {
      banners = value.data;
      bannersList.addAll(banners['data']);
      print('This is result $bannersList');
      emit(SlashGetBannersDoneState());
    }).catchError((error) {
      print(error.runtimeType);
      print(state);
      print(error.toString());
      emit(SlashGetBannersErrorState(error));
    });
  }

  var categories;
  List categoriesList=[];
  void getCategories() async {
    emit(SlashGetCategoriesLoadingState());
    await DioHelper.getData(url: ApiConstants.getCategory).then((value) {
      categories = value.data;
      categoriesList.addAll(categories['data']['data']);
      print('This is result $categoriesList');
      print('This is categories length ${categoriesList.length}');
      emit(SlashGetCategoriesDoneState());
    }).catchError((error) {
      print(error.runtimeType);
      print(error.toString());
      print(state);

      emit(SlashGetCategoriesErrorState(error));
    });
  }

  List icons=[
    IconButton(color: Colors.white,onPressed: (){}, icon: Icon(FontAwesomeIcons.mobileRetro,),),
    IconButton(color: Colors.white,onPressed: (){},icon: Icon(FontAwesomeIcons.diceFive),),
    IconButton(color: Colors.white,onPressed: (){},icon: Icon(FontAwesomeIcons.glasses)),
    IconButton(color: Colors.white,onPressed: (){},icon: Icon(FontAwesomeIcons.book)),
    IconButton(color: Colors.white,onPressed: (){}, icon: Icon(FontAwesomeIcons.shirt,),),
    IconButton(color: Colors.white,onPressed: (){},icon: Icon(FontAwesomeIcons.diceFive),),
    IconButton(color: Colors.white, onPressed: (){},icon: Icon(FontAwesomeIcons.glasses)),
    IconButton(color: Colors.white, onPressed: (){},icon: Icon(FontAwesomeIcons.book)),

    ];


  var products;
  List productsList=[];
  void getProducts() async {
    emit(SlashGetProductsLoadingState());
    await DioHelper.postData(url: ApiConstants.getProducts, data: {"text":"a"}).then((value) {
      products = value.data;
      productsList.addAll(products['data']['data'][0]);
      print('This is result $productsList');
      print('This is products length ${productsList.length}');
      emit(SlashGetProductsDoneState());
    }).catchError((error) {
      print(error.runtimeType);
      print(error.toString());
      print(state);

      emit(SlashGetProductsErrorState(error));
    });
  }


}
