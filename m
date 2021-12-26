Content-Type: multipart/mixed; boundary="===============4962043893847828260=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 5/9] pinctrl: nuvoton: Add driver for WPCM450
Date: Sun, 26 Dec 2021 20:51:44 +0800
Message-ID: <202112262026.RKL5pvdB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4962043893847828260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211224200935.93817-6-j.neuschaefer@gmx.net>
References: <20211224200935.93817-6-j.neuschaefer@gmx.net>
TO: "Jonathan Neusch=C3=A4fer" <j.neuschaefer@gmx.net>
TO: linux-gpio(a)vger.kernel.org
TO: devicetree(a)vger.kernel.org
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>
CC: openbmc(a)lists.ozlabs.org
CC: Tomer Maimon <tmaimon77@gmail.com>
CC: Joel Stanley <joel@jms.id.au>
CC: linux-kernel(a)vger.kernel.org
CC: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: Avi Fishman <avifishman70@gmail.com>

Hi "Jonathan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v5.16-rc6 next-20211224]
[cannot apply to linusw-pinctrl/devel]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jonathan-Neusch-fer/Nuvoto=
n-WPCM450-pinctrl-and-GPIO-driver/20211225-041250
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc64-randconfig-s032-20211226 (https://download.01.org/0day-ci=
/archive/20211226/202112262026.RKL5pvdB-lkp(a)intel.com/config)
compiler: powerpc64le-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/39b607b5a8008c45ee5fe7ac7=
df94bfa6ba509b0
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jonathan-Neusch-fer/Nuvoton-WPCM45=
0-pinctrl-and-GPIO-driver/20211225-041250
        git checkout 39b607b5a8008c45ee5fe7ac7df94bfa6ba509b0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dp=
owerpc SHELL=3D/bin/bash drivers/pinctrl/nuvoton/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:5:
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c: In function 'npcm7xx_get_grou=
ps_count':
>> drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1564:28: warning: format '%d' =
expects argument of type 'int', but argument 4 has type 'long unsigned int'=
 [-Wformat=3D]
    1564 |         dev_dbg(npcm->dev, "group size: %d\n", ARRAY_SIZE(npcm7x=
x_groups));
         |                            ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:129:41: note: in definition of macro 'dev_pri=
ntk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);    =
        \
         |                                         ^~~
   include/linux/dev_printk.h:158:37: note: in expansion of macro 'dev_fmt'
     158 |         dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                     ^~~~~~~
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1564:9: note: in expansion of =
macro 'dev_dbg'
    1564 |         dev_dbg(npcm->dev, "group size: %d\n", ARRAY_SIZE(npcm7x=
x_groups));
         |         ^~~~~~~
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1564:42: note: format string i=
s defined here
    1564 |         dev_dbg(npcm->dev, "group size: %d\n", ARRAY_SIZE(npcm7x=
x_groups));
         |                                         ~^
         |                                          |
         |                                          int
         |                                         %ld


vim +1564 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c

3b588e43ee5c7a Tomer Maimon 2018-08-08  1559  =

3b588e43ee5c7a Tomer Maimon 2018-08-08  1560  static int npcm7xx_get_groups=
_count(struct pinctrl_dev *pctldev)
3b588e43ee5c7a Tomer Maimon 2018-08-08  1561  {
3b588e43ee5c7a Tomer Maimon 2018-08-08  1562  	struct npcm7xx_pinctrl *npcm=
 =3D pinctrl_dev_get_drvdata(pctldev);
3b588e43ee5c7a Tomer Maimon 2018-08-08  1563  =

3b588e43ee5c7a Tomer Maimon 2018-08-08 @1564  	dev_dbg(npcm->dev, "group si=
ze: %d\n", ARRAY_SIZE(npcm7xx_groups));
3b588e43ee5c7a Tomer Maimon 2018-08-08  1565  	return ARRAY_SIZE(npcm7xx_gr=
oups);
3b588e43ee5c7a Tomer Maimon 2018-08-08  1566  }
3b588e43ee5c7a Tomer Maimon 2018-08-08  1567  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4962043893847828260==--

