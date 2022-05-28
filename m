Content-Type: multipart/mixed; boundary="===============4208616028309278272=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 12994/14198] drivers/iio/accel/bma400_core.c:1056:3: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sat, 28 May 2022 19:36:17 +0800
Message-ID: <202205281947.VCVCg9sm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4208616028309278272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jagath Jog J <jagathjog1996@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   d3fde8ff50ab265749704bd7fbcf70d35235421f
commit: 296d0a4a13be9e03b5eccc33d7ef5980ccd2b4c3 [12994/14198] iio: accel: =
bma400: Add support for activity and inactivity events
:::::: branch date: 29 hours ago
:::::: commit date: 6 days ago
config: arm-randconfig-c002-20220524 (https://download.01.org/0day-ci/archi=
ve/20220528/202205281947.VCVCg9sm-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0fbe3f=
3f486e01448121f7931a4ca29fac1504ab)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D296d0a4a13be9e03b5eccc33d7ef5980ccd2b4c3
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 296d0a4a13be9e03b5eccc33d7ef5980ccd2b4c3
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:767:4: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(buff, BUFF_SZ, "\tNot supported\n");
                           ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:767:4: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                           snprintf(buff, BUFF_SZ, "\tNot supported\n");
                           ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:772:3: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buff, BUFF_SZ, "report %s (%d, size=3D%d)\n",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:772:3: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buff, BUFF_SZ, "report %s (%d, size=3D%d)\n",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:775:3: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buff, BUFF_SZ, "\tFirmware version: %d.%d\n",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:775:3: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buff, BUFF_SZ, "\tFirmware version: %d.%d\n",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:780:3: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buff, BUFF_SZ, "report %s (%d, size=3D%d)\n",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:780:3: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buff, BUFF_SZ, "report %s (%d, size=3D%d)\n",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:786:3: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buff, BUFF_SZ, "report %s (%d, size=3D%d)\n",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:786:3: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buff, BUFF_SZ, "report %s (%d, size=3D%d)\n",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:792:3: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buff, BUFF_SZ, "report %s (%d, size=3D%d)\n",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:792:3: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buff, BUFF_SZ, "report %s (%d, size=3D%d)\n",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:798:3: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buff, BUFF_SZ, "report %s (%d, size=3D%d)\n",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:798:3: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buff, BUFF_SZ, "report %s (%d, size=3D%d)\n",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:801:3: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buff, BUFF_SZ, "\tSerial: 0x%02x%02x%02x%02x\n",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:801:3: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buff, BUFF_SZ, "\tSerial: 0x%02x%02x%02x%02x\n",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:804:3: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buff, BUFF_SZ, "\tType: 0x%02x\n",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:804:3: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buff, BUFF_SZ, "\tType: 0x%02x\n",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:809:3: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buff, BUFF_SZ, "report %s (%d, size=3D%d)\n",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:809:3: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buff, BUFF_SZ, "report %s (%d, size=3D%d)\n",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:812:3: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buff, BUFF_SZ, "\tTotal splash space: %d\n",
                   ^~~~~~~~
   drivers/hid/hid-picolcd_debugfs.c:812:3: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buff, BUFF_SZ, "\tTotal splash space: %d\n",
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
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
>> drivers/iio/accel/bma400_core.c:1056:3: warning: Assigned value is garba=
ge or undefined [clang-analyzer-core.uninitialized.Assign]
                   set_mask_bits(&field_value, BMA400_INT_GEN1_MSK,
                   ^
   include/linux/bitops.h:281:9: note: expanded from macro 'set_mask_bits'
                   old__ =3D READ_ONCE(*(ptr));                      \
                         ^ ~~~~~~~~~~~~~~~~~
   drivers/iio/accel/bma400_core.c:1051:2: note: Control jumps to 'case IIO=
_EV_DIR_RISING:'  at line 1052
           switch (dir) {
           ^
   drivers/iio/accel/bma400_core.c:1057:10: note: Taking false branch
                                 FIELD_PREP(BMA400_INT_GEN1_MSK, state));
                                 ^
   include/linux/bitfield.h:114:3: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                   ^
   include/linux/bitfield.h:65:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:352:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:332:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/iio/accel/bma400_core.c:1057:10: note: Loop condition is false. =
 Exiting loop
                                 FIELD_PREP(BMA400_INT_GEN1_MSK, state));
                                 ^
   include/linux/bitfield.h:114:3: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                   ^
   include/linux/bitfield.h:65:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
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
   drivers/iio/accel/bma400_core.c:1057:10: note: Taking false branch
                                 FIELD_PREP(BMA400_INT_GEN1_MSK, state));
                                 ^
   include/linux/bitfield.h:114:3: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                   ^
   include/linux/bitfield.h:67:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG((_mask) =3D=3D 0, _pfx "mask is zero");=
    \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:352:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:332:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/iio/accel/bma400_core.c:1057:10: note: Loop condition is false. =
 Exiting loop
                                 FIELD_PREP(BMA400_INT_GEN1_MSK, state));
                                 ^
   include/linux/bitfield.h:114:3: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                   ^
   include/linux/bitfield.h:67:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG((_mask) =3D=3D 0, _pfx "mask is zero");=
    \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
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
   drivers/iio/accel/bma400_core.c:1057:10: note: '?' condition is false
                                 FIELD_PREP(BMA400_INT_GEN1_MSK, state));
                                 ^
   include/linux/bitfield.h:114:3: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                   ^
   include/linux/bitfield.h:68:20: note: expanded from macro '__BF_FIELD_CH=
