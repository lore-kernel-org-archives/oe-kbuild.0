Content-Type: multipart/mixed; boundary="===============8371789616285095099=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:158:3: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments...
Date: Fri, 17 Dec 2021 21:35:45 +0800
Message-ID: <202112172134.k3Tg6Pjk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8371789616285095099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mario Limonciello <mario.limonciello@dell.com>
CC: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6441998e2e37131b0a4c310af9156d79d3351c16
commit: f1e1ea516721d1ea0b21327ff9e6cb2c2bb86e28 platform/x86: Move all del=
l drivers to their own subdirectory
date:   11 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-c007-20211202 (https://download.01.org/0day-ci/ar=
chive/20211217/202112172134.k3Tg6Pjk-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b5532=
97ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df1e1ea516721d1ea0b21327ff9e6cb2c2bb86e28
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f1e1ea516721d1ea0b21327ff9e6cb2c2bb86e28
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   strcpy(uid->string, obj_desc->string.pointer);
                   ^~~~~~
   drivers/acpi/acpica/utids.c:292:4: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(next_id_string, cid_objects[i]->string.po=
inter);
                           ^~~~~~
   drivers/acpi/acpica/utids.c:292:4: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
                           strcpy(next_id_string, cid_objects[i]->string.po=
inter);
                           ^~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/iio/light/si1145.c:151:8: warning: Excessive padding in 'struct =
si1145_part_info' (14 padding bytes, where 6 is optimal). =

   Optimal fields order: =

   iio_info, =

   channels, =

   num_channels, =

   num_leds, =

   part, =

   uncompressed_meas_rate, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct si1145_part_info {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/iio/light/si1145.c:151:8: note: Excessive padding in 'struct si1=
145_part_info' (14 padding bytes, where 6 is optimal). Optimal fields order=
: iio_info, channels, num_channels, num_leds, part, uncompressed_meas_rate,=
 consider reordering the fields or adding explicit padding members
   struct si1145_part_info {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:158:3: warni=
ng: Call to function 'strcat' is insecure as it does not provide bounding o=
f the memory buffer. Replace unbounded copy functions with analogous functi=
ons that support length arguments such as 'strlcat'. CWE-119 [clang-analyze=
r-security.insecureAPI.strcpy]
                   strcat(wmi_priv.enumeration_data[instance_id].dell_value=
_modifier,
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:158:3: note:=
 Call to function 'strcat' is insecure as it does not provide bounding of t=
he memory buffer. Replace unbounded copy functions with analogous functions=
 that support length arguments such as 'strlcat'. CWE-119
                   strcat(wmi_priv.enumeration_data[instance_id].dell_value=
_modifier,
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:160:3: warni=
ng: Call to function 'strcat' is insecure as it does not provide bounding o=
f the memory buffer. Replace unbounded copy functions with analogous functi=
ons that support length arguments such as 'strlcat'. CWE-119 [clang-analyze=
r-security.insecureAPI.strcpy]
                   strcat(wmi_priv.enumeration_data[instance_id].dell_value=
_modifier, ";");
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:160:3: note:=
 Call to function 'strcat' is insecure as it does not provide bounding of t=
he memory buffer. Replace unbounded copy functions with analogous functions=
 that support length arguments such as 'strlcat'. CWE-119
                   strcat(wmi_priv.enumeration_data[instance_id].dell_value=
_modifier, ";");
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:166:3: warni=
ng: Call to function 'strcat' is insecure as it does not provide bounding o=
f the memory buffer. Replace unbounded copy functions with analogous functi=
ons that support length arguments such as 'strlcat'. CWE-119 [clang-analyze=
r-security.insecureAPI.strcpy]
                   strcat(wmi_priv.enumeration_data[instance_id].possible_v=
alues,
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:166:3: note:=
 Call to function 'strcat' is insecure as it does not provide bounding of t=
he memory buffer. Replace unbounded copy functions with analogous functions=
 that support length arguments such as 'strlcat'. CWE-119
                   strcat(wmi_priv.enumeration_data[instance_id].possible_v=
alues,
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:168:3: warni=
ng: Call to function 'strcat' is insecure as it does not provide bounding o=
f the memory buffer. Replace unbounded copy functions with analogous functi=
ons that support length arguments such as 'strlcat'. CWE-119 [clang-analyze=
r-security.insecureAPI.strcpy]
                   strcat(wmi_priv.enumeration_data[instance_id].possible_v=
alues, ";");
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:168:3: note:=
 Call to function 'strcat' is insecure as it does not provide bounding of t=
he memory buffer. Replace unbounded copy functions with analogous functions=
 that support length arguments such as 'strlcat'. CWE-119
                   strcat(wmi_priv.enumeration_data[instance_id].possible_v=
alues, ";");
                   ^~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/acpi/ac.c:259:2: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_device_name(device), ACPI_AC_DEVICE_NAME);
           ^~~~~~
   drivers/acpi/ac.c:259:2: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
           strcpy(acpi_device_name(device), ACPI_AC_DEVICE_NAME);
           ^~~~~~
   drivers/acpi/ac.c:260:2: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_device_class(device), ACPI_AC_CLASS);
           ^~~~~~
   drivers/acpi/ac.c:260:2: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
           strcpy(acpi_device_class(device), ACPI_AC_CLASS);
           ^~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/mtd/mtdcore.c:657:3: warning: Value stored to 'error' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   error =3D 0;
                   ^       ~
   drivers/mtd/mtdcore.c:657:3: note: Value stored to 'error' is never read
                   error =3D 0;
                   ^       ~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/mtd/mtdconcat.c:67:4: warning: Value stored to 'size' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           size =3D 0;
                           ^      ~
   drivers/mtd/mtdconcat.c:67:4: note: Value stored to 'size' is never read
                           size =3D 0;
                           ^      ~
   drivers/mtd/mtdconcat.c:159:4: warning: Value stored to 'size' is never =
read [clang-analyzer-deadcode.DeadStores]
                           size =3D 0;
                           ^      ~
   drivers/mtd/mtdconcat.c:159:4: note: Value stored to 'size' is never read
                           size =3D 0;
                           ^      ~
   drivers/mtd/mtdconcat.c:492:4: warning: Value stored to 'size' is never =
read [clang-analyzer-deadcode.DeadStores]
                           size =3D 0;
                           ^      ~
   drivers/mtd/mtdconcat.c:492:4: note: Value stored to 'size' is never read
                           size =3D 0;
                           ^      ~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
   7 warnings generated.
   drivers/media/dvb-frontends/nxt6000.c:420:2: warning: Value stored to 'v=
al' is never read [clang-analyzer-deadcode.DeadStores]
           val =3D nxt6000_readreg(state, RF_AGC_STATUS);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/nxt6000.c:420:2: note: Value stored to 'val'=
 is never read
           val =3D nxt6000_readreg(state, RF_AGC_STATUS);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/misc/eeprom/idt_89hpesx.c:977:3: warning: Value stored to 'csrad=
dr_len' is never read [clang-analyzer-deadcode.DeadStores]
                   csraddr_len =3D strnlen(csraddr_str, count);
                   ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/eeprom/idt_89hpesx.c:977:3: note: Value stored to 'csraddr_=
len' is never read
                   csraddr_len =3D strnlen(csraddr_str, count);
                   ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (6 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/platform/x86/dell/dell-laptop.c:1596:4: warning: Value stored to=
 'unit' is never read [clang-analyzer-deadcode.DeadStores]
                           unit =3D KBD_TIMEOUT_SECONDS;
                           ^      ~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/dell/dell-laptop.c:1596:4: note: Value stored to 'u=
nit' is never read
                           unit =3D KBD_TIMEOUT_SECONDS;
                           ^      ~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/iio/imu/inv_mpu6050/inv_mpu_magn.c:290:5: warning: Call to funct=
ion 'strcpy' is insecure as it does not provide bounding of the memory buff=
er. Replace unbounded copy functions with analogous functions that support =
length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecu=
reAPI.strcpy]
                                   strcpy(str, orient);
                                   ^~~~~~
   drivers/iio/imu/inv_mpu6050/inv_mpu_magn.c:290:5: note: Call to function=
 'strcpy' is insecure as it does not provide bounding of the memory buffer.=
 Replace unbounded copy functions with analogous functions that support len=
gth arguments such as 'strlcpy'. CWE-119
                                   strcpy(str, orient);
                                   ^~~~~~
   drivers/iio/imu/inv_mpu6050/inv_mpu_magn.c:292:5: warning: Call to funct=
ion 'strcpy' is insecure as it does not provide bounding of the memory buff=
er. Replace unbounded copy functions with analogous functions that support =
length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecu=
reAPI.strcpy]
                                   strcpy(str, &orient[1]);
                                   ^~~~~~
   drivers/iio/imu/inv_mpu6050/inv_mpu_magn.c:292:5: note: Call to function=
 'strcpy' is insecure as it does not provide bounding of the memory buffer.=
 Replace unbounded copy functions with analogous functions that support len=
gth arguments such as 'strlcpy'. CWE-119
                                   strcpy(str, &orient[1]);
                                   ^~~~~~
   drivers/iio/imu/inv_mpu6050/inv_mpu_magn.c:295:5: warning: Call to funct=
ion 'strcpy' is insecure as it does not provide bounding of the memory buff=
er. Replace unbounded copy functions with analogous functions that support =
length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecu=
reAPI.strcpy]
                                   strcpy(&str[1], orient);
                                   ^~~~~~
   drivers/iio/imu/inv_mpu6050/inv_mpu_magn.c:295:5: note: Call to function=
 'strcpy' is insecure as it does not provide bounding of the memory buffer.=
 Replace unbounded copy functions with analogous functions that support len=
gth arguments such as 'strlcpy'. CWE-119
                                   strcpy(&str[1], orient);
                                   ^~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/media/dvb-frontends/s5h1432.c:207:4: warning: Value stored to 'd=
vb_bandwidth' is never read [clang-analyzer-deadcode.DeadStores]
                           dvb_bandwidth =3D 6;
                           ^               ~
   drivers/media/dvb-frontends/s5h1432.c:207:4: note: Value stored to 'dvb_=
bandwidth' is never read
                           dvb_bandwidth =3D 6;
                           ^               ~
   drivers/media/dvb-frontends/s5h1432.c:211:4: warning: Value stored to 'd=
vb_bandwidth' is never read [clang-analyzer-deadcode.DeadStores]
                           dvb_bandwidth =3D 7;
                           ^               ~
   drivers/media/dvb-frontends/s5h1432.c:211:4: note: Value stored to 'dvb_=
bandwidth' is never read
                           dvb_bandwidth =3D 7;
                           ^               ~
   drivers/media/dvb-frontends/s5h1432.c:215:4: warning: Value stored to 'd=
vb_bandwidth' is never read [clang-analyzer-deadcode.DeadStores]
                           dvb_bandwidth =3D 8;
                           ^               ~
   drivers/media/dvb-frontends/s5h1432.c:215:4: note: Value stored to 'dvb_=
bandwidth' is never read
                           dvb_bandwidth =3D 8;
                           ^               ~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/leds/leds-ss4200.c:363:2: warning: Value stored to 'status' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           status =3D pci_read_config_dword(dev, GPIO_CTRL, &gc);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-ss4200.c:363:2: note: Value stored to 'status' is neve=
r read
           status =3D pci_read_config_dword(dev, GPIO_CTRL, &gc);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +158 drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c

e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  129  =

e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  130  /**
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  131   * populate_enum_data() - Populate all propertie=
s of an instance under enumeration attribute
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  132   * @enumeration_obj: ACPI object with enumeratio=
n data
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  133   * @instance_id: The instance to enumerate
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  134   * @attr_name_kobj: The parent kernel object
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  135   */
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  136  int populate_enum_data(union acpi_object *enumer=
ation_obj, int instance_id,
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  137  			struct kobject *attr_name_kobj)
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  138  {
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  139  	int i, next_obj, value_modifier_count, possible=
_values_count;
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  140  =

e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  141  	wmi_priv.enumeration_data[instance_id].attr_nam=
e_kobj =3D attr_name_kobj;
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  142  	strlcpy_attr(wmi_priv.enumeration_data[instance=
_id].attribute_name,
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  143  		enumeration_obj[ATTR_NAME].string.pointer);
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  144  	strlcpy_attr(wmi_priv.enumeration_data[instance=
_id].display_name_language_code,
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  145  		enumeration_obj[DISPL_NAME_LANG_CODE].string.p=
ointer);
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  146  	strlcpy_attr(wmi_priv.enumeration_data[instance=
_id].display_name,
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  147  		enumeration_obj[DISPLAY_NAME].string.pointer);
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  148  	strlcpy_attr(wmi_priv.enumeration_data[instance=
_id].default_value,
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  149  		enumeration_obj[DEFAULT_VAL].string.pointer);
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  150  	strlcpy_attr(wmi_priv.enumeration_data[instance=
_id].dell_modifier,
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  151  		enumeration_obj[MODIFIER].string.pointer);
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  152  =

e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  153  	next_obj =3D MODIFIER + 1;
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  154  =

e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  155  	value_modifier_count =3D (uintptr_t)enumeration=
_obj[next_obj].string.pointer;
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  156  =

e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  157  	for (i =3D 0; i < value_modifier_count; i++) {
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27 @158  		strcat(wmi_priv.enumeration_data[instance_id].=
dell_value_modifier,
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  159  			enumeration_obj[++next_obj].string.pointer);
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  160  		strcat(wmi_priv.enumeration_data[instance_id].=
dell_value_modifier, ";");
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  161  	}
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  162  =

e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  163  	possible_values_count =3D (uintptr_t) enumerati=
on_obj[++next_obj].string.pointer;
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  164  =

e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  165  	for (i =3D 0; i < possible_values_count; i++) {
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  166  		strcat(wmi_priv.enumeration_data[instance_id].=
possible_values,
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  167  			enumeration_obj[++next_obj].string.pointer);
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  168  		strcat(wmi_priv.enumeration_data[instance_id].=
possible_values, ";");
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  169  	}
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  170  =

e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  171  	return sysfs_create_group(attr_name_kobj, &enum=
eration_attr_group);
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  172  }
e8a60aa7404bfe drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divya=
 Bharathi 2020-10-27  173  =


:::::: The code@line 158 was first introduced by commit
:::::: e8a60aa7404bfef37705da5607c97737073ac38d platform/x86: Introduce sup=
port for Systems Management Driver over WMI for Dell Systems

:::::: TO: Divya Bharathi <divya.bharathi@dell.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8371789616285095099==--

