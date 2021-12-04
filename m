Content-Type: multipart/mixed; boundary="===============8668304421091825659=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [t-kristo-pm:usi-5.16-rfc-v3-bpf 22/24] drivers/hid/hid-debug.c:1029:57: sparse: sparse: obsolete array initializer, use C99 syntax
Date: Sun, 05 Dec 2021 00:39:20 +0800
Message-ID: <202112050025.GsWXdL79-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8668304421091825659==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mika Westerberg <mika.westerberg@linux.intel.com>
CC: Tero Kristo <tero.kristo@linux.intel.com>

tree:   https://github.com/t-kristo/linux-pm usi-5.16-rfc-v3-bpf
head:   d0f251812c57f49830816624bec858500e4e14c2
commit: 36d39063386a91ddea88dcd8378b00c7e167d23d [22/24] HID: debug: Add US=
I usages
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-s002-20211203 (https://download.01.org/0day-ci/arch=
ive/20211205/202112050025.GsWXdL79-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/t-kristo/linux-pm/commit/36d39063386a91ddea88d=
cd8378b00c7e167d23d
        git remote add t-kristo-pm https://github.com/t-kristo/linux-pm
        git fetch --no-tags t-kristo-pm usi-5.16-rfc-v3-bpf
        git checkout 36d39063386a91ddea88dcd8378b00c7e167d23d
        # save the config file to linux build tree
        mkdir build_dir
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash drivers/hid/

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
36d39063386a91 Mika Westerberg 2021-01-22  1028  	[MSC_GESTURE] =3D "Gestur=
e",	[MSC_RAW] =3D "RawData",
36d39063386a91 Mika Westerberg 2021-01-22 @1029  	[MSC_PEN_ID] =3D "PenID",=
		[MSC_PEN_COLOR] "PenColor",
36d39063386a91 Mika Westerberg 2021-01-22  1030  	[MSC_PEN_LINE_WIDTH] =3D =
"PenLineWidth",
36d39063386a91 Mika Westerberg 2021-01-22  1031  	[MSC_PEN_LINE_STYLE] =3D =
"PenLineStyle",
c080d89ad91e98 Jiri Kosina     2007-01-25  1032  };
c080d89ad91e98 Jiri Kosina     2007-01-25  1033  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8668304421091825659==--

