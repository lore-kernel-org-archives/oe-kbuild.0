Content-Type: multipart/mixed; boundary="===============2720601470544039177=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4396/6873] drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:821:2: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support l...
Date: Wed, 27 Apr 2022 04:58:12 +0800
Message-ID: <202204270409.lh8JXWP2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2720601470544039177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Vadim Pasternak <vadimp@nvidia.com>
CC: Ido Schimmel <idosch@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   088fb7eff3496e0f61fdf68bda89b81a4d0a4434
commit: 99a03b3193f628a525ee0191e60418af6960004b [4396/6873] mlxsw: core_hw=
mon: Add interfaces for line card initialization and de-initialization
:::::: branch date: 11 hours ago
:::::: commit date: 6 days ago
config: riscv-randconfig-c006-20220424 (https://download.01.org/0day-ci/arc=
hive/20220427/202204270409.lh8JXWP2-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D99a03b3193f628a525ee0191e60418af6960004b
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 99a03b3193f628a525ee0191e60418af6960004b
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                  ^~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:449:9: note: Call to fu=
nction 'sprintf' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", temp >=3D critic_temp);
                  ^~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:463:10: warning: Call t=
o function 'sprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%d\n", false);
                          ^~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:463:10: note: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%d\n", false);
                          ^~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:469:9: warning: Call to=
 function 'sprintf' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", temp >=3D emergency_temp);
                  ^~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:469:9: note: Call to fu=
nction 'sprintf' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", temp >=3D emergency_temp);
                  ^~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:503:3: warning: Call to=
 function 'snprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'snprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:503:3: note: Call to fu=
nction 'snprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'snprintf_s' in case of C=
11
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:509:3: warning: Call to=
 function 'snprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'snprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:509:3: note: Call to fu=
nction 'snprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'snprintf_s' in case of C=
11
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:515:3: warning: Call to=
 function 'snprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'snprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:515:3: note: Call to fu=
nction 'snprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'snprintf_s' in case of C=
11
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:521:3: warning: Call to=
 function 'snprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'snprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:521:3: note: Call to fu=
nction 'snprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'snprintf_s' in case of C=
11
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:527:3: warning: Call to=
 function 'snprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'snprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:527:3: note: Call to fu=
nction 'snprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'snprintf_s' in case of C=
11
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:534:3: warning: Call to=
 function 'snprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'snprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:534:3: note: Call to fu=
nction 'snprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'snprintf_s' in case of C=
11
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:540:3: warning: Call to=
 function 'snprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'snprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:540:3: note: Call to fu=
nction 'snprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'snprintf_s' in case of C=
11
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:547:3: warning: Call to=
 function 'snprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'snprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:547:3: note: Call to fu=
nction 'snprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'snprintf_s' in case of C=
11
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:554:3: warning: Call to=
 function 'snprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'snprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:554:3: note: Call to fu=
nction 'snprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'snprintf_s' in case of C=
11
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:561:3: warning: Call to=
 function 'snprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'snprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:561:3: note: Call to fu=
nction 'snprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'snprintf_s' in case of C=
11
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:568:3: warning: Call to=
 function 'snprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'snprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:568:3: note: Call to fu=
nction 'snprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'snprintf_s' in case of C=
11
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:575:3: warning: Call to=
 function 'snprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'snprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:575:3: note: Call to fu=
nction 'snprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'snprintf_s' in case of C=
11
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:582:3: warning: Call to=
 function 'snprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'snprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:582:3: note: Call to fu=
nction 'snprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'snprintf_s' in case of C=
11
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:589:3: warning: Call to=
 function 'snprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'snprintf_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:589:3: note: Call to fu=
nction 'snprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'snprintf_s' in case of C=
11
                   snprintf(mlxsw_hwmon_attr->name, sizeof(mlxsw_hwmon_attr=
->name),
                   ^~~~~~~~
>> drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:821:2: warning: Call to=
 function 'sprintf' is insecure as it does not provide bounding of the memo=
ry buffer or security checks introduced in the C11 standard. Replace with a=
nalogous functions that support length arguments or provides boundary check=
s such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.D=
eprecatedOrUnsafeBufferHandling]
           sprintf(linecard->name, "%s#%02u", "linecard", slot_index);
           ^~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c:821:2: note: Call to fu=
nction 'sprintf' is insecure as it does not provide bounding of the memory =
buffer or security checks introduced in the C11 standard. Replace with anal=
ogous functions that support length arguments or provides boundary checks s=
uch as 'sprintf_s' in case of C11
           sprintf(linecard->name, "%s#%02u", "linecard", slot_index);
           ^~~~~~~
   Suppressed 223 warnings (223 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   mm/early_ioremap.c:261:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dest, p + slop, clen);
                   ^~~~~~
   mm/early_ioremap.c:261:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(dest, p + slop, clen);
                   ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   mm/cma.c:203:3: warning: Call to function 'snprintf' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(cma->name, CMA_MAX_NAME, name);
                   ^~~~~~~~
   mm/cma.c:203:3: note: Call to function 'snprintf' is insecure as it does=
 not provide security checks introduced in the C11 standard. Replace with a=
nalogous functions that support length arguments or provides boundary check=
s such as 'snprintf_s' in case of C11
                   snprintf(cma->name, CMA_MAX_NAME, name);
                   ^~~~~~~~
   mm/cma.c:205:3: warning: Call to function 'snprintf' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(cma->name, CMA_MAX_NAME,  "cma%d\n", cma_area_c=
ount);
                   ^~~~~~~~
   mm/cma.c:205:3: note: Call to function 'snprintf' is insecure as it does=
 not provide security checks introduced in the C11 standard. Replace with a=
nalogous functions that support length arguments or provides boundary check=
s such as 'snprintf_s' in case of C11
                   snprintf(cma->name, CMA_MAX_NAME,  "cma%d\n", cma_area_c=
ount);
                   ^~~~~~~~
   Suppressed 60 warnings (60 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (27 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   74 warnings generated.
   drivers/media/pci/smipcie/smipcie-main.c:535:2: warning: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&tuner_info, 0, sizeof(struct i2c_board_info));
           ^~~~~~
   drivers/media/pci/smipcie/smipcie-main.c:535:2: note: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11
           memset(&tuner_info, 0, sizeof(struct i2c_board_info));
           ^~~~~~
   drivers/media/pci/smipcie/smipcie-main.c:591:2: warning: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&tuner_info, 0, sizeof(struct i2c_board_info));
           ^~~~~~
   drivers/media/pci/smipcie/smipcie-main.c:591:2: note: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11
           memset(&tuner_info, 0, sizeof(struct i2c_board_info));
           ^~~~~~
   drivers/media/pci/smipcie/smipcie-main.c:639:2: warning: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&si2168_config, 0, sizeof(si2168_config));
           ^~~~~~
   drivers/media/pci/smipcie/smipcie-main.c:639:2: note: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11
           memset(&si2168_config, 0, sizeof(si2168_config));
           ^~~~~~
   drivers/media/pci/smipcie/smipcie-main.c:644:2: warning: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&client_info, 0, sizeof(struct i2c_board_info));
           ^~~~~~
   drivers/media/pci/smipcie/smipcie-main.c:644:2: note: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11
           memset(&client_info, 0, sizeof(struct i2c_board_info));
           ^~~~~~
   drivers/media/pci/smipcie/smipcie-main.c:657:2: warning: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&si2157_config, 0, sizeof(si2157_config));
           ^~~~~~
   drivers/media/pci/smipcie/smipcie-main.c:657:2: note: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11
           memset(&si2157_config, 0, sizeof(si2157_config));
           ^~~~~~
   drivers/media/pci/smipcie/smipcie-main.c:661:2: warning: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&client_info, 0, sizeof(struct i2c_board_info));
           ^~~~~~
   drivers/media/pci/smipcie/smipcie-main.c:661:2: note: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11
           memset(&client_info, 0, sizeof(struct i2c_board_info));
           ^~~~~~
   drivers/media/pci/smipcie/smipcie-main.c:716:2: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(adap->proposed_mac, mac_ee + (port->idx)*8, 6);
           ^~~~~~
   drivers/media/pci/smipcie/smipcie-main.c:716:2: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(adap->proposed_mac, mac_ee + (port->idx)*8, 6);
           ^~~~~~
   Suppressed 67 warnings (67 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (22 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (22 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +821 drivers/net/ethernet/mellanox/mlxsw/core_hwmon.c

5c42eaa07bd040d9 Vadim Pasternak 2019-02-13  785  =

99a03b3193f628a5 Vadim Pasternak 2022-04-19  786  static void
99a03b3193f628a5 Vadim Pasternak 2022-04-19  787  mlxsw_hwmon_got_active(st=
ruct mlxsw_core *mlxsw_core, u8 slot_index,
99a03b3193f628a5 Vadim Pasternak 2022-04-19  788  		       void *priv)
99a03b3193f628a5 Vadim Pasternak 2022-04-19  789  {
99a03b3193f628a5 Vadim Pasternak 2022-04-19  790  	struct mlxsw_hwmon *hwmo=
n =3D priv;
99a03b3193f628a5 Vadim Pasternak 2022-04-19  791  	struct mlxsw_hwmon_dev *=
linecard;
99a03b3193f628a5 Vadim Pasternak 2022-04-19  792  	struct device *dev;
99a03b3193f628a5 Vadim Pasternak 2022-04-19  793  	int err;
99a03b3193f628a5 Vadim Pasternak 2022-04-19  794  =

99a03b3193f628a5 Vadim Pasternak 2022-04-19  795  	dev =3D hwmon->bus_info-=
>dev;
99a03b3193f628a5 Vadim Pasternak 2022-04-19  796  	linecard =3D &hwmon->lin=
e_cards[slot_index];
99a03b3193f628a5 Vadim Pasternak 2022-04-19  797  	if (linecard->active)
99a03b3193f628a5 Vadim Pasternak 2022-04-19  798  		return;
99a03b3193f628a5 Vadim Pasternak 2022-04-19  799  	/* For the main board, m=
odule sensor indexes start from 1, sensor index
99a03b3193f628a5 Vadim Pasternak 2022-04-19  800  	 * 0 is used for the ASI=
C. Use the same numbering for line cards.
99a03b3193f628a5 Vadim Pasternak 2022-04-19  801  	 */
99a03b3193f628a5 Vadim Pasternak 2022-04-19  802  	linecard->sensor_count =
=3D 1;
99a03b3193f628a5 Vadim Pasternak 2022-04-19  803  	linecard->slot_index =3D=
 slot_index;
99a03b3193f628a5 Vadim Pasternak 2022-04-19  804  	linecard->hwmon =3D hwmo=
n;
99a03b3193f628a5 Vadim Pasternak 2022-04-19  805  	err =3D mlxsw_hwmon_modu=
le_init(linecard);
99a03b3193f628a5 Vadim Pasternak 2022-04-19  806  	if (err) {
99a03b3193f628a5 Vadim Pasternak 2022-04-19  807  		dev_err(dev, "Failed to=
 configure hwmon objects for line card modules in slot %d\n",
99a03b3193f628a5 Vadim Pasternak 2022-04-19  808  			slot_index);
99a03b3193f628a5 Vadim Pasternak 2022-04-19  809  		return;
99a03b3193f628a5 Vadim Pasternak 2022-04-19  810  	}
99a03b3193f628a5 Vadim Pasternak 2022-04-19  811  =

99a03b3193f628a5 Vadim Pasternak 2022-04-19  812  	err =3D mlxsw_hwmon_gear=
box_init(linecard);
99a03b3193f628a5 Vadim Pasternak 2022-04-19  813  	if (err) {
99a03b3193f628a5 Vadim Pasternak 2022-04-19  814  		dev_err(dev, "Failed to=
 configure hwmon objects for line card gearboxes in slot %d\n",
99a03b3193f628a5 Vadim Pasternak 2022-04-19  815  			slot_index);
99a03b3193f628a5 Vadim Pasternak 2022-04-19  816  		return;
99a03b3193f628a5 Vadim Pasternak 2022-04-19  817  	}
99a03b3193f628a5 Vadim Pasternak 2022-04-19  818  =

99a03b3193f628a5 Vadim Pasternak 2022-04-19  819  	linecard->groups[0] =3D =
&linecard->group;
99a03b3193f628a5 Vadim Pasternak 2022-04-19  820  	linecard->group.attrs =
=3D linecard->attrs;
99a03b3193f628a5 Vadim Pasternak 2022-04-19 @821  	sprintf(linecard->name, =
"%s#%02u", "linecard", slot_index);
99a03b3193f628a5 Vadim Pasternak 2022-04-19  822  	linecard->hwmon_dev =3D
99a03b3193f628a5 Vadim Pasternak 2022-04-19  823  		hwmon_device_register_w=
ith_groups(dev, linecard->name,
99a03b3193f628a5 Vadim Pasternak 2022-04-19  824  						  linecard, linecar=
d->groups);
99a03b3193f628a5 Vadim Pasternak 2022-04-19  825  	if (IS_ERR(linecard->hwm=
on_dev)) {
99a03b3193f628a5 Vadim Pasternak 2022-04-19  826  		dev_err(dev, "Failed to=
 register hwmon objects for line card in slot %d\n",
99a03b3193f628a5 Vadim Pasternak 2022-04-19  827  			slot_index);
99a03b3193f628a5 Vadim Pasternak 2022-04-19  828  		return;
99a03b3193f628a5 Vadim Pasternak 2022-04-19  829  	}
99a03b3193f628a5 Vadim Pasternak 2022-04-19  830  =

99a03b3193f628a5 Vadim Pasternak 2022-04-19  831  	linecard->active =3D tru=
e;
99a03b3193f628a5 Vadim Pasternak 2022-04-19  832  }
99a03b3193f628a5 Vadim Pasternak 2022-04-19  833  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2720601470544039177==--

