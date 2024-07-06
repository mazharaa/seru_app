import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seru_app/application/wizard/wizard_cubit.dart';
import 'package:seru_app/const/const.dart';
import 'package:seru_app/screen/widget/input_dropdown.dart';
import 'package:seru_app/screen/widget/input_photo.dart';
import 'package:seru_app/screen/widget/input_text_field.dart';

class WizardPage extends StatelessWidget {
  const WizardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final constant = Const();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seru App'),
      ),
      body: BlocBuilder<WizardCubit, WizardState>(
        builder: (context, state) {
          return Stepper(
            type: StepperType.horizontal,
            currentStep: state.currentStepIndex,
            onStepCancel: () {
              context.read<WizardCubit>().onStepCancel(state.currentStepIndex);
            },
            onStepContinue: () {
              context
                  .read<WizardCubit>()
                  .onStepContinue(state.currentStepIndex);
            },
            onStepTapped: (value) {
              context.read<WizardCubit>().onStepTapped(value);
            },
            steps: [
              Step(
                title: SizedBox(
                  width: 60.w,
                  child: Text(
                    'Data Pribadi',
                    style: TextStyle(fontSize: 13.sp),
                  ),
                ),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      InputTextField(
                        label: 'First Name',
                        controller:
                            context.read<WizardCubit>().firstNameController,
                      ),
                      SizedBox(height: 15.h),
                      InputTextField(
                        label: 'Last Name',
                        controller:
                            context.read<WizardCubit>().lastNameController,
                      ),
                      SizedBox(height: 15.h),
                      InputTextField(
                        label: 'Biodata',
                        minLines: 5,
                        controller:
                            context.read<WizardCubit>().biodataController,
                      ),
                      SizedBox(height: 15.h),
                      InputDropdown(
                        label: 'Provinsi',
                        items: constant.listProvince,
                        onChanged: (val) {
                          val != null
                              ? context.read<WizardCubit>().setProvinsi(val)
                              : context.read<WizardCubit>().setProvinsi('');
                        },
                      ),
                      SizedBox(height: 15.h),
                      InputDropdown(
                        label: 'Kota',
                        items: constant.listKota,
                        onChanged: (val) {
                          val != null
                              ? context.read<WizardCubit>().setKota(val)
                              : context.read<WizardCubit>().setKota('');
                        },
                      ),
                      SizedBox(height: 15.h),
                      InputDropdown(
                        label: 'Kecamatan',
                        items: constant.listKecamatan,
                        onChanged: (val) {
                          val != null
                              ? context.read<WizardCubit>().setKecamatan(val)
                              : context.read<WizardCubit>().setKecamatan('');
                        },
                      ),
                      SizedBox(height: 15.h),
                      InputDropdown(
                        label: 'Kelurahan',
                        items: constant.listKelurahan,
                        onChanged: (val) {
                          val != null
                              ? context.read<WizardCubit>().setKelurahan(val)
                              : context.read<WizardCubit>().setKelurahan('');
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Step(
                title: SizedBox(
                  width: 60.w,
                  child: Text(
                    'Upload Data',
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),
                  ),
                ),
                content: Column(
                  children: [
                    InputPhoto(
                      label: 'Foto Selfie',
                      child: state.selfieImage != null
                          ? Image.file(state.selfieImage!)
                          : null,
                      onTap: () {
                        context.read<WizardCubit>().captureSelfieImage();
                      },
                    ),
                    SizedBox(height: 15.h),
                    InputPhoto(
                      label: 'Foto Identitas',
                      onTap: () {
                        context.read<WizardCubit>().captureIdentityImage();
                      },
                      identityNum: state.identityNum,
                      child: state.identityImage != null
                          ? Image.file(state.identityImage!)
                          : null,
                    ),
                    SizedBox(height: 15.h),
                    InputPhoto(
                      label: 'Foto Bebas',
                      child: state.bebasImage != null
                          ? Image.file(state.bebasImage!)
                          : null,
                      onTap: () {
                        context.read<WizardCubit>().captureBebasImage();
                      },
                    ),
                  ],
                ),
              ),
              Step(
                title: SizedBox(
                  width: 60.w,
                  child: Text(
                    'Data JSON',
                    style: TextStyle(fontSize: 13.sp),
                  ),
                ),
                content: Container(
                  height: 175.h,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 15,
                  ),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(width: 1.5, color: Colors.grey),
                    ),
                    color: Colors.grey.shade300,
                  ),
                  child: Text(
                    json.encode(state.jsonData),
                    style: const TextStyle(fontFamily: 'CourierPrime'),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
