import 'package:flutter_components_lab/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({super.key});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {

  final _url = 'https://picsum.photos/300/300';
  final _imagePath = 'assets/images/landscape.jpeg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Image Widgets", showBack: true,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 300,
                      width: 300,
                      color: Colors.amber.shade300,
                      child: Image.asset(
                        _imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      height: 300,
                      width: 300,
                      color: Colors.amber.shade300,
                      child: Image.network(_url, fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Expanded(
                child: FadeInImage.assetNetwork(
                  fit: BoxFit.cover,
                  placeholder: _imagePath,
                  image: _url,
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage(_imagePath),
                    )
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.grey.shade300,
                      child: ClipOval(
                        child: Image.network(
                          _url,
                          //width: 80,
                          //height: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.person, size: 40);
                          },
                          loadingBuilder: (context, child, progress) {
                            if (progress == null) return child;
                            return const CircularProgressIndicator(strokeWidth: 2);
                          },
                        ),
                      ),
                    )
                  )
                ],
              ),
              Expanded(
                child: Placeholder(
                  color: Colors.amber,
                  strokeWidth: 2,
                  fallbackHeight: 100,
                  fallbackWidth: 100,
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
- Placeholder() Flutter’ın yerleşik (built-in) bir widget’ıdır ve henüz tasarımını yapmadığın alanları geçici olarak göstermek için kullanılır.
- Özellikle layout / UI tasarlarken “buraya bir şey gelecek” demenin yoludur.
🧱 Placeholder Nedir?
- Placeholder()
🔹 Ekranda gri bir kutu + çapraz çizgiler çizer
🔹 Gerçek widget yerine geçici alan tutar
🔹 Debug ve tasarım aşaması içindir
*/
