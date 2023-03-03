import 'package:flutter/material.dart';
import 'Product.dart';
import '_payment_cart_model.dart';

class Res {
  static final String lamp = "assets/images/lamp.png";
  static final String chair = "assets/images/chair.png";
  static final String sofa = "assets/images/sofa.png";
  static final String table = "assets/images/table.png";
  static final String table1 = "assets/images/table_1.png";
  static final String giuong = "assets/images/giuong.png";
  static final String tu = "assets/images/tu.png";
  static final String tranh = "assets/images/tranh.png";

  static List<Product> products() {
    List<Product> productList = [];
    productList.add(new Product(
        description:
            '''Sofa 3 chỗ từ bộ sưu tập Osaka mang nét hiện đại và thơ mộng của Nhật Bản, tạo nên một không gian sống độc đáo đầy sang trọng. Sản phẩm có phần chân bằng inox màu gold chắc chắn, phần nệm được bọc vải và có thể tháo rời được. Sofa 3 chỗ Osaka mẫu 1 vải 29 không chỉ mang đến thiết kế tinh tế, sang trọng mà còn cho người ngồi cảm giác thoải mái, dễ chịu.''',
        images: [
          'https://nhaxinh.com/wp-content/uploads/2022/08/SOFA-3-CHO-OSAKA-MAU-1-VAI-29-600x400.jpg',
          'https://nhaxinh.com/wp-content/uploads/2021/10/sofa-osaka-3-cho-3101896-2-600x354.jpg',
          'https://nhaxinh.com/wp-content/uploads/2021/10/sofa-osaka-3-cho-3101896-4-600x354.jpg',
        ],
        info: "D2060 - R750 - C820/400 mm\nChân Inox màu gold, tay gỗ, bọc vải, nệm ngồi tháo rời",
        price: 28900000,
        tag: "sofa",
        title: 'Sofa 3 chỗ Osaka mẫu 1 vải 29'));
    productList.add(
      Product(
          description: '',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2021/10/tranh-3-101242-600x400.jpg',
            'https://nhaxinh.com/wp-content/uploads/2022/09/Ban-Console-Addict-600x387.jpg',
          ],
          info: "D600 - C800 mm\nKhung gỗ, vải Canvas",
          price: 5900000,
          tag: "tranh",
          title: "Tranh Leav Rose mẫu 2"),
    );
    productList.add(
      Product(
          description:
              'Bàn ăn nhập khẩu Suri đến từ Pháp có thiết kế độc đáo với mặt bàn được ghép nối từ những thanh gỗ tự nhiên. Đây sẽ là lựa chọn đặc biệt phù hợp với những không gian phòng ăn mang phong cách retro, cổ điển.',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2021/10/nha-xinh-ban-an-suri-1000-600x400.jpg',
            'https://nhaxinh.com/wp-content/uploads/2021/10/nha-xinh-ban-an-suri-nghieng-500.jpg',
          ],
          info: "D1600-R780-C760 mm\nChân kim loại, gỗ ghép",
          price: 13750000,
          tag: "table",
          title: "Bàn ăn Suri"),
    );
    productList.add(
      Product(
          description: '',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2021/10/giuong_iris_1m6_stone3.jpg',
            'https://nhaxinh.com/wp-content/uploads/2021/10/phong-ngu-giuong-hoc-keo-iris-4-600x400.jpg',
          ],
          info: "D2000- R1600- C1112 mm\nKhung gỗ MFC, bọc vải - 4 hộc kéo",
          price: 14900000,
          tag: "giuong",
          title: "Giường Hộc Kéo Iris 1M6 Vải Belfast 41"),
    );
    productList.add(
      Product(
          description:
              'Là sự kết hợp của màu trắng tinh khôi với màu gỗ ấm áp trên nền những đường nét thiết kế hiện đại, trang nhã. Harmony được đánh giá rất cao cả về kiểu dáng và công năng, đó sẽ là niềm tự hào của gia chủ khi khách đến thăm nhà.',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2021/10/tu-ao-harmony-7-600x400.jpg',
            'https://nhaxinh.com/wp-content/uploads/2021/10/sp_phong_ngu_harmony2_l-3.jpg',
            'https://nhaxinh.com/wp-content/uploads/2021/10/tu-ao-harmony-4-3-600x400.jpg',
          ],
          info: "D980 - R630 - C1980\nGỗ sồi+ tràm, MDF sơn trắng",
          price: 29900000,
          tag: "tu",
          title: "Tủ áo Harmony"),
    );
    productList.add(
      Product(
          description:
              'Thêm điểm nhấn về kết cấu cho mặt bàn của bạn với Đèn bàn Savona tinh xảo, có đế đèn bằng sứ trắng có chạm khắc hình xoắn ốc. Vẻ ngoài đặc biệt của nó được thể hiện bởi đế đèn hoàn thiện bằng đồng cổ và một chao đèn màu kem đơn giản.',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2021/11/103105-den-ban-savona-ma-trang-600x400.jpg',
            'https://nhaxinh.com/wp-content/uploads/2021/11/103105-den-ban-savona-ma-trang-2-600x400.jpg',
          ],
          info: "D260 - R580 - C660 mm\nThân gốm-chụp vải",
          price: 19670000,
          tag: "den",
          title: "Đèn bàn Savona"),
    );
    productList.add(
      Product(
          description: '',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2022/10/TRANH-ABS-FAC-MDF-GL-WH-BL-ASS2-18610J-600x387.jpg',
            'https://nhaxinh.com/wp-content/uploads/2022/10/TRANH-ABS-FAC-MDF-GL-WH-BL-ASS2-18610J-1-600x387.jpg',
            'https://nhaxinh.com/wp-content/uploads/2022/10/TRANH-ABS-FAC-MDF-GL-WH-BL-ASS2-18610J-2-600x387.jpg',
          ],
          info: "D600 - R40 - C900 mm\nGỗ công nghiệp, kính",
          price: 41900000,
          tag: "tranh",
          title: "Tranh ABS kính trắng / đen mẫu 2 18610J"),
    );

    productList.add(new Product(
        description:
            '''Sự đơn giản, tinh tế, sang trọng và không kém phần nổi bật của chiếc Sofa mang dòng máu bất diệt Scandinavian này với lần lượt các phiên bản màu từ tối tới sáng bật Pastel sẽ mang lại các sắc màu không thể lẫn vào đâu và đa dạng cho từng không gian sống nhà bạn. Thiết kế vuông vức, thanh mảnh nhẹ nhàng là sự pha trộn giữa vững chãi và nhẹ nhàng là tất cả những yếu tố thiết yếu hội tụ ở chiếc sofa này.''',
        images: [
          'https://nhaxinh.com/wp-content/uploads/2021/10/102437-sofa-penny-3-cho-dacognac-1-600x400.jpg',
          '',
        ],
        info: "D2400 - R880 - C850\nChân kim loại sơn, nệm bọc da tự nhiên, nệm ngồi & lưng rời",
        price: 61860000,
        tag: "sofa",
        title: "Sofa 3 chỗ PENNY da cognac 509MB"));
    productList.add(new Product(
        description:
            '''Sự đơn giản, tinh tế, sang trọng và không kém phần nổi bật của chiếc Sofa mang dòng máu bất diệt Scandinavian này với lần lượt các phiên bản màu từ tối tới sáng bật Pastel sẽ mang lại các sắc màu không thể lẫn vào đâu và đa dạng cho từng không gian sống nhà bạn. Thiết kế vuông vức, thanh mảnh nhẹ nhàng là sự pha trộn giữa vững chãi và nhẹ nhàng là tất cả những yếu tố thiết yếu hội tụ ở chiếc sofa này.''',
        images: [
          'https://nhaxinh.com/wp-content/uploads/2021/10/102648-sofa-penny-3-cho-vai-xanh-xam2-600x400.jpg'
        ],
        info: "D2400 - R880 - C850\nChân kim loại sơn, nệm bọc vải xanh MB 08",
        price: 26900000,
        tag: "sofa",
        title: "Sofa 3 chỗ PENNY vải xanh MB 08"));
    productList.add(new Product(
        description:
            '''Sofa Bridge 3 chỗ với thiết kế vượt thời gian, sử dụng chất liệu gỗ sồi đặc và da bò tự nhiên, sofa Bridge là điểm nhấn đẳng cấp trong phòng khách của bạn. Đặc biệt, phần tay vịn được hoàn thiện vô cùng tinh xảo kết hợp với kết cấu vô cùng chắn chắn giúp cho sofa Bridge tạo cảm xúc gần gũi, tự nhiên và thoái mái khi sử dụng. Sản phẩm có các màu sắc hoàn thiện gỗ sồi sáng và trầm và nhiều màu da khác nhau để lựa chọn. Sofa Bridge 3 chỗ là 1 lựa chọn sáng gia cho phong cách nội thất Bắc Âu.''',
        images: [
          'https://nhaxinh.com/wp-content/uploads/2021/10/sofa-bride-go-goi-da-bo-that-cao-cap-hien-dai-dang-cap-sang-trong-600x400.jpg',
          'https://nhaxinh.com/wp-content/uploads/2021/10/500-73906-nha-xinh-phong-khach-sofa3cho-bridge2.jpg',
          'https://nhaxinh.com/wp-content/uploads/2021/10/500-73906-nha-xinh-phong-khach-sofa3cho-bridge4.jpg',
          'https://nhaxinh.com/wp-content/uploads/2021/10/500-nhaxinh-phong-khach-sofa-bridge.jpg'
        ],
        info:
            "D2100 - R900 - C750 mm\nKhung gỗ sồi đặc tự nhiên nhập khẩu từ Mỹ - Da Ý tự nhiên cao cấp",
        price: 10960000,
        tag: "sofa",
        title: "Sofa Bridge 3 chỗ hiện đại da đen"));
    productList.add(
      Product(
          description: '',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2021/09/sofa_vai_poppy_mau_hong_12_goc_trai-600x399.jpeg',
            'https://nhaxinh.com/wp-content/uploads/2021/09/cam-hung-he-sang-sofa-poppy35-600x400.jpeg'
          ],
          info: "D2400/1350 - R830 - C700 mm\nChân gỗ - Vải cao cấp",
          price: 29900000,
          tag: "sofa",
          title: "Sofa Poppy góc trái vải màu cam"),
    );
    productList.add(new Product(
        description:
            '''Sofa góc trái Shadow với thiết kế nhỏ gọn, phù hợp cho các không gian căn hộ có diện tích vừa phải. Kiểu dáng nhẹ nhàng, đơn giản nhưng không kém phần tinh tế với điểm nhấn là nệm lưng ghế được may chỉ ở giữa rất duyên dáng. Tay sofa tạo khối bo tròn thấp làm cho tổng thể nhỏ gọn hết mức. Sofa góc Shadow là lựa chọn tối ưu cho không gian phòng khách hiện đại.''',
        images: [
          'https://nhaxinh.com/wp-content/uploads/2022/01/SOFA-SHADOW-GOC-TRAI-VAI-LIGHT-GREY-FY-03-600x400.jpg',
          'https://nhaxinh.com/wp-content/uploads/2022/01/8-2-600x400.jpg',
          'https://nhaxinh.com/wp-content/uploads/2022/01/sofa-shadow-600x400.jpg'
        ],
        info: "D2550/1600- R955- C860mm\nChân kim loại - Vải cao cấp",
        price: 39900000,
        tag: "sofa",
        title: "Sofa góc trái Shadow vải light grey FY-03"));
    productList.add(
      Product(
          description:
              'Bàn ăn Peak hiện đại mặt Ceramic vân mây kết hợp một thiết thông minh với một trải nghiệm hấp dẫn. Bằng cách sử dụng khung gỗ truyền thống và chuyển nó sang một cách diễn giải hiện đại hơn bằng kim loại, nó đã chứng tỏ có thể tạo ra một cấu trúc hỗ trợ vừa ổn định vừa cực kỳ chắc chắn.',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2022/06/ban-an-peak-van-may-hien-dai-ceramic-600x400.jpg',
            'https://nhaxinh.com/wp-content/uploads/2022/06/ban-an-peak-hien-dai-van-may-ceramic-22-600x360.jpg',
          ],
          info: "D2000-R000-C750mm",
          price: 45800000,
          tag: "table",
          title: "Bàn ăn Peak hiện đại mặt Ceramic vân mây"),
    );

    productList.add(
      Product(
          description:
              'Bàn ăn trong Tague được làm từ gỗ Mahogany, là một loại gỗ tốt với giá thành cạnh tranh để thiết kế những sản phẩm nội thất bền đẹp và được rất nhiều người ưa chuộng. Thiết kế của bàn ăn tròn Tague tạo nên sự gần gũi, vừa có thể thưởng thức những món ăn trên chiếc bàn, vừa có thể trang trí cho không gian nhà bếp của mỗi gia đình.',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2022/08/BAN-AN-TRON-TAGUE-WOOD-600x400.jpg',
            'https://nhaxinh.com/wp-content/uploads/2022/08/4-1-600x400.jpg',
          ],
          info: "Ø1200 - C750 mm\nGỗ Mahogany - MDF Veneer Mahogany",
          price: 10680000,
          tag: "table",
          title: "Bàn Ăn Tròn Tague gỗ"),
    );
    productList.add(
      Product(
          description:
              'Bàn ăn gỗ sồi Oak với thiết kế thanh lịch mang đến một không gian phòng ăn sang trọng. Chân trụ tròn đỡ mặt bàn bằng gỗ sồi ghép kết hợp thép mạ màu gold tạo thành một khối hài hòa vững chắc. Mặt bàn bằng gỗ veneer sồi vẫn giữ màu sáng, vân gỗ được chọn lọc kỹ đều và tinh tế.',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2021/10/90954_22-4.jpg',
            'https://nhaxinh.com/wp-content/uploads/2021/10/1000-san-pham-nha-xinh83-43-600x400.jpg',
            'https://nhaxinh.com/wp-content/uploads/2021/10/ban-an-oak-600x400.jpg',
          ],
          info: "D1840 - D900 - C750\nGỗ sồi - Chân thép sơn",
          price: 19540000,
          tag: "table",
          title: "Bàn ăn gỗ Oak"),
    );
    productList.add(
      Product(
          description:
              'Bàn nước Elegance với thiết kế đơn giản nhưng sang trọng và tinh tế. Nhờ kết cấu độc đáo nên có được trọng lượng nhẹ nhàng nhưng vô cùng chắc chắn. Phù hợp với các không gian nội thất hiện đại và đặc biệt là phong cách Scandinavian',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2021/11/102413-ban-nuoc-elegnace-1m2-mau-den-2.jpg',
            'https://nhaxinh.com/wp-content/uploads/2021/11/sofa-ban-nuoc-phong-khach-elegance5-600x400.jpg',
          ],
          info: "D1200 - R600 - C400 mm\nGỗ Ash (tần bì) đặc tự nhiên nhập khẩu từ Mỹ",
          price: 23320000,
          tag: "table",
          title: "Bàn nước Elegance màu đen"),
    );
    productList.add(
      Product(
          description:
              'Bàn console kết hợp từ chân inox mạ màu gold và mặt đá vân với điểm nhấn là phần khung với thiết kế uốn cong đầy tính nghệ thuật. Sản phẩm phù hợp cho không gian khòng khách, lối đi hoặc phòng ngủ với phong cách sang trọng, hiện đại.',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2022/09/CONSOLE-PARADISE-600x387.jpg',
          ],
          info: "D1200 -R400-C820 mm\nChân inox mạ màu gold, mặt đá vân",
          price: 16600000,
          tag: "table",
          title: "Bàn console Paradise"),
    );
    productList.add(
      Product(
          description:
              'Giường ngủ gỗ Dixie 1m8 được nhập khẩu từ thương hiệu nổi tiếng Calligaris của Ý, với thiết kế độc đáo, sang trọng, chân inox hiện đại, màu sắc trung tính cho không gian phòng ngủ thêm tinh tế hiện đại.',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2021/10/giuong-ngu-dixie-600x400.jpg',
            'https://nhaxinh.com/wp-content/uploads/2021/10/80438-500-nhaxinh-giuong-ngu-dixie2.jpg',
          ],
          info: "D2000- R1800- C970\nChân Aluminium bóng ,Khung gỗ +mdf veneer tần bì",
          price: 73800000,
          tag: "giuong",
          title: "Giường ngủ gỗ Dixie 1m8"),
    );
    productList.add(
      Product(
          description:
              'Giường Cabo với thiết kế trang nhã, tinh tế, sang trọng trong đó khung giường được làm bằng chất liệu gỗ phủ lớp MDF veener ash cao cấp, chân giường được làm từ kim loại được sơn đen chắc chắn, có khả năng chịu lực tốt. Giường Cabo mang đến cảm giác thư giãn, thoải mái nhất để nghỉ ngơi sau thời gian làm việc dài, mà còn là món đồ quan trọng trong thiết kế nội thất phòng ngủ.',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2022/08/Giuong-Cabo-1m6-PMA940026-2-600x387.jpg',
            'https://nhaxinh.com/wp-content/uploads/2022/08/Giuong-Cabo-2-600x400.jpg',
            'https://nhaxinh.com/wp-content/uploads/2022/08/Giuong-Cabo-4-600x387.jpg',
          ],
          info: "D2000 - R1600 - C1050 mm\nGỗ - MDF veneer Ash, chân kim loại",
          price: 23000000,
          tag: "giuong",
          title: "Giường Cabo 1m6 PMA940026"),
    );
    productList.add(
      Product(
          description: '',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2021/10/giuong-luffy-brown-102393.jpg',
          ],
          info: "D2000- R1800- C970\nChân kim loại, da Espirit tự nhiên",
          price: 92800000,
          tag: "giuong",
          title: "Giường Fluff 1m8 da màu Brown"),
    );
    productList.add(
      Product(
          description: '',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2022/04/Tu-ao-Acrylic-600x400.jpg',
            'https://nhaxinh.com/wp-content/uploads/2022/04/Tu-ao-Acrylic-1-600x400.jpg',
            'https://nhaxinh.com/wp-content/uploads/2022/04/Tu-ao-Acrylic-2-600x400.jpg',
          ],
          info: "D1600 - R600 - C2000 mm\nThùng MFC chống ẩm - mặt MDF Acrylic Parc50",
          price: 32900000,
          tag: "tu",
          title: "Tủ áo Acrylic"),
    );
    productList.add(
      Product(
          description:
              'Mẫu tủ áo hiện đại của Nhà Xinh với thiết kế giản đơn, tối đa tiện ích bằng nhiều ngăn kéo và khoảng trống để cất trữ quần áo và đồ đạc.',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2021/10/3-99496-1-600x400.jpg',
          ],
          info: "D1600-R600-C2000mm\nMFC chống ẩm -phụ kiện Hafele",
          price: 20900000,
          tag: "tu",
          title: "Tủ áo hiện đại"),
    );
    productList.add(
      Product(
          description:
              'Là sự kết hợp của màu trắng tinh khôi với màu gỗ ấm áp trên nền những đường nét thiết kế hiện đại, trang nhã. Harmony được đánh giá rất cao cả về kiểu dáng và công năng, đó sẽ là niềm tự hào của gia chủ khi khách đến thăm nhà.',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2021/10/tu-ao-harmony-7-600x400.jpg',
            'https://nhaxinh.com/wp-content/uploads/2021/10/sp_phong_ngu_harmony2_l-3.jpg',
            'https://nhaxinh.com/wp-content/uploads/2021/10/tu-ao-harmony-4-3-600x400.jpg',
          ],
          info: "D980 - R630 - C1980\nGỗ sồi+ tràm, MDF sơn trắng",
          price: 12600000,
          tag: "tu",
          title: "Tủ áo Harmony"),
    );
    productList.add(
      Product(
          description:
              'Tủ áo Maxine chứa đựng đầy đủ công năng tối ưu cho việc cất trữ quần áo bằng việc bố trí sắp xếp hợp lý các ngăn tủ. Những chi tiết về phụ kiện cao cấp giúp cho việc thao tác nhẹ nhàng. Bề ngoài, tủ được thiết kế duyên dáng và thu hút với sắc nâu trầm và kim loại đồng. Maxine – Nét nâu trầm sang trọng Maxine, mang thiết kế vượt thời gian, gửi gắm và gói gọn lại những nét đẹp của thiên nhiên và con người nhưng vẫn đầy tính ứng dụng cao trong suốt hành trình phiêu lưu của nhà thiết kế người Pháp Dominique Moal. Bộ sưu tập nổi bật với màu sắc nâu trầm sang trọng, là sự kết hợp giữa gỗ, da bò và kim loại vàng bóng. Đặc biệt trên mỗi sản phẩm, những nét bo viên, chi tiết kết nối được sử dụng kéo léo tạo ra điểm nhất rất riêng cho bộ sưu tập. Maxine thể hiện nét trầm tư, thư giãn để tận hưởng không gian sống trong nhịp sống hiện đại. Sản phẩm thuộc BST Maxine được sản xuất tại Việt Nam.',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2021/10/3_91000_1-600x401.jpg',
            'https://nhaxinh.com/wp-content/uploads/2021/10/3_91000_2-600x401.jpg',
          ],
          info:
              "D1200 - R600 - C2100mm\nKhung gỗ Okumi, MDF veneer recon Walnut, chân inox mạ PVD màu gold",
          price: 19900000,
          tag: "tu",
          title: "Tủ áo Maxine"),
    );
    productList.add(
      Product(
          description: '',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2023/01/DEN-BAN-BASIL-NICKEL-P23426-CHUP-600x387.jpg',
          ],
          info: "Ø400 - C820 mm",
          price: 7600000,
          tag: "den",
          title: "Đèn bàn Basil Nickel P23426"),
    );
    productList.add(
      Product(
          description: '',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2021/10/den-table-lamp-osiris-gold-600x400.jpg',
          ],
          info: "Khung kim loại",
          price: 7400000,
          tag: "den",
          title: "Đèn bàn Osiris màu Gold"),
    );
    productList.add(
      Product(
          description:
              'Đèn bàn Andromera màu xanh sang trọng, thiết kế gấp khúc độc đáo, được nhập khẩu từ Italia sẽ là điểm nhấn cho căn phòng bạn.',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2021/10/500-71812-nha-xinh-phong-khach-hang-trang-tri-den.jpg',
            'https://nhaxinh.com/wp-content/uploads/2021/10/500-71811-nha-xinh-phong-khach-hang-trang-tri-den21.jpg',
          ],
          info: "Ø500 - C730\nNhựa cao cấp",
          price: 14900000,
          tag: "den",
          title: "Đèn bàn Andromeda màu xanh"),
    );
    productList.add(
      Product(
          description: '',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2023/01/DEN-CHUM-TRANG-TRI-H74-320604-600x387.jpg',
          ],
          info: "Ø400 - C1150 mm\nkim loại, thủy tinh",
          price: 10270000,
          tag: "den",
          title: "Đèn chùm trang trí 320604"),
    );
    productList.add(
      Product(
          description: '',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2023/01/DEN-TRAN-73355P-E14-540W-D500%C3%97H620mm-600x387.jpg',
          ],
          info: "Ø550 - C1050 mm\nKim loại, Gỗ",
          price: 5900000,
          tag: "den",
          title: "Đèn trần 7335/5P-E14 5*40w"),
    );
    productList.add(
      Product(
          description:
              'Thêm điểm nhấn về kết cấu cho mặt bàn của bạn với Đèn bàn Savona tinh xảo, có đế đèn bằng sứ trắng có chạm khắc hình xoắn ốc. Vẻ ngoài đặc biệt của nó được thể hiện bởi đế đèn hoàn thiện bằng đồng cổ và một chao đèn màu kem đơn giản.',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2021/11/103105-den-ban-savona-ma-trang-600x400.jpg',
            'https://nhaxinh.com/wp-content/uploads/2021/11/103105-den-ban-savona-ma-trang-2-600x400.jpg',
          ],
          info: "D260 - R580 - C660 mm\nThân gốm-chụp vải",
          price: 196700000,
          tag: "den",
          title: "Đèn bàn Savona"),
    );
    productList.add(
      Product(
          description: '',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2023/02/KHUNG-TRANH-ABST-PURPLE-113X113CM-53896K-600x387.jpg',
            'https://nhaxinh.com/wp-content/uploads/2023/02/KHUNG-TRANH-ABST-PURPLE-113X113CM-53896K-1-600x400.jpg',
            'https://nhaxinh.com/wp-content/uploads/2023/02/KHUNG-TRANH-ABST-PURPLE-113X113CM-53896K-2-600x400.jpg',
            'https://nhaxinh.com/wp-content/uploads/2023/02/KHUNG-TRANH-ABST-PURPLE-113X113CM-53896K-3-600x400.jpg',
          ],
          info: "D1130 - R45 - C1130 mm\nVải: Polyester-Sơn acrylic",
          price: 141800000,
          tag: "tranh",
          title: "Tranh Abstract tím 113x113cm 53896K"),
    );
    productList.add(
      Product(
          description: '',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2022/06/TRANH-KUADRO-C-NATURAL-1-600x400.jpg',
            'https://nhaxinh.com/wp-content/uploads/2022/06/TRANH-KUADRO-C-NATURAL-2-600x400.jpg',
          ],
          info: "D715-R40-C985 mm\nKhung gỗ -Vải",
          price: 5560000,
          tag: "tranh",
          title: "Tranh kuadro C Natural"),
    );
    productList.add(
      Product(
          description: '',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2021/10/tranh-nu-bo-toc-600x400.jpg',
          ],
          info: "D900- C1200 mm\nKhung gỗ thông",
          price: 83900000,
          tag: "tranh",
          title: "Tranh African woman 90-120cm"),
    );
    productList.add(
      Product(
          description: '',
          images: [
            'https://nhaxinh.com/wp-content/uploads/2021/10/tranh-3-101242-600x400.jpg',
            'https://nhaxinh.com/wp-content/uploads/2022/09/Ban-Console-Addict-600x387.jpg',
          ],
          info: "D600 - C800 mm\nKhung gỗ, vải Canvas",
          price: 5900000,
          tag: "tranh",
          title: "Tranh Leav Rose mẫu 2"),
    );
    return productList;
  }

  static List<Product> fetchCategories() {
    List<Product> productList = [];
    productList.add(
        new Product(color: Colors.amber.shade900, image: Res.sofa, tag: "sofa", title: "Sofa"));
    productList.add(new Product(
        color: Colors.lightBlue.shade500, image: Res.table, tag: "table", title: "Bàn"));
    productList.add(new Product(
        color: Colors.yellow.shade800,
        image: Res.giuong,
        info: "",
        tag: "giuong",
        title: "Giường"));
    productList.add(
        new Product(color: Colors.pink, image: Res.tu, info: "", tag: "tu", title: "Tủ quần áo"));
    productList.add(
      new Product(color: Colors.teal, image: Res.lamp, info: "", tag: "den", title: "Đèn decor"),
    );
    productList.add(new Product(
        color: Colors.deepPurple, image: Res.tranh, tag: "tranh", title: "Tranh decor"));
    return productList;
  }

  static List<PayCard> getPaymentTypes() {
    List<PayCard> cards = [];
    cards.add(new PayCard(
        title: "Net Banking",
        description: "Pay bill using card",
        image: "assets/images/paycard.png"));
    cards.add(new PayCard(
        title: "Credit Card",
        description: "Pay bill using card",
        image: "assets/images/paycard.png"));
    cards.add(new PayCard(
        title: "Debit Card",
        description: "Pay bill using card",
        image: "assets/images/paycard.png"));
    cards.add(new PayCard(
        title: "Wallet pay",
        description: "Pay bill using card",
        image: "assets/images/paycard.png"));
    return cards;
  }
}
