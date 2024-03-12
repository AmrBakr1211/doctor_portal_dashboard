part of '../view.dart';

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xffF5F6FF)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "ADMISSION Number # 23521336",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => SimpleDialog(
                      contentPadding: EdgeInsets.all(24),
                      backgroundColor: Color(0xffEBEBEB),
                      children: [
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.clear),
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                          decoration: BoxDecoration(color: Color(0xffF9F9F9), borderRadius: BorderRadius.circular(8)),
                          child: Text("Scan QR Code (Admission ID)"),
                        ),
                        SizedBox(height: 24),
                        AppImage(
                          "https://cdn.britannica.com/17/155017-050-9AC96FC8/Example-QR-code.jpg",
                          height: 200,
                        )
                      ],
                    ),
                  );
                },
                child: AppImage("qr_code.svg"),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _ItemHeader(title: "File Number:", value: "12235441"),
                        SizedBox(width: 8),
                        _ItemHeader(title: "Insurance:", value: "INS-001 Bupa Arabia"),
                        SizedBox(width: 8),
                        _ItemHeader(title: "Consultant:", value: "Dr. Hamdy Abdul Satar "),
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _ItemHeader(title: "Patient Name:", value: "Mostafa Mahmoud Ismail"),
                        SizedBox(width: 8),
                        _ItemHeader(title: "Company:", value: "Abdulatif Jameel Hospital"),
                        SizedBox(width: 8),
                        _ItemHeader(title: "Diagnosis:", value: "03.0 Fever ,Cough "),
                      ],
                    ),
                  ],
                ),
              ),
              FilledButton.tonalIcon(
                onPressed: () {},
                label: Text("View Data"),
                style: FilledButton.styleFrom(
                    backgroundColor: Color(0xffDEEEFF),
                    foregroundColor: Color(0xff0496FF),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                icon: AppImage("view_data.svg"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ItemHeader extends StatelessWidget {
  final String title, value;

  const _ItemHeader({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xff717171)),
          ),
          const SizedBox(width: 14),
          Flexible(
            child: Text(
              value,
              maxLines: 2,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xff0496FF)),
            ),
          ),
        ],
      ),
    );
  }
}
