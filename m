Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCEC8C0B
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Feb 2023 18:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677005680; x=1708541680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CaA2batHf5jlNMvA6Zb+izCpYYqUaPfBtXWCxFfckTQ=;
  b=Mhf55/YGnawbLjsKD9EBe43XXVl6wH2WkxHqGCBI4SXJviZEPw3fs5Pf
   m0LH5M+mu7LlA2I69SwQbRsDjr1gHpGDWfjW3MEfkzs7wR27CPRsmjkG4
   OIdBAXg/k7yEbpUM/9JWKnwTtOItKjGTxb4fLQ9Y4HPKP+MM9WcfShjGB
   jiV51Y0E191Iw7x2U5wKXFUoN7CBvqRLaSiBXCktQd95VhZZ6FwmKb2+I
   rPipEBDqoKHAa0cFbz4mzQJnYQgJk2BoYIQA8qZwlqPwkzTlaMf+FDBvp
   L0BhZ8dQDIUryAaF40KGERZLUSskEn0Fdk3p5+0J6p3c7WUYz3onUM/ad
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="312349316"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="312349316"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 10:54:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="704159373"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="704159373"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 21 Feb 2023 10:54:37 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUXmf-0000Ak-0D;
	Tue, 21 Feb 2023 18:54:37 +0000
Date: Wed, 22 Feb 2023 02:53:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/usb/host/ehci-omap.c:135:2: warning: Value stored to 'ret'
 is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202302220237.zPuDwkE2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/usb/host/ehci-omap.c:135:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   89f5349e0673322857bd432fa23113af56673739
