Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D41C16B75C
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Sep 2024 09:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727430134; cv=none; b=tyVkofYwphUpVQSSY6zaq+hl96FFWqaYjwwLmBrNPSBgQGFUP/o+vgdHNVZmMriXfQ4Jz0aRgYzUKmHlyZjB1h5qV3m0ypgELWe7a7NU0gK8D7KKg7TGNlabIpR6hf84sSqsOkd/jro8NtFCi65OqxveLx9L6cYSiB7vCe84WWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727430134; c=relaxed/simple;
	bh=KUGVbyz5rwsx1n/rqtETPHSIYPalQug81ct58TxSl5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mmD0OJCN17vVsRGoeOI2G8wqlzOBkzQ/jy6IUjCxLZ5oSXVk3FaCuWCJz2ruAjaH8yYE90y6jglG09eDP8Mvz306hiXYJam1K89EsgK6CcOn9Ptag31oyLU224F4JREvV5COFy50JmnMjNXZsDe8lp17lF2u0+/NIZ2GvHqlfV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kLRQG49Z; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLRQG49Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727430132; x=1758966132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KUGVbyz5rwsx1n/rqtETPHSIYPalQug81ct58TxSl5E=;
  b=kLRQG49ZcSPdldiUMK1R9I2DALa0fjuDV5C74qWC/XSS3TB2QhXMEVbf
   5Z3UpFskYK/NAaQojGNpLkdGDmn9eNlEvRg7Xm5XP3xES77sM0JVu989U
   JrZaBdRJzumijePdjNWA8DhdSWE5b9H3UFY3VJbZpo37Y5RHPkLRLGGfG
   hJKgw8X/Z3wsr4unTjcEj7KGBT0Z66ThJzbzpIYGk1a8B87Evd+8aSwGB
   6F1IYJVCms3KTYyhMvbZfJt0+l2X66ddJqRYg8KvuQqcFa+UOZHP2H/Nn
   9pCYgZ9JpiWyhGsaAnZkg6rJfhsjbswwkEfS3yBSoEdhJJe8yMP52+BZ2
   w==;
X-CSE-ConnectionGUID: F3YyEkEoQiWrySyeuGNOQg==
X-CSE-MsgGUID: +etpSedGSyW/ejN4yW8Ghw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37927129"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="37927129"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 02:42:12 -0700
X-CSE-ConnectionGUID: y+mRyuwbQoqis6ansItzVw==
X-CSE-MsgGUID: sI9UoglVRma3lQzfQPvaNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="72658670"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Sep 2024 02:42:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su7UG-000Llr-0N;
	Fri, 27 Sep 2024 09:42:08 +0000
Date: Fri, 27 Sep 2024 17:41:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC PATCH] cleanup: make scoped_guard() to be return-friendly
Message-ID: <202409271754.FsBPrJQM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240926134347.19371-1-przemyslaw.kitszel@intel.com>
References: <20240926134347.19371-1-przemyslaw.kitszel@intel.com>
TO: Przemek Kitszel <przemyslaw.kitszel@intel.com>

Hi Przemek,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 151ac45348afc5b56baa584c7cd4876addf461ff]

url:    https://github.com/intel-lab-lkp/linux/commits/Przemek-Kitszel/cleanup-make-scoped_guard-to-be-return-friendly/20240926-214521
base:   151ac45348afc5b56baa584c7cd4876addf461ff
patch link:    https://lore.kernel.org/r/20240926134347.19371-1-przemyslaw.kitszel%40intel.com
patch subject: [RFC PATCH] cleanup: make scoped_guard() to be return-friendly
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: x86_64-randconfig-161-20240927 (https://download.01.org/0day-ci/archive/20240927/202409271754.FsBPrJQM-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409271754.FsBPrJQM-lkp@intel.com/

smatch warnings:
drivers/gpio/gpio-graniterapids.c:260 gnr_gpio_irq() warn: iterator 'i' not incremented

vim +/i +260 drivers/gpio/gpio-graniterapids.c

ecc4b1418e2399 Aapo Vienamo 2024-04-23  254  
ecc4b1418e2399 Aapo Vienamo 2024-04-23  255  static irqreturn_t gnr_gpio_irq(int irq, void *data)
ecc4b1418e2399 Aapo Vienamo 2024-04-23  256  {
ecc4b1418e2399 Aapo Vienamo 2024-04-23  257  	struct gnr_gpio *priv = data;
ecc4b1418e2399 Aapo Vienamo 2024-04-23  258  	unsigned int handled = 0;
ecc4b1418e2399 Aapo Vienamo 2024-04-23  259  
ecc4b1418e2399 Aapo Vienamo 2024-04-23 @260  	for (unsigned int i = 0; i < GNR_NUM_REGS; i++) {
ecc4b1418e2399 Aapo Vienamo 2024-04-23  261  		const void __iomem *reg = priv->reg_base + i * sizeof(u32);
ecc4b1418e2399 Aapo Vienamo 2024-04-23  262  		unsigned long pending;
ecc4b1418e2399 Aapo Vienamo 2024-04-23  263  		unsigned long enabled;
ecc4b1418e2399 Aapo Vienamo 2024-04-23  264  		unsigned int bit_idx;
ecc4b1418e2399 Aapo Vienamo 2024-04-23  265  
ecc4b1418e2399 Aapo Vienamo 2024-04-23  266  		scoped_guard(raw_spinlock, &priv->lock) {
ecc4b1418e2399 Aapo Vienamo 2024-04-23  267  			pending = readl(reg + GNR_GPI_STATUS_OFFSET);
ecc4b1418e2399 Aapo Vienamo 2024-04-23  268  			enabled = readl(reg + GNR_GPI_ENABLE_OFFSET);
ecc4b1418e2399 Aapo Vienamo 2024-04-23  269  		}
ecc4b1418e2399 Aapo Vienamo 2024-04-23  270  
ecc4b1418e2399 Aapo Vienamo 2024-04-23  271  		/* Only enabled interrupts */
ecc4b1418e2399 Aapo Vienamo 2024-04-23  272  		pending &= enabled;
ecc4b1418e2399 Aapo Vienamo 2024-04-23  273  
ecc4b1418e2399 Aapo Vienamo 2024-04-23  274  		for_each_set_bit(bit_idx, &pending, GNR_PINS_PER_REG) {
ecc4b1418e2399 Aapo Vienamo 2024-04-23  275  			unsigned int hwirq = i * GNR_PINS_PER_REG + bit_idx;
ecc4b1418e2399 Aapo Vienamo 2024-04-23  276  
ecc4b1418e2399 Aapo Vienamo 2024-04-23  277  			generic_handle_domain_irq(priv->gc.irq.domain, hwirq);
ecc4b1418e2399 Aapo Vienamo 2024-04-23  278  		}
ecc4b1418e2399 Aapo Vienamo 2024-04-23  279  
ecc4b1418e2399 Aapo Vienamo 2024-04-23  280  		handled += pending ? 1 : 0;
ecc4b1418e2399 Aapo Vienamo 2024-04-23  281  
ecc4b1418e2399 Aapo Vienamo 2024-04-23  282  	}
ecc4b1418e2399 Aapo Vienamo 2024-04-23  283  	return IRQ_RETVAL(handled);
ecc4b1418e2399 Aapo Vienamo 2024-04-23  284  }
ecc4b1418e2399 Aapo Vienamo 2024-04-23  285  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
