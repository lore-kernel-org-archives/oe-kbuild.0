Content-Type: multipart/mixed; boundary="===============1747222509943523629=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 26/28] mfd: stmpe: Remove #ifdef guards for PM related functions
Date: Mon, 08 Aug 2022 03:47:43 +0800
Message-ID: <202208080336.hawhxmJ5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1747222509943523629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/m=
fd/stmpe.c:1531:7: sparse: sparse: duplicate const"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220807145247.46107-27-paul@crapouillou.net>
References: <20220807145247.46107-27-paul@crapouillou.net>
TO: Paul Cercueil <paul@crapouillou.net>
TO: Lee Jones <lee.jones@linaro.org>
CC: linux-kernel(a)vger.kernel.org
CC: Paul Cercueil <paul@crapouillou.net>
CC: Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: linux-stm32(a)st-md-mailman.stormreply.com
CC: linux-arm-kernel(a)lists.infradead.org

Hi Paul,

I love your patch! Perhaps something to improve:

[auto build test WARNING on v5.19]
[cannot apply to lee-mfd/for-mfd-next linus/master next-20220805]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Cercueil/mfd-Re=
move-ifdef-guards-for-PM-functions/20220807-225947
base:    3d7cb6b04c3f3115719235cc6866b10326de34cd
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: riscv-randconfig-s032-20220807 (https://download.01.org/0day-ci/arc=
hive/20220808/202208080336.hawhxmJ5-lkp(a)intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/e94df3ff809e5883206=
25b95a2ef6485965ddc02
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Paul-Cercueil/mfd-Remove-ifdef-gua=
rds-for-PM-functions/20220807-225947
        git checkout e94df3ff809e588320625b95a2ef6485965ddc02
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dr=
iscv SHELL=3D/bin/bash drivers/mfd/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/mfd/stmpe.c:1531:7: sparse: sparse: duplicate const

vim +1531 drivers/mfd/stmpe.c

27e34995e1a863 Rabin Vincent 2010-07-02  1530  =

e94df3ff809e58 Paul Cercueil 2022-08-07 @1531  const EXPORT_GPL_SIMPLE_DEV_=
PM_OPS(stmpe_dev_pm_ops,

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1747222509943523629==--

