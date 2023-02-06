Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688792C9D
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Feb 2023 09:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675674715; x=1707210715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uuX8msbqiFrRUPnhBZD9FVDaaFkHgWkp9ftDw2btxos=;
  b=JXNVubpS9dm8bjrPn8E9c0vPiCciU5ozeYVShqvFCTrrdlD9S4PW3YtB
   uWuvwKW+Z3EGGZLiM684uIujdiL1MFksNFF2ZtsHCg4JGfhq/VE8x/SR3
   89sZlqAA0q2lsPOthV7YkLm8EBXEIFEuDG6utez6PfGmrwsk7YVIXXPUz
   MmjlF5psSu5UPLZJ5hu5r9vPvKgSUTIMAD/MVFSy41tBgNxmdnxkHsO9r
   grzjdr11eDJeBGyD/3HXqjgJSdPv005jJRaZRHu7+czW6X/yl1c/pPuUE
   xQz0PGQzKchoeyfHYppeRIMqCRpMgW7VzThmcz+rteMnhPiHGCF/wkkwl
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="415382356"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="415382356"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 01:11:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="840289770"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="840289770"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Feb 2023 01:11:52 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOxXU-0002Su-0O;
	Mon, 06 Feb 2023 09:11:52 +0000
Date: Mon, 6 Feb 2023 17:11:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mnyman-xhci:for-usb-next 8/11] drivers/usb/host/xhci-hub.c:606:2:
 warning: Value stored to 'portsc' is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202302061750.9zmcAVWS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/usb/host/xhci-hub.c:606:2: warning: Value stored to 'portsc' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Mathias Nyman <mathias.nyman@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git for-usb-next
