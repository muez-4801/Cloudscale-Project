# المتغير الخاص بأسماء الطلاب لجعله جزءاً من أسماء الموارد لضمان التخصيص
variable "student_names" {
  type    = string
  default = "moaz_islam_mohamed" # اكتب أسماءكم هنا بالإنجليزية أحرف صغيرة وبدون فراغات
}

# تحديد المنطقة الجغرافية لإنشاء الموارد (شرق الولايات المتحدة)
variable "location" {
  type    = string
  default = "East US"
}