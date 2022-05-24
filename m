Content-Type: multipart/mixed; boundary="===============5276341202851594272=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 12649/14079] arch/riscv/purgatory/kexec-purgatory.c:1840:9: sparse: sparse: trying to concatenate 29392-character string (8191 bytes max)
Date: Wed, 25 May 2022 05:25:47 +0800
Message-ID: <202205250507.Ok6YimfM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5276341202851594272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Li Zhengyu <lizhengyu3@huawei.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>

Hi Li,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   09ce5091ff971cdbfd67ad84dc561ea27f10d67a
commit: 736e30af583fb6e0e2b8211b894ff99dea0f1ee7 [12649/14079] RISC-V: Add =
purgatory
:::::: branch date: 12 hours ago
:::::: commit date: 5 days ago
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/2022052=
5/202205250507.Ok6YimfM-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-14-g5a0004b5-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D736e30af583fb6e0e2b8211b894ff99dea0f1ee7
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 736e30af583fb6e0e2b8211b894ff99dea0f1ee7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dr=
iscv SHELL=3D/bin/bash arch/riscv/ kernel//

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> arch/riscv/purgatory/kexec-purgatory.c:1840:9: sparse: sparse: trying to=
 concatenate 29392-character string (8191 bytes max)

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5276341202851594272==--

