Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8417C1917E6
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 17:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731001596; cv=none; b=QQFA2gsV7X/PfbIZE5KmT429oCRrRheFG70Hk2azBh15YfYFhO3oXVjCKQRu8zAj2OHdabD4qrTrVKM0BqzA+iKjxcTdR0NWfBXmyDW5gmGZlYVrCPjCX7OgrY64p9gmX+XG1CisgSBqjK4EesAnOSiEPs01HooJb1YDu6L82sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731001596; c=relaxed/simple;
	bh=0GJMzfSyMZClsl+nvFenntJG8WqlzwnfWq+BDJsH1ik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mvf+mF6/td4V3audYSW14MDrs9f6XebNtiELxJcp+Ym3bZZbL+aMhwiU/EzhW8TQIAe2Bz/jJpUaialB3zO8XXMP0y2yX0s6Nq3WyJHezk+SoFps3dWQGEqOeqDVo/11iuLmO05ewnEpzvHitW5OFkp66KlVYKi2o55a8/vFurY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O0kvLu8w; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0kvLu8w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731001595; x=1762537595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0GJMzfSyMZClsl+nvFenntJG8WqlzwnfWq+BDJsH1ik=;
  b=O0kvLu8wn27sazE5C3nod+mOCWPBkrN4lJWnhVyCkEMxysvtCD9HHKUN
   5okwsV1z/V4+GhEQy1uPqSdx9wgtPHTlJUxhpmUgi5/tUMen3XaTBYeeT
   PQELC9GQeoZsOoBoH3rBMc5YI691LHvQI+EZe/eukcNlSxSI8pOpuwBZT
   XGjBPp5UM7lmYyjP6Xj7nC8GDsm20E1EVcusry6W6jTWuJxJTXCPcIN31
   jvOzIRqEcso4MxBtrRiOpiN+BgrQT1y3BaFEbPUL2rUwHoFuzfANSci1T
   umfM908L2SooPZMCzogloMldPoOQ02C1WdTLm7HMMQJjBNnNMseumjmiE
   g==;
X-CSE-ConnectionGUID: OEXwu0g7T2uftjAVDDRPlg==
X-CSE-MsgGUID: rr/HdNx/Qu65S/+mdCKWaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="42235090"
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="42235090"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 09:46:32 -0800
X-CSE-ConnectionGUID: SIGpnsQjQwWjsYrfbmmyJA==
X-CSE-MsgGUID: jlq1Dk7zQ+2uT35X/+wGEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="85972533"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Nov 2024 09:46:29 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t96aP-000qYU-10;
	Thu, 07 Nov 2024 17:46:25 +0000
Date: Fri, 8 Nov 2024 01:46:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [conor:gpio-irq-regmap 17/18] drivers/gpio/gpio-mpfs.c:142
 mpfs_gpio_irq_set_type() error: uninitialized symbol 'interrupt_type'.
Message-ID: <202411080149.bOpayvf6-lkp@intel.com>
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
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git gpio-irq-regmap
head:   d1b7c5558fb6dded2dee2cfebe358de0d93f022e
commit: 3166771fc5c026351f261c9332a04a63401a747a [17/18] gpio: mpfs: Add interrupt support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-r073-20241107 (https://download.01.org/0day-ci/archive/20241108/202411080149.bOpayvf6-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411080149.bOpayvf6-lkp@intel.com/

smatch warnings:
drivers/gpio/gpio-mpfs.c:142 mpfs_gpio_irq_set_type() error: uninitialized symbol 'interrupt_type'.

vim +/interrupt_type +142 drivers/gpio/gpio-mpfs.c

af05583913c262 Lewis Hanly 2022-08-15  115  
3166771fc5c026 Lewis Hanly 2022-08-15  116  static int mpfs_gpio_irq_set_type(struct irq_data *data, unsigned int type)
3166771fc5c026 Lewis Hanly 2022-08-15  117  {
3166771fc5c026 Lewis Hanly 2022-08-15  118  	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
3166771fc5c026 Lewis Hanly 2022-08-15  119  	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
3166771fc5c026 Lewis Hanly 2022-08-15  120  	int gpio_index = irqd_to_hwirq(data) % 32;
3166771fc5c026 Lewis Hanly 2022-08-15  121  	u32 interrupt_type;
3166771fc5c026 Lewis Hanly 2022-08-15  122  
3166771fc5c026 Lewis Hanly 2022-08-15  123  	switch (type) {
3166771fc5c026 Lewis Hanly 2022-08-15  124  	case IRQ_TYPE_EDGE_BOTH:
3166771fc5c026 Lewis Hanly 2022-08-15  125  		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_BOTH;
3166771fc5c026 Lewis Hanly 2022-08-15  126  		break;
3166771fc5c026 Lewis Hanly 2022-08-15  127  	case IRQ_TYPE_EDGE_FALLING:
3166771fc5c026 Lewis Hanly 2022-08-15  128  		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_NEG;
3166771fc5c026 Lewis Hanly 2022-08-15  129  		break;
3166771fc5c026 Lewis Hanly 2022-08-15  130  	case IRQ_TYPE_EDGE_RISING:
3166771fc5c026 Lewis Hanly 2022-08-15  131  		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_POS;
3166771fc5c026 Lewis Hanly 2022-08-15  132  		break;
3166771fc5c026 Lewis Hanly 2022-08-15  133  	case IRQ_TYPE_LEVEL_HIGH:
3166771fc5c026 Lewis Hanly 2022-08-15  134  		interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_HIGH;
3166771fc5c026 Lewis Hanly 2022-08-15  135  		break;
3166771fc5c026 Lewis Hanly 2022-08-15  136  	case IRQ_TYPE_LEVEL_LOW:
3166771fc5c026 Lewis Hanly 2022-08-15  137  		interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_LOW;
3166771fc5c026 Lewis Hanly 2022-08-15  138  		break;
3166771fc5c026 Lewis Hanly 2022-08-15  139  	}
3166771fc5c026 Lewis Hanly 2022-08-15  140  
3166771fc5c026 Lewis Hanly 2022-08-15  141  	regmap_update_bits(mpfs_gpio->regs, MPFS_GPIO_CTRL(gpio_index),
3166771fc5c026 Lewis Hanly 2022-08-15 @142  			   MPFS_GPIO_TYPE_INT_MASK, interrupt_type);
3166771fc5c026 Lewis Hanly 2022-08-15  143  
3166771fc5c026 Lewis Hanly 2022-08-15  144  	return 0;
3166771fc5c026 Lewis Hanly 2022-08-15  145  }
3166771fc5c026 Lewis Hanly 2022-08-15  146  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
