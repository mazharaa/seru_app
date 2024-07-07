import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

part 'wizard_state.dart';
part 'wizard_cubit.freezed.dart';

class WizardCubit extends Cubit<WizardState> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController biodataController;

  WizardCubit() : super(WizardState.initial()) {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    biodataController = TextEditingController();
  }

  void onStepCancel(int index) {
    if (index > 0) {
      index--;
    }
    emit(state.unmodified.copyWith(currentStepIndex: index));
  }

  void onStepContinue(int index) {
    if (index == 1) generateJsonData();
    if (index < 2) index++;

    emit(state.unmodified.copyWith(currentStepIndex: index));
  }

  void onStepTapped(int index) {
    emit(state.unmodified.copyWith(currentStepIndex: index));
  }

  Future<void> captureSelfieImage() async {
    if (state.selfieImage == null) {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
      );

      if (pickedFile != null) {
        emit(state.unmodified.copyWith(
          selfieImage: File(pickedFile.path),
        ));
      }
    }
  }

  Future<void> captureIdentityImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    LineSplitter ls = const LineSplitter();

    if (pickedFile != null) {
      final inputImage = InputImage.fromFile(File(pickedFile.path));

      final textRecognizer =
          TextRecognizer(script: TextRecognitionScript.latin);

      final RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage);

      String idText = recognizedText.text;

      List<String> splittedIdText = ls.convert(idText);

      String idNum = splittedIdText[2].replaceAll(RegExp(r'[:\s]'), '');

      textRecognizer.close;

      emit(state.unmodified.copyWith(
        identityImage: File(pickedFile.path),
        identityNum: idNum,
      ));
    } else {
      emit(state.unmodified.copyWith(
        identityImage: null,
      ));
    }
  }

  Future<void> captureBebasImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      emit(state.unmodified.copyWith(
        bebasImage: File(pickedFile.path),
      ));
    } else {
      emit(state.unmodified.copyWith(
        bebasImage: null,
      ));
    }
  }

  void setProvinsi(String val) {
    emit(state.unmodified.copyWith(provinsi: val));
  }

  void setKota(String val) {
    emit(state.unmodified.copyWith(kota: val));
  }

  void setKecamatan(String val) {
    emit(state.unmodified.copyWith(kecamatan: val));
  }

  void setKelurahan(String val) {
    emit(state.unmodified.copyWith(kelurahan: val));
  }

  void generateJsonData() {
    emit(
      state.unmodified.copyWith(
        jsonData: {
          'firstName': firstNameController.text,
          'lastName': lastNameController.text,
          'biodata': biodataController.text,
          'provinsi': state.provinsi,
          'kota': state.kota,
          'kecamatan': state.kecamatan,
          'kelurahan': state.kelurahan,
          'noId': state.identityNum,
        },
      ),
    );
  }
}
