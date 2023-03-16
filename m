Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DD6A938
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Mar 2023 19:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678995223; x=1710531223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=awd0wulZ9RnagqypoV9cqhYdAdjmd+eq7XEqJBDQL4Q=;
  b=Z+4Fw4ZRJGz8F7bCMzKkSb+zMKZEN3SZn0RurRRFnK7OBhmvvQ7qs4Su
   jJikOOEsEVbvaFp92H7bYR8+JqcfVP6PvG/01ONqjgJN5Y+KFgDIrkzuA
   jfuuwtmRRjqx5fzspN3Fv6vcFn35jjFKSNvR9Ew1X6ZnY5QClu+QjWLKm
   uePH5YA61ijL2jYQb4z42iQFhmwS205OEmz35yEUuCuSi+qrimNwOuaHQ
   3hqxdrj7RD2C+my0a76Tl4GCSnpiIckKcMXtJ+87Y+F+VRhZ81QXtSmrN
   Bl+IwlaHud33YBnf0Ovjk9IeyMDPy52ssZnO11JRSbLWFnAkFzjNnqkF1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="339641580"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="339641580"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 12:33:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="710263762"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="710263762"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 16 Mar 2023 12:33:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pctM5-0008li-0a;
	Thu, 16 Mar 2023 19:33:41 +0000
Date: Fri, 17 Mar 2023 03:33:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [yiliu1765-iommufd:wip/vfio_device_cdev_v7_candidate 10/37]
 drivers/vfio/pci/vfio_pci_core.c:1363:12: warning: Called function pointer
 is null (null dereference) [clang-analyzer-core.CallAndMessage]
Message-ID: <202303170344.aSz72nkh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/vfio/pci/vfio_pci_core.c:1363:12: warning: Called function pointer is null (null dereference) [clang-analyzer-core.CallAndMessage]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yi Liu <yi.l.liu@intel.com>
TO: Kevin Tian <kevin.tian@intel.com>

