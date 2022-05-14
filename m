Content-Type: multipart/mixed; boundary="===============2607748160460208012=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [v2 2/2] kbuild: copy scripts/atomic/atomic-*.h to include/generated/atomic-*.h
Date: Sat, 14 May 2022 18:41:39 +0800
Message-ID: <202205141841.Ly34nLMi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2607748160460208012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220514040207.282910-2-masahiroy@kernel.org>
References: <20220514040207.282910-2-masahiroy@kernel.org>
TO: Masahiro Yamada <masahiroy@kernel.org>
TO: linux-kbuild(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: Mark Rutland <mark.rutland@arm.com>
CC: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
CC: Masahiro Yamada <masahiroy@kernel.org>

Hi Masahiro,

I love your patch! Perhaps something to improve:

[auto build test WARNING on masahiroy-kbuild/for-next]
[also build test WARNING on linux/master linus/master v5.18-rc6 next-202205=
13]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/kbui=
ld-move-scripts-mod-build-to-modules_prepare/20220514-120519
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbu=
ild.git for-next
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: sparc-randconfig-s031-20220512 (https://download.01.org/0day-ci/arc=
hive/20220514/202205141841.Ly34nLMi-lkp(a)intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/intel-lab-lkp/linux/commit/2317716a72142c0f8ac=
4bdf728fa666b64164cef
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Masahiro-Yamada/kbuild-move-script=
s-mod-build-to-modules_prepare/20220514-120519
        git checkout 2317716a72142c0f8ac4bdf728fa666b64164cef
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Ds=
parc SHELL=3D/bin/bash arch/sparc/vdso/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through=
 arch/sparc/include/asm/atomic.h, include/linux/atomic.h, include/asm-gener=
ic/bitops/lock.h, ...):
   arch/sparc/include/asm/atomic_64.h:37:1: sparse: sparse: Expected ) in f=
unction declarator
   arch/sparc/include/asm/atomic_64.h:37:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:37:1: sparse: sparse: Expected ) in f=
unction declarator
   arch/sparc/include/asm/atomic_64.h:37:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:37:1: sparse: sparse: Expected ) in f=
unction declarator
   arch/sparc/include/asm/atomic_64.h:37:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:38:1: sparse: sparse: Expected ) in f=
unction declarator
   arch/sparc/include/asm/atomic_64.h:38:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:38:1: sparse: sparse: Expected ) in f=
unction declarator
   arch/sparc/include/asm/atomic_64.h:38:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:38:1: sparse: sparse: Expected ) in f=
unction declarator
   arch/sparc/include/asm/atomic_64.h:38:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:43:1: sparse: sparse: Expected ) in f=
unction declarator
   arch/sparc/include/asm/atomic_64.h:43:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:43:1: sparse: sparse: Expected ) in f=
unction declarator
   arch/sparc/include/asm/atomic_64.h:43:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:44:1: sparse: sparse: Expected ) in f=
unction declarator
   arch/sparc/include/asm/atomic_64.h:44:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:44:1: sparse: sparse: Expected ) in f=
unction declarator
   arch/sparc/include/asm/atomic_64.h:44:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:45:1: sparse: sparse: Expected ) in f=
unction declarator
   arch/sparc/include/asm/atomic_64.h:45:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:45:1: sparse: sparse: Expected ) in f=
unction declarator
   arch/sparc/include/asm/atomic_64.h:45:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:63:46: sparse: sparse: Expected ) in =
function declarator
   arch/sparc/include/asm/atomic_64.h:63:46: sparse: sparse: got *
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through=
 include/linux/atomic/atomic-arch-fallback.h, include/linux/atomic.h, inclu=
de/asm-generic/bitops/lock.h, ...):
   ./include/generated/atomic-arch-fallback.h:1273:45: sparse: sparse: Expe=
cted ) in function declarator
   ./include/generated/atomic-arch-fallback.h:1273:45: sparse: sparse: got *
   ./include/generated/atomic-arch-fallback.h:1277:13: sparse: sparse: Expe=
cted ) in function declarator
   ./include/generated/atomic-arch-fallback.h:1277:13: sparse: sparse: got (
>> ./include/generated/atomic-arch-fallback.h:1277:9: sparse: sparse: Tryin=
g to use reserved word 'if' as identifier
   ./include/generated/atomic-arch-fallback.h:1278:23: sparse: sparse: Expe=
cted ) in function declarator
   ./include/generated/atomic-arch-fallback.h:1278:23: sparse: sparse: got !
   ./include/generated/atomic-arch-fallback.h:1278:23: sparse: sparse: Tryi=
ng to use reserved word 'if' as identifier
   ./include/generated/atomic-arch-fallback.h:1278:23: sparse: sparse: Expe=
cted ; at the end of type declaration
   ./include/generated/atomic-arch-fallback.h:1278:23: sparse: sparse: got }
   ./include/generated/atomic-arch-fallback.h:1278:23: sparse: sparse: Expe=
cted ) in nested declarator
   ./include/generated/atomic-arch-fallback.h:1278:23: sparse: sparse: got =
volatile
>> ./include/generated/atomic-arch-fallback.h:1278:23: sparse: sparse: Tryi=
ng to use reserved word 'const' as identifier
   ./include/generated/atomic-arch-fallback.h:1278:23: sparse: sparse: Expe=
cted ; at the end of type declaration
   ./include/generated/atomic-arch-fallback.h:1278:23: sparse: sparse: got }
>> ./include/generated/atomic-arch-fallback.h:1278:23: sparse: sparse: Tryi=
ng to use reserved word 'do' as identifier
   ./include/generated/atomic-arch-fallback.h:1278:23: sparse: sparse: Expe=
cted ; at end of declaration
   ./include/generated/atomic-arch-fallback.h:1278:23: sparse: sparse: got {
   ./include/generated/atomic-arch-fallback.h:1278:23: sparse: sparse: Expe=
cted ) in function declarator
   ./include/generated/atomic-arch-fallback.h:1278:23: sparse: sparse: got !
   ./include/generated/atomic-arch-fallback.h:1278:23: sparse: sparse: Tryi=
ng to use reserved word 'if' as identifier
   ./include/generated/atomic-arch-fallback.h:1278:23: sparse: sparse: Expe=
cted ; at the end of type declaration
   ./include/generated/atomic-arch-fallback.h:1278:23: sparse: sparse: got }
   ./include/generated/atomic-arch-fallback.h:1278:23: sparse: sparse: Expe=
cted ; at the end of type declaration
   ./include/generated/atomic-arch-fallback.h:1278:23: sparse: sparse: got }
   ./include/generated/atomic-arch-fallback.h:1279:9: sparse: sparse: Expec=
ted ; at the end of type declaration
   ./include/generated/atomic-arch-fallback.h:1279:9: sparse: sparse: got }
   ./include/generated/atomic-arch-fallback.h:1280:23: sparse: sparse: Expe=
cted ) in function declarator
   ./include/generated/atomic-arch-fallback.h:1280:23: sparse: sparse: got !
   ./include/generated/atomic-arch-fallback.h:1280:23: sparse: sparse: Tryi=
ng to use reserved word 'if' as identifier
   ./include/generated/atomic-arch-fallback.h:1280:23: sparse: sparse: Expe=
cted ; at the end of type declaration
   ./include/generated/atomic-arch-fallback.h:1280:23: sparse: sparse: got }
   ./include/generated/atomic-arch-fallback.h:1280:23: sparse: sparse: Expe=
cted ) in nested declarator
   ./include/generated/atomic-arch-fallback.h:1280:23: sparse: sparse: got =
volatile
   ./include/generated/atomic-arch-fallback.h:1280:23: sparse: sparse: Tryi=
ng to use reserved word 'const' as identifier
   ./include/generated/atomic-arch-fallback.h:1280:23: sparse: sparse: Expe=
cted ; at the end of type declaration
   ./include/generated/atomic-arch-fallback.h:1280:23: sparse: sparse: got }
   ./include/generated/atomic-arch-fallback.h:1281:17: sparse: sparse: Tryi=
ng to use reserved word 'do' as identifier
   ./include/generated/atomic-arch-fallback.h:1281:17: sparse: sparse: Expe=
cted ; at end of declaration
   ./include/generated/atomic-arch-fallback.h:1281:17: sparse: sparse: got {
   ./include/generated/atomic-arch-fallback.h:1281:17: sparse: sparse: Expe=
cted ; at the end of type declaration
   ./include/generated/atomic-arch-fallback.h:1281:17: sparse: sparse: got }
   ./include/generated/atomic-arch-fallback.h:1282:9: sparse: sparse: Expec=
ted ; at the end of type declaration
   ./include/generated/atomic-arch-fallback.h:1282:9: sparse: sparse: got }
   ./include/generated/atomic-arch-fallback.h:1285:1: sparse: sparse: Expec=
ted ; at the end of type declaration
   ./include/generated/atomic-arch-fallback.h:1285:1: sparse: sparse: got }
   ./include/generated/atomic-arch-fallback.h:1294:17: sparse: sparse: Tryi=
ng to use reserved word 'do' as identifier
   ./include/generated/atomic-arch-fallback.h:1294:17: sparse: sparse: Expe=
cted ; at end of declaration
   ./include/generated/atomic-arch-fallback.h:1294:17: sparse: sparse: got {
   ./include/generated/atomic-arch-fallback.h:1294:17: sparse: sparse: Expe=
cted ) in function declarator
   ./include/generated/atomic-arch-fallback.h:1294:17: sparse: sparse: got !
   ./include/generated/atomic-arch-fallback.h:1294:17: sparse: sparse: Tryi=
ng to use reserved word 'if' as identifier
   ./include/generated/atomic-arch-fallback.h:1294:17: sparse: sparse: Expe=
cted ; at the end of type declaration
   ./include/generated/atomic-arch-fallback.h:1294:17: sparse: sparse: got }
   ./include/generated/atomic-arch-fallback.h:1294:17: sparse: sparse: Tryi=
ng to use reserved word 'do' as identifier
   ./include/generated/atomic-arch-fallback.h:1294:17: sparse: sparse: Expe=
cted ; at end of declaration
   ./include/generated/atomic-arch-fallback.h:1294:17: sparse: sparse: got {
   ./include/generated/atomic-arch-fallback.h:1294:17: sparse: sparse: Expe=
cted ) in function declarator
   ./include/generated/atomic-arch-fallback.h:1294:17: sparse: sparse: got !
   ./include/generated/atomic-arch-fallback.h:1294:17: sparse: sparse: Tryi=
ng to use reserved word 'if' as identifier
   ./include/generated/atomic-arch-fallback.h:1294:17: sparse: sparse: Expe=
cted ; at the end of type declaration
   ./include/generated/atomic-arch-fallback.h:1294:17: sparse: sparse: got }
   ./include/generated/atomic-arch-fallback.h:1294:17: sparse: sparse: Tryi=
ng to use reserved word 'do' as identifier
   ./include/generated/atomic-arch-fallback.h:1294:17: sparse: sparse: Expe=
cted ; at end of declaration
   ./include/generated/atomic-arch-fallback.h:1294:17: sparse: sparse: got {
   ./include/generated/atomic-arch-fallback.h:1294:17: sparse: sparse: Expe=
cted ; at the end of type declaration
   ./include/generated/atomic-arch-fallback.h:1294:17: sparse: sparse: got }
   ./include/generated/atomic-arch-fallback.h:1294:17: sparse: sparse: Expe=
cted ; at the end of type declaration
   ./include/generated/atomic-arch-fallback.h:1294:17: sparse: sparse: got }
   ./include/generated/atomic-arch-fallback.h:1294:17: sparse: sparse: Expe=
cted ; at the end of type declaration
   ./include/generated/atomic-arch-fallback.h:1294:17: sparse: sparse: got }
   ./include/generated/atomic-arch-fallback.h:1294:17: sparse: sparse: Expe=
cted ; at the end of type declaration
   ./include/generated/atomic-arch-fallback.h:1294:17: sparse: sparse: got }
   ./include/generated/atomic-arch-fallback.h:1295:9: sparse: sparse: Expec=
ted ; at the end of type declaration
   ./include/generated/atomic-arch-fallback.h:1295:9: sparse: sparse: got }
>> ./include/generated/atomic-arch-fallback.h:1296:17: sparse: sparse: too =
many errors

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2607748160460208012==--

