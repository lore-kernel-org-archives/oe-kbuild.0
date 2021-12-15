Content-Type: multipart/mixed; boundary="===============4944349481978556697=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tglx-devel:x86/fpu-kvm 1/6] arch/x86/kernel/fpu/xstate.c:1779:3: warning: Value stored to 'guest' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 15 Dec 2021 19:57:41 +0800
Message-ID: <202112151910.d4ZpNCZe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4944349481978556697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/=
fpu-kvm
head:   e16d6eec3c9e60abfb29d0d77f08411d326142dd
commit: 8a4ae8c80ec211646b5824b7c89d64cf7d286625 [1/6] x86/fpu: Extend fpu_=
xstate_prctl() with guest permissions
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: i386-randconfig-c001-20211214 (https://download.01.org/0day-ci/arch=
ive/20211215/202112151910.d4ZpNCZe-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2dd=
b6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/co=
mmit/?id=3D8a4ae8c80ec211646b5824b7c89d64cf7d286625
        git remote add tglx-devel https://git.kernel.org/pub/scm/linux/kern=
el/git/tglx/devel.git
        git fetch --no-tags tglx-devel x86/fpu-kvm
        git checkout 8a4ae8c80ec211646b5824b7c89d64cf7d286625
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ext4_error_inode_block(inode, err_blk, EIO,
                   ^
   fs/ext4/ext4.h:3156:2: note: expanded from macro 'ext4_error_inode_block'
           __ext4_error_inode((inode), __func__, __LINE__, (block), (err), \
           ^                                               ~~~~~~~
   fs/ext4/inode.c:6114:9: warning: 3rd function call argument is an uninit=
ialized value [clang-analyzer-core.CallAndMessage]
                   err =3D block_page_mkwrite(vma, vmf, get_block);
                         ^                            ~~~~~~~~~
   fs/ext4/inode.c:6030:2: note: 'get_block' declared without an initial va=
lue
           get_block_t *get_block;
           ^~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/inode.c:6033:6: note: Assuming the condition is true
           if (unlikely(IS_IMMUTABLE(inode)))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/ext4/inode.c:6033:2: note: Taking false branch
           if (unlikely(IS_IMMUTABLE(inode)))
           ^
   fs/ext4/inode.c:6042:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   fs/ext4/inode.c:6042:2: note: Taking false branch
           if (err)
           ^
   fs/ext4/inode.c:6051:6: note: Assuming the condition is true
           if (ext4_should_journal_data(inode))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/inode.c:6051:2: note: Taking true branch
           if (ext4_should_journal_data(inode))
           ^
   fs/ext4/inode.c:6052:3: note: Control jumps to line 6102
                   goto retry_alloc;
                   ^
   fs/ext4/inode.c:6104:6: note: Calling 'IS_ERR'
           if (IS_ERR(handle)) {
               ^~~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/inode.c:6104:6: note: Returning from 'IS_ERR'
           if (IS_ERR(handle)) {
               ^~~~~~~~~~~~~~
   fs/ext4/inode.c:6104:2: note: Taking false branch
           if (IS_ERR(handle)) {
           ^
   fs/ext4/inode.c:6113:6: note: Assuming the condition is true
           if (!ext4_should_journal_data(inode)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/inode.c:6113:2: note: Taking true branch
           if (!ext4_should_journal_data(inode)) {
           ^
   fs/ext4/inode.c:6114:9: note: 3rd function call argument is an uninitial=
ized value
                   err =3D block_page_mkwrite(vma, vmf, get_block);
                         ^                            ~~~~~~~~~
   1 warning generated.
   arch/x86/kernel/pci-iommu_table.c:37:10: warning: Dereference of null po=
inter (loaded from variable 'p') [clang-analyzer-core.NullDereference]
                           tmp =3D *p;
                                 ^~
   arch/x86/kernel/pci-iommu_table.c:30:18: note: Assuming 'p' is < 'finish'
           for (p =3D start; p < finish; p++) {
                           ^~~~~~~~~~
   arch/x86/kernel/pci-iommu_table.c:30:2: note: Loop condition is true.  E=
ntering loop body
           for (p =3D start; p < finish; p++) {
           ^
   arch/x86/kernel/pci-iommu_table.c:36:7: note: 'q' is <=3D 'p'
                   if (q > p) {
                       ^
   arch/x86/kernel/pci-iommu_table.c:36:3: note: Taking false branch
                   if (q > p) {
                   ^
   arch/x86/kernel/pci-iommu_table.c:30:30: note: Null pointer value stored=
 to 'p'
           for (p =3D start; p < finish; p++) {
                                       ^~~
   arch/x86/kernel/pci-iommu_table.c:30:18: note: 'p' is < 'finish'
           for (p =3D start; p < finish; p++) {
                           ^
   arch/x86/kernel/pci-iommu_table.c:30:2: note: Loop condition is true.  E=
ntering loop body
           for (p =3D start; p < finish; p++) {
           ^
   arch/x86/kernel/pci-iommu_table.c:36:7: note: Assuming 'q' is > 'p'
                   if (q > p) {
                       ^~~~~
   arch/x86/kernel/pci-iommu_table.c:36:3: note: Taking true branch
                   if (q > p) {
                   ^
   arch/x86/kernel/pci-iommu_table.c:37:10: note: Dereference of null point=
er (loaded from variable 'p')
                           tmp =3D *p;
                                 ^~
   1 warning generated.
>> arch/x86/kernel/fpu/xstate.c:1779:3: warning: Value stored to 'guest' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   guest =3D true;
                   ^       ~~~~
   arch/x86/kernel/fpu/xstate.c:1779:3: note: Value stored to 'guest' is ne=
ver read
                   guest =3D true;
                   ^       ~~~~
   1 warning generated.
   drivers/acpi/osl.c:1744:3: warning: Value stored to 'rv' is never read [=
clang-analyzer-deadcode.DeadStores]
                   rv =3D acpi_os_map_generic_address(&acpi_gbl_FADT.reset_=
register);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/acpi/osl.c:1744:3: note: Value stored to 'rv' is never read
                   rv =3D acpi_os_map_generic_address(&acpi_gbl_FADT.reset_=
register);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   1 warning generated.
   drivers/input/keyboard/atkbd.c:1078:17: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &atkbd->ps2dev.serio->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/atkbd.c:1078:17: note: Value stored to 'dev' duri=
ng its initialization is never read
           struct device *dev =3D &atkbd->ps2dev.serio->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   mm/memfd.c:281:2: warning: Call to function 'strcpy' is insecure as it d=
oes not provide bounding of the memory buffer. Replace unbounded copy funct=
ions with analogous functions that support length arguments such as 'strlcp=
y'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(name, MFD_NAME_PREFIX);
           ^~~~~~
   mm/memfd.c:281:2: note: Call to function 'strcpy' is insecure as it does=
 not provide bounding of the memory buffer. Replace unbounded copy function=
s with analogous functions that support length arguments such as 'strlcpy'.=
 CWE-119
           strcpy(name, MFD_NAME_PREFIX);
           ^~~~~~
   1 warning generated.
   drivers/of/device.c:59:29: warning: Value stored to 'of_node' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device_node *node, *of_node =3D dev->of_node;
                                      ^~~~~~~   ~~~~~~~~~~~~
   drivers/of/device.c:59:29: note: Value stored to 'of_node' during its in=
itialization is never read
           struct device_node *node, *of_node =3D dev->of_node;
                                      ^~~~~~~   ~~~~~~~~~~~~
   3 warnings generated.
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
   drivers/of/property.c:1443:22: warning: Value stored to 'con_np' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device_node *con_np =3D to_of_node(fwnode);
                               ^~~~~~
   drivers/of/property.c:1443:22: note: Value stored to 'con_np' during its=
 initialization is never read
           struct device_node *con_np =3D to_of_node(fwnode);
                               ^~~~~~
   1 warning generated.
   drivers/of/irq.c:587:2: warning: Dereference of null pointer [clang-anal=
yzer-core.NullDereference]
           list_for_each_entry_safe(desc, temp_desc, &intc_parent_list, lis=
t) {
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
   drivers/of/irq.c:509:2: note: Loop condition is true.  Entering loop body
           for_each_matching_node_and_match(np, matches, &match) {
           ^
   include/linux/of.h:1298:2: note: expanded from macro 'for_each_matching_=
node_and_match'
           for (dn =3D of_find_matching_node_and_match(NULL, matches, match=
); \
           ^
   drivers/of/irq.c:510:8: note: Calling 'of_property_read_bool'
                   if (!of_property_read_bool(np, "interrupt-controller") ||

vim +/guest +1779 arch/x86/kernel/fpu/xstate.c

db8268df0983ad Chang S. Bae    2021-10-21  1730  =

db8268df0983ad Chang S. Bae    2021-10-21  1731  /**
db8268df0983ad Chang S. Bae    2021-10-21  1732   * fpu_xstate_prctl - xsta=
te permission operations
db8268df0983ad Chang S. Bae    2021-10-21  1733   * @tsk:	Redundant pointer=
 to current
db8268df0983ad Chang S. Bae    2021-10-21  1734   * @option:	A subfunction =
of arch_prctl()
db8268df0983ad Chang S. Bae    2021-10-21  1735   * @arg2:	option argument
db8268df0983ad Chang S. Bae    2021-10-21  1736   * Return:	0 if successful=
; otherwise, an error code
db8268df0983ad Chang S. Bae    2021-10-21  1737   *
db8268df0983ad Chang S. Bae    2021-10-21  1738   * Option arguments:
db8268df0983ad Chang S. Bae    2021-10-21  1739   *
db8268df0983ad Chang S. Bae    2021-10-21  1740   * ARCH_GET_XCOMP_SUPP: Po=
inter to user space u64 to store the info
db8268df0983ad Chang S. Bae    2021-10-21  1741   * ARCH_GET_XCOMP_PERM: Po=
inter to user space u64 to store the info
db8268df0983ad Chang S. Bae    2021-10-21  1742   * ARCH_REQ_XCOMP_PERM: Fa=
cility number requested
db8268df0983ad Chang S. Bae    2021-10-21  1743   *
db8268df0983ad Chang S. Bae    2021-10-21  1744   * For facilities which re=
quire more than one XSTATE component, the request
db8268df0983ad Chang S. Bae    2021-10-21  1745   * must be the highest sta=
te component number related to that facility,
db8268df0983ad Chang S. Bae    2021-10-21  1746   * e.g. for AMX which requ=
ires XFEATURE_XTILE_CFG(17) and
db8268df0983ad Chang S. Bae    2021-10-21  1747   * XFEATURE_XTILE_DATA(18)=
 this would be XFEATURE_XTILE_DATA(18).
db8268df0983ad Chang S. Bae    2021-10-21  1748   */
db8268df0983ad Chang S. Bae    2021-10-21  1749  long fpu_xstate_prctl(stru=
ct task_struct *tsk, int option, unsigned long arg2)
db8268df0983ad Chang S. Bae    2021-10-21  1750  {
db8268df0983ad Chang S. Bae    2021-10-21  1751  	u64 __user *uptr =3D (u64=
 __user *)arg2;
db8268df0983ad Chang S. Bae    2021-10-21  1752  	u64 permitted, supported;
db8268df0983ad Chang S. Bae    2021-10-21  1753  	unsigned long idx =3D arg=
2;
8a4ae8c80ec211 Thomas Gleixner 2021-12-07  1754  	bool guest =3D false;
db8268df0983ad Chang S. Bae    2021-10-21  1755  =

db8268df0983ad Chang S. Bae    2021-10-21  1756  	if (tsk !=3D current)
db8268df0983ad Chang S. Bae    2021-10-21  1757  		return -EPERM;
db8268df0983ad Chang S. Bae    2021-10-21  1758  =

db8268df0983ad Chang S. Bae    2021-10-21  1759  	switch (option) {
db8268df0983ad Chang S. Bae    2021-10-21  1760  	case ARCH_GET_XCOMP_SUPP:
db8268df0983ad Chang S. Bae    2021-10-21  1761  		supported =3D fpu_user_c=
fg.max_features |	fpu_user_cfg.legacy_features;
db8268df0983ad Chang S. Bae    2021-10-21  1762  		return put_user(supporte=
d, uptr);
db8268df0983ad Chang S. Bae    2021-10-21  1763  =

db8268df0983ad Chang S. Bae    2021-10-21  1764  	case ARCH_GET_XCOMP_PERM:
db8268df0983ad Chang S. Bae    2021-10-21  1765  		/*
db8268df0983ad Chang S. Bae    2021-10-21  1766  		 * Lockless snapshot as =
it can also change right after the
db8268df0983ad Chang S. Bae    2021-10-21  1767  		 * dropping the lock.
db8268df0983ad Chang S. Bae    2021-10-21  1768  		 */
db8268df0983ad Chang S. Bae    2021-10-21  1769  		permitted =3D xstate_get=
_host_group_perm();
db8268df0983ad Chang S. Bae    2021-10-21  1770  		permitted &=3D XFEATURE_=
MASK_USER_SUPPORTED;
db8268df0983ad Chang S. Bae    2021-10-21  1771  		return put_user(permitte=
d, uptr);
db8268df0983ad Chang S. Bae    2021-10-21  1772  =

8a4ae8c80ec211 Thomas Gleixner 2021-12-07  1773  	case ARCH_GET_XCOMP_GUEST=
_PERM:
8a4ae8c80ec211 Thomas Gleixner 2021-12-07  1774  		permitted =3D xstate_get=
_guest_group_perm();
8a4ae8c80ec211 Thomas Gleixner 2021-12-07  1775  		permitted &=3D XFEATURE_=
MASK_USER_SUPPORTED;
8a4ae8c80ec211 Thomas Gleixner 2021-12-07  1776  		return put_user(permitte=
d, uptr);
8a4ae8c80ec211 Thomas Gleixner 2021-12-07  1777  =

8a4ae8c80ec211 Thomas Gleixner 2021-12-07  1778  	case ARCH_REQ_XCOMP_GUEST=
_PERM:
8a4ae8c80ec211 Thomas Gleixner 2021-12-07 @1779  		guest =3D true;
8a4ae8c80ec211 Thomas Gleixner 2021-12-07  1780  		fallthrough;
8a4ae8c80ec211 Thomas Gleixner 2021-12-07  1781  =

db8268df0983ad Chang S. Bae    2021-10-21  1782  	case ARCH_REQ_XCOMP_PERM:
db8268df0983ad Chang S. Bae    2021-10-21  1783  		if (!IS_ENABLED(CONFIG_X=
86_64))
db8268df0983ad Chang S. Bae    2021-10-21  1784  			return -EOPNOTSUPP;
db8268df0983ad Chang S. Bae    2021-10-21  1785  =

8a4ae8c80ec211 Thomas Gleixner 2021-12-07  1786  		return xstate_request_pe=
rm(idx, guest);
db8268df0983ad Chang S. Bae    2021-10-21  1787  =

db8268df0983ad Chang S. Bae    2021-10-21  1788  	default:
db8268df0983ad Chang S. Bae    2021-10-21  1789  		return -EINVAL;
db8268df0983ad Chang S. Bae    2021-10-21  1790  	}
db8268df0983ad Chang S. Bae    2021-10-21  1791  }
db8268df0983ad Chang S. Bae    2021-10-21  1792  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4944349481978556697==--

