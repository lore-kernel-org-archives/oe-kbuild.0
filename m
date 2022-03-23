Content-Type: multipart/mixed; boundary="===============6819019860460868931=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 11483/14268] drivers/usb/gadget/configfs.c:237:8: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or ...
Date: Thu, 24 Mar 2022 07:08:19 +0800
Message-ID: <202203240645.hQfWCNUL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6819019860460868931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   b61581ae229d8eb9f21f8753be3f4011f7692384
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 [11483/14268] Kbuild: move=
 to -std=3Dgnu11
:::::: branch date: 15 hours ago
:::::: commit date: 11 days ago
config: riscv-randconfig-c006-20220323 (https://download.01.org/0day-ci/arc=
hive/20220324/202203240645.hQfWCNUL-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 902f47=
08fe1d03b0de7e5315ef875006a6adc319)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   ^
   drivers/usb/gadget/configfs.c:170:2: note: expanded from macro 'GI_DEVIC=
E_DESC_SIMPLE_RW'
           GI_DEVICE_DESC_SIMPLE_R_##_type(_name)  \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   drivers/usb/gadget/configfs.c:130:9: note: expanded from macro 'GI_DEVIC=
E_DESC_SIMPLE_R_u8'
           return sprintf(page, "0x%02x\n", \
                  ^~~~~~~
   drivers/usb/gadget/configfs.c:176:1: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   GI_DEVICE_DESC_SIMPLE_RW(bDeviceProtocol, u8);
   ^
   drivers/usb/gadget/configfs.c:170:2: note: expanded from macro 'GI_DEVIC=
E_DESC_SIMPLE_RW'
           GI_DEVICE_DESC_SIMPLE_R_##_type(_name)  \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   drivers/usb/gadget/configfs.c:130:9: note: expanded from macro 'GI_DEVIC=
E_DESC_SIMPLE_R_u8'
           return sprintf(page, "0x%02x\n", \
                  ^~~~~~~
   drivers/usb/gadget/configfs.c:176:1: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
   GI_DEVICE_DESC_SIMPLE_RW(bDeviceProtocol, u8);
   ^
   drivers/usb/gadget/configfs.c:170:2: note: expanded from macro 'GI_DEVIC=
E_DESC_SIMPLE_RW'
           GI_DEVICE_DESC_SIMPLE_R_##_type(_name)  \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   drivers/usb/gadget/configfs.c:130:9: note: expanded from macro 'GI_DEVIC=
E_DESC_SIMPLE_R_u8'
           return sprintf(page, "0x%02x\n", \
                  ^~~~~~~
   drivers/usb/gadget/configfs.c:177:1: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   GI_DEVICE_DESC_SIMPLE_RW(bMaxPacketSize0, u8);
   ^
   drivers/usb/gadget/configfs.c:170:2: note: expanded from macro 'GI_DEVIC=
E_DESC_SIMPLE_RW'
           GI_DEVICE_DESC_SIMPLE_R_##_type(_name)  \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   drivers/usb/gadget/configfs.c:130:9: note: expanded from macro 'GI_DEVIC=
E_DESC_SIMPLE_R_u8'
           return sprintf(page, "0x%02x\n", \
                  ^~~~~~~
   drivers/usb/gadget/configfs.c:177:1: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
   GI_DEVICE_DESC_SIMPLE_RW(bMaxPacketSize0, u8);
   ^
   drivers/usb/gadget/configfs.c:170:2: note: expanded from macro 'GI_DEVIC=
E_DESC_SIMPLE_RW'
           GI_DEVICE_DESC_SIMPLE_R_##_type(_name)  \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   drivers/usb/gadget/configfs.c:130:9: note: expanded from macro 'GI_DEVIC=
E_DESC_SIMPLE_R_u8'
           return sprintf(page, "0x%02x\n", \
                  ^~~~~~~
   drivers/usb/gadget/configfs.c:178:1: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   GI_DEVICE_DESC_SIMPLE_RW(idVendor, u16);
   ^
   drivers/usb/gadget/configfs.c:170:2: note: expanded from macro 'GI_DEVIC=
E_DESC_SIMPLE_RW'
           GI_DEVICE_DESC_SIMPLE_R_##_type(_name)  \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   drivers/usb/gadget/configfs.c:138:9: note: expanded from macro 'GI_DEVIC=
E_DESC_SIMPLE_R_u16'
           return sprintf(page, "0x%04x\n", \
                  ^~~~~~~
   drivers/usb/gadget/configfs.c:178:1: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
   GI_DEVICE_DESC_SIMPLE_RW(idVendor, u16);
   ^
   drivers/usb/gadget/configfs.c:170:2: note: expanded from macro 'GI_DEVIC=
E_DESC_SIMPLE_RW'
           GI_DEVICE_DESC_SIMPLE_R_##_type(_name)  \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   drivers/usb/gadget/configfs.c:138:9: note: expanded from macro 'GI_DEVIC=
E_DESC_SIMPLE_R_u16'
           return sprintf(page, "0x%04x\n", \
                  ^~~~~~~
   drivers/usb/gadget/configfs.c:179:1: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   GI_DEVICE_DESC_SIMPLE_RW(idProduct, u16);
   ^
   drivers/usb/gadget/configfs.c:170:2: note: expanded from macro 'GI_DEVIC=
E_DESC_SIMPLE_RW'
           GI_DEVICE_DESC_SIMPLE_R_##_type(_name)  \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   drivers/usb/gadget/configfs.c:138:9: note: expanded from macro 'GI_DEVIC=
E_DESC_SIMPLE_R_u16'
           return sprintf(page, "0x%04x\n", \
                  ^~~~~~~
   drivers/usb/gadget/configfs.c:179:1: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
   GI_DEVICE_DESC_SIMPLE_RW(idProduct, u16);
   ^
   drivers/usb/gadget/configfs.c:170:2: note: expanded from macro 'GI_DEVIC=
E_DESC_SIMPLE_RW'
           GI_DEVICE_DESC_SIMPLE_R_##_type(_name)  \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   drivers/usb/gadget/configfs.c:138:9: note: expanded from macro 'GI_DEVIC=
E_DESC_SIMPLE_R_u16'
           return sprintf(page, "0x%04x\n", \
                  ^~~~~~~
   drivers/usb/gadget/configfs.c:180:1: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   GI_DEVICE_DESC_SIMPLE_R_u16(bcdDevice);
   ^
   drivers/usb/gadget/configfs.c:138:9: note: expanded from macro 'GI_DEVIC=
E_DESC_SIMPLE_R_u16'
           return sprintf(page, "0x%04x\n", \
                  ^~~~~~~
   drivers/usb/gadget/configfs.c:180:1: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
   GI_DEVICE_DESC_SIMPLE_R_u16(bcdDevice);
   ^
   drivers/usb/gadget/configfs.c:138:9: note: expanded from macro 'GI_DEVIC=
E_DESC_SIMPLE_R_u16'
           return sprintf(page, "0x%04x\n", \
                  ^~~~~~~
>> drivers/usb/gadget/configfs.c:237:8: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
           ret =3D sprintf(page, "%s\n", udc_name ?: "");
                 ^~~~~~~
   drivers/usb/gadget/configfs.c:237:8: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
           ret =3D sprintf(page, "%s\n", udc_name ?: "");
                 ^~~~~~~
   drivers/usb/gadget/configfs.c:306:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
           return sprintf(page, "%s\n", usb_speed_string(speed));
                  ^~~~~~~
   drivers/usb/gadget/configfs.c:306:9: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
           return sprintf(page, "%s\n", usb_speed_string(speed));
                  ^~~~~~~
   drivers/usb/gadget/configfs.c:507:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(page, "%u\n", cfg->c.MaxPower);
                  ^~~~~~~
   drivers/usb/gadget/configfs.c:507:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(page, "%u\n", cfg->c.MaxPower);
                  ^~~~~~~
   drivers/usb/gadget/configfs.c:530:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(page, "0x%02x\n", cfg->c.bmAttributes);
                  ^~~~~~~
   drivers/usb/gadget/configfs.c:530:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(page, "0x%02x\n", cfg->c.bmAttributes);
                  ^~~~~~~
   drivers/usb/gadget/configfs.c:590:8: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D snprintf(buf, MAX_NAME_LEN, "%s", name);
                 ^~~~~~~~
   drivers/usb/gadget/configfs.c:590:8: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           ret =3D snprintf(buf, MAX_NAME_LEN, "%s", name);
                 ^~~~~~~~
   drivers/usb/gadget/configfs.c:653:1: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
   GS_STRINGS_RW(gadget_config_name, configuration);
   ^
   include/linux/usb/gadget_configfs.h:31:2: note: expanded from macro 'GS_=
STRINGS_RW'
           GS_STRINGS_R(struct_name, _name)        \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/usb/gadget_configfs.h:27:9: note: expanded from macro 'GS_=
STRINGS_R'
           return sprintf(page, "%s\n", gs->__name ?: ""); \
                  ^~~~~~~
   drivers/usb/gadget/configfs.c:653:1: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
   GS_STRINGS_RW(gadget_config_name, configuration);
   ^
   include/linux/usb/gadget_configfs.h:31:2: note: expanded from macro 'GS_=
STRINGS_RW'
           GS_STRINGS_R(struct_name, _name)        \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/usb/gadget_configfs.h:27:9: note: expanded from macro 'GS_=
STRINGS_R'
           return sprintf(page, "%s\n", gs->__name ?: ""); \
                  ^~~~~~~
   drivers/usb/gadget/configfs.c:685:8: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D snprintf(buf, MAX_NAME_LEN, "%s", name);
                 ^~~~~~~~
   drivers/usb/gadget/configfs.c:685:8: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           ret =3D snprintf(buf, MAX_NAME_LEN, "%s", name);
                 ^~~~~~~~
   drivers/usb/gadget/configfs.c:754:1: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
   GS_STRINGS_RW(gadget_strings, manufacturer);
   ^
   include/linux/usb/gadget_configfs.h:31:2: note: expanded from macro 'GS_=
STRINGS_RW'
           GS_STRINGS_R(struct_name, _name)        \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/usb/gadget_configfs.h:27:9: note: expanded from macro 'GS_=
STRINGS_R'
           return sprintf(page, "%s\n", gs->__name ?: ""); \
                  ^~~~~~~
   drivers/usb/gadget/configfs.c:754:1: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
   GS_STRINGS_RW(gadget_strings, manufacturer);
   ^
   include/linux/usb/gadget_configfs.h:31:2: note: expanded from macro 'GS_=
STRINGS_RW'
           GS_STRINGS_R(struct_name, _name)        \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/usb/gadget_configfs.h:27:9: note: expanded from macro 'GS_=
STRINGS_R'
           return sprintf(page, "%s\n", gs->__name ?: ""); \
                  ^~~~~~~
   drivers/usb/gadget/configfs.c:755:1: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
   GS_STRINGS_RW(gadget_strings, product);
   ^
   include/linux/usb/gadget_configfs.h:31:2: note: expanded from macro 'GS_=
STRINGS_RW'
           GS_STRINGS_R(struct_name, _name)        \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/usb/gadget_configfs.h:27:9: note: expanded from macro 'GS_=
STRINGS_R'
           return sprintf(page, "%s\n", gs->__name ?: ""); \
                  ^~~~~~~
   drivers/usb/gadget/configfs.c:755:1: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
   GS_STRINGS_RW(gadget_strings, product);
   ^
   include/linux/usb/gadget_configfs.h:31:2: note: expanded from macro 'GS_=
STRINGS_RW'
           GS_STRINGS_R(struct_name, _name)        \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/usb/gadget_configfs.h:27:9: note: expanded from macro 'GS_=
STRINGS_R'
           return sprintf(page, "%s\n", gs->__name ?: ""); \
                  ^~~~~~~
   drivers/usb/gadget/configfs.c:756:1: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
   GS_STRINGS_RW(gadget_strings, serialnumber);
   ^
   include/linux/usb/gadget_configfs.h:31:2: note: expanded from macro 'GS_=
STRINGS_RW'
           GS_STRINGS_R(struct_name, _name)        \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/usb/gadget_configfs.h:27:9: note: expanded from macro 'GS_=
STRINGS_R'
           return sprintf(page, "%s\n", gs->__name ?: ""); \
                  ^~~~~~~
   drivers/usb/gadget/configfs.c:756:1: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
   GS_STRINGS_RW(gadget_strings, serialnumber);
--
           ^~~~~~~~~~~~~~
   include/linux/log2.h:24:2: note: Returning the value -1
           return fls(n) - 1;
           ^~~~~~~~~~~~~~~~~
   drivers/soundwire/bus.c:1233:16: note: Returning from '__ilog2_u32'
           scale_index =3D ilog2(scale);
                         ^
   include/linux/log2.h:162:2: note: expanded from macro 'ilog2'
           __ilog2_u32(n) :                \
           ^~~~~~~~~~~~~~
   drivers/soundwire/bus.c:1233:2: note: The value 255 is assigned to 'scal=
e_index'
           scale_index =3D ilog2(scale);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/bus.c:1235:6: note: The result of the left shift is un=
defined due to shifting by '255', which is greater or equal to the width of=
 type 'unsigned long'
           if (BIT(scale_index) !=3D scale || scale_index > 6) {
               ^
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   drivers/soundwire/bus.c:1623:4: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(slave_intr.port, &port_status,
                           ^~~~~~
   drivers/soundwire/bus.c:1623:4: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                           memcpy(slave_intr.port, &port_status,
                           ^~~~~~
   Suppressed 21 warnings (21 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   drivers/input/serio/serport.c:175:2: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(serio->phys, sizeof(serio->phys), "%s/serio0", tty_name=
(tty));
           ^~~~~~~~
   drivers/input/serio/serport.c:175:2: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           snprintf(serio->phys, sizeof(serio->phys), "%s/serio0", tty_name=
(tty));
           ^~~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   drivers/char/hw_random/virtio-rng.c:70:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, vi->data + vi->data_idx, size);
           ^~~~~~
   drivers/char/hw_random/virtio-rng.c:70:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, vi->data + vi->data_idx, size);
           ^~~~~~
   drivers/char/hw_random/virtio-rng.c:143:2: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(vi->name, "virtio_rng.%d", index);
           ^~~~~~~
   drivers/char/hw_random/virtio-rng.c:143:2: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           sprintf(vi->name, "virtio_rng.%d", index);
           ^~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   Suppressed 24 warnings (24 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/mfd/iqs62x.c:330:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(fw_blk->data, data, len);
                   ^~~~~~
   drivers/mfd/iqs62x.c:330:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy(fw_blk->data, data, len);
                   ^~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   Suppressed 24 warnings (24 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   drivers/mfd/mt6360-core.c:445:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(val, buf + MT6360_CRC_PREDATA_OFFSET, val_size);
           ^~~~~~
   drivers/mfd/mt6360-core.c:445:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(val, buf + MT6360_CRC_PREDATA_OFFSET, val_size);
           ^~~~~~
   drivers/mfd/mt6360-core.c:476:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf + MT6360_CRC_PREDATA_OFFSET, val + MT6360_REGMAP_REG_=
BYTE_SIZE, write_size);
           ^~~~~~
   drivers/mfd/mt6360-core.c:476:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf + MT6360_CRC_PREDATA_OFFSET, val + MT6360_REGMAP_REG_=
BYTE_SIZE, write_size);
           ^~~~~~
   Suppressed 49 warnings (49 in non-user code).
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
   39 warnings generated.
>> drivers/usb/gadget/udc/core.c:1663:9: warning: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeB=
ufferHandling]
           return sprintf(buf, "%s\n", usb_state_string(gadget->state));
                  ^~~~~~~
   drivers/usb/gadget/udc/core.c:1663:9: note: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11
           return sprintf(buf, "%s\n", usb_state_string(gadget->state));
                  ^~~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/usb/gadget/udc/gr_udc.c:311:3: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buftail, ep->tailbuf, req->oddlen);
                   ^~~~~~
   drivers/usb/gadget/udc/gr_udc.c:311:3: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buftail, ep->tailbuf, req->oddlen);
                   ^~~~~~
   drivers/usb/gadget/udc/gr_udc.c:504:24: warning: Access to field 'ctrl' =
results in a dereference of a null pointer (loaded from field 'first_desc')=
 [clang-analyzer-core.NullDereference]
           req->first_desc->ctrl |=3D GR_DESC_OUT_CTRL_EN;
                                 ^
   drivers/usb/gadget/udc/gr_udc.c:1660:15: note: Assuming '_ep' is non-null
           if (unlikely(!_ep || !_req))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/usb/gadget/udc/gr_udc.c:1660:15: note: Left side of '||' is false
           if (unlikely(!_ep || !_req))
                        ^
   drivers/usb/gadget/udc/gr_udc.c:1660:23: note: Assuming '_req' is non-nu=
ll
           if (unlikely(!_ep || !_req))
                                ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/usb/gadget/udc/gr_udc.c:1660:2: note: Taking false branch
           if (unlikely(!_ep || !_req))
           ^
   drivers/usb/gadget/udc/gr_udc.c:1675:7: note: Assuming the condition is =
false
           if ((ep =3D=3D &dev->epi[0]) && (dev->ep0state =3D=3D GR_EP0_ODA=
TA)) {
                ^~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/gr_udc.c:1675:27: note: Left side of '&&' is false
           if ((ep =3D=3D &dev->epi[0]) && (dev->ep0state =3D=3D GR_EP0_ODA=
TA)) {
                                    ^
   drivers/usb/gadget/udc/gr_udc.c:1680:6: note: Assuming field 'is_in' is 0
           if (ep->is_in)
               ^~~~~~~~~
   drivers/usb/gadget/udc/gr_udc.c:1680:2: note: Taking false branch
           if (ep->is_in)
           ^
   drivers/usb/gadget/udc/gr_udc.c:1683:8: note: Calling 'gr_queue'
           ret =3D gr_queue(ep, req, GFP_ATOMIC);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/gr_udc.c:582:15: note: Assuming field 'desc' is n=
on-null
           if (unlikely(!ep->ep.desc && ep->num !=3D 0)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/usb/gadget/udc/gr_udc.c:582:28: note: Left side of '&&' is false
           if (unlikely(!ep->ep.desc && ep->num !=3D 0)) {
                                     ^
   drivers/usb/gadget/udc/gr_udc.c:582:2: note: Taking false branch
           if (unlikely(!ep->ep.desc && ep->num !=3D 0)) {
           ^
   drivers/usb/gadget/udc/gr_udc.c:587:15: note: Assuming field 'buf' is no=
n-null
           if (unlikely(!req->req.buf || !list_empty(&req->queue))) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/usb/gadget/udc/gr_udc.c:587:15: note: Left side of '||' is false
           if (unlikely(!req->req.buf || !list_empty(&req->queue))) {
                        ^
   drivers/usb/gadget/udc/gr_udc.c:587:6: note: Assuming the condition is f=
alse
           if (unlikely(!req->req.buf || !list_empty(&req->queue))) {
               ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/gr_udc.c:587:2: note: Taking false branch
           if (unlikely(!req->req.buf || !list_empty(&req->queue))) {
           ^
   drivers/usb/gadget/udc/gr_udc.c:594:15: note: Assuming field 'driver' is=
 non-null
           if (unlikely(!dev->driver || dev->gadget.speed =3D=3D USB_SPEED_=
UNKNOWN)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/usb/gadget/udc/gr_udc.c:594:15: note: Left side of '||' is false
           if (unlikely(!dev->driver || dev->gadget.speed =3D=3D USB_SPEED_=
UNKNOWN)) {
                        ^
   drivers/usb/gadget/udc/gr_udc.c:594:31: note: Assuming field 'speed' is =
not equal to USB_SPEED_UNKNOWN
           if (unlikely(!dev->driver || dev->gadget.speed =3D=3D USB_SPEED_=
UNKNOWN)) {
                                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/usb/gadget/udc/gr_udc.c:594:2: note: Taking false branch
           if (unlikely(!dev->driver || dev->gadget.speed =3D=3D USB_SPEED_=
UNKNOWN)) {
--
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
   49 warnings generated.
   drivers/video/backlight/gpio_backlight.c:75:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&props, 0, sizeof(props));
           ^~~~~~
   drivers/video/backlight/gpio_backlight.c:75:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(&props, 0, sizeof(props));
           ^~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/video/backlight/lm3533_bl.c:299:2: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&props, 0, sizeof(props));
           ^~~~~~
   drivers/video/backlight/lm3533_bl.c:299:2: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
           memset(&props, 0, sizeof(props));
           ^~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/power/supply/wm8350_power.c:179:9: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
           return sprintf(buf, "%s\n", charge);
                  ^~~~~~~
   drivers/power/supply/wm8350_power.c:179:9: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
           return sprintf(buf, "%s\n", charge);
                  ^~~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/video/fbdev/core/fbcmap.c:183:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(to->red+tooff, from->red+fromoff, size);
           ^~~~~~
   drivers/video/fbdev/core/fbcmap.c:183:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(to->red+tooff, from->red+fromoff, size);
           ^~~~~~
   drivers/video/fbdev/core/fbcmap.c:184:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(to->green+tooff, from->green+fromoff, size);
           ^~~~~~
   drivers/video/fbdev/core/fbcmap.c:184:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(to->green+tooff, from->green+fromoff, size);
           ^~~~~~
   drivers/video/fbdev/core/fbcmap.c:185:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(to->blue+tooff, from->blue+fromoff, size);
           ^~~~~~
   drivers/video/fbdev/core/fbcmap.c:185:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(to->blue+tooff, from->blue+fromoff, size);
           ^~~~~~
   drivers/video/fbdev/core/fbcmap.c:187:3: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(to->transp+tooff, from->transp+fromoff, size);
                   ^~~~~~
   drivers/video/fbdev/core/fbcmap.c:187:3: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(to->transp+tooff, from->transp+fromoff, size);
                   ^~~~~~
   drivers/video/fbdev/core/fbcmap.c:275:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&umap, 0, sizeof(struct fb_cmap));
           ^~~~~~
   drivers/video/fbdev/core/fbcmap.c:275:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(&umap, 0, sizeof(struct fb_cmap));
           ^~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   drivers/usb/gadget/function/storage_common.c:318:9: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", fsg_lun_is_open(curlun)
                  ^~~~~~~
   drivers/usb/gadget/function/storage_common.c:318:9: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", fsg_lun_is_open(curlun)
                  ^~~~~~~
   drivers/usb/gadget/function/storage_common.c:326:9: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", curlun->nofua);
                  ^~~~~~~
   drivers/usb/gadget/function/storage_common.c:326:9: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", curlun->nofua);
                  ^~~~~~~
   drivers/usb/gadget/function/storage_common.c:343:4: warning: Call to fun=
ction 'memmove' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memmove_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memmove(buf, p, rc);
                           ^~~~~~~
   drivers/usb/gadget/function/storage_common.c:343:4: note: Call to functi=
on 'memmove' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memmove_s' in case of C11
                           memmove(buf, p, rc);
                           ^~~~~~~
   drivers/usb/gadget/function/storage_common.c:358:9: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", curlun->cdrom);
                  ^~~~~~~
   drivers/usb/gadget/function/storage_common.c:358:9: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", curlun->cdrom);
                  ^~~~~~~
   drivers/usb/gadget/function/storage_common.c:364:9: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", curlun->removable);
                  ^~~~~~~
   drivers/usb/gadget/function/storage_common.c:364:9: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", curlun->removable);
                  ^~~~~~~
>> drivers/usb/gadget/function/storage_common.c:370:9: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide bounding of the memory b=
uffer or security checks introduced in the C11 standard. Replace with analo=
gous functions that support length arguments or provides boundary checks su=
ch as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depre=
catedOrUnsafeBufferHandling]
           return sprintf(buf, "%s\n", curlun->inquiry_string);
                  ^~~~~~~
   drivers/usb/gadget/function/storage_common.c:370:9: note: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11
           return sprintf(buf, "%s\n", curlun->inquiry_string);
                  ^~~~~~~
   drivers/usb/gadget/function/storage_common.c:512:3: warning: Call to fun=
ction 'snprintf' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'snprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(curlun->inquiry_string,
                   ^~~~~~~~
   drivers/usb/gadget/function/storage_common.c:512:3: note: Call to functi=
on 'snprintf' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(curlun->inquiry_string,
                   ^~~~~~~~
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   kernel/utsname_sysctl.c:39:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&uts_table, table, sizeof(uts_table));
           ^~~~~~
   kernel/utsname_sysctl.c:39:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(&uts_table, table, sizeof(uts_table));
           ^~~~~~
   kernel/utsname_sysctl.c:49:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(tmp_data, get_uts(table), sizeof(tmp_data));
           ^~~~~~
   kernel/utsname_sysctl.c:49:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(tmp_data, get_uts(table), sizeof(tmp_data));
           ^~~~~~
   kernel/utsname_sysctl.c:61:3: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(get_uts(table), tmp_data, sizeof(tmp_data));
                   ^~~~~~
   kernel/utsname_sysctl.c:61:3: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
                   memcpy(get_uts(table), tmp_data, sizeof(tmp_data));
                   ^~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   kernel/trace/ring_buffer.c:2297:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(iter->event, event, length);
           ^~~~~~
   kernel/trace/ring_buffer.c:2297:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(iter->event, event, length);
           ^~~~~~
   kernel/trace/ring_buffer.c:3509:25: warning: The right operand of '!=3D'=
 is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (unlikely(info->ts !=3D save_before)) {
                                         ^
   kernel/trace/ring_buffer.c:5860:2: note: Calling 'rb_write_something'
           rb_write_something(data, true);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ring_buffer.c:5782:21: note: 'nested' is true
           cnt =3D data->cnt + (nested ? 27 : 0);
                              ^~~~~~
   kernel/trace/ring_buffer.c:5782:21: note: '?' condition is true
   kernel/trace/ring_buffer.c:5791:2: note: Loop condition is false.  Exiti=
ng loop
           smp_rmb();
           ^
   include/asm-generic/barrier.h:95:24: note: expanded from macro 'smp_rmb'
   #define smp_rmb()       do { kcsan_rmb(); __smp_rmb(); } while (0)
                                ^
   include/linux/kcsan-checks.h:266:21: note: expanded from macro 'kcsan_rm=
b'
   #define kcsan_rmb()     do { } while (0)
                           ^
   kernel/trace/ring_buffer.c:5791:2: note: Loop condition is false.  Exiti=
ng loop
           smp_rmb();
           ^
   include/asm-generic/barrier.h:95:19: note: expanded from macro 'smp_rmb'
   #define smp_rmb()       do { kcsan_rmb(); __smp_rmb(); } while (0)
                           ^
   kernel/trace/ring_buffer.c:5793:10: note: Calling 'ring_buffer_lock_rese=
rve'
           event =3D ring_buffer_lock_reserve(data->buffer, len);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ring_buffer.c:3675:6: note: Assuming the condition is true
           if (unlikely(atomic_read(&buffer->record_disabled)))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   kernel/trace/ring_buffer.c:3675:2: note: Taking false branch
           if (unlikely(atomic_read(&buffer->record_disabled)))
           ^
   kernel/trace/ring_buffer.c:3680:6: note: Assuming the condition is false
           if (unlikely(!cpumask_test_cpu(cpu, buffer->cpumask)))
               ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ring_buffer.c:3680:2: note: Taking false branch
           if (unlikely(!cpumask_test_cpu(cpu, buffer->cpumask)))
           ^
   kernel/trace/ring_buffer.c:3685:6: note: Assuming the condition is true
           if (unlikely(atomic_read(&cpu_buffer->record_disabled)))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   kernel/trace/ring_buffer.c:3685:2: note: Taking false branch

vim +237 drivers/usb/gadget/configfs.c

88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  228  =

45b6a73f62ebcf3 Christoph Hellwig         2015-10-03  229  static ssize_t g=
adget_dev_desc_UDC_show(struct config_item *item, char *page)
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  230  {
64e6bbfff52db4b Eddie Hung                2020-12-29  231  	struct gadget_i=
nfo *gi =3D to_gadget_info(item);
64e6bbfff52db4b Eddie Hung                2020-12-29  232  	char *udc_name;
64e6bbfff52db4b Eddie Hung                2020-12-29  233  	int ret;
64e6bbfff52db4b Eddie Hung                2020-12-29  234  =

64e6bbfff52db4b Eddie Hung                2020-12-29  235  	mutex_lock(&gi-=
>lock);
64e6bbfff52db4b Eddie Hung                2020-12-29  236  	udc_name =3D gi=
->composite.gadget_driver.udc_name;
64e6bbfff52db4b Eddie Hung                2020-12-29 @237  	ret =3D sprintf=
(page, "%s\n", udc_name ?: "");
64e6bbfff52db4b Eddie Hung                2020-12-29  238  	mutex_unlock(&g=
i->lock);
afdaadc3c8530b4 Ruslan Bilovol            2015-11-23  239  =

64e6bbfff52db4b Eddie Hung                2020-12-29  240  	return ret;
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  241  }
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  242  =


:::::: The code at line 237 was first introduced by commit
:::::: 64e6bbfff52db4bf6785fab9cffab850b2de6870 usb: gadget: configfs: Fix =
use-after-free issue with udc_name

:::::: TO: Eddie Hung <eddie.hung@mediatek.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6819019860460868931==--