tree:   https://github.com/yiliu1765/iommufd.git wip/vfio_device_cdev_v7_candidate
head:   7d62c039b6e90a9e27625dd024edebec0748014b
commit: b26ee777a3f3af4b0d309bbbd5c4f000de355b97 [10/37] vfio/pci: Allow passing zero-length fd array in VFIO_DEVICE_PCI_HOT_RESET
:::::: branch date: 31 hours ago
:::::: commit date: 3 days ago
config: arm-randconfig-c002-20230312 (https://download.01.org/0day-ci/archive/20230317/202303170344.aSz72nkh-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/yiliu1765/iommufd/commit/b26ee777a3f3af4b0d309bbbd5c4f000de355b97
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd wip/vfio_device_cdev_v7_candidate
        git checkout b26ee777a3f3af4b0d309bbbd5c4f000de355b97
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303170344.aSz72nkh-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                           ^        ~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (19 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   drivers/usb/mon/mon_bin.c:848:3: warning: Value stored to 'nbytes' is never read [clang-analyzer-deadcode.DeadStores]
                   nbytes -= step_len;
                   ^         ~~~~~~~~
   drivers/usb/mon/mon_bin.c:848:3: note: Value stored to 'nbytes' is never read
                   nbytes -= step_len;
                   ^         ~~~~~~~~
   drivers/usb/mon/mon_bin.c:849:3: warning: Value stored to 'buf' is never read [clang-analyzer-deadcode.DeadStores]
                   buf += step_len;
                   ^      ~~~~~~~~
   drivers/usb/mon/mon_bin.c:849:3: note: Value stored to 'buf' is never read
                   buf += step_len;
                   ^      ~~~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
>> drivers/vfio/pci/vfio_pci_core.c:1363:12: warning: Called function pointer is null (null dereference) [clang-analyzer-core.CallAndMessage]
           iommufd = vfio_iommufd_physical_ctx(&vdev->vdev);
                     ^
   include/linux/vfio.h:132:2: note: expanded from macro 'vfio_iommufd_physical_ctx'
           ((struct iommufd_ctx * (*)(struct vfio_device *vdev)) NULL)
           ^
   drivers/vfio/pci/vfio_pci_core.c:1402:2: note: Control jumps to 'case 15217:'  at line 1413
           switch (cmd) {
           ^
   drivers/vfio/pci/vfio_pci_core.c:1414:10: note: Calling 'vfio_pci_ioctl_pci_hot_reset'
                   return vfio_pci_ioctl_pci_hot_reset(vdev, uarg);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_core.c:1348:6: note: Calling 'copy_from_user'
           if (copy_from_user(&hdr, arg, minsz))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:160:2: note: Taking true branch
           if (check_copy_size(to, n, false))
           ^
   include/linux/uaccess.h:161:7: note: Calling '_copy_from_user'
                   n = _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:125:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:125:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:127:9: note: Calling 'raw_copy_from_user'
                   res = raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/uaccess.h:518:6: note: Value assigned to 'hdr.flags', which participates in a condition later
           n = arm_copy_from_user(to, from, n);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/uaccess.h:518:6: note: Value assigned to 'hdr.count', which participates in a condition later
           n = arm_copy_from_user(to, from, n);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:127:9: note: Returning from 'raw_copy_from_user'
                   res = raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:130:6: note: Assuming 'res' is 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:130:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:161:7: note: Returning from '_copy_from_user'
                   n = _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_core.c:1348:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&hdr, arg, minsz))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_core.c:1348:2: note: Taking false branch
           if (copy_from_user(&hdr, arg, minsz))
           ^
   drivers/vfio/pci/vfio_pci_core.c:1351:6: note: Assuming 'minsz' is <= field 'argsz'
           if (hdr.argsz < minsz || hdr.flags)
               ^~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_core.c:1351:6: note: Left side of '||' is false
   drivers/vfio/pci/vfio_pci_core.c:1351:27: note: Assuming field 'flags' is 0
           if (hdr.argsz < minsz || hdr.flags)
                                    ^~~~~~~~~
   drivers/vfio/pci/vfio_pci_core.c:1351:2: note: Taking false branch
           if (hdr.argsz < minsz || hdr.flags)
           ^
   drivers/vfio/pci/vfio_pci_core.c:1355:6: note: Assuming the condition is true
           if (!pci_probe_reset_slot(vdev->pdev->slot))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_core.c:1355:2: note: Taking true branch
           if (!pci_probe_reset_slot(vdev->pdev->slot))
           ^
   drivers/vfio/pci/vfio_pci_core.c:1360:6: note: Assuming field 'count' is 0
           if (hdr.count)
               ^~~~~~~~~
   drivers/vfio/pci/vfio_pci_core.c:1360:2: note: Taking false branch
           if (hdr.count)
           ^
   drivers/vfio/pci/vfio_pci_core.c:1363:12: note: Called function pointer is null (null dereference)
           iommufd = vfio_iommufd_physical_ctx(&vdev->vdev);
                     ^
   include/linux/vfio.h:132:2: note: expanded from macro 'vfio_iommufd_physical_ctx'
           ((struct iommufd_ctx * (*)(struct vfio_device *vdev)) NULL)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_core.c:1586:9: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
                           mm = mmap_vma->vma->vm_mm;
                                ^
   drivers/vfio/pci/vfio_pci_core.c:1456:2: note: Control jumps to 'case 3:'  at line 1457
           switch (flags & VFIO_DEVICE_FEATURE_MASK) {
           ^
   drivers/vfio/pci/vfio_pci_core.c:1458:10: note: Calling 'vfio_pci_core_pm_entry'
                   return vfio_pci_core_pm_entry(device, flags, arg, argsz);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_core.c:314:6: note: 'ret' is equal to 1
           if (ret != 1)
               ^~~
   drivers/vfio/pci/vfio_pci_core.c:314:2: note: Taking false branch
           if (ret != 1)
           ^
   drivers/vfio/pci/vfio_pci_core.c:323:9: note: Calling 'vfio_pci_runtime_pm_entry'

vim +1363 drivers/vfio/pci/vfio_pci_core.c

2ecf3b58ed7bc5 Jason Gunthorpe 2022-08-31  1339  
b26ee777a3f3af Yi Liu          2023-03-07  1340  static int vfio_pci_ioctl_pci_hot_reset(struct vfio_pci_core_device *vdev,
b26ee777a3f3af Yi Liu          2023-03-07  1341  					struct vfio_pci_hot_reset __user *arg)
b26ee777a3f3af Yi Liu          2023-03-07  1342  {
b26ee777a3f3af Yi Liu          2023-03-07  1343  	unsigned long minsz = offsetofend(struct vfio_pci_hot_reset, count);
b26ee777a3f3af Yi Liu          2023-03-07  1344  	struct vfio_pci_hot_reset hdr;
b26ee777a3f3af Yi Liu          2023-03-07  1345  	struct iommufd_ctx *iommufd;
b26ee777a3f3af Yi Liu          2023-03-07  1346  	bool slot = false;
b26ee777a3f3af Yi Liu          2023-03-07  1347  
b26ee777a3f3af Yi Liu          2023-03-07  1348  	if (copy_from_user(&hdr, arg, minsz))
b26ee777a3f3af Yi Liu          2023-03-07  1349  		return -EFAULT;
b26ee777a3f3af Yi Liu          2023-03-07  1350  
b26ee777a3f3af Yi Liu          2023-03-07  1351  	if (hdr.argsz < minsz || hdr.flags)
b26ee777a3f3af Yi Liu          2023-03-07  1352  		return -EINVAL;
b26ee777a3f3af Yi Liu          2023-03-07  1353  
b26ee777a3f3af Yi Liu          2023-03-07  1354  	/* Can we do a slot or bus reset or neither? */
b26ee777a3f3af Yi Liu          2023-03-07  1355  	if (!pci_probe_reset_slot(vdev->pdev->slot))
b26ee777a3f3af Yi Liu          2023-03-07  1356  		slot = true;
b26ee777a3f3af Yi Liu          2023-03-07  1357  	else if (pci_probe_reset_bus(vdev->pdev->bus))
b26ee777a3f3af Yi Liu          2023-03-07  1358  		return -ENODEV;
b26ee777a3f3af Yi Liu          2023-03-07  1359  
b26ee777a3f3af Yi Liu          2023-03-07  1360  	if (hdr.count)
b26ee777a3f3af Yi Liu          2023-03-07  1361  		return vfio_pci_ioctl_pci_hot_reset_groups(vdev, &hdr, slot, arg);
b26ee777a3f3af Yi Liu          2023-03-07  1362  
b26ee777a3f3af Yi Liu          2023-03-07 @1363  	iommufd = vfio_iommufd_physical_ctx(&vdev->vdev);
b26ee777a3f3af Yi Liu          2023-03-07  1364  	if (!iommufd)
b26ee777a3f3af Yi Liu          2023-03-07  1365  		return -EINVAL;
b26ee777a3f3af Yi Liu          2023-03-07  1366  
b26ee777a3f3af Yi Liu          2023-03-07  1367  	return vfio_pci_dev_set_hot_reset(vdev->vdev.dev_set, NULL, iommufd);
b26ee777a3f3af Yi Liu          2023-03-07  1368  }
b26ee777a3f3af Yi Liu          2023-03-07  1369  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
