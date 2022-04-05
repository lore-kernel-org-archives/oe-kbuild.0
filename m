Content-Type: multipart/mixed; boundary="===============4883976130179023575=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v10 1/3] drivers: ddcci: add drivers for DDCCI
Date: Wed, 06 Apr 2022 07:18:17 +0800
Message-ID: <202204060730.maLYRE0n-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4883976130179023575==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220403230850.2986-2-yusisamerican@gmail.com>
References: <20220403230850.2986-2-yusisamerican@gmail.com>
TO: Yusuf Khan <yusisamerican@gmail.com>
TO: linux-kernel(a)vger.kernel.org
CC: jasowang(a)redhat.com
CC: mikelley(a)microsoft.com
CC: mst(a)redhat.com
CC: gregkh(a)linuxfoundation.org
CC: javier(a)javigon.com
CC: arnd(a)arndb.de
CC: will(a)kernel.org
CC: axboe(a)kernel.dk
CC: Yusuf Khan <yusisamerican@gmail.com>
CC: Christoph Grenz <christophg+lkml@grenz-bonn.de>

Hi Yusuf,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on linus/master lee-backlight/for-backlight-next l=
inux/master v5.18-rc1 next-20220405]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Yusuf-Khan/drivers-d=
dcci-add-drivers-for-DDCCI/20220404-080905
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.gi=
t 37fd83916da2e4cae03d350015c82a67b1b334c4
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007-20220404 (https://download.01.org/0day-ci/ar=
chive/20220406/202204060730.maLYRE0n-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b0=
7d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d2cd44349035e12259c=
3b06514ca5deccc5b2a3c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yusuf-Khan/drivers-ddcci-add-drive=
rs-for-DDCCI/20220404-080905
        git checkout d2cd44349035e12259c3b06514ca5deccc5b2a3c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~
   drivers/acpi/acpi_video.c:954:2: note: Taking false branch
           if (result)
           ^
   drivers/acpi/acpi_video.c:961:6: note: Assuming field '_BQC' is not equa=
l to 0
           if (!device->cap._BQC)
               ^~~~~~~~~~~~~~~~~
   drivers/acpi/acpi_video.c:961:2: note: Taking false branch
           if (!device->cap._BQC)
           ^
   drivers/acpi/acpi_video.c:966:6: note: 'result' is 0
           if (result)
               ^~~~~~
   drivers/acpi/acpi_video.c:966:2: note: Taking false branch
           if (result)
           ^
   drivers/acpi/acpi_video.c:970:6: note: 'result' is 0
           if (result)
               ^~~~~~
   drivers/acpi/acpi_video.c:970:2: note: Taking false branch
           if (result)
           ^
   drivers/acpi/acpi_video.c:976:19: note: Field '_BQC' is not equal to 0
           if (!device->cap._BQC)
                            ^
   drivers/acpi/acpi_video.c:976:2: note: Taking false branch
           if (!device->cap._BQC)
           ^
   drivers/acpi/acpi_video.c:979:10: note: Calling 'acpi_video_bqc_value_to=
_level'
           level =3D acpi_video_bqc_value_to_level(device, level_old);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpi_video.c:576:6: note: Branch condition evaluates to a g=
arbage value
           if (device->brightness->flags._BQC_use_index) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpi_video.c:1171:2: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_device_name(device), ACPI_VIDEO_DEVICE_NAME);
           ^~~~~~
   drivers/acpi/acpi_video.c:1171:2: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
           strcpy(acpi_device_name(device), ACPI_VIDEO_DEVICE_NAME);
           ^~~~~~
   drivers/acpi/acpi_video.c:1172:2: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_device_class(device), ACPI_VIDEO_CLASS);
           ^~~~~~
   drivers/acpi/acpi_video.c:1172:2: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
           strcpy(acpi_device_class(device), ACPI_VIDEO_CLASS);
           ^~~~~~
   drivers/acpi/acpi_video.c:2067:2: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_device_name(device), ACPI_VIDEO_BUS_NAME);
           ^~~~~~
   drivers/acpi/acpi_video.c:2067:2: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
           strcpy(acpi_device_name(device), ACPI_VIDEO_BUS_NAME);
           ^~~~~~
   drivers/acpi/acpi_video.c:2068:2: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_device_class(device), ACPI_VIDEO_CLASS);
           ^~~~~~
   drivers/acpi/acpi_video.c:2068:2: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
           strcpy(acpi_device_class(device), ACPI_VIDEO_CLASS);
           ^~~~~~
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/char/ddcci.c:1213:3: warning: Value stored to 'ret' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                   ret =3D driver->remove(device);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ddcci.c:1213:3: note: Value stored to 'ret' is never read
                   ret =3D driver->remove(device);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/char/pcmcia/cm4000_cs.c:1570:4: warning: Value stored to 'rc' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           rc =3D 0;
                           ^    ~
   drivers/char/pcmcia/cm4000_cs.c:1570:4: note: Value stored to 'rc' is ne=
