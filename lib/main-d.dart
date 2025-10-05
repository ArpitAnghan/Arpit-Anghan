import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const PortfolioApp());
}

// Single-line color definitions (from your palette)
const emeraldGreen = Color(0xFF284139), wasabi = Color(0xFF809076), creasedKhaki = Color(0xFFF8D794), egyptianEarth = Color(0xFFBB6830), noirDeVigne = Color(0xFF111A19);

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arpit Anghan — Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(),
        primaryColor: emeraldGreen,
        colorScheme: ColorScheme.fromSeed(seedColor: emeraldGreen),
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  // anchors for jump-to-section buttons
  final aboutKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  Future<void> _scrollTo(GlobalKey key) async {
    final context = key.currentContext;
    if (context == null) return;
    await Scrollable.ensureVisible(context,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _navButton(String text, GlobalKey key) {
    return TextButton(
      onPressed: () => _scrollTo(key),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _TopBar(
        onAboutTap: () => _scrollTo(aboutKey),
        onProjectsTap: () => _scrollTo(projectsKey),
        onContactTap: () => _scrollTo(contactKey),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeroSection(onHireTap: () => _scrollTo(contactKey)),
            const SizedBox(height: 40),
            Container(key: aboutKey, child: AboutSection()),
            const SizedBox(height: 32),
            ServicesSection(),
            const SizedBox(height: 32),
            Container(key: projectsKey, child: ProjectsSection()),
            const SizedBox(height: 32),
            TechStackSection(),
            const SizedBox(height: 32),
            Container(key: contactKey, child: ContactSection()),
            const SizedBox(height: 24),
            Footer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _scrollTo(contactKey),
        backgroundColor: emeraldGreen,
        label: const Text('Hire Me'),
        icon: const Icon(Icons.send),
      ),
    );
  }
}

class _TopBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onAboutTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const _TopBar({
    required this.onAboutTap,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 900;
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      title: Text('Arpit Anghan', style: GoogleFonts.poppins(fontWeight: FontWeight.w700, color: noirDeVigne)),
      actions: isMobile
          ? [
              PopupMenuButton<int>(
                icon: const Icon(Icons.menu, color: noirDeVigne),
                itemBuilder: (context) => [
                  PopupMenuItem(child: const Text('About'), value: 0),
                  PopupMenuItem(child: const Text('Projects'), value: 1),
                  PopupMenuItem(child: const Text('Contact'), value: 2),
                ],
                onSelected: (v) {
                  if (v == 0) onAboutTap();
                  if (v == 1) onProjectsTap();
                  if (v == 2) onContactTap();
                },
              )
            ]
          : [
              TextButton(onPressed: onAboutTap, child: const Text('About')),
              TextButton(onPressed: onProjectsTap, child: const Text('Projects')),
              TextButton(onPressed: onContactTap, child: const Text('Contact')),
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () => _openUrl('mailto:arpitanghan@gmail.com'),
                  icon: const Icon(Icons.mail),
                  label: const Text('Contact'),
                  style: ElevatedButton.styleFrom(backgroundColor: emeraldGreen),
                ),
              )
            ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}

// ---- Hero Section ----
class HeroSection extends StatelessWidget {
  final VoidCallback onHireTap;
  const HeroSection({required this.onHireTap, super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 900;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80, vertical: isMobile ? 24 : 48),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // left column
            Expanded(
              flex: isMobile ? 1 : 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('I build high-performance cross-platform apps using Flutter.',
                      style: GoogleFonts.poppins(fontSize: isMobile ? 22 : 36, fontWeight: FontWeight.w700, color: noirDeVigne)),
                  const SizedBox(height: 12),
                  Text(
                    'Flutter Developer & Team Lead — 4+ years • 30+ projects • Expert in debugging, R&D and performance optimization. Managed a team of 9 Flutter developers.',
                    style: GoogleFonts.poppins(fontSize: isMobile ? 14 : 16, color: Colors.grey[800]),
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    children: [
                      ElevatedButton(
                        onPressed: onHireTap,
                        style: ElevatedButton.styleFrom(backgroundColor: emeraldGreen, padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14)),
                        child: const Text('Hire Me'),
                      ),
                      OutlinedButton(
                        onPressed: () => _openUrl('https://example.com/arpit_resume.pdf'),
                        style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14), side: const BorderSide(color: noirDeVigne)),
                        child: const Text('Download Resume'),
                      ),
                    ],
                  )
                ],
              ),
            ),

            // right column (visual card)
            if (!isMobile)
              const SizedBox(width: 40),
            if (!isMobile)
              Expanded(
                flex: 4,
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: creasedKhaki,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 18, offset: const Offset(0, 8)),
                    ],
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Featured', style: GoogleFonts.poppins(fontSize: 12, color: emeraldGreen, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 8),
                      Text('Smart Attendance App', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700, color: noirDeVigne)),
                      const SizedBox(height: 8),
                      Text('Face recognition attendance system built with Flutter & Firebase. Real-time matching, analytics and admin tools.',
                          style: GoogleFonts.poppins(color: Colors.grey[800])),
                      const Spacer(),
                      Row(
                        children: [
                          Chip(label: const Text('Flutter')),
                          const SizedBox(width: 8),
                          Chip(label: const Text('Firebase')),
                          const SizedBox(width: 8),
                          Chip(label: const Text('Performance')),
                        ],
                      )
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ---- About Section ----
class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 900;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('About Me', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700, color: noirDeVigne)),
                    const SizedBox(height: 12),
                    Text(
                      'I’m Arpit Anghan — Flutter Developer & Team Lead with 4+ years building apps across mobile, web, and desktop (Windows & macOS). I have worked on 30+ projects and specialize in debugging, R&D, and performance optimization techniques. I have managed a team of 9 Flutter developers and have hands-on experience in project management.',
                      style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[800]),
                    ),
                    const SizedBox(height: 16),
                    Wrap(spacing: 8, runSpacing: 8, children: const [
                      _InfoChip(label: 'CRM'),
                      _InfoChip(label: 'ERP'),
                      _InfoChip(label: 'Restaurant Management'),
                      _InfoChip(label: 'E-commerce'),
                      _InfoChip(label: 'Real-estate Software'),
                      _InfoChip(label: 'B2B Sales App'),
                      _InfoChip(label: 'Facility Management'),
                    ]),
                  ]),
                ),
                if (!isMobile) const SizedBox(width: 20),
                if (!isMobile)
                  Expanded(
                      flex: 4,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('Integrations & Hardware', style: GoogleFonts.poppins(fontWeight: FontWeight.w700)),
                        const SizedBox(height: 12),
                        Text('Printers: Imin POS, Imin Printer, TCS Printer, Shreyansh, WiFi/USB/Bluetooth printers', style: GoogleFonts.poppins(color: Colors.grey[800])),
                        const SizedBox(height: 12),
                        Text('Payments: Razorpay, Cashfree, Easebuzz, PhonePe, PayPal, Billdesk, Paytm', style: GoogleFonts.poppins(color: Colors.grey[800])),
                        const SizedBox(height: 18),
                        ElevatedButton.icon(
                          onPressed: () => _openUrl('mailto:arpitanghan@gmail.com'),
                          icon: const Icon(Icons.email),
                          label: const Text('Email Me'),
                          style: ElevatedButton.styleFrom(backgroundColor: emeraldGreen),
                        )
                      ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final String label;
  const _InfoChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: wasabi.withOpacity(0.14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}

// ---- Services Section ----
class ServicesSection extends StatelessWidget {
  ServicesSection({super.key});

  final services = const [
    {'title': 'Flutter App Dev', 'desc': 'Cross-platform mobile, web and desktop apps; Play/App Store deployment.'},
    {'title': 'UI/UX Implementation', 'desc': 'Pixel-perfect UIs from Figma/XD, smooth animations.'},
    {'title': 'Architecture & State', 'desc': 'Bloc, Riverpod, GetX and clean architecture patterns.'},
    {'title': 'Debug & Optimization', 'desc': 'Deep debugging, R&D and performance tuning.'},
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 900;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('What I Do', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700, color: noirDeVigne)),
          const SizedBox(height: 16),
          GridView.builder(
            itemCount: services.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 4,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.3,
            ),
            itemBuilder: (context, i) {
              final s = services[i];
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(s['title']!, style: GoogleFonts.poppins(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    Text(s['desc']!, style: GoogleFonts.poppins(color: Colors.grey[700], fontSize: 13)),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(Icons.flutter_dash, color: emeraldGreen),
                    )
                  ]),
                ),
              );
            },
          )
        ]),
      ),
    );
  }
}

