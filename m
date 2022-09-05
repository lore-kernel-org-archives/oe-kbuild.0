Content-Type: multipart/mixed; boundary="===============8756994687010001962=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: {standard input}:11398: Error: unrecognized opcode: `mbar'
Date: Mon, 05 Sep 2022 17:05:14 +0800
Message-ID: <202209051603.4PWxpm6M-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8756994687010001962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 {standard input}:11398: Error: unrecognized opcode: `mbar'"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7e18e42e4b280c85b76967a9106a13ca61c16179
commit: 2255411d1d0f0661d1e5acd5f6edf4e6652a345a powerpc/44x: Fix build fai=
lure with GCC 12 (unrecognized opcode: `wrteei')
date:   6 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 6 weeks ago
config: powerpc-randconfig-s041-20220905 (https://download.01.org/0day-ci/a=
rchive/20220905/202209051603.4PWxpm6M-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2255411d1d0f0661d1e5acd5f6edf4e6652a345a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2255411d1d0f0661d1e5acd5f6edf4e6652a345a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dp=
owerpc SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
   {standard input}:440: Error: unrecognized opcode: `wrteei'
   {standard input}:467: Error: unrecognized opcode: `wrtee'
   {standard input}:4929: Error: unrecognized opcode: `wrteei'
   {standard input}:5220: Error: unrecognized opcode: `wrteei'
   {standard input}:5380: Error: unrecognized opcode: `wrteei'
   {standard input}:6268: Error: unrecognized opcode: `wrteei'
   {standard input}:6620: Error: unrecognized opcode: `wrteei'
   {standard input}:9171: Error: unrecognized opcode: `wrteei'
   {standard input}:10682: Error: unrecognized opcode: `wrteei'
>> {standard input}:11398: Error: unrecognized opcode: `mbar'
   {standard input}:12488: Error: unrecognized opcode: `wrteei'
   {standard input}:12538: Error: unrecognized opcode: `wrteei'
   {standard input}:12739: Error: unrecognized opcode: `wrteei'
   {standard input}:13293: Error: unrecognized opcode: `wrteei'
   {standard input}:13591: Error: unrecognized opcode: `wrteei'
   {standard input}:14533: Error: unrecognized opcode: `wrteei'
   {standard input}:14651: Error: unrecognized opcode: `wrteei'
   {standard input}:14811: Error: unrecognized opcode: `wrteei'
   {standard input}:15762: Error: unrecognized opcode: `wrteei'
   {standard input}:19393: Error: unrecognized opcode: `wrteei'
   {standard input}:19505: Error: unrecognized opcode: `wrteei'
   {standard input}:19517: Error: unrecognized opcode: `wrteei'

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8756994687010001962==--

