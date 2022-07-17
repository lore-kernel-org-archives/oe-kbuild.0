Content-Type: multipart/mixed; boundary="===============0322942224074937759=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/riscv/purgatory/kexec-purgatory.c:1882:9: sparse: sparse: trying to concatenate 30064-character string (8191 bytes max)
Date: Sun, 17 Jul 2022 22:51:48 +0800
Message-ID: <202207172214.udYzFPWd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0322942224074937759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 arch/riscv/purgatory/kexec-purgatory.c:1882:9: sparse: sparse: trying to c=
oncatenate 30064-character string (8191 bytes max)"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Li Zhengyu <lizhengyu3@huawei.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>

Hi Li,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   972a278fe60c361eb8f37619f562f092e8786d7c
commit: 736e30af583fb6e0e2b8211b894ff99dea0f1ee7 RISC-V: Add purgatory
date:   8 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 8 weeks ago
config: riscv-randconfig-s031-20220717 (https://download.01.org/0day-ci/arc=
hive/20220717/202207172214.udYzFPWd-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D736e30af583fb6e0e2b8211b894ff99dea0f1ee7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 736e30af583fb6e0e2b8211b894ff99dea0f1ee7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dr=
iscv SHELL=3D/bin/bash arch/riscv/purgatory/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> arch/riscv/purgatory/kexec-purgatory.c:1882:9: sparse: sparse: trying to=
 concatenate 30064-character string (8191 bytes max)

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0322942224074937759==--

