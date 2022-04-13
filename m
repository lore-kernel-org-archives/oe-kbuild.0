Content-Type: multipart/mixed; boundary="===============1232307006768774987=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 3/4] media: i2c: imx219: Enable variable XCLK
Date: Wed, 13 Apr 2022 10:52:55 +0800
Message-ID: <202204131055.oqAU9K1D-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1232307006768774987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220412135534.2796158-4-aford173@gmail.com>
References: <20220412135534.2796158-4-aford173@gmail.com>
TO: Adam Ford <aford173@gmail.com>
TO: linux-media(a)vger.kernel.org
CC: prabhakar.mahadev-lad.rj(a)bp.renesas.com
CC: tharvey(a)gateworks.com
CC: cstevens(a)beaconembedded.com
CC: aford(a)beaconembedded.com
CC: laurent.pinchart(a)ideasonboard.com
CC: Adam Ford <aford173@gmail.com>
CC: Dave Stevenson <dave.stevenson@raspberrypi.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-kernel(a)vger.kernel.org

Hi Adam,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.18-rc2 next-20220412]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Adam-Ford/media-i2c-=
imx219-Enable-variable-xclk-and-4-lane/20220412-215748
base:   git://linuxtv.org/media_tree.git master
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: x86_64-randconfig-c007-20220411 (https://download.01.org/0day-ci/ar=
chive/20220413/202204131055.oqAU9K1D-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478=
d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7e77bfbf6a383bd37e0=
5915762cb9263ecf88f55
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Adam-Ford/media-i2c-imx219-Enable-=
variable-xclk-and-4-lane/20220412-215748
        git checkout 7e77bfbf6a383bd37e05915762cb9263ecf88f55
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/lm75.h:27:14: note: '__UNIQUE_ID___x242' is < '__UNIQUE_ID=
___y243'
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
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
   drivers/hwmon/lm75.h:27:14: note: '?' condition is true
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
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
   drivers/hwmon/lm75.h:29:12: note: 'ntemp' is < 0
           ntemp +=3D (ntemp < 0 ? -250 : 250);
                     ^~~~~
   drivers/hwmon/lm75.h:29:12: note: '?' condition is true
   drivers/hwmon/lm75.h:30:29: note: The result of the left shift is undefi=
ned because the left operand is negative
           return (u16)((ntemp / 500) << 7);
                        ~~~~~~~~~~~~~ ^
   Suppressed 42 warnings (41 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   drivers/hwmon/ltc2947-core.c:295:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(alarms, 0, sizeof(alarms));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/hwmon/ltc2947-core.c:295:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(alarms, 0, sizeof(alarms));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
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
   Suppressed 21 warnings (21 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
>> drivers/media/i2c/imx219.c:1023:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D imx219_write_reg(imx219, IMX219_REG_EXCK,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/imx219.c:1023:2: note: Value stored to 'ret' is never =
read
           ret =3D imx219_write_reg(imx219, IMX219_REG_EXCK,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/media/i2c/imx258.c:781:3: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   ret =3D imx258_write_reg(imx258, IMX258_REG_TEST_PATTERN,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/imx258.c:781:3: note: Value stored to 'ret' is never r=
ead
                   ret =3D imx258_write_reg(imx258, IMX258_REG_TEST_PATTERN,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (43 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   drivers/scsi/ch.c:247:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cmd,0,sizeof(cmd));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/scsi/ch.c:247:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(cmd,0,sizeof(cmd));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/scsi/ch.c:264:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data,buffer+16,16);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/scsi/ch.c:264:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(data,buffer+16,16);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/scsi/ch.c:284:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cmd,0,sizeof(cmd));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/scsi/ch.c:284:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(cmd,0,sizeof(cmd));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/scsi/ch.c:304:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cmd,0,sizeof(cmd));
           ^

vim +/ret +1023 drivers/media/i2c/imx219.c

72b5174b2b64255 Adam Ford 2022-04-12  1015  =

7e77bfbf6a383bd Adam Ford 2022-04-12  1016  static int imx219_set_exck_freq=
(struct imx219 *imx219)
7e77bfbf6a383bd Adam Ford 2022-04-12  1017  {
7e77bfbf6a383bd Adam Ford 2022-04-12  1018  	int ret;
7e77bfbf6a383bd Adam Ford 2022-04-12  1019  	/* The imx219 registers need M=
Hz not Hz */
7e77bfbf6a383bd Adam Ford 2022-04-12  1020  	u8 clk =3D (u8) (imx219->xclk_=
freq/1000000U);
7e77bfbf6a383bd Adam Ford 2022-04-12  1021  =

7e77bfbf6a383bd Adam Ford 2022-04-12  1022  	/* Set the clock frequency in =
MHz */
7e77bfbf6a383bd Adam Ford 2022-04-12 @1023  	ret =3D imx219_write_reg(imx21=
9, IMX219_REG_EXCK,
7e77bfbf6a383bd Adam Ford 2022-04-12  1024  			       IMX219_REG_VALUE_08BI=
T, clk);
7e77bfbf6a383bd Adam Ford 2022-04-12  1025  =

7e77bfbf6a383bd Adam Ford 2022-04-12  1026  	/* Configure the PREPLLCK_VT_D=
IV and PREPLLCK_OP_DIV for automatic */
7e77bfbf6a383bd Adam Ford 2022-04-12  1027  	switch (clk) {
7e77bfbf6a383bd Adam Ford 2022-04-12  1028  	case 6 ... 11:
7e77bfbf6a383bd Adam Ford 2022-04-12  1029  		ret =3D imx219_write_reg(imx2=
19, IMX219_REG_PREPLLCK_VT_DIV,
7e77bfbf6a383bd Adam Ford 2022-04-12  1030  			       IMX219_REG_VALUE_08BI=
T, 0x01);
7e77bfbf6a383bd Adam Ford 2022-04-12  1031  		if (ret)
7e77bfbf6a383bd Adam Ford 2022-04-12  1032  			return ret;
7e77bfbf6a383bd Adam Ford 2022-04-12  1033  		ret =3D imx219_write_reg(imx2=
19, IMX219_REG_PREPLLCK_OP_DIV,
7e77bfbf6a383bd Adam Ford 2022-04-12  1034  			       IMX219_REG_VALUE_08BI=
T, 0x01);
7e77bfbf6a383bd Adam Ford 2022-04-12  1035  		return ret;
7e77bfbf6a383bd Adam Ford 2022-04-12  1036  	case 12 ... 23:
7e77bfbf6a383bd Adam Ford 2022-04-12  1037  		ret =3D imx219_write_reg(imx2=
19, IMX219_REG_PREPLLCK_VT_DIV,
7e77bfbf6a383bd Adam Ford 2022-04-12  1038  			       IMX219_REG_VALUE_08BI=
T, 0x02);
7e77bfbf6a383bd Adam Ford 2022-04-12  1039  		if (ret)
7e77bfbf6a383bd Adam Ford 2022-04-12  1040  			return ret;
7e77bfbf6a383bd Adam Ford 2022-04-12  1041  =

7e77bfbf6a383bd Adam Ford 2022-04-12  1042  		ret =3D imx219_write_reg(imx2=
19, IMX219_REG_PREPLLCK_OP_DIV,
7e77bfbf6a383bd Adam Ford 2022-04-12  1043  			       IMX219_REG_VALUE_08BI=
T, 0x02);
7e77bfbf6a383bd Adam Ford 2022-04-12  1044  =

7e77bfbf6a383bd Adam Ford 2022-04-12  1045  		return ret;
7e77bfbf6a383bd Adam Ford 2022-04-12  1046  	case 24 ... 27:
7e77bfbf6a383bd Adam Ford 2022-04-12  1047  		ret =3D imx219_write_reg(imx2=
19, IMX219_REG_PREPLLCK_VT_DIV,
7e77bfbf6a383bd Adam Ford 2022-04-12  1048  			       IMX219_REG_VALUE_08BI=
T, 0x03);
7e77bfbf6a383bd Adam Ford 2022-04-12  1049  		if (ret)
7e77bfbf6a383bd Adam Ford 2022-04-12  1050  			return ret;
7e77bfbf6a383bd Adam Ford 2022-04-12  1051  		ret =3D imx219_write_reg(imx2=
19, IMX219_REG_PREPLLCK_OP_DIV,
7e77bfbf6a383bd Adam Ford 2022-04-12  1052  			       IMX219_REG_VALUE_08BI=
T, 0x03);
7e77bfbf6a383bd Adam Ford 2022-04-12  1053  		return ret;
7e77bfbf6a383bd Adam Ford 2022-04-12  1054  	default:
7e77bfbf6a383bd Adam Ford 2022-04-12  1055  		/* Should never get here */
7e77bfbf6a383bd Adam Ford 2022-04-12  1056  		return -EINVAL;
7e77bfbf6a383bd Adam Ford 2022-04-12  1057  	}
7e77bfbf6a383bd Adam Ford 2022-04-12  1058  }
7e77bfbf6a383bd Adam Ford 2022-04-12  1059  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1232307006768774987==--

