Content-Type: multipart/mixed; boundary="===============0419042712638995460=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/vfio/pci/vfio_pci_core.c:2104:2: warning: There is an unknown macro here somewhere. Configuration is required. If list_for_each_entry is a macro then please configure it. [unknownMacro]
Date: Sat, 02 Apr 2022 23:11:02 +0800
Message-ID: <202204022315.K370FUMF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0419042712638995460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Abhishek Sahu <abhsahu@nvidia.com>
CC: Alex Williamson <alex.williamson@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   88e6c0207623874922712e162e25d9dafd39661e
commit: 26a17b12d7f3dd8a7aa45a290e5b46e9cc775ddf vfio/pci: wake-up devices =
around reset functions
date:   6 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 6 weeks ago
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> mm/mprotect.c:558:8: warning: Redundant initialization for 'error'. The =
initialized value is overwritten before it is read. [redundantInitializatio=
n]
    error =3D -EINVAL;
          ^
   mm/mprotect.c:527:12: note: error is initialized
    int error =3D -EINVAL;
              ^
   mm/mprotect.c:558:8: note: error is overwritten
    error =3D -EINVAL;
          ^
--
>> mm/migrate.c:864:7: warning: Redundant initialization for 'rc'. The init=
ialized value is overwritten before it is read. [redundantInitialization]
      rc =3D migrate_page(mapping, newpage, page, mode);
         ^
   mm/migrate.c:854:9: note: rc is initialized
    int rc =3D -EAGAIN;
           ^
   mm/migrate.c:864:7: note: rc is overwritten
      rc =3D migrate_page(mapping, newpage, page, mode);
         ^
>> mm/migrate.c:340:53: warning: Parameter 'mapping' can be declared with c=
onst [constParameter]
   static int expected_page_refs(struct address_space *mapping, struct page=
 *page)
                                                       ^
>> drivers/vfio/pci/vfio_pci_core.c:2104:2: warning: There is an unknown ma=
cro here somewhere. Configuration is required. If list_for_each_entry is a =
macro then please configure it. [unknownMacro]
    list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list)
    ^
--
>> drivers/vfio/vfio.c:316:49: warning: Parameter 'iommu_group' can be decl=
ared with const [constParameter]
   __vfio_group_get_from_iommu(struct iommu_group *iommu_group)
                                                   ^
>> drivers/vfio/vfio.c:508:23: warning: Parameter 'dev' can be declared wit=
h const [constParameter]
          struct device *dev)
                         ^
