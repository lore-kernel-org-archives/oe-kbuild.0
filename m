Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2365476B
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 17:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727286639; cv=none; b=iE+Hig6VTpHhbUprs+7NTVXW+yNjti0fITzRREeFsG66TTaZp8b1GhIGxAVF8db2t9gISbr56xLSIzF5BwyLbD2xUfJkBmE6pO+CeIhfPleYcBB7YVSOdUp9xJExM1canQYQIljm7GGllyKyc8VPjjm8LspJEYv0420ZHsJ0MOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727286639; c=relaxed/simple;
	bh=aU9OIpnzkThWVeC1lTM1+9CPGqlvBU7OilfOeWVxrIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iLXF5FdRe26ydPE++aDwSBgxx0mz4ThgjH+0SeMx6SF4ToO7klyHV9WZPsHaT/RzKq3zu3F/zkpllU0JHiabLrHrwTGt0grEza/DVfnFz785J0eA8uHxewqZKthxqqmIanlNZqHU1GwYqxjHHtenwaL438Z1WNLza8PiCOzR6R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PYQMsq+S; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PYQMsq+S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727286637; x=1758822637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aU9OIpnzkThWVeC1lTM1+9CPGqlvBU7OilfOeWVxrIw=;
  b=PYQMsq+SRNN4E/6ucHUXoldBh5ypPCxlam0M9iGl82MxICbm41SVcKv6
   OmpqMQJoMGFTMBr7rcFeLozl426918uaCFBbuPN5LZPNpQYdQ3RAzThDY
   ImzXiOfvWa04dPRCC7wU/o8ruhwaKh8AMLT9zHXQ2ObgpiRAi9giyTWv2
   AC2/AmHQy7CsPHbsUqdctTluwJzoItMCBdxX3WisoQxr92gpp9OZEfufI
   8Gk5bVyM4rEq8GhvRLE3WE3d5TeLxVW0q9UxNFlvPnUd4cg8RwH5AcnxZ
   z67y9w5Ubw+QPBMnkkhU3kV6U2Pwn5wsXNrDffHdN3T3wuwOegPKT1cwW
   A==;
X-CSE-ConnectionGUID: wtYE+5oBRAyKQn7MCg9K/A==
X-CSE-MsgGUID: ywtHXK00S2euR1ulRLg0jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="51767546"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="51767546"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 10:50:34 -0700
X-CSE-ConnectionGUID: cnWK/f6NS2GrfQpcNVKJPw==
X-CSE-MsgGUID: +rKSNNeOTm+/e9ghFSeAQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="72316348"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Sep 2024 10:50:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stW9m-000JqL-1Y;
	Wed, 25 Sep 2024 17:50:30 +0000
Date: Thu, 26 Sep 2024 01:50:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [conor:gpio-irq-6.11 16/18] drivers/gpio/gpio-mpfs.c:159
 mpfs_gpio_irq_set_type() error: uninitialized symbol 'interrupt_type'.
Message-ID: <202409260127.hHMbY486-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git gpio-irq-6.11
head:   31951b1171ad7d194111ba003cee94c32228879c
commit: 982fc967d3c732e3c9e1134669bfc4bf0040a927 [16/18] gpio: mpfs: add polarfire soc gpio support
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: openrisc-randconfig-r073-20240925 (https://download.01.org/0day-ci/archive/20240926/202409260127.hHMbY486-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409260127.hHMbY486-lkp@intel.com/

smatch warnings:
drivers/gpio/gpio-mpfs.c:159 mpfs_gpio_irq_set_type() error: uninitialized symbol 'interrupt_type'.

vim +/interrupt_type +159 drivers/gpio/gpio-mpfs.c

982fc967d3c732e Lewis Hanly 2022-08-15  127  
982fc967d3c732e Lewis Hanly 2022-08-15  128  static int mpfs_gpio_irq_set_type(struct irq_data *data, unsigned int type)
982fc967d3c732e Lewis Hanly 2022-08-15  129  {
982fc967d3c732e Lewis Hanly 2022-08-15  130  	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
982fc967d3c732e Lewis Hanly 2022-08-15  131  	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
982fc967d3c732e Lewis Hanly 2022-08-15  132  	int gpio_index = irqd_to_hwirq(data);
982fc967d3c732e Lewis Hanly 2022-08-15  133  	u32 interrupt_type;
982fc967d3c732e Lewis Hanly 2022-08-15  134  	u32 gpio_cfg;
982fc967d3c732e Lewis Hanly 2022-08-15  135  	unsigned long flags;
982fc967d3c732e Lewis Hanly 2022-08-15  136  
982fc967d3c732e Lewis Hanly 2022-08-15  137  	switch (type) {
982fc967d3c732e Lewis Hanly 2022-08-15  138  	case IRQ_TYPE_EDGE_BOTH:
982fc967d3c732e Lewis Hanly 2022-08-15  139  		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_BOTH;
982fc967d3c732e Lewis Hanly 2022-08-15  140  		break;
982fc967d3c732e Lewis Hanly 2022-08-15  141  	case IRQ_TYPE_EDGE_FALLING:
982fc967d3c732e Lewis Hanly 2022-08-15  142  		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_NEG;
982fc967d3c732e Lewis Hanly 2022-08-15  143  		break;
982fc967d3c732e Lewis Hanly 2022-08-15  144  	case IRQ_TYPE_EDGE_RISING:
982fc967d3c732e Lewis Hanly 2022-08-15  145  		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_POS;
982fc967d3c732e Lewis Hanly 2022-08-15  146  		break;
982fc967d3c732e Lewis Hanly 2022-08-15  147  	case IRQ_TYPE_LEVEL_HIGH:
982fc967d3c732e Lewis Hanly 2022-08-15  148  		interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_HIGH;
982fc967d3c732e Lewis Hanly 2022-08-15  149  		break;
982fc967d3c732e Lewis Hanly 2022-08-15  150  	case IRQ_TYPE_LEVEL_LOW:
982fc967d3c732e Lewis Hanly 2022-08-15  151  		interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_LOW;
982fc967d3c732e Lewis Hanly 2022-08-15  152  		break;
982fc967d3c732e Lewis Hanly 2022-08-15  153  	}
982fc967d3c732e Lewis Hanly 2022-08-15  154  
982fc967d3c732e Lewis Hanly 2022-08-15  155  	raw_spin_lock_irqsave(&mpfs_gpio->lock, flags);
982fc967d3c732e Lewis Hanly 2022-08-15  156  
982fc967d3c732e Lewis Hanly 2022-08-15  157  	gpio_cfg = readl(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index));
982fc967d3c732e Lewis Hanly 2022-08-15  158  	gpio_cfg &= ~MPFS_GPIO_TYPE_INT_MASK;
982fc967d3c732e Lewis Hanly 2022-08-15 @159  	gpio_cfg |= interrupt_type;
982fc967d3c732e Lewis Hanly 2022-08-15  160  	writel(gpio_cfg, mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index));
982fc967d3c732e Lewis Hanly 2022-08-15  161  
982fc967d3c732e Lewis Hanly 2022-08-15  162  	raw_spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
982fc967d3c732e Lewis Hanly 2022-08-15  163  
982fc967d3c732e Lewis Hanly 2022-08-15  164  	return 0;
982fc967d3c732e Lewis Hanly 2022-08-15  165  }
982fc967d3c732e Lewis Hanly 2022-08-15  166  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
