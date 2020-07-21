Content-Type: multipart/mixed; boundary="===============3931456900268358318=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 09/24] seqlock: Extend seqcount API with associated locks
Date: Tue, 21 Jul 2020 10:19:25 +0800
Message-ID: <202007211005.4duuIm7w%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3931456900268358318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200720155530.1173732-10-a.darwish@linutronix.de>
References: <20200720155530.1173732-10-a.darwish@linutronix.de>
TO: "Ahmed S. Darwish" <a.darwish@linutronix.de>

Hi "Ahmed,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on a9232dc5607dbada801f2fe83ea307cda762969a]

url:    https://github.com/0day-ci/linux/commits/Ahmed-S-Darwish/seqlock-Ex=
tend-seqcount-API-with-associated-locks/20200721-003655
base:    a9232dc5607dbada801f2fe83ea307cda762969a
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: i386-randconfig-s001-20200719 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-14) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.2-49-g707c5017-dirty
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=
=3Di386 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1:  1933 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/udf/.file.o.d -nostdinc -isystem /usr/lib/gcc=
/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/generat=
ed -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gener=
ated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux/=
kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EXT=
RA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-stri=
ct-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-=
declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno-s=
se -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3 -=
freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 -m=
tune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -Wno=
-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-chec=
ks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-addr=
ess-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-large=
r-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplicit-=
fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimiz=
e-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-baseon=
ly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-after-=
statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bound=
s -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-strict=
-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fcon=
serve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werro=
r=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wextr=
a -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-at=
tribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs =
-Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -Wst=
ringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I fs/u=
df -I ./fs/udf -DKBUILD_MODFILE=3D'"fs/udf/udf"' -DKBUILD_BASENAME=3D'"file=
"' -DKBUILD_MODNAME=3D'"udf"' fs/udf/file.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1:  3785 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/udf/.super.o.d -nostdinc -isystem /usr/lib/gc=
c/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/genera=
ted -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gene=
rated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux=
/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EX=
TRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-str=
ict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function=
-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno-=
sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3 =
-freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 -=
mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -Wn=
o-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-che=
cks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-add=
ress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-larg=
er-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplicit=
-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimi=
ze-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-baseo=
nly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-after=
-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-boun=
ds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stric=
t-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fco=
nserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werr=
or=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wext=
ra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-a=
ttribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs=
 -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -Ws=
tringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I fs/=
udf -I ./fs/udf -DKBUILD_MODFILE=3D'"fs/udf/udf"' -DKBUILD_BASENAME=3D'"sup=
er"' -DKBUILD_MODNAME=3D'"udf"' fs/udf/super.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   sparse: flow.c:615: rewrite_parent_branch: Assertion `changed' failed.
   /bin/bash: line 1: 10388 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/jfs/.resize.o.d -nostdinc -isystem /usr/lib/g=
cc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gener=
ated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gen=
erated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linu=
x/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_E=
XTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-st=
rict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functio=
n-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno=
-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3=
 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 =
-mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -W=
no-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-ch=
ecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-ad=
dress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-lar=
ger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplici=
t-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optim=
ize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-base=
only -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-afte=
r-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bou=
nds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stri=
ct-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fc=
onserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wer=
ror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wex=
tra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-=
attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dir=
s -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -W=
stringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -D_JF=
S_4K -I fs/jfs -I ./fs/jfs -DKBUILD_MODFILE=3D'"fs/jfs/jfs"' -DKBUILD_BASEN=
AME=3D'"resize"' -DKBUILD_MODNAME=3D'"jfs"' fs/jfs/resize.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1:  1154 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/jfs/.super.o.d -nostdinc -isystem /usr/lib/gc=
c/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/genera=
ted -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gene=
rated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux=
/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EX=
TRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-str=
ict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function=
-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno-=
sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3 =
-freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 -=
mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -Wn=
o-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-che=
cks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-add=
ress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-larg=
er-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplicit=
-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimi=
ze-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-baseo=
nly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-after=
-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-boun=
ds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stric=
t-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fco=
nserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werr=
or=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wext=
ra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-a=
ttribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs=
 -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -Ws=
tringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -D_JFS=
_4K -I fs/jfs -I ./fs/jfs -DKBUILD_MODFILE=3D'"fs/jfs/jfs"' -DKBUILD_BASENA=
ME=3D'"super"' -DKBUILD_MODNAME=3D'"jfs"' fs/jfs/super.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   sparse: flow.c:615: rewrite_parent_branch: Assertion `changed' failed.
   /bin/bash: line 1: 10095 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/xfs/libxfs/.xfs_bmap.o.d -nostdinc -isystem /=
usr/lib/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/incl=
ude/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/in=
clude/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include inc=
lude/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -=
DKBUILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraph=
s -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplici=
t-function-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dg=
nu89 -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mre=
gparm=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -marc=
h=3Di686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreest=
anding -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-p=
ointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflo=
w -Wno-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -W=
frame-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable =
-Wimplicit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -=
fno-optimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-d=
ebug-baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclara=
tion-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-=
array-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized =
-fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-=
check -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-t=
ypes -Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-ali=
gned -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissin=
g-format-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-in=
clude-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-a=
ligned -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-comp=
are -I fs/xfs -I fs/xfs/libxfs -I fs/xfs -I ./fs/xfs -DKBUILD_MODFILE=3D'"f=
s/xfs/xfs"' -DKBUILD_BASENAME=3D'"xfs_bmap"' -DKBUILD_MODNAME=3D'"xfs"' fs/=
xfs/libxfs/xfs_bmap.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   sparse: flow.c:615: rewrite_parent_branch: Assertion `changed' failed.
   /bin/bash: line 1:  1348 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/xfs/.xfs_trace.o.d -nostdinc -isystem /usr/li=
b/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/ge=
nerated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/=
generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/l=
inux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUIL=
D_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno=
-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-func=
tion-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -=
mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=
=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di=
686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandin=
g -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointe=
r-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wn=
o-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe=
-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimp=
licit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-o=
ptimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-=
baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-=
after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array=
-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-=
strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check=
 -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types =
-Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned =
-Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-for=
mat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include=
-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligne=
d -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -=
I fs/xfs -I fs/xfs/libxfs -I fs/xfs -I ./fs/xfs -DKBUILD_MODFILE=3D'"fs/xfs=
/xfs"' -DKBUILD_BASENAME=3D'"xfs_trace"' -DKBUILD_MODNAME=3D'"xfs"' fs/xfs/=
xfs_trace.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 15916 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/xfs/.xfs_bmap_util.o.d -nostdinc -isystem /us=
r/lib/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/includ=
e/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/incl=
ude/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include inclu=
de/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DK=
BUILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs =
-fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-=
function-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu=
89 -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregp=
arm=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=
=3Di686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreesta=
nding -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-po=
inter-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow=
 -Wno-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wf=
rame-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -=
Wimplicit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -f=
no-optimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-de=
bug-baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclarat=
ion-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-a=
rray-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -=
fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-c=
heck -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-ty=
pes -Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-alig=
ned -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing=
-format-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-inc=
lude-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-al=
igned -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compa=
re -I fs/xfs -I fs/xfs/libxfs -I fs/xfs -I ./fs/xfs -DKBUILD_MODFILE=3D'"fs=
/xfs/xfs"' -DKBUILD_BASENAME=3D'"xfs_bmap_util"' -DKBUILD_MODNAME=3D'"xfs"'=
 fs/xfs/xfs_bmap_util.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   /bin/bash: line 1: 16607 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/xfs/.xfs_file.o.d -nostdinc -isystem /usr/lib=
/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gen=
erated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/g=
enerated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/li=
nux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD=
_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-=
strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-funct=
ion-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -m=
no-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=
=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di=
686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandin=
g -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointe=
r-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wn=
o-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe=
-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimp=
licit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-o=
ptimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-=
baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-=
after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array=
-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-=
strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check=
 -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types =
-Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned =
-Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-for=
mat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include=
-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligne=
d -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -=
I fs/xfs -I fs/xfs/libxfs -I fs/xfs -I ./fs/xfs -DKBUILD_MODFILE=3D'"fs/xfs=
/xfs"' -DKBUILD_BASENAME=3D'"xfs_file"' -DKBUILD_MODNAME=3D'"xfs"' fs/xfs/x=
fs_file.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   sparse: flow.c:615: rewrite_parent_branch: Assertion `changed' failed.
   /bin/bash: line 1: 17147 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/xfs/.xfs_ioctl.o.d -nostdinc -isystem /usr/li=
b/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/ge=
nerated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/=
generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/l=
inux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUIL=
D_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno=
-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-func=
tion-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -=
mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=
=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di=
686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandin=
g -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointe=
r-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wn=
o-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe=
-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimp=
licit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-o=
ptimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-=
baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-=
after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array=
-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-=
strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check=
 -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types =
-Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned =
-Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-for=
mat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include=
-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligne=
d -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -=
I fs/xfs -I fs/xfs/libxfs -I fs/xfs -I ./fs/xfs -DKBUILD_MODFILE=3D'"fs/xfs=
/xfs"' -DKBUILD_BASENAME=3D'"xfs_ioctl"' -DKBUILD_MODNAME=3D'"xfs"' fs/xfs/=
xfs_ioctl.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 17194 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/xfs/.xfs_iomap.o.d -nostdinc -isystem /usr/li=
b/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/ge=
nerated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/=
generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/l=
inux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUIL=
D_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno=
-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-func=
tion-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -=
mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=
=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di=
686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandin=
g -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointe=
r-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wn=
o-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe=
-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimp=
licit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-o=
ptimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-=
baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-=
after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array=
-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-=
strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check=
 -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types =
-Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned =
-Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-for=
mat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include=
-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligne=
d -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -=
I fs/xfs -I fs/xfs/libxfs -I fs/xfs -I ./fs/xfs -DKBUILD_MODFILE=3D'"fs/xfs=
/xfs"' -DKBUILD_BASENAME=3D'"xfs_iomap"' -DKBUILD_MODNAME=3D'"xfs"' fs/xfs/=
xfs_iomap.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 17300 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/xfs/.xfs_inode.o.d -nostdinc -isystem /usr/li=
b/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/ge=
nerated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/=
generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/l=
inux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUIL=
D_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno=
-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-func=
tion-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -=
mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=
=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di=
686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandin=
g -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointe=
r-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wn=
o-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe=
-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimp=
licit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-o=
ptimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-=
baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-=
after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array=
-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-=
strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check=
 -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types =
-Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned =
-Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-for=
mat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include=
-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligne=
d -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -=
I fs/xfs -I fs/xfs/libxfs -I fs/xfs -I ./fs/xfs -DKBUILD_MODFILE=3D'"fs/xfs=
/xfs"' -DKBUILD_BASENAME=3D'"xfs_inode"' -DKBUILD_MODNAME=3D'"xfs"' fs/xfs/=
xfs_inode.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   sparse: flow.c:615: rewrite_parent_branch: Assertion `changed' failed.
   /bin/bash: line 1: 17545 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/xfs/.xfs_reflink.o.d -nostdinc -isystem /usr/=
lib/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/=
generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/includ=
e/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include=
/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBU=
ILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -f=
no-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-fu=
nction-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89=
 -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregpar=
m=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3D=
i686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandi=
ng -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-point=
er-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -W=
no-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wfram=
e-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wim=
plicit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-=
optimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug=
-baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration=
-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-arra=
y-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno=
-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-chec=
k -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types=
 -Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned=
 -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-fo=
rmat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-includ=
e-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-align=
ed -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare =
-I fs/xfs -I fs/xfs/libxfs -I fs/xfs -I ./fs/xfs -DKBUILD_MODFILE=3D'"fs/xf=
s/xfs"' -DKBUILD_BASENAME=3D'"xfs_reflink"' -DKBUILD_MODNAME=3D'"xfs"' fs/x=
fs/xfs_reflink.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   sparse: flow.c:615: rewrite_parent_branch: Assertion `changed' failed.
   /bin/bash: line 1: 18714 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/xfs/.xfs_pnfs.o.d -nostdinc -isystem /usr/lib=
/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gen=
erated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/g=
enerated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/li=
nux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD=
_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-=
strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-funct=
ion-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -m=
no-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=
=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di=
686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandin=
g -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointe=
r-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wn=
o-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe=
-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimp=
licit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-o=
ptimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-=
baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-=
after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array=
-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-=
strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check=
 -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types =
-Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned =
-Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-for=
mat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include=
-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligne=
d -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -=
I fs/xfs -I fs/xfs/libxfs -I fs/xfs -I ./fs/xfs -DKBUILD_MODFILE=3D'"fs/xfs=
/xfs"' -DKBUILD_BASENAME=3D'"xfs_pnfs"' -DKBUILD_MODNAME=3D'"xfs"' fs/xfs/x=
fs_pnfs.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1:  2010 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/nilfs2/.inode.o.d -nostdinc -isystem /usr/lib=
/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gen=
erated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/g=
enerated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/li=
nux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD=
_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-=
strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-funct=
ion-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -m=
no-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=
=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di=
686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandin=
g -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointe=
r-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wn=
o-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe=
-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimp=
licit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-o=
ptimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-=
baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-=
after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array=
-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-=
strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check=
 -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types =
-Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned =
-Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-for=
mat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include=
-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligne=
d -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -=
I fs/nilfs2 -I ./fs/nilfs2 -DKBUILD_MODFILE=3D'"fs/nilfs2/nilfs2"' -DKBUILD=
_BASENAME=3D'"inode"' -DKBUILD_MODNAME=3D'"nilfs2"' fs/nilfs2/inode.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1:  8227 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/cachefiles/.xattr.o.d -nostdinc -isystem /usr=
/lib/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include=
/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/inclu=
de/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include includ=
e/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKB=
UILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -=
fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-f=
unction-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu8=
9 -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregpa=
rm=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=
=3Di686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreesta=
nding -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-po=
inter-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow=
 -Wno-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wf=
rame-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -=
Wimplicit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -f=
no-optimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-de=
bug-baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclarat=
ion-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-a=
rray-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -=
fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-c=
heck -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-ty=
pes -Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-alig=
ned -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing=
-format-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-inc=
lude-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-al=
igned -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compa=
re -I fs/cachefiles -I ./fs/cachefiles -DKBUILD_MODFILE=3D'"fs/cachefiles/c=
achefiles"' -DKBUILD_BASENAME=3D'"xattr"' -DKBUILD_MODNAME=3D'"cachefiles"'=
 fs/cachefiles/xattr.c
--
   fs/ntfs/compress.c:204:28: sparse: sparse: context imbalance in 'ntfs_de=
compress' - unexpected unlock
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   fs/ntfs/compress.c:773:16: sparse: sparse: context imbalance in 'ntfs_re=
ad_compressed_block' - different lock contexts for basic block
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   sparse: flow.c:615: rewrite_parent_branch: Assertion `changed' failed.
   /bin/bash: line 1:  2451 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/ntfs/.dir.o.d -nostdinc -isystem /usr/lib/gcc=
/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/generat=
ed -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gener=
ated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux/=
kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EXT=
RA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-stri=
ct-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-=
declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno-s=
se -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3 -=
freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 -m=
tune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -Wno=
-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-chec=
ks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-addr=
ess-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-large=
r-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplicit-=
fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimiz=
e-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-baseon=
ly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-after-=
statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bound=
s -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-strict=
-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fcon=
serve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werro=
r=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wextr=
a -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-at=
tribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs =
-Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -Wst=
ringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -DNTFS_=
VERSION=3D"2.1.32" -DDEBUG -DNTFS_RW -I fs/ntfs -I ./fs/ntfs -DKBUILD_MODFI=
LE=3D'"fs/ntfs/ntfs"' -DKBUILD_BASENAME=3D'"dir"' -DKBUILD_MODNAME=3D'"ntfs=
"' fs/ntfs/dir.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   /bin/bash: line 1:  2529 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/ntfs/.file.o.d -nostdinc -isystem /usr/lib/gc=
c/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/genera=
ted -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gene=
rated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux=
/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EX=
TRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-str=
ict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function=
-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno-=
sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3 =
-freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 -=
mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -Wn=
o-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-che=
cks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-add=
ress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-larg=
er-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplicit=
-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimi=
ze-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-baseo=
nly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-after=
-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-boun=
ds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stric=
t-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fco=
nserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werr=
or=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wext=
ra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-a=
ttribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs=
 -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -Ws=
tringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -DNTFS=
_VERSION=3D"2.1.32" -DDEBUG -DNTFS_RW -I fs/ntfs -I ./fs/ntfs -DKBUILD_MODF=
ILE=3D'"fs/ntfs/ntfs"' -DKBUILD_BASENAME=3D'"file"' -DKBUILD_MODNAME=3D'"nt=
fs"' fs/ntfs/file.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1:  3027 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/ntfs/.inode.o.d -nostdinc -isystem /usr/lib/g=
cc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gener=
ated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gen=
erated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linu=
x/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_E=
XTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-st=
rict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functio=
n-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno=
-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3=
 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 =
-mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -W=
no-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-ch=
ecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-ad=
dress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-lar=
ger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplici=
t-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optim=
ize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-base=
only -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-afte=
r-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bou=
nds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stri=
ct-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fc=
onserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wer=
ror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wex=
tra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-=
attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dir=
s -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -W=
stringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -DNTF=
S_VERSION=3D"2.1.32" -DDEBUG -DNTFS_RW -I fs/ntfs -I ./fs/ntfs -DKBUILD_MOD=
FILE=3D'"fs/ntfs/ntfs"' -DKBUILD_BASENAME=3D'"inode"' -DKBUILD_MODNAME=3D'"=
ntfs"' fs/ntfs/inode.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   /bin/bash: line 1:  3109 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/ntfs/.mft.o.d -nostdinc -isystem /usr/lib/gcc=
/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/generat=
ed -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gener=
ated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux/=
kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EXT=
RA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-stri=
ct-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-=
declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno-s=
se -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3 -=
freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 -m=
tune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -Wno=
-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-chec=
ks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-addr=
ess-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-large=
r-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplicit-=
fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimiz=
e-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-baseon=
ly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-after-=
statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bound=
s -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-strict=
-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fcon=
serve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werro=
r=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wextr=
a -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-at=
tribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs =
-Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -Wst=
ringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -DNTFS_=
VERSION=3D"2.1.32" -DDEBUG -DNTFS_RW -I fs/ntfs -I ./fs/ntfs -DKBUILD_MODFI=
LE=3D'"fs/ntfs/ntfs"' -DKBUILD_BASENAME=3D'"mft"' -DKBUILD_MODNAME=3D'"ntfs=
"' fs/ntfs/mft.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1:   400 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/ntfs/.aops.o.d -nostdinc -isystem /usr/lib/gc=
c/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/genera=
ted -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gene=
rated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux=
/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EX=
TRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-str=
ict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function=
-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno-=
sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3 =
-freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 -=
mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -Wn=
o-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-che=
cks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-add=
ress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-larg=
er-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplicit=
-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimi=
ze-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-baseo=
nly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-after=
-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-boun=
ds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stric=
t-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fco=
nserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werr=
or=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wext=
ra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-a=
ttribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs=
 -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -Ws=
tringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -DNTFS=
_VERSION=3D"2.1.32" -DDEBUG -DNTFS_RW -I fs/ntfs -I ./fs/ntfs -DKBUILD_MODF=
ILE=3D'"fs/ntfs/ntfs"' -DKBUILD_BASENAME=3D'"aops"' -DKBUILD_MODNAME=3D'"nt=
fs"' fs/ntfs/aops.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   sparse: flow.c:615: rewrite_parent_branch: Assertion `changed' failed.
   /bin/bash: line 1:  4375 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/ntfs/.super.o.d -nostdinc -isystem /usr/lib/g=
cc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gener=
ated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gen=
erated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linu=
x/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_E=
XTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-st=
rict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functio=
n-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno=
-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3=
 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 =
-mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -W=
no-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-ch=
ecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-ad=
dress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-lar=
ger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplici=
t-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optim=
ize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-base=
only -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-afte=
r-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bou=
nds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stri=
ct-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fc=
onserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wer=
ror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wex=
tra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-=
attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dir=
s -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -W=
stringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -DNTF=
S_VERSION=3D"2.1.32" -DDEBUG -DNTFS_RW -I fs/ntfs -I ./fs/ntfs -DKBUILD_MOD=
FILE=3D'"fs/ntfs/ntfs"' -DKBUILD_BASENAME=3D'"super"' -DKBUILD_MODNAME=3D'"=
ntfs"' fs/ntfs/super.c
--
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   sparse: flow.c:615: rewrite_parent_branch: Assertion `changed' failed.
   /bin/bash: line 1:  8125 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/ntfs/.usnjrnl.o.d -nostdinc -isystem /usr/lib=
/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gen=
erated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/g=
enerated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/li=
nux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD=
_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-=
strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-funct=
ion-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -m=
no-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=
=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di=
686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandin=
g -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointe=
r-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wn=
o-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe=
-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimp=
licit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-o=
ptimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-=
baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-=
after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array=
-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-=
strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check=
 -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types =
-Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned =
-Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-for=
mat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include=
-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligne=
d -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -=
DNTFS_VERSION=3D"2.1.32" -DDEBUG -DNTFS_RW -I fs/ntfs -I ./fs/ntfs -DKBUILD=
_MODFILE=3D'"fs/ntfs/ntfs"' -DKBUILD_BASENAME=3D'"usnjrnl"' -DKBUILD_MODNAM=
E=3D'"ntfs"' fs/ntfs/usnjrnl.c
--
   fs/btrfs/disk-io.c:3410:25: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   fs/btrfs/disk-io.c:3410:25: sparse:    struct rcu_string [noderef] __rcu=
 *
   fs/btrfs/disk-io.c:3410:25: sparse:    struct rcu_string *
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 11083 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/btrfs/.inode.o.d -nostdinc -isystem /usr/lib/=
gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gene=
rated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/ge=
nerated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/lin=
ux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_=
EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-s=
trict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functi=
on-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mn=
o-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D=
3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686=
 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -=
Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-c=
hecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-a=
ddress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-la=
rger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplic=
it-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-opti=
mize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-bas=
eonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-aft=
er-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bo=
unds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-str=
ict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -f=
conserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -We=
rror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -We=
xtra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format=
-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-di=
rs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -=
Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I f=
s/btrfs -I ./fs/btrfs -DKBUILD_MODFILE=3D'"fs/btrfs/btrfs"' -DKBUILD_BASENA=
ME=3D'"inode"' -DKBUILD_MODNAME=3D'"btrfs"' fs/btrfs/inode.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 11147 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/btrfs/.file.o.d -nostdinc -isystem /usr/lib/g=
cc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gener=
ated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gen=
erated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linu=
x/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_E=
XTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-st=
rict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functio=
n-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno=
-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3=
 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 =
-mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -W=
no-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-ch=
ecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-ad=
dress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-lar=
ger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplici=
t-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optim=
ize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-base=
only -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-afte=
r-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bou=
nds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stri=
ct-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fc=
onserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wer=
ror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wex=
tra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-=
attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dir=
s -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -W=
stringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I fs=
/btrfs -I ./fs/btrfs -DKBUILD_MODFILE=3D'"fs/btrfs/btrfs"' -DKBUILD_BASENAM=
E=3D'"file"' -DKBUILD_MODNAME=3D'"btrfs"' fs/btrfs/file.c
--
   fs/btrfs/extent_io.c:2327:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   fs/btrfs/extent_io.c:2327:9: sparse:    struct rcu_string [noderef] __rc=
u *
   fs/btrfs/extent_io.c:2327:9: sparse:    struct rcu_string *
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 11748 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/btrfs/.extent_io.o.d -nostdinc -isystem /usr/=
lib/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/=
generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/includ=
e/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include=
/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBU=
ILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -f=
no-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-fu=
nction-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89=
 -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregpar=
m=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3D=
i686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandi=
ng -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-point=
er-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -W=
no-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wfram=
e-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wim=
plicit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-=
optimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug=
-baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration=
-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-arra=
y-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno=
-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-chec=
k -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types=
 -Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned=
 -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-fo=
rmat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-includ=
e-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-align=
ed -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare =
-I fs/btrfs -I ./fs/btrfs -DKBUILD_MODFILE=3D'"fs/btrfs/btrfs"' -DKBUILD_BA=
SENAME=3D'"extent_io"' -DKBUILD_MODNAME=3D'"btrfs"' fs/btrfs/extent_io.c
--
   fs/btrfs/volumes.c:7336:9: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   fs/btrfs/volumes.c:7336:9: sparse:    struct rcu_string [noderef] __rcu *
   fs/btrfs/volumes.c:7336:9: sparse:    struct rcu_string *
   fs/btrfs/volumes.c:7356:9: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   fs/btrfs/volumes.c:7356:9: sparse:    struct rcu_string [noderef] __rcu *
   fs/btrfs/volumes.c:7356:9: sparse:    struct rcu_string *
   fs/btrfs/volumes.c:539:24: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   fs/btrfs/volumes.c:539:24: sparse:    struct rcu_string [noderef] __rcu *
   fs/btrfs/volumes.c:539:24: sparse:    struct rcu_string *
   fs/btrfs/volumes.c:858:17: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   fs/btrfs/volumes.c:858:17: sparse:    struct rcu_string [noderef] __rcu *
   fs/btrfs/volumes.c:858:17: sparse:    struct rcu_string *
   fs/btrfs/volumes.c:932:33: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   fs/btrfs/volumes.c:932:33: sparse:    struct rcu_string [noderef] __rcu *
   fs/btrfs/volumes.c:932:33: sparse:    struct rcu_string *
   fs/btrfs/volumes.c:939:25: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   fs/btrfs/volumes.c:939:25: sparse:    struct rcu_string [noderef] __rcu *
   fs/btrfs/volumes.c:939:25: sparse:    struct rcu_string *
   fs/btrfs/volumes.c:951:17: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   fs/btrfs/volumes.c:951:17: sparse:    struct rcu_string [noderef] __rcu *
   fs/btrfs/volumes.c:951:17: sparse:    struct rcu_string *
   fs/btrfs/volumes.c:1012:25: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   fs/btrfs/volumes.c:1012:25: sparse:    struct rcu_string [noderef] __rcu=
 *
   fs/btrfs/volumes.c:1012:25: sparse:    struct rcu_string *
   fs/btrfs/volumes.c:2055:17: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   fs/btrfs/volumes.c:2055:17: sparse:    struct rcu_string [noderef] __rcu=
 *
   fs/btrfs/volumes.c:2055:17: sparse:    struct rcu_string *
   fs/btrfs/volumes.c:2539:9: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   fs/btrfs/volumes.c:2539:9: sparse:    struct rcu_string [noderef] __rcu *
   fs/btrfs/volumes.c:2539:9: sparse:    struct rcu_string *
   fs/btrfs/volumes.c:6325:9: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   fs/btrfs/volumes.c:6325:9: sparse:    struct rcu_string [noderef] __rcu *
   fs/btrfs/volumes.c:6325:9: sparse:    struct rcu_string *
   fs/btrfs/volumes.c:7242:17: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   fs/btrfs/volumes.c:7242:17: sparse:    struct rcu_string [noderef] __rcu=
 *
   fs/btrfs/volumes.c:7242:17: sparse:    struct rcu_string *
   fs/btrfs/volumes.c:7253:25: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   fs/btrfs/volumes.c:7253:25: sparse:    struct rcu_string [noderef] __rcu=
 *
   fs/btrfs/volumes.c:7253:25: sparse:    struct rcu_string *
   fs/btrfs/volumes.c:7267:25: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   fs/btrfs/volumes.c:7267:25: sparse:    struct rcu_string [noderef] __rcu=
 *
   fs/btrfs/volumes.c:7267:25: sparse:    struct rcu_string *
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
>> fs/btrfs/volumes.h:207:1: sparse: sparse: trying to copy expression type=
 31
>> fs/btrfs/volumes.h:207:1: sparse: sparse: trying to copy expression type=
 31
   fs/btrfs/volumes.h:208:1: sparse: sparse: trying to copy expression type=
 31
   fs/btrfs/volumes.h:208:1: sparse: sparse: trying to copy expression type=
 31
   include/linux/seqlock.h:902:16: sparse: sparse: trying to copy expressio=
n type 31
   include/linux/seqlock.h:876:24: sparse: sparse: trying to copy expressio=
n type 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 11780 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/btrfs/.volumes.o.d -nostdinc -isystem /usr/li=
b/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/ge=
nerated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/=
generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/l=
inux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUIL=
D_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno=
-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-func=
tion-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -=
mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=
=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di=
686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandin=
g -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointe=
r-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wn=
o-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe=
-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimp=
licit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-o=
ptimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-=
baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-=
after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array=
-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-=
strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check=
 -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types =
-Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned =
-Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-for=
mat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include=
-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligne=
d -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -=
I fs/btrfs -I ./fs/btrfs -DKBUILD_MODFILE=3D'"fs/btrfs/btrfs"' -DKBUILD_BAS=
ENAME=3D'"volumes"' -DKBUILD_MODNAME=3D'"btrfs"' fs/btrfs/volumes.c
--
   fs/btrfs/ioctl.c:1715:17: sparse: sparse: incompatible types in comparis=
on expression (different address spaces):
   fs/btrfs/ioctl.c:1715:17: sparse:    struct rcu_string [noderef] __rcu *
   fs/btrfs/ioctl.c:1715:17: sparse:    struct rcu_string *
   fs/btrfs/ioctl.c:3257:40: sparse: sparse: incompatible types in comparis=
on expression (different address spaces):
   fs/btrfs/ioctl.c:3257:40: sparse:    struct rcu_string [noderef] __rcu *
   fs/btrfs/ioctl.c:3257:40: sparse:    struct rcu_string *
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 12122 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/btrfs/.ioctl.o.d -nostdinc -isystem /usr/lib/=
gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gene=
rated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/ge=
nerated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/lin=
ux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_=
EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-s=
trict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functi=
on-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mn=
o-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D=
3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686=
 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -=
Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-c=
hecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-a=
ddress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-la=
rger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplic=
it-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-opti=
mize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-bas=
eonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-aft=
er-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bo=
unds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-str=
ict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -f=
conserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -We=
rror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -We=
xtra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format=
-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-di=
rs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -=
Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I f=
s/btrfs -I ./fs/btrfs -DKBUILD_MODFILE=3D'"fs/btrfs/btrfs"' -DKBUILD_BASENA=
ME=3D'"ioctl"' -DKBUILD_MODNAME=3D'"btrfs"' fs/btrfs/ioctl.c
--
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 12881 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/btrfs/.tree-log.o.d -nostdinc -isystem /usr/l=
ib/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/g=
enerated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include=
/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/=
linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUI=
LD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fn=
o-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-fun=
ction-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 =
-mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=
=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di=
686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandin=
g -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointe=
r-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wn=
o-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe=
-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimp=
licit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-o=
ptimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-=
baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-=
after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array=
-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-=
strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check=
 -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types =
-Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned =
-Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-for=
mat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include=
-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligne=
d -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -=
I fs/btrfs -I ./fs/btrfs -DKBUILD_MODFILE=3D'"fs/btrfs/btrfs"' -DKBUILD_BAS=
ENAME=3D'"tree_log"' -DKBUILD_MODNAME=3D'"btrfs"' fs/btrfs/tree-log.c
--
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 12899 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/btrfs/.free-space-cache.o.d -nostdinc -isyste=
m /usr/lib/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/i=
nclude/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86=
/include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include =
include/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL_=
_ -DKBUILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigr=
aphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimpl=
icit-function-declaration -Werror=3Dimplicit-int -Wno-format-security -std=
=3Dgnu89 -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float =
-mregparm=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -=
march=3Di686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffr=
eestanding -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-nu=
ll-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-ove=
rflow -Wno-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D=
0 -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-varia=
ble -Wimplicit-fallthrough -Wno-unused-const-variable -fno-omit-frame-point=
er -fno-optimize-sibling-calls -fno-var-tracking-assignments -g -femit-stru=
ct-debug-baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdec=
laration-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -=
Wno-array-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitiali=
zed -fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-st=
ack-check -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-point=
er-types -Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not=
-aligned -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmi=
ssing-format-attribute -Wmissing-prototypes -Wold-style-definition -Wmissin=
g-include-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-n=
ot-aligned -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-=
compare -I fs/btrfs -I ./fs/btrfs -DKBUILD_MODFILE=3D'"fs/btrfs/btrfs"' -DK=
BUILD_BASENAME=3D'"free_space_cache"' -DKBUILD_MODNAME=3D'"btrfs"' fs/btrfs=
/free-space-cache.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   sparse: flow.c:615: rewrite_parent_branch: Assertion `changed' failed.
   /bin/bash: line 1: 13205 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/btrfs/.compression.o.d -nostdinc -isystem /us=
r/lib/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/includ=
e/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/incl=
ude/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include inclu=
de/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DK=
BUILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs =
-fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-=
function-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu=
89 -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregp=
arm=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=
=3Di686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreesta=
nding -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-po=
inter-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow=
 -Wno-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wf=