>> drivers/vfio/vfio.c:1707:56: warning: Parameter 'test_group' can be decl=
ared with const [constParameter]
   bool vfio_external_group_match_file(struct vfio_group *test_group,
                                                          ^
>> drivers/vfio/vfio.c:252:12: warning: Uninitialized variable: tmp->ops [u=
ninitvar]
     if (tmp->ops =3D=3D ops) {
              ^
   drivers/vfio/vfio.c:243:6: note: Assuming condition is false
    if (!driver)
        ^
   drivers/vfio/vfio.c:252:12: note: Uninitialized variable: tmp->ops
     if (tmp->ops =3D=3D ops) {
              ^
>> drivers/vfio/vfio.c:273:15: warning: Uninitialized variable: driver->ops=
 [uninitvar]
     if (driver->ops =3D=3D ops) {
                 ^
>> drivers/vfio/vfio.c:321:14: warning: Uninitialized variable: group->iomm=
u_group [uninitvar]
     if (group->iommu_group =3D=3D iommu_group) {
                ^
>> drivers/vfio/vfio.c:579:23: warning: Uninitialized variable: unbound->de=
v [uninitvar]
     if (dev =3D=3D unbound->dev) {
                         ^
>> drivers/vfio/vfio.c:1071:45: warning: Uninitialized variables: driver.op=
s, driver.vfio_next [uninitvar]
     if (!vfio_iommu_driver_allowed(container, driver))
                                               ^
   drivers/vfio/vfio.c:1062:41: note: Assuming condition is false
    if (list_empty(&container->group_list) || container->iommu_driver) {
                                           ^
   drivers/vfio/vfio.c:1062:41: note: Assuming condition is false
    if (list_empty(&container->group_list) || container->iommu_driver) {
                                           ^
   drivers/vfio/vfio.c:1071:45: note: Uninitialized variables: driver.ops, =
driver.vfio_next
     if (!vfio_iommu_driver_allowed(container, driver))
                                               ^
--
   mm/ksm.c:1618:30: warning: Boolean result is used in bitwise operation. =
Clarify expression with parentheses. [clarifyCondition]
     VM_BUG_ON(!stable_node_dup ^ !!stable_node_any);
                                ^
   mm/ksm.c:1851:30: warning: Boolean result is used in bitwise operation. =
Clarify expression with parentheses. [clarifyCondition]
     VM_BUG_ON(!stable_node_dup ^ !!stable_node_any);
                                ^
   mm/ksm.c:585:36: warning: Same value in both branches of ternary operato=
r. [duplicateValueTernary]
    return ksm_merge_across_nodes ? 0 : NUMA(pfn_to_nid(kpfn));
                                      ^
   mm/ksm.c:591:22: warning: Local variable 'chain' shadows outer function =
[shadowFunction]
    struct stable_node *chain =3D alloc_stable_node();
                        ^
   mm/ksm.c:1530:37: note: Shadowed declaration
   static __always_inline struct page *chain(struct stable_node **s_n_d,
                                       ^
   mm/ksm.c:591:22: note: Shadow variable
    struct stable_node *chain =3D alloc_stable_node();
                        ^
   mm/ksm.c:1558:36: warning: Local variable 'stable_node_dup' shadows oute=
r function [shadowFunction]
    struct stable_node *stable_node, *stable_node_dup, *stable_node_any;
                                      ^
   mm/ksm.c:1355:21: note: Shadowed declaration
   static struct page *stable_node_dup(struct stable_node **_stable_node_du=
p,
                       ^
   mm/ksm.c:1558:36: note: Shadow variable
    struct stable_node *stable_node, *stable_node_dup, *stable_node_any;
                                      ^
   mm/ksm.c:1809:36: warning: Local variable 'stable_node_dup' shadows oute=
r function [shadowFunction]
    struct stable_node *stable_node, *stable_node_dup, *stable_node_any;
                                      ^
   mm/ksm.c:1355:21: note: Shadowed declaration
   static struct page *stable_node_dup(struct stable_node **_stable_node_du=
p,
                       ^
   mm/ksm.c:1809:36: note: Shadow variable
    struct stable_node *stable_node, *stable_node_dup, *stable_node_any;
                                      ^
>> mm/ksm.c:2256:17: warning: Local variable 'page' shadows outer argument =
[shadowArgument]
      struct page *page;
                   ^
   mm/ksm.c:2223:64: note: Shadowed declaration
   static struct rmap_item *scan_get_next_rmap_item(struct page **page)
                                                                  ^
   mm/ksm.c:2256:17: note: Shadow variable
      struct page *page;
                   ^
>> mm/ksm.c:1393:30: warning: Uninitialized variable: found_rmap_hlist_len =
[uninitvar]
          dup->rmap_hlist_len > found_rmap_hlist_len) {
                                ^
   mm/ksm.c:1388:7: note: Assuming condition is false
     if (!_tree_page)
         ^
   mm/ksm.c:1393:30: note: Uninitialized variable: found_rmap_hlist_len
          dup->rmap_hlist_len > found_rmap_hlist_len) {
                                ^
>> mm/ksm.c:2953:20: warning: Local variable 'buf' shadows outer argument [=
shadowArgument]
      struct rb_root *buf;
                      ^
   mm/ksm.c:2936:20: note: Shadowed declaration
          const char *buf, size_t count)
                      ^
   mm/ksm.c:2953:20: note: Shadow variable
      struct rb_root *buf;
                      ^
>> mm/swapfile.c:676:2: warning: There is an unknown macro here somewhere. =
Configuration is required. If for_each_node is a macro then please configur=
e it. [unknownMacro]
    for_each_node(nid)
    ^
--
>> mm/hugetlb.c:2395:2: warning: There is an unknown macro here somewhere. =
Configuration is required. If list_for_each_entry_safe is a macro then plea=
se configure it. [unknownMacro]
    list_for_each_entry_safe(page, tmp, &surplus_list, lru)
    ^
>> mm/page_alloc.c:2243:2: warning: There is an unknown macro here somewher=
e. Configuration is required. If for_each_node_state is a macro then please=
 configure it. [unknownMacro]
    for_each_node_state(nid, N_MEMORY)
    ^

vim +2104 drivers/vfio/pci/vfio_pci_core.c

93899a679fd6b2 drivers/vfio/pci/vfio_pci.c      Alex Williamson 2014-09-29 =
 2038  =

db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2039  /*
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2040   * We need to get memory_lock for each device, but devices can share=
 mmap_lock,
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2041   * therefore we need to zap and hold the vma_lock for each device, a=
nd only then
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2042   * get each memory_lock.
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2043   */
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2044  static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_se=
t,
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2045  				      struct vfio_pci_group_info *groups)
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2046  {
536475109c8284 drivers/vfio/pci/vfio_pci_core.c Max Gurtovoy    2021-08-26 =
 2047  	struct vfio_pci_core_device *cur_mem;
536475109c8284 drivers/vfio/pci/vfio_pci_core.c Max Gurtovoy    2021-08-26 =
 2048  	struct vfio_pci_core_device *cur_vma;
536475109c8284 drivers/vfio/pci/vfio_pci_core.c Max Gurtovoy    2021-08-26 =
 2049  	struct vfio_pci_core_device *cur;
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2050  	struct pci_dev *pdev;
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2051  	bool is_mem =3D true;
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2052  	int ret;
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2053  =

db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2054  	mutex_lock(&dev_set->lock);
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2055  	cur_mem =3D list_first_entry(&dev_set->device_list,
536475109c8284 drivers/vfio/pci/vfio_pci_core.c Max Gurtovoy    2021-08-26 =
 2056  				   struct vfio_pci_core_device,
536475109c8284 drivers/vfio/pci/vfio_pci_core.c Max Gurtovoy    2021-08-26 =
 2057  				   vdev.dev_set_list);
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2058  =

db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2059  	pdev =3D vfio_pci_dev_set_resettable(dev_set);
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2060  	if (!pdev) {
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2061  		ret =3D -EINVAL;
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2062  		goto err_unlock;
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2063  	}
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2064  =

db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2065  	list_for_each_entry(cur_vma, &dev_set->device_list, vdev.dev_set_li=
st) {
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2066  		/*
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2067  		 * Test whether all the affected devices are contained by the
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2068  		 * set of groups provided by the user.
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2069  		 */
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2070  		if (!vfio_dev_in_groups(cur_vma, groups)) {
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2071  			ret =3D -EINVAL;
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2072  			goto err_undo;
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2073  		}
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2074  =

db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2075  		/*
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2076  		 * Locking multiple devices is prone to deadlock, runaway and
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2077  		 * unwind if we hit contention.
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2078  		 */
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2079  		if (!vfio_pci_zap_and_vma_lock(cur_vma, true)) {
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2080  			ret =3D -EBUSY;
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2081  			goto err_undo;
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2082  		}
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2083  	}
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2084  	cur_vma =3D NULL;
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2085  =

db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2086  	list_for_each_entry(cur_mem, &dev_set->device_list, vdev.dev_set_li=
st) {
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2087  		if (!down_write_trylock(&cur_mem->memory_lock)) {
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2088  			ret =3D -EBUSY;
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2089  			goto err_undo;
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2090  		}
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2091  		mutex_unlock(&cur_mem->vma_lock);
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2092  	}
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2093  	cur_mem =3D NULL;
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2094  =

26a17b12d7f3dd drivers/vfio/pci/vfio_pci_core.c Abhishek Sahu   2022-02-17 =
 2095  	/*
26a17b12d7f3dd drivers/vfio/pci/vfio_pci_core.c Abhishek Sahu   2022-02-17 =
 2096  	 * The pci_reset_bus() will reset all the devices in the bus.
26a17b12d7f3dd drivers/vfio/pci/vfio_pci_core.c Abhishek Sahu   2022-02-17 =
 2097  	 * The power state can be non-D0 for some of the devices in the bus.
26a17b12d7f3dd drivers/vfio/pci/vfio_pci_core.c Abhishek Sahu   2022-02-17 =
 2098  	 * For these devices, the pci_reset_bus() will internally set
26a17b12d7f3dd drivers/vfio/pci/vfio_pci_core.c Abhishek Sahu   2022-02-17 =
 2099  	 * the power state to D0 without vfio driver involvement.
26a17b12d7f3dd drivers/vfio/pci/vfio_pci_core.c Abhishek Sahu   2022-02-17 =
 2100  	 * For the devices which have NoSoftRst-, the reset function can
26a17b12d7f3dd drivers/vfio/pci/vfio_pci_core.c Abhishek Sahu   2022-02-17 =
 2101  	 * cause the PCI config space reset without restoring the original
26a17b12d7f3dd drivers/vfio/pci/vfio_pci_core.c Abhishek Sahu   2022-02-17 =
 2102  	 * state (saved locally in 'vdev->pm_save').
26a17b12d7f3dd drivers/vfio/pci/vfio_pci_core.c Abhishek Sahu   2022-02-17 =
 2103  	 */
26a17b12d7f3dd drivers/vfio/pci/vfio_pci_core.c Abhishek Sahu   2022-02-17 =
@2104  	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list)
26a17b12d7f3dd drivers/vfio/pci/vfio_pci_core.c Abhishek Sahu   2022-02-17 =
 2105  		vfio_pci_set_power_state(cur, PCI_D0);
26a17b12d7f3dd drivers/vfio/pci/vfio_pci_core.c Abhishek Sahu   2022-02-17 =
 2106  =

db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2107  	ret =3D pci_reset_bus(pdev);
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2108  =

db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2109  err_undo:
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2110  	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2111  		if (cur =3D=3D cur_mem)
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2112  			is_mem =3D false;
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2113  		if (cur =3D=3D cur_vma)
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2114  			break;
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2115  		if (is_mem)
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2116  			up_write(&cur->memory_lock);
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2117  		else
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2118  			mutex_unlock(&cur->vma_lock);
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2119  	}
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2120  err_unlock:
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2121  	mutex_unlock(&dev_set->lock);
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2122  	return ret;
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2123  }
db44c17458fb54 drivers/vfio/pci/vfio_pci.c      Jason Gunthorpe 2021-08-05 =
 2124  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0419042712638995460==--

