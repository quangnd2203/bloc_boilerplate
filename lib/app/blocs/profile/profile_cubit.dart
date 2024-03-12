// import 'dart:io';
//
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get.dart';
//
// import '../../resources/resources.dart';
// import '../../utils/app_pref.dart';
// import '../application/application_cubit.dart';
//
// part 'profile_state.dart';
//
// class ProfileCubit extends Cubit<ProfileState> {
//   ProfileCubit() : super(ProfileState(userInfo: AppPrefs.userInfo));
//
//   final ProfileRepository profileRepository = ProfileRepository();
//   final ApplicationCubit applicationCubit = Get.find<ApplicationCubit>();
//
//   Future<bool> getProfile() async {
//     applicationCubit.setLoading();
//     final NetworkState<UserModel> networkState = await profileRepository.getProfile();
//     applicationCubit.setLoading(false);
//     if (networkState.isSuccess) {
//       emit(ProfileState(userInfo: networkState.data));
//     }
//     return networkState.isSuccess;
//   }
//
//   void deleteUserData() {
//     emit(const ProfileState());
//   }
//
//   void onUpdateUserInfo(ProfileState state) {
//     AppPrefs.userInfo = state.userInfo;
//   }
//
//   Future<bool> updateProfile(Map<String, dynamic> data, {File? avatar}) async {
//     applicationCubit.setLoading();
//     final NetworkState<dynamic> networkState = await profileRepository.updateProfile(profileData: data, avatar: avatar);
//     applicationCubit.setLoading(false);
//     bool getProfileSuccess = false;
//     final bool updateSuccess = networkState.isSuccess;
//     if (updateSuccess) {
//       getProfileSuccess = await getProfile();
//     }
//     if(getProfileSuccess && updateSuccess){
//       applicationCubit.showSnackbar(networkState.message!, isError: false);
//     }else{
//       applicationCubit.showSnackbar('update_profile_fail', isError: false);
//     }
//     return updateSuccess && updateSuccess;
//   }
// }
