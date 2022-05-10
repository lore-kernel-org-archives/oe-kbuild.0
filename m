Content-Type: multipart/mixed; boundary="===============4513738769160965590=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/platform/x86/asus-wmi.c:1939:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments ...
Date: Tue, 10 May 2022 22:54:49 +0800
Message-ID: <202205102235.NlB4UJql-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4513738769160965590==
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
head:   9be9ed2612b5aedb52a2c240edb1630b6b743cb6
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   8 weeks ago
:::::: branch date: 23 hours ago
:::::: commit date: 8 weeks ago
config: i386-randconfig-c001-20220509 (https://download.01.org/0day-ci/arch=
ive/20220510/202205102235.NlB4UJql-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a38564=
5b470e2d3a1534aae618ea56b31177639f)
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
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/platform/x86/asus-wmi.c:285:6: note: Assuming 'status' is not eq=
ual to 0
           if (ACPI_FAILURE(status))
               ^
   include/acpi/acexcep.h:58:41: note: expanded from macro 'ACPI_FAILURE'
   #define ACPI_FAILURE(a)                 (a)
                                           ^~~
   drivers/platform/x86/asus-wmi.c:285:2: note: Taking true branch
           if (ACPI_FAILURE(status))
           ^
   drivers/platform/x86/asus-wmi.c:286:3: note: Returning without writing t=
o '*retval'
                   return -EIO;
                   ^
   drivers/platform/x86/asus-wmi.c:305:9: note: Returning from 'asus_wmi_ev=
aluate_method3'
           return asus_wmi_evaluate_method3(method_id, arg0, arg1, 0, retva=
l);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/platform/x86/asus-wmi.c:305:2: note: Returning without writing t=
o '*'
           return asus_wmi_evaluate_method3(method_id, arg0, arg1, 0, retva=
l);
           ^
   drivers/platform/x86/asus-wmi.c:437:9: note: Returning from 'asus_wmi_ev=
aluate_method'
           return asus_wmi_evaluate_method(asus->dsts_id, dev_id, 0, retval=
);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/asus-wmi.c:437:2: note: Returning without writing t=
o '*retval'
           return asus_wmi_evaluate_method(asus->dsts_id, dev_id, 0, retval=
);
           ^
   drivers/platform/x86/asus-wmi.c:989:2: note: Returning from 'asus_wmi_ge=
t_devstate'
           asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_WIRELESS_LED, &result=
);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/asus-wmi.c:991:16: note: The left operand of '&' is=
 a garbage value
           return result & ASUS_WMI_DSTS_BRIGHTNESS_MASK;
                  ~~~~~~ ^
   drivers/platform/x86/asus-wmi.c:1024:16: warning: The left operand of '&=
' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return result & ASUS_WMI_DSTS_LIGHTBAR_MASK;
                  ~~~~~~ ^
   drivers/platform/x86/asus-wmi.c:1019:2: note: 'result' declared without =
an initial value
           u32 result;
           ^~~~~~~~~~
   drivers/platform/x86/asus-wmi.c:1022:2: note: Calling 'asus_wmi_get_devs=
tate'
           asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_LIGHTBAR, &result);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/asus-wmi.c:437:9: note: Calling 'asus_wmi_evaluate_=
method'
           return asus_wmi_evaluate_method(asus->dsts_id, dev_id, 0, retval=
);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/asus-wmi.c:305:9: note: Calling 'asus_wmi_evaluate_=
method3'
           return asus_wmi_evaluate_method3(method_id, arg0, arg1, 0, retva=
l);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/platform/x86/asus-wmi.c:285:6: note: Assuming 'status' is not eq=
ual to 0
           if (ACPI_FAILURE(status))
               ^
   include/acpi/acexcep.h:58:41: note: expanded from macro 'ACPI_FAILURE'
   #define ACPI_FAILURE(a)                 (a)
                                           ^~~
   drivers/platform/x86/asus-wmi.c:285:2: note: Taking true branch
           if (ACPI_FAILURE(status))
           ^
   drivers/platform/x86/asus-wmi.c:286:3: note: Returning without writing t=
o '*retval'
                   return -EIO;
                   ^
   drivers/platform/x86/asus-wmi.c:305:9: note: Returning from 'asus_wmi_ev=
aluate_method3'
           return asus_wmi_evaluate_method3(method_id, arg0, arg1, 0, retva=
l);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/platform/x86/asus-wmi.c:305:2: note: Returning without writing t=
o '*'
           return asus_wmi_evaluate_method3(method_id, arg0, arg1, 0, retva=
l);
           ^
   drivers/platform/x86/asus-wmi.c:437:9: note: Returning from 'asus_wmi_ev=
aluate_method'
           return asus_wmi_evaluate_method(asus->dsts_id, dev_id, 0, retval=
);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/asus-wmi.c:437:2: note: Returning without writing t=
o '*retval'
           return asus_wmi_evaluate_method(asus->dsts_id, dev_id, 0, retval=
);
           ^
   drivers/platform/x86/asus-wmi.c:1022:2: note: Returning from 'asus_wmi_g=
et_devstate'
           asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_LIGHTBAR, &result);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/asus-wmi.c:1024:16: note: The left operand of '&' i=
s a garbage value
           return result & ASUS_WMI_DSTS_LIGHTBAR_MASK;
                  ~~~~~~ ^
   drivers/platform/x86/asus-wmi.c:1770:10: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%d\n", asus->agfn_pwm);
                          ^~~~~~~
   drivers/platform/x86/asus-wmi.c:1770:10: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%d\n", asus->agfn_pwm);
                          ^~~~~~~
   drivers/platform/x86/asus-wmi.c:1793:9: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", value);
                  ^~~~~~~
   drivers/platform/x86/asus-wmi.c:1793:9: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", value);
                  ^~~~~~~
   drivers/platform/x86/asus-wmi.c:1853:9: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", value < 0 ? -1 : value*100);
                  ^~~~~~~
   drivers/platform/x86/asus-wmi.c:1853:9: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", value < 0 ? -1 : value*100);
                  ^~~~~~~
   drivers/platform/x86/asus-wmi.c:1871:9: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", asus->fan_pwm_mode);
                  ^~~~~~~
   drivers/platform/x86/asus-wmi.c:1871:9: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", asus->fan_pwm_mode);
                  ^~~~~~~
