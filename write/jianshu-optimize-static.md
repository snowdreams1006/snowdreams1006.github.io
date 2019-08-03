# 简述优选文章统计


{% chart %}
{
    "data": {
        "x": "x",
        "columns": [
            [
                "x",
                "01",
                "02",
                "03",
                "04",
                "05",
                "06",
                "07",
                "08",
                "09",
                "10",
                "11",
                "12",
                "13",
                "14",
                "15",
                "16",
                "17",
                "18",
                "19",
                "20",
                "21",
                "22",
                "23",
                "24",
                "25",
                "26",
                "27",
                "28",
                "29",
                "30",
                "31",
                "32",
                "33",
                "34",
                "35",
                "36"
            ],
            [
                "阅读量",
                2825,
                3242,
                3287,
                3317,
                4869
            ],
            [
                "点赞量",
                61,
                61,
                61,
                61,
                64
            ],
            [
            
                "评论数",
                21,
                24,
                24,
                24,
                28
            ]
        ]
    }
}
{% endchart %}


```js
var articleStatic = `
36 https://mp.weixin.qq.com/s/JA_H5y0SHOcS0V-pn8V7Jw 为什么在一线城市待久的人,就很难再回去？ 36 23 15204 60
35 https://mp.weixin.qq.com/s/yqcT5VlIcLh9d7Eyz4uyFw 我嫂子——那个“恶女人”的前半生:你哥他...不行 46 30 14984 31
34 https://mp.weixin.qq.com/s/xJRtW340VwRNDU1hxQc0wA 成为谁,也不要成为小s 36 23 25831 28
33 https://mp.weixin.qq.com/s/TTqzmPeof8FN3D1kErSnJQ 你真傻,念念不忘,是没有回响的 38 31 12264 41 
32 https://mp.weixin.qq.com/s/TTqzmPeof8FN3D1kErSnJQ 蔡少芬直言当过小三:老天给了她一手烂牌,她却打出了王炸 25 20 29429 55
31 https://mp.weixin.qq.com/s/7aTGbUziPgWijye1xKF7LA 微信朋友圈查访客记录：我和我的“朋友圈”爱人 27 24 16965 23
30 https://mp.weixin.qq.com/s/sNiSuR7acH43kwnP5yox9g 我的好胜心害死了好朋友······ 26 19 17709 102
29 https://mp.weixin.qq.com/s/i7xqmHHbYrmbBHy__aaGfA 我那个从事裸体艺术的前女友去世了... 33 26 22393 28
28 https://mp.weixin.qq.com/s/85tALM-OAaCet78rfQ59Hw 贾玲,你也是活该！ 41 28 28793 111
27 https://mp.weixin.qq.com/s/bhKFbcoeXDrVmfDhpyDiUA “女生第1次和第5次的区别”,有些东西,只有经历了才懂得 64 44 33164 61 
26 https://mp.weixin.qq.com/s/lG3mGfKAvTrI7UL383D6Kw 我的3次相亲经历，次次都教我做人 65 31 22641 36
25 https://mp.weixin.qq.com/s/bT33bHJcsf_Jpwx9mjswNg 2060年,那个失踪的宇航员回来了...... 11 9 10981 13
24 https://mp.weixin.qq.com/s/FBzJZzmzNrpeNtcQBSY4fQ “好不容易上个大学,谈什么恋爱啊” 39 33 8760 39 
23 https://mp.weixin.qq.com/s/1JBaS5FTcrzRnylIBaoAKg 富家女离奇死亡,摩天轮内发现惊人一幕 29 23 12573 28
22 https://mp.weixin.qq.com/s/pfqKkHNI9bQDbhdv4gPAnw 有好教养的人,总是闪闪发光的啊 17 12 10745 55
21 https://mp.weixin.qq.com/s/o6aGhHp5uI3Nquy0usaaww 优质男:姑娘,我凭什么娶你？ 62 50 21840 88
20 https://mp.weixin.qq.com/s/PoiHroXm3V1kKjj3u1jnAw 那个改变了我一生的老男人······ 27 20 12552 74
19 https://mp.weixin.qq.com/s/IpXCQ6YPFrq39T1hFu4P-g “叔叔阿姨,那个...能小点声吗？” 37 34 31607 72
18 https://mp.weixin.qq.com/s/8WOH-pBrSCyEyByf8AOi3A “我,23岁,拖延癌晚期，还有救吗？” 17 13 9256 48
17 https://mp.weixin.qq.com/s/74gJMnvGILwajfFMwWFc_g “十二年了,我才没那么想他” 77 71 14173 61
16 https://mp.weixin.qq.com/s/Fb6Ygp07QkaQYFh-O2OBOw 十年工厂生涯,我活成了没有梦想的中年人 96 74 12835 70 
15 https://mp.weixin.qq.com/s/n7mTI2dOAPQjG312gXP_8g 你现在这么努力,是为了有朝一日“有得选” 15 11 11637 76
14 https://mp.weixin.qq.com/s/vJpJkwMlqZLLvmf6W342gg 谢谢你,给我18厘米的爱情 90 55 27232 83
13 https://mp.weixin.qq.com/s/TJrq7zNELA48CG_WUJRtnA 我爱上了隔壁那个被家暴的女人 59 40 19771 32
12 https://mp.weixin.qq.com/s/zOQrwG5q7lwvypabYDs27w 你以为是丑拒,其实是...... 25 11 14861 41
11 https://mp.weixin.qq.com/s/jUHhqDS2fjLjTXY551Bn5w 追我那么久,请你放过我 71 64 18788 101
10 https://mp.weixin.qq.com/s/8y2jAt5be1ndl1JNV4H-1A 我犯了一种罪,叫长的不好看 67 34 16087 101
9 https://mp.weixin.qq.com/s/k8uidACpKxz6a8YCg-kwzQ 你都用不起SK-II,还敢熬这么深的夜？ 39 34 13146 54
8 https://mp.weixin.qq.com/s/Vt_nd4xx5gEhNXgyzojAcQ 你这么内向,那应该找不到对象吧 100 81 17036 124 
7 https://mp.weixin.qq.com/s/SU3CHUNT7l5Hy0P8WWYPAw 想用自律打败低配人生,你配吗？ 57 46 1.8w 117
6 https://mp.weixin.qq.com/s/FoKMrZ-gvzn1RWUtsFQzJQ 为什么大多数人宁愿吃生活的苦,也不愿吃学习的苦？ 16 12 7988 57
5 https://mp.weixin.qq.com/s/ugG71ETZOAygI-DhMruCEA 越优秀的人,越不安分 32 22 1.5w 191
4 https://mp.weixin.qq.com/s/e1mif6nhCJ-XeRoilhW83A 毕业了,谁又不曾有过爱情的遗憾 43 34 9073 30
3 https://mp.weixin.qq.com/s/nHhoFhuNojiAqqHKkfBYLQ 经营一段亲密关系,难吗？ 22 18 1.2w 69
2 https://mp.weixin.qq.com/s/RqrH9kdgUHIiAfS_vxg3QA 婆媳之间,何止是缘分？ 37 27 1.0w 70
1 https://mp.weixin.qq.com/s/QMEy489ohNGHiETixElgMQ 不合群的你,其实也很酷 57 45 1.4w 174
`;

var untreatedArticles = articleStatic.split('\n');
var treatedArticles = untreatedArticles.slice(1,untreatedArticles.length-1);
var nums = [];
var comments = [];
var reads = [];
var likes = [];
for (i = 0; i < treatedArticles.length; i++) { 
    var articleStaticItem = treatedArticles[i].split(" ");

    console.log("编号: " + articleStaticItem[0] + " 链接: " + articleStaticItem[1] + " 标题: " + articleStaticItem[2] + " 评论数: " + articleStaticItem[3] + " 精选留言: " + articleStaticItem[4] + " 阅读量: " + articleStaticItem[5] + " 点赞量: " + articleStaticItem[6]);

    nums.push(articleStaticItem[0]);
    comments.push(articleStaticItem[3]);
    reads.push(articleStaticItem[5]);
    likes.push(articleStaticItem[6]);
}

console.log("编号: " + nums.join(",") + " 阅读量: " + reads.join(",") + " 评论量: " + comments.join(",") + " 点赞量: " + likes.join(","));
```

