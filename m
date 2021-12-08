Content-Type: multipart/mixed; boundary="===============6155710681415049044=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:158:3: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments...
Date: Wed, 08 Dec 2021 10:34:07 +0800
Message-ID: <202112081026.MZc5V6YO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6155710681415049044==
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
head:   cd8c917a56f20f48748dd43d9ae3caff51d5b987
commit: f1e1ea516721d1ea0b21327ff9e6cb2c2bb86e28 platform/x86: Move all del=
l drivers to their own subdirectory
date:   10 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-c007-20211202 (https://download.01.org/0day-ci/ar=
chive/20211208/202112081026.MZc5V6YO-lkp(a)intel.com/config)
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
   23 warnings generated.
   drivers/media/tuners/mxl5005s.c:2668:3: warning: Value stored to 'Fmax' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2668:3: note: Value stored to 'Fmax' is =
never read
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2669:3: warning: Value stored to 'Fmin' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmin =3D FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2669:3: note: Value stored to 'Fmin' is =
never read
                   Fmin =3D FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2677:3: warning: Value stored to 'Fmax' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2677:3: note: Value stored to 'Fmax' is =
never read
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2678:3: warning: Value stored to 'Fmin' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmin =3D FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2678:3: note: Value stored to 'Fmin' is =
never read
                   Fmin =3D FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2686:3: warning: Value stored to 'Fmax' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2686:3: note: Value stored to 'Fmax' is =
never read
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2687:3: warning: Value stored to 'Fmin' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmin =3D FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2687:3: note: Value stored to 'Fmin' is =
never read
                   Fmin =3D FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2695:3: warning: Value stored to 'Fmax' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2695:3: note: Value stored to 'Fmax' is =
never read
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2696:3: warning: Value stored to 'Fmin' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmin =3D FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2696:3: note: Value stored to 'Fmin' is =
never read
                   Fmin =3D FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2704:3: warning: Value stored to 'Fmax' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2704:3: note: Value stored to 'Fmax' is =
never read
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2705:3: warning: Value stored to 'Fmin' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmin =3D FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2705:3: note: Value stored to 'Fmin' is =
never read
                   Fmin =3D FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2713:3: warning: Value stored to 'Fmax' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2713:3: note: Value stored to 'Fmax' is =
never read
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2714:3: warning: Value stored to 'Fmin' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmin =3D FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2714:3: note: Value stored to 'Fmin' is =
never read
                   Fmin =3D FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2722:3: warning: Value stored to 'Fmax' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2722:3: note: Value stored to 'Fmax' is =
never read
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2723:3: warning: Value stored to 'Fmin' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmin =3D FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2723:3: note: Value stored to 'Fmin' is =
never read
                   Fmin =3D FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2731:3: warning: Value stored to 'Fmax' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2731:3: note: Value stored to 'Fmax' is =
never read
                   Fmax =3D FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2732:3: warning: Value stored to 'Fmin' =
is never read [clang-analyzer-deadcode.DeadStores]
                   Fmin =3D FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2732:3: note: Value stored to 'Fmin' is =
never read
                   Fmin =3D FminBin ;
                   ^      ~~~~~~~
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/char/applicom.c:574:5: warning: Value stored to 'ret' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                                   ret =3D do_ac_read(i, buf, &st_loc, &mai=
lbox);
                                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/char/applicom.c:574:5: note: Value stored to 'ret' is never read
                                   ret =3D do_ac_read(i, buf, &st_loc, &mai=
lbox);
                                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/char/applicom.c:734:4: warning: Value stored to 'ret' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           ret =3D -EFAULT;
                           ^     ~~~~~~~
   drivers/char/applicom.c:734:4: note: Value stored to 'ret' is never read
                           ret =3D -EFAULT;
                           ^     ~~~~~~~
   drivers/char/applicom.c:755:4: warning: Value stored to 'ret' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           ret =3D -EFAULT;
                           ^     ~~~~~~~
   drivers/char/applicom.c:755:4: note: Value stored to 'ret' is never read
                           ret =3D -EFAULT;
                           ^     ~~~~~~~
   drivers/char/applicom.c:781:4: warning: Value stored to 'ret' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           ret =3D -EFAULT;
                           ^     ~~~~~~~
   drivers/char/applicom.c:781:4: note: Value stored to 'ret' is never read
                           ret =3D -EFAULT;
                           ^     ~~~~~~~
   drivers/char/applicom.c:836:3: warning: Value stored to 'ret' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   ret =3D -ENOTTY;
                   ^     ~~~~~~~
   drivers/char/applicom.c:836:3: note: Value stored to 'ret' is never read
                   ret =3D -ENOTTY;
                   ^     ~~~~~~~
   Suppressed 10 warnings (6 in non-user code, 4 with check filters).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   net/bluetooth/bnep/core.c:641:2: warning: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(req->device, dev->name);
           ^~~~~~
   net/bluetooth/bnep/core.c:641:2: note: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119
           strcpy(req->device, dev->name);
           ^~~~~~
   net/bluetooth/bnep/core.c:680:2: warning: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(ci->device, s->dev->name);
