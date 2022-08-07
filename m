Content-Type: multipart/mixed; boundary="===============0967366584222829319=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH v1] pinctrl: imx8m: kconfig: Depends on SOC_IMX8M
Date: Sun, 07 Aug 2022 15:58:22 +0800
Message-ID: <202208071509.57e6zWDc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0967366584222829319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "only Kconfig file updated"
:::::: =


BCC: lkp(a)intel.com
CC: Paul Gazzillo <paul@pgazz.com>
CC: Necip Fazil Yildiran <fazilyildiran@gmail.com>
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220802110232.130758-1-francesco.dolcini@toradex.com>
References: <20220802110232.130758-1-francesco.dolcini@toradex.com>
TO: Francesco Dolcini <francesco.dolcini@toradex.com>

Hi Francesco,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linus/master v5.19 next-20220805]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Francesco-Dolcini/pi=
nctrl-imx8m-kconfig-Depends-on-SOC_IMX8M/20220802-190320
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctr=
l.git devel
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-kismet-CONFIG_PINCTRL_IMX-CONFIG_PINCTRL_IMX8MP-0-0 (https:/=
/download.01.org/0day-ci/archive/20220807/202208071509.57e6zWDc-lkp(a)intel=
.com/config)
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/8cf69707b586a5aaa92=
ba9757f2d98383b220a43
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Francesco-Dolcini/pinctrl-imx8m-kc=
onfig-Depends-on-SOC_IMX8M/20220802-190320
        git checkout 8cf69707b586a5aaa92ba9757f2d98383b220a43
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/=
README.md
           kismet --linux-ksrc=3Dlinux --selectees CONFIG_PINCTRL_IMX --sel=
ectors CONFIG_PINCTRL_IMX8MP -a=3Dx86_64
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=3Dx86_64 olddefconfig

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PINCTRL_IMX when=
 selected by PINCTRL_IMX8MP
   =

   WARNING: unmet direct dependencies detected for PINCTRL_IMX
     Depends on [n]: PINCTRL [=3Dy] && OF [=3Dn]
     Selected by [y]:
     - PINCTRL_IMX8MP [=3Dy] && PINCTRL [=3Dy] && SOC_IMX8M [=3Dy]

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0967366584222829319==--

