Content-Type: multipart/mixed; boundary="===============5011187105901265140=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Add sata nodes to rk356x
Date: Wed, 02 Mar 2022 05:44:51 +0800
Message-ID: <202203020519.laJnMRjD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5011187105901265140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220227082131.131883-1-linux@fw-web.de>
References: <20220227082131.131883-1-linux@fw-web.de>
TO: Frank Wunderlich <linux@fw-web.de>

Hi Frank,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on v5.17-rc6 next-20220301]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Frank-Wunderlich/arm64-dts=
-rockchip-Add-sata-nodes-to-rk356x/20220227-162306
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchi=
p.git for-next
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-s031-20220301 (https://download.01.org/0day-ci/arc=
hive/20220302/202203020519.laJnMRjD-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/2e7fa3bd39c4a4103d0b14d6b=
4a5a737c79ba78a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Frank-Wunderlich/arm64-dts-rockchi=
p-Add-sata-nodes-to-rk356x/20220227-162306
        git checkout 2e7fa3bd39c4a4103d0b14d6b4a5a737c79ba78a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rm64 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ERROR: Input tree has errors, aborting (use -f to force output)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5011187105901265140==--

