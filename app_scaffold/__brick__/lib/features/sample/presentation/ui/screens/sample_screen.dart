import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:{{project_name.snakeCase()}}/core/assets/app_assets.dart';
import 'package:{{project_name.snakeCase()}}/features/sample/presentation/blocs/sample_cubit.dart';
import 'package:{{project_name.snakeCase()}}/features/sample/presentation/blocs/sample_state.dart';

class SampleScreen extends StatelessWidget {
  const SampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Clean Arch Sample Feature',
          style: TextStyle(fontSize: 18.sp),
        ),
      ),
      body: BlocBuilder<SampleCubit, SampleState>(
        builder: (context, state) {
          if (state is SampleLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SampleLoaded) {
            return Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Demo flutter_svg usage
                  SvgPicture.string(
                    AppAssets.sampleIconSvg,
                    width: 64.w,
                    height: 64.h,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    state.data.title,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    state.data.description,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<SampleCubit>().loadSampleData(1);
                    },
                    icon: const Icon(Icons.refresh),
                    label: Text(
                      'Reload Sample Data',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is SampleError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: ${state.message}',
                    style: TextStyle(fontSize: 14.sp, color: Colors.red),
                  ),
                  SizedBox(height: 12.h),
                  ElevatedButton(
                    onPressed: () => context.read<SampleCubit>().loadSampleData(1),
                    child: Text('Retry', style: TextStyle(fontSize: 14.sp)),
                  ),
                ],
              ),
            );
          }
          return const Center(child: Text('Press button to load data'));
        },
      ),
    );
  }
}
