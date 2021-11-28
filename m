Content-Type: multipart/mixed; boundary="===============5164662499980213693=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [t-kristo-pm:usi-5.16-rfc-v2-bpf 24/30] drivers/hid/hid-debug.c:1029:57: sparse: sparse: obsolete array initializer, use C99 syntax
Date: Mon, 29 Nov 2021 03:07:25 +0800
Message-ID: <202111290200.V12OhjgD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5164662499980213693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mika Westerberg <mika.westerberg@linux.intel.com>
CC: Tero Kristo <tero.kristo@linux.intel.com>

tree:   https://github.com/t-kristo/linux-pm usi-5.16-rfc-v2-bpf
head:   241207b4769fca049dfcc4dbde0bda92e4f67027
commit: f6d52d17b96916ae3e76774b1aec80d638dbf46c [24/30] HID: debug: Add US=
I usages
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-s032-20211128 (https://download.01.org/0day-ci/arc=
hive/20211129/202111290200.V12OhjgD-lkp(a)intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/t-kristo/linux-pm/commit/f6d52d17b96916ae3e767=
74b1aec80d638dbf46c
        git remote add t-kristo-pm https://github.com/t-kristo/linux-pm
        git fetch --no-tags t-kristo-pm usi-5.16-rfc-v2-bpf
        git checkout f6d52d17b96916ae3e76774b1aec80d638dbf46c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dr=
iscv SHELL=3D/bin/bash drivers/hid/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/hid/hid-debug.c:1029:57: sparse: sparse: obsolete array initiali=
zer, use C99 syntax

vim +1029 drivers/hid/hid-debug.c

c080d89ad91e98 Jiri Kosina     2007-01-25  1025  =

0ce1ac3b3ca0f4 Joe Perches     2007-09-26  1026  static const char *misc[MS=
C_MAX + 1] =3D {
c080d89ad91e98 Jiri Kosina     2007-01-25  1027  	[MSC_SERIAL] =3D "Serial"=
,	[MSC_PULSELED] =3D "Pulseled",
f6d52d17b96916 Mika Westerberg 2021-01-22  1028  	[MSC_GESTURE] =3D "Gestur=
e",	[MSC_RAW] =3D "RawData",
f6d52d17b96916 Mika Westerberg 2021-01-22 @1029  	[MSC_PEN_ID] =3D "PenID",=
		[MSC_PEN_COLOR] "PenColor",
f6d52d17b96916 Mika Westerberg 2021-01-22  1030  	[MSC_PEN_LINE_WIDTH] =3D =
"PenLineWidth",
f6d52d17b96916 Mika Westerberg 2021-01-22  1031  	[MSC_PEN_LINE_STYLE] =3D =
"PenLineStyle",
c080d89ad91e98 Jiri Kosina     2007-01-25  1032  };
c080d89ad91e98 Jiri Kosina     2007-01-25  1033  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5164662499980213693==--