> 数据来源于"简书"微信公众号,以下是统计数据.

```csv
36 https://mp.weixin.qq.com/s/JA_H5y0SHOcS0V-pn8V7Jw 为什么在一线城市待久的人，就很难再回去？ 36 23 15204 60
35 https://mp.weixin.qq.com/s/yqcT5VlIcLh9d7Eyz4uyFw 我嫂子——那个“恶女人”的前半生：你哥他...不行 46 30 14984 31
34 https://mp.weixin.qq.com/s/xJRtW340VwRNDU1hxQc0wA 成为谁，也不要成为小s 36 23 25831 28
33 https://mp.weixin.qq.com/s/TTqzmPeof8FN3D1kErSnJQ 你真傻，念念不忘，是没有回响的 38 31 12264 41 
32 https://mp.weixin.qq.com/s/TTqzmPeof8FN3D1kErSnJQ 蔡少芬直言当过小三：老天给了她一手烂牌，她却打出了王炸 25 20 29429 55
31 https://mp.weixin.qq.com/s/7aTGbUziPgWijye1xKF7LA 微信朋友圈查访客记录：我和我的“朋友圈”爱人 27 24 16965 23
30 https://mp.weixin.qq.com/s/sNiSuR7acH43kwnP5yox9g 我的好胜心害死了好朋友······ 26 19 17709 102
29 https://mp.weixin.qq.com/s/i7xqmHHbYrmbBHy__aaGfA 我那个从事裸体艺术的前女友去世了... 33 26 22393 28
28 https://mp.weixin.qq.com/s/85tALM-OAaCet78rfQ59Hw 贾玲，你也是活该！ 41 28 28793 111
27 https://mp.weixin.qq.com/s/bhKFbcoeXDrVmfDhpyDiUA “女生第1次和第5次的区别”，有些东西，只有经历了才懂得 64 44 33164 61 
26 https://mp.weixin.qq.com/s/lG3mGfKAvTrI7UL383D6Kw 我的3次相亲经历，次次都教我做人 65 31 22641 36
25 https://mp.weixin.qq.com/s/bT33bHJcsf_Jpwx9mjswNg 2060年，那个失踪的宇航员回来了...... 11 9 10981 13
24 https://mp.weixin.qq.com/s/FBzJZzmzNrpeNtcQBSY4fQ “好不容易上个大学，谈什么恋爱啊” 39 33 8760 39 
23 https://mp.weixin.qq.com/s/1JBaS5FTcrzRnylIBaoAKg 富家女离奇死亡，摩天轮内发现惊人一幕 29 23 12573 28
22 https://mp.weixin.qq.com/s/pfqKkHNI9bQDbhdv4gPAnw 有好教养的人，总是闪闪发光的啊 17 12 10745 55
21 https://mp.weixin.qq.com/s/o6aGhHp5uI3Nquy0usaaww 优质男：姑娘，我凭什么娶你？ 62 50 21840 88
20 https://mp.weixin.qq.com/s/PoiHroXm3V1kKjj3u1jnAw 那个改变了我一生的老男人······ 27 20 12552 74
19 https://mp.weixin.qq.com/s/IpXCQ6YPFrq39T1hFu4P-g “叔叔阿姨，那个...能小点声吗？” 37 34 31607 72
18 https://mp.weixin.qq.com/s/8WOH-pBrSCyEyByf8AOi3A “我，23岁，拖延癌晚期，还有救吗？” 17 13 9256 48
17 https://mp.weixin.qq.com/s/74gJMnvGILwajfFMwWFc_g “十二年了，我才没那么想他” 77 71 14173 61
16 https://mp.weixin.qq.com/s/Fb6Ygp07QkaQYFh-O2OBOw 十年工厂生涯，我活成了没有梦想的中年人 96 74 12835 70 
15 https://mp.weixin.qq.com/s/n7mTI2dOAPQjG312gXP_8g 你现在这么努力，是为了有朝一日“有得选” 15 11 11637 76
14 https://mp.weixin.qq.com/s/vJpJkwMlqZLLvmf6W342gg 谢谢你，给我18厘米的爱情 90 55 27232 83
13 https://mp.weixin.qq.com/s/TJrq7zNELA48CG_WUJRtnA 我爱上了隔壁那个被家暴的女人 59 40 19771 32
12 https://mp.weixin.qq.com/s/zOQrwG5q7lwvypabYDs27w 你以为是丑拒，其实是...... 25 11 14861 41
11 https://mp.weixin.qq.com/s/l5GKBMa0RMYa5Zs_Z-J1bQ  越是难熬的日子，越要有事可做 22 18 13294 101
11 https://mp.weixin.qq.com/s/jUHhqDS2fjLjTXY551Bn5w 追我那么久，请你放过我 71 64 18788 101
10 https://mp.weixin.qq.com/s/8y2jAt5be1ndl1JNV4H-1A 我犯了一种罪，叫长的不好看 67 34 16087 101
9 https://mp.weixin.qq.com/s/k8uidACpKxz6a8YCg-kwzQ 你都用不起SK-II ，还敢熬这么深的夜？ 39 34 13146 54
8 https://mp.weixin.qq.com/s/Vt_nd4xx5gEhNXgyzojAcQ 你这么内向，那应该找不到对象吧 100 81 17036 124 
7 https://mp.weixin.qq.com/s/SU3CHUNT7l5Hy0P8WWYPAw 想用自律打败低配人生，你配吗？ 57 46 1.8w 117
6 https://mp.weixin.qq.com/s/FoKMrZ-gvzn1RWUtsFQzJQ 为什么大多数人宁愿吃生活的苦，也不愿吃学习的苦？ 16 12 7988 57
5 https://mp.weixin.qq.com/s/ugG71ETZOAygI-DhMruCEA 越优秀的人，越不安分 32 22 1.5w 191
4 https://mp.weixin.qq.com/s/e1mif6nhCJ-XeRoilhW83A 毕业了，谁又不曾有过爱情的遗憾 43 34 9073 30
3 https://mp.weixin.qq.com/s/nHhoFhuNojiAqqHKkfBYLQ 经营一段亲密关系，难吗？ 22 18 1.2w 69
2 https://mp.weixin.qq.com/s/RqrH9kdgUHIiAfS_vxg3QA 婆媳之间，何止是缘分？ 37 27 1.0w 70
1 https://mp.weixin.qq.com/s/QMEy489ohNGHiETixElgMQ 不合群的你，其实也很酷 57 45 1.4w 174
```