class LocalDataTask {
  List<String> tag = [
    "寵物",
    "運動",
    "影視",
    "旅行",
    "閱讀",
    "音樂",
    "MBTI",
    "星座",
    "遊戲",
    "美食",
    "你的生活信条"
  ];
  Map<String, List> TagChecklist = {
    "寵物": [
      "images/map_piece/pet.svg",
      ["狗狗", "猫咪", "仓鼠", "刺猬", "兔子"],
    ],
    "運動": [
      "images/map_piece/sport.svg",
      ["游泳", "足球", "羽毛球", "篮球", "乒乓球", "健身", "跑步", "跳舞", "爬山"]
    ],
    "影視": [
      "images/map_piece/movie.svg",
      ['爱情亲情', "科幻", "动作剧情", "犯罪嫌疑", "恐怖惊悚"]
    ],
    "旅行": [
      "images/map_piece/trip.svg",
      ["特种兵式", "走走停停享受式", "资深背包客", "渴望出发的萌新"]
    ],
    "閱讀": ["images/map_piece/reading.svg", []],
    "音樂": [
      "images/map_piece/music.svg",
      ["流行", "华语", "摇滚", "古典", "古风", "民谣"]
    ],
    "MBTI": [
      "images/map_piece/mbti.svg",
      [
        "INTP（思绪飞扬的学者）",
        "INTJ（独立自主的专家）",
        "ENTP（大雄的机器猫)",
        "ENTJ（天生的领导者）",
        "ENFJ（谆谆教诲的教育家）",
        "INFJ（精神世界的引路人）",
        "INFP（完美主义的知心人）",
        "ENFP（追梦人)",
        "ESFP（不可或缺的大活宝）",
        "ISFP（静美的艺术家）",
        "ISTP（谦逊的手艺人）",
        "ESTP（活在当下的践行者）",
        "ISFJ（具奉献精神的保护者）",
        "ISTJ（一丝不苟的检查者）",
        "ESFJ（盛情难却的东道主）",
        "ESTJ（天生的管理者）"
      ]
    ],
    "星座": [
      "images/map_piece/constellation.svg",
      [
        "白羊座",
        "金牛座",
        "双子座",
        "巨蟹座",
        "狮子座",
        "处女座",
        "天秤座",
        "天蝎座",
        "射手座",
        "魔羯座",
        "水瓶座",
        "双鱼座"
      ]
    ],
    "遊戲": [
      "images/map_piece/game.svg",
      ["养成类", "大世界冒险类", "休闲类", "竞技类", '枪战类']
    ],
    "美食": [
      "images/map_piece/food.svg",
      ["辣条", "坚果", "薯片", "饼干", "肉铺"]
    ],
    "你的生活信条": [
      "images/map_piece/life_credo.svg",
      ["极简主义", "实用主义", "极繁主义", "随心主义", "发疯主义"]
    ]
  };

  // void updateTagChecklist(
  //     Map<String, List> tagChecklist, List<String> contrast) {
  //   for (var tag in contrast) {
  //     if (tagChecklist.containsKey(tag)) {}
  //   }
  // }
}
