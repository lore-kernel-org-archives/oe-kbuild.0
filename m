Content-Type: multipart/mixed; boundary="===============6295457924511113892=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/marvell/libertas/debugfs.c:834:10: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support l...
Date: Tue, 19 Apr 2022 12:30:08 +0800
Message-ID: <202204191101.NJ4VDjiE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6295457924511113892==
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
head:   b2d229d4ddb17db541098b83524d901257e93845
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   5 weeks ago
:::::: branch date: 31 hours ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-c007-20220418 (https://download.01.org/0day-ci/ar=
chive/20220419/202204191101.NJ4VDjiE-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b27430=
f9f46b88bcd54d992debc8d72e131e1bd0)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   68 warnings generated.
   Suppressed 68 warnings (68 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
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
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   Suppressed 62 warnings (62 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   77 warnings generated.
   drivers/net/wireless/marvell/libertas/debugfs.c:44:9: warning: Call to f=
unction 'snprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'snprintf_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           pos +=3D snprintf(buf+pos, len-pos, "state =3D %s\n",
                  ^~~~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:44:9: note: Call to func=
tion 'snprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'snprintf_s' in case of C11
           pos +=3D snprintf(buf+pos, len-pos, "state =3D %s\n",
                  ^~~~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:46:9: warning: Call to f=
unction 'snprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'snprintf_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           pos +=3D snprintf(buf+pos, len-pos, "region_code =3D %02x\n",
                  ^~~~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:46:9: note: Call to func=
tion 'snprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'snprintf_s' in case of C11
           pos +=3D snprintf(buf+pos, len-pos, "region_code =3D %02x\n",
                  ^~~~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:69:8: warning: Call to f=
unction 'sscanf' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'sscanf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(buf, "%d %d %d %d %d %d", &p1, &p2, &p3, &p4, &p5=
, &p6);
                 ^~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:69:8: note: Call to func=
tion 'sscanf' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(buf, "%d %d %d %d %d %d", &p1, &p2, &p3, &p4, &p5=
, &p6);
                 ^~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:108:9: warning: Call to =
function 'snprintf' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'snprintf_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           pos +=3D snprintf(buf, len, "%d %d %d %d %d %d\n", sp.sp_error,
                  ^~~~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:108:9: note: Call to fun=
ction 'snprintf' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'snprintf_s' in case of C11
           pos +=3D snprintf(buf, len, "%d %d %d %d %d %d\n", sp.sp_error,
                  ^~~~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:133:8: warning: Call to =
function 'sscanf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sscanf_s' in case of C11=
 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(buf, "%d", &host_sleep);
                 ^~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:133:8: note: Call to fun=
ction 'sscanf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(buf, "%d", &host_sleep);
                 ^~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:173:9: warning: Call to =
function 'snprintf' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'snprintf_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           pos +=3D snprintf(buf, len, "%d\n", priv->is_host_sleep_activate=
d);
                  ^~~~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:173:9: note: Call to fun=
ction 'snprintf' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'snprintf_s' in case of C11
           pos +=3D snprintf(buf, len, "%d\n", priv->is_host_sleep_activate=
d);
                  ^~~~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:254:10: warning: Call to=
 function 'snprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'snprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   pos +=3D snprintf(buf, len, "%d %d %d\n", value, freq,
                          ^~~~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:254:10: note: Call to fu=
nction 'snprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'snprintf_s' in case of C=
11
                   pos +=3D snprintf(buf, len, "%d %d %d\n", value, freq,
                          ^~~~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:286:8: warning: Call to =
function 'sscanf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sscanf_s' in case of C11=
 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(buf, "%d %d %d", &value, &freq, &new_mask);
                 ^~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:286:8: note: Call to fun=
ction 'sscanf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(buf, "%d %d %d", &value, &freq, &new_mask);
                 ^~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:449:9: warning: Call to =
function 'snprintf' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'snprintf_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   pos =3D snprintf(buf, len, "MAC[0x%x] =3D 0x%08x\n",
                         ^~~~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:449:9: note: Call to fun=
ction 'snprintf' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   pos =3D snprintf(buf, len, "MAC[0x%x] =3D 0x%08x\n",
                         ^~~~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:487:8: warning: Call to =
function 'sscanf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sscanf_s' in case of C11=
 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           res =3D sscanf(buf, "%x %x", &offset, &value);
                 ^~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:487:8: note: Call to fun=
ction 'sscanf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sscanf_s' in case of C11
           res =3D sscanf(buf, "%x %x", &offset, &value);
                 ^~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:519:9: warning: Call to =
function 'snprintf' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'snprintf_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   pos =3D snprintf(buf, len, "BBP[0x%x] =3D 0x%08x\n",
                         ^~~~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:519:9: note: Call to fun=
ction 'snprintf' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   pos =3D snprintf(buf, len, "BBP[0x%x] =3D 0x%08x\n",
                         ^~~~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:559:8: warning: Call to =
function 'sscanf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sscanf_s' in case of C11=
 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           res =3D sscanf(buf, "%x %x", &offset, &value);
                 ^~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:559:8: note: Call to fun=
ction 'sscanf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sscanf_s' in case of C11
           res =3D sscanf(buf, "%x %x", &offset, &value);
                 ^~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:591:9: warning: Call to =
function 'snprintf' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'snprintf_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   pos =3D snprintf(buf, len, "RF[0x%x] =3D 0x%08x\n",
                         ^~~~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:591:9: note: Call to fun=
ction 'snprintf' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   pos =3D snprintf(buf, len, "RF[0x%x] =3D 0x%08x\n",
                         ^~~~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:630:8: warning: Call to =
function 'sscanf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sscanf_s' in case of C11=
 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           res =3D sscanf(buf, "%x %x", &offset, &value);
                 ^~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:630:8: note: Call to fun=
ction 'sscanf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sscanf_s' in case of C11
           res =3D sscanf(buf, "%x %x", &offset, &value);
                 ^~~~~~
>> drivers/net/wireless/marvell/libertas/debugfs.c:834:10: warning: Call to=
 function 'sprintf' is insecure as it does not provide bounding of the memo=
ry buffer or security checks introduced in the C11 standard. Replace with a=
nalogous functions that support length arguments or provides boundary check=
s such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.D=
eprecatedOrUnsafeBufferHandling]
                   pos +=3D sprintf(p + pos, "%s=3D%d\n", d[i].name, val);
                          ^~~~~~~
   drivers/net/wireless/marvell/libertas/debugfs.c:834:10: note: Call to fu=
nction 'sprintf' is insecure as it does not provide bounding of the memory =
buffer or security checks introduced in the C11 standard. Replace with anal=
ogous functions that support length arguments or provides boundary checks s=
uch as 'sprintf_s' in case of C11
                   pos +=3D sprintf(p + pos, "%s=3D%d\n", d[i].name, val);
                          ^~~~~~~
   Suppressed 62 warnings (62 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   drivers/char/ipmi/ipmi_si_hotmod.c:205:3: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&h, 0, sizeof(h));
                   ^~~~~~
   drivers/char/ipmi/ipmi_si_hotmod.c:205:3: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
                   memset(&h, 0, sizeof(h));
                   ^~~~~~
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   drivers/char/ipmi/ipmi_si_hardcode.c:67:2: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&p, 0, sizeof(p));
           ^~~~~~
   drivers/char/ipmi/ipmi_si_hardcode.c:67:2: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
           memset(&p, 0, sizeof(p));
           ^~~~~~
   drivers/char/ipmi/ipmi_si_hardcode.c:99:2: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(si_type, 0, sizeof(si_type));
           ^~~~~~
   drivers/char/ipmi/ipmi_si_hardcode.c:99:2: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
           memset(si_type, 0, sizeof(si_type));
           ^~~~~~
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   drivers/media/i2c/adv7604.c:1467:3: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(stdi, 0, sizeof(struct stdi_readback));
                   ^~~~~~
   drivers/media/i2c/adv7604.c:1467:3: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
                   memset(stdi, 0, sizeof(struct stdi_readback));
                   ^~~~~~
   drivers/media/i2c/adv7604.c:1571:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(timings, 0, sizeof(struct v4l2_dv_timings));
           ^~~~~~
   drivers/media/i2c/adv7604.c:1571:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(timings, 0, sizeof(struct v4l2_dv_timings));
           ^~~~~~
   drivers/media/i2c/adv7604.c:1672:3: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(timings, 0, sizeof(struct v4l2_dv_timings));
                   ^~~~~~
   drivers/media/i2c/adv7604.c:1672:3: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
                   memset(timings, 0, sizeof(struct v4l2_dv_timings));
                   ^~~~~~
   drivers/media/i2c/adv7604.c:1852:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(format, 0, sizeof(*format));
           ^~~~~~
   drivers/media/i2c/adv7604.c:1852:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(format, 0, sizeof(*format));
           ^~~~~~
   drivers/media/i2c/adv7604.c:2277:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(edid->reserved, 0, sizeof(edid->reserved));
           ^~~~~~
   drivers/media/i2c/adv7604.c:2277:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(edid->reserved, 0, sizeof(edid->reserved));
           ^~~~~~
   drivers/media/i2c/adv7604.c:2305:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(edid->edid, data + edid->start_block * 128, edid->blocks =
* 128);
           ^~~~~~
   drivers/media/i2c/adv7604.c:2305:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(edid->edid, data + edid->start_block * 128, edid->blocks =
* 128);
           ^~~~~~
   drivers/media/i2c/adv7604.c:2319:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(edid->reserved, 0, sizeof(edid->reserved));
           ^~~~~~
   drivers/media/i2c/adv7604.c:2319:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(edid->reserved, 0, sizeof(edid->reserved));
           ^~~~~~
   drivers/media/i2c/adv7604.c:2403:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(state->edid.edid, edid->edid, 128 * edid->blocks);
           ^~~~~~
   drivers/media/i2c/adv7604.c:2403:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(state->edid.edid, edid->edid, 128 * edid->blocks);
           ^~~~~~
   drivers/media/i2c/adv7604.c:3478:2: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(sd->name, sizeof(sd->name), "%s %d-%04x",
           ^~~~~~~~
   drivers/media/i2c/adv7604.c:3478:2: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
           snprintf(sd->name, sizeof(sd->name), "%s %d-%04x",
           ^~~~~~~~
   Suppressed 51 warnings (50 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   net/sched/ematch.c:312:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(tree, 0, sizeof(*tree));

vim +834 drivers/net/wireless/marvell/libertas/debugfs.c

876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  795  =

876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  796  /**
8973a6e770fc89 drivers/net/wireless/libertas/debugfs.c Randy Dunlap    2011=
-04-26  797   * lbs_debugfs_read - proc read function
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  798   *
8973a6e770fc89 drivers/net/wireless/libertas/debugfs.c Randy Dunlap    2011=
-04-26  799   * @file:	file to read
8973a6e770fc89 drivers/net/wireless/libertas/debugfs.c Randy Dunlap    2011=
-04-26  800   * @userbuf:	pointer to buffer
8973a6e770fc89 drivers/net/wireless/libertas/debugfs.c Randy Dunlap    2011=
-04-26  801   * @count:	number of bytes to read
8973a6e770fc89 drivers/net/wireless/libertas/debugfs.c Randy Dunlap    2011=
-04-26  802   * @ppos:	read data starting position
8973a6e770fc89 drivers/net/wireless/libertas/debugfs.c Randy Dunlap    2011=
-04-26  803   *
8973a6e770fc89 drivers/net/wireless/libertas/debugfs.c Randy Dunlap    2011=
-04-26  804   * returns:	amount of data read or negative error code
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  805   */
1007832103d016 drivers/net/wireless/libertas/debugfs.c Holger Schurig  2007=
-11-15  806  static ssize_t lbs_debugfs_read(struct file *file, char __user=
 *userbuf,
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  807  			size_t count, loff_t *ppos)
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  808  {
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  809  	int val =3D 0;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  810  	size_t pos =3D 0;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  811  	ssize_t res;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  812  	char *p;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  813  	int i;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  814  	struct debug_data *d;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  815  	unsigned long addr =3D get_zeroed_page(GFP_KERNEL);
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  816  	char *buf =3D (char *)addr;
ad43f8bfb7b9a6 drivers/net/wireless/libertas/debugfs.c Kiran Divekar   2009=
-08-28  817  	if (!buf)
ad43f8bfb7b9a6 drivers/net/wireless/libertas/debugfs.c Kiran Divekar   2009=
-08-28  818  		return -ENOMEM;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  819  =

876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  820  	p =3D buf;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  821  =

57674308d00b5e drivers/net/wireless/libertas/debugfs.c Joe Perches     2010=
-07-12  822  	d =3D file->private_data;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  823  =

876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  824  	for (i =3D 0; i < num_of_items; i++) {
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  825  		if (d[i].size =3D=3D 1)
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  826  			val =3D *((u8 *) d[i].addr);
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  827  		else if (d[i].size =3D=3D 2)
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  828  			val =3D *((u16 *) d[i].addr);
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  829  		else if (d[i].size =3D=3D 4)
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  830  			val =3D *((u32 *) d[i].addr);
4269e2ad83036e drivers/net/wireless/libertas/debugfs.c Dan Williams    2007=
-05-10  831  		else if (d[i].size =3D=3D 8)
4269e2ad83036e drivers/net/wireless/libertas/debugfs.c Dan Williams    2007=
-05-10  832  			val =3D *((u64 *) d[i].addr);
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  833  =

876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10 @834  		pos +=3D sprintf(p + pos, "%s=3D%d\n", d[i].name, val);
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  835  	}
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  836  =

876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  837  	res =3D simple_read_from_buffer(userbuf, count, ppos, p, pos);
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  838  =

876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  839  	free_page(addr);
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  840  	return res;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  841  }
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c Marcelo Tosatti 2007=
-02-10  842  =


:::::: The code@line 834 was first introduced by commit
:::::: 876c9d3aeb989cf1961f2c228d309ba5dcfb1172 [PATCH] Marvell Libertas 83=
88 802.11b/g USB driver

:::::: TO: Marcelo Tosatti <marcelo@kvack.org>
:::::: CC: Jeff Garzik <jeff@garzik.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6295457924511113892==--