>> drivers/platform/x86/asus-wmi.c:1939:9: warning: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsaf=
eBufferHandling]
           return sprintf(buf, "%s\n", ASUS_FAN_DESC);
                  ^~~~~~~
   drivers/platform/x86/asus-wmi.c:1939:9: note: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11
           return sprintf(buf, "%s\n", ASUS_FAN_DESC);
                  ^~~~~~~
   drivers/platform/x86/asus-wmi.c:1954:9: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n",
                  ^~~~~~~
   drivers/platform/x86/asus-wmi.c:1954:9: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n",
                  ^~~~~~~
   drivers/platform/x86/asus-wmi.c:2942:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&props, 0, sizeof(struct backlight_properties));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/platform/x86/asus-wmi.c:2942:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(&props, 0, sizeof(struct backlight_properties));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/platform/x86/asus-wmi.c:2994:17: warning: The left operand of '&=
' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return (result & ASUS_WMI_DSTS_PRESENCE_BIT) &&
                          ^
   drivers/platform/x86/asus-wmi.c:3723:2: note: Taking false branch
           if (!IS_ERR_OR_NULL(asus->kbd_led.dev))
           ^
   drivers/platform/x86/asus-wmi.c:3726:6: note: Calling 'asus_wmi_has_fnlo=
ck_key'
           if (asus_wmi_has_fnlock_key(asus))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/asus-wmi.c:2990:2: note: 'result' declared without =
an initial value
           u32 result;
           ^~~~~~~~~~
   drivers/platform/x86/asus-wmi.c:2992:2: note: Calling 'asus_wmi_get_devs=
tate'
           asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_FNLOCK, &result);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/asus-wmi.c:437:9: note: Calling 'asus_wmi_evaluate_=
method'
           return asus_wmi_evaluate_method(asus->dsts_id, dev_id, 0, retval=
);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/asus-wmi.c:305:9: note: Calling 'asus_wmi_evaluate_=
method3'
           return asus_wmi_evaluate_method3(method_id, arg0, arg1, 0, retva=
l);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/platform/x86/asus-wmi.c:285:6: note: Assuming 'status' is not eq=
ual to 0
           if (ACPI_FAILURE(status))
               ^
   include/acpi/acexcep.h:58:41: note: expanded from macro 'ACPI_FAILURE'
   #define ACPI_FAILURE(a)                 (a)
                                           ^~~
   drivers/platform/x86/asus-wmi.c:285:2: note: Taking true branch
           if (ACPI_FAILURE(status))
           ^
   drivers/platform/x86/asus-wmi.c:286:3: note: Returning without writing t=
o '*retval'
                   return -EIO;
                   ^
   drivers/platform/x86/asus-wmi.c:305:9: note: Returning from 'asus_wmi_ev=
aluate_method3'
           return asus_wmi_evaluate_method3(method_id, arg0, arg1, 0, retva=
l);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/platform/x86/asus-wmi.c:305:2: note: Returning without writing t=
o '*'
           return asus_wmi_evaluate_method3(method_id, arg0, arg1, 0, retva=
l);
           ^
   drivers/platform/x86/asus-wmi.c:437:9: note: Returning from 'asus_wmi_ev=
aluate_method'
           return asus_wmi_evaluate_method(asus->dsts_id, dev_id, 0, retval=
);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/asus-wmi.c:437:2: note: Returning without writing t=
o '*retval'
           return asus_wmi_evaluate_method(asus->dsts_id, dev_id, 0, retval=
);
           ^
   drivers/platform/x86/asus-wmi.c:2992:2: note: Returning from 'asus_wmi_g=
et_devstate'
           asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_FNLOCK, &result);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/asus-wmi.c:2994:17: note: The left operand of '&' i=
s a garbage value
           return (result & ASUS_WMI_DSTS_PRESENCE_BIT) &&
                   ~~~~~~ ^
   drivers/platform/x86/asus-wmi.c:3194:9: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", value);
                  ^~~~~~~
   drivers/platform/x86/asus-wmi.c:3194:9: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", value);
                  ^~~~~~~
   drivers/platform/x86/asus-wmi.c:3581:2: warning: Value stored to 'err' i=
s never read [clang-analyzer-deadcode.DeadStores]
           err =3D asus_wmi_fan_init(asus); /* probably no problems on erro=
r */
           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/asus-wmi.c:3581:2: note: Value stored to 'err' is n=
ever read
           err =3D asus_wmi_fan_init(asus); /* probably no problems on erro=
r */
           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/asus-wmi.c:3596:13: warning: The left operand of '&=
' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (result & (ASUS_WMI_DSTS_PRESENCE_BIT | ASUS_WMI_DSTS_USER_BI=
T))
                      ^
   drivers/platform/x86/asus-wmi.c:3791:6: note: Assuming the condition is =
