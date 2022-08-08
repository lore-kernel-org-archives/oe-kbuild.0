Content-Type: multipart/mixed; boundary="===============3871813175012831863=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/staging/iio/frequency/ad9834.c:294:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length argu...
Date: Mon, 08 Aug 2022 14:20:33 +0800
Message-ID: <202208081446.pKXuz64X-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3871813175012831863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/staging/iio/frequency/ad9834.c:294:9: warning: Call to function 's=
printf' is insecure as it does not provide bounding of the memory buffer or=
 security checks introduced in the C11 standard. Replace with analogous fun=
ctions that support length arguments or provides boundary checks such as 's=
printf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrU=
nsafeBufferHandling]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4e23eeebb2e57f5a28b36221aa776b5a1122dde5
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 months ago
config: mips-randconfig-c004-20220807 (https://download.01.org/0day-ci/arch=
ive/20220808/202208081446.pKXuz64X-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e=
2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/rtc/rtc-rs5c348.c:78:2: warning: Value stored to 'txp' is never =
read [clang-analyzer-deadcode.DeadStores]
           txp =3D txbuf;
           ^     ~~~~~
   drivers/rtc/rtc-rs5c348.c:78:2: note: Value stored to 'txp' is never read
           txp =3D txbuf;
           ^     ~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/rtc/rtc-rs5c372.c:687:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", trim);
                  ^~~~~~~
   drivers/rtc/rtc-rs5c372.c:687:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", trim);
                  ^~~~~~~
   drivers/rtc/rtc-rs5c372.c:700:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d.%03d KHz\n", osc / 1000, osc % 1000);
                  ^~~~~~~
   drivers/rtc/rtc-rs5c372.c:700:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d.%03d KHz\n", osc / 1000, osc % 1000);
                  ^~~~~~~
   drivers/rtc/rtc-rs5c372.c:743:2: warning: Value stored to 'addr' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           addr   =3D RS5C_ADDR(RS5C_REG_CTRL1);
           ^
   drivers/rtc/rtc-rs5c372.c:743:2: note: Value stored to 'addr' is never r=
ead
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   drivers/gpu/drm/drm_framebuffer.c:855:2: warning: Call to function 'strc=
py' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
           strcpy(fb->comm, current->comm);
           ^~~~~~
   drivers/gpu/drm/drm_framebuffer.c:855:2: note: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119
           strcpy(fb->comm, current->comm);
           ^~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   drivers/auxdisplay/panel.c:1452:2: warning: Call to function 'strncpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(key->u.kbd.press_str, press, sizeof(key->u.kbd.press_str=
));
           ^~~~~~~
   drivers/auxdisplay/panel.c:1452:2: note: Call to function 'strncpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'strncpy_s' in case of C11
           strncpy(key->u.kbd.press_str, press, sizeof(key->u.kbd.press_str=
));
           ^~~~~~~
   drivers/auxdisplay/panel.c:1453:2: warning: Call to function 'strncpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(key->u.kbd.repeat_str, repeat, sizeof(key->u.kbd.repeat_=
str));
           ^~~~~~~
   drivers/auxdisplay/panel.c:1453:2: note: Call to function 'strncpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'strncpy_s' in case of C11
           strncpy(key->u.kbd.repeat_str, repeat, sizeof(key->u.kbd.repeat_=
str));
           ^~~~~~~
   drivers/auxdisplay/panel.c:1454:2: warning: Call to function 'strncpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(key->u.kbd.release_str, release,
           ^~~~~~~
   drivers/auxdisplay/panel.c:1454:2: note: Call to function 'strncpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'strncpy_s' in case of C11
           strncpy(key->u.kbd.release_str, release,
           ^~~~~~~
   drivers/auxdisplay/panel.c:1534:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&panel_cb, 0, sizeof(panel_cb));
           ^~~~~~
   drivers/auxdisplay/panel.c:1534:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&panel_cb, 0, sizeof(panel_cb));
           ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   drivers/staging/iio/cdc/ad7746.c:85:8: warning: Excessive padding in 'st=
ruct ad7746_chip_info' (228 padding bytes, where 100 is optimal). Optimal f=
ields order: data, client, lock, config, cap_setup, vt_setup, capdac_set, c=
apdac, consider reordering the fields or adding explicit padding members [c=
lang-analyzer-optin.performance.Padding]
   struct ad7746_chip_info {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/staging/iio/cdc/ad7746.c:85:8: note: Excessive padding in 'struc=
t ad7746_chip_info' (228 padding bytes, where 100 is optimal). Optimal fiel=
ds order: data, client, lock, config, cap_setup, vt_setup, capdac_set, capd=
ac, consider reordering the fields or adding explicit padding members
   struct ad7746_chip_info {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/staging/iio/frequency/ad9834.c:71:8: warning: Excessive padding =
in 'struct ad9834_state' (210 padding bytes, where 82 is optimal). Optimal =
fields order: data, control, spi, mclk, lock, msg, freq_msg, xfer, freq_xfe=
r, devid, freq_data, consider reordering the fields or adding explicit padd=
ing members [clang-analyzer-optin.performance.Padding]
   struct ad9834_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/staging/iio/frequency/ad9834.c:71:8: note: Excessive padding in =
'struct ad9834_state' (210 padding bytes, where 82 is optimal). Optimal fie=
lds order: data, control, spi, mclk, lock, msg, freq_msg, xfer, freq_xfer, =
devid, freq_data, consider reordering the fields or adding explicit padding=
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
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
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
   drivers/staging/iio/impedance-analyzer/ad5933.c:352:9: warning: Call to =
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
   drivers/staging/iio/impedance-analyzer/ad5933.c:641:11: warning: Assigne=
d value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                           val[0] =3D be16_to_cpu(buf[0]);
                                  ^
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
--===============3871813175012831863==--

