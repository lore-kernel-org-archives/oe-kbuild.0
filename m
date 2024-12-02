Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F9B2943F
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Dec 2024 01:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733102515; cv=none; b=eCzfYXUnYOGH9nZZ5z2fbNClKfdErngX0oTIgeYI6KXRPM01HOvG8Uvuoc97QC7UnkEuItGnBs8JgnS0ls78/41Td8kkDUcs2nhbNsOBeM30SI3Kk1nEs/qHzOqbZafVOYRkXkag8bcBNAHZY2lQ1uYcgQKUIOuRmJ4V1okMNEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733102515; c=relaxed/simple;
	bh=ulMGQXIZkKNoKrW9j/1oUEXMwYwAd0Cxb5eVyiUd7rc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AW+oY4FhnHKuf2+JFHFh63fg4YPufjYPyOky61b1VovpWgdDLKwPIOfM2CodeBbjax7yC/z7fXh5qesJVVpwkrnRRtJ3gMIBRdQnE5XTo5IVwrdRCA7UZLIKsIznk42XEl19BJuswYnC69dBkrBVzg8sdNd0/Drox74IziD6XrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CcwrhbCX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CcwrhbCX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733102513; x=1764638513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ulMGQXIZkKNoKrW9j/1oUEXMwYwAd0Cxb5eVyiUd7rc=;
  b=CcwrhbCXKTfIS24DjdFxX3iCOfqg/8GAI70YGJkiytCUY7PL0qQWpvs+
   U+9+T66ShunXo4X11X1QHgYkV19l0RUKQ0pIqYYcJg9BFfKf94K9NhSz0
   j8VGenhg4p8HAcFf9xA6c2RnTpmyV5L4kel7IAiZ8EPIMrIgUElVNNx+a
   b5On9FiznxbiDxUT8uxOuvxpiQcHdyVCHcueli3puiCmNyFHSc/BRhlNC
   kexq+oHZgUMur1MAdViig0D3MGj+oQ5E1nC0c2VGTXfLWuV7oZz+/yYvy
   irKM3pg6MvU6l/Ja8BYrxrchRkAk2IhNQG+RhY9J2sZGGlNh2xQtAH3fB
   Q==;
X-CSE-ConnectionGUID: UY986IN+QQ+TnHGZPN47Ng==
X-CSE-MsgGUID: 6GO0xxZKSLekPv0B6DIl3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="50670393"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="50670393"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 17:21:53 -0800
X-CSE-ConnectionGUID: IWlUr9qTTh+D6t74Mnad3A==
X-CSE-MsgGUID: p4Dy21VbSbGcyE3xc99WzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="93800806"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 01 Dec 2024 17:21:52 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHv7n-0001z6-3B;
	Mon, 02 Dec 2024 01:21:22 +0000
Date: Mon, 2 Dec 2024 09:18:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/pinctrl/pinctrl-amd.c:468:3-5: opportunity for
 str_enable_disable(on)
Message-ID: <202412020908.DxdITRnB-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   40384c840ea1944d7c5a392e8975ed088ecf0b37
commit: acd47b9f28e55b505aedb842131b40904e151d7c pinctrl: amd: Handle wake-up interrupt
date:   3 years, 3 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 years, 3 months ago
config: i386-randconfig-054-20241118 (https://download.01.org/0day-ci/archive/20241202/202412020908.DxdITRnB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412020908.DxdITRnB-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pinctrl/pinctrl-amd.c:468:3-5: opportunity for str_enable_disable(on)

vim +468 drivers/pinctrl/pinctrl-amd.c

dbad75dd1f25e0 Ken Xue           2015-03-10  440  
d62bd5ce12d79b Raul E Rangel     2021-04-29  441  static int amd_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
d62bd5ce12d79b Raul E Rangel     2021-04-29  442  {
d62bd5ce12d79b Raul E Rangel     2021-04-29  443  	u32 pin_reg;
d62bd5ce12d79b Raul E Rangel     2021-04-29  444  	unsigned long flags;
d62bd5ce12d79b Raul E Rangel     2021-04-29  445  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
d62bd5ce12d79b Raul E Rangel     2021-04-29  446  	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
c4b68e513953c3 Mario Limonciello 2021-08-09  447  	u32 wake_mask = BIT(WAKE_CNTRL_OFF_S0I3) | BIT(WAKE_CNTRL_OFF_S3);
acd47b9f28e55b Basavaraj Natikar 2021-08-31  448  	int err;
d62bd5ce12d79b Raul E Rangel     2021-04-29  449  
d62bd5ce12d79b Raul E Rangel     2021-04-29  450  	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
d62bd5ce12d79b Raul E Rangel     2021-04-29  451  	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
d62bd5ce12d79b Raul E Rangel     2021-04-29  452  
d62bd5ce12d79b Raul E Rangel     2021-04-29  453  	if (on)
d62bd5ce12d79b Raul E Rangel     2021-04-29  454  		pin_reg |= wake_mask;
d62bd5ce12d79b Raul E Rangel     2021-04-29  455  	else
d62bd5ce12d79b Raul E Rangel     2021-04-29  456  		pin_reg &= ~wake_mask;
d62bd5ce12d79b Raul E Rangel     2021-04-29  457  
d62bd5ce12d79b Raul E Rangel     2021-04-29  458  	writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
d62bd5ce12d79b Raul E Rangel     2021-04-29  459  	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
d62bd5ce12d79b Raul E Rangel     2021-04-29  460  
acd47b9f28e55b Basavaraj Natikar 2021-08-31  461  	if (on)
acd47b9f28e55b Basavaraj Natikar 2021-08-31  462  		err = enable_irq_wake(gpio_dev->irq);
acd47b9f28e55b Basavaraj Natikar 2021-08-31  463  	else
acd47b9f28e55b Basavaraj Natikar 2021-08-31  464  		err = disable_irq_wake(gpio_dev->irq);
acd47b9f28e55b Basavaraj Natikar 2021-08-31  465  
acd47b9f28e55b Basavaraj Natikar 2021-08-31  466  	if (err)
acd47b9f28e55b Basavaraj Natikar 2021-08-31  467  		dev_err(&gpio_dev->pdev->dev, "failed to %s wake-up interrupt\n",
acd47b9f28e55b Basavaraj Natikar 2021-08-31 @468  			on ? "enable" : "disable");
acd47b9f28e55b Basavaraj Natikar 2021-08-31  469  
d62bd5ce12d79b Raul E Rangel     2021-04-29  470  	return 0;
d62bd5ce12d79b Raul E Rangel     2021-04-29  471  }
d62bd5ce12d79b Raul E Rangel     2021-04-29  472  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
