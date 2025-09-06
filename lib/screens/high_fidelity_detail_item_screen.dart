import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart'; // Import go_router

class HighFidelityDetailItemScreen extends StatefulWidget {
  const HighFidelityDetailItemScreen({super.key});

  @override
  State<HighFidelityDetailItemScreen> createState() => _HighFidelityDetailItemScreenState();
}

class _HighFidelityDetailItemScreenState extends State<HighFidelityDetailItemScreen> {
  int _selectedSize = 1; // 0 for S, 1 for M, 2 for L (M is default selected in Figma)

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double bottomNavBarHeight = 118 * (screenHeight / 812); // Figma height 118
    final double customAppBarHeight = 44 * (screenHeight / 812); // Figma height 44 for 'Detail' bar

    // Scaling factors based on a 375x812 design canvas
    final double horizontalScale = screenWidth / 375;
    final double verticalScale = screenHeight / 812;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent, // Transparent to allow background color to show
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: statusBarHeight + customAppBarHeight, // Space for custom app bar + status bar
                bottom: bottomNavBarHeight + MediaQuery.of(context).padding.bottom, // Space for bottom bar + safe area
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image (I142:377;417:715)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24 * horizontalScale),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16 * horizontalScale),
                      child: Image.asset(
                        'assets/images/I142_377_417_715.png',
                        width: 327 * horizontalScale, // Figma width (375-24-24)
                        height: 202 * verticalScale, // Figma height
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 24 * verticalScale),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24 * horizontalScale),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Caffe Mocha', // 142:360
                          style: GoogleFonts.sora(
                            fontSize: 20 * horizontalScale,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF242424),
                          ),
                        ),
                        SizedBox(height: 4 * verticalScale),
                        Text(
                          'Ice/Hot', // 142:361
                          style: GoogleFonts.sora(
                            fontSize: 12 * horizontalScale,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFA2A2A2),
                          ),
                        ),
                        SizedBox(height: 16 * verticalScale),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star_rounded, color: const Color(0xFFFCBE21), size: 20 * horizontalScale), // 142:364
                                SizedBox(width: 4 * horizontalScale),
                                RichText(
                                  text: TextSpan(
                                    style: GoogleFonts.sora(
                                      fontSize: 16 * horizontalScale,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF2A2A2A), // 142:368 for '4.8'
                                    ),
                                    children: <TextSpan>[
                                      const TextSpan(text: '4.8'),
                                      TextSpan(
                                        text: ' (230)', // 142:368 for '(230)'
                                        style: GoogleFonts.sora(
                                          fontSize: 12 * horizontalScale,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFFA2A2A2),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                _buildSuperiorityIcon('assets/images/I142_371_418_950.png', horizontalScale, verticalScale),
                                SizedBox(width: 12 * horizontalScale),
                                _buildSuperiorityIcon('assets/images/I142_373_418_971.png', horizontalScale, verticalScale),
                                SizedBox(width: 12 * horizontalScale),
                                _buildSuperiorityIcon('assets/images/I142_375_418_967.png', horizontalScale, verticalScale),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16 * verticalScale),
                        Divider(
                          color: const Color(0xFFE3E3E3), // 142:376 stroke
                          thickness: 1 * verticalScale,
                          height: 1 * verticalScale,
                        ),
                        SizedBox(height: 16 * verticalScale),
                        Text(
                          'Description', // 142:354
                          style: GoogleFonts.sora(
                            fontSize: 16 * horizontalScale,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF242424),
                          ),
                        ),
                        SizedBox(height: 8 * verticalScale),
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.sora(
                              fontSize: 14 * horizontalScale,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFFA2A2A2), // 142:355 default fill
                              height: 1.5,
                            ),
                            children: <TextSpan>[
                              const TextSpan(
                                text: 'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo..',
                              ),
                              TextSpan(
                                text: ' Read More', // 142:355 style override for "Read More"
                                style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFC67C4E),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16 * verticalScale),
                        Text(
                          'Size', // 142:345
                          style: GoogleFonts.sora(
                            fontSize: 16 * horizontalScale,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF242424),
                          ),
                        ),
                        SizedBox(height: 16 * verticalScale),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildSizeButton('S', 0, horizontalScale, verticalScale),
                            _buildSizeButton('M', 1, horizontalScale, verticalScale),
                            _buildSizeButton('L', 2, horizontalScale, verticalScale),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Custom App Bar (142:378)
          Positioned(
            top: statusBarHeight,
            left: 0,
            right: 0,
            child: Container(
              height: customAppBarHeight,
              color: Colors.white, // Ensure app bar background is white
              padding: EdgeInsets.symmetric(horizontal: 24 * horizontalScale),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop(); // Use context.pop() for back navigation
                    },
                    child: Container(
                      width: 44 * horizontalScale,
                      height: 44 * verticalScale,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.arrow_back, // Standard icon
                        color: const Color(0xFF2A2A2A),
                        size: 24 * horizontalScale,
                      ),
                    ),
                  ),
                  Text(
                    'Detail', // 142:381
                    style: GoogleFonts.sora(
                      fontSize: 16 * horizontalScale,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF242424),
                    ),
                  ),
                  Container(
                    width: 44 * horizontalScale,
                    height: 44 * verticalScale,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.favorite_border, // Standard icon
                      color: const Color(0xFF2A2A2A),
                      size: 24 * horizontalScale,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // System Status Bar (simplified representation)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildStatusBar(screenWidth, horizontalScale, statusBarHeight),
          ),
          // Bottom Navigation Bar (142:338)
          _buildBottomNavBar(horizontalScale, verticalScale, bottomNavBarHeight),
        ],
      ),
    );
  }

  Widget _buildStatusBar(double screenWidth, double horizontalScale, double height) {
    return Container(
      height: height,
      color: Colors.white, // Background color for the status bar area
      alignment: Alignment.bottomCenter, // Align content to the bottom of the status bar area
      padding: EdgeInsets.symmetric(horizontal: 24 * horizontalScale, vertical: 8 * (height / 20)), // Dynamic vertical padding based on typical status bar content height
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '9:41', // 142:384;417:348
            style: GoogleFonts.sora(
              fontSize: 16 * horizontalScale,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF242424),
            ),
          ),
          Row(
            children: [
              Icon(Icons.signal_cellular_alt, size: 17 * horizontalScale, color: const Color(0xFF242424).withOpacity(0.4)), // 142:384;417:339 Mobile Signal
              SizedBox(width: 4 * horizontalScale),
              Icon(Icons.wifi, size: 17 * horizontalScale, color: const Color(0xFF242424).withOpacity(0.4)), // 142:384;417:335 Wifi
              SizedBox(width: 4 * horizontalScale),
              Icon(Icons.battery_full, size: 17 * horizontalScale, color: const Color(0xFF242424).withOpacity(0.4)), // 142:384;417:331 Battery
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSuperiorityIcon(String assetPath, double horizontalScale, double verticalScale) {
    return Container(
      width: 44 * horizontalScale,
      height: 44 * verticalScale,
      decoration: BoxDecoration(
        color: const Color(0xFFEDEBEB).withOpacity(0.35), // 142:370 background fill
        borderRadius: BorderRadius.circular(12 * horizontalScale),
      ),
      alignment: Alignment.center,
      child: Image.asset(
        assetPath,
        width: 20 * horizontalScale, // Child node sizes like I142:371;418:950 (20x20)
        height: 20 * verticalScale,
        color: const Color(0xFFC67C4E), // Recolor the icon image as per fill 142:107
      ),
    );
  }

  Widget _buildSizeButton(String text, int index, double horizontalScale, double verticalScale) {
    bool isSelected = _selectedSize == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSize = index;
        });
      },
      child: Container(
        width: 96 * horizontalScale,
        height: 41 * verticalScale,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF7F2ED) : Colors.white, // Selected (142:349) vs Unselected (142:347) bg color
          borderRadius: BorderRadius.circular(12 * horizontalScale),
          border: Border.all(
            color: isSelected ? const Color(0xFFC67C4E) : const Color(0xFFE3E3E3), // Selected (142:349) vs Unselected (142:347) stroke
            width: 1 * horizontalScale,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: GoogleFonts.sora(
            fontSize: 14 * horizontalScale,
            fontWeight: FontWeight.w400,
            color: isSelected ? const Color(0xFFC67C4E) : const Color(0xFF242424), // Selected (142:350) vs Unselected (142:348) text color
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar(double horizontalScale, double verticalScale, double height) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: height + MediaQuery.of(context).padding.bottom, // Total height including system safe area
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16 * horizontalScale), // 142:338 rectangleCornerRadii
            topRight: Radius.circular(16 * horizontalScale),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 0,
              blurRadius: 10 * horizontalScale,
              offset: Offset(0, -5 * verticalScale),
            ),
          ],
        ),
        padding: EdgeInsets.fromLTRB(
          24 * horizontalScale, // 142:338 paddingLeft
          16 * verticalScale, // 142:338 paddingTop
          24 * horizontalScale, // 142:338 paddingRight
          (46 * verticalScale) + MediaQuery.of(context).padding.bottom, // 142:338 paddingBottom + system safe area
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center, // Center column vertically within its available space
              children: [
                Text(
                  'Price', // 142:340
                  style: GoogleFonts.sora(
                    fontSize: 14 * horizontalScale,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF909090),
                  ),
                ),
                SizedBox(height: 4 * verticalScale),
                Text(
                  '\$ 4.53', // 142:341
                  style: GoogleFonts.sora(
                    fontSize: 18 * horizontalScale,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFC67C4E),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                context.push('/cart'); // Navigate to '/cart' using go_router
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC67C4E), // 142:342 background fill
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16 * horizontalScale), // 142:342 cornerRadius
                ),
                padding: EdgeInsets.zero, // Padding is handled by minimumSize and content
                elevation: 0,
                minimumSize: Size(217 * horizontalScale, 56 * verticalScale), // Direct width/height from Figma 142:342
              ),
              child: Text(
                'Buy Now', // 142:343
                style: GoogleFonts.sora(
                  fontSize: 16 * horizontalScale,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}