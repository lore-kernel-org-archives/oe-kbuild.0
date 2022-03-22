Content-Type: multipart/mixed; boundary="===============4832650676893593123=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 11591/13988] drivers/video/fbdev/matrox/matroxfb_base.c:1094:5: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length...
Date: Tue, 22 Mar 2022 11:18:30 +0800
Message-ID: <202203221123.w7q6vix8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4832650676893593123==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   f9006d9269eac8ff295c2cb67280c54888c74106
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 [11591/13988] Kbuild: move=
 to -std=3Dgnu11
:::::: branch date: 15 hours ago
:::::: commit date: 9 days ago
config: i386-randconfig-c001-20220321 (https://download.01.org/0day-ci/arch=
ive/20220322/202203221123.w7q6vix8-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2=
687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/video/fbdev/matrox/matroxfb_base.c:1871:3: note: Taking false br=
anch
                   if (tmp) {
                   ^
   drivers/video/fbdev/matrox/matroxfb_base.c:1876:6: note: Assuming 'pixcl=
ock' is 0
           if (pixclock) {
               ^~~~~~~~
   drivers/video/fbdev/matrox/matroxfb_base.c:1876:2: note: Taking false br=
anch
           if (pixclock) {
           ^
   drivers/video/fbdev/matrox/matroxfb_base.c:1908:6: note: Assuming 'nopan=
' is 0
           if (nopan) {
               ^~~~~
   drivers/video/fbdev/matrox/matroxfb_base.c:1908:2: note: Taking false br=
anch
           if (nopan) {
           ^
   drivers/video/fbdev/matrox/matroxfb_base.c:1917:2: note: Calling 'matrox=
fb_check_var'
           matroxfb_check_var(&vesafb_defined, &minfo->fbcon);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/matrox/matroxfb_base.c:739:6: note: Assuming field '=
dead' is 0
           if (minfo->dead) {
               ^~~~~~~~~~~
   drivers/video/fbdev/matrox/matroxfb_base.c:739:2: note: Taking false bra=
nch
           if (minfo->dead) {
           ^
   drivers/video/fbdev/matrox/matroxfb_base.c:742:13: note: Calling 'matrox=
fb_decode_var'
           if ((err =3D matroxfb_decode_var(minfo, var, &visual, &cmap_len,=
 &ydstorg)) !=3D 0)
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   drivers/video/fbdev/matrox/matroxfb_base.c:557:2: note: Control jumps to=
 'case 32:'  at line 563
           switch (bpp) {
           ^
   drivers/video/fbdev/matrox/matroxfb_base.c:563:12: note:  Execution cont=
inues on line 566
                   case 32: break;
                            ^
   drivers/video/fbdev/matrox/matroxfb_base.c:568:6: note: Assuming field '=
yres_virtual' is >=3D field 'yres'
           if (var->yres_virtual < var->yres)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/matrox/matroxfb_base.c:568:2: note: Taking false bra=
nch
           if (var->yres_virtual < var->yres)
           ^
   drivers/video/fbdev/matrox/matroxfb_base.c:570:11: note: Field 'xres_vir=
tual' is >=3D field 'xres'
           if (var->xres_virtual < var->xres)
                    ^
   drivers/video/fbdev/matrox/matroxfb_base.c:570:2: note: Taking false bra=
nch
           if (var->xres_virtual < var->xres)
           ^
   drivers/video/fbdev/matrox/matroxfb_base.c:575:6: note: Assuming 'memlen=
' is <=3D 'vramlen'
           if (memlen > vramlen) {
               ^~~~~~~~~~~~~~~~
   drivers/video/fbdev/matrox/matroxfb_base.c:575:2: note: Taking false bra=
nch
           if (memlen > vramlen) {
           ^
   drivers/video/fbdev/matrox/matroxfb_base.c:582:6: note: Assuming field '=
cross4MB' is 0
           if (!minfo->capable.cross4MB && (memlen > 0x400000)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/matrox/matroxfb_base.c:582:6: note: Left side of '&&=
' is true
   drivers/video/fbdev/matrox/matroxfb_base.c:582:35: note: Assuming 'memle=
n' is > 4194304
           if (!minfo->capable.cross4MB && (memlen > 0x400000)) {
                                            ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/matrox/matroxfb_base.c:582:2: note: Taking true bran=
ch
           if (!minfo->capable.cross4MB && (memlen > 0x400000)) {
           ^
   drivers/video/fbdev/matrox/matroxfb_base.c:583:7: note: 'bpp' is not equ=
al to 24
                   if (bpp =3D=3D 24) {
                       ^~~
   drivers/video/fbdev/matrox/matroxfb_base.c:583:3: note: Taking false bra=
nch
                   if (bpp =3D=3D 24) {
                   ^
   drivers/video/fbdev/matrox/matroxfb_base.c:591:4: note: Loop condition i=
s false. Execution continues on line 595
                           while (m1) {
                           ^
   drivers/video/fbdev/matrox/matroxfb_base.c:595:4: note: The value 0 is a=
ssigned to 'm2'
                           m2 =3D linelen * PAGE_SIZE / m2;
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/matrox/matroxfb_base.c:596:29: note: Division by zero
                           *ydstorg =3D m2 =3D 0x400000 % m2;
                                           ~~~~~~~~~^~~~
   drivers/video/fbdev/matrox/matroxfb_base.c:847:2: warning: Call to funct=
ion 'memset' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memset_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(vblank, 0, sizeof(*vblank));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/video/fbdev/matrox/matroxfb_base.c:847:2: note: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11
           memset(vblank, 0, sizeof(*vblank));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/video/fbdev/matrox/matroxfb_base.c:1091:5: warning: Call to func=
tion 'memset' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memset_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(&r, 0, sizeof(r));
                                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/video/fbdev/matrox/matroxfb_base.c:1091:5: note: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11
                                   memset(&r, 0, sizeof(r));
                                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
>> drivers/video/fbdev/matrox/matroxfb_base.c:1094:5: warning: Call to func=
tion 'sprintf' is insecure as it does not provide bounding of the memory bu=
ffer or security checks introduced in the C11 standard. Replace with analog=
ous functions that support length arguments or provides boundary checks suc=
h as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprec=
atedOrUnsafeBufferHandling]
                                   sprintf(r.bus_info, "PCI:%s", pci_name(m=
info->pcidev));
                                   ^~~~~~~
   drivers/video/fbdev/matrox/matroxfb_base.c:1094:5: note: Call to functio=
n 'sprintf' is insecure as it does not provide bounding of the memory buffe=
r or security checks introduced in the C11 standard. Replace with analogous=
 functions that support length arguments or provides boundary checks such a=
s 'sprintf_s' in case of C11
                                   sprintf(r.bus_info, "PCI:%s", pci_name(m=
info->pcidev));
                                   ^~~~~~~
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   fs/ubifs/sysfs.c:100:6: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           n =3D snprintf(dfs_dir_name, UBIFS_DFS_DIR_LEN + 1, UBIFS_DFS_DI=
R_NAME,
               ^~~~~~~~
   fs/ubifs/sysfs.c:100:6: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           n =3D snprintf(dfs_dir_name, UBIFS_DFS_DIR_LEN + 1, UBIFS_DFS_DI=
R_NAME,
               ^~~~~~~~
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   drivers/mtd/nand/raw/sm_common.c:106:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&oob, -1, SM_OOB_SIZE);
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/sm_common.c:106:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(&oob, -1, SM_OOB_SIZE);
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/mtd/nand/raw/cafe_nand.c:125:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(cafe->dmabuf + cafe->datalen, buf, len);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/cafe_nand.c:125:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(cafe->dmabuf + cafe->datalen, buf, len);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/cafe_nand.c:140:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, cafe->dmabuf + cafe->datalen, len);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/cafe_nand.c:140:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, cafe->dmabuf + cafe->datalen, len);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   mm/highmem.c:385:5: warning: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
                                   memset(kaddr + start1, 0, this_end - sta=
rt1);
                                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   mm/highmem.c:385:5: note: Call to function 'memset' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memset_s' in case of C11
                                   memset(kaddr + start1, 0, this_end - sta=
rt1);
                                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   mm/highmem.c:400:5: warning: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
                                   memset(kaddr + start2, 0, this_end - sta=
rt2);
                                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   mm/highmem.c:400:5: note: Call to function 'memset' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memset_s' in case of C11
                                   memset(kaddr + start2, 0, this_end - sta=
rt2);
                                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   mm/highmem.c:682:3: warning: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
                   memset(&tsk->kmap_ctrl, 0, sizeof(tsk->kmap_ctrl));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   mm/highmem.c:682:3: note: Call to function 'memset' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memset_s' in case of C11
                   memset(&tsk->kmap_ctrl, 0, sizeof(tsk->kmap_ctrl));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
                               ^~~~~~~~~~~~~~~~
   drivers/misc/mei/hbm.c:444:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(&resp, 0, sizeof(resp));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/misc/mei/hbm.c:613:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&req, 0, sizeof(req));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/misc/mei/hbm.c:613:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(&req, 0, sizeof(req));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/misc/mei/hbm.c:644:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&req, 0, sizeof(req));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/misc/mei/hbm.c:644:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(&req, 0, sizeof(req));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/misc/mei/hbm.c:742:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&req, 0, sizeof(req));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/misc/mei/hbm.c:742:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(&req, 0, sizeof(req));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/misc/mei/hbm.c:780:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&req, 0, sizeof(req));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/misc/mei/hbm.c:780:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(&req, 0, sizeof(req));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/misc/mei/hbm.c:804:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&req, 0, sizeof(req));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/misc/mei/hbm.c:804:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(&req, 0, sizeof(req));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/misc/mei/hbm.c:1499:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dev->me_clients_map, enum_res->valid_addresses,
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/misc/mei/hbm.c:1499:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(dev->me_clients_map, enum_res->valid_addresses,
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/misc/mei/main.c:942:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%08X\n", trc);
                  ^~~~~~~
   drivers/misc/mei/main.c:942:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%08X\n", trc);
                  ^~~~~~~
   drivers/misc/mei/main.c:997:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u.%u\n", ver.major_version, ver.minor_vers=
ion);
                  ^~~~~~~
   drivers/misc/mei/main.c:997:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u.%u\n", ver.major_version, ver.minor_vers=
ion);
                  ^~~~~~~
   drivers/misc/mei/main.c:1013:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u.%u\n", HBM_MAJOR_VERSION, HBM_MINOR_VERS=
ION);
                  ^~~~~~~
   drivers/misc/mei/main.c:1013:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u.%u\n", HBM_MAJOR_VERSION, HBM_MINOR_VERS=
ION);
                  ^~~~~~~
>> drivers/misc/mei/main.c:1100:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           return sprintf(buf, "%s", mei_dev_state_str(dev_state));
                  ^~~~~~~
   drivers/misc/mei/main.c:1100:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           return sprintf(buf, "%s", mei_dev_state_str(dev_state));
                  ^~~~~~~
   drivers/misc/mei/main.c:1142:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
                   ret =3D sprintf(buf, "%s\n", dev->kind);
                         ^~~~~~~
   drivers/misc/mei/main.c:1142:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
                   ret =3D sprintf(buf, "%s\n", dev->kind);
                         ^~~~~~~
   drivers/misc/mei/main.c:1144:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
                   ret =3D sprintf(buf, "%s\n", "mei");
                         ^~~~~~~
   drivers/misc/mei/main.c:1144:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
                   ret =3D sprintf(buf, "%s\n", "mei");
                         ^~~~~~~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   arch/x86/kernel/cpu/resctrl/monitor.c:317:3: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(m, 0, sizeof(struct mbm_state));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/resctrl/monitor.c:317:3: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
                   memset(m, 0, sizeof(struct mbm_state));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   arch/x86/kernel/cpu/resctrl/ctrlmondata.c:387:4: warning: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(dom->staged_config, 0, sizeof(dom->staged=
_config));
                           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/resctrl/ctrlmondata.c:387:4: note: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11
                           memset(dom->staged_config, 0, sizeof(dom->staged=
_config));
                           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/acpi/pci_link.c:88:14: warning: Value stored to 'handle' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           acpi_handle handle =3D link->device->handle;
                       ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/pci_link.c:88:14: note: Value stored to 'handle' during its=
 initialization is never read
           acpi_handle handle =3D link->device->handle;
                       ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/pci_link.c:717:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_device_name(device), ACPI_PCI_LINK_DEVICE_NAME);
           ^~~~~~
   drivers/acpi/pci_link.c:717:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(acpi_device_name(device), ACPI_PCI_LINK_DEVICE_NAME);
           ^~~~~~
   drivers/acpi/pci_link.c:718:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_device_class(device), ACPI_PCI_LINK_CLASS);
           ^~~~~~
   drivers/acpi/pci_link.c:718:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(acpi_device_class(device), ACPI_PCI_LINK_CLASS);
           ^~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/acpi/pci_irq.c:131:4: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(prt->source, quirk->actual_source);
                           ^~~~~~
   drivers/acpi/pci_irq.c:131:4: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
                           strcpy(prt->source, quirk->actual_source);
                           ^~~~~~
   drivers/acpi/pci_irq.c:462:3: warning: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(link_desc, sizeof(link_desc), " -> Link[%s]", l=
ink);
                   ^~~~~~~~
   drivers/acpi/pci_irq.c:462:3: note: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11
                   snprintf(link_desc, sizeof(link_desc), " -> Link[%s]", l=
ink);
                   ^~~~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   arch/x86/include/asm/paravirt.h:55:2: warning: Assigned value is garbage=
 or undefined [clang-analyzer-core.uninitialized.Assign]
           PVOP_VCALL0(cpu.io_delay);
           ^
   arch/x86/include/asm/paravirt_types.h:512:2: note: expanded from macro '=
PVOP_VCALL0'
           __PVOP_VCALL(op)
           ^
   arch/x86/include/asm/paravirt_types.h:492:8: note: expanded from macro '=
__PVOP_VCALL'
           (void)____PVOP_CALL(, op, CLBR_ANY, PVOP_VCALL_CLOBBERS,        \
                 ^
   arch/x86/include/asm/paravirt_types.h:447:3: note: expanded from macro '=
____PVOP_CALL'
                   PVOP_CALL_ARGS;                                         \
--
           ^
   mm/page-writeback.c:2857:6: note: Assuming 'mapping' is null
           if (mapping && mapping_use_writeback_tags(mapping)) {
               ^~~~~~~
   mm/page-writeback.c:2857:14: note: Left side of '&&' is false
           if (mapping && mapping_use_writeback_tags(mapping)) {
                       ^
   mm/page-writeback.c:2897:6: note: Assuming 'ret' is true
           if (!ret) {
               ^~~~
   mm/page-writeback.c:2897:2: note: Taking false branch
           if (!ret) {
           ^
   mm/page-writeback.c:2902:15: note: Calling 'arch_make_folio_accessible'
           access_ret =3D arch_make_folio_accessible(folio);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:1694:2: note: 'ret' declared without an initial value
           int ret;
           ^~~~~~~
   include/linux/mm.h:1697:14: note: Assuming 'i' is >=3D 'nr'
           for (i =3D 0; i < nr; i++) {
                       ^~~~~~
   include/linux/mm.h:1697:2: note: Loop condition is false. Execution cont=
inues on line 1703
           for (i =3D 0; i < nr; i++) {
           ^
   include/linux/mm.h:1703:2: note: Undefined or garbage value returned to =
caller
           return ret;
           ^      ~~~
   mm/page-writeback.c:637:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(dom, 0, sizeof(*dom));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   mm/page-writeback.c:637:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(dom, 0, sizeof(*dom));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   75 warnings generated.
   drivers/net/wan/hdlc_raw_eth.c:37:3: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(skb->data + len, 0, pad);
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/net/wan/hdlc_raw_eth.c:37:3: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
                   memset(skb->data + len, 0, pad);
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/net/wan/hdlc_raw_eth.c:98:3: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(hdlc->state, &new_settings, size);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/net/wan/hdlc_raw_eth.c:98:3: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(hdlc->state, &new_settings, size);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 73 warnings (73 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (22 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/mtd/maps/amd76xrom.c:195:3: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(map, 0, sizeof(*map));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/mtd/maps/amd76xrom.c:195:3: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
                   memset(map, 0, sizeof(*map));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
>> drivers/mtd/maps/amd76xrom.c:204:3: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
                   sprintf(map->map_name, "%s @%08Lx",
                   ^~~~~~~
   drivers/mtd/maps/amd76xrom.c:204:3: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
                   sprintf(map->map_name, "%s @%08Lx",
                   ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/char/agp/ati-agp.c:65:2: warning: Value stored to 'err' is never=
 read [clang-analyzer-deadcode.DeadStores]
           err =3D map_page_into_agp(virt_to_page(page_map->real));
           ^
   drivers/char/agp/ati-agp.c:65:2: note: Value stored to 'err' is never re=
ad
   Suppressed 40 warnings (39 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (19 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   drivers/auxdisplay/ht16k33.c:146:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, &priv->seg.map, priv->seg.map_size);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/auxdisplay/ht16k33.c:146:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, &priv->seg.map, priv->seg.map_size);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/auxdisplay/ht16k33.c:158:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&priv->seg.map, buf, cnt);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/auxdisplay/ht16k33.c:158:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(&priv->seg.map, buf, cnt);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/auxdisplay/ht16k33.c:285:3: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(p1, p2, len);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/auxdisplay/ht16k33.c:285:3: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                   memcpy(p1, p2, len);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/auxdisplay/ht16k33.c:297:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(data, 0, sizeof(data));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/auxdisplay/ht16k33.c:297:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(data, 0, sizeof(data));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/auxdisplay/ht16k33.c:404:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(keypad->last_key_state, new_state, sizeof(u16) * keypad->=
cols);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/auxdisplay/ht16k33.c:404:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(keypad->last_key_state, new_state, sizeof(u16) * keypad->=
cols);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/auxdisplay/ht16k33.c:599:3: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
--
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/base/regmap/regmap.c:1526:11: note: Left side of '||' is true
                   async =3D list_first_entry_or_null(&map->async_free,
                           ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:314:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   drivers/base/regmap/regmap.c:1526:11: note: Taking false branch
                   async =3D list_first_entry_or_null(&map->async_free,
                           ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/base/regmap/regmap.c:1526:11: note: Loop condition is false.  Ex=
iting loop
                   async =3D list_first_entry_or_null(&map->async_free,
                           ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/base/regmap/regmap.c:1526:11: note: Assuming 'pos__' is not equa=
l to 'head__'
                   async =3D list_first_entry_or_null(&map->async_free,
                           ^
   include/linux/list.h:555:2: note: expanded from macro 'list_first_entry_=
or_null'
           pos__ !=3D head__ ? list_entry(pos__, type, member) : NULL; \
           ^~~~~~~~~~~~~~~
   drivers/base/regmap/regmap.c:1526:11: note: '?' condition is true
                   async =3D list_first_entry_or_null(&map->async_free,
                           ^
   include/linux/list.h:555:2: note: expanded from macro 'list_first_entry_=
or_null'
           pos__ !=3D head__ ? list_entry(pos__, type, member) : NULL; \
           ^
   drivers/base/regmap/regmap.c:1529:3: note: Calling 'list_del'
                   list_del(&async->list);
                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 55 warnings (55 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/mtd/maps/ck804xrom.c:225:3: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(map, 0, sizeof(*map));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/mtd/maps/ck804xrom.c:225:3: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
                   memset(map, 0, sizeof(*map));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
>> drivers/mtd/maps/ck804xrom.c:234:3: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
                   sprintf(map->map_name, "%s @%08Lx",
                   ^~~~~~~
   drivers/mtd/maps/ck804xrom.c:234:3: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
                   sprintf(map->map_name, "%s @%08Lx",
                   ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/mfd/wm831x-otp.c:52:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%*phN\n", WM831X_UNIQUE_ID_LEN, id);
                  ^~~~~~~
   drivers/mfd/wm831x-otp.c:52:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%*phN\n", WM831X_UNIQUE_ID_LEN, id);
                  ^~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/mfd/wm831x-i2c.c:61:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&wm831x->pdata, pdata, sizeof(*pdata));
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/mfd/wm831x-i2c.c:61:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(&wm831x->pdata, pdata, sizeof(*pdata));
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   77 warnings generated.
   drivers/vdpa/vdpa.c:117:8: warning: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D snprintf(buf, PAGE_SIZE, "%s\n", vdev->driver_override);
                 ^~~~~~~~
   drivers/vdpa/vdpa.c:117:8: note: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11
           len =3D snprintf(buf, PAGE_SIZE, "%s\n", vdev->driver_override);
                 ^~~~~~~~
   drivers/vdpa/vdpa.c:602:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(config.net.mac, macaddr, sizeof(config.net.mac));
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/vdpa/vdpa.c:602:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(config.net.mac, macaddr, sizeof(config.net.mac));
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 75 warnings (75 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   drivers/w1/slaves/w1_ds2408.c:297:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&magic[1], &rn, 8);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_ds2408.c:297:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&magic[1], &rn, 8);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 20 warnings (20 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (20 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (20 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   drivers/w1/slaves/w1_ds2423.c:65:10: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   c -=3D snprintf(out_buf + PAGE_SIZE - c,
                                        ^~~~~~~~
   drivers/w1/slaves/w1_ds2423.c:65:10: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
                                   c -=3D snprintf(out_buf + PAGE_SIZE - c,
                                        ^~~~~~~~
   drivers/w1/slaves/w1_ds2423.c:74:10: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   c -=3D snprintf(out_buf + PAGE_SIZE - c,
                                        ^~~~~~~~
   drivers/w1/slaves/w1_ds2423.c:74:10: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
                                   c -=3D snprintf(out_buf + PAGE_SIZE - c,
                                        ^~~~~~~~
   drivers/w1/slaves/w1_ds2423.c:97:11: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                           c -=3D snprintf(out_buf + PAGE_S=
IZE - c,
                                                ^~~~~~~~
   drivers/w1/slaves/w1_ds2423.c:97:11: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
                                           c -=3D snprintf(out_buf + PAGE_S=
IZE - c,
--
                  ^~~~~~~
   drivers/hwmon/vt8231.c:189:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", ((data->in[nr] - 3) * 10000) / 958);
                  ^~~~~~~
   drivers/hwmon/vt8231.c:199:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", ((data->in_min[nr] - 3) * 10000) / 9=
58);
                  ^~~~~~~
   drivers/hwmon/vt8231.c:199:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", ((data->in_min[nr] - 3) * 10000) / 9=
58);
                  ^~~~~~~
   drivers/hwmon/vt8231.c:209:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", (((data->in_max[nr] - 3) * 10000) / =
958));
                  ^~~~~~~
   drivers/hwmon/vt8231.c:209:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", (((data->in_max[nr] - 3) * 10000) / =
958));
                  ^~~~~~~
   drivers/hwmon/vt8231.c:258:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/vt8231.c:258:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/vt8231.c:267:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/vt8231.c:267:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/vt8231.c:276:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/vt8231.c:276:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/vt8231.c:345:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->temp[0] * 250);
                  ^~~~~~~
   drivers/hwmon/vt8231.c:345:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->temp[0] * 250);
                  ^~~~~~~
   drivers/hwmon/vt8231.c:352:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->temp_max[0] * 1000);
                  ^~~~~~~
   drivers/hwmon/vt8231.c:352:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->temp_max[0] * 1000);
                  ^~~~~~~
   drivers/hwmon/vt8231.c:359:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->temp_min[0] * 1000);
                  ^~~~~~~
   drivers/hwmon/vt8231.c:359:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->temp_min[0] * 1000);
                  ^~~~~~~
   drivers/hwmon/vt8231.c:405:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[nr]));
                  ^~~~~~~
   drivers/hwmon/vt8231.c:405:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[nr]));
                  ^~~~~~~
   drivers/hwmon/vt8231.c:414:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP_MAXMIN_FROM_REG(data->temp_max[=
nr]));
                  ^~~~~~~
   drivers/hwmon/vt8231.c:414:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", TEMP_MAXMIN_FROM_REG(data->temp_max[=
nr]));
                  ^~~~~~~
   drivers/hwmon/vt8231.c:423:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP_MAXMIN_FROM_REG(data->temp_min[=
nr]));
                  ^~~~~~~
   drivers/hwmon/vt8231.c:423:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", TEMP_MAXMIN_FROM_REG(data->temp_min[=
nr]));
                  ^~~~~~~
   drivers/hwmon/vt8231.c:499:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[nr],
                  ^~~~~~~
   drivers/hwmon/vt8231.c:499:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[nr],
                  ^~~~~~~
   drivers/hwmon/vt8231.c:509:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan_min[nr],
                  ^~~~~~~
   drivers/hwmon/vt8231.c:509:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan_min[nr],
                  ^~~~~~~
   drivers/hwmon/vt8231.c:519:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", DIV_FROM_REG(data->fan_div[nr]));
                  ^~~~~~~
   drivers/hwmon/vt8231.c:519:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", DIV_FROM_REG(data->fan_div[nr]));
                  ^~~~~~~
   drivers/hwmon/vt8231.c:604:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->alarms);
                  ^~~~~~~
   drivers/hwmon/vt8231.c:604:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->alarms);
                  ^~~~~~~
   drivers/hwmon/vt8231.c:613:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
                  ^~~~~~~
   drivers/hwmon/vt8231.c:613:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
                  ^~~~~~~
>> drivers/hwmon/vt8231.c:634:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
           return sprintf(buf, "%s\n", data->name);
                  ^~~~~~~
   drivers/hwmon/vt8231.c:634:9: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
           return sprintf(buf, "%s\n", data->name);
                  ^~~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (20 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (20 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (20 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   66 warnings generated.
   drivers/base/property.c:1155:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(endpoint, 0, sizeof(*endpoint));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/base/property.c:1155:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(endpoint, 0, sizeof(*endpoint));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 65 warnings (65 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/hwmon/f71805f.c:426:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", in0_from_reg(data->in[nr]));
                  ^~~~~~~
   drivers/hwmon/f71805f.c:426:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", in0_from_reg(data->in[nr]));
                  ^~~~~~~
   drivers/hwmon/f71805f.c:436:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", in0_from_reg(data->in_high[nr]));
                  ^~~~~~~
   drivers/hwmon/f71805f.c:436:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", in0_from_reg(data->in_high[nr]));
                  ^~~~~~~
   drivers/hwmon/f71805f.c:446:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", in0_from_reg(data->in_low[nr]));
                  ^~~~~~~
   drivers/hwmon/f71805f.c:446:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", in0_from_reg(data->in_low[nr]));
                  ^~~~~~~
   drivers/hwmon/f71805f.c:498:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", in_from_reg(data->in[nr]));
                  ^~~~~~~
   drivers/hwmon/f71805f.c:498:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", in_from_reg(data->in[nr]));
                  ^~~~~~~
   drivers/hwmon/f71805f.c:508:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", in_from_reg(data->in_high[nr]));
                  ^~~~~~~
   drivers/hwmon/f71805f.c:508:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", in_from_reg(data->in_high[nr]));
                  ^~~~~~~
   drivers/hwmon/f71805f.c:518:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", in_from_reg(data->in_low[nr]));
                  ^~~~~~~
   drivers/hwmon/f71805f.c:518:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", in_from_reg(data->in_low[nr]));
                  ^~~~~~~
   drivers/hwmon/f71805f.c:570:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", fan_from_reg(data->fan[nr]));
                  ^~~~~~~
   drivers/hwmon/f71805f.c:570:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", fan_from_reg(data->fan[nr]));
                  ^~~~~~~
   drivers/hwmon/f71805f.c:580:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", fan_from_reg(data->fan_low[nr]));
                  ^~~~~~~
   drivers/hwmon/f71805f.c:580:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", fan_from_reg(data->fan_low[nr]));
                  ^~~~~~~
   drivers/hwmon/f71805f.c:590:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", fan_from_reg(data->fan_target[nr]));
                  ^~~~~~~
   drivers/hwmon/f71805f.c:590:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", fan_from_reg(data->fan_target[nr]));
                  ^~~~~~~
   drivers/hwmon/f71805f.c:643:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", (int)data->pwm[nr]);
                  ^~~~~~~
   drivers/hwmon/f71805f.c:643:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", (int)data->pwm[nr]);
                  ^~~~~~~
   drivers/hwmon/f71805f.c:665:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", mode);
--
                                                  ^
   drivers/ssb/main.c:902:8: note: Calling 'clkfactor_f6_resolve'
                   m3 =3D clkfactor_f6_resolve(m3);
                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:826:2: note: 'Default' branch taken. Execution contin=
ues on line 840
           switch (v) {
           ^
   drivers/ssb/main.c:840:2: note: Returning zero
           return 0;
           ^~~~~~~~
   drivers/ssb/main.c:902:8: note: Returning from 'clkfactor_f6_resolve'
                   m3 =3D clkfactor_f6_resolve(m3);
                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:902:3: note: The value 0 is assigned to 'm3'
                   m3 =3D clkfactor_f6_resolve(m3);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:904:3: note: Control jumps to 'case 1:'  at line 911
                   switch (mc) {
                   ^
   drivers/ssb/main.c:912:18: note: Division by zero
                           return (clock / (m1 * m2 * m3));
                                   ~~~~~~^~~~~~~~~~~~~~~~
   drivers/ssb/main.c:914:18: warning: Division by zero [clang-analyzer-cor=
e.DivideZero]
                           return (clock / (m1 * m3));
                                   ~~~~~~^~~~~~~~~~~
   drivers/ssb/main.c:851:2: note: Control jumps to 'case 65536:'  at line =
856
           switch (plltype) {
           ^
   drivers/ssb/main.c:862:3: note:  Execution continues on line 875
                   break;
                   ^
   drivers/ssb/main.c:875:2: note: Control jumps to the 'default' case at l=
ine 880
           switch (plltype) {
           ^
   drivers/ssb/main.c:883:6: note: Assuming 'clock' is not equal to 0
           if (!clock)
               ^~~~~~
   drivers/ssb/main.c:883:2: note: Taking false branch
           if (!clock)
           ^
   drivers/ssb/main.c:891:2: note: Control jumps to 'case 65536:'  at line =
892
           switch (plltype) {
           ^
   drivers/ssb/main.c:896:8: note: Calling 'clkfactor_f6_resolve'
                   m1 =3D clkfactor_f6_resolve(m1);
                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:826:2: note: 'Default' branch taken. Execution contin=
ues on line 840
           switch (v) {
           ^
   drivers/ssb/main.c:840:2: note: Returning zero
           return 0;
           ^~~~~~~~
   drivers/ssb/main.c:896:8: note: Returning from 'clkfactor_f6_resolve'
                   m1 =3D clkfactor_f6_resolve(m1);
                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:896:3: note: The value 0 is assigned to 'm1'
                   m1 =3D clkfactor_f6_resolve(m1);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:897:8: note: 'plltype' is equal to SSB_PLLTYPE_1
                   if ((plltype =3D=3D SSB_PLLTYPE_1) ||
                        ^~~~~~~
   drivers/ssb/main.c:897:34: note: Left side of '||' is true
                   if ((plltype =3D=3D SSB_PLLTYPE_1) ||
                                                  ^
   drivers/ssb/main.c:902:8: note: Calling 'clkfactor_f6_resolve'
                   m3 =3D clkfactor_f6_resolve(m3);
                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:826:2: note: 'Default' branch taken. Execution contin=
ues on line 840
           switch (v) {
           ^
   drivers/ssb/main.c:840:2: note: Returning zero
           return 0;
           ^~~~~~~~
   drivers/ssb/main.c:902:8: note: Returning from 'clkfactor_f6_resolve'
                   m3 =3D clkfactor_f6_resolve(m3);
                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:902:3: note: The value 0 is assigned to 'm3'
                   m3 =3D clkfactor_f6_resolve(m3);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:904:3: note: Control jumps to 'case 17:'  at line 913
                   switch (mc) {
                   ^
   drivers/ssb/main.c:914:18: note: Division by zero
                           return (clock / (m1 * m3));
                                   ~~~~~~^~~~~~~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   drivers/hwmon/da9055-hwmon.c:166:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", volt_reg_to_mv(adc, channel));
                  ^~~~~~~
   drivers/hwmon/da9055-hwmon.c:166:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", volt_reg_to_mv(adc, channel));
                  ^~~~~~~
   drivers/hwmon/da9055-hwmon.c:194:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", DIV_ROUND_CLOSEST(-4084 * (tjunc - t=
offset)
                  ^~~~~~~
   drivers/hwmon/da9055-hwmon.c:194:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", DIV_ROUND_CLOSEST(-4084 * (tjunc - t=
offset)
                  ^~~~~~~
>> drivers/hwmon/da9055-hwmon.c:201:9: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
           return sprintf(buf, "%s\n",
                  ^~~~~~~
   drivers/hwmon/da9055-hwmon.c:201:9: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
           return sprintf(buf, "%s\n",
                  ^~~~~~~
   Suppressed 20 warnings (20 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/hwmon/dme1737.c:827:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", res);
                  ^~~~~~~
   drivers/hwmon/dme1737.c:827:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", res);
                  ^~~~~~~
   drivers/hwmon/dme1737.c:911:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", res);
                  ^~~~~~~
   drivers/hwmon/dme1737.c:911:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", res);
                  ^~~~~~~
   drivers/hwmon/dme1737.c:1003:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", res);
                  ^~~~~~~
   drivers/hwmon/dme1737.c:1003:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", res);
                  ^~~~~~~
   drivers/hwmon/dme1737.c:1117:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", res);
                  ^~~~~~~
   drivers/hwmon/dme1737.c:1117:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", res);
                  ^~~~~~~
   drivers/hwmon/dme1737.c:1253:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", res);
                  ^~~~~~~
   drivers/hwmon/dme1737.c:1253:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", res);
                  ^~~~~~~
   drivers/hwmon/dme1737.c:1468:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->vrm);
                  ^~~~~~~
   drivers/hwmon/dme1737.c:1468:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->vrm);
                  ^~~~~~~
   drivers/hwmon/dme1737.c:1494:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
                  ^~~~~~~
   drivers/hwmon/dme1737.c:1494:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
                  ^~~~~~~
   drivers/hwmon/dme1737.c:1502:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           return sprintf(buf, "%s\n", data->name);
                  ^~~~~~~
   drivers/hwmon/dme1737.c:1502:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           return sprintf(buf, "%s\n", data->name);
                  ^~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   75 warnings generated.
   drivers/hwmon/adm1026.c:473:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", INS_FROM_REG(nr, data->in[nr]));
                  ^~~~~~~
   drivers/hwmon/adm1026.c:473:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", INS_FROM_REG(nr, data->in[nr]));
                  ^~~~~~~
   drivers/hwmon/adm1026.c:481:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", INS_FROM_REG(nr, data->in_min[nr]));
                  ^~~~~~~
   drivers/hwmon/adm1026.c:481:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", INS_FROM_REG(nr, data->in_min[nr]));
                  ^~~~~~~
   drivers/hwmon/adm1026.c:509:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", INS_FROM_REG(nr, data->in_max[nr]));
                  ^~~~~~~
   drivers/hwmon/adm1026.c:509:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", INS_FROM_REG(nr, data->in_max[nr]));
                  ^~~~~~~
   drivers/hwmon/adm1026.c:585:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", INS_FROM_REG(16, data->in[16]) -
                  ^~~~~~~
   drivers/hwmon/adm1026.c:585:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", INS_FROM_REG(16, data->in[16]) -
                  ^~~~~~~
   drivers/hwmon/adm1026.c:592:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", INS_FROM_REG(16, data->in_min[16])
                  ^~~~~~~
   drivers/hwmon/adm1026.c:592:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", INS_FROM_REG(16, data->in_min[16])
                  ^~~~~~~
   drivers/hwmon/adm1026.c:621:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", INS_FROM_REG(16, data->in_max[16])
                  ^~~~~~~
   drivers/hwmon/adm1026.c:621:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", INS_FROM_REG(16, data->in_max[16])
                  ^~~~~~~
   drivers/hwmon/adm1026.c:659:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[nr],

vim +1094 drivers/video/fbdev/matrox/matroxfb_base.c

^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   873  =

67a6680d64e18c drivers/video/matrox/matroxfb_base.c Christoph Hellwig 2006-=
01-14   874  static int matroxfb_ioctl(struct fb_info *info,
67a6680d64e18c drivers/video/matrox/matroxfb_base.c Christoph Hellwig 2006-=
01-14   875  			  unsigned int cmd, unsigned long arg)
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   876  {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   877  	void __user *argp =3D (void __user *)arg;
ee5a27497957e5 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22   878  	struct matrox_fb_info *minfo =3D info2minfo(info);
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   879  =

5ae121705bed9e drivers/video/matrox/matroxfb_base.c Harvey Harrison   2008-=
04-28   880  	DBG(__func__)
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   881  =

fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22   882  	if (minfo->dead) {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   883  		return -ENXIO;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   884  	}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   885  =

^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   886  	switch (cmd) {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   887  		case FBIOGET_VBLANK:
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   888  			{
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   889  				struct fb_vblank vblank;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   890  				int err;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   891  =

316b4d644caceb drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22   892  				err =3D matroxfb_get_vblank(minfo, &vblank);
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   893  				if (err)
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   894  					return err;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   895  				if (copy_to_user(argp, &vblank, sizeof(vblank)))
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   896  					return -EFAULT;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   897  				return 0;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   898  			}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   899  		case FBIO_WAITFORVSYNC:
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   900  			{
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   901  				u_int32_t crt;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   902  =

^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   903  				if (get_user(crt, (u_int32_t __user *)arg))
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   904  					return -EFAULT;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   905  =

316b4d644caceb drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22   906  				return matroxfb_wait_for_sync(minfo, crt);
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   907  			}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   908  		case MATROXFB_SET_OUTPUT_MODE:
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   909  			{
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   910  				struct matroxioc_output_mode mom;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   911  				struct matrox_altout *oproc;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   912  				int val;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   913  =

^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   914  				if (copy_from_user(&mom, argp, sizeof(mom)))
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   915  					return -EFAULT;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   916  				if (mom.output >=3D MATROXFB_MAX_OUTPUTS)
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   917  					return -ENXIO;
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22   918  				down_read(&minfo->altout.lock);
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22   919  				oproc =3D minfo->outputs[mom.output].output;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   920  				if (!oproc) {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   921  					val =3D -ENXIO;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   922  				} else if (!oproc->verifymode) {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   923  					if (mom.mode =3D=3D MATROXFB_OUTPUT_MODE_MONITOR) {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   924  						val =3D 0;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   925  					} else {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   926  						val =3D -EINVAL;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   927  					}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   928  				} else {
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22   929  					val =3D oproc->verifymode(minfo->outputs[mom.output].data=
, mom.mode);
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   930  				}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   931  				if (!val) {
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22   932  					if (minfo->outputs[mom.output].mode !=3D mom.mode) {
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22   933  						minfo->outputs[mom.output].mode =3D mom.mode;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   934  						val =3D 1;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   935  					}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   936  				}
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22   937  				up_read(&minfo->altout.lock);
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   938  				if (val !=3D 1)
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   939  					return val;
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22   940  				switch (minfo->outputs[mom.output].src) {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   941  					case MATROXFB_SRC_CRTC1:
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   942  						matroxfb_set_par(info);
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   943  						break;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   944  					case MATROXFB_SRC_CRTC2:
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   945  						{
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   946  							struct matroxfb_dh_fb_info* crtc2;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   947  =

fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22   948  							down_read(&minfo->crtc2.lock);
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22   949  							crtc2 =3D minfo->crtc2.info;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   950  							if (crtc2)
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   951  								crtc2->fbcon.fbops->fb_set_par(&crtc2->fbcon);
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22   952  							up_read(&minfo->crtc2.lock);
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   953  						}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   954  						break;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   955  				}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   956  				return 0;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   957  			}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   958  		case MATROXFB_GET_OUTPUT_MODE:
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   959  			{
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   960  				struct matroxioc_output_mode mom;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   961  				struct matrox_altout *oproc;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   962  				int val;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   963  =

^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   964  				if (copy_from_user(&mom, argp, sizeof(mom)))
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   965  					return -EFAULT;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   966  				if (mom.output >=3D MATROXFB_MAX_OUTPUTS)
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   967  					return -ENXIO;
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22   968  				down_read(&minfo->altout.lock);
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22   969  				oproc =3D minfo->outputs[mom.output].output;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   970  				if (!oproc) {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   971  					val =3D -ENXIO;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   972  				} else {
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22   973  					mom.mode =3D minfo->outputs[mom.output].mode;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   974  					val =3D 0;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   975  				}
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22   976  				up_read(&minfo->altout.lock);
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   977  				if (val)
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   978  					return val;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   979  				if (copy_to_user(argp, &mom, sizeof(mom)))
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   980  					return -EFAULT;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   981  				return 0;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   982  			}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   983  		case MATROXFB_SET_OUTPUT_CONNECTION:
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   984  			{
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   985  				u_int32_t tmp;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   986  				int i;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   987  				int changes;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   988  =

^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   989  				if (copy_from_user(&tmp, argp, sizeof(tmp)))
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   990  					return -EFAULT;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   991  				for (i =3D 0; i < 32; i++) {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   992  					if (tmp & (1 << i)) {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   993  						if (i >=3D MATROXFB_MAX_OUTPUTS)
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   994  							return -ENXIO;
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22   995  						if (!minfo->outputs[i].output)
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   996  							return -ENXIO;
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22   997  						switch (minfo->outputs[i].src) {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   998  							case MATROXFB_SRC_NONE:
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16   999  							case MATROXFB_SRC_CRTC1:
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1000  								break;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1001  							default:
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1002  								return -EBUSY;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1003  						}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1004  					}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1005  				}
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22  1006  				if (minfo->devflags.panellink) {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1007  					if (tmp & MATROXFB_OUTPUT_CONN_DFP) {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1008  						if (tmp & MATROXFB_OUTPUT_CONN_SECONDARY)
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1009  							return -EINVAL;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1010  						for (i =3D 0; i < MATROXFB_MAX_OUTPUTS; i++) {
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22  1011  							if (minfo->outputs[i].src =3D=3D MATROXFB_SRC_CRTC2) {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1012  								return -EBUSY;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1013  							}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1014  						}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1015  					}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1016  				}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1017  				changes =3D 0;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1018  				for (i =3D 0; i < MATROXFB_MAX_OUTPUTS; i++) {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1019  					if (tmp & (1 << i)) {
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22  1020  						if (minfo->outputs[i].src !=3D MATROXFB_SRC_CRTC1) {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1021  							changes =3D 1;
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22  1022  							minfo->outputs[i].src =3D MATROXFB_SRC_CRTC1;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1023  						}
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22  1024  					} else if (minfo->outputs[i].src =3D=3D MATROXFB_SRC_CRTC=
1) {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1025  						changes =3D 1;
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22  1026  						minfo->outputs[i].src =3D MATROXFB_SRC_NONE;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1027  					}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1028  				}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1029  				if (!changes)
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1030  					return 0;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1031  				matroxfb_set_par(info);
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1032  				return 0;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1033  			}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1034  		case MATROXFB_GET_OUTPUT_CONNECTION:
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1035  			{
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1036  				u_int32_t conn =3D 0;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1037  				int i;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1038  =

^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1039  				for (i =3D 0; i < MATROXFB_MAX_OUTPUTS; i++) {
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22  1040  					if (minfo->outputs[i].src =3D=3D MATROXFB_SRC_CRTC1) {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1041  						conn |=3D 1 << i;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1042  					}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1043  				}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1044  				if (put_user(conn, (u_int32_t __user *)arg))
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1045  					return -EFAULT;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1046  				return 0;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1047  			}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1048  		case MATROXFB_GET_AVAILABLE_OUTPUTS:
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1049  			{
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1050  				u_int32_t conn =3D 0;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1051  				int i;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1052  =

^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1053  				for (i =3D 0; i < MATROXFB_MAX_OUTPUTS; i++) {
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22  1054  					if (minfo->outputs[i].output) {
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22  1055  						switch (minfo->outputs[i].src) {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1056  							case MATROXFB_SRC_NONE:
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1057  							case MATROXFB_SRC_CRTC1:
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1058  								conn |=3D 1 << i;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1059  								break;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1060  						}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1061  					}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1062  				}
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22  1063  				if (minfo->devflags.panellink) {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1064  					if (conn & MATROXFB_OUTPUT_CONN_DFP)
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1065  						conn &=3D ~MATROXFB_OUTPUT_CONN_SECONDARY;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1066  					if (conn & MATROXFB_OUTPUT_CONN_SECONDARY)
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1067  						conn &=3D ~MATROXFB_OUTPUT_CONN_DFP;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1068  				}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1069  				if (put_user(conn, (u_int32_t __user *)arg))
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1070  					return -EFAULT;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1071  				return 0;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1072  			}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1073  		case MATROXFB_GET_ALL_OUTPUTS:
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1074  			{
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1075  				u_int32_t conn =3D 0;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1076  				int i;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1077  =

^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1078  				for (i =3D 0; i < MATROXFB_MAX_OUTPUTS; i++) {
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22  1079  					if (minfo->outputs[i].output) {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1080  						conn |=3D 1 << i;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1081  					}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1082  				}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1083  				if (put_user(conn, (u_int32_t __user *)arg))
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1084  					return -EFAULT;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1085  				return 0;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1086  			}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1087  		case VIDIOC_QUERYCAP:
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1088  			{
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1089  				struct v4l2_capability r;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1090  =

^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16 @1091  				memset(&r, 0, sizeof(r));
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1092  				strcpy(r.driver, "matroxfb");
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1093  				strcpy(r.card, "Matrox");
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22 @1094  				sprintf(r.bus_info, "PCI:%s", pci_name(minfo->pcidev));
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1095  				r.version =3D KERNEL_VERSION(1,0,0);
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1096  				r.capabilities =3D V4L2_CAP_VIDEO_OUTPUT;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1097  				if (copy_to_user(argp, &r, sizeof(r)))
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1098  					return -EFAULT;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1099  				return 0;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1100  =

^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1101  			}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1102  		case VIDIOC_QUERYCTRL:
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1103  			{
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1104  				struct v4l2_queryctrl qctrl;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1105  				int err;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1106  =

^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1107  				if (copy_from_user(&qctrl, argp, sizeof(qctrl)))
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1108  					return -EFAULT;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1109  =

fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22  1110  				down_read(&minfo->altout.lock);
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22  1111  				if (!minfo->outputs[1].output) {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1112  					err =3D -ENXIO;
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22  1113  				} else if (minfo->outputs[1].output->getqueryctrl) {
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22  1114  					err =3D minfo->outputs[1].output->getqueryctrl(minfo->out=
puts[1].data, &qctrl);
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1115  				} else {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1116  					err =3D -EINVAL;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1117  				}
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22  1118  				up_read(&minfo->altout.lock);
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1119  				if (err >=3D 0 &&
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1120  				    copy_to_user(argp, &qctrl, sizeof(qctrl)))
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1121  					return -EFAULT;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1122  				return err;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1123  			}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1124  		case VIDIOC_G_CTRL:
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1125  			{
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1126  				struct v4l2_control ctrl;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1127  				int err;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1128  =

^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1129  				if (copy_from_user(&ctrl, argp, sizeof(ctrl)))
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1130  					return -EFAULT;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1131  =

fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22  1132  				down_read(&minfo->altout.lock);
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22  1133  				if (!minfo->outputs[1].output) {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1134  					err =3D -ENXIO;
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22  1135  				} else if (minfo->outputs[1].output->getctrl) {
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22  1136  					err =3D minfo->outputs[1].output->getctrl(minfo->outputs[=
1].data, &ctrl);
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1137  				} else {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1138  					err =3D -EINVAL;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1139  				}
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22  1140  				up_read(&minfo->altout.lock);
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1141  				if (err >=3D 0 &&
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1142  				    copy_to_user(argp, &ctrl, sizeof(ctrl)))
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1143  					return -EFAULT;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1144  				return err;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1145  			}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1146  		case VIDIOC_S_CTRL:
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1147  			{
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1148  				struct v4l2_control ctrl;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1149  				int err;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1150  =

^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1151  				if (copy_from_user(&ctrl, argp, sizeof(ctrl)))
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1152  					return -EFAULT;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1153  =

fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22  1154  				down_read(&minfo->altout.lock);
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22  1155  				if (!minfo->outputs[1].output) {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1156  					err =3D -ENXIO;
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22  1157  				} else if (minfo->outputs[1].output->setctrl) {
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22  1158  					err =3D minfo->outputs[1].output->setctrl(minfo->outputs[=
1].data, &ctrl);
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1159  				} else {
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1160  					err =3D -EINVAL;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1161  				}
fc2d10ddfc8989 drivers/video/matrox/matroxfb_base.c Jean Delvare      2009-=
09-22  1162  				up_read(&minfo->altout.lock);
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1163  				return err;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1164  			}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1165  	}
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1166  	return -ENOTTY;
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1167  }
^1da177e4c3f41 drivers/video/matrox/matroxfb_base.c Linus Torvalds    2005-=
04-16  1168  =


:::::: The code at line 1094 was first introduced by commit
:::::: fc2d10ddfc8989e82f74d2a38c7d6bfa45bcaba9 matroxfb: get rid of unneed=
ed macros ACCESS_FBINFO and MINFO

:::::: TO: Jean Delvare <khali@linux-fr.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4832650676893593123==--