rame-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -=
Wimplicit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -f=
no-optimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-de=
bug-baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclarat=
ion-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-a=
rray-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -=
fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-c=
heck -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-ty=
pes -Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-alig=
ned -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing=
-format-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-inc=
lude-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-al=
igned -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compa=
re -I fs/btrfs -I ./fs/btrfs -DKBUILD_MODFILE=3D'"fs/btrfs/btrfs"' -DKBUILD=
_BASENAME=3D'"compression"' -DKBUILD_MODNAME=3D'"btrfs"' fs/btrfs/compressi=
on.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   sparse: flow.c:615: rewrite_parent_branch: Assertion `changed' failed.
   /bin/bash: line 1: 14070 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/btrfs/.send.o.d -nostdinc -isystem /usr/lib/g=
cc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gener=
ated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gen=
erated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linu=
x/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_E=
XTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-st=
rict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functio=
n-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno=
-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3=
 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 =
-mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -W=
no-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-ch=
ecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-ad=
dress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-lar=
ger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplici=
t-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optim=
ize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-base=
only -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-afte=
r-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bou=
nds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stri=
ct-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fc=
onserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wer=
ror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wex=
tra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-=
attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dir=
s -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -W=
stringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I fs=
/btrfs -I ./fs/btrfs -DKBUILD_MODFILE=3D'"fs/btrfs/btrfs"' -DKBUILD_BASENAM=
E=3D'"send"' -DKBUILD_MODNAME=3D'"btrfs"' fs/btrfs/send.c
--
   fs/btrfs/dev-replace.c:683:25: sparse: sparse: incompatible types in com=
parison expression (different address spaces):
   fs/btrfs/dev-replace.c:683:25: sparse:    struct rcu_string [noderef] __=
rcu *
   fs/btrfs/dev-replace.c:683:25: sparse:    struct rcu_string *
   fs/btrfs/dev-replace.c:700:9: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   fs/btrfs/dev-replace.c:700:9: sparse:    struct rcu_string [noderef] __r=
cu *
   fs/btrfs/dev-replace.c:700:9: sparse:    struct rcu_string *
   fs/btrfs/dev-replace.c:279:9: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   fs/btrfs/dev-replace.c:279:9: sparse:    struct rcu_string [noderef] __r=
cu *
   fs/btrfs/dev-replace.c:279:9: sparse:    struct rcu_string *
   fs/btrfs/dev-replace.c:431:24: sparse: sparse: incompatible types in com=
parison expression (different address spaces):
   fs/btrfs/dev-replace.c:431:24: sparse:    struct rcu_string [noderef] __=
rcu *
   fs/btrfs/dev-replace.c:431:24: sparse:    struct rcu_string *
   fs/btrfs/dev-replace.c:493:9: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   fs/btrfs/dev-replace.c:493:9: sparse:    struct rcu_string [noderef] __r=
cu *
   fs/btrfs/dev-replace.c:493:9: sparse:    struct rcu_string *
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   fs/btrfs/volumes.h:206:1: sparse: sparse: trying to copy expression type=
 31
   fs/btrfs/volumes.h:206:1: sparse: sparse: trying to copy expression type=
 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> fs/btrfs/volumes.h:206:1: sparse: sparse: unreplaced symbol 's'
>> fs/btrfs/volumes.h:206:1: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> fs/btrfs/volumes.h:206:1: sparse: sparse: unreplaced symbol 's'
>> fs/btrfs/volumes.h:206:1: sparse: sparse: unreplaced symbol 'return'
>> fs/btrfs/volumes.h:207:1: sparse: sparse: trying to copy expression type=
 31
>> fs/btrfs/volumes.h:207:1: sparse: sparse: trying to copy expression type=
 31
   fs/btrfs/volumes.h:208:1: sparse: sparse: trying to copy expression type=
 31
   fs/btrfs/volumes.h:208:1: sparse: sparse: trying to copy expression type=
 31
   sparse: flow.c:615: rewrite_parent_branch: Assertion `changed' failed.
   /bin/bash: line 1: 14147 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/btrfs/.dev-replace.o.d -nostdinc -isystem /us=
r/lib/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/includ=
e/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/incl=
ude/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include inclu=
de/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DK=
BUILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs =
-fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-=
function-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu=
89 -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregp=
arm=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=
=3Di686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreesta=
nding -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-po=
inter-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow=
 -Wno-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wf=
rame-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -=
Wimplicit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -f=
no-optimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-de=
bug-baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclarat=
ion-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-a=
rray-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -=
fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-c=
heck -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-ty=
pes -Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-alig=
ned -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing=
-format-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-inc=
lude-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-al=
igned -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compa=
re -I fs/btrfs -I ./fs/btrfs -DKBUILD_MODFILE=3D'"fs/btrfs/btrfs"' -DKBUILD=
_BASENAME=3D'"dev_replace"' -DKBUILD_MODNAME=3D'"btrfs"' fs/btrfs/dev-repla=
ce.c
--
   include/linux/seqlock.h:902:16: sparse: sparse: trying to copy expressio=
n type 31
   include/linux/seqlock.h:876:24: sparse: sparse: trying to copy expressio=
n type 31
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   sparse: flow.c:615: rewrite_parent_branch: Assertion `changed' failed.
   /bin/bash: line 1: 15298 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/btrfs/.block-group.o.d -nostdinc -isystem /us=
r/lib/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/includ=
e/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/incl=
ude/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include inclu=
de/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DK=
BUILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs =
-fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-=
function-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu=
89 -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregp=
arm=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=
=3Di686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreesta=
nding -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-po=
inter-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow=
 -Wno-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wf=
rame-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -=
Wimplicit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -f=
no-optimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-de=
bug-baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclarat=
ion-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-a=
rray-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -=
fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-c=
heck -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-ty=
pes -Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-alig=
ned -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing=
-format-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-inc=
lude-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-al=
igned -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compa=
re -I fs/btrfs -I ./fs/btrfs -DKBUILD_MODFILE=3D'"fs/btrfs/btrfs"' -DKBUILD=
_BASENAME=3D'"block_group"' -DKBUILD_MODNAME=3D'"btrfs"' fs/btrfs/block-gro=
up.c
--
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   sparse: flow.c:615: rewrite_parent_branch: Assertion `changed' failed.
   /bin/bash: line 1: 15622 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/btrfs/.reflink.o.d -nostdinc -isystem /usr/li=
b/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/ge=
nerated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/=
generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/l=
inux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUIL=
D_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno=
-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-func=
tion-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -=
mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=
=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di=
686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandin=
g -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointe=
r-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wn=
o-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe=
-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimp=
licit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-o=
ptimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-=
baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-=
after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array=
-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-=
strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check=
 -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types =
-Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned =
-Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-for=
mat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include=
-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligne=
d -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -=
I fs/btrfs -I ./fs/btrfs -DKBUILD_MODFILE=3D'"fs/btrfs/btrfs"' -DKBUILD_BAS=
ENAME=3D'"reflink"' -DKBUILD_MODNAME=3D'"btrfs"' fs/btrfs/reflink.c
--
   fs/open.c:788:13: sparse: sparse: restricted fmode_t degrades to integer
   fs/open.c:1012:20: sparse: sparse: restricted fmode_t degrades to integer
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 11338 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/.read_write.o.d -nostdinc -isystem /usr/lib/g=
cc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gener=
ated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gen=
erated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linu=
x/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_E=
XTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-st=
rict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functio=
n-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno=
-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3=
 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 =
-mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -W=
no-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-ch=
ecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-ad=
dress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-lar=
ger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplici=
t-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optim=
ize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-base=
only -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-afte=
r-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bou=
nds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stri=
ct-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fc=
onserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wer=
ror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wex=
tra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-=
attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dir=
s -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -W=
stringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I fs=
 -I ./fs -DKBUILD_MODFILE=3D'"fs/read_write"' -DKBUILD_BASENAME=3D'"read_wr=
ite"' -DKBUILD_MODNAME=3D'"read_write"' fs/read_write.c
--
   fs/exec.c:417:31: sparse: sparse: incorrect type in return expression (d=
ifferent address spaces) @@     expected char const [noderef] __user * @@  =
   got void * @@
   fs/exec.c:417:31: sparse:     expected char const [noderef] __user *
   fs/exec.c:417:31: sparse:     got void *
   fs/exec.c:1129:48: sparse: sparse: incorrect type in initializer (differ=
ent address spaces) @@     expected struct sighand_struct *oldsighand @@   =
  got struct sighand_struct [noderef] __rcu *sighand @@
   fs/exec.c:1129:48: sparse:     expected struct sighand_struct *oldsighand
   fs/exec.c:1129:48: sparse:     got struct sighand_struct [noderef] __rcu=
 *sighand
   fs/exec.c:1236:56: sparse: sparse: incorrect type in argument 2 (differe=
nt address spaces) @@     expected struct task_struct *parent @@     got st=
ruct task_struct [noderef] __rcu *parent @@
   fs/exec.c:1236:56: sparse:     expected struct task_struct *parent
   fs/exec.c:1236:56: sparse:     got struct task_struct [noderef] __rcu *p=
arent
   fs/exec.c:1271:47: sparse: sparse: incorrect type in initializer (differ=
ent address spaces) @@     expected struct sighand_struct *oldsighand @@   =
  got struct sighand_struct [noderef] __rcu *sighand @@
   fs/exec.c:1271:47: sparse:     expected struct sighand_struct *oldsighand
   fs/exec.c:1271:47: sparse:     got struct sighand_struct [noderef] __rcu=
 *sighand
   fs/exec.c:1781:70: sparse: sparse: incorrect type in argument 1 (differe=
nt address spaces) @@     expected struct task_struct *tsk @@     got struc=
t task_struct [noderef] __rcu *parent @@
   fs/exec.c:1781:70: sparse:     expected struct task_struct *tsk
   fs/exec.c:1781:70: sparse:     got struct task_struct [noderef] __rcu *p=
arent
   fs/exec.c:1985:52: sparse: sparse: incorrect type in initializer (differ=
ent address spaces) @@     expected char const [noderef] __user *const [nod=
eref] __user *native @@     got void *__argv @@
   fs/exec.c:1985:52: sparse:     expected char const [noderef] __user *con=
st [noderef] __user *native
   fs/exec.c:1985:52: sparse:     got void *__argv
   fs/exec.c:1986:52: sparse: sparse: incorrect type in initializer (differ=
ent address spaces) @@     expected char const [noderef] __user *const [nod=
eref] __user *native @@     got void *__envp @@
   fs/exec.c:1986:52: sparse:     expected char const [noderef] __user *con=
st [noderef] __user *native
   fs/exec.c:1986:52: sparse:     got void *__envp
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 14172 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/.ioctl.o.d -nostdinc -isystem /usr/lib/gcc/x8=
6_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/generated =
-Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/generate=
d/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux/kco=
nfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EXTRA_=
WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-strict-=
aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-dec=
laration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno-sse =
-mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3 -fre=
g-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 -mtun=
e=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -Wno-si=
gn-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks =
-Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-address=
-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-larger-t=
han=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplicit-fal=
lthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-s=
ibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-baseonly =
-fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-after-sta=
tement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bounds -=
Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-strict-ov=
erflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fconser=
ve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werror=
=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wextra=
 -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-att=
ribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs -=
Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -Wstr=
ingop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I fs -I=
 ./fs -DKBUILD_MODFILE=3D'"fs/ioctl"' -DKBUILD_BASENAME=3D'"ioctl"' -DKBUIL=
D_MODNAME=3D'"ioctl"' fs/ioctl.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 17125 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/.buffer.o.d -nostdinc -isystem /usr/lib/gcc/x=
86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/generated=
 -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/generat=
ed/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux/kc=
onfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EXTRA=
_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-strict=
-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-de=
claration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno-sse=
 -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3 -fr=
eg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 -mtu=
ne=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -Wno-s=
ign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks=
 -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-addres=
s-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-larger-=
than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplicit-fa=
llthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-=
sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-baseonly=
 -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-after-st=
atement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bounds =
-Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-strict-o=
verflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fconse=
rve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werror=
=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wextra=
 -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-att=
ribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs -=
Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -Wstr=
ingop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I fs -I=
 ./fs -DKBUILD_MODFILE=3D'"fs/buffer"' -DKBUILD_BASENAME=3D'"buffer"' -DKBU=
ILD_MODNAME=3D'"buffer"' fs/buffer.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 17226 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/.block_dev.o.d -nostdinc -isystem /usr/lib/gc=
c/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/genera=
ted -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gene=
rated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux=
/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EX=
TRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-str=
ict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function=
-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno-=
sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3 =
-freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 -=
mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -Wn=
o-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-che=
cks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-add=
ress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-larg=
er-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplicit=
-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimi=
ze-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-baseo=
nly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-after=
-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-boun=
ds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stric=
t-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fco=
nserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werr=
or=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wext=
ra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-a=
ttribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs=
 -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -Ws=
tringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I fs =
-I ./fs -DKBUILD_MODFILE=3D'"fs/block_dev"' -DKBUILD_BASENAME=3D'"block_dev=
"' -DKBUILD_MODNAME=3D'"block_dev"' fs/block_dev.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 17234 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/.direct-io.o.d -nostdinc -isystem /usr/lib/gc=
c/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/genera=
ted -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gene=
rated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux=
/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EX=
TRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-str=
ict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function=
-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno-=
sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3 =
-freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 -=
mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -Wn=
o-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-che=
cks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-add=
ress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-larg=
er-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplicit=
-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimi=
ze-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-baseo=
nly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-after=
-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-boun=
ds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stric=
t-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fco=
nserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werr=
or=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wext=
ra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-a=
ttribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs=
 -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -Ws=
tringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I fs =
-I ./fs -DKBUILD_MODFILE=3D'"fs/direct-io"' -DKBUILD_BASENAME=3D'"direct_io=
"' -DKBUILD_MODNAME=3D'"direct_io"' fs/direct-io.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 17268 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/.mpage.o.d -nostdinc -isystem /usr/lib/gcc/x8=
6_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/generated =
-Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/generate=
d/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux/kco=
nfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EXTRA_=
WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-strict-=
aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-dec=
laration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno-sse =
-mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3 -fre=
g-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 -mtun=
e=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -Wno-si=
gn-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks =
-Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-address=
-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-larger-t=
han=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplicit-fal=
lthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-s=
ibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-baseonly =
-fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-after-sta=
tement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bounds -=
Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-strict-ov=
erflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fconser=
ve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werror=
=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wextra=
 -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-att=
ribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs -=
Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -Wstr=
ingop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I fs -I=
 ./fs -DKBUILD_MODFILE=3D'"fs/mpage"' -DKBUILD_BASENAME=3D'"mpage"' -DKBUIL=
D_MODNAME=3D'"mpage"' fs/mpage.c
--
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long m=
ask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in in=
itializer (different base types) @@     expected unsigned long mask @@     =
got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long m=
ask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in in=
itializer (different base types) @@     expected unsigned long mask @@     =
got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long m=
ask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in in=
itializer (different base types) @@     expected unsigned long mask @@     =
got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long m=
ask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in in=
itializer (different base types) @@     expected unsigned long mask @@     =
got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long m=
ask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in in=
itializer (different base types) @@     expected unsigned long mask @@     =
got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long m=
ask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in in=
itializer (different base types) @@     expected unsigned long mask @@     =
got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long m=
ask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:153:1: sparse: sparse: incorrect type in i=
nitializer (different base types) @@     expected unsigned long mask @@    =
 got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:153:1: sparse:     expected unsigned long =
mask
   include/trace/events/fs_dax.h:153:1: sparse:     got restricted vm_fault=
_t
   include/trace/events/fs_dax.h:153:1: sparse: sparse: incorrect type in i=
nitializer (different base types) @@     expected unsigned long mask @@    =
 got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:153:1: sparse:     expected unsigned long =
mask
   include/trace/events/fs_dax.h:153:1: sparse:     got restricted vm_fault=
_t
   include/trace/events/fs_dax.h:153:1: sparse: sparse: incorrect type in i=
nitializer (different base types) @@     expected unsigned long mask @@    =
 got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:153:1: sparse:     expected unsigned long =
mask
   include/trace/events/fs_dax.h:153:1: sparse:     got restricted vm_fault=
_t
   include/trace/events/fs_dax.h:153:1: sparse: sparse: incorrect type in i=
nitializer (different base types) @@     expected unsigned long mask @@    =
 got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:153:1: sparse:     expected unsigned long =
mask
   include/trace/events/fs_dax.h:153:1: sparse:     got restricted vm_fault=
_t
   include/trace/events/fs_dax.h:153:1: sparse: sparse: incorrect type in i=
nitializer (different base types) @@     expected unsigned long mask @@    =
 got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:153:1: sparse:     expected unsigned long =
mask
   include/trace/events/fs_dax.h:153:1: sparse:     got restricted vm_fault=
_t
   include/trace/events/fs_dax.h:153:1: sparse: sparse: incorrect type in i=
nitializer (different base types) @@     expected unsigned long mask @@    =
 got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:153:1: sparse:     expected unsigned long =
mask
   include/trace/events/fs_dax.h:153:1: sparse:     got restricted vm_fault=
_t
   include/trace/events/fs_dax.h:153:1: sparse: sparse: incorrect type in i=
nitializer (different base types) @@     expected unsigned long mask @@    =
 got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:153:1: sparse:     expected unsigned long =
mask
   include/trace/events/fs_dax.h:153:1: sparse:     got restricted vm_fault=
_t
   include/trace/events/fs_dax.h:153:1: sparse: sparse: incorrect type in i=
