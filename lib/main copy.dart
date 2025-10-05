import 'package:flutter/material.dart';
import 'dart:math';

const double sectionRadius = 6.0;
const Color darkBg = Color(0xFF232323);
const Color accent = Color(0xFF3DDC84);

// HERO SECTION
const double heroTitleFont = 36;
const double heroSubtitleFont = 13;
const double heroBodyFont = 13;
const double heroButtonFont = 16;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arpit Anghan - Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2196F3),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

// Helper class for arc icon data
class _ArcIconData {
  final IconData icon;
  final Color color;
  final String label;
  final double angle;
  const _ArcIconData(this.icon, this.color, this.label, this.angle);
}

class _PortfolioPageState extends State<PortfolioPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBg,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 700;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // HERO SECTION
                Container(
                  color: darkBg,
                  padding: EdgeInsets.symmetric(
                    vertical: isMobile ? 24 : 40,
                    horizontal: 0,
                  ),
                  child: isMobile
                      ? Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(sectionRadius),
                                  child: Image.network(
                                    'https://ui-avatars.com/api/?name=Arpit+Anghan&background=2196F3&color=fff&size=256',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Arpit Anghan',
                                    style: TextStyle(
                                      fontSize: heroTitleFont - 8,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Portfolio',
                                    style: TextStyle(
                                      fontSize: heroTitleFont - 8,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'I build beautiful, high-performance apps for every platform using Flutter.',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: heroBodyFont,
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            foregroundColor: darkBg,
                                            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 14),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(sectionRadius),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: const Text('Explore Now', style: TextStyle(fontWeight: FontWeight.bold, fontSize: heroButtonFont)),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: OutlinedButton.icon(
                                          style: OutlinedButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            side: const BorderSide(color: Colors.white54),
                                            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 14),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(sectionRadius),
                                            ),
                                          ),
                                          onPressed: () {},
                                          icon: const Icon(Icons.play_circle, color: accent),
                                          label: const Text('Play Video', style: TextStyle(fontWeight: FontWeight.bold, fontSize: heroButtonFont)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Left: Photo
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 32),
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(sectionRadius),
                                    child: Image.network(
                                      'https://ui-avatars.com/api/?name=Arpit+Anghan&background=2196F3&color=fff&size=256',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Right: Text
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 32),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Arpit Anghan',
                                      style: TextStyle(
                                        fontSize: heroTitleFont,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Portfolio',
                                      style: TextStyle(
                                        fontSize: heroTitleFont,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    Text(
                                      'I build beautiful, high-performance apps for every platform using Flutter.',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: heroBodyFont,
                                      ),
                                    ),
                                    const SizedBox(height: 32),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            foregroundColor: darkBg,
                                            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(sectionRadius),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: const Text('Explore Now', style: TextStyle(fontWeight: FontWeight.bold, fontSize: heroButtonFont)),
                                        ),
                                        const SizedBox(width: 18),
                                        OutlinedButton.icon(
                                          style: OutlinedButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            side: const BorderSide(color: Colors.white54),
                                            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(sectionRadius),
                                            ),
                                          ),
                                          onPressed: () {},
                                          icon: const Icon(Icons.play_circle, color: accent),
                                          label: const Text('Play Video', style: TextStyle(fontWeight: FontWeight.bold, fontSize: heroButtonFont)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
                // INTRODUCTION SECTION
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: isMobile ? 32 : 60,
                    horizontal: 0,
                  ),
                  child: isMobile
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _sectionTitle('Introduction', fontSize: 14),
                                  const SizedBox(height: 16),
                                  const Text(
                                    "I'm Arpit Anghan, a passionate Flutter developer and team lead. Since 2021, I've delivered 24+ projects across web, mobile, and desktop. I thrive on R&D, team management, and turning ideas into beautiful, functional products.",
                                    style: TextStyle(color: Colors.white70, fontSize: 12),
                                  ),
                                  SizedBox(height: 20),
                                  _aboutMeMobile(),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: AspectRatio(
                                aspectRatio: 2.2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(sectionRadius),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=800&q=80',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Left: Text
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 80, right: 40),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _sectionTitle('Introduction'),
                                    const SizedBox(height: 24),
                                    const Text(
                                      "I'm Arpit Anghan, a passionate Flutter developer and team lead. Since 2021, I've delivered 24+ projects across web, mobile, and desktop. I thrive on R&D, team management, and turning ideas into beautiful, functional products.",
                                      style: TextStyle(color: Colors.white70, fontSize: 12),
                                    ),
                                    const SizedBox(height: 32),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: const [
                                              Text('About Me', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16)),
                                              SizedBox(height: 8),
                                              Text("Started my journey as an intern at Tryon Infotech in 2021, then joined Instance IT Solutions in 2023. In 2024, I became Team Lead, delivering successful products for web, Windows, macOS, iOS, and Android.", style: TextStyle(color: Colors.white70, fontSize: 12)),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 40),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: const [
                                              Text('About Portfolio', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16)),
                                              SizedBox(height: 8),
                                              Text("My portfolio showcases my cross-platform expertise, leadership, and a wide range of projects including ERP, CRM, POS, facility management, booking, e-commerce, chat, and automation.", style: TextStyle(color: Colors.white70, fontSize: 12)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Right: Image
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 80),
                                child: AspectRatio(
                                  aspectRatio: 2.2,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(sectionRadius),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=800&q=80',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
                // SKILLS & TECHNOLOGIES SECTION
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: isMobile ? 32 : 60,
                    horizontal: isMobile ? 16 : 80,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionTitle('Skills & Technologies', fontSize: isMobile ? 14 : null),
                      const SizedBox(height: 32),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          _techCard(Icons.flutter_dash, 'Flutter', Colors.blue, isMobile: isMobile),
                          _techCard(Icons.code, 'Dart', Colors.blueAccent, isMobile: isMobile),
                          _techCard(Icons.cloud, 'Firebase', Colors.orange, isMobile: isMobile),
                          _techCard(Icons.http, 'REST API', Colors.green, isMobile: isMobile),
                          _techCard(Icons.merge_type, 'Git', Colors.deepPurple, isMobile: isMobile),
                          _techCard(Icons.design_services, 'Figma', Colors.pink, isMobile: isMobile),
                          _techCard(Icons.desktop_windows, 'Windows', Colors.teal, isMobile: isMobile),
                          _techCard(Icons.laptop_mac, 'macOS', Colors.grey, isMobile: isMobile),
                          _techCard(Icons.web, 'Web', Colors.indigo, isMobile: isMobile),
                          _techCard(Icons.android, 'Android', Colors.green, isMobile: isMobile),
                          _techCard(Icons.phone_iphone, 'iOS', Colors.black, isMobile: isMobile),
                        ],
                      ),
                    ],
                  ),
                ),
                // WORK DETAILS/PROJECTS SECTION
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: isMobile ? 32 : 60,
                    horizontal: isMobile ? 16 : 80,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionTitle('Work Details', fontSize: isMobile ? 14 : null),
                      const SizedBox(height: 32),
                      GridView.count(
                        crossAxisCount: isMobile ? 1 : 3,
                        shrinkWrap: true,
                        mainAxisSpacing: 24,
                        crossAxisSpacing: 24,
                        physics: const NeverScrollableScrollPhysics(),
                        childAspectRatio: isMobile ? 1.2 : 0.9,
                        children: [
                          _projectCardCustom('ERP System', 'Developed a cross-platform ERP solution for web, Windows, macOS, iOS, and Android.'),
                          _projectCardCustom('E-commerce & Automation', 'Launched e-commerce and automation projects with advanced integrations.'),
                          _projectCardCustom('CRM Platform', 'Built a CRM platform with real-time chat and automation features.'),
                          _projectCardCustom('POS Solution', 'Created a POS system for retail, supporting multiple devices and platforms.'),
                          _projectCardCustom('Facility Management', 'Delivered a facility management app for web and mobile.'),
                          _projectCardCustom('Booking Application', 'Built a booking app with seamless user experience across all platforms.'),
                        ],
                      ),
                    ],
                  ),
                ),
                // CONTACT SECTION
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: isMobile ? 32 : 60,
                    horizontal: 0,
                  ),
                  child: isMobile
                      ? Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: AspectRatio(
                                aspectRatio: 1.1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(sectionRadius),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1465101046530-73398c7f28ca?auto=format&fit=crop&w=800&q=80',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _sectionTitle('My Contact', fontSize: 14),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'Feel free to reach out for collaboration, project inquiries, or just to connect! I am always open to new opportunities and discussions.',
                                    style: TextStyle(color: Colors.white70, fontSize: 12),
                                  ),
                                  const SizedBox(height: 24),
                                  _contactInfo(Icons.phone, '+91-9876543210', fontSize: 12),
                                  _contactInfo(Icons.language, 'www.arpit-portfolio.com', fontSize: 12),
                                  _contactInfo(Icons.email, 'arpit.anghan@email.com', fontSize: 12),
                                  _contactInfo(Icons.location_on, 'Surat, Gujarat, India', fontSize: 12),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Left: Image
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 80),
                                child: AspectRatio(
                                  aspectRatio: 1.1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(sectionRadius),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1465101046530-73398c7f28ca?auto=format&fit=crop&w=800&q=80',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Right: Contact Info
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 40, right: 80),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _sectionTitle('My Contact'),
                                    const SizedBox(height: 24),
                                    const Text(
                                      'Feel free to reach out for collaboration, project inquiries, or just to connect! I am always open to new opportunities and discussions.',
                                      style: TextStyle(color: Colors.white70, fontSize: 12),
                                    ),
                                    const SizedBox(height: 32),
                                    _contactInfo(Icons.phone, '+91-9876543210'),
                                    _contactInfo(Icons.language, 'www.arpit-portfolio.com'),
                                    _contactInfo(Icons.email, 'arpit.anghan@email.com'),
                                    _contactInfo(Icons.location_on, 'Surat, Gujarat, India'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _sectionTitle(String title, {double? fontSize}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize ?? 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 80,
          height: 3,
          color: accent,
        ),
      ],
    );
  }

  Widget _aboutMeMobile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('About Me', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12)),
        SizedBox(height: 8),
        Text("Started my journey as an intern at Tryon Infotech in 2021, then joined Instance IT Solutions in 2023. In 2024, I became Team Lead, delivering successful products for web, Windows, macOS, iOS, and Android.", style: TextStyle(color: Colors.white70, fontSize: 12)),
        SizedBox(height: 20),
        Text('About Portfolio', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12)),
        SizedBox(height: 8),
        Text("My portfolio showcases my cross-platform expertise, leadership, and a wide range of projects including ERP, CRM, POS, facility management, booking, e-commerce, chat, and automation.", style: TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }

  Widget _techCard(IconData icon, String label, Color color, {bool isMobile = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 24, vertical: isMobile ? 12 : 18),
      decoration: BoxDecoration(
        color: color.withOpacity(0.09),
        borderRadius: BorderRadius.circular(sectionRadius),
        border: Border.all(color: color.withOpacity(0.18)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: isMobile ? 20 : 28),
          SizedBox(width: isMobile ? 8 : 14),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 12 : 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _projectCardCustom(String title, String desc) {
    return GestureDetector(
      onTap: () {
        if (title == 'ERP System') {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              backgroundColor: darkBg,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(sectionRadius),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Sticky Header
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: darkBg,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(sectionRadius)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.white70, size: 20),
                          onPressed: () => Navigator.pop(context),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                  ),
                  // Scrollable Content
                  Flexible(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSection('Overview', [
                              'Automation: Streamline workflows across all departments.',
                              'Real-Time Access: Access data anytime, anywhere.',
                              'Seamless Integration: Integrate all business functions seamlessly.',
                              'Data Security & Compliance: Ensure data security and compliance.',
                              'Accounting Integration: Simplify accounting with financial software integration.',
                              'Customizable Reports: Gain insights with 40+ customizable reports.',
                            ]),
                            _buildSection('Core Modules', [
                              'Manufacturing: Production Composite Items, Consolidated Production View, Parameterized QA/QC Evaluation, Machine Utilization',
                              'Sales & CRM: Sales Insights, Dynamic Pricing, Point of Sale (POS), Franchise & Retail Chain Management, Dynamic Sales Pipeline',
                              'Retail & Franchise: Interactive UI, Franchise Onboarding',
                              'Integrations: Finance Integrations, Sales & Purchase Integrations, Tax Integrations',
                              'Mobile App: B2B & B2C Sales, Reports on Fingertips',
                            ]),
                            _buildSection('Industry Applications', [
                              'Automobile Manufacturing',
                              'Food and Beverage',
                              'Textiles and Apparel',
                              'Electronics and Electricals',
                              'Pharmaceuticals',
                              'Furniture Manufacturing',
                              'Chemical Manufacturing',
                              'Construction and Building Materials',
                              'Plastic and Rubber',
                              'Industrial Machinery',
                            ]),
                            _buildSection('Additional Features', [
                              'Inventory Management',
                              'Sales & Purchase Management',
                              'Dynamic Pricing',
                              'Retail Management',
                              'CRM',
                              'HR & Payroll',
                              'Reports & Analytics',
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (title == 'E-commerce & Automation') {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              backgroundColor: darkBg,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(sectionRadius),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Sticky Header
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: darkBg,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(sectionRadius)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.shopping_cart, color: accent, size: 20),
                            const SizedBox(width: 8),
                            Text(
                              'E-Commerce Mobile App',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.white70, size: 20),
                          onPressed: () => Navigator.pop(context),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                  ),
                  // Scrollable Content
                  Flexible(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoRow('Platforms', 'Android & iOS'),
                            _buildInfoRow('Role', 'Mobile App Developer'),
                            _buildInfoRow('Technologies', 'Flutter, REST APIs, Firebase, Push Notifications, Payment Gateway'),
                            const SizedBox(height: 20),
                            _buildSection('Project Overview', [
                              'Developed a mobile application for an e-commerce platform specializing in home decor products. The app was built from scratch and deployed on both Android and iOS, providing users with a smooth, secure, and intuitive shopping experience.',
                            ]),
                            _buildSection('Key Features', [
                              'Dynamic product listings with advanced filtering and search',
                              'Secure user authentication (login, registration, password recovery)',
                              'Integrated cart and multi-step checkout system',
                              'Push notifications for order updates and promotions',
                              'Order tracking and history functionality',
                              'Optimized performance and smooth navigation',
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(sectionRadius),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(sectionRadius),
                child: Image.network(
                  'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=400&q=80',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              desc,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.arrow_right, color: accent, size: 16),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        )),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _contactInfo(IconData icon, String text, {double fontSize = 16}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, color: accent, size: 22),
          const SizedBox(width: 16),
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: fontSize, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  // Add creative background helper
  Widget _blurCircle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            color: color,
            blurRadius: size * 0.6,
            spreadRadius: size * 0.2,
          ),
        ],
      ),
    );
  }

  // Helper for section backgrounds
  Widget _sectionCard({required Widget child}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(sectionRadius),
        color: Colors.white.withOpacity(0.85),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.07),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        child: child,
      ),
    );
  }

  // Platform chip widget
  Widget _platformChip(String label, IconData icon, Color color) {
    return Chip(
      avatar: Icon(icon, color: color, size: 18),
      label: Text(label, style: TextStyle(color: color, fontWeight: FontWeight.w600)),
      backgroundColor: color.withOpacity(0.12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(sectionRadius)),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    );
  }

  // Add large platform icon widget
  Widget _platformIconLarge(IconData icon, Color color) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        color: color.withOpacity(0.13),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.18),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(icon, color: color, size: 32),
    );
  }

  // Animated underline for section title
  Widget _sectionTitleAnimated(String title) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 900),
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: 80 * value,
              height: 3,
              color: accent,
            ),
          ],
        );
      },
    );
  }

  // Glassmorphism card for Vision/Mission
  Widget _glassCard({required IconData icon, required String title, required String text}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(sectionRadius),
        border: Border.all(color: Colors.white.withOpacity(0.13)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: accent, size: 28),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            text,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

// Add custom clipper for the top curve
class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
