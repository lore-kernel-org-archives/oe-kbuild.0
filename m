Content-Type: multipart/mixed; boundary="===============1494344533852881193=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tty:tty-testing 34/34] drivers/tty/hvc/hvc_dcc.c:98:6: warning: Value stored to 'cpu' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 07 May 2022 15:43:35 +0800
Message-ID: <202205071535.MQE6CRZ5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1494344533852881193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-serial(a)vger.kernel.org
TO: Shanker Donthineni <shankerd@codeaurora.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Timur Tabi <timur@codeaurora.org>
CC: Elliot Berman <eberman@codeaurora.org>
CC: Sai Prakash Ranjan <quic_saipraka@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-=
testing
head:   4419da5d5d4b1788568b7bf22c083ba2832891df
commit: 4419da5d5d4b1788568b7bf22c083ba2832891df [34/34] tty: hvc: dcc: Bin=
d driver to CPU core0 for reads and writes
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm-randconfig-c002-20220506 (https://download.01.org/0day-ci/archi=
ve/20220507/202205071535.MQE6CRZ5-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004f=
b787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/co=
mmit/?id=3D4419da5d5d4b1788568b7bf22c083ba2832891df
        git remote add tty https://git.kernel.org/pub/scm/linux/kernel/git/=
gregkh/tty.git
        git fetch --no-tags tty tty-testing
        git checkout 4419da5d5d4b1788568b7bf22c083ba2832891df
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                                         ^
   drivers/hwmon/tmp513.c:277:9: note: '?' condition is false
                   val =3D clamp_val(val, MIN_TEMP_LIMIT, MAX_TEMP_LIMIT);
                         ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                                  ^
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/tmp513.c:277:9: note: '__UNIQUE_ID___x257' is < '__UNIQUE_=
ID___y258'
                   val =3D clamp_val(val, MIN_TEMP_LIMIT, MAX_TEMP_LIMIT);
                         ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/hwmon/tmp513.c:277:9: note: '?' condition is true
                   val =3D clamp_val(val, MIN_TEMP_LIMIT, MAX_TEMP_LIMIT);
                         ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/tmp513.c:278:12: note: Left side of '||' is false
                   regval =3D DIV_ROUND_CLOSEST(val * 10, 625) << TMP51X_TE=
MP_SHIFT;
                            ^
   include/linux/math.h:90:3: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
            ^
   drivers/hwmon/tmp513.c:278:12: note: Left side of '||' is false
                   regval =3D DIV_ROUND_CLOSEST(val * 10, 625) << TMP51X_TE=
MP_SHIFT;
                            ^
   include/linux/math.h:90:3: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
            ^
   drivers/hwmon/tmp513.c:278:12: note: '?' condition is false
                   regval =3D DIV_ROUND_CLOSEST(val * 10, 625) << TMP51X_TE=
MP_SHIFT;
                            ^
   include/linux/math.h:90:2: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
           ^
   drivers/hwmon/tmp513.c:278:45: note: The result of the left shift is und=
efined because the left operand is negative
                   regval =3D DIV_ROUND_CLOSEST(val * 10, 625) << TMP51X_TE=
MP_SHIFT;
                                                             ^
   drivers/hwmon/tmp513.c:679:3: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data->nfactor, nfactor, (data->id =3D=3D tmp513) =
? 3 : 2);
                   ^~~~~~
   drivers/hwmon/tmp513.c:679:3: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
                   memcpy(data->nfactor, nfactor, (data->id =3D=3D tmp513) =
? 3 : 2);
                   ^~~~~~
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
>> drivers/tty/hvc/hvc_dcc.c:98:6: warning: Value stored to 'cpu' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           int cpu =3D get_cpu();
               ^~~
   drivers/tty/hvc/hvc_dcc.c:98:6: note: Value stored to 'cpu' during its i=
nitialization is never read
           int cpu =3D get_cpu();
               ^~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/tty/hvc/hvc_console.c:190:6: warning: Call to function 'memmove'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memmove_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                           memmove(c, c+r, i);
                                           ^~~~~~~
   drivers/tty/hvc/hvc_console.c:190:6: note: Call to function 'memmove' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memmove_s' in case of C11
                                           memmove(c, c+r, i);
                                           ^~~~~~~
   drivers/tty/hvc/hvc_console.c:492:3: warning: Call to function 'memmove'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memmove_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(hp->outbuf, hp->outbuf + n, hp->n_outbuf);
                   ^~~~~~~
   drivers/tty/hvc/hvc_console.c:492:3: note: Call to function 'memmove' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memmove_s' in case of C11
                   memmove(hp->outbuf, hp->outbuf + n, hp->n_outbuf);
                   ^~~~~~~
   drivers/tty/hvc/hvc_console.c:523:4: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(hp->outbuf + hp->n_outbuf, buf, rsize);
                           ^~~~~~
   drivers/tty/hvc/hvc_console.c:523:4: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(hp->outbuf + hp->n_outbuf, buf, rsize);
                           ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
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
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
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
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   drivers/hwmon/max1668.c:139:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->temp[index] * 1000);
                  ^~~~~~~
   drivers/hwmon/max1668.c:139:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->temp[index] * 1000);
                  ^~~~~~~
   drivers/hwmon/max1668.c:151:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->temp_max[index] * 1000);
                  ^~~~~~~
   drivers/hwmon/max1668.c:151:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->temp_max[index] * 1000);
                  ^~~~~~~
   drivers/hwmon/max1668.c:163:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->temp_min[index] * 1000);
                  ^~~~~~~
   drivers/hwmon/max1668.c:163:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->temp_min[index] * 1000);
                  ^~~~~~~
   drivers/hwmon/max1668.c:175:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", (data->alarms >> index) & 0x1);

