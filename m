Content-Type: multipart/mixed; boundary="===============4130032484004062160=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 25/29] drivers/watchdog/watchdog_dev.c:542:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments o...
Date: Sun, 05 Jun 2022 03:43:07 +0800
Message-ID: <202206050346.d2UDlED9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4130032484004062160==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/watchdog/watchdog_dev.c:542:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   eac8b965b3d595180654d8895d89bf1c21dba722
commit: 56f22b8f6853d26be82709a978e89db6856af6b4 [25/29] BACKPORT: Kbuild: =
move to -std=3Dgnu11
:::::: branch date: 23 hours ago
:::::: commit date: 3 weeks ago
config: mips-randconfig-c004-20220531 (https://download.01.org/0day-ci/arch=
ive/20220605/202206050346.d2UDlED9-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364c7=
6683f8ef241025a9556300778c07b590c2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        git remote add chrome-os https://chromium.googlesource.com/chromium=
os/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout 56f22b8f6853d26be82709a978e89db6856af6b4
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~~~~~~
   include/linux/log2.h:24:2: note: Returning the value -1
           return fls(n) - 1;
           ^~~~~~~~~~~~~~~~~
   drivers/iio/adc/axp20x_adc.c:582:6: note: Returning from '__ilog2_u32'
                                    AXP813_ADC_RATE_HZ(rate));
                                    ^
   drivers/iio/adc/axp20x_adc.c:41:34: note: expanded from macro 'AXP813_AD=
C_RATE_HZ'
   #define AXP813_ADC_RATE_HZ(x)                   (AXP20X_ADC_RATE_HZ(x) |=
 AXP813_V_I_ADC_RATE_HZ(x))
                                                    ^~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/axp20x_adc.c:37:35: note: expanded from macro 'AXP20X_AD=
C_RATE_HZ'
   #define AXP20X_ADC_RATE_HZ(x)                   ((ilog2((x) / 25) << 6) =
& AXP20X_ADC_RATE_MASK)
                                                     ^~~~~~~~~~~~~~~
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           __ilog2_u32(n) :                \
           ^~~~~~~~~~~~~~
   drivers/iio/adc/axp20x_adc.c:582:6: note: The result of the left shift i=
s undefined because the left operand is negative
                                    AXP813_ADC_RATE_HZ(rate));
                                    ^
   drivers/iio/adc/axp20x_adc.c:41:34: note: expanded from macro 'AXP813_AD=
C_RATE_HZ'
   #define AXP813_ADC_RATE_HZ(x)                   (AXP20X_ADC_RATE_HZ(x) |=
 AXP813_V_I_ADC_RATE_HZ(x))
                                                    ^~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/axp20x_adc.c:37:51: note: expanded from macro 'AXP20X_AD=
C_RATE_HZ'
   #define AXP20X_ADC_RATE_HZ(x)                   ((ilog2((x) / 25) << 6) =
& AXP20X_ADC_RATE_MASK)
                                                     ~~~~~~~~~~~~~~~ ^
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   drivers/input/keyboard/lkkbd.c:627:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(lk->keycode, lkkbd_keycode, sizeof(lk->keycode));
           ^~~~~~
   drivers/input/keyboard/lkkbd.c:627:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(lk->keycode, lkkbd_keycode, sizeof(lk->keycode));
           ^~~~~~
   drivers/input/keyboard/lkkbd.c:630:2: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(lk->phys, sizeof(lk->phys), "%s/input0", serio->phys);
           ^~~~~~~~
   drivers/input/keyboard/lkkbd.c:630:2: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
           snprintf(lk->phys, sizeof(lk->phys), "%s/input0", serio->phys);
           ^~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (22 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (22 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (22 in non-user code).
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
   44 warnings generated.
   drivers/watchdog/watchdog_dev.c:454:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", !!test_bit(WDOG_NO_WAY_OUT, &wdd->st=
atus));
                  ^~~~~~~
   drivers/watchdog/watchdog_dev.c:454:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", !!test_bit(WDOG_NO_WAY_OUT, &wdd->st=
atus));
                  ^~~~~~~
   drivers/watchdog/watchdog_dev.c:488:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%x\n", status);
                  ^~~~~~~
   drivers/watchdog/watchdog_dev.c:488:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%x\n", status);
                  ^~~~~~~
   drivers/watchdog/watchdog_dev.c:497:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", wdd->bootstatus);
                  ^~~~~~~
   drivers/watchdog/watchdog_dev.c:497:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", wdd->bootstatus);
                  ^~~~~~~
   drivers/watchdog/watchdog_dev.c:513:12: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   status =3D sprintf(buf, "%u\n", val);
                            ^~~~~~~
   drivers/watchdog/watchdog_dev.c:513:12: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
                   status =3D sprintf(buf, "%u\n", val);
                            ^~~~~~~
   drivers/watchdog/watchdog_dev.c:524:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", wdd->timeout);
                  ^~~~~~~
   drivers/watchdog/watchdog_dev.c:524:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", wdd->timeout);
                  ^~~~~~~
   drivers/watchdog/watchdog_dev.c:533:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", wdd->pretimeout);
                  ^~~~~~~
   drivers/watchdog/watchdog_dev.c:533:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", wdd->pretimeout);
                  ^~~~~~~
