Content-Type: multipart/mixed; boundary="===============0786158320144100283=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/of/property.c:1445:22: warning: Value stored to 'con_np' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 29 Mar 2022 23:44:24 +0800
Message-ID: <202203292334.0jqeFJDo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0786158320144100283==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Saravana Kannan <saravanak@google.com>
CC: Rob Herring <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1930a6e739c4b4a654a69164dbe39e554d228915
commit: 4a48b66b3f52aa1a8aaa8a8863891eed35769731 of: property: Disable fw_d=
evlink DT support for X86
date:   7 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-c001-20220328 (https://download.01.org/0day-ci/arch=
ive/20220329/202203292334.0jqeFJDo-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D4a48b66b3f52aa1a8aaa8a8863891eed35769731
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4a48b66b3f52aa1a8aaa8a8863891eed35769731
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   data, =

   dev, =

   chip_info, =

   write, =

   dac_cache, =

   vref_reg, =

   lock, =

   use_internal_vref, =

   pwr_down, =

   pwr_down_mode, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad5064_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/dac/ad5064.c:105:8: note: Excessive padding in 'struct ad506=
4_state' (199 padding bytes, where 71 is optimal). Optimal fields order: da=
ta, dev, chip_info, write, dac_cache, vref_reg, lock, use_internal_vref, pw=
r_down, pwr_down_mode, consider reordering the fields or adding explicit pa=
dding members
   struct ad5064_state {
   ~~~~~~~^~~~~~~~~~~~~~
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
   5 warnings generated.
   drivers/of/property.c:920:19: warning: Access to field 'full_name' resul=
ts in a dereference of a null pointer [clang-analyzer-core.NullDereference]
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:920:19: note: '?' condition is false
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/of/property.c:920:19: note: Access to field 'full_name' results =
in a dereference of a null pointer
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:926:7: warning: Access to field 'parent' results i=
n a dereference of a null pointer [clang-analyzer-core.NullDereference]
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:926:7: note: '?' condition is false
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/of/property.c:926:7: note: Access to field 'parent' results in a=
 dereference of a null pointer
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
>> drivers/of/property.c:1445:22: warning: Value stored to 'con_np' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device_node *con_np =3D to_of_node(fwnode);
                               ^~~~~~
   drivers/of/property.c:1445:22: note: Value stored to 'con_np' during its=
 initialization is never read
           struct device_node *con_np =3D to_of_node(fwnode);
                               ^~~~~~
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
   drivers/of/irq.c:567:2: warning: Dereference of null pointer [clang-anal=
yzer-core.NullDereference]
           list_for_each_entry_safe(desc, temp_desc, &intc_parent_list, lis=
t) {
           ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:494:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   drivers/of/irq.c:489:2: note: Loop condition is true.  Entering loop body
           for_each_matching_node_and_match(np, matches, &match) {
           ^
   include/linux/of.h:1297:2: note: expanded from macro 'for_each_matching_=
node_and_match'
           for (dn =3D of_find_matching_node_and_match(NULL, matches, match=
); \
           ^
   drivers/of/irq.c:490:8: note: Calling 'of_property_read_bool'
                   if (!of_property_read_bool(np, "interrupt-controller") ||
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:1235:9: note: Assuming 'prop' is null
           return prop ? true : false;
                  ^~~~
   include/linux/of.h:1235:9: note: '?' condition is false
   include/linux/of.h:1235:2: note: Returning zero, which participates in a=
 condition later
           return prop ? true : false;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/of/irq.c:490:8: note: Returning from 'of_property_read_bool'
                   if (!of_property_read_bool(np, "interrupt-controller") ||
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/of/irq.c:490:58: note: Left side of '||' is true
                   if (!of_property_read_bool(np, "interrupt-controller") ||
                                                                          ^
   drivers/of/irq.c:492:4: note:  Execution continues on line 489
                           continue;
                           ^
   drivers/of/irq.c:489:2: note: Loop condition is true.  Entering loop body
           for_each_matching_node_and_match(np, matches, &match) {
           ^
   include/linux/of.h:1297:2: note: expanded from macro 'for_each_matching_=
node_and_match'
           for (dn =3D of_find_matching_node_and_match(NULL, matches, match=
); \
           ^
   drivers/of/irq.c:490:8: note: Calling 'of_property_read_bool'
                   if (!of_property_read_bool(np, "interrupt-controller") ||
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:1235:9: note: Assuming 'prop' is non-null
           return prop ? true : false;
                  ^~~~
   include/linux/of.h:1235:9: note: '?' condition is true
   include/linux/of.h:1235:2: note: Returning the value 1, which participat=
es in a condition later
           return prop ? true : false;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/of/irq.c:490:8: note: Returning from 'of_property_read_bool'
                   if (!of_property_read_bool(np, "interrupt-controller") ||
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/of/irq.c:490:7: note: Left side of '||' is false
                   if (!of_property_read_bool(np, "interrupt-controller") ||
                       ^
   drivers/of/irq.c:491:5: note: Assuming the condition is false
                                   !of_device_is_available(np))
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/of/irq.c:490:3: note: Taking false branch
                   if (!of_property_read_bool(np, "interrupt-controller") ||
                   ^
   drivers/of/irq.c:494:12: note: Assuming field 'data' is non-null
                   if (WARN(!match->data, "of_irq_init: no init function fo=
r %s\n",
                            ^
   include/asm-generic/bug.h:130:25: note: expanded from macro 'WARN'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/of/irq.c:494:7: note: Taking false branch
                   if (WARN(!match->data, "of_irq_init: no init function fo=
r %s\n",
                       ^
   include/asm-generic/bug.h:131:2: note: expanded from macro 'WARN'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/of/irq.c:494:3: note: Taking false branch
                   if (WARN(!match->data, "of_irq_init: no init function fo=
r %s\n",
                   ^
   drivers/of/irq.c:502:10: note: Calling 'kzalloc'
                   desc =3D kzalloc(sizeof(*desc), GFP_KERNEL);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +/con_np +1445 drivers/of/property.c

a3e1d1a7f5fccca Saravana Kannan 2019-09-04  1441  =

2d09e6eb4a6f202 Saravana Kannan 2020-11-20  1442  static int of_fwnode_add_=
links(struct fwnode_handle *fwnode)
a3e1d1a7f5fccca Saravana Kannan 2019-09-04  1443  {
a3e1d1a7f5fccca Saravana Kannan 2019-09-04  1444  	struct property *p;
8a06d1ea061739d Saravana Kannan 2020-11-20 @1445  	struct device_node *con_=
np =3D to_of_node(fwnode);
a3e1d1a7f5fccca Saravana Kannan 2019-09-04  1446  =

4a48b66b3f52aa1 Saravana Kannan 2021-09-09  1447  	if (IS_ENABLED(CONFIG_X8=
6))
4a48b66b3f52aa1 Saravana Kannan 2021-09-09  1448  		return 0;
4a48b66b3f52aa1 Saravana Kannan 2021-09-09  1449  =

8a06d1ea061739d Saravana Kannan 2020-11-20  1450  	if (!con_np)
8a06d1ea061739d Saravana Kannan 2020-11-20  1451  		return -EINVAL;
d4387cd117414ba Saravana Kannan 2019-09-04  1452  =

8a06d1ea061739d Saravana Kannan 2020-11-20  1453  	for_each_property_of_nod=
e(con_np, p)
8a06d1ea061739d Saravana Kannan 2020-11-20  1454  		of_link_property(con_np=
, p->name);
a3e1d1a7f5fccca Saravana Kannan 2019-09-04  1455  =

a3e1d1a7f5fccca Saravana Kannan 2019-09-04  1456  	return 0;
a3e1d1a7f5fccca Saravana Kannan 2019-09-04  1457  }
a3e1d1a7f5fccca Saravana Kannan 2019-09-04  1458  =


:::::: The code at line 1445 was first introduced by commit
:::::: 8a06d1ea061739dd2e60aff3d64a58892e4031cf of: property: Update implem=
entation of add_links() to create fwnode links

:::::: TO: Saravana Kannan <saravanak@google.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0786158320144100283==--

