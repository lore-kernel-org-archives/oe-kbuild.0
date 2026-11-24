Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529567;
	b=cyqS8b9pWnuJtRfTitcyXM3d9YA5kGNRuS8Wi/dHoou1zo+wRSON2ELAEyzqMgVoB2ym
	 4ofw3D21qMloGlWgldVfriBBevMKlW89Eym0lstfpWHXBPdrnbW630EMs8L9FJpZuqLAA
	 9ucI10loS7PCwaP1lFIfSdc824RCEkBgvzhDGxQFj87hXuEAZYn8QmKIkILto3Ijv54A5
	 hkn+S2zJbMx0KhLln8+j49/dix43NlbrrSgF6HWjRUcMGPIvcrsk+CtT46MCgLJw+L6N0
	 EX3MpPASQPE89Pa/YrJozofuXFhw75V3D6kZgSFbJu+9g/bNlz9yZ7EnupseC6OuIlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529567;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=0yChGyAIDpWgaIXVeLFY7xhpVWBAICkCrZEJvdIlRqg=;
	b=3dlf/hRDNpbguuMHw8j8yi2s3znjOPSQ7DtE3DjL1bLshr+avw6b09nptUnojrqyIMQ7
	 Xqchs56fkTYN1QSY7IV3XTtBlIPM8xLfZtdh4v/I6AcqBMOBllwGVMRgb9VZRsaVzXL0r
	 lmMT8biKUN5ovsmjvEWJVCZv6UQ+Jk8CTyL1xpp3gZHi2vblGp9nGoXngkLsME6iZtcrK
	 Gtr7wyOZ2hzt6gXWv3KNMQoK1bpoD+mTkIGQvudy3f39ilrlHOtdIOToPoQSKdvKeRvJV
	 gvkrFVjccDHmWa4ZaQGQuUpaUbSvZm0egaKkNb44BpaUiIYmz3lDr6TYrzHBjh9WYCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kXJSNcVd;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2C5606A33B
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Nov 2026 14:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A2C5606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kXJSNcVd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795529566; x=1827065566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jZrU4yaq4LP7V7uh6rev3EVVPmpxmeh2NNE0632cFms=;
  b=kXJSNcVd9og2LYctBxtVzT3sAP2SG06sUuuj8lUc02wtdHhAKUlVw8Ln
   TqK1GVBzwLMmRpQ9Y+IPlPaAJ9aVUJe1z5mjeXs2Tj6i9ZgmzOp+MYwSi
   VfSXaEbZeaJYGmVGbLGXq3NSdx/nk9EvbPO/08QxwRlxfvADxKsPQDQGQ
   YbmHZqasHPFVp2xAFlwOHFz8wCpxEtgHmNn2hHcbUtH32EzSjaOrWaxyj
   g4UbLJ5+hLT66xvLMQEBsLqzu9C9rLORockVqle0cpCxIHn5q1VCN6Phe
   VXpoT6TD86/c3xoluYXRPjsrq6g9Pbfa9zXxQFTC9bgsg2F6QvFYgVUTZ
   w==;
X-CSE-ConnectionGUID: yb1Bsd3MTk6y8/wirxRMJw==
X-CSE-MsgGUID: dvuU8ZDETo2mAN0fHzZr6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4217552"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4217552"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 06:12:45 -0800
X-CSE-ConnectionGUID: b7opEKW3Qk28qO6x/dU+BQ==
X-CSE-MsgGUID: YP/kf7FyRg6j+pU3V/xmyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="12162395"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Nov 2026 06:12:44 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVrGD-00000001PSU-38wx;
	Tue, 24 Nov 2026 14:12:41 +0000
Date: Tue, 24 Nov 2026 22:12:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4] gpio: amdptpci: add support for AMD PT PCI controller
Message-ID: <20261124220243.DfEpXhMD-lkp@intel.com>
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
[also build test WARNING on linus/master v7.4-rc4 next-20261123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Szuying-Chen/gpio-amdptpci-add-support-for-AMD-PT-PCI-controller/20261116-155510
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20261116075510.5722-1-Chloe_Chen%40asmedia.com.tw
patch subject: [PATCH v4] gpio: amdptpci: add support for AMD PT PCI controller
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20261124/20261124220243.DfEpXhMD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261124/20261124220243.DfEpXhMD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261124220243.DfEpXhMD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-amdptpci.c: In function 'pt27_gpio_suspend':
>> drivers/gpio/gpio-amdptpci.c:537:9: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
     537 |         if (!device_may_wakeup(dev))
         |         ^~
   drivers/gpio/gpio-amdptpci.c:540:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
     540 |                 iowrite16(PT27_WAKE_MASK, chip->base + PT27_REG_WAKE_STAT);
         |                 ^~~~~~~~~


vim +/if +537 drivers/gpio/gpio-amdptpci.c

bba230f88fa2c8 Szuying Chen 2026-11-16  521  
bba230f88fa2c8 Szuying Chen 2026-11-16  522  static int __maybe_unused pt27_gpio_suspend(struct device *dev)
bba230f88fa2c8 Szuying Chen 2026-11-16  523  {
bba230f88fa2c8 Szuying Chen 2026-11-16  524  	struct pt27_gpio *chip = dev_get_drvdata(dev);
bba230f88fa2c8 Szuying Chen 2026-11-16  525  
bba230f88fa2c8 Szuying Chen 2026-11-16  526  	if (pm_runtime_status_suspended(dev)) {
bba230f88fa2c8 Szuying Chen 2026-11-16  527  		dev_dbg(dev, "%s: already runtime-suspended, skipping save\n", __func__);
bba230f88fa2c8 Szuying Chen 2026-11-16  528  		return 0;
bba230f88fa2c8 Szuying Chen 2026-11-16  529  	}
bba230f88fa2c8 Szuying Chen 2026-11-16  530  
bba230f88fa2c8 Szuying Chen 2026-11-16  531  	scoped_guard(raw_spinlock_irqsave, &chip->gen.lock) {
bba230f88fa2c8 Szuying Chen 2026-11-16  532  		pt27_save_regs(chip);
bba230f88fa2c8 Szuying Chen 2026-11-16  533  		iowrite32(0, chip->base + PT27_REG_INT_EN);
bba230f88fa2c8 Szuying Chen 2026-11-16  534  		iowrite32(PT27_GPIO_MASK, chip->base + PT27_REG_INT_MASK);
bba230f88fa2c8 Szuying Chen 2026-11-16  535  		iowrite32(PT27_GPIO_MASK, chip->base + PT27_REG_INT_STAT);
bba230f88fa2c8 Szuying Chen 2026-11-16  536  
bba230f88fa2c8 Szuying Chen 2026-11-16 @537  	if (!device_may_wakeup(dev))
bba230f88fa2c8 Szuying Chen 2026-11-16  538  		iowrite16(0, chip->base + PT27_REG_WAKE_EN);
bba230f88fa2c8 Szuying Chen 2026-11-16  539  
bba230f88fa2c8 Szuying Chen 2026-11-16  540  		iowrite16(PT27_WAKE_MASK, chip->base + PT27_REG_WAKE_STAT);
bba230f88fa2c8 Szuying Chen 2026-11-16  541  	}
bba230f88fa2c8 Szuying Chen 2026-11-16  542  
bba230f88fa2c8 Szuying Chen 2026-11-16  543  	synchronize_irq(chip->irq);
bba230f88fa2c8 Szuying Chen 2026-11-16  544  	return 0;
bba230f88fa2c8 Szuying Chen 2026-11-16  545  }
bba230f88fa2c8 Szuying Chen 2026-11-16  546  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