head:   a735337dbb209d81aab4d29015fe9f61140ee3f1
commit: 6469bdaad3f2ed0e0dcb120edc1b2e949fe40bc1 [8/11] xhci: Pass port structure as parameter to xhci_disable_port().
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: riscv-randconfig-c006-20230202 (https://download.01.org/0day-ci/archive/20230206/202302061750.9zmcAVWS-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commit/?id=6469bdaad3f2ed0e0dcb120edc1b2e949fe40bc1
        git remote add mnyman-xhci https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git
        git fetch --no-tags mnyman-xhci for-usb-next
        git checkout 6469bdaad3f2ed0e0dcb120edc1b2e949fe40bc1
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
                                  ^~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:128:16: note: Array access (from variable 'addr') results in a null pointer dereference
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   include/asm-generic/bitops/generic-non-atomic.h:128:16: warning: Array access (from variable 'addr') results in a null pointer dereference [clang-analyzer-core.NullDereference]
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^
   drivers/input/mousedev.c:351:2: note: Control jumps to 'case 3:'  at line 353
           switch (type) {
           ^
   drivers/input/mousedev.c:355:7: note: Left side of '&&' is true
                   if (test_bit(BTN_TRIGGER, handle->dev->keybit))
                       ^
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^
   include/linux/bitops.h:49:4: note: expanded from macro 'bitop'
           ((__builtin_constant_p(nr) &&                                   \
             ^
   drivers/input/mousedev.c:355:7: note: Assuming field 'keybit' is equal to 0
                   if (test_bit(BTN_TRIGGER, handle->dev->keybit))
                       ^
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:50:25: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/mousedev.c:355:7: note: Left side of '&&' is false
                   if (test_bit(BTN_TRIGGER, handle->dev->keybit))
                       ^
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^
   include/linux/bitops.h:50:63: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
                                                                        ^
   drivers/input/mousedev.c:355:29: note: Passing null pointer value via 2nd parameter 'addr'
                   if (test_bit(BTN_TRIGGER, handle->dev->keybit))
                                             ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                                                ^~~~
   include/linux/bitops.h:53:32: note: expanded from macro 'bitop'
            const##op(nr, addr) : op(nr, addr))
                                         ^~~~
   drivers/input/mousedev.c:355:7: note: Calling 'generic_test_bit'
                   if (test_bit(BTN_TRIGGER, handle->dev->keybit))
                       ^
   include/linux/bitops.h:61:35: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ~~~~~~^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/non-instrumented-non-atomic.h:14:20: note: expanded from macro '_test_bit'
   #define _test_bit               arch_test_bit
                                   ^
   include/asm-generic/bitops/non-atomic.h:15:23: note: expanded from macro 'arch_test_bit'
   #define arch_test_bit generic_test_bit
                         ^
   include/linux/bitops.h:53:25: note: expanded from macro 'bitop'
            const##op(nr, addr) : op(nr, addr))
                                  ^~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:128:16: note: Array access (from variable 'addr') results in a null pointer dereference
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   34 warnings generated.
   drivers/usb/host/xhci-hub.c:71:13: warning: The left operand of '>=' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (bcdUSB >= 0x0310) {
               ~~~~~~ ^
   drivers/usb/host/xhci-hub.c:42:2: note: 'bcdUSB' declared without an initial value
           u16                             bcdUSB;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-hub.c:60:14: note: Assuming 'i' is >= field 'num_port_caps'
           for (i = 0; i < xhci->num_port_caps; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-hub.c:60:2: note: Loop condition is false. Execution continues on line 71
           for (i = 0; i < xhci->num_port_caps; i++) {
           ^
   drivers/usb/host/xhci-hub.c:71:13: note: The left operand of '>=' is a garbage value
           if (bcdUSB >= 0x0310) {
               ~~~~~~ ^
   drivers/usb/host/xhci-hub.c:497:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = 0;
           ^     ~
   drivers/usb/host/xhci-hub.c:497:2: note: Value stored to 'ret' is never read
           ret = 0;
           ^     ~
>> drivers/usb/host/xhci-hub.c:606:2: warning: Value stored to 'portsc' is never read [clang-analyzer-deadcode.DeadStores]
           portsc = readl(port->addr);
           ^
   drivers/usb/host/xhci-hub.c:606:2: note: Value stored to 'portsc' is never read
   drivers/usb/host/xhci-hub.c:620:3: warning: Value stored to 'port_change_bit' is never read [clang-analyzer-deadcode.DeadStores]
                   port_change_bit = "reset";
                   ^                 ~~~~~~~
   drivers/usb/host/xhci-hub.c:620:3: note: Value stored to 'port_change_bit' is never read
                   port_change_bit = "reset";
                   ^                 ~~~~~~~
   drivers/usb/host/xhci-hub.c:624:3: warning: Value stored to 'port_change_bit' is never read [clang-analyzer-deadcode.DeadStores]
                   port_change_bit = "warm(BH) reset";
                   ^                 ~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-hub.c:624:3: note: Value stored to 'port_change_bit' is never read
                   port_change_bit = "warm(BH) reset";
                   ^                 ~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-hub.c:628:3: warning: Value stored to 'port_change_bit' is never read [clang-analyzer-deadcode.DeadStores]
                   port_change_bit = "connect";
                   ^                 ~~~~~~~~~
   drivers/usb/host/xhci-hub.c:628:3: note: Value stored to 'port_change_bit' is never read
                   port_change_bit = "connect";
                   ^                 ~~~~~~~~~
   drivers/usb/host/xhci-hub.c:632:3: warning: Value stored to 'port_change_bit' is never read [clang-analyzer-deadcode.DeadStores]
                   port_change_bit = "over-current";
                   ^                 ~~~~~~~~~~~~~~
   drivers/usb/host/xhci-hub.c:632:3: note: Value stored to 'port_change_bit' is never read
                   port_change_bit = "over-current";
                   ^                 ~~~~~~~~~~~~~~
   drivers/usb/host/xhci-hub.c:636:3: warning: Value stored to 'port_change_bit' is never read [clang-analyzer-deadcode.DeadStores]
                   port_change_bit = "enable/disable";
                   ^                 ~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-hub.c:636:3: note: Value stored to 'port_change_bit' is never read
                   port_change_bit = "enable/disable";
                   ^                 ~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-hub.c:640:3: warning: Value stored to 'port_change_bit' is never read [clang-analyzer-deadcode.DeadStores]
                   port_change_bit = "suspend/resume";
                   ^                 ~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-hub.c:640:3: note: Value stored to 'port_change_bit' is never read
                   port_change_bit = "suspend/resume";
                   ^                 ~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-hub.c:644:3: warning: Value stored to 'port_change_bit' is never read [clang-analyzer-deadcode.DeadStores]
                   port_change_bit = "link state";
                   ^                 ~~~~~~~~~~~~
   drivers/usb/host/xhci-hub.c:644:3: note: Value stored to 'port_change_bit' is never read
                   port_change_bit = "link state";
                   ^                 ~~~~~~~~~~~~
   drivers/usb/host/xhci-hub.c:648:3: warning: Value stored to 'port_change_bit' is never read [clang-analyzer-deadcode.DeadStores]
                   port_change_bit = "config error";
                   ^                 ~~~~~~~~~~~~~~
   drivers/usb/host/xhci-hub.c:648:3: note: Value stored to 'port_change_bit' is never read
                   port_change_bit = "config error";
                   ^                 ~~~~~~~~~~~~~~
   drivers/usb/host/xhci-hub.c:656:2: warning: Value stored to 'port_status' is never read [clang-analyzer-deadcode.DeadStores]
           port_status = readl(addr);
           ^
   drivers/usb/host/xhci-hub.c:656:2: note: Value stored to 'port_status' is never read
   drivers/usb/host/xhci-hub.c:1354:4: warning: Value stored to 'temp' is never read [clang-analyzer-deadcode.DeadStores]
                           temp = readl(port->addr);
                           ^
   drivers/usb/host/xhci-hub.c:1354:4: note: Value stored to 'temp' is never read
   drivers/usb/host/xhci-hub.c:1372:5: warning: Value stored to 'temp' is never read [clang-analyzer-deadcode.DeadStores]
                                   temp = readl(port->addr);
                                   ^
   drivers/usb/host/xhci-hub.c:1372:5: note: Value stored to 'temp' is never read
   drivers/usb/host/xhci-hub.c:1381:5: warning: Value stored to 'temp' is never read [clang-analyzer-deadcode.DeadStores]
                                   temp = readl(port->addr);
                                   ^
   drivers/usb/host/xhci-hub.c:1381:5: note: Value stored to 'temp' is never read
   drivers/usb/host/xhci-hub.c:1414:5: warning: Value stored to 'temp' is never read [clang-analyzer-deadcode.DeadStores]
                                   temp = readl(port->addr);
                                   ^
   drivers/usb/host/xhci-hub.c:1414:5: note: Value stored to 'temp' is never read
   drivers/usb/host/xhci-hub.c:1462:5: warning: Value stored to 'temp' is never read [clang-analyzer-deadcode.DeadStores]
                                   temp = readl(port->addr);
                                   ^
   drivers/usb/host/xhci-hub.c:1462:5: note: Value stored to 'temp' is never read
   drivers/usb/host/xhci-hub.c:1487:5: warning: Value stored to 'temp' is never read [clang-analyzer-deadcode.DeadStores]
                                   temp = readl(port->addr);
                                   ^
   drivers/usb/host/xhci-hub.c:1487:5: note: Value stored to 'temp' is never read
   drivers/usb/host/xhci-hub.c:1504:4: warning: Value stored to 'temp' is never read [clang-analyzer-deadcode.DeadStores]
                           temp = readl(port->addr);
                           ^
   drivers/usb/host/xhci-hub.c:1504:4: note: Value stored to 'temp' is never read
   drivers/usb/host/xhci-hub.c:1510:4: warning: Value stored to 'temp' is never read [clang-analyzer-deadcode.DeadStores]
                           temp = readl(port->addr);
                           ^
   drivers/usb/host/xhci-hub.c:1510:4: note: Value stored to 'temp' is never read
   drivers/usb/host/xhci-hub.c:1517:4: warning: Value stored to 'temp' is never read [clang-analyzer-deadcode.DeadStores]
                           temp = readl(port->addr);
                           ^
   drivers/usb/host/xhci-hub.c:1517:4: note: Value stored to 'temp' is never read
   drivers/usb/host/xhci-hub.c:1549:3: warning: Value stored to 'temp' is never read [clang-analyzer-deadcode.DeadStores]
                   temp = readl(port->addr);
                   ^
   drivers/usb/host/xhci-hub.c:1549:3: note: Value stored to 'temp' is never read
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.

vim +/portsc +606 drivers/usb/host/xhci-hub.c

be88fe4f4dda93 Andiry Xu     2010-10-14  580  
6469bdaad3f2ed Mathias Nyman 2022-12-12  581  static void xhci_disable_port(struct xhci_hcd *xhci, struct xhci_port *port)
6219c047d3fe18 Sarah Sharp   2009-12-09  582  {
6469bdaad3f2ed Mathias Nyman 2022-12-12  583  	struct usb_hcd *hcd;
6469bdaad3f2ed Mathias Nyman 2022-12-12  584  	u32 portsc;
6469bdaad3f2ed Mathias Nyman 2022-12-12  585  
6469bdaad3f2ed Mathias Nyman 2022-12-12  586  	hcd = port->rhub->hcd;
6469bdaad3f2ed Mathias Nyman 2022-12-12  587  
6dd0a3a7e0793d Sarah Sharp   2010-11-16  588  	/* Don't allow the USB core to disable SuperSpeed ports. */
b50107bb83d027 Mathias Nyman 2015-10-01  589  	if (hcd->speed >= HCD_USB3) {
6469bdaad3f2ed Mathias Nyman 2022-12-12  590  		xhci_dbg(xhci, "Ignoring request to disable SuperSpeed port.\n");
6dd0a3a7e0793d Sarah Sharp   2010-11-16  591  		return;
6dd0a3a7e0793d Sarah Sharp   2010-11-16  592  	}
6dd0a3a7e0793d Sarah Sharp   2010-11-16  593  
41135de1e7fd14 Felipe Balbi  2017-01-23  594  	if (xhci->quirks & XHCI_BROKEN_PORT_PED) {
41135de1e7fd14 Felipe Balbi  2017-01-23  595  		xhci_dbg(xhci,
41135de1e7fd14 Felipe Balbi  2017-01-23  596  			 "Broken Port Enabled/Disabled, ignoring port disable request.\n");
41135de1e7fd14 Felipe Balbi  2017-01-23  597  		return;
41135de1e7fd14 Felipe Balbi  2017-01-23  598  	}
41135de1e7fd14 Felipe Balbi  2017-01-23  599  
6469bdaad3f2ed Mathias Nyman 2022-12-12  600  	portsc = readl(port->addr);
6469bdaad3f2ed Mathias Nyman 2022-12-12  601  	portsc = xhci_port_state_to_neutral(portsc);
6469bdaad3f2ed Mathias Nyman 2022-12-12  602  
6219c047d3fe18 Sarah Sharp   2009-12-09  603  	/* Write 1 to disable the port */
6469bdaad3f2ed Mathias Nyman 2022-12-12  604  	writel(portsc | PORT_PE, port->addr);
6469bdaad3f2ed Mathias Nyman 2022-12-12  605  
6469bdaad3f2ed Mathias Nyman 2022-12-12 @606  	portsc = readl(port->addr);
d70d5a846671c3 Mathias Nyman 2019-04-26  607  	xhci_dbg(xhci, "disable port %d-%d, portsc: 0x%x\n",
6469bdaad3f2ed Mathias Nyman 2022-12-12  608  		 hcd->self.busnum, port->hcd_portnum + 1, portsc);
6219c047d3fe18 Sarah Sharp   2009-12-09  609  }
6219c047d3fe18 Sarah Sharp   2009-12-09  610  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