>> drivers/watchdog/watchdog_dev.c:542:9: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
           return sprintf(buf, "%s\n", wdd->info->identity);
                  ^~~~~~~
   drivers/watchdog/watchdog_dev.c:542:9: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
           return sprintf(buf, "%s\n", wdd->info->identity);
                  ^~~~~~~
   drivers/watchdog/watchdog_dev.c:552:10: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "active\n");
                          ^~~~~~~
   drivers/watchdog/watchdog_dev.c:552:10: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "active\n");
                          ^~~~~~~
   drivers/watchdog/watchdog_dev.c:554:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "inactive\n");
                  ^~~~~~~
   drivers/watchdog/watchdog_dev.c:554:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "inactive\n");
                  ^~~~~~~
   drivers/watchdog/watchdog_dev.c:1009:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           kthread_init_work(&wd_data->work, watchdog_ping_work);
           ^
   include/linux/kthread.h:165:3: note: expanded from macro 'kthread_init_w=
ork'
                   memset((work), 0, sizeof(struct kthread_work));         \
                   ^~~~~~
   drivers/watchdog/watchdog_dev.c:1009:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           kthread_init_work(&wd_data->work, watchdog_ping_work);
           ^
   include/linux/kthread.h:165:3: note: expanded from macro 'kthread_init_w=
ork'
                   memset((work), 0, sizeof(struct kthread_work));         \
                   ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/mtd/ubi/fastmap.c:742:23: warning: The left operand of '=3D=3D' =
is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                                   if (tmp_aeb->pnum =3D=3D pnum) {
                                       ~~~~~~~~~~~~~ ^
   drivers/mtd/ubi/fastmap.c:566:2: note: Calling 'INIT_LIST_HEAD'
           INIT_LIST_HEAD(&used);
           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:35:2: note: Left side of '||' is false
           WRITE_ONCE(list->next, list);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:277:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/list.h:35:2: note: Left side of '||' is false
           WRITE_ONCE(list->next, list);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:277:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/list.h:35:2: note: Left side of '||' is true
           WRITE_ONCE(list->next, list);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:278:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   include/linux/list.h:35:2: note: Taking false branch
           WRITE_ONCE(list->next, list);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/list.h:35:2: note: Loop condition is false.  Exiting loop
           WRITE_ONCE(list->next, list);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \

vim +542 drivers/watchdog/watchdog_dev.c

33b711269ade3f Pratyush Anand 2015-12-17  518  =

33b711269ade3f Pratyush Anand 2015-12-17  519  static ssize_t timeout_show(=
struct device *dev, struct device_attribute *attr,
33b711269ade3f Pratyush Anand 2015-12-17  520  				char *buf)
33b711269ade3f Pratyush Anand 2015-12-17  521  {
33b711269ade3f Pratyush Anand 2015-12-17  522  	struct watchdog_device *wdd=
 =3D dev_get_drvdata(dev);
33b711269ade3f Pratyush Anand 2015-12-17  523  =

33b711269ade3f Pratyush Anand 2015-12-17 @524  	return sprintf(buf, "%u\n",=
 wdd->timeout);
33b711269ade3f Pratyush Anand 2015-12-17  525  }
33b711269ade3f Pratyush Anand 2015-12-17  526  static DEVICE_ATTR_RO(timeou=
t);
33b711269ade3f Pratyush Anand 2015-12-17  527  =

df044e02206230 Wolfram Sang   2016-08-31  528  static ssize_t pretimeout_sh=
ow(struct device *dev,
df044e02206230 Wolfram Sang   2016-08-31  529  			       struct device_attr=
ibute *attr, char *buf)
df044e02206230 Wolfram Sang   2016-08-31  530  {
df044e02206230 Wolfram Sang   2016-08-31  531  	struct watchdog_device *wdd=
 =3D dev_get_drvdata(dev);
df044e02206230 Wolfram Sang   2016-08-31  532  =

df044e02206230 Wolfram Sang   2016-08-31  533  	return sprintf(buf, "%u\n",=
 wdd->pretimeout);
df044e02206230 Wolfram Sang   2016-08-31  534  }
df044e02206230 Wolfram Sang   2016-08-31  535  static DEVICE_ATTR_RO(pretim=
eout);
df044e02206230 Wolfram Sang   2016-08-31  536  =

33b711269ade3f Pratyush Anand 2015-12-17  537  static ssize_t identity_show=
(struct device *dev, struct device_attribute *attr,
33b711269ade3f Pratyush Anand 2015-12-17  538  				char *buf)
33b711269ade3f Pratyush Anand 2015-12-17  539  {
33b711269ade3f Pratyush Anand 2015-12-17  540  	struct watchdog_device *wdd=
 =3D dev_get_drvdata(dev);
33b711269ade3f Pratyush Anand 2015-12-17  541  =

33b711269ade3f Pratyush Anand 2015-12-17 @542  	return sprintf(buf, "%s\n",=
 wdd->info->identity);
33b711269ade3f Pratyush Anand 2015-12-17  543  }
33b711269ade3f Pratyush Anand 2015-12-17  544  static DEVICE_ATTR_RO(identi=
ty);
33b711269ade3f Pratyush Anand 2015-12-17  545  =


:::::: The code at line 542 was first introduced by commit
:::::: 33b711269ade3f6bc9d9d15e4343e6fa922d999b watchdog: Read device statu=
s through sysfs attributes

:::::: TO: Pratyush Anand <panand@redhat.com>
:::::: CC: Wim Van Sebroeck <wim@iguana.be>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4130032484004062160==--