--
   Suppressed 8 warnings (8 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/crypto/cavium/nitrox/nitrox_reqmgr.c:161:22: warning: Value stor=
ed to 'sg' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct scatterlist *sg =3D req->src;
                               ^~   ~~~~~~~~
   drivers/crypto/cavium/nitrox/nitrox_reqmgr.c:161:22: note: Value stored =
to 'sg' during its initialization is never read
           struct scatterlist *sg =3D req->src;
                               ^~   ~~~~~~~~
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
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
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
   10 warnings generated.
   drivers/iio/dac/ad5064.c:105:8: warning: Excessive padding in 'struct ad=
5064_state' (179 padding bytes, where 51 is optimal). =

   Optimal fields order: =

   data, =

   dac_cache, =

   use_internal_vref, =

   pwr_down, =

   pwr_down_mode, =

   dev, =

   chip_info, =

   write, =

   vref_reg, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad5064_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/dac/ad5064.c:105:8: note: Excessive padding in 'struct ad506=
4_state' (179 padding bytes, where 51 is optimal). Optimal fields order: da=
ta, dac_cache, use_internal_vref, pwr_down, pwr_down_mode, dev, chip_info, =
write, vref_reg, lock, consider reordering the fields or adding explicit pa=
dding members
   struct ad5064_state {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/staging/comedi/drivers/das08.c:181:2: warning: Value stored to '=
range' is never read [clang-analyzer-deadcode.DeadStores]
           range =3D CR_RANGE(insn->chanspec);
           ^
   drivers/staging/comedi/drivers/das08.c:181:2: note: Value stored to 'ran=
ge' is never read
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
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
   7 warnings generated.
   drivers/rapidio/rio-scan.c:561:10: warning: Although the value stored to=
 'tmp' is used in the enclosing expression, the value is never actually rea=
d from 'tmp' [clang-analyzer-deadcode.DeadStores]
           while ((tmp =3D rio_get_host_deviceid_lock(port, hopcount))
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rapidio/rio-scan.c:561:10: note: Although the value stored to 't=
mp' is used in the enclosing expression, the value is never actually read f=
rom 'tmp'
           while ((tmp =3D rio_get_host_deviceid_lock(port, hopcount))
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/iio/accel/bmc150-accel-core.c:152:8: warning: Excessive padding =
in 'struct bmc150_accel_chip_info' (11 padding bytes, where 3 is optimal). =

   Optimal fields order: =

   name, =

   channels, =

   num_channels, =

   scale_table, =

   chip_id, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct bmc150_accel_chip_info {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/bmc150-accel-core.c:152:8: note: Excessive padding in =
'struct bmc150_accel_chip_info' (11 padding bytes, where 3 is optimal). Opt=
imal fields order: name, channels, num_channels, scale_table, chip_id, cons=
ider reordering the fields or adding explicit padding members

vim +158 drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c

e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  129  =

e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  130  /**
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  131   * populate_enum_data() - Populate all properti=
es of an instance under enumeration attribute
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  132   * @enumeration_obj: ACPI object with enumerati=
on data
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  133   * @instance_id: The instance to enumerate
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  134   * @attr_name_kobj: The parent kernel object
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  135   */
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  136  int populate_enum_data(union acpi_object *enume=
ration_obj, int instance_id,
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  137  			struct kobject *attr_name_kobj)
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  138  {
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  139  	int i, next_obj, value_modifier_count, possibl=
e_values_count;
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  140  =

e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  141  	wmi_priv.enumeration_data[instance_id].attr_na=
me_kobj =3D attr_name_kobj;
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  142  	strlcpy_attr(wmi_priv.enumeration_data[instanc=
e_id].attribute_name,
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  143  		enumeration_obj[ATTR_NAME].string.pointer);
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  144  	strlcpy_attr(wmi_priv.enumeration_data[instanc=
e_id].display_name_language_code,
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  145  		enumeration_obj[DISPL_NAME_LANG_CODE].string.=
pointer);
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  146  	strlcpy_attr(wmi_priv.enumeration_data[instanc=
e_id].display_name,
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  147  		enumeration_obj[DISPLAY_NAME].string.pointer);
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  148  	strlcpy_attr(wmi_priv.enumeration_data[instanc=
e_id].default_value,
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  149  		enumeration_obj[DEFAULT_VAL].string.pointer);
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  150  	strlcpy_attr(wmi_priv.enumeration_data[instanc=
e_id].dell_modifier,
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  151  		enumeration_obj[MODIFIER].string.pointer);
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  152  =

e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  153  	next_obj =3D MODIFIER + 1;
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  154  =

e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  155  	value_modifier_count =3D (uintptr_t)enumeratio=
n_obj[next_obj].string.pointer;
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  156  =

e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  157  	for (i =3D 0; i < value_modifier_count; i++) {
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27 @158  		strcat(wmi_priv.enumeration_data[instance_id]=
.dell_value_modifier,
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  159  			enumeration_obj[++next_obj].string.pointer);
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  160  		strcat(wmi_priv.enumeration_data[instance_id]=
.dell_value_modifier, ";");
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  161  	}
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  162  =

e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  163  	possible_values_count =3D (uintptr_t) enumerat=
ion_obj[++next_obj].string.pointer;
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  164  =

e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  165  	for (i =3D 0; i < possible_values_count; i++) {
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  166  		strcat(wmi_priv.enumeration_data[instance_id]=
.possible_values,
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  167  			enumeration_obj[++next_obj].string.pointer);
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  168  		strcat(wmi_priv.enumeration_data[instance_id]=
.possible_values, ";");
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  169  	}
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  170  =

e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  171  	return sysfs_create_group(attr_name_kobj, &enu=
meration_attr_group);
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  172  }
e8a60aa7404bfef drivers/platform/x86/dell-wmi-sysman/enum-attributes.c Divy=
a Bharathi 2020-10-27  173  =


:::::: The code@line 158 was first introduced by commit
:::::: e8a60aa7404bfef37705da5607c97737073ac38d platform/x86: Introduce sup=
port for Systems Management Driver over WMI for Dell Systems

:::::: TO: Divya Bharathi <divya.bharathi@dell.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6155710681415049044==--

