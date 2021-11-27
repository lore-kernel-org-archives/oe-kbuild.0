Content-Type: multipart/mixed; boundary="===============7277368332569371609=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/acpi/property.c:1093:24: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Sun, 28 Nov 2021 07:11:22 +0800
Message-ID: <202111280726.dHgvPza1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7277368332569371609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   86799cdfbcd2308cbad6c1dc983b81595b77b639
commit: 9054fc6d57e80c27c0b0632966416144f2092c2b ACPI: Get acpi_device's pa=
rent from the parent field
date:   4 days ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-c007-20211126 (https://download.01.org/0day-ci/ar=
chive/20211128/202111280726.dHgvPza1-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b5=
58d8c0b542e752b037e72a69d5fd51eb1e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D9054fc6d57e80c27c0b0632966416144f2092c2b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9054fc6d57e80c27c0b0632966416144f2092c2b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/acpi/property.c:708:2: note: Taking false branch
           if (obj->type !=3D ACPI_TYPE_PACKAGE)
           ^
   drivers/acpi/property.c:710:6: note: Assuming 'index' is < field 'count'
           if (index >=3D obj->package.count)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/property.c:710:2: note: Taking false branch
           if (index >=3D obj->package.count)
           ^
   drivers/acpi/property.c:716:2: note: Loop condition is true.  Entering l=
oop body
           while (element < end) {
           ^
   drivers/acpi/property.c:719:7: note: Assuming field 'type' is equal to A=
CPI_TYPE_LOCAL_REFERENCE
                   if (element->type =3D=3D ACPI_TYPE_LOCAL_REFERENCE) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/property.c:719:3: note: Taking true branch
                   if (element->type =3D=3D ACPI_TYPE_LOCAL_REFERENCE) {
                   ^
   drivers/acpi/property.c:724:8: note: Assuming 'ret' is 0
                           if (ret)
                               ^~~
   drivers/acpi/property.c:724:4: note: Taking false branch
                           if (ret)
                           ^
   drivers/acpi/property.c:735:9: note: Assuming 'element' is < 'end'
                                element < end && element->type =3D=3D ACPI_=
TYPE_STRING;
                                ^~~~~~~~~~~~~
   drivers/acpi/property.c:735:9: note: Left side of '&&' is true
   drivers/acpi/property.c:735:26: note: Assuming field 'type' is equal to =
ACPI_TYPE_STRING
                                element < end && element->type =3D=3D ACPI_=
TYPE_STRING;
                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/acpi/property.c:734:4: note: Loop condition is true.  Entering l=
oop body
                           for (ref_fwnode =3D acpi_fwnode_handle(device);
                           ^
   drivers/acpi/property.c:737:18: note: Calling 'acpi_fwnode_get_named_chi=
ld_node'
                                   ref_fwnode =3D acpi_fwnode_get_named_chi=
ld_node(
                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/acpi/property.c:614:2: note: Loop condition is true.  Entering l=
oop body
           fwnode_for_each_child_node(fwnode, child) {
           ^
   include/linux/property.h:101:2: note: expanded from macro 'fwnode_for_ea=
ch_child_node'
           for (child =3D fwnode_get_next_child_node(fwnode, NULL); child; =
  \
           ^
   drivers/acpi/property.c:615:7: note: Calling 'is_acpi_data_node'
                   if (is_acpi_data_node(child)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/property.c:1420:33: note: Left side of '&&' is false
           return !IS_ERR_OR_NULL(fwnode) && fwnode->ops =3D=3D &acpi_data_=
fwnode_ops;
                                          ^
   drivers/acpi/property.c:1420:2: note: Returning zero, which participates=
 in a condition later
           return !IS_ERR_OR_NULL(fwnode) && fwnode->ops =3D=3D &acpi_data_=
fwnode_ops;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/acpi/property.c:615:7: note: Returning from 'is_acpi_data_node'
                   if (is_acpi_data_node(child)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/property.c:615:3: note: Taking false branch
                   if (is_acpi_data_node(child)) {
                   ^
   drivers/acpi/property.c:621:32: note: '?' condition is false
                   if (!strncmp(acpi_device_bid(to_acpi_device_node(child)),
                                                ^
   include/acpi/acpi_bus.h:418:3: note: expanded from macro 'to_acpi_device=
_node'
                   is_acpi_device_node(__to_acpi_device_node_fwnode) ?     \
                   ^
   drivers/acpi/property.c:621:8: note: Null pointer passed as 1st argument=
 to string comparison function
                   if (!strncmp(acpi_device_bid(to_acpi_device_node(child)),
                        ^
   drivers/acpi/property.c:1091:10: warning: Access to field 'parent' resul=
ts in a dereference of a null pointer [clang-analyzer-core.NullDereference]
                   return to_acpi_data_node(fwnode)->parent;
                          ^
   include/acpi/acpi_bus.h:425:2: note: expanded from macro 'to_acpi_data_n=
ode'
           ({                                                              \
           ^
   drivers/acpi/property.c:1358:9: note: Calling 'acpi_node_get_parent'
           return acpi_node_get_parent(fwnode);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/property.c:1089:6: note: Assuming the condition is true
           if (is_acpi_data_node(fwnode)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/property.c:1089:2: note: Taking true branch
           if (is_acpi_data_node(fwnode)) {
           ^
   drivers/acpi/property.c:1091:10: note: Assuming the condition is false
                   return to_acpi_data_node(fwnode)->parent;
                          ^
   include/acpi/acpi_bus.h:428:3: note: expanded from macro 'to_acpi_data_n=
ode'
                   is_acpi_data_node(__to_acpi_data_node_fwnode) ?         \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/property.c:1091:10: note: '?' condition is false
                   return to_acpi_data_node(fwnode)->parent;
                          ^
   include/acpi/acpi_bus.h:428:3: note: expanded from macro 'to_acpi_data_n=
ode'
                   is_acpi_data_node(__to_acpi_data_node_fwnode) ?         \
                   ^
   drivers/acpi/property.c:1091:10: note: Access to field 'parent' results =
in a dereference of a null pointer
                   return to_acpi_data_node(fwnode)->parent;
                          ^
   include/acpi/acpi_bus.h:425:2: note: expanded from macro 'to_acpi_data_n=
ode'
           ({                                                              \
           ^
>> drivers/acpi/property.c:1093:24: warning: Dereference of null pointer [c=
lang-analyzer-core.NullDereference]
                   struct device *dev =3D to_acpi_device_node(fwnode)->dev.=
parent;
                                        ^
   include/acpi/acpi_bus.h:415:2: note: expanded from macro 'to_acpi_device=
_node'
           ({                                                              \
           ^
   drivers/acpi/property.c:1358:9: note: Calling 'acpi_node_get_parent'
           return acpi_node_get_parent(fwnode);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/property.c:1089:6: note: Assuming the condition is false
           if (is_acpi_data_node(fwnode)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/property.c:1089:2: note: Taking false branch
           if (is_acpi_data_node(fwnode)) {
           ^
   drivers/acpi/property.c:1092:13: note: Assuming the condition is true
           } else if (is_acpi_device_node(fwnode)) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/property.c:1092:9: note: Taking true branch
           } else if (is_acpi_device_node(fwnode)) {
                  ^
   drivers/acpi/property.c:1093:24: note: Assuming the condition is false
                   struct device *dev =3D to_acpi_device_node(fwnode)->dev.=
parent;
                                        ^
   include/acpi/acpi_bus.h:418:3: note: expanded from macro 'to_acpi_device=
_node'
                   is_acpi_device_node(__to_acpi_device_node_fwnode) ?     \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/property.c:1093:24: note: '?' condition is false
                   struct device *dev =3D to_acpi_device_node(fwnode)->dev.=
parent;
                                        ^
   include/acpi/acpi_bus.h:418:3: note: expanded from macro 'to_acpi_device=
_node'
                   is_acpi_device_node(__to_acpi_device_node_fwnode) ?     \
                   ^
   drivers/acpi/property.c:1093:24: note: Dereference of null pointer
                   struct device *dev =3D to_acpi_device_node(fwnode)->dev.=
parent;
                                        ^
   include/acpi/acpi_bus.h:415:2: note: expanded from macro 'to_acpi_device=
_node'
           ({                                                              \
           ^
   drivers/acpi/property.c:1115:9: warning: Access to field 'name' results =
in a dereference of a null pointer [clang-analyzer-core.NullDereference]
           name =3D to_acpi_data_node(fwnode)->name;
                  ^
   include/acpi/acpi_bus.h:425:2: note: expanded from macro 'to_acpi_data_n=
ode'
           ({                                                              \
           ^
   drivers/acpi/property.c:1137:6: note: Assuming 'prev' is null
           if (!prev) {
               ^~~~~
   drivers/acpi/property.c:1137:2: note: Taking true branch
           if (!prev) {
           ^
   drivers/acpi/property.c:1147:8: note: Calling 'is_acpi_graph_node'
                           if (is_acpi_graph_node(port, "port"))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/property.c:1112:7: note: 'len' is 4
           if (!len || !is_acpi_data_node(fwnode))
                ^~~
   drivers/acpi/property.c:1112:6: note: Left side of '||' is false
           if (!len || !is_acpi_data_node(fwnode))
               ^
   drivers/acpi/property.c:1112:14: note: Assuming the condition is false
           if (!len || !is_acpi_data_node(fwnode))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/property.c:1112:2: note: Taking false branch
           if (!len || !is_acpi_data_node(fwnode))
           ^
   drivers/acpi/property.c:1115:9: note: Assuming the condition is false
           name =3D to_acpi_data_node(fwnode)->name;
                  ^
   include/acpi/acpi_bus.h:428:3: note: expanded from macro 'to_acpi_data_n=
ode'
                   is_acpi_data_node(__to_acpi_data_node_fwnode) ?         \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/property.c:1115:9: note: '?' condition is false
           name =3D to_acpi_data_node(fwnode)->name;
                  ^
   include/acpi/acpi_bus.h:428:3: note: expanded from macro 'to_acpi_data_n=
ode'
                   is_acpi_data_node(__to_acpi_data_node_fwnode) ?         \
                   ^
   drivers/acpi/property.c:1115:9: note: Access to field 'name' results in =
a dereference of a null pointer
           name =3D to_acpi_data_node(fwnode)->name;
                  ^
   include/acpi/acpi_bus.h:425:2: note: expanded from macro 'to_acpi_data_n=
ode'
           ({                                                              \
           ^
   include/acpi/acpi_bus.h:444:12: warning: Access to field 'name' results =
in a dereference of a null pointer [clang-analyzer-core.NullDereference]
                   (!strcmp(to_acpi_data_node(fwnode)->name, name)) : false;
                            ^
   include/acpi/acpi_bus.h:425:2: note: expanded from macro 'to_acpi_data_n=
ode'
           ({                                                              \
           ^
   drivers/acpi/property.c:1305:9: note: Calling '__acpi_node_get_property_=
reference'
           return __acpi_node_get_property_reference(fwnode, prop, index,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/property.c:675:7: note: 'data' is non-null
           if (!data)
                ^~~~
   drivers/acpi/property.c:675:2: note: Taking false branch
           if (!data)
           ^
   drivers/acpi/property.c:679:6: note: 'ret' is 0
           if (ret)

vim +1093 drivers/acpi/property.c

dfa672fbc0d9e8 Mika Westerberg 2017-03-28  1079  =

dfa672fbc0d9e8 Mika Westerberg 2017-03-28  1080  /**
dfa672fbc0d9e8 Mika Westerberg 2017-03-28  1081   * acpi_node_get_parent - =
Return parent fwnode of this fwnode
dfa672fbc0d9e8 Mika Westerberg 2017-03-28  1082   * @fwnode: Firmware node =
whose parent to get
dfa672fbc0d9e8 Mika Westerberg 2017-03-28  1083   *
dfa672fbc0d9e8 Mika Westerberg 2017-03-28  1084   * Returns parent node of =
an ACPI device or data firmware node or %NULL if
dfa672fbc0d9e8 Mika Westerberg 2017-03-28  1085   * not available.
dfa672fbc0d9e8 Mika Westerberg 2017-03-28  1086   */
37ba983cfb47cc Sakari Ailus    2017-07-21  1087  struct fwnode_handle *acpi=
_node_get_parent(const struct fwnode_handle *fwnode)
dfa672fbc0d9e8 Mika Westerberg 2017-03-28  1088  {
dfa672fbc0d9e8 Mika Westerberg 2017-03-28  1089  	if (is_acpi_data_node(fwn=
ode)) {
dfa672fbc0d9e8 Mika Westerberg 2017-03-28  1090  		/* All data nodes have p=
arent pointer so just return that */
dfa672fbc0d9e8 Mika Westerberg 2017-03-28 @1091  		return to_acpi_data_node=
(fwnode)->parent;
dfa672fbc0d9e8 Mika Westerberg 2017-03-28  1092  	} else if (is_acpi_device=
_node(fwnode)) {
9054fc6d57e80c Sakari Ailus    2021-11-17 @1093  		struct device *dev =3D t=
o_acpi_device_node(fwnode)->dev.parent;
dfa672fbc0d9e8 Mika Westerberg 2017-03-28  1094  =

9054fc6d57e80c Sakari Ailus    2021-11-17  1095  		if (dev)
9054fc6d57e80c Sakari Ailus    2021-11-17  1096  			return acpi_fwnode_hand=
le(to_acpi_device(dev));
dfa672fbc0d9e8 Mika Westerberg 2017-03-28  1097  	}
dfa672fbc0d9e8 Mika Westerberg 2017-03-28  1098  =

dfa672fbc0d9e8 Mika Westerberg 2017-03-28  1099  	return NULL;
dfa672fbc0d9e8 Mika Westerberg 2017-03-28  1100  }
79389a83bc3888 Mika Westerberg 2017-03-28  1101  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7277368332569371609==--

