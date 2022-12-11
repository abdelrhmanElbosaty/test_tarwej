import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tarwej/di.dart';
import 'package:test_tarwej/features/main_home/data/models/all_section/api_all_section_result.dart';
import 'package:test_tarwej/features/main_home/ui/user_home/home_cubit.dart';
import 'package:test_tarwej/utils/app_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatelessWidget {
  final String phoneNumber;

  const HomePage({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildApBar(),
      body: BlocProvider(
        create: (context) {
          return HomeCubit(injector())..getAllCategory();
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
    'Bags',
    'Accessories',
    'Self_Care',
    'Jewellery',
    'Furniture',
    'Furniture',
    'Bags',
    'Accessories',
    'Self_Care',
    'Jewellery',
    'sdfsdfsdfdsfsde',
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        const SizedBox(
          height: 16,
        ),
        BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is HomeCategoryError) {
              print(state.errorMessage);
            }
          },
          builder: (context, state) {
            if (state is HomeCategorySuccess) {
              return SizedBox(
                height: 90,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return _buildFirstSectionItem(
                        category: state.category[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 8,
                    );
                  },
                  itemCount: state.category.length,
                ),
              );
            } else {
              return SizedBox();
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
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _buildStoreSectionItem();
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 8,
                );
              },
              itemCount: 9,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        // Ads
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              _buildSideTitle('Ads'),
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
            height: 320,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _buildAdsSectionItem();
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 8,
                );
              },
              itemCount: 9,
            ),
          ),
        ),
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
        Padding(
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
                  return _buildAdsSectionItem();
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        // Most Sailed
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              _buildSideTitle('Most Sailed'),
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
            height: 320,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _buildAdsSectionItem();
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 8,
                );
              },
              itemCount: 9,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        // best Sale
        _buildEntireSectionWithTitle(),
        const SizedBox(
          height: 16,
        ),
        // Most Sailed
      ],
    );
  }

  Widget _buildEntireSectionWithTitle() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              _buildSideTitle('best Sales'),
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
            height: 320,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _buildAdsSectionItem();
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 8,
                );
              },
              itemCount: 9,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFirstSectionItem({required Category category}) {
    return Column(
      children: [
        FadeInImage.assetNetwork(
          image: category.thumbnail!,
          placeholder: 'assets/images/image.png',
          width: 45,
          height: 45,
          fit: BoxFit.fill,
        ),
        Text(category.enName!),
      ],
    );
  }

  Widget _buildStoreSectionItem() {
    return Container(
      width: 220,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.ac_unit,
              color: Colors.black,
              size: 68,
            ),
            const Text(
              'Jewellery',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Text('Jewellery'),
            const Spacer(),
            RatingBarIndicator(
              itemBuilder: (context, index) {
                return const Icon(
                  Icons.star,
                  color: Colors.amber,
                );
              },
              itemCount: 5,
              rating: 2.5,
              itemSize: 18,
            ),
            const SizedBox(
              height: 4,
            ),
            const Text('New Damietta'),
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

  Widget _buildAdsSectionItem() {
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
                Image.asset('assets/images/image.png', fit: BoxFit.cover),
                Container(
                  height: 34,
                  width: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  child: const Icon(Icons.heart_broken),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsetsDirectional.only(end: 16),
              child: Text(
                'Jewellerysfdfsdfsddsdsds',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  color: Colors.green,
                ),
                children: [
                  TextSpan(
                    text: '280 L.E',
                  ),
                  WidgetSpan(
                      child: SizedBox(
                    width: 16,
                  )),
                  TextSpan(
                    text: '480 L.E',
                    style: TextStyle(
                        color: Colors.orange,
                        decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
            ),
            Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.ac_unit,
                  color: Colors.black,
                  size: 54,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'New Damietta',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'New Damietta',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'New Damiettasdfs dfdfdsfds',
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
