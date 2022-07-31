Content-Type: multipart/mixed; boundary="===============3585582200888750688=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:crng/random/jd/vdso 9/9] ld: arch/x86/entry/vdso/vgetrandom-x32.o: warning: relocation against `__fentry__' in read-only section `.text'
Date: Sun, 31 Jul 2022 22:29:53 +0800
Message-ID: <202207312259.LRSBkOkB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3585582200888750688==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 ld: arch/x86/entry/vdso/vgetrandom-x32.o: warning: relocation against `__f=
entry__' in read-only section `.text'"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Ammar Faizi <ammarfaizi2@gnuweeb.org>
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>

tree:   https://github.com/ammarfaizi2/linux-block crng/random/jd/vdso
head:   a216645bda19c97d0f68f9b83351696ecd251eb5
commit: a216645bda19c97d0f68f9b83351696ecd251eb5 [9/9] random: implement ge=
trandom() in vDSO
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: x86_64-randconfig-s023 (https://download.01.org/0day-ci/archive/202=
20731/202207312259.LRSBkOkB-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/a216645bda19c97=
d0f68f9b83351696ecd251eb5
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block crng/random/jd/vdso
        git checkout a216645bda19c97d0f68f9b83351696ecd251eb5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> ld: arch/x86/entry/vdso/vgetrandom-x32.o: warning: relocation against `_=
_fentry__' in read-only section `.text'
   ld: arch/x86/entry/vdso/vgetrandom-x32.o: relocation R_X86_64_PC32 again=
st undefined symbol `__fentry__' can not be used when making a shared objec=
t; recompile with -fPIC
   ld: final link failed: bad value
   objdump: 'arch/x86/entry/vdso/vdsox32.so.dbg': No such file

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3585582200888750688==--

