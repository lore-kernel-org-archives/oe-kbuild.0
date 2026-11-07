Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794037642;
	b=NlzmTg/A6jUP09EydHi5qbfFisW9VGbP/0d1emo//66SCLgIZHrOfkHdFQ2IwyfmPIsm
	 IZa+Anwgqtsfb1B9YzTc1dA+KmFZkzmDLdpdqGqX2ibOAofzu6vyHA79jQTYawBtk8YGj
	 AkJatAWs7joQqLOjwBUjM3PywsmJSBvWPodge2jvhJmq2a64AZGsBJZHSavIVIEbd4lvp
	 0MTVb+k8GjK+r0Ss/iAUlnvSQb9sMYv4lGPQ9QWMDpjVBoFHuEx9TaXl9FH9qkH8LTM/B
	 g6yhuo8mMQZitiUr2LTxi3P7h3oJ2Aa9PrlVUBHqGv2MQ4hKKWamKEe6MnFB3bF6BRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794037642;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=fRVL8L5jKt6CZqCL54FYeiI2YmdYYXkh0tTblg7gfjU=;
	b=40cZyoDV3WUXuvRpV8z26sLpnRBT8CqdxzFosVIVHuDLyfB5nlJkAyQmRsJ4BDJD49yy
	 EQBVZfKRss818LXJcs7TdU5mYj75LmP0fQ4H1FsaRC+7yUJDjd2KA1r4vZNo4YO1I23mX
	 GaUoKAsAax762IKk8vilPcFTQBVwIgdhzZnR5cewlJKO39Ezu8lYI87CHOarVpokDow8g
	 35xBUaGgczh88o9o7+wK16EEDYl3KHWskasmhUtDsI0x50c92S06E0sII2FVoePS+IaLX
	 +cdcqK63Mc6enJcPrCFvlBuFgfMjoasUx44hcuI4q756yf1Sknl0UbK2RiYpIE1oTwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bemB6bi3;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BA8606A326
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Nov 2026 07:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7BA8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bemB6bi3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794037640; x=1825573640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fjDtknHx9+V5OkTj1rsxbugJAsEORZ5vp6dBFQmbIFs=;
  b=bemB6bi3Da0LBiudCsa/8ufArXZowk0ao9GD+T2bIh2/0Zteoibm5j35
   JDNVhq7Th2sySYky6mJ8WauOqEAcIAf/+b4EVEPq9DYGmWGo/7pK97Cr5
   71gxFhfqrkZb2mS3xQiNFkkp5S+EsNb4oTy4jmfAl58vXWKsOIAJ4w9bZ
   4wHu9a92dgIM2uBk7jtSRV9w/Dz7BMkT2w8Wsa7fbBKTxluugyofD2aia
   zhCj6vdmawezQzBZnMyWhD7cYh0Bdj12L0rxJEHPA0w9ThuyuYpmgEd2R
   AjLo4SvhIQ18eDj7ZVNawDrPnYg942XnGf03gp8SxTPmuJ+GE8qw2Kxu9
   A==;
X-CSE-ConnectionGUID: 7J2g4TtqTlqFkz8hZ02x2w==
X-CSE-MsgGUID: czvhKXMiTSG45U6Jj6W7BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2747179"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2747179"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 23:47:19 -0800
X-CSE-ConnectionGUID: XZIy/IQpQbWcc2Vugo99jQ==
X-CSE-MsgGUID: Fuw5frHhQ8CP3YnmKN37cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7350450"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Nov 2026 23:47:18 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPb8t-00000000qbj-3SYi;
	Sat, 07 Nov 2026 07:47:15 +0000
Date: Sat, 7 Nov 2026 15:46:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3] gpio: amdptpci: add support for AMD PT PCI controller
Message-ID: <202611071540.qXLgb0SQ-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261028084531.6237-1-Chloe_Chen@asmedia.com.tw>
References: <20261028084531.6237-1-Chloe_Chen@asmedia.com.tw>
TO: Szuying Chen <Chloe_Chen@asmedia.com.tw>
TO: linusw@kernel.org
TO: Markus.Elfring@web.de
TO: brgl@kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-gpio@vger.kernel.org
CC: Yd_Tseng@asmedia.com.tw
CC: Jesse1_Chang@asmedia.com.tw
CC: Richard_Hsu@asmedia.com.tw
CC: Chloe_Chen@asmedia.com.tw

Hi Szuying,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v7.4-rc1 next-20261105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Szuying-Chen/gpio-amdptpci-add-support-for-AMD-PT-PCI-controller/20261028-164531
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20261028084531.6237-1-Chloe_Chen%40asmedia.com.tw
patch subject: [PATCH v3] gpio: amdptpci: add support for AMD PT PCI controller
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20261107/202611071540.qXLgb0SQ-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611071540.qXLgb0SQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611071540.qXLgb0SQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-amdptpci.c:75:1: error: field has incomplete type 'struct gpio_generic_chipgen'
      75 | struct gpio_generic_chipgen;
         | ^
   drivers/gpio/gpio-amdptpci.c:75:8: note: forward declaration of 'struct gpio_generic_chipgen'
      75 | struct gpio_generic_chipgen;
         |        ^
>> drivers/gpio/gpio-amdptpci.c:369:39: error: no member named 'gen' in 'struct pt27_gpio'
     369 |                 if (generic_handle_domain_irq(chip->gen.gc.irq.domain, hwirq)) {
         |                                               ~~~~  ^
   drivers/gpio/gpio-amdptpci.c:454:38: error: no member named 'gen' in 'struct pt27_gpio'
     454 |         ret = gpio_generic_chip_init(&chip->gen, &config);
         |                                       ~~~~  ^
   drivers/gpio/gpio-amdptpci.c:458:14: error: no member named 'gen' in 'struct pt27_gpio'
     458 |         gc = &chip->gen.gc;
         |               ~~~~  ^
>> drivers/gpio/gpio-amdptpci.c:561:3: error: 'break' statement not in loop or switch statement
     561 |                 break;
         |                 ^
   5 errors generated.


vim +75 drivers/gpio/gpio-amdptpci.c

8acd4003a26b94 Szuying Chen 2026-10-28  72  
8acd4003a26b94 Szuying Chen 2026-10-28  73  struct pt27_gpio {
8acd4003a26b94 Szuying Chen 2026-10-28  74  struct device                     *dev;
8acd4003a26b94 Szuying Chen 2026-10-28 @75  struct gpio_generic_chipgen;
8acd4003a26b94 Szuying Chen 2026-10-28  76  	void __iomem              *base;
8acd4003a26b94 Szuying Chen 2026-10-28  77  	struct pt27_saved_regs	  saved;
8acd4003a26b94 Szuying Chen 2026-10-28  78  	raw_spinlock_t            lock;
8acd4003a26b94 Szuying Chen 2026-10-28  79  	u16                       wake_mask;
8acd4003a26b94 Szuying Chen 2026-10-28  80  	bool                      use_msi;
8acd4003a26b94 Szuying Chen 2026-10-28  81  	int                       irq;
8acd4003a26b94 Szuying Chen 2026-10-28  82  };
8acd4003a26b94 Szuying Chen 2026-10-28  83  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
