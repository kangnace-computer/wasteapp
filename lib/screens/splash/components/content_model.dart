class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
    title: 'การค้นหา',
    image: 'assets/images/welcome_one.png',
    discription: "ฟังก์ชั่นใน การดูร้านที่รับ ซื้อของเก่า ของรีไซเคิล หรือจุดรับบริจาก จากหน่วยงานต่าง ๆ"
    "อัพเดตราคา จากราคากลาง เพื่อสร้างเป้าหมายในการ เก็บ"
    "ลดการเกิดขยะ จากต้น ทาง เพื่อลดปัญหา ในการเกิดขยะเสีย ออกจากระบบ"
  ),
  UnbordingContent(
    title: 'รับรู้ข่าวสาร',
    image: 'assets/images/welcome_two.png',
    discription: "อัพเดต ข่าวสาร ความรู้ต่าง ๆ เกี่ยวกับวิธีการ และคุณประโยชน์ของวัสดุ ต่าง ๆ "
    "เส้น ทางการเดินทางของขยะ หลังจากเราทำการทิ้งลงไปในถังขยะ ทั้แบบทั่วไปและรีไซเคิล"
  ),
  UnbordingContent(
    title: 'ช่วยลดขยะ',
    image: 'assets/images/welcome_three.png',
    discription: "การลด ขยะที่เกิดขึ้น การทราบถึง ผลกระทบ หากเราไม่ทำการแยกขยะอย่างถูกวิธี"
    "ผลกระทบ ต่อโลก การช่วยกันแยกขยะ ตั้งแตกต้น ทางช่วยโลก อย่างไร ?"
  ),
];