// ---- Projects Section ----
class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key});

  final projects = const [
    {
      'title': 'Smart Attendance App',
      'desc': 'Face recognition attendance system built with Flutter & Firebase.',
      'tags': ['Flutter', 'Firebase', 'Realtime']
    },
    {
      'title': 'B2B Sales App',
      'desc': 'Sales pipeline and order management for distributors.',
      'tags': ['Flutter', 'REST', 'Offline']
    },
    {
      'title': 'Restaurant POS',
      'desc': 'Order management and printer integrations (USB/WiFi/Bluetooth).',
      'tags': ['Flutter', 'POS', 'Hardware']
    },
    {
      'title': 'Real Estate Portal',
      'desc': 'Property listings, admin CMS and customer portal.',
      'tags': ['Flutter', 'Admin', 'Maps']
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 900;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('My Projects', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700, color: noirDeVigne)),
          const SizedBox(height: 16),
          GridView.builder(
            itemCount: projects.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 2.5,
            ),
            itemBuilder: (context, i) {
              final p = projects[i] ?? {};
              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      Container(width: 100, height: 80, decoration: BoxDecoration(color: wasabi.withOpacity(0.18), borderRadius: BorderRadius.circular(8))),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text("title", style: GoogleFonts.poppins(fontWeight: FontWeight.w700)),
                          const SizedBox(height: 6),
                          Text('desc', style: GoogleFonts.poppins(color: Colors.grey[700], fontSize: 13)),
                          const Spacer(),
                          Row(children: (p['tags']! as List<String>).map((t) => Padding(padding: const EdgeInsets.only(right: 8.0), child: Chip(label: Text(t)))).toList())
                        ]),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(backgroundColor: egyptianEarth),
                          child: const Text('View')),
                    ],
                  ),
                ),
              );
            },
          )
        ]),
      ),
    );
  }
}

