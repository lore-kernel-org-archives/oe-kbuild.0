Content-Type: multipart/mixed; boundary="===============3260846354550995674=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v16 8/8] ARM: dts: imx7d: remarkable2: Enable lcdif
Date: Sun, 05 Dec 2021 22:26:05 +0800
Message-ID: <202112052123.Q9Dgewcq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3260846354550995674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211202120758.41478-9-alistair@alistair23.me>
References: <20211202120758.41478-9-alistair@alistair23.me>
TO: Alistair Francis <alistair@alistair23.me>
TO: kernel(a)pengutronix.de
TO: robh+dt(a)kernel.org
TO: lee.jones(a)linaro.org
TO: lgirdwood(a)gmail.com
TO: broonie(a)kernel.org
CC: linux-arm-kernel(a)lists.infradead.org
CC: alistair23(a)gmail.com
CC: linux-hwmon(a)vger.kernel.org
CC: andreas(a)kemnade.info
CC: s.hauer(a)pengutronix.de

Hi Alistair,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on lee-mfd/for-mfd-next robh/for-next v5.16-rc3 ne=
xt-20211203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Alistair-Francis/Add-suppo=
rt-for-the-silergy-sy7636a/20211202-201116
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-stagin=
g.git hwmon-next
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce: make ARCH=3Darm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


dtcheck warnings: (new ones prefixed by >>)
   make[2]: *** [scripts/Makefile.lib:346: arch/arm/boot/dts/imx7d-remarkab=
le2.dtb] Error 1
>> make[2]: *** [scripts/Makefile.lib:373: arch/arm/boot/dts/imx7d-remarkab=
le2.dt.yaml] Error 1
   make[2]: Target '__build' not remade because of errors.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3260846354550995674==--

