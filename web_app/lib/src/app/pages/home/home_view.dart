import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:web_app/src/app/constants.dart';
import 'package:web_app/src/app/navigator.dart';
import 'package:web_app/src/app/pages/home/home_controller.dart';
import 'package:web_app/src/app/widgets/app_bar.dart';
import 'package:web_app/src/app/widgets/app_drawer.dart';
import 'package:web_app/src/data/repositories/data_item_repository.dart';
import 'package:web_app/src/data/repositories/data_user_repository.dart';
import 'package:web_app/src/domain/entities/item.dart';

class HomeView extends View {
  final String typeFilter;

  HomeView(this.typeFilter);

  @override
  State<StatefulWidget> createState() {
    return _HomeViewState(
      HomeController(
        DataItemRepository(),
        DataUserRepository(),
        typeFilter,
      ),
    );
  }
}

class _HomeViewState extends ViewState<HomeView, HomeController> {
  _HomeViewState(super.controller);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu_rounded,
              size: size.width * 0.025,
            ),
            onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          ),
        ),
        toolbarHeight: size.height * 0.12,
        title: const CengdenAppBar(),
        iconTheme: IconThemeData(color: kPrimaryColor),
      ),
      body: ControlledWidgetBuilder<HomeController>(
        builder: (context, controller) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: controller.isGetItemsFetched
                  ? Column(
                      children: [
                        Column(
                          children: [
                            for (int index = controller.startIndex; index < controller.endIndex; index++)
                              _ItemContainer(item: controller.items[index])
                          ],
                        ),
                        SizedBox(height: 20),
                        controller.items.length > controller.endIndex
                            ? ElevatedButton(
                                onPressed: controller.setNextPage,
                                child: Text('Next Page'),
                              )
                            : ElevatedButton(
                                onPressed: controller.setBackPage,
                                child: Text('Back Page'),
                              ),
                      ],
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          );
        },
      ),
    );
  }
}

class _ItemContainer extends StatelessWidget {
  const _ItemContainer({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CengdenNavigator.navigateToItemDetailsView(context, item);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                item.imageUrl,
                height: 150,
                width: 200,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    item.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    item.price,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColorPale,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