nitializer (different base types) @@     expected unsigned long mask @@    =
 got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:153:1: sparse:     expected unsigned long =
mask
   include/trace/events/fs_dax.h:153:1: sparse:     got restricted vm_fault=
_t
   include/trace/events/fs_dax.h:153:1: sparse: sparse: incorrect type in i=
nitializer (different base types) @@     expected unsigned long mask @@    =
 got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:153:1: sparse:     expected unsigned long =
mask
   include/trace/events/fs_dax.h:153:1: sparse:     got restricted vm_fault=
_t
   include/trace/events/fs_dax.h:153:1: sparse: sparse: incorrect type in i=
nitializer (different base types) @@     expected unsigned long mask @@    =
 got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:153:1: sparse:     expected unsigned long =
mask
   include/trace/events/fs_dax.h:153:1: sparse:     got restricted vm_fault=
_t
   include/trace/events/fs_dax.h:153:1: sparse: sparse: incorrect type in i=
nitializer (different base types) @@     expected unsigned long mask @@    =
 got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:153:1: sparse:     expected unsigned long =
mask
   include/trace/events/fs_dax.h:153:1: sparse:     got restricted vm_fault=
_t
   include/trace/events/fs_dax.h:153:1: sparse: sparse: incorrect type in i=
nitializer (different base types) @@     expected unsigned long mask @@    =
 got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:153:1: sparse:     expected unsigned long =
mask
   include/trace/events/fs_dax.h:153:1: sparse:     got restricted vm_fault=
_t
   include/trace/events/fs_dax.h:153:1: sparse: sparse: incorrect type in i=
nitializer (different base types) @@     expected unsigned long mask @@    =
 got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:153:1: sparse:     expected unsigned long =
mask
   include/trace/events/fs_dax.h:153:1: sparse:     got restricted vm_fault=
_t
   fs/dax.c:552:39: sparse: sparse: incorrect type in argument 1 (different=
 base types) @@     expected unsigned long v @@     got restricted vm_fault=
_t @@
   fs/dax.c:552:39: sparse:     expected unsigned long v
   fs/dax.c:552:39: sparse:     got restricted vm_fault_t
   fs/dax.c:554:39: sparse: sparse: incorrect type in argument 1 (different=
 base types) @@     expected unsigned long v @@     got restricted vm_fault=
_t @@
   fs/dax.c:554:39: sparse:     expected unsigned long v
   fs/dax.c:554:39: sparse:     got restricted vm_fault_t
   fs/dax.c:558:31: sparse: sparse: incorrect type in argument 1 (different=
 base types) @@     expected unsigned long v @@     got restricted vm_fault=
_t @@
   fs/dax.c:558:31: sparse:     expected unsigned long v
   fs/dax.c:558:31: sparse:     got restricted vm_fault_t
   fs/dax.c:1037:41: sparse: sparse: incorrect type in argument 3 (differen=
t base types) @@     expected int result @@     got restricted vm_fault_t [=
assigned] [usertype] ret @@
   fs/dax.c:1037:41: sparse:     expected int result
   fs/dax.c:1037:41: sparse:     got restricted vm_fault_t [assigned] [user=
type] ret
   fs/dax.c:1251:41: sparse: sparse: incorrect type in argument 3 (differen=
t base types) @@     expected int result @@     got restricted vm_fault_t [=
usertype] ret @@
   fs/dax.c:1251:41: sparse:     expected int result
   fs/dax.c:1251:41: sparse:     got restricted vm_fault_t [usertype] ret
   fs/dax.c:1267:21: sparse: sparse: incorrect type in assignment (differen=
t base types) @@     expected restricted vm_fault_t [assigned] [usertype] r=
et @@     got unsigned long @@
   fs/dax.c:1267:21: sparse:     expected restricted vm_fault_t [assigned] =
[usertype] ret
   fs/dax.c:1267:21: sparse:     got unsigned long
   fs/dax.c:1334:31: sparse: sparse: incorrect type in assignment (differen=
t base types) @@     expected int major @@     got restricted vm_fault_t @@
   fs/dax.c:1334:31: sparse:     expected int major
   fs/dax.c:1334:31: sparse:     got restricted vm_fault_t
   fs/dax.c:1355:31: sparse: sparse: restricted vm_fault_t degrades to inte=
ger
   fs/dax.c:1355:29: sparse: sparse: incorrect type in assignment (differen=
t base types) @@     expected restricted vm_fault_t [assigned] [usertype] r=
et @@     got unsigned int @@
   fs/dax.c:1355:29: sparse:     expected restricted vm_fault_t [assigned] =
[usertype] ret
   fs/dax.c:1355:29: sparse:     got unsigned int
   fs/dax.c:1397:46: sparse: sparse: incorrect type in argument 3 (differen=
t base types) @@     expected int result @@     got restricted vm_fault_t [=
assigned] [usertype] ret @@
   fs/dax.c:1397:46: sparse:     expected int result
   fs/dax.c:1397:46: sparse:     got restricted vm_fault_t [assigned] [user=
type] ret
   fs/dax.c:1398:16: sparse: sparse: restricted vm_fault_t degrades to inte=
ger
   fs/dax.c:1398:20: sparse: sparse: incorrect type in return expression (d=
ifferent base types) @@     expected restricted vm_fault_t @@     got unsig=
ned int @@
   fs/dax.c:1398:20: sparse:     expected restricted vm_fault_t
   fs/dax.c:1398:20: sparse:     got unsigned int
   fs/dax.c:1675:55: sparse: sparse: incorrect type in argument 3 (differen=
t base types) @@     expected int result @@     got restricted vm_fault_t @@
   fs/dax.c:1675:55: sparse:     expected int result
   fs/dax.c:1675:55: sparse:     got restricted vm_fault_t
   fs/dax.c:1690:58: sparse: sparse: incorrect type in argument 3 (differen=
t base types) @@     expected int result @@     got restricted vm_fault_t [=
assigned] [usertype] ret @@
   fs/dax.c:1690:58: sparse:     expected int result
   fs/dax.c:1690:58: sparse:     got restricted vm_fault_t [assigned] [user=
type] ret
   fs/dax.c:246:13: sparse: sparse: context imbalance in 'wait_entry_unlock=
ed' - unexpected unlock
   fs/dax.c:397:49: sparse: sparse: context imbalance in 'dax_lock_page' - =
different lock contexts for basic block
   fs/dax.c:828:36: sparse: sparse: context imbalance in 'dax_entry_mkclean=
' - unexpected unlock
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 17916 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/.dax.o.d -nostdinc -isystem /usr/lib/gcc/x86_=
64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/generated -I=
include -I./include -Iarch/x86/include/uapi -I./arch/x86/include/generated/=
uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux/kconf=
ig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EXTRA_WA=
RN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-strict-al=
iasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-decla=
ration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno-sse -m=
no-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3 -freg-=
struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 -mtune=
=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -Wno-sig=
n-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -=
Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-address-=
of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-larger-th=
an=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplicit-fall=
through -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-si=
bling-calls -fno-var-tracking-assignments -g -femit-struct-debug-baseonly -=
fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-after-stat=
ement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bounds -W=
no-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-strict-ove=
rflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fconserv=
e-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werror=3D=
designated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wextra -W=
unused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-attrib=
ute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs -Wun=
used-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -Wstring=
op-truncation -Wno-missing-field-initializers -Wno-sign-compare -I fs -I ./=
fs -DKBUILD_MODFILE=3D'"fs/dax"' -DKBUILD_BASENAME=3D'"dax"' -DKBUILD_MODNA=
ME=3D'"dax"' fs/dax.c
--
   fs/coredump.c:369:27: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct spinlock [usertype] *lock @@  =
   got struct spinlock [noderef] __rcu * @@
   fs/coredump.c:369:27: sparse:     expected struct spinlock [usertype] *l=
ock
   fs/coredump.c:369:27: sparse:     got struct spinlock [noderef] __rcu *
   fs/coredump.c:376:29: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct spinlock [usertype] *lock @@  =
   got struct spinlock [noderef] __rcu * @@
   fs/coredump.c:376:29: sparse:     expected struct spinlock [usertype] *l=
ock
   fs/coredump.c:376:29: sparse:     got struct spinlock [noderef] __rcu *
   fs/coredump.c:481:31: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct spinlock [usertype] *lock @@  =
   got struct spinlock [noderef] __rcu * @@
   fs/coredump.c:481:31: sparse:     expected struct spinlock [usertype] *l=
ock
   fs/coredump.c:481:31: sparse:     got struct spinlock [noderef] __rcu *
   fs/coredump.c:486:33: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct spinlock [usertype] *lock @@  =
   got struct spinlock [noderef] __rcu * @@
   fs/coredump.c:486:33: sparse:     expected struct spinlock [usertype] *l=
