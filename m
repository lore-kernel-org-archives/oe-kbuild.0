Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671956;
	b=HOaKimKfPipq+axNZOqQNK7UxfBWCtFpCbp7hv9HKrAdM5saIWr6pNZZUbdQjN7KH2U3
	 AQ1kgXzStnNkyOvySZEiuiQcuo2A2Joibmt0BA9YDNuMLasGPX5YaoWO1b6+5QK5trCxV
	 b+T3gq9UdHHd4CgDT8vt5NYEY5fDSDv4P80oDJzVGJngOfWChXH0aJwo9ioOAx+IaomWM
	 JVbpwR/YuvKLqmc8uZ1JqLaxocHYPTYCB1ymVnkuYDckbpeMAR5wvH7+0UJ8KczUBjpah
	 d7MqXA8KO2JsnisDDpNXCEP1z7UF7on1jGyfixl2tcZnc4YrnltVzbYyOfp5g2NH/4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671956;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=OGmEsYRm0M9WcPIrYBL3N4DoY3CLbLokQf0XPjqiv1U=;
	b=nM8Zzr2qtjwLAe7K9wdWO0Nxm0dqkiDRCWfzEyojR9qopfrqtlQiF8wjDMJZ6mwGe9N3
	 zurrzIIOMY7eZa4mVrQX5qFZg0TL99DtbH7ca7voXzRUko2uJtH5SJkTJD+cyEPfgvGqr
	 IcA4wgGS3BegKr+4NAw46n0l43eOdE10xULd7P0BZI6WhhbNyBSVv9Tc4+zgeeNGRRb/z
	 g2tpk8ZDR2SwHoXXpNxD1IckK4B8wEOIRvESp0+n9kH8W9kOyamUMXxUWpJIJ4bioOCpu
	 k0LacacQC/aTj6lYgYCPkQpBKCrdGZHC6pqkwEg1nk3mXOjsrS1j35Iu5dgtonH9vGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cBrPFYyq;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4E6606A31C
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 05:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E4E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cBrPFYyq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795671955; x=1827207955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/nx63tBc0h0a5n0+0zw2U5cs/x12DWvL1Pa+00XY4/k=;
  b=cBrPFYyqaEPRV1EukA9Lr+0GT9nk2AfFGEM7Olrs17RkR7Y2m992su2D
   xqfi/GfrQoIMVzgkB4A+i1RJfJFFMbclR86QGlHvJjvV9Sx6MX2RVYINQ
   RBhwRbYEA0chw7FGB1jxKjxsn35UdE8IkXoDSbXBRNa0o7Yee/05ZlB9N
   s7FzqJ/La8dVA1kqsT3f3Uz8AbUIfTWfhCLs49JstuJZbfwEL9omd16Au
   X+1M2nD3/tQGzqucE+OoVOPm/3+1xFuoSOekbjuKI9qUb8/ozi0/uvwdP
   d2gdWJaSWo8ItmXzm4GoNMHPdIbd2PLTpWsUUktQnjR6JNS7Q+i9tsYhV
   g==;
X-CSE-ConnectionGUID: oGofyRSFToSeKvHOWOigBg==
X-CSE-MsgGUID: 9aw9Pxo1TRC7rg91U2PqyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4568539"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4568539"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 21:45:55 -0800
X-CSE-ConnectionGUID: 2H8ix5XSR+CtPbb0W7hiVA==
X-CSE-MsgGUID: UMsqQZyvTIqgij0lsAhgxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12237679"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Nov 2026 21:45:54 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWSIp-00000001TNW-36IQ;
	Thu, 26 Nov 2026 05:45:51 +0000
Date: Thu, 26 Nov 2026 13:45:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4] gpio: amdptpci: add support for AMD PT PCI controller
Message-ID: <20261126133330.QuRKwyeZ-lkp@intel.com>
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
In-Reply-To: <20261116075510.5722-1-Chloe_Chen@asmedia.com.tw>
References: <20261116075510.5722-1-Chloe_Chen@asmedia.com.tw>
TO: Szuying Chen <Chloe_Chen@asmedia.com.tw>
TO: linusw@kernel.org
TO: Markus.Elfring@web.de
TO: linux-gpio@vger.kernel.org
TO: brgl@kernel.org
TO: linux-kernel@vger.kernel.org
CC: Yd_Tseng@asmedia.com.tw
CC: Jesse1_Chang@asmedia.com.tw
CC: Richard_Hsu@asmedia.com.tw
CC: Szuying Chen <Chloe_Chen@asmedia.com.tw>

