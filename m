Content-Type: multipart/mixed; boundary="===============4644290379679897608=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/pci/mixart/mixart_hwdep.c:568:3: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments o...
Date: Sat, 16 Apr 2022 05:00:24 +0800
Message-ID: <202204160459.l1Noihzt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4644290379679897608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   028192fea1de083f4f12bfb1eb7c4d7beb5c8ecd
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   5 weeks ago
:::::: branch date: 21 hours ago
:::::: commit date: 5 weeks ago
config: riscv-randconfig-c006-20220414 (https://download.01.org/0day-ci/arc=
hive/20220416/202204160459.l1Noihzt-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b7e6e=
a489f6dd45a9b0da9ac20871560917b9b0)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                  ^~~~~~~
   drivers/thermal/thermal_sysfs.c:576:9: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
           return sprintf(buf, "%s\n", cdev->type);
                  ^~~~~~~
   drivers/thermal/thermal_sysfs.c:589:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", state);
                  ^~~~~~~
   drivers/thermal/thermal_sysfs.c:589:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", state);
                  ^~~~~~~
   drivers/thermal/thermal_sysfs.c:602:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", state);
                  ^~~~~~~
   drivers/thermal/thermal_sysfs.c:602:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", state);
                  ^~~~~~~
   drivers/thermal/thermal_sysfs.c:616:6: warning: Call to function 'sscanf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(buf, "%ld\n", &state) !=3D 1)
               ^~~~~~
   drivers/thermal/thermal_sysfs.c:616:6: note: Call to function 'sscanf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(buf, "%ld\n", &state) !=3D 1)
               ^~~~~~
   drivers/thermal/thermal_sysfs.c:884:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", instance->trip);
                  ^~~~~~~
   drivers/thermal/thermal_sysfs.c:884:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", instance->trip);
                  ^~~~~~~
   drivers/thermal/thermal_sysfs.c:894:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", instance->weight);
                  ^~~~~~~
   drivers/thermal/thermal_sysfs.c:894:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", instance->weight);
                  ^~~~~~~
   Suppressed 19 warnings (19 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/staging/sm750fb/sm750_accel.c:161:2: warning: Value stored to 'd=
e_ctrl' is never read [clang-analyzer-deadcode.DeadStores]
           de_ctrl =3D 0;
           ^         ~
   drivers/staging/sm750fb/sm750_accel.c:161:2: note: Value stored to 'de_c=
trl' is never read
           de_ctrl =3D 0;
           ^         ~
   drivers/staging/sm750fb/sm750_accel.c:404:4: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(ajRemain, pSrcbuf + ul4BytesPerScan,
                           ^~~~~~
   drivers/staging/sm750fb/sm750_accel.c:404:4: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(ajRemain, pSrcbuf + ul4BytesPerScan,
                           ^~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/staging/sm750fb/sm750_cursor.c:102:2: warning: Value stored to '=
data' is never read [clang-analyzer-deadcode.DeadStores]
           data =3D 0;
           ^      ~
   drivers/staging/sm750fb/sm750_cursor.c:102:2: note: Value stored to 'dat=
a' is never read
           data =3D 0;
           ^      ~
   drivers/staging/sm750fb/sm750_cursor.c:152:2: warning: Value stored to '=
data' is never read [clang-analyzer-deadcode.DeadStores]
           data =3D 0;
           ^      ~
   drivers/staging/sm750fb/sm750_cursor.c:152:2: note: Value stored to 'dat=
a' is never read
           data =3D 0;
           ^      ~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/staging/sm750fb/ddk750_swi2c.c:99:3: warning: Value stored to 't=
mp' is never read [clang-analyzer-deadcode.DeadStores]
                   tmp +=3D i;
                   ^      ~
   drivers/staging/sm750fb/ddk750_swi2c.c:99:3: note: Value stored to 'tmp'=
 is never read
                   tmp +=3D i;
                   ^      ~
   Suppressed 18 warnings (17 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   sound/pci/mixart/mixart_hwdep.c:107:4: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy( &elf_programheader, dsp->data + pos, siz=
eof(elf_programheader) );
                           ^~~~~~
   sound/pci/mixart/mixart_hwdep.c:107:4: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
                           memcpy( &elf_programheader, dsp->data + pos, siz=
eof(elf_programheader) );
                           ^~~~~~
>> sound/pci/mixart/mixart_hwdep.c:568:3: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
                   sprintf(path, "mixart/%s", fw_files[i]);
                   ^~~~~~~
   sound/pci/mixart/mixart_hwdep.c:568:3: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
                   sprintf(path, "mixart/%s", fw_files[i]);
                   ^~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/mtd/mtdsuper.c:28:19: warning: Value stored to 'mtd' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct mtd_info *mtd =3D fc->sget_key;
                            ^~~   ~~~~~~~~~~~~
   drivers/mtd/mtdsuper.c:28:19: note: Value stored to 'mtd' during its ini=
tialization is never read
           struct mtd_info *mtd =3D fc->sget_key;
                            ^~~   ~~~~~~~~~~~~
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/mtd/mtdconcat.c:67:4: warning: Value stored to 'size' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           size =3D 0;
                           ^      ~
   drivers/mtd/mtdconcat.c:67:4: note: Value stored to 'size' is never read
                           size =3D 0;
                           ^      ~
   drivers/mtd/mtdconcat.c:159:4: warning: Value stored to 'size' is never =
read [clang-analyzer-deadcode.DeadStores]
                           size =3D 0;
                           ^      ~
   drivers/mtd/mtdconcat.c:159:4: note: Value stored to 'size' is never read
                           size =3D 0;
                           ^      ~
   drivers/mtd/mtdconcat.c:492:4: warning: Value stored to 'size' is never =
read [clang-analyzer-deadcode.DeadStores]
                           size =3D 0;
                           ^      ~
   drivers/mtd/mtdconcat.c:492:4: note: Value stored to 'size' is never read
                           size =3D 0;
                           ^      ~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   drivers/mtd/mtdpart.c:259:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&part, 0, sizeof(part));
           ^~~~~~
   drivers/mtd/mtdpart.c:259:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(&part, 0, sizeof(part));
           ^~~~~~
   Suppressed 19 warnings (19 in non-user code).
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
   37 warnings generated.
   drivers/pci/msi/msi.c:371:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&desc, 0, sizeof(desc));
           ^~~~~~
   drivers/pci/msi/msi.c:371:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(&desc, 0, sizeof(desc));
           ^~~~~~
   drivers/pci/msi/msi.c:514:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&desc, 0, sizeof(desc));
           ^~~~~~
   drivers/pci/msi/msi.c:514:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(&desc, 0, sizeof(desc));
           ^~~~~~
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   drivers/pci/msi/msi.c:921:11: note: Calling '__pci_enable_msi_range'
           int rc =3D __pci_enable_msi_range(dev, 1, 1, NULL);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/msi/msi.c:870:6: note: Left side of '||' is false
           if (!pci_msi_supported(dev, minvec) || dev->current_state !=3D P=
CI_D0)
               ^
   drivers/pci/msi/msi.c:870:41: note: Assuming field 'current_state' is eq=
ual to PCI_D0
           if (!pci_msi_supported(dev, minvec) || dev->current_state !=3D P=
CI_D0)
                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/pci/msi/msi.c:870:2: note: Taking false branch
           if (!pci_msi_supported(dev, minvec) || dev->current_state !=3D P=
CI_D0)
           ^
   drivers/pci/msi/msi.c:874:6: note: Assuming field 'msix_enabled' is 0
           if (dev->msix_enabled) {
               ^~~~~~~~~~~~~~~~~
   drivers/pci/msi/msi.c:874:2: note: Taking false branch
           if (dev->msix_enabled) {
           ^
   drivers/pci/msi/msi.c:879:6: note: 'maxvec' is >=3D 'minvec'
           if (maxvec < minvec)
               ^~~~~~
   drivers/pci/msi/msi.c:879:2: note: Taking false branch
           if (maxvec < minvec)
           ^
   drivers/pci/msi/msi.c:882:6: note: Assuming field 'msi_enabled' is 0
           if (WARN_ON_ONCE(dev->msi_enabled))
--
                                   ^
   drivers/regulator/rohm-regulator.c:107:10: note: Calling 'set_dvs_level'
                           ret =3D set_dvs_level(desc, np, regmap, prop, re=
g, mask,
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/regulator/rohm-regulator.c:19:8: note: Calling 'of_property_read=
_u32'
           ret =3D of_property_read_u32(np, prop, &uv);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:1323:9: note: Calling 'of_property_read_u32_array'
           return of_property_read_u32_array(np, propname, out_value, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:1269:6: note: Assuming 'ret' is >=3D 0
           if (ret >=3D 0)
               ^~~~~~~~
   include/linux/of.h:1269:2: note: Taking true branch
           if (ret >=3D 0)
           ^
   include/linux/of.h:1270:3: note: Returning zero, which participates in a=
 condition later
                   return 0;
                   ^~~~~~~~
   include/linux/of.h:1323:9: note: Returning from 'of_property_read_u32_ar=
ray'
           return of_property_read_u32_array(np, propname, out_value, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:1323:2: note: Returning zero, which participates in a=
 condition later
           return of_property_read_u32_array(np, propname, out_value, 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/rohm-regulator.c:19:8: note: Returning from 'of_proper=
ty_read_u32'
           ret =3D of_property_read_u32(np, prop, &uv);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/rohm-regulator.c:20:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/regulator/rohm-regulator.c:20:2: note: Taking false branch
           if (ret) {
           ^
   drivers/regulator/rohm-regulator.c:26:6: note: Assuming 'uv' is not equa=
l to 0
           if (uv =3D=3D 0) {
               ^~~~~~~
   drivers/regulator/rohm-regulator.c:26:2: note: Taking false branch
           if (uv =3D=3D 0) {
           ^
   drivers/regulator/rohm-regulator.c:31:6: note: Assuming 'mask' is not eq=
ual to 0
           if (!mask) {
               ^~~~~
   drivers/regulator/rohm-regulator.c:31:2: note: Taking false branch
           if (!mask) {
           ^
   drivers/regulator/rohm-regulator.c:37:14: note: Assuming 'i' is < field =
'n_voltages'
           for (i =3D 0; i < desc->n_voltages; i++) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/regulator/rohm-regulator.c:37:2: note: Loop condition is true.  =
Entering loop body
           for (i =3D 0; i < desc->n_voltages; i++) {
           ^
   drivers/regulator/rohm-regulator.c:39:7: note: Assuming field 'linear_ra=
nge_selectors' is null
                   if (desc->linear_range_selectors)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/rohm-regulator.c:39:3: note: Taking false branch
                   if (desc->linear_range_selectors)
                   ^
   drivers/regulator/rohm-regulator.c:41:7: note: Assuming field 'n_linear_=
ranges' is 0
                   if (desc->n_linear_ranges)
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/rohm-regulator.c:41:3: note: Taking false branch
                   if (desc->n_linear_ranges)
                   ^
   drivers/regulator/rohm-regulator.c:45:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~~~~~
   drivers/regulator/rohm-regulator.c:45:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/regulator/rohm-regulator.c:47:7: note: Assuming 'ret' is equal t=
o 'uv'
                   if (ret =3D=3D uv) {
                       ^~~~~~~~~
   drivers/regulator/rohm-regulator.c:47:3: note: Taking true branch
                   if (ret =3D=3D uv) {
                   ^
   drivers/regulator/rohm-regulator.c:48:6: note: Assigned value is garbage=
 or undefined
                           i <<=3D ffs(desc->vsel_mask) - 1;
                             ^   ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   sound/pci/via82xx_modem.c:845:2: warning: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(pcm->name, chip->card->shortname);
           ^~~~~~
   sound/pci/via82xx_modem.c:845:2: note: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119
           strcpy(pcm->name, chip->card->shortname);
           ^~~~~~
   sound/pci/via82xx_modem.c:890:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ac97, 0, sizeof(ac97));
           ^~~~~~
   sound/pci/via82xx_modem.c:890:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(&ac97, 0, sizeof(ac97));
           ^~~~~~
   sound/pci/via82xx_modem.c:1125:3: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(card->shortname, "VIA 82XX modem");
                   ^~~~~~~
   sound/pci/via82xx_modem.c:1125:3: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                   sprintf(card->shortname, "VIA 82XX modem");
                   ^~~~~~~
>> sound/pci/via82xx_modem.c:1148:2: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
           sprintf(card->longname, "%s at 0x%lx, irq %d",
           ^~~~~~~
   sound/pci/via82xx_modem.c:1148:2: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
           sprintf(card->longname, "%s at 0x%lx, irq %d",
           ^~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   sound/pci/ac97/ac97_codec.c:1067:3: warning: Value stored to 'val' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   val =3D snd_ac97_read(ac97, reg);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/ac97/ac97_codec.c:1067:3: note: Value stored to 'val' is never=
 read
                   val =3D snd_ac97_read(ac97, reg);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/ac97/ac97_codec.c:1104:3: warning: Value stored to 'val' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   val =3D snd_ac97_read(ac97, reg);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/ac97/ac97_codec.c:1104:3: note: Value stored to 'val' is never=
 read
                   val =3D snd_ac97_read(ac97, reg);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/ac97/ac97_codec.c:1159:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&template, _template, sizeof(template));
           ^~~~~~
   sound/pci/ac97/ac97_codec.c:1159:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(&template, _template, sizeof(template));
           ^~~~~~
   sound/pci/ac97/ac97_codec.c:1288:3: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
                   sprintf(name, "%s Switch", pfx);
                   ^~~~~~~
   sound/pci/ac97/ac97_codec.c:1288:3: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
                   sprintf(name, "%s Switch", pfx);
                   ^~~~~~~
   sound/pci/ac97/ac97_codec.c:1297:3: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
                   sprintf(name, "%s Volume", pfx);
                   ^~~~~~~
   sound/pci/ac97/ac97_codec.c:1297:3: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
                   sprintf(name, "%s Volume", pfx);
                   ^~~~~~~
   sound/pci/ac97/ac97_codec.c:1848:2: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(name, "0x%x %c%c%c", id,
           ^~~~~~~
   sound/pci/ac97/ac97_codec.c:1848:2: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           sprintf(name, "0x%x %c%c%c", id,
           ^~~~~~~
   sound/pci/ac97/ac97_codec.c:1856:2: warning: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(name, pid->name);
           ^~~~~~
   sound/pci/ac97/ac97_codec.c:1856:2: note: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119
           strcpy(name, pid->name);
           ^~~~~~
   sound/pci/ac97/ac97_codec.c:1865:3: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(name, " ");
                   ^~~~~~
   sound/pci/ac97/ac97_codec.c:1865:3: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
                   strcat(name, " ");
                   ^~~~~~
   sound/pci/ac97/ac97_codec.c:1866:3: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(name, pid->name);
                   ^~~~~~
   sound/pci/ac97/ac97_codec.c:1866:3: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
                   strcat(name, pid->name);
                   ^~~~~~
   sound/pci/ac97/ac97_codec.c:1868:4: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           sprintf(name + strlen(name), " rev %d", id & ~pi=
d->mask);
                           ^~~~~~~
   sound/pci/ac97/ac97_codec.c:1868:4: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                           sprintf(name + strlen(name), " rev %d", id & ~pi=
d->mask);
                           ^~~~~~~
   sound/pci/ac97/ac97_codec.c:1875:3: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(name + strlen(name), " id %x", id & 0xff);
                   ^~~~~~~
   sound/pci/ac97/ac97_codec.c:1875:3: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(name + strlen(name), " id %x", id & 0xff);
                   ^~~~~~~
   sound/pci/ac97/ac97_codec.c:2307:4: warning: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(card->mixername, name);
                           ^~~~~~
   sound/pci/ac97/ac97_codec.c:2307:4: note: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119
                           strcpy(card->mixername, name);
                           ^~~~~~
   sound/pci/ac97/ac97_codec.c:2310:5: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                                   strcat(card->mixername, ",");
                                   ^~~~~~
   sound/pci/ac97/ac97_codec.c:2310:5: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
                                   strcat(card->mixername, ",");
                                   ^~~~~~
   sound/pci/ac97/ac97_codec.c:2311:5: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                                   strcat(card->mixername, name);
                                   ^~~~~~
   sound/pci/ac97/ac97_codec.c:2311:5: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
                                   strcat(card->mixername, name);
                                   ^~~~~~
   sound/pci/ac97/ac97_codec.c:2314:3: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(comp, "AC97a:%08x", ac97->id);
                   ^~~~~~~
   sound/pci/ac97/ac97_codec.c:2314:3: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(comp, "AC97a:%08x", ac97->id);
                   ^~~~~~~
   sound/pci/ac97/ac97_codec.c:2328:4: warning: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(card->mixername, name);
--
                           ^~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c:311:4: note: Call to fun=
ction 'memcpy' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(hsfw->image + hsfw->sig.patch_loc,
                           ^~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c:461:11: warning: Call to=
 function 'snprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'snprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           hsfwif =3D nvkm_firmware_load(subdev, fwif->func->load, "AcrLoad=
",
                    ^
   drivers/gpu/drm/nouveau/include/nvkm/core/firmware.h:24:2: note: expande=
d from macro 'nvkm_firmware_load'
           snprintf(_option, sizeof(_option), "Nv%sFw", _opts);            =
       \
           ^~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c:461:11: note: Call to fu=
nction 'snprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'snprintf_s' in case of C=
11
           hsfwif =3D nvkm_firmware_load(subdev, fwif->func->load, "AcrLoad=
",
                    ^
   drivers/gpu/drm/nouveau/include/nvkm/core/firmware.h:24:2: note: expande=
d from macro 'nvkm_firmware_load'
           snprintf(_option, sizeof(_option), "Nv%sFw", _opts);            =
       \
           ^~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c:466:11: warning: Call to=
 function 'snprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'snprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           hsfwif =3D nvkm_firmware_load(subdev, fwif->func->unload, "AcrUn=
load",
                    ^
   drivers/gpu/drm/nouveau/include/nvkm/core/firmware.h:24:2: note: expande=
d from macro 'nvkm_firmware_load'
           snprintf(_option, sizeof(_option), "Nv%sFw", _opts);            =
       \
           ^~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c:466:11: note: Call to fu=
nction 'snprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'snprintf_s' in case of C=
11
           hsfwif =3D nvkm_firmware_load(subdev, fwif->func->unload, "AcrUn=
load",
                    ^
   drivers/gpu/drm/nouveau/include/nvkm/core/firmware.h:24:2: note: expande=
d from macro 'nvkm_firmware_load'
           snprintf(_option, sizeof(_option), "Nv%sFw", _opts);            =
       \
           ^~~~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   sound/pci/atiixp_modem.c:1071:3: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&ac97, 0, sizeof(ac97));
                   ^~~~~~
   sound/pci/atiixp_modem.c:1071:3: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
                   memset(&ac97, 0, sizeof(ac97));
                   ^~~~~~
   sound/pci/atiixp_modem.c:1239:2: warning: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffer=
Handling]
           sprintf(card->longname, "%s rev %x at 0x%lx, irq %i",
           ^~~~~~~
   sound/pci/atiixp_modem.c:1239:2: note: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11
           sprintf(card->longname, "%s rev %x at 0x%lx, irq %i",
           ^~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   sound/pci/cmipci.c:1121:5: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(val, 0, sizeof(*val));
                                   ^~~~~~
   sound/pci/cmipci.c:1121:5: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
                                   memset(val, 0, sizeof(*val));
                                   ^~~~~~
   sound/pci/cmipci.c:1158:5: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(val, 0, sizeof(*val));
                                   ^~~~~~
   sound/pci/cmipci.c:1158:5: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
                                   memset(val, 0, sizeof(*val));
                                   ^~~~~~
   sound/pci/cmipci.c:1318:3: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(runtime->dma_area, 0, PAGE_SIZE);
                   ^~~~~~
   sound/pci/cmipci.c:1318:3: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
                   memset(runtime->dma_area, 0, PAGE_SIZE);
                   ^~~~~~
   sound/pci/cmipci.c:2740:3: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&elem_id, 0, sizeof(elem_id));
                   ^~~~~~
   sound/pci/cmipci.c:2740:3: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
                   memset(&elem_id, 0, sizeof(elem_id));
                   ^~~~~~
   sound/pci/cmipci.c:2742:3: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(elem_id.name, cm_saved_mixer[idx].name);
                   ^~~~~~
   sound/pci/cmipci.c:2742:3: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
                   strcpy(elem_id.name, cm_saved_mixer[idx].name);
                   ^~~~~~
   sound/pci/cmipci.c:3033:3: warning: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(cm->card->driver + strlen(cm->card->driver),
                   ^~~~~~~
   sound/pci/cmipci.c:3033:3: note: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11
                   sprintf(cm->card->driver + strlen(cm->card->driver),
                   ^~~~~~~
   sound/pci/cmipci.c:3036:3: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(cm->card->driver + strlen(cm->card->driver), "-SW=
IEC");
                   ^~~~~~
   sound/pci/cmipci.c:3036:3: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
                   strcpy(cm->card->driver + strlen(cm->card->driver), "-SW=
IEC");
                   ^~~~~~
   sound/pci/cmipci.c:3108:2: warning: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(card->shortname, "C-Media CMI%d", val);
           ^~~~~~~
   sound/pci/cmipci.c:3108:2: note: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11
           sprintf(card->shortname, "C-Media CMI%d", val);
           ^~~~~~~
   sound/pci/cmipci.c:3110:3: warning: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(modelstr, " (model %d)", cm->chip_version);
                   ^~~~~~~
   sound/pci/cmipci.c:3110:3: note: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11
                   sprintf(modelstr, " (model %d)", cm->chip_version);
                   ^~~~~~~
>> sound/pci/cmipci.c:3113:2: warning: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandli=
ng]
           sprintf(card->longname, "%s%s at %#lx, irq %i",
           ^~~~~~~
   sound/pci/cmipci.c:3113:2: note: Call to function 'sprintf' is insecure =
as it does not provide bounding of the memory buffer or security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11
           sprintf(card->longname, "%s%s at %#lx, irq %i",
           ^~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   include/linux/ww_mutex.h:297:23: warning: Access to field 'contending_lo=
ck' results in a dereference of a null pointer (loaded from variable 'ctx')=
 [clang-analyzer-core.NullDereference]
           DEBUG_LOCKS_WARN_ON(!ctx->contending_lock);
                                ^
   drivers/gpu/drm/ttm/ttm_execbuf_util.c:85:2: note: Taking false branch
           if (list_empty(list))
           ^
   drivers/gpu/drm/ttm/ttm_execbuf_util.c:88:6: note: Assuming 'ticket' is =
null
           if (ticket)
               ^~~~~~
   drivers/gpu/drm/ttm/ttm_execbuf_util.c:88:2: note: Taking false branch
           if (ticket)
           ^
   drivers/gpu/drm/ttm/ttm_execbuf_util.c:91:2: note: Loop condition is tru=
e.  Entering loop body
           list_for_each_entry(entry, list, head) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/gpu/drm/ttm/ttm_execbuf_util.c:94:9: note: Calling 'ttm_bo_reser=
ve'
                   ret =3D ttm_bo_reserve(bo, intr, (ticket =3D=3D NULL), t=
icket);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/ttm/ttm_bo_driver.h:138:6: note: 'no_wait' is true
           if (no_wait) {
               ^~~~~~~
   include/drm/ttm/ttm_bo_driver.h:138:2: note: Taking true branch
           if (no_wait) {
           ^
   include/drm/ttm/ttm_bo_driver.h:140:7: note: Taking false branch
                   if (WARN_ON(ticket))
                       ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   include/drm/ttm/ttm_bo_driver.h:140:3: note: Taking false branch
                   if (WARN_ON(ticket))
                   ^
   include/drm/ttm/ttm_bo_driver.h:144:10: note: Assuming 'success' is true
                   return success ? 0 : -EBUSY;
                          ^~~~~~~
   include/drm/ttm/ttm_bo_driver.h:144:10: note: '?' condition is true
   include/drm/ttm/ttm_bo_driver.h:144:3: note: Returning zero, which parti=
cipates in a condition later
                   return success ? 0 : -EBUSY;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_execbuf_util.c:94:9: note: Returning from 'ttm_b=
o_reserve'
                   ret =3D ttm_bo_reserve(bo, intr, (ticket =3D=3D NULL), t=
icket);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_execbuf_util.c:95:24: note: Left side of '&&' is=
 false
                   if (ret =3D=3D -EALREADY && dups) {
                                        ^
   drivers/gpu/drm/ttm/ttm_execbuf_util.c:103:8: note: 'ret' is 0
                   if (!ret) {
                        ^~~
   drivers/gpu/drm/ttm/ttm_execbuf_util.c:103:3: note: Taking true branch
                   if (!ret) {
                   ^
   drivers/gpu/drm/ttm/ttm_execbuf_util.c:104:8: note: Assuming field 'num_=
shared' is not equal to 0
                           if (!entry->num_shared)
                               ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_execbuf_util.c:104:4: note: Taking false branch
                           if (!entry->num_shared)
                           ^
   drivers/gpu/drm/ttm/ttm_execbuf_util.c:109:8: note: Assuming 'ret' is no=
t equal to 0
                           if (!ret)
                               ^~~~
   drivers/gpu/drm/ttm/ttm_execbuf_util.c:109:4: note: Taking false branch
                           if (!ret)
                           ^
   drivers/gpu/drm/ttm/ttm_execbuf_util.c:119:7: note: Assuming the conditi=
on is true
                   if (ret =3D=3D -EDEADLK) {
                       ^~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_execbuf_util.c:119:3: note: Taking true branch
                   if (ret =3D=3D -EDEADLK) {
                   ^
   drivers/gpu/drm/ttm/ttm_execbuf_util.c:120:44: note: Passing null pointe=
r value via 3rd parameter 'ticket'
                           ret =3D ttm_bo_reserve_slowpath(bo, intr, ticket=
);
                                                                   ^~~~~~
   drivers/gpu/drm/ttm/ttm_execbuf_util.c:120:10: note: Calling 'ttm_bo_res=
erve_slowpath'
                           ret =3D ttm_bo_reserve_slowpath(bo, intr, ticket=
);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/ttm/ttm_bo_driver.h:170:6: note: Assuming 'interruptible' is=
 false
           if (interruptible) {
               ^~~~~~~~~~~~~
   include/drm/ttm/ttm_bo_driver.h:170:2: note: Taking false branch
           if (interruptible) {
           ^
   include/drm/ttm/ttm_bo_driver.h:177:36: note: Passing null pointer value=
 via 2nd parameter 'ctx'
           dma_resv_lock_slow(bo->base.resv, ticket);
                                             ^~~~~~
   include/drm/ttm/ttm_bo_driver.h:177:2: note: Calling 'dma_resv_lock_slow'
--
                                                              ^~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:103:11: warning: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           buf +=3D sprintf(buf,  "%05x:", it->pte[lvl]);
                                  ^~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:103:11: note: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11
                           buf +=3D sprintf(buf,  "%05x:", it->pte[lvl]);
                                  ^~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:105:11: warning: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           buf +=3D sprintf(buf, "xxxxx:");
                                  ^~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:105:11: note: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11
                           buf +=3D sprintf(buf, "xxxxx:");
                                  ^~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:389:3: warning: Call to fu=
nction 'memset' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memset_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&pgt->pte[ptei], NVKM_VMM_PTE_SPARSE, ptes);
                   ^~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:389:3: note: Call to funct=
ion 'memset' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(&pgt->pte[ptei], NVKM_VMM_PTE_SPARSE, ptes);
                   ^~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:398:3: warning: Call to fu=
nction 'memset' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memset_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&pt->pde[ptei], 0x00, sizeof(pt->pde[0]) * ptes);
                   ^~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:398:3: note: Call to funct=
ion 'memset' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(&pt->pde[ptei], 0x00, sizeof(pt->pde[0]) * ptes);
                   ^~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:401:3: warning: Call to fu=
nction 'memset' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memset_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&pt->pte[ptei], 0x00, sizeof(pt->pte[0]) * ptes);
                   ^~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:401:3: note: Call to funct=
ion 'memset' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(&pt->pte[ptei], 0x00, sizeof(pt->pte[0]) * ptes);
                   ^~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:460:5: warning: Call to fu=
nction 'memset' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memset_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(&pgt->pte[pteb], 0x00, ptes);
                                   ^~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:460:5: note: Call to funct=
ion 'memset' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memset_s' in case of C11
                                   memset(&pgt->pte[pteb], 0x00, ptes);
                                   ^~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/media/pci/tw5864/tw5864-core.c:249:2: warning: Call to function =
'snprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'snprintf_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(dev->name, sizeof(dev->name), "tw5864:%s", pci_name(pci=
_dev));
           ^~~~~~~~
   drivers/media/pci/tw5864/tw5864-core.c:249:2: note: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(dev->name, sizeof(dev->name), "tw5864:%s", pci_name(pci=
_dev));
           ^~~~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/media/pci/tw5864/tw5864-video.c:515:3: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(input->md_threshold_grid_values, ctrl->val,
                   ^~~~~~
   drivers/media/pci/tw5864/tw5864-video.c:515:3: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
                   memset(input->md_threshold_grid_values, ctrl->val,
                   ^~~~~~
   drivers/media/pci/tw5864/tw5864-video.c:522:3: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(input->md_threshold_grid_values,
                   ^~~~~~
   drivers/media/pci/tw5864/tw5864-video.c:522:3: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(input->md_threshold_grid_values,
                   ^~~~~~
   drivers/media/pci/tw5864/tw5864-video.c:570:2: warning: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(i->name, sizeof(i->name), "Encoder %d", input->nr);
           ^~~~~~~~
   drivers/media/pci/tw5864/tw5864-video.c:570:2: note: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(i->name, sizeof(i->name), "Encoder %d", input->nr);
           ^~~~~~~~
   drivers/media/pci/tw5864/tw5864-video.c:605:2: warning: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(cap->card, sizeof(cap->card), "TW5864 Encoder %d",
           ^~~~~~~~
   drivers/media/pci/tw5864/tw5864-video.c:605:2: note: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(cap->card, sizeof(cap->card), "TW5864 Encoder %d",
           ^~~~~~~~
>> drivers/media/pci/tw5864/tw5864-video.c:607:2: warning: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecated=
OrUnsafeBufferHandling]
           sprintf(cap->bus_info, "PCI:%s", pci_name(input->root->pci));
           ^~~~~~~
   drivers/media/pci/tw5864/tw5864-video.c:607:2: note: Call to function 's=
printf' is insecure as it does not provide bounding of the memory buffer or=
 security checks introduced in the C11 standard. Replace with analogous fun=
ctions that support length arguments or provides boundary checks such as 's=
printf_s' in case of C11
           sprintf(cap->bus_info, "PCI:%s", pci_name(input->root->pci));
           ^~~~~~~
   drivers/media/pci/tw5864/tw5864-video.c:1367:21: warning: Value stored t=
o 'dev' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct tw5864_dev *dev =3D input->root;
                              ^~~   ~~~~~~~~~~~
   drivers/media/pci/tw5864/tw5864-video.c:1367:21: note: Value stored to '=
dev' during its initialization is never read
           struct tw5864_dev *dev =3D input->root;
                              ^~~   ~~~~~~~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   93 warnings generated.
   arch/riscv/include/asm/atomic.h:30:9: warning: Dereference of null point=
er [clang-analyzer-core.NullDereference]
           return READ_ONCE(v->counter);
                  ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^
   mm/memcontrol.c:6345:26: note: Passing null pointer value via 2nd parame=
ter 'events'
           __memory_events_show(m, memcg->memory_events_local);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:6345:2: note: Calling '__memory_events_show'
           __memory_events_show(m, memcg->memory_events_local);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:6323:46: note: Passing null pointer value via 1st parame=
ter 'v'
           seq_printf(m, "low %lu\n", atomic_long_read(&events[MEMCG_LOW]));
                                                       ^~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:6323:29: note: Calling 'atomic_long_read'
           seq_printf(m, "low %lu\n", atomic_long_read(&events[MEMCG_LOW]));
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1266:31: note: Passing null p=
ointer value via 1st parameter 'v'
           return arch_atomic_long_read(v);
                                        ^
   include/linux/atomic/atomic-instrumented.h:1266:9: note: Calling 'arch_a=
tomic_long_read'
           return arch_atomic_long_read(v);
                  ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-long.h:523:26: note: Passing null pointer va=
lue via 1st parameter 'v'
           return arch_atomic_read(v);
                                   ^
   include/linux/atomic/atomic-long.h:523:9: note: Calling 'arch_atomic_rea=
d'
           return arch_atomic_read(v);
                  ^~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/atomic.h:30:9: note: Left side of '||' is false
           return READ_ONCE(v->counter);
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
   arch/riscv/include/asm/atomic.h:30:9: note: Left side of '||' is false
           return READ_ONCE(v->counter);
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
   arch/riscv/include/asm/atomic.h:30:9: note: Left side of '||' is true
           return READ_ONCE(v->counter);
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
   arch/riscv/include/asm/atomic.h:30:9: note: Taking false branch
           return READ_ONCE(v->counter);
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
--
           ^~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:202:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(asyw->image.handle, 0x00, sizeof(asyw->image.handle));
           ^~~~~~
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:202:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(asyw->image.handle, 0x00, sizeof(asyw->image.handle));
           ^~~~~~
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:404:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&asyw->xlut, 0x00, sizeof(asyw->xlut));
           ^~~~~~
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:404:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(&asyw->xlut, 0x00, sizeof(asyw->xlut));
           ^~~~~~
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:492:19: warning: Dereference of =
null pointer [clang-analyzer-core.NullDereference]
                   harm->wndw.mask &=3D ~BIT(wndw->id);
                   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:444:25: note: 'harm' initialized=
 to a null pointer value
           struct nv50_head_atom *harm =3D NULL, *asyh =3D NULL;
                                  ^~~~
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:448:2: note: Taking false branch
           NV_ATOMIC(drm, "%s atomic_check\n", plane->name);
           ^
   drivers/gpu/drm/nouveau/nouveau_drv.h:272:2: note: expanded from macro '=
NV_ATOMIC'
           if (drm_debug_enabled(DRM_UT_ATOMIC))                           =
       \
           ^
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:448:2: note: Loop condition is f=
alse.  Exiting loop
           NV_ATOMIC(drm, "%s atomic_check\n", plane->name);
           ^
   drivers/gpu/drm/nouveau/nouveau_drv.h:271:31: note: expanded from macro =
'NV_ATOMIC'
   #define NV_ATOMIC(drm,f,a...) do {                                      =
       \
                                 ^
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:453:6: note: Assuming field 'crt=
c' is null
           if (asyw->state.crtc) {
               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:453:2: note: Taking false branch
           if (asyw->state.crtc) {
           ^
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:464:6: note: Assuming field 'crt=
c' is null
           if (armw->state.crtc) {
               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:464:2: note: Taking false branch
           if (armw->state.crtc) {
           ^
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:471:12: note: Field 'visible' is=
 false
           if (asyw->visible && wndw->func->xlut_set &&
                     ^
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:471:20: note: Left side of '&&' =
is false
           if (asyw->visible && wndw->func->xlut_set &&
                             ^
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:482:12: note: Field 'visible' is=
 false
           if (asyw->visible) {
                     ^
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:482:2: note: Taking false branch
           if (asyw->visible) {
           ^
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:490:6: note: Assuming field 'vis=
ible' is true
           if (armw->visible) {
               ^~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:490:2: note: Taking true branch
           if (armw->visible) {
           ^
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:492:19: note: Dereference of nul=
l pointer
                   harm->wndw.mask &=3D ~BIT(wndw->id);
                   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   sound/pci/cs4281.c:1076:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ac97, 0, sizeof(ac97));
           ^~~~~~
   sound/pci/cs4281.c:1076:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&ac97, 0, sizeof(ac97));
           ^~~~~~
   sound/pci/cs4281.c:1877:2: warning: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandli=
ng]
           sprintf(card->longname, "%s at 0x%lx, irq %d",
           ^~~~~~~
   sound/pci/cs4281.c:1877:2: note: Call to function 'sprintf' is insecure =
as it does not provide bounding of the memory buffer or security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11
           sprintf(card->longname, "%s at 0x%lx, irq %d",
           ^~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   sound/pci/ens1370.c:1724:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ak4531, 0, sizeof(ak4531));
           ^~~~~~
   sound/pci/ens1370.c:1724:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(&ak4531, 0, sizeof(ak4531));
           ^~~~~~
>> sound/pci/ens1370.c:2357:2: warning: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandl=
ing]
           sprintf(card->longname, "%s %s at 0x%lx, irq %i",
           ^~~~~~~
   sound/pci/ens1370.c:2357:2: note: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11
           sprintf(card->longname, "%s %s at 0x%lx, irq %i",
           ^~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   sound/usb/mixer_scarlett_gen2.c:1088:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(req->data, req_data, req_size);
                   ^~~~~~
   sound/usb/mixer_scarlett_gen2.c:1088:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(req->data, req_data, req_size);
                   ^~~~~~
   sound/usb/mixer_scarlett_gen2.c:1144:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(resp_data, resp->data, resp_size);
                   ^~~~~~
   sound/usb/mixer_scarlett_gen2.c:1144:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(resp_data, resp->data, resp_size);
                   ^~~~~~
   sound/usb/mixer_scarlett_gen2.c:1356:3: warning: Assigned value is garba=
ge or undefined [clang-analyzer-core.uninitialized.Assign]
                   u16 mixer_value =3D le16_to_cpu(data[i]);
                   ^
   sound/usb/mixer_scarlett_gen2.c:3974:6: note: Assuming field 'protocol' =
is not equal to 0
           if (!mixer->protocol)
               ^~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3974:2: note: Taking false branch
           if (!mixer->protocol)
           ^
   sound/usb/mixer_scarlett_gen2.c:3977:6: note: Assuming the condition is =
false
           if (!(chip->setup & SCARLETT2_ENABLE)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3977:2: note: Taking false branch
           if (!(chip->setup & SCARLETT2_ENABLE)) {
           ^
   sound/usb/mixer_scarlett_gen2.c:3988:2: note: Loop condition is false.  =
Exiting loop
           usb_audio_info(chip,
           ^
   sound/usb/usbaudio.h:71:2: note: expanded from macro 'usb_audio_info'
           dev_info(&(chip)->dev->dev, fmt, ##args)
           ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   sound/usb/mixer_scarlett_gen2.c:3992:8: note: Calling 'snd_scarlett_gen2=
_controls_create'
           err =3D snd_scarlett_gen2_controls_create(mixer);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3886:9: note: Assuming the condition is =
true
           while (*info && (*info)->usb_id !=3D mixer->chip->usb_id)
                  ^~~~~
   sound/usb/mixer_scarlett_gen2.c:3886:9: note: Left side of '&&' is true
   sound/usb/mixer_scarlett_gen2.c:3886:18: note: Assuming '(*info)->usb_id=
' is equal to 'mixer->chip->usb_id'
           while (*info && (*info)->usb_id !=3D mixer->chip->usb_id)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3886:2: note: Loop condition is false. E=
xecution continues on line 3888
           while (*info && (*info)->usb_id !=3D mixer->chip->usb_id)
           ^
   sound/usb/mixer_scarlett_gen2.c:3888:2: note: Taking false branch
           if (!*info)
           ^
   sound/usb/mixer_scarlett_gen2.c:3893:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   sound/usb/mixer_scarlett_gen2.c:3893:2: note: Taking false branch
           if (err < 0)
           ^
   sound/usb/mixer_scarlett_gen2.c:3898:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   sound/usb/mixer_scarlett_gen2.c:3898:2: note: Taking false branch
           if (err < 0)
           ^
   sound/usb/mixer_scarlett_gen2.c:3902:8: note: Calling 'scarlett2_read_co=
nfigs'
           err =3D scarlett2_read_configs(mixer);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3614:6: note: Assuming field 'has_msd_mo=
de' is 0
           if (info->has_msd_mode) {
               ^~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:3614:2: note: Taking false branch
           if (info->has_msd_mode) {
           ^
   sound/usb/mixer_scarlett_gen2.c:3627:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   sound/usb/mixer_scarlett_gen2.c:3627:2: note: Taking false branch
--
                   ^     ~~~~~~~
   drivers/media/tuners/si2157.c:657:4: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           std =3D "secamDK";
                           ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:657:4: note: Value stored to 'std' is neve=
r read
                           std =3D "secamDK";
                           ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:661:3: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   std =3D "secamL";
                   ^     ~~~~~~~~
   drivers/media/tuners/si2157.c:661:3: note: Value stored to 'std' is neve=
r read
                   std =3D "secamL";
                   ^     ~~~~~~~~
   drivers/media/tuners/si2157.c:667:3: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   std =3D "secamL'";
                   ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:667:3: note: Value stored to 'std' is neve=
r read
                   std =3D "secamL'";
                   ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:673:3: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   std =3D "unknown";
                   ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:673:3: note: Value stored to 'std' is neve=
r read
                   std =3D "unknown";
                   ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:684:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cmd.args, "\x14\x00\x03\x06\x08\x02", 6);
           ^~~~~~
   drivers/media/tuners/si2157.c:684:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(cmd.args, "\x14\x00\x03\x06\x08\x02", 6);
           ^~~~~~
   drivers/media/tuners/si2157.c:698:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cmd.args, "\x14\x00\x0d\x06\x94\x64", 6);
           ^~~~~~
   drivers/media/tuners/si2157.c:698:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(cmd.args, "\x14\x00\x0d\x06\x94\x64", 6);
           ^~~~~~
   drivers/media/tuners/si2157.c:712:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cmd.args, "\x14\x00\x0C\x06", 4);
           ^~~~~~
   drivers/media/tuners/si2157.c:712:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(cmd.args, "\x14\x00\x0C\x06", 4);
           ^~~~~~
   drivers/media/tuners/si2157.c:722:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cmd.args, "\x14\x00\x07\x06\x32\xc8", 6);
           ^~~~~~
   drivers/media/tuners/si2157.c:722:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(cmd.args, "\x14\x00\x07\x06\x32\xc8", 6);
           ^~~~~~
   drivers/media/tuners/si2157.c:730:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cmd.args, "\x14\x00\x04\x06\x00\x00", 6);
           ^~~~~~
   drivers/media/tuners/si2157.c:730:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(cmd.args, "\x14\x00\x04\x06\x00\x00", 6);
           ^~~~~~
   drivers/media/tuners/si2157.c:742:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cmd.args, "\x41\x01\x00\x00\x00\x00\x00\x00", 8);
           ^~~~~~
   drivers/media/tuners/si2157.c:742:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(cmd.args, "\x41\x01\x00\x00\x00\x00\x00\x00", 8);
           ^~~~~~
   drivers/media/tuners/si2157.c:806:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cmd.args, "\x42\x00", 2);
           ^~~~~~
   drivers/media/tuners/si2157.c:806:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(cmd.args, "\x42\x00", 2);
           ^~~~~~
   drivers/media/tuners/si2157.c:861:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cmd.args, "\x42\x00", 2);
           ^~~~~~
   drivers/media/tuners/si2157.c:861:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(cmd.args, "\x42\x00", 2);
           ^~~~~~
   drivers/media/tuners/si2157.c:911:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&fe->ops.tuner_ops, &si2157_ops, sizeof(struct dvb_tuner_=
ops));
           ^~~~~~
   drivers/media/tuners/si2157.c:911:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&fe->ops.tuner_ops, &si2157_ops, sizeof(struct dvb_tuner_=
ops));
           ^~~~~~
   drivers/media/tuners/si2157.c:969:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&fe->ops.tuner_ops, 0, sizeof(struct dvb_tuner_ops));
           ^~~~~~
   drivers/media/tuners/si2157.c:969:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(&fe->ops.tuner_ops, 0, sizeof(struct dvb_tuner_ops));
           ^~~~~~
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   sound/pci/ad1889.c:608:2: warning: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(pcm->name, chip->card->shortname);
           ^~~~~~
   sound/pci/ad1889.c:608:2: note: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119
           strcpy(pcm->name, chip->card->shortname);
           ^~~~~~
   sound/pci/ad1889.c:760:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ac97, 0, sizeof(ac97));
           ^~~~~~
   sound/pci/ad1889.c:760:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(&ac97, 0, sizeof(ac97));
           ^~~~~~
>> sound/pci/ad1889.c:879:2: warning: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
           sprintf(card->longname, "%s at 0x%lx irq %i",
           ^~~~~~~
   sound/pci/ad1889.c:879:2: note: Call to function 'sprintf' is insecure a=
s it does not provide bounding of the memory buffer or security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
           sprintf(card->longname, "%s at 0x%lx irq %i",
           ^~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   drivers/usb/core/file.c:202:2: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, sizeof(name), class_driver->name, minor - minor_b=
ase);
           ^~~~~~~~
   drivers/usb/core/file.c:202:2: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, sizeof(name), class_driver->name, minor - minor_b=
ase);
           ^~~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   drivers/usb/core/buffer.c:77:3: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(name, sizeof(name), "buffer-%d", size);
                   ^~~~~~~~
   drivers/usb/core/buffer.c:77:3: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                   snprintf(name, sizeof(name), "buffer-%d", size);
                   ^~~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   89 warnings generated.
   drivers/usb/core/sysfs.c:48:1: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   usb_actconfig_attr(bNumInterfaces, "%2d\n");
   ^
   drivers/usb/core/sysfs.c:45:2: note: expanded from macro 'usb_actconfig_=
attr'
           usb_actconfig_show(field, format_string)                \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/sysfs.c:38:8: note: expanded from macro 'usb_actconfig_=
show'
                   rc =3D sprintf(buf, format_string,                      =
  \
                        ^~~~~~~
   drivers/usb/core/sysfs.c:48:1: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
   usb_actconfig_attr(bNumInterfaces, "%2d\n");
   ^
   drivers/usb/core/sysfs.c:45:2: note: expanded from macro 'usb_actconfig_=
attr'
           usb_actconfig_show(field, format_string)                \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/sysfs.c:38:8: note: expanded from macro 'usb_actconfig_=
show'
                   rc =3D sprintf(buf, format_string,                      =
  \
                        ^~~~~~~
   drivers/usb/core/sysfs.c:49:1: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   usb_actconfig_attr(bmAttributes, "%2x\n");
   ^
   drivers/usb/core/sysfs.c:45:2: note: expanded from macro 'usb_actconfig_=
attr'
           usb_actconfig_show(field, format_string)                \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/sysfs.c:38:8: note: expanded from macro 'usb_actconfig_=
show'
                   rc =3D sprintf(buf, format_string,                      =
  \
                        ^~~~~~~
   drivers/usb/core/sysfs.c:49:1: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
   usb_actconfig_attr(bmAttributes, "%2x\n");
   ^
   drivers/usb/core/sysfs.c:45:2: note: expanded from macro 'usb_actconfig_=
attr'
           usb_actconfig_show(field, format_string)                \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/sysfs.c:38:8: note: expanded from macro 'usb_actconfig_=
show'
                   rc =3D sprintf(buf, format_string,                      =
  \
                        ^~~~~~~
   drivers/usb/core/sysfs.c:64:8: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   rc =3D sprintf(buf, "%dmA\n", usb_get_max_power(udev, ac=
tconfig));
                        ^~~~~~~
   drivers/usb/core/sysfs.c:64:8: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
                   rc =3D sprintf(buf, "%dmA\n", usb_get_max_power(udev, ac=
tconfig));
                        ^~~~~~~
   drivers/usb/core/sysfs.c:83:8: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
                   rc =3D sprintf(buf, "%s\n", actconfig->string);
                        ^~~~~~~
   drivers/usb/core/sysfs.c:83:8: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
                   rc =3D sprintf(buf, "%s\n", actconfig->string);
                        ^~~~~~~
   drivers/usb/core/sysfs.c:90:1: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   usb_actconfig_show(bConfigurationValue, "%u\n");
   ^
   drivers/usb/core/sysfs.c:38:8: note: expanded from macro 'usb_actconfig_=
show'
                   rc =3D sprintf(buf, format_string,                      =
  \
                        ^~~~~~~
   drivers/usb/core/sysfs.c:90:1: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
   usb_actconfig_show(bConfigurationValue, "%u\n");
   ^
   drivers/usb/core/sysfs.c:38:8: note: expanded from macro 'usb_actconfig_=
show'
                   rc =3D sprintf(buf, format_string,                      =
  \
                        ^~~~~~~
   drivers/usb/core/sysfs.c:99:6: warning: Call to function 'sscanf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(buf, "%d", &config) !=3D 1 || config < -1 || config >=
 255)
               ^~~~~~
   drivers/usb/core/sysfs.c:99:6: note: Call to function 'sscanf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sscanf_s' in case of C11
           if (sscanf(buf, "%d", &config) !=3D 1 || config < -1 || config >=
 255)
               ^~~~~~
   drivers/usb/core/sysfs.c:117:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%pOF\n", of_node);
                  ^~~~~~~
   drivers/usb/core/sysfs.c:117:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%pOF\n", of_node);
                  ^~~~~~~
   drivers/usb/core/sysfs.c:140:1: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
   usb_string_attr(product);

vim +568 sound/pci/mixart/mixart_hwdep.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  555  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  556  =

67b48b880062ba Takashi Iwai   2005-11-17  557  int snd_mixart_setup_firmwar=
e(struct mixart_mgr *mgr)
^1da177e4c3f41 Linus Torvalds 2005-04-16  558  {
3cfe54b96ca1a8 Takashi Iwai   2020-01-05  559  	static const char * const f=
w_files[3] =3D {
^1da177e4c3f41 Linus Torvalds 2005-04-16  560  		"miXart8.xlx", "miXart8.el=
f", "miXart8AES.xlx"
^1da177e4c3f41 Linus Torvalds 2005-04-16  561  	};
^1da177e4c3f41 Linus Torvalds 2005-04-16  562  	char path[32];
^1da177e4c3f41 Linus Torvalds 2005-04-16  563  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  564  	const struct firmware *fw_e=
ntry;
^1da177e4c3f41 Linus Torvalds 2005-04-16  565  	int i, err;
^1da177e4c3f41 Linus Torvalds 2005-04-16  566  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  567  	for (i =3D 0; i < 3; i++) {
^1da177e4c3f41 Linus Torvalds 2005-04-16 @568  		sprintf(path, "mixart/%s",=
 fw_files[i]);
^1da177e4c3f41 Linus Torvalds 2005-04-16  569  		if (request_firmware(&fw_e=
ntry, path, &mgr->pci->dev)) {
6414e35deb5911 Takashi Iwai   2014-02-25  570  			dev_err(&mgr->pci->dev,
6414e35deb5911 Takashi Iwai   2014-02-25  571  				"miXart: can't load firm=
ware %s\n", path);
^1da177e4c3f41 Linus Torvalds 2005-04-16  572  			return -ENOENT;
^1da177e4c3f41 Linus Torvalds 2005-04-16  573  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  574  		/* fake hwdep dsp record */
^1da177e4c3f41 Linus Torvalds 2005-04-16  575  		err =3D mixart_dsp_load(mg=
r, i, fw_entry);
^1da177e4c3f41 Linus Torvalds 2005-04-16  576  		release_firmware(fw_entry);
^1da177e4c3f41 Linus Torvalds 2005-04-16  577  		if (err < 0)
^1da177e4c3f41 Linus Torvalds 2005-04-16  578  			return err;
^1da177e4c3f41 Linus Torvalds 2005-04-16  579  		mgr->dsp_loaded |=3D 1 << =
i;
^1da177e4c3f41 Linus Torvalds 2005-04-16  580  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  581  	return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  582  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  583  =


:::::: The code@line 568 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4644290379679897608==--

