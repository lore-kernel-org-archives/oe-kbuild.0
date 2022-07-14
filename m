Content-Type: multipart/mixed; boundary="===============6374688610803545714=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] gen_compile_commands: fix overlooked module files
Date: Thu, 14 Jul 2022 13:05:37 +0800
Message-ID: <202207141258.izmGmHWr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6374688610803545714==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/video/fbdev/sis/init301.c:2698:3: warning: Value stored to 'modefl=
ag' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220616021149.327587-1-jhubbard@nvidia.com>
References: <20220616021149.327587-1-jhubbard@nvidia.com>
TO: John Hubbard <jhubbard@nvidia.com>
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Tom Rix <trix@redhat.com>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: LKML <linux-kernel@vger.kernel.org>
CC: llvm(a)lists.linux.dev
CC: John Hubbard <jhubbard@nvidia.com>

Hi John,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[cannot apply to v5.19-rc6 next-20220713]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Hubbard/gen_com=
pile_commands-fix-overlooked-module-files/20220616-101328
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
30306f6194cadcc29c77f6ddcd416a75bf5c0232
:::::: branch date: 4 weeks ago
:::::: commit date: 4 weeks ago
config: riscv-randconfig-c006-20220712 (https://download.01.org/0day-ci/arc=
hive/20220714/202207141258.izmGmHWr-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e60b4f=
b2b777118c0ff664a6347851df14fcf75b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/81abfda7f03483e5f90=
7d266b9097885c1e23e2b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review John-Hubbard/gen_compile_commands-=
fix-overlooked-module-files/20220616-101328
        git checkout 81abfda7f03483e5f907d266b9097885c1e23e2b
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~
   drivers/target/target_core_configfs.c:3571:2: note: Call to function 'st=
rncpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(db_root, db_root_stage, DB_ROOT_LEN);
           ^~~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/clk/clk-renesas-pcie.c:114:2: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, 5, "DIF%d", idx);
           ^~~~~~~~
   drivers/clk/clk-renesas-pcie.c:114:2: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, 5, "DIF%d", idx);
           ^~~~~~~~
   drivers/clk/clk-renesas-pcie.c:252:3: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(name, 5, "DIF%d", i);
                   ^~~~~~~~
   drivers/clk/clk-renesas-pcie.c:252:3: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(name, 5, "DIF%d", i);
                   ^~~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   drivers/clk/clk-versaclock5.c:962:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&init, 0, sizeof(init));
           ^~~~~~
   drivers/clk/clk-versaclock5.c:962:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(&init, 0, sizeof(init));
           ^~~~~~
   drivers/clk/clk-versaclock5.c:1006:3: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&init, 0, sizeof(init));
                   ^~~~~~
   drivers/clk/clk-versaclock5.c:1006:3: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
                   memset(&init, 0, sizeof(init));
                   ^~~~~~
   drivers/clk/clk-versaclock5.c:1022:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&init, 0, sizeof(init));
           ^~~~~~
   drivers/clk/clk-versaclock5.c:1022:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&init, 0, sizeof(init));
           ^~~~~~
   drivers/clk/clk-versaclock5.c:1039:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&init, 0, sizeof(init));
           ^~~~~~
   drivers/clk/clk-versaclock5.c:1039:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&init, 0, sizeof(init));
           ^~~~~~
   drivers/clk/clk-versaclock5.c:1057:3: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&init, 0, sizeof(init));
                   ^~~~~~
   drivers/clk/clk-versaclock5.c:1057:3: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
                   memset(&init, 0, sizeof(init));
                   ^~~~~~
   drivers/clk/clk-versaclock5.c:1075:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&init, 0, sizeof(init));
           ^~~~~~
   drivers/clk/clk-versaclock5.c:1075:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&init, 0, sizeof(init));
           ^~~~~~
   drivers/clk/clk-versaclock5.c:1101:3: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&init, 0, sizeof(init));
                   ^~~~~~
   drivers/clk/clk-versaclock5.c:1101:3: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
                   memset(&init, 0, sizeof(init));
                   ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/video/fbdev/sis/init301.c:1248:4: warning: Value stored to 'temp=
' is never read [clang-analyzer-deadcode.DeadStores]
      temp =3D SiS_GetRegShort((acpibase + 0x3c));
      ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:1248:4: note: Value stored to 'temp' i=
s never read
      temp =3D SiS_GetRegShort((acpibase + 0x3c));
      ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:1253:4: warning: Value stored to 'temp=
' is never read [clang-analyzer-deadcode.DeadStores]
      temp =3D SiS_GetRegShort((acpibase + 0x3a));
      ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:1253:4: note: Value stored to 'temp' i=
s never read
      temp =3D SiS_GetRegShort((acpibase + 0x3a));
      ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:1533:19: warning: Value stored to 'Out=
putSelect' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
      unsigned char  OutputSelect =3D *SiS_Pr->pSiS_OutputSelect;
                     ^~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:1533:19: note: Value stored to 'Output=
Select' during its initialization is never read
      unsigned char  OutputSelect =3D *SiS_Pr->pSiS_OutputSelect;
                     ^~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:2498:2: warning: Value stored to 'CRT2=
Index' is never read [clang-analyzer-deadcode.DeadStores]
           CRT2Index >>=3D 6;
           ^             ~
   drivers/video/fbdev/sis/init301.c:2498:2: note: Value stored to 'CRT2Ind=
ex' is never read
           CRT2Index >>=3D 6;
           ^             ~
>> drivers/video/fbdev/sis/init301.c:2698:3: warning: Value stored to 'mode=
flag' is never read [clang-analyzer-deadcode.DeadStores]
     modeflag =3D SiS_GetModeFlag(SiS_Pr, ModeNo, ModeIdIndex);
     ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:2698:3: note: Value stored to 'modefla=
g' is never read
     modeflag =3D SiS_GetModeFlag(SiS_Pr, ModeNo, ModeIdIndex);
     ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:5168:4: warning: Value stored to 'temp=
bl' is never read [clang-analyzer-deadcode.DeadStores]
      tempbl =3D 0xC0;
      ^        ~~~~
   drivers/video/fbdev/sis/init301.c:5168:4: note: Value stored to 'tempbl'=
 is never read
      tempbl =3D 0xC0;
      ^        ~~~~
>> drivers/video/fbdev/sis/init301.c:5409:5: warning: Value stored to 'inde=
x' is never read [clang-analyzer-deadcode.DeadStores]
              index +=3D (unsigned short)(((pci50 >> 9)) & 0x03);
              ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:5409:5: note: Value stored to 'index' =
is never read
              index +=3D (unsigned short)(((pci50 >> 9)) & 0x03);
              ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:5466:16: warning: 3rd function call ar=
gument is an uninitialized value [clang-analyzer-core.CallAndMessage]
        colorth =3D SiS_GetColorDepth(SiS_Pr,CRT2ModeNo,modeidindex) >> 1;
                  ^
   drivers/video/fbdev/sis/init301.c:6239:6: note: Assuming the condition i=
