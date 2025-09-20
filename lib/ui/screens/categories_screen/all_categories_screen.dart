import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../framework/providers/all_custom_categories_provider.dart';
import '../../../framework/providers/all_default_categories_provider.dart';
import '../../utils/themes/app_assets.dart';

class AllCategoriesScreen extends ConsumerWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var allDefaultCategories = ref.watch(allDefaultCategoriesProvider);
    var allCustomCategories = ref.watch(allCustomCategoriesProvider);
    List<String> defaultCategoriesImages = [
      AppAssets.hostel,
      AppAssets.colleges,
      AppAssets.mess,
      AppAssets.sports,
      AppAssets.gym,
      AppAssets.hospital,
      AppAssets.parking,
      AppAssets.canteen,
      AppAssets.cart,
    ];
    return Scaffold(
      appBar: AppBar(title: Text('All Categories')),
      body: allDefaultCategories.when(
        data: (data) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Default Categories (Not Editable)',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return Card(
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  (index == 3 || index == 8)
                                      ? SvgPicture.asset(
                                          defaultCategoriesImages[index],
                                          height: constraints.maxHeight * 0.6,
                                          width: constraints.maxWidth * 0.8,
                                          fit: BoxFit.contain,
                                        )
                                      : Image.asset(
                                          defaultCategoriesImages[index],
                                          height: constraints.maxHeight * 0.6,
                                          width: constraints.maxWidth * 0.8,
                                          fit: BoxFit.contain,
                                        ),
                                  Text(
                                    data.messageList![index][1],
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              );
                            },
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Custom Categories',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                allCustomCategories.when(
                  data: (data1) {
                    if (data1.status == 400) {
                      return Center(child: Text('No Data Found'));
                    } else {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.9,
                        ),
                        itemCount: (data1.messageList?.length),
                        itemBuilder: (context, index) {
                          return Card(
                            child: LayoutBuilder(
                              builder:
                                  (
                                    BuildContext context,
                                    BoxConstraints constraints,
                                  ) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: data1.messageList![index][2],
                                          height: constraints.maxHeight * 0.6,
                                          width: constraints.maxWidth * 0.8,
                                          fit: BoxFit.contain,
                                        ),
                                        Text(
                                          data1.messageList![index][3],
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    );
                                  },
                            ),
                          );
                        },
                      );
                    }
                  },
                  error: (error, stackTrace) {
                    return Center(child: Text(error.toString()));
                  },
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(child: Text(error.toString()));
        },
        loading: () {
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
