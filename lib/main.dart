import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arpit Anghan | Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF111A19), // Noir De Vigne
      ),
      home: const HeroPage(),
    );
  }
}

class HeroPage extends StatelessWidget {
  const HeroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
         
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    // Top Navigation Bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'ARPIT',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFFBB6830),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (!isMobile)
                            Row(
                              children: [
                                navItem('HOME'),
                                navItem('ABOUT'),
                                navItem('PROJECTS'),
                                navItem('CONTACT'),
                                const SizedBox(width: 20),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFBB6830),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    // TODO: Add your resume link
                                  },
                                  child: const Text('DOWNLOAD CV'),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                
                    // Hero Section
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: isMobile
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _buildTextSection(),
                                  const SizedBox(height: 40),
                                  _buildProfileImage(),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(flex: 6, child: _buildTextSection()),
                                  Expanded(flex: 5, child: _buildProfileImage()),
                                ],
                              ),
                      ),
                    ),
                ],
                ),
              ),
         StatsAndProjectsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget navItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(
          title,
          style: GoogleFonts.poppins(
            color: Colors.white.withOpacity(0.85),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildTextSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'HI —',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 60,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "I'M ARPIT",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 70,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Flutter Developer & Team Lead',
          style: GoogleFonts.poppins(
            color: const Color(0xFF809076),
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          'Experienced in building high-performance apps for mobile, web, and desktop. '
          'Specialized in debugging, R&D, and managing Flutter teams with over 30+ successful projects delivered.',
          style: GoogleFonts.poppins(
            color: Colors.white.withOpacity(0.7),
            fontSize: 16,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImage() {
    return Align(
      alignment: Alignment.centerRight,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          'https://media.licdn.com/dms/image/v2/D4D35AQEI83clAQJeJw/profile-framedphoto-shrink_200_200/B4DZmp21MHIcAY-/0/1759491347537?e=1760281200&v=beta&t=DrVLFA2P3ybomKlQ-h74xgNGpxjqfsFCvtb9N7uqDrQ',
          width: 400,
          height: 400,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class StatsAndProjectsSection extends StatelessWidget {
  const StatsAndProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    return Container(
      width: double.infinity,
      color: const Color(0xFF111A19),
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "My Work at a Glance",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 50),

          // STATS ROW
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 60,
            runSpacing: 30,
            children: const [
              StatCard(title: "30+", subtitle: "Projects Completed"),
              StatCard(title: "10+", subtitle: "Web Portals Delivered"),
              StatCard(title: "7+", subtitle: "Payment Integrations"),
              StatCard(title: "9", subtitle: "Developers Managed"),
            ],
          ),

          const SizedBox(height: 80),

          // PAYMENT INTEGRATIONS
          Text(
            "Payment Gateway Integrations",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 30,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _logo("Razorpay"),
              _logo("Cashfree"),
              _logo("Paytm"),
              _logo("PhonePe"),
              _logo("Billdesk"),
              _logo("Easebuzz"),
              _logo("PayPal"),
            ],
          ),

          const SizedBox(height: 100),

          // SAMPLE PROJECTS
          Text(
            "Featured Projects",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: const [
              ProjectCard(
                imageUrl:
                    "https://via.placeholder.com/400x250.png?text=Smart+Attendance+App",
                title: "Smart Attendance App",
                description:
                    "Real-time face recognition attendance system with admin portal and analytics dashboard.",
                tags: "CRM, Face Recognition, Flutter Web",
              ),
              ProjectCard(
                imageUrl:
                    "https://via.placeholder.com/400x250.png?text=Restaurant+Management",
                title: "Restaurant Management System",
                description:
                    "POS-integrated restaurant management software with order and billing automation.",
                tags: "Imin POS, USB Printer, Flutter Desktop",
              ),
              ProjectCard(
                imageUrl:
                    "https://via.placeholder.com/400x250.png?text=Real+Estate+ERP",
                title: "Real Estate ERP",
                description:
                    "Property listing, booking, and CRM integration with web dashboard and mobile app.",
                tags: "ERP, Admin Panel, Firebase",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _logo(String name) => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          name,
          style: GoogleFonts.poppins(
            color: const Color(0xFFBB6830),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}

class StatCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const StatCard({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            color: const Color(0xFFBB6830),
            fontSize: 46,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          subtitle,
          style: GoogleFonts.poppins(
            color: Colors.white.withOpacity(0.8),
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String tags;

  const ProjectCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(description,
                    style: GoogleFonts.poppins(
                        color: Colors.white70, fontSize: 14, height: 1.5)),
                const SizedBox(height: 8),
                Text(tags,
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF809076),
                        fontSize: 13,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
