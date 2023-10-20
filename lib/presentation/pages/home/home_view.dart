import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:komunitas_belajar/config/util/app_theme.dart';
import 'package:komunitas_belajar/config/util/custom_widget.dart';
import 'package:komunitas_belajar/config/util/utility.dart';
import 'package:komunitas_belajar/data/model/product.dart';
import 'package:komunitas_belajar/presentation/widget/custom_tab.dart';
import 'package:komunitas_belajar/presentation/widget/custom_text_field.dart';
import 'package:komunitas_belajar/presentation/widget/spacing.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var textFieldController = TextEditingController();

  int indexSelected = 0;

  List<Product> listProduct = generateListProduct;

  List<String> listFilter = [
    'Semua',
    'Makanan',
    'Minuman Dingin',
    'Minuman Panas',
    'Cemilan',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.bgColor,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Container(
            color: AppTheme.white,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    placeholderText: 'Cari menu disini...',
                    textFieldController: textFieldController,
                  ),
                ),
                horizontalSpacing(8),
                SizedBox(
                  width: 48,
                  height: 48,
                  child: MaterialButton(
                    color: AppTheme.white,
                    elevation: 0,
                    padding: const EdgeInsets.all(4),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                      side: BorderSide(color: AppTheme.blackShadow, width: 1),
                    ),
                    onPressed: () {},
                    child: ImageIcon(
                      AssetImage(imagePaths('ic_search')),
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 48,
            child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(
                    left: 16, right: 8, top: 16, bottom: 4),
                scrollDirection: Axis.horizontal,
                itemCount: listFilter.length,
                itemBuilder: (context, index) {
                  return _buildListFilter(listFilter[index], index);
                }),
          ),
          verticalSpacing(),
          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.fromLTRB(
                  12, 8, 12, MediaQuery.of(context).padding.bottom + 16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: MediaQuery.of(context).size.width / 2 + 24,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: listProduct.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildListProduct(listProduct[index]);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListFilter(String filter, int index) {
    if (indexSelected == index) {
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: CustomTabActive(
          buttonTap: () {},
          textButton: filter,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: CustomTabInactive(
          buttonTap: () {
            setState(() {
              indexSelected = index;
            });
          },
          textButton: filter,
        ),
      );
    }
  }

  Widget _buildListProduct(Product product) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(4),
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: AppTheme.blackShadow,
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.width / 3 - 16,
              decoration: BoxDecoration(
                color: AppTheme.blue1,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                image: DecorationImage(
                    image: AssetImage(
                      imagePaths(product.imgPath),
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            verticalSpacing(8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                product.name,
                style: AppTheme.subtitle2(color: AppTheme.blue1),
              ),
            ),
            verticalSpacing(2),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              height: 32,
              child: Text(
                product.desc,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTheme.body3(color: AppTheme.blackColor2),
              ),
            ),
            verticalSpacing(8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                Utility.toNumberPoint(product.price),
                style: AppTheme.subtitle1(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
