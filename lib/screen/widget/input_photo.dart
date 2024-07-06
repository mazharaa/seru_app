import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputPhoto extends StatelessWidget {
  final String label;
  final GestureTapCallback? onTap;
  final Widget? child;
  final String? identityNum;

  const InputPhoto({
    super.key,
    required this.label,
    this.onTap,
    this.child,
    this.identityNum,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.left,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 7.5.h),
        InkWell(
          onTap: onTap,
          child: Container(
            height: 175.h,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(width: 1.5, color: Colors.grey),
              ),
            ),
            child: child == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Icon(
                        Icons.add_a_photo,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'Upload $label',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.black87),
                      )
                    ],
                  )
                : SizedBox.expand(child: child),
          ),
        ),
        label == 'Foto Identitas'
            ? Container(
                padding: EdgeInsets.only(top: 7.5.h),
                child: Text(
                  'No Identitas: $identityNum',
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
