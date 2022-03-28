Content-Type: multipart/mixed; boundary="===============4646484982653116892=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/staging/iio/frequency/ad9834.c:294:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length argu...
Date: Tue, 29 Mar 2022 07:27:16 +0800
Message-ID: <202203290724.ey3L03Ka-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4646484982653116892==
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
head:   ae085d7f9365de7da27ab5c0d16b12d51ea7fca9
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   2 weeks ago
:::::: branch date: 22 hours ago
:::::: commit date: 2 weeks ago
config: riscv-randconfig-c006-20220328 (https://download.01.org/0day-ci/arc=
hive/20220329/202203290724.ey3L03Ka-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
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
           unsigned int page_order =3D get_order(size);
                                     ^~~~~~~~~~~~~~~
   kernel/dma/direct.c:402:2: note: 'page_order' initialized to 64
           unsigned int page_order =3D get_order(size);
           ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/dma/direct.c:406:43: note: Left side of '&&' is false
           if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
                                                    ^
   kernel/dma/direct.c:410:38: note: The result of the left shift is undefi=
ned due to shifting by '64', which is greater or equal to the width of type=
 'int'
           if (dma_set_encrypted(dev, vaddr, 1 << page_order))
                                               ^  ~~~~~~~~~~
   Suppressed 45 warnings (38 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/comedi/comedi_buf.c:215:4: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(b, buf, l);
                           ^~~~~~
   drivers/comedi/comedi_buf.c:215:4: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                           memcpy(b, buf, l);
                           ^~~~~~
   drivers/comedi/comedi_buf.c:217:4: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(buf, b, l);
                           ^~~~~~
   drivers/comedi/comedi_buf.c:217:4: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                           memcpy(buf, b, l);
                           ^~~~~~
   drivers/comedi/comedi_buf.c:571:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(async->prealloc_buf + write_ptr, data, block_size=
);
                   ^~~~~~
   drivers/comedi/comedi_buf.c:571:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(async->prealloc_buf + write_ptr, data, block_size=
);
                   ^~~~~~
   drivers/comedi/comedi_buf.c:597:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dest, src, block_size);
                   ^~~~~~
   drivers/comedi/comedi_buf.c:597:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dest, src, block_size);
                   ^~~~~~
   Suppressed 45 warnings (38 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (38 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (38 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   drivers/iio/chemical/atlas-ezo-sensor.c:108:2: warning: Call to function=
 'memmove' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memmove_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(ptr, ptr + 1, strlen(ptr));
           ^~~~~~~
   drivers/iio/chemical/atlas-ezo-sensor.c:108:2: note: Call to function 'm=
emmove' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memmove_s' in case of C11
           memmove(ptr, ptr + 1, strlen(ptr));
           ^~~~~~~
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   drivers/staging/iio/cdc/ad7746.c:85:8: warning: Excessive padding in 'st=
ruct ad7746_chip_info' (92 padding bytes, where 28 is optimal). =

   Optimal fields order: =

   data, =

   config, =

   cap_setup, =

   vt_setup, =

   capdac_set, =

   client, =

   lock, =

   capdac, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad7746_chip_info {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/staging/iio/cdc/ad7746.c:85:8: note: Excessive padding in 'struc=
t ad7746_chip_info' (92 padding bytes, where 28 is optimal). Optimal fields=
 order: data, config, cap_setup, vt_setup, capdac_set, client, lock, capdac=
, consider reordering the fields or adding explicit padding members
   struct ad7746_chip_info {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/staging/iio/frequency/ad9834.c:71:8: warning: Excessive padding =
in 'struct ad9834_state' (86 padding bytes, where 22 is optimal). =

   Optimal fields order: =

   data, =

   control, =

   devid, =

   freq_data, =

   spi, =

   mclk, =

   msg, =

   freq_msg, =

   xfer, =

   lock, =

   freq_xfer, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad9834_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/staging/iio/frequency/ad9834.c:71:8: note: Excessive padding in =
'struct ad9834_state' (86 padding bytes, where 22 is optimal). Optimal fiel=
ds order: data, control, devid, freq_data, spi, mclk, msg, freq_msg, xfer, =
lock, freq_xfer, consider reordering the fields or adding explicit padding =
members
   struct ad9834_state {
   ~~~~~~~^~~~~~~~~~~~~~
>> drivers/staging/iio/frequency/ad9834.c:294:9: warning: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedO=
rUnsafeBufferHandling]
           return sprintf(buf, "%s\n", str);
                  ^~~~~~~
   drivers/staging/iio/frequency/ad9834.c:294:9: note: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11
           return sprintf(buf, "%s\n", str);
                  ^~~~~~~
   drivers/staging/iio/frequency/ad9834.c:314:9: warning: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedO=
rUnsafeBufferHandling]
           return sprintf(buf, "%s\n", str);
                  ^~~~~~~
   drivers/staging/iio/frequency/ad9834.c:314:9: note: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11
           return sprintf(buf, "%s\n", str);
                  ^~~~~~~
   Suppressed 59 warnings (52 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   drivers/staging/iio/impedance-analyzer/ad5933.c:288:9: warning: Call to =
function 'sprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", (int)freqreg);
                  ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:288:9: note: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", (int)freqreg);
                  ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:340:9: warning: Call to =
function 'sprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len =3D sprintf(buf, "%u\n",
                         ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:340:9: note: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   len =3D sprintf(buf, "%u\n",
                         ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:344:9: warning: Call to =
function 'sprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len =3D sprintf(buf, "%u %u %u %u\n", st->range_avail[0],
                         ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:344:9: note: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   len =3D sprintf(buf, "%u %u %u %u\n", st->range_avail[0],
                         ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:349:9: warning: Call to =
function 'sprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len =3D sprintf(buf, "%d\n", st->settling_cycles);
                         ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:349:9: note: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   len =3D sprintf(buf, "%d\n", st->settling_cycles);
                         ^~~~~~~
>> drivers/staging/iio/impedance-analyzer/ad5933.c:352:9: warning: Call to =
function 'sprintf' is insecure as it does not provide bounding of the memor=
y buffer or security checks introduced in the C11 standard. Replace with an=
alogous functions that support length arguments or provides boundary checks=
 such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.De=
precatedOrUnsafeBufferHandling]
                   len =3D sprintf(buf, "%s\n",
                         ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:352:9: note: Call to fun=
ction 'sprintf' is insecure as it does not provide bounding of the memory b=
uffer or security checks introduced in the C11 standard. Replace with analo=
gous functions that support length arguments or provides boundary checks su=
ch as 'sprintf_s' in case of C11
                   len =3D sprintf(buf, "%s\n",
                         ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:357:9: warning: Call to =
function 'sprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len =3D sprintf(buf, "1 0.2\n");
                         ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:357:9: note: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   len =3D sprintf(buf, "1 0.2\n");
                         ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:360:9: warning: Call to =
function 'sprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len =3D sprintf(buf, "%d\n", st->freq_points);
                         ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:360:9: note: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   len =3D sprintf(buf, "%d\n", st->freq_points);
                         ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:641:13: warning: 1st fun=
ction call argument is an uninitialized value [clang-analyzer-core.CallAndM=
essage]
                           val[0] =3D be16_to_cpu(buf[0]);
                                    ^
   include/linux/byteorder/generic.h:97:21: note: expanded from macro 'be16=
_to_cpu'
   #define be16_to_cpu __be16_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:43:26: note: expanded from =
macro '__be16_to_cpu'
   #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/swab.h:105:3: note: expanded from macro '__swab16'
           (__builtin_constant_p((__u16)(x)) ?     \
            ^                    ~~~~~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:615:6: note: Assuming th=
e condition is false
           if (st->state =3D=3D AD5933_CTRL_INIT_START_FREQ) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:615:2: note: Taking fals=
e branch
           if (st->state =3D=3D AD5933_CTRL_INIT_START_FREQ) {
           ^
   drivers/staging/iio/impedance-analyzer/ad5933.c:623:8: note: Calling 'ad=
5933_i2c_read'
           ret =3D ad5933_i2c_read(st->client, AD5933_REG_STATUS, 1, &statu=
s);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:144:2: note: Loop condit=
ion is true.  Entering loop body
           while (len--) {
           ^
   drivers/staging/iio/impedance-analyzer/ad5933.c:146:7: note: Assuming 'r=
et' is >=3D 0
                   if (ret < 0) {
                       ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:146:3: note: Taking fals=
e branch
                   if (ret < 0) {
                   ^
   drivers/staging/iio/impedance-analyzer/ad5933.c:144:2: note: Loop condit=
ion is false. Execution continues on line 152
           while (len--) {
           ^
   drivers/staging/iio/impedance-analyzer/ad5933.c:152:2: note: Returning z=
ero, which participates in a condition later
           return 0;
           ^~~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:623:8: note: Returning f=
rom 'ad5933_i2c_read'
           ret =3D ad5933_i2c_read(st->client, AD5933_REG_STATUS, 1, &statu=
s);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:624:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:624:2: note: Taking fals=
e branch
           if (ret)
           ^
   drivers/staging/iio/impedance-analyzer/ad5933.c:627:6: note: Assuming th=
e condition is true
           if (status & AD5933_STAT_DATA_VALID) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:627:2: note: Taking true=
 branch
           if (status & AD5933_STAT_DATA_VALID) {
           ^
   drivers/staging/iio/impedance-analyzer/ad5933.c:631:5: note: Assuming th=
e condition is false
                                   test_bit(1, indio_dev->active_scan_mask)=
 ?
                                   ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   drivers/staging/iio/impedance-analyzer/ad5933.c:631:5: note: '?' conditi=
on is false
                                   test_bit(1, indio_dev->active_scan_mask)=
 ?
                                   ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   drivers/staging/iio/impedance-analyzer/ad5933.c:630:9: note: Calling 'ad=
5933_i2c_read'
                   ret =3D ad5933_i2c_read(st->client,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:144:2: note: Loop condit=
ion is false. Execution continues on line 152
           while (len--) {
           ^
   drivers/staging/iio/impedance-analyzer/ad5933.c:152:2: note: Returning z=
ero, which participates in a condition later
           return 0;
           ^~~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:630:9: note: Returning f=
rom 'ad5933_i2c_read'
                   ret =3D ad5933_i2c_read(st->client,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:634:7: note: 'ret' is 0
                   if (ret)
                       ^~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:634:3: note: Taking fals=
e branch
                   if (ret)
                   ^
   drivers/staging/iio/impedance-analyzer/ad5933.c:637:7: note: 'scan_count=
' is not equal to 2
                   if (scan_count =3D=3D 2) {
--
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/misc/lkdtm/heap.c:112:2: note: Memory is released
           kfree(base);
           ^~~~~~~~~~~
   drivers/misc/lkdtm/heap.c:114:2: note: Loop condition is false.  Exiting=
 loop
           pr_info("Attempting bad read from freed memory\n");
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/misc/lkdtm/heap.c:115:8: note: Use of memory after it is freed
           saw =3D base[offset];
                 ^~~~~~~~~~~~
   drivers/misc/lkdtm/heap.c:136:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset((void *)p, 0x3, PAGE_SIZE);
           ^~~~~~
   drivers/misc/lkdtm/heap.c:136:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset((void *)p, 0x3, PAGE_SIZE);
           ^~~~~~
   drivers/misc/lkdtm/heap.c:140:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset((void *)p, 0x78, PAGE_SIZE);
           ^~~~~~
   drivers/misc/lkdtm/heap.c:140:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset((void *)p, 0x78, PAGE_SIZE);
           ^~~~~~
   drivers/misc/lkdtm/heap.c:195:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(first, 0xAB, 512);
           ^~~~~~
   drivers/misc/lkdtm/heap.c:195:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(first, 0xAB, 512);
           ^~~~~~
   drivers/misc/lkdtm/heap.c:227:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(first, 0xAB, PAGE_SIZE);
           ^~~~~~
   drivers/misc/lkdtm/heap.c:227:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(first, 0xAB, PAGE_SIZE);
           ^~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   lib/cmdline_kunit.c:79:3: warning: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
                   sprintf(in, "%u%s", get_random_int() % 256, str);
                   ^~~~~~~
   lib/cmdline_kunit.c:79:3: note: Call to function 'sprintf' is insecure a=
s it does not provide bounding of the memory buffer or security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
                   sprintf(in, "%u%s", get_random_int() % 256, str);
                   ^~~~~~~
   lib/cmdline_kunit.c:97:3: warning: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
                   sprintf(in, "%s%u", str, get_random_int() % 256);
                   ^~~~~~~
   lib/cmdline_kunit.c:97:3: note: Call to function 'sprintf' is insecure a=
s it does not provide bounding of the memory buffer or security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
                   sprintf(in, "%s%u", str, get_random_int() % 256);
                   ^~~~~~~
   lib/cmdline_kunit.c:114:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(r, 0, sizeof(r));
           ^~~~~~
   lib/cmdline_kunit.c:114:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(r, 0, sizeof(r));
           ^~~~~~
   lib/cmdline_kunit.c:121:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(r, 0, sizeof(r));
           ^~~~~~
   lib/cmdline_kunit.c:121:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(r, 0, sizeof(r));
           ^~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   drivers/bus/moxtet.c:64:1: warning: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
   DEF_MODULE_ATTR(id, "0x%x\n", mdev->id);
   ^
   drivers/bus/moxtet.c:60:9: note: expanded from macro 'DEF_MODULE_ATTR'
           return sprintf(buf, (fmt), __VA_ARGS__);                        \
                  ^~~~~~~
   drivers/bus/moxtet.c:64:1: note: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11
   DEF_MODULE_ATTR(id, "0x%x\n", mdev->id);
   ^
   drivers/bus/moxtet.c:60:9: note: expanded from macro 'DEF_MODULE_ATTR'
           return sprintf(buf, (fmt), __VA_ARGS__);                        \
                  ^~~~~~~
>> drivers/bus/moxtet.c:65:1: warning: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandli=
ng]
   DEF_MODULE_ATTR(name, "%s\n", mox_module_name(mdev->id));
   ^
   drivers/bus/moxtet.c:60:9: note: expanded from macro 'DEF_MODULE_ATTR'
           return sprintf(buf, (fmt), __VA_ARGS__);                        \
                  ^~~~~~~
   drivers/bus/moxtet.c:65:1: note: Call to function 'sprintf' is insecure =
as it does not provide bounding of the memory buffer or security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11
   DEF_MODULE_ATTR(name, "%s\n", mox_module_name(mdev->id));
   ^
   drivers/bus/moxtet.c:60:9: note: expanded from macro 'DEF_MODULE_ATTR'
           return sprintf(buf, (fmt), __VA_ARGS__);                        \
                  ^~~~~~~
   drivers/bus/moxtet.c:66:1: warning: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandli=
ng]
   DEF_MODULE_ATTR(description, "%s\n",
   ^
   drivers/bus/moxtet.c:60:9: note: expanded from macro 'DEF_MODULE_ATTR'
           return sprintf(buf, (fmt), __VA_ARGS__);                        \
                  ^~~~~~~
   drivers/bus/moxtet.c:66:1: note: Call to function 'sprintf' is insecure =
as it does not provide bounding of the memory buffer or security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11
   DEF_MODULE_ATTR(description, "%s\n",
   ^
   drivers/bus/moxtet.c:60:9: note: expanded from macro 'DEF_MODULE_ATTR'
           return sprintf(buf, (fmt), __VA_ARGS__);                        \
                  ^~~~~~~
   drivers/bus/moxtet.c:338:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cnts, 0, sizeof(cnts));
           ^~~~~~
   drivers/bus/moxtet.c:338:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(cnts, 0, sizeof(cnts));
           ^~~~~~
   Suppressed 47 warnings (40 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   drivers/misc/apds9802als.c:42:10: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "4095\n");
                          ^~~~~~~
   drivers/misc/apds9802als.c:42:10: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "4095\n");
                          ^~~~~~~
   drivers/misc/apds9802als.c:44:10: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "65535\n");
                          ^~~~~~~
   drivers/misc/apds9802als.c:44:10: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "65535\n");
                          ^~~~~~~
   drivers/misc/apds9802als.c:101:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", temp);
                  ^~~~~~~
   drivers/misc/apds9802als.c:101:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", temp);
                  ^~~~~~~
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/misc/isl29003.c:189:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%i\n", isl29003_get_range(client));
                  ^~~~~~~
   drivers/misc/isl29003.c:189:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%i\n", isl29003_get_range(client));
                  ^~~~~~~
   drivers/misc/isl29003.c:225:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", isl29003_get_resolution(client));
                  ^~~~~~~
   drivers/misc/isl29003.c:225:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", isl29003_get_resolution(client));
                  ^~~~~~~
   drivers/misc/isl29003.c:259:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", isl29003_get_mode(client));
                  ^~~~~~~
   drivers/misc/isl29003.c:259:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", isl29003_get_mode(client));
                  ^~~~~~~
   drivers/misc/isl29003.c:294:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", isl29003_get_power_state(client));
                  ^~~~~~~
   drivers/misc/isl29003.c:294:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", isl29003_get_power_state(client));
                  ^~~~~~~
   drivers/misc/isl29003.c:330:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", isl29003_get_adc_value(client));
                  ^~~~~~~
   drivers/misc/isl29003.c:330:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", isl29003_get_adc_value(client));
                  ^~~~~~~
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   68 warnings generated.
   kernel/workqueue.c:1962:3: warning: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(id_buf, sizeof(id_buf), "%d:%d%s", pool->cpu, i=
d,
                   ^~~~~~~~
   kernel/workqueue.c:1962:3: note: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11
                   snprintf(id_buf, sizeof(id_buf), "%d:%d%s", pool->cpu, i=
d,
                   ^~~~~~~~
   kernel/workqueue.c:1965:3: warning: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(id_buf, sizeof(id_buf), "u%d:%d", pool->id, id);
                   ^~~~~~~~
   kernel/workqueue.c:1965:3: note: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11
                   snprintf(id_buf, sizeof(id_buf), "u%d:%d", pool->id, id);
--
           ^~~~~~
   security/keys/encrypted-keys/encrypted.c:580:2: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(iv, epayload->iv, sizeof(iv));
           ^~~~~~
   security/keys/encrypted-keys/encrypted.c:727:3: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(epayload->format, key_format_default, format_len);
                   ^~~~~~
   security/keys/encrypted-keys/encrypted.c:727:3: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(epayload->format, key_format_default, format_len);
                   ^~~~~~
   security/keys/encrypted-keys/encrypted.c:733:3: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(epayload->format, format, format_len);
                   ^~~~~~
   security/keys/encrypted-keys/encrypted.c:733:3: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(epayload->format, format, format_len);
                   ^~~~~~
   security/keys/encrypted-keys/encrypted.c:736:2: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(epayload->master_desc, master_desc, strlen(master_desc));
           ^~~~~~
   security/keys/encrypted-keys/encrypted.c:736:2: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(epayload->master_desc, master_desc, strlen(master_desc));
           ^~~~~~
   security/keys/encrypted-keys/encrypted.c:737:2: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(epayload->datalen, datalen, strlen(datalen));
           ^~~~~~
   security/keys/encrypted-keys/encrypted.c:737:2: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(epayload->datalen, datalen, strlen(datalen));
           ^~~~~~
   security/keys/encrypted-keys/encrypted.c:800:2: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(datablob, prep->data, datalen);
           ^~~~~~
   security/keys/encrypted-keys/encrypted.c:800:2: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(datablob, prep->data, datalen);
           ^~~~~~
   security/keys/encrypted-keys/encrypted.c:862:2: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, prep->data, datalen);
           ^~~~~~
   security/keys/encrypted-keys/encrypted.c:862:2: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, prep->data, datalen);
           ^~~~~~
   security/keys/encrypted-keys/encrypted.c:881:2: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(new_epayload->iv, epayload->iv, ivsize);
           ^~~~~~
   security/keys/encrypted-keys/encrypted.c:881:2: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(new_epayload->iv, epayload->iv, ivsize);
           ^~~~~~
   security/keys/encrypted-keys/encrypted.c:882:2: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(new_epayload->payload_data, epayload->payload_data,
           ^~~~~~
   security/keys/encrypted-keys/encrypted.c:882:2: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(new_epayload->payload_data, epayload->payload_data,
           ^~~~~~
   security/keys/encrypted-keys/encrypted.c:948:2: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buffer, ascii_buf, asciiblob_len);
           ^~~~~~
   security/keys/encrypted-keys/encrypted.c:948:2: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buffer, ascii_buf, asciiblob_len);
           ^~~~~~
   Suppressed 58 warnings (51 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   108 warnings generated.
   net/core/xdp.c:161:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(xdp_rxq, 0, sizeof(*xdp_rxq));
           ^~~~~~
   net/core/xdp.c:161:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(xdp_rxq, 0, sizeof(*xdp_rxq));
           ^~~~~~
   net/core/xdp.c:524:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(xdpf, 0, sizeof(*xdpf));
           ^~~~~~
   net/core/xdp.c:524:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(xdpf, 0, sizeof(*xdpf));
           ^~~~~~
   net/core/xdp.c:528:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(addr, data_to_copy, totsize);
           ^~~~~~
   net/core/xdp.c:528:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(addr, data_to_copy, totsize);
           ^~~~~~
   net/core/xdp.c:613:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(skb, 0, offsetof(struct sk_buff, tail));
           ^~~~~~
   net/core/xdp.c:613:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(skb, 0, offsetof(struct sk_buff, tail));
           ^~~~~~
   net/core/xdp.c:636:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(addr, xdpf, totalsize);
           ^~~~~~
   net/core/xdp.c:636:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(addr, xdpf, totalsize);
           ^~~~~~
   Suppressed 103 warnings (96 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   64 warnings generated.
   drivers/gpu/drm/panel/panel-sony-acx565akm.c:84:2: warning: Call to func=
tion 'memset' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memset_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(xfer, 0, sizeof(xfer));
           ^~~~~~
   drivers/gpu/drm/panel/panel-sony-acx565akm.c:84:2: note: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11
           memset(xfer, 0, sizeof(xfer));
           ^~~~~~
>> drivers/gpu/drm/panel/panel-sony-acx565akm.c:196:9: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide bounding of the memory b=
uffer or security checks introduced in the C11 standard. Replace with analo=
gous functions that support length arguments or provides boundary checks su=
ch as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depre=
catedOrUnsafeBufferHandling]
           return sprintf(buf, "%s\n", mode_str);
                  ^~~~~~~
   drivers/gpu/drm/panel/panel-sony-acx565akm.c:196:9: note: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11
           return sprintf(buf, "%s\n", mode_str);
                  ^~~~~~~
   drivers/gpu/drm/panel/panel-sony-acx565akm.c:241:10: warning: Call to fu=
nction 'sprintf' is insecure as it does not provide bounding of the memory =
buffer or security checks introduced in the C11 standard. Replace with anal=
ogous functions that support length arguments or provides boundary checks s=
uch as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depr=
ecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%s\n", acx565akm_cabc_modes[0]);
                          ^~~~~~~
   drivers/gpu/drm/panel/panel-sony-acx565akm.c:241:10: note: Call to funct=
ion 'sprintf' is insecure as it does not provide bounding of the memory buf=
fer or security checks introduced in the C11 standard. Replace with analogo=
us functions that support length arguments or provides boundary checks such=
 as 'sprintf_s' in case of C11
                   return sprintf(buf, "%s\n", acx565akm_cabc_modes[0]);
                          ^~~~~~~
   drivers/gpu/drm/panel/panel-sony-acx565akm.c:244:10: warning: Call to fu=
nction 'sprintf' is insecure as it does not provide bounding of the memory =
buffer or security checks introduced in the C11 standard. Replace with anal=
ogous functions that support length arguments or provides boundary checks s=
uch as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depr=
ecatedOrUnsafeBufferHandling]
                   len +=3D sprintf(&buf[len], "%s%s", i ? " " : "",
                          ^~~~~~~
   drivers/gpu/drm/panel/panel-sony-acx565akm.c:244:10: note: Call to funct=
ion 'sprintf' is insecure as it does not provide bounding of the memory buf=
fer or security checks introduced in the C11 standard. Replace with analogo=
us functions that support length arguments or provides boundary checks such=
 as 'sprintf_s' in case of C11
                   len +=3D sprintf(&buf[len], "%s%s", i ? " " : "",
                          ^~~~~~~
   Suppressed 60 warnings (53 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   drivers/misc/eeprom/eeprom.c:102:3: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, &data->data[off], count);
                   ^~~~~~
   drivers/misc/eeprom/eeprom.c:102:3: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, &data->data[off], count);
                   ^~~~~~
   drivers/misc/eeprom/eeprom.c:155:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(data->data, 0xff, EEPROM_SIZE);
           ^~~~~~
   drivers/misc/eeprom/eeprom.c:155:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(data->data, 0xff, EEPROM_SIZE);
           ^~~~~~
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/tty/serial/8250/8250_fintek.c:209:3: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(rs485->padding, 0, sizeof(rs485->padding));
                   ^~~~~~
   drivers/tty/serial/8250/8250_fintek.c:209:3: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
                   memset(rs485->padding, 0, sizeof(rs485->padding));
                   ^~~~~~
   drivers/tty/serial/8250/8250_fintek.c:212:3: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(rs485, 0, sizeof(*rs485));
                   ^~~~~~
   drivers/tty/serial/8250/8250_fintek.c:212:3: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
                   memset(rs485, 0, sizeof(*rs485));
                   ^~~~~~
   drivers/tty/serial/8250/8250_fintek.c:457:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(pdata, &probe_data, sizeof(probe_data));
           ^~~~~~
   drivers/tty/serial/8250/8250_fintek.c:457:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(pdata, &probe_data, sizeof(probe_data));
           ^~~~~~
   Suppressed 45 warnings (38 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (38 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/tty/serial/8250/8250_tegra.c:54:2: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&port8250, 0, sizeof(port8250));
           ^~~~~~
   drivers/tty/serial/8250/8250_tegra.c:54:2: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
           memset(&port8250, 0, sizeof(port8250));
           ^~~~~~
   Suppressed 46 warnings (38 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   88 warnings generated.
   Suppressed 88 warnings (81 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   87 warnings generated.
   net/caif/cfcnfg.c:226:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(l, 0, sizeof(*l));
           ^~~~~~
   net/caif/cfcnfg.c:226:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(l, 0, sizeof(*l));
           ^~~~~~
   net/caif/cfcnfg.c:285:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(l->u.utility.params, s->param.data,
                   ^~~~~~
   net/caif/cfcnfg.c:285:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(l->u.utility.params, s->param.data,
                   ^~~~~~
   net/caif/cfcnfg.c:408:14: warning: Access to field 'id' results in a der=
eference of a null pointer (loaded from field 'phy_layer') [clang-analyzer-=
core.NullDereference]
           caif_assert(phyinfo->phy_layer->id =3D=3D phyid);
                       ^
   include/net/caif/caif_layer.h:29:8: note: expanded from macro 'caif_asse=
rt'
           if (!(assert)) {                                        \
                 ^~~~~~
   net/caif/cfcnfg.c:380:6: note: Assuming 'channel_id' is not equal to 0
           if (channel_id =3D=3D 0) {
               ^~~~~~~~~~~~~~~
   net/caif/cfcnfg.c:380:2: note: Taking false branch
           if (channel_id =3D=3D 0) {
           ^
   net/caif/cfcnfg.c:390:6: note: Assuming 'adapt_layer' is not equal to NU=
LL
           if (adapt_layer =3D=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~
   net/caif/cfcnfg.c:390:2: note: Taking false branch
           if (adapt_layer =3D=3D NULL) {
--
                   ^~~~~~~~
   drivers/base/core.c:592:2: warning: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(buf, len, "consumer:%s:%s", dev_bus_name(con), dev_name=
(con));
           ^~~~~~~~
   drivers/base/core.c:592:2: note: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11
           snprintf(buf, len, "consumer:%s:%s", dev_bus_name(con), dev_name=
(con));
           ^~~~~~~~
   drivers/base/core.c:2690:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return print_dev_t(buf, dev->devt);
                  ^
   include/linux/kdev_t.h:15:2: note: expanded from macro 'print_dev_t'
           sprintf((buffer), "%u:%u\n", MAJOR(dev), MINOR(dev))
           ^~~~~~~
   drivers/base/core.c:2690:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return print_dev_t(buf, dev->devt);
                  ^
   include/linux/kdev_t.h:15:2: note: expanded from macro 'print_dev_t'
           sprintf((buffer), "%u:%u\n", MAJOR(dev), MINOR(dev))
           ^~~~~~~
   drivers/base/core.c:3229:3: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   format_dev_t(devt_str, dev->devt);
                   ^
   include/linux/kdev_t.h:19:3: note: expanded from macro 'format_dev_t'
                   sprintf(buffer, "%u:%u", MAJOR(dev), MINOR(dev));       \
                   ^~~~~~~
   drivers/base/core.c:3229:3: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
                   format_dev_t(devt_str, dev->devt);
                   ^
   include/linux/kdev_t.h:19:3: note: expanded from macro 'format_dev_t'
                   sprintf(buffer, "%u:%u", MAJOR(dev), MINOR(dev));       \
                   ^~~~~~~
   drivers/base/core.c:3242:3: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   format_dev_t(devt_str, dev->devt);
                   ^
   include/linux/kdev_t.h:19:3: note: expanded from macro 'format_dev_t'
                   sprintf(buffer, "%u:%u", MAJOR(dev), MINOR(dev));       \
                   ^~~~~~~
   drivers/base/core.c:3242:3: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
                   format_dev_t(devt_str, dev->devt);
                   ^
   include/linux/kdev_t.h:19:3: note: expanded from macro 'format_dev_t'
                   sprintf(buffer, "%u:%u", MAJOR(dev), MINOR(dev));       \
                   ^~~~~~~
   Suppressed 84 warnings (77 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   86 warnings generated.
   net/ethtool/common.c:452:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(link_ksettings, 0, sizeof(*link_ksettings));
           ^~~~~~
   net/ethtool/common.c:452:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(link_ksettings, 0, sizeof(*link_ksettings));
           ^~~~~~
   net/ethtool/common.c:545:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(info, 0, sizeof(*info));
           ^~~~~~
   net/ethtool/common.c:545:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(info, 0, sizeof(*info));
           ^~~~~~
   Suppressed 84 warnings (77 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   117 warnings generated.
   Suppressed 117 warnings (110 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   69 warnings generated.
   drivers/leds/leds-lp5523.c:338:9: warning: Call to function 'sscanf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sscanf(data + offset, "%2s%n ", c, &nrchars);
                         ^~~~~~
   drivers/leds/leds-lp5523.c:338:9: note: Call to function 'sscanf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sscanf_s' in case of C11
                   ret =3D sscanf(data + offset, "%2s%n ", c, &nrchars);
                         ^~~~~~
   drivers/leds/leds-lp5523.c:342:9: warning: Call to function 'sscanf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sscanf(c, "%2x", &cmd);
                         ^~~~~~
   drivers/leds/leds-lp5523.c:342:9: note: Call to function 'sscanf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sscanf_s' in case of C11
                   ret =3D sscanf(c, "%2x", &cmd);
                         ^~~~~~
   drivers/leds/leds-lp5523.c:398:10: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "run\n");
                          ^~~~~~~
   drivers/leds/leds-lp5523.c:398:10: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "run\n");
                          ^~~~~~~
   drivers/leds/leds-lp5523.c:400:10: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "load\n");
                          ^~~~~~~
   drivers/leds/leds-lp5523.c:400:10: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "load\n");
                          ^~~~~~~
   drivers/leds/leds-lp5523.c:403:10: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "disabled\n");
                          ^~~~~~~
   drivers/leds/leds-lp5523.c:403:10: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "disabled\n");
                          ^~~~~~~
   drivers/leds/leds-lp5523.c:473:10: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   pos +=3D sprintf(array + pos, "%x", LED_ACTIVE(led_mux, =
i));
                          ^~~~~~~
   drivers/leds/leds-lp5523.c:473:10: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
                   pos +=3D sprintf(array + pos, "%x", LED_ACTIVE(led_mux, =
i));
                          ^~~~~~~
>> drivers/leds/leds-lp5523.c:488:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
           return sprintf(buf, "%s\n", mux);
                  ^~~~~~~
   drivers/leds/leds-lp5523.c:488:9: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
           return sprintf(buf, "%s\n", mux);
                  ^~~~~~~
   drivers/leds/leds-lp5523.c:643:11: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           pos +=3D sprintf(buf + pos, "LED %d FAIL\n", i);
                                  ^~~~~~~
   drivers/leds/leds-lp5523.c:643:11: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
                           pos +=3D sprintf(buf + pos, "LED %d FAIL\n", i);
                                  ^~~~~~~
   drivers/leds/leds-lp5523.c:653:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   pos =3D sprintf(buf, "OK\n");
                         ^~~~~~~
   drivers/leds/leds-lp5523.c:653:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                   pos =3D sprintf(buf, "OK\n");
                         ^~~~~~~
   drivers/leds/leds-lp5523.c:656:8: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           pos =3D sprintf(buf, "FAIL\n");
                 ^~~~~~~
   drivers/leds/leds-lp5523.c:656:8: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           pos =3D sprintf(buf, "FAIL\n");
                 ^~~~~~~
   drivers/leds/leds-lp5523.c:694:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sprintf(buf, "%u\n", val);
                         ^~~~~~~
   drivers/leds/leds-lp5523.c:694:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                   ret =3D sprintf(buf, "%u\n", val);
                         ^~~~~~~
   drivers/leds/leds-lp5523.c:811:2: warning: Undefined or garbage value re=
turned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   drivers/leds/leds-lp5523.c:798:2: note: 'ret' declared without an initia=
l value
           int ret;
           ^~~~~~~
   drivers/leds/leds-lp5523.c:802:14: note: Assuming 'i' is >=3D field 'num=
_colors'
           for (i =3D 0; i < led->mc_cdev.num_colors; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-lp5523.c:802:2: note: Loop condition is false. Executi=
on continues on line 810
           for (i =3D 0; i < led->mc_cdev.num_colors; i++) {
           ^
   drivers/leds/leds-lp5523.c:811:2: note: Undefined or garbage value retur=
ned to caller
           return ret;
           ^      ~~~
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   104 warnings generated.
   net/rose/rose_dev.c:42:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buff + 7, daddr, dev->addr_len);
                   ^~~~~~
   net/rose/rose_dev.c:42:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(buff + 7, daddr, dev->addr_len);
                   ^~~~~~
   Suppressed 103 warnings (96 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   102 warnings generated.
   Suppressed 102 warnings (95 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   90 warnings generated.
   Suppressed 90 warnings (83 in non-user code, 7 with check filters).
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
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   drivers/media/dvb-core/dmxdev.c:741:3: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&((*secfilter)->filter_value[3]),
                   ^~~~~~
   drivers/media/dvb-core/dmxdev.c:741:3: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&((*secfilter)->filter_value[3]),
                   ^~~~~~
   drivers/media/dvb-core/dmxdev.c:743:3: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&(*secfilter)->filter_mask[3],
--
       ^
   lib/zstd/compress/../common/zstd_deps.h:34:28: note: expanded from macro=
 'ZSTD_memset'
   #define ZSTD_memset(d,s,n) __builtin_memset((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:4499:5: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       ZSTD_memcpy(updatedRepcodes.rep, cctx->blockState.prevCBlock->rep, s=
izeof(repcodes_t));
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:4499:5: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
       ZSTD_memcpy(updatedRepcodes.rep, cctx->blockState.prevCBlock->rep, s=
izeof(repcodes_t));
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:4520:5: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       ZSTD_memcpy(cctx->blockState.nextCBlock->rep, updatedRepcodes.rep, s=
izeof(repcodes_t));
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:4520:5: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
       ZSTD_memcpy(cctx->blockState.nextCBlock->rep, updatedRepcodes.rep, s=
izeof(repcodes_t));
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:4570:5: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       ZSTD_memcpy(updatedRepcodes.rep, cctx->blockState.prevCBlock->rep, s=
izeof(repcodes_t));
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:4570:5: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
       ZSTD_memcpy(updatedRepcodes.rep, cctx->blockState.prevCBlock->rep, s=
izeof(repcodes_t));
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:4650:5: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       ZSTD_memcpy(cctx->blockState.nextCBlock->rep, updatedRepcodes.rep, s=
izeof(repcodes_t));
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:4650:5: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
       ZSTD_memcpy(cctx->blockState.nextCBlock->rep, updatedRepcodes.rep, s=
izeof(repcodes_t));
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:5096:5: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       ZSTD_memset(&params, 0, sizeof(params));
       ^
   lib/zstd/compress/../common/zstd_deps.h:34:28: note: expanded from macro=
 'ZSTD_memset'
   #define ZSTD_memset(d,s,n) __builtin_memset((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress.c:5096:5: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
       ZSTD_memset(&params, 0, sizeof(params));
       ^
   lib/zstd/compress/../common/zstd_deps.h:34:28: note: expanded from macro=
 'ZSTD_memset'
   #define ZSTD_memset(d,s,n) __builtin_memset((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   drivers/leds/leds-lp8501.c:223:9: warning: Call to function 'sscanf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sscanf(data + offset, "%2s%n ", c, &nrchars);
                         ^~~~~~
   drivers/leds/leds-lp8501.c:223:9: note: Call to function 'sscanf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sscanf_s' in case of C11
                   ret =3D sscanf(data + offset, "%2s%n ", c, &nrchars);
                         ^~~~~~
   drivers/leds/leds-lp8501.c:227:9: warning: Call to function 'sscanf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sscanf(c, "%2x", &cmd);
                         ^~~~~~
   drivers/leds/leds-lp8501.c:227:9: note: Call to function 'sscanf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sscanf_s' in case of C11
                   ret =3D sscanf(c, "%2x", &cmd);
                         ^~~~~~
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (38 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   drivers/leds/leds-pca9532.c:516:23: warning: Value stored to 'data' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct pca9532_data *data =3D i2c_get_clientdata(client);
                                ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-pca9532.c:516:23: note: Value stored to 'data' during =
its initialization is never read
           struct pca9532_data *data =3D i2c_get_clientdata(client);
                                ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (40 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
>> drivers/hwmon/mc13783-adc.c:37:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
           return sprintf(buf, "%s\n", priv->name);
                  ^~~~~~~
   drivers/hwmon/mc13783-adc.c:37:9: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
           return sprintf(buf, "%s\n", priv->name);
                  ^~~~~~~
   drivers/hwmon/mc13783-adc.c:87:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", val);
                  ^~~~~~~
   drivers/hwmon/mc13783-adc.c:87:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", val);
                  ^~~~~~~
   drivers/hwmon/mc13783-adc.c:106:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", val);
                  ^~~~~~~
   drivers/hwmon/mc13783-adc.c:106:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", val);
                  ^~~~~~~
   drivers/hwmon/mc13783-adc.c:128:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", val);
                  ^~~~~~~
   drivers/hwmon/mc13783-adc.c:128:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", val);
                  ^~~~~~~
   drivers/hwmon/mc13783-adc.c:159:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", ret);
                  ^~~~~~~
   drivers/hwmon/mc13783-adc.c:159:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", ret);
                  ^~~~~~~
   drivers/hwmon/mc13783-adc.c:239:2: warning: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(priv->name, ARRAY_SIZE(priv->name), "%s", id->name);
           ^~~~~~~~
   drivers/hwmon/mc13783-adc.c:239:2: note: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11
           snprintf(priv->name, ARRAY_SIZE(priv->name), "%s", id->name);
           ^~~~~~~~
   Suppressed 45 warnings (38 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   Suppressed 60 warnings (53 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/iio/adc/ad_sigma_delta.c:196:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0xff, size);
           ^~~~~~
   drivers/iio/adc/ad_sigma_delta.c:196:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(buf, 0xff, size);
           ^~~~~~
   Suppressed 47 warnings (40 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   drivers/iio/adc/ad7124.c:165:8: warning: Excessive padding in 'struct ad=
7124_state' (80 padding bytes, where 16 is optimal). =

   Optimal fields order: =

   sd, =

   chip_info, =

   channels, =

   mclk, =

   cfg_slots_status, =

   vref, =

   live_cfgs_fifo, =

   cfgs_lock, =

   adc_control, =

   num_channels, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad7124_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/adc/ad7124.c:165:8: note: Excessive padding in 'struct ad712=
4_state' (80 padding bytes, where 16 is optimal). Optimal fields order: sd,=
 chip_info, channels, mclk, cfg_slots_status, vref, live_cfgs_fifo, cfgs_lo=
ck, adc_control, num_channels, consider reordering the fields or adding exp=
licit padding members
   struct ad7124_state {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 59 warnings (52 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   drivers/iio/adc/ad7292.c:78:8: warning: Excessive padding in 'struct ad7=
292_state' (106 padding bytes, where 42 is optimal). =

   Optimal fields order: =

   d16, =

   vref_mv, =

   d8, =

   spi, =

   reg, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad7292_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/adc/ad7292.c:78:8: note: Excessive padding in 'struct ad7292=
_state' (106 padding bytes, where 42 is optimal). Optimal fields order: d16=
, vref_mv, d8, spi, reg, consider reordering the fields or adding explicit =
padding members
   struct ad7292_state {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 59 warnings (52 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (52 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   lib/zstd/compress/zstd_compress_literals.c:38:5: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       ZSTD_memcpy(ostart + flSize, src, srcSize);
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress_literals.c:38:5: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
       ZSTD_memcpy(ostart + flSize, src, srcSize);
       ^
   lib/zstd/compress/../common/zstd_deps.h:32:28: note: expanded from macro=
 'ZSTD_memcpy'
--
           return sprintf(buf, "%d\n", val + autorange_table[out]);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:647:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", val + autorange_table[out]);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:708:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", out);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:708:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", out);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:743:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->pwm[sattr->nr][sattr->index]);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:743:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->pwm[sattr->nr][sattr->index]);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:755:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->pwmchan[sattr->index]);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:755:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->pwmchan[sattr->index]);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:767:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->pwmctl[sattr->index]);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:767:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->pwmctl[sattr->index]);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:828:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", !!(data->enh_acoustics[0] & mask));
                  ^~~~~~~
   drivers/hwmon/adt7475.c:828:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", !!(data->enh_acoustics[0] & mask));
                  ^~~~~~~
   drivers/hwmon/adt7475.c:980:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", pwmfreq_table[idx]);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:980:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", pwmfreq_table[idx]);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:1021:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", !!(data->config4 & CONFIG4_MAXDUTY));
                  ^~~~~~~
   drivers/hwmon/adt7475.c:1021:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", !!(data->config4 & CONFIG4_MAXDUTY));
                  ^~~~~~~
   drivers/hwmon/adt7475.c:1053:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", (int)data->vrm);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:1053:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", (int)data->vrm);
                  ^~~~~~~
   drivers/hwmon/adt7475.c:1079:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
                  ^~~~~~~
   drivers/hwmon/adt7475.c:1079:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
                  ^~~~~~~
   Suppressed 58 warnings (50 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (52 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (52 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   drivers/w1/slaves/w1_ds28e04.c:137:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, &data->memory[off], count);
                   ^~~~~~
   drivers/w1/slaves/w1_ds28e04.c:137:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, &data->memory[off], count);
                   ^~~~~~
   Suppressed 20 warnings (20 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   drivers/extcon/extcon-sm5502.c:24:8: warning: Excessive padding in 'stru=
ct muic_irq' (8 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   name, =

   irq, =

   virq, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct muic_irq {
   ~~~~~~~^~~~~~~~~~
   drivers/extcon/extcon-sm5502.c:24:8: note: Excessive padding in 'struct =
muic_irq' (8 padding bytes, where 0 is optimal). Optimal fields order: name=
, irq, virq, consider reordering the fields or adding explicit padding memb=
ers
   struct muic_irq {
   ~~~~~~~^~~~~~~~~~
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (38 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (41 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
>> drivers/hwmon/max1111.c:101:9: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
           return sprintf(buf, "%s\n", to_spi_device(dev)->modalias);
                  ^~~~~~~
   drivers/hwmon/max1111.c:101:9: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
           return sprintf(buf, "%s\n", to_spi_device(dev)->modalias);
                  ^~~~~~~
   drivers/hwmon/max1111.c:119:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", ret * data->lsb);
                  ^~~~~~~
   drivers/hwmon/max1111.c:119:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", ret * data->lsb);
                  ^~~~~~~
   Suppressed 47 warnings (40 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   127 warnings generated.
   net/core/sock.c:661:2: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memset(devname, 0, sizeof(devname));
           ^~~~~~
   net/core/sock.c:661:2: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
           memset(devname, 0, sizeof(devname));
           ^~~~~~
   net/core/sock.c:1195:4: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&timestamping, 0, sizeof(timestamping));
                           ^~~~~~
   net/core/sock.c:1195:4: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
                           memset(&timestamping, 0, sizeof(timestamping));
                           ^~~~~~
   net/core/sock.c:1520:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&v, 0, sizeof(v));
           ^~~~~~
   net/core/sock.c:1520:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset(&v, 0, sizeof(v));
           ^~~~~~
   net/core/sock.c:1898:2: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(nsk, osk, offsetof(struct sock, sk_dontcopy_begin));
           ^~~~~~
   net/core/sock.c:1898:2: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
           memcpy(nsk, osk, offsetof(struct sock, sk_dontcopy_begin));
           ^~~~~~
   net/core/sock.c:1900:2: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&nsk->sk_dontcopy_end, &osk->sk_dontcopy_end,
           ^~~~~~
   net/core/sock.c:1900:2: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
           memcpy(&nsk->sk_dontcopy_end, &osk->sk_dontcopy_end,
           ^~~~~~
   net/core/sock.c:3532:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(mem, 0, sizeof(*mem) * SK_MEMINFO_VARS);
           ^~~~~~
   net/core/sock.c:3532:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset(mem, 0, sizeof(*mem) * SK_MEMINFO_VARS);
           ^~~~~~
   Suppressed 121 warnings (114 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (39 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (39 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/hwmon/lm75.h:30:29: warning: The result of the left shift is und=
efined because the left operand is negative [clang-analyzer-core.UndefinedB=
inaryOperatorResult]
           return (u16)((ntemp / 500) << 7);
                                      ^
   drivers/hwmon/w83627hf.c:777:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   drivers/hwmon/w83627hf.c:777:2: note: Taking false branch
           if (err)
           ^
   drivers/hwmon/w83627hf.c:780:8: note: Assuming 'nr' is not equal to 0
           tmp =3D (nr) ? LM75_TEMP_TO_REG(val) : TEMP_TO_REG(val);
                 ^~~~
   drivers/hwmon/w83627hf.c:780:8: note: '?' condition is true
   drivers/hwmon/w83627hf.c:780:15: note: Calling 'LM75_TEMP_TO_REG'
           tmp =3D (nr) ? LM75_TEMP_TO_REG(val) : TEMP_TO_REG(val);
                        ^~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/lm75.h:27:14: note: Assuming '__UNIQUE_ID___x190' is <=3D =
'__UNIQUE_ID___y191'
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/minmax.h:104:48: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   71 warnings generated.
   drivers/hwmon/lm63.c:336:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[attr->index])=
);
                  ^~~~~~~
   drivers/hwmon/lm63.c:336:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[attr->index])=
);
                  ^~~~~~~
   drivers/hwmon/lm63.c:376:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", pwm);
                  ^~~~~~~
   drivers/hwmon/lm63.c:376:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", pwm);
                  ^~~~~~~
   drivers/hwmon/lm63.c:412:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->config_fan & 0x20 ? 1 : 2);
                  ^~~~~~~
   drivers/hwmon/lm63.c:412:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->config_fan & 0x20 ? 1 : 2);
                  ^~~~~~~
   drivers/hwmon/lm63.c:462:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP8_FROM_REG(data->temp8[attr->ind=
ex]));
                  ^~~~~~~
   drivers/hwmon/lm63.c:462:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", TEMP8_FROM_REG(data->temp8[attr->ind=
ex]));
                  ^~~~~~~
   drivers/hwmon/lm63.c:471:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", temp8_from_reg(data, attr->index)
                  ^~~~~~~
   drivers/hwmon/lm63.c:471:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", temp8_from_reg(data, attr->index)
                  ^~~~~~~
   drivers/hwmon/lm63.c:481:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", lut_temp_from_reg(data, attr->index)
                  ^~~~~~~
   drivers/hwmon/lm63.c:481:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", lut_temp_from_reg(data, attr->index)
                  ^~~~~~~
   drivers/hwmon/lm63.c:547:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", temp + data->temp2_offset);
                  ^~~~~~~
   drivers/hwmon/lm63.c:547:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", temp + data->temp2_offset);
                  ^~~~~~~
   drivers/hwmon/lm63.c:595:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", temp8_from_reg(data, 2)
                  ^~~~~~~
   drivers/hwmon/lm63.c:595:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", temp8_from_reg(data, 2)
                  ^~~~~~~
   drivers/hwmon/lm63.c:606:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", lut_temp_from_reg(data, attr->index)
                  ^~~~~~~
   drivers/hwmon/lm63.c:606:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", lut_temp_from_reg(data, attr->index)
                  ^~~~~~~
   drivers/hwmon/lm63.c:666:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", data->update_interval);
                  ^~~~~~~
   drivers/hwmon/lm63.c:666:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", data->update_interval);
                  ^~~~~~~
   drivers/hwmon/lm63.c:693:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandl=
ing]
           return sprintf(buf, data->trutherm ? "1\n" : "2\n");
                  ^~~~~~~
   drivers/hwmon/lm63.c:693:9: note: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11
           return sprintf(buf, data->trutherm ? "1\n" : "2\n");
                  ^~~~~~~
   drivers/hwmon/lm63.c:727:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", data->alarms);
                  ^~~~~~~
   drivers/hwmon/lm63.c:727:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", data->alarms);
                  ^~~~~~~
   drivers/hwmon/lm63.c:737:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
                  ^~~~~~~
   drivers/hwmon/lm63.c:737:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
                  ^~~~~~~
   Suppressed 58 warnings (50 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   drivers/hwmon/sht15.c:689:21: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return ret ? ret : sprintf(buf, "%d\n", !!(data->val_status & bi=
t));
                              ^~~~~~~
   drivers/hwmon/sht15.c:689:21: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return ret ? ret : sprintf(buf, "%d\n", !!(data->val_status & bi=
t));
                              ^~~~~~~
   drivers/hwmon/sht15.c:745:21: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return ret ? ret : sprintf(buf, "%d\n",
                              ^~~~~~~
   drivers/hwmon/sht15.c:745:21: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return ret ? ret : sprintf(buf, "%d\n",
                              ^~~~~~~
   drivers/hwmon/sht15.c:766:21: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return ret ? ret : sprintf(buf, "%d\n", sht15_calc_humid(data));
                              ^~~~~~~
   drivers/hwmon/sht15.c:766:21: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return ret ? ret : sprintf(buf, "%d\n", sht15_calc_humid(data));
                              ^~~~~~~
>> drivers/hwmon/sht15.c:774:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHand=
ling]
           return sprintf(buf, "%s\n", pdev->name);
                  ^~~~~~~
   drivers/hwmon/sht15.c:774:9: note: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11
           return sprintf(buf, "%s\n", pdev->name);
                  ^~~~~~~
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/mtd/nand/spi/gigadevice.c:195:14: warning: The left operand of '=
&' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                           ((status2 & STATUS_ECC_MASK) >> 4);
                             ~~~~~~~ ^
   drivers/mtd/nand/spi/gigadevice.c:171:2: note: 'status2' declared withou=
t an initial value
           u8 status2;
           ^~~~~~~~~~
   drivers/mtd/nand/spi/gigadevice.c:176:2: note: Control jumps to 'case 16=
:'  at line 180
           switch (status & STATUS_ECC_MASK) {
           ^
   drivers/mtd/nand/spi/gigadevice.c:186:7: note: Assuming 'ret' is 0
                   if (ret)
                       ^~~
   drivers/mtd/nand/spi/gigadevice.c:186:3: note: Taking false branch
                   if (ret)
                   ^
   drivers/mtd/nand/spi/gigadevice.c:195:14: note: The left operand of '&' =
is a garbage value
                           ((status2 & STATUS_ECC_MASK) >> 4);
                             ~~~~~~~ ^
   drivers/mtd/nand/spi/gigadevice.c:235:20: warning: The left operand of '=
&' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   return ((status2 & STATUS_ECC_MASK) >> 4) + 1;
                            ~~~~~~~ ^
   drivers/mtd/nand/spi/gigadevice.c:213:2: note: 'status2' declared withou=
t an initial value
           u8 status2;
           ^~~~~~~~~~
   drivers/mtd/nand/spi/gigadevice.c:218:2: note: Control jumps to 'case 16=
:'  at line 222
           switch (status & STATUS_ECC_MASK) {
           ^
   drivers/mtd/nand/spi/gigadevice.c:228:7: note: Assuming 'ret' is 0
                   if (ret)
                       ^~~
   drivers/mtd/nand/spi/gigadevice.c:228:3: note: Taking false branch
                   if (ret)
                   ^
   drivers/mtd/nand/spi/gigadevice.c:235:20: note: The left operand of '&' =
is a garbage value
                   return ((status2 & STATUS_ECC_MASK) >> 4) + 1;
                            ~~~~~~~ ^
   Suppressed 48 warnings (41 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/mtd/nand/spi/macronix.c:63:9: warning: The left expression of th=
e compound assignment is an uninitialized value. The computed value will al=
so be garbage [clang-analyzer-core.uninitialized.Assign]
           *eccsr &=3D MACRONIX_ECCSR_MASK;
                  ^
   drivers/mtd/nand/spi/macronix.c:71:2: note: 'eccsr' declared without an =
initial value
           u8 eccsr;
           ^~~~~~~~
   drivers/mtd/nand/spi/macronix.c:73:2: note: Control jumps to 'case 16:' =
 at line 80
           switch (status & STATUS_ECC_MASK) {
           ^
   drivers/mtd/nand/spi/macronix.c:86:7: note: Calling 'mx35lf1ge4ab_get_ec=
csr'
                   if (mx35lf1ge4ab_get_eccsr(spinand, &eccsr))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/macronix.c:60:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/mtd/nand/spi/macronix.c:60:2: note: Taking false branch
           if (ret)
           ^
   drivers/mtd/nand/spi/macronix.c:63:9: note: The left expression of the c=
ompound assignment is an uninitialized value. The computed value will also =
be garbage
           *eccsr &=3D MACRONIX_ECCSR_MASK;
           ~~~~~~ ^
   Suppressed 48 warnings (41 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (41 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/i3c/master/i3c-master-cdns.c:434:3: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&tmp, bytes + (nbytes & ~3), nbytes & 3);
                   ^~~~~~
   drivers/i3c/master/i3c-master-cdns.c:434:3: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&tmp, bytes + (nbytes & ~3), nbytes & 3);
                   ^~~~~~
   drivers/i3c/master/i3c-master-cdns.c:447:3: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
                   ^~~~~~
   drivers/i3c/master/i3c-master-cdns.c:447:3: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
                   ^~~~~~
   drivers/i3c/master/i3c-master-cdns.c:1052:2: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(info, 0, sizeof(*info));
           ^~~~~~
   drivers/i3c/master/i3c-master-cdns.c:1052:2: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
           memset(info, 0, sizeof(*info));
           ^~~~~~
   drivers/i3c/master/i3c-master-cdns.c:1245:2: warning: Value stored to 'p=
rescl1' is never read [clang-analyzer-deadcode.DeadStores]
           prescl1 =3D PRESCL_CTRL1_OD_LOW(low);
           ^
   drivers/i3c/master/i3c-master-cdns.c:1245:2: note: Value stored to 'pres=
cl1' is never read
   drivers/i3c/master/i3c-master-cdns.c:1338:3: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf + (nbytes & ~3), &tmp, nbytes & 3);
                   ^~~~~~
   drivers/i3c/master/i3c-master-cdns.c:1338:3: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
--
                  ^~~~~~~
   drivers/hwmon/w83793.c:707:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", val);
                  ^~~~~~~
   drivers/hwmon/w83793.c:807:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", val);
                  ^~~~~~~
   drivers/hwmon/w83793.c:807:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", val);
                  ^~~~~~~
   drivers/hwmon/w83793.c:879:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", (data->sf2_pwm[index][nr] & 0x3f) <<=
 2);
                  ^~~~~~~
   drivers/hwmon/w83793.c:879:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", (data->sf2_pwm[index][nr] & 0x3f) <<=
 2);
                  ^~~~~~~
   drivers/hwmon/w83793.c:919:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n",
                  ^~~~~~~
   drivers/hwmon/w83793.c:919:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n",
                  ^~~~~~~
   drivers/hwmon/w83793.c:968:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", val);
                  ^~~~~~~
   drivers/hwmon/w83793.c:968:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", val);
                  ^~~~~~~
   drivers/hwmon/w83793.c:1252:7: warning: Access to field 'client' results=
 in a dereference of a null pointer (loaded from variable 'data') [clang-an=
alyzer-core.NullDereference]
           if (!data->client) {
                ^
   drivers/hwmon/w83793.c:1289:28: note: 'data' initialized to a null point=
er value
           struct w83793_data *pos, *data =3D NULL;
                                     ^~~~
   drivers/hwmon/w83793.c:1298:6: note: Assuming the condition is false
           if (!mutex_trylock(&watchdog_data_mutex))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/w83793.c:1298:2: note: Taking false branch
           if (!mutex_trylock(&watchdog_data_mutex))
           ^
   drivers/hwmon/w83793.c:1300:2: note: Loop condition is false. Execution =
continues on line 1308
           list_for_each_entry(pos, &watchdog_data_list, list) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/hwmon/w83793.c:1314:6: note: Assuming 'watchdog_is_open' is 0
           if (!watchdog_is_open)
               ^~~~~~~~~~~~~~~~~
   drivers/hwmon/w83793.c:1314:2: note: Taking true branch
           if (!watchdog_is_open)
           ^
   drivers/hwmon/w83793.c:1320:6: note: 'watchdog_is_open' is 0
           if (watchdog_is_open)
               ^~~~~~~~~~~~~~~~
   drivers/hwmon/w83793.c:1320:2: note: Taking false branch
           if (watchdog_is_open)
           ^
   drivers/hwmon/w83793.c:1324:18: note: Passing null pointer value via 1st=
 parameter 'data'
           watchdog_enable(data);
                           ^~~~
   drivers/hwmon/w83793.c:1324:2: note: Calling 'watchdog_enable'
           watchdog_enable(data);
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/w83793.c:1252:7: note: Access to field 'client' results in=
 a dereference of a null pointer (loaded from variable 'data')
           if (!data->client) {
                ^~~~
   drivers/hwmon/w83793.c:1873:3: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(data->watchdog_name, sizeof(data->watchdog_name=
),
                   ^~~~~~~~
   drivers/hwmon/w83793.c:1873:3: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
                   snprintf(data->watchdog_name, sizeof(data->watchdog_name=
),
                   ^~~~~~~~
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (20 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/mcb/mcb-parse.c:210:2: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(bus->name, CHAMELEON_FILENAME_LEN + 1, "%s",
           ^~~~~~~~
   drivers/mcb/mcb-parse.c:210:2: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
           snprintf(bus->name, CHAMELEON_FILENAME_LEN + 1, "%s",
           ^~~~~~~~
   Suppressed 30 warnings (23 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
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
>> drivers/siox/siox-core.c:389:9: warning: Call to function 'sprintf' is i=
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
   Suppressed 49 warnings (42 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   104 warnings generated.
   drivers/net/wireless/ath/ath6kl/main.c:72:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(sta->mac, mac, ETH_ALEN);
           ^~~~~~
   drivers/net/wireless/ath/ath6kl/main.c:72:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(sta->mac, mac, ETH_ALEN);
           ^~~~~~
   drivers/net/wireless/ath/ath6kl/main.c:74:3: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(sta->wpa_ie, wpaie, ielen);
                   ^~~~~~
   drivers/net/wireless/ath/ath6kl/main.c:74:3: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(sta->wpa_ie, wpaie, ielen);
                   ^~~~~~
   drivers/net/wireless/ath/ath6kl/main.c:106:2: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ar->ap_stats.sta[sta->aid - 1], 0,
           ^~~~~~
   drivers/net/wireless/ath/ath6kl/main.c:106:2: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
           memset(&ar->ap_stats.sta[sta->aid - 1], 0,
           ^~~~~~
   drivers/net/wireless/ath/ath6kl/main.c:109:2: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(sta->wpa_ie, 0, ATH6KL_MAX_IE);
           ^~~~~~
   drivers/net/wireless/ath/ath6kl/main.c:109:2: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
           memset(sta->wpa_ie, 0, ATH6KL_MAX_IE);
           ^~~~~~
   drivers/net/wireless/ath/ath6kl/main.c:175:2: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ar->cookie_mem, 0, sizeof(ar->cookie_mem));
           ^~~~~~
   drivers/net/wireless/ath/ath6kl/main.c:175:2: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
           memset(ar->cookie_mem, 0, sizeof(ar->cookie_mem));
           ^~~~~~
   drivers/net/wireless/ath/ath6kl/main.c:401:3: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(key_rsc, 0, sizeof(key_rsc));
                   ^~~~~~
   drivers/net/wireless/ath/ath6kl/main.c:401:3: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
                   memset(key_rsc, 0, sizeof(key_rsc));
                   ^~~~~~
   drivers/net/wireless/ath/ath6kl/main.c:533:2: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ar->mac_addr, datap, ETH_ALEN);
--
   25 warnings generated.
   drivers/w1/w1_io.c:398:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&match[1], &rn, 8);
                   ^~~~~~
   drivers/w1/w1_io.c:398:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(&match[1], &rn, 8);
                   ^~~~~~
   Suppressed 24 warnings (17 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   drivers/media/tuners/tea5761.c:203:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buffer, 0, 16);
           ^~~~~~
   drivers/media/tuners/tea5761.c:203:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(buffer, 0, 16);
           ^~~~~~
   drivers/media/tuners/tea5761.c:327:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&fe->ops.tuner_ops, &tea5761_tuner_ops,
           ^~~~~~
   drivers/media/tuners/tea5761.c:327:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&fe->ops.tuner_ops, &tea5761_tuner_ops,
           ^~~~~~
   Suppressed 59 warnings (52 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   drivers/media/tuners/tda9887.c:552:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(priv->data,0,sizeof(priv->data));
           ^~~~~~
   drivers/media/tuners/tda9887.c:552:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(priv->data,0,sizeof(priv->data));
           ^~~~~~
   drivers/media/tuners/tda9887.c:703:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&fe->ops.analog_ops, &tda9887_ops,
           ^~~~~~
   drivers/media/tuners/tda9887.c:703:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&fe->ops.analog_ops, &tda9887_ops,
           ^~~~~~
   Suppressed 59 warnings (52 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   117 warnings generated.
   Suppressed 117 warnings (110 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   167 warnings generated.
   Suppressed 167 warnings (158 in non-user code, 9 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   101 warnings generated.
   Suppressed 101 warnings (94 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   100 warnings generated.
   net/bluetooth/hci_conn.c:231:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cp, 0, sizeof(cp));
           ^~~~~~
   net/bluetooth/hci_conn.c:231:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(&cp, 0, sizeof(cp));
           ^~~~~~
   net/bluetooth/hci_conn.c:244:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(conn->dev_class, ie->data.dev_class, 3);
                   ^~~~~~
   net/bluetooth/hci_conn.c:244:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(conn->dev_class, ie->data.dev_class, 3);
                   ^~~~~~
   net/bluetooth/hci_conn.c:327:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cp, 0x00, sizeof(cp));
           ^~~~~~
   net/bluetooth/hci_conn.c:327:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(&cp, 0x00, sizeof(cp));
           ^~~~~~
   net/bluetooth/hci_conn.c:509:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cp, 0, sizeof(cp));
           ^~~~~~
   net/bluetooth/hci_conn.c:509:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(&cp, 0, sizeof(cp));
           ^~~~~~
   net/bluetooth/hci_conn.c:534:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cp, 0, sizeof(cp));
           ^~~~~~
   net/bluetooth/hci_conn.c:534:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(&cp, 0, sizeof(cp));
           ^~~~~~
   net/bluetooth/hci_conn.c:539:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cp.ltk, ltk, key_size);
           ^~~~~~
   net/bluetooth/hci_conn.c:539:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(cp.ltk, ltk, key_size);
           ^~~~~~
   net/bluetooth/hci_conn.c:1601:18: warning: Value stored to 'hdev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct hci_dev *hdev =3D conn->hdev;
                           ^~~~   ~~~~~~~~~~
   net/bluetooth/hci_conn.c:1601:18: note: Value stored to 'hdev' during it=
s initialization is never read
           struct hci_dev *hdev =3D conn->hdev;
                           ^~~~   ~~~~~~~~~~
   net/bluetooth/hci_conn.c:1627:18: warning: Value stored to 'hdev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct hci_dev *hdev =3D conn->hdev;
                           ^~~~   ~~~~~~~~~~
   net/bluetooth/hci_conn.c:1627:18: note: Value stored to 'hdev' during it=
s initialization is never read
           struct hci_dev *hdev =3D conn->hdev;
                           ^~~~   ~~~~~~~~~~
   Suppressed 92 warnings (85 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
>> net/rfkill/core.c:687:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%s\n", rfkill->name);
                  ^~~~~~~
   net/rfkill/core.c:687:9: note: Call to function 'sprintf' is insecure as=
 it does not provide bounding of the memory buffer or security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11
           return sprintf(buf, "%s\n", rfkill->name);
                  ^~~~~~~
   net/rfkill/core.c:696:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%s\n", rfkill_types[rfkill->type]);
                  ^~~~~~~
   net/rfkill/core.c:696:9: note: Call to function 'sprintf' is insecure as=
 it does not provide bounding of the memory buffer or security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11
           return sprintf(buf, "%s\n", rfkill_types[rfkill->type]);
                  ^~~~~~~
   net/rfkill/core.c:705:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", rfkill->idx);
                  ^~~~~~~
   net/rfkill/core.c:705:9: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", rfkill->idx);
                  ^~~~~~~
   net/rfkill/core.c:714:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", rfkill->persistent);
                  ^~~~~~~
   net/rfkill/core.c:714:9: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", rfkill->persistent);
                  ^~~~~~~
   net/rfkill/core.c:723:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", (rfkill->state & RFKILL_BLOCK_HW) ? =
1 : 0 );
                  ^~~~~~~
   net/rfkill/core.c:723:9: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", (rfkill->state & RFKILL_BLOCK_HW) ? =
1 : 0 );
                  ^~~~~~~
   net/rfkill/core.c:732:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", (rfkill->state & RFKILL_BLOCK_SW) ? =
1 : 0 );
                  ^~~~~~~
   net/rfkill/core.c:732:9: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", (rfkill->state & RFKILL_BLOCK_SW) ? =
1 : 0 );
                  ^~~~~~~
   net/rfkill/core.c:766:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%lx\n", rfkill->hard_block_reasons);
                  ^~~~~~~
   net/rfkill/core.c:766:9: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%lx\n", rfkill->hard_block_reasons);
                  ^~~~~~~
   net/rfkill/core.c:785:9: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", user_state_from_blocked(rfkill->stat=
e));
                  ^~~~~~~
   net/rfkill/core.c:785:9: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", user_state_from_blocked(rfkill->stat=
e));
                  ^~~~~~~
   net/rfkill/core.c:990:2: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(rfkill->name, name);
           ^~~~~~
   net/rfkill/core.c:990:2: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
           strcpy(rfkill->name, name);
           ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (27 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   drivers/mtd/lpddr/qinfo_probe.c:158:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&lpddr, 0, sizeof(struct lpddr_private));
           ^~~~~~
   drivers/mtd/lpddr/qinfo_probe.c:158:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(&lpddr, 0, sizeof(struct lpddr_private));
           ^~~~~~
   drivers/mtd/lpddr/qinfo_probe.c:175:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(retlpddr, &lpddr, sizeof(struct lpddr_private));
           ^~~~~~
   drivers/mtd/lpddr/qinfo_probe.c:175:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(retlpddr, &lpddr, sizeof(struct lpddr_private));
           ^~~~~~
   Suppressed 49 warnings (42 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   drivers/mtd/lpddr/lpddr_cmds.c:441:24: warning: The left operand of '-' =
is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (n > vec->iov_len - vec_seek)
                                        ^
   drivers/mtd/lpddr/lpddr_cmds.c:641:9: note: Calling 'lpddr_writev'
           return lpddr_writev(mtd, &vec, 1, to, retlen);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/lpddr/lpddr_cmds.c:656:2: note: Loop condition is true.  Ent=
ering loop body
           for (i =3D 0; i < count; i++)
           ^
   drivers/mtd/lpddr/lpddr_cmds.c:656:2: note: Loop condition is false. Exe=
cution continues on line 659
   drivers/mtd/lpddr/lpddr_cmds.c:659:6: note: Assuming 'len' is not equal =
to 0
           if (!len)
               ^~~~
   drivers/mtd/lpddr/lpddr_cmds.c:659:2: note: Taking false branch
           if (!len)
           ^
   drivers/mtd/lpddr/lpddr_cmds.c:671:7: note: Assuming 'size' is <=3D 'len'
                   if (size > len)
                       ^~~~~~~~~~
   drivers/mtd/lpddr/lpddr_cmds.c:671:3: note: Taking false branch
                   if (size > len)
                   ^
   drivers/mtd/lpddr/lpddr_cmds.c:674:9: note: Calling 'do_write_buffer'
                   ret =3D do_write_buffer(map, &lpddr->chips[chipnum],
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/lpddr/lpddr_cmds.c:418:6: note: Assuming 'ret' is 0
--
           ^
   kernel/events/ring_buffer.c:932:20: note: '?' condition is true
                   rb->page_order =3D ilog2(nr_pages);
                                    ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   kernel/events/ring_buffer.c:935:2: note: Calling 'ring_buffer_init'
           ring_buffer_init(rb, watermark, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/events/ring_buffer.c:308:18: note: Calling 'perf_data_size'
           long max_size =3D perf_data_size(rb);
                           ^~~~~~~~~~~~~~~~~~
   kernel/events/internal.h:121:22: note: The result of the left shift is u=
ndefined due to shifting by '42', which is greater or equal to the width of=
 type 'int'
           return rb->nr_pages << (PAGE_SHIFT + page_order(rb));
                               ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/events/internal.h:121:22: warning: The result of the left shift i=
s undefined due to shifting by '43', which is greater or equal to the width=
 of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return rb->nr_pages << (PAGE_SHIFT + page_order(rb));
                               ^
   kernel/events/ring_buffer.c:917:10: note: Assuming the condition is true
           node =3D (cpu =3D=3D -1) ? cpu : cpu_to_node(cpu);
                   ^~~~~~~~~
   kernel/events/ring_buffer.c:917:9: note: '?' condition is true
           node =3D (cpu =3D=3D -1) ? cpu : cpu_to_node(cpu);
                  ^
   kernel/events/ring_buffer.c:919:6: note: Assuming 'rb' is non-null
           if (!rb)
               ^~~
   kernel/events/ring_buffer.c:919:2: note: Taking false branch
           if (!rb)
           ^
   kernel/events/ring_buffer.c:922:2: note: Loop condition is false.  Exiti=
ng loop
           INIT_WORK(&rb->work, rb_free_work);
           ^
   include/linux/workqueue.h:245:2: note: expanded from macro 'INIT_WORK'
           __INIT_WORK((_work), (_func), 0)
           ^
   include/linux/workqueue.h:225:2: note: expanded from macro '__INIT_WORK'
           do {                                                            \
           ^
   kernel/events/ring_buffer.c:925:6: note: Assuming 'all_buf' is non-null
           if (!all_buf)
               ^~~~~~~~
   kernel/events/ring_buffer.c:925:2: note: Taking false branch
           if (!all_buf)
           ^
   kernel/events/ring_buffer.c:930:6: note: Assuming 'nr_pages' is not equa=
l to 0
           if (nr_pages) {
               ^~~~~~~~
   kernel/events/ring_buffer.c:930:2: note: Taking true branch
           if (nr_pages) {
           ^
   kernel/events/ring_buffer.c:932:20: note: '?' condition is false
                   rb->page_order =3D ilog2(nr_pages);
                                    ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   kernel/events/ring_buffer.c:932:20: note: '?' condition is true
                   rb->page_order =3D ilog2(nr_pages);
                                    ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   kernel/events/ring_buffer.c:935:2: note: Calling 'ring_buffer_init'
           ring_buffer_init(rb, watermark, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/events/ring_buffer.c:308:18: note: Calling 'perf_data_size'
           long max_size =3D perf_data_size(rb);
                           ^~~~~~~~~~~~~~~~~~
   kernel/events/internal.h:121:22: note: The result of the left shift is u=
ndefined due to shifting by '43', which is greater or equal to the width of=
 type 'int'
           return rb->nr_pages << (PAGE_SHIFT + page_order(rb));
                               ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 46 warnings (39 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   91 warnings generated.
   net/atm/svc.c:427:2: warning: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
           memcpy(addr, peer ? &ATM_SD(sock)->remote : &ATM_SD(sock)->local,
           ^~~~~~
   net/atm/svc.c:427:2: note: Call to function 'memcpy' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memcpy_s' in case of C11
           memcpy(addr, peer ? &ATM_SD(sock)->remote : &ATM_SD(sock)->local,
           ^~~~~~
   Suppressed 90 warnings (83 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   90 warnings generated.
   Suppressed 90 warnings (83 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/hwmon/wm831x-hwmon.c:41:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", DIV_ROUND_CLOSEST(ret, 1000));
                  ^~~~~~~
   drivers/hwmon/wm831x-hwmon.c:41:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", DIV_ROUND_CLOSEST(ret, 1000));
                  ^~~~~~~
   drivers/hwmon/wm831x-hwmon.c:59:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", ret);
                  ^~~~~~~
   drivers/hwmon/wm831x-hwmon.c:59:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", ret);
                  ^~~~~~~
>> drivers/hwmon/wm831x-hwmon.c:67:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
           return sprintf(buf, "%s\n", input_names[channel]);
                  ^~~~~~~
   drivers/hwmon/wm831x-hwmon.c:67:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
           return sprintf(buf, "%s\n", input_names[channel]);
                  ^~~~~~~
   Suppressed 45 warnings (38 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   93 warnings generated.
   drivers/bluetooth/hci_vhci.c:76:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(skb_push(skb, 1), &hci_skb_pkt_type(skb), 1);
           ^~~~~~
   drivers/bluetooth/hci_vhci.c:76:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(skb_push(skb, 1), &hci_skb_pkt_type(skb), 1);
           ^~~~~~
   Suppressed 92 warnings (85 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   drivers/media/v4l2-core/v4l2-fwnode.c:546:2: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(link, 0, sizeof(*link));
           ^~~~~~
   drivers/media/v4l2-core/v4l2-fwnode.c:546:2: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
           memset(link, 0, sizeof(*link));
           ^~~~~~
   drivers/media/v4l2-core/v4l2-fwnode.c:660:2: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(connector, 0, sizeof(*connector));
           ^~~~~~
   drivers/media/v4l2-core/v4l2-fwnode.c:660:2: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
           memset(connector, 0, sizeof(*connector));
           ^~~~~~
   drivers/media/v4l2-core/v4l2-fwnode.c:747:2: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(props, 0, sizeof(*props));
           ^~~~~~
   drivers/media/v4l2-core/v4l2-fwnode.c:747:2: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
           memset(props, 0, sizeof(*props));
           ^~~~~~
   Suppressed 59 warnings (52 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   drivers/media/v4l2-core/v4l2-async.c:447:17: warning: Value stored to 'd=
ev' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct device *dev =3D
                          ^~~
   drivers/media/v4l2-core/v4l2-async.c:447:17: note: Value stored to 'dev'=
 during its initialization is never read
           struct device *dev =3D
                          ^~~
   Suppressed 59 warnings (52 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   64 warnings generated.
   drivers/media/v4l2-core/v4l2-ctrls-core.c:22:2: warning: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ev, 0, sizeof(*ev));
           ^~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:22:2: note: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11
           memset(ev, 0, sizeof(*ev));
           ^~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:119:3: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(p, ctrl->p_def.p_const, ctrl->elem_size);
                   ^~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:119:3: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(p, ctrl->p_def.p_const, ctrl->elem_size);
                   ^~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:121:3: warning: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(p, 0, ctrl->elem_size);
                   ^~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:121:3: note: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11
                   memset(p, 0, ctrl->elem_size);
                   ^~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:141:3: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(p_mpeg2_quant->intra_quantiser_matrix,
                   ^~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:141:3: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(p_mpeg2_quant->intra_quantiser_matrix,
                   ^~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:148:3: warning: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(p_mpeg2_quant->non_intra_quantiser_matrix, 16,
                   ^~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:148:3: note: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11
                   memset(p_mpeg2_quant->non_intra_quantiser_matrix, 16,
                   ^~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:172:3: warning: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(ptr.p_char + idx, ' ', ctrl->minimum);
                   ^~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:172:3: note: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11
                   memset(ptr.p_char + idx, ' ', ctrl->minimum);
                   ^~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:350:2: warning: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           zero_reserved(*lf);
           ^
   drivers/media/v4l2-core/v4l2-ctrls-core.c:324:2: note: expanded from mac=
ro 'zero_reserved'
           memset(&(s).reserved, 0, sizeof((s).reserved))
           ^~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:350:2: note: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11
           zero_reserved(*lf);
           ^
   drivers/media/v4l2-core/v4l2-ctrls-core.c:324:2: note: expanded from mac=
ro 'zero_reserved'
           memset(&(s).reserved, 0, sizeof((s).reserved))
           ^~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:362:2: warning: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           zero_reserved(*quant);
           ^
   drivers/media/v4l2-core/v4l2-ctrls-core.c:324:2: note: expanded from mac=
ro 'zero_reserved'
           memset(&(s).reserved, 0, sizeof((s).reserved))
--
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/npcm750-pwm-fan.c:973:3: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(name, "NPCM7XX-FAN-MD%d", i);
                   ^~~~~~~
   drivers/hwmon/npcm750-pwm-fan.c:973:3: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(name, "NPCM7XX-FAN-MD%d", i);
                   ^~~~~~~
   Suppressed 45 warnings (38 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/hwmon/pc87427.c:393:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n", fan_from_reg(data->fan[nr]));
                  ^~~~~~~
   drivers/hwmon/pc87427.c:393:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n", fan_from_reg(data->fan[nr]));
                  ^~~~~~~
   drivers/hwmon/pc87427.c:402:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n", fan_from_reg(data->fan_min[nr]));
                  ^~~~~~~
   drivers/hwmon/pc87427.c:402:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n", fan_from_reg(data->fan_min[nr]));
                  ^~~~~~~
   drivers/hwmon/pc87427.c:411:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", !!(data->fan_status[nr]
                  ^~~~~~~
   drivers/hwmon/pc87427.c:411:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", !!(data->fan_status[nr]
                  ^~~~~~~
   drivers/hwmon/pc87427.c:421:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", !!(data->fan_status[nr]
                  ^~~~~~~
   drivers/hwmon/pc87427.c:421:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", !!(data->fan_status[nr]
                  ^~~~~~~
   drivers/hwmon/pc87427.c:574:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", pwm_enable);
                  ^~~~~~~
   drivers/hwmon/pc87427.c:574:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", pwm_enable);
                  ^~~~~~~
   drivers/hwmon/pc87427.c:605:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", (int)data->pwm[nr]);
                  ^~~~~~~
   drivers/hwmon/pc87427.c:605:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", (int)data->pwm[nr]);
                  ^~~~~~~
   drivers/hwmon/pc87427.c:697:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", temp_from_reg(data->temp[nr]));
                  ^~~~~~~
   drivers/hwmon/pc87427.c:697:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", temp_from_reg(data->temp[nr]));
                  ^~~~~~~
   drivers/hwmon/pc87427.c:706:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", temp_from_reg8(data->temp_min[nr]));
                  ^~~~~~~
   drivers/hwmon/pc87427.c:706:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", temp_from_reg8(data->temp_min[nr]));
                  ^~~~~~~
   drivers/hwmon/pc87427.c:715:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", temp_from_reg8(data->temp_max[nr]));
                  ^~~~~~~
   drivers/hwmon/pc87427.c:715:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", temp_from_reg8(data->temp_max[nr]));
                  ^~~~~~~
   drivers/hwmon/pc87427.c:724:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", temp_from_reg8(data->temp_crit[nr])=
);
                  ^~~~~~~
   drivers/hwmon/pc87427.c:724:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", temp_from_reg8(data->temp_crit[nr])=
);
                  ^~~~~~~
   drivers/hwmon/pc87427.c:733:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", temp_type_from_reg(data->temp_type[n=
r]));
                  ^~~~~~~
   drivers/hwmon/pc87427.c:733:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", temp_type_from_reg(data->temp_type[n=
r]));
                  ^~~~~~~
   drivers/hwmon/pc87427.c:743:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", !!(data->temp_status[nr]
                  ^~~~~~~
   drivers/hwmon/pc87427.c:743:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", !!(data->temp_status[nr]
                  ^~~~~~~
   drivers/hwmon/pc87427.c:754:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", !!(data->temp_status[nr]
                  ^~~~~~~
   drivers/hwmon/pc87427.c:754:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", !!(data->temp_status[nr]
                  ^~~~~~~
   drivers/hwmon/pc87427.c:765:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", !!(data->temp_status[nr]
                  ^~~~~~~
   drivers/hwmon/pc87427.c:765:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", !!(data->temp_status[nr]
                  ^~~~~~~
   drivers/hwmon/pc87427.c:775:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", !!(data->temp_status[nr]
                  ^~~~~~~
   drivers/hwmon/pc87427.c:775:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", !!(data->temp_status[nr]
                  ^~~~~~~
>> drivers/hwmon/pc87427.c:926:9: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
           return sprintf(buf, "%s\n", data->name);
                  ^~~~~~~
   drivers/hwmon/pc87427.c:926:9: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
           return sprintf(buf, "%s\n", data->name);
                  ^~~~~~~
   Suppressed 30 warnings (23 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   87 warnings generated.
   net/wireless/lib80211.c:51:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(info, 0, sizeof(*info));
           ^~~~~~
   net/wireless/lib80211.c:51:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(info, 0, sizeof(*info));
           ^~~~~~
   Suppressed 86 warnings (79 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   84 warnings generated.
   Suppressed 84 warnings (77 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   87 warnings generated.
   Suppressed 87 warnings (80 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   87 warnings generated.
   Suppressed 87 warnings (80 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   94 warnings generated.
   net/llc/llc_if.c:93:2: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(daddr.mac, dmac, sizeof(daddr.mac));
           ^~~~~~
   net/llc/llc_if.c:93:2: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
           memcpy(daddr.mac, dmac, sizeof(daddr.mac));
           ^~~~~~
   net/llc/llc_if.c:94:2: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(laddr.mac, lmac, sizeof(laddr.mac));
           ^~~~~~
   net/llc/llc_if.c:94:2: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
           memcpy(laddr.mac, lmac, sizeof(laddr.mac));
           ^~~~~~
   Suppressed 92 warnings (85 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   95 warnings generated.
   Suppressed 95 warnings (88 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   95 warnings generated.
   Suppressed 95 warnings (88 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   98 warnings generated.
   include/linux/jhash.h:95:25: warning: The left operand of '<<' is a garb=
age value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           case 6:  b +=3D (u32)k[5]<<8;     fallthrough;
                                  ^
   net/llc/llc_conn.c:776:2: note: Calling 'llc_pdu_decode_da'
           llc_pdu_decode_da(skb, daddr.mac);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/llc_pdu.h:278:23: note: '?' condition is true
           if (skb->protocol =3D=3D htons(ETH_P_802_2))
                                ^
   include/linux/byteorder/generic.h:141:18: note: expanded from macro 'hto=
ns'
   #define htons(x) ___htons(x)
                    ^
   include/linux/byteorder/generic.h:135:21: note: expanded from macro '___=
htons'
   #define ___htons(x) __cpu_to_be16(x)
                       ^
   include/uapi/linux/byteorder/little_endian.h:42:43: note: expanded from =
macro '__cpu_to_be16'
   #define __cpu_to_be16(x) ((__force __be16)__swab16((x)))
                                             ^
   include/uapi/linux/swab.h:105:3: note: expanded from macro '__swab16'
           (__builtin_constant_p((__u16)(x)) ?     \
            ^
   include/net/llc_pdu.h:278:2: note: Taking false branch
           if (skb->protocol =3D=3D htons(ETH_P_802_2))
           ^
   net/llc/llc_conn.c:776:2: note: Returning from 'llc_pdu_decode_da'
           llc_pdu_decode_da(skb, daddr.mac);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/llc/llc_conn.c:779:7: note: Calling '__llc_lookup'
           sk =3D __llc_lookup(sap, &saddr, &daddr);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/llc/llc_conn.c:599:20: note: Calling '__llc_lookup_established'
           struct sock *sk =3D __llc_lookup_established(sap, daddr, laddr);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/llc/llc_conn.c:483:13: note: Calling 'llc_sk_laddr_hashfn'
           int slot =3D llc_sk_laddr_hashfn(sap, laddr);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/llc.h:83:17: note: Calling 'jhash'
           return hash_32(jhash(laddr->mac, sizeof(laddr->mac), 0),
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/jhash.h:79:2: note: Loop condition is false. Execution con=
tinues on line 88
           while (length > 12) {
           ^
   include/linux/jhash.h:88:2: note: Control jumps to 'case 6:'  at line 95
           switch (length) {
           ^
   include/linux/jhash.h:95:25: note: The left operand of '<<' is a garbage=
 value
           case 6:  b +=3D (u32)k[5]<<8;     fallthrough;
                              ~~~~^
   net/llc/llc_conn.c:759:2: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&newllc->laddr, daddr, sizeof(newllc->laddr));
           ^~~~~~
   net/llc/llc_conn.c:759:2: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           memcpy(&newllc->laddr, daddr, sizeof(newllc->laddr));
--
   net/atm/resources.c:110:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&dev->stats, 0, sizeof(dev->stats));
           ^~~~~~
   net/atm/resources.c:279:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dev->esi, esi, ESI_LEN);
                   ^~~~~~
   net/atm/resources.c:279:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(dev->esi, esi, ESI_LEN);
                   ^~~~~~
   Suppressed 93 warnings (83 in non-user code, 10 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   90 warnings generated.
   Suppressed 90 warnings (83 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (39 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   kernel/padata.c:867:8: warning: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D snprintf(buf, PAGE_SIZE, "%*pb\n",
                 ^~~~~~~~
   kernel/padata.c:867:8: note: Call to function 'snprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'snprintf_s' in case of C11
           len =3D snprintf(buf, PAGE_SIZE, "%*pb\n",
                 ^~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (37 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (38 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   drivers/hwmon/lineage-pem.c:143:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, block_buffer, data_len);
           ^~~~~~
   drivers/hwmon/lineage-pem.c:143:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(data, block_buffer, data_len);
           ^~~~~~
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   drivers/media/radio/radio-tea5764.c:283:2: warning: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(v->bus_info, sizeof(v->bus_info),
           ^~~~~~~~
   drivers/media/radio/radio-tea5764.c:283:2: note: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(v->bus_info, sizeof(v->bus_info),
           ^~~~~~~~
   Suppressed 59 warnings (52 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   drivers/hwmon/powr1220.c:181:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", adc_val);
                  ^~~~~~~
   drivers/hwmon/powr1220.c:181:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", adc_val);
                  ^~~~~~~
   drivers/hwmon/powr1220.c:191:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->adc_maxes[attr->index]);
                  ^~~~~~~
   drivers/hwmon/powr1220.c:191:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->adc_maxes[attr->index]);
                  ^~~~~~~
   drivers/hwmon/powr1220.c:201:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           return sprintf(buf, "%s\n", input_names[attr->index]);
                  ^~~~~~~
   drivers/hwmon/powr1220.c:201:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           return sprintf(buf, "%s\n", input_names[attr->index]);
                  ^~~~~~~
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (21 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   drivers/mtd/nand/onenand/generic.c:66:2: warning: Value stored to 'err' =
is never read [clang-analyzer-deadcode.DeadStores]
           err =3D mtd_device_register(&info->mtd, pdata ? pdata->parts : N=
ULL,
           ^
   drivers/mtd/nand/onenand/generic.c:66:2: note: Value stored to 'err' is =
never read
   Suppressed 31 warnings (24 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   drivers/hwmon/adcxx.c:78:11: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           status =3D sprintf(buf, "%d\n", value);
                    ^~~~~~~
   drivers/hwmon/adcxx.c:78:11: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           status =3D sprintf(buf, "%d\n", value);
                    ^~~~~~~
   drivers/hwmon/adcxx.c:88:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0\n");
                  ^~~~~~~
   drivers/hwmon/adcxx.c:88:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0\n");
                  ^~~~~~~
   drivers/hwmon/adcxx.c:105:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", reference);
                  ^~~~~~~
   drivers/hwmon/adcxx.c:105:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", reference);
                  ^~~~~~~
>> drivers/hwmon/adcxx.c:132:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHand=
ling]
           return sprintf(buf, "%s\n", to_spi_device(dev)->modalias);
                  ^~~~~~~
   drivers/hwmon/adcxx.c:132:9: note: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11
           return sprintf(buf, "%s\n", to_spi_device(dev)->modalias);
                  ^~~~~~~
   Suppressed 47 warnings (40 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   72 warnings generated.
   108 warnings generated.
   144 warnings generated.
   180 warnings generated.
   216 warnings generated.
   252 warnings generated.
   288 warnings generated.
   drivers/mtd/tests/mtd_test.c:16:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ei, 0, sizeof(struct erase_info));
           ^~~~~~
   drivers/mtd/tests/mtd_test.c:16:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&ei, 0, sizeof(struct erase_info));
           ^~~~~~
   Suppressed 280 warnings (280 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   drivers/mtd/tests/speedtest.c:49:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ei, 0, sizeof(struct erase_info));
           ^~~~~~
   drivers/mtd/tests/speedtest.c:49:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(&ei, 0, sizeof(struct erase_info));
           ^~~~~~
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   72 warnings generated.
   108 warnings generated.
   144 warnings generated.
   180 warnings generated.
   216 warnings generated.
   252 warnings generated.
   288 warnings generated.
   drivers/mtd/tests/mtd_test.c:16:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ei, 0, sizeof(struct erase_info));
           ^~~~~~
   drivers/mtd/tests/mtd_test.c:16:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&ei, 0, sizeof(struct erase_info));
           ^~~~~~
   Suppressed 280 warnings (280 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (44 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (44 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (44 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   93 warnings generated.
   drivers/bluetooth/virtio_bt.c:91:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(skb_push(skb, 1), &hci_skb_pkt_type(skb), 1);
           ^~~~~~
   drivers/bluetooth/virtio_bt.c:91:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(skb_push(skb, 1), &hci_skb_pkt_type(skb), 1);
           ^~~~~~
   Suppressed 92 warnings (85 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   drivers/media/dvb-frontends/dvb-pll.c:832:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&fe->ops.tuner_ops, &dvb_pll_tuner_ops,
           ^~~~~~
   drivers/media/dvb-frontends/dvb-pll.c:832:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&fe->ops.tuner_ops, &dvb_pll_tuner_ops,
           ^~~~~~
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   drivers/media/dvb-frontends/stv0299.c:695:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&state->frontend.ops, &stv0299_ops, sizeof(struct dvb_fro=
ntend_ops));
           ^~~~~~
   drivers/media/dvb-frontends/stv0299.c:695:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&state->frontend.ops, &stv0299_ops, sizeof(struct dvb_fro=
ntend_ops));
           ^~~~~~
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   drivers/media/dvb-frontends/stb0899_drv.c:504:2: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&buf[2], data, count);
           ^~~~~~
   drivers/media/dvb-frontends/stb0899_drv.c:504:2: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&buf[2], data, count);
           ^~~~~~
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   drivers/media/dvb-frontends/rtl2830.c:759:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&buf[1], val, val_len);
           ^~~~~~
   drivers/media/dvb-frontends/rtl2830.c:759:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&buf[1], val, val_len);
           ^~~~~~

vim +294 drivers/staging/iio/frequency/ad9834.c

12b9d5bf76bfa2 drivers/staging/iio/dds/ad9834.c       Michael Hennerich  20=
10-12-14  277  =

01f62379a8e50a drivers/staging/iio/frequency/ad9834.c Cristina Opriceana 20=
15-03-14  278  static
01f62379a8e50a drivers/staging/iio/frequency/ad9834.c Cristina Opriceana 20=
15-03-14  279  ssize_t ad9834_show_out0_wavetype_available(struct device *d=
ev,
12b9d5bf76bfa2 drivers/staging/iio/dds/ad9834.c       Michael Hennerich  20=
10-12-14  280  					    struct device_attribute *attr,
12b9d5bf76bfa2 drivers/staging/iio/dds/ad9834.c       Michael Hennerich  20=
10-12-14  281  					    char *buf)
12b9d5bf76bfa2 drivers/staging/iio/dds/ad9834.c       Michael Hennerich  20=
10-12-14  282  {
b671bb3bf0d016 drivers/staging/iio/frequency/ad9834.c Lars-Peter Clausen 20=
12-05-12  283  	struct iio_dev *indio_dev =3D dev_to_iio_dev(dev);
638e59fc8c867b drivers/staging/iio/dds/ad9834.c       Jonathan Cameron   20=
11-10-06  284  	struct ad9834_state *st =3D iio_priv(indio_dev);
12b9d5bf76bfa2 drivers/staging/iio/dds/ad9834.c       Michael Hennerich  20=
10-12-14  285  	char *str;
12b9d5bf76bfa2 drivers/staging/iio/dds/ad9834.c       Michael Hennerich  20=
10-12-14  286  =

9044b6e25e2fba drivers/staging/iio/frequency/ad9834.c Melissa Wen        20=
19-04-02  287  	if (st->devid =3D=3D ID_AD9833 || st->devid =3D=3D ID_AD983=
7)
12b9d5bf76bfa2 drivers/staging/iio/dds/ad9834.c       Michael Hennerich  20=
10-12-14  288  		str =3D "sine triangle square";
12b9d5bf76bfa2 drivers/staging/iio/dds/ad9834.c       Michael Hennerich  20=
10-12-14  289  	else if (st->control & AD9834_OPBITEN)
12b9d5bf76bfa2 drivers/staging/iio/dds/ad9834.c       Michael Hennerich  20=
10-12-14  290  		str =3D "sine";
12b9d5bf76bfa2 drivers/staging/iio/dds/ad9834.c       Michael Hennerich  20=
10-12-14  291  	else
12b9d5bf76bfa2 drivers/staging/iio/dds/ad9834.c       Michael Hennerich  20=
10-12-14  292  		str =3D "sine triangle";
12b9d5bf76bfa2 drivers/staging/iio/dds/ad9834.c       Michael Hennerich  20=
10-12-14  293  =

12b9d5bf76bfa2 drivers/staging/iio/dds/ad9834.c       Michael Hennerich  20=
10-12-14 @294  	return sprintf(buf, "%s\n", str);
12b9d5bf76bfa2 drivers/staging/iio/dds/ad9834.c       Michael Hennerich  20=
10-12-14  295  }
12b9d5bf76bfa2 drivers/staging/iio/dds/ad9834.c       Michael Hennerich  20=
10-12-14  296  =


:::::: The code at line 294 was first introduced by commit
:::::: 12b9d5bf76bfa20d3207ef24fca9c8254a586a58 Staging: IIO: DDS: AD9833 /=
 AD9834 driver

:::::: TO: Michael Hennerich <michael.hennerich@analog.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4646484982653116892==--