false
           if (!wmi_has_guid(ASUS_WMI_MGMT_GUID)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/asus-wmi.c:3791:2: note: Taking false branch
           if (!wmi_has_guid(ASUS_WMI_MGMT_GUID)) {
           ^
   drivers/platform/x86/asus-wmi.c:3796:6: note: Assuming field 'event_guid=
' is null
           if (wdrv->event_guid && !wmi_has_guid(wdrv->event_guid)) {
               ^~~~~~~~~~~~~~~~
   drivers/platform/x86/asus-wmi.c:3796:23: note: Left side of '&&' is false
           if (wdrv->event_guid && !wmi_has_guid(wdrv->event_guid)) {
--
               ^~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/via/viafbdev.c:1796:2: note: Taking false branch
           if (viafb_SAMM_ON =3D=3D 1)
           ^
   drivers/video/fbdev/via/viafbdev.c:1801:19: note: Assigned value is garb=
age or undefined
           default_var.yres =3D default_yres;
                            ^ ~~~~~~~~~~~~
   drivers/video/fbdev/via/viafbdev.c:1818:3: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(viaparinfo1, viaparinfo, viafb_par_length);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/video/fbdev/via/viafbdev.c:1818:3: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(viaparinfo1, viaparinfo, viafb_par_length);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/video/fbdev/via/viafbdev.c:1833:3: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(viafbinfo1, viafbinfo, sizeof(struct fb_info));
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/video/fbdev/via/viafbdev.c:1833:3: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(viafbinfo1, viafbinfo, sizeof(struct fb_info));
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/cxl/core/mbox.c:276:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(out_cmd, &temp, sizeof(temp));
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/cxl/core/mbox.c:276:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(out_cmd, &temp, sizeof(temp));
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/cxl/core/mbox.c:310:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(out_cmd, c, sizeof(*c));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/cxl/core/mbox.c:310:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(out_cmd, c, sizeof(*c));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/cxl/core/mbox.c:324:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &cxlmd->dev;
                          ^~~   ~~~~~~~~~~~
   drivers/cxl/core/mbox.c:324:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D &cxlmd->dev;
                          ^~~   ~~~~~~~~~~~
   drivers/cxl/core/mbox.c:449:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &cxlmd->dev;
                          ^~~   ~~~~~~~~~~~
   drivers/cxl/core/mbox.c:449:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D &cxlmd->dev;
                          ^~~   ~~~~~~~~~~~
   drivers/cxl/core/mbox.c:580:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D cxlds->dev;
                          ^~~   ~~~~~~~~~~
   drivers/cxl/core/mbox.c:580:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D cxlds->dev;
                          ^~~   ~~~~~~~~~~
   drivers/cxl/core/mbox.c:708:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cxlds->firmware_version, id.fw_revision, sizeof(id.fw_rev=
ision));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/cxl/core/mbox.c:708:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(cxlds->firmware_version, id.fw_revision, sizeof(id.fw_rev=
ision));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   sound/isa/sb/sb16.c:351:2: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->shortname, chip->name);
           ^~~~~~
   sound/isa/sb/sb16.c:351:2: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
           strcpy(card->shortname, chip->name);
           ^~~~~~
>> sound/isa/sb/sb16.c:352:2: warning: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandli=
ng]
           sprintf(card->longname, "%s at 0x%lx, irq %i, dma ",
           ^~~~~~~
   sound/isa/sb/sb16.c:352:2: note: Call to function 'sprintf' is insecure =
as it does not provide bounding of the memory buffer or security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11
           sprintf(card->longname, "%s at 0x%lx, irq %i, dma ",
           ^~~~~~~
   sound/isa/sb/sb16.c:357:3: warning: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(card->longname + strlen(card->longname), "%d", x=
dma8);
                   ^~~~~~~
   sound/isa/sb/sb16.c:357:3: note: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11
                   sprintf(card->longname + strlen(card->longname), "%d", x=
dma8);
                   ^~~~~~~
   sound/isa/sb/sb16.c:359:3: warning: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandli=
ng]
                   sprintf(card->longname + strlen(card->longname), "%s%d",
                   ^~~~~~~
   sound/isa/sb/sb16.c:359:3: note: Call to function 'sprintf' is insecure =
as it does not provide bounding of the memory buffer or security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11
                   sprintf(card->longname + strlen(card->longname), "%s%d",
                   ^~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/scsi/sym53c8xx_2/sym_malloc.c:156:3: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(p, 0, size);
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/scsi/sym53c8xx_2/sym_malloc.c:156:3: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
                   memset(p, 0, size);
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/scsi/dc395x.c:702:2: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           list_for_each_entry(i, head, list)
           ^
   include/linux/list.h:640:13: note: expanded from macro 'list_for_each_en=
try'
                pos =3D list_next_entry(pos, member))
                      ^
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   drivers/scsi/dc395x.c:4656:2: note: Loop condition is false.  Exiting lo=
op
           dprintkdbg(DBG_0, "dc395x_remove_one: acb=3D%p\n", acb);
           ^
   drivers/scsi/dc395x.c:139:2: note: expanded from macro 'dprintkdbg'
           do {} while (0)
           ^
   drivers/scsi/dc395x.c:4659:2: note: Calling 'adapter_uninit'
           adapter_uninit(acb);
           ^~~~~~~~~~~~~~~~~~~
   drivers/scsi/dc395x.c:4408:2: note: Loop condition is false.  Exiting lo=
op
           DC395x_LOCK_IO(acb->scsi_host, flags);
           ^
   drivers/scsi/dc395x.c:153:36: note: expanded from macro 'DC395x_LOCK_IO'
   #define DC395x_LOCK_IO(dev,flags)               spin_lock_irqsave(((stru=
ct Scsi_Host *)dev)->host_lock, flags)
                                                   ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/scsi/dc395x.c:4408:2: note: Loop condition is false.  Exiting lo=
op
           DC395x_LOCK_IO(acb->scsi_host, flags);
           ^
   drivers/scsi/dc395x.c:153:36: note: expanded from macro 'DC395x_LOCK_IO'
   #define DC395x_LOCK_IO(dev,flags)               spin_lock_irqsave(((stru=
ct Scsi_Host *)dev)->host_lock, flags)
                                                   ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/scsi/dc395x.c:4411:2: note: Taking false branch
           if (timer_pending(&acb->waiting_timer))
           ^
   drivers/scsi/dc395x.c:4413:2: note: Taking true branch
           if (timer_pending(&acb->selto_timer))
           ^
   drivers/scsi/dc395x.c:4417:2: note: Calling 'adapter_remove_and_free_all=
_devices'
           adapter_remove_and_free_all_devices(acb);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/dc395x.c:3703:2: note: Loop condition is false.  Exiting lo=
op
           dprintkdbg(DBG_1, "adapter_remove_and_free_all_devices: num=3D%i=
\n",
           ^
   drivers/scsi/dc395x.c:139:2: note: expanded from macro 'dprintkdbg'
           do {} while (0)
--
                               ^~~~~~~~~~~~~~~~
   drivers/scsi/pm8001/pm8001_hwi.c:5008:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(&payload, 0, sizeof(payload));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 46 warnings (46 in non-user code).
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
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   drivers/spmi/hisi-spmi-controller.c:166:4: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(buf, &data, sizeof(data));
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/spmi/hisi-spmi-controller.c:166:4: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(buf, &data, sizeof(data));
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/spmi/hisi-spmi-controller.c:169:4: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(buf, &data, bc % SPMI_PER_DATAREG_BYTE);
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/spmi/hisi-spmi-controller.c:169:4: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(buf, &data, bc % SPMI_PER_DATAREG_BYTE);
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/spmi/hisi-spmi-controller.c:232:4: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&data, buf, sizeof(data));
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/spmi/hisi-spmi-controller.c:232:4: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&data, buf, sizeof(data));
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/spmi/hisi-spmi-controller.c:235:4: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&data, buf, bc % SPMI_PER_DATAREG_BYTE);
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/spmi/hisi-spmi-controller.c:235:4: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&data, buf, bc % SPMI_PER_DATAREG_BYTE);
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   sound/usb/usx2y/usbusx2y.c:191:4: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(usx2y->in04_last, usx2y->in04_buf, sizeof=
(usx2y->in04_last));
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   sound/usb/usx2y/usbusx2y.c:191:4: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                           memcpy(usx2y->in04_last, usx2y->in04_buf, sizeof=
(usx2y->in04_last));
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   sound/usb/usx2y/usbusx2y.c:206:4: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(us428ctls->ctl_snapshot + n, usx2y->in04_=
buf, sizeof(us428ctls->ctl_snapshot[0]));
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   sound/usb/usx2y/usbusx2y.c:206:4: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                           memcpy(us428ctls->ctl_snapshot + n, usx2y->in04_=
buf, sizeof(us428ctls->ctl_snapshot[0]));
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   sound/usb/usx2y/usbusx2y.c:381:2: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(card->shortname, "TASCAM "NAME_ALLCAPS"");
           ^~~~~~~
   sound/usb/usx2y/usbusx2y.c:381:2: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           sprintf(card->shortname, "TASCAM "NAME_ALLCAPS"");
           ^~~~~~~