Hi Szuying,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v7.4-rc4 next-20261125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Szuying-Chen/gpio-amdptpci-add-support-for-AMD-PT-PCI-controller/20261116-155510
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20261116075510.5722-1-Chloe_Chen%40asmedia.com.tw
patch subject: [PATCH v4] gpio: amdptpci: add support for AMD PT PCI controller
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20261126/20261126133330.QuRKwyeZ-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126133330.QuRKwyeZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261126133330.QuRKwyeZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-amdptpci.c:540:3: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
     540 |                 iowrite16(PT27_WAKE_MASK, chip->base + PT27_REG_WAKE_STAT);
         |                 ^
   drivers/gpio/gpio-amdptpci.c:537:2: note: previous statement is here
     537 |         if (!device_may_wakeup(dev))
         |         ^
   1 warning generated.


vim +/if +540 drivers/gpio/gpio-amdptpci.c

bba230f88fa2c88 Szuying Chen 2026-11-16  521  
bba230f88fa2c88 Szuying Chen 2026-11-16  522  static int __maybe_unused pt27_gpio_suspend(struct device *dev)
bba230f88fa2c88 Szuying Chen 2026-11-16  523  {
bba230f88fa2c88 Szuying Chen 2026-11-16  524  	struct pt27_gpio *chip = dev_get_drvdata(dev);
bba230f88fa2c88 Szuying Chen 2026-11-16  525  
bba230f88fa2c88 Szuying Chen 2026-11-16  526  	if (pm_runtime_status_suspended(dev)) {
bba230f88fa2c88 Szuying Chen 2026-11-16  527  		dev_dbg(dev, "%s: already runtime-suspended, skipping save\n", __func__);
bba230f88fa2c88 Szuying Chen 2026-11-16  528  		return 0;
bba230f88fa2c88 Szuying Chen 2026-11-16  529  	}
bba230f88fa2c88 Szuying Chen 2026-11-16  530  
bba230f88fa2c88 Szuying Chen 2026-11-16  531  	scoped_guard(raw_spinlock_irqsave, &chip->gen.lock) {
bba230f88fa2c88 Szuying Chen 2026-11-16  532  		pt27_save_regs(chip);
bba230f88fa2c88 Szuying Chen 2026-11-16  533  		iowrite32(0, chip->base + PT27_REG_INT_EN);
bba230f88fa2c88 Szuying Chen 2026-11-16  534  		iowrite32(PT27_GPIO_MASK, chip->base + PT27_REG_INT_MASK);
bba230f88fa2c88 Szuying Chen 2026-11-16  535  		iowrite32(PT27_GPIO_MASK, chip->base + PT27_REG_INT_STAT);
bba230f88fa2c88 Szuying Chen 2026-11-16  536  
bba230f88fa2c88 Szuying Chen 2026-11-16  537  	if (!device_may_wakeup(dev))
bba230f88fa2c88 Szuying Chen 2026-11-16  538  		iowrite16(0, chip->base + PT27_REG_WAKE_EN);
bba230f88fa2c88 Szuying Chen 2026-11-16  539  
bba230f88fa2c88 Szuying Chen 2026-11-16 @540  		iowrite16(PT27_WAKE_MASK, chip->base + PT27_REG_WAKE_STAT);
bba230f88fa2c88 Szuying Chen 2026-11-16  541  	}
bba230f88fa2c88 Szuying Chen 2026-11-16  542  
bba230f88fa2c88 Szuying Chen 2026-11-16  543  	synchronize_irq(chip->irq);
bba230f88fa2c88 Szuying Chen 2026-11-16  544  	return 0;
bba230f88fa2c88 Szuying Chen 2026-11-16  545  }
bba230f88fa2c88 Szuying Chen 2026-11-16  546  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
