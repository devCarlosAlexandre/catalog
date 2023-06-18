
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/Produto_model.dart';

class ProdutoWidget extends StatelessWidget {
  const ProdutoWidget({
    super.key,
    required this.model,
  });

  final ProdutoModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            //child: Image.network("${model.photoPath}"),
            child: CachedNetworkImage(
              imageUrl: "${model.imagem}",
              progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text("${model.name}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
  
  
  
  
} 

