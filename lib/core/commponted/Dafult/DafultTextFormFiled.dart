import 'package:flutter/material.dart';
import 'package:user/core/constant/config.dart';

class DafulteTextForm extends StatefulWidget {
  DafulteTextForm(
      {super.key,
      required this.title,
      this.readonly,
      this.hight,
      this.SuffIcon,
      this.validator,
      this.controller,
      this.ColorForHindenText,
      this.borderRadius,
      this.onTap,
      this.onChanged,
      this.borderSidr,
      this.border,
      this.prfixIcon});

  Config config = Config();

  TextEditingController? controller;
  Widget? prfixIcon;
  Widget? SuffIcon;
  final String title;
  void Function(String)? onChanged;
  Color? ColorForHindenText;
  BorderSide? borderSidr;
  InputBorder? border;

  bool? readonly;
  void Function()? onTap;
  double? hight;
  String? Function(String?)? validator;

  BorderRadius? borderRadius;

  @override
  State<DafulteTextForm> createState() => _DafulteTextFormState();
}

class _DafulteTextFormState extends State<DafulteTextForm>
    with SingleTickerProviderStateMixin {
  late bool isfoucs;
  late AnimationController controller;
  late Animation<Color?> colorAnimation;
  late FocusNode focusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isfoucs = false;
    focusNode = FocusNode();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    final curvedAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutBack, // يمكنك تعديل هذا المنحنى حسب الحاجة
    );
    colorAnimation = ColorTween(
      begin: widget.config.colorAppbar3, // اللون الابتدائي
      end: const Color.fromRGBO(245, 245, 245, 1), // اللون عند التركيز
    ).animate(curvedAnimation);
    focusNode.addListener(() {
      setState(() {
        isfoucs = focusNode.hasFocus;
        if (isfoucs) {
          controller.forward();
        } else {
          controller.reverse();
        }
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) => SizedBox(
          height: 70,
          child: TextFormField(
            focusNode: focusNode,

            onChanged: widget.onChanged,
            controller: widget.controller,
            onTap: widget.onTap,
            validator: widget.validator,
            readOnly: widget.readonly == null ? false : widget.readonly!,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w300),
            //focusNode: FocusNode(),
            decoration: InputDecoration(
                fillColor: colorAnimation.value,
                suffixIcon: widget.SuffIcon,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                prefixIcon: widget.prfixIcon,
                // fillColor: Colors.white,
                //focusColor: const Color.fromARGB(255, 78, 77, 72),
                filled: true,
                hintText: widget.title,
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: widget.ColorForHindenText ??
                        (isDark
                            ? Config().colorTextDark
                            : const Color.fromRGBO(140, 138, 140, 1))),
                //      errorBorder: InputBorder.none,
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: widget.borderRadius == null
                        ? const BorderRadius.all(Radius.circular(7))
                        : widget.borderRadius!),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: widget.borderRadius == null
                        ? const BorderRadius.all(Radius.circular(7))
                        : widget.borderRadius!),
                errorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: isDark ? Colors.white : Colors.black),
                    borderRadius: widget.borderRadius == null
                        ? const BorderRadius.all(Radius.circular(7))
                        : widget.borderRadius!),
                enabledBorder: OutlineInputBorder(
                    borderSide: isDark
                        ? const BorderSide(color: Colors.white)
                        : BorderSide.none,
                    borderRadius: widget.borderRadius == null
                        ? const BorderRadius.all(Radius.circular(7))
                        : widget.borderRadius!),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: isDark ? Colors.white : Colors.black),
                    borderRadius: widget.borderRadius == null
                        ? const BorderRadius.all(Radius.circular(7))
                        : widget.borderRadius!),
                border: widget.border ??
                    OutlineInputBorder(
                        borderSide: isDark
                            ? const BorderSide(color: Colors.black)
                            : BorderSide.none,
                        borderRadius: widget.borderRadius == null
                            ? const BorderRadius.all(Radius.circular(7))
                            : widget.borderRadius!)),
          ),
        ),
      ),
    );
  }
}