commit: 11e002924ddb6f12638532331195a8ab09bbbf7e usb: omap: avoid mach/*.h headers
date:   10 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20230219 (https://download.01.org/0day-ci/archive/20230222/202302220237.zPuDwkE2-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=11e002924ddb6f12638532331195a8ab09bbbf7e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 11e002924ddb6f12638532331195a8ab09bbbf7e
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302220237.zPuDwkE2-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                                   ^~~~~~~~~~~~~~~~
   sound/soc/generic/simple-card.c:485:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(li, 0, sizeof(*li));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   sound/soc/generic/simple-card.c:711:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dai_props->cpu_dai, &cinfo->cpu_dai,
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   sound/soc/generic/simple-card.c:711:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dai_props->cpu_dai, &cinfo->cpu_dai,
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   sound/soc/generic/simple-card.c:713:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dai_props->codec_dai, &cinfo->codec_dai,
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   sound/soc/generic/simple-card.c:713:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dai_props->codec_dai, &cinfo->codec_dai,
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/media/dvb-frontends/tda10021.c:475:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&state->frontend.ops, &tda10021_ops, sizeof(struct dvb_frontend_ops));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10021.c:475:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&state->frontend.ops, &tda10021_ops, sizeof(struct dvb_frontend_ops));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 49 warnings (48 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   52 warnings generated.
>> drivers/usb/host/ehci-omap.c:135:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = -ENODEV;
           ^     ~~~~~~~
   drivers/usb/host/ehci-omap.c:135:2: note: Value stored to 'ret' is never read
           ret = -ENODEV;
           ^     ~~~~~~~
   Suppressed 51 warnings (50 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/usb/host/oxu210hp-hcd.c:881:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&desc->u.hs.DeviceRemovable[0], 0, temp);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/usb/host/oxu210hp-hcd.c:881:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&desc->u.hs.DeviceRemovable[0], 0, temp);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/usb/host/oxu210hp-hcd.c:882:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&desc->u.hs.DeviceRemovable[temp], 0xff, temp);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/usb/host/oxu210hp-hcd.c:882:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&desc->u.hs.DeviceRemovable[temp], 0xff, temp);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/usb/host/oxu210hp-hcd.c:977:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(qtd, 0, sizeof *qtd);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/usb/host/oxu210hp-hcd.c:977:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(qtd, 0, sizeof *qtd);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/usb/host/oxu210hp-hcd.c:1013:3: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(qtd, 0, sizeof *qtd);
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/usb/host/oxu210hp-hcd.c:1013:3: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(qtd, 0, sizeof *qtd);
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \

vim +/ret +135 drivers/usb/host/ehci-omap.c

54a419668b0f27 Alan Stern          2013-03-12   77  
54ab2b02ef6a45 Felipe Balbi        2009-10-14   78  /**
54ab2b02ef6a45 Felipe Balbi        2009-10-14   79   * ehci_hcd_omap_probe - initialize TI-based HCDs
ede175a529b112 Lee Jones           2020-07-02   80   * @pdev: Pointer to this platform device's information
54ab2b02ef6a45 Felipe Balbi        2009-10-14   81   *
54ab2b02ef6a45 Felipe Balbi        2009-10-14   82   * Allocates basic resources for this USB host controller, and
54ab2b02ef6a45 Felipe Balbi        2009-10-14   83   * then invokes the start() method for the HCD associated with it
54ab2b02ef6a45 Felipe Balbi        2009-10-14   84   * through the hotplug entry's driver_data.
54ab2b02ef6a45 Felipe Balbi        2009-10-14   85   */
54ab2b02ef6a45 Felipe Balbi        2009-10-14   86  static int ehci_hcd_omap_probe(struct platform_device *pdev)
54ab2b02ef6a45 Felipe Balbi        2009-10-14   87  {
19403165c272cc Keshava Munegowda   2011-03-01   88  	struct device *dev = &pdev->dev;
d4f09e28d7bc5c Jingoo Han          2013-07-30   89  	struct usbhs_omap_platform_data *pdata = dev_get_platdata(dev);
54ab2b02ef6a45 Felipe Balbi        2009-10-14   90  	struct resource	*res;
54ab2b02ef6a45 Felipe Balbi        2009-10-14   91  	struct usb_hcd	*hcd;
19403165c272cc Keshava Munegowda   2011-03-01   92  	void __iomem *regs;
22d9d8e8316d7f Russell King        2013-06-10   93  	int ret;
19403165c272cc Keshava Munegowda   2011-03-01   94  	int irq;
6e3d4bec6b1e08 Keshava Munegowda   2011-04-21   95  	int i;
dcd64063fd917b Roger Quadros       2013-03-12   96  	struct omap_hcd	*omap;
54ab2b02ef6a45 Felipe Balbi        2009-10-14   97  
54ab2b02ef6a45 Felipe Balbi        2009-10-14   98  	if (usb_disabled())
19403165c272cc Keshava Munegowda   2011-03-01   99  		return -ENODEV;
54ab2b02ef6a45 Felipe Balbi        2009-10-14  100  
19403165c272cc Keshava Munegowda   2011-03-01  101  	if (!dev->parent) {
19403165c272cc Keshava Munegowda   2011-03-01  102  		dev_err(dev, "Missing parent device\n");
19403165c272cc Keshava Munegowda   2011-03-01  103  		return -ENODEV;
54ab2b02ef6a45 Felipe Balbi        2009-10-14  104  	}
54ab2b02ef6a45 Felipe Balbi        2009-10-14  105  
a1ae0affee119e Roger Quadros       2013-03-12  106  	/* For DT boot, get platform data from parent. i.e. usbhshost */
a1ae0affee119e Roger Quadros       2013-03-12  107  	if (dev->of_node) {
d4f09e28d7bc5c Jingoo Han          2013-07-30  108  		pdata = dev_get_platdata(dev->parent);
a1ae0affee119e Roger Quadros       2013-03-12  109  		dev->platform_data = pdata;
a1ae0affee119e Roger Quadros       2013-03-12  110  	}
a1ae0affee119e Roger Quadros       2013-03-12  111  
a1ae0affee119e Roger Quadros       2013-03-12  112  	if (!pdata) {
a1ae0affee119e Roger Quadros       2013-03-12  113  		dev_err(dev, "Missing platform data\n");
a1ae0affee119e Roger Quadros       2013-03-12  114  		return -ENODEV;
a1ae0affee119e Roger Quadros       2013-03-12  115  	}
a1ae0affee119e Roger Quadros       2013-03-12  116  
3414211b914464 Roger Quadros       2013-03-12  117  	irq = platform_get_irq(pdev, 0);
b33f37064b743d Stephen Boyd        2019-07-30  118  	if (irq < 0)
99dbff202e28ad Gustavo A. R. Silva 2017-08-08  119  		return irq;
54ab2b02ef6a45 Felipe Balbi        2009-10-14  120  
3414211b914464 Roger Quadros       2013-03-12  121  	res =  platform_get_resource(pdev, IORESOURCE_MEM, 0);
18c2bb1b8c1571 Roger Quadros       2013-03-12  122  	regs = devm_ioremap_resource(dev, res);
18c2bb1b8c1571 Roger Quadros       2013-03-12  123  	if (IS_ERR(regs))
18c2bb1b8c1571 Roger Quadros       2013-03-12  124  		return PTR_ERR(regs);
54ab2b02ef6a45 Felipe Balbi        2009-10-14  125  
a1ae0affee119e Roger Quadros       2013-03-12  126  	/*
a1ae0affee119e Roger Quadros       2013-03-12  127  	 * Right now device-tree probed devices don't get dma_mask set.
a1ae0affee119e Roger Quadros       2013-03-12  128  	 * Since shared usb code relies on it, set it here for now.
a1ae0affee119e Roger Quadros       2013-03-12  129  	 * Once we have dma capability bindings this can go away.
a1ae0affee119e Roger Quadros       2013-03-12  130  	 */
e1fd7341837238 Russell King        2013-06-27  131  	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
22d9d8e8316d7f Russell King        2013-06-10  132  	if (ret)
22d9d8e8316d7f Russell King        2013-06-10  133  		return ret;
a1ae0affee119e Roger Quadros       2013-03-12  134  
22d9d8e8316d7f Russell King        2013-06-10 @135  	ret = -ENODEV;
19403165c272cc Keshava Munegowda   2011-03-01  136  	hcd = usb_create_hcd(&ehci_omap_hc_driver, dev,
19403165c272cc Keshava Munegowda   2011-03-01  137  			dev_name(dev));
19403165c272cc Keshava Munegowda   2011-03-01  138  	if (!hcd) {
18c2bb1b8c1571 Roger Quadros       2013-03-12  139  		dev_err(dev, "Failed to create HCD\n");
18c2bb1b8c1571 Roger Quadros       2013-03-12  140  		return -ENOMEM;
54ab2b02ef6a45 Felipe Balbi        2009-10-14  141  	}
54ab2b02ef6a45 Felipe Balbi        2009-10-14  142  
19403165c272cc Keshava Munegowda   2011-03-01  143  	hcd->rsrc_start = res->start;
19403165c272cc Keshava Munegowda   2011-03-01  144  	hcd->rsrc_len = resource_size(res);
19403165c272cc Keshava Munegowda   2011-03-01  145  	hcd->regs = regs;
413fd1e9aa3e04 Roger Quadros       2013-03-13  146  	hcd_to_ehci(hcd)->caps = regs;
881142660697bb Ajay Kumar Gupta    2009-12-28  147  
dcd64063fd917b Roger Quadros       2013-03-12  148  	omap = (struct omap_hcd *)hcd_to_ehci(hcd)->priv;
dcd64063fd917b Roger Quadros       2013-03-12  149  	omap->nports = pdata->nports;
dcd64063fd917b Roger Quadros       2013-03-12  150  
dcd64063fd917b Roger Quadros       2013-03-12  151  	platform_set_drvdata(pdev, hcd);
dcd64063fd917b Roger Quadros       2013-03-12  152  
dcd64063fd917b Roger Quadros       2013-03-12  153  	/* get the PHY devices if needed */
dcd64063fd917b Roger Quadros       2013-03-12  154  	for (i = 0 ; i < omap->nports ; i++) {
dcd64063fd917b Roger Quadros       2013-03-12  155  		struct usb_phy *phy;
dcd64063fd917b Roger Quadros       2013-03-12  156  
dcd64063fd917b Roger Quadros       2013-03-12  157  		/* get the PHY device */
a1ae0affee119e Roger Quadros       2013-03-12  158  		phy = devm_usb_get_phy_by_phandle(dev, "phys", i);
2bef64b89ae315 Roger Quadros       2013-04-17  159  		if (IS_ERR(phy)) {
8dc7623bf60849 Roger Quadros       2018-12-14  160  			ret = PTR_ERR(phy);
8dc7623bf60849 Roger Quadros       2018-12-14  161  			if (ret == -ENODEV) { /* no PHY */
8dc7623bf60849 Roger Quadros       2018-12-14  162  				phy = NULL;
a2f450ca88a394 Roger Quadros       2013-03-12  163  				continue;
8dc7623bf60849 Roger Quadros       2018-12-14  164  			}
a2f450ca88a394 Roger Quadros       2013-03-12  165  
5008ae5156ebf3 Ladislav Michl      2018-01-18  166  			if (ret != -EPROBE_DEFER)
5008ae5156ebf3 Ladislav Michl      2018-01-18  167  				dev_err(dev, "Can't get PHY for port %d: %d\n",
dcd64063fd917b Roger Quadros       2013-03-12  168  					i, ret);
dcd64063fd917b Roger Quadros       2013-03-12  169  			goto err_phy;
dcd64063fd917b Roger Quadros       2013-03-12  170  		}
dcd64063fd917b Roger Quadros       2013-03-12  171  
dcd64063fd917b Roger Quadros       2013-03-12  172  		omap->phy[i] = phy;
4e5c9e6fa2d232 Roger Quadros       2013-06-14  173  
4e5c9e6fa2d232 Roger Quadros       2013-06-14  174  		if (pdata->port_mode[i] == OMAP_EHCI_PORT_MODE_PHY) {
4e5c9e6fa2d232 Roger Quadros       2013-06-14  175  			usb_phy_init(omap->phy[i]);
4e5c9e6fa2d232 Roger Quadros       2013-06-14  176  			/* bring PHY out of suspend */
4e5c9e6fa2d232 Roger Quadros       2013-06-14  177  			usb_phy_set_suspend(omap->phy[i], 0);
4e5c9e6fa2d232 Roger Quadros       2013-06-14  178  		}
dcd64063fd917b Roger Quadros       2013-03-12  179  	}
dcd64063fd917b Roger Quadros       2013-03-12  180  
6c984b066d84bb Keshava Munegowda   2011-10-11  181  	pm_runtime_enable(dev);
6c984b066d84bb Keshava Munegowda   2011-10-11  182  	pm_runtime_get_sync(dev);
54ab2b02ef6a45 Felipe Balbi        2009-10-14  183  
19403165c272cc Keshava Munegowda   2011-03-01  184  	/*
19403165c272cc Keshava Munegowda   2011-03-01  185  	 * An undocumented "feature" in the OMAP3 EHCI controller,
19403165c272cc Keshava Munegowda   2011-03-01  186  	 * causes suspended ports to be taken out of suspend when
19403165c272cc Keshava Munegowda   2011-03-01  187  	 * the USBCMD.Run/Stop bit is cleared (for example when
19403165c272cc Keshava Munegowda   2011-03-01  188  	 * we do ehci_bus_suspend).
19403165c272cc Keshava Munegowda   2011-03-01  189  	 * This breaks suspend-resume if the root-hub is allowed
19403165c272cc Keshava Munegowda   2011-03-01  190  	 * to suspend. Writing 1 to this undocumented register bit
19403165c272cc Keshava Munegowda   2011-03-01  191  	 * disables this feature and restores normal behavior.
19403165c272cc Keshava Munegowda   2011-03-01  192  	 */
19403165c272cc Keshava Munegowda   2011-03-01  193  	ehci_write(regs, EHCI_INSNREG04,
19403165c272cc Keshava Munegowda   2011-03-01  194  				EHCI_INSNREG04_DISABLE_UNSUSPEND);
19403165c272cc Keshava Munegowda   2011-03-01  195  
3aa2ae74ba630e Russ Dill           2012-05-04  196  	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
3aa2ae74ba630e Russ Dill           2012-05-04  197  	if (ret) {
3aa2ae74ba630e Russ Dill           2012-05-04  198  		dev_err(dev, "failed to add hcd with err %d\n", ret);
984e97483a143f Russ Dill           2012-06-21  199  		goto err_pm_runtime;
3aa2ae74ba630e Russ Dill           2012-05-04  200  	}
3c9740a117d40a Peter Chen          2013-11-05  201  	device_wakeup_enable(hcd->self.controller);
3aa2ae74ba630e Russ Dill           2012-05-04  202  
49f092198f4fd2 Roger Quadros       2013-03-13  203  	/*
4e5c9e6fa2d232 Roger Quadros       2013-06-14  204  	 * Bring PHYs out of reset for non PHY modes.
49f092198f4fd2 Roger Quadros       2013-03-13  205  	 * Even though HSIC mode is a PHY-less mode, the reset
49f092198f4fd2 Roger Quadros       2013-03-13  206  	 * line exists between the chips and can be modelled
49f092198f4fd2 Roger Quadros       2013-03-13  207  	 * as a PHY device for reset control.
49f092198f4fd2 Roger Quadros       2013-03-13  208  	 */
49f092198f4fd2 Roger Quadros       2013-03-13  209  	for (i = 0; i < omap->nports; i++) {
4e5c9e6fa2d232 Roger Quadros       2013-06-14  210  		if (!omap->phy[i] ||
4e5c9e6fa2d232 Roger Quadros       2013-06-14  211  		     pdata->port_mode[i] == OMAP_EHCI_PORT_MODE_PHY)
49f092198f4fd2 Roger Quadros       2013-03-13  212  			continue;
49f092198f4fd2 Roger Quadros       2013-03-13  213  
49f092198f4fd2 Roger Quadros       2013-03-13  214  		usb_phy_init(omap->phy[i]);
49f092198f4fd2 Roger Quadros       2013-03-13  215  		/* bring PHY out of suspend */
49f092198f4fd2 Roger Quadros       2013-03-13  216  		usb_phy_set_suspend(omap->phy[i], 0);
49f092198f4fd2 Roger Quadros       2013-03-13  217  	}
354ab8567ae310 Anand Gadiyar       2012-06-05  218  
54ab2b02ef6a45 Felipe Balbi        2009-10-14  219  	return 0;
54ab2b02ef6a45 Felipe Balbi        2009-10-14  220  
984e97483a143f Russ Dill           2012-06-21  221  err_pm_runtime:
6c984b066d84bb Keshava Munegowda   2011-10-11  222  	pm_runtime_put_sync(dev);
d6ff32478d7e95 Zhang Qilong        2020-11-23  223  	pm_runtime_disable(dev);
dcd64063fd917b Roger Quadros       2013-03-12  224  
dcd64063fd917b Roger Quadros       2013-03-12  225  err_phy:
dcd64063fd917b Roger Quadros       2013-03-12  226  	for (i = 0; i < omap->nports; i++) {
dcd64063fd917b Roger Quadros       2013-03-12  227  		if (omap->phy[i])
dcd64063fd917b Roger Quadros       2013-03-12  228  			usb_phy_shutdown(omap->phy[i]);
dcd64063fd917b Roger Quadros       2013-03-12  229  	}
dcd64063fd917b Roger Quadros       2013-03-12  230  
984e97483a143f Russ Dill           2012-06-21  231  	usb_put_hcd(hcd);
54ab2b02ef6a45 Felipe Balbi        2009-10-14  232  
54ab2b02ef6a45 Felipe Balbi        2009-10-14  233  	return ret;
54ab2b02ef6a45 Felipe Balbi        2009-10-14  234  }
54ab2b02ef6a45 Felipe Balbi        2009-10-14  235  

:::::: The code at line 135 was first introduced by commit
:::::: 22d9d8e8316d7f69046c8805ce9aa8d9c43d4e5b DMA-API: usb: use dma_set_coherent_mask()

:::::: TO: Russell King <rmk+kernel@arm.linux.org.uk>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
