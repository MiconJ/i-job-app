import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ijob_app/providers/add_agency_form_provider.dart';
import 'package:ijob_app/providers/agency_provider.dart';
import 'package:ijob_app/widgets/date_picker_field.dart';
import 'package:ijob_app/widgets/dropdown_field.dart';
import 'package:ijob_app/widgets/text_form_field_custom.dart';
import 'package:intl/intl.dart';

class AgencyAddForm extends ConsumerWidget {
  const AgencyAddForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final extablishedAt = ref.watch(extablishedAtProvider);
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 20),
            child: SingleChildScrollView(
              child: Form(
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    children: [
                      TextFormFieldCustom(
                        hintText: 'Nhập tên doanh nghiệp',
                        labelText: 'Tên doanh nghiệp *',
                        maxLength: 50,
                        validator: (String? value) {
                          if (value != null && value.contains('@')) {
                            return 'Tên doanh nghiệp chứa ký tự không hợp lệ';
                          } else if (value == null || value.isEmpty) {
                            return 'Tên doanh nghiệp không được để trống';
                          }
                        },
                        onChanged: (value) {
                          ref.read(agencyNameProvider.notifier).state = value;
                        },
                      ),
                      TextFormFieldCustom(
                        hintText: 'Nhập mã số thuế',
                        labelText: 'Mã số thuế',
                        maxLength: 50,
                        validator: (String? value) {
                          if (value != null && value.contains('@')) {
                            return 'Mã số thuế chứa ký tự không hợp lệ';
                          }
                        },
                        onChanged: (value) {
                          ref.read(agencyTaxNoProvider.notifier).state = value;
                        },
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormFieldCustom(
                              hintText: 'Nhập số điện thoại doanh nghiệp',
                              labelText: 'Số điện thoại',
                              maxLength: 15,
                              inputFormatters: const [
                                // Todo: create regex
                                // FilteringTextInputFormatter.allow(
                                //   RegExp(r'^(?:\+?88|0088)?01[13-9]\d{8}$'),
                                // ),
                              ],
                              onChanged: (value) {
                                ref.read(agencyPhoneNoProvider.notifier).state =
                                    value;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: TextFormFieldCustom(
                              hintText: 'Nhập email doanh nghiệp',
                              labelText: 'Địa chỉ Email',
                              maxLength: 50,
                              inputFormatters: const [],
                              validator: (String? value) {
                                if (value != null && !value.contains('@')) {
                                  return 'Email không hợp lệ';
                                }
                              },
                              onChanged: (value) {
                                ref
                                    .read(agencyEmailAddressProvider.notifier)
                                    .state = value;
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormFieldCustom(
                              hintText: 'Nhập website',
                              labelText: 'Website',
                              maxLength: 50,
                              onChanged: (value) {
                                ref
                                    .read(agencyWebsiteUrlProvider.notifier)
                                    .state = value;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: TextFormFieldCustom(
                              hintText: 'Nhập số lượng nhân viên',
                              labelText: 'Số lượng nhân viên',
                              maxLength: 7,
                              onChanged: (value) {
                                ref
                                    .read(agencyEmployeeNoProvider.notifier)
                                    .state = int.parse(value);
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: DateTimeWidget(
                            title: 'Ngày thành lập',
                            valueText: DateFormat('dd/MM/yyyy')
                                .format(extablishedAt)
                                .toString(),
                            onTap: () async {
                              final DateTime? getExtablishAtValue =
                                  await (showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                              ));
                              if (getExtablishAtValue != null) {
                                ref.read(extablishedAtProvider.notifier).state =
                                    getExtablishAtValue;
                              }
                            },
                          )),
                          SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: DropdownField(
                              labelText: 'Loại doanh nghiệp',
                              listOptions: [
                                'Công ty tuyển dụng',
                                'Công ty thường',
                              ],
                            ),
                          )
                        ],
                      ),
                      TextFormFieldCustom(
                        hintText: 'Nhập mô tả doanh nghiệp',
                        labelText: 'Mô tả',
                        maxLength: 10000,
                        maxLines: 5,
                        keyboardType: TextInputType.multiline,
                        onChanged: (value) {
                          ref.read(agencyDescriptionProvider.notifier).state =
                              value;
                        },
                      ),
                    ],
                  )),
            ),
          ),
          Spacer(),
          Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 20),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    child: Text('Hủy'),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      foregroundColor: Colors.black54,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: ElevatedButton(
                    child: Text('Xác nhận'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    onPressed: () {
                      ref.read(createAgencyProvider.future);
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
