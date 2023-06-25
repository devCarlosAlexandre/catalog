import 'package:flutter/material.dart';

class ProdutoWidget extends StatefulWidget {
  final String? imagem;
  final String? name;

  const ProdutoWidget({
    super.key,
    required this.imagem,
    required this.name,
  });

  @override
  State<ProdutoWidget> createState() => _ProdutoWidgetState();
}

class _ProdutoWidgetState extends State<ProdutoWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
              leading: const CircleAvatar(
                child:  Icon(Icons.photo),
              ),
              title: Text(widget.name ?? "")),
        ],
      ),
    );
  }
}
