Content-Type: multipart/mixed; boundary="===============5192985744970295993=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pci/controller/pcie-rcar-host.c:478:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 17 Jan 2022 01:50:09 +0800
Message-ID: <202201170131.yhY5ZHqW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5192985744970295993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vincent <vincent.chen@sifive.com>
CC: Palmer Dabbelt <palmerdabbelt@google.com>

Hi Vincent,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4d66020dcef83314092f2c8c89152a8d122627e2
commit: b75db25c416b9f0edae7cd86c4901c216a52e7a0 riscv: skip errata_cip_453=
.o if CONFIG_ERRATA_SIFIVE_CIP_453 is disabled
date:   8 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 8 months ago
config: riscv-randconfig-c006-20220111 (https://download.01.org/0day-ci/arc=
hive/20220117/202201170131.yhY5ZHqW-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2=
913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db75db25c416b9f0edae7cd86c4901c216a52e7a0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b75db25c416b9f0edae7cd86c4901c216a52e7a0
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ntfs/dir.c:1300:15: note: Left side of '||' is false
           if (unlikely((u8*)ia < kaddr || (u8*)ia > kaddr + PAGE_SIZE)) {
                        ^
   fs/ntfs/dir.c:1300:2: note: '?' condition is false
           if (unlikely((u8*)ia < kaddr || (u8*)ia > kaddr + PAGE_SIZE)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ntfs/dir.c:1300:15: note: 'ia' is >=3D 'kaddr'
           if (unlikely((u8*)ia < kaddr || (u8*)ia > kaddr + PAGE_SIZE)) {
                        ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/ntfs/dir.c:1300:15: note: Left side of '||' is false
           if (unlikely((u8*)ia < kaddr || (u8*)ia > kaddr + PAGE_SIZE)) {
                        ^
   fs/ntfs/dir.c:1300:15: note: 'ia' is >=3D 'kaddr'
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/ntfs/dir.c:1300:15: note: Left side of '||' is false
           if (unlikely((u8*)ia < kaddr || (u8*)ia > kaddr + PAGE_SIZE)) {
                        ^
   fs/ntfs/dir.c:1300:2: note: '?' condition is false
           if (unlikely((u8*)ia < kaddr || (u8*)ia > kaddr + PAGE_SIZE)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/ntfs/dir.c:1300:2: note: Taking false branch
           if (unlikely((u8*)ia < kaddr || (u8*)ia > kaddr + PAGE_SIZE)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ntfs/dir.c:1306:36: note: Access to field 'magic' results in a derefe=
rence of a null pointer (loaded from variable 'ia')
           if (unlikely(!ntfs_is_indx_record(ia->magic))) {
                                             ^
   fs/ntfs/layout.h:139:50: note: expanded from macro 'ntfs_is_indx_record'
   #define ntfs_is_indx_record(x)          ( ntfs_is_magic (x, INDX) )
                                                            ^
   fs/ntfs/layout.h:124:45: note: expanded from macro 'ntfs_is_magic'
   #define ntfs_is_magic(x, m)     __ntfs_is_magic(x, magic_##m)
                                                   ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/pci/controller/pcie-rcar-host.c:478:17: warning: Value stored to=
 'dev' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct device *dev =3D pcie->dev;
                          ^~~   ~~~~~~~~~
   drivers/pci/controller/pcie-rcar-host.c:478:17: note: Value stored to 'd=
ev' during its initialization is never read
           struct device *dev =3D pcie->dev;
                          ^~~   ~~~~~~~~~
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   drivers/pci/controller/pcie-rcar-host.c:973:8: note: Calling 'rcar_pcie_=
parse_map_dma_ranges'
           err =3D rcar_pcie_parse_map_dma_ranges(host);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-rcar-host.c:843:2: note: Left side of '&&' i=
s false
           resource_list_for_each_entry(entry, &bridge->dma_ranges) {
           ^
   include/linux/resource_ext.h:64:2: note: expanded from macro 'resource_l=
ist_for_each_entry'
           list_for_each_entry((entry), (list), node)
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/pci/controller/pcie-rcar-host.c:843:2: note: '?' condition is tr=
ue
           resource_list_for_each_entry(entry, &bridge->dma_ranges) {
           ^
   include/linux/resource_ext.h:64:2: note: expanded from macro 'resource_l=
ist_for_each_entry'
           list_for_each_entry((entry), (list), node)
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/pci/controller/pcie-rcar-host.c:843:2: note: Left side of '&&' i=
s false
           resource_list_for_each_entry(entry, &bridge->dma_ranges) {
           ^
   include/linux/resource_ext.h:64:2: note: expanded from macro 'resource_l=
ist_for_each_entry'
           list_for_each_entry((entry), (list), node)
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/pci/controller/pcie-rcar-host.c:843:2: note: Taking false branch
           resource_list_for_each_entry(entry, &bridge->dma_ranges) {
           ^
   include/linux/resource_ext.h:64:2: note: expanded from macro 'resource_l=
ist_for_each_entry'
           list_for_each_entry((entry), (list), node)
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/pci/controller/pcie-rcar-host.c:843:2: note: Loop condition is f=
alse.  Exiting loop
           resource_list_for_each_entry(entry, &bridge->dma_ranges) {
           ^
   include/linux/resource_ext.h:64:2: note: expanded from macro 'resource_l=
ist_for_each_entry'
           list_for_each_entry((entry), (list), node)
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
--
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   include/asm-generic/bitops/fls.h:17:2: note: Taking true branch
           if (!x)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/asm-generic/bitops/fls.h:18:3: note: Returning zero
                   return 0;
                   ^~~~~~~~
   drivers/pinctrl/pinctrl-single.c:729:23: note: Returning from 'fls'
                   pcs->bits_per_pin =3D fls(pcs->fmask);
                                       ^~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-single.c:729:3: note: The value 0 is assigned to=
 field 'bits_per_pin'
                   pcs->bits_per_pin =3D fls(pcs->fmask);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-single.c:730:41: note: Division by zero
                   nr_pins =3D (pcs->size * BITS_PER_BYTE) / pcs->bits_per_=
pin;
                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-single.c:880:40: warning: The result of the righ=
t shift is undefined due to shifting by '4294967295', which is greater or e=
qual to the width of type 'unsigned int' [clang-analyzer-core.UndefinedBina=
ryOperatorResult]
           add_setting(settings, param, value[0] >> shift);
                                                 ^  ~~~~~
   drivers/pinctrl/pinctrl-single.c:873:2: note: '?' condition is false
           if (ret)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/pinctrl/pinctrl-single.c:873:6: note: 'ret' is 0
           if (ret)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/pinctrl/pinctrl-single.c:873:2: note: '?' condition is false
           if (ret)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/pinctrl/pinctrl-single.c:873:2: note: Taking false branch
           if (ret)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/pinctrl/pinctrl-single.c:877:2: note: The value 4294967295 is as=
signed to 'shift'
           shift =3D ffs(value[1]) - 1;
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-single.c:880:40: note: The result of the right s=
hift is undefined due to shifting by '4294967295', which is greater or equa=
l to the width of type 'unsigned int'
           add_setting(settings, param, value[0] >> shift);
                                                 ^  ~~~~~
   drivers/pinctrl/pinctrl-single.c:1419:3: warning: Value stored to 'mask'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   mask =3D pcs->read(pcswi->reg);
                   ^      ~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-single.c:1419:3: note: Value stored to 'mask' is=
 never read
                   mask =3D pcs->read(pcswi->reg);
                   ^      ~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   4 warnings generated.
>> drivers/misc/habanalabs/common/device.c:117:7: warning: Use of memory af=
ter it is freed [clang-analyzer-unix.Malloc]
           if (!hl_hpriv_put(hpriv))
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/misc/habanalabs/common/device.c:103:6: note: Assuming 'hdev' is =
non-null
           if (!hdev) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/misc/habanalabs/common/device.c:103:2: note: '?' condition is fa=
lse
           if (!hdev) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/misc/habanalabs/common/device.c:103:7: note: 'hdev' is non-null
           if (!hdev) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/misc/habanalabs/common/device.c:103:2: note: '?' condition is fa=
lse
           if (!hdev) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/misc/habanalabs/common/device.c:103:2: note: Taking false branch
           if (!hdev) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/misc/habanalabs/common/device.c:117:7: note: Calling 'hl_hpriv_p=
ut'
           if (!hl_hpriv_put(hpriv))
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/misc/habanalabs/common/device.c:85:9: note: Calling 'kref_put'
           return kref_put(&hpriv->refcount, hpriv_release);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: '?' condition is false
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   include/linux/kref.h:64:2: note: '?' condition is true
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/linux/kref.h:65:3: note: Calling 'hpriv_release'
                   release(kref);
--
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/dvb-frontends/s5h1420.c:170:2: note: 'debug' is 0
           dprintk("enter %s\n", __func__);
           ^
   drivers/media/dvb-frontends/s5h1420.c:61:6: note: expanded from macro 'd=
printk'
           if (debug) \
               ^~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/media/dvb-frontends/s5h1420.c:170:2: note: '?' condition is false
           dprintk("enter %s\n", __func__);
           ^
   drivers/media/dvb-frontends/s5h1420.c:61:2: note: expanded from macro 'd=
printk'
           if (debug) \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/media/dvb-frontends/s5h1420.c:170:2: note: Taking false branch
           dprintk("enter %s\n", __func__);
           ^
   drivers/media/dvb-frontends/s5h1420.c:61:2: note: expanded from macro 'd=
printk'
           if (debug) \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/dvb-frontends/s5h1420.c:170:2: note: Loop condition is fal=
se.  Exiting loop
           dprintk("enter %s\n", __func__);
           ^
   drivers/media/dvb-frontends/s5h1420.c:60:23: note: expanded from macro '=
dprintk'
   #define dprintk(x...) do { \
                         ^
   drivers/media/dvb-frontends/s5h1420.c:171:6: note: Assuming the conditio=
n is false
           if (cmd->msg_len > sizeof(cmd->msg))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/dvb-frontends/s5h1420.c:171:2: note: '?' condition is false
           if (cmd->msg_len > sizeof(cmd->msg))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/dvb-frontends/s5h1420.c:171:2: note: '?' condition is false
           if (cmd->msg_len > sizeof(cmd->msg))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/media/dvb-frontends/s5h1420.c:171:2: note: Taking false branch
           if (cmd->msg_len > sizeof(cmd->msg))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/dvb-frontends/s5h1420.c:180:11: note: Assuming 'i' is >=3D=
 field 'msg_len'
           for(i=3D0; i< cmd->msg_len; i++) {
                    ^~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/s5h1420.c:180:2: note: Loop condition is fal=
se. Execution continues on line 185
           for(i=3D0; i< cmd->msg_len; i++) {
           ^
   drivers/media/dvb-frontends/s5h1420.c:186:29: note: The result of the le=
ft shift is undefined because the left operand is negative
                                         ((cmd->msg_len-1) << 4) | 0x08);
                                          ~~~~~~~~~~~~~~~~ ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/scsi/ufs/ufshcd-pci.c:83:2: warning: Value stored to 'err' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           err =3D __intel_dsm(intel_host, dev, INTEL_DSM_FNS, &intel_host-=
>dsm_fns);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/scsi/ufs/ufshcd-pci.c:83:2: note: Value stored to 'err' is never=
 read
           err =3D __intel_dsm(intel_host, dev, INTEL_DSM_FNS, &intel_host-=
>dsm_fns);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/dvb-frontends/tc90522.c:51:2: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   drivers/media/dvb-frontends/tc90522.c:51:2: note: Value stored to 'ret' =
is never read
           ret =3D 0;
           ^     ~
   drivers/media/dvb-frontends/tc90522.c:343:2: warning: Value stored to 'm=
ode' is never read [clang-analyzer-deadcode.DeadStores]
           mode =3D 1;
           ^      ~
   drivers/media/dvb-frontends/tc90522.c:343:2: note: Value stored to 'mode=
' is never read
           mode =3D 1;
           ^      ~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/dvb-frontends/horus3a.c:141:23: warning: Value stored to '=
priv' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct horus3a_priv *priv =3D fe->tuner_priv;
                                ^~~~   ~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/horus3a.c:141:23: note: Value stored to 'pri=
v' during its initialization is never read
           struct horus3a_priv *priv =3D fe->tuner_priv;
                                ^~~~   ~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/horus3a.c:149:23: warning: Value stored to '=
priv' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct horus3a_priv *priv =3D fe->tuner_priv;
                                ^~~~   ~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/horus3a.c:149:23: note: Value stored to 'pri=
v' during its initialization is never read
           struct horus3a_priv *priv =3D fe->tuner_priv;
                                ^~~~   ~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:684:31: warning: Value s=
tored to 'plane_fmt' during its initialization is never read [clang-analyze=
r-deadcode.DeadStores]
           struct v4l2_plane_pix_format plane_fmt =3D {};
                                        ^~~~~~~~~   ~~
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:684:31: note: Value stor=
ed to 'plane_fmt' during its initialization is never read
           struct v4l2_plane_pix_format plane_fmt =3D {};
                                        ^~~~~~~~~   ~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:149:16: warning: The l=
eft operand of '>' is a garbage value due to array index out of bounds [cla=
ng-analyzer-core.UndefinedBinaryOperatorResult]
                   if (brz_w[i] > 3)
                                ^
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:181:2: note: '?' condi=
tion is false
           if (mtk_jpeg_decide_format(param))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:181:2: note: '?' condi=
tion is false
           if (mtk_jpeg_decide_format(param))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:181:2: note: Taking fa=
lse branch
           if (mtk_jpeg_decide_format(param))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:186:6: note: Calling '=
mtk_jpeg_calc_dst_size'
           if (mtk_jpeg_calc_dst_size(param))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:148:14: note: Assuming=
 'i' is < field 'comp_num'
           for (i =3D 0; i < param->comp_num; i++) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:148:2: note: Loop cond=
ition is true.  Entering loop body
           for (i =3D 0; i < param->comp_num; i++) {
           ^
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:149:3: note: '?' condi=
tion is false
                   if (brz_w[i] > 3)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
--
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/scsi/dc395x.c:3738:2: note: Loop condition is true.  Entering lo=
op body
           list_for_each_entry_safe(dcb, tmp, &acb->dcb_list, list)
           ^
   include/linux/list.h:715:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   drivers/scsi/dc395x.c:3739:3: note: Calling 'adapter_remove_and_free_dev=
ice'
                   adapter_remove_and_free_device(acb, dcb);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/dc395x.c:3713:6: note: Assuming the condition is false
           if (list_size(&dcb->srb_going_list) > 1) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/scsi/dc395x.c:3713:2: note: '?' condition is false
           if (list_size(&dcb->srb_going_list) > 1) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/scsi/dc395x.c:3713:6: note: Assuming the condition is false
           if (list_size(&dcb->srb_going_list) > 1) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/scsi/dc395x.c:3713:2: note: '?' condition is false
           if (list_size(&dcb->srb_going_list) > 1) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/scsi/dc395x.c:3713:2: note: Taking false branch
           if (list_size(&dcb->srb_going_list) > 1) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/scsi/dc395x.c:3721:2: note: Argument to kfree() is a constant ad=
dress (256), which is not memory allocated by malloc()
           kfree(dcb);
           ^     ~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/media/platform/qcom/camss/camss-csid-170.c:398:3: warning: Value=
 stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]
                   val =3D 0;
                   ^     ~
   drivers/media/platform/qcom/camss/camss-csid-170.c:398:3: note: Value st=
ored to 'val' is never read
                   val =3D 0;
                   ^     ~
>> drivers/media/platform/qcom/camss/camss-csid-170.c:478:2: warning: Value=
 stored to 'hw_gen' is never read [clang-analyzer-deadcode.DeadStores]
           hw_gen =3D (hw_version >> HW_VERSION_GENERATION) & 0xF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-170.c:478:2: note: Value st=
ored to 'hw_gen' is never read
           hw_gen =3D (hw_version >> HW_VERSION_GENERATION) & 0xF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss-csid-170.c:479:2: warning: Value=
 stored to 'hw_rev' is never read [clang-analyzer-deadcode.DeadStores]
           hw_rev =3D (hw_version >> HW_VERSION_REVISION) & 0xFFF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-170.c:479:2: note: Value st=
ored to 'hw_rev' is never read
           hw_rev =3D (hw_version >> HW_VERSION_REVISION) & 0xFFF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss-csid-170.c:480:2: warning: Value=
 stored to 'hw_step' is never read [clang-analyzer-deadcode.DeadStores]
           hw_step =3D (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-170.c:480:2: note: Value st=
ored to 'hw_step' is never read
           hw_step =3D (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/media/dvb-frontends/af9013.c:45:21: warning: Value stored to 'cl=
ient' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:45:21: note: Value stored to 'clien=
t' during its initialization is never read
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:108:21: warning: Value stored to 'c=
lient' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:108:21: note: Value stored to 'clie=
nt' during its initialization is never read
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:401:21: warning: Value stored to 'c=
lient' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:401:21: note: Value stored to 'clie=
nt' during its initialization is never read
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:518:21: warning: Value stored to 'c=
lient' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:518:21: note: Value stored to 'clie=
nt' during its initialization is never read
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:832:21: warning: Value stored to 'c=
lient' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:832:21: note: Value stored to 'clie=
nt' during its initialization is never read
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:980:21: warning: Value stored to 'c=
lient' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:980:21: note: Value stored to 'clie=
nt' during its initialization is never read
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:1166:21: warning: Value stored to '=
client' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:1166:21: note: Value stored to 'cli=
ent' during its initialization is never read
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:1185:21: warning: Value stored to '=
client' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:1185:21: note: Value stored to 'cli=
ent' during its initialization is never read
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:1239:21: warning: Value stored to '=
client' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:1239:21: note: Value stored to 'cli=
ent' during its initialization is never read
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:1260:21: warning: Value stored to '=
client' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/af9013.c:1260:21: note: Value stored to 'cli=
ent' during its initialization is never read
           struct i2c_client *client =3D state->client;
                              ^~~~~~   ~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/media/platform/sti/hva/hva-hw.c:134:15: warning: Access to field=
 'hw_err' results in a dereference of a null pointer (loaded from variable =
'ctx') [clang-analyzer-core.NullDereference]
                   ctx->hw_err =3D true;
                   ~~~         ^
   drivers/media/platform/sti/hva/hva-hw.c:121:2: note: 'ctx' initialized t=
o a null pointer value
           struct hva_ctx *ctx =3D NULL;
           ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/sti/hva/hva-hw.c:123:2: note: '?' condition is tr=
ue
           dev_dbg(dev, "%s     %s: status: 0x%02x fifo level: 0x%02x\n",
--
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:957:2: note: Taking true bran=
ch
           if (jpeg->mode =3D=3D MXC_JPEG_ENCODE) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:958:3: note: '?' condition is=
 true
                   dev_dbg(dev, "Encoding on slot %d\n", ctx->slot);
                   ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:958:3: note: Taking false bra=
nch
                   dev_dbg(dev, "Encoding on slot %d\n", ctx->slot);
                   ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:960:3: note: Calling 'mxc_jpe=
g_config_enc_desc'
                   mxc_jpeg_config_enc_desc(&dst_buf->vb2_buf, ctx,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:876:12: note: Calling 'mxc_jp=
eg_fourcc_to_imgfmt'
           img_fmt =3D mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:387:2: note: Control jumps to=
 the 'default' case at line 400
           switch (fourcc) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:401:3: note: Returning the va=
lue -1
                   return MXC_JPEG_INVALID;
                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:876:12: note: Returning from =
'mxc_jpeg_fourcc_to_imgfmt'
           img_fmt =3D mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:876:2: note: The value -1 is =
assigned to 'img_fmt'
           img_fmt =3D mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:877:2: note: '?' condition is=
 false
           if (img_fmt =3D=3D MXC_JPEG_INVALID)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:877:6: note: 'img_fmt' is equ=
al to MXC_JPEG_INVALID
           if (img_fmt =3D=3D MXC_JPEG_INVALID)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:877:2: note: '?' condition is=
 true
           if (img_fmt =3D=3D MXC_JPEG_INVALID)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:877:2: note: Taking true bran=
ch
           if (img_fmt =3D=3D MXC_JPEG_INVALID)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:880:5: note: The result of th=
e left shift is undefined because the left operand is negative
                            STM_CTRL_IMAGE_FORMAT(img_fmt);
                            ^
   drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h:84:52: note: expanded from=
 macro 'STM_CTRL_IMAGE_FORMAT'
   #define STM_CTRL_IMAGE_FORMAT(img_fmt)          ((img_fmt) << 3)
                                                    ~~~~~~~~~ ^
>> drivers/media/platform/imx-jpeg/mxc-jpeg.c:979:17: warning: Value stored=
 to 'dev' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct device *dev =3D ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:979:17: note: Value stored to=
 'dev' during its initialization is never read
           struct device *dev =3D ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1005:17: warning: Value store=
d to 'dev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct device *dev =3D ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1005:17: note: Value stored t=
o 'dev' during its initialization is never read
           struct device *dev =3D ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1177:3: warning: 1st function=
 call argument is an uninitialized value [clang-analyzer-core.CallAndMessag=
e]
                   if (!q->sizeimage[0])
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1752:8: note: Calling 'mxc_jp=
eg_try_fmt_vid_out'
           ret =3D mxc_jpeg_try_fmt_vid_out(file, priv, f);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1649:16: note: Assuming field=
 'mode' is not equal to MXC_JPEG_ENCODE
           int q_type =3D (jpeg->mode =3D=3D MXC_JPEG_ENCODE) ?
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1649:15: note: '?' condition =
is false
           int q_type =3D (jpeg->mode =3D=3D MXC_JPEG_ENCODE) ?
                        ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Assuming field =
'type' is not equal to V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Left side of '|=
|' is false
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Assuming field =
'type' is equal to V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:162:6: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
            || (type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:2: note: '?' condition i=
s false
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:35: note: Field 'type' i=
s not equal to V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                                            ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Left side of '|=
|' is false
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:2: note: '?' condition i=
s false
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:2: note: Taking false br=
anch
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1658:7: note: 'fmt' is non-nu=
ll
           if (!fmt || fmt->flags !=3D q_type) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
                   ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1546:11: note: Assuming field=
 'height' is >=3D MXC_JPEG_MAX_HEIGHT
           u32 h =3D (pix_mp->height < MXC_JPEG_MAX_HEIGHT) ?
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1546:10: note: '?' condition =
is false
           u32 h =3D (pix_mp->height < MXC_JPEG_MAX_HEIGHT) ?
                   ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1577:14: note: Assuming 'i' i=
s >=3D field 'num_planes'
           for (i =3D 0; i < pix_mp->num_planes; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1577:2: note: Loop condition =
is false. Execution continues on line 1584
           for (i =3D 0; i < pix_mp->num_planes; i++) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1584:2: note: Calling 'mxc_jp=
eg_bytesperline'
           mxc_jpeg_bytesperline(&tmp_q, 8);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1153:6: note: Assuming the co=
ndition is true
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1153:2: note: '?' condition i=
s false
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1153:2: note: '?' condition i=
s true
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1153:2: note: Taking true bra=
nch
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1584:2: note: Returning from =
'mxc_jpeg_bytesperline'
           mxc_jpeg_bytesperline(&tmp_q, 8);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1585:2: note: Calling 'mxc_jp=
eg_sizeimage'
           mxc_jpeg_sizeimage(&tmp_q);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1175:2: note: '?' condition i=
s false
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1175:2: note: '?' condition i=
s true
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1175:2: note: Taking true bra=
nch
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1177:3: note: 1st function ca=
ll argument is an uninitialized value
                   if (!q->sizeimage[0])
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^                    ~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1451:17: warning: Value store=
d to 'dev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct device *dev =3D mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1451:17: note: Value stored t=
o 'dev' during its initialization is never read
           struct device *dev =3D mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~
>> drivers/media/platform/imx-jpeg/mxc-jpeg.c:1591:22: warning: Assigned va=
lue is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   pfmt->bytesperline =3D tmp_q.bytesperline[i];
                                      ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1752:8: note: Calling 'mxc_jp=
eg_try_fmt_vid_out'
           ret =3D mxc_jpeg_try_fmt_vid_out(file, priv, f);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1649:16: note: Assuming field=
 'mode' is not equal to MXC_JPEG_ENCODE
           int q_type =3D (jpeg->mode =3D=3D MXC_JPEG_ENCODE) ?
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1649:15: note: '?' condition =
is false
           int q_type =3D (jpeg->mode =3D=3D MXC_JPEG_ENCODE) ?
                        ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Assuming field =
'type' is not equal to V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Left side of '|=
|' is false
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Assuming field =
'type' is equal to V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:162:6: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
            || (type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:2: note: '?' condition i=
s false
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:35: note: Field 'type' i=
s not equal to V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                                            ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Left side of '|=
|' is false
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:2: note: '?' condition i=
s false
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:2: note: Taking false br=
anch
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1658:7: note: 'fmt' is non-nu=
ll
           if (!fmt || fmt->flags !=3D q_type) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1658:6: note: Left side of '|=
|' is false
           if (!fmt || fmt->flags !=3D q_type) {
               ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1658:14: note: Assuming 'q_ty=
pe' is equal to field 'flags'
           if (!fmt || fmt->flags !=3D q_type) {
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1658:2: note: '?' condition i=
s false
           if (!fmt || fmt->flags !=3D q_type) {
--
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/btrfs/check-integrity.c:656:2: note: '?' condition is false
           if (NULL =3D=3D state->latest_superblock) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/btrfs/check-integrity.c:656:6: note: Null is not equal to field 'late=
st_superblock'
           if (NULL =3D=3D state->latest_superblock) {
               ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/btrfs/check-integrity.c:656:2: note: '?' condition is false
           if (NULL =3D=3D state->latest_superblock) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/btrfs/check-integrity.c:656:2: note: Taking false branch
           if (NULL =3D=3D state->latest_superblock) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/btrfs/check-integrity.c:662:2: note: Loop condition is true.  Enterin=
g loop body
           for (pass =3D 0; pass < 3; pass++) {
           ^
   fs/btrfs/check-integrity.c:667:3: note: Control jumps to 'case 0:' @l=
ine 668
                   switch (pass) {
                   ^
   fs/btrfs/check-integrity.c:669:18: note: Calling 'btrfs_super_root'
                           next_bytenr =3D btrfs_super_root(selected_super);
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ctree.h:2366:1: note: Calling 'get_unaligned_le64'
   BTRFS_SETGET_STACK_FUNCS(super_root, struct btrfs_super_block, root, 64);
   ^
   fs/btrfs/ctree.h:1614:9: note: expanded from macro 'BTRFS_SETGET_STACK_F=
UNCS'
           return get_unaligned_le##bits(&s->member);                      \
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/unaligned/le_struct.h:19:9: note: Calling '__get_unaligned=
_cpu64'
           return __get_unaligned_cpu64((const u8 *)p);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/unaligned/packed_struct.h:25:2: note: Undefined or garbage=
 value returned to caller
           return ptr->x;
           ^      ~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/scsi/megaraid/megaraid_sas_base.c:3156:2: warning: Value stored =
to 'offset' is never read [clang-analyzer-deadcode.DeadStores]
           offset +=3D map->nr_queues;
           ^         ~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c:3156:2: note: Value stored to =
'offset' is never read
           offset +=3D map->nr_queues;
           ^         ~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c:5973:2: warning: Value stored =
to 'fusion' is never read [clang-analyzer-deadcode.DeadStores]
           fusion =3D instance->ctrl_context;
           ^        ~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c:5973:2: note: Value stored to =
'fusion' is never read
           fusion =3D instance->ctrl_context;
           ^        ~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c:6348:2: warning: Value stored =
to 'tmp_sectors' is never read [clang-analyzer-deadcode.DeadStores]
           tmp_sectors =3D 0;
           ^             ~
   drivers/scsi/megaraid/megaraid_sas_base.c:6348:2: note: Value stored to =
'tmp_sectors' is never read
           tmp_sectors =3D 0;
           ^             ~
   drivers/scsi/megaraid/megaraid_sas_base.c:6955:2: warning: Value stored =
to 'consistent_mask' is never read [clang-analyzer-deadcode.DeadStores]
           consistent_mask =3D (instance->adapter_type >=3D VENTURA_SERIES)=
 ?
           ^                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c:6955:2: note: Value stored to =
'consistent_mask' is never read
           consistent_mask =3D (instance->adapter_type >=3D VENTURA_SERIES)=
 ?
           ^                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
>> drivers/scsi/megaraid/megaraid_sas_fusion.c:1005:9: warning: Use of memo=
ry after it is freed [clang-analyzer-unix.Malloc]
                   cmd =3D fusion->cmd_list[i];
                         ^~~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_fusion.c:982:2: note: '?' condition i=
s false
           if (megasas_alloc_request_fusion(instance))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:982:2: note: '?' condition i=
s false
           if (megasas_alloc_request_fusion(instance))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:982:2: note: Taking false br=
anch
           if (megasas_alloc_request_fusion(instance))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:985:2: note: Assuming field =
'is_rdpq' is 0
           if (instance->is_rdpq) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/scsi/megaraid/megaraid_sas_fusion.c:985:2: note: '?' condition i=
s false
           if (instance->is_rdpq) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:985:16: note: Field 'is_rdpq=
' is 0
           if (instance->is_rdpq) {
                         ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:985:2: note: '?' condition i=
s false
           if (instance->is_rdpq) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:985:2: note: Taking false br=
anch
           if (instance->is_rdpq) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:989:3: note: '?' condition i=
s false
                   if (megasas_alloc_reply_fusion(instance))
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:989:3: note: '?' condition i=
s false
                   if (megasas_alloc_reply_fusion(instance))
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:989:3: note: Taking false br=
anch
                   if (megasas_alloc_reply_fusion(instance))
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:992:6: note: Calling 'megasa=
s_alloc_cmdlist_fusion'
           if (megasas_alloc_cmdlist_fusion(instance))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   security/keys/encrypted-keys/encrypted.c:462:2: note: '?' condition is t=
rue
           if (IS_ERR(req))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   security/keys/encrypted-keys/encrypted.c:462:2: note: Taking true branch
           if (IS_ERR(req))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/keys/encrypted-keys/encrypted.c:463:3: note: Control jumps to l=
ine 485
                   goto out;
                   ^
   security/keys/encrypted-keys/encrypted.c:930:8: note: Returned allocated=
 memory
           ret =3D derived_key_encrypt(epayload, derived_key, sizeof derive=
d_key);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   security/keys/encrypted-keys/encrypted.c:931:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   security/keys/encrypted-keys/encrypted.c:931:2: note: '?' condition is f=
alse
           if (ret < 0)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   security/keys/encrypted-keys/encrypted.c:931:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   security/keys/encrypted-keys/encrypted.c:931:2: note: '?' condition is f=
alse
           if (ret < 0)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   security/keys/encrypted-keys/encrypted.c:931:2: note: Taking false branch
           if (ret < 0)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/keys/encrypted-keys/encrypted.c:935:6: note: Assuming 'ret' is =
>=3D 0
           if (ret < 0)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   security/keys/encrypted-keys/encrypted.c:935:2: note: Potential leak of =
memory pointed to by 'ret'
           if (ret < 0)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/pci/controller/pcie-rcar-host.c:478:17: warning: Value stored to=
 'dev' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct device *dev =3D pcie->dev;
                          ^~~   ~~~~~~~~~
   drivers/pci/controller/pcie-rcar-host.c:478:17: note: Value stored to 'd=
ev' during its initialization is never read
           struct device *dev =3D pcie->dev;
                          ^~~   ~~~~~~~~~
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   drivers/pci/controller/pcie-rcar-host.c:973:8: note: Calling 'rcar_pcie_=
parse_map_dma_ranges'
           err =3D rcar_pcie_parse_map_dma_ranges(host);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-rcar-host.c:843:2: note: Left side of '&&' i=
s false
           resource_list_for_each_entry(entry, &bridge->dma_ranges) {
           ^
   include/linux/resource_ext.h:64:2: note: expanded from macro 'resource_l=
ist_for_each_entry'
           list_for_each_entry((entry), (list), node)
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/pci/controller/pcie-rcar-host.c:843:2: note: '?' condition is tr=
ue
           resource_list_for_each_entry(entry, &bridge->dma_ranges) {
           ^
   include/linux/resource_ext.h:64:2: note: expanded from macro 'resource_l=
ist_for_each_entry'
           list_for_each_entry((entry), (list), node)
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/pci/controller/pcie-rcar-host.c:843:2: note: Left side of '&&' i=
s false
           resource_list_for_each_entry(entry, &bridge->dma_ranges) {
           ^
   include/linux/resource_ext.h:64:2: note: expanded from macro 'resource_l=
ist_for_each_entry'
           list_for_each_entry((entry), (list), node)
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/pci/controller/pcie-rcar-host.c:843:2: note: Taking false branch
           resource_list_for_each_entry(entry, &bridge->dma_ranges) {
           ^
   include/linux/resource_ext.h:64:2: note: expanded from macro 'resource_l=
ist_for_each_entry'
           list_for_each_entry((entry), (list), node)
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/pci/controller/pcie-rcar-host.c:843:2: note: Loop condition is f=
alse.  Exiting loop
           resource_list_for_each_entry(entry, &bridge->dma_ranges) {
           ^
   include/linux/resource_ext.h:64:2: note: expanded from macro 'resource_l=
ist_for_each_entry'
           list_for_each_entry((entry), (list), node)
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
--
                                                                      ^
   drivers/media/tuners/tda9887.c:684:13: note: Loop condition is false.  E=
xiting loop
           instance =3D hybrid_tuner_request_state(struct tda9887_priv, pri=
v,
                      ^
   drivers/media/tuners/tuner-i2c.h:143:3: note: expanded from macro 'hybri=
d_tuner_request_state'
                   __tuner_info(state->i2c_props,                          \
                   ^
   drivers/media/tuners/tuner-i2c.h:90:2: note: expanded from macro '__tune=
r_info'
           tuner_printk(KERN_INFO, i2cprops, fmt, ##arg);                  \
           ^
   drivers/media/tuners/tuner-i2c.h:75:54: note: expanded from macro 'tuner=
_printk'
   #define tuner_printk(kernlvl, i2cprops, fmt, arg...) do {               \
                                                        ^
   drivers/media/tuners/tda9887.c:684:13: note: Loop condition is false.  E=
xiting loop
           instance =3D hybrid_tuner_request_state(struct tda9887_priv, pri=
v,
                      ^
   drivers/media/tuners/tuner-i2c.h:143:3: note: expanded from macro 'hybri=
d_tuner_request_state'
                   __tuner_info(state->i2c_props,                          \
                   ^
   drivers/media/tuners/tuner-i2c.h:89:45: note: expanded from macro '__tun=
er_info'
   #define __tuner_info(i2cprops, fmt, arg...) do {                        \
                                               ^
   drivers/media/tuners/tda9887.c:684:61: note: The expression is an uninit=
ialized value. The computed value will also be garbage
           instance =3D hybrid_tuner_request_state(struct tda9887_priv, pri=
v,
                                                                      ^
   drivers/media/tuners/tuner-i2c.h:146:3: note: expanded from macro 'hybri=
d_tuner_request_state'
                   state->i2c_props.count++;                               \
                   ^~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/fat/fatent.c:482:2: warning: Value stored to 'err' is never read [cla=
ng-analyzer-deadcode.DeadStores]
           err =3D nr_bhs =3D idx_clus =3D 0;
           ^     ~~~~~~~~~~~~~~~~~~~~~
   fs/fat/fatent.c:482:2: note: Value stored to 'err' is never read
           err =3D nr_bhs =3D idx_clus =3D 0;
           ^     ~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/char/tpm/tpm_tis_core.c:411:2: warning: Value stored to 'rc' is =
never read [clang-analyzer-deadcode.DeadStores]
           rc =3D tpm_tis_write32(priv, TPM_INT_ENABLE(priv->locality), int=
mask);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/char/tpm/tpm_tis_core.c:411:2: note: Value stored to 'rc' is nev=
er read
           rc =3D tpm_tis_write32(priv, TPM_INT_ENABLE(priv->locality), int=
mask);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/char/tpm/tpm_tis_core.c:855:23: warning: Value stored to 'data' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct tpm_tis_data *data =3D dev_get_drvdata(&chip->dev);
                                ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:855:23: note: Value stored to 'data' dur=
ing its initialization is never read
           struct tpm_tis_data *data =3D dev_get_drvdata(&chip->dev);
                                ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   4 warnings generated.
>> drivers/misc/habanalabs/common/device.c:117:7: warning: Use of memory af=
ter it is freed [clang-analyzer-unix.Malloc]
           if (!hl_hpriv_put(hpriv))
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/misc/habanalabs/common/device.c:103:6: note: Assuming 'hdev' is =
non-null
           if (!hdev) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/misc/habanalabs/common/device.c:103:2: note: '?' condition is fa=
lse
           if (!hdev) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/misc/habanalabs/common/device.c:103:7: note: 'hdev' is non-null
           if (!hdev) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/misc/habanalabs/common/device.c:103:2: note: '?' condition is fa=
lse
           if (!hdev) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/misc/habanalabs/common/device.c:103:2: note: Taking false branch
           if (!hdev) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/misc/habanalabs/common/device.c:117:7: note: Calling 'hl_hpriv_p=
ut'
           if (!hl_hpriv_put(hpriv))
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/misc/habanalabs/common/device.c:85:9: note: Calling 'kref_put'
           return kref_put(&hpriv->refcount, hpriv_release);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: '?' condition is false
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   include/linux/kref.h:64:2: note: '?' condition is true
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/linux/kref.h:65:3: note: Calling 'hpriv_release'
                   release(kref);
--
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:957:2: note: Taking true bran=
ch
           if (jpeg->mode =3D=3D MXC_JPEG_ENCODE) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:958:3: note: '?' condition is=
 true
                   dev_dbg(dev, "Encoding on slot %d\n", ctx->slot);
                   ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:958:3: note: Taking false bra=
nch
                   dev_dbg(dev, "Encoding on slot %d\n", ctx->slot);
                   ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:960:3: note: Calling 'mxc_jpe=
g_config_enc_desc'
                   mxc_jpeg_config_enc_desc(&dst_buf->vb2_buf, ctx,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:876:12: note: Calling 'mxc_jp=
eg_fourcc_to_imgfmt'
           img_fmt =3D mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:387:2: note: Control jumps to=
 the 'default' case at line 400
           switch (fourcc) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:401:3: note: Returning the va=
lue -1
                   return MXC_JPEG_INVALID;
                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:876:12: note: Returning from =
'mxc_jpeg_fourcc_to_imgfmt'
           img_fmt =3D mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:876:2: note: The value -1 is =
assigned to 'img_fmt'
           img_fmt =3D mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:877:2: note: '?' condition is=
 false
           if (img_fmt =3D=3D MXC_JPEG_INVALID)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:877:6: note: 'img_fmt' is equ=
al to MXC_JPEG_INVALID
           if (img_fmt =3D=3D MXC_JPEG_INVALID)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:877:2: note: '?' condition is=
 true
           if (img_fmt =3D=3D MXC_JPEG_INVALID)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:877:2: note: Taking true bran=
ch
           if (img_fmt =3D=3D MXC_JPEG_INVALID)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:880:5: note: The result of th=
e left shift is undefined because the left operand is negative
                            STM_CTRL_IMAGE_FORMAT(img_fmt);
                            ^
   drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h:84:52: note: expanded from=
 macro 'STM_CTRL_IMAGE_FORMAT'
   #define STM_CTRL_IMAGE_FORMAT(img_fmt)          ((img_fmt) << 3)
                                                    ~~~~~~~~~ ^
>> drivers/media/platform/imx-jpeg/mxc-jpeg.c:979:17: warning: Value stored=
 to 'dev' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct device *dev =3D ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:979:17: note: Value stored to=
 'dev' during its initialization is never read
           struct device *dev =3D ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1005:17: warning: Value store=
d to 'dev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct device *dev =3D ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1005:17: note: Value stored t=
o 'dev' during its initialization is never read
           struct device *dev =3D ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1177:3: warning: 1st function=
 call argument is an uninitialized value [clang-analyzer-core.CallAndMessag=
e]
                   if (!q->sizeimage[0])
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1752:8: note: Calling 'mxc_jp=
eg_try_fmt_vid_out'
           ret =3D mxc_jpeg_try_fmt_vid_out(file, priv, f);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1649:16: note: Assuming field=
 'mode' is not equal to MXC_JPEG_ENCODE
           int q_type =3D (jpeg->mode =3D=3D MXC_JPEG_ENCODE) ?
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1649:15: note: '?' condition =
is false
           int q_type =3D (jpeg->mode =3D=3D MXC_JPEG_ENCODE) ?
                        ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Assuming field =
'type' is not equal to V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Left side of '|=
|' is false
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Assuming field =
'type' is equal to V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:162:6: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
            || (type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:2: note: '?' condition i=
s false
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:35: note: Field 'type' i=
s not equal to V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                                            ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Left side of '|=
|' is false
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:2: note: '?' condition i=
s false
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:2: note: Taking false br=
anch
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1658:7: note: 'fmt' is non-nu=
ll
           if (!fmt || fmt->flags !=3D q_type) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
                   ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1546:11: note: Assuming field=
 'height' is >=3D MXC_JPEG_MAX_HEIGHT
           u32 h =3D (pix_mp->height < MXC_JPEG_MAX_HEIGHT) ?
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1546:10: note: '?' condition =
is false
           u32 h =3D (pix_mp->height < MXC_JPEG_MAX_HEIGHT) ?
                   ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1577:14: note: Assuming 'i' i=
s >=3D field 'num_planes'
           for (i =3D 0; i < pix_mp->num_planes; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1577:2: note: Loop condition =
is false. Execution continues on line 1584
           for (i =3D 0; i < pix_mp->num_planes; i++) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1584:2: note: Calling 'mxc_jp=
eg_bytesperline'
           mxc_jpeg_bytesperline(&tmp_q, 8);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1153:6: note: Assuming the co=
ndition is true
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1153:2: note: '?' condition i=
s false
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1153:2: note: '?' condition i=
s true
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1153:2: note: Taking true bra=
nch
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1584:2: note: Returning from =
'mxc_jpeg_bytesperline'
           mxc_jpeg_bytesperline(&tmp_q, 8);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1585:2: note: Calling 'mxc_jp=
eg_sizeimage'
           mxc_jpeg_sizeimage(&tmp_q);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1175:2: note: '?' condition i=
s false
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1175:2: note: '?' condition i=
s true
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1175:2: note: Taking true bra=
nch
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1177:3: note: 1st function ca=
ll argument is an uninitialized value
                   if (!q->sizeimage[0])
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^                    ~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1451:17: warning: Value store=
d to 'dev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct device *dev =3D mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1451:17: note: Value stored t=
o 'dev' during its initialization is never read
           struct device *dev =3D mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~
>> drivers/media/platform/imx-jpeg/mxc-jpeg.c:1591:22: warning: Assigned va=
lue is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   pfmt->bytesperline =3D tmp_q.bytesperline[i];
                                      ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1752:8: note: Calling 'mxc_jp=
eg_try_fmt_vid_out'
           ret =3D mxc_jpeg_try_fmt_vid_out(file, priv, f);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1649:16: note: Assuming field=
 'mode' is not equal to MXC_JPEG_ENCODE
           int q_type =3D (jpeg->mode =3D=3D MXC_JPEG_ENCODE) ?
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1649:15: note: '?' condition =
is false
           int q_type =3D (jpeg->mode =3D=3D MXC_JPEG_ENCODE) ?
                        ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Assuming field =
'type' is not equal to V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Left side of '|=
|' is false
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Assuming field =
'type' is equal to V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:162:6: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
            || (type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:2: note: '?' condition i=
s false
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:35: note: Field 'type' i=
s not equal to V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                                            ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Left side of '|=
|' is false
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:2: note: '?' condition i=
s false
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:2: note: Taking false br=
anch
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1658:7: note: 'fmt' is non-nu=
ll
           if (!fmt || fmt->flags !=3D q_type) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1658:6: note: Left side of '|=
|' is false
           if (!fmt || fmt->flags !=3D q_type) {
               ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1658:14: note: Assuming 'q_ty=
pe' is equal to field 'flags'
           if (!fmt || fmt->flags !=3D q_type) {
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1658:2: note: '?' condition i=
s false
           if (!fmt || fmt->flags !=3D q_type) {
--
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/android/binder_alloc.c:837:12: note: Left side of '&&' is false
                   buffer =3D list_first_entry(&alloc->buffers,
                            ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/android/binder_alloc.c:837:12: note: Taking false branch
                   buffer =3D list_first_entry(&alloc->buffers,
                            ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/android/binder_alloc.c:837:12: note: Loop condition is false.  E=
xiting loop
                   buffer =3D list_first_entry(&alloc->buffers,
                            ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/android/binder_alloc.c:839:12: note: Use of memory after it is f=
reed
                   WARN_ON(!buffer->free);
                            ^
   include/asm-generic/bug.h:188:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/android/binder_alloc.c:857:4: warning: Value stored to 'on_lru' =
is never read [clang-analyzer-deadcode.DeadStores]
                           on_lru =3D list_lru_del(&binder_alloc_lru,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/android/binder_alloc.c:857:4: note: Value stored to 'on_lru' is =
never read
                           on_lru =3D list_lru_del(&binder_alloc_lru,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/android/binder_alloc.c:859:4: warning: Value stored to 'page_add=
r' is never read [clang-analyzer-deadcode.DeadStores]
                           page_addr =3D alloc->buffer + i * PAGE_SIZE;
                           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/android/binder_alloc.c:859:4: note: Value stored to 'page_addr' =
is never read
                           page_addr =3D alloc->buffer + i * PAGE_SIZE;
                           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/media/platform/qcom/camss/camss-csid-170.c:398:3: warning: Value=
 stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]
                   val =3D 0;
                   ^     ~
   drivers/media/platform/qcom/camss/camss-csid-170.c:398:3: note: Value st=
ored to 'val' is never read
                   val =3D 0;
                   ^     ~
>> drivers/media/platform/qcom/camss/camss-csid-170.c:478:2: warning: Value=
 stored to 'hw_gen' is never read [clang-analyzer-deadcode.DeadStores]
           hw_gen =3D (hw_version >> HW_VERSION_GENERATION) & 0xF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-170.c:478:2: note: Value st=
ored to 'hw_gen' is never read
           hw_gen =3D (hw_version >> HW_VERSION_GENERATION) & 0xF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss-csid-170.c:479:2: warning: Value=
 stored to 'hw_rev' is never read [clang-analyzer-deadcode.DeadStores]
           hw_rev =3D (hw_version >> HW_VERSION_REVISION) & 0xFFF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-170.c:479:2: note: Value st=
ored to 'hw_rev' is never read
           hw_rev =3D (hw_version >> HW_VERSION_REVISION) & 0xFFF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss-csid-170.c:480:2: warning: Value=
 stored to 'hw_step' is never read [clang-analyzer-deadcode.DeadStores]
           hw_step =3D (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-170.c:480:2: note: Value st=
ored to 'hw_step' is never read
           hw_step =3D (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c:32:5: warning: =
Value stored to 'hw_version' during its initialization is never read [clang=
-analyzer-deadcode.DeadStores]
           u8 hw_version =3D readl_relaxed(csiphy->base +
              ^~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c:32:5: note: Val=
ue stored to 'hw_version' during its initialization is never read
           u8 hw_version =3D readl_relaxed(csiphy->base +
              ^~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   fs/xfs/libxfs/xfs_dir2_leaf.c:1285:43: warning: Access to field 'b_addr'=
 results in a dereference of a null pointer (loaded from variable 'dbp') [c=
lang-analyzer-core.NullDereference]
                   dep =3D (xfs_dir2_data_entry_t *)((char *)dbp->b_addr +
                                                           ^~~
   fs/xfs/libxfs/xfs_dir2_leaf.c:1217:2: note: 'dbp' initialized to a null =
pointer value
           struct xfs_buf          *dbp =3D NULL;    /* data buffer */
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_leaf.c:1236:2: note: '?' condition is false
           if (error)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/xfs/libxfs/xfs_dir2_leaf.c:1236:6: note: 'error' is 0
           if (error)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/xfs/libxfs/xfs_dir2_leaf.c:1236:2: note: '?' condition is false
           if (error)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/xfs/libxfs/xfs_dir2_leaf.c:1236:2: note: Taking false branch
           if (error)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/xfs/libxfs/xfs_dir2_leaf.c:1253:7: note: Assuming 'index' is < field =
'count'
                index < leafhdr->count &&
                ^~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_leaf.c:1253:7: note: Left side of '&&' is true
   fs/xfs/libxfs/xfs_dir2_leaf.c:1254:4: note: '?' condition is false
                           be32_to_cpu(lep->hashval) =3D=3D args->hashval;
                           ^
   include/linux/byteorder/generic.h:95:21: note: expanded from macro 'be32=
_to_cpu'
   #define be32_to_cpu __be32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:40:26: note: expanded from =
macro '__be32_to_cpu'
   #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
                            ^
   include/uapi/linux/swab.h:118:3: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
            ^
   fs/xfs/libxfs/xfs_dir2_leaf.c:1254:4: note: Assuming the condition is tr=
ue
                           be32_to_cpu(lep->hashval) =3D=3D args->hashval;
                           ^
   include/linux/byteorder/generic.h:95:21: note: expanded from macro 'be32=
_to_cpu'
   #define be32_to_cpu __be32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:40:26: note: expanded from =
macro '__be32_to_cpu'
   #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
                            ^
   include/uapi/linux/swab.h:118:2: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
           ^
   fs/xfs/libxfs/xfs_dir2_leaf.c:1252:2: note: Loop condition is true.  Ent=
ering loop body
           for (lep =3D &leafhdr->ents[index];
           ^
   fs/xfs/libxfs/xfs_dir2_leaf.c:1259:7: note: '?' condition is false
                   if (be32_to_cpu(lep->address) =3D=3D XFS_DIR2_NULL_DATAP=
TR)
                       ^
   include/linux/byteorder/generic.h:95:21: note: expanded from macro 'be32=
_to_cpu'
   #define be32_to_cpu __be32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:40:26: note: expanded from =
macro '__be32_to_cpu'
--
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   include/asm-generic/bitops/fls.h:31:2: note: '?' condition is false
           if (!(x & 0xc0000000u)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   include/asm-generic/bitops/fls.h:31:2: note: '?' condition is false
           if (!(x & 0xc0000000u)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   include/asm-generic/bitops/fls.h:31:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/asm-generic/bitops/fls.h:35:6: note: Assuming the condition is f=
alse
           if (!(x & 0x80000000u)) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   include/asm-generic/bitops/fls.h:35:2: note: '?' condition is false
           if (!(x & 0x80000000u)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   include/asm-generic/bitops/fls.h:35:2: note: '?' condition is false
           if (!(x & 0x80000000u)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   include/asm-generic/bitops/fls.h:35:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/asm-generic/bitops/fls.h:39:2: note: Returning the value 32 (loa=
ded from 'r')
           return r;
           ^~~~~~~~
   include/linux/bitops.h:188:10: note: Returning from 'fls'
                   return fls(l);
                          ^~~~~~
   include/linux/bitops.h:188:3: note: Returning the value 32
                   return fls(l);
                   ^~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Returning from 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:13: note: The result of the left shift is undefi=
ned due to shifting by '32', which is greater or equal to the width of type=
 'unsigned long'
           return 1UL << fls_long(n - 1);
                      ^  ~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
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
   4 warnings generated.
>> drivers/scsi/ufs/ufshcd-pci.c:83:2: warning: Value stored to 'err' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           err =3D __intel_dsm(intel_host, dev, INTEL_DSM_FNS, &intel_host-=
>dsm_fns);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/scsi/ufs/ufshcd-pci.c:83:2: note: Value stored to 'err' is never=
 read
           err =3D __intel_dsm(intel_host, dev, INTEL_DSM_FNS, &intel_host-=
>dsm_fns);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/dvb-frontends/cxd2880/cxd2880_top.c:1361:4: warning: Value=
 stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D cxd2880_set_ber_per_period_t(fe);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2880/cxd2880_top.c:1361:4: note: Value st=
ored to 'ret' is never read
                           ret =3D cxd2880_set_ber_per_period_t(fe);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2880/cxd2880_top.c:1366:5: warning: Value=
 stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                                   ret =3D cxd2880_set_ber_per_period_t2(fe=
);
                                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2880/cxd2880_top.c:1366:5: note: Value st=
ored to 'ret' is never read
                                   ret =3D cxd2880_set_ber_per_period_t2(fe=
);
                                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/comedi/drivers/mite.c:687:13: warning: Access to field 'next' re=
sults in a dereference of a null pointer (loaded from variable 'desc') [cla=
ng-analyzer-core.NullDereference]
           desc->next =3D cpu_to_le32(ring->dma_addr);
                      ^
   drivers/comedi/drivers/mite.c:725:6: note: Assuming field 'prealloc_bufs=
z' is not equal to 0
           if (async->prealloc_bufsz =3D=3D 0)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
--
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/btrfs/reada.c:185:9: note: Loop condition is false.  Exiting loop
                   rec =3D list_first_entry(&list, struct reada_extctl, lis=
t);
                         ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/btrfs/reada.c:186:3: note: Calling 'list_del'
                   list_del(&rec->list);
                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:146:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:132:2: note: '?' condition is false
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   include/linux/list.h:132:2: note: '?' condition is false
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   include/linux/list.h:132:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/linux/list.h:135:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/scsi/megaraid/megaraid_sas_base.c:3156:2: warning: Value stored =
to 'offset' is never read [clang-analyzer-deadcode.DeadStores]
           offset +=3D map->nr_queues;
           ^         ~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c:3156:2: note: Value stored to =
'offset' is never read
           offset +=3D map->nr_queues;
           ^         ~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c:5973:2: warning: Value stored =
to 'fusion' is never read [clang-analyzer-deadcode.DeadStores]
           fusion =3D instance->ctrl_context;
           ^        ~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c:5973:2: note: Value stored to =
'fusion' is never read
           fusion =3D instance->ctrl_context;
           ^        ~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c:6348:2: warning: Value stored =
to 'tmp_sectors' is never read [clang-analyzer-deadcode.DeadStores]
           tmp_sectors =3D 0;
           ^             ~
   drivers/scsi/megaraid/megaraid_sas_base.c:6348:2: note: Value stored to =
'tmp_sectors' is never read
           tmp_sectors =3D 0;
           ^             ~
   drivers/scsi/megaraid/megaraid_sas_base.c:6955:2: warning: Value stored =
to 'consistent_mask' is never read [clang-analyzer-deadcode.DeadStores]
           consistent_mask =3D (instance->adapter_type >=3D VENTURA_SERIES)=
 ?
           ^                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c:6955:2: note: Value stored to =
'consistent_mask' is never read
           consistent_mask =3D (instance->adapter_type >=3D VENTURA_SERIES)=
 ?
           ^                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
>> drivers/scsi/megaraid/megaraid_sas_fusion.c:1005:9: warning: Use of memo=
ry after it is freed [clang-analyzer-unix.Malloc]
                   cmd =3D fusion->cmd_list[i];
                         ^~~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_fusion.c:982:2: note: '?' condition i=
s false
           if (megasas_alloc_request_fusion(instance))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:982:2: note: '?' condition i=
s false
           if (megasas_alloc_request_fusion(instance))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:982:2: note: Taking false br=
anch
           if (megasas_alloc_request_fusion(instance))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:985:2: note: Assuming field =
'is_rdpq' is 0
           if (instance->is_rdpq) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/scsi/megaraid/megaraid_sas_fusion.c:985:2: note: '?' condition i=
s false
           if (instance->is_rdpq) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:985:16: note: Field 'is_rdpq=
' is 0
           if (instance->is_rdpq) {
                         ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:985:2: note: '?' condition i=
s false
           if (instance->is_rdpq) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:985:2: note: Taking false br=
anch
           if (instance->is_rdpq) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:989:3: note: '?' condition i=
s false
                   if (megasas_alloc_reply_fusion(instance))
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:989:3: note: '?' condition i=
s false
                   if (megasas_alloc_reply_fusion(instance))
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:989:3: note: Taking false br=
anch
                   if (megasas_alloc_reply_fusion(instance))
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/scsi/megaraid/megaraid_sas_fusion.c:992:6: note: Calling 'megasa=
s_alloc_cmdlist_fusion'
           if (megasas_alloc_cmdlist_fusion(instance))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )

vim +/dev +478 drivers/pci/controller/pcie-rcar-host.c

581d9434aa56b4 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2016-0=
1-05  472  =

290c1fb3586054 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-0=
5-12  473  static irqreturn_t rcar_pcie_msi_irq(int irq, void *data)
290c1fb3586054 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-0=
5-12  474  {
78a0d7f2f5a313 drivers/pci/controller/pcie-rcar-host.c Lad Prabhakar 2020-0=
5-07  475  	struct rcar_pcie_host *host =3D data;
78a0d7f2f5a313 drivers/pci/controller/pcie-rcar-host.c Lad Prabhakar 2020-0=
5-07  476  	struct rcar_pcie *pcie =3D &host->pcie;
78a0d7f2f5a313 drivers/pci/controller/pcie-rcar-host.c Lad Prabhakar 2020-0=
5-07  477  	struct rcar_msi *msi =3D &host->msi;
4ef80d72a6f1a3 drivers/pci/host/pcie-rcar.c            Bjorn Helgaas 2016-1=
0-10 @478  	struct device *dev =3D pcie->dev;
290c1fb3586054 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-0=
5-12  479  	unsigned long reg;
290c1fb3586054 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-0=
5-12  480  =

b77188495de64a drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-0=
6-30  481  	reg =3D rcar_pci_read_reg(pcie, PCIEMSIFR);
290c1fb3586054 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-0=
5-12  482  =

290c1fb3586054 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-0=
5-12  483  	/* MSI & INTx share an interrupt - we only handle MSI here */
290c1fb3586054 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-0=
5-12  484  	if (!reg)
290c1fb3586054 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-0=
5-12  485  		return IRQ_NONE;
290c1fb3586054 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-0=
5-12  486  =

290c1fb3586054 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-0=
5-12  487  	while (reg) {
290c1fb3586054 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-0=
5-12  488  		unsigned int index =3D find_first_bit(&reg, 32);
a27beb5820d1a5 drivers/pci/controller/pcie-rcar.c      Wolfram Sang  2019-0=
3-17  489  		unsigned int msi_irq;
290c1fb3586054 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-0=
5-12  490  =

83ed8d4fa656d3 drivers/pci/controller/pcie-rcar-host.c Marc Zyngier  2021-0=
3-30  491  		msi_irq =3D irq_find_mapping(msi->domain->parent, index);
a27beb5820d1a5 drivers/pci/controller/pcie-rcar.c      Wolfram Sang  2019-0=
3-17  492  		if (msi_irq) {
a27beb5820d1a5 drivers/pci/controller/pcie-rcar.c      Wolfram Sang  2019-0=
3-17  493  			generic_handle_irq(msi_irq);
290c1fb3586054 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-0=
5-12  494  		} else {
290c1fb3586054 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-0=
5-12  495  			/* Unknown MSI, just clear it */
4ef80d72a6f1a3 drivers/pci/host/pcie-rcar.c            Bjorn Helgaas 2016-1=
0-10  496  			dev_dbg(dev, "unexpected MSI\n");
83ed8d4fa656d3 drivers/pci/controller/pcie-rcar-host.c Marc Zyngier  2021-0=
3-30  497  			rcar_pci_write_reg(pcie, BIT(index), PCIEMSIFR);
290c1fb3586054 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-0=
5-12  498  		}
290c1fb3586054 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-0=
5-12  499  =

290c1fb3586054 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-0=
5-12  500  		/* see if there's any more pending in this vector */
b77188495de64a drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-0=
6-30  501  		reg =3D rcar_pci_read_reg(pcie, PCIEMSIFR);
290c1fb3586054 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-0=
5-12  502  	}
290c1fb3586054 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-0=
5-12  503  =

290c1fb3586054 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-0=
5-12  504  	return IRQ_HANDLED;
290c1fb3586054 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-0=
5-12  505  }
290c1fb3586054 drivers/pci/host/pcie-rcar.c            Phil Edworthy 2014-0=
5-12  506  =


:::::: The code at line 478 was first introduced by commit
:::::: 4ef80d72a6f1a379e471960f48e051ab5e102fc0 PCI: rcar: Add local struct=
 device pointers

:::::: TO: Bjorn Helgaas <bhelgaas@google.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5192985744970295993==--

