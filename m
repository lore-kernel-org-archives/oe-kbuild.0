Content-Type: multipart/mixed; boundary="===============8294974326993282824=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 08/11] gpiolib: cdev: Add hardware timestamp clock type
Date: Sat, 05 Feb 2022 01:07:41 +0800
Message-ID: <202202050057.BEoEi8aq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8294974326993282824==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220201222630.21246-9-dipenp@nvidia.com>
References: <20220201222630.21246-9-dipenp@nvidia.com>
TO: Dipen Patel <dipenp@nvidia.com>

Hi Dipen,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 07f8c60fe60f84977dc815ec8a6b1100827c34dd]

url:    https://github.com/0day-ci/linux/commits/Dipen-Patel/Intro-to-Hardw=
are-timestamping-engine/20220202-062447
base:   07f8c60fe60f84977dc815ec8a6b1100827c34dd
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-m021-20220131 (https://download.01.org/0day-ci/arch=
ive/20220205/202202050057.BEoEi8aq-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpio/gpiolib-cdev.c:841 hte_edge_setup() error: uninitialized symbo=
l 'flags'.

Old smatch warnings:
drivers/gpio/gpiolib-cdev.c:2023 lineevent_create() warn: 'irq' not release=
d on lines: 2012.

vim +/flags +841 drivers/gpio/gpiolib-cdev.c

65cff70464068a Kent Gibson 2020-09-28  828  =

09c0523049e7be Dipen Patel 2022-02-01  829  static int hte_edge_setup(struc=
t line *line, u64 eflags)
09c0523049e7be Dipen Patel 2022-02-01  830  {
09c0523049e7be Dipen Patel 2022-02-01  831  	unsigned long flags;
09c0523049e7be Dipen Patel 2022-02-01  832  	struct hte_ts_desc *hdesc =3D =
&line->hdesc;
09c0523049e7be Dipen Patel 2022-02-01  833  =

09c0523049e7be Dipen Patel 2022-02-01  834  	if (eflags & GPIO_V2_LINE_FLAG=
_EDGE_RISING)
09c0523049e7be Dipen Patel 2022-02-01  835  		flags |=3D test_bit(FLAG_ACTI=
VE_LOW, &line->desc->flags) ?
09c0523049e7be Dipen Patel 2022-02-01  836  				  HTE_FALLING_EDGE_TS : HTE=
_RISING_EDGE_TS;
09c0523049e7be Dipen Patel 2022-02-01  837  	if (eflags & GPIO_V2_LINE_FLAG=
_EDGE_FALLING)
09c0523049e7be Dipen Patel 2022-02-01  838  		flags |=3D test_bit(FLAG_ACTI=
VE_LOW, &line->desc->flags) ?
09c0523049e7be Dipen Patel 2022-02-01  839  				  HTE_RISING_EDGE_TS : HTE_=
FALLING_EDGE_TS;
09c0523049e7be Dipen Patel 2022-02-01  840  =

09c0523049e7be Dipen Patel 2022-02-01 @841  	hdesc->attr.edge_flags =3D fla=
gs;
09c0523049e7be Dipen Patel 2022-02-01  842  	hdesc->attr.line_data =3D line=
->desc;
09c0523049e7be Dipen Patel 2022-02-01  843  	hdesc->attr.line_id =3D desc_t=
o_gpio(line->desc);
09c0523049e7be Dipen Patel 2022-02-01  844  	line->total_discard_seq =3D 0;
09c0523049e7be Dipen Patel 2022-02-01  845  =

09c0523049e7be Dipen Patel 2022-02-01  846  	return hte_req_ts_by_linedata_=
ns(hdesc, process_hw_ts,
09c0523049e7be Dipen Patel 2022-02-01  847  					 process_hw_ts_thread, lin=
e);
09c0523049e7be Dipen Patel 2022-02-01  848  }
09c0523049e7be Dipen Patel 2022-02-01  849  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8294974326993282824==--

