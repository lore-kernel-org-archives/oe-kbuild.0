Content-Type: multipart/mixed; boundary="===============4310240304237947480=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v6 5/9] w1_therm: adding resolution sysfs entry
Date: Mon, 11 May 2020 00:28:03 +0800
Message-ID: <202005110026.OCMXE3M8%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4310240304237947480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200510141707.173273-1-akira215corp@gmail.com>
References: <20200510141707.173273-1-akira215corp@gmail.com>
TO: Akira Shimahara <akira215corp@gmail.com>
TO: greg(a)kroah.com
TO: rdunlap(a)infradead.org
CC: zbr(a)ioremap.net
CC: linux-kernel(a)vger.kernel.org
CC: Akira Shimahara <akira215corp@gmail.com>

Hi Akira,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.7-rc4 next-20200508]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Akira-Shimahara/w1_therm-a=
dding-code-comments-and-code-reordering/20200510-222040
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
e99332e7b4cda6e60f5b5916cf9943a79dbef902
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/w1/slaves/w1_therm.c:390:6: warning: Redundant initialization fo=
r 'ret'. The initialized value is overwritten before it is read. [redundant=
Initialization]
    ret =3D read_scratchpad(sl, &info);
        ^
   drivers/w1/slaves/w1_therm.c:376:10: note: ret is initialized
    int ret =3D -ENODEV;
            ^
   drivers/w1/slaves/w1_therm.c:390:6: note: ret is overwritten
    ret =3D read_scratchpad(sl, &info);
        ^
   drivers/w1/slaves/w1_therm.c:412:6: warning: Redundant initialization fo=
r 'ret'. The initialized value is overwritten before it is read. [redundant=
Initialization]
    ret =3D read_scratchpad(sl, &info);
        ^
   drivers/w1/slaves/w1_therm.c:408:10: note: ret is initialized
    int ret =3D -ENODEV;
            ^
   drivers/w1/slaves/w1_therm.c:412:6: note: ret is overwritten
    ret =3D read_scratchpad(sl, &info);
        ^
>> drivers/w1/slaves/w1_therm.c:765:9: warning: Variable 'ret' is reassigne=
d a value before the old one has been used. [redundantAssignment]
       ret =3D 0;
           ^
   drivers/w1/slaves/w1_therm.c:758:9: note: ret is assigned
       ret =3D -EIO;
           ^
   drivers/w1/slaves/w1_therm.c:765:9: note: ret is overwritten
       ret =3D 0;
           ^

# https://github.com/0day-ci/linux/commit/660c8cc0fcf6b44dc06925055938090c4=
c937dab
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 660c8cc0fcf6b44dc06925055938090c4c937dab
vim +/ret +390 drivers/w1/slaves/w1_therm.c

0a19f129d71f18 Ben Sen            2016-05-01  373  =

660c8cc0fcf6b4 Akira Shimahara    2020-05-10  374  static inline int w1_DS1=
8B20_set_resolution(struct w1_slave *sl, int val)
660c8cc0fcf6b4 Akira Shimahara    2020-05-10  375  {
660c8cc0fcf6b4 Akira Shimahara    2020-05-10  376  	int ret =3D -ENODEV;
660c8cc0fcf6b4 Akira Shimahara    2020-05-10  377  	u8 new_config_register[=
3];	/* array of data to be written */
660c8cc0fcf6b4 Akira Shimahara    2020-05-10  378  	struct therm_info info;
f53459c00871a7 Alexey Khoroshilov 2017-10-22  379  =

660c8cc0fcf6b4 Akira Shimahara    2020-05-10  380  	/* resolution of DS18B2=
0 is in the range [9..12] bits */
660c8cc0fcf6b4 Akira Shimahara    2020-05-10  381  	if (val < 9 || val > 12)
660c8cc0fcf6b4 Akira Shimahara    2020-05-10  382  		return -EINVAL;
f53459c00871a7 Alexey Khoroshilov 2017-10-22  383  =

660c8cc0fcf6b4 Akira Shimahara    2020-05-10  384  	val -=3D 9; /* soustrac=
t 9 the lowest resolution in bit */
660c8cc0fcf6b4 Akira Shimahara    2020-05-10  385  	val =3D (val << 5); /* =
shift to position bit 5 & bit 6 */
0a19f129d71f18 Ben Sen            2016-05-01  386  =

660c8cc0fcf6b4 Akira Shimahara    2020-05-10  387  	/* Read the scratchpad =
to change only the required bits
660c8cc0fcf6b4 Akira Shimahara    2020-05-10  388  	 * (bit5 & bit 6 from b=
yte 4)
660c8cc0fcf6b4 Akira Shimahara    2020-05-10  389  	 */
660c8cc0fcf6b4 Akira Shimahara    2020-05-10 @390  	ret =3D read_scratchpad=
(sl, &info);
660c8cc0fcf6b4 Akira Shimahara    2020-05-10  391  	if (!ret) {
660c8cc0fcf6b4 Akira Shimahara    2020-05-10  392  		new_config_register[0]=
 =3D info.rom[2];
660c8cc0fcf6b4 Akira Shimahara    2020-05-10  393  		new_config_register[1]=
 =3D info.rom[3];
660c8cc0fcf6b4 Akira Shimahara    2020-05-10  394  		/* config register is =
byte 4 & mask 0b10011111*/
660c8cc0fcf6b4 Akira Shimahara    2020-05-10  395  		new_config_register[2]=
 =3D (info.rom[4] & 0x9F) |
660c8cc0fcf6b4 Akira Shimahara    2020-05-10  396  					(u8) val;
660c8cc0fcf6b4 Akira Shimahara    2020-05-10  397  	} else
660c8cc0fcf6b4 Akira Shimahara    2020-05-10  398  		return ret;
0a19f129d71f18 Ben Sen            2016-05-01  399  =

660c8cc0fcf6b4 Akira Shimahara    2020-05-10  400  	/* Write data in the de=
vice RAM */
660c8cc0fcf6b4 Akira Shimahara    2020-05-10  401  	ret =3D w1_DS18B20_writ=
e_data(sl, new_config_register);
0a19f129d71f18 Ben Sen            2016-05-01  402  =

660c8cc0fcf6b4 Akira Shimahara    2020-05-10  403  	return ret;
660c8cc0fcf6b4 Akira Shimahara    2020-05-10  404  }
0a19f129d71f18 Ben Sen            2016-05-01  405  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============4310240304237947480==--

