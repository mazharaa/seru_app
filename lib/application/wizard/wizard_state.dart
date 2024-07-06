part of 'wizard_cubit.dart';

@freezed
class WizardState with _$WizardState {
  const WizardState._();
  const factory WizardState({
    File? selfieImage,
    File? identityImage,
    File? bebasImage,
    required int currentStepIndex,
    required String identityNum,
    required String provinsi,
    required String kota,
    required String kecamatan,
    required String kelurahan,
    required Map<String, dynamic> jsonData,
  }) = _WizardState;

  factory WizardState.initial() => const WizardState(
        selfieImage: null,
        identityImage: null,
        bebasImage: null,
        currentStepIndex: 0,
        identityNum: '',
        provinsi: '',
        kota: '',
        kecamatan: '',
        kelurahan: '',
        jsonData: {},
      );

  WizardState get unmodified => copyWith();
}