>> sound/usb/usx2y/usbusx2y.c:382:2: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
           sprintf(card->longname, "%s (%x:%x if %d at %03d/%03d)",
           ^~~~~~~
   sound/usb/usx2y/usbusx2y.c:382:2: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
           sprintf(card->longname, "%s (%x:%x if %d at %03d/%03d)",
           ^~~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/mmc/host/cqhci-core.c:75:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(link_temp, 0, cq_host->link_desc_len);
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/mmc/host/cqhci-core.c:75:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(link_temp, 0, cq_host->link_desc_len);
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/mmc/host/cqhci-core.c:557:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(task_desc, 0, cq_host->task_desc_len);
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/mmc/host/cqhci-core.c:557:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(task_desc, 0, cq_host->task_desc_len);
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/memstick/core/memstick.c:155:1: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MEMSTICK_ATTR(type, "%02X");
   ^
   drivers/memstick/core/memstick.c:151:9: note: expanded from macro 'MEMST=
ICK_ATTR'
           return sprintf(buf, format, card->id.name);                     =
      \
                  ^~~~~~~
   drivers/memstick/core/memstick.c:155:1: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
   MEMSTICK_ATTR(type, "%02X");
   ^
   drivers/memstick/core/memstick.c:151:9: note: expanded from macro 'MEMST=
ICK_ATTR'
           return sprintf(buf, format, card->id.name);                     =
      \
                  ^~~~~~~
   drivers/memstick/core/memstick.c:156:1: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MEMSTICK_ATTR(category, "%02X");
   ^
   drivers/memstick/core/memstick.c:151:9: note: expanded from macro 'MEMST=
ICK_ATTR'
           return sprintf(buf, format, card->id.name);                     =
      \
                  ^~~~~~~
   drivers/memstick/core/memstick.c:156:1: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
   MEMSTICK_ATTR(category, "%02X");
   ^
   drivers/memstick/core/memstick.c:151:9: note: expanded from macro 'MEMST=
ICK_ATTR'
           return sprintf(buf, format, card->id.name);                     =
      \
                  ^~~~~~~
   drivers/memstick/core/memstick.c:157:1: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MEMSTICK_ATTR(class, "%02X");
   ^
   drivers/memstick/core/memstick.c:151:9: note: expanded from macro 'MEMST=
ICK_ATTR'
           return sprintf(buf, format, card->id.name);                     =
      \
                  ^~~~~~~
   drivers/memstick/core/memstick.c:157:1: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
   MEMSTICK_ATTR(class, "%02X");
   ^
   drivers/memstick/core/memstick.c:151:9: note: expanded from macro 'MEMST=
ICK_ATTR'
           return sprintf(buf, format, card->id.name);                     =
      \
                  ^~~~~~~
   drivers/memstick/core/memstick.c:305:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(mrq->data, buf, mrq->data_len);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/memstick/core/memstick.c:305:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(mrq->data, buf, mrq->data_len);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/memstick/core/memstick.c:335:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&id_reg, (*mrq)->data, sizeof(id_reg));
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/memstick/core/memstick.c:335:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&id_reg, (*mrq)->data, sizeof(id_reg));
--
                           ^~~~~~~~~~~~~~~~
   sound/usb/caiaq/device.c:228:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(cdev->ep1_out_buf+2, buffer, len);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   sound/usb/caiaq/device.c:242:17: warning: Value stored to 'dev' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/device.c:242:17: note: Value stored to 'dev' during its =
initialization is never read
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/device.c:477:3: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(id, 0, sizeof(id));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   sound/usb/caiaq/device.c:477:3: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                   memset(id, 0, sizeof(id));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   sound/usb/caiaq/device.c:488:2: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(card->longname, sizeof(card->longname), "%s %s (%s)",
           ^~~~~~~~
   sound/usb/caiaq/device.c:488:2: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
           snprintf(card->longname, sizeof(card->longname), "%s %s (%s)",
           ^~~~~~~~
   sound/usb/caiaq/device.c:525:17: warning: Value stored to 'dev' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D intf->usb_dev;
                          ^~~   ~~~~~~~~~~~~~
   sound/usb/caiaq/device.c:525:17: note: Value stored to 'dev' during its =
initialization is never read
           struct device *dev =3D intf->usb_dev;
                          ^~~   ~~~~~~~~~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   drivers/platform/x86/dell/dell-laptop.c:345:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buffer, 0, sizeof(struct calling_interface_buffer));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/platform/x86/dell/dell-laptop.c:345:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(buffer, 0, sizeof(struct calling_interface_buffer));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/platform/x86/dell/dell-laptop.c:1549:8: warning: Call to functio=
n 'sscanf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'sscanf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(buf, "%d %c", &value, &ch);
                 ^~~~~~
   drivers/platform/x86/dell/dell-laptop.c:1549:8: note: Call to function '=
sscanf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(buf, "%d %c", &value, &ch);
                 ^~~~~~
   drivers/platform/x86/dell/dell-laptop.c:1599:4: warning: Value stored to=
 'unit' is never read [clang-analyzer-deadcode.DeadStores]
                           unit =3D KBD_TIMEOUT_SECONDS;
                           ^      ~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/dell/dell-laptop.c:1599:4: note: Value stored to 'u=
nit' is never read
                           unit =3D KBD_TIMEOUT_SECONDS;
                           ^      ~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/dell/dell-laptop.c:1674:8: warning: Call to functio=
n 'sprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'sprintf_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D sprintf(buf, "%d", value);
                 ^~~~~~~
   drivers/platform/x86/dell/dell-laptop.c:1674:8: note: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11
           len =3D sprintf(buf, "%d", value);
                 ^~~~~~~
   drivers/platform/x86/dell/dell-laptop.c:1678:16: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return len + sprintf(buf+len, "s\n");
                                ^~~~~~~
   drivers/platform/x86/dell/dell-laptop.c:1678:16: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                   return len + sprintf(buf+len, "s\n");
                                ^~~~~~~
   drivers/platform/x86/dell/dell-laptop.c:1680:16: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return len + sprintf(buf+len, "m\n");
                                ^~~~~~~
   drivers/platform/x86/dell/dell-laptop.c:1680:16: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                   return len + sprintf(buf+len, "m\n");
                                ^~~~~~~
   drivers/platform/x86/dell/dell-laptop.c:1682:16: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return len + sprintf(buf+len, "h\n");
                                ^~~~~~~
   drivers/platform/x86/dell/dell-laptop.c:1682:16: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                   return len + sprintf(buf+len, "h\n");
                                ^~~~~~~
   drivers/platform/x86/dell/dell-laptop.c:1684:16: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return len + sprintf(buf+len, "d\n");
                                ^~~~~~~
   drivers/platform/x86/dell/dell-laptop.c:1684:16: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                   return len + sprintf(buf+len, "d\n");
                                ^~~~~~~
   drivers/platform/x86/dell/dell-laptop.c:1713:8: warning: Call to functio=
n 'sscanf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'sscanf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(buf, "%20s", trigger);
                 ^~~~~~
   drivers/platform/x86/dell/dell-laptop.c:1713:8: note: Call to function '=
sscanf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(buf, "%20s", trigger);
                 ^~~~~~
>> drivers/platform/x86/dell/dell-laptop.c:1823:11: warning: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecat=
edOrUnsafeBufferHandling]
                           len +=3D sprintf(buf+len, "%s ", kbd_led_trigger=
s[i]);
                                  ^~~~~~~
   drivers/platform/x86/dell/dell-laptop.c:1823:11: note: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11
                           len +=3D sprintf(buf+len, "%s ", kbd_led_trigger=
s[i]);
                                  ^~~~~~~
   drivers/platform/x86/dell/dell-laptop.c:1908:9: warning: Call to functio=
