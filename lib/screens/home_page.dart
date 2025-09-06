import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart'; // Import go_router

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCategoryIndex = 0;
  int _selectedBottomNavIndex = 0;

  final List<String> categories = [
    'All Coffee',
    'Machiato',
    'Latte',
    'Americano'
  ];

  final List<Map<String, dynamic>> products = [
    {
      'id': '1',
      'image': 'assets/images/I142_401_417_715.png',
      'rating': '4.8',
      'name': 'Caffe Mocha',
      'description': 'Deep Foam',
      'price': '\$ 4.53',
    },
    {
      'id': '2',
      'image': 'assets/images/I142_417_417_717.png',
      'rating': '4.8',
      'name': 'Flat White',
      'description': 'Espresso',
      'price': '\$ 3.53',
    },
    {
      'id': '3',
      'image': 'assets/images/I142_449_417_716.png',
      'rating': '4.8',
      'name': 'Mocha Fusi',
      'description': 'Ice/Hot',
      'price': '\$ 7.53',
    },
    {
      'id': '4',
      'image': 'assets/images/I142_433_417_718.png',
      'rating': '4.8',
      'name': 'Caffe Panna',
      'description': 'Ice/Hot',
      'price': '\$ 5.53',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    // Colors extracted from Figma JSON
    const Color primaryOrange = Color(0xFFC67C4E);
    const Color darkBackgroundStart = Color(0xFF111111);
    const Color darkBackgroundEnd = Color(0xFF313131);
    const Color greyText = Color(0xFFA2A2A2);
    const Color inactiveCategoryBg = Color(0x59EDEEEE);
    const Color starYellow = Color(0xFFFBBD17);
    const Color productTitleBlack = Color(0xFF242424);
    const Color promoRed = Color(0xFFEC5151);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: darkBackgroundStart,
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      darkBackgroundStart,
                      darkBackgroundEnd,
                    ],
                  ),
                ),
              ),
            ),
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: screenHeight * 0.43,
                  floating: false,
                  pinned: true,
                  snap: false,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).padding.top + 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Location',
                                    style: GoogleFonts.sora(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: greyText,
                                      letterSpacing: 0.12,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text(
                                        'Bilzen, Tanjungbalai',
                                        style: GoogleFonts.sora(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: greyText.withOpacity(0.85),
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      const Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: greyText,
                                        size: 14,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // Figma JSON does not provide details for a profile image, omitting for now.
                              // CircleAvatar(
                              //   radius: 20,
                              //   backgroundImage: AssetImage('assets/images/profile_placeholder.png'),
                              // ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 52,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1F1F1F),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
                                    children: [
                                      Icon(Icons.search, color: greyText.withOpacity(0.6), size: 20),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Search coffee',
                                        style: GoogleFonts.sora(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: greyText.withOpacity(0.6),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Container(
                                width: 52,
                                height: 52,
                                decoration: BoxDecoration(
                                  color: primaryOrange,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(Icons.filter_list, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Container(
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/142_467.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: promoRed,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      'Promo',
                                      style: GoogleFonts.sora(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Buy one get one FREE',
                                    style: GoogleFonts.sora(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      height: 1.25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(50.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          spacing: 16,
                          children: List.generate(categories.length, (index) {
                            final isSelected = _selectedCategoryIndex == index;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedCategoryIndex = index;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: isSelected ? primaryOrange : inactiveCategoryBg,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  categories[index],
                                  style: GoogleFonts.sora(
                                    fontSize: 14,
                                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                                    color: isSelected ? Colors.white : productTitleBlack,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 100),
                  sliver: SliverGrid.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.65,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          // Navigate to product detail screen using go_router
                          context.push('/high_fidelity_detail_item', extra: product);
                        },
                        child: ProductCard(product: product),
                      );
                    },
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 99 + MediaQuery.of(context).padding.bottom,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 24,
                  bottom: MediaQuery.of(context).padding.bottom == 0
                      ? 24
                      : MediaQuery.of(context).padding.bottom,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildBottomNavItem(
                      icon: Icons.home_filled,
                      index: 0,
                      routeName: '/home_page',
                      isSelected: _selectedBottomNavIndex == 0,
                      onTap: () {
                        setState(() {
                          _selectedBottomNavIndex = 0;
                        });
                        if (GoRouter.of(context).location != '/home_page') {
                          context.go('/home_page');
                        }
                      },
                    ),
                    _buildBottomNavItem(
                      icon: Icons.favorite_border,
                      index: 1,
                      routeName: '/favorites', // Placeholder route
                      isSelected: _selectedBottomNavIndex == 1,
                      onTap: () {
                        setState(() {
                          _selectedBottomNavIndex = 1;
                        });
                        context.go('/favorites'); // Using context.go for bottom nav
                      },
                    ),
                    _buildBottomNavItem(
                      icon: Icons.shopping_bag_outlined,
                      index: 2,
                      routeName: '/cart', // Placeholder route
                      isSelected: _selectedBottomNavIndex == 2,
                      onTap: () {
                        setState(() {
                          _selectedBottomNavIndex = 2;
                        });
                        context.go('/cart'); // Using context.go for bottom nav
                      },
                    ),
                    _buildBottomNavItem(
                      icon: Icons.notifications_none,
                      index: 3,
                      routeName: '/notifications', // Placeholder route
                      isSelected: _selectedBottomNavIndex == 3,
                      onTap: () {
                        setState(() {
                          _selectedBottomNavIndex = 3;
                        });
                        context.go('/notifications'); // Using context.go for bottom nav
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem({
    required IconData icon,
    required int index,
    required String routeName,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    const Color primaryOrange = Color(0xFFC67C4E);
    const Color greyText = Color(0xFFA2A2A2);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? primaryOrange : greyText,
            size: 24,
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 6),
              width: 10,
              height: 5,
              decoration: BoxDecoration(
                color: primaryOrange,
                borderRadius: BorderRadius.circular(18),
              ),
            ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Colors extracted from Figma JSON
    const Color primaryOrange = Color(0xFFC67C4E);
    const Color darkGradientColor1 = Color.fromRGBO(24, 24, 24, 0.3); // 0.06666667014360428, 0.06666667014360428, 0.06666667014360428, 0.3
    const Color darkGradientColor2 = Color.fromRGBO(49, 49, 49, 0.3); // 0.19166666269302368, 0.19166666269302368, 0.19166666269302368, 0.3
    const Color starYellow = Color(0xFFFBBD17);
    const Color productTitleBlack = Color(0xFF242424);
    const Color greyText = Color(0xFFA2A2A2);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                Image.asset(
                  product['image'],
                  height: 128,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          darkGradientColor1,
                          darkGradientColor2,
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        // The Figma JSON specifies `rectangleCornerRadii: [0, 12, 0, 24]`
                        // for the rating container itself. For clipping the image, a simple
                        // `BorderRadius.circular(12)` on the ClipRRect is sufficient.
                        // The complex corner radius on the gradient container is applied to its shape.
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Row(
                      children: [
                        Icon(Icons.star_rounded, color: starYellow, size: 12),
                        const SizedBox(width: 4),
                        Text(
                          product['rating'],
                          style: GoogleFonts.sora(
                            fontSize: 8,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name'],
                  style: GoogleFonts.sora(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: productTitleBlack,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product['description'],
                  style: GoogleFonts.sora(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: greyText,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product['price'],
                      style: GoogleFonts.sora(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: productTitleBlack,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle add item to cart logic here (e.g., add to a shopping cart model)
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: primaryOrange,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}