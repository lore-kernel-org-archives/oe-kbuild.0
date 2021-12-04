Content-Type: multipart/mixed; boundary="===============2739243857298024918=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/math64.h:92:15: warning: The result of the '>>' expression is undefined [clang-analyzer-core.UndefinedBinaryOperatorResult]
Date: Sun, 05 Dec 2021 04:05:04 +0800
Message-ID: <202112050326.2sOqU8Gi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2739243857298024918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   12119cfa1052d512a92524e90ebee85029a918f8
commit: e1edc277e6f6dfb372216522dfc57f9381c39e35 linux/container_of.h: swit=
ch to static_assert
date:   4 weeks ago
:::::: branch date: 23 hours ago
:::::: commit date: 4 weeks ago
config: riscv-randconfig-c006-20211128 (https://download.01.org/0day-ci/arc=
hive/20211205/202112050326.2sOqU8Gi-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b5532=
97ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De1edc277e6f6dfb372216522dfc57f9381c39e35
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e1edc277e6f6dfb372216522dfc57f9381c39e35
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                      ^
   drivers/pci/setup-bus.c:1923:2: note: Calling 'adjust_bridge_window'
           adjust_bridge_window(bridge, io_res, add_list, resource_size(&io=
));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/pci/setup-bus.c:1867:6: note: Assuming field 'parent' is null
           if (res->parent)
               ^~~~~~~~~~~
   drivers/pci/setup-bus.c:1867:2: note: Taking false branch
           if (res->parent)
           ^
   drivers/pci/setup-bus.c:1870:6: note: Assuming 'new_size' is not equal t=
o 0
           if (!new_size)
               ^~~~~~~~~
   drivers/pci/setup-bus.c:1870:2: note: Taking false branch
           if (!new_size)
           ^
   drivers/pci/setup-bus.c:1873:6: note: Assuming 'new_size' is <=3D 'size'
           if (new_size > size) {
               ^~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1873:2: note: Taking false branch
           if (new_size > size) {
           ^
   drivers/pci/setup-bus.c:1877:13: note: Assuming 'new_size' is >=3D 'size'
           } else if (new_size < size) {
                      ^~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1877:9: note: Taking false branch
           } else if (new_size < size) {
                  ^
   drivers/pci/setup-bus.c:1884:2: note: Calling 'remove_from_list'
           remove_from_list(add_list, res);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:87:2: note: Loop condition is true.  Entering lo=
op body
           list_for_each_entry_safe(dev_res, tmp, head, list) {
           ^
   include/linux/list.h:717:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   drivers/pci/setup-bus.c:88:7: note: Assuming 'res' is equal to field 're=
s'
                   if (dev_res->res =3D=3D res) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:88:3: note: Taking true branch
                   if (dev_res->res =3D=3D res) {
                   ^
   drivers/pci/setup-bus.c:90:4: note: Memory is released
                           kfree(dev_res);
                           ^~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:91:4: note:  Execution continues on line 90
                           break;
                           ^
   drivers/pci/setup-bus.c:1884:2: note: Returning; memory was released
           remove_from_list(add_list, res);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1923:2: note: Returning; memory was released
           adjust_bridge_window(bridge, io_res, add_list, resource_size(&io=
));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/pci/setup-bus.c:1924:2: note: Calling 'adjust_bridge_window'
           adjust_bridge_window(bridge, mmio_res, add_list, resource_size(&=
mmio));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/pci/setup-bus.c:1867:6: note: Assuming field 'parent' is null
           if (res->parent)
               ^~~~~~~~~~~
   drivers/pci/setup-bus.c:1867:2: note: Taking false branch
           if (res->parent)
           ^
   drivers/pci/setup-bus.c:1870:6: note: Assuming 'new_size' is not equal t=
o 0
           if (!new_size)
               ^~~~~~~~~
   drivers/pci/setup-bus.c:1870:2: note: Taking false branch
           if (!new_size)
           ^
   drivers/pci/setup-bus.c:1873:6: note: Assuming 'new_size' is <=3D 'size'
           if (new_size > size) {
               ^~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1873:2: note: Taking false branch
           if (new_size > size) {
           ^
   drivers/pci/setup-bus.c:1877:13: note: Assuming 'new_size' is >=3D 'size'
           } else if (new_size < size) {
                      ^~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1877:9: note: Taking false branch
           } else if (new_size < size) {
                  ^
   drivers/pci/setup-bus.c:1884:2: note: Calling 'remove_from_list'
           remove_from_list(add_list, res);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:87:2: note: Use of memory after it is freed
           list_for_each_entry_safe(dev_res, tmp, head, list) {
           ^
   include/linux/list.h:718:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:557:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:513:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
>> include/linux/math64.h:92:15: warning: The result of the '>>' expression=
 is undefined [clang-analyzer-core.UndefinedBinaryOperatorResult]
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:234:25: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                                  ^
   drivers/pci/setup-bus.c:2069:2: note: Calling 'pci_bridge_distribute_ava=
ilable_resources'
           pci_bridge_distribute_available_resources(bridge, &add_list);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:2036:6: note: Assuming field 'is_hotplug_bridge'=
 is not equal to 0
           if (!bridge->is_hotplug_bridge)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:2036:2: note: Taking false branch
           if (!bridge->is_hotplug_bridge)
           ^
   drivers/pci/setup-bus.c:2044:2: note: Calling 'pci_bus_distribute_availa=
ble_resources'
           pci_bus_distribute_available_resources(bridge->subordinate,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1907:6: note: Assuming field 'parent' is non-null
           if (!io_res->parent && align)
               ^~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1907:22: note: Left side of '&&' is false
           if (!io_res->parent && align)
                               ^
   drivers/pci/setup-bus.c:1911:6: note: Assuming field 'parent' is non-null
           if (!mmio_res->parent && align)
               ^~~~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1911:24: note: Left side of '&&' is false
           if (!mmio_res->parent && align)
                                 ^
   drivers/pci/setup-bus.c:1915:6: note: Assuming field 'parent' is non-null
           if (!mmio_pref_res->parent && align)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1915:29: note: Left side of '&&' is false
           if (!mmio_pref_res->parent && align)
                                      ^
   drivers/pci/setup-bus.c:1933:2: note: Loop condition is true.  Entering =
loop body
           for_each_pci_bridge(dev, bus) {
           ^
   include/linux/pci.h:693:2: note: expanded from macro 'for_each_pci_bridg=
e'
           list_for_each_entry(dev, &bus->devices, bus_list)       \
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/pci/setup-bus.c:1933:2: note: Taking false branch
           for_each_pci_bridge(dev, bus) {
           ^
   include/linux/pci.h:694:3: note: expanded from macro 'for_each_pci_bridg=
e'
                   if (!pci_is_bridge(dev)) {} else
                   ^
   drivers/pci/setup-bus.c:1934:7: note: Assuming field 'is_hotplug_bridge'=
 is 0
                   if (dev->is_hotplug_bridge)
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1934:3: note: Taking false branch
                   if (dev->is_hotplug_bridge)
                   ^
   drivers/pci/setup-bus.c:1933:2: note: Loop condition is true.  Entering =
loop body
           for_each_pci_bridge(dev, bus) {
           ^
   include/linux/pci.h:693:2: note: expanded from macro 'for_each_pci_bridg=
e'
           list_for_each_entry(dev, &bus->devices, bus_list)       \
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/pci/setup-bus.c:1933:2: note: Taking false branch
           for_each_pci_bridge(dev, bus) {
           ^
   include/linux/pci.h:694:3: note: expanded from macro 'for_each_pci_bridg=
e'
                   if (!pci_is_bridge(dev)) {} else
                   ^
   drivers/pci/setup-bus.c:1934:7: note: Assuming field 'is_hotplug_bridge'=
 is not equal to 0
                   if (dev->is_hotplug_bridge)
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1934:3: note: Taking true branch
                   if (dev->is_hotplug_bridge)
                   ^
   drivers/pci/setup-bus.c:1933:2: note: Loop condition is false. Execution=
 continues on line 1945
           for_each_pci_bridge(dev, bus) {
           ^
   include/linux/pci.h:693:2: note: expanded from macro 'for_each_pci_bridg=
e'
           list_for_each_entry(dev, &bus->devices, bus_list)       \
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/pci/setup-bus.c:1945:2: note: Taking false branch
           if (hotplug_bridges + normal_bridges =3D=3D 1) {
           ^
   drivers/pci/setup-bus.c:1953:6: note: 'hotplug_bridges' is not equal to 0
           if (hotplug_bridges =3D=3D 0)
               ^~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1953:2: note: Taking false branch
           if (hotplug_bridges =3D=3D 0)
           ^
   drivers/pci/setup-bus.c:1962:2: note: Loop condition is false. Execution=
 continues on line 1997
           for_each_pci_bridge(dev, bus) {
           ^
   include/linux/pci.h:693:2: note: expanded from macro 'for_each_pci_bridg=
e'
           list_for_each_entry(dev, &bus->devices, bus_list)       \

vim +92 include/linux/math64.h

f910381a55cdaa Sasha Levin  2012-03-15  88  =

2418f4f28f8467 Roman Zippel 2008-05-01  89  #ifndef div_u64_rem
2418f4f28f8467 Roman Zippel 2008-05-01  90  static inline u64 div_u64_rem(u=
64 dividend, u32 divisor, u32 *remainder)
2418f4f28f8467 Roman Zippel 2008-05-01  91  {
2418f4f28f8467 Roman Zippel 2008-05-01 @92  	*remainder =3D do_div(dividend=
, divisor);
2418f4f28f8467 Roman Zippel 2008-05-01  93  	return dividend;
2418f4f28f8467 Roman Zippel 2008-05-01  94  }
2418f4f28f8467 Roman Zippel 2008-05-01  95  #endif
2418f4f28f8467 Roman Zippel 2008-05-01  96  =


:::::: The code at line 92 was first introduced by commit
:::::: 2418f4f28f8467b92a6177af32d05737ebf6206c introduce explicit signed/u=
nsigned 64bit divide

:::::: TO: Roman Zippel <zippel@linux-m68k.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2739243857298024918==--

