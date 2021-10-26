Content-Type: multipart/mixed; boundary="===============8387866120973730867=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1162/11483] drivers/iio/adc/at91-sama5d2_adc.c:530:0: warning: syntax error [syntaxError]
Date: Wed, 27 Oct 2021 04:02:18 +0800
Message-ID: <202110270408.G0Pv9koP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8387866120973730867==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Eugen Hristev <eugen.hristev@microchip.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   2376e5fe91bcad74b997d2cc0535abff79ec73c5
commit: 8940de2e48902e95b588b6244d5a1b61a4d75c4a [1162/11483] iio: adc: at9=
1-sama5d2_adc: convert to platform specific data structures
:::::: branch date: 11 hours ago
:::::: commit date: 6 weeks ago
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/iio/adc/at91-sama5d2_adc.c:530:0: warning: syntax error [syntaxE=
rror]
   =

   ^

vim +530 drivers/iio/adc/at91-sama5d2_adc.c

8940de2e48902e9 Eugen Hristev 2021-09-01  524  =

8940de2e48902e9 Eugen Hristev 2021-09-01  525  static const struct at91_adc=
_platform sama5d2_platform =3D {
8940de2e48902e9 Eugen Hristev 2021-09-01  526  	.layout =3D &sama5d2_layout,
8940de2e48902e9 Eugen Hristev 2021-09-01  527  	.adc_channels =3D &at91_sam=
a5d2_adc_channels,
8940de2e48902e9 Eugen Hristev 2021-09-01  528  #define AT91_SAMA5D2_SINGLE_=
CHAN_CNT 12
8940de2e48902e9 Eugen Hristev 2021-09-01  529  #define AT91_SAMA5D2_DIFF_CH=
AN_CNT 6
8940de2e48902e9 Eugen Hristev 2021-09-01 @530  	.nr_channels =3D AT91_SAMA5=
D2_SINGLE_CHAN_CNT +
8940de2e48902e9 Eugen Hristev 2021-09-01  531  		       AT91_SAMA5D2_DIFF_C=
HAN_CNT,
8940de2e48902e9 Eugen Hristev 2021-09-01  532  #define AT91_SAMA5D2_TOUCH_X=
_CHAN_IDX	(AT91_SAMA5D2_SINGLE_CHAN_CNT + \
8940de2e48902e9 Eugen Hristev 2021-09-01  533  					AT91_SAMA5D2_DIFF_CHAN_=
CNT * 2)
8940de2e48902e9 Eugen Hristev 2021-09-01  534  	.touch_chan_x =3D AT91_SAMA=
5D2_TOUCH_X_CHAN_IDX,
8940de2e48902e9 Eugen Hristev 2021-09-01  535  #define AT91_SAMA5D2_TOUCH_Y=
_CHAN_IDX	(AT91_SAMA5D2_TOUCH_X_CHAN_IDX + 1)
8940de2e48902e9 Eugen Hristev 2021-09-01  536  	.touch_chan_y =3D AT91_SAMA=
5D2_TOUCH_Y_CHAN_IDX,
8940de2e48902e9 Eugen Hristev 2021-09-01  537  #define AT91_SAMA5D2_TOUCH_P=
_CHAN_IDX	(AT91_SAMA5D2_TOUCH_Y_CHAN_IDX + 1)
8940de2e48902e9 Eugen Hristev 2021-09-01  538  	.touch_chan_p =3D AT91_SAMA=
5D2_TOUCH_P_CHAN_IDX,
8940de2e48902e9 Eugen Hristev 2021-09-01  539  #define AT91_SAMA5D2_MAX_CHA=
N_IDX	AT91_SAMA5D2_TOUCH_P_CHAN_IDX
8940de2e48902e9 Eugen Hristev 2021-09-01  540  	.max_channels =3D ARRAY_SIZ=
E(at91_sama5d2_adc_channels),
8940de2e48902e9 Eugen Hristev 2021-09-01  541  	.max_index =3D AT91_SAMA5D2=
_MAX_CHAN_IDX,
8940de2e48902e9 Eugen Hristev 2021-09-01  542  #define AT91_SAMA5D2_HW_TRIG=
_CNT	3
8940de2e48902e9 Eugen Hristev 2021-09-01  543  	.hw_trig_cnt =3D AT91_SAMA5=
D2_HW_TRIG_CNT,
5e1a1da0f8c9142 Eugen Hristev 2017-06-15  544  };
5e1a1da0f8c9142 Eugen Hristev 2017-06-15  545  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8387866120973730867==--

