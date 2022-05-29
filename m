Content-Type: multipart/mixed; boundary="===============2460933919892575481=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/regulator/core.c:4580:9: warning: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
Date: Sun, 29 May 2022 19:41:26 +0800
Message-ID: <202205291919.VwBIhbbQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2460933919892575481==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Zev Weiss <zev@bewilderbeest.net>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9d004b2f4fea97cde123e7f1939b80e77bf2e695
commit: 0f2d636e7d1fd76f704dd3ea5089ce29a8aee049 regulator: core: Add error=
 flags to sysfs attributes
date:   4 weeks ago
:::::: branch date: 31 hours ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-c002-20220524 (https://download.01.org/0day-ci/archi=
ve/20220529/202205291919.VwBIhbbQ-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 134d7f=
9a4b97e9035150d970bd9e376043c4577e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D0f2d636e7d1fd76f704dd3ea5089ce29a8aee049
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0f2d636e7d1fd76f704dd3ea5089ce29a8aee049
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                  ^~~~~~~
   drivers/regulator/core.c:739:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", rdev->constraints->max_uA);
                  ^~~~~~~
   drivers/regulator/core.c:749:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "constraint not defined\n");
                          ^~~~~~~
   drivers/regulator/core.c:749:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "constraint not defined\n");
                          ^~~~~~~
   drivers/regulator/core.c:751:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", rdev->constraints->min_uV);
                  ^~~~~~~
   drivers/regulator/core.c:751:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", rdev->constraints->min_uV);
                  ^~~~~~~
   drivers/regulator/core.c:761:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "constraint not defined\n");
                          ^~~~~~~
   drivers/regulator/core.c:761:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "constraint not defined\n");
                          ^~~~~~~
   drivers/regulator/core.c:763:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", rdev->constraints->max_uV);
                  ^~~~~~~
   drivers/regulator/core.c:763:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", rdev->constraints->max_uV);
                  ^~~~~~~
   drivers/regulator/core.c:780:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", uA);
                  ^~~~~~~
   drivers/regulator/core.c:780:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", uA);
                  ^~~~~~~
   drivers/regulator/core.c:788:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", rdev->use_count);
                  ^~~~~~~
   drivers/regulator/core.c:788:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", rdev->use_count);
                  ^~~~~~~
   drivers/regulator/core.c:799:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "voltage\n");
                          ^~~~~~~
   drivers/regulator/core.c:799:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "voltage\n");
                          ^~~~~~~
   drivers/regulator/core.c:801:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "current\n");
                          ^~~~~~~
   drivers/regulator/core.c:801:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "current\n");
                          ^~~~~~~
   drivers/regulator/core.c:803:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "unknown\n");
                  ^~~~~~~
   drivers/regulator/core.c:803:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "unknown\n");
                  ^~~~~~~
   drivers/regulator/core.c:812:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", rdev->constraints->state_mem.uV);
                  ^~~~~~~
   drivers/regulator/core.c:812:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", rdev->constraints->state_mem.uV);
                  ^~~~~~~
   drivers/regulator/core.c:821:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", rdev->constraints->state_disk.uV);
                  ^~~~~~~
   drivers/regulator/core.c:821:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", rdev->constraints->state_disk.uV);
                  ^~~~~~~
   drivers/regulator/core.c:830:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", rdev->constraints->state_standby.uV);
                  ^~~~~~~
   drivers/regulator/core.c:830:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", rdev->constraints->state_standby.uV);
                  ^~~~~~~
   drivers/regulator/core.c:911:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           return sprintf(buf, "%s\n", report);
                  ^~~~~~~
   drivers/regulator/core.c:911:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           return sprintf(buf, "%s\n", report);
                  ^~~~~~~
   drivers/regulator/core.c:1736:8: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D snprintf(buf, PAGE_SIZE,
                 ^~~~~~~~
   drivers/regulator/core.c:1736:8: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
           ret =3D snprintf(buf, PAGE_SIZE,
                 ^~~~~~~~
   drivers/regulator/core.c:1781:10: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   size =3D snprintf(buf, REG_STR_SIZE, "%s-%s",
                          ^~~~~~~~
   drivers/regulator/core.c:1781:10: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
                   size =3D snprintf(buf, REG_STR_SIZE, "%s-%s",
                          ^~~~~~~~
   drivers/regulator/core.c:3830:3: warning: Value stored to 'possible_uV' =
is never read [clang-analyzer-deadcode.DeadStores]
                   possible_uV =3D desired_min_uV;
                   ^             ~~~~~~~~~~~~~~
   drivers/regulator/core.c:3830:3: note: Value stored to 'possible_uV' is =
never read
                   possible_uV =3D desired_min_uV;
                   ^             ~~~~~~~~~~~~~~
>> drivers/regulator/core.c:4580:9: warning: The left expression of the com=
pound assignment is an uninitialized value. The computed value will also be=
 garbage [clang-analyzer-core.uninitialized.Assign]
           *flags |=3D cached_flags;
                  ^
   drivers/regulator/core.c:937:1: note: 'flags' declared without an initia=
l value
   REGULATOR_ERROR_ATTR(over_temp_warn, REGULATOR_ERROR_OVER_TEMP_WARN);
   ^
   drivers/regulator/core.c:920:3: note: expanded from macro 'REGULATOR_ERR=
OR_ATTR'
                   unsigned int flags;                                     =
                \
                   ^~~~~~~~~~~~~~~~~~
   drivers/regulator/core.c:937:1: note: Calling '_regulator_get_error_flag=
s'
   REGULATOR_ERROR_ATTR(over_temp_warn, REGULATOR_ERROR_OVER_TEMP_WARN);
   ^
   drivers/regulator/core.c:922:9: note: expanded from macro 'REGULATOR_ERR=
OR_ATTR'
                   ret =3D _regulator_get_error_flags(rdev, &flags);       =
                  \
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/core.c:4575:6: note: Assuming field 'get_error_flags' =
is null
           if (rdev->desc->ops->get_error_flags)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/core.c:4575:2: note: Taking false branch
           if (rdev->desc->ops->get_error_flags)
           ^
   drivers/regulator/core.c:4577:18: note: Field 'use_cached_err' is false
           else if (!rdev->use_cached_err)
                           ^
   drivers/regulator/core.c:4577:7: note: Taking true branch
           else if (!rdev->use_cached_err)
                ^
   drivers/regulator/core.c:4580:9: note: The left expression of the compou=
nd assignment is an uninitialized value. The computed value will also be ga=
rbage
           *flags |=3D cached_flags;
           ~~~~~~ ^
   drivers/regulator/core.c:5141:3: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(name, sizeof(name), "%s-%s", dev_name(parent),
                   ^~~~~~~~
   drivers/regulator/core.c:5141:3: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
                   snprintf(name, sizeof(name), "%s-%s", dev_name(parent),
                   ^~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/input/touchscreen/dynapro.c:122:2: warning: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(pdynapro->phys, sizeof(pdynapro->phys),
           ^~~~~~~~
   drivers/input/touchscreen/dynapro.c:122:2: note: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(pdynapro->phys, sizeof(pdynapro->phys),
           ^~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/input/touchscreen/gunze.c:112:2: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(gunze->phys, sizeof(serio->phys), "%s/input0", serio->p=
hys);
           ^~~~~~~~
   drivers/input/touchscreen/gunze.c:112:2: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(gunze->phys, sizeof(serio->phys), "%s/input0", serio->p=
hys);
           ^~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/input/touchscreen/inexio.c:126:2: warning: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(pinexio->phys, sizeof(pinexio->phys), "%s/input0", seri=
o->phys);
           ^~~~~~~~
   drivers/input/touchscreen/inexio.c:126:2: note: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(pinexio->phys, sizeof(pinexio->phys), "%s/input0", seri=
o->phys);
           ^~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   drivers/iommu/iommu.c:420:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHand=
ling]
           return sprintf(buf, "%s\n", group->name);
                  ^~~~~~~
   drivers/iommu/iommu.c:420:9: note: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11
           return sprintf(buf, "%s\n", group->name);
                  ^~~~~~~
   drivers/iommu/iommu.c:532:10: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
                   str +=3D sprintf(str, "0x%016llx 0x%016llx %s\n",
                          ^~~~~~~
   drivers/iommu/iommu.c:532:10: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
                   str +=3D sprintf(str, "0x%016llx 0x%016llx %s\n",
                          ^~~~~~~
   drivers/iommu/iommu.c:569:2: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(buf, type);
           ^~~~~~
   drivers/iommu/iommu.c:569:2: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
           strcpy(buf, type);
           ^~~~~~
   drivers/iommu/iommu.c:1729:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&gtype, 0, sizeof(gtype));
           ^~~~~~
   drivers/iommu/iommu.c:1729:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(&gtype, 0, sizeof(gtype));
           ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/input/gameport/gameport.c:462:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide bounding of the memory buffer or se=
curity checks introduced in the C11 standard. Replace with analogous functi=
ons that support length arguments or provides boundary checks such as 'spri=
ntf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsa=
feBufferHandling]
           return sprintf(buf, "%s\n", gameport->name);

vim +4580 drivers/regulator/core.c

7111c6d1b31b42 Matti Vaittinen 2021-06-03  4565  =

1b5b42216469b0 Axel Haslam     2016-11-03  4566  static int _regulator_get_=
error_flags(struct regulator_dev *rdev,
1b5b42216469b0 Axel Haslam     2016-11-03  4567  					unsigned int *flags)
1b5b42216469b0 Axel Haslam     2016-11-03  4568  {
7111c6d1b31b42 Matti Vaittinen 2021-06-03  4569  	int cached_flags, ret =3D=
 0;
1b5b42216469b0 Axel Haslam     2016-11-03  4570  =

66cf9a7e019273 Maciej Purski   2018-04-23  4571  	regulator_lock(rdev);
1b5b42216469b0 Axel Haslam     2016-11-03  4572  =

7111c6d1b31b42 Matti Vaittinen 2021-06-03  4573  	cached_flags =3D rdev_get=
_cached_err_flags(rdev);
1b5b42216469b0 Axel Haslam     2016-11-03  4574  =

7111c6d1b31b42 Matti Vaittinen 2021-06-03  4575  	if (rdev->desc->ops->get_=
error_flags)
1b5b42216469b0 Axel Haslam     2016-11-03  4576  		ret =3D rdev->desc->ops-=
>get_error_flags(rdev, flags);
7111c6d1b31b42 Matti Vaittinen 2021-06-03  4577  	else if (!rdev->use_cache=
d_err)
7111c6d1b31b42 Matti Vaittinen 2021-06-03  4578  		ret =3D -EINVAL;
7111c6d1b31b42 Matti Vaittinen 2021-06-03  4579  =

7111c6d1b31b42 Matti Vaittinen 2021-06-03 @4580  	*flags |=3D cached_flags;
7111c6d1b31b42 Matti Vaittinen 2021-06-03  4581  =

66cf9a7e019273 Maciej Purski   2018-04-23  4582  	regulator_unlock(rdev);
7111c6d1b31b42 Matti Vaittinen 2021-06-03  4583  =

1b5b42216469b0 Axel Haslam     2016-11-03  4584  	return ret;
1b5b42216469b0 Axel Haslam     2016-11-03  4585  }
1b5b42216469b0 Axel Haslam     2016-11-03  4586  =


:::::: The code at line 4580 was first introduced by commit
:::::: 7111c6d1b31b42c8c758f6681e895a5116e3bad6 regulator: IRQ based event/=
error notification helpers

:::::: TO: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2460933919892575481==--

