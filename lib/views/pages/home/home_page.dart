import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:test_flutter/cores/providers/data_providers/category_data_provider.dart';
import 'package:test_flutter/views/pages/home/widgets/featured_today.dart';
import 'package:test_flutter/views/widgets/page_container.dart';
import 'package:test_flutter/cores/providers/category_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, Foodie!",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              "What's on your menu today?",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
        const SizedBox(height: 20),
        FeaturedToday(),
        const SizedBox(height: 20),

        Consumer(
          builder: ((context, ref, child) {
            final categories = ref.watch(categoriesDataProvider);
            final selectedActualCategory = ref.watch(selectedCategory);
            return categories.when(
              data: (data) {
                return SizedBox(
                  height: 40,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      final item = data[index];
                      final isSelected = item.name == selectedActualCategory;
                      return TextButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            isSelected
                                ? Theme.of(context).colorScheme.primary
                                : Colors.transparent,
                          ),
                        ),
                        onPressed: () {
                          ref.read(selectedCategory.notifier).state = item.name;
                        },
                        child: Text(
                          index > 0 ? item.name : "Tous",
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      );
                    }),
                  ),
                );
              },
              loading: () => Center(child: LoadingAnimationWidget.stretchedDots(color: Theme.of(context).colorScheme.primary, size: 30)),
              error: (error, _) => Center(child: Text(error.toString())),
            );
          }),
        ),
        const SizedBox(height: 20),
        Text(
          "Popular categories",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Consumer(
          builder: (context, ref, child) {
            final categories = ref.watch(categoriesDataProvider);
            return categories.when(
              data: (items) {
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,

                    shrinkWrap: true,

                    itemCount: 10,
                    itemBuilder: (context, index) {
                      final category = items[index];
                      return SizedBox(
                        width: 250,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Stack(
                              children: [
                                Positioned.fill(child: Image.network(category.thumbnail,fit: BoxFit.contain,)),
                                // Positioned.fill(child: Container(
                                //   decoration: BoxDecoration(
                                //     color: Colors.black38
                                //   ),
                                // )),
                                Positioned(bottom:0,left: 0,right: 0,child: Text(category.name,textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleSmall,))
                              ],
                            
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              loading: () =>  Center(child: LoadingAnimationWidget.stretchedDots(color: Theme.of(context).colorScheme.primary, size: 30)),

              error: (error, _) => Center(child: Text(error.toString())),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
          Text(
          "Popular categories",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