n 'sprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'sprintf_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", enabled ? 1 : 0);
                  ^~~~~~~
   drivers/platform/x86/dell/dell-laptop.c:1908:9: note: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", enabled ? 1 : 0);
                  ^~~~~~~
   drivers/platform/x86/dell/dell-laptop.c:1957:9: warning: Call to functio=
n 'sprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'sprintf_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", state.als_setting);
                  ^~~~~~~
   drivers/platform/x86/dell/dell-laptop.c:1957:9: note: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", state.als_setting);
                  ^~~~~~~
   drivers/platform/x86/dell/dell-laptop.c:2236:3: warning: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&props, 0, sizeof(struct backlight_properties));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/platform/x86/dell/dell-laptop.c:2236:3: note: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11
                   memset(&props, 0, sizeof(struct backlight_properties));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   sound/pci/lola/lola_mixer.c:480:15: warning: Division by zero [clang-ana=
lyzer-core.DivideZero]
                   int src =3D i % chip->mixer.src_phys_ins;
                               ^
   sound/pci/lola/lola_mixer.c:834:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   sound/pci/lola/lola_mixer.c:834:2: note: Taking false branch
           if (err < 0)
           ^
   sound/pci/lola/lola_mixer.c:836:8: note: Calling 'create_analog_mixer'
           err =3D create_analog_mixer(chip, CAPT, "Analog Capture Volume");
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/lola/lola_mixer.c:583:6: note: Assuming field 'num_pins' is 0
           if (!chip->pin[dir].num_pins)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/lola/lola_mixer.c:583:2: note: Taking true branch
           if (!chip->pin[dir].num_pins)
           ^
   sound/pci/lola/lola_mixer.c:584:3: note: Returning without writing to 'c=
hip->mixer.src_phys_ins'
                   return 0;
                   ^
   sound/pci/lola/lola_mixer.c:836:8: note: Returning from 'create_analog_m=
ixer'
           err =3D create_analog_mixer(chip, CAPT, "Analog Capture Volume");
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/lola/lola_mixer.c:837:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   sound/pci/lola/lola_mixer.c:837:2: note: Taking false branch
           if (err < 0)
           ^
   sound/pci/lola/lola_mixer.c:839:8: note: Calling 'create_input_src_mixer'
           err =3D create_input_src_mixer(chip);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/lola/lola_mixer.c:649:6: note: Assuming field 'input_src_caps_=
mask' is 0
           if (!chip->input_src_caps_mask)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/lola/lola_mixer.c:649:2: note: Taking true branch
           if (!chip->input_src_caps_mask)
           ^
   sound/pci/lola/lola_mixer.c:650:3: note: Returning without writing to 'c=
hip->mixer.src_phys_ins'
                   return 0;
                   ^
   sound/pci/lola/lola_mixer.c:839:8: note: Returning from 'create_input_sr=
c_mixer'
           err =3D create_input_src_mixer(chip);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/lola/lola_mixer.c:840:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   sound/pci/lola/lola_mixer.c:840:2: note: Taking false branch
           if (err < 0)
           ^
   sound/pci/lola/lola_mixer.c:844:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   sound/pci/lola/lola_mixer.c:844:2: note: Taking false branch
           if (err < 0)
           ^
   sound/pci/lola/lola_mixer.c:849:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   sound/pci/lola/lola_mixer.c:849:2: note: Taking false branch
           if (err < 0)
           ^
   sound/pci/lola/lola_mixer.c:882:9: note: Calling 'init_mixer_values'
           return init_mixer_values(chip);
--
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/scsi/ppa.c:1033:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&ppa_cb, 0, sizeof(ppa_cb));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   arch/x86/include/asm/paravirt.h:55:2: warning: Assigned value is garbage=
 or undefined [clang-analyzer-core.uninitialized.Assign]
           PVOP_VCALL0(cpu.io_delay);
           ^
   arch/x86/include/asm/paravirt_types.h:512:2: note: expanded from macro '=
PVOP_VCALL0'
           __PVOP_VCALL(op)
           ^
   arch/x86/include/asm/paravirt_types.h:492:8: note: expanded from macro '=
