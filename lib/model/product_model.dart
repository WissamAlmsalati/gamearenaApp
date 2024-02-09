import 'dart:math';

class ProductModel{
  String name;
  String description;
  String image;
  double price;
  int? discount = 0;

  ProductModel({required this.name,required this.description,required this.image,required this.price, this.discount});

  static List<ProductModel> gpus = [
    ProductModel(
      name: 'Nvidia RTX 3080',
      description: 'Nvidia RTX 3080',
      image: 'https://www.nvidia.com/content/dam/en-zz/Solutions/geforce/ampere/rtx-3080/images/design/geforce-rtx-3080-1-960.jpg',
      price: 699.99,
      discount: 0,
    ),
    ProductModel(
      name: 'Nvidia RTX 3070',
      description: 'Nvidia RTX 3070',
      image: 'https://assets.hardwarezone.com/img/2022/03/geforce-rt-3090-ti.jpg',
      price: 499.99,
      discount: 0,
    ),
    ProductModel(
      name: 'Nvidia RTX 3060',
      description: 'Nvidia RTX 3060',
      image: 'https://images.nvidia.com/aem-dam/Solutions/geforce/ampere/rtx-3060-ti/geforce-rtx-3060-ti-product-gallery-full-screen-3840-3-bl.jpg',
      price: 299.99,
      discount: 0,
    ),
    ProductModel(
      name: 'Nvidia RTX 3050',
      description: 'Nvidia RTX 3050',
      image: 'assets/images/rtx3050.jpg',
      price: 199.99,
      discount: 0,
    ),
  ];
  static List<ProductModel> monitors = [
    ProductModel(
      name: 'Acer Predator X27',
      description: 'Acer Predator X27',
      image: 'https://www.acer.com/ac/en/US/content/predator-model/UM.HX0AA.004',
      price: 1999.99,
      discount: 0,
    ),
    ProductModel(
      name: 'Acer Predator X34',
      description: 'Acer Predator X34',
      image: 'https://www.acer.com/ac/en/US/content/predator-model/UM.CX0AA.P01',
      price: 999.99,
      discount: 0,
    ),
    ProductModel(
      name: 'Acer Predator X38',
      description: 'Acer Predator X38',
      image: 'https://www.acer.com/ac/en/US/content/predator-model/UM.TX0AA.001',
      price: 1499.99,
      discount: 0,
    ),
    ProductModel(
      name: 'Acer Predator X32',
      description: 'Acer Predator X32',
      image: 'https://www.acer.com/ac/en/US/content/predator-model/UM.JX0AA.P01',
      price: 2499.99,
      discount: 0,
    ),
  ];
  static List<ProductModel> keyboards = [
    ProductModel(
      name: 'Razer BlackWidow V3',
      description: 'Razer BlackWidow V3',
      image: 'https://www.razer.com/gaming-keyboards/razer-blackwidow-v3/RZ03-03540100-R3U1',
      price: 99.99,
      discount: 0,
    ),
    ProductModel(
      name: 'Razer BlackWidow V3 Pro',
      description: 'Razer BlackWidow V3 Pro',
      image: 'https://www.razer.com/gaming-keyboards/razer-blackwidow-v3-pro/RZ03-03530100-R3U1',
      price: 149.99,
      discount: 0,
    ),
    ProductModel(
      name: 'Razer BlackWidow V3 Mini',
      description: 'Razer BlackWidow V3 Mini',
      image: 'https://www.razer.com/gaming-keyboards/razer-blackwidow-v3-mini/RZ03-03540100-R3U1',
      price: 79.99,
      discount: 0,
    ),
    ProductModel(
      name: 'Razer BlackWidow V3 Tenkeyless',
      description: 'Razer BlackWidow V3 Tenkeyless',
      image: 'https://www.razer.com/gaming-keyboards/razer-blackwidow-v3-tenkeyless/RZ03-03540100-R3U1',
      price: 89.99,
      discount: 0,
    ),
  ];
  static List<ProductModel> mouses = [
    ProductModel(
      name: 'Razer DeathAdder V2',
      description: 'Razer DeathAdder V2',
      image: 'https://www.razer.com/gaming-mice/razer-deathadder-v2/RZ01-03210100-R3U1',
      price: 69.99,
      discount: 0,
    ),
    ProductModel(
      name: 'Razer DeathAdder V2 Pro',
      description: 'Razer DeathAdder V2 Pro',
      image: 'https://www.razer.com/gaming-mice/razer-deathadder-v2-pro/RZ01-03350100-R3U1',
      price: 79.99,
      discount: 0,
    ),
    ProductModel(
      name: 'Razer DeathAdder V2 Mini',
      description: 'Razer DeathAdder V2 Mini',
      image: 'https://www.razer.com/gaming-mice/razer-deathadder-v2-mini/RZ01-03350100-R3U1',
      price: 59.99,
      discount: 0,
    ),
    ProductModel(
      name: 'Razer DeathAdder V2 Tenkeyless',
      description: 'Razer DeathAdder V2 Tenkeyless',
      image: 'https://www.razer.com/gaming-mice/razer-deathadder-v2-tenkeyless/RZ01-03350100-R3U1',
      price: 49.99,
      discount: 0,
    ),
  ];
  static List<ProductModel> headphones = [
    ProductModel(
      name: 'Razer BlackShark V2',
      description: 'Razer BlackShark V2',
      image: 'https://www.razer.com/gaming-headsets/razer-blackshark-v2/RZ04-03230100-R3U1',
      price: 99.99,
      discount: 0,
    ),
    ProductModel(
      name: 'Razer BlackShark V2 Pro',
      description: 'Razer BlackShark V2 Pro',
      image: 'https://www.razer.com/gaming-headsets/razer-blackshark-v2-pro/RZ04-03220100-R3U1',
      price: 149.99,
      discount: 0,
    ),
    ProductModel(
      name: 'Razer BlackShark V2 Mini',
      description: 'Razer BlackShark V2 Mini',
      image: 'https://www.razer.com/gaming-headsets/razer-blackshark-v2-mini/RZ04-03220100-R3U1',
      price: 79.99,
      discount: 0,
    ),
    ProductModel(
      name: 'Razer BlackShark V2 Tenkeyless',
      description: 'Razer BlackShark V2 Tenkeyless',
      image: 'https://www.razer.com/gaming-headsets/razer-blackshark-v2-tenkeyless/RZ04-03220100-R3U1',
      price: 89.99,
      discount: 0,
    ),
  ];
  static List<ProductModel> desks = [
    ProductModel(
      name: 'Arozzi Arena',
      description: 'Arozzi Arena',
      image: 'https://www.arozzi.com/product/arena-gaming-desk/',
      price: 399.99,
      discount: 0,
    ),
    ProductModel(
      name: 'Arozzi Arena Pro',
      description: 'Arozzi Arena Pro',
      image: 'https://www.arozzi.com/product/arena-pro-gaming-desk/',
      price: 499.99,
      discount: 0,
    ),
    ProductModel(
      name: 'Arozzi Arena Mini',
      description: 'Arozzi Arena Mini',
      image: 'https://www.arozzi.com/product/arena-mini-gaming-desk/',
      price: 299.99,
      discount: 0,
    ),
    ProductModel(
      name: 'Arozzi Arena Tenkeyless',
      description: 'Arozzi Arena Tenkeyless',
      image: 'https://www.arozzi.com/product/arena-tenkeyless-gaming-desk/',
      price: 199.99,
      discount: 0,
    ),
  ];
    

    //////////////////////////////
 static List<ProductModel> getRandomProducts() {
    var random = Random();

    var randomGpu = gpus[random.nextInt(gpus.length)];
    var randomMonitor = monitors[random.nextInt(monitors.length)];
    var randomKeyboard = keyboards[random.nextInt(keyboards.length)];
    var randomMouse = mouses[random.nextInt(mouses.length)];
    var randomHeadphone = headphones[random.nextInt(headphones.length)];
    var randomDesk = desks[random.nextInt(desks.length)];

    return [randomGpu, randomMonitor, randomKeyboard, randomMouse, randomHeadphone, randomDesk];
  }
    //////////////////////////////
}