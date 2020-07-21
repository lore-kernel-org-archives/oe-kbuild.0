Content-Type: multipart/mixed; boundary="===============8955524097074371746=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 09/24] seqlock: Extend seqcount API with associated locks
Date: Tue, 21 Jul 2020 09:16:58 +0800
Message-ID: <202007210940.Hxud8ZD0%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8955524097074371746==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200720155530.1173732-10-a.darwish@linutronix.de>
References: <20200720155530.1173732-10-a.darwish@linutronix.de>
TO: "Ahmed S. Darwish" <a.darwish@linutronix.de>

Hi "Ahmed,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on a9232dc5607dbada801f2fe83ea307cda762969a]

url:    https://github.com/0day-ci/linux/commits/Ahmed-S-Darwish/seqlock-Ex=
tend-seqcount-API-with-associated-locks/20200721-003655
base:    a9232dc5607dbada801f2fe83ea307cda762969a
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: s390-randconfig-s032-20200719 (attached as .config)
compiler: s390-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.2-49-g707c5017-dirty
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   net/core/dev.c:156:18: sparse: sparse: symbol 'ptype_base' was not decla=
red. Should it be static?
   net/core/dev.c:157:18: sparse: sparse: symbol 'ptype_all' was not declar=
ed. Should it be static?
   net/core/dev.c:2422:19: sparse: sparse: symbol 'xps_needed' was not decl=
ared. Should it be static?
   net/core/dev.c:2424:19: sparse: sparse: symbol 'xps_rxqs_needed' was not=
 declared. Should it be static?
   net/core/dev.c:3264:23: sparse: sparse: incorrect type in argument 4 (di=
fferent base types)
   net/core/dev.c:3264:23: sparse:     expected restricted __wsum [usertype=
] csum
   net/core/dev.c:3264:23: sparse:     got unsigned int
   net/core/dev.c:3264:23: sparse: sparse: cast from restricted __wsum
   net/core/dev.c:3264:23: sparse: sparse: incorrect type in argument 4 (di=
fferent base types)
   net/core/dev.c:3264:23: sparse:     expected restricted __wsum [usertype=
] csum
   net/core/dev.c:3264:23: sparse:     got unsigned int
   net/core/dev.c:3264:23: sparse: sparse: incorrect type in argument 1 (di=
fferent base types)
   net/core/dev.c:3264:23: sparse:     expected unsigned int [usertype] val
   net/core/dev.c:3264:23: sparse:     got restricted __wsum
   net/core/dev.c:3264:23: sparse: sparse: incorrect type in argument 4 (di=
fferent base types)
   net/core/dev.c:3264:23: sparse:     expected restricted __wsum [usertype=
] csum
   net/core/dev.c:3264:23: sparse:     got unsigned int
   net/core/dev.c:3264:23: sparse: sparse: cast from restricted __wsum
   net/core/dev.c:3264:23: sparse: sparse: incorrect type in argument 4 (di=
fferent base types)
   net/core/dev.c:3264:23: sparse:     expected restricted __wsum [usertype=
] csum
   net/core/dev.c:3264:23: sparse:     got unsigned int
   net/core/dev.c:3264:23: sparse: sparse: cast from restricted __wsum
   net/core/dev.c:3264:23: sparse: sparse: incorrect type in argument 4 (di=
fferent base types)
   net/core/dev.c:3264:23: sparse:     expected restricted __wsum [usertype=
] csum
   net/core/dev.c:3264:23: sparse:     got unsigned int
   net/core/dev.c:3264:23: sparse: sparse: cast from restricted __wsum
   net/core/dev.c:3264:23: sparse: sparse: incorrect type in argument 4 (di=
fferent base types)
   net/core/dev.c:3264:23: sparse:     expected restricted __wsum [usertype=
] csum
   net/core/dev.c:3264:23: sparse:     got unsigned int
   net/core/dev.c:3264:23: sparse: sparse: cast from restricted __wsum
   net/core/dev.c:5588:1: sparse: sparse: symbol 'flush_works' was not decl=
ared. Should it be static?
   include/net/sch_generic.h:168:9: sparse: sparse: trying to copy expressi=
on type 31
   include/net/sch_generic.h:168:9: sparse: sparse: trying to copy expressi=
on type 31
   include/net/sch_generic.h:141:17: sparse: sparse: trying to copy express=
ion type 31
   include/net/sch_generic.h:175:9: sparse: sparse: trying to copy expressi=
on type 31
   include/net/sch_generic.h:175:9: sparse: sparse: trying to copy expressi=
on type 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/net/sch_generic.h:141:17: sparse: sparse: unreplaced symbol 's'
   include/net/sch_generic.h:141:17: sparse: sparse: unreplaced symbol 'ret=
urn'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/net/sch_generic.h:168:9: sparse: sparse: unreplaced symbol 's'
   include/net/sch_generic.h:168:9: sparse: sparse: unreplaced symbol 'retu=
rn'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/net/sch_generic.h:168:9: sparse: sparse: unreplaced symbol 's'
   include/net/sch_generic.h:168:9: sparse: sparse: unreplaced symbol 'retu=
rn'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/net/sch_generic.h:141:17: sparse: sparse: unreplaced symbol 's'
   include/net/sch_generic.h:141:17: sparse: sparse: unreplaced symbol 'ret=
urn'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/net/sch_generic.h:175:9: sparse: sparse: unreplaced symbol 's'
   include/net/sch_generic.h:175:9: sparse: sparse: unreplaced symbol 'retu=
rn'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/net/sch_generic.h:175:9: sparse: sparse: unreplaced symbol 's'
   include/net/sch_generic.h:175:9: sparse: sparse: unreplaced symbol 'retu=
rn'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/net/sch_generic.h:168:9: sparse: sparse: unreplaced symbol 's'
   include/net/sch_generic.h:168:9: sparse: sparse: unreplaced symbol 'retu=
rn'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/net/sch_generic.h:168:9: sparse: sparse: unreplaced symbol 's'
   include/net/sch_generic.h:168:9: sparse: sparse: unreplaced symbol 'retu=
rn'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/net/sch_generic.h:141:17: sparse: sparse: unreplaced symbol 's'
   include/net/sch_generic.h:141:17: sparse: sparse: unreplaced symbol 'ret=
urn'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/net/sch_generic.h:175:9: sparse: sparse: unreplaced symbol 's'
   include/net/sch_generic.h:175:9: sparse: sparse: unreplaced symbol 'retu=
rn'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/net/sch_generic.h:175:9: sparse: sparse: unreplaced symbol 's'
   include/net/sch_generic.h:175:9: sparse: sparse: unreplaced symbol 'retu=
rn'
   sparse: linearize.c:692: insert_branch: Assertion `old =3D=3D jmp' faile=
d.
>> /bin/bash: line 1: 32346 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__s390__ -D__s390x__ --arc=
h=3Ds390 -mbig-endian -m64 -Wp,-MMD,net/core/.dev.o.d -nostdinc -isystem /o=
pt/cross/gcc-9.3.0-nolibc/s390-linux/bin/../lib/gcc/s390-linux/9.3.0/includ=
e -Iarch/s390/include -I./arch/s390/include/generated -Iinclude -I./include=
 -Iarch/s390/include/uapi -I./arch/s390/include/generated/uapi -Iinclude/ua=
pi -I./include/generated/uapi -include include/linux/kconfig.h -include inc=
lude/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EXTRA_WARN1 -Wall -Wundef=
 -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-commo=
n -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-declaration -Werror=3D=
implicit-int -Wno-format-security -std=3Dgnu89 -m64 -fPIE -mbackchain -msof=
t-float -march=3Dz15 -mtune=3Dz196 -Wa,-Iarch/s390/include -mindirect-branc=
h=3Dthunk -mfunction-return=3Dthunk -mindirect-branch-table -DCC_USING_EXPO=
LINE -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables -DCONFIG_AS_CF=
I_VAL_OFFSET=3D1 -fno-delete-null-pointer-checks -Wno-frame-address -Wno-fo=
rmat-truncation -Wno-format-overflow -Wno-address-of-packed-member -Os --pa=
ram=3Dallow-store-data-races=3D0 -fplugin=3D./scripts/gcc-plugins/randomize=
_layout_plugin.so -DRANDSTRUCT_PLUGIN -fno-reorder-blocks -fno-ipa-cp-clone=
 -fno-partial-inlining -Wframe-larger-than=3D8192 -fno-stack-protector -Wno=
-unused-but-set-variable -Wimplicit-fallthrough -Wno-unused-const-variable =
-fomit-frame-pointer -fno-var-tracking-assignments -g -gdwarf-4 -femit-stru=
ct-debug-baseonly -fno-var-tracking -gz=3Dzlib -fno-inline-functions-called=
-once -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-t=
runcation -Wno-array-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe=
-uninitialized -fno-strict-overflow -fno-merge-all-constants -fmerge-consta=
nts -fno-stack-check -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompa=
tible-pointer-types -Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno=
-packed-not-aligned -Wextra -Wunused -Wno-unused-parameter -Wmissing-declar=
ations -Wmissing-format-attribute -Wmissing-prototypes -Wold-style-definiti=
on -Wmissing-include-dirs -Wunused-but-set-variable -Wunused-const-variable=
 -Wpacked-not-aligned -Wstringop-truncation -Wno-missing-field-initializers=
 -Wno-sign-compare -fsanitize=3Dkernel-address -fasan-shadow-offset=3D0x300=
00000000 --param asan-globals=3D1 --param asan-instrumentation-with-call-th=
reshold=3D0 --param asan-stack=3D1 --param asan-instrument-allocas=3D1 -I n=
et/core -I ./net/core -DKBUILD_MODFILE=3D'"net/core/dev"' -DKBUILD_BASENAME=
=3D'"dev"' -DKBUILD_MODNAME=3D'"dev"' net/core/dev.c
--
   net/core/neighbour.c:348:12: sparse: sparse: context imbalance in '__nei=
gh_ifdown' - wrong count at exit
   net/core/neighbour.c:803:9: sparse: sparse: context imbalance in 'pneigh=
_ifdown_and_unlock' - unexpected unlock
   include/linux/seqlock.h:902:16: sparse: sparse: trying to copy expressio=
n type 31
   include/linux/seqlock.h:876:24: sparse: sparse: trying to copy expressio=
n type 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:902:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:902:16: sparse: sparse: unreplaced symbol 'retur=
n'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:876:24: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:876:24: sparse: sparse: unreplaced symbol 'retur=
n'
>> /bin/bash: line 1: 33145 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__s390__ -D__s390x__ --arc=
h=3Ds390 -mbig-endian -m64 -Wp,-MMD,net/core/.neighbour.o.d -nostdinc -isys=
tem /opt/cross/gcc-9.3.0-nolibc/s390-linux/bin/../lib/gcc/s390-linux/9.3.0/=
include -Iarch/s390/include -I./arch/s390/include/generated -Iinclude -I./i=
nclude -Iarch/s390/include/uapi -I./arch/s390/include/generated/uapi -Iincl=
ude/uapi -I./include/generated/uapi -include include/linux/kconfig.h -inclu=
de include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EXTRA_WARN1 -Wall -=
Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno=
-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-declaration -Wer=
ror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -m64 -fPIE -mbackchain=
 -msoft-float -march=3Dz15 -mtune=3Dz196 -Wa,-Iarch/s390/include -mindirect=
-branch=3Dthunk -mfunction-return=3Dthunk -mindirect-branch-table -DCC_USIN=
G_EXPOLINE -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables -DCONFIG=
_AS_CFI_VAL_OFFSET=3D1 -fno-delete-null-pointer-checks -Wno-frame-address -=
Wno-format-truncation -Wno-format-overflow -Wno-address-of-packed-member -O=
s --param=3Dallow-store-data-races=3D0 -fplugin=3D./scripts/gcc-plugins/ran=
domize_layout_plugin.so -DRANDSTRUCT_PLUGIN -fno-reorder-blocks -fno-ipa-cp=
-clone -fno-partial-inlining -Wframe-larger-than=3D8192 -fno-stack-protecto=
r -Wno-unused-but-set-variable -Wimplicit-fallthrough -Wno-unused-const-var=
iable -fomit-frame-pointer -fno-var-tracking-assignments -g -gdwarf-4 -femi=
t-struct-debug-baseonly -fno-var-tracking -gz=3Dzlib -fno-inline-functions-=
called-once -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wno-stri=
ngop-truncation -Wno-array-bounds -Wno-stringop-overflow -Wno-restrict -Wno=
-maybe-uninitialized -fno-strict-overflow -fno-merge-all-constants -fmerge-=
constants -fno-stack-check -fconserve-stack -Werror=3Ddate-time -Werror=3Di=
ncompatible-pointer-types -Werror=3Ddesignated-init -fmacro-prefix-map=3D=
=3D -Wno-packed-not-aligned -Wextra -Wunused -Wno-unused-parameter -Wmissin=
g-declarations -Wmissing-format-attribute -Wmissing-prototypes -Wold-style-=
definition -Wmissing-include-dirs -Wunused-but-set-variable -Wunused-const-=
variable -Wpacked-not-aligned -Wstringop-truncation -Wno-missing-field-init=
ializers -Wno-sign-compare -fsanitize=3Dkernel-address -fasan-shadow-offset=
=3D0x30000000000 --param asan-globals=3D1 --param asan-instrumentation-with=
-call-threshold=3D0 --param asan-stack=3D1 --param asan-instrument-allocas=
=3D1 -I net/core -I ./net/core -DKBUILD_MODFILE=3D'"net/core/neighbour"' -D=
KBUILD_BASENAME=3D'"neighbour"' -DKBUILD_MODNAME=3D'"neighbour"' net/core/n=
eighbour.c

sparse warnings: (new ones prefixed by >>)

   net/core/dev.c:3264:23: sparse: sparse: incorrect type in argument 4 (di=
fferent base types) @@     expected restricted __wsum [usertype] csum @@   =
  got unsigned int @@
   net/core/dev.c:3264:23: sparse:     expected restricted __wsum [usertype=
] csum
   net/core/dev.c:3264:23: sparse:     got unsigned int
   net/core/dev.c:3264:23: sparse: sparse: cast from restricted __wsum
   net/core/dev.c:3264:23: sparse: sparse: incorrect type in argument 4 (di=
fferent base types) @@     expected restricted __wsum [usertype] csum @@   =
  got unsigned int @@
   net/core/dev.c:3264:23: sparse:     expected restricted __wsum [usertype=
] csum
   net/core/dev.c:3264:23: sparse:     got unsigned int
   net/core/dev.c:3264:23: sparse: sparse: incorrect type in argument 1 (di=
fferent base types) @@     expected unsigned int [usertype] val @@     got =
restricted __wsum @@
   net/core/dev.c:3264:23: sparse:     expected unsigned int [usertype] val
   net/core/dev.c:3264:23: sparse:     got restricted __wsum
   net/core/dev.c:3264:23: sparse: sparse: incorrect type in argument 4 (di=
fferent base types) @@     expected restricted __wsum [usertype] csum @@   =
  got unsigned int @@
   net/core/dev.c:3264:23: sparse:     expected restricted __wsum [usertype=
] csum
   net/core/dev.c:3264:23: sparse:     got unsigned int
   net/core/dev.c:3264:23: sparse: sparse: cast from restricted __wsum
   net/core/dev.c:3264:23: sparse: sparse: incorrect type in argument 4 (di=
fferent base types) @@     expected restricted __wsum [usertype] csum @@   =
  got unsigned int @@
   net/core/dev.c:3264:23: sparse:     expected restricted __wsum [usertype=
] csum
   net/core/dev.c:3264:23: sparse:     got unsigned int
   net/core/dev.c:3264:23: sparse: sparse: cast from restricted __wsum
   net/core/dev.c:3264:23: sparse: sparse: incorrect type in argument 4 (di=
fferent base types) @@     expected restricted __wsum [usertype] csum @@   =
  got unsigned int @@
   net/core/dev.c:3264:23: sparse:     expected restricted __wsum [usertype=
] csum
   net/core/dev.c:3264:23: sparse:     got unsigned int
   net/core/dev.c:3264:23: sparse: sparse: cast from restricted __wsum
   net/core/dev.c:3264:23: sparse: sparse: incorrect type in argument 4 (di=
fferent base types) @@     expected restricted __wsum [usertype] csum @@   =
  got unsigned int @@
   net/core/dev.c:3264:23: sparse:     expected restricted __wsum [usertype=
] csum
   net/core/dev.c:3264:23: sparse:     got unsigned int
   net/core/dev.c:3264:23: sparse: sparse: cast from restricted __wsum
>> include/net/sch_generic.h:168:9: sparse: sparse: trying to copy expressi=
on type 31
>> include/net/sch_generic.h:168:9: sparse: sparse: trying to copy expressi=
on type 31
   include/net/sch_generic.h:141:17: sparse: sparse: trying to copy express=
ion type 31
   include/net/sch_generic.h:175:9: sparse: sparse: trying to copy expressi=
on type 31
   include/net/sch_generic.h:175:9: sparse: sparse: trying to copy expressi=
on type 31
>> include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
>> include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/net/sch_generic.h:141:17: sparse: sparse: unreplaced symbol 's'
>> include/net/sch_generic.h:141:17: sparse: sparse: unreplaced symbol 'ret=
urn'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/net/sch_generic.h:168:9: sparse: sparse: unreplaced symbol 's'
   include/net/sch_generic.h:168:9: sparse: sparse: unreplaced symbol 'retu=
rn'
>> include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
>> include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/net/sch_generic.h:168:9: sparse: sparse: unreplaced symbol 's'
   include/net/sch_generic.h:168:9: sparse: sparse: unreplaced symbol 'retu=
rn'
>> include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
>> include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/net/sch_generic.h:141:17: sparse: sparse: unreplaced symbol 's'
>> include/net/sch_generic.h:141:17: sparse: sparse: unreplaced symbol 'ret=
urn'
>> include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
>> include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/net/sch_generic.h:175:9: sparse: sparse: unreplaced symbol 's'
   include/net/sch_generic.h:175:9: sparse: sparse: unreplaced symbol 'retu=
rn'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/net/sch_generic.h:175:9: sparse: sparse: unreplaced symbol 's'
   include/net/sch_generic.h:175:9: sparse: sparse: unreplaced symbol 'retu=
rn'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/net/sch_generic.h:168:9: sparse: sparse: unreplaced symbol 's'
   include/net/sch_generic.h:168:9: sparse: sparse: unreplaced symbol 'retu=
rn'
>> include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
>> include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/net/sch_generic.h:168:9: sparse: sparse: unreplaced symbol 's'
   include/net/sch_generic.h:168:9: sparse: sparse: unreplaced symbol 'retu=
rn'
>> include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
>> include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/net/sch_generic.h:141:17: sparse: sparse: unreplaced symbol 's'
>> include/net/sch_generic.h:141:17: sparse: sparse: unreplaced symbol 'ret=
urn'
>> include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
>> include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/net/sch_generic.h:175:9: sparse: sparse: unreplaced symbol 's'
   include/net/sch_generic.h:175:9: sparse: sparse: unreplaced symbol 'retu=
rn'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/net/sch_generic.h:175:9: sparse: sparse: unreplaced symbol 's'
   include/net/sch_generic.h:175:9: sparse: sparse: unreplaced symbol 'retu=
rn'
   sparse: linearize.c:692: insert_branch: Assertion `old =3D=3D jmp' faile=
d.
   /bin/bash: line 1: 32346 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__s390__ -D__s390x__ --arc=
h=3Ds390 -mbig-endian -m64 -Wp,-MMD,net/core/.dev.o.d -nostdinc -isystem /o=
pt/cross/gcc-9.3.0-nolibc/s390-linux/bin/../lib/gcc/s390-linux/9.3.0/includ=
e -Iarch/s390/include -I./arch/s390/include/generated -Iinclude -I./include=
 -Iarch/s390/include/uapi -I./arch/s390/include/generated/uapi -Iinclude/ua=
pi -I./include/generated/uapi -include include/linux/kconfig.h -include inc=
lude/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EXTRA_WARN1 -Wall -Wundef=
 -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-commo=
n -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-declaration -Werror=3D=
implicit-int -Wno-format-security -std=3Dgnu89 -m64 -fPIE -mbackchain -msof=
t-float -march=3Dz15 -mtune=3Dz196 -Wa,-Iarch/s390/include -mindirect-branc=
h=3Dthunk -mfunction-return=3Dthunk -mindirect-branch-table -DCC_USING_EXPO=
LINE -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables -DCONFIG_AS_CF=
I_VAL_OFFSET=3D1 -fno-delete-null-pointer-checks -Wno-frame-address -Wno-fo=
rmat-truncation -Wno-format-overflow -Wno-address-of-packed-member -Os --pa=
ram=3Dallow-store-data-races=3D0 -fplugin=3D./scripts/gcc-plugins/randomize=
_layout_plugin.so -DRANDSTRUCT_PLUGIN -fno-reorder-blocks -fno-ipa-cp-clone=
 -fno-partial-inlining -Wframe-larger-than=3D8192 -fno-stack-protector -Wno=
-unused-but-set-variable -Wimplicit-fallthrough -Wno-unused-const-variable =
-fomit-frame-pointer -fno-var-tracking-assignments -g -gdwarf-4 -femit-stru=
ct-debug-baseonly -fno-var-tracking -gz=3Dzlib -fno-inline-functions-called=
-once -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-t=
runcation -Wno-array-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe=
-uninitialized -fno-strict-overflow -fno-merge-all-constants -fmerge-consta=
nts -fno-stack-check -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompa=
tible-pointer-types -Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno=
-packed-not-aligned -Wextra -Wunused -Wno-unused-parameter -Wmissing-declar=
ations -Wmissing-format-attribute -Wmissing-prototypes -Wold-style-definiti=
on -Wmissing-include-dirs -Wunused-but-set-variable -Wunused-const-variable=
 -Wpacked-not-aligned -Wstringop-truncation -Wno-missing-field-initializers=
 -Wno-sign-compare -fsanitize=3Dkernel-address -fasan-shadow-offset=3D0x300=
00000000 --param asan-globals=3D1 --param asan-instrumentation-with-call-th=
reshold=3D0 --param asan-stack=3D1 --param asan-instrument-allocas=3D1 -I n=
et/core -I ./net/core -DKBUILD_MODFILE=3D'"net/core/dev"' -DKBUILD_BASENAME=
=3D'"dev"' -DKBUILD_MODNAME=3D'"dev"' net/core/dev.c
--
   net/core/neighbour.c:348:12: sparse: sparse: context imbalance in '__nei=
gh_ifdown' - wrong count at exit
   net/core/neighbour.c:803:9: sparse: sparse: context imbalance in 'pneigh=
_ifdown_and_unlock' - unexpected unlock
>> include/linux/seqlock.h:902:16: sparse: sparse: trying to copy expressio=
n type 31
   include/linux/seqlock.h:876:24: sparse: sparse: trying to copy expressio=
n type 31
>> include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
>> include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:902:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:902:16: sparse: sparse: unreplaced symbol 'retur=
n'
>> include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
>> include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:876:24: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:876:24: sparse: sparse: unreplaced symbol 'retur=
n'
   /bin/bash: line 1: 33145 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__s390__ -D__s390x__ --arc=
h=3Ds390 -mbig-endian -m64 -Wp,-MMD,net/core/.neighbour.o.d -nostdinc -isys=
tem /opt/cross/gcc-9.3.0-nolibc/s390-linux/bin/../lib/gcc/s390-linux/9.3.0/=
include -Iarch/s390/include -I./arch/s390/include/generated -Iinclude -I./i=
nclude -Iarch/s390/include/uapi -I./arch/s390/include/generated/uapi -Iincl=
ude/uapi -I./include/generated/uapi -include include/linux/kconfig.h -inclu=
de include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EXTRA_WARN1 -Wall -=
Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno=
-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-declaration -Wer=
ror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -m64 -fPIE -mbackchain=
 -msoft-float -march=3Dz15 -mtune=3Dz196 -Wa,-Iarch/s390/include -mindirect=
-branch=3Dthunk -mfunction-return=3Dthunk -mindirect-branch-table -DCC_USIN=
G_EXPOLINE -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables -DCONFIG=
_AS_CFI_VAL_OFFSET=3D1 -fno-delete-null-pointer-checks -Wno-frame-address -=
Wno-format-truncation -Wno-format-overflow -Wno-address-of-packed-member -O=
s --param=3Dallow-store-data-races=3D0 -fplugin=3D./scripts/gcc-plugins/ran=
domize_layout_plugin.so -DRANDSTRUCT_PLUGIN -fno-reorder-blocks -fno-ipa-cp=
-clone -fno-partial-inlining -Wframe-larger-than=3D8192 -fno-stack-protecto=
r -Wno-unused-but-set-variable -Wimplicit-fallthrough -Wno-unused-const-var=
iable -fomit-frame-pointer -fno-var-tracking-assignments -g -gdwarf-4 -femi=
t-struct-debug-baseonly -fno-var-tracking -gz=3Dzlib -fno-inline-functions-=
called-once -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wno-stri=
ngop-truncation -Wno-array-bounds -Wno-stringop-overflow -Wno-restrict -Wno=
-maybe-uninitialized -fno-strict-overflow -fno-merge-all-constants -fmerge-=
constants -fno-stack-check -fconserve-stack -Werror=3Ddate-time -Werror=3Di=
ncompatible-pointer-types -Werror=3Ddesignated-init -fmacro-prefix-map=3D=
=3D -Wno-packed-not-aligned -Wextra -Wunused -Wno-unused-parameter -Wmissin=
g-declarations -Wmissing-format-attribute -Wmissing-prototypes -Wold-style-=
definition -Wmissing-include-dirs -Wunused-but-set-variable -Wunused-const-=
variable -Wpacked-not-aligned -Wstringop-truncation -Wno-missing-field-init=
ializers -Wno-sign-compare -fsanitize=3Dkernel-address -fasan-shadow-offset=
=3D0x30000000000 --param asan-globals=3D1 --param asan-instrumentation-with=
-call-threshold=3D0 --param asan-stack=3D1 --param asan-instrument-allocas=
=3D1 -I net/core -I ./net/core -DKBUILD_MODFILE=3D'"net/core/neighbour"' -D=
KBUILD_BASENAME=3D'"neighbour"' -DKBUILD_MODNAME=3D'"neighbour"' net/core/n=
eighbour.c
--
>> include/linux/seqlock.h:902:16: sparse: sparse: trying to copy expressio=
n type 31
   include/linux/seqlock.h:876:24: sparse: sparse: trying to copy expressio=
n type 31
>> include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
>> include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:902:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:902:16: sparse: sparse: unreplaced symbol 'retur=
n'
   /bin/bash: line 1: 30841 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__s390__ -D__s390x__ --arc=
h=3Ds390 -mbig-endian -m64 -Wp,-MMD,net/ipv4/.inetpeer.o.d -nostdinc -isyst=
em /opt/cross/gcc-9.3.0-nolibc/s390-linux/bin/../lib/gcc/s390-linux/9.3.0/i=
nclude -Iarch/s390/include -I./arch/s390/include/generated -Iinclude -I./in=
clude -Iarch/s390/include/uapi -I./arch/s390/include/generated/uapi -Iinclu=
de/uapi -I./include/generated/uapi -include include/linux/kconfig.h -includ=
e include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EXTRA_WARN1 -Wall -W=
undef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-=
common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-declaration -Werr=
or=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -m64 -fPIE -mbackchain =
-msoft-float -march=3Dz15 -mtune=3Dz196 -Wa,-Iarch/s390/include -mindirect-=
branch=3Dthunk -mfunction-return=3Dthunk -mindirect-branch-table -DCC_USING=
_EXPOLINE -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables -DCONFIG_=
AS_CFI_VAL_OFFSET=3D1 -fno-delete-null-pointer-checks -Wno-frame-address -W=
no-format-truncation -Wno-format-overflow -Wno-address-of-packed-member -Os=
 --param=3Dallow-store-data-races=3D0 -fplugin=3D./scripts/gcc-plugins/rand=
omize_layout_plugin.so -DRANDSTRUCT_PLUGIN -fno-reorder-blocks -fno-ipa-cp-=
clone -fno-partial-inlining -Wframe-larger-than=3D8192 -fno-stack-protector=
 -Wno-unused-but-set-variable -Wimplicit-fallthrough -Wno-unused-const-vari=
able -fomit-frame-pointer -fno-var-tracking-assignments -g -gdwarf-4 -femit=
-struct-debug-baseonly -fno-var-tracking -gz=3Dzlib -fno-inline-functions-c=
alled-once -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wno-strin=
gop-truncation -Wno-array-bounds -Wno-stringop-overflow -Wno-restrict -Wno-=
maybe-uninitialized -fno-strict-overflow -fno-merge-all-constants -fmerge-c=
onstants -fno-stack-check -fconserve-stack -Werror=3Ddate-time -Werror=3Din=
compatible-pointer-types -Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D=
 -Wno-packed-not-aligned -Wextra -Wunused -Wno-unused-parameter -Wmissing-d=
eclarations -Wmissing-format-attribute -Wmissing-prototypes -Wold-style-def=
inition -Wmissing-include-dirs -Wunused-but-set-variable -Wunused-const-var=
iable -Wpacked-not-aligned -Wstringop-truncation -Wno-missing-field-initial=
izers -Wno-sign-compare -fsanitize=3Dkernel-address -fasan-shadow-offset=3D=
0x30000000000 --param asan-globals=3D1 --param asan-instrumentation-with-ca=
ll-threshold=3D0 --param asan-stack=3D1 --param asan-instrument-allocas=3D1=
 -I net/ipv4 -I ./net/ipv4 -DKBUILD_MODFILE=3D'"net/ipv4/inetpeer"' -DKBUIL=
D_BASENAME=3D'"inetpeer"' -DKBUILD_MODNAME=3D'"inetpeer"' net/ipv4/inetpeer=
.c
--
   include/net/route.h:372:48: sparse: sparse: incorrect type in argument 2=
 (different base types) @@     expected unsigned int [usertype] key @@     =
got restricted __be32 [usertype] daddr @@
   include/net/route.h:372:48: sparse:     expected unsigned int [usertype]=
 key
   include/net/route.h:372:48: sparse:     got restricted __be32 [usertype]=
 daddr
   include/net/route.h:372:48: sparse: sparse: incorrect type in argument 2=
 (different base types) @@     expected unsigned int [usertype] key @@     =
got restricted __be32 [usertype] daddr @@
   include/net/route.h:372:48: sparse:     expected unsigned int [usertype]=
 key
   include/net/route.h:372:48: sparse:     got restricted __be32 [usertype]=
 daddr
>> include/linux/seqlock.h:902:16: sparse: sparse: trying to copy expressio=
n type 31
   include/linux/seqlock.h:876:24: sparse: sparse: trying to copy expressio=
n type 31
--
>> include/linux/seqlock.h:902:16: sparse: sparse: trying to copy expressio=
n type 31
   include/linux/seqlock.h:876:24: sparse: sparse: trying to copy expressio=
n type 31
   net/ipv4/inet_connection_sock.c:181:36: sparse: sparse: context imbalanc=
e in 'inet_csk_find_open_port' - wrong count at exit
   net/ipv4/inet_connection_sock.c:348:24: sparse: sparse: context imbalanc=
e in 'inet_csk_get_port' - different lock contexts for basic block
   net/ipv4/inet_connection_sock.c:1000:9: sparse: sparse: context imbalanc=
e in 'inet_csk_complete_hashdance' - unexpected unlock
--
>> include/linux/seqlock.h:902:16: sparse: sparse: trying to copy expressio=
n type 31
   include/linux/seqlock.h:876:24: sparse: sparse: trying to copy expressio=
n type 31
>> include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
>> include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:902:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:902:16: sparse: sparse: unreplaced symbol 'retur=
n'
>> include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
>> include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:876:24: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:876:24: sparse: sparse: unreplaced symbol 'retur=
n'
   /bin/bash: line 1: 35562 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__s390__ -D__s390x__ --arc=
h=3Ds390 -mbig-endian -m64 -Wp,-MMD,net/ipv4/.tcp_metrics.o.d -nostdinc -is=
ystem /opt/cross/gcc-9.3.0-nolibc/s390-linux/bin/../lib/gcc/s390-linux/9.3.=
0/include -Iarch/s390/include -I./arch/s390/include/generated -Iinclude -I.=
/include -Iarch/s390/include/uapi -I./arch/s390/include/generated/uapi -Iin=
clude/uapi -I./include/generated/uapi -include include/linux/kconfig.h -inc=
lude include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EXTRA_WARN1 -Wall=
 -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -f=
no-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-declaration -W=
error=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -m64 -fPIE -mbackcha=
in -msoft-float -march=3Dz15 -mtune=3Dz196 -Wa,-Iarch/s390/include -mindire=
ct-branch=3Dthunk -mfunction-return=3Dthunk -mindirect-branch-table -DCC_US=
ING_EXPOLINE -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables -DCONF=
IG_AS_CFI_VAL_OFFSET=3D1 -fno-delete-null-pointer-checks -Wno-frame-address=
 -Wno-format-truncation -Wno-format-overflow -Wno-address-of-packed-member =
-Os --param=3Dallow-store-data-races=3D0 -fplugin=3D./scripts/gcc-plugins/r=
andomize_layout_plugin.so -DRANDSTRUCT_PLUGIN -fno-reorder-blocks -fno-ipa-=
cp-clone -fno-partial-inlining -Wframe-larger-than=3D8192 -fno-stack-protec=
tor -Wno-unused-but-set-variable -Wimplicit-fallthrough -Wno-unused-const-v=
ariable -fomit-frame-pointer -fno-var-tracking-assignments -g -gdwarf-4 -fe=
mit-struct-debug-baseonly -fno-var-tracking -gz=3Dzlib -fno-inline-function=
s-called-once -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wno-st=
ringop-truncation -Wno-array-bounds -Wno-stringop-overflow -Wno-restrict -W=
no-maybe-uninitialized -fno-strict-overflow -fno-merge-all-constants -fmerg=
e-constants -fno-stack-check -fconserve-stack -Werror=3Ddate-time -Werror=
=3Dincompatible-pointer-types -Werror=3Ddesignated-init -fmacro-prefix-map=
=3D=3D -Wno-packed-not-aligned -Wextra -Wunused -Wno-unused-parameter -Wmis=
sing-declarations -Wmissing-format-attribute -Wmissing-prototypes -Wold-sty=
le-definition -Wmissing-include-dirs -Wunused-but-set-variable -Wunused-con=
st-variable -Wpacked-not-aligned -Wstringop-truncation -Wno-missing-field-i=
nitializers -Wno-sign-compare -fsanitize=3Dkernel-address -fasan-shadow-off=
set=3D0x30000000000 --param asan-globals=3D1 --param asan-instrumentation-w=
ith-call-threshold=3D0 --param asan-stack=3D1 --param asan-instrument-alloc=
as=3D1 -I net/ipv4 -I ./net/ipv4 -DKBUILD_MODFILE=3D'"net/ipv4/tcp_metrics"=
' -DKBUILD_BASENAME=3D'"tcp_metrics"' -DKBUILD_MODNAME=3D'"tcp_metrics"' ne=
t/ipv4/tcp_metrics.c
--
>> include/linux/seqlock.h:902:16: sparse: sparse: trying to copy expressio=
n type 31
   include/linux/seqlock.h:876:24: sparse: sparse: trying to copy expressio=
n type 31

# https://github.com/0day-ci/linux/commit/4468f4c7e23ced8c373e0be6c4d96442f=
be70691
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 4468f4c7e23ced8c373e0be6c4d96442fbe70691
vim +/s +340 include/linux/seqlock.h

4468f4c7e23ced Ahmed S. Darwish 2020-07-20  333  =

4468f4c7e23ced Ahmed S. Darwish 2020-07-20  334  /*
4468f4c7e23ced Ahmed S. Darwish 2020-07-20  335   * Similar hooks, but for =
plain seqcount_t
4468f4c7e23ced Ahmed S. Darwish 2020-07-20  336   */
4468f4c7e23ced Ahmed S. Darwish 2020-07-20  337  =

4468f4c7e23ced Ahmed S. Darwish 2020-07-20  338  static inline seqcount_t *=
__seqcount_ptr(seqcount_t *s)
4468f4c7e23ced Ahmed S. Darwish 2020-07-20  339  {
4468f4c7e23ced Ahmed S. Darwish 2020-07-20 @340  	return s;
4468f4c7e23ced Ahmed S. Darwish 2020-07-20  341  }
4468f4c7e23ced Ahmed S. Darwish 2020-07-20  342  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8955524097074371746==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8955524097074371746==--

