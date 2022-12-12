import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tarwej/di.dart';
import 'package:test_tarwej/features/main_home/data/models/all_section/api_ads_result.dart';
import 'package:test_tarwej/features/main_home/data/models/all_section/api_all_section_result.dart';
import 'package:test_tarwej/features/main_home/ui/user_home/home_cubit.dart';
import 'package:test_tarwej/utils/app_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:test_tarwej/features/main_home/data/models/all_section/api_featured_stores_result.dart'
    as store;

class HomePage extends StatelessWidget {
  final String phoneNumber;

  const HomePage({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildApBar(),
      body: BlocProvider(
        create: (context) {
          return HomeCubit(injector(), injector(), injector())
            ..getAllCategory()
            ..getFeaturedStores()
            ..getAds();
        },
        child: const SafeArea(child: UserHome()),
      ),
    );
  }

  AppBar _buildApBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: const Icon(
        Icons.store_mall_directory_outlined,
        color: Colors.greenAccent,
        size: 42,
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 28,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_active,
              color: Colors.black,
              size: 28,
            )),
      ],
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24))),
      elevation: 0,
    );
  }
}

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  List<String> tabs = [
    'Bags',
    'Accessories',
    'Self_Care',
    'Jewellery',
    'Furniture',
  ];

  int _selectedIndex = 0;

  Future<void> _onRefresh() async {
    BlocProvider.of<HomeCubit>(context)
      ..getAllCategory()
      ..getAllCategory()
      ..getAds();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _onRefresh(),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          const SizedBox(
            height: 16,
          ),
          BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state.category.isFailure) {
                print(state.errorMessage);
              }
            },
            builder: (context, state) {
              if (state.category.isSuccess) {
                return SizedBox(
                  height: 120,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return _buildFirstSectionItem(
                          category: state.category.data![index]);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 8,
                      );
                    },
                    itemCount: state.category.data!.length,
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          const SizedBox(
            height: 16,
          ),
          // Stores
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildSideTitle('Stores'),
                const Spacer(),
                _buildSideButton(
                  title: 'see more',
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 220,
              child: BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) {
                  if (state.store.isFailure) {
                    print(state.errorMessage);
                  }
                },
                builder: (context, state) {
                  if (state.store.isSuccess) {
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return _buildStoreSectionItem(
                            store: state.store.data![index]);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 8,
                        );
                      },
                      itemCount: state.store.data!.length,
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ),
         _buildEntireAdsSectionWithTitle('Ads'),
          const SizedBox(
            height: 16,
          ),
          // Arrived
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildSideTitle('Arrived'),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 34,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: _buildTabBar(
                        tab: tabs[index],
                        isSelected: _selectedIndex == index ? true : false),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 8,
                  );
                },
                itemCount: tabs.length,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state.ads.isSuccess) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child:
                      // GridView.builder(
                      //   physics: const NeverScrollableScrollPhysics(),
                      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      //     crossAxisCount: 2,
                      //     crossAxisSpacing: 8,
                      //     mainAxisSpacing: 8,
                      //     childAspectRatio: 2 / 3,
                      //   ),
                      //   itemCount: 8,
                      //   itemBuilder: (context, index) {
                      //     return _buildAdsSectionItem();
                      //   },
                      // ),
                      Column(
                    children: [
                      AlignedGridView.count(
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return _buildAdsSectionItem(
                              ads: state.ads.data![index]);
                        },
                      ),
                    ],
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          const SizedBox(
            height: 16,
          ),
          // Most Sailed
          // BlocConsumer<HomeCubit, HomeState>(
          //   listener: (context, state) {
          //     // TODO: implement listener
          //   },
          //   builder: (context, state) {
          //     if (state.ads.isSuccess) {
          //       return Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 16),
          //         child: SizedBox(
          //           height: 300,
          //           child: ListView.separated(
          //             scrollDirection: Axis.horizontal,
          //             itemBuilder: (context, index) {
          //               return _buildAdsSectionItem(
          //                   ads: state.ads.data![index]);
          //             },
          //             separatorBuilder: (context, index) {
          //               return const SizedBox(
          //                 width: 8,
          //               );
          //             },
          //             itemCount: 9,
          //           ),
          //         ),
          //       );
          //     } else {
          //       return const SizedBox();
          //     }
          //   },
          // ),
          _buildEntireAdsSectionWithTitle('Most Sailed'),
          const SizedBox(
            height: 16,
          ),
          // best Sale
          _buildEntireAdsSectionWithTitle('Best Sales'),
          const SizedBox(
            height: 16,
          ),
          // Most Sailed
        ],
      ),
    );
  }

  Widget _buildEntireAdsSectionWithTitle(title) {
    return Column(
      children: [
        const SizedBox(height: 16,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              _buildSideTitle(title),
              const Spacer(),
              _buildSideButton(
                title: 'see more',
                onTap: () {},
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state.ads.isSuccess) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return _buildAdsSectionItem(ads: state.ads.data![index]);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 8,
                      );
                    },
                    itemCount: 9,
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }

  Widget _buildFirstSectionItem({required Category category}) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(35)),
          child: FadeInImage.assetNetwork(
            image: category.thumbnail!,
            placeholder: 'assets/images/image.png',
            width: 70,
            height: 70,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          width: 100,
          child: Text(
            category.enName!,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildStoreSectionItem({required store.Store store}) {
    return Container(
      width: 220,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: FadeInImage.assetNetwork(
                image: store.user!.profilePicture!,
                placeholder: 'assets/images/image.png',
                width: 40,
                height: 40,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              store.user!.userName!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              store.bio!,
              maxLines: 3,
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            ),
            const Spacer(),
            RatingBarIndicator(
              itemBuilder: (context, index) {
                return const Icon(
                  Icons.star,
                  color: Colors.amber,
                );
              },
              itemCount: 5,
              rating: store.rate!.toDouble(),
              itemSize: 18,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(store.city!.enName!),
            const Spacer(),
            _buildSideButton(
              title: 'Follow',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdsSectionItem({required Ads ads}) {
    return Container(
      width: 220,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                FadeInImage.assetNetwork(
                  image: ads.store?.image ?? '',
                  height: 140,
                  width: double.infinity,
                  placeholder: 'assets/images/image.png',
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 34,
                    width: 34,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    child: const Icon(Icons.heart_broken),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 16),
              child: Text(
                ads.title!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.green,
                ),
                children: [
                  ads.offerPrice == null
                      ? TextSpan(
                          text: '${ads.price?.toString()} LE',
                        )
                      : TextSpan(
                          text: '${ads.offerPrice?.toString()} LE',
                        ),
                  ads.offerPrice == null
                      ? const WidgetSpan(child: SizedBox())
                      : const WidgetSpan(
                          child: SizedBox(
                          width: 16,
                        )),
                  ads.offerPrice == null
                      ? const WidgetSpan(child: SizedBox())
                      : TextSpan(
                          text: '${ads.price?.toString()} LE',
                          style: const TextStyle(
                              color: Colors.orange,
                              decoration: TextDecoration.lineThrough),
                        ),
                ],
              ),
            ),
            const Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: FadeInImage.assetNetwork(
                    image: ads.store!.user!.profilePicture!,
                    placeholder: 'assets/images/image.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ads.title ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        ads.createdAt.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        ads.city?.enName ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar({required String tab, required bool isSelected}) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.greenAccent : Colors.white,
        border: Border.all(
            color: Colors.greenAccent, style: BorderStyle.solid, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          tab,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildSideButton({required title, required Function onTap}) {
    return AppButton(
        function: () {
          onTap();
        },
        title: title,
        fontSize: 16,
        buttonColor: Colors.greenAccent,
        height: 32,
        borderRadius: 4,
        fontWeight: FontWeight.normal);
  }

  Widget _buildSideTitle(String title) {
    return Title(
      color: Colors.white,
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }
}