ver read
                           rc =3D 0;
                           ^    ~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   crypto/ecc.c:147:24: warning: The left operand of '&' is a garbage value=
 [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return (vli[bit / 64] & ((u64)1 << (bit % 64)));
                                 ^
   crypto/ecc.c:1618:6: note: Assuming 'private_key' is non-null
           if (!private_key || !public_key || !curve ||
               ^~~~~~~~~~~~
   crypto/ecc.c:1618:6: note: Left side of '||' is false
   crypto/ecc.c:1618:22: note: Assuming 'public_key' is non-null
           if (!private_key || !public_key || !curve ||
                               ^~~~~~~~~~~
   crypto/ecc.c:1618:6: note: Left side of '||' is false
           if (!private_key || !public_key || !curve ||
               ^
   crypto/ecc.c:1618:38: note: 'curve' is non-null
           if (!private_key || !public_key || !curve ||
                                               ^~~~~
   crypto/ecc.c:1618:6: note: Left side of '||' is false
           if (!private_key || !public_key || !curve ||
               ^
   crypto/ecc.c:1619:6: note: Assuming the condition is false
               ndigits > ARRAY_SIZE(priv) || ndigits > ARRAY_SIZE(rand_z)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:1618:6: note: Left side of '||' is false
           if (!private_key || !public_key || !curve ||
               ^
   crypto/ecc.c:1618:2: note: Taking false branch
           if (!private_key || !public_key || !curve ||
           ^
   crypto/ecc.c:1629:7: note: 'pk' is non-null
           if (!pk) {
                ^~
   crypto/ecc.c:1629:2: note: Taking false branch
           if (!pk) {
           ^
   crypto/ecc.c:1636:8: note: Calling 'ecc_is_pubkey_valid_partial'
           ret =3D ecc_is_pubkey_valid_partial(curve, pk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:1553:14: note: Assuming 'pk->ndigits' is equal to 'curve->g=
.ndigits'
           if (WARN_ON(pk->ndigits !=3D curve->g.ndigits))
                       ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   crypto/ecc.c:1553:6: note: Taking false branch
           if (WARN_ON(pk->ndigits !=3D curve->g.ndigits))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   crypto/ecc.c:1553:2: note: Taking false branch
           if (WARN_ON(pk->ndigits !=3D curve->g.ndigits))
           ^
   crypto/ecc.c:1557:2: note: Taking false branch
           if (ecc_point_is_zero(pk))
           ^
   crypto/ecc.c:1561:2: note: Taking false branch
           if (vli_cmp(curve->p, pk->x, pk->ndigits) !=3D 1)
           ^
   crypto/ecc.c:1563:2: note: Taking false branch
           if (vli_cmp(curve->p, pk->y, pk->ndigits) !=3D 1)
           ^
   crypto/ecc.c:1567:2: note: Calling 'vli_mod_square_fast'
           vli_mod_square_fast(yy, pk->y, curve); /* y^2 */
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:982:2: note: Calling 'vli_mmod_fast'

vim +/ret +1213 drivers/char/ddcci.c

d2cd44349035e1 Yusuf Khan 2022-04-03  1201  =

d2cd44349035e1 Yusuf Khan 2022-04-03  1202  static void ddcci_device_remove=
(struct device *dev)
d2cd44349035e1 Yusuf Khan 2022-04-03  1203  {
d2cd44349035e1 Yusuf Khan 2022-04-03  1204  	struct ddcci_device	*device =
=3D ddcci_verify_device(dev);
d2cd44349035e1 Yusuf Khan 2022-04-03  1205  	struct ddcci_driver	*driver;
d2cd44349035e1 Yusuf Khan 2022-04-03  1206  	int ret =3D 0;
d2cd44349035e1 Yusuf Khan 2022-04-03  1207  =

d2cd44349035e1 Yusuf Khan 2022-04-03  1208  	if (!device)
d2cd44349035e1 Yusuf Khan 2022-04-03  1209  		return;
d2cd44349035e1 Yusuf Khan 2022-04-03  1210  	driver =3D to_ddcci_driver(dev=
->driver);
d2cd44349035e1 Yusuf Khan 2022-04-03  1211  =

d2cd44349035e1 Yusuf Khan 2022-04-03  1212  	if (driver->remove)
d2cd44349035e1 Yusuf Khan 2022-04-03 @1213  		ret =3D driver->remove(device=
);
d2cd44349035e1 Yusuf Khan 2022-04-03  1214  }
d2cd44349035e1 Yusuf Khan 2022-04-03  1215  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4883976130179023575==--

