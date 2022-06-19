Content-Type: multipart/mixed; boundary="===============8942087908992251259=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3429/4317] ERROR: modpost: "qcom_smem_get" [drivers/soc/qcom/socinfo.ko] undefined!
Date: Sun, 19 Jun 2022 10:01:13 +0800
Message-ID: <202206190926.W6R3MC2h-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8942087908992251259==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 ERROR: modpost: "qcom_smem_get" [drivers/soc/qcom/socinfo.ko] undefined!"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Christian 'Ansuel' Marangi" <ansuelsmth@gmail.com>
CC: Paolo Abeni <pabeni@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   07dc787be2316e243a16a33d0a9b734cd9365bd3
commit: 9ec092d2feb69045dd289845024301fb91c064ee [3429/4317] net: ethernet:=
 stmmac: add missing sgmii configure for ipq806x
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-s031-20220619 (https://download.01.org/0day-ci/arc=
hive/20220619/202206190926.W6R3MC2h-lkp(a)intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-30-g92122700-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D9ec092d2feb69045dd289845024301fb91c064ee
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 9ec092d2feb69045dd289845024301fb91c064ee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dr=
iscv SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "qcom_smem_get" [drivers/soc/qcom/socinfo.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for QCOM_SOCINFO
   Depends on QCOM_SMEM
   Selected by
   - DWMAC_IPQ806X && NETDEVICES && ETHERNET && NET_VENDOR_STMICRO && STMMA=
C_ETH && STMMAC_PLATFORM && OF && (ARCH_QCOM || COMPILE_TEST

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8942087908992251259==--