s false
     if(SiS_Pr->SiS_VBInfo & SetCRT2ToLCDA) {
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:6239:3: note: Taking false branch
     if(SiS_Pr->SiS_VBInfo & SetCRT2ToLCDA) {
     ^
   drivers/video/fbdev/sis/init301.c:6244:6: note: Assuming 'ModeNo' is > 19
     if(ModeNo <=3D 0x13) {
        ^~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:6244:3: note: Taking false branch
     if(ModeNo <=3D 0x13) {
     ^
   drivers/video/fbdev/sis/init301.c:6246:13: note: Assuming field 'UseCust=
omMode' is false
     } else if(SiS_Pr->UseCustomMode) {
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:6246:10: note: Taking false branch
     } else if(SiS_Pr->UseCustomMode) {
            ^
   drivers/video/fbdev/sis/init301.c:6256:11: note: Assuming field 'ChipTyp=
e' is < SIS_315H
     if( ! ((SiS_Pr->ChipType >=3D SIS_315H) &&
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:6256:41: note: Left side of '&&' is fa=
lse
     if( ! ((SiS_Pr->ChipType >=3D SIS_315H) &&
                                           ^
   drivers/video/fbdev/sis/init301.c:6256:3: note: Taking true branch
     if( ! ((SiS_Pr->ChipType >=3D SIS_315H) &&
     ^
   drivers/video/fbdev/sis/init301.c:6260:17: note: Field 'ChipType' is < S=
IS_315H
        if(SiS_Pr->ChipType < SIS_315H ) {
                   ^
   drivers/video/fbdev/sis/init301.c:6260:6: note: Taking true branch
        if(SiS_Pr->ChipType < SIS_315H ) {
        ^
   drivers/video/fbdev/sis/init301.c:6262:2: note: Calling 'SiS_SetCRT2FIFO=
_300'
           SiS_SetCRT2FIFO_300(SiS_Pr, ModeNo);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:5336:31: note: 'modeidindex' declared =
without an initial value
     unsigned short temp, index, modeidindex, refreshratetableindex;
                                 ^~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:5346:6: note: Assuming field 'CRT1Uses=
CustomMode' is true
     if(!SiS_Pr->CRT1UsesCustomMode) {
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:5346:3: note: Taking false branch
     if(!SiS_Pr->CRT1UsesCustomMode) {
     ^
   drivers/video/fbdev/sis/init301.c:5376:6: note: 'CRT1ModeNo' is >=3D 19
     if(CRT1ModeNo >=3D 0x13) {
        ^~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:5376:3: note: Taking true branch
     if(CRT1ModeNo >=3D 0x13) {
     ^
   drivers/video/fbdev/sis/init301.c:5378:9: note: Assuming field 'ChipType=
' is equal to SIS_300
        if(SiS_Pr->ChipType =3D=3D SIS_300) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:5378:6: note: Taking true branch
        if(SiS_Pr->ChipType =3D=3D SIS_300) {
        ^
   drivers/video/fbdev/sis/init301.c:5387:9: note: Assuming 'temp' is not e=
qual to 0
        if(!temp) temp++;
           ^~~~~
   drivers/video/fbdev/sis/init301.c:5387:6: note: Taking false branch
        if(!temp) temp++;
        ^
   drivers/video/fbdev/sis/init301.c:5394:9: note: Assuming 'temp' is 0
        if(temp) data2++;
           ^~~~
   drivers/video/fbdev/sis/init301.c:5394:6: note: Taking false branch
        if(temp) data2++;
        ^
   drivers/video/fbdev/sis/init301.c:5396:17: note: Field 'ChipType' is equ=
al to SIS_300
        if(SiS_Pr->ChipType =3D=3D SIS_300) {
                   ^
   drivers/video/fbdev/sis/init301.c:5396:6: note: Taking true branch
        if(SiS_Pr->ChipType =3D=3D SIS_300) {
        ^
   drivers/video/fbdev/sis/init301.c:5438:9: note: Assuming field 'UseCusto=
mMode' is true
        if(!SiS_Pr->UseCustomMode) {
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:5438:6: note: Taking false branch
        if(!SiS_Pr->UseCustomMode) {
        ^
   drivers/video/fbdev/sis/init301.c:5466:16: note: 3rd function call argum=
ent is an uninitialized value
        colorth =3D SiS_GetColorDepth(SiS_Pr,CRT2ModeNo,modeidindex) >> 1;
                  ^                                   ~~~~~~~~~~~
>> drivers/video/fbdev/sis/init301.c:6250:6: warning: Value stored to 'resi=
nfo' is never read [clang-analyzer-deadcode.DeadStores]
        resinfo =3D SiS_Pr->SiS_EModeIDTable[ModeIdIndex].Ext_RESINFO;
        ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:6250:6: note: Value stored to 'resinfo=
' is never read
        resinfo =3D SiS_Pr->SiS_EModeIDTable[ModeIdIndex].Ext_RESINFO;
        ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:9498:4: warning: Value stored to 'flag=
' is never read [clang-analyzer-deadcode.DeadStores]
      flag =3D 0;
      ^      ~
   drivers/video/fbdev/sis/init301.c:9498:4: note: Value stored to 'flag' i=
s never read
      flag =3D 0;
      ^      ~
   Suppressed 52 warnings (44 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   fs/fat/dir.c:45:18: warning: Access to field 'b_blocknr' results in a de=
reference of a null pointer (loaded from variable 'bh') [clang-analyzer-cor=
e.NullDereference]
           return ((loff_t)bh->b_blocknr << MSDOS_SB(sb)->dir_per_block_bit=
s)
                           ^
   fs/fat/dir.c:1298:9: note: Calling 'fat_get_entry'
           while (fat_get_entry(dir, &pos, &bh, &de) > -1) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fat/dir.c:121:10: note: Left side of '&&' is false
           if (*bh && *de &&
                   ^
   fs/fat/dir.c:128:9: note: Calling 'fat__get_entry'
           return fat__get_entry(dir, pos, bh, de);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fat/dir.c:95:6: note: Assuming 'err' is 0
           if (err || !phys)
               ^~~
   fs/fat/dir.c:95:6: note: Left side of '||' is false
   fs/fat/dir.c:95:13: note: Assuming 'phys' is not equal to 0
           if (err || !phys)
                      ^~~~~
   fs/fat/dir.c:95:2: note: Taking false branch
           if (err || !phys)
           ^
   fs/fat/dir.c:101:6: note: Assuming the condition is false
           if (*bh =3D=3D NULL) {
               ^~~~~~~~~~~
   fs/fat/dir.c:101:2: note: Taking false branch
           if (*bh =3D=3D NULL) {
           ^
   fs/fat/dir.c:128:9: note: Returning from 'fat__get_entry'
           return fat__get_entry(dir, pos, bh, de);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fat/dir.c:1298:9: note: Returning from 'fat_get_entry'
           while (fat_get_entry(dir, &pos, &bh, &de) > -1) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fat/dir.c:1298:2: note: Loop condition is true.  Entering loop body
           while (fat_get_entry(dir, &pos, &bh, &de) > -1) {
           ^
   fs/fat/dir.c:1300:3: note: Taking false branch
                   if (pos >=3D FAT_MAX_DIR_SIZE)
                   ^
   fs/fat/dir.c:1303:7: note: Assuming the condition is false
                   if (IS_FREE(de->name)) {
                       ^
   include/uapi/linux/msdos_fs.h:53:21: note: expanded from macro 'IS_FREE'
   #define IS_FREE(n)      (!*(n) || *(n) =3D=3D DELETED_FLAG)
                            ^~~~~
   fs/fat/dir.c:1303:7: note: Left side of '||' is false
                   if (IS_FREE(de->name)) {
                       ^
   include/uapi/linux/msdos_fs.h:53:21: note: expanded from macro 'IS_FREE'
   #define IS_FREE(n)      (!*(n) || *(n) =3D=3D DELETED_FLAG)
                            ^
   fs/fat/dir.c:1303:7: note: Assuming the condition is false
                   if (IS_FREE(de->name)) {
                       ^
   include/uapi/linux/msdos_fs.h:53:30: note: expanded from macro 'IS_FREE'
   #define IS_FREE(n)      (!*(n) || *(n) =3D=3D DELETED_FLAG)
                                     ^~~~~~~~~~~~~~~~~~~~
   fs/fat/dir.c:1303:3: note: Taking false branch
                   if (IS_FREE(de->name)) {
                   ^
   fs/fat/dir.c:1313:4: note: Loop condition is false. Execution continues =
on line 1315
                           for (i =3D 0; i < nr_bhs; i++)
                           ^
   fs/fat/dir.c:1298:9: note: Calling 'fat_get_entry'
           while (fat_get_entry(dir, &pos, &bh, &de) > -1) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fat/dir.c:121:6: note: Left side of '&&' is true
           if (*bh && *de &&
               ^
   fs/fat/dir.c:121:6: note: Left side of '&&' is true
   fs/fat/dir.c:122:5: note: Assuming the condition is false
              (*de - (struct msdos_dir_entry *)(*bh)->b_data) <
              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fat/dir.c:121:2: note: Taking false branch
           if (*bh && *de &&
           ^
   fs/fat/dir.c:128:9: note: Calling 'fat__get_entry'
           return fat__get_entry(dir, pos, bh, de);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fat/dir.c:92:2: note: Null pointer value stored to 'bh'
           *bh =3D NULL;
           ^~~~~~~~~~
   fs/fat/dir.c:95:6: note: Assuming 'err' is not equal to 0
           if (err || !phys)
               ^~~
--
                            ^
   include/linux/printk.h:446:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:421:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   include/linux/hid.h:1056:9: note: Access to field 'name' results in a de=
reference of a null pointer (loaded from variable 'input')
                                       input->name, c, type);
                                       ^
   include/linux/printk.h:685:49: note: expanded from macro 'pr_warn_rateli=
mited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                                          ^~~~~~~~~~~
   include/linux/printk.h:669:17: note: expanded from macro 'printk_ratelim=
ited'
                   printk(fmt, ##__VA_ARGS__);                             \
                                 ^~~~~~~~~~~
   include/linux/printk.h:475:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:447:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   drivers/md/dm-kcopyd.c:246:10: warning: Access to field 'next' results i=
n a dereference of a null pointer (loaded from variable 'pl') [clang-analyz=
er-core.NullDereference]
                   next =3D pl->next;
                          ^
   drivers/md/dm-kcopyd.c:913:6: note: Assuming 'kc' is non-null
           if (!kc)
               ^~~
   drivers/md/dm-kcopyd.c:913:2: note: Taking false branch
           if (!kc)
           ^
   drivers/md/dm-kcopyd.c:916:2: note: Loop condition is false.  Exiting lo=
op
           spin_lock_init(&kc->job_lock);
           ^
   include/linux/spinlock.h:339:34: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(_lock)                  \
                                                   ^
   drivers/md/dm-kcopyd.c:924:6: note: Assuming 'r' is 0
           if (r)
               ^
   drivers/md/dm-kcopyd.c:924:2: note: Taking false branch
           if (r)
           ^
   drivers/md/dm-kcopyd.c:927:2: note: Loop condition is false.  Exiting lo=
op
           INIT_WORK(&kc->kcopyd_work, do_work);
           ^
   include/linux/workqueue.h:245:2: note: expanded from macro 'INIT_WORK'
           __INIT_WORK((_work), (_func), 0)
           ^
   include/linux/workqueue.h:236:2: note: expanded from macro '__INIT_WORK'
           do {                                                            \
           ^
   drivers/md/dm-kcopyd.c:929:6: note: Assuming field 'kcopyd_wq' is non-nu=
ll
           if (!kc->kcopyd_wq) {
               ^~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:929:2: note: Taking false branch
           if (!kc->kcopyd_wq) {
           ^
   drivers/md/dm-kcopyd.c:939:6: note: Calling 'client_reserve_pages'
           r =3D client_reserve_pages(kc, reserve_pages);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:309:20: note: 'pl' initialized to a null pointer =
value
           struct page_list *pl =3D NULL, *next;
                             ^~
   drivers/md/dm-kcopyd.c:311:14: note: Assuming 'i' is >=3D 'nr_pages'
           for (i =3D 0; i < nr_pages; i++) {
                       ^~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:311:2: note: Loop condition is false. Execution c=
ontinues on line 322
           for (i =3D 0; i < nr_pages; i++) {
           ^
   drivers/md/dm-kcopyd.c:323:23: note: Passing null pointer value via 2nd =
parameter 'pl'
           kcopyd_put_pages(kc, pl);
                                ^~
   drivers/md/dm-kcopyd.c:323:2: note: Calling 'kcopyd_put_pages'
           kcopyd_put_pages(kc, pl);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:246:10: note: Access to field 'next' results in a=
 dereference of a null pointer (loaded from variable 'pl')
                   next =3D pl->next;
                          ^~
>> drivers/md/dm-kcopyd.c:494:3: warning: Use of memory after it is freed [=
clang-analyzer-unix.Malloc]
                   kcopyd_put_pages(kc, job->pages);
                   ^
   drivers/md/dm-kcopyd.c:662:2: note: Calling 'process_jobs'
           process_jobs(&kc->complete_jobs, kc, run_complete_job);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:611:2: note: Loop condition is true.  Entering lo=
op body
           while ((job =3D pop(jobs, kc))) {
           ^
   drivers/md/dm-kcopyd.c:613:7: note: Calling 'run_complete_job'
                   r =3D fn(job);
                       ^~~~~~~
   drivers/md/dm-kcopyd.c:493:6: note: Assuming field 'pages' is non-null
           if (job->pages && job->pages !=3D &zero_page_list)
               ^~~~~~~~~~
   drivers/md/dm-kcopyd.c:493:6: note: Left side of '&&' is true
   drivers/md/dm-kcopyd.c:493:20: note: Assuming the condition is true
           if (job->pages && job->pages !=3D &zero_page_list)
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:493:2: note: Taking true branch
           if (job->pages && job->pages !=3D &zero_page_list)
           ^
   drivers/md/dm-kcopyd.c:494:3: note: Calling 'kcopyd_put_pages'
                   kcopyd_put_pages(kc, job->pages);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:248:7: note: Assuming field 'nr_free_pages' is >=
=3D field 'nr_reserved_pages'
                   if (kc->nr_free_pages >=3D kc->nr_reserved_pages)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:248:3: note: Taking true branch
                   if (kc->nr_free_pages >=3D kc->nr_reserved_pages)
                   ^
   drivers/md/dm-kcopyd.c:249:4: note: Calling 'free_pl'
                           free_pl(pl);
                           ^~~~~~~~~~~
   drivers/md/dm-kcopyd.c:234:2: note: Memory is released
           kfree(pl);
           ^~~~~~~~~
   drivers/md/dm-kcopyd.c:249:4: note: Returning; memory was released via 1=
st parameter
                           free_pl(pl);
                           ^~~~~~~~~~~
   drivers/md/dm-kcopyd.c:245:2: note: Loop condition is false.  Exiting lo=
op
           do {
           ^
   drivers/md/dm-kcopyd.c:494:3: note: Returning; memory was released via 2=
nd parameter
                   kcopyd_put_pages(kc, job->pages);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:499:6: note: Assuming 'job' is not equal to field=
 'master_job'
           if (job->master_job =3D=3D job) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:499:2: note: Taking false branch
           if (job->master_job =3D=3D job) {
           ^
   drivers/md/dm-kcopyd.c:505:6: note: Assuming the condition is false
           if (atomic_dec_and_test(&kc->nr_jobs))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:505:2: note: Taking false branch
           if (atomic_dec_and_test(&kc->nr_jobs))
           ^
   drivers/md/dm-kcopyd.c:613:7: note: Returning; memory was released
                   r =3D fn(job);
                       ^~~~~~~
   drivers/md/dm-kcopyd.c:615:7: note: 'r' is >=3D 0
                   if (r < 0) {
                       ^
   drivers/md/dm-kcopyd.c:615:3: note: Taking false branch
                   if (r < 0) {
                   ^
   drivers/md/dm-kcopyd.c:626:7: note: 'r' is <=3D 0
                   if (r > 0) {
                       ^
   drivers/md/dm-kcopyd.c:626:3: note: Taking false branch
                   if (r > 0) {
                   ^
   drivers/md/dm-kcopyd.c:611:2: note: Loop condition is true.  Entering lo=
op body
           while ((job =3D pop(jobs, kc))) {
           ^
   drivers/md/dm-kcopyd.c:613:7: note: Calling 'run_complete_job'
                   r =3D fn(job);
                       ^~~~~~~
   drivers/md/dm-kcopyd.c:493:11: note: Field 'pages' is non-null
           if (job->pages && job->pages !=3D &zero_page_list)
                    ^
   drivers/md/dm-kcopyd.c:493:6: note: Left side of '&&' is true
           if (job->pages && job->pages !=3D &zero_page_list)
               ^
   drivers/md/dm-kcopyd.c:493:20: note: Assuming the condition is true
           if (job->pages && job->pages !=3D &zero_page_list)
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:493:2: note: Taking true branch
           if (job->pages && job->pages !=3D &zero_page_list)
           ^
   drivers/md/dm-kcopyd.c:494:3: note: Use of memory after it is freed
                   kcopyd_put_pages(kc, job->pages);
                   ^                    ~~~~~~~~~~
   drivers/md/dm-kcopyd.c:794:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&job->dests, dests, sizeof(*dests) * num_dests);
           ^~~~~~
   drivers/md/dm-kcopyd.c:794:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(&job->dests, dests, sizeof(*dests) * num_dests);
           ^~~~~~
   drivers/md/dm-kcopyd.c:822:3: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
--
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/hifn_795x.c:1093:6: note: Assuming field 'cmdu' is <=3D 1
           if (dma->cmdu > 1) {
               ^~~~~~~~~~~~~
   drivers/crypto/hifn_795x.c:1093:2: note: Taking false branch
           if (dma->cmdu > 1) {
           ^
   drivers/crypto/hifn_795x.c:1098:6: note: 'keylen' is 8
           if (keylen) {
               ^~~~~~
   drivers/crypto/hifn_795x.c:1098:2: note: Taking true branch
           if (keylen) {
           ^
   drivers/crypto/hifn_795x.c:1102:6: note: Assuming 'ivsize' is not equal =
to 0
           if (ivsize) {
               ^~~~~~
   drivers/crypto/hifn_795x.c:1102:2: note: Taking true branch
           if (ivsize) {
           ^
   drivers/crypto/hifn_795x.c:1103:3: note: Null pointer passed as 2nd argu=
ment to memory copy function
                   memcpy(buf_pos, iv, ivsize);
                   ^               ~~
   drivers/crypto/hifn_795x.c:1124:2: warning: Value stored to 'mask' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           mask =3D 0;
           ^      ~
   drivers/crypto/hifn_795x.c:1124:2: note: Value stored to 'mask' is never=
 read
           mask =3D 0;
           ^      ~
   drivers/crypto/hifn_795x.c:1630:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(daddr + dst->offset + offset, saddr, copy);
                   ^~~~~~
   drivers/crypto/hifn_795x.c:1630:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(daddr + dst->offset + offset, saddr, copy);
                   ^~~~~~
   drivers/crypto/hifn_795x.c:1955:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ctx->key, key, len);
           ^~~~~~
   drivers/crypto/hifn_795x.c:1955:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(ctx->key, key, len);
           ^~~~~~
   drivers/crypto/hifn_795x.c:1974:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ctx->key, key, len);
           ^~~~~~
   drivers/crypto/hifn_795x.c:1974:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(ctx->key, key, len);
           ^~~~~~
   drivers/crypto/hifn_795x.c:2396:2: warning: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(alg->alg.base.cra_name, CRYPTO_MAX_ALG_NAME, "%s", t->n=
ame);
           ^~~~~~~~
   drivers/crypto/hifn_795x.c:2396:2: note: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11
           snprintf(alg->alg.base.cra_name, CRYPTO_MAX_ALG_NAME, "%s", t->n=
ame);
           ^~~~~~~~
   drivers/crypto/hifn_795x.c:2397:2: warning: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(alg->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME, "%s=
-%s",
           ^~~~~~~~
   drivers/crypto/hifn_795x.c:2397:2: note: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11
           snprintf(alg->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME, "%s=
-%s",
           ^~~~~~~~
   drivers/crypto/hifn_795x.c:2479:2: warning: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, sizeof(name), "hifn%d",
           ^~~~~~~~
   drivers/crypto/hifn_795x.c:2479:2: note: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, sizeof(name), "hifn%d",
           ^~~~~~~~
   drivers/crypto/hifn_795x.c:2503:2: warning: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(dev->name, sizeof(dev->name), "%s", name);
           ^~~~~~~~
   drivers/crypto/hifn_795x.c:2503:2: note: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11
           snprintf(dev->name, sizeof(dev->name), "%s", name);
           ^~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/md/dm-sysfs.c:73:2: warning: Call to function 'strcat' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(buf, "\n");
           ^~~~~~
   drivers/md/dm-sysfs.c:73:2: note: Call to function 'strcat' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcat'. CWE-119
           strcat(buf, "\n");
           ^~~~~~
   drivers/md/dm-sysfs.c:82:2: warning: Call to function 'strcat' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(buf, "\n");
           ^~~~~~
   drivers/md/dm-sysfs.c:82:2: note: Call to function 'strcat' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcat'. CWE-119
           strcat(buf, "\n");
           ^~~~~~
   drivers/md/dm-sysfs.c:88:2: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(buf, "%d\n", dm_suspended_md(md));
           ^~~~~~~
   drivers/md/dm-sysfs.c:88:2: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           sprintf(buf, "%d\n", dm_suspended_md(md));
           ^~~~~~~
   drivers/md/dm-sysfs.c:96:2: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(buf, "%d\n", true);
           ^~~~~~~
   drivers/md/dm-sysfs.c:96:2: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           sprintf(buf, "%d\n", true);
           ^~~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
>> drivers/md/dm-stats.c:174:2: warning: Attempt to free released memory [c=
lang-analyzer-unix.Malloc]
           kfree(s->histogram_boundaries);
           ^
   drivers/md/dm-stats.c:213:2: note: Loop condition is true.  Entering loo=
p body
           while (!list_empty(&stats->list)) {
           ^
   drivers/md/dm-stats.c:216:16: note: Assuming 'ni' is >=3D field 'n_entri=
es'
                   for (ni =3D 0; ni < s->n_entries; ni++) {
                                ^~~~~~~~~~~~~~~~~
   drivers/md/dm-stats.c:216:3: note: Loop condition is false. Execution co=
ntinues on line 230
                   for (ni =3D 0; ni < s->n_entries; ni++) {
                   ^
   drivers/md/dm-stats.c:230:3: note: Calling 'dm_stat_free'
                   dm_stat_free(&s->rcu_head);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-stats.c:174:2: note: Memory is released
           kfree(s->histogram_boundaries);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-stats.c:177:2: note: Loop condition is true.  Entering loo=
p body
           for_each_possible_cpu(cpu) {
           ^
   include/linux/cpumask.h:814:36: note: expanded from macro 'for_each_poss=
ible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^
   include/linux/cpumask.h:190:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   drivers/md/dm-stats.c:177:2: note: Loop condition is false. Execution co=
ntinues on line 181
           for_each_possible_cpu(cpu) {
           ^
   include/linux/cpumask.h:814:36: note: expanded from macro 'for_each_poss=
ible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^
   include/linux/cpumask.h:190:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   drivers/md/dm-stats.c:230:3: note: Returning; memory was released
                   dm_stat_free(&s->rcu_head);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-stats.c:213:2: note: Loop condition is true.  Entering loo=
p body
           while (!list_empty(&stats->list)) {
           ^
   drivers/md/dm-stats.c:216:3: note: Loop condition is false. Execution co=
ntinues on line 230
                   for (ni =3D 0; ni < s->n_entries; ni++) {
                   ^
   drivers/md/dm-stats.c:230:3: note: Calling 'dm_stat_free'
                   dm_stat_free(&s->rcu_head);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-stats.c:174:2: note: Attempt to free released memory
           kfree(s->histogram_boundaries);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-stats.c:726:3: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(shared->tmp.histogram, 0, (s->n_histogram_entries=
 + 1) * sizeof(unsigned long long));
                   ^~~~~~
   drivers/md/dm-stats.c:726:3: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
                   memset(shared->tmp.histogram, 0, (s->n_histogram_entries=
 + 1) * sizeof(unsigned long long));
                   ^~~~~~
   drivers/md/dm-stats.c:965:7: warning: Call to function 'sscanf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   s =3D sscanf(h, "%llu%c", &hi, &ch);
                       ^~~~~~
   drivers/md/dm-stats.c:965:7: note: Call to function 'sscanf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sscanf_s' in case of C11
                   s =3D sscanf(h, "%llu%c", &hi, &ch);
                       ^~~~~~
   drivers/md/dm-stats.c:1016:13: warning: Call to function 'sscanf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           } else if (sscanf(a, "%llu+%llu%c", &start, &len, &dummy) !=3D 2=
 ||
                      ^~~~~~
   drivers/md/dm-stats.c:1016:13: note: Call to function 'sscanf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sscanf_s' in case of C11
           } else if (sscanf(a, "%llu+%llu%c", &start, &len, &dummy) !=3D 2=
 ||
                      ^~~~~~
   drivers/md/dm-stats.c:1025:6: warning: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(a, "/%u%c", &divisor, &dummy) =3D=3D 1) {
               ^~~~~~
   drivers/md/dm-stats.c:1025:6: note: Call to function 'sscanf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sscanf_s' in case of C11
           if (sscanf(a, "/%u%c", &divisor, &dummy) =3D=3D 1) {
               ^~~~~~
   drivers/md/dm-stats.c:1033:13: warning: Call to function 'sscanf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           } else if (sscanf(a, "%llu%c", &step, &dummy) !=3D 1 ||
                      ^~~~~~
   drivers/md/dm-stats.c:1033:13: note: Call to function 'sscanf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sscanf_s' in case of C11
           } else if (sscanf(a, "%llu%c", &step, &dummy) !=3D 1 ||
                      ^~~~~~
   drivers/md/dm-stats.c:1039:11: warning: Call to function 'sscanf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (a && sscanf(a, "%u%c", &feature_args, &dummy) =3D=3D 1) {
                    ^~~~~~
   drivers/md/dm-stats.c:1039:11: note: Call to function 'sscanf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sscanf_s' in case of C11
           if (a && sscanf(a, "%u%c", &feature_args, &dummy) =3D=3D 1) {
                    ^~~~~~
   drivers/md/dm-stats.c:1078:2: warning: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(result, maxlen, "%d", INT_MAX);
           ^~~~~~~~
   drivers/md/dm-stats.c:1078:2: note: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11
           snprintf(result, maxlen, "%d", INT_MAX);
           ^~~~~~~~
   drivers/md/dm-stats.c:1092:2: warning: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(result, maxlen, "%d", id);
           ^~~~~~~~
   drivers/md/dm-stats.c:1092:2: note: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11
           snprintf(result, maxlen, "%d", id);
           ^~~~~~~~
   drivers/md/dm-stats.c:1113:6: warning: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(argv[1], "%d%c", &id, &dummy) !=3D 1 || id < 0)
--
                   ^~~~~~
   drivers/memstick/core/memstick.c:335:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&id_reg, (*mrq)->data, sizeof(id_reg));
                   ^~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/hwmon/ltc2945.c:286:2: warning: Value stored to 'ret' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_update_bits(regmap, LTC2945_CONTROL, CONTROL_TEST=
_MODE,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/hwmon/ltc2945.c:286:2: note: Value stored to 'ret' is never read
           ret =3D regmap_update_bits(regmap, LTC2945_CONTROL, CONTROL_TEST=
_MODE,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/hwmon/ltc2947-core.c:295:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(alarms, 0, sizeof(alarms));
           ^~~~~~
   drivers/hwmon/ltc2947-core.c:295:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(alarms, 0, sizeof(alarms));
           ^~~~~~
   drivers/hwmon/ltc2947-core.c:336:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lld\n", val);
                  ^~~~~~~
   drivers/hwmon/ltc2947-core.c:336:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lld\n", val);
                  ^~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   drivers/usb/mon/mon_stat.c:38:13: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sp->slen =3D snprintf(sp->str, STAT_BUF_SIZE,
                      ^~~~~~~~
   drivers/usb/mon/mon_stat.c:38:13: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
           sp->slen =3D snprintf(sp->str, STAT_BUF_SIZE,
                      ^~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/usb/mon/mon_text.c:141:2: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ep->setup, urb->setup_packet, SETUP_MAX);
           ^~~~~~
   drivers/usb/mon/mon_text.c:141:2: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(ep->setup, urb->setup_packet, SETUP_MAX);
           ^~~~~~
   drivers/usb/mon/mon_text.c:178:2: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ep->data, src, len);
           ^~~~~~
   drivers/usb/mon/mon_text.c:178:2: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(ep->data, src, len);
           ^~~~~~
   drivers/usb/mon/mon_text.c:355:2: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(rp->slab_name, SLAB_NAME_SZ, "mon_text_%p", rp);
           ^~~~~~~~
   drivers/usb/mon/mon_text.c:355:2: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
           snprintf(rp->slab_name, SLAB_NAME_SZ, "mon_text_%p", rp);
           ^~~~~~~~
   drivers/usb/mon/mon_text.c:712:8: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   rc =3D snprintf(name, NAMESZ, "%dt", busnum);
                        ^~~~~~~~
   drivers/usb/mon/mon_text.c:712:8: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
                   rc =3D snprintf(name, NAMESZ, "%dt", busnum);
                        ^~~~~~~~
   drivers/usb/mon/mon_text.c:719:7: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           rc =3D snprintf(name, NAMESZ, "%du", busnum);
                ^~~~~~~~
   drivers/usb/mon/mon_text.c:719:7: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
           rc =3D snprintf(name, NAMESZ, "%du", busnum);
                ^~~~~~~~
   drivers/usb/mon/mon_text.c:725:7: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           rc =3D snprintf(name, NAMESZ, "%ds", busnum);
                ^~~~~~~~
   drivers/usb/mon/mon_text.c:725:7: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
           rc =3D snprintf(name, NAMESZ, "%ds", busnum);
                ^~~~~~~~
   drivers/usb/mon/mon_text.c:761:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(mem, 0xe5, sizeof(struct mon_event_text));
           ^~~~~~
   drivers/usb/mon/mon_text.c:761:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(mem, 0xe5, sizeof(struct mon_event_text));
           ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
>> sound/firewire/digi00x/digi00x.c:34:2: warning: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcp=
y]
           strcpy(dg00x->card->shortname, model);
           ^~~~~~
   sound/firewire/digi00x/digi00x.c:34:2: note: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119
           strcpy(dg00x->card->shortname, model);
           ^~~~~~
   sound/firewire/digi00x/digi00x.c:35:2: warning: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcp=
y]
           strcpy(dg00x->card->mixername, model);
           ^~~~~~
   sound/firewire/digi00x/digi00x.c:35:2: note: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119
           strcpy(dg00x->card->mixername, model);
           ^~~~~~
   sound/firewire/digi00x/digi00x.c:36:2: warning: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(dg00x->card->longname, sizeof(dg00x->card->longname),
           ^~~~~~~~
   sound/firewire/digi00x/digi00x.c:36:2: note: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(dg00x->card->longname, sizeof(dg00x->card->longname),
           ^~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/block/zram/zram_drv.c:456:3: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, "none\n", 5);
                   ^~~~~~
   drivers/block/zram/zram_drv.c:456:3: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, "none\n", 5);
                   ^~~~~~
   drivers/block/zram/zram_drv.c:468:2: warning: Call to function 'memmove'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memmove_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(buf, p, ret);
           ^~~~~~~
   drivers/block/zram/zram_drv.c:468:2: note: Call to function 'memmove' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memmove_s' in case of C11
           memmove(buf, p, ret);
           ^~~~~~~
>> drivers/block/zram/zram_drv.c:1048:2: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(zram->compressor, compressor);
           ^~~~~~
   drivers/block/zram/zram_drv.c:1048:2: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
           strcpy(zram->compressor, compressor);
           ^~~~~~
   drivers/block/zram/zram_drv.c:1097:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&pool_stats, 0x00, sizeof(struct zs_pool_stats));
           ^~~~~~
   drivers/block/zram/zram_drv.c:1097:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&pool_stats, 0x00, sizeof(struct zs_pool_stats));
           ^~~~~~
   drivers/block/zram/zram_drv.c:1297:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst, src, PAGE_SIZE);
                   ^~~~~~
   drivers/block/zram/zram_drv.c:1297:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dst, src, PAGE_SIZE);
                   ^~~~~~
   drivers/block/zram/zram_drv.c:1409:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst, src, comp_len);
           ^~~~~~
   drivers/block/zram/zram_drv.c:1409:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(dst, src, comp_len);
           ^~~~~~
   drivers/block/zram/zram_drv.c:1711:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&zram->stats, 0, sizeof(zram->stats));
           ^~~~~~
   drivers/block/zram/zram_drv.c:1711:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&zram->stats, 0, sizeof(zram->stats));
           ^~~~~~
   drivers/block/zram/zram_drv.c:1918:2: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(zram->disk->disk_name, 16, "zram%d", device_id);
           ^~~~~~~~
   drivers/block/zram/zram_drv.c:1918:2: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
           snprintf(zram->disk->disk_name, 16, "zram%d", device_id);
           ^~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   sound/core/misc.c:76:4: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(verbose_fmt, vaf.fmt, end_of_header - vaf=
.fmt);
                           ^~~~~~
   sound/core/misc.c:76:4: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
                           memcpy(verbose_fmt, vaf.fmt, end_of_header - vaf=
.fmt);
                           ^~~~~~
   sound/core/misc.c:84:3: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(verbose_fmt, KERN_DEBUG, sizeof(KERN_DEBUG) - 1);
                   ^~~~~~
   sound/core/misc.c:84:3: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
                   memcpy(verbose_fmt, KERN_DEBUG, sizeof(KERN_DEBUG) - 1);
                   ^~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   include/linux/list.h:137:2: warning: Use of memory after it is freed [cl=
ang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
           ^
   sound/core/device.c:226:17: note: Assuming 'card' is non-null
           if (snd_BUG_ON(!card))
                          ^
   include/sound/core.h:402:35: note: expanded from macro 'snd_BUG_ON'
   #define snd_BUG_ON(cond)        WARN_ON((cond))
                                            ^~~~
   include/asm-generic/bug.h:122:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   sound/core/device.c:226:6: note: Taking false branch
           if (snd_BUG_ON(!card))
               ^
   include/sound/core.h:402:26: note: expanded from macro 'snd_BUG_ON'
   #define snd_BUG_ON(cond)        WARN_ON((cond))
                                   ^
   include/asm-generic/bug.h:123:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   sound/core/device.c:226:2: note: Taking false branch
           if (snd_BUG_ON(!card))
           ^
   sound/core/device.c:228:2: note: Loop condition is true.  Entering loop =
body
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list=
) {
           ^
   include/linux/list.h:808:2: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
           for (pos =3D list_last_entry(head, typeof(*pos), member),       =
  \
           ^
   sound/core/device.c:230:7: note: Assuming field 'type' is equal to SNDRV=
_DEV_CONTROL
                   if (dev->type =3D=3D SNDRV_DEV_CONTROL ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/device.c:230:38: note: Left side of '||' is true
                   if (dev->type =3D=3D SNDRV_DEV_CONTROL ||
                                                      ^
   sound/core/device.c:232:4: note:  Execution continues on line 228
                           continue;
                           ^
   sound/core/device.c:228:2: note: Loop condition is true.  Entering loop =
body
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list=
) {
           ^
   include/linux/list.h:808:2: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
           for (pos =3D list_last_entry(head, typeof(*pos), member),       =
  \
           ^
   sound/core/device.c:230:7: note: Assuming field 'type' is not equal to S=
NDRV_DEV_CONTROL
                   if (dev->type =3D=3D SNDRV_DEV_CONTROL ||
--
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   sound/core/device.c:226:17: note: Assuming 'card' is non-null
           if (snd_BUG_ON(!card))
                          ^
   include/sound/core.h:402:35: note: expanded from macro 'snd_BUG_ON'
   #define snd_BUG_ON(cond)        WARN_ON((cond))
                                            ^~~~
   include/asm-generic/bug.h:122:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   sound/core/device.c:226:6: note: Taking false branch
           if (snd_BUG_ON(!card))
               ^
   include/sound/core.h:402:26: note: expanded from macro 'snd_BUG_ON'
   #define snd_BUG_ON(cond)        WARN_ON((cond))
                                   ^
   include/asm-generic/bug.h:123:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   sound/core/device.c:226:2: note: Taking false branch
           if (snd_BUG_ON(!card))
           ^
   sound/core/device.c:228:2: note: Loop condition is true.  Entering loop =
body
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list=
) {
           ^
   include/linux/list.h:808:2: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
           for (pos =3D list_last_entry(head, typeof(*pos), member),       =
  \
           ^
   sound/core/device.c:230:7: note: Assuming field 'type' is not equal to S=
NDRV_DEV_CONTROL
                   if (dev->type =3D=3D SNDRV_DEV_CONTROL ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/device.c:230:7: note: Left side of '||' is false
   sound/core/device.c:231:7: note: Assuming field 'type' is not equal to S=
NDRV_DEV_LOWLEVEL
                       dev->type =3D=3D SNDRV_DEV_LOWLEVEL)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/device.c:230:3: note: Taking false branch
                   if (dev->type =3D=3D SNDRV_DEV_CONTROL ||
                   ^
   sound/core/device.c:233:3: note: Calling '__snd_device_free'
                   __snd_device_free(dev);
                   ^~~~~~~~~~~~~~~~~~~~~~
   sound/core/device.c:75:6: note: Assuming field 'dev_free' is null
           if (dev->ops->dev_free) {
               ^~~~~~~~~~~~~~~~~~
   sound/core/device.c:75:2: note: Taking false branch
           if (dev->ops->dev_free) {
           ^
   sound/core/device.c:79:2: note: Memory is released
           kfree(dev);
           ^~~~~~~~~~
   sound/core/device.c:233:3: note: Returning; memory was released via 1st =
parameter
                   __snd_device_free(dev);
                   ^~~~~~~~~~~~~~~~~~~~~~
   sound/core/device.c:228:2: note: Loop condition is false. Execution cont=
inues on line 237
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list=
) {
           ^
   include/linux/list.h:808:2: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
           for (pos =3D list_last_entry(head, typeof(*pos), member),       =
  \
           ^
   sound/core/device.c:237:2: note: Use of memory after it is freed
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list)
           ^
   include/linux/list.h:809:7: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
                   n =3D list_prev_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:585:2: note: expanded from macro 'list_prev_entry'
           list_entry((pos)->member.prev, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   drivers/parport/share.c:459:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(tmp->probe_info, 0, 5 * sizeof(struct parport_device_info=
));
           ^~~~~~
   drivers/parport/share.c:459:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(tmp->probe_info, 0, 5 * sizeof(struct parport_device_info=
));
           ^~~~~~
   drivers/parport/share.c:490:2: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(name, "parport%d", tmp->portnum =3D tmp->number);
           ^~~~~~~
   drivers/parport/share.c:490:2: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           sprintf(name, "parport%d", tmp->portnum =3D tmp->number);
           ^~~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
>> drivers/parport/procfs.c:54:11: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
                           len +=3D sprintf(buffer, "%s\n", dev->name);
                                  ^~~~~~~
   drivers/parport/procfs.c:54:11: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
                           len +=3D sprintf(buffer, "%s\n", dev->name);
                                  ^~~~~~~
   drivers/parport/procfs.c:59:10: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
                   len +=3D sprintf(buffer, "%s\n", "none");
                          ^~~~~~~
   drivers/parport/procfs.c:59:10: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
                   len +=3D sprintf(buffer, "%s\n", "none");
                          ^~~~~~~
   drivers/parport/procfs.c:68:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(result, buffer, len);
           ^~~~~~
   drivers/parport/procfs.c:68:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(result, buffer, len);
           ^~~~~~
   drivers/parport/procfs.c:131:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len +=3D sprintf (buffer, "%lu\t%lu\n", port->base, port->base_h=
i);
                  ^~~~~~~
   drivers/parport/procfs.c:131:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           len +=3D sprintf (buffer, "%lu\t%lu\n", port->base, port->base_h=
i);
                  ^~~~~~~
   drivers/parport/procfs.c:139:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(result, buffer, len);
           ^~~~~~
   drivers/parport/procfs.c:139:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(result, buffer, len);
           ^~~~~~
   drivers/parport/procfs.c:158:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len +=3D sprintf (buffer, "%d\n", port->irq);
                  ^~~~~~~
   drivers/parport/procfs.c:158:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           len +=3D sprintf (buffer, "%d\n", port->irq);
                  ^~~~~~~
   drivers/parport/procfs.c:166:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(result, buffer, len);
           ^~~~~~
   drivers/parport/procfs.c:166:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(result, buffer, len);
           ^~~~~~
   drivers/parport/procfs.c:185:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len +=3D sprintf (buffer, "%d\n", port->dma);
                  ^~~~~~~
   drivers/parport/procfs.c:185:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           len +=3D sprintf (buffer, "%d\n", port->dma);
                  ^~~~~~~
   drivers/parport/procfs.c:193:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(result, buffer, len);
           ^~~~~~
   drivers/parport/procfs.c:193:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(result, buffer, len);
           ^~~~~~
   drivers/parport/procfs.c:219:3: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
                   printmode(PCSPP);
                   ^
   drivers/parport/procfs.c:216:10: note: expanded from macro 'printmode'
                   len +=3D sprintf(buffer + len, "%s%s", f++ ? "," : "", #=
x); \
                          ^~~~~~~
   drivers/parport/procfs.c:219:3: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
                   printmode(PCSPP);
                   ^
   drivers/parport/procfs.c:216:10: note: expanded from macro 'printmode'
                   len +=3D sprintf(buffer + len, "%s%s", f++ ? "," : "", #=
x); \
                          ^~~~~~~
   drivers/parport/procfs.c:220:3: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
                   printmode(TRISTATE);
                   ^
   drivers/parport/procfs.c:216:10: note: expanded from macro 'printmode'
                   len +=3D sprintf(buffer + len, "%s%s", f++ ? "," : "", #=
x); \
                          ^~~~~~~
   drivers/parport/procfs.c:220:3: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
                   printmode(TRISTATE);
                   ^
   drivers/parport/procfs.c:216:10: note: expanded from macro 'printmode'
                   len +=3D sprintf(buffer + len, "%s%s", f++ ? "," : "", #=
x); \
                          ^~~~~~~
   drivers/parport/procfs.c:221:3: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
                   printmode(COMPAT);
                   ^
   drivers/parport/procfs.c:216:10: note: expanded from macro 'printmode'
                   len +=3D sprintf(buffer + len, "%s%s", f++ ? "," : "", #=
x); \
                          ^~~~~~~
   drivers/parport/procfs.c:221:3: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
                   printmode(COMPAT);
                   ^
   drivers/parport/procfs.c:216:10: note: expanded from macro 'printmode'
                   len +=3D sprintf(buffer + len, "%s%s", f++ ? "," : "", #=
x); \
                          ^~~~~~~
   drivers/parport/procfs.c:222:3: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
                   printmode(EPP);
                   ^
   drivers/parport/procfs.c:216:10: note: expanded from macro 'printmode'
                   len +=3D sprintf(buffer + len, "%s%s", f++ ? "," : "", #=
x); \
                          ^~~~~~~
   drivers/parport/procfs.c:222:3: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
                   printmode(EPP);
                   ^
   drivers/parport/procfs.c:216:10: note: expanded from macro 'printmode'
                   len +=3D sprintf(buffer + len, "%s%s", f++ ? "," : "", #=
x); \
--
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:31: note: expanded from macro '__LOCK=
_IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
                                 ^
   include/linux/spinlock_api_up.h:31:27: note: expanded from macro '__LOCK'
     do { preempt_disable(); ___LOCK(lock); } while (0)
                             ^
   include/linux/spinlock_api_up.h:28:3: note: expanded from macro '___LOCK'
     do { __acquire(lock); (void)(lock); } while (0)
     ^
   sound/virtio/virtio_ctl_msg.c:238:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(&queue->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:31: note: expanded from macro '__LOCK=
_IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
                                 ^
   include/linux/spinlock_api_up.h:31:3: note: expanded from macro '__LOCK'
     do { preempt_disable(); ___LOCK(lock); } while (0)
     ^
   sound/virtio/virtio_ctl_msg.c:238:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(&queue->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:3: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
     ^
   sound/virtio/virtio_ctl_msg.c:238:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(&queue->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:262:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   sound/virtio/virtio_ctl_msg.c:238:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(&queue->lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   sound/virtio/virtio_ctl_msg.c:239:2: note: Loop condition is true.  Ente=
ring loop body
           while (!list_empty(&snd->ctl_msgs)) {
           ^
   sound/virtio/virtio_ctl_msg.c:244:3: note: Calling 'virtsnd_ctl_msg_comp=
lete'
                   virtsnd_ctl_msg_complete(msg);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/virtio/virtio_ctl_msg.c:224:2: note: Calling 'virtsnd_ctl_msg_unre=
f'
           virtsnd_ctl_msg_unref(msg);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/virtio/virtio_ctl_msg.c:48:2: note: Taking true branch
           if (refcount_dec_and_test(&msg->ref_count))
           ^
   sound/virtio/virtio_ctl_msg.c:49:3: note: Memory is released
                   kfree(msg);
                   ^~~~~~~~~~
   sound/virtio/virtio_ctl_msg.c:224:2: note: Returning; memory was released
           virtsnd_ctl_msg_unref(msg);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/virtio/virtio_ctl_msg.c:244:3: note: Returning; memory was released
                   virtsnd_ctl_msg_complete(msg);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/virtio/virtio_ctl_msg.c:239:2: note: Loop condition is true.  Ente=
ring loop body
           while (!list_empty(&snd->ctl_msgs)) {
           ^
   sound/virtio/virtio_ctl_msg.c:244:3: note: Calling 'virtsnd_ctl_msg_comp=
lete'
                   virtsnd_ctl_msg_complete(msg);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/virtio/virtio_ctl_msg.c:221:2: note: Calling 'list_del'
           list_del(&msg->list);
           ^~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
>> sound/virtio/virtio_ctl_msg.c:207:2: warning: Use of memory after it is =
freed [clang-analyzer-unix.Malloc]
           virtsnd_ctl_msg_unref(msg);
           ^
   sound/virtio/virtio_ctl_msg.c:268:8: note: Calling 'virtsnd_ctl_msg_allo=
c'
           msg =3D virtsnd_ctl_msg_alloc(sizeof(*query),
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/virtio/virtio_ctl_msg.c:90:7: note: 'request_size' is 16
           if (!request_size || !response_size)
                ^~~~~~~~~~~~
   sound/virtio/virtio_ctl_msg.c:90:6: note: Left side of '||' is false
           if (!request_size || !response_size)
               ^
   sound/virtio/virtio_ctl_msg.c:90:24: note: 'response_size' is 4
           if (!request_size || !response_size)
                                 ^~~~~~~~~~~~~
   sound/virtio/virtio_ctl_msg.c:90:2: note: Taking false branch
           if (!request_size || !response_size)
           ^
   sound/virtio/virtio_ctl_msg.c:94:6: note: Assuming 'msg' is non-null
           if (!msg)
               ^~~~
   sound/virtio/virtio_ctl_msg.c:94:2: note: Taking false branch
           if (!msg)
           ^
   sound/virtio/virtio_ctl_msg.c:268:8: note: Returning from 'virtsnd_ctl_m=
sg_alloc'
           msg =3D virtsnd_ctl_msg_alloc(sizeof(*query),
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/virtio/virtio_ctl_msg.c:270:7: note: 'msg' is non-null
           if (!msg)
                ^~~
   sound/virtio/virtio_ctl_msg.c:270:2: note: Taking false branch
           if (!msg)
           ^
   sound/virtio/virtio_ctl_msg.c:281:9: note: Calling 'virtsnd_ctl_msg_send'
           return virtsnd_ctl_msg_send(snd, msg, NULL, &sg, false);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/virtio/virtio_ctl_msg.c:143:6: note: 'out_sgs' is null
           if (out_sgs)
               ^~~~~~~
   sound/virtio/virtio_ctl_msg.c:143:2: note: Taking false branch
           if (out_sgs)
           ^
   sound/virtio/virtio_ctl_msg.c:147:6: note: 'in_sgs' is non-null
           if (in_sgs)
               ^~~~~~
   sound/virtio/virtio_ctl_msg.c:147:2: note: Taking true branch
           if (in_sgs)
           ^
   sound/virtio/virtio_ctl_msg.c:150:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(&queue->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:244:36: note: expanded from macro 'local_irq_sa=
ve'
   #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while =
(0)
                                        ^
   include/linux/irqflags.h:176:2: note: expanded from macro 'raw_local_irq=
_save'
           do {                                            \
           ^
   sound/virtio/virtio_ctl_msg.c:150:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(&queue->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:244:31: note: expanded from macro 'local_irq_sa=
ve'
   #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while =
(0)
                                   ^
   sound/virtio/virtio_ctl_msg.c:150:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(&queue->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:31: note: expanded from macro '__LOCK=
_IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
--
           ^
   drivers/usb/c67x00/c67x00-ll-hpi.c:288:3: note: 3rd function call argume=
nt is an uninitialized value
                   hpi_write_word(dev, COMM_R(i), data->regs[i]);
                   ^                              ~~~~~~~~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/usb/c67x00/c67x00-hcd.c:80:3: warning: Value stored to 'len' is =
never read [clang-analyzer-deadcode.DeadStores]
                   len =3D 4;                /* hub power */
                   ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:80:3: note: Value stored to 'len' is nev=
er read
                   len =3D 4;                /* hub power */
                   ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:108:3: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   len =3D 4;
                   ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:108:3: note: Value stored to 'len' is ne=
ver read
                   len =3D 4;
                   ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:116:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:116:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:132:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:132:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:137:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:137:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:142:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:142:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:162:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:162:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:168:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:168:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:174:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:174:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:180:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:180:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:191:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:191:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:197:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:197:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:203:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:203:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:216:3: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, c67x00_hub_des, len);
                   ^~~~~~
   drivers/usb/c67x00/c67x00-hcd.c:216:3: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, c67x00_hub_des, len);
                   ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   sound/usb/line6/driver.c:274:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buffer + 1, line6_midi_id, sizeof(line6_midi_id));
           ^~~~~~
   sound/usb/line6/driver.c:274:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(buffer + 1, line6_midi_id, sizeof(line6_midi_id));
           ^~~~~~
>> sound/usb/line6/driver.c:767:2: warning: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->id, properties->id);
           ^~~~~~
   sound/usb/line6/driver.c:767:2: note: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119
           strcpy(card->id, properties->id);
           ^~~~~~
   sound/usb/line6/driver.c:768:2: warning: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->driver, driver_name);
           ^~~~~~
   sound/usb/line6/driver.c:768:2: note: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119
           strcpy(card->driver, driver_name);
           ^~~~~~
   sound/usb/line6/driver.c:769:2: warning: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->shortname, properties->name);
           ^~~~~~
   sound/usb/line6/driver.c:769:2: note: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119
           strcpy(card->shortname, properties->name);
           ^~~~~~
>> sound/usb/line6/driver.c:770:2: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           sprintf(card->longname, "Line 6 %s at USB %s", properties->name,
           ^~~~~~~
   sound/usb/line6/driver.c:770:2: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           sprintf(card->longname, "Line 6 %s at USB %s", properties->name,
           ^~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/scsi/libsas/sas_task.c:30:3: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(tstat->buf, iu->sense_data, tstat->buf_valid_size=
);
                   ^~~~~~
   drivers/scsi/libsas/sas_task.c:30:3: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(tstat->buf, iu->sense_data, tstat->buf_valid_size=
);
                   ^~~~~~
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/scsi/libsas/sas_ata.c:121:3: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dev->sata_dev.fis, resp->ending_fis, ATA_RESP_FIS=
_SIZE);
                   ^~~~~~
   drivers/scsi/libsas/sas_ata.c:121:3: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dev->sata_dev.fis, resp->ending_fis, ATA_RESP_FIS=
_SIZE);
                   ^~~~~~
   drivers/scsi/libsas/sas_ata.c:189:3: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(task->ata_task.atapi_packet, qc->cdb, qc->dev->cd=
b_len);
                   ^~~~~~
   drivers/scsi/libsas/sas_ata.c:189:3: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(task->ata_task.atapi_packet, qc->cdb, qc->dev->cd=
b_len);
                   ^~~~~~
   drivers/scsi/libsas/sas_ata.c:265:3: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dev->frame_rcvd, &dev->sata_dev.rps_resp.rps.fis,
                   ^~~~~~
   drivers/scsi/libsas/sas_ata.c:265:3: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dev->frame_rcvd, &dev->sata_dev.rps_resp.rps.fis,
                   ^~~~~~
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   drivers/scsi/libsas/sas_host_smp.c:34:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(resp_data + 16, sas_ha->sas_addr, SAS_ADDR_SIZE);
           ^~~~~~
   drivers/scsi/libsas/sas_host_smp.c:34:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(resp_data + 16, sas_ha->sas_addr, SAS_ADDR_SIZE);
           ^~~~~~
   drivers/scsi/libsas/sas_host_smp.c:35:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(resp_data + 24, sas_ha->sas_phy[phy_id]->attached_sas_add=
r,
           ^~~~~~
   drivers/scsi/libsas/sas_host_smp.c:35:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(resp_data + 24, sas_ha->sas_phy[phy_id]->attached_sas_add=
r,
           ^~~~~~
   drivers/scsi/libsas/sas_host_smp.c:162:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(resp_data + 16, sas_ha->sas_phy[phy_id]->attached_sas_add=
r,
           ^~~~~~
   drivers/scsi/libsas/sas_host_smp.c:162:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(resp_data + 16, sas_ha->sas_phy[phy_id]->attached_sas_add=
r,
           ^~~~~~
   drivers/scsi/libsas/sas_host_smp.c:270:3: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(resp_data + 12, shost->hostt->name,
                   ^~~~~~
   drivers/scsi/libsas/sas_host_smp.c:270:3: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(resp_data + 12, shost->hostt->name,
                   ^~~~~~
   drivers/scsi/libsas/sas_host_smp.c:272:3: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(resp_data + 20, "libsas virt phy",
                   ^~~~~~
   drivers/scsi/libsas/sas_host_smp.c:272:3: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(resp_data + 20, "libsas virt phy",
                   ^~~~~~
   drivers/scsi/libsas/sas_host_smp.c:315:3: warning: Value stored to 'to_w=
rite' is never read [clang-analyzer-deadcode.DeadStores]
                   to_write =3D sas_host_smp_write_gpio(sas_ha, resp_data, =
req_data[2],
                   ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
   drivers/scsi/libsas/sas_host_smp.c:315:3: note: Value stored to 'to_writ=
e' is never read
                   to_write =3D sas_host_smp_write_gpio(sas_ha, resp_data, =
req_data[2],
                   ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   sound/firewire/dice/dice-midi.c:91:3: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(subs->name, sizeof(subs->name),
                   ^~~~~~~~
   sound/firewire/dice/dice-midi.c:91:3: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(subs->name, sizeof(subs->name),
                   ^~~~~~~~
   sound/firewire/dice/dice-midi.c:131:2: warning: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(rmidi->name, sizeof(rmidi->name),
           ^~~~~~~~
   sound/firewire/dice/dice-midi.c:131:2: note: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(rmidi->name, sizeof(rmidi->name),
           ^~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
>> sound/firewire/dice/dice-pcm.c:444:3: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(pcm->name, dice->card->shortname);
                   ^~~~~~
   sound/firewire/dice/dice-pcm.c:444:3: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
                   strcpy(pcm->name, dice->card->shortname);
                   ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/parport/parport_ax88796.c:208:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(s, 0, sizeof(struct parport_state));
           ^~~~~~
   drivers/parport/parport_ax88796.c:208:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(s, 0, sizeof(struct parport_state));
           ^~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/dax/super.c:457:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(dax_dev, 0, sizeof(*dax_dev));
           ^~~~~~
   drivers/dax/super.c:457:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(dax_dev, 0, sizeof(*dax_dev));
           ^~~~~~
   Suppressed 45 warnings (44 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/dax/bus.c:74:11: warning: Call to function 'sscanf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           fields =3D sscanf(buf, "dax%d.%d", &region_id, &id);
                    ^~~~~~
   drivers/dax/bus.c:74:11: note: Call to function 'sscanf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sscanf_s' in case of C11
           fields =3D sscanf(buf, "dax%d.%d", &region_id, &id);
                    ^~~~~~
   drivers/dax/bus.c:77:2: warning: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(devname, "dax%d.%d", region_id, id);
           ^~~~~~~
   drivers/dax/bus.c:77:2: note: Call to function 'sprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sprintf_s' in case of C11
           sprintf(devname, "dax%d.%d", region_id, id);
           ^~~~~~~
   drivers/dax/bus.c:87:5: warning: Call to function 'strncpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   strncpy(dax_id->dev_name, buf, DAX_NAME_=
LEN);
                                   ^~~~~~~
   drivers/dax/bus.c:87:5: note: Call to function 'strncpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'strncpy_s' in case of C11
                                   strncpy(dax_id->dev_name, buf, DAX_NAME_=
LEN);
                                   ^~~~~~~
   drivers/dax/bus.c:239:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", dax_region->id);
                  ^~~~~~~
   drivers/dax/bus.c:239:9: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", dax_region->id);
                  ^~~~~~~
   drivers/dax/bus.c:248:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%llu\n", (unsigned long long)
                  ^~~~~~~
   drivers/dax/bus.c:248:9: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%llu\n", (unsigned long long)
                  ^~~~~~~
   drivers/dax/bus.c:259:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", dax_region->align);
                  ^~~~~~~
   drivers/dax/bus.c:259:9: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", dax_region->align);
                  ^~~~~~~
   drivers/dax/bus.c:289:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%llu\n", size);
                  ^~~~~~~
   drivers/dax/bus.c:289:9: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%llu\n", size);
                  ^~~~~~~
   drivers/dax/bus.c:305:7: warning: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           rc =3D sprintf(buf, "%s\n", seed ? dev_name(seed) : "");
                ^~~~~~~
   drivers/dax/bus.c:305:7: note: Call to function 'sprintf' is insecure as=
 it does not provide bounding of the memory buffer or security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11
           rc =3D sprintf(buf, "%s\n", seed ? dev_name(seed) : "");
                ^~~~~~~
   drivers/dax/bus.c:324:7: warning: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           rc =3D sprintf(buf, "%s\n", youngest ? dev_name(youngest) : "");
                ^~~~~~~
   drivers/dax/bus.c:324:7: note: Call to function 'sprintf' is insecure as=
 it does not provide bounding of the memory buffer or security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11
           rc =3D sprintf(buf, "%s\n", youngest ? dev_name(youngest) : "");
                ^~~~~~~
   drivers/dax/bus.c:681:7: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           rc =3D sprintf(buf, "%#llx\n", dax_range->range.start);
                ^~~~~~~
   drivers/dax/bus.c:681:7: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           rc =3D sprintf(buf, "%#llx\n", dax_range->range.start);
                ^~~~~~~
   drivers/dax/bus.c:697:7: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           rc =3D sprintf(buf, "%#llx\n", dax_range->range.end);
                ^~~~~~~
   drivers/dax/bus.c:697:7: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           rc =3D sprintf(buf, "%#llx\n", dax_range->range.end);
                ^~~~~~~
   drivers/dax/bus.c:713:7: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           rc =3D sprintf(buf, "%#lx\n", dax_range->pgoff);
                ^~~~~~~
   drivers/dax/bus.c:713:7: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           rc =3D sprintf(buf, "%#lx\n", dax_range->pgoff);
                ^~~~~~~
   drivers/dax/bus.c:884:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%llu\n", size);
                  ^~~~~~~
   drivers/dax/bus.c:884:9: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%llu\n", size);
                  ^~~~~~~
   drivers/dax/bus.c:1132:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", dev_dax->align);
                  ^~~~~~~
   drivers/dax/bus.c:1132:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", dev_dax->align);
                  ^~~~~~~
   drivers/dax/bus.c:1204:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", dev_dax_target_node(dev_dax));
                  ^~~~~~~
   drivers/dax/bus.c:1204:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", dev_dax_target_node(dev_dax));
                  ^~~~~~~
   drivers/dax/bus.c:1220:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%#llx\n", start);
                  ^~~~~~~
   drivers/dax/bus.c:1220:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%#llx\n", start);
                  ^~~~~~~
   drivers/dax/bus.c:1231:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, DAX_DEVICE_MODALIAS_FMT "\n", 0);
                  ^~~~~~~
   drivers/dax/bus.c:1231:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, DAX_DEVICE_MODALIAS_FMT "\n", 0);
                  ^~~~~~~
   drivers/dax/bus.c:1238:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", dev_to_node(dev));
                  ^~~~~~~
   drivers/dax/bus.c:1238:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", dev_to_node(dev));
                  ^~~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
>> sound/core/info.c:114:3: warning: Value stored to 'offset' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   offset =3D entry->c.ops->llseek(entry,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/info.c:114:3: note: Value stored to 'offset' is never read
                   offset =3D entry->c.ops->llseek(entry,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/info.c:509:2: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(str, "card%i", card->number);
           ^~~~~~~
   sound/core/info.c:509:2: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           sprintf(str, "card%i", card->number);
           ^~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   sound/core/info_oss.c:99:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(snd_sndstat_strings, 0, sizeof(snd_sndstat_strings));
           ^~~~~~
   sound/core/info_oss.c:99:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(snd_sndstat_strings, 0, sizeof(snd_sndstat_strings));
           ^~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   sound/core/vmaster.c:265:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(srec->follower.vd, follower->vd, follower->count * sizeof=
(*follower->vd));
           ^~~~~~
   sound/core/vmaster.c:265:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(srec->follower.vd, follower->vd, follower->count * sizeof=
(*follower->vd));
           ^~~~~~
   sound/core/vmaster.c:365:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(sctl, &follower->follower, sizeof(*sctl));
                   ^~~~~~
   sound/core/vmaster.c:365:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy(sctl, &follower->follower, sizeof(*sctl));
                   ^~~~~~
   sound/core/vmaster.c:366:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(sctl->vd, follower->follower.vd,
                   ^~~~~~
   sound/core/vmaster.c:366:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy(sctl->vd, follower->follower.vd,
                   ^~~~~~
   sound/core/vmaster.c:399:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&knew, 0, sizeof(knew));
           ^~~~~~
   sound/core/vmaster.c:399:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(&knew, 0, sizeof(knew));
           ^~~~~~
   sound/core/vmaster.c:427:4: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(master->tlv, tlv, sizeof(master->tlv));
                           ^~~~~~
   sound/core/vmaster.c:427:4: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                           memcpy(master->tlv, tlv, sizeof(master->tlv));
                           ^~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   sound/firewire/dice/dice-hwdep.c:30:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&event, 0, sizeof(event));
           ^~~~~~
   sound/firewire/dice/dice-hwdep.c:30:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(&event, 0, sizeof(event));
           ^~~~~~
   sound/firewire/dice/dice-hwdep.c:77:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&info, 0, sizeof(info));
           ^~~~~~
   sound/firewire/dice/dice-hwdep.c:77:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(&info, 0, sizeof(info));
           ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/memstick/core/ms_block.c:227:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&card->current_mrq, 0, sizeof(card->current_mrq));
           ^~~~~~
   drivers/memstick/core/ms_block.c:227:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(&card->current_mrq, 0, sizeof(card->current_mrq));
           ^~~~~~
   drivers/memstick/core/ms_block.c:885:4: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(miter.addr + offset, 0xFF, chunklen);
                           ^~~~~~
   drivers/memstick/core/ms_block.c:885:4: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
                           memset(miter.addr + offset, 0xFF, chunklen);
                           ^~~~~~
   drivers/memstick/core/ms_block.c:897:4: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(extra, 0xFF, sizeof(*extra));
                           ^~~~~~
   drivers/memstick/core/ms_block.c:897:4: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
                           memset(extra, 0xFF, sizeof(*extra));
                           ^~~~~~
   drivers/memstick/core/ms_block.c:1361:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(msb->lba_to_pba_table, MS_BLOCK_INVALID,
           ^~~~~~
   drivers/memstick/core/ms_block.c:1361:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(msb->lba_to_pba_table, MS_BLOCK_INVALID,
           ^~~~~~
   drivers/memstick/core/ms_block.c:1397:3: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&extra, 0, sizeof(extra));
--
   drivers/hid/hid-ft260.c:1025:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&dev->read_buf[dev->read_idx], &xfer->data,
                   ^~~~~~
   drivers/hid/hid-ft260.c:1025:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&dev->read_buf[dev->read_idx], &xfer->data,
                   ^~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   sound/firewire/dice/dice.c:66:40: warning: The result of the left shift =
is undefined because the left operand is negative [clang-analyzer-core.Unde=
finedBinaryOperatorResult]
           if (device->config_rom[3] !=3D ((vendor << 8) | category) ||
                                                 ^
   sound/firewire/dice/dice.c:150:6: note: Assuming field 'driver_data' is 0
           if (!entry->driver_data && entry->vendor_id !=3D OUI_SSL) {
               ^~~~~~~~~~~~~~~~~~~
   sound/firewire/dice/dice.c:150:6: note: Left side of '&&' is true
   sound/firewire/dice/dice.c:150:29: note: Assuming field 'vendor_id' is n=
ot equal to OUI_SSL
           if (!entry->driver_data && entry->vendor_id !=3D OUI_SSL) {
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/dice/dice.c:150:2: note: Taking true branch
           if (!entry->driver_data && entry->vendor_id !=3D OUI_SSL) {
           ^
   sound/firewire/dice/dice.c:151:9: note: Calling 'check_dice_category'
                   err =3D check_dice_category(unit);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/dice/dice.c:37:16: note: 'vendor' initialized to -1
           int key, val, vendor =3D -1, model =3D -1;
                         ^~~~~~
   sound/firewire/dice/dice.c:47:2: note: Loop condition is false. Executio=
n continues on line 58
           while (fw_csr_iterator_next(&it, &key, &val)) {
           ^
   sound/firewire/dice/dice.c:58:6: note: 'vendor' is not equal to OUI_WEISS
           if (vendor =3D=3D OUI_WEISS)
               ^~~~~~
   sound/firewire/dice/dice.c:58:2: note: Taking false branch
           if (vendor =3D=3D OUI_WEISS)
           ^
   sound/firewire/dice/dice.c:60:11: note: 'vendor' is not equal to OUI_LOUD
           else if (vendor =3D=3D OUI_LOUD)
                    ^~~~~~
   sound/firewire/dice/dice.c:60:7: note: Taking false branch
           else if (vendor =3D=3D OUI_LOUD)
                ^
   sound/firewire/dice/dice.c:62:11: note: 'vendor' is not equal to OUI_HAR=
MAN
           else if (vendor =3D=3D OUI_HARMAN)
                    ^~~~~~
   sound/firewire/dice/dice.c:62:7: note: Taking false branch
           else if (vendor =3D=3D OUI_HARMAN)
                ^
   sound/firewire/dice/dice.c:66:40: note: The result of the left shift is =
undefined because the left operand is negative
           if (device->config_rom[3] !=3D ((vendor << 8) | category) ||
                                          ~~~~~~ ^
   sound/firewire/dice/dice.c:124:2: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(card->longname, sizeof(card->longname),
           ^~~~~~~~
   sound/firewire/dice/dice.c:124:2: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
           snprintf(card->longname, sizeof(card->longname),
           ^~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   sound/firewire/fireworks/fireworks_midi.c:87:3: warning: Call to functio=
n 'snprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'snprintf_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(subs->name, sizeof(subs->name),
                   ^~~~~~~~
   sound/firewire/fireworks/fireworks_midi.c:87:3: note: Call to function '=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(subs->name, sizeof(subs->name),
                   ^~~~~~~~
   sound/firewire/fireworks/fireworks_midi.c:115:2: warning: Call to functi=
on 'snprintf' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'snprintf_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(rmidi->name, sizeof(rmidi->name),
           ^~~~~~~~
   sound/firewire/fireworks/fireworks_midi.c:115:2: note: Call to function =
'snprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(rmidi->name, sizeof(rmidi->name),
           ^~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   sound/firewire/fireworks/fireworks_pcm.c:400:2: warning: Call to functio=
n 'snprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'snprintf_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(pcm->name, sizeof(pcm->name), "%s PCM", efw->card->shor=
tname);
           ^~~~~~~~
   sound/firewire/fireworks/fireworks_pcm.c:400:2: note: Call to function '=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(pcm->name, sizeof(pcm->name), "%s PCM", efw->card->shor=
tname);
           ^~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   sound/firewire/fireworks/fireworks_hwdep.c:211:2: warning: Call to funct=
ion 'memset' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memset_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&info, 0, sizeof(info));
           ^~~~~~
   sound/firewire/fireworks/fireworks_hwdep.c:211:2: note: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11
           memset(&info, 0, sizeof(info));
           ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   sound/firewire/fireworks/fireworks.c:88:2: warning: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(version, sizeof(version), "%u.%u",
           ^~~~~~~~
   sound/firewire/fireworks/fireworks.c:88:2: note: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(version, sizeof(version), "%u.%u",
           ^~~~~~~~
>> sound/firewire/fireworks/fireworks.c:94:2: warning: Call to function 'st=
rcpy' is insecure as it does not provide bounding of the memory buffer. Rep=
lace unbounded copy functions with analogous functions that support length =
arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.s=
trcpy]
           strcpy(efw->card->shortname, hwinfo->model_name);
           ^~~~~~
   sound/firewire/fireworks/fireworks.c:94:2: note: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119
           strcpy(efw->card->shortname, hwinfo->model_name);
           ^~~~~~
   sound/firewire/fireworks/fireworks.c:95:2: warning: Call to function 'st=
rcpy' is insecure as it does not provide bounding of the memory buffer. Rep=
lace unbounded copy functions with analogous functions that support length =
arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.s=
trcpy]
           strcpy(efw->card->mixername, hwinfo->model_name);
           ^~~~~~
   sound/firewire/fireworks/fireworks.c:95:2: note: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119
           strcpy(efw->card->mixername, hwinfo->model_name);
           ^~~~~~
   sound/firewire/fireworks/fireworks.c:96:2: warning: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(efw->card->longname, sizeof(efw->card->longname),
           ^~~~~~~~
   sound/firewire/fireworks/fireworks.c:96:2: note: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(efw->card->longname, sizeof(efw->card->longname),
           ^~~~~~~~
   sound/firewire/fireworks/fireworks.c:166:2: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&efw->phys_in_grps, hwinfo->phys_in_grps,
           ^~~~~~
   sound/firewire/fireworks/fireworks.c:166:2: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&efw->phys_in_grps, hwinfo->phys_in_grps,
           ^~~~~~
   sound/firewire/fireworks/fireworks.c:168:2: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&efw->phys_out_grps, hwinfo->phys_out_grps,
           ^~~~~~
   sound/firewire/fireworks/fireworks.c:168:2: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&efw->phys_out_grps, hwinfo->phys_out_grps,
           ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   include/linux/hid.h:1056:9: warning: Access to field 'name' results in a=
 dereference of a null pointer (loaded from variable 'input') [clang-analyz=
er-core.NullDereference]
                                       input->name, c, type);
                                       ^
   drivers/hid/hid-gfrm.c:33:6: note: Assuming 'hdev_type' is equal to GFRM=
100
           if (hdev_type =3D=3D GFRM100) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-gfrm.c:33:2: note: Taking true branch
           if (hdev_type =3D=3D GFRM100) {
           ^
   drivers/hid/hid-gfrm.c:34:7: note: Assuming the condition is true
                   if (usage->hid =3D=3D (HID_UP_CONSUMER | 0x4)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-gfrm.c:34:3: note: Taking true branch
                   if (usage->hid =3D=3D (HID_UP_CONSUMER | 0x4)) {
                   ^
   drivers/hid/hid-gfrm.c:36:4: note: Calling 'hid_map_usage_clear'
                           hid_map_usage_clear(hi, usage, bit, max, EV_KEY,=
 KEY_INFO);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
   include/linux/hid.h:1084:2: note: Calling 'hid_map_usage'
           hid_map_usage(hidinput, usage, bit, max, type, c);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1027:2: note: 'input' initialized here
           struct input_dev *input =3D hidinput->input;
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1031:2: note: Control jumps to 'case 1:'  at line 10=
40
           switch (type) {
           ^
   include/linux/hid.h:1043:3: note:  Execution continues on line 1054
                   break;
                   ^
   include/linux/hid.h:1054:15: note: 'c' is <=3D 'limit'
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1054:15: note: Left side of '||' is false
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/hid.h:1054:28: note: Assuming 'bmap' is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1054:28: note: Assuming pointer value is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1054:2: note: Taking true branch
           if (unlikely(c > limit || !bmap)) {
           ^
   include/linux/hid.h:1055:3: note: Assuming the condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:685:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:668:6: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
               ^~~~~~~~~~~~~~~~~
   include/linux/ratelimit_types.h:41:28: note: expanded from macro '__rate=
limit'
   #define __ratelimit(state) ___ratelimit(state, __func__)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1055:3: note: Taking true branch
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:685:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:668:2: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
           ^
   include/linux/hid.h:1055:3: note: Loop condition is false.  Exiting loop
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:685:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:669:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
                   ^
   include/linux/printk.h:475:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:446:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:421:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   include/linux/hid.h:1056:9: note: Access to field 'name' results in a de=
reference of a null pointer (loaded from variable 'input')
                                       input->name, c, type);
                                       ^
   include/linux/printk.h:685:49: note: expanded from macro 'pr_warn_rateli=
mited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                                          ^~~~~~~~~~~
   include/linux/printk.h:669:17: note: expanded from macro 'printk_ratelim=
ited'
                   printk(fmt, ##__VA_ARGS__);                             \
                                 ^~~~~~~~~~~
   include/linux/printk.h:475:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:447:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   drivers/memstick/core/mspro_block.c:407:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(name, x_spfile->name, 8);
           ^~~~~~
   drivers/memstick/core/mspro_block.c:407:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(name, x_spfile->name, 8);
           ^~~~~~
   drivers/memstick/core/mspro_block.c:409:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ext, x_spfile->ext, 3);
           ^~~~~~
   drivers/memstick/core/mspro_block.c:409:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(ext, x_spfile->ext, 3);
           ^~~~~~
   drivers/memstick/core/mspro_block.c:1008:4: warning: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(s_attr->name, sizeof(s_attr->name), "%s=
",
                           ^~~~~~~~
   drivers/memstick/core/mspro_block.c:1008:4: note: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11
                           snprintf(s_attr->name, sizeof(s_attr->name), "%s=
",
                           ^~~~~~~~
   drivers/memstick/core/mspro_block.c:1011:4: warning: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(s_attr->name, sizeof(s_attr->name),
                           ^~~~~~~~
   drivers/memstick/core/mspro_block.c:1011:4: note: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11
                           snprintf(s_attr->name, sizeof(s_attr->name),
                           ^~~~~~~~
   drivers/memstick/core/mspro_block.c:1031:4: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(s_attr->data, buffer + addr % msb->page_s=
ize,
                           ^~~~~~
   drivers/memstick/core/mspro_block.c:1031:4: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(s_attr->data, buffer + addr % msb->page_s=
ize,
                           ^~~~~~
   drivers/memstick/core/mspro_block.c:1067:3: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(s_attr->data, buffer + addr % msb->page_size,
                   ^~~~~~
   drivers/memstick/core/mspro_block.c:1067:3: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(s_attr->data, buffer + addr % msb->page_size,
                   ^~~~~~
   drivers/memstick/core/mspro_block.c:1192:2: warning: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(msb->disk->disk_name, "mspblk%d", disk_id);
           ^~~~~~~
   drivers/memstick/core/mspro_block.c:1192:2: note: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11
           sprintf(msb->disk->disk_name, "mspblk%d", disk_id);
           ^~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
>> sound/usb/line6/midi.c:229:2: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(rmidi->id, line6->properties->id);
           ^~~~~~
   sound/usb/line6/midi.c:229:2: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
           strcpy(rmidi->id, line6->properties->id);
           ^~~~~~
   sound/usb/line6/midi.c:230:2: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(rmidi->name, line6->properties->name);
           ^~~~~~
   sound/usb/line6/midi.c:230:2: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
           strcpy(rmidi->name, line6->properties->name);
           ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   sound/usb/line6/midibuf.c:110:4: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(this->buf + this->pos_write, data, length=
);
                           ^~~~~~
   sound/usb/line6/midibuf.c:110:4: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                           memcpy(this->buf + this->pos_write, data, length=
);
                           ^~~~~~
   sound/usb/line6/midibuf.c:115:4: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(this->buf + this->pos_write, data, length=
1);
                           ^~~~~~
   sound/usb/line6/midibuf.c:115:4: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                           memcpy(this->buf + this->pos_write, data, length=
1);
                           ^~~~~~
   sound/usb/line6/midibuf.c:116:4: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(this->buf, data + length1, length2);
                           ^~~~~~
   sound/usb/line6/midibuf.c:116:4: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                           memcpy(this->buf, data + length1, length2);
                           ^~~~~~
   sound/usb/line6/midibuf.c:215:3: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data + repeat, this->buf + this->pos_read, length=
);
                   ^~~~~~
   sound/usb/line6/midibuf.c:215:3: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                   memcpy(data + repeat, this->buf + this->pos_read, length=
);
                   ^~~~~~
   sound/usb/line6/midibuf.c:220:3: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data + repeat, this->buf + this->pos_read, length=
1);
                   ^~~~~~
   sound/usb/line6/midibuf.c:220:3: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                   memcpy(data + repeat, this->buf + this->pos_read, length=
1);
                   ^~~~~~
   sound/usb/line6/midibuf.c:221:3: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data + repeat + length1, this->buf, length2);
                   ^~~~~~
   sound/usb/line6/midibuf.c:221:3: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                   memcpy(data + repeat + length1, this->buf, length2);
                   ^~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/comedi/drivers/amplc_pci230.c:1475:24: warning: Division by zero=
 [clang-analyzer-core.DivideZero]
           if (cmd->chanlist_len % subseq_len) {
               ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   drivers/comedi/drivers/amplc_pci230.c:1414:14: note: Assuming 'i' is >=
=3D field 'chanlist_len'
           for (i =3D 0; i < cmd->chanlist_len; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/drivers/amplc_pci230.c:1414:2: note: Loop condition is fa=
lse. Execution continues on line 1472
           for (i =3D 0; i < cmd->chanlist_len; i++) {
           ^
   drivers/comedi/drivers/amplc_pci230.c:1472:6: note: 'subseq_len' is equa=
l to 0
           if (subseq_len =3D=3D 0)
               ^~~~~~~~~~
   drivers/comedi/drivers/amplc_pci230.c:1472:2: note: Taking true branch
           if (subseq_len =3D=3D 0)
           ^
   drivers/comedi/drivers/amplc_pci230.c:1473:3: note: The value 0 is assig=
ned to 'subseq_len'
                   subseq_len =3D cmd->chanlist_len;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/drivers/amplc_pci230.c:1475:24: note: Division by zero
           if (cmd->chanlist_len % subseq_len) {
               ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:815:3: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buff, BUFF_SZ, "\tUsed splash space: %d\n",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:815:3: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buff, BUFF_SZ, "\tUsed splash space: %d\n",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:820:3: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buff, BUFF_SZ, "report %s (%d, size=3D%d)\n",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:820:3: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buff, BUFF_SZ, "report %s (%d, size=3D%d)\n",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:823:3: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buff, BUFF_SZ, "\tFirmware version: %d.%d\n",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:823:3: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buff, BUFF_SZ, "\tFirmware version: %d.%d\n",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:828:3: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buff, BUFF_SZ, "report %s (%d, size=3D%d)\n",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:828:3: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buff, BUFF_SZ, "report %s (%d, size=3D%d)\n",
                   ^~~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   fs/f2fs/checkpoint.c:501:3: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(e, 0, sizeof(struct ino_entry));
                   ^~~~~~
   fs/f2fs/checkpoint.c:501:3: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                   memset(e, 0, sizeof(struct ino_entry));
                   ^~~~~~
   fs/f2fs/checkpoint.c:789:4: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(orphan_blk, 0, sizeof(*orphan_blk));
                           ^~~~~~
   fs/f2fs/checkpoint.c:789:4: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                           memset(orphan_blk, 0, sizeof(*orphan_blk));
                           ^~~~~~
   fs/f2fs/checkpoint.c:952:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(sbi->ckpt, cp_block, blk_size);
           ^~~~~~
   fs/f2fs/checkpoint.c:952:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(sbi->ckpt, cp_block, blk_size);
           ^~~~~~
   fs/f2fs/checkpoint.c:982:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ckpt + i * blk_size, sit_bitmap_ptr, blk_size);
                   ^~~~~~
   fs/f2fs/checkpoint.c:982:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy(ckpt + i * blk_size, sit_bitmap_ptr, blk_size);
                   ^~~~~~
   fs/f2fs/checkpoint.c:1395:2: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(page_address(page), src, PAGE_SIZE);
           ^~~~~~
   fs/f2fs/checkpoint.c:1395:2: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
           memcpy(page_address(page), src, PAGE_SIZE);
           ^~~~~~
   fs/f2fs/checkpoint.c:1825:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(req, 0, sizeof(struct ckpt_req));
           ^~~~~~
   fs/f2fs/checkpoint.c:1825:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(req, 0, sizeof(struct ckpt_req));
           ^~~~~~
   Suppressed 59 warnings (59 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   sound/firewire/dice/dice-tcelectronic.c:93:2: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dice->tx_pcm_chs, entry->spec->tx_pcm_chs,
           ^~~~~~
   sound/firewire/dice/dice-tcelectronic.c:93:2: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(dice->tx_pcm_chs, entry->spec->tx_pcm_chs,
           ^~~~~~
   sound/firewire/dice/dice-tcelectronic.c:95:2: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dice->rx_pcm_chs, entry->spec->rx_pcm_chs,
           ^~~~~~
   sound/firewire/dice/dice-tcelectronic.c:95:2: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(dice->rx_pcm_chs, entry->spec->rx_pcm_chs,
           ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   sound/firewire/dice/dice-alesis.c:36:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dice->tx_pcm_chs, alesis_io14_tx_pcm_chs,
                   ^~~~~~
   sound/firewire/dice/dice-alesis.c:36:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dice->tx_pcm_chs, alesis_io14_tx_pcm_chs,
                   ^~~~~~
   sound/firewire/dice/dice-alesis.c:40:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dice->tx_pcm_chs, alesis_io26_tx_pcm_chs,
                   ^~~~~~
   sound/firewire/dice/dice-alesis.c:40:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dice->tx_pcm_chs, alesis_io26_tx_pcm_chs,
                   ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
>> sound/firewire/motu/motu-pcm.c:363:2: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(pcm->name, motu->card->shortname);
           ^~~~~~
   sound/firewire/motu/motu-pcm.c:363:2: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
           strcpy(pcm->name, motu->card->shortname);
           ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   sound/firewire/motu/motu-midi.c:91:3: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(subs->name, sizeof(subs->name),
                   ^~~~~~~~
   sound/firewire/motu/motu-midi.c:91:3: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(subs->name, sizeof(subs->name),
                   ^~~~~~~~
   sound/firewire/motu/motu-midi.c:117:2: warning: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(rmidi->name, sizeof(rmidi->name),
           ^~~~~~~~
   sound/firewire/motu/motu-midi.c:117:2: note: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(rmidi->name, sizeof(rmidi->name),
           ^~~~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   sound/core/seq/seq_timer.c:270:2: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(str, "sequencer queue %i", q->queue);
           ^~~~~~~
   sound/core/seq/seq_timer.c:270:2: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           sprintf(str, "sequencer queue %i", q->queue);
           ^~~~~~~
   sound/core/seq/seq_timer.c:286:4: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&tid, 0, sizeof(tid));
                           ^~~~~~
   sound/core/seq/seq_timer.c:286:4: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
                           memset(&tid, 0, sizeof(tid));
                           ^~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   sound/core/seq/seq_system.c:60:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ev, 0, sizeof(struct snd_seq_event));
           ^~~~~~
   sound/core/seq/seq_system.c:60:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(ev, 0, sizeof(struct snd_seq_event));
           ^~~~~~
   sound/core/seq/seq_system.c:117:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&pcallbacks, 0, sizeof(pcallbacks));
           ^~~~~~
   sound/core/seq/seq_system.c:117:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&pcallbacks, 0, sizeof(pcallbacks));
           ^~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   fs/udf/file.c:53:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(kaddr, iinfo->i_data + iinfo->i_lenEAttr, isize);
           ^~~~~~
   fs/udf/file.c:53:2: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
           memcpy(kaddr, iinfo->i_data + iinfo->i_lenEAttr, isize);
           ^~~~~~
   fs/udf/file.c:54:2: warning: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memset(kaddr + isize, 0, PAGE_SIZE - isize);
           ^~~~~~
   fs/udf/file.c:54:2: note: Call to function 'memset' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memset_s' in case of C11
           memset(kaddr + isize, 0, PAGE_SIZE - isize);
           ^~~~~~
   fs/udf/file.c:79:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(iinfo->i_data + iinfo->i_lenEAttr, kaddr, i_size_read(ino=
de));
           ^~~~~~
   fs/udf/file.c:79:2: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
           memcpy(iinfo->i_data + iinfo->i_lenEAttr, kaddr, i_size_read(ino=
de));
           ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   76 warnings generated.
   fs/udf/inode.c:103:3: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(pos, &iinfo->cached_extent.epos,
                   ^~~~~~
   fs/udf/inode.c:103:3: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
                   memcpy(pos, &iinfo->cached_extent.epos,
                   ^~~~~~
   fs/udf/inode.c:124:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&iinfo->cached_extent.epos, pos, sizeof(*pos));
           ^~~~~~
   fs/udf/inode.c:124:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(&iinfo->cached_extent.epos, pos, sizeof(*pos));
           ^~~~~~
   fs/udf/inode.c:287:3: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(kaddr + iinfo->i_lenAlloc, 0x00,
                   ^~~~~~
   fs/udf/inode.c:287:3: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
                   memset(kaddr + iinfo->i_lenAlloc, 0x00,
                   ^~~~~~
   fs/udf/inode.c:289:3: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(kaddr, iinfo->i_data + iinfo->i_lenEAttr,
                   ^~~~~~
   fs/udf/inode.c:289:3: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
                   memcpy(kaddr, iinfo->i_data + iinfo->i_lenEAttr,
--
               ^~~~
   drivers/mtd/chips/cfi_util.c:307:2: note: Taking false branch
           if (!adr)
           ^
   drivers/mtd/chips/cfi_util.c:310:2: note: Loop condition is false.  Exit=
ing loop
           printk(KERN_INFO "%s Extended Query Table at 0x%4.4X\n", name, a=
dr);
           ^
   include/linux/printk.h:475:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:446:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:421:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/mtd/chips/cfi_util.c:313:6: note: Assuming 'extp' is non-null
           if (!extp)
               ^~~~~
   drivers/mtd/chips/cfi_util.c:313:2: note: Taking false branch
           if (!extp)
           ^
   drivers/mtd/chips/cfi_util.c:321:2: note: Calling 'cfi_qry_mode_on'
           cfi_qry_mode_on(base, map, cfi);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/chips/cfi_util.c:251:2: note: Calling 'cfi_send_gen_cmd'
           cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL=
);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/chips/cfi_util.c:209:8: note: Calling 'cfi_build_cmd'
           val =3D cfi_build_cmd(cmd, map, cfi);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/chips/cfi_util.c:78:6: note: Assuming the condition is false
           if (map_bankwidth_is_large(map)) {
               ^
   include/linux/mtd/map.h:115:39: note: expanded from macro 'map_bankwidth=
_is_large'
   # define map_bankwidth_is_large(map) (map_bankwidth(map) > BITS_PER_LONG=
/8)
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/mtd/map.h:113:29: note: expanded from macro 'map_bankwidth'
   # define map_bankwidth(map) ((map)->bankwidth)
                               ^
   drivers/mtd/chips/cfi_util.c:78:2: note: Taking false branch
           if (map_bankwidth_is_large(map)) {
           ^
   drivers/mtd/chips/cfi_util.c:91:2: note: Control jumps to 'case 4:'  at =
line 99
           switch (chip_mode) {
           ^
   drivers/mtd/chips/cfi_util.c:100:12: note: '?' condition is true
                   onecmd =3D cpu_to_cfi32(map, cmd);
                            ^
   include/linux/mtd/cfi_endian.h:30:30: note: expanded from macro 'cpu_to_=
cfi32'
   #define cpu_to_cfi32(map, x) _cpu_to_cfi(32, (map)->swap, (x))
                                ^
   include/linux/mtd/cfi_endian.h:36:31: note: expanded from macro '_cpu_to=
_cfi'
   #define _cpu_to_cfi(w, s, x) (cfi_host(s)?(x):_swap_to_cfi(w, s, x))
                                 ^
   include/linux/mtd/cfi_endian.h:25:22: note: expanded from macro 'cfi_hos=
t'
   #define cfi_host(s) (cfi_default(s) =3D=3D CFI_HOST_ENDIAN)
                        ^
   include/linux/mtd/cfi_endian.h:22:25: note: expanded from macro 'cfi_def=
ault'
   #define cfi_default(s) ((s)?:CFI_DEFAULT_ENDIAN)
                           ^
   drivers/mtd/chips/cfi_util.c:100:12: note: Assuming the condition is true
                   onecmd =3D cpu_to_cfi32(map, cmd);
                            ^
   include/linux/mtd/cfi_endian.h:30:30: note: expanded from macro 'cpu_to_=
cfi32'
   #define cpu_to_cfi32(map, x) _cpu_to_cfi(32, (map)->swap, (x))
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/cfi_endian.h:36:31: note: expanded from macro '_cpu_to=
_cfi'
   #define _cpu_to_cfi(w, s, x) (cfi_host(s)?(x):_swap_to_cfi(w, s, x))
                                 ^~~~~~~~~~~
   include/linux/mtd/cfi_endian.h:25:22: note: expanded from macro 'cfi_hos=
t'
   #define cfi_host(s) (cfi_default(s) =3D=3D CFI_HOST_ENDIAN)
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mtd/cfi_endian.h:22:24: note: expanded from macro 'cfi_def=
ault'
   #define cfi_default(s) ((s)?:CFI_DEFAULT_ENDIAN)
                          ^
   drivers/mtd/chips/cfi_util.c:100:12: note: '?' condition is true
                   onecmd =3D cpu_to_cfi32(map, cmd);
                            ^
   include/linux/mtd/cfi_endian.h:30:30: note: expanded from macro 'cpu_to_=
cfi32'
   #define cpu_to_cfi32(map, x) _cpu_to_cfi(32, (map)->swap, (x))
                                ^
   include/linux/mtd/cfi_endian.h:36:31: note: expanded from macro '_cpu_to=
_cfi'
   #define _cpu_to_cfi(w, s, x) (cfi_host(s)?(x):_swap_to_cfi(w, s, x))
                                 ^
   include/linux/mtd/cfi_endian.h:25:21: note: expanded from macro 'cfi_hos=
t'
   #define cfi_host(s) (cfi_default(s) =3D=3D CFI_HOST_ENDIAN)
                       ^
   drivers/mtd/chips/cfi_util.c:101:3: note:  Execution continues on line 1=
06
                   break;
                   ^
   drivers/mtd/chips/cfi_util.c:106:2: note: Control jumps to 'case 2:'  at=
 line 116
           switch (chips_per_word) {
           ^
   drivers/mtd/chips/cfi_util.c:117:21: note: The result of the left shift =
is undefined due to shifting by '32', which is greater or equal to the widt=
h of type 'unsigned long'
                   onecmd |=3D (onecmd << (chip_mode * 8));
                                     ^  ~~~~~~~~~~~~~~~
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
>> sound/usb/line6/pcm.c:489:2: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(pcm->name, line6->properties->name);
           ^~~~~~
   sound/usb/line6/pcm.c:489:2: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
           strcpy(pcm->name, line6->properties->name);
           ^~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   sound/usb/line6/playback.c:218:5: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(urb_out->transfer_buffer,
                                   ^~~~~~
   sound/usb/line6/playback.c:218:5: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(urb_out->transfer_buffer,
                                   ^~~~~~
   sound/usb/line6/playback.c:222:5: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(urb_out->transfer_buffer +
                                   ^~~~~~
   sound/usb/line6/playback.c:222:5: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(urb_out->transfer_buffer +
                                   ^~~~~~
   sound/usb/line6/playback.c:229:4: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(urb_out->transfer_buffer,
                           ^~~~~~
   sound/usb/line6/playback.c:229:4: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                           memcpy(urb_out->transfer_buffer,
                           ^~~~~~
   sound/usb/line6/playback.c:242:3: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(urb_out->transfer_buffer, 0,
                   ^~~~~~
   sound/usb/line6/playback.c:242:3: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
                   memset(urb_out->transfer_buffer, 0,
                   ^~~~~~
   sound/usb/line6/playback.c:314:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(urb->transfer_buffer, 0, urb->transfer_buffer_length);
           ^~~~~~
   sound/usb/line6/playback.c:314:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(urb->transfer_buffer, 0, urb->transfer_buffer_length);
           ^~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   drivers/hid/hid-playstation.c:835:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ds->base.mac_address, &buf[1], sizeof(ds->base.mac_addres=
s));
           ^~~~~~
   drivers/hid/hid-playstation.c:835:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(ds->base.mac_address, &buf[1], sizeof(ds->base.mac_addres=
s));
           ^~~~~~
   drivers/hid/hid-playstation.c:897:3: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(bt, 0, sizeof(*bt));
                   ^~~~~~
   drivers/hid/hid-playstation.c:897:3: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
                   memset(bt, 0, sizeof(*bt));
                   ^~~~~~
   drivers/hid/hid-playstation.c:917:3: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(usb, 0, sizeof(*usb));
                   ^~~~~~
   drivers/hid/hid-playstation.c:917:3: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
                   memset(usb, 0, sizeof(*usb));
                   ^~~~~~
   drivers/hid/hid-playstation.c:1318:2: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(hdev->uniq, sizeof(hdev->uniq), "%pMR", ds->base.mac_ad=
dress);
           ^~~~~~~~
   drivers/hid/hid-playstation.c:1318:2: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
           snprintf(hdev->uniq, sizeof(hdev->uniq), "%pMR", ds->base.mac_ad=
dress);
           ^~~~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   include/linux/hid.h:1056:9: warning: Access to field 'name' results in a=
 dereference of a null pointer (loaded from variable 'input') [clang-analyz=
er-core.NullDereference]
                                       input->name, c, type);
                                       ^
   drivers/hid/hid-razer.c:49:6: note: Assuming 'macro_key_remapping' is tr=
ue
           if (!macro_key_remapping)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-razer.c:49:2: note: Taking false branch
           if (!macro_key_remapping)
           ^
   drivers/hid/hid-razer.c:52:6: note: Assuming the condition is false
           if ((usage->hid & HID_UP_KEYBOARD) !=3D HID_UP_KEYBOARD)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-razer.c:52:2: note: Taking false branch
           if ((usage->hid & HID_UP_KEYBOARD) !=3D HID_UP_KEYBOARD)
           ^
   drivers/hid/hid-razer.c:55:2: note: Control jumps to 'case 108:'  at lin=
e 68
           switch (usage->hid & ~HID_UP_KEYBOARD) {
           ^
   drivers/hid/hid-razer.c:69:3: note: Calling 'hid_map_usage_clear'
                   map_key_clear(KEY_MACRO5);
                   ^
   drivers/hid/hid-razer.c:19:26: note: expanded from macro 'map_key_clear'
   #define map_key_clear(c) hid_map_usage_clear(hi, usage, bit, max, EV_KEY=
, (c))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   include/linux/hid.h:1084:2: note: Calling 'hid_map_usage'
           hid_map_usage(hidinput, usage, bit, max, type, c);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1027:2: note: 'input' initialized here
           struct input_dev *input =3D hidinput->input;
--
           ^
   drivers/edac/edac_mc.c:1082:14: note: The left operand of '<' is a garba=
ge value due to array index out of bounds
                   if (pos[i] < 0)
                       ~~~~~~ ^
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/md/dm-clone-metadata.c:304:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(sb->uuid, 0, sizeof(sb->uuid));
           ^~~~~~
   drivers/md/dm-clone-metadata.c:304:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(sb->uuid, 0, sizeof(sb->uuid));
           ^~~~~~
   drivers/md/dm-clone-metadata.c:310:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&sb->metadata_space_map_root, &cmd->metadata_space_map_ro=
ot,
           ^~~~~~
   drivers/md/dm-clone-metadata.c:310:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&sb->metadata_space_map_root, &cmd->metadata_space_map_ro=
ot,
           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/md/dm-log-writes.c:235:2: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ptr, entry, entrylen);
           ^~~~~~
   drivers/md/dm-log-writes.c:235:2: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(ptr, entry, entrylen);
           ^~~~~~
   drivers/md/dm-log-writes.c:237:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ptr + entrylen, data, datalen);
                   ^~~~~~
   drivers/md/dm-log-writes.c:237:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(ptr + entrylen, data, datalen);
                   ^~~~~~
   drivers/md/dm-log-writes.c:238:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ptr + entrylen + datalen, 0,
           ^~~~~~
   drivers/md/dm-log-writes.c:238:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(ptr + entrylen + datalen, 0,
           ^~~~~~
   drivers/md/dm-log-writes.c:290:4: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(ptr, data, pg_datalen);
                           ^~~~~~
   drivers/md/dm-log-writes.c:290:4: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                           memcpy(ptr, data, pg_datalen);
                           ^~~~~~
   drivers/md/dm-log-writes.c:292:5: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(ptr + pg_datalen, 0, pg_sectorlen=
 - pg_datalen);
                                   ^~~~~~
   drivers/md/dm-log-writes.c:292:5: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
                                   memset(ptr + pg_datalen, 0, pg_sectorlen=
 - pg_datalen);
                                   ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   sound/core/seq/oss/seq_oss_synth.c:208:2: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(dp->synths, 0, sizeof(dp->synths));
           ^~~~~~
   sound/core/seq/oss/seq_oss_synth.c:208:2: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
           memset(dp->synths, 0, sizeof(dp->synths));
           ^~~~~~
   sound/core/seq/oss/seq_oss_synth.c:426:3: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&ev, 0, sizeof(ev));
                   ^~~~~~
   sound/core/seq/oss/seq_oss_synth.c:426:3: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
                   memset(&ev, 0, sizeof(ev));
                   ^~~~~~
   sound/core/seq/oss/seq_oss_synth.c:597:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ev->data.raw8.d, data, 8);
           ^~~~~~
   sound/core/seq/oss/seq_oss_synth.c:597:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(ev->data.raw8.d, data, 8);
           ^~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   sound/core/seq/oss/seq_oss_midi.c:353:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&subs, 0, sizeof(subs));
           ^~~~~~
   sound/core/seq/oss/seq_oss_midi.c:353:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(&subs, 0, sizeof(subs));
           ^~~~~~
   sound/core/seq/oss/seq_oss_midi.c:399:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&subs, 0, sizeof(subs));
           ^~~~~~
   sound/core/seq/oss/seq_oss_midi.c:399:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(&subs, 0, sizeof(subs));
           ^~~~~~
   sound/core/seq/oss/seq_oss_midi.c:464:3: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&ev, 0, sizeof(ev));
                   ^~~~~~
   sound/core/seq/oss/seq_oss_midi.c:464:3: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
                   memset(&ev, 0, sizeof(ev));
                   ^~~~~~
   sound/core/seq/oss/seq_oss_midi.c:547:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ossev, 0, sizeof(ossev));
           ^~~~~~
   sound/core/seq/oss/seq_oss_midi.c:547:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(&ossev, 0, sizeof(ossev));
           ^~~~~~
>> sound/core/seq/oss/seq_oss_midi.c:611:3: warning: Value stored to 'len' =
is never read [clang-analyzer-deadcode.DeadStores]
                   len =3D snd_seq_oss_timer_start(dp->timer);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/seq/oss/seq_oss_midi.c:611:3: note: Value stored to 'len' is =
never read
                   len =3D snd_seq_oss_timer_start(dp->timer);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   sound/firewire/oxfw/oxfw-command.c:30:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf + 10, format, len);
           ^~~~~~
   sound/firewire/oxfw/oxfw-command.c:30:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf + 10, format, len);
           ^~~~~~
   sound/firewire/oxfw/oxfw-command.c:99:3: warning: Call to function 'memm=
ove' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memmove_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(buf, buf + 10, err - 10);
                   ^~~~~~~
   sound/firewire/oxfw/oxfw-command.c:99:3: note: Call to function 'memmove=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memmove_s' in case of C11
                   memmove(buf, buf + 10, err - 10);
                   ^~~~~~~
   sound/firewire/oxfw/oxfw-command.c:102:3: warning: Call to function 'mem=
move' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memmove_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(buf, buf + 11, err - 11);
                   ^~~~~~~
   sound/firewire/oxfw/oxfw-command.c:102:3: note: Call to function 'memmov=
e' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memmove_s' in case of C11
                   memmove(buf, buf + 11, err - 11);
                   ^~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   sound/firewire/oxfw/oxfw-stream.c:523:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(formation, 0, sizeof(struct snd_oxfw_stream_formation));
           ^~~~~~
   sound/firewire/oxfw/oxfw-stream.c:523:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(formation, 0, sizeof(struct snd_oxfw_stream_formation));
           ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   sound/usb/mixer.c:363:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0, sizeof(buf));
           ^~~~~~
   sound/usb/mixer.c:363:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(buf, 0, sizeof(buf));
           ^~~~~~
>> sound/usb/mixer.c:677:4: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(name, "Selector");
                           ^~~~~~
   sound/usb/mixer.c:677:4: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                           strcpy(name, "Selector");
                           ^~~~~~
   sound/usb/mixer.c:680:4: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(name, "Process Unit");
                           ^~~~~~
   sound/usb/mixer.c:680:4: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                           strcpy(name, "Process Unit");
                           ^~~~~~
   sound/usb/mixer.c:683:4: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(name, "Ext Unit");
                           ^~~~~~
   sound/usb/mixer.c:683:4: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                           strcpy(name, "Ext Unit");
                           ^~~~~~
   sound/usb/mixer.c:686:4: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(name, "Mixer");
                           ^~~~~~
   sound/usb/mixer.c:686:4: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                           strcpy(name, "Mixer");
                           ^~~~~~
   sound/usb/mixer.c:689:11: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                           return sprintf(name, "Unit %d", iterm->id);
                                  ^~~~~~~
   sound/usb/mixer.c:689:11: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                           return sprintf(name, "Unit %d", iterm->id);
                                  ^~~~~~~
   sound/usb/mixer.c:695:3: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name, "PCM");
                   ^~~~~~
   sound/usb/mixer.c:695:3: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                   strcpy(name, "PCM");
                   ^~~~~~
   sound/usb/mixer.c:698:3: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name, "Mic");
                   ^~~~~~
   sound/usb/mixer.c:698:3: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                   strcpy(name, "Mic");
                   ^~~~~~
   sound/usb/mixer.c:701:3: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name, "Headset");
                   ^~~~~~
   sound/usb/mixer.c:701:3: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                   strcpy(name, "Headset");
                   ^~~~~~
   sound/usb/mixer.c:704:3: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name, "Phone");
                   ^~~~~~
   sound/usb/mixer.c:704:3: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                   strcpy(name, "Phone");
                   ^~~~~~
   sound/usb/mixer.c:710:4: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(name, names->name);
                           ^~~~~~
   sound/usb/mixer.c:710:4: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                           strcpy(name, names->name);
                           ^~~~~~
   sound/usb/mixer.c:1032:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(term, 0, sizeof(*term));
           ^~~~~~
   sound/usb/mixer.c:1032:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(term, 0, sizeof(*term));
           ^~~~~~
   sound/usb/mixer.c:1033:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(state->termbitmap, 0, sizeof(state->termbitmap));
           ^~~~~~
   sound/usb/mixer.c:1033:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(state->termbitmap, 0, sizeof(state->termbitmap));
           ^~~~~~
   sound/usb/mixer.c:1746:5: warning: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   snprintf(kctl->id.name, sizeof(kctl->id.=
name),
                                   ^~~~~~~~
   sound/usb/mixer.c:1746:5: note: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11
                                   snprintf(kctl->id.name, sizeof(kctl->id.=
name),
                                   ^~~~~~~~
   sound/usb/mixer.c:1971:3: warning: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(kctl->id.name, sizeof(kctl->id.name),
                   ^~~~~~~~
   sound/usb/mixer.c:1971:3: note: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11
                   snprintf(kctl->id.name, sizeof(kctl->id.name),
                   ^~~~~~~~
   sound/usb/mixer.c:1974:3: warning: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(kctl->id.name, sizeof(kctl->id.name),
                   ^~~~~~~~
   sound/usb/mixer.c:1974:3: note: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11
                   snprintf(kctl->id.name, sizeof(kctl->id.name),
                   ^~~~~~~~
>> sound/usb/mixer.c:2172:16: warning: The left expression of the compound =
assignment is an uninitialized value. The computed value will also be garba=
ge [clang-analyzer-core.uninitialized.Assign]
                           cval->cmask |=3D (1 << i);
                                       ^
   sound/usb/mixer.c:3563:6: note: Assuming 'mixer' is non-null
           if (!mixer)
               ^~~~~~
   sound/usb/mixer.c:3563:2: note: Taking false branch
           if (!mixer)
           ^
   sound/usb/mixer.c:3566:29: note: Assuming the condition is false
           mixer->ignore_ctl_error =3D !!(chip->quirk_flags & QUIRK_FLAG_IG=
NORE_CTL_ERROR);
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
   sound/usb/mixer.c:3569:6: note: Assuming field 'id_elems' is non-null
           if (!mixer->id_elems) {
               ^~~~~~~~~~~~~~~~
   sound/usb/mixer.c:3569:2: note: Taking false branch
           if (!mixer->id_elems) {
           ^
   sound/usb/mixer.c:3575:2: note: Control jumps to the 'default' case at l=
ine 3577
           switch (get_iface_desc(mixer->hostif)->bInterfaceProtocol) {
           ^
   sound/usb/mixer.c:3579:3: note:  Execution continues on line 3588
                   break;
                   ^
   sound/usb/mixer.c:3588:13: note: Field 'protocol' is not equal to UAC_VE=
RSION_3
           if (mixer->protocol =3D=3D UAC_VERSION_3 &&
                      ^
   sound/usb/mixer.c:3588:39: note: Left side of '&&' is false
           if (mixer->protocol =3D=3D UAC_VERSION_3 &&
                                                ^
   sound/usb/mixer.c:3594:9: note: Calling 'snd_usb_mixer_controls'
                   err =3D snd_usb_mixer_controls(mixer);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:3223:2: note: Loop condition is false. Execution conti=
nues on line 3232
           for (map =3D usbmix_ctl_maps; map->id; map++) {
           ^
   sound/usb/mixer.c:3233:9: note: Assuming the condition is true
           while ((p =3D snd_usb_find_csint_desc(mixer->hostif->extra,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:3233:2: note: Loop condition is true.  Entering loop b=
ody
           while ((p =3D snd_usb_find_csint_desc(mixer->hostif->extra,
           ^
   sound/usb/mixer.c:3236:7: note: Assuming the condition is false
                   if (!snd_usb_validate_audio_desc(p, mixer->protocol))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:3236:3: note: Taking false branch
                   if (!snd_usb_validate_audio_desc(p, mixer->protocol))
                   ^
   sound/usb/mixer.c:3239:14: note: Field 'protocol' is equal to UAC_VERSIO=
N_1
                   if (mixer->protocol =3D=3D UAC_VERSION_1) {
                              ^
   sound/usb/mixer.c:3239:3: note: Taking true branch
                   if (mixer->protocol =3D=3D UAC_VERSION_1) {
                   ^
   sound/usb/mixer.c:3247:10: note: Calling 'parse_audio_unit'
                           err =3D parse_audio_unit(&state, desc->bSourceID=
);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:2867:6: note: Assuming the condition is false
           if (test_and_set_bit(unitid, state->unitbitmap))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:2867:2: note: Taking false branch
           if (test_and_set_bit(unitid, state->unitbitmap))
           ^
   sound/usb/mixer.c:2871:7: note: 'p1' is non-null
           if (!p1) {
                ^~
   sound/usb/mixer.c:2871:2: note: Taking false branch
           if (!p1) {
           ^
   sound/usb/mixer.c:2876:6: note: Assuming the condition is false
           if (!snd_usb_validate_audio_desc(p1, protocol)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:2876:2: note: Taking false branch
           if (!snd_usb_validate_audio_desc(p1, protocol)) {
           ^
   sound/usb/mixer.c:2881:2: note: Control jumps to 'case 4:'  at line 2886
           switch (PTYPE(protocol, p1[2])) {
           ^
   sound/usb/mixer.c:2889:10: note: Calling 'parse_audio_mixer_unit'
                   return parse_audio_mixer_unit(state, unitid, p1);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:2243:6: note: Assuming 'err' is >=3D 0
           if (err < 0) {
               ^~~~~~~
   sound/usb/mixer.c:2243:2: note: Taking false branch
           if (err < 0) {
           ^
   sound/usb/mixer.c:2255:16: note: Assuming 'pin' is < 'input_pins'
           for (pin =3D 0; pin < input_pins; pin++) {
                         ^~~~~~~~~~~~~~~~
   sound/usb/mixer.c:2255:2: note: Loop condition is true.  Entering loop b=
ody
           for (pin =3D 0; pin < input_pins; pin++) {
           ^
   sound/usb/mixer.c:2257:7: note: Assuming 'err' is >=3D 0
                   if (err < 0)
                       ^~~~~~~
   sound/usb/mixer.c:2257:3: note: Taking false branch
                   if (err < 0)
                   ^
   sound/usb/mixer.c:2260:7: note: Assuming 'num_outs' is not equal to 0
                   if (!num_outs)
                       ^~~~~~~~~
   sound/usb/mixer.c:2260:3: note: Taking false branch
                   if (!num_outs)
                   ^
   sound/usb/mixer.c:2263:7: note: Assuming 'err' is >=3D 0
                   if (err < 0)
                       ^~~~~~~
   sound/usb/mixer.c:2263:3: note: Taking false branch
                   if (err < 0)
                   ^
   sound/usb/mixer.c:2266:7: note: Assuming the condition is false
                   if (mixer_bitmap_overflow(desc, state->mixer->protocol,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:2266:3: note: Taking false branch
                   if (mixer_bitmap_overflow(desc, state->mixer->protocol,
                   ^
   sound/usb/mixer.c:2269:10: note: Assuming 'ich' is < 'num_ins'
                   for (; ich < num_ins; ich++) {
                          ^~~~~~~~~~~~~
   sound/usb/mixer.c:2269:3: note: Loop condition is true.  Entering loop b=
ody
                   for (; ich < num_ins; ich++) {
                   ^
   sound/usb/mixer.c:2272:18: note: 'och' is < 'num_outs'
                           for (och =3D 0; och < num_outs; och++) {
                                         ^~~
   sound/usb/mixer.c:2272:4: note: Loop condition is true.  Entering loop b=
ody
                           for (och =3D 0; och < num_outs; och++) {
                           ^
   sound/usb/mixer.c:2276:9: note: Assuming the condition is true
                                   if (check_matrix_bitmap(c, ich, och, num=
_outs)) {
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   sound/usb/mixer.c:2276:5: note: Taking true branch
                                   if (check_matrix_bitmap(c, ich, och, num=
_outs)) {
                                   ^
   sound/usb/mixer.c:2278:6: note:  Execution continues on line 2281
                                           break;
                                           ^
   sound/usb/mixer.c:2281:8: note: 'ich_has_controls' is 1
                           if (ich_has_controls)
                               ^~~~~~~~~~~~~~~~
   sound/usb/mixer.c:2281:4: note: Taking true branch
                           if (ich_has_controls)
                           ^
   sound/usb/mixer.c:2282:5: note: Calling 'build_mixer_unit_ctl'
                                   build_mixer_unit_ctl(state, desc, pin, i=
ch, num_outs,
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
   sound/usb/mixer.c:2158:6: note: Assuming the condition is false
           if (check_ignored_ctl(map))
               ^~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:2158:2: note: Taking false branch
           if (check_ignored_ctl(map))
           ^
   sound/usb/mixer.c:2161:9: note: Calling 'kzalloc'
           cval =3D kzalloc(sizeof(*cval), GFP_KERNEL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:733:9: note: Uninitialized value stored to field 'c=
mask'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:733:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:2161:9: note: Returning from 'kzalloc'
           cval =3D kzalloc(sizeof(*cval), GFP_KERNEL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:2162:6: note: Assuming 'cval' is non-null
           if (!cval)
               ^~~~~
   sound/usb/mixer.c:2162:2: note: Taking false branch
           if (!cval)
           ^
   sound/usb/mixer.c:2168:14: note: 'i' is < 'num_outs'
           for (i =3D 0; i < num_outs; i++) {
                       ^
   sound/usb/mixer.c:2168:2: note: Loop condition is true.  Entering loop b=
ody
           for (i =3D 0; i < num_outs; i++) {
           ^
   sound/usb/mixer.c:2171:7: note: Assuming the condition is true
                   if (check_matrix_bitmap(c, in_ch, i, num_outs)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:2171:3: note: Taking true branch
                   if (check_matrix_bitmap(c, in_ch, i, num_outs)) {
                   ^
   sound/usb/mixer.c:2172:16: note: The left expression of the compound ass=
ignment is an uninitialized value. The computed value will also be garbage
                           cval->cmask |=3D (1 << i);
                           ~~~~~~~~~~~ ^
>> sound/usb/mixer.c:2193:3: warning: Value stored to 'len' is never read [=
clang-analyzer-deadcode.DeadStores]
                   len =3D sprintf(kctl->id.name, "Mixer Source %d", in_ch =
+ 1);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   sound/usb/mixer.c:2193:3: note: Value stored to 'len' is never read
                   len =3D sprintf(kctl->id.name, "Mixer Source %d", in_ch =
+ 1);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   sound/usb/mixer.c:2193:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len =3D sprintf(kctl->id.name, "Mixer Source %d", in_ch =
+ 1);
                         ^~~~~~~
   sound/usb/mixer.c:2193:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   len =3D sprintf(kctl->id.name, "Mixer Source %d", in_ch =
+ 1);
                         ^~~~~~~
   sound/usb/mixer.c:2795:4: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                           sprintf(namelist[i], "Input %u", i);
                           ^~~~~~~
   sound/usb/mixer.c:2795:4: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                           sprintf(namelist[i], "Input %u", i);
                           ^~~~~~~
   sound/usb/mixer.c:3189:3: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&iterm, 0, sizeof(iterm));
                   ^~~~~~
   sound/usb/mixer.c:3189:3: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
                   memset(&iterm, 0, sizeof(iterm));
                   ^~~~~~
   sound/usb/mixer.c:3195:3: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&oterm, 0, sizeof(oterm));
                   ^~~~~~
   sound/usb/mixer.c:3195:3: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
                   memset(&oterm, 0, sizeof(oterm));
                   ^~~~~~
   sound/usb/mixer.c:3216:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&state, 0, sizeof(state));
           ^~~~~~
   sound/usb/mixer.c:3216:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(&state, 0, sizeof(state));
           ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   sound/core/seq/oss/seq_oss_readq.c:94:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&rec, 0, sizeof(rec));
           ^~~~~~
   sound/core/seq/oss/seq_oss_readq.c:94:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(&rec, 0, sizeof(rec));
           ^~~~~~
   sound/core/seq/oss/seq_oss_readq.c:151:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&q->q[q->tail], ev, sizeof(*ev));
           ^~~~~~
   sound/core/seq/oss/seq_oss_readq.c:151:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&q->q[q->tail], ev, sizeof(*ev));
           ^~~~~~
   sound/core/seq/oss/seq_oss_readq.c:173:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(rec, &q->q[q->head], sizeof(*rec));
           ^~~~~~
   sound/core/seq/oss/seq_oss_readq.c:173:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(rec, &q->q[q->head], sizeof(*rec));
           ^~~~~~
   sound/core/seq/oss/seq_oss_readq.c:220:3: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&rec, 0, sizeof(rec));
                   ^~~~~~
   sound/core/seq/oss/seq_oss_readq.c:220:3: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
                   memset(&rec, 0, sizeof(rec));
                   ^~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   drivers/mtd/nand/ecc.c:544:3: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(tweak->databuf.in, 0xFF, ctx->page_buffer_size);
                   ^~~~~~
   drivers/mtd/nand/ecc.c:544:3: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
                   memset(tweak->databuf.in, 0xFF, ctx->page_buffer_size);
                   ^~~~~~
   drivers/mtd/nand/ecc.c:552:3: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(tweak->oobbuf.in, 0xFF, ctx->oob_buffer_size);
                   ^~~~~~
   drivers/mtd/nand/ecc.c:552:3: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
                   memset(tweak->oobbuf.in, 0xFF, ctx->oob_buffer_size);
                   ^~~~~~
   drivers/mtd/nand/ecc.c:558:4: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy((void *)tweak->databuf.out + orig->dataof=
fs,
                           ^~~~~~
   drivers/mtd/nand/ecc.c:558:4: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
                           memcpy((void *)tweak->databuf.out + orig->dataof=
fs,
                           ^~~~~~
   drivers/mtd/nand/ecc.c:562:4: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy((void *)tweak->oobbuf.out + orig->ooboffs,
                           ^~~~~~
   drivers/mtd/nand/ecc.c:562:4: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
                           memcpy((void *)tweak->oobbuf.out + orig->ooboffs,
                           ^~~~~~
   drivers/mtd/nand/ecc.c:579:4: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(orig->databuf.in,
--
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_core.c:911:9: note: Taking false branch
           } else if (cmd =3D=3D VFIO_DEVICE_SET_IRQS) {
                  ^
   drivers/vfio/pci/vfio_pci_core.c:946:13: note: Assuming the condition is=
 true
           } else if (cmd =3D=3D VFIO_DEVICE_RESET) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_core.c:946:9: note: Taking true branch
           } else if (cmd =3D=3D VFIO_DEVICE_RESET) {
                  ^
   drivers/vfio/pci/vfio_pci_core.c:949:7: note: Assuming field 'reset_work=
s' is true
                   if (!vdev->reset_works)
                       ^~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_core.c:949:3: note: Taking false branch
                   if (!vdev->reset_works)
                   ^
   drivers/vfio/pci/vfio_pci_core.c:952:3: note: Calling 'vfio_pci_zap_and_=
down_write_memory_lock'
                   vfio_pci_zap_and_down_write_memory_lock(vdev);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_core.c:1352:2: note: Calling 'vfio_pci_zap_and=
_vma_lock'
           vfio_pci_zap_and_vma_lock(vdev, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_core.c:1289:2: note: Loop condition is true.  =
Entering loop body
           while (1) {
           ^
   drivers/vfio/pci/vfio_pci_core.c:1292:7: note: 'try' is false
                   if (try) {
                       ^~~
   drivers/vfio/pci/vfio_pci_core.c:1292:3: note: Taking false branch
                   if (try) {
                   ^
   drivers/vfio/pci/vfio_pci_core.c:1298:3: note: Loop condition is true.  =
Entering loop body
                   while (!list_empty(&vdev->vma_list)) {
                   ^
   drivers/vfio/pci/vfio_pci_core.c:1303:8: note: Assuming the condition is=
 false
                           if (mmget_not_zero(mm))
                               ^~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_core.c:1303:4: note: Taking false branch
                           if (mmget_not_zero(mm))
                           ^
   drivers/vfio/pci/vfio_pci_core.c:1307:4: note: Memory is released
                           kfree(mmap_vma);
                           ^~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_core.c:1298:3: note: Loop condition is true.  =
Entering loop body
                   while (!list_empty(&vdev->vma_list)) {
                   ^
   drivers/vfio/pci/vfio_pci_core.c:1302:9: note: Use of memory after it is=
 freed
                           mm =3D mmap_vma->vma->vm_mm;
                                ^~~~~~~~~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   sound/core/seq/oss/seq_oss_writeq.c:40:2: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&pool, 0, sizeof(pool));
           ^~~~~~
   sound/core/seq/oss/seq_oss_writeq.c:40:2: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
           memset(&pool, 0, sizeof(pool));
           ^~~~~~
   sound/core/seq/oss/seq_oss_writeq.c:71:2: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&reset, 0, sizeof(reset));
           ^~~~~~
   sound/core/seq/oss/seq_oss_writeq.c:71:2: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
           memset(&reset, 0, sizeof(reset));
           ^~~~~~
   sound/core/seq/oss/seq_oss_writeq.c:97:3: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&ev, 0, sizeof(ev));
                   ^~~~~~
   sound/core/seq/oss/seq_oss_writeq.c:97:3: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
                   memset(&ev, 0, sizeof(ev));
                   ^~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   sound/firewire/bebob/bebob_hwdep.c:38:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&event, 0, sizeof(event));
           ^~~~~~
   sound/firewire/bebob/bebob_hwdep.c:38:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(&event, 0, sizeof(event));
           ^~~~~~
   sound/firewire/bebob/bebob_hwdep.c:76:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&info, 0, sizeof(info));
           ^~~~~~
   sound/firewire/bebob/bebob_hwdep.c:76:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(&info, 0, sizeof(info));
           ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
>> sound/firewire/oxfw/oxfw-pcm.c:443:2: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(pcm->name, oxfw->card->shortname);
           ^~~~~~
   sound/firewire/oxfw/oxfw-pcm.c:443:2: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
           strcpy(pcm->name, oxfw->card->shortname);
           ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   sound/firewire/oxfw/oxfw-midi.c:132:3: warning: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(subs->name, sizeof(subs->name),
                   ^~~~~~~~
   sound/firewire/oxfw/oxfw-midi.c:132:3: note: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(subs->name, sizeof(subs->name),
                   ^~~~~~~~
   sound/firewire/oxfw/oxfw-midi.c:164:2: warning: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(rmidi->name, sizeof(rmidi->name),
           ^~~~~~~~
   sound/firewire/oxfw/oxfw-midi.c:164:2: note: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(rmidi->name, sizeof(rmidi->name),
           ^~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/vfio/pci/vfio_pci_intrs.c:301:6: warning: Use of memory after it=
 is freed [clang-analyzer-unix.Malloc]
           if (vdev->ctx[vector].trigger) {
               ^
   drivers/vfio/pci/vfio_pci_intrs.c:646:2: note: Control jumps to 'case VF=
IO_PCI_MSI_IRQ_INDEX:'  at line 660
           switch (index) {
           ^
   drivers/vfio/pci/vfio_pci_intrs.c:662:3: note: Control jumps to 'case 32=
:'  at line 667
                   switch (flags & VFIO_IRQ_SET_ACTION_TYPE_MASK) {
                   ^
   drivers/vfio/pci/vfio_pci_intrs.c:669:4: note:  Execution continues on l=
ine 671
                           break;
                           ^
   drivers/vfio/pci/vfio_pci_intrs.c:671:3: note:  Execution continues on l=
ine 689
                   break;
                   ^
   drivers/vfio/pci/vfio_pci_intrs.c:689:7: note: 'func' is non-null
           if (!func)
                ^~~~
   drivers/vfio/pci/vfio_pci_intrs.c:689:2: note: Taking false branch
           if (!func)
           ^
   drivers/vfio/pci/vfio_pci_intrs.c:692:9: note: Calling 'vfio_pci_set_msi=
_trigger'
           return func(vdev, index, start, count, flags, data);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_intrs.c:515:15: note: 'index' is not equal to =
VFIO_PCI_MSIX_IRQ_INDEX
           bool msix =3D (index =3D=3D VFIO_PCI_MSIX_IRQ_INDEX) ? true : fa=
lse;
                        ^~~~~
   drivers/vfio/pci/vfio_pci_intrs.c:515:14: note: '?' condition is false
           bool msix =3D (index =3D=3D VFIO_PCI_MSIX_IRQ_INDEX) ? true : fa=
lse;
                       ^
   drivers/vfio/pci/vfio_pci_intrs.c:517:13: note: Assuming 'index' is not =
equal to field 'irq_type'
           if (irq_is(vdev, index) && !count && (flags & VFIO_IRQ_SET_DATA_=
NONE)) {
                      ^
   include/linux/vfio_pci_core.h:148:29: note: expanded from macro 'irq_is'
   #define irq_is(vdev, type) (vdev->irq_type =3D=3D type)
                               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_intrs.c:517:26: note: Left side of '&&' is fal=
se
           if (irq_is(vdev, index) && !count && (flags & VFIO_IRQ_SET_DATA_=
NONE)) {
                                   ^
   drivers/vfio/pci/vfio_pci_intrs.c:522:21: note: 'index' is not equal to =
field 'irq_type'
           if (!(irq_is(vdev, index) || is_irq_none(vdev)))
                              ^
   include/linux/vfio_pci_core.h:148:47: note: expanded from macro 'irq_is'
   #define irq_is(vdev, type) (vdev->irq_type =3D=3D type)
                                                 ^~~~
   drivers/vfio/pci/vfio_pci_intrs.c:522:8: note: Left side of '||' is false
           if (!(irq_is(vdev, index) || is_irq_none(vdev)))
                 ^
   include/linux/vfio_pci_core.h:148:28: note: expanded from macro 'irq_is'
   #define irq_is(vdev, type) (vdev->irq_type =3D=3D type)
                              ^
   drivers/vfio/pci/vfio_pci_intrs.c:522:43: note: Assuming field 'irq_type=
' is not equal to VFIO_PCI_INTX_IRQ_INDEX
           if (!(irq_is(vdev, index) || is_irq_none(vdev)))
                                                    ^
   include/linux/vfio_pci_core.h:147:38: note: expanded from macro 'is_irq_=
none'
   #define is_irq_none(vdev) (!(is_intx(vdev) || is_msi(vdev) || is_msix(vd=
ev)))
                                ~~~~~~~~^~~~~
   include/linux/vfio_pci_core.h:144:24: note: expanded from macro 'is_intx'
   #define is_intx(vdev) (vdev->irq_type =3D=3D VFIO_PCI_INTX_IRQ_INDEX)
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_intrs.c:522:31: note: Left side of '||' is fal=
se
           if (!(irq_is(vdev, index) || is_irq_none(vdev)))
                                        ^
   include/linux/vfio_pci_core.h:147:30: note: expanded from macro 'is_irq_=
none'
   #define is_irq_none(vdev) (!(is_intx(vdev) || is_msi(vdev) || is_msix(vd=
ev)))
                                ^
   include/linux/vfio_pci_core.h:144:23: note: expanded from macro 'is_intx'
   #define is_intx(vdev) (vdev->irq_type =3D=3D VFIO_PCI_INTX_IRQ_INDEX)
                         ^
   drivers/vfio/pci/vfio_pci_intrs.c:522:31: note: Field 'irq_type' is not =
equal to VFIO_PCI_MSI_IRQ_INDEX
           if (!(irq_is(vdev, index) || is_irq_none(vdev)))
                                        ^
   include/linux/vfio_pci_core.h:147:47: note: expanded from macro 'is_irq_=
none'
   #define is_irq_none(vdev) (!(is_intx(vdev) || is_msi(vdev) || is_msix(vd=
ev)))
--
   include/linux/vfio_pci_core.h:144:23: note: expanded from macro 'is_intx'
   #define is_intx(vdev) (vdev->irq_type =3D=3D VFIO_PCI_INTX_IRQ_INDEX)
                         ^
   drivers/vfio/pci/vfio_pci_intrs.c:254:7: note: Field 'irq_type' is not e=
qual to VFIO_PCI_MSIX_IRQ_INDEX
           if (!is_irq_none(vdev))
                ^
   include/linux/vfio_pci_core.h:147:63: note: expanded from macro 'is_irq_=
none'
   #define is_irq_none(vdev) (!(is_intx(vdev) || is_msi(vdev) || is_msix(vd=
ev)))
                                                                 ^
   include/linux/vfio_pci_core.h:146:30: note: expanded from macro 'is_msix'
   #define is_msix(vdev) (vdev->irq_type =3D=3D VFIO_PCI_MSIX_IRQ_INDEX)
                                ^
   drivers/vfio/pci/vfio_pci_intrs.c:254:2: note: Taking false branch
           if (!is_irq_none(vdev))
           ^
   drivers/vfio/pci/vfio_pci_intrs.c:258:6: note: Assuming field 'ctx' is n=
on-null
           if (!vdev->ctx)
               ^~~~~~~~~~
   drivers/vfio/pci/vfio_pci_intrs.c:258:2: note: Taking false branch
           if (!vdev->ctx)
           ^
   drivers/vfio/pci/vfio_pci_intrs.c:264:6: note: Assuming 'ret' is < 'nvec'
           if (ret < nvec) {
               ^~~~~~~~~~
   drivers/vfio/pci/vfio_pci_intrs.c:264:2: note: Taking true branch
           if (ret < nvec) {
           ^
   drivers/vfio/pci/vfio_pci_intrs.c:265:7: note: Assuming 'ret' is <=3D 0
                   if (ret > 0)
                       ^~~~~~~
   drivers/vfio/pci/vfio_pci_intrs.c:265:3: note: Taking false branch
                   if (ret > 0)
                   ^
   drivers/vfio/pci/vfio_pci_intrs.c:268:3: note: Memory is released
                   kfree(vdev->ctx);
                   ^~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_intrs.c:533:9: note: Returning; memory was rel=
eased
                   ret =3D vfio_msi_enable(vdev, start + count, msix);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_intrs.c:534:7: note: Assuming 'ret' is 0
                   if (ret)
                       ^~~
   drivers/vfio/pci/vfio_pci_intrs.c:534:3: note: Taking false branch
                   if (ret)
                   ^
   drivers/vfio/pci/vfio_pci_intrs.c:537:9: note: Calling 'vfio_msi_set_blo=
ck'
                   ret =3D vfio_msi_set_block(vdev, start, count, fds, msix=
);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_intrs.c:372:6: note: Assuming 'start' is < fie=
ld 'num_ctx'
           if (start >=3D vdev->num_ctx || start + count > vdev->num_ctx)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_intrs.c:372:6: note: Left side of '||' is false
   drivers/vfio/pci/vfio_pci_intrs.c:372:32: note: Assuming the condition i=
s false
           if (start >=3D vdev->num_ctx || start + count > vdev->num_ctx)
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_intrs.c:372:2: note: Taking false branch
           if (start >=3D vdev->num_ctx || start + count > vdev->num_ctx)
           ^
   drivers/vfio/pci/vfio_pci_intrs.c:375:25: note: Assuming 'i' is < 'count'
           for (i =3D 0, j =3D start; i < count && !ret; i++, j++) {
                                  ^~~~~~~~~
   drivers/vfio/pci/vfio_pci_intrs.c:375:25: note: Left side of '&&' is true
   drivers/vfio/pci/vfio_pci_intrs.c:375:2: note: Loop condition is true.  =
Entering loop body
           for (i =3D 0, j =3D start; i < count && !ret; i++, j++) {
           ^
   drivers/vfio/pci/vfio_pci_intrs.c:376:12: note: Assuming 'fds' is null
                   int fd =3D fds ? fds[i] : -1;
                            ^~~
   drivers/vfio/pci/vfio_pci_intrs.c:376:12: note: '?' condition is false
   drivers/vfio/pci/vfio_pci_intrs.c:377:9: note: Calling 'vfio_msi_set_vec=
tor_signal'
                   ret =3D vfio_msi_set_vector_signal(vdev, j, fd, msix);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_intrs.c:296:6: note: Assuming 'vector' is >=3D=
 0
           if (vector < 0 || vector >=3D vdev->num_ctx)
               ^~~~~~~~~~
   drivers/vfio/pci/vfio_pci_intrs.c:296:6: note: Left side of '||' is false
   drivers/vfio/pci/vfio_pci_intrs.c:296:20: note: 'vector' is < field 'num=
_ctx'
           if (vector < 0 || vector >=3D vdev->num_ctx)
                             ^~~~~~
   drivers/vfio/pci/vfio_pci_intrs.c:296:2: note: Taking false branch
           if (vector < 0 || vector >=3D vdev->num_ctx)
           ^
   drivers/vfio/pci/vfio_pci_intrs.c:301:6: note: Use of memory after it is=
 freed
           if (vdev->ctx[vector].trigger) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   sound/usb/mixer_quirks.c:93:2: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(kctl->id.name, sizeof(kctl->id.name), name);
           ^~~~~~~~
   sound/usb/mixer_quirks.c:93:2: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
           snprintf(kctl->id.name, sizeof(kctl->id.name), name);
           ^~~~~~~~
   sound/usb/mixer_quirks.c:260:2: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(hwdep->name, sizeof(hwdep->name),
           ^~~~~~~~
   sound/usb/mixer_quirks.c:260:2: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
           snprintf(hwdep->name, sizeof(hwdep->name),
           ^~~~~~~~
>> sound/usb/mixer_quirks.c:309:3: warning: Value stored to 'err' is never =
read [clang-analyzer-deadcode.DeadStores]
                   err =3D snd_usb_ctl_msg(chip->dev,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_quirks.c:309:3: note: Value stored to 'err' is never read
                   err =3D snd_usb_ctl_msg(chip->dev,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_quirks.c:1142:4: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(name, sizeof(name),
                           ^~~~~~~~
   sound/usb/mixer_quirks.c:1142:4: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
                           snprintf(name, sizeof(name),
                           ^~~~~~~~
   sound/usb/mixer_quirks.c:1153:4: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(name, sizeof(name),
                           ^~~~~~~~
   sound/usb/mixer_quirks.c:1153:4: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
                           snprintf(name, sizeof(name),
                           ^~~~~~~~
   sound/usb/mixer_quirks.c:1218:3: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(name, sizeof(name),
                   ^~~~~~~~
   sound/usb/mixer_quirks.c:1218:3: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
                   snprintf(name, sizeof(name),
                   ^~~~~~~~
   sound/usb/mixer_quirks.c:1242:3: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(name, sizeof(name),
                   ^~~~~~~~
   sound/usb/mixer_quirks.c:1242:3: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
                   snprintf(name, sizeof(name),
                   ^~~~~~~~
   sound/usb/mixer_quirks.c:1252:3: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(name, sizeof(name),
                   ^~~~~~~~
   sound/usb/mixer_quirks.c:1252:3: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
                   snprintf(name, sizeof(name),
                   ^~~~~~~~
   sound/usb/mixer_quirks.c:1345:5: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   snprintf(name, sizeof(name),
                                   ^~~~~~~~
   sound/usb/mixer_quirks.c:1345:5: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
                                   snprintf(name, sizeof(name),
                                   ^~~~~~~~
   sound/usb/mixer_quirks.c:1349:5: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   snprintf(name, sizeof(name),
                                   ^~~~~~~~
   sound/usb/mixer_quirks.c:1349:5: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
                                   snprintf(name, sizeof(name),
                                   ^~~~~~~~
   sound/usb/mixer_quirks.c:1431:4: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(name, sizeof(name),
                           ^~~~~~~~
   sound/usb/mixer_quirks.c:1431:4: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
                           snprintf(name, sizeof(name),
                           ^~~~~~~~
   sound/usb/mixer_quirks.c:1435:4: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(name, sizeof(name),
                           ^~~~~~~~
   sound/usb/mixer_quirks.c:1435:4: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
                           snprintf(name, sizeof(name),
                           ^~~~~~~~
   sound/usb/mixer_quirks.c:1477:3: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(name, sizeof(name),
                   ^~~~~~~~
   sound/usb/mixer_quirks.c:1477:3: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
                   snprintf(name, sizeof(name),
                   ^~~~~~~~
   sound/usb/mixer_quirks.c:2662:4: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(name, sizeof(name),
                           ^~~~~~~~
   sound/usb/mixer_quirks.c:2662:4: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
                           snprintf(name, sizeof(name),
                           ^~~~~~~~
   sound/usb/mixer_quirks.c:2671:4: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(name, sizeof(name),
                           ^~~~~~~~
   sound/usb/mixer_quirks.c:2671:4: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
                           snprintf(name, sizeof(name),
                           ^~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/mtd/devices/block2mtd.c:74:5: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(page_address(page), 0xff, PAGE_SI=
ZE);
                                   ^~~~~~
   drivers/mtd/devices/block2mtd.c:74:5: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
                                   memset(page_address(page), 0xff, PAGE_SI=
ZE);
                                   ^~~~~~
   drivers/mtd/devices/block2mtd.c:124:3: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, page_address(page) + offset, cpylen);
                   ^~~~~~
   drivers/mtd/devices/block2mtd.c:124:3: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, page_address(page) + offset, cpylen);
                   ^~~~~~
   drivers/mtd/devices/block2mtd.c:160:4: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(page_address(page) + offset, buf, cpylen);
                           ^~~~~~
   drivers/mtd/devices/block2mtd.c:160:4: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(page_address(page) + offset, buf, cpylen);
                           ^~~~~~
   drivers/mtd/devices/block2mtd.c:402:2: warning: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcp=
y]
           strcpy(str, val);
--
                   ^~~~~~~
   sound/usb/mixer_scarlett.c:593:2: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(mx, sizeof(mx), "Master %d (%s) Playback Switch",
           ^~~~~~~~
   sound/usb/mixer_scarlett.c:593:2: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
           snprintf(mx, sizeof(mx), "Master %d (%s) Playback Switch",
           ^~~~~~~~
   sound/usb/mixer_scarlett.c:602:2: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(mx, sizeof(mx), "Master %d (%s) Playback Volume",
           ^~~~~~~~
   sound/usb/mixer_scarlett.c:602:2: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
           snprintf(mx, sizeof(mx), "Master %d (%s) Playback Volume",
           ^~~~~~~~
   sound/usb/mixer_scarlett.c:611:2: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(mx, sizeof(mx), "Master %dL (%s) Source Playback Enum",
           ^~~~~~~~
   sound/usb/mixer_scarlett.c:611:2: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
           snprintf(mx, sizeof(mx), "Master %dL (%s) Source Playback Enum",
           ^~~~~~~~
   sound/usb/mixer_scarlett.c:621:2: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(mx, sizeof(mx), "Master %dR (%s) Source Playback Enum",
           ^~~~~~~~
   sound/usb/mixer_scarlett.c:621:2: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
           snprintf(mx, sizeof(mx), "Master %dR (%s) Source Playback Enum",
           ^~~~~~~~
   sound/usb/mixer_scarlett.c:879:4: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           sprintf(mx, "Input %d Impedance Switch", ctl->nu=
m);
                           ^~~~~~~
   sound/usb/mixer_scarlett.c:879:4: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                           sprintf(mx, "Input %d Impedance Switch", ctl->nu=
m);
                           ^~~~~~~
   sound/usb/mixer_scarlett.c:888:4: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           sprintf(mx, "Input %d Pad Switch", ctl->num);
                           ^~~~~~~
   sound/usb/mixer_scarlett.c:888:4: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                           sprintf(mx, "Input %d Pad Switch", ctl->num);
                           ^~~~~~~
   sound/usb/mixer_scarlett.c:897:4: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           sprintf(mx, "Input %d Gain Switch", ctl->num);
                           ^~~~~~~
   sound/usb/mixer_scarlett.c:897:4: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                           sprintf(mx, "Input %d Gain Switch", ctl->num);
                           ^~~~~~~
   sound/usb/mixer_scarlett.c:953:3: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(mx, sizeof(mx), "Matrix %02d Input Playback Rou=
te",
                   ^~~~~~~~
   sound/usb/mixer_scarlett.c:953:3: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
                   snprintf(mx, sizeof(mx), "Matrix %02d Input Playback Rou=
te",
                   ^~~~~~~~
   sound/usb/mixer_scarlett.c:963:4: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           sprintf(mx, "Matrix %02d Mix %c Playback Volume"=
, i+1,
                           ^~~~~~~
   sound/usb/mixer_scarlett.c:963:4: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                           sprintf(mx, "Matrix %02d Mix %c Playback Volume"=
, i+1,
                           ^~~~~~~
   sound/usb/mixer_scarlett.c:976:3: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(mx, sizeof(mx), "Input Source %02d Capture Rout=
e",
                   ^~~~~~~~
   sound/usb/mixer_scarlett.c:976:3: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
                   snprintf(mx, sizeof(mx), "Input Source %02d Capture Rout=
e",
                   ^~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   sound/core/pcm_native.c:220:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(info, 0, sizeof(*info));
           ^~~~~~
   sound/core/pcm_native.c:220:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(info, 0, sizeof(*info));
           ^~~~~~
   sound/core/pcm_native.c:817:3: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(runtime->dma_area, 0, size);
                   ^~~~~~
   sound/core/pcm_native.c:817:3: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
                   memset(runtime->dma_area, 0, size);
                   ^~~~~~
   sound/core/pcm_native.c:1076:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&status, 0, sizeof(status));
           ^~~~~~
   sound/core/pcm_native.c:1076:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(&status, 0, sizeof(status));
           ^~~~~~
   sound/core/pcm_native.c:1101:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&status64, 0, sizeof(status64));
           ^~~~~~
   sound/core/pcm_native.c:1101:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(&status64, 0, sizeof(status64));
           ^~~~~~
   sound/core/pcm_native.c:1102:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&status32, 0, sizeof(status32));
           ^~~~~~
   sound/core/pcm_native.c:1102:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(&status32, 0, sizeof(status32));
           ^~~~~~
   sound/core/pcm_native.c:1158:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(info, 0, sizeof(*info));
           ^~~~~~
   sound/core/pcm_native.c:1158:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(info, 0, sizeof(*info));
           ^~~~~~
>> sound/core/pcm_native.c:1347:2: warning: Use of memory after it is freed=
 [clang-analyzer-unix.Malloc]
           return group;
           ^
   sound/core/pcm_native.c:3422:6: note: Assuming field 'state' is not equa=
l to SNDRV_PCM_STATE_DISCONNECTED
           if (substream->runtime->status->state =3D=3D SNDRV_PCM_STATE_DIS=
CONNECTED)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   sound/core/pcm_native.c:3422:2: note: Taking false branch
           if (substream->runtime->status->state =3D=3D SNDRV_PCM_STATE_DIS=
CONNECTED)
           ^
   sound/core/pcm_native.c:3425:2: note: Control jumps to 'case 16708:'  at=
 line 3442
           switch (cmd) {
           ^
   sound/core/pcm_native.c:3443:10: note: Calling 'snd_pcm_drain'
                   return snd_pcm_drain(substream, NULL);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/pcm_native.c:2099:6: note: Assuming field 'state' is not equa=
l to SNDRV_PCM_STATE_OPEN
           if (runtime->status->state =3D=3D SNDRV_PCM_STATE_OPEN)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/pcm_native.c:2099:2: note: Taking false branch
           if (runtime->status->state =3D=3D SNDRV_PCM_STATE_OPEN)
           ^
   sound/core/pcm_native.c:2102:6: note: 'file' is null
           if (file) {
               ^~~~
   sound/core/pcm_native.c:2102:2: note: Taking false branch
           if (file) {
           ^
   sound/core/pcm_native.c:2105:13: note: Assuming the condition is false
           } else if (substream->f_flags & O_NONBLOCK)
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/pcm_native.c:2105:9: note: Taking false branch
           } else if (substream->f_flags & O_NONBLOCK)
                  ^
   sound/core/pcm_native.c:2110:6: note: Assuming field 'state' is not equa=
l to SNDRV_PCM_STATE_PAUSED
           if (runtime->status->state =3D=3D SNDRV_PCM_STATE_PAUSED)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/pcm_native.c:2110:2: note: Taking false branch
           if (runtime->status->state =3D=3D SNDRV_PCM_STATE_PAUSED)
           ^
   sound/core/pcm_native.c:2114:11: note: Calling 'snd_pcm_action'
           result =3D snd_pcm_action(&snd_pcm_action_drain_init, substream,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/pcm_native.c:1361:6: note: Assuming 'group' is non-null
           if (group)
               ^~~~~
   sound/core/pcm_native.c:1361:2: note: Taking true branch
           if (group)
           ^
   sound/core/pcm_native.c:1365:2: note: Calling 'snd_pcm_group_unref'
           snd_pcm_group_unref(group, substream);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/pcm_native.c:1305:7: note: 'group' is non-null
           if (!group)
                ^~~~~
   sound/core/pcm_native.c:1305:2: note: Taking false branch
           if (!group)
           ^
   sound/core/pcm_native.c:1309:6: note: 'do_free' is true
           if (do_free)
               ^~~~~~~
   sound/core/pcm_native.c:1309:2: note: Taking true branch
           if (do_free)
           ^
   sound/core/pcm_native.c:1310:3: note: Memory is released
                   kfree(group);
                   ^~~~~~~~~~~~
   sound/core/pcm_native.c:1365:2: note: Returning; memory was released via=
 1st parameter
           snd_pcm_group_unref(group, substream);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/pcm_native.c:2114:11: note: Returning; memory was released
           result =3D snd_pcm_action(&snd_pcm_action_drain_init, substream,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/pcm_native.c:2116:6: note: 'result' is >=3D 0
           if (result < 0)
               ^~~~~~
   sound/core/pcm_native.c:2116:2: note: Taking false branch
           if (result < 0)
           ^
   sound/core/pcm_native.c:2119:6: note: 'nonblock' is 0
           if (nonblock) {
               ^~~~~~~~
   sound/core/pcm_native.c:2119:2: note: Taking false branch
           if (nonblock) {
           ^
   sound/core/pcm_native.c:2124:2: note: Loop condition is true.  Entering =
loop body
           for (;;) {
           ^
   sound/core/pcm_native.c:2127:3: note: Taking false branch
                   if (signal_pending(current)) {
                   ^
   sound/core/pcm_native.c:2133:11: note: Calling 'snd_pcm_stream_group_ref'
                   group =3D snd_pcm_stream_group_ref(substream);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/pcm_native.c:1324:2: note: Loop condition is true.  Entering =
loop body
           for (;;) {
           ^
   sound/core/pcm_native.c:1325:7: note: Assuming the condition is false
                   if (!snd_pcm_stream_linked(substream))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/pcm_native.c:1325:3: note: Taking false branch
                   if (!snd_pcm_stream_linked(substream))
--
           ^~~~~~~
   fs/ntfs3/index.c:602:2: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(e, ins, ins_bytes);
           ^~~~~~
   fs/ntfs3/index.c:602:2: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
           memcpy(e, ins, ins_bytes);
           ^~~~~~
   fs/ntfs3/index.c:782:2: warning: Call to function 'memmove' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memmove_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(Add2Ptr(before, de_size), before, used - off);
           ^~~~~~~
   fs/ntfs3/index.c:782:2: note: Call to function 'memmove' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memmove_s' in case of C11
           memmove(Add2Ptr(before, de_size), before, used - off);
           ^~~~~~~
   fs/ntfs3/index.c:785:2: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(before, de, de_size);
           ^~~~~~
   fs/ntfs3/index.c:785:2: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
           memcpy(before, de, de_size);
           ^~~~~~
   fs/ntfs3/index.c:806:2: warning: Call to function 'memmove' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memmove_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(re, Add2Ptr(re, esize), bytes);
           ^~~~~~~
   fs/ntfs3/index.c:806:2: note: Call to function 'memmove' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memmove_s' in case of C11
           memmove(re, Add2Ptr(re, esize), bytes);
           ^~~~~~~
   fs/ntfs3/index.c:1373:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&indx->alloc_run, &run, sizeof(run));
           ^~~~~~
   fs/ntfs3/index.c:1373:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(&indx->alloc_run, &run, sizeof(run));
           ^~~~~~
   fs/ntfs3/index.c:1576:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(e, 0, sizeof(struct NTFS_DE));
           ^~~~~~
   fs/ntfs3/index.c:1576:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(e, 0, sizeof(struct NTFS_DE));
           ^~~~~~
   fs/ntfs3/index.c:1604:4: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(attr, a_root, asize);
                           ^~~~~~
   fs/ntfs3/index.c:1604:4: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                           memcpy(attr, a_root, asize);
                           ^~~~~~
   fs/ntfs3/index.c:1727:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(up_e, sp, sp_size);
           ^~~~~~
   fs/ntfs3/index.c:1727:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(up_e, sp, sp_size);
           ^~~~~~
   fs/ntfs3/index.c:1762:2: warning: Call to function 'memmove' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memmove_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(de_t, Add2Ptr(sp, sp_size), used - le32_to_cpu(hdr1->de_=
off));
           ^~~~~~~
   fs/ntfs3/index.c:1762:2: note: Call to function 'memmove' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memmove_s' in case of C11
           memmove(de_t, Add2Ptr(sp, sp_size), used - le32_to_cpu(hdr1->de_=
off));
           ^~~~~~~
   fs/ntfs3/index.c:2097:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(re, te, le16_to_cpu(te->size));
           ^~~~~~
   fs/ntfs3/index.c:2097:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(re, te, le16_to_cpu(te->size));
           ^~~~~~
   fs/ntfs3/index.c:2463:3: warning: Value stored to 'err' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   err =3D attr_set_size(ni, ATTR_ALLOC, in->name, in->name=
_len,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   fs/ntfs3/index.c:2463:3: note: Value stored to 'err' is never read
                   err =3D attr_set_size(ni, ATTR_ALLOC, in->name, in->name=
_len,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   fs/ntfs3/index.c:2465:3: warning: Value stored to 'err' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   err =3D ni_remove_attr(ni, ATTR_ALLOC, in->name, in->nam=
e_len,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/ntfs3/index.c:2465:3: note: Value stored to 'err' is never read
                   err =3D ni_remove_attr(ni, ATTR_ALLOC, in->name, in->nam=
e_len,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/ntfs3/index.c:2469:3: warning: Value stored to 'err' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   err =3D attr_set_size(ni, ATTR_BITMAP, in->name, in->nam=
e_len,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/ntfs3/index.c:2469:3: note: Value stored to 'err' is never read
                   err =3D attr_set_size(ni, ATTR_BITMAP, in->name, in->nam=
e_len,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/ntfs3/index.c:2567:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&e_fname->dup, dup, sizeof(*dup));
           ^~~~~~
   fs/ntfs3/index.c:2567:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(&e_fname->dup, dup, sizeof(*dup));
           ^~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   sound/firewire/oxfw/oxfw-hwdep.c:37:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&event, 0, sizeof(event));
           ^~~~~~
   sound/firewire/oxfw/oxfw-hwdep.c:37:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(&event, 0, sizeof(event));
           ^~~~~~
   sound/firewire/oxfw/oxfw-hwdep.c:75:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&info, 0, sizeof(info));
           ^~~~~~
   sound/firewire/oxfw/oxfw-hwdep.c:75:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(&info, 0, sizeof(info));
           ^~~~~~
>> sound/firewire/oxfw/oxfw-hwdep.c:180:2: warning: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strc=
py]
           strcpy(hwdep->name, oxfw->card->driver);
           ^~~~~~
   sound/firewire/oxfw/oxfw-hwdep.c:180:2: note: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119
           strcpy(hwdep->name, oxfw->card->driver);
           ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   sound/firewire/oxfw/oxfw-scs1x.c:401:2: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(rmidi->name, sizeof(rmidi->name),
           ^~~~~~~~
   sound/firewire/oxfw/oxfw-scs1x.c:401:2: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(rmidi->name, sizeof(rmidi->name),
           ^~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/siox/siox-core.c:150:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(smaster->buf, 0, smaster->setbuf_len);
           ^~~~~~
   drivers/siox/siox-core.c:150:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(smaster->buf, 0, smaster->setbuf_len);
           ^~~~~~
   drivers/siox/siox-core.c:240:4: warning: Value stored to 'status' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                           status &=3D ~SIOX_STATUS_WDG;
                           ^         ~~~~~~~~~~~~~~~~
   drivers/siox/siox-core.c:240:4: note: Value stored to 'status' is never =
read
                           status &=3D ~SIOX_STATUS_WDG;
                           ^         ~~~~~~~~~~~~~~~~
   drivers/siox/siox-core.c:389:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           return sprintf(buf, "%s\n", sdev->type);
                  ^~~~~~~
   drivers/siox/siox-core.c:389:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           return sprintf(buf, "%s\n", sdev->type);
                  ^~~~~~~
   drivers/siox/siox-core.c:399:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%zu\n", sdev->inbytes);
                  ^~~~~~~
   drivers/siox/siox-core.c:399:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%zu\n", sdev->inbytes);
                  ^~~~~~~
   drivers/siox/siox-core.c:409:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%zu\n", sdev->outbytes);
                  ^~~~~~~
   drivers/siox/siox-core.c:409:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%zu\n", sdev->outbytes);
                  ^~~~~~~
   drivers/siox/siox-core.c:426:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", status_errors);
                  ^~~~~~~
   drivers/siox/siox-core.c:426:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", status_errors);
                  ^~~~~~~
   drivers/siox/siox-core.c:443:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", connected);
                  ^~~~~~~
   drivers/siox/siox-core.c:443:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", connected);
                  ^~~~~~~
   drivers/siox/siox-core.c:460:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", status & SIOX_STATUS_WDG);
                  ^~~~~~~
   drivers/siox/siox-core.c:460:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", status & SIOX_STATUS_WDG);
                  ^~~~~~~
   drivers/siox/siox-core.c:477:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", watchdog_errors);
                  ^~~~~~~
   drivers/siox/siox-core.c:477:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", watchdog_errors);
                  ^~~~~~~
   drivers/siox/siox-core.c:559:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", smaster->active);
                  ^~~~~~~
   drivers/siox/siox-core.c:559:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", smaster->active);
                  ^~~~~~~
   drivers/siox/siox-core.c:601:8: warning: Call to function 'sscanf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(buf, "%19s %zu %zu %hhu", type, &inbytes,
                 ^~~~~~
   drivers/siox/siox-core.c:601:8: note: Call to function 'sscanf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(buf, "%19s %zu %zu %hhu", type, &inbytes,
                 ^~~~~~
   drivers/siox/siox-core.c:637:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lld\n", jiffies_to_nsecs(smaster->poll_int=
erval));
                  ^~~~~~~
   drivers/siox/siox-core.c:637:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lld\n", jiffies_to_nsecs(smaster->poll_int=
erval));
                  ^~~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   drivers/md/raid10.c:180:4: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(rp, &rps[0], sizeof(*rp));
                           ^~~~~~
   drivers/md/raid10.c:180:4: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                           memcpy(rp, &rps[0], sizeof(*rp));
--
   include/linux/rcupdate.h:604:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:532:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:392:43: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:352:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:324:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/md/raid10.c:3679:11: note: Left side of '&&' is false
                           rdev =3D rcu_dereference(conf->mirrors[d].rdev);
                                  ^
   include/linux/rcupdate.h:604:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:532:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:393:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:348:48: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                                  ^
   drivers/md/raid10.c:3679:11: note: Loop condition is false.  Exiting loop
                           rdev =3D rcu_dereference(conf->mirrors[d].rdev);
                                  ^
   include/linux/rcupdate.h:604:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:532:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:393:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:348:32: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                  ^
   drivers/md/raid10.c:3680:8: note: Assuming 'rdev' is equal to NULL
                           if (rdev =3D=3D NULL || test_bit(Faulty, &rdev->=
flags)) {
                               ^~~~~~~~~~~~
   drivers/md/raid10.c:3680:21: note: Left side of '||' is true
                           if (rdev =3D=3D NULL || test_bit(Faulty, &rdev->=
flags)) {
                                            ^
   drivers/md/raid10.c:3682:5: note:  Execution continues on line 3667
                                   continue;
                                   ^
   drivers/md/raid10.c:3667:15: note: Assuming 'i' is >=3D field 'copies'
                   for (i =3D 0; i < conf->copies; i++) {
                               ^~~~~~~~~~~~~~~~
   drivers/md/raid10.c:3667:3: note: Loop condition is false. Execution con=
tinues on line 3733
                   for (i =3D 0; i < conf->copies; i++) {
                   ^
   drivers/md/raid10.c:3733:7: note: 'count' is < 2
                   if (count < 2) {
                       ^~~~~
   drivers/md/raid10.c:3733:3: note: Taking true branch
                   if (count < 2) {
                   ^
   drivers/md/raid10.c:3734:4: note: Loop condition is true.  Entering loop=
 body
                           for (i=3D0; i<conf->copies; i++) {
                           ^
   drivers/md/raid10.c:3736:9: note: Assuming field 'bi_end_io' is non-null
                                   if (r10_bio->devs[i].bio->bi_end_io)
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid10.c:3736:5: note: Taking true branch
                                   if (r10_bio->devs[i].bio->bi_end_io)
                                   ^
   drivers/md/raid10.c:3737:23: note: Passing null pointer value via 1st pa=
rameter 'rdev'
                                           rdev_dec_pending(conf->mirrors[d=
].rdev,
                                                            ^~~~~~~~~~~~~~~=
~~~~~~
   drivers/md/raid10.c:3737:6: note: Calling 'rdev_dec_pending'
                                           rdev_dec_pending(conf->mirrors[d=
].rdev,
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/md/md.h:788:32: note: Passing null pointer value via 2nd paramet=
er 'addr'
           int faulty =3D test_bit(Faulty, &rdev->flags);
                                         ^~~~~~~~~~~~
   drivers/md/md.h:788:15: note: Calling 'arch_test_bit'
           int faulty =3D test_bit(Faulty, &rdev->flags);
                        ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   include/asm-generic/bitops/non-atomic.h:118:16: note: Array access (from=
 variable 'addr') results in a null pointer dereference
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
>> sound/firewire/oxfw/oxfw.c:107:2: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(oxfw->card->driver, d);
           ^~~~~~
   sound/firewire/oxfw/oxfw.c:107:2: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
           strcpy(oxfw->card->driver, d);
           ^~~~~~
   sound/firewire/oxfw/oxfw.c:108:2: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(oxfw->card->mixername, m);
           ^~~~~~
   sound/firewire/oxfw/oxfw.c:108:2: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
           strcpy(oxfw->card->mixername, m);
           ^~~~~~
   sound/firewire/oxfw/oxfw.c:109:2: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(oxfw->card->shortname, m);
           ^~~~~~
   sound/firewire/oxfw/oxfw.c:109:2: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
           strcpy(oxfw->card->shortname, m);
           ^~~~~~
   sound/firewire/oxfw/oxfw.c:111:2: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(oxfw->card->longname, sizeof(oxfw->card->longname),
           ^~~~~~~~
   sound/firewire/oxfw/oxfw.c:111:2: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
           snprintf(oxfw->card->longname, sizeof(oxfw->card->longname),
           ^~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   sound/firewire/isight.c:119:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(runtime->dma_area + isight->buffer_pointer * 4,
                   ^~~~~~
   sound/firewire/isight.c:119:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(runtime->dma_area + isight->buffer_pointer * 4,
                   ^~~~~~
   sound/firewire/isight.c:123:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(runtime->dma_area + isight->buffer_pointer * 4,
                   ^~~~~~
   sound/firewire/isight.c:123:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(runtime->dma_area + isight->buffer_pointer * 4,
                   ^~~~~~
   sound/firewire/isight.c:126:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(runtime->dma_area, samples, (count - count1) * 4);
                   ^~~~~~
   sound/firewire/isight.c:126:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(runtime->dma_area, samples, (count - count1) * 4);
                   ^~~~~~
   sound/firewire/isight.c:151:4: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(runtime->dma_area + isight->buffer_pointe=
r * 4,
                           ^~~~~~
   sound/firewire/isight.c:151:4: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
                           memset(runtime->dma_area + isight->buffer_pointe=
r * 4,
                           ^~~~~~
   sound/firewire/isight.c:155:4: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(runtime->dma_area + isight->buffer_pointe=
r * 4,
                           ^~~~~~
   sound/firewire/isight.c:155:4: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
                           memset(runtime->dma_area + isight->buffer_pointe=
r * 4,
                           ^~~~~~
   sound/firewire/isight.c:157:4: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(runtime->dma_area, 0, (dropped - count1) =
* 4);
                           ^~~~~~
   sound/firewire/isight.c:157:4: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
                           memset(runtime->dma_area, 0, (dropped - count1) =
* 4);
                           ^~~~~~
   sound/firewire/isight.c:642:2: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(card->longname, sizeof(card->longname),
           ^~~~~~~~
   sound/firewire/isight.c:642:2: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
           snprintf(card->longname, sizeof(card->longname),
           ^~~~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/md/persistent-data/dm-block-manager.c:572:2: warning: Call to fu=
nction 'memset' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memset_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(p, 0, dm_bm_block_size(bm));
           ^~~~~~
   drivers/md/persistent-data/dm-block-manager.c:572:2: note: Call to funct=
ion 'memset' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memset_s' in case of C11
           memset(p, 0, dm_bm_block_size(bm));
           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/md/persistent-data/dm-space-map-common.c:195:2: warning: Call to=
 function 'memset' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memset_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ll, 0, sizeof(struct ll_disk));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-common.c:195:2: note: Call to fu=
nction 'memset' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(ll, 0, sizeof(struct ll_disk));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-common.c:959:2: warning: Call to=
 function 'memcpy' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memcpy_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ie, ll->mi_le.index + index, sizeof(*ie));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-common.c:959:2: note: Call to fu=
nction 'memcpy' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(ie, ll->mi_le.index + index, sizeof(*ie));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-common.c:967:2: warning: Call to=
 function 'memcpy' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memcpy_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ll->mi_le.index + index, ie, sizeof(*ie));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-common.c:967:2: note: Call to fu=
nction 'memcpy' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(ll->mi_le.index + index, ie, sizeof(*ie));
--
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-common.c:1114:4: warning: Call t=
o function 'memcpy' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memcpy_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(ie, &iec->ie, sizeof(*ie));
                           ^~~~~~
   drivers/md/persistent-data/dm-space-map-common.c:1114:4: note: Call to f=
unction 'memcpy' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(ie, &iec->ie, sizeof(*ie));
                           ^~~~~~
   drivers/md/persistent-data/dm-space-map-common.c:1130:3: warning: Call t=
o function 'memcpy' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memcpy_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&iec->ie, ie, sizeof(*ie));
                   ^~~~~~
   drivers/md/persistent-data/dm-space-map-common.c:1130:3: note: Call to f=
unction 'memcpy' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&iec->ie, ie, sizeof(*ie));
                   ^~~~~~
   drivers/md/persistent-data/dm-space-map-common.c:1146:4: warning: Call t=
o function 'memcpy' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memcpy_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&iec->ie, ie, sizeof(*ie));
                           ^~~~~~
   drivers/md/persistent-data/dm-space-map-common.c:1146:4: note: Call to f=
unction 'memcpy' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&iec->ie, ie, sizeof(*ie));
                           ^~~~~~
   drivers/md/persistent-data/dm-space-map-common.c:1161:2: warning: Call t=
o function 'memcpy' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memcpy_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&iec->ie, ie, sizeof(*ie));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-common.c:1161:2: note: Call to f=
unction 'memcpy' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&iec->ie, ie, sizeof(*ie));
           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/mtd/mtdcore.c:650:3: warning: Value stored to 'error' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   error =3D 0;
                   ^       ~
   drivers/mtd/mtdcore.c:650:3: note: Value stored to 'error' is never read
                   error =3D 0;
                   ^       ~
   drivers/mtd/mtdcore.c:740:3: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&mtd->dev, 0, sizeof(mtd->dev));
                   ^~~~~~
   drivers/mtd/mtdcore.c:740:3: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
                   memset(&mtd->dev, 0, sizeof(mtd->dev));
                   ^~~~~~
   drivers/mtd/mtdcore.c:1015:3: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&master->reboot_notifier, 0, sizeof(master->reboo=
t_notifier));
                   ^~~~~~
   drivers/mtd/mtdcore.c:1015:3: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
                   memset(&master->reboot_notifier, 0, sizeof(master->reboo=
t_notifier));
                   ^~~~~~
   drivers/mtd/mtdcore.c:1634:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(oobecc, 0, sizeof(*oobecc));
           ^~~~~~
   drivers/mtd/mtdcore.c:1634:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(oobecc, 0, sizeof(*oobecc));
           ^~~~~~
   drivers/mtd/mtdcore.c:1668:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(oobfree, 0, sizeof(*oobfree));
           ^~~~~~
   drivers/mtd/mtdcore.c:1668:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(oobfree, 0, sizeof(*oobfree));
           ^~~~~~
   drivers/mtd/mtdcore.c:1705:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(oobregion, 0, sizeof(*oobregion));
           ^~~~~~
   drivers/mtd/mtdcore.c:1705:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(oobregion, 0, sizeof(*oobregion));
           ^~~~~~
   drivers/mtd/mtdcore.c:1782:3: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, oobbuf + oobregion.offset, cnt);
                   ^~~~~~
   drivers/mtd/mtdcore.c:1782:3: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, oobbuf + oobregion.offset, cnt);
                   ^~~~~~
   drivers/mtd/mtdcore.c:1825:3: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(oobbuf + oobregion.offset, buf, cnt);
                   ^~~~~~
   drivers/mtd/mtdcore.c:1825:3: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
                   memcpy(oobbuf + oobregion.offset, buf, cnt);
                   ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   sound/firewire/fcp.c:367:5: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(t->response_buffer, data,
                                   ^~~~~~
   sound/firewire/fcp.c:367:5: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                                   memcpy(t->response_buffer, data,
                                   ^~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
>> sound/firewire/amdtp-stream.c:952:13: warning: Assigned value is garbage=
 or undefined [clang-analyzer-core.uninitialized.Assign]
                   desc->syt =3D syt;
                             ^
   sound/firewire/amdtp-stream.c:1281:6: note: Assuming field 'packet_index=
' is >=3D 0
           if (s->packet_index < 0)
               ^~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1281:2: note: Taking false branch
           if (s->packet_index < 0)
           ^
   sound/firewire/amdtp-stream.c:1288:9: note: Assuming 'offset' is < 'pack=
ets'
           while (offset < packets) {
                  ^~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1288:2: note: Loop condition is true.  Ent=
ering loop body
           while (offset < packets) {
           ^
   sound/firewire/amdtp-stream.c:1291:3: note: Taking true branch
                   if (compare_ohci_cycle_count(cycle, d->processing_cycle.=
tx_start) >=3D 0)
                   ^
   sound/firewire/amdtp-stream.c:1292:4: note:  Execution continues on line=
 1298
                           break;
                           ^
   sound/firewire/amdtp-stream.c:1300:6: note: 'offset' is <=3D 0
           if (offset > 0) {
               ^~~~~~
   sound/firewire/amdtp-stream.c:1300:2: note: Taking false branch
           if (offset > 0) {
           ^
   sound/firewire/amdtp-stream.c:1311:6: note: 'offset' is < 'packets'
           if (offset < packets) {
               ^~~~~~
   sound/firewire/amdtp-stream.c:1311:2: note: Taking true branch
           if (offset < packets) {
           ^
   sound/firewire/amdtp-stream.c:1315:3: note: Calling 'process_tx_packets'
                   process_tx_packets(context, tstamp, header_length, ctx_h=
eader, s);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   sound/firewire/amdtp-stream.c:1212:6: note: Assuming field 'packet_index=
' is >=3D 0
           if (s->packet_index < 0)
               ^~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1212:2: note: Taking false branch
           if (s->packet_index < 0)
           ^
   sound/firewire/amdtp-stream.c:1219:8: note: Calling 'generate_device_pkt=
_descs'
           err =3D generate_device_pkt_descs(s, s->pkt_descs, ctx_header, p=
ackets, &desc_count);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:903:14: note: Assuming 'i' is < 'packets'
           for (i =3D 0; i < packets; ++i) {
                       ^~~~~~~~~~~
   sound/firewire/amdtp-stream.c:903:2: note: Loop condition is true.  Ente=
ring loop body
           for (i =3D 0; i < packets; ++i) {
           ^
   sound/firewire/amdtp-stream.c:908:3: note: 'syt' declared without an ini=
tial value
                   unsigned int syt;
                   ^~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:911:11: note: Assuming 'next_cycle' is equ=
al to 'cycle'
                   lost =3D (next_cycle !=3D cycle);
                           ^~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:912:7: note: 'lost' is false
                   if (lost) {
                       ^~~~
   sound/firewire/amdtp-stream.c:912:3: note: Taking false branch
                   if (lost) {
                   ^
   sound/firewire/amdtp-stream.c:946:9: note: Calling 'parse_ir_ctx_header'
                   err =3D parse_ir_ctx_header(s, cycle, ctx_header, &data_=
blocks, &dbc, &syt,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:807:19: note: '?' condition is false
           payload_length =3D be32_to_cpu(ctx_header[0]) >> ISO_DATA_LENGTH=
_SHIFT;
                            ^
   include/linux/byteorder/generic.h:95:21: note: expanded from macro 'be32=
_to_cpu'
   #define be32_to_cpu __be32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:41:26: note: expanded from =
macro '__be32_to_cpu'
   #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
                            ^
   include/uapi/linux/swab.h:118:3: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
            ^
   sound/firewire/amdtp-stream.c:809:6: note: Assuming the condition is true
           if (!(s->flags & CIP_NO_HEADER))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:809:2: note: Taking true branch
           if (!(s->flags & CIP_NO_HEADER))
           ^
   sound/firewire/amdtp-stream.c:814:6: note: Assuming the condition is fal=
se
           if (payload_length > cip_header_size + s->ctx_data.tx.max_ctx_pa=
yload_length) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:814:2: note: Taking false branch
           if (payload_length > cip_header_size + s->ctx_data.tx.max_ctx_pa=
yload_length) {
           ^
   sound/firewire/amdtp-stream.c:821:6: note: 'cip_header_size' is > 0
           if (cip_header_size > 0) {
               ^~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:821:2: note: Taking true branch
           if (cip_header_size > 0) {
           ^
   sound/firewire/amdtp-stream.c:822:7: note: Assuming 'payload_length' is =
>=3D 'cip_header_size'
                   if (payload_length >=3D cip_header_size) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:822:3: note: Taking true branch
                   if (payload_length >=3D cip_header_size) {
--
           if ((((cip_header[0] & CIP_EOH_MASK) =3D=3D CIP_EOH) ||
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:721:7: note: Left side of '||' is false
           if ((((cip_header[0] & CIP_EOH_MASK) =3D=3D CIP_EOH) ||
                ^
   sound/firewire/amdtp-stream.c:722:8: note: Assuming the condition is fal=
se
                ((cip_header[1] & CIP_EOH_MASK) !=3D CIP_EOH)) &&
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:722:52: note: Left side of '&&' is false
                ((cip_header[1] & CIP_EOH_MASK) !=3D CIP_EOH)) &&
                                                             ^
   sound/firewire/amdtp-stream.c:733:6: note: Assuming 'sph' is equal to fi=
eld 'sph'
           if (sph !=3D s->sph || fmt !=3D s->fmt) {
               ^~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:733:6: note: Left side of '||' is false
   sound/firewire/amdtp-stream.c:733:23: note: Assuming 'fmt' is equal to f=
ield 'fmt'
           if (sph !=3D s->sph || fmt !=3D s->fmt) {
                                ^~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:733:2: note: Taking false branch
           if (sph !=3D s->sph || fmt !=3D s->fmt) {
           ^
   sound/firewire/amdtp-stream.c:742:6: note: Assuming 'payload_length' is =
not equal to 0
           if (payload_length =3D=3D 0 || (fmt =3D=3D CIP_FMT_AM && fdf =3D=
=3D AMDTP_FDF_NO_DATA)) {
               ^~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:742:6: note: Left side of '||' is false
   sound/firewire/amdtp-stream.c:742:30: note: Assuming 'fmt' is not equal =
to CIP_FMT_AM
           if (payload_length =3D=3D 0 || (fmt =3D=3D CIP_FMT_AM && fdf =3D=
=3D AMDTP_FDF_NO_DATA)) {
                                       ^~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:742:48: note: Left side of '&&' is false
           if (payload_length =3D=3D 0 || (fmt =3D=3D CIP_FMT_AM && fdf =3D=
=3D AMDTP_FDF_NO_DATA)) {
                                                         ^
   sound/firewire/amdtp-stream.c:748:7: note: Assuming 'data_block_quadlets=
' is not equal to 0
                   if (data_block_quadlets =3D=3D 0) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:748:3: note: Taking false branch
                   if (data_block_quadlets =3D=3D 0) {
                   ^
   sound/firewire/amdtp-stream.c:754:7: note: Assuming the condition is fal=
se
                   if (s->flags & CIP_WRONG_DBS)
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:754:3: note: Taking false branch
                   if (s->flags & CIP_WRONG_DBS)
                   ^
   sound/firewire/amdtp-stream.c:762:6: note: Assuming the condition is fal=
se
           if (*data_blocks =3D=3D 0 && (s->flags & CIP_EMPTY_HAS_WRONG_DBC=
) &&
               ^~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:762:24: note: Left side of '&&' is false
           if (*data_blocks =3D=3D 0 && (s->flags & CIP_EMPTY_HAS_WRONG_DBC=
) &&
                                 ^
   sound/firewire/amdtp-stream.c:766:7: note: Assuming 'dbc' is not equal t=
o 0
           if ((dbc =3D=3D 0x00 && (s->flags & CIP_SKIP_DBC_ZERO_CHECK)) ||
                ^~~~~~~~~~~
   sound/firewire/amdtp-stream.c:766:19: note: Left side of '&&' is false
           if ((dbc =3D=3D 0x00 && (s->flags & CIP_SKIP_DBC_ZERO_CHECK)) ||
                            ^
   sound/firewire/amdtp-stream.c:767:6: note: Assuming the condition is true
               *data_block_counter =3D=3D UINT_MAX) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:766:2: note: Taking true branch
           if ((dbc =3D=3D 0x00 && (s->flags & CIP_SKIP_DBC_ZERO_CHECK)) ||
           ^
   sound/firewire/amdtp-stream.c:782:6: note: 'lost' is false
           if (lost) {
               ^~~~
   sound/firewire/amdtp-stream.c:782:2: note: Taking false branch
           if (lost) {
           ^
   sound/firewire/amdtp-stream.c:791:6: note: Assuming the condition is fal=
se
           if (!(s->flags & CIP_UNAWARE_SYT))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:791:2: note: Taking false branch
           if (!(s->flags & CIP_UNAWARE_SYT))
           ^
   sound/firewire/amdtp-stream.c:794:2: note: Returning without writing to =
'*syt'
           return 0;
           ^
   sound/firewire/amdtp-stream.c:826:10: note: Returning from 'check_cip_he=
ader'
                           err =3D check_cip_header(s, cip_header, payload_=
length - cip_header_size,
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:828:8: note: 'err' is >=3D 0
                           if (err < 0)
                               ^~~
   sound/firewire/amdtp-stream.c:828:4: note: Taking false branch
                           if (err < 0)
                           ^
   sound/firewire/amdtp-stream.c:848:2: note: Returning without writing to =
'*syt'
           return 0;
           ^
   sound/firewire/amdtp-stream.c:946:9: note: Returning from 'parse_ir_ctx_=
header'
                   err =3D parse_ir_ctx_header(s, cycle, ctx_header, &data_=
blocks, &dbc, &syt,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:948:7: note: 'err' is >=3D 0
                   if (err < 0)
                       ^~~
   sound/firewire/amdtp-stream.c:948:3: note: Taking false branch
                   if (err < 0)
                   ^
   sound/firewire/amdtp-stream.c:952:13: note: Assigned value is garbage or=
 undefined
                   desc->syt =3D syt;
                             ^ ~~~
>> sound/firewire/amdtp-stream.c:1683:41: warning: Division by zero [clang-=
analyzer-core.DivideZero]
                                   sched_irq =3D !((s->packet_index + 1) %
                                                                       ^
   sound/firewire/amdtp-stream.c:1949:6: note: Assuming 'replay_seq' is fal=
se
           if (replay_seq) {
               ^~~~~~~~~~
   sound/firewire/amdtp-stream.c:1949:2: note: Taking false branch
           if (replay_seq) {
           ^
   sound/firewire/amdtp-stream.c:1958:2: note: Loop condition is true.  Ent=
ering loop body
           list_for_each_entry(s, &d->streams, list) {
           ^
   include/linux/list.h:674:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   sound/firewire/amdtp-stream.c:1959:7: note: Assuming field 'direction' i=
s equal to AMDTP_OUT_STREAM
                   if (s->direction =3D=3D AMDTP_OUT_STREAM) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1959:3: note: Taking true branch
                   if (s->direction =3D=3D AMDTP_OUT_STREAM) {
                   ^
   sound/firewire/amdtp-stream.c:1961:4: note:  Execution continues on line=
 1964
                           break;
                           ^
   sound/firewire/amdtp-stream.c:1964:7: note: 'found' is true
           if (!found)
                ^~~~~
   sound/firewire/amdtp-stream.c:1964:2: note: Taking false branch
           if (!found)
           ^
   sound/firewire/amdtp-stream.c:1973:6: note: Assuming 'events_per_period'=
 is not equal to 0
           if (events_per_period =3D=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1973:2: note: Taking false branch
           if (events_per_period =3D=3D 0)
           ^
   sound/firewire/amdtp-stream.c:1975:6: note: Assuming 'events_per_buffer'=
 is not equal to 0
           if (events_per_buffer =3D=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1975:2: note: Taking false branch
           if (events_per_buffer =3D=3D 0)
           ^
   sound/firewire/amdtp-stream.c:1981:2: note: Loop condition is true.  Ent=
ering loop body
           list_for_each_entry(s, &d->streams, list) {
           ^
   include/linux/list.h:674:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   sound/firewire/amdtp-stream.c:1984:10: note: Field 'direction' is equal =
to AMDTP_OUT_STREAM
                   if (s->direction =3D=3D AMDTP_OUT_STREAM && s =3D=3D d->=
irq_target) {
                          ^
   sound/firewire/amdtp-stream.c:1984:7: note: Left side of '&&' is true
                   if (s->direction =3D=3D AMDTP_OUT_STREAM && s =3D=3D d->=
irq_target) {
                       ^
   sound/firewire/amdtp-stream.c:1984:43: note: 's' is equal to field 'irq_=
target'
                   if (s->direction =3D=3D AMDTP_OUT_STREAM && s =3D=3D d->=
irq_target) {
                                                           ^
   sound/firewire/amdtp-stream.c:1984:3: note: Taking true branch
                   if (s->direction =3D=3D AMDTP_OUT_STREAM && s =3D=3D d->=
irq_target) {
                   ^
   sound/firewire/amdtp-stream.c:1991:7: note: 'err' is >=3D 0
                   if (err < 0)
                       ^~~
   sound/firewire/amdtp-stream.c:1991:3: note: Taking false branch
                   if (err < 0)
                   ^
   sound/firewire/amdtp-stream.c:1981:2: note: Loop condition is true.  Ent=
ering loop body
           list_for_each_entry(s, &d->streams, list) {
           ^
   include/linux/list.h:674:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   sound/firewire/amdtp-stream.c:1982:3: note: 'idle_irq_interval' initiali=
zed to 0
                   unsigned int idle_irq_interval =3D 0;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1984:7: note: Assuming field 'direction' i=
s not equal to AMDTP_OUT_STREAM
                   if (s->direction =3D=3D AMDTP_OUT_STREAM && s =3D=3D d->=
irq_target) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1984:40: note: Left side of '&&' is false
                   if (s->direction =3D=3D AMDTP_OUT_STREAM && s =3D=3D d->=
irq_target) {
                                                        ^
   sound/firewire/amdtp-stream.c:1990:65: note: Passing the value 0 via 5th=
 parameter 'idle_irq_interval'
                   err =3D amdtp_stream_start(s, s->channel, s->speed, queu=
e_size, idle_irq_interval);
                                                                           =
      ^~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1990:9: note: Calling 'amdtp_stream_start'
                   err =3D amdtp_stream_start(s, s->channel, s->speed, queu=
e_size, idle_irq_interval);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1558:14: note: Calling 'amdtp_stream_runni=
ng'
           if (WARN_ON(amdtp_stream_running(s) ||
                       ^
   include/asm-generic/bug.h:122:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   sound/firewire/amdtp-stream.h:239:2: note: Returning without writing to =
's->pkt_descs', which participates in a condition later
           return !IS_ERR(s->context);
           ^
   sound/firewire/amdtp-stream.c:1558:14: note: Returning from 'amdtp_strea=
m_running'
           if (WARN_ON(amdtp_stream_running(s) ||
                       ^
   include/asm-generic/bug.h:122:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
--
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-disk.c:228:2: warning: Call to f=
unction 'memcpy' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memcpy_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&smd->sm, &ops, sizeof(smd->sm));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-disk.c:228:2: note: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&smd->sm, &ops, sizeof(smd->sm));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-disk.c:262:2: warning: Call to f=
unction 'memcpy' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memcpy_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&smd->sm, &ops, sizeof(smd->sm));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-disk.c:262:2: note: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&smd->sm, &ops, sizeof(smd->sm));
           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/md/persistent-data/dm-space-map-metadata.c:150:2: warning: Call =
to function 'memcpy' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memcpy_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(result, bop, sizeof(*result));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:150:2: note: Call to =
function 'memcpy' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(result, bop, sizeof(*result));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:514:2: warning: Call =
to function 'memcpy' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memcpy_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&smm->old_ll, &smm->ll, sizeof(smm->old_ll));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:514:2: note: Call to =
function 'memcpy' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&smm->old_ll, &smm->ll, sizeof(smm->old_ll));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:552:2: warning: Call =
to function 'memcpy' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memcpy_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(where_le, &root_le, sizeof(root_le));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:552:2: note: Call to =
function 'memcpy' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(where_le, &root_le, sizeof(root_le));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:725:2: warning: Call =
to function 'memcpy' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memcpy_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(sm, &bootstrap_ops, sizeof(*sm));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:725:2: note: Call to =
function 'memcpy' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(sm, &bootstrap_ops, sizeof(*sm));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:761:2: warning: Call =
to function 'memcpy' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memcpy_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(sm, &ops, sizeof(*sm));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:761:2: note: Call to =
function 'memcpy' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(sm, &ops, sizeof(*sm));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:775:2: warning: Call =
to function 'memcpy' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memcpy_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&smm->sm, &ops, sizeof(smm->sm));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:775:2: note: Call to =
function 'memcpy' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&smm->sm, &ops, sizeof(smm->sm));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:794:2: warning: Call =
to function 'memcpy' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memcpy_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&smm->sm, &bootstrap_ops, sizeof(smm->sm));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:794:2: note: Call to =
function 'memcpy' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&smm->sm, &bootstrap_ops, sizeof(smm->sm));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:802:2: warning: Call =
to function 'memcpy' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memcpy_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&smm->sm, &ops, sizeof(smm->sm));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:802:2: note: Call to =
function 'memcpy' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&smm->sm, &ops, sizeof(smm->sm));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:840:2: warning: Call =
to function 'memcpy' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memcpy_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&smm->old_ll, &smm->ll, sizeof(smm->old_ll));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:840:2: note: Call to =
function 'memcpy' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&smm->old_ll, &smm->ll, sizeof(smm->old_ll));
           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   fs/ntfs3/lznt.c:221:2: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cmpr + sizeof(short), unc, LZNT_CHUNK_SIZE);
           ^~~~~~
   fs/ntfs3/lznt.c:221:2: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
           memcpy(cmpr + sizeof(short), unc, LZNT_CHUNK_SIZE);
           ^~~~~~
   fs/ntfs3/lznt.c:328:3: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(ctx->hash, 0, sizeof(ctx->hash));
                   ^~~~~~
   fs/ntfs3/lznt.c:328:3: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
                   memset(ctx->hash, 0, sizeof(ctx->hash));
                   ^~~~~~
   fs/ntfs3/lznt.c:404:4: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(unc_chunk, cmpr_chunk + sizeof(chunk_hdr),
                           ^~~~~~
   fs/ntfs3/lznt.c:404:4: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
                           memcpy(unc_chunk, cmpr_chunk + sizeof(chunk_hdr),
                           ^~~~~~
   fs/ntfs3/lznt.c:439:4: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(unc_chunk, 0, t1);
                           ^~~~~~
   fs/ntfs3/lznt.c:439:4: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
                           memset(unc_chunk, 0, t1);
                           ^~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
>> sound/firewire/bebob/bebob.c:109:2: warning: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(bebob->card->shortname, model);
           ^~~~~~
   sound/firewire/bebob/bebob.c:109:2: note: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119
           strcpy(bebob->card->shortname, model);
           ^~~~~~
   sound/firewire/bebob/bebob.c:110:2: warning: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(bebob->card->mixername, model);
           ^~~~~~
   sound/firewire/bebob/bebob.c:110:2: note: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119
           strcpy(bebob->card->mixername, model);
           ^~~~~~
   sound/firewire/bebob/bebob.c:111:2: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(bebob->card->longname, sizeof(bebob->card->longname),
           ^~~~~~~~
   sound/firewire/bebob/bebob.c:111:2: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
           snprintf(bebob->card->longname, sizeof(bebob->card->longname),
           ^~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   sound/usb/mixer_scarlett_gen2.c:1125:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(req->data, req_data, req_size);
                   ^~~~~~
   sound/usb/mixer_scarlett_gen2.c:1125:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(req->data, req_data, req_size);
                   ^~~~~~
   sound/usb/mixer_scarlett_gen2.c:1181:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(resp_data, resp->data, resp_size);
                   ^~~~~~
   sound/usb/mixer_scarlett_gen2.c:1181:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(resp_data, resp->data, resp_size);
                   ^~~~~~
   sound/usb/mixer_scarlett_gen2.c:2903:3: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(s, sizeof(s),
                   ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:2903:3: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(s, sizeof(s),
                   ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3001:3: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(s, sizeof(s), "Master HW Playback Volume");
                   ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3001:3: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(s, sizeof(s), "Master HW Playback Volume");
                   ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3015:4: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(s, sizeof(s),
                           ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3015:4: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                           snprintf(s, sizeof(s),
                           ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3019:4: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(s, sizeof(s),
                           ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3019:4: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                           snprintf(s, sizeof(s),
                           ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3029:3: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(s, sizeof(s),
                   ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3029:3: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(s, sizeof(s),
                   ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3047:4: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(s, sizeof(s),
                           ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3047:4: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                           snprintf(s, sizeof(s),
                           ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3092:3: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(s, sizeof(s), fmt, i + 1 + info->level_input_fi=
rst,
                   ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3092:3: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(s, sizeof(s), fmt, i + 1 + info->level_input_fi=
rst,
                   ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3102:3: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(s, sizeof(s), fmt, i + 1, "Pad", "Switch");
                   ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3102:3: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(s, sizeof(s), fmt, i + 1, "Pad", "Switch");
                   ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3111:3: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(s, sizeof(s), fmt, i + 1, "Air", "Switch");
                   ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3111:3: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(s, sizeof(s), fmt, i + 1, "Air", "Switch");
                   ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3121:4: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(s, sizeof(s), fmt, i + 1,
                           ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3121:4: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                           snprintf(s, sizeof(s), fmt, i + 1,
                           ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3134:4: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(s, sizeof(s), fmt2, from, to,
                           ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3134:4: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                           snprintf(s, sizeof(s), fmt2, from, to,
                           ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3244:4: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(s, sizeof(s),
                           ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3244:4: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                           snprintf(s, sizeof(s),
                           ^~~~~~~~
>> sound/usb/mixer_scarlett_gen2.c:3283:4: warning: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsaf=
eBufferHandling]
                           sprintf(uinfo->value.enumerated.name,
                           ^~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3283:4: note: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11
                           sprintf(uinfo->value.enumerated.name,
                           ^~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3378:4: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(s, sizeof(s) - 5, descr, channel + 1);
                           ^~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3378:4: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                           snprintf(s, sizeof(s) - 5, descr, channel + 1);
                           ^~~~~~~~
>> sound/usb/mixer_scarlett_gen2.c:3379:4: warning: Call to function 'strca=
t' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strc=
py]
                           strcat(s, " Enum");
                           ^~~~~~
   sound/usb/mixer_scarlett_gen2.c:3379:4: note: Call to function 'strcat' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcat'. CWE-119
                           strcat(s, " Enum");
                           ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/vfio/pci/vfio_pci_config.c:180:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(val, vdev->vconfig + pos, count);
           ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:180:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(val, vdev->vconfig + pos, count);
           ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:182:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&virt, perm->virt + offset, count);
           ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:182:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&virt, perm->virt + offset, count);
           ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:206:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&write, perm->write + offset, count);
           ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:206:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&write, perm->write + offset, count);
           ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:211:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&virt, perm->virt + offset, count);
           ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:211:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&virt, perm->virt + offset, count);
           ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:217:3: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&virt_val, vdev->vconfig + pos, count);
                   ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:217:3: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&virt_val, vdev->vconfig + pos, count);
                   ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:222:3: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(vdev->vconfig + pos, &virt_val, count);
                   ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:222:3: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(vdev->vconfig + pos, &virt_val, count);
                   ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:259:4: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(val, vdev->vconfig + pos, count);
                           ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:259:4: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(val, vdev->vconfig + pos, count);
                           ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:262:4: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(val, vdev->vconfig + pos,
                           ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:262:4: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(val, vdev->vconfig + pos,
                           ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:265:4: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(val, vdev->vconfig + pos, 1);
                           ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:265:4: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(val, vdev->vconfig + pos, 1);
                           ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:303:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(vdev->vconfig + pos, &val, count);
           ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:303:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(vdev->vconfig + pos, &val, count);
           ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:311:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(val, vdev->vconfig + pos, count);
           ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:311:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(val, vdev->vconfig + pos, count);
           ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:1580:3: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(map + pos, cap, len);
                   ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:1580:3: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
                   memset(map + pos, cap, len);
                   ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:1673:3: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(map + epos, ecap, len);
                   ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:1673:3: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
                   memset(map + epos, ecap, len);
                   ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:1747:2: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(map, PCI_CAP_ID_BASIC, PCI_STD_HEADER_SIZEOF);
           ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:1747:2: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
           memset(map, PCI_CAP_ID_BASIC, PCI_STD_HEADER_SIZEOF);
           ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:1748:2: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(map + PCI_STD_HEADER_SIZEOF, PCI_CAP_ID_INVALID,
           ^~~~~~
   drivers/vfio/pci/vfio_pci_config.c:1748:2: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
           memset(map + PCI_STD_HEADER_SIZEOF, PCI_CAP_ID_INVALID,
--
   sound/virtio/virtio_pcm.c:428:3: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
                   snprintf(vpcm->pcm->name, sizeof(vpcm->pcm->name),
                   ^~~~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   sound/virtio/virtio_pcm_msg.c:224:3: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&msg->status, 0, sizeof(msg->status));
                   ^~~~~~
   sound/virtio/virtio_pcm_msg.c:224:3: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
                   memset(&msg->status, 0, sizeof(msg->status));
                   ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/comedi/drivers/pcmmio.c:577:2: warning: Value stored to 'val' is=
 never read [clang-analyzer-deadcode.DeadStores]
           val |=3D inb(iobase + PCMMIO_AI_MSB_REG) << 8;
           ^
   drivers/comedi/drivers/pcmmio.c:577:2: note: Value stored to 'val' is ne=
ver read
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/ata/acard-ahci.c:228:3: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(cmd_tbl + AHCI_CMD_TBL_CDB, 0, 32);
                   ^~~~~~
   drivers/ata/acard-ahci.c:228:3: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                   memset(cmd_tbl + AHCI_CMD_TBL_CDB, 0, 32);
                   ^~~~~~
   drivers/ata/acard-ahci.c:229:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(cmd_tbl + AHCI_CMD_TBL_CDB, qc->cdb, qc->dev->cdb=
_len);
                   ^~~~~~
   drivers/ata/acard-ahci.c:229:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(cmd_tbl + AHCI_CMD_TBL_CDB, qc->cdb, qc->dev->cdb=
_len);
                   ^~~~~~
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/ata/pdc_adma.c:351:2: warning: Value stored to 'i' is never read=
 [clang-analyzer-deadcode.DeadStores]
           i =3D adma_fill_sg(qc);
           ^   ~~~~~~~~~~~~~~~~
   drivers/ata/pdc_adma.c:351:2: note: Value stored to 'i' is never read
           i =3D adma_fill_sg(qc);
           ^   ~~~~~~~~~~~~~~~~
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   sound/firewire/fireface/ff-hwdep.c:37:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&event, 0, sizeof(event));
           ^~~~~~
   sound/firewire/fireface/ff-hwdep.c:37:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(&event, 0, sizeof(event));
           ^~~~~~
   sound/firewire/fireface/ff-hwdep.c:75:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&info, 0, sizeof(info));
           ^~~~~~
   sound/firewire/fireface/ff-hwdep.c:75:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(&info, 0, sizeof(info));
           ^~~~~~
>> sound/firewire/fireface/ff-hwdep.c:181:2: warning: Call to function 'str=
cpy' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.st=
rcpy]
           strcpy(hwdep->name, ff->card->driver);
           ^~~~~~
   sound/firewire/fireface/ff-hwdep.c:181:2: note: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119
           strcpy(hwdep->name, ff->card->driver);
           ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   sound/firewire/fireworks/fireworks_transaction.c:146:3: warning: Call to=
 function 'memcpy' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memcpy_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(efw->push_ptr, data, till_end);
                   ^~~~~~
   sound/firewire/fireworks/fireworks_transaction.c:146:3: note: Call to fu=
nction 'memcpy' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(efw->push_ptr, data, till_end);
                   ^~~~~~
   sound/firewire/fireworks/fireworks_transaction.c:217:4: warning: Call to=
 function 'memcpy' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memcpy_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(t->buf, data, t->size);
                           ^~~~~~
   sound/firewire/fireworks/fireworks_transaction.c:217:4: note: Call to fu=
nction 'memcpy' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(t->buf, data, t->size);
                           ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   fs/ntfs3/namei.c:38:3: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(fname->name, uni->name, uni->len * sizeof(u16));
                   ^~~~~~
   fs/ntfs3/namei.c:38:3: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
                   memcpy(fname->name, uni->name, uni->len * sizeof(u16));
                   ^~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   sound/firewire/digi00x/digi00x-pcm.c:353:2: warning: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(pcm->name, sizeof(pcm->name),
           ^~~~~~~~
   sound/firewire/digi00x/digi00x-pcm.c:353:2: note: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(pcm->name, sizeof(pcm->name),
           ^~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   sound/firewire/digi00x/digi00x-hwdep.c:38:2: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&event, 0, sizeof(event));
           ^~~~~~
   sound/firewire/digi00x/digi00x-hwdep.c:38:2: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
           memset(&event, 0, sizeof(event));
           ^~~~~~
   sound/firewire/digi00x/digi00x-hwdep.c:85:2: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&info, 0, sizeof(info));
           ^~~~~~
   sound/firewire/digi00x/digi00x-hwdep.c:85:2: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
           memset(&info, 0, sizeof(info));
           ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   sound/drivers/serial-u16550.c:797:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(uart->prev_status, 0x80, sizeof(unsigned char) * SNDRV_SE=
RIAL_MAX_OUTS);
           ^~~~~~
   sound/drivers/serial-u16550.c:797:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(uart->prev_status, 0x80, sizeof(unsigned char) * SNDRV_SE=
RIAL_MAX_OUTS);
           ^~~~~~
   sound/drivers/serial-u16550.c:828:3: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(substream->name, "Serial MIDI %d", substream->nu=
mber + 1);
                   ^~~~~~~
   sound/drivers/serial-u16550.c:828:3: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(substream->name, "Serial MIDI %d", substream->nu=
mber + 1);
                   ^~~~~~~
   sound/drivers/serial-u16550.c:920:2: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
           sprintf(card->longname, "%s [%s] at %#lx, irq %d",
           ^~~~~~~
   sound/drivers/serial-u16550.c:920:2: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
           sprintf(card->longname, "%s [%s] at %#lx, irq %d",
           ^~~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/md/persistent-data/dm-btree-spine.c:251:2: warning: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&v1_le, value1_le, sizeof(v1_le));
           ^~~~~~
   drivers/md/persistent-data/dm-btree-spine.c:251:2: note: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&v1_le, value1_le, sizeof(v1_le));
           ^~~~~~
   drivers/md/persistent-data/dm-btree-spine.c:252:2: warning: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&v2_le, value2_le, sizeof(v2_le));
           ^~~~~~
   drivers/md/persistent-data/dm-btree-spine.c:252:2: note: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&v2_le, value2_le, sizeof(v2_le));
           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/modeflag +2698 drivers/video/fbdev/sis/init301.c

^1da177e4c3f41 drivers/video/sis/init301.c Linus Torvalds      2005-04-16  =
2697  =

544393fe584d33 drivers/video/sis/init301.c Thomas Winischhofer 2005-09-09 @=
2698    modeflag =3D SiS_GetModeFlag(SiS_Pr, ModeNo, ModeIdIndex);
^1da177e4c3f41 drivers/video/sis/init301.c Linus Torvalds      2005-04-16  =
2699  =

^1da177e4c3f41 drivers/video/sis/init301.c Linus Torvalds      2005-04-16  =
2700    if(SiS_Pr->SiS_VBInfo & SetCRT2ToLCDA) {
^1da177e4c3f41 drivers/video/sis/init301.c Linus Torvalds      2005-04-16  =
2701  =

^1da177e4c3f41 drivers/video/sis/init301.c Linus Torvalds      2005-04-16  =
2702       SiS_SetRegANDOR(SiS_Pr->SiS_Part1Port,0x00,0xAF,0x40);
^1da177e4c3f41 drivers/video/sis/init301.c Linus Torvalds      2005-04-16  =
2703       SiS_SetRegAND(SiS_Pr->SiS_Part1Port,0x2E,0xF7);
^1da177e4c3f41 drivers/video/sis/init301.c Linus Torvalds      2005-04-16  =
2704  =

^1da177e4c3f41 drivers/video/sis/init301.c Linus Torvalds      2005-04-16  =
2705    } else {
^1da177e4c3f41 drivers/video/sis/init301.c Linus Torvalds      2005-04-16  =
2706  =

^1da177e4c3f41 drivers/video/sis/init301.c Linus Torvalds      2005-04-16  =
2707       for(i=3D0,j=3D4; i<3; i++,j++) SiS_SetReg(SiS_Pr->SiS_Part1Port,=
j,0);
544393fe584d33 drivers/video/sis/init301.c Thomas Winischhofer 2005-09-09  =
2708       if(SiS_Pr->ChipType >=3D SIS_315H) {
^1da177e4c3f41 drivers/video/sis/init301.c Linus Torvalds      2005-04-16  =
2709          SiS_SetRegAND(SiS_Pr->SiS_Part1Port,0x02,0x7F);
^1da177e4c3f41 drivers/video/sis/init301.c Linus Torvalds      2005-04-16  =
2710       }
^1da177e4c3f41 drivers/video/sis/init301.c Linus Torvalds      2005-04-16  =
2711  =

^1da177e4c3f41 drivers/video/sis/init301.c Linus Torvalds      2005-04-16  =
2712       tempcl =3D SiS_Pr->SiS_ModeType;
^1da177e4c3f41 drivers/video/sis/init301.c Linus Torvalds      2005-04-16  =
2713  =

544393fe584d33 drivers/video/sis/init301.c Thomas Winischhofer 2005-09-09  =
2714       if(SiS_Pr->ChipType < SIS_315H) {
^1da177e4c3f41 drivers/video/sis/init301.c Linus Torvalds      2005-04-16  =
2715  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6374688610803545714==--