ock
   fs/coredump.c:486:33: sparse:     got struct spinlock [noderef] __rcu *
   include/linux/sched/signal.h:693:37: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected struct spinlock [usert=
ype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:693:37: sparse:     expected struct spinloc=
k [usertype] *lock
   include/linux/sched/signal.h:693:37: sparse:     got struct spinlock [no=
deref] __rcu *
   include/linux/sched/signal.h:680:37: sparse: sparse: context imbalance i=
n 'zap_threads' - different lock contexts for basic block
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 68292 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/iomap/.trace.o.d -nostdinc -isystem /usr/lib/=
gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gene=
rated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/ge=
nerated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/lin=
ux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_=
EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-s=
trict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functi=
on-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mn=
o-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D=
3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686=
 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -=
Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-c=
hecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-a=
ddress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-la=
rger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplic=
it-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-opti=
mize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-bas=
eonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-aft=
er-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bo=
unds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-str=
ict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -f=
conserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -We=
rror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -We=
xtra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format=
-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-di=
rs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -=
Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I f=
s/iomap -I fs/iomap -I ./fs/iomap -DKBUILD_MODFILE=3D'"fs/iomap/iomap"' -DK=
BUILD_BASENAME=3D'"trace"' -DKBUILD_MODNAME=3D'"iomap"' fs/iomap/trace.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 69400 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/iomap/.buffered-io.o.d -nostdinc -isystem /us=
r/lib/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/includ=
e/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/incl=
ude/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include inclu=
de/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DK=
BUILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs =
-fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-=
function-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu=
89 -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregp=
arm=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=
=3Di686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreesta=
nding -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-po=
inter-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow=
 -Wno-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wf=
rame-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -=
Wimplicit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -f=
no-optimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-de=
bug-baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclarat=
ion-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-a=
rray-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -=
fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-c=
heck -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-ty=
pes -Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-alig=
ned -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing=
-format-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-inc=
lude-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-al=
igned -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compa=
re -I fs/iomap -I fs/iomap -I ./fs/iomap -DKBUILD_MODFILE=3D'"fs/iomap/ioma=
p"' -DKBUILD_BASENAME=3D'"buffered_io"' -DKBUILD_MODNAME=3D'"iomap"' fs/iom=
ap/buffered-io.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 69767 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/iomap/.direct-io.o.d -nostdinc -isystem /usr/=
lib/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/=
generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/includ=
e/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include=
/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBU=
ILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -f=
no-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-fu=
nction-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89=
 -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregpar=
m=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3D=
i686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandi=
ng -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-point=
er-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -W=
no-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wfram=
e-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wim=
plicit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-=
optimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug=
-baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration=
-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-arra=
y-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno=
-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-chec=
k -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types=
 -Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned=
 -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-fo=
rmat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-includ=
e-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-align=
ed -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare =
-I fs/iomap -I fs/iomap -I ./fs/iomap -DKBUILD_MODFILE=3D'"fs/iomap/iomap"'=
 -DKBUILD_BASENAME=3D'"direct_io"' -DKBUILD_MODNAME=3D'"iomap"' fs/iomap/di=
rect-io.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 70326 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/iomap/.seek.o.d -nostdinc -isystem /usr/lib/g=
cc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gener=
ated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gen=
erated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linu=
x/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_E=
XTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-st=
rict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functio=
n-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno=
-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3=
 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 =
-mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -W=
no-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-ch=
ecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-ad=
dress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-lar=
ger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplici=
t-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optim=
ize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-base=
only -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-afte=
r-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bou=
nds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stri=
ct-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fc=
onserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wer=
ror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wex=
tra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-=
attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dir=
s -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -W=
stringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I fs=
/iomap -I fs/iomap -I ./fs/iomap -DKBUILD_MODFILE=3D'"fs/iomap/iomap"' -DKB=
UILD_BASENAME=3D'"seek"' -DKBUILD_MODNAME=3D'"iomap"' fs/iomap/seek.c
--
   fs/reiserfs/inode.c:2430:53: sparse: sparse: non size-preserving pointer=
 to integer cast
   fs/reiserfs/inode.c:2430:53: sparse: sparse: non size-preserving integer=
 to pointer cast
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 68756 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/reiserfs/.inode.o.d -nostdinc -isystem /usr/l=
ib/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/g=
enerated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include=
/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/=
linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUI=
LD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fn=
o-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-fun=
ction-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 =
-mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=
=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di=
686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandin=
g -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointe=
r-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wn=
o-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe=
-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimp=
licit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-o=
ptimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-=
baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-=
after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array=
-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-=
strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check=
 -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types =
-Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned =
-Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-for=
mat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include=
-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligne=
d -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -=
I fs/reiserfs -I ./fs/reiserfs -DKBUILD_MODFILE=3D'"fs/reiserfs/reiserfs"' =
-DKBUILD_BASENAME=3D'"inode"' -DKBUILD_MODNAME=3D'"reiserfs"' fs/reiserfs/i=
node.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 69240 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/reiserfs/.super.o.d -nostdinc -isystem /usr/l=
ib/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/g=
enerated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include=
/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/=
linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUI=
LD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fn=
o-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-fun=
ction-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 =
-mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=
=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di=
686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandin=
g -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointe=
r-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wn=
o-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe=
-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimp=
licit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-o=
ptimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-=
baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-=
after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array=
-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-=
strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check=
 -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types =
-Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned =
-Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-for=
mat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include=
-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligne=
d -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -=
I fs/reiserfs -I ./fs/reiserfs -DKBUILD_MODFILE=3D'"fs/reiserfs/reiserfs"' =
-DKBUILD_BASENAME=3D'"super"' -DKBUILD_MODNAME=3D'"reiserfs"' fs/reiserfs/s=
uper.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   sparse: flow.c:615: rewrite_parent_branch: Assertion `changed' failed.
   /bin/bash: line 1: 10342 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/ext4/.xattr.o.d -nostdinc -isystem /usr/lib/g=
cc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gener=
ated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gen=
erated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linu=
x/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_E=
XTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-st=
rict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functio=
n-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno=
-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3=
 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 =
-mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -W=
no-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-ch=
ecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-ad=
dress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-lar=
ger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplici=
t-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optim=
ize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-base=
only -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-afte=
r-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bou=
nds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stri=
ct-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fc=
onserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wer=
ror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wex=
tra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-=
attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dir=
s -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -W=
stringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I fs=
/ext4 -I ./fs/ext4 -DKBUILD_MODFILE=3D'"fs/ext4/ext4"' -DKBUILD_BASENAME=3D=
'"xattr"' -DKBUILD_MODNAME=3D'"ext4"' fs/ext4/xattr.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   /bin/bash: line 1:  2294 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/ext4/.inline.o.d -nostdinc -isystem /usr/lib/=
gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gene=
rated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/ge=
nerated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/lin=
ux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_=
EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-s=
trict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functi=
on-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mn=
o-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D=
3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686=
 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -=
Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-c=
hecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-a=
ddress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-la=
rger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplic=
it-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-opti=
mize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-bas=
eonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-aft=
er-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bo=
unds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-str=
ict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -f=
conserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -We=
rror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -We=
xtra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format=
-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-di=
rs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -=
Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I f=
s/ext4 -I ./fs/ext4 -DKBUILD_MODFILE=3D'"fs/ext4/ext4"' -DKBUILD_BASENAME=
=3D'"inline"' -DKBUILD_MODNAME=3D'"ext4"' fs/ext4/inline.c
--
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   /bin/bash: line 1:  2573 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/ext4/.inode.o.d -nostdinc -isystem /usr/lib/g=
cc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gener=
ated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gen=
erated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linu=
x/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_E=
XTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-st=
rict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functio=
n-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno=
-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3=
 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 =
-mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -W=
no-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-ch=
ecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-ad=
dress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-lar=
ger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplici=
t-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optim=
ize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-base=
only -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-afte=
r-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bou=
nds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stri=
ct-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fc=
onserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wer=
ror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wex=
tra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-=
attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dir=
s -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -W=
stringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I fs=
/ext4 -I ./fs/ext4 -DKBUILD_MODFILE=3D'"fs/ext4/ext4"' -DKBUILD_BASENAME=3D=
'"inode"' -DKBUILD_MODNAME=3D'"ext4"' fs/ext4/inode.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   sparse: linearize.c:692: insert_branch: Assertion `old =3D=3D jmp' faile=
d.
   /bin/bash: line 1:  3008 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/ext4/.ioctl.o.d -nostdinc -isystem /usr/lib/g=
cc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gener=
ated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gen=
erated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linu=
x/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_E=
XTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-st=
rict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functio=
n-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno=
-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3=
 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 =
-mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -W=
no-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-ch=
ecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-ad=
dress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-lar=
ger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplici=
t-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optim=
ize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-base=
only -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-afte=
r-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bou=
nds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stri=
ct-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fc=
onserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wer=
ror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wex=
tra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-=
attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dir=
s -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -W=
stringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I fs=
/ext4 -I ./fs/ext4 -DKBUILD_MODFILE=3D'"fs/ext4/ext4"' -DKBUILD_BASENAME=3D=
'"ioctl"' -DKBUILD_MODNAME=3D'"ext4"' fs/ext4/ioctl.c
--
   fs/ext4/mballoc.c:2209:9: sparse: sparse: context imbalance in 'ext4_mb_=
good_group_nolock' - different lock contexts for basic block
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   sparse: flow.c:615: rewrite_parent_branch: Assertion `changed' failed.
   /bin/bash: line 1:  3870 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/ext4/.mballoc.o.d -nostdinc -isystem /usr/lib=
/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gen=
erated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/g=
enerated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/li=
nux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD=
_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-=
strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-funct=
ion-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -m=
no-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=
=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di=
686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandin=
g -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointe=
r-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wn=
o-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe=
-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimp=
licit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-o=
ptimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-=
baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-=
after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array=
-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-=
strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check=
 -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types =
-Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned =
-Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-for=
mat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include=
-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligne=
d -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -=
I fs/ext4 -I ./fs/ext4 -DKBUILD_MODFILE=3D'"fs/ext4/ext4"' -DKBUILD_BASENAM=
E=3D'"mballoc"' -DKBUILD_MODNAME=3D'"ext4"' fs/ext4/mballoc.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   sparse: linearize.c:692: insert_branch: Assertion `old =3D=3D jmp' faile=
d.
   /bin/bash: line 1:  4251 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/ext4/.migrate.o.d -nostdinc -isystem /usr/lib=
/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gen=
erated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/g=
enerated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/li=
nux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD=
_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-=
strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-funct=
ion-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -m=
no-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=
=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di=
686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandin=
g -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointe=
r-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wn=
o-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe=
-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimp=
licit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-o=
ptimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-=
baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-=
after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array=
-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-=
strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check=
 -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types =
-Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned =
-Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-for=
mat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include=
-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligne=
d -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -=
I fs/ext4 -I ./fs/ext4 -DKBUILD_MODFILE=3D'"fs/ext4/ext4"' -DKBUILD_BASENAM=
E=3D'"migrate"' -DKBUILD_MODNAME=3D'"ext4"' fs/ext4/migrate.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   sparse: flow.c:615: rewrite_parent_branch: Assertion `changed' failed.
   /bin/bash: line 1:  5425 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/ext4/.move_extent.o.d -nostdinc -isystem /usr=
/lib/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include=
/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/inclu=
de/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include includ=
e/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKB=
UILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -=
fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-f=
unction-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu8=
9 -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregpa=
rm=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=
=3Di686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreesta=
nding -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-po=
inter-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow=
 -Wno-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wf=
rame-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -=
Wimplicit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -f=
no-optimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-de=
bug-baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclarat=
ion-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-a=
rray-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -=
fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-c=
heck -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-ty=
pes -Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-alig=
ned -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing=
-format-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-inc=
lude-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-al=
igned -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compa=
re -I fs/ext4 -I ./fs/ext4 -DKBUILD_MODFILE=3D'"fs/ext4/ext4"' -DKBUILD_BAS=
ENAME=3D'"move_extent"' -DKBUILD_MODNAME=3D'"ext4"' fs/ext4/move_extent.c
--
   fs/ext4/extents.c:979:13: sparse: sparse: Using plain integer as NULL po=
inter
   fs/ext4/extents.c:1034:13: sparse: sparse: Using plain integer as NULL p=
ointer
   fs/ext4/extents.c:1038:34: sparse: sparse: Using plain integer as NULL p=
ointer
   fs/ext4/extents.c:1110:13: sparse: sparse: Using plain integer as NULL p=
ointer
   fs/ext4/extents.c:1184:21: sparse: sparse: Using plain integer as NULL p=
ointer
   fs/ext4/extents.c:1193:21: sparse: sparse: Using plain integer as NULL p=
ointer
   fs/ext4/extents.c:1194:17: sparse: sparse: Using plain integer as NULL p=
ointer
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   /bin/bash: line 1: 69015 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/ext4/.extents.o.d -nostdinc -isystem /usr/lib=
/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gen=
erated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/g=
enerated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/li=
nux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD=
_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-=
strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-funct=
ion-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -m=
no-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=
=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di=
686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandin=
g -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointe=
r-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wn=
o-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe=
-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimp=
licit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-o=
ptimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-=
baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-=
after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array=
-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-=
strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check=
 -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types =
-Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned =
-Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-for=
mat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include=
-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligne=
d -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -=
I fs/ext4 -I ./fs/ext4 -DKBUILD_MODFILE=3D'"fs/ext4/ext4"' -DKBUILD_BASENAM=
E=3D'"extents"' -DKBUILD_MODNAME=3D'"ext4"' fs/ext4/extents.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 70216 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/ext4/.file.o.d -nostdinc -isystem /usr/lib/gc=
c/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/genera=
ted -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gene=
rated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux=
/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EX=
TRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-str=
ict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function=
-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno-=
sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3 =
-freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 -=
mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -Wn=
o-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-che=
cks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-add=
ress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-larg=
er-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplicit=
-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimi=
ze-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-baseo=
nly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-after=
-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-boun=
ds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stric=
t-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fco=
nserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werr=
or=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wext=
ra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-a=
ttribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs=
 -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -Ws=
tringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I fs/=
ext4 -I ./fs/ext4 -DKBUILD_MODFILE=3D'"fs/ext4/ext4"' -DKBUILD_BASENAME=3D'=
"file"' -DKBUILD_MODNAME=3D'"ext4"' fs/ext4/file.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1:  9511 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/ext4/.super.o.d -nostdinc -isystem /usr/lib/g=
cc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gener=
ated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gen=
erated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linu=
x/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_E=
XTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-st=
rict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functio=
n-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno=
-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3=
 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 =
-mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -W=
no-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-ch=
ecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-ad=
dress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-lar=
ger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplici=
t-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optim=
ize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-base=
only -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-afte=
r-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bou=
nds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stri=
ct-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fc=
onserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wer=
ror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wex=
tra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-=
attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dir=
s -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -W=
stringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I fs=
/ext4 -I ./fs/ext4 -DKBUILD_MODFILE=3D'"fs/ext4/ext4"' -DKBUILD_BASENAME=3D=
'"super"' -DKBUILD_MODNAME=3D'"ext4"' fs/ext4/super.c
--
   net/core/filter.c:400:33: sparse: sparse: subtraction of functions? Shar=
e your drugs
   net/core/filter.c:403:33: sparse: sparse: subtraction of functions? Shar=
e your drugs
   net/core/filter.c:406:33: sparse: sparse: subtraction of functions? Shar=
e your drugs
   net/core/filter.c:409:33: sparse: sparse: subtraction of functions? Shar=
e your drugs
   net/core/filter.c:412:33: sparse: sparse: subtraction of functions? Shar=
e your drugs
   net/core/filter.c:486:27: sparse: sparse: subtraction of functions? Shar=
e your drugs
   net/core/filter.c:489:27: sparse: sparse: subtraction of functions? Shar=
e your drugs
   net/core/filter.c:492:27: sparse: sparse: subtraction of functions? Shar=
e your drugs
   net/core/filter.c:1380:39: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct sock_filter const *filter=
 @@     got struct sock_filter [noderef] __user *filter @@
   net/core/filter.c:1380:39: sparse:     expected struct sock_filter const=
 *filter
   net/core/filter.c:1380:39: sparse:     got struct sock_filter [noderef] =
__user *filter
   net/core/filter.c:1458:39: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct sock_filter const *filter=
 @@     got struct sock_filter [noderef] __user *filter @@
   net/core/filter.c:1458:39: sparse:     expected struct sock_filter const=
 *filter
   net/core/filter.c:1458:39: sparse:     got struct sock_filter [noderef] =
__user *filter
   net/core/filter.c:7008:27: sparse: sparse: subtraction of functions? Sha=
re your drugs
   net/core/filter.c:7011:27: sparse: sparse: subtraction of functions? Sha=
re your drugs
   net/core/filter.c:7014:27: sparse: sparse: subtraction of functions? Sha=
re your drugs
   net/core/filter.c:8734:31: sparse: sparse: symbol 'sk_filter_verifier_op=
s' was not declared. Should it be static?
   net/core/filter.c:8741:27: sparse: sparse: symbol 'sk_filter_prog_ops' w=
as not declared. Should it be static?
   net/core/filter.c:8745:31: sparse: sparse: symbol 'tc_cls_act_verifier_o=
ps' was not declared. Should it be static?
   net/core/filter.c:8753:27: sparse: sparse: symbol 'tc_cls_act_prog_ops' =
was not declared. Should it be static?
   net/core/filter.c:8757:31: sparse: sparse: symbol 'xdp_verifier_ops' was=
 not declared. Should it be static?
   net/core/filter.c:8768:31: sparse: sparse: symbol 'cg_skb_verifier_ops' =
was not declared. Should it be static?
   net/core/filter.c:8774:27: sparse: sparse: symbol 'cg_skb_prog_ops' was =
not declared. Should it be static?
   net/core/filter.c:8778:31: sparse: sparse: symbol 'lwt_in_verifier_ops' =
was not declared. Should it be static?
   net/core/filter.c:8784:27: sparse: sparse: symbol 'lwt_in_prog_ops' was =
not declared. Should it be static?
   net/core/filter.c:8788:31: sparse: sparse: symbol 'lwt_out_verifier_ops'=
 was not declared. Should it be static?
   net/core/filter.c:8794:27: sparse: sparse: symbol 'lwt_out_prog_ops' was=
 not declared. Should it be static?
   net/core/filter.c:8798:31: sparse: sparse: symbol 'lwt_xmit_verifier_ops=
' was not declared. Should it be static?
   net/core/filter.c:8805:27: sparse: sparse: symbol 'lwt_xmit_prog_ops' wa=
s not declared. Should it be static?
   net/core/filter.c:8809:31: sparse: sparse: symbol 'lwt_seg6local_verifie=
r_ops' was not declared. Should it be static?
   net/core/filter.c:8815:27: sparse: sparse: symbol 'lwt_seg6local_prog_op=
s' was not declared. Should it be static?
   net/core/filter.c:8819:31: sparse: sparse: symbol 'cg_sock_verifier_ops'=
 was not declared. Should it be static?
   net/core/filter.c:8825:27: sparse: sparse: symbol 'cg_sock_prog_ops' was=
 not declared. Should it be static?
   net/core/filter.c:8828:31: sparse: sparse: symbol 'cg_sock_addr_verifier=
_ops' was not declared. Should it be static?
   net/core/filter.c:8834:27: sparse: sparse: symbol 'cg_sock_addr_prog_ops=
' was not declared. Should it be static?
   net/core/filter.c:8837:31: sparse: sparse: symbol 'sock_ops_verifier_ops=
' was not declared. Should it be static?
   net/core/filter.c:8843:27: sparse: sparse: symbol 'sock_ops_prog_ops' wa=
s not declared. Should it be static?
   net/core/filter.c:8846:31: sparse: sparse: symbol 'sk_skb_verifier_ops' =
was not declared. Should it be static?
   net/core/filter.c:8853:27: sparse: sparse: symbol 'sk_skb_prog_ops' was =
not declared. Should it be static?
   net/core/filter.c:8856:31: sparse: sparse: symbol 'sk_msg_verifier_ops' =
was not declared. Should it be static?
   net/core/filter.c:8863:27: sparse: sparse: symbol 'sk_msg_prog_ops' was =
not declared. Should it be static?
   net/core/filter.c:8866:31: sparse: sparse: symbol 'flow_dissector_verifi=
er_ops' was not declared. Should it be static?
   net/core/filter.c:8872:27: sparse: sparse: symbol 'flow_dissector_prog_o=
ps' was not declared. Should it be static?
   net/core/filter.c:9178:31: sparse: sparse: symbol 'sk_reuseport_verifier=
_ops' was not declared. Should it be static?
   net/core/filter.c:9184:27: sparse: sparse: symbol 'sk_reuseport_prog_ops=
' was not declared. Should it be static?
   net/core/filter.c:215:32: sparse: sparse: cast to restricted __be16
   net/core/filter.c:215:32: sparse: sparse: cast to restricted __be16
   net/core/filter.c:215:32: sparse: sparse: cast to restricted __be16
   net/core/filter.c:215:32: sparse: sparse: cast to restricted __be16
   net/core/filter.c:242:32: sparse: sparse: cast to restricted __be32
   net/core/filter.c:242:32: sparse: sparse: cast to restricted __be32
   net/core/filter.c:242:32: sparse: sparse: cast to restricted __be32
   net/core/filter.c:242:32: sparse: sparse: cast to restricted __be32
   net/core/filter.c:242:32: sparse: sparse: cast to restricted __be32
   net/core/filter.c:242:32: sparse: sparse: cast to restricted __be32
   net/core/filter.c:1882:43: sparse: sparse: incorrect type in argument 2 =
(different base types) @@     expected restricted __wsum [usertype] diff @@=
     got unsigned long long [usertype] to @@
   net/core/filter.c:1882:43: sparse:     expected restricted __wsum [usert=
ype] diff
   net/core/filter.c:1882:43: sparse:     got unsigned long long [usertype]=
 to
   net/core/filter.c:1885:36: sparse: sparse: incorrect type in argument 2 =
(different base types) @@     expected restricted __be16 [usertype] old @@ =
    got unsigned long long [usertype] from @@
   net/core/filter.c:1885:36: sparse:     expected restricted __be16 [usert=
ype] old
   net/core/filter.c:1885:36: sparse:     got unsigned long long [usertype]=
 from
   net/core/filter.c:1885:42: sparse: sparse: incorrect type in argument 3 =
(different base types) @@     expected restricted __be16 [usertype] new @@ =
    got unsigned long long [usertype] to @@
   net/core/filter.c:1885:42: sparse:     expected restricted __be16 [usert=
ype] new
   net/core/filter.c:1885:42: sparse:     got unsigned long long [usertype]=
 to
   net/core/filter.c:1888:36: sparse: sparse: incorrect type in argument 2 =
(different base types) @@     expected restricted __be32 [usertype] from @@=
     got unsigned long long [usertype] from @@
   net/core/filter.c:1888:36: sparse:     expected restricted __be32 [usert=
ype] from
   net/core/filter.c:1888:36: sparse:     got unsigned long long [usertype]=
 from
   net/core/filter.c:1888:42: sparse: sparse: incorrect type in argument 3 =
(different base types) @@     expected restricted __be32 [usertype] to @@  =
   got unsigned long long [usertype] to @@
   net/core/filter.c:1888:42: sparse:     expected restricted __be32 [usert=
ype] to
   net/core/filter.c:1888:42: sparse:     got unsigned long long [usertype]=
 to
   net/core/filter.c:1933:59: sparse: sparse: incorrect type in argument 3 =
(different base types) @@     expected restricted __wsum [usertype] diff @@=
     got unsigned long long [usertype] to @@
   net/core/filter.c:1933:59: sparse:     expected restricted __wsum [usert=
ype] diff
   net/core/filter.c:1933:59: sparse:     got unsigned long long [usertype]=
 to
   net/core/filter.c:1936:52: sparse: sparse: incorrect type in argument 3 =
(different base types) @@     expected restricted __be16 [usertype] from @@=
     got unsigned long long [usertype] from @@
   net/core/filter.c:1936:52: sparse:     expected restricted __be16 [usert=
ype] from
   net/core/filter.c:1936:52: sparse:     got unsigned long long [usertype]=
 from
   net/core/filter.c:1936:58: sparse: sparse: incorrect type in argument 4 =
(different base types) @@     expected restricted __be16 [usertype] to @@  =
   got unsigned long long [usertype] to @@
   net/core/filter.c:1936:58: sparse:     expected restricted __be16 [usert=
ype] to
   net/core/filter.c:1936:58: sparse:     got unsigned long long [usertype]=
 to
   net/core/filter.c:1939:52: sparse: sparse: incorrect type in argument 3 =
(different base types) @@     expected restricted __be32 [usertype] from @@=
     got unsigned long long [usertype] from @@
   net/core/filter.c:1939:52: sparse:     expected restricted __be32 [usert=
ype] from
   net/core/filter.c:1939:52: sparse:     got unsigned long long [usertype]=
 from
   net/core/filter.c:1939:58: sparse: sparse: incorrect type in argument 4 =
(different base types) @@     expected restricted __be32 [usertype] to @@  =
   got unsigned long long [usertype] to @@
   net/core/filter.c:1939:58: sparse:     expected restricted __be32 [usert=
ype] to
   net/core/filter.c:1939:58: sparse:     got unsigned long long [usertype]=
 to
   net/core/filter.c:1985:28: sparse: sparse: incorrect type in return expr=
ession (different base types) @@     expected unsigned long long @@     got=
 restricted __wsum @@
   net/core/filter.c:1985:28: sparse:     expected unsigned long long
   net/core/filter.c:1985:28: sparse:     got restricted __wsum
   net/core/filter.c:2007:35: sparse: sparse: incorrect type in return expr=
ession (different base types) @@     expected unsigned long long @@     got=
 restricted __wsum [usertype] csum @@
   net/core/filter.c:2007:35: sparse:     expected unsigned long long
   net/core/filter.c:2007:35: sparse:     got restricted __wsum [usertype] =
csum
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: too many warnings
   /bin/bash: line 1: 11163 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,net/core/.filter.o.d -nostdinc -isystem /usr/lib=
/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gen=
erated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/g=
enerated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/li=
nux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD=
_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-=
strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-funct=
ion-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -m=
no-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=
=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di=
686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandin=
g -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointe=
r-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wn=
o-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe=
-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimp=
licit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-o=
ptimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-=
baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-=
after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array=
-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-=
strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check=
 -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types =
-Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned =
-Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-for=
mat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include=
-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligne=
d -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -=
I net/core -I ./net/core -DKBUILD_MODFILE=3D'"net/core/filter"' -DKBUILD_BA=
SENAME=3D'"filter"' -DKBUILD_MODNAME=3D'"filter"' net/core/filter.c
--
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
--
   net/core/flow_dissector.c:187:43: sparse: sparse: restricted __be16 degr=
ades to integer
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
--
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   /bin/bash: line 1: 70178 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/hugetlbfs/.inode.o.d -nostdinc -isystem /usr/=
lib/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/=
generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/includ=
e/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include=
/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBU=
ILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -f=
no-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-fu=
nction-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89=
 -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregpar=
m=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3D=
i686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandi=
ng -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-point=
er-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -W=
no-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wfram=
e-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wim=
plicit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-=
optimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug=
-baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration=
-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-arra=
y-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno=
-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-chec=
k -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types=
 -Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned=
 -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-fo=
rmat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-includ=
e-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-align=
ed -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare =
-I fs/hugetlbfs -I ./fs/hugetlbfs -DKBUILD_MODFILE=3D'"fs/hugetlbfs/hugetlb=
fs"' -DKBUILD_BASENAME=3D'"inode"' -DKBUILD_MODNAME=3D'"hugetlbfs"' fs/huge=
tlbfs/inode.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   sparse: flow.c:615: rewrite_parent_branch: Assertion `changed' failed.
   /bin/bash: line 1:  1620 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/exfat/.file.o.d -nostdinc -isystem /usr/lib/g=
cc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gener=
ated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gen=
erated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linu=
x/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_E=
XTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-st=
rict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functio=
n-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno=
-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3=
 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 =
-mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -W=
no-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-ch=
ecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-ad=
dress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-lar=
ger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplici=
t-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optim=
ize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-base=
only -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-afte=
r-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bou=
nds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stri=
ct-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fc=
onserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wer=
ror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wex=
tra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-=
attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dir=
s -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -W=
stringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I fs=
/exfat -I ./fs/exfat -DKBUILD_MODFILE=3D'"fs/exfat/exfat"' -DKBUILD_BASENAM=
E=3D'"file"' -DKBUILD_MODNAME=3D'"exfat"' fs/exfat/file.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 71220 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/exfat/.inode.o.d -nostdinc -isystem /usr/lib/=
gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gene=
rated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/ge=
nerated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/lin=
ux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_=
EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-s=
trict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functi=
on-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mn=
o-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D=
3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686=
 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -=
Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-c=
hecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-a=
ddress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-la=
rger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplic=
it-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-opti=
mize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-bas=
eonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-aft=
er-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bo=
unds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-str=
ict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -f=
conserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -We=
rror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -We=
xtra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format=
-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-di=
rs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -=
Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I f=
s/exfat -I ./fs/exfat -DKBUILD_MODFILE=3D'"fs/exfat/exfat"' -DKBUILD_BASENA=
ME=3D'"inode"' -DKBUILD_MODNAME=3D'"exfat"' fs/exfat/inode.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 71367 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/exfat/.namei.o.d -nostdinc -isystem /usr/lib/=
gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gene=
rated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/ge=
nerated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/lin=
ux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_=
EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-s=
trict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functi=
on-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mn=
o-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D=
3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686=
 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -=
Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-c=
hecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-a=
ddress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-la=
rger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplic=
it-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-opti=
mize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-bas=
eonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-aft=
er-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bo=
unds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-str=
ict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -f=
conserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -We=
rror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -We=
xtra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format=
-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-di=
rs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -=
Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I f=
s/exfat -I ./fs/exfat -DKBUILD_MODFILE=3D'"fs/exfat/exfat"' -DKBUILD_BASENA=
ME=3D'"namei"' -DKBUILD_MODNAME=3D'"exfat"' fs/exfat/namei.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 71619 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/exfat/.dir.o.d -nostdinc -isystem /usr/lib/gc=
c/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/genera=
ted -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gene=
rated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux=
/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EX=
TRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-str=
ict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function=
-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno-=
sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3 =
-freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 -=
mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -Wn=
o-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-che=
cks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-add=
ress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-larg=
er-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplicit=
-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimi=
ze-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-baseo=
nly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-after=
-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-boun=
ds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stric=
t-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fco=
nserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werr=
or=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wext=
ra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-a=
ttribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs=
 -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -Ws=
tringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I fs/=
exfat -I ./fs/exfat -DKBUILD_MODFILE=3D'"fs/exfat/exfat"' -DKBUILD_BASENAME=
=3D'"dir"' -DKBUILD_MODNAME=3D'"exfat"' fs/exfat/dir.c
--
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   sparse: flow.c:615: rewrite_parent_branch: Assertion `changed' failed.
   /bin/bash: line 1: 71781 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/exfat/.super.o.d -nostdinc -isystem /usr/lib/=
gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gene=
rated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/ge=
nerated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/lin=
ux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_=
EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-s=
trict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functi=
on-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mn=
o-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D=
3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686=
 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -=
Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-c=
hecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-a=
ddress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-la=
rger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplic=
it-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-opti=
mize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-bas=
eonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-aft=
er-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bo=
unds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-str=
ict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -f=
conserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -We=
rror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -We=
xtra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format=
-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-di=
rs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -=
Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I f=
s/exfat -I ./fs/exfat -DKBUILD_MODFILE=3D'"fs/exfat/exfat"' -DKBUILD_BASENA=
ME=3D'"super"' -DKBUILD_MODNAME=3D'"exfat"' fs/exfat/super.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1:  3322 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/nfs/.read.o.d -nostdinc -isystem /usr/lib/gcc=
/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/generat=
ed -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gener=
ated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux/=
kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EXT=
RA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-stri=
ct-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-=
declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno-s=
se -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3 -=
freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 -m=
tune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -Wno=
-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-chec=
ks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-addr=
ess-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-large=
r-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplicit-=
fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimiz=
e-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-baseon=
ly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-after-=
statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bound=
s -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-strict=
-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fcon=
serve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werro=
r=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wextr=
a -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-at=
tribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs =
-Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -Wst=
ringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I fs/n=
fs -I ./fs/nfs -DKBUILD_MODFILE=3D'"fs/nfs/nfs"' -DKBUILD_BASENAME=3D'"read=
"' -DKBUILD_MODNAME=3D'"nfs"' fs/nfs/read.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1:  7071 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/nfs/.write.o.d -nostdinc -isystem /usr/lib/gc=
c/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/genera=
ted -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gene=
rated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux=
/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EX=
TRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-str=
ict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function=
-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno-=
sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3 =
-freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 -=
mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -Wn=
o-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-che=
cks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-add=
ress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-larg=
er-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplicit=
-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimi=
ze-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-baseo=
nly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-after=
-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-boun=
ds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stric=
t-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fco=
nserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werr=
or=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wext=
ra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-a=
ttribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs=
 -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -Ws=
tringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I fs/=
nfs -I ./fs/nfs -DKBUILD_MODFILE=3D'"fs/nfs/nfs"' -DKBUILD_BASENAME=3D'"wri=
te"' -DKBUILD_MODNAME=3D'"nfs"' fs/nfs/write.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 71788 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/nfs/.file.o.d -nostdinc -isystem /usr/lib/gcc=
/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/generat=
ed -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gener=
ated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux/=
kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EXT=
RA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-stri=
ct-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-=
declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno-s=
se -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3 -=
freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 -m=
tune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -Wno=
-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-chec=
ks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-addr=
ess-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-large=
r-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplicit-=
fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimiz=
e-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-baseon=
ly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-after-=
statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bound=
s -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-strict=
-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fcon=
serve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werro=
r=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wextr=
a -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-at=
tribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs =
-Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -Wst=
ringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I fs/n=
fs -I ./fs/nfs -DKBUILD_MODFILE=3D'"fs/nfs/nfs"' -DKBUILD_BASENAME=3D'"file=
"' -DKBUILD_MODNAME=3D'"nfs"' fs/nfs/file.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/rculist.h:158:25: sparse: sparse: context imbalance in 'nf=
s_put_lock_context' - unexpected unlock
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   /bin/bash: line 1: 71914 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/nfs/.inode.o.d -nostdinc -isystem /usr/lib/gc=
c/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/genera=
ted -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gene=
rated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux=
/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EX=
TRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-str=
ict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function=
-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno-=
sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3 =
-freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 -=
mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -Wn=
o-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-che=
cks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-add=
ress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-larg=
er-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplicit=
-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimi=
ze-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-baseo=
nly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-after=
-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-boun=
ds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stric=
t-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fco=
nserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werr=
or=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wext=
ra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-a=
ttribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs=
 -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -Ws=
tringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I fs/=
nfs -I ./fs/nfs -DKBUILD_MODFILE=3D'"fs/nfs/nfs"' -DKBUILD_BASENAME=3D'"ino=
de"' -DKBUILD_MODNAME=3D'"nfs"' fs/nfs/inode.c
--
   fs/nfs/./nfstrace.h:423:1: sparse: sparse: incorrect type in initializer=
 (different base types) @@     expected unsigned long eval_value @@     got=
 restricted fmode_t [usertype] @@
   fs/nfs/./nfstrace.h:423:1: sparse:     expected unsigned long eval_value
   fs/nfs/./nfstrace.h:423:1: sparse:     got restricted fmode_t [usertype]
   fs/nfs/./nfstrace.h:424:1: sparse: sparse: incorrect type in initializer=
 (different base types) @@     expected unsigned long eval_value @@     got=
 restricted fmode_t [usertype] @@
   fs/nfs/./nfstrace.h:424:1: sparse:     expected unsigned long eval_value
   fs/nfs/./nfstrace.h:424:1: sparse:     got restricted fmode_t [usertype]
   fs/nfs/./nfstrace.h:425:1: sparse: sparse: incorrect type in initializer=
 (different base types) @@     expected unsigned long eval_value @@     got=
 restricted fmode_t [usertype] @@
   fs/nfs/./nfstrace.h:425:1: sparse:     expected unsigned long eval_value
   fs/nfs/./nfstrace.h:425:1: sparse:     got restricted fmode_t [usertype]
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1:  8631 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/nfs/.nfstrace.o.d -nostdinc -isystem /usr/lib=
/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gen=
erated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/g=
enerated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/li=
nux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD=
_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-=
strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-funct=
ion-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -m=
no-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=
=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di=
686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandin=
g -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointe=
r-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wn=
o-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe=
-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimp=
licit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-o=
ptimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-=
baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-=
after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array=
-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-=
strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check=
 -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types =
-Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned =
-Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-for=
mat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include=
-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligne=
d -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -=
Ifs/nfs -I fs/nfs -I ./fs/nfs -DKBUILD_MODFILE=3D'"fs/nfs/nfs"' -DKBUILD_BA=
SENAME=3D'"nfstrace"' -DKBUILD_MODNAME=3D'"nfs"' fs/nfs/nfstrace.c
--
   net/sched/sch_generic.c:189:50: sparse: sparse: context imbalance in 'tr=
y_bulk_dequeue_skb_slow' - different lock contexts for basic block
   net/sched/sch_generic.c:248:17: sparse: sparse: context imbalance in 'de=
queue_skb' - different lock contexts for basic block
   net/sched/sch_generic.c:294:28: sparse: sparse: context imbalance in 'sc=
h_direct_xmit' - unexpected unlock
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   net/sched/sch_generic.c:1132:13: sparse: sparse: context imbalance in 'q=
disc_deactivate' - different lock contexts for basic block
   include/net/sch_generic.h:141:17: sparse: sparse: trying to copy express=
ion type 31
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   sparse: flow.c:615: rewrite_parent_branch: Assertion `changed' failed.
   /bin/bash: line 1: 10243 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/f2fs/.data.o.d -nostdinc -isystem /usr/lib/gc=
c/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/genera=
ted -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gene=
rated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux=
/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EX=
TRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-str=
ict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function=
-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno-=
sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3 =
-freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 -=
mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -Wn=
o-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-che=
cks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-add=
ress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-larg=
er-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplicit=
-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimi=
ze-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-baseo=
nly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-after=
-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-boun=
ds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stric=
t-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fco=
nserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werr=
or=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wext=
ra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-a=
ttribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs=
 -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -Ws=
tringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I fs/=
f2fs -I ./fs/f2fs -DKBUILD_MODFILE=3D'"fs/f2fs/f2fs"' -DKBUILD_BASENAME=3D'=
"data"' -DKBUILD_MODNAME=3D'"f2fs"' fs/f2fs/data.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   /bin/bash: line 1: 12165 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/f2fs/.recovery.o.d -nostdinc -isystem /usr/li=
b/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/ge=
nerated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/=
generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/l=
inux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUIL=
D_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno=
-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-func=
tion-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -=
mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=
=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di=
686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandin=
g -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointe=
r-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wn=
o-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe=
-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimp=
licit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-o=
ptimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-=
baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-=
after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array=
-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-=
strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check=
 -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types =
-Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned =
-Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-for=
mat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include=
-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligne=
d -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -=
I fs/f2fs -I ./fs/f2fs -DKBUILD_MODFILE=3D'"fs/f2fs/f2fs"' -DKBUILD_BASENAM=
E=3D'"recovery"' -DKBUILD_MODNAME=3D'"f2fs"' fs/f2fs/recovery.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   /bin/bash: line 1:  7257 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/f2fs/.dir.o.d -nostdinc -isystem /usr/lib/gcc=
/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/generat=
ed -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gener=
ated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux/=
kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EXT=
RA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-stri=
ct-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-=
declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno-s=
se -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3 -=
freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 -m=
tune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -Wno=
-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-chec=
ks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-addr=
ess-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-large=
r-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplicit-=
fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimiz=
e-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-baseon=
ly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-after-=
statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bound=
s -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-strict=
-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fcon=
serve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werro=
r=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wextr=
a -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-at=
tribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs =
-Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -Wst=
ringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I fs/f=
2fs -I ./fs/f2fs -DKBUILD_MODFILE=3D'"fs/f2fs/f2fs"' -DKBUILD_BASENAME=3D'"=
dir"' -DKBUILD_MODNAME=3D'"f2fs"' fs/f2fs/dir.c
--
   fs/f2fs/file.c:47:54: sparse: sparse: cast from restricted vm_fault_t
   fs/f2fs/file.c:3375:36: sparse: sparse: incorrect type in argument 1 (di=
fferent base types) @@     expected unsigned short const [usertype] *pwcs @=
@     got restricted __le16 * @@
   fs/f2fs/file.c:3375:36: sparse:     expected unsigned short const [usert=
ype] *pwcs
   fs/f2fs/file.c:3375:36: sparse:     got restricted __le16 *
   fs/f2fs/file.c:3411:28: sparse: sparse: incorrect type in argument 4 (di=
fferent base types) @@     expected unsigned short [usertype] *pwcs @@     =
got restricted __le16 * @@
   fs/f2fs/file.c:3411:28: sparse:     expected unsigned short [usertype] *=
pwcs
   fs/f2fs/file.c:3411:28: sparse:     got restricted __le16 *
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   sparse: flow.c:615: rewrite_parent_branch: Assertion `changed' failed.
   /bin/bash: line 1:  7355 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/f2fs/.file.o.d -nostdinc -isystem /usr/lib/gc=
c/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/genera=
ted -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gene=
rated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux=
/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EX=
TRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-str=
ict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function=
-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno-=
sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3 =
-freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 -=
mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -Wn=
o-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-che=
cks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-add=
ress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-larg=
er-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplicit=
-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimi=
ze-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-baseo=
nly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-after=
-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-boun=
ds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stric=
t-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fco=
nserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werr=
or=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wext=
ra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-a=
ttribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs=
 -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -Ws=
tringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I fs/=
f2fs -I ./fs/f2fs -DKBUILD_MODFILE=3D'"fs/f2fs/f2fs"' -DKBUILD_BASENAME=3D'=
"file"' -DKBUILD_MODNAME=3D'"f2fs"' fs/f2fs/file.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   fs/f2fs/super.c:1048:35: sparse: sparse: context imbalance in 'f2fs_drop=
_inode' - unexpected unlock
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1:  9396 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/f2fs/.super.o.d -nostdinc -isystem /usr/lib/g=
cc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gener=
ated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gen=
erated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linu=
x/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_E=
XTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-st=
rict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functio=
n-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno=
-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3=
 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 =
-mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -W=
no-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-ch=
ecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-ad=
dress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-lar=
ger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplici=
t-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optim=
ize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-base=
only -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-afte=
r-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bou=
nds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stri=
ct-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fc=
onserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wer=
ror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wex=
tra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-=
attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dir=
s -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -W=
stringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I fs=
/f2fs -I ./fs/f2fs -DKBUILD_MODFILE=3D'"fs/f2fs/f2fs"' -DKBUILD_BASENAME=3D=
'"super"' -DKBUILD_MODNAME=3D'"f2fs"' fs/f2fs/super.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   /bin/bash: line 1:  9999 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/f2fs/.inline.o.d -nostdinc -isystem /usr/lib/=
gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gene=
rated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/ge=
nerated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/lin=
ux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_=
EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-s=
trict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functi=
on-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mn=
o-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D=
3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686=
 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -=
Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-c=
hecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-a=
ddress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-la=
rger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplic=
it-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-opti=
mize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-bas=
eonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-aft=
er-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bo=
unds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-str=
ict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -f=
conserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -We=
rror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -We=
xtra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format=
-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-di=
rs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -=
Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I f=
s/f2fs -I ./fs/f2fs -DKBUILD_MODFILE=3D'"fs/f2fs/f2fs"' -DKBUILD_BASENAME=
=3D'"inline"' -DKBUILD_MODNAME=3D'"f2fs"' fs/f2fs/inline.c
--
   include/linux/seqlock.h:902:16: sparse: sparse: trying to copy expressio=
n type 31
   include/linux/seqlock.h:876:24: sparse: sparse: trying to copy expressio=
n type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
--
   net/ipv4/ip_tunnel_core.c:384:45: sparse: sparse: restricted __be16 degr=
ades to integer
   net/ipv4/ip_tunnel_core.c:393:30: sparse: sparse: incorrect type in assi=
gnment (different base types) @@     expected int type @@     got restricte=
d __be16 [usertype] @@
   net/ipv4/ip_tunnel_core.c:393:30: sparse:     expected int type
   net/ipv4/ip_tunnel_core.c:393:30: sparse:     got restricted __be16 [use=
rtype]
   net/ipv4/ip_tunnel_core.c:403:30: sparse: sparse: incorrect type in assi=
gnment (different base types) @@     expected int type @@     got restricte=
d __be16 [usertype] @@
   net/ipv4/ip_tunnel_core.c:403:30: sparse:     expected int type
   net/ipv4/ip_tunnel_core.c:403:30: sparse:     got restricted __be16 [use=
rtype]
   net/ipv4/ip_tunnel_core.c:413:30: sparse: sparse: incorrect type in assi=
gnment (different base types) @@     expected int type @@     got restricte=
d __be16 [usertype] @@
   net/ipv4/ip_tunnel_core.c:413:30: sparse:     expected int type
   net/ipv4/ip_tunnel_core.c:413:30: sparse:     got restricted __be16 [use=
rtype]
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:182:16: sparse: sparse: trying to copy ex=
pression type 31
   include/linux/u64_stats_sync.h:164:16: sparse: sparse: trying to copy ex=
pression type 31
--
   include/linux/seqlock.h:902:16: sparse: sparse: trying to copy expressio=
n type 31
   include/linux/seqlock.h:876:24: sparse: sparse: trying to copy expressio=
n type 31
   net/ipv4/inet_connection_sock.c:181:36: sparse: sparse: context imbalanc=
e in 'inet_csk_find_open_port' - wrong count at exit
   net/ipv4/inet_connection_sock.c:348:24: sparse: sparse: context imbalanc=
e in 'inet_csk_get_port' - different lock contexts for basic block
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   /bin/bash: line 1:  3545 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,net/ipv4/.inet_connection_sock.o.d -nostdinc -is=
ystem /usr/lib/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x=
86/include/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch=
/x86/include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -incl=
ude include/linux/kconfig.h -include include/linux/compiler_types.h -D__KER=
NEL__ -DKBUILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-t=
rigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3D=
implicit-function-declaration -Werror=3Dimplicit-int -Wno-format-security -=
std=3Dgnu89 -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-flo=
at -mregparm=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D=
2 -march=3Di686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -=
ffreestanding -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete=
-null-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-=
overflow -Wno-address-of-packed-member -O2 --param=3Dallow-store-data-races=
=3D0 -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-va=
riable -Wimplicit-fallthrough -Wno-unused-const-variable -fno-omit-frame-po=
inter -fno-optimize-sibling-calls -fno-var-tracking-assignments -g -femit-s=
truct-debug-baseonly -fno-var-tracking -fno-inline-functions-called-once -W=
declaration-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncatio=
n -Wno-array-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uniniti=
alized -fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fno=
-stack-check -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-po=
inter-types -Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-=
not-aligned -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -=
Wmissing-format-attribute -Wmissing-prototypes -Wold-style-definition -Wmis=
sing-include-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacke=
d-not-aligned -Wstringop-truncation -Wno-missing-field-initializers -Wno-si=
gn-compare -I net/ipv4 -I ./net/ipv4 -DKBUILD_MODFILE=3D'"net/ipv4/inet_con=
nection_sock"' -DKBUILD_BASENAME=3D'"inet_connection_sock"' -DKBUILD_MODNAM=
E=3D'"inet_connection_sock"' net/ipv4/inet_connection_sock.c
--
   net/ipv4/tcp_ipv4.c:2691:41: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const *data @@     got st=
ruct tcp_congestion_ops const [noderef] __rcu *tcp_congestion_control @@
   net/ipv4/tcp_ipv4.c:2691:41: sparse:     expected void const *data
   net/ipv4/tcp_ipv4.c:2691:41: sparse:     got struct tcp_congestion_ops c=
onst [noderef] __rcu *tcp_congestion_control
   net/ipv4/tcp_ipv4.c:2800:45: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const *data @@     got st=
ruct tcp_congestion_ops const [noderef] __rcu *extern [addressable] [toplev=
el] tcp_congestion_control @@
   net/ipv4/tcp_ipv4.c:2800:45: sparse:     expected void const *data
   net/ipv4/tcp_ipv4.c:2800:45: sparse:     got struct tcp_congestion_ops c=
onst [noderef] __rcu *extern [addressable] [toplevel] tcp_congestion_control
   net/ipv4/tcp_ipv4.c:2804:50: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct tcp_congestion_ops cons=
t [noderef] __rcu *tcp_congestion_control @@     got struct tcp_congestion_=
ops * @@
   net/ipv4/tcp_ipv4.c:2804:50: sparse:     expected struct tcp_congestion_=
ops const [noderef] __rcu *tcp_congestion_control
   net/ipv4/tcp_ipv4.c:2804:50: sparse:     got struct tcp_congestion_ops *
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   net/ipv4/tcp_ipv4.c:1825:17: sparse: sparse: context imbalance in 'tcp_a=
dd_backlog' - unexpected unlock
   net/ipv4/tcp_ipv4.c:2048:21: sparse: sparse: context imbalance in 'tcp_v=
4_rcv' - different lock contexts for basic block
   net/ipv4/tcp_ipv4.c:2241:20: sparse: sparse: context imbalance in 'liste=
ning_get_next' - unexpected unlock
   net/ipv4/tcp_ipv4.c:2302:9: sparse: sparse: context imbalance in 'establ=
ished_get_first' - wrong count at exit
   net/ipv4/tcp_ipv4.c:2324:40: sparse: sparse: context imbalance in 'estab=
lished_get_next' - unexpected unlock
   net/ipv4/tcp_ipv4.c:2454:36: sparse: sparse: context imbalance in 'tcp_s=
eq_stop' - unexpected unlock
   net/ipv4/tcp_ipv4.c:2692:41: sparse: sparse: dereference of noderef expr=
ession
   net/ipv4/tcp_ipv4.c:2692:41: sparse: sparse: dereference of noderef expr=
ession
   net/ipv4/tcp_ipv4.c:2801:45: sparse: sparse: dereference of noderef expr=
ession
   net/ipv4/tcp_ipv4.c:2801:45: sparse: sparse: dereference of noderef expr=
ession
--
   net/ipv4/route.c:781:46: sparse: sparse: incorrect type in argument 2 (d=
ifferent base types) @@     expected unsigned int [usertype] key @@     got=
 restricted __be32 [usertype] new_gw @@
   net/ipv4/route.c:781:46: sparse:     expected unsigned int [usertype] key
   net/ipv4/route.c:781:46: sparse:     got restricted __be32 [usertype] ne=
w_gw
   net/ipv4/route.c:3063:27: sparse: sparse: incorrect type in assignment (=
different base types) @@     expected restricted __be16 [usertype] len @@  =
   got unsigned int @@
   net/ipv4/route.c:3063:27: sparse:     expected restricted __be16 [userty=
pe] len
   net/ipv4/route.c:3063:27: sparse:     got unsigned int
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
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   sparse: linearize.c:692: insert_branch: Assertion `old =3D=3D jmp' faile=
d.
   /bin/bash: line 1: 72546 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,net/ipv4/.route.o.d -nostdinc -isystem /usr/lib/=
gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gene=
rated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/ge=
nerated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/lin=
ux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_=
EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-s=
trict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functi=
on-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mn=
o-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D=
3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686=
 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -=
Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-c=
hecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-a=
ddress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-la=
rger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplic=
it-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-opti=
mize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-bas=
eonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-aft=
er-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bo=
unds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-str=
ict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -f=
conserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -We=
rror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -We=
xtra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format=
-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-di=
rs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -=
Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I n=
et/ipv4 -I ./net/ipv4 -DKBUILD_MODFILE=3D'"net/ipv4/route"' -DKBUILD_BASENA=
ME=3D'"route"' -DKBUILD_MODNAME=3D'"route"' net/ipv4/route.c
--
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   sparse: linearize.c:692: insert_branch: Assertion `old =3D=3D jmp' faile=
d.
   /bin/bash: line 1: 72998 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,net/ipv4/.ip_input.o.d -nostdinc -isystem /usr/l=
ib/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/g=
enerated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include=
/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/=
linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUI=
LD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fn=
o-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-fun=
ction-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 =
-mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=
=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di=
686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandin=
g -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointe=
r-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wn=
o-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe=
-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimp=
licit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-o=
ptimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-=
baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-=
after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array=
-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-=
strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check=
 -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types =
-Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned =
-Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-for=
mat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include=
-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligne=
d -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -=
I net/ipv4 -I ./net/ipv4 -DKBUILD_MODFILE=3D'"net/ipv4/ip_input"' -DKBUILD_=
BASENAME=3D'"ip_input"' -DKBUILD_MODNAME=3D'"ip_input"' net/ipv4/ip_input.c
--
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   sparse: linearize.c:692: insert_branch: Assertion `old =3D=3D jmp' faile=
d.
   /bin/bash: line 1: 73040 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,net/ipv4/.ip_fragment.o.d -nostdinc -isystem /us=
r/lib/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/includ=
e/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/incl=
ude/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include inclu=
de/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DK=
BUILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs =
-fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-=
function-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu=
89 -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregp=
arm=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=
=3Di686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreesta=
nding -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-po=
inter-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow=
 -Wno-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wf=
rame-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -=
Wimplicit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -f=
no-optimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-de=
bug-baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclarat=
ion-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-a=
rray-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -=
fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-c=
heck -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-ty=
pes -Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-alig=
ned -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing=
-format-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-inc=
lude-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-al=
igned -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compa=
re -I net/ipv4 -I ./net/ipv4 -DKBUILD_MODFILE=3D'"net/ipv4/ip_fragment"' -D=
KBUILD_BASENAME=3D'"ip_fragment"' -DKBUILD_MODNAME=3D'"ip_fragment"' net/ip=
v4/ip_fragment.c
--
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   sparse: linearize.c:692: insert_branch: Assertion `old =3D=3D jmp' faile=
d.
   /bin/bash: line 1: 73050 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,net/ipv4/.ip_forward.o.d -nostdinc -isystem /usr=
/lib/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include=
/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/inclu=
de/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include includ=
e/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKB=
UILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -=
fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-f=
unction-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu8=
9 -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregpa=
rm=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=
=3Di686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreesta=
nding -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-po=
inter-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow=
 -Wno-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wf=
rame-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -=
Wimplicit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -f=
no-optimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-de=
bug-baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclarat=
ion-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-a=
rray-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -=
fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-c=
heck -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-ty=
pes -Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-alig=
ned -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing=
-format-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-inc=
lude-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-al=
igned -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compa=
re -I net/ipv4 -I ./net/ipv4 -DKBUILD_MODFILE=3D'"net/ipv4/ip_forward"' -DK=
BUILD_BASENAME=3D'"ip_forward"' -DKBUILD_MODNAME=3D'"ip_forward"' net/ipv4/=
ip_forward.c
--
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
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
   include/linux/seqlock.h:902:16: sparse: sparse: trying to copy expressio=
n type 31
   include/linux/seqlock.h:876:24: sparse: sparse: trying to copy expressio=
n type 31
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   sparse: linearize.c:692: insert_branch: Assertion `old =3D=3D jmp' faile=
d.
   /bin/bash: line 1: 73660 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,net/ipv4/.ip_output.o.d -nostdinc -isystem /usr/=
lib/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/=
generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/includ=
e/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include=
/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBU=
ILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -f=
no-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-fu=
nction-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89=
 -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregpar=
m=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3D=
i686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandi=
ng -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-point=
er-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -W=
no-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wfram=
e-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wim=
plicit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-=
optimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug=
-baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration=
-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-arra=
y-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno=
-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-chec=
k -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types=
 -Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned=
 -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-fo=
rmat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-includ=
e-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-align=
ed -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare =
-I net/ipv4 -I ./net/ipv4 -DKBUILD_MODFILE=3D'"net/ipv4/ip_output"' -DKBUIL=
D_BASENAME=3D'"ip_output"' -DKBUILD_MODNAME=3D'"ip_output"' net/ipv4/ip_out=
put.c
--
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   net/ipv4/udp.c:1403:28: sparse: sparse: context imbalance in 'udp_rmem_r=
elease' - unexpected unlock
   net/ipv4/udp.c:1435:19: sparse: sparse: context imbalance in 'busylock_a=
cquire' - wrong count at exit
   net/ipv4/udp.c:1447:28: sparse: sparse: context imbalance in 'busylock_r=
elease' - unexpected unlock
   include/net/sock.h:1603:31: sparse: sparse: context imbalance in 'skb_co=
nsume_udp' - unexpected unlock
   include/net/sock.h:1603:31: sparse: sparse: context imbalance in 'udp_de=
stroy_sock' - unexpected unlock
   net/ipv4/udp.c:2851:9: sparse: sparse: context imbalance in 'udp_get_fir=
st' - wrong count at exit
   net/ipv4/udp.c:2866:39: sparse: sparse: context imbalance in 'udp_get_ne=
xt' - unexpected unlock
   net/ipv4/udp.c:2911:31: sparse: sparse: context imbalance in 'udp_seq_st=
op' - unexpected unlock
--
   net/ipv6/route.c:2339:39: sparse: sparse: incorrect type in assignment (=
different base types) @@     expected unsigned int [usertype] flow_label @@=
     got restricted __be32 @@
   net/ipv6/route.c:2339:39: sparse:     expected unsigned int [usertype] f=
low_label
   net/ipv6/route.c:2339:39: sparse:     got restricted __be32
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: too many warnings
   sparse: linearize.c:692: insert_branch: Assertion `old =3D=3D jmp' faile=
d.
   /bin/bash: line 1:  1249 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,net/ipv6/.route.o.d -nostdinc -isystem /usr/lib/=
gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gene=
rated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/ge=
nerated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/lin=
ux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_=
EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-s=
trict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functi=
on-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mn=
o-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D=
3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686=
 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -=
Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-c=
hecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-a=
ddress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-la=
rger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplic=
it-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-opti=
mize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-bas=
eonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-aft=
er-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bo=
unds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-str=
ict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -f=
conserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -We=
rror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -We=
xtra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format=
-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-di=
rs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -=
Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I n=
et/ipv6 -I ./net/ipv6 -DKBUILD_MODFILE=3D'"net/ipv6/ipv6"' -DKBUILD_BASENAM=
E=3D'"route"' -DKBUILD_MODNAME=3D'"ipv6"' net/ipv6/route.c
--
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: too many warnings
   sparse: linearize.c:692: insert_branch: Assertion `old =3D=3D jmp' faile=
d.
   /bin/bash: line 1:  3751 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,net/ipv6/.raw.o.d -nostdinc -isystem /usr/lib/gc=
c/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/genera=
ted -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gene=
rated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux=
/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EX=
TRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-str=
ict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function=
-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno-=
sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3 =
-freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 -=
mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -Wn=
o-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-che=
cks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-add=
ress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-larg=
er-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplicit=
-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimi=
ze-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-baseo=
nly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-after=
-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-boun=
ds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stric=
t-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fco=
nserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werr=
or=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wext=
ra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-a=
ttribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs=
 -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -Ws=
tringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I net=
/ipv6 -I ./net/ipv6 -DKBUILD_MODFILE=3D'"net/ipv6/ipv6"' -DKBUILD_BASENAME=
=3D'"raw"' -DKBUILD_MODNAME=3D'"ipv6"' net/ipv6/raw.c
--
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   sparse: linearize.c:692: insert_branch: Assertion `old =3D=3D jmp' faile=
d.
   /bin/bash: line 1:  3775 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,net/ipv6/.icmp.o.d -nostdinc -isystem /usr/lib/g=
cc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gener=
ated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gen=
erated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linu=
x/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_E=
XTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-st=
rict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functio=
n-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno=
-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3=
 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 =
-mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -W=
no-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-ch=
ecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-ad=
dress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-lar=
ger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplici=
t-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optim=
ize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-base=
only -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-afte=
r-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bou=
nds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stri=
ct-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fc=
onserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wer=
ror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wex=
tra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-=
attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dir=
s -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -W=
stringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I ne=
t/ipv6 -I ./net/ipv6 -DKBUILD_MODFILE=3D'"net/ipv6/ipv6"' -DKBUILD_BASENAME=
=3D'"icmp"' -DKBUILD_MODNAME=3D'"ipv6"' net/ipv6/icmp.c
--
   net/ipv6/mcast.c:607:34: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void [noderef] __user *to @@     g=
ot struct __kernel_sockaddr_storage *p @@
   net/ipv6/mcast.c:607:34: sparse:     expected void [noderef] __user *to
   net/ipv6/mcast.c:607:34: sparse:     got struct __kernel_sockaddr_storag=
e *p
   net/ipv6/mcast.c:550:5: sparse: sparse: symbol 'ip6_mc_msfget' redeclare=
d with different type (incompatible argument 3 (different address spaces)):
   net/ipv6/mcast.c:550:5: sparse:    int extern [addressable] [signed] [to=
plevel] ip6_mc_msfget( ... )
   include/net/ipv6.h:1141:5: sparse: note: previously declared as:
   include/net/ipv6.h:1141:5: sparse:    int extern [addressable] [signed] =
[toplevel] ip6_mc_msfget( ... )
   net/ipv6/mcast.c:259:25: sparse: sparse: context imbalance in 'ip6_mc_fi=
nd_dev_rcu' - different lock contexts for basic block
   net/ipv6/mcast.c:453:9: sparse: sparse: context imbalance in 'ip6_mc_sou=
rce' - unexpected unlock
   include/linux/rcupdate.h:686:9: sparse: sparse: context imbalance in 'ip=
6_mc_msfilter' - unexpected unlock
   include/linux/rcupdate.h:686:9: sparse: sparse: context imbalance in 'ip=
6_mc_msfget' - unexpected unlock
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   sparse: linearize.c:692: insert_branch: Assertion `old =3D=3D jmp' faile=
d.
   /bin/bash: line 1:  3837 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,net/ipv6/.mcast.o.d -nostdinc -isystem /usr/lib/=
gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gene=
rated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/ge=
nerated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/lin=
ux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_=
EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-s=
trict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functi=
on-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mn=
o-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D=
3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686=
 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -=
Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-c=
hecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-a=
ddress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-la=
rger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplic=
it-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-opti=
mize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-bas=
eonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-aft=
er-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bo=
unds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-str=
ict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -f=
conserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -We=
rror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -We=
xtra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format=
-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-di=
rs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -=
Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -I n=
et/ipv6 -I ./net/ipv6 -DKBUILD_MODFILE=3D'"net/ipv6/ipv6"' -DKBUILD_BASENAM=
E=3D'"mcast"' -DKBUILD_MODNAME=3D'"ipv6"' net/ipv6/mcast.c
--
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: too many warnings
   sparse: linearize.c:692: insert_branch: Assertion `old =3D=3D jmp' faile=
d.
   /bin/bash: line 1:  4025 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,net/ipv6/.reassembly.o.d -nostdinc -isystem /usr=
/lib/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include=
/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/inclu=
de/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include includ=
e/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKB=
UILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -=
fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-f=
unction-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu8=
9 -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregpa=
rm=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=
=3Di686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreesta=
nding -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-po=
inter-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow=
 -Wno-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wf=
rame-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -=
Wimplicit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -f=
no-optimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-de=
bug-baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclarat=
ion-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-a=
rray-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -=
fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-c=
heck -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-ty=
pes -Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-alig=
ned -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing=
-format-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-inc=
lude-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-al=
igned -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compa=
re -I net/ipv6 -I ./net/ipv6 -DKBUILD_MODFILE=3D'"net/ipv6/ipv6"' -DKBUILD_=
BASENAME=3D'"reassembly"' -DKBUILD_MODNAME=3D'"ipv6"' net/ipv6/reassembly.c
--
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: too many warnings
   sparse: linearize.c:692: insert_branch: Assertion `old =3D=3D jmp' faile=
d.
   /bin/bash: line 1:  5234 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,net/ipv6/.exthdrs.o.d -nostdinc -isystem /usr/li=
b/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/ge=
nerated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/=
generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/l=
inux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUIL=
D_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno=
-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-func=
tion-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -=
mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=
=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di=
686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandin=
g -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointe=
r-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wn=
o-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe=
-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimp=
licit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-o=
ptimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-=
baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-=
after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array=
-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-=
strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check=
 -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types =
-Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned =
-Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-for=
mat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include=
-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligne=
d -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -=
I net/ipv6 -I ./net/ipv6 -DKBUILD_MODFILE=3D'"net/ipv6/ipv6"' -DKBUILD_BASE=
NAME=3D'"exthdrs"' -DKBUILD_MODNAME=3D'"ipv6"' net/ipv6/exthdrs.c
--
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:902:16: sparse: sparse: trying to copy expressio=
n type 31
   include/linux/seqlock.h:876:24: sparse: sparse: trying to copy expressio=
n type 31
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: too many warnings
   sparse: linearize.c:692: insert_branch: Assertion `old =3D=3D jmp' faile=
d.
   /bin/bash: line 1:   536 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,net/ipv6/.ip6_output.o.d -nostdinc -isystem /usr=
/lib/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include=
/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/inclu=
de/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include includ=
e/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKB=
UILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -=
fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-f=
unction-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu8=
9 -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregpa=
rm=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=
=3Di686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreesta=
nding -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-po=
inter-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow=
 -Wno-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wf=
rame-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -=
Wimplicit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -f=
no-optimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-de=
bug-baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclarat=
ion-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-a=
rray-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -=
fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-c=
heck -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-ty=
pes -Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-alig=
ned -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing=
-format-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-inc=
lude-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-al=
igned -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compa=
re -I net/ipv6 -I ./net/ipv6 -DKBUILD_MODFILE=3D'"net/ipv6/ipv6"' -DKBUILD_=
BASENAME=3D'"ip6_output"' -DKBUILD_MODNAME=3D'"ipv6"' net/ipv6/ip6_output.c
--
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: trying to copy exp=
ression type 31
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
's'
>> include/linux/u64_stats_sync.h:128:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
's'
   include/linux/u64_stats_sync.h:135:9: sparse: sparse: unreplaced symbol =
'return'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: too many warnings
   sparse: linearize.c:692: insert_branch: Assertion `old =3D=3D jmp' faile=
d.
   /bin/bash: line 1:   841 Aborted                 sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,net/ipv6/.ip6_input.o.d -nostdinc -isystem /usr/=
lib/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/=
generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/includ=
e/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include=
/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBU=
ILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -f=
no-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-fu=
nction-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89=
 -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregpar=
m=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3D=
i686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandi=
ng -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-point=
er-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -W=
no-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wfram=
e-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wim=
plicit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-=
optimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug=
-baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration=
-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-arra=
y-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno=
-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-chec=
k -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types=
 -Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned=
 -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-fo=
rmat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-includ=
e-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-align=
ed -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare =
-I net/ipv6 -I ./net/ipv6 -DKBUILD_MODFILE=3D'"net/ipv6/ipv6"' -DKBUILD_BAS=
ENAME=3D'"ip6_input"' -DKBUILD_MODNAME=3D'"ipv6"' net/ipv6/ip6_input.c
--
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 12709 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/cifs/.file.o.d -nostdinc -isystem /usr/lib/gc=
c/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/genera=
ted -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gene=
rated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux=
/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_EX=
TRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-str=
ict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function=
-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno-=
sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3 =
-freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 -=
mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -Wn=
o-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-che=
cks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-add=
ress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-larg=
er-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplicit=
-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimi=
ze-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-baseo=
nly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-after=
-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-boun=
ds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stric=
t-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fco=
nserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werr=
or=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wext=
ra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-a=
ttribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs=
 -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -Ws=
tringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -Ifs/c=
ifs -I fs/cifs -I ./fs/cifs -DMODULE -DKBUILD_BASENAME=3D'"file"' -DKBUILD_=
MODNAME=3D'"cifs"' fs/cifs/file.c
--
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   /bin/bash: line 1: 13032 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/cifs/.inode.o.d -nostdinc -isystem /usr/lib/g=
cc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gener=
ated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/gen=
erated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linu=
x/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD_E=
XTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-st=
rict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functio=
n-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno=
-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=3D3=
 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 =
-mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestanding -W=
no-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-ch=
ecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-ad=
dress-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe-lar=
ger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimplici=
t-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optim=
ize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-base=
only -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-afte=
r-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bou=
nds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-stri=
ct-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fc=
onserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wer=
ror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned -Wex=
tra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-=
attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dir=
s -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned -W=
stringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -Ifs/=
cifs -I fs/cifs -I ./fs/cifs -DMODULE -DKBUILD_BASENAME=3D'"inode"' -DKBUIL=
D_MODNAME=3D'"cifs"' fs/cifs/inode.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   /bin/bash: line 1: 16369 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/cifs/.smb2ops.o.d -nostdinc -isystem /usr/lib=
/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/gen=
erated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/g=
enerated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/li=
nux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUILD=
_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-=
strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-funct=
ion-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -m=
no-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=
=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di=
686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandin=
g -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointe=
r-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wn=
o-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe=
-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimp=
licit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-o=
ptimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-=
baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-=
after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array=
-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-=
strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check=
 -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types =
-Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned =
-Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-for=
mat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include=
-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligne=
d -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -=
Ifs/cifs -I fs/cifs -I ./fs/cifs -DMODULE -DKBUILD_BASENAME=3D'"smb2ops"' -=
DKBUILD_MODNAME=3D'"cifs"' fs/cifs/smb2ops.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   /bin/bash: line 1:  3500 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/overlayfs/.inode.o.d -nostdinc -isystem /usr/=
lib/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/=
generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/includ=
e/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include=
/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBU=
ILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -f=
no-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-fu=
nction-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89=
 -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregpar=
m=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3D=
i686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandi=
ng -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-point=
er-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -W=
no-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wfram=
e-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wim=
plicit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-=
optimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug=
-baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration=
-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-arra=
y-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno=
-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-chec=
k -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types=
 -Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned=
 -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-fo=
rmat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-includ=
e-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-align=
ed -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare =
-I fs/overlayfs -I ./fs/overlayfs -DKBUILD_MODFILE=3D'"fs/overlayfs/overlay=
"' -DKBUILD_BASENAME=3D'"inode"' -DKBUILD_MODNAME=3D'"overlay"' fs/overlayf=
s/inode.c
--
   fs/overlayfs/file.c:42:49: sparse: sparse: restricted fmode_t degrades t=
o integer
   fs/overlayfs/file.c:76:30: sparse: sparse: restricted fmode_t degrades t=
o integer
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: too many warnings
   /bin/bash: line 1:  3595 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/overlayfs/.file.o.d -nostdinc -isystem /usr/l=
ib/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/g=
enerated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include=
/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/=
linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUI=
LD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fn=
o-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-fun=
ction-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 =
-mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=
=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di=
686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandin=
g -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointe=
r-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wn=
o-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe=
-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimp=
licit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-o=
ptimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-=
baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-=
after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array=
-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-=
strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check=
 -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types =
-Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned =
-Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-for=
mat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include=
-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligne=
d -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -=
I fs/overlayfs -I ./fs/overlayfs -DKBUILD_MODFILE=3D'"fs/overlayfs/overlay"=
' -DKBUILD_BASENAME=3D'"file"' -DKBUILD_MODNAME=3D'"overlay"' fs/overlayfs/=
file.c
--
>> include/linux/fs.h:862:23: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:864:18: sparse: sparse: trying to copy expression typ=
e 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:887:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/fs.h:889:9: sparse: sparse: trying to copy expression type=
 31
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 's'
>> include/linux/fs.h:862:23: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:864:18: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'break'
   include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol 'contin=
ue'
>> include/linux/seqlock.h:350:9: sparse: sparse: unreplaced symbol '__ret_=
warn_on'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:887:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:340:16: sparse: sparse: unreplaced symbol 's'
   include/linux/seqlock.h:340:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:345:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 's'
   include/linux/fs.h:889:9: sparse: sparse: unreplaced symbol 'return'
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: label 'continue' already =
bound
   include/linux/seqlock.h:350:9: sparse: sparse: label 'break' already bou=
nd
   include/linux/seqlock.h:350:9: sparse: sparse: too many warnings
   /bin/bash: line 1:  3701 Segmentation fault      sparse -D__linux__ -Dli=
nux -D__STDC__ -Dunix -D__unix__ -Wbitwise -Wno-return-void -Wno-unknown-at=
tribute -fdiagnostic-prefix -D__CHECK_ENDIAN__ -D__i386__ --arch=3Di386 -ml=
ittle-endian -m32 -Wp,-MMD,fs/overlayfs/.dir.o.d -nostdinc -isystem /usr/li=
b/gcc/x86_64-linux-gnu/9/include -Iarch/x86/include -I./arch/x86/include/ge=
nerated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/include/=
generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/l=
inux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -DKBUIL=
D_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno=
-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-func=
tion-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -=
mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m32 -msoft-float -mregparm=
=3D3 -freg-struct-return -fno-pic -mpreferred-stack-boundary=3D2 -march=3Di=
686 -mtune=3Dpentium3 -mtune=3Dgeneric -Wa,-mtune=3Dgeneric32 -ffreestandin=
g -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointe=
r-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wn=
o-address-of-packed-member -O2 --param=3Dallow-store-data-races=3D0 -Wframe=
-larger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -Wimp=
licit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-o=
ptimize-sibling-calls -fno-var-tracking-assignments -g -femit-struct-debug-=
baseonly -fno-var-tracking -fno-inline-functions-called-once -Wdeclaration-=
after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array=
-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-=
strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check=
 -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types =
-Werror=3Ddesignated-init -fmacro-prefix-map=3D=3D -Wno-packed-not-aligned =
-Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-for=
mat-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include=
-dirs -Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligne=
d -Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare -=
I fs/overlayfs -I ./fs/overlayfs -DKBUILD_MODFILE=3D'"fs/overlayfs/overlay"=
' -DKBUILD_BASENAME=3D'"dir"' -DKBUILD_MODNAME=3D'"overlay"' fs/overlayfs/d=
ir.c

# https://github.com/0day-ci/linux/commit/4468f4c7e23ced8c373e0be6c4d96442f=
be70691
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 4468f4c7e23ced8c373e0be6c4d96442fbe70691
vim +/__ret_warn_on +350 include/linux/seqlock.h

4468f4c7e23ced Ahmed S. Darwish 2020-07-20  347  =

4468f4c7e23ced Ahmed S. Darwish 2020-07-20  348  static inline void __seqco=
unt_assert(seqcount_t *s)
4468f4c7e23ced Ahmed S. Darwish 2020-07-20  349  {
4468f4c7e23ced Ahmed S. Darwish 2020-07-20 @350  	lockdep_assert_preemption=
_disabled();
4468f4c7e23ced Ahmed S. Darwish 2020-07-20  351  }
4468f4c7e23ced Ahmed S. Darwish 2020-07-20  352  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3931456900268358318==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3931456900268358318==--