ECK'
                   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \

vim +1056 drivers/iio/accel/bma400_core.c

e6391ddd68c56a Jagath Jog J 2022-05-05  1044  =

296d0a4a13be9e Jagath Jog J 2022-05-05  1045  static int bma400_activity_ev=
ent_en(struct bma400_data *data,
296d0a4a13be9e Jagath Jog J 2022-05-05  1046  				    enum iio_event_direct=
ion dir,
296d0a4a13be9e Jagath Jog J 2022-05-05  1047  				    int state)
296d0a4a13be9e Jagath Jog J 2022-05-05  1048  {
296d0a4a13be9e Jagath Jog J 2022-05-05  1049  	int ret, reg, msk, value, fi=
eld_value;
296d0a4a13be9e Jagath Jog J 2022-05-05  1050  =

296d0a4a13be9e Jagath Jog J 2022-05-05  1051  	switch (dir) {
296d0a4a13be9e Jagath Jog J 2022-05-05  1052  	case IIO_EV_DIR_RISING:
296d0a4a13be9e Jagath Jog J 2022-05-05  1053  		reg =3D BMA400_GEN1INT_CONF=
IG0;
296d0a4a13be9e Jagath Jog J 2022-05-05  1054  		msk =3D BMA400_INT_GEN1_MSK;
296d0a4a13be9e Jagath Jog J 2022-05-05  1055  		value =3D 2;
296d0a4a13be9e Jagath Jog J 2022-05-05 @1056  		set_mask_bits(&field_value,=
 BMA400_INT_GEN1_MSK,
296d0a4a13be9e Jagath Jog J 2022-05-05  1057  			      FIELD_PREP(BMA400_IN=
T_GEN1_MSK, state));
296d0a4a13be9e Jagath Jog J 2022-05-05  1058  		break;
296d0a4a13be9e Jagath Jog J 2022-05-05  1059  	case IIO_EV_DIR_FALLING:
296d0a4a13be9e Jagath Jog J 2022-05-05  1060  		reg =3D BMA400_GEN2INT_CONF=
IG0;
296d0a4a13be9e Jagath Jog J 2022-05-05  1061  		msk =3D BMA400_INT_GEN2_MSK;
296d0a4a13be9e Jagath Jog J 2022-05-05  1062  		value =3D 0;
296d0a4a13be9e Jagath Jog J 2022-05-05  1063  		set_mask_bits(&field_value,=
 BMA400_INT_GEN2_MSK,
296d0a4a13be9e Jagath Jog J 2022-05-05  1064  			      FIELD_PREP(BMA400_IN=
T_GEN2_MSK, state));
296d0a4a13be9e Jagath Jog J 2022-05-05  1065  		break;
296d0a4a13be9e Jagath Jog J 2022-05-05  1066  	default:
296d0a4a13be9e Jagath Jog J 2022-05-05  1067  		return -EINVAL;
296d0a4a13be9e Jagath Jog J 2022-05-05  1068  	}
296d0a4a13be9e Jagath Jog J 2022-05-05  1069  =

296d0a4a13be9e Jagath Jog J 2022-05-05  1070  	/* Enabling all axis for int=
errupt evaluation */
296d0a4a13be9e Jagath Jog J 2022-05-05  1071  	ret =3D regmap_write(data->r=
egmap, reg, 0xF8);
296d0a4a13be9e Jagath Jog J 2022-05-05  1072  	if (ret)
296d0a4a13be9e Jagath Jog J 2022-05-05  1073  		return ret;
296d0a4a13be9e Jagath Jog J 2022-05-05  1074  =

296d0a4a13be9e Jagath Jog J 2022-05-05  1075  	/* OR combination of all axi=
s for interrupt evaluation */
296d0a4a13be9e Jagath Jog J 2022-05-05  1076  	ret =3D regmap_write(data->r=
egmap, reg + BMA400_GEN_CONFIG1_OFF, value);
296d0a4a13be9e Jagath Jog J 2022-05-05  1077  	if (ret)
296d0a4a13be9e Jagath Jog J 2022-05-05  1078  		return ret;
296d0a4a13be9e Jagath Jog J 2022-05-05  1079  =

296d0a4a13be9e Jagath Jog J 2022-05-05  1080  	/* Initial value to avoid in=
terrupts while enabling*/
296d0a4a13be9e Jagath Jog J 2022-05-05  1081  	ret =3D regmap_write(data->r=
egmap, reg + BMA400_GEN_CONFIG2_OFF, 0x0A);
296d0a4a13be9e Jagath Jog J 2022-05-05  1082  	if (ret)
296d0a4a13be9e Jagath Jog J 2022-05-05  1083  		return ret;
296d0a4a13be9e Jagath Jog J 2022-05-05  1084  =

296d0a4a13be9e Jagath Jog J 2022-05-05  1085  	/* Initial duration value to=
 avoid interrupts while enabling*/
296d0a4a13be9e Jagath Jog J 2022-05-05  1086  	ret =3D regmap_write(data->r=
egmap, reg + BMA400_GEN_CONFIG31_OFF, 0x0F);
296d0a4a13be9e Jagath Jog J 2022-05-05  1087  	if (ret)
296d0a4a13be9e Jagath Jog J 2022-05-05  1088  		return ret;
296d0a4a13be9e Jagath Jog J 2022-05-05  1089  =

296d0a4a13be9e Jagath Jog J 2022-05-05  1090  	ret =3D regmap_update_bits(d=
ata->regmap, BMA400_INT1_MAP_REG, msk,
296d0a4a13be9e Jagath Jog J 2022-05-05  1091  				 field_value);
296d0a4a13be9e Jagath Jog J 2022-05-05  1092  	if (ret)
296d0a4a13be9e Jagath Jog J 2022-05-05  1093  		return ret;
296d0a4a13be9e Jagath Jog J 2022-05-05  1094  =

296d0a4a13be9e Jagath Jog J 2022-05-05  1095  	ret =3D regmap_update_bits(d=
ata->regmap, BMA400_INT_CONFIG0_REG, msk,
296d0a4a13be9e Jagath Jog J 2022-05-05  1096  				 field_value);
296d0a4a13be9e Jagath Jog J 2022-05-05  1097  	if (ret)
296d0a4a13be9e Jagath Jog J 2022-05-05  1098  		return ret;
296d0a4a13be9e Jagath Jog J 2022-05-05  1099  =

296d0a4a13be9e Jagath Jog J 2022-05-05  1100  	set_mask_bits(&data->generic=
_event_en, msk, field_value);
296d0a4a13be9e Jagath Jog J 2022-05-05  1101  	return 0;
296d0a4a13be9e Jagath Jog J 2022-05-05  1102  }
296d0a4a13be9e Jagath Jog J 2022-05-05  1103  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4208616028309278272==--

