Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D8A365
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Jan 2023 00:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674346257; x=1705882257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jRnj735wTh4Xv47YMo90baRFc5V6xc8dpborL6Njx3M=;
  b=R7hk1McLhxhrXHt19lLexCsrxkIIq6t6R1kAx6WO/P79HgsWOAmQYMKi
   O/+BD2j1pMUTKeAC98QbxdZIZ56hfxls24k8N12kudo/7Mn42CiyNDfd0
   79B7P6PMnLjERg7Ql262/sfmgprVjNliGNiFrCF+qe+1bhK9nY89hbBpA
   /DRCWW1k2zT0T797tQu+7I8EaSAu4QNfKSiz+f/2E01cLKz+2juTIzi4x
   6245yVCcONu9c/Zd1jEF0UvHGUxmLFq8kyNxGmcUCyyIjBtRowedRBBVI
   sp59g93AonDUJ2OjkE+VlHC+coohL3y6THeXBLLIGyAhZzs2TP4wE9AtX
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="327939893"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="327939893"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 16:10:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="661007419"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="661007419"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Jan 2023 16:10:55 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJNwk-0004b4-0x;
	Sun, 22 Jan 2023 00:10:54 +0000
Date: Sun, 22 Jan 2023 08:10:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/pci/vgaarb.c:235:17: warning: Value stored to 'dev' during
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202301220831.ENizXFlq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/pci/vgaarb.c:235:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Bjorn Helgaas <helgaas@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f67144022885344375ad03593e7a290cc614da34
commit: 1d38fe6ee6a874675ca3bba6b48e69a0e6176ffc PCI/VGA: Move vgaarb to drivers/pci
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
config: riscv-randconfig-c006-20230119 (https://download.01.org/0day-ci/archive/20230122/202301220831.ENizXFlq-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1d38fe6ee6a874675ca3bba6b48e69a0e6176ffc
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1d38fe6ee6a874675ca3bba6b48e69a0e6176ffc
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/spinlock.h:450:34: note: expanded from macro 'assert_spin_locked'
   #define assert_spin_locked(lock)        assert_raw_spin_locked(&(lock)->rlock)
                                           ^
   include/linux/spinlock_api_smp.h:20:35: note: expanded from macro 'assert_raw_spin_locked'
   #define assert_raw_spin_locked(x)       BUG_ON(!raw_spin_is_locked(x))
                                           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                             ^
   drivers/gpu/drm/nouveau/nvkm/core/event.c:42:2: note: Loop condition is true.  Entering loop body
           while (types) {
           ^
   drivers/gpu/drm/nouveau/nvkm/core/event.c:43:14: note: Calling '__ffs'
                   int type = __ffs(types); types &= ~(1 << type);
                              ^~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:18:6: note: Assuming the condition is true
           if ((word & 0xffffffff) == 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:18:2: note: Taking true branch
           if ((word & 0xffffffff) == 0) {
           ^
   include/asm-generic/bitops/__ffs.h:23:6: note: Assuming the condition is true
           if ((word & 0xffff) == 0) {
               ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:23:2: note: Taking true branch
           if ((word & 0xffff) == 0) {
           ^
   include/asm-generic/bitops/__ffs.h:27:6: note: Assuming the condition is true
           if ((word & 0xff) == 0) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:27:2: note: Taking true branch
           if ((word & 0xff) == 0) {
           ^
   include/asm-generic/bitops/__ffs.h:31:6: note: Assuming the condition is true
           if ((word & 0xf) == 0) {
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:31:2: note: Taking true branch
           if ((word & 0xf) == 0) {
           ^
   include/asm-generic/bitops/__ffs.h:35:6: note: Assuming the condition is true
           if ((word & 0x3) == 0) {
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:35:2: note: Taking true branch
           if ((word & 0x3) == 0) {
           ^
   include/asm-generic/bitops/__ffs.h:39:6: note: Assuming the condition is true
           if ((word & 0x1) == 0)
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:39:2: note: Taking true branch
           if ((word & 0x1) == 0)
           ^
   include/asm-generic/bitops/__ffs.h:40:3: note: The value 63 is assigned to 'num'
                   num += 1;
                   ^~~~~~~~
   include/asm-generic/bitops/__ffs.h:41:2: note: Returning the value 63 (loaded from 'num')
           return num;
           ^~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/core/event.c:43:14: note: Returning from '__ffs'
                   int type = __ffs(types); types &= ~(1 << type);
                              ^~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/core/event.c:43:3: note: 'type' initialized to 63
                   int type = __ffs(types); types &= ~(1 << type);
                   ^~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/core/event.c:43:41: note: The result of the left shift is undefined due to shifting by '63', which is greater or equal to the width of type 'int'
                   int type = __ffs(types); types &= ~(1 << type);
                                                         ^  ~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/pci/ecam.c:129:15: warning: Value stored to 'bsz' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned int bsz = 1 << cfg->bus_shift;
                        ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/pci/ecam.c:129:15: note: Value stored to 'bsz' during its initialization is never read
           unsigned int bsz = 1 << cfg->bus_shift;
                        ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/pci/ecam.c:130:15: warning: Value stored to 'busn' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned int busn = bus->number;
                        ^~~~   ~~~~~~~~~~~
   drivers/pci/ecam.c:130:15: note: Value stored to 'busn' during its initialization is never read
           unsigned int busn = bus->number;
                        ^~~~   ~~~~~~~~~~~
   drivers/pci/ecam.c:151:28: warning: Value stored to 'cfg' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct pci_config_window *cfg = bus->sysdata;
                                     ^~~   ~~~~~~~~~~~~
   drivers/pci/ecam.c:151:28: note: Value stored to 'cfg' during its initialization is never read
           struct pci_config_window *cfg = bus->sysdata;
                                     ^~~   ~~~~~~~~~~~~
   drivers/pci/ecam.c:152:15: warning: Value stored to 'busn' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned int busn = bus->number;
                        ^~~~   ~~~~~~~~~~~
   drivers/pci/ecam.c:152:15: note: Value stored to 'busn' during its initialization is never read
           unsigned int busn = bus->number;
                        ^~~~   ~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/pci/vgaarb.c:235:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = &vgadev->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/pci/vgaarb.c:235:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = &vgadev->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/pci/vgaarb.c:373:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = &vgadev->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/pci/vgaarb.c:373:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = &vgadev->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/pinctrl/bcm/pinctrl-nsp-mux.c:135:8: warning: Excessive padding in 'struct nsp_pin' (8 padding bytes, where 0 is optimal). Optimal fields order: name, pin, gpio_select, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct nsp_pin {
   ~~~~~~~^~~~~~~~~
   drivers/pinctrl/bcm/pinctrl-nsp-mux.c:135:8: note: Excessive padding in 'struct nsp_pin' (8 padding bytes, where 0 is optimal). Optimal fields order: name, pin, gpio_select, consider reordering the fields or adding explicit padding members
   struct nsp_pin {
   ~~~~~~~^~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.

vim +/dev +235 drivers/pci/vgaarb.c

deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  231  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  232  static struct vga_device *__vga_tryget(struct vga_device *vgadev,
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  233  				       unsigned int rsrc)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  234  {
a75d68f62106fe drivers/gpu/vga/vgaarb.c Bjorn Helgaas          2016-11-17 @235  	struct device *dev = &vgadev->pdev->dev;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  236  	unsigned int wants, legacy_wants, match;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  237  	struct vga_device *conflict;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  238  	unsigned int pci_bits;
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  239  	u32 flags = 0;
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  240  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  241  	/* Account for "normal" resources to lock. If we decode the legacy,
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  242  	 * counterpart, we need to request it as well
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  243  	 */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  244  	if ((rsrc & VGA_RSRC_NORMAL_IO) &&
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  245  	    (vgadev->decodes & VGA_RSRC_LEGACY_IO))
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  246  		rsrc |= VGA_RSRC_LEGACY_IO;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  247  	if ((rsrc & VGA_RSRC_NORMAL_MEM) &&
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  248  	    (vgadev->decodes & VGA_RSRC_LEGACY_MEM))
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  249  		rsrc |= VGA_RSRC_LEGACY_MEM;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  250  
a75d68f62106fe drivers/gpu/vga/vgaarb.c Bjorn Helgaas          2016-11-17  251  	vgaarb_dbg(dev, "%s: %d\n", __func__, rsrc);
a75d68f62106fe drivers/gpu/vga/vgaarb.c Bjorn Helgaas          2016-11-17  252  	vgaarb_dbg(dev, "%s: owns: %d\n", __func__, vgadev->owns);
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  253  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  254  	/* Check what resources we need to acquire */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  255  	wants = rsrc & ~vgadev->owns;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  256  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  257  	/* We already own everything, just mark locked & bye bye */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  258  	if (wants == 0)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  259  		goto lock_them;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  260  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  261  	/* We don't need to request a legacy resource, we just enable
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  262  	 * appropriate decoding and go
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  263  	 */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  264  	legacy_wants = wants & VGA_RSRC_LEGACY_MASK;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  265  	if (legacy_wants == 0)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  266  		goto enable_them;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  267  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  268  	/* Ok, we don't, let's find out how we need to kick off */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  269  	list_for_each_entry(conflict, &vga_list, list) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  270  		unsigned int lwants = legacy_wants;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  271  		unsigned int change_bridge = 0;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  272  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  273  		/* Don't conflict with myself */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  274  		if (vgadev == conflict)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  275  			continue;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  276  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  277  		/* We have a possible conflict. before we go further, we must
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  278  		 * check if we sit on the same bus as the conflicting device.
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  279  		 * if we don't, then we must tie both IO and MEM resources
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  280  		 * together since there is only a single bit controlling
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  281  		 * VGA forwarding on P2P bridges
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  282  		 */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  283  		if (vgadev->pdev->bus != conflict->pdev->bus) {
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  284  			change_bridge = 1;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  285  			lwants = VGA_RSRC_LEGACY_IO | VGA_RSRC_LEGACY_MEM;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  286  		}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  287  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  288  		/* Check if the guy has a lock on the resource. If he does,
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  289  		 * return the conflicting entry
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  290  		 */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  291  		if (conflict->locks & lwants)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  292  			return conflict;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  293  
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  294  		/* Ok, now check if it owns the resource we want.  We can
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  295  		 * lock resources that are not decoded, therefore a device
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  296  		 * can own resources it doesn't decode.
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  297  		 */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  298  		match = lwants & conflict->owns;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  299  		if (!match)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  300  			continue;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  301  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  302  		/* looks like he doesn't have a lock, we can steal
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  303  		 * them from him
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  304  		 */
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  305  
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  306  		flags = 0;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  307  		pci_bits = 0;
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  308  
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  309  		/* If we can't control legacy resources via the bridge, we
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  310  		 * also need to disable normal decoding.
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  311  		 */
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  312  		if (!conflict->bridge_has_one_vga) {
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  313  			if ((match & conflict->decodes) & VGA_RSRC_LEGACY_MEM)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  314  				pci_bits |= PCI_COMMAND_MEMORY;
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  315  			if ((match & conflict->decodes) & VGA_RSRC_LEGACY_IO)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  316  				pci_bits |= PCI_COMMAND_IO;
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  317  
f6b1772b255504 drivers/gpu/vga/vgaarb.c Christoph Hellwig      2021-07-16  318  			if (pci_bits)
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  319  				flags |= PCI_VGA_STATE_CHANGE_DECODES;
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  320  		}
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  321  
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  322  		if (change_bridge)
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  323  			flags |= PCI_VGA_STATE_CHANGE_BRIDGE;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  324  
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  325  		pci_set_vga_state(conflict->pdev, false, pci_bits, flags);
f22d776f3e280e drivers/gpu/vga/vgaarb.c Alex Williamson        2013-08-15  326  		conflict->owns &= ~match;
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  327  
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  328  		/* If we disabled normal decoding, reflect it in owns */
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  329  		if (pci_bits & PCI_COMMAND_MEMORY)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  330  			conflict->owns &= ~VGA_RSRC_NORMAL_MEM;
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  331  		if (pci_bits & PCI_COMMAND_IO)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  332  			conflict->owns &= ~VGA_RSRC_NORMAL_IO;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  333  	}
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  334  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  335  enable_them:
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  336  	/* ok dude, we got it, everybody conflicting has been disabled, let's
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  337  	 * enable us.  Mark any bits in "owns" regardless of whether we
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  338  	 * decoded them.  We can lock resources we don't decode, therefore
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  339  	 * we must track them via "owns".
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  340  	 */
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  341  	flags = 0;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  342  	pci_bits = 0;
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  343  
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  344  	if (!vgadev->bridge_has_one_vga) {
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  345  		flags |= PCI_VGA_STATE_CHANGE_DECODES;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  346  		if (wants & (VGA_RSRC_LEGACY_MEM|VGA_RSRC_NORMAL_MEM))
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  347  			pci_bits |= PCI_COMMAND_MEMORY;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  348  		if (wants & (VGA_RSRC_LEGACY_IO|VGA_RSRC_NORMAL_IO))
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  349  			pci_bits |= PCI_COMMAND_IO;
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  350  	}
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  351  	if (wants & VGA_RSRC_LEGACY_MASK)
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  352  		flags |= PCI_VGA_STATE_CHANGE_BRIDGE;
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  353  
3448a19da479b6 drivers/gpu/vga/vgaarb.c Dave Airlie            2010-06-01  354  	pci_set_vga_state(vgadev->pdev, true, pci_bits, flags);
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  355  
4e4e7dc55af5aa drivers/gpu/vga/vgaarb.c Alex Williamson        2014-07-03  356  	vgadev->owns |= wants;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  357  lock_them:
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  358  	vgadev->locks |= (rsrc & VGA_RSRC_LEGACY_MASK);
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  359  	if (rsrc & VGA_RSRC_LEGACY_IO)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  360  		vgadev->io_lock_cnt++;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  361  	if (rsrc & VGA_RSRC_LEGACY_MEM)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  362  		vgadev->mem_lock_cnt++;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  363  	if (rsrc & VGA_RSRC_NORMAL_IO)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  364  		vgadev->io_norm_cnt++;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  365  	if (rsrc & VGA_RSRC_NORMAL_MEM)
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  366  		vgadev->mem_norm_cnt++;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  367  
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  368  	return NULL;
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  369  }
deb2d2ecd43dfc drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11  370  

:::::: The code at line 235 was first introduced by commit
:::::: a75d68f62106fe66c4b8b96c0ee7155bdafc6f06 vgaarb: Use dev_printk() when possible

:::::: TO: Bjorn Helgaas <bhelgaas@google.com>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