__PVOP_VCALL'
           (void)____PVOP_CALL(, op, CLBR_ANY, PVOP_VCALL_CLOBBERS,        \
                 ^
   arch/x86/include/asm/paravirt_types.h:447:3: note: expanded from macro '=
____PVOP_CALL'
                   PVOP_CALL_ARGS;                                         \
                   ^
   arch/x86/include/asm/paravirt_types.h:387:16: note: expanded from macro =
'PVOP_CALL_ARGS'
           unsigned long __eax =3D __eax, __edx =3D __edx, __ecx =3D __ecx;
                         ^
   drivers/scsi/imm.c:592:6: note: Calling 'imm_connect'
           if (imm_connect(dev, 0) !=3D 1)
               ^~~~~~~~~~~~~~~~~~~
   drivers/scsi/imm.c:526:2: note: Calling 'imm_cpp'
           imm_cpp(ppb, 0xe0);     /* Select device 0 in compatible mode */
           ^~~~~~~~~~~~~~~~~~
   drivers/scsi/imm.c:460:2: note: Calling 'outb_p'
           w_ctr(ppb, 0x0c);
           ^
   drivers/scsi/imm.h:137:25: note: expanded from macro 'w_ctr'
   #define w_ctr(x,y)      outb_p(y, (x)+2)
                           ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/io.h:337:16: note: expanded from macro 'outb_p'
   #define outb_p outb_p
                  ^
   arch/x86/include/asm/io.h:320:1: note: Calling 'slow_down_io'
   BUILDIO(b, b, char)
   ^
   arch/x86/include/asm/io.h:278:2: note: expanded from macro 'BUILDIO'
           slow_down_io();                                                 \
           ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:55:2: note: Assigned value is garbage or=
 undefined
           PVOP_VCALL0(cpu.io_delay);
           ^
   arch/x86/include/asm/paravirt_types.h:512:2: note: expanded from macro '=
PVOP_VCALL0'
           __PVOP_VCALL(op)
           ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:492:8: note: expanded from macro '=
__PVOP_VCALL'
           (void)____PVOP_CALL(, op, CLBR_ANY, PVOP_VCALL_CLOBBERS,        \
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:447:3: note: expanded from macro '=
____PVOP_CALL'
                   PVOP_CALL_ARGS;                                         \
                   ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:387:16: note: expanded from macro =
'PVOP_CALL_ARGS'
           unsigned long __eax =3D __eax, __edx =3D __edx, __ecx =3D __ecx;
                         ^       ~~~~~
   drivers/scsi/imm.c:1170:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&imm_cb, 0, sizeof(imm_cb));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/scsi/imm.c:1170:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&imm_cb, 0, sizeof(imm_cb));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   sound/pci/cs4281.c:1076:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ac97, 0, sizeof(ac97));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   sound/pci/cs4281.c:1076:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&ac97, 0, sizeof(ac97));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
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
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
>> sound/pci/cs5530.c:213:2: warning: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
           sprintf(card->longname, "%s at 0x%lx", card->shortname, chip->pc=
i_base);
           ^~~~~~~
   sound/pci/cs5530.c:213:2: note: Call to function 'sprintf' is insecure a=
s it does not provide bounding of the memory buffer or security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
           sprintf(card->longname, "%s at 0x%lx", card->shortname, chip->pc=
i_base);
           ^~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   sound/pci/intel8x0.c:1440:3: warning: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHand=
ling]
                   sprintf(name, "Intel ICH - %s", rec->suffix);
                   ^~~~~~~
   sound/pci/intel8x0.c:1440:3: note: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11
                   sprintf(name, "Intel ICH - %s", rec->suffix);
                   ^~~~~~~
   sound/pci/intel8x0.c:1457:3: warning: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHand=
ling]
                   sprintf(pcm->name, "%s - %s", chip->card->shortname, rec=
->suffix);
                   ^~~~~~~
   sound/pci/intel8x0.c:1457:3: note: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11
                   sprintf(pcm->name, "%s - %s", chip->card->shortname, rec=
->suffix);
                   ^~~~~~~
   sound/pci/intel8x0.c:1459:3: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(pcm->name, chip->card->shortname);
                   ^~~~~~
   sound/pci/intel8x0.c:1459:3: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
                   strcpy(pcm->name, chip->card->shortname);
                   ^~~~~~
   sound/pci/intel8x0.c:2155:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ac97, 0, sizeof(ac97));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   sound/pci/intel8x0.c:2155:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(&ac97, 0, sizeof(ac97));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   sound/pci/intel8x0.c:2255:29: warning: Access to field 'num' results in =
a dereference of a null pointer [clang-analyzer-core.NullDereference]
                                           tmp |=3D chip->ac97_sdin[pcm->r[=
0].codec[1]->num] << ICH_DI2L_SHIFT;
                                                                  ^
   sound/pci/intel8x0.c:3122:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   sound/pci/intel8x0.c:3122:2: note: Taking false branch
           if (err < 0)
           ^
   sound/pci/intel8x0.c:3126:6: note: Assuming 'spdif_aclink' is >=3D 0
           if (spdif_aclink < 0)
               ^~~~~~~~~~~~~~~~
   sound/pci/intel8x0.c:3126:2: note: Taking false branch
           if (spdif_aclink < 0)
           ^
   sound/pci/intel8x0.c:3130:6: note: Assuming 'spdif_aclink' is not equal =
