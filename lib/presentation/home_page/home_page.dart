import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slash/data/models/banners_model.dart';
import 'package:slash/data/models/categories_model.dart';
import 'package:slash/data/models/product_model.dart';
import 'package:slash/presentation/widgets/adjust_search.dart';
import 'package:slash/presentation/widgets/search_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../domain/bloc/cubit.dart';
import '../../domain/bloc/states.dart';
import '../utils/styles.dart';
import '../widgets/categories_list_view.dart';
import '../widgets/products_list_view.dart';
import '../widgets/see_more.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //final PageController? pageViewController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SlashCubit, SlashStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final controller = PageController(
            viewportFraction: 1.1, keepPage: false, initialPage: 5);

        List navbarList=["Home","Favorites","My Cart","Profile"];
        SlashCubit cubit = SlashCubit.get(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled,),label: navbarList[0]),
            BottomNavigationBarItem(icon: Icon(Icons.favorite,),label: navbarList[1]),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined,),label: navbarList[2]),
            BottomNavigationBarItem(icon: Icon(Icons.person,),label: navbarList[3]),
          ],
            currentIndex: 0,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey.shade600,

          ),
          appBar: AppBar(
            title: const Text(
              'Slash',
              style: Styles.font20,
            ),
            actions: [
              IconButton(
                  onPressed: () async {
                    cubit.getBanners();
                    print(cubit.banners.toString());
                  },
                  icon: Icon(FontAwesomeIcons.bell))
            ],
          ),
          body: cubit.banners == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: CustomScrollView(
                    shrinkWrap: true,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                Expanded(child: DefaultSearchBar()),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: AdjustSearch(),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.width * 0.36,
                                    child: PageView.builder(
                                      controller: controller,
                                      // itemCount: pages.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Image.network(
                                            BannersModel.fromJson(
                                                cubit.banners, index)
                                                .image,
                                            fit: BoxFit.fill,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                                  child: SmoothPageIndicator(
                                    controller: controller,
                                    count: cubit.bannersList.length,
                                    effect: ExpandingDotsEffect(
                                        dotWidth: 5,
                                        dotHeight: 5,
                                        dotColor: Colors.grey.shade400,
                                        activeDotColor: Colors.black),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Categories',
                                          style: Styles.font20,
                                        ),
                                        Spacer(),
                                        SeeMore(),
                                      ],
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height:
                                      MediaQuery.of(context).size.width * 0.25,
                                      decoration: BoxDecoration(),
                                      child:CategoriesListView(),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'New Arrival',
                                          style: Styles.font22,
                                        ),
                                        Spacer(),
                                        SeeMore(),
                                      ],
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height:
                                      MediaQuery.of(context).size.height * 0.18,
                                      child: ProductsListView(),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height:
                                      MediaQuery.of(context).size.height * 0.18,
                                      child: ProductsListView(),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height:
                                      MediaQuery.of(context).size.height * 0.18,
                                      child: ProductsListView(),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
/*
* cubit.result==null ? Center(child: CircularProgressIndicator(),) :  */