// ---- Tech Stack ----
class TechStackSection extends StatelessWidget {
  TechStackSection({super.key});

  final tech = const ['Flutter', 'Dart', 'Firebase', 'REST APIs', 'Bloc', 'Riverpod', 'Git', 'CI/CD', 'Figma'];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 900;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Tech Stack', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700, color: noirDeVigne)),
          const SizedBox(height: 12),
          Wrap(spacing: 8, runSpacing: 8, children: tech.map((t) => Chip(label: Text(t), backgroundColor: wasabi.withOpacity(0.12))).toList())
        ]),
      ),
    );
  }
}

// ---- Contact Section ----
class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final msgCtrl = TextEditingController();

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    msgCtrl.dispose();
    super.dispose();
  }

  void _send() {
    if (_formKey.currentState?.validate() ?? false) {
      final mailto = Uri(
        scheme: 'mailto',
        path: 'arpitanghan@gmail.com',
        query: 'subject=Portfolio Inquiry from ${Uri.encodeComponent(nameCtrl.text)}&body=${Uri.encodeComponent(msgCtrl.text + '\n\n' + emailCtrl.text)}',
      );
      _openUrl(mailto.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 900;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Get in touch', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700, color: noirDeVigne)),
              const SizedBox(height: 12),
              Text('Let\'s build something great together. I’m available for freelance and contract work.', style: GoogleFonts.poppins(color: Colors.grey[700])),
              const SizedBox(height: 16),
              Form(
                key: _formKey,
                child: Column(children: [
                  TextFormField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Your name')),
                  const SizedBox(height: 8),
                  TextFormField(controller: emailCtrl, decoration: const InputDecoration(labelText: 'Email'), validator: (v) => (v?.contains('@') ?? false) ? null : 'Enter valid email'),
                  const SizedBox(height: 8),
                  TextFormField(controller: msgCtrl, decoration: const InputDecoration(labelText: 'Message'), maxLines: 5),
                  const SizedBox(height: 12),
                  Row(children: [
                    ElevatedButton(onPressed: _send, style: ElevatedButton.styleFrom(backgroundColor: emeraldGreen), child: const Text('Send')),
                    const SizedBox(width: 12),
                    TextButton(onPressed: () => _openUrl('https://example.com/arpit_resume.pdf'), child: const Text('Download Resume')),
                  ])
                ]),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

// ---- Footer ----
class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 900;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80, vertical: 20),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('© ${DateTime.now().year} Arpit Anghan', style: GoogleFonts.poppins(color: Colors.grey[700])),
          Row(children: [
            IconButton(onPressed: () => _openUrl('https://github.com/arpit-demo'), icon: const Icon(Icons.code)),
            IconButton(onPressed: () => _openUrl('https://linkedin.com/in/arpit-demo'), icon: const Icon(Icons.business)),
            IconButton(onPressed: () => _openUrl('https://upwork.com/arpit-demo'), icon: const Icon(Icons.work)),
          ])
        ]),
      ),
    );
  }
}

// ---- Helpers ----
Future<void> _openUrl(String url) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    if (kDebugMode) {
      print('Could not launch $url');
    }
  }
}
