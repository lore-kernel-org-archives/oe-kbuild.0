Content-Type: multipart/mixed; boundary="===============2932105496930266212=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4795/7943] drivers/rtc/rtc-rv8803.c:283:3-9: preceding lock on line 272
Date: Tue, 05 Jul 2022 03:28:49 +0800
Message-ID: <202207050301.zmaRfuPC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2932105496930266212==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Ahmad Fatoum <a.fatoum@pengutronix.de>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Sascha Hauer <s.hauer@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   b6f1f2fa2bddd69ff46a190b8120bd440fd50563
commit: f8176e0bb83ff8dcc6d9fa8595a0966e631d2ba7 [4795/7943] rtc: rv8803: i=
nitialize registers on post-probe voltage loss
:::::: branch date: 11 hours ago
:::::: commit date: 10 days ago
config: arm-randconfig-c003-20220704 (https://download.01.org/0day-ci/archi=
ve/20220705/202207050301.zmaRfuPC-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/rtc/rtc-rv8803.c:283:3-9: preceding lock on line 272

vim +283 drivers/rtc/rtc-rv8803.c

1e3929ef0e1c4c Alexandre Belloni 2015-11-02  237  =

1e3929ef0e1c4c Alexandre Belloni 2015-11-02  238  static int rv8803_set_tim=
e(struct device *dev, struct rtc_time *tm)
1e3929ef0e1c4c Alexandre Belloni 2015-11-02  239  {
1e3929ef0e1c4c Alexandre Belloni 2015-11-02  240  	struct rv8803_data *rv88=
03 =3D dev_get_drvdata(dev);
1e3929ef0e1c4c Alexandre Belloni 2015-11-02  241  	u8 date[7];
d3700b6b6479d2 Beno=C3=AEt Th=C3=A9baudeau 2016-07-21  242  	int ctrl, flag=
s, ret;
1e3929ef0e1c4c Alexandre Belloni 2015-11-02  243  =

d3700b6b6479d2 Beno=C3=AEt Th=C3=A9baudeau 2016-07-21  244  	ctrl =3D rv880=
3_read_reg(rv8803->client, RV8803_CTRL);
d3700b6b6479d2 Beno=C3=AEt Th=C3=A9baudeau 2016-07-21  245  	if (ctrl < 0)
d3700b6b6479d2 Beno=C3=AEt Th=C3=A9baudeau 2016-07-21  246  		return ctrl;
d3700b6b6479d2 Beno=C3=AEt Th=C3=A9baudeau 2016-07-21  247  =

d3700b6b6479d2 Beno=C3=AEt Th=C3=A9baudeau 2016-07-21  248  	/* Stop the cl=
ock */
d3700b6b6479d2 Beno=C3=AEt Th=C3=A9baudeau 2016-07-21  249  	ret =3D rv8803=
_write_reg(rv8803->client, RV8803_CTRL,
d3700b6b6479d2 Beno=C3=AEt Th=C3=A9baudeau 2016-07-21  250  			       ctrl =
| RV8803_CTRL_RESET);
d3700b6b6479d2 Beno=C3=AEt Th=C3=A9baudeau 2016-07-21  251  	if (ret)
d3700b6b6479d2 Beno=C3=AEt Th=C3=A9baudeau 2016-07-21  252  		return ret;
d3700b6b6479d2 Beno=C3=AEt Th=C3=A9baudeau 2016-07-21  253  =

1e3929ef0e1c4c Alexandre Belloni 2015-11-02  254  	date[RV8803_SEC]   =3D b=
in2bcd(tm->tm_sec);
1e3929ef0e1c4c Alexandre Belloni 2015-11-02  255  	date[RV8803_MIN]   =3D b=
in2bcd(tm->tm_min);
1e3929ef0e1c4c Alexandre Belloni 2015-11-02  256  	date[RV8803_HOUR]  =3D b=
in2bcd(tm->tm_hour);
1e3929ef0e1c4c Alexandre Belloni 2015-11-02  257  	date[RV8803_WEEK]  =3D 1=
 << (tm->tm_wday);
1e3929ef0e1c4c Alexandre Belloni 2015-11-02  258  	date[RV8803_DAY]   =3D b=
in2bcd(tm->tm_mday);
1e3929ef0e1c4c Alexandre Belloni 2015-11-02  259  	date[RV8803_MONTH] =3D b=
in2bcd(tm->tm_mon + 1);
1e3929ef0e1c4c Alexandre Belloni 2015-11-02  260  	date[RV8803_YEAR]  =3D b=
in2bcd(tm->tm_year - 100);
1e3929ef0e1c4c Alexandre Belloni 2015-11-02  261  =

d522649e2686ec Beno=C3=AEt Th=C3=A9baudeau 2016-07-21  262  	ret =3D rv8803=
_write_regs(rv8803->client, RV8803_SEC, 7, date);
d522649e2686ec Beno=C3=AEt Th=C3=A9baudeau 2016-07-21  263  	if (ret)
1e3929ef0e1c4c Alexandre Belloni 2015-11-02  264  		return ret;
1e3929ef0e1c4c Alexandre Belloni 2015-11-02  265  =

d3700b6b6479d2 Beno=C3=AEt Th=C3=A9baudeau 2016-07-21  266  	/* Restart the=
 clock */
d3700b6b6479d2 Beno=C3=AEt Th=C3=A9baudeau 2016-07-21  267  	ret =3D rv8803=
_write_reg(rv8803->client, RV8803_CTRL,
d3700b6b6479d2 Beno=C3=AEt Th=C3=A9baudeau 2016-07-21  268  			       ctrl =
& ~RV8803_CTRL_RESET);
d3700b6b6479d2 Beno=C3=AEt Th=C3=A9baudeau 2016-07-21  269  	if (ret)
d3700b6b6479d2 Beno=C3=AEt Th=C3=A9baudeau 2016-07-21  270  		return ret;
d3700b6b6479d2 Beno=C3=AEt Th=C3=A9baudeau 2016-07-21  271  =

9d1fa4c3737ac8 Oleksij Rempel    2016-02-04 @272  	mutex_lock(&rv8803->flag=
s_lock);
1e3929ef0e1c4c Alexandre Belloni 2015-11-02  273  =

d522649e2686ec Beno=C3=AEt Th=C3=A9baudeau 2016-07-21  274  	flags =3D rv88=
03_read_reg(rv8803->client, RV8803_FLAG);
1e3929ef0e1c4c Alexandre Belloni 2015-11-02  275  	if (flags < 0) {
9d1fa4c3737ac8 Oleksij Rempel    2016-02-04  276  		mutex_unlock(&rv8803->f=
lags_lock);
1e3929ef0e1c4c Alexandre Belloni 2015-11-02  277  		return flags;
1e3929ef0e1c4c Alexandre Belloni 2015-11-02  278  	}
1e3929ef0e1c4c Alexandre Belloni 2015-11-02  279  =

f8176e0bb83ff8 Ahmad Fatoum      2022-04-26  280  	if (flags & RV8803_FLAG_=
V2F) {
f8176e0bb83ff8 Ahmad Fatoum      2022-04-26  281  		ret =3D rv8803_regs_res=
et(rv8803);
f8176e0bb83ff8 Ahmad Fatoum      2022-04-26  282  		if (ret)
f8176e0bb83ff8 Ahmad Fatoum      2022-04-26 @283  			return ret;
f8176e0bb83ff8 Ahmad Fatoum      2022-04-26  284  	}
f8176e0bb83ff8 Ahmad Fatoum      2022-04-26  285  =

d522649e2686ec Beno=C3=AEt Th=C3=A9baudeau 2016-07-21  286  	ret =3D rv8803=
_write_reg(rv8803->client, RV8803_FLAG,
6f367788d6333a Beno=C3=AEt Th=C3=A9baudeau 2016-07-21  287  			       flags=
 & ~(RV8803_FLAG_V1F | RV8803_FLAG_V2F));
1e3929ef0e1c4c Alexandre Belloni 2015-11-02  288  =

9d1fa4c3737ac8 Oleksij Rempel    2016-02-04  289  	mutex_unlock(&rv8803->fl=
ags_lock);
1e3929ef0e1c4c Alexandre Belloni 2015-11-02  290  =

1e3929ef0e1c4c Alexandre Belloni 2015-11-02  291  	return ret;
1e3929ef0e1c4c Alexandre Belloni 2015-11-02  292  }
1e3929ef0e1c4c Alexandre Belloni 2015-11-02  293  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2932105496930266212==--

