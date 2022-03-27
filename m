Content-Type: multipart/mixed; boundary="===============2021523743538438257=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: lib/test_scanf.c:41:8: warning: Call to function 'vsscanf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides bound...
Date: Sun, 27 Mar 2022 17:58:49 +0800
Message-ID: <202203271708.88z8baEc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2021523743538438257==
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
head:   f022814633e1c600507b3a99691b4d624c2813f0
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   2 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-c002-20220327 (https://download.01.org/0day-ci/archi=
ve/20220327/202203271708.88z8baEc-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   kernel/time/ntp.c:315:2: note: The value -500000000 is assigned to 'offs=
et'
           offset =3D clamp(offset, -MAXPHASE, MAXPHASE);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/ntp.c:322:6: note: Assuming the condition is true
           if (unlikely(time_status & STA_FREQHOLD))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   kernel/time/ntp.c:322:2: note: Taking false branch
           if (unlikely(time_status & STA_FREQHOLD))
           ^
   kernel/time/ntp.c:327:2: note: The value -500000000 is assigned to 'offs=
et64'
           offset64    =3D offset;
           ^~~~~~~~~~~~~~~~~~~~
   kernel/time/ntp.c:335:15: note: Assuming the condition is false
           if (unlikely(secs > 1 << (SHIFT_PLL + 1 + time_constant)))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   kernel/time/ntp.c:335:2: note: Taking false branch
           if (unlikely(secs > 1 << (SHIFT_PLL + 1 + time_constant)))
           ^
   kernel/time/ntp.c:341:16: note: Assuming '__UNIQUE_ID___x225' is >=3D '_=
_UNIQUE_ID___y226'
           freq_adj    =3D min(freq_adj + time_freq, MAXFREQ_SCALED);
                         ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   kernel/time/ntp.c:341:16: note: '?' condition is false
           freq_adj    =3D min(freq_adj + time_freq, MAXFREQ_SCALED);
                         ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
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
   kernel/time/ntp.c:343:16: note: '__UNIQUE_ID___x227' is > '__UNIQUE_ID__=
_y228'
           time_freq   =3D max(freq_adj, -MAXFREQ_SCALED);
                         ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   kernel/time/ntp.c:343:16: note: '?' condition is true
           time_freq   =3D max(freq_adj, -MAXFREQ_SCALED);
                         ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
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
   kernel/time/ntp.c:345:33: note: The result of the left shift is undefine=
d because the left operand is negative
           time_offset =3D div_s64(offset64 << NTP_SCALE_SHIFT, NTP_INTERVA=
L_FREQ);
                                 ~~~~~~~~ ^
   Suppressed 31 warnings (30 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   160 warnings generated.
>> lib/test_scanf.c:41:8: warning: Call to function 'vsscanf' is insecure a=
s it does not provide bounding of the memory buffer or security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'vsscanf_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D vsscanf(string, fmt, ap_copy);
                 ^~~~~~~
   lib/test_scanf.c:41:8: note: Call to function 'vsscanf' is insecure as i=
t does not provide bounding of the memory buffer or security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'vsscanf_s' in case of C11
           ret =3D vsscanf(string, fmt, ap_copy);
                 ^~~~~~~
   lib/test_scanf.c:219:2: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           simple_numbers_loop(unsigned long long, "%llu",   "llu", check_u=
ll);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:219:2: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           simple_numbers_loop(unsigned long long, "%llu",   "llu", check_u=
ll);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:220:2: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           simple_numbers_loop(long long,          "%lld",   "lld", check_l=
l);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:220:2: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           simple_numbers_loop(long long,          "%lld",   "lld", check_l=
l);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:221:2: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           simple_numbers_loop(long long,          "%lld",   "lli", check_l=
l);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:221:2: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           simple_numbers_loop(long long,          "%lld",   "lli", check_l=
l);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:222:2: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           simple_numbers_loop(unsigned long long, "%llx",   "llx", check_u=
ll);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:222:2: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           simple_numbers_loop(unsigned long long, "%llx",   "llx", check_u=
ll);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:223:2: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           simple_numbers_loop(long long,          "%llx",   "llx", check_l=
l);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:223:2: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           simple_numbers_loop(long long,          "%llx",   "llx", check_l=
l);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:198:2: note: expanded from macro 'test_one_number'
           snprintf(test_buffer, BUF_SIZE, gen_fmt, expect_val);           \
           ^~~~~~~~
   lib/test_scanf.c:224:2: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           simple_numbers_loop(long long,          "0x%llx", "lli", check_l=
l);
           ^
   lib/test_scanf.c:208:4: note: expanded from macro 'simple_numbers_loop'
                           test_one_number(T, gen_fmt, scan_fmt,           \
--
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_scanf.c:690:8: note: expanded from macro '_test_simple_strtoxx'
           len =3D snprintf(test_buffer, BUF_SIZE, gen_fmt, expect);       =
          \
                 ^~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   crypto/asymmetric_keys/x509_cert_parser.c:404:3: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buffer,
                   ^~~~~~
   crypto/asymmetric_keys/x509_cert_parser.c:404:3: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buffer,
                   ^~~~~~
   crypto/asymmetric_keys/x509_cert_parser.c:408:3: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buffer + ctx->o_size + 2,
                   ^~~~~~
   crypto/asymmetric_keys/x509_cert_parser.c:408:3: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buffer + ctx->o_size + 2,
                   ^~~~~~
   crypto/asymmetric_keys/x509_cert_parser.c:428:2: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buffer, name, namesize);
           ^~~~~~
   crypto/asymmetric_keys/x509_cert_parser.c:428:2: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buffer, name, namesize);
           ^~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   crypto/asymmetric_keys/x509_public_key.c:214:6: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           p =3D memcpy(desc, cert->subject, sulen);
               ^~~~~~
   crypto/asymmetric_keys/x509_public_key.c:214:6: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
           p =3D memcpy(desc, cert->subject, sulen);
               ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/video/fbdev/core/fbsysfs.c:121:9: warning: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(&buf[offset], PAGE_SIZE - offset, "%c:%dx%d%c-%d=
\n",
                  ^~~~~~~~
   drivers/video/fbdev/core/fbsysfs.c:121:9: note: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(&buf[offset], PAGE_SIZE - offset, "%c:%dx%d%c-%d=
\n",
                  ^~~~~~~~
   drivers/video/fbdev/core/fbsysfs.c:137:2: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&var, 0, sizeof(var));
           ^~~~~~
   drivers/video/fbdev/core/fbsysfs.c:137:2: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
           memset(&var, 0, sizeof(var));
           ^~~~~~
   drivers/video/fbdev/core/fbsysfs.c:443:7: warning: Call to function 'ssc=
anf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sscanf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   if (sscanf(&buf[i * 24],
                       ^~~~~~
   drivers/video/fbdev/core/fbsysfs.c:443:7: note: Call to function 'sscanf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sscanf_s' in case of C11
                   if (sscanf(&buf[i * 24],
                       ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
>> drivers/bus/fsl-mc/fsl-mc-bus.c:159:9: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
           return sprintf(buf, "fsl-mc:v%08Xd%s\n", mc_dev->obj_desc.vendor,
                  ^~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:159:9: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
           return sprintf(buf, "fsl-mc:v%08Xd%s\n", mc_dev->obj_desc.vendor,
                  ^~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:203:9: warning: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%s\n", mc_dev->driver_override);
                  ^~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:203:9: note: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%s\n", mc_dev->driver_override);
                  ^~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:281:2: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(buf, "%d\n", get_dprc_irq_state(root_mc_dev));
           ^~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:281:2: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           sprintf(buf, "%d\n", get_dprc_irq_state(root_mc_dev));
           ^~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:599:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(attr, 0, sizeof(struct dprc_attributes));
           ^~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:599:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(attr, 0, sizeof(struct dprc_attributes));
           ^~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:871:18: warning: Access to field 'icid' =
results in a dereference of a null pointer (loaded from variable 'parent_mc=
_dev') [clang-analyzer-core.NullDereference]
                   mc_dev->icid =3D parent_mc_dev->icid;
                                  ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1120:6: note: Assuming 'mc' is non-null
           if (!mc)
               ^~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:1120:2: note: Taking false branch
           if (!mc)
           ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1126:6: note: Assuming 'plat_res' is null
           if (plat_res) {
               ^~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:1126:2: note: Taking false branch
           if (plat_res) {
           ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1132:6: note: Assuming field 'fsl_mc_reg=
s' is null
           if (mc->fsl_mc_regs) {
               ^~~~~~~~~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:1132:2: note: Taking false branch
           if (mc->fsl_mc_regs) {
           ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1178:6: note: Assuming 'error' is >=3D 0
           if (error < 0)
               ^~~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:1178:2: note: Taking false branch
           if (error < 0)
           ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1182:6: note: 'error' is equal to 0
           if (error !=3D 0) {
               ^~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:1182:2: note: Taking false branch
           if (error !=3D 0) {
           ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1188:2: note: Loop condition is false.  =
Exiting loop
           dev_info(&pdev->dev, "MC firmware version: %u.%u.%u\n",
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
   drivers/bus/fsl-mc/fsl-mc-bus.c:1191:6: note: Assuming the condition is =
false
           if (dev_of_node(&pdev->dev)) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:1191:2: note: Taking false branch
           if (dev_of_node(&pdev->dev)) {
           ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1200:6: note: Assuming 'error' is >=3D 0
           if (error < 0) {
               ^~~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:1200:2: note: Taking false branch
           if (error < 0) {
           ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1210:6: note: Assuming 'error' is >=3D 0
           if (error < 0)
               ^~~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:1210:2: note: Taking false branch
           if (error < 0)
           ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:1219:10: note: Calling 'fsl_mc_device_ad=
d'
           error =3D fsl_mc_device_add(&obj_desc, mc_io, &pdev->dev, &mc_bu=
s_dev);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:793:6: note: Assuming the condition is f=
alse
           if (dev_is_fsl_mc(parent_dev))
               ^
   include/linux/fsl/mc.h:353:30: note: expanded from macro 'dev_is_fsl_mc'
   #define dev_is_fsl_mc(_dev) ((_dev)->bus =3D=3D &fsl_mc_bus_type)
--
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/clocksource/timer-stm32.c:282:9: warning: The result of the left=
 shift is undefined due to shifting by '32', which is greater or equal to t=
he width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
                                           (1 <<  bits) - 1);
                                              ^
   drivers/clocksource/timer-stm32.c:295:6: note: Assuming 'to' is non-null
           if (!to)
               ^~~
   drivers/clocksource/timer-stm32.c:295:2: note: Taking false branch
           if (!to)
           ^
   drivers/clocksource/timer-stm32.c:302:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/clocksource/timer-stm32.c:302:2: note: Taking false branch
           if (ret)
           ^
   drivers/clocksource/timer-stm32.c:307:6: note: Assuming field 'private_d=
ata' is non-null
           if (!to->private_data) {
               ^~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-stm32.c:307:2: note: Taking false branch
           if (!to->private_data) {
           ^
   drivers/clocksource/timer-stm32.c:313:2: note: Taking true branch
           if (!IS_ERR(rstc)) {
           ^
   drivers/clocksource/timer-stm32.c:318:2: note: Calling 'stm32_timer_set_=
width'
           stm32_timer_set_width(to);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-stm32.c:196:30: note: Assuming the condition i=
s true
           stm32_timer_of_bits_set(to, width =3D=3D UINT_MAX ? 32 : 16);
                                       ^~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-stm32.c:196:30: note: '?' condition is true
   drivers/clocksource/timer-stm32.c:196:30: note: Passing the value 32 via=
 2nd parameter 'bits'
           stm32_timer_of_bits_set(to, width =3D=3D UINT_MAX ? 32 : 16);
                                       ^~~~~
   drivers/clocksource/timer-stm32.c:196:2: note: Calling 'stm32_timer_of_b=
its_set'
           stm32_timer_of_bits_set(to, width =3D=3D UINT_MAX ? 32 : 16);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-stm32.c:66:2: note: The value 32 is assigned t=
o field 'bits'
           pd->bits =3D bits;
           ^~~~~~~~~~~~~~~
   drivers/clocksource/timer-stm32.c:196:2: note: Returning from 'stm32_tim=
er_of_bits_set'
           stm32_timer_of_bits_set(to, width =3D=3D UINT_MAX ? 32 : 16);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-stm32.c:318:2: note: Returning from 'stm32_tim=
er_set_width'
           stm32_timer_set_width(to);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-stm32.c:323:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/clocksource/timer-stm32.c:323:2: note: Taking false branch
           if (ret)
           ^
   drivers/clocksource/timer-stm32.c:326:2: note: Calling 'stm32_clockevent=
_init'
           stm32_clockevent_init(to);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-stm32.c:270:13: note: Calling 'stm32_timer_of_=
bits_get'
           u32 bits =3D stm32_timer_of_bits_get(to);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-stm32.c:82:2: note: Returning the value 32
           return pd->bits;
           ^~~~~~~~~~~~~~~
   drivers/clocksource/timer-stm32.c:270:13: note: Returning from 'stm32_ti=
mer_of_bits_get'
           u32 bits =3D stm32_timer_of_bits_get(to);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-stm32.c:270:2: note: 'bits' initialized to 32
           u32 bits =3D stm32_timer_of_bits_get(to);
           ^~~~~~~~
   drivers/clocksource/timer-stm32.c:279:22: note: 'bits' is equal to 32
           to->clkevt.rating =3D bits =3D=3D 32 ? 250 : 100;
                               ^~~~
   drivers/clocksource/timer-stm32.c:279:22: note: '?' condition is true
   drivers/clocksource/timer-stm32.c:282:9: note: The result of the left sh=
ift is undefined due to shifting by '32', which is greater or equal to the =
width of type 'int'
                                           (1 <<  bits) - 1);
                                              ^   ~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/usb/usbip/stub_main.c:36:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(busid_table, 0, sizeof(busid_table));
           ^~~~~~
   drivers/usb/usbip/stub_main.c:36:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(busid_table, 0, sizeof(busid_table));
           ^~~~~~
   drivers/usb/usbip/stub_main.c:136:3: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(busid_table[idx].name, 0, BUSID_SIZE);
                   ^~~~~~
   drivers/usb/usbip/stub_main.c:136:3: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
                   memset(busid_table[idx].name, 0, BUSID_SIZE);
                   ^~~~~~
>> drivers/usb/usbip/stub_main.c:158:11: warning: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeB=
ufferHandling]
                           out +=3D sprintf(out, "%s ", busid_table[i].name=
);
                                  ^~~~~~~
   drivers/usb/usbip/stub_main.c:158:11: note: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11
                           out +=3D sprintf(out, "%s ", busid_table[i].name=
);
                                  ^~~~~~~
   drivers/usb/usbip/stub_main.c:162:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           out +=3D sprintf(out, "\n");
                  ^~~~~~~
   drivers/usb/usbip/stub_main.c:162:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           out +=3D sprintf(out, "\n");
                  ^~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (20 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/cpuidle/governors/menu.c:551:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(data, 0, sizeof(struct menu_device));
           ^~~~~~
   drivers/cpuidle/governors/menu.c:551:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(data, 0, sizeof(struct menu_device));
           ^~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   drivers/leds/led-core.c:442:4: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "=
%s:%s",
                           ^~~~~~~~
   drivers/leds/led-core.c:442:4: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
                           snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "=
%s:%s",
                           ^~~~~~~~
   drivers/leds/led-core.c:449:4: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s-%d",
                           ^~~~~~~~
   drivers/leds/led-core.c:449:4: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
                           snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s-%d",
                           ^~~~~~~~
   drivers/leds/led-core.c:453:4: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s",
                           ^~~~~~~~
   drivers/leds/led-core.c:453:4: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
                           snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s",
                           ^~~~~~~~
   drivers/leds/led-core.c:458:4: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "=
%s:%s",
                           ^~~~~~~~
   drivers/leds/led-core.c:458:4: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
                           snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "=
%s:%s",
                           ^~~~~~~~
   drivers/leds/led-core.c:469:3: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
                   ^~~~~~~~
   drivers/leds/led-core.c:469:3: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
                   snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
                   ^~~~~~~~
   drivers/leds/led-core.c:472:30: warning: Access to field 'name' results =
in a dereference of a null pointer [clang-analyzer-core.NullDereference]
                   strscpy(led_classdev_name, to_of_node(fwnode)->name,
                                              ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/leds/led-core.c:424:2: note: Taking false branch
           BUG_ON(props.color =3D=3D LED_COLOR_ID_MULTI);
           ^
   include/asm-generic/bug.h:161:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   drivers/leds/led-core.c:424:2: note: Loop condition is false.  Exiting l=
oop
           BUG_ON(props.color =3D=3D LED_COLOR_ID_MULTI);
           ^
   include/asm-generic/bug.h:161:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/leds/led-core.c:426:6: note: Assuming 'led_classdev_name' is non=
-null
           if (!led_classdev_name)
               ^~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:426:2: note: Taking false branch
           if (!led_classdev_name)
           ^
   drivers/leds/led-core.c:429:2: note: Calling 'led_parse_fwnode_props'
           led_parse_fwnode_props(dev, fwnode, &props);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:370:6: note: Assuming 'fwnode' is non-null
           if (!fwnode)
               ^~~~~~~
   drivers/leds/led-core.c:370:2: note: Taking false branch
           if (!fwnode)
           ^
   drivers/leds/led-core.c:373:6: note: Assuming the condition is false
           if (fwnode_property_present(fwnode, "label")) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:373:2: note: Taking false branch
           if (fwnode_property_present(fwnode, "label")) {
           ^
   drivers/leds/led-core.c:380:6: note: Assuming the condition is false
           if (fwnode_property_present(fwnode, "color")) {
--
                                                 ^~~~
   drivers/gpu/drm/imx/imx-ldb.c:327:2: note: Taking false branch
           if (imx_ldb_ch =3D=3D &ldb->channel[1] || dual)
           ^
   drivers/gpu/drm/imx/imx-ldb.c:332:6: note: 'dual' is 0
           if (dual) {
               ^~~~
   drivers/gpu/drm/imx/imx-ldb.c:332:2: note: Taking false branch
           if (dual) {
           ^
   drivers/gpu/drm/imx/imx-ldb.c:337:6: note: Assuming field 'lvds_mux' is =
non-null
           if (ldb->lvds_mux) {
               ^~~~~~~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:337:2: note: Taking true branch
           if (ldb->lvds_mux) {
           ^
   drivers/gpu/drm/imx/imx-ldb.c:338:3: note: 'lvds_mux' initialized to a n=
ull pointer value
                   const struct bus_mux *lvds_mux =3D NULL;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:340:7: note: Assuming the condition is fal=
se
                   if (imx_ldb_ch =3D=3D &ldb->channel[0])
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:340:3: note: Taking false branch
                   if (imx_ldb_ch =3D=3D &ldb->channel[0])
                   ^
   drivers/gpu/drm/imx/imx-ldb.c:342:12: note: Assuming the condition is fa=
lse
                   else if (imx_ldb_ch =3D=3D &ldb->channel[1])
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:342:8: note: Taking false branch
                   else if (imx_ldb_ch =3D=3D &ldb->channel[1])
                        ^
   drivers/gpu/drm/imx/imx-ldb.c:345:28: note: Access to field 'reg' result=
s in a dereference of a null pointer (loaded from variable 'lvds_mux')
                   regmap_read(ldb->regmap, lvds_mux->reg, &mux);
                                            ^~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:421:2: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(clkname, sizeof(clkname), "di%d", chno);
           ^~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:421:2: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           snprintf(clkname, sizeof(clkname), "di%d", chno);
           ^~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:426:2: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(clkname, sizeof(clkname), "di%d_pll", chno);
           ^~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:426:2: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           snprintf(clkname, sizeof(clkname), "di%d_pll", chno);
           ^~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:656:3: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(clkname, "di%d_sel", i);
                   ^~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:656:3: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(clkname, "di%d_sel", i);
                   ^~~~~~~
   Suppressed 44 warnings (43 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/usb/core/message.c:286:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(driver_data, data, size);
                   ^~~~~~
   drivers/usb/core/message.c:286:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(driver_data, data, size);
                   ^~~~~~
   drivers/usb/core/message.c:789:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0, size);   /* Make sure we parse really received da=
ta */
           ^~~~~~
   drivers/usb/core/message.c:789:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(buf, 0, size);   /* Make sure we parse really received da=
ta */
           ^~~~~~
   drivers/usb/core/message.c:1034:4: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(smallbuf, buf, len);
                           ^~~~~~
   drivers/usb/core/message.c:1034:4: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                           memcpy(smallbuf, buf, len);
                           ^~~~~~
   drivers/usb/core/message.c:1073:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&dev->descriptor, desc, size);
                   ^~~~~~
   drivers/usb/core/message.c:1073:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&dev->descriptor, desc, size);
                   ^~~~~~
   drivers/usb/core/message.c:1709:2: warning: Value stored to 'retval' is =
never read [clang-analyzer-deadcode.DeadStores]
           retval =3D 0;
           ^        ~
   drivers/usb/core/message.c:1709:2: note: Value stored to 'retval' is nev=
er read
           retval =3D 0;
           ^        ~
   drivers/usb/core/message.c:2301:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(hdr, 0x00, sizeof(struct usb_cdc_parsed_header));
           ^~~~~~
   drivers/usb/core/message.c:2301:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(hdr, 0x00, sizeof(struct usb_cdc_parsed_header));
           ^~~~~~
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
   45 warnings generated.
>> drivers/usb/mtu3/mtu3_debugfs.c:135:2: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
           sprintf(mregs->name, "%s", name);
           ^~~~~~~
   drivers/usb/mtu3/mtu3_debugfs.c:135:2: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
           sprintf(mregs->name, "%s", name);
           ^~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   include/linux/log2.h:67:13: warning: The result of the left shift is und=
efined due to shifting by '4294967295', which is greater or equal to the wi=
dth of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorRes=
ult]
           return 1UL << (fls_long(n) - 1);
                      ^
   drivers/usb/host/ehci-hcd.c:888:2: note: Control jumps to the 'default' =
case@line 897
           switch (usb_pipetype (urb->pipe)) {
           ^
   drivers/usb/host/ehci-hcd.c:898:3: note: Taking false branch
                   if (!qh_urb_transaction (ehci, urb, &qtd_list, mem_flags=
))
                   ^
   drivers/usb/host/ehci-hcd.c:900:10: note: Calling 'submit_async'
                   return submit_async(ehci, urb, &qtd_list, mem_flags);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/ehci-q.c:1128:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_irqsave (&ehci->lock, flags);
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
   drivers/usb/host/ehci-q.c:1128:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_irqsave (&ehci->lock, flags);
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
   drivers/usb/host/ehci-q.c:1128:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_irqsave (&ehci->lock, flags);
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
   include/linux/spinlock_api_up.h:31:27: note: expanded from macro '__LOCK'
     do { preempt_disable(); ___LOCK(lock); } while (0)
                             ^
   include/linux/spinlock_api_up.h:28:3: note: expanded from macro '___LOCK'
     do { __acquire(lock); (void)(lock); } while (0)
     ^
   drivers/usb/host/ehci-q.c:1128:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_irqsave (&ehci->lock, flags);
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
   drivers/usb/host/ehci-q.c:1128:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_irqsave (&ehci->lock, flags);
--
                           ^~~~~~
   Suppressed 89 warnings (88 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/dma/qcom/hidma_ll.c:535:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(lldev->tre_ring + lldev->tre_write_offset,
           ^~~~~~
   drivers/dma/qcom/hidma_ll.c:535:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(lldev->tre_ring + lldev->tre_write_offset,
           ^~~~~~
   drivers/dma/qcom/hidma_ll.c:817:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(lldev->trepool, 0, required_bytes);
           ^~~~~~
   drivers/dma/qcom/hidma_ll.c:817:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(lldev->trepool, 0, required_bytes);
           ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/staging/greybus/arche-platform.c:376:10: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "off\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-platform.c:376:10: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "off\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-platform.c:378:10: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "active\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-platform.c:378:10: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "active\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-platform.c:380:10: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "standby\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-platform.c:380:10: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "standby\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-platform.c:382:10: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "fw_flashing\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-platform.c:382:10: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "fw_flashing\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-platform.c:384:10: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "unknown state\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-platform.c:384:10: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "unknown state\n");
                          ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/regulator/ti-abb-regulator.c:754:3: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -ENODEV;
                   ^     ~~~~~~~
   drivers/regulator/ti-abb-regulator.c:754:3: note: Value stored to 'ret' =
is never read
                   ret =3D -ENODEV;
                   ^     ~~~~~~~
   drivers/regulator/ti-abb-regulator.c:773:3: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -ENODEV;
                   ^     ~~~~~~~
   drivers/regulator/ti-abb-regulator.c:773:3: note: Value stored to 'ret' =
is never read
                   ret =3D -ENODEV;
                   ^     ~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/usb/musb/musb_dsps.c:351:6: warning: Value stored to 'devctl' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
                   u8 devctl =3D musb_readb(mregs, MUSB_DEVCTL);
                      ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_dsps.c:351:6: note: Value stored to 'devctl' durin=
g its initialization is never read
                   u8 devctl =3D musb_readb(mregs, MUSB_DEVCTL);
                      ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/musb/musb_dsps.c:414:2: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
           sprintf(buf, "%s.dsps", dev_name(musb->controller));
           ^~~~~~~
   drivers/usb/musb/musb_dsps.c:414:2: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
           sprintf(buf, "%s.dsps", dev_name(musb->controller));
           ^~~~~~~
   drivers/usb/musb/musb_dsps.c:637:3: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst, &val, len);
                   ^~~~~~
   drivers/usb/musb/musb_dsps.c:637:3: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dst, &val, len);
                   ^~~~~~
   drivers/usb/musb/musb_dsps.c:735:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(resources, 0, sizeof(resources));
           ^~~~~~
   drivers/usb/musb/musb_dsps.c:735:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(resources, 0, sizeof(resources));
           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/usb/musb/tusb6010.c:185:4: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&val, buf, 4);
                           ^~~~~~
   drivers/usb/musb/tusb6010.c:185:4: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&val, buf, 4);
                           ^~~~~~
   drivers/usb/musb/tusb6010.c:194:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&val, buf, len);
                   ^~~~~~
   drivers/usb/musb/tusb6010.c:194:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&val, buf, len);
                   ^~~~~~
   drivers/usb/musb/tusb6010.c:208:4: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(buf, &val, 4);
                           ^~~~~~
   drivers/usb/musb/tusb6010.c:208:4: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                           memcpy(buf, &val, 4);
                           ^~~~~~
   drivers/usb/musb/tusb6010.c:216:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, &val, len);
                   ^~~~~~
   drivers/usb/musb/tusb6010.c:216:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, &val, len);
                   ^~~~~~
   drivers/usb/musb/tusb6010.c:222:15: warning: Value stored to 'musb' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct musb *musb =3D hw_ep->musb;
                        ^~~~   ~~~~~~~~~~~
   drivers/usb/musb/tusb6010.c:222:15: note: Value stored to 'musb' during =
its initialization is never read
           struct musb *musb =3D hw_ep->musb;
                        ^~~~   ~~~~~~~~~~~
   drivers/usb/musb/tusb6010.c:272:15: warning: Value stored to 'musb' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct musb *musb =3D hw_ep->musb;
                        ^~~~   ~~~~~~~~~~~
   drivers/usb/musb/tusb6010.c:272:15: note: Value stored to 'musb' during =
its initialization is never read
           struct musb *musb =3D hw_ep->musb;
                        ^~~~   ~~~~~~~~~~~
   drivers/usb/musb/tusb6010.c:633:2: warning: Value stored to 'otg_stat' i=
s never read [clang-analyzer-deadcode.DeadStores]
           otg_stat =3D musb_readl(tbase, TUSB_DEV_OTG_STAT);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/tusb6010.c:633:2: note: Value stored to 'otg_stat' is n=
ever read
           otg_stat =3D musb_readl(tbase, TUSB_DEV_OTG_STAT);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/tusb6010.c:1226:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(musb_resources, 0x00, sizeof(*musb_resources) *
           ^~~~~~
   drivers/usb/musb/tusb6010.c:1226:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(musb_resources, 0x00, sizeof(*musb_resources) *
           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/crypto/keembay/keembay-ocs-aes-core.c:177:2: warning: Call to fu=
nction 'memcpy' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memcpy_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(tctx->key, in_key, key_len);
           ^~~~~~
   drivers/crypto/keembay/keembay-ocs-aes-core.c:177:2: note: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(tctx->key, in_key, key_len);
           ^~~~~~
   drivers/crypto/keembay/keembay-ocs-aes-core.c:246:2: warning: Call to fu=
nction 'memset' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memset_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(rctx, 0, sizeof(*rctx));
           ^~~~~~
   drivers/crypto/keembay/keembay-ocs-aes-core.c:246:2: note: Call to funct=
ion 'memset' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memset_s' in case of C11
           memset(rctx, 0, sizeof(*rctx));
           ^~~~~~
   drivers/crypto/keembay/keembay-ocs-aes-core.c:580:4: warning: Call to fu=
nction 'memcpy' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memcpy_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(req->iv, rctx->last_ct_blk, iv_size);
                           ^~~~~~
   drivers/crypto/keembay/keembay-ocs-aes-core.c:580:4: note: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(req->iv, rctx->last_ct_blk, iv_size);
                           ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   drivers/crypto/keembay/ocs-aes.c:906:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(tag, tag_u32, tag_size);
           ^~~~~~
   drivers/crypto/keembay/ocs-aes.c:906:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(tag, tag_u32, tag_size);
           ^~~~~~
   drivers/crypto/keembay/ocs-aes.c:1062:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(b0, 0, sizeof(b0));
--
   67 warnings generated.
   net/sched/sch_drr.c:264:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&xstats, 0, sizeof(xstats));
           ^~~~~~
   net/sched/sch_drr.c:264:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&xstats, 0, sizeof(xstats));
           ^~~~~~
   Suppressed 66 warnings (66 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/input/rmi4/rmi_smbus.c:109:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&new_map, 0, sizeof(new_map));
           ^~~~~~
   drivers/input/rmi4/rmi_smbus.c:109:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&new_map, 0, sizeof(new_map));
           ^~~~~~
   drivers/input/rmi4/rmi_smbus.c:120:3: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&new_map, 0, sizeof(new_map));
                   ^~~~~~
   drivers/input/rmi4/rmi_smbus.c:120:3: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
                   memset(&new_map, 0, sizeof(new_map));
                   ^~~~~~
   drivers/input/rmi4/rmi_smbus.c:199:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(databuff, 0, len);
           ^~~~~~
   drivers/input/rmi4/rmi_smbus.c:199:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(databuff, 0, len);
           ^~~~~~
   drivers/input/rmi4/rmi_smbus.c:232:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(rmi_smb->mapping_table, 0, sizeof(rmi_smb->mapping_table)=
);
           ^~~~~~
   drivers/input/rmi4/rmi_smbus.c:232:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(rmi_smb->mapping_table, 0, sizeof(rmi_smb->mapping_table)=
);
           ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   fs/dcache.c:320:3: warning: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
                   memcpy(name->inline_name, dentry->d_iname,
                   ^~~~~~
   fs/dcache.c:320:3: note: Call to function 'memcpy' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memcpy_s' in case of C11
                   memcpy(name->inline_name, dentry->d_iname,
                   ^~~~~~
   fs/dcache.c:1800:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dname, name->name, name->len);
           ^~~~~~
   fs/dcache.c:1800:2: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
           memcpy(dname, name->name, name->len);
           ^~~~~~
   fs/dcache.c:2824:4: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(target->d_iname, dentry->d_name.name,
                           ^~~~~~
   fs/dcache.c:2824:4: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
                           memcpy(target->d_iname, dentry->d_name.name,
                           ^~~~~~
   fs/dcache.c:2835:4: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(dentry->d_iname, target->d_name.name,
                           ^~~~~~
   fs/dcache.c:2835:4: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
                           memcpy(dentry->d_iname, target->d_name.name,
                           ^~~~~~
   fs/dcache.c:2863:3: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dentry->d_iname, target->d_name.name,
                   ^~~~~~
   fs/dcache.c:2863:3: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
                   memcpy(dentry->d_iname, target->d_name.name,
                   ^~~~~~
   fs/dcache.c:3203:23: warning: Call to function 'sprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           dentry->d_name.len =3D sprintf(dentry->d_iname, "#%llu",
                                ^~~~~~~
   fs/dcache.c:3203:23: note: Call to function 'sprintf' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'sprintf_s' in case of C11
           dentry->d_name.len =3D sprintf(dentry->d_iname, "#%llu",
                                ^~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   fs/autofs/expire.c:546:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&pkt, 0, sizeof(pkt));
           ^~~~~~
   fs/autofs/expire.c:546:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(&pkt, 0, sizeof(pkt));
           ^~~~~~
   fs/autofs/expire.c:556:2: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(pkt.name, dentry->d_name.name, pkt.len);
           ^~~~~~
   fs/autofs/expire.c:556:2: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           memcpy(pkt.name, dentry->d_name.name, pkt.len);
           ^~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/input/keyboard/adp5520-keys.c:118:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dev->keycode, pdata->keymap,
           ^~~~~~
   drivers/input/keyboard/adp5520-keys.c:118:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(dev->keycode, pdata->keymap,
           ^~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
>> drivers/staging/fieldbus/anybuss/arcx-anybus.c:169:9: warning: Call to f=
unction 'sprintf' is insecure as it does not provide bounding of the memory=
 buffer or security checks introduced in the C11 standard. Replace with ana=
logous functions that support length arguments or provides boundary checks =
such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Dep=
recatedOrUnsafeBufferHandling]
           return sprintf(buf, "%s\n", cd->version);
                  ^~~~~~~
   drivers/staging/fieldbus/anybuss/arcx-anybus.c:169:9: note: Call to func=
tion 'sprintf' is insecure as it does not provide bounding of the memory bu=
ffer or security checks introduced in the C11 standard. Replace with analog=
ous functions that support length arguments or provides boundary checks suc=
h as 'sprintf_s' in case of C11
           return sprintf(buf, "%s\n", cd->version);
                  ^~~~~~~
   drivers/staging/fieldbus/anybuss/arcx-anybus.c:178:9: warning: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", cd->design_no);
                  ^~~~~~~
   drivers/staging/fieldbus/anybuss/arcx-anybus.c:178:9: note: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", cd->design_no);
                  ^~~~~~~
   drivers/staging/fieldbus/anybuss/arcx-anybus.c:256:2: warning: Call to f=
unction 'snprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'snprintf_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(cd->version, sizeof(cd->version), "%c%d",
           ^~~~~~~~
   drivers/staging/fieldbus/anybuss/arcx-anybus.c:256:2: note: Call to func=
tion 'snprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(cd->version, sizeof(cd->version), "%c%d",
           ^~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/staging/fieldbus/anybuss/hms-profinet.c:69:9: warning: Call to f=
unction 'snprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'snprintf_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, max_size, "%pM\n", response.addr);
                  ^~~~~~~~
   drivers/staging/fieldbus/anybuss/hms-profinet.c:69:9: note: Call to func=
tion 'snprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, max_size, "%pM\n", response.addr);
                  ^~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/misc/ds1682.c:94:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%llu\n", (sattr->nr =3D=3D 4) ? (val * 250)=
 : val);
                  ^~~~~~~
   drivers/misc/ds1682.c:94:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%llu\n", (sattr->nr =3D=3D 4) ? (val * 250)=
 : val);
                  ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/misc/hmc6352.c:84:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d.%d\n", ret/10, ret%10);
                  ^~~~~~~
   drivers/misc/hmc6352.c:84:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d.%d\n", ret/10, ret%10);
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
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/gpu/drm/shmobile/shmob_drm_plane.c:178:27: warning: Value stored=
 to 'sdev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct shmob_drm_device *sdev =3D plane->dev->dev_private;
                                    ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/shmobile/shmob_drm_plane.c:178:27: note: Value stored to=
 'sdev' during its initialization is never read
           struct shmob_drm_device *sdev =3D plane->dev->dev_private;
                                    ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/gpu/drm/sun4i/sun4i_tv.c:491:3: warning: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strc=
py]
                   strcpy(mode->name, tv_mode->name);
                   ^~~~~~
   drivers/gpu/drm/sun4i/sun4i_tv.c:491:3: note: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119
                   strcpy(mode->name, tv_mode->name);
                   ^~~~~~
   Suppressed 43 warnings (42 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +41 lib/test_scanf.c

50f530e176eac8 Richard Fitzgerald 2021-05-14  26  =

50f530e176eac8 Richard Fitzgerald 2021-05-14  27  typedef int (*check_fn)(c=
onst void *check_data, const char *string,
50f530e176eac8 Richard Fitzgerald 2021-05-14  28  			const char *fmt, int n=
_args, va_list ap);
50f530e176eac8 Richard Fitzgerald 2021-05-14  29  =

50f530e176eac8 Richard Fitzgerald 2021-05-14  30  static void __scanf(4, 6)=
 __init
50f530e176eac8 Richard Fitzgerald 2021-05-14  31  _test(check_fn fn, const =
void *check_data, const char *string, const char *fmt,
50f530e176eac8 Richard Fitzgerald 2021-05-14  32  	int n_args, ...)
50f530e176eac8 Richard Fitzgerald 2021-05-14  33  {
50f530e176eac8 Richard Fitzgerald 2021-05-14  34  	va_list ap, ap_copy;
50f530e176eac8 Richard Fitzgerald 2021-05-14  35  	int ret;
50f530e176eac8 Richard Fitzgerald 2021-05-14  36  =

50f530e176eac8 Richard Fitzgerald 2021-05-14  37  	total_tests++;
50f530e176eac8 Richard Fitzgerald 2021-05-14  38  =

50f530e176eac8 Richard Fitzgerald 2021-05-14  39  	va_start(ap, n_args);
50f530e176eac8 Richard Fitzgerald 2021-05-14  40  	va_copy(ap_copy, ap);
50f530e176eac8 Richard Fitzgerald 2021-05-14 @41  	ret =3D vsscanf(string, =
fmt, ap_copy);
50f530e176eac8 Richard Fitzgerald 2021-05-14  42  	va_end(ap_copy);
50f530e176eac8 Richard Fitzgerald 2021-05-14  43  =

50f530e176eac8 Richard Fitzgerald 2021-05-14  44  	if (ret !=3D n_args) {
50f530e176eac8 Richard Fitzgerald 2021-05-14  45  		pr_warn("vsscanf(\"%s\"=
, \"%s\", ...) returned %d expected %d\n",
50f530e176eac8 Richard Fitzgerald 2021-05-14  46  			string, fmt, ret, n_ar=
gs);
50f530e176eac8 Richard Fitzgerald 2021-05-14  47  		goto fail;
50f530e176eac8 Richard Fitzgerald 2021-05-14  48  	}
50f530e176eac8 Richard Fitzgerald 2021-05-14  49  =

50f530e176eac8 Richard Fitzgerald 2021-05-14  50  	ret =3D (*fn)(check_data=
, string, fmt, n_args, ap);
50f530e176eac8 Richard Fitzgerald 2021-05-14  51  	if (ret)
50f530e176eac8 Richard Fitzgerald 2021-05-14  52  		goto fail;
50f530e176eac8 Richard Fitzgerald 2021-05-14  53  =

50f530e176eac8 Richard Fitzgerald 2021-05-14  54  	va_end(ap);
50f530e176eac8 Richard Fitzgerald 2021-05-14  55  =

50f530e176eac8 Richard Fitzgerald 2021-05-14  56  	return;
50f530e176eac8 Richard Fitzgerald 2021-05-14  57  =

50f530e176eac8 Richard Fitzgerald 2021-05-14  58  fail:
50f530e176eac8 Richard Fitzgerald 2021-05-14  59  	failed_tests++;
50f530e176eac8 Richard Fitzgerald 2021-05-14  60  	va_end(ap);
50f530e176eac8 Richard Fitzgerald 2021-05-14  61  }
50f530e176eac8 Richard Fitzgerald 2021-05-14  62  =


:::::: The code at line 41 was first introduced by commit
:::::: 50f530e176eac808e64416732e54c0686ce2c39b lib: test_scanf: Add tests =
for sscanf number conversion

:::::: TO: Richard Fitzgerald <rf@opensource.cirrus.com>
:::::: CC: Petr Mladek <pmladek@suse.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2021523743538438257==--

