// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:unsplash_api/controllers/list_photos_controller.dart';
import 'package:unsplash_api/pages/photo_exhibition_page.dart';
import 'package:unsplash_api/widgets/photo_box.dart';

class ListPhotosPage extends StatelessWidget {
  final ListPhotosController controller;

  const ListPhotosPage({Key? key, required this.controller}) : super(key: key);

  Widget _buildScaffold(context) => Scaffold(
        appBar: AppBar(
          title: const Text('Exibição e compressão'),
          centerTitle: true,
        ),
        body: _buildContent(context),
      );

  Widget _buildContent(context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: GestureDetector(
                  onTap: () => controller.choosePhotos(),
                  child: const Text('Escolher imagens')),
            ),
          ),
          SizedBox(
            height: 250.0,
            child: Obx(
              () => ListView.builder(
                  itemExtent: 250.0,
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  cacheExtent: MediaQuery.of(context).size.width,
                  itemCount: controller.listLocalPhotos.length,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () => Get.to(() => PhotoExhibitionPage(
                            photo: controller.listLocalPhotos[index].photo!)),
                        child: PhotoBox(
                            photo: controller.listLocalPhotos[index].photo!),
                      )),
            ),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: SizedBox(
              width: 85.0,
              child: Obx(
                () => ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemExtent: 70.0,
                    cacheExtent: 100.0,
                    itemCount: controller.listLocalPhotos.length,
                    itemBuilder: (context, index) => PhotoBox(
                        photo: controller.listLocalPhotos[index].thumb!)),
              ),
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) => _buildScaffold(context);
}