vim +/cpu +98 drivers/tty/hvc/hvc_dcc.c

16c63f8ea49c3f drivers/char/hvc_dcc.c    Daniel Walker      2010-11-30   83=
  =

4419da5d5d4b17 drivers/tty/hvc/hvc_dcc.c Shanker Donthineni 2022-04-28   84=
  /*
4419da5d5d4b17 drivers/tty/hvc/hvc_dcc.c Shanker Donthineni 2022-04-28   85=
   * Check if the DCC is enabled. If CONFIG_HVC_DCC_SERIALIZE_SMP is enable=
d,
4419da5d5d4b17 drivers/tty/hvc/hvc_dcc.c Shanker Donthineni 2022-04-28   86=
   * then we assume then this function will be called first on core0. That =
way,
4419da5d5d4b17 drivers/tty/hvc/hvc_dcc.c Shanker Donthineni 2022-04-28   87=
   * dcc_core0_available will be true only if it's available on core0.
4419da5d5d4b17 drivers/tty/hvc/hvc_dcc.c Shanker Donthineni 2022-04-28   88=
   */
f377775dc08350 drivers/tty/hvc/hvc_dcc.c Rob Herring        2013-09-24   89=
  static bool hvc_dcc_check(void)
f377775dc08350 drivers/tty/hvc/hvc_dcc.c Rob Herring        2013-09-24   90=
  {
f377775dc08350 drivers/tty/hvc/hvc_dcc.c Rob Herring        2013-09-24   91=
  	unsigned long time =3D jiffies + (HZ / 10);
4419da5d5d4b17 drivers/tty/hvc/hvc_dcc.c Shanker Donthineni 2022-04-28   92=
  	static bool dcc_core0_available;
4419da5d5d4b17 drivers/tty/hvc/hvc_dcc.c Shanker Donthineni 2022-04-28   93=
  =

4419da5d5d4b17 drivers/tty/hvc/hvc_dcc.c Shanker Donthineni 2022-04-28   94=
  	/*
4419da5d5d4b17 drivers/tty/hvc/hvc_dcc.c Shanker Donthineni 2022-04-28   95=
  	 * If we're not on core 0, but we previously confirmed that DCC is
4419da5d5d4b17 drivers/tty/hvc/hvc_dcc.c Shanker Donthineni 2022-04-28   96=
  	 * active, then just return true.
4419da5d5d4b17 drivers/tty/hvc/hvc_dcc.c Shanker Donthineni 2022-04-28   97=
  	 */
4419da5d5d4b17 drivers/tty/hvc/hvc_dcc.c Shanker Donthineni 2022-04-28  @98=
  	int cpu =3D get_cpu();
4419da5d5d4b17 drivers/tty/hvc/hvc_dcc.c Shanker Donthineni 2022-04-28   99=
  =

4419da5d5d4b17 drivers/tty/hvc/hvc_dcc.c Shanker Donthineni 2022-04-28  100=
  	if (IS_ENABLED(CONFIG_HVC_DCC_SERIALIZE_SMP) && cpu && dcc_core0_availab=
le) {
4419da5d5d4b17 drivers/tty/hvc/hvc_dcc.c Shanker Donthineni 2022-04-28  101=
  		put_cpu();
4419da5d5d4b17 drivers/tty/hvc/hvc_dcc.c Shanker Donthineni 2022-04-28  102=
  		return true;
4419da5d5d4b17 drivers/tty/hvc/hvc_dcc.c Shanker Donthineni 2022-04-28  103=
  	}
4419da5d5d4b17 drivers/tty/hvc/hvc_dcc.c Shanker Donthineni 2022-04-28  104=
  =

4419da5d5d4b17 drivers/tty/hvc/hvc_dcc.c Shanker Donthineni 2022-04-28  105=
  	put_cpu();
f377775dc08350 drivers/tty/hvc/hvc_dcc.c Rob Herring        2013-09-24  106=
  =

f377775dc08350 drivers/tty/hvc/hvc_dcc.c Rob Herring        2013-09-24  107=
  	/* Write a test character to check if it is handled */
f377775dc08350 drivers/tty/hvc/hvc_dcc.c Rob Herring        2013-09-24  108=
  	__dcc_putchar('\n');
f377775dc08350 drivers/tty/hvc/hvc_dcc.c Rob Herring        2013-09-24  109=
  =

f377775dc08350 drivers/tty/hvc/hvc_dcc.c Rob Herring        2013-09-24  110=
  	while (time_is_after_jiffies(time)) {
4419da5d5d4b17 drivers/tty/hvc/hvc_dcc.c Shanker Donthineni 2022-04-28  111=
  		if (!(__dcc_getstatus() & DCC_STATUS_TX)) {
4419da5d5d4b17 drivers/tty/hvc/hvc_dcc.c Shanker Donthineni 2022-04-28  112=
  			dcc_core0_available =3D true;
f377775dc08350 drivers/tty/hvc/hvc_dcc.c Rob Herring        2013-09-24  113=
  			return true;
f377775dc08350 drivers/tty/hvc/hvc_dcc.c Rob Herring        2013-09-24  114=
  		}
4419da5d5d4b17 drivers/tty/hvc/hvc_dcc.c Shanker Donthineni 2022-04-28  115=
  	}
f377775dc08350 drivers/tty/hvc/hvc_dcc.c Rob Herring        2013-09-24  116=
  =

f377775dc08350 drivers/tty/hvc/hvc_dcc.c Rob Herring        2013-09-24  117=
  	return false;
f377775dc08350 drivers/tty/hvc/hvc_dcc.c Rob Herring        2013-09-24  118=
  }
f377775dc08350 drivers/tty/hvc/hvc_dcc.c Rob Herring        2013-09-24  119=
  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1494344533852881193==--