to 0
           if (!spdif_aclink) {
               ^~~~~~~~~~~~~
   sound/pci/intel8x0.c:3130:2: note: Taking false branch
           if (!spdif_aclink) {
           ^
   sound/pci/intel8x0.c:3141:2: note: Loop condition is false. Execution co=
ntinues on line 3148
           for (name =3D shortnames; name->id; name++) {
           ^
   sound/pci/intel8x0.c:3148:6: note: Assuming 'buggy_irq' is >=3D 0
           if (buggy_irq < 0) {
               ^~~~~~~~~~~~~
   sound/pci/intel8x0.c:3148:2: note: Taking false branch
           if (buggy_irq < 0) {
           ^
   sound/pci/intel8x0.c:3159:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   sound/pci/intel8x0.c:3159:2: note: Taking false branch
           if (err < 0)
           ^
   sound/pci/intel8x0.c:3162:8: note: Calling 'snd_intel8x0_mixer'
           err =3D snd_intel8x0_mixer(chip, ac97_clock, ac97_quirk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/intel8x0.c:2139:6: note: Assuming 'spdif_aclink' is not equal =
to 0
           if (!spdif_aclink) {
               ^~~~~~~~~~~~~
   sound/pci/intel8x0.c:2139:2: note: Taking false branch
           if (!spdif_aclink) {
           ^
   sound/pci/intel8x0.c:2159:6: note: Assuming field 'xbox' is 0
           if (chip->xbox)
               ^~~~~~~~~~
   sound/pci/intel8x0.c:2159:2: note: Taking false branch
           if (chip->xbox)
           ^
   sound/pci/intel8x0.c:2161:6: note: Assuming field 'device_type' is not e=
qual to DEVICE_ALI
           if (chip->device_type !=3D DEVICE_ALI) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/intel8x0.c:2161:2: note: Taking true branch
           if (chip->device_type !=3D DEVICE_ALI) {
           ^
   sound/pci/intel8x0.c:2166:15: note: Assuming 'i' is >=3D field 'max_code=
cs'
                   for (i =3D 0; i < chip->max_codecs; i++) {
                               ^~~~~~~~~~~~~~~~~~~~
   sound/pci/intel8x0.c:2166:3: note: Loop condition is false. Execution co=
ntinues on line 2179
                   for (i =3D 0; i < chip->max_codecs; i++) {

vim +1939 drivers/platform/x86/asus-wmi.c

53e755c21afc23 Kast Bernd    2015-05-13  1818  =

53e755c21afc23 Kast Bernd    2015-05-13  1819  static ssize_t fan1_input_sh=
ow(struct device *dev,
53e755c21afc23 Kast Bernd    2015-05-13  1820  					struct device_attribute=
 *attr,
53e755c21afc23 Kast Bernd    2015-05-13  1821  					char *buf)
53e755c21afc23 Kast Bernd    2015-05-13  1822  {
2889ffcfc2522d Daniel Drake  2019-07-29  1823  	struct asus_wmi *asus =3D d=
ev_get_drvdata(dev);
2889ffcfc2522d Daniel Drake  2019-07-29  1824  	int value;
2889ffcfc2522d Daniel Drake  2019-07-29  1825  	int ret;
53e755c21afc23 Kast Bernd    2015-05-13  1826  =

e3168b874321d0 Daniel Drake  2019-07-29  1827  	switch (asus->fan_type) {
e3168b874321d0 Daniel Drake  2019-07-29  1828  	case FAN_TYPE_SPEC83:
e3168b874321d0 Daniel Drake  2019-07-29  1829  		ret =3D asus_wmi_get_devst=
ate(asus, ASUS_WMI_DEVID_CPU_FAN_CTRL,
e3168b874321d0 Daniel Drake  2019-07-29  1830  					    &value);
e3168b874321d0 Daniel Drake  2019-07-29  1831  		if (ret < 0)
e3168b874321d0 Daniel Drake  2019-07-29  1832  			return ret;
e3168b874321d0 Daniel Drake  2019-07-29  1833  =

e3168b874321d0 Daniel Drake  2019-07-29  1834  		value &=3D 0xffff;
e3168b874321d0 Daniel Drake  2019-07-29  1835  		break;
e3168b874321d0 Daniel Drake  2019-07-29  1836  =

e3168b874321d0 Daniel Drake  2019-07-29  1837  	case FAN_TYPE_AGFN:
2889ffcfc2522d Daniel Drake  2019-07-29  1838  		/* no speed readable on ma=
nual mode */
2889ffcfc2522d Daniel Drake  2019-07-29  1839  		if (asus->fan_pwm_mode =3D=
=3D ASUS_FAN_CTRL_MANUAL)
2889ffcfc2522d Daniel Drake  2019-07-29  1840  			return -ENXIO;
53e755c21afc23 Kast Bernd    2015-05-13  1841  =

2889ffcfc2522d Daniel Drake  2019-07-29  1842  		ret =3D asus_agfn_fan_spee=
d_read(asus, 1, &value);
2889ffcfc2522d Daniel Drake  2019-07-29  1843  		if (ret) {
2889ffcfc2522d Daniel Drake  2019-07-29  1844  			pr_warn("reading fan spee=
d failed: %d\n", ret);
2889ffcfc2522d Daniel Drake  2019-07-29  1845  			return -ENXIO;
2889ffcfc2522d Daniel Drake  2019-07-29  1846  		}
e3168b874321d0 Daniel Drake  2019-07-29  1847  		break;
e3168b874321d0 Daniel Drake  2019-07-29  1848  =

e3168b874321d0 Daniel Drake  2019-07-29  1849  	default:
e3168b874321d0 Daniel Drake  2019-07-29  1850  		return -ENXIO;
e3168b874321d0 Daniel Drake  2019-07-29  1851  	}
2889ffcfc2522d Daniel Drake  2019-07-29  1852  =

2889ffcfc2522d Daniel Drake  2019-07-29 @1853  	return sprintf(buf, "%d\n",=
 value < 0 ? -1 : value*100);
53e755c21afc23 Kast Bernd    2015-05-13  1854  }
53e755c21afc23 Kast Bernd    2015-05-13  1855  =

53e755c21afc23 Kast Bernd    2015-05-13  1856  static ssize_t pwm1_enable_s=
how(struct device *dev,
53e755c21afc23 Kast Bernd    2015-05-13  1857  						 struct device_attribu=
te *attr,
53e755c21afc23 Kast Bernd    2015-05-13  1858  						 char *buf)
53e755c21afc23 Kast Bernd    2015-05-13  1859  {
53e755c21afc23 Kast Bernd    2015-05-13  1860  	struct asus_wmi *asus =3D d=
ev_get_drvdata(dev);
53e755c21afc23 Kast Bernd    2015-05-13  1861  =

e3168b874321d0 Daniel Drake  2019-07-29  1862  	/*
e3168b874321d0 Daniel Drake  2019-07-29  1863  	 * Just read back the cache=
d pwm mode.
e3168b874321d0 Daniel Drake  2019-07-29  1864  	 *
e3168b874321d0 Daniel Drake  2019-07-29  1865  	 * For the CPU_FAN device, =
the spec indicates that we should be
e3168b874321d0 Daniel Drake  2019-07-29  1866  	 * able to read the device =
status and consult bit 19 to see if we
e3168b874321d0 Daniel Drake  2019-07-29  1867  	 * are in Full On or Automa=
tic mode. However, this does not work
e3168b874321d0 Daniel Drake  2019-07-29  1868  	 * in practice on X532FL at=
 least (the bit is always 0) and there's
e3168b874321d0 Daniel Drake  2019-07-29  1869  	 * also nothing in the DSDT=
 to indicate that this behaviour exists.
e3168b874321d0 Daniel Drake  2019-07-29  1870  	 */
2889ffcfc2522d Daniel Drake  2019-07-29  1871  	return sprintf(buf, "%d\n",=
 asus->fan_pwm_mode);
53e755c21afc23 Kast Bernd    2015-05-13  1872  }
53e755c21afc23 Kast Bernd    2015-05-13  1873  =

53e755c21afc23 Kast Bernd    2015-05-13  1874  static ssize_t pwm1_enable_s=
tore(struct device *dev,
53e755c21afc23 Kast Bernd    2015-05-13  1875  						  struct device_attrib=
ute *attr,
53e755c21afc23 Kast Bernd    2015-05-13  1876  						  const char *buf, siz=
e_t count)
53e755c21afc23 Kast Bernd    2015-05-13  1877  {
53e755c21afc23 Kast Bernd    2015-05-13  1878  	struct asus_wmi *asus =3D d=
ev_get_drvdata(dev);
53e755c21afc23 Kast Bernd    2015-05-13  1879  	int status =3D 0;
53e755c21afc23 Kast Bernd    2015-05-13  1880  	int state;
e3168b874321d0 Daniel Drake  2019-07-29  1881  	int value;
53e755c21afc23 Kast Bernd    2015-05-13  1882  	int ret;
e3168b874321d0 Daniel Drake  2019-07-29  1883  	u32 retval;
53e755c21afc23 Kast Bernd    2015-05-13  1884  =

53e755c21afc23 Kast Bernd    2015-05-13  1885  	ret =3D kstrtouint(buf, 10,=
 &state);
53e755c21afc23 Kast Bernd    2015-05-13  1886  	if (ret)
53e755c21afc23 Kast Bernd    2015-05-13  1887  		return ret;
53e755c21afc23 Kast Bernd    2015-05-13  1888  =

e3168b874321d0 Daniel Drake  2019-07-29  1889  	if (asus->fan_type =3D=3D F=
AN_TYPE_SPEC83) {
e3168b874321d0 Daniel Drake  2019-07-29  1890  		switch (state) { /* standa=
rd documented hwmon values */
e3168b874321d0 Daniel Drake  2019-07-29  1891  		case ASUS_FAN_CTRL_FULLSPE=
ED:
e3168b874321d0 Daniel Drake  2019-07-29  1892  			value =3D 1;
e3168b874321d0 Daniel Drake  2019-07-29  1893  			break;
e3168b874321d0 Daniel Drake  2019-07-29  1894  		case ASUS_FAN_CTRL_AUTO:
e3168b874321d0 Daniel Drake  2019-07-29  1895  			value =3D 0;
e3168b874321d0 Daniel Drake  2019-07-29  1896  			break;
e3168b874321d0 Daniel Drake  2019-07-29  1897  		default:
e3168b874321d0 Daniel Drake  2019-07-29  1898  			return -EINVAL;
e3168b874321d0 Daniel Drake  2019-07-29  1899  		}
e3168b874321d0 Daniel Drake  2019-07-29  1900  =

e3168b874321d0 Daniel Drake  2019-07-29  1901  		ret =3D asus_wmi_set_devst=
ate(ASUS_WMI_DEVID_CPU_FAN_CTRL,
e3168b874321d0 Daniel Drake  2019-07-29  1902  					    value, &retval);
e3168b874321d0 Daniel Drake  2019-07-29  1903  		if (ret)
e3168b874321d0 Daniel Drake  2019-07-29  1904  			return ret;
e3168b874321d0 Daniel Drake  2019-07-29  1905  =

e3168b874321d0 Daniel Drake  2019-07-29  1906  		if (retval !=3D 1)
e3168b874321d0 Daniel Drake  2019-07-29  1907  			return -EIO;
e3168b874321d0 Daniel Drake  2019-07-29  1908  	} else if (asus->fan_type =
=3D=3D FAN_TYPE_AGFN) {
2889ffcfc2522d Daniel Drake  2019-07-29  1909  		switch (state) {
2889ffcfc2522d Daniel Drake  2019-07-29  1910  		case ASUS_FAN_CTRL_MANUAL:
2889ffcfc2522d Daniel Drake  2019-07-29  1911  			break;
53e755c21afc23 Kast Bernd    2015-05-13  1912  =

2889ffcfc2522d Daniel Drake  2019-07-29  1913  		case ASUS_FAN_CTRL_AUTO:
2889ffcfc2522d Daniel Drake  2019-07-29  1914  			status =3D asus_fan_set_a=
uto(asus);
53e755c21afc23 Kast Bernd    2015-05-13  1915  			if (status)
53e755c21afc23 Kast Bernd    2015-05-13  1916  				return status;
2889ffcfc2522d Daniel Drake  2019-07-29  1917  			break;
53e755c21afc23 Kast Bernd    2015-05-13  1918  =

2889ffcfc2522d Daniel Drake  2019-07-29  1919  		default:
2889ffcfc2522d Daniel Drake  2019-07-29  1920  			return -EINVAL;
2889ffcfc2522d Daniel Drake  2019-07-29  1921  		}
e3168b874321d0 Daniel Drake  2019-07-29  1922  	}
2889ffcfc2522d Daniel Drake  2019-07-29  1923  =

2889ffcfc2522d Daniel Drake  2019-07-29  1924  	asus->fan_pwm_mode =3D stat=
e;
0f0ac158d28ff7 Luke D. Jones 2021-10-24  1925  =

0f0ac158d28ff7 Luke D. Jones 2021-10-24  1926  	/* Must set to disabled if =
mode is toggled */
0f0ac158d28ff7 Luke D. Jones 2021-10-24  1927  	if (asus->cpu_fan_curve_ava=
ilable)
0f0ac158d28ff7 Luke D. Jones 2021-10-24  1928  		asus->custom_fan_curves[FA=
N_CURVE_DEV_CPU].enabled =3D false;
0f0ac158d28ff7 Luke D. Jones 2021-10-24  1929  	if (asus->gpu_fan_curve_ava=
ilable)
0f0ac158d28ff7 Luke D. Jones 2021-10-24  1930  		asus->custom_fan_curves[FA=
N_CURVE_DEV_GPU].enabled =3D false;
0f0ac158d28ff7 Luke D. Jones 2021-10-24  1931  =

53e755c21afc23 Kast Bernd    2015-05-13  1932  	return count;
53e755c21afc23 Kast Bernd    2015-05-13  1933  }
53e755c21afc23 Kast Bernd    2015-05-13  1934  =

53e755c21afc23 Kast Bernd    2015-05-13  1935  static ssize_t fan1_label_sh=
ow(struct device *dev,
53e755c21afc23 Kast Bernd    2015-05-13  1936  					  struct device_attribu=
te *attr,
53e755c21afc23 Kast Bernd    2015-05-13  1937  					  char *buf)
53e755c21afc23 Kast Bernd    2015-05-13  1938  {
53e755c21afc23 Kast Bernd    2015-05-13 @1939  	return sprintf(buf, "%s\n",=
 ASUS_FAN_DESC);
53e755c21afc23 Kast Bernd    2015-05-13  1940  }
53e755c21afc23 Kast Bernd    2015-05-13  1941  =


:::::: The code at line 1939 was first introduced by commit
:::::: 53e755c21afc230dd93fddda5a2db9609e6f07d0 asus-wmi: add fan control

:::::: TO: Kast Bernd <kastbernd@gmx.de>
:::::: CC: Darren Hart <dvhart@linux.intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4513738769160965590==--

