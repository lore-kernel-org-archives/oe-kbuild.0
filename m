Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BDD22F08
	for <oe-kbuild@lists.linux.dev>; Mon, 13 May 2024 03:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715571783; cv=none; b=UPLDeqXLCoJb4inU/UtoXM6lzU1KPXbCL6N78c1+8RhJrh5888luv+/JhE8CFHIKrbS0AHrzv7afVzxOL7j9F9qZbn2EG+BLUpSfeXZe1hjxZk3hh7e1M0qUqLtYuYuAcraQxLFKqQ0wXMwgvkufI7ceATb87uIwUa/wyQuJ7DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715571783; c=relaxed/simple;
	bh=kz7OJuEnzouXf0TD0pZeBEOtgArMIusFAo79qksidAs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lw+sj/cOub6HSEzQy3k1BGXHh+ejnnpMthxlcIceWr0FBA08MGvujfmoTdBOzANbtt3DAPyMf3hAV78PsfjyTtqQ/jU9Bv+/7GoPGuIwnB+mB5wPkCxhvxiGiQaWz1ZQTYlL62/szZEC8qpPPAIc65I4NRMr01qQ4zy5/vv9R/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CK59Extd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CK59Extd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715571779; x=1747107779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kz7OJuEnzouXf0TD0pZeBEOtgArMIusFAo79qksidAs=;
  b=CK59Extdl4XpGe2Jgg7Epe4uSphWWDUsEIcO70P2OiNKzdc9n0mUH9+d
   g931kKMkttZBVebNw3lipc65RbkRWkfII/00vykCj9/6R5D5tHv/ZYvNL
   mb2ygT9tquTnFUftiYxoA1b5pfYp7s5LqRsZqqY4Ty+6xr3lNQCgHQkDV
   G/lZuus3vigWZLD/MCSP5wDTiikYa1AKH80XXLoSgHH62lDQ8IEDGnx78
   BFzsiKJ2ypxBq+4tIgAkSMQngmSZ2QHCayIv3mnm0ynE4AVP5Y8If/Rwf
   Y6ZTUFPbEa3ew4R81wqAH+LndhstBqHqGG0oNThuFh/cy3tBhzpfV4LyJ
   g==;
X-CSE-ConnectionGUID: 1quqiDaDSnaJDr6zG/bk7Q==
X-CSE-MsgGUID: GfWJqDpFQeaLD5GAhK+4SQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22159086"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="22159086"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 20:42:58 -0700
X-CSE-ConnectionGUID: TlY+XCXfQT6Fs0s1Ftqu1Q==
X-CSE-MsgGUID: rTSfsZ+1Q6KyEDE/eYPMuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="34891162"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 May 2024 20:42:57 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6MaV-0009UB-0e;
	Mon, 13 May 2024 03:42:55 +0000
Date: Mon, 13 May 2024 11:42:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 6/8] irqchip/stm32mp-exti: allow build as module
Message-ID: <202405131105.ulLfHBZJ-lkp@intel.com>
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
In-Reply-To: <20240507131051.980313-7-antonio.borneo@foss.st.com>
References: <20240507131051.980313-7-antonio.borneo@foss.st.com>
TO: Antonio Borneo <antonio.borneo@foss.st.com>
TO: Russell King <linux@armlinux.org.uk>
TO: Maxime Coquelin <mcoquelin.stm32@gmail.com>
TO: Alexandre Torgue <alexandre.torgue@foss.st.com>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
TO: Thomas Gleixner <tglx@linutronix.de>
CC: Antonio Borneo <antonio.borneo@foss.st.com>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-stm32@st-md-mailman.stormreply.com
CC: linux-kernel@vger.kernel.org

Hi Antonio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 382d2ffe86efb1e2fa803d2cf17e5bfc34e574f3]

url:    https://github.com/intel-lab-lkp/linux/commits/Antonio-Borneo/irqchip-stm32-exti-add-CONFIG_STM32MP_EXTI/20240507-211459
base:   382d2ffe86efb1e2fa803d2cf17e5bfc34e574f3
patch link:    https://lore.kernel.org/r/20240507131051.980313-7-antonio.borneo%40foss.st.com
patch subject: [PATCH v2 6/8] irqchip/stm32mp-exti: allow build as module
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: powerpc64-randconfig-r071-20240513 (https://download.01.org/0day-ci/archive/20240513/202405131105.ulLfHBZJ-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405131105.ulLfHBZJ-lkp@intel.com/

smatch warnings:
drivers/irqchip/irq-stm32mp-exti.c:654 stm32mp_exti_probe() warn: 'host_data->hwlock' is an error pointer or valid

vim +654 drivers/irqchip/irq-stm32mp-exti.c

1bb8b08b0f88a8 Antonio Borneo 2024-05-07  629  
42841a0e29d1bd Antonio Borneo 2024-05-07  630  static int stm32mp_exti_probe(struct platform_device *pdev)
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  631  {
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  632  	int ret, i;
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  633  	struct device *dev = &pdev->dev;
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  634  	struct device_node *np = dev->of_node;
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  635  	struct irq_domain *parent_domain, *domain;
42841a0e29d1bd Antonio Borneo 2024-05-07  636  	struct stm32mp_exti_host_data *host_data;
42841a0e29d1bd Antonio Borneo 2024-05-07  637  	const struct stm32mp_exti_drv_data *drv_data;
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  638  
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  639  	host_data = devm_kzalloc(dev, sizeof(*host_data), GFP_KERNEL);
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  640  	if (!host_data)
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  641  		return -ENOMEM;
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  642  
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  643  	dev_set_drvdata(dev, host_data);
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  644  	host_data->dev = dev;
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  645  
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  646  	/* check for optional hwspinlock which may be not available yet */
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  647  	ret = of_hwspin_lock_get_id(np, 0);
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  648  	if (ret == -EPROBE_DEFER)
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  649  		/* hwspinlock framework not yet ready */
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  650  		return ret;
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  651  
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  652  	if (ret >= 0) {
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  653  		host_data->hwlock = devm_hwspin_lock_request_specific(dev, ret);
1bb8b08b0f88a8 Antonio Borneo 2024-05-07 @654  		if (!host_data->hwlock) {
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  655  			dev_err(dev, "Failed to request hwspinlock\n");
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  656  			return -EINVAL;
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  657  		}
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  658  	} else if (ret != -ENOENT) {
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  659  		/* note: ENOENT is a valid case (means 'no hwspinlock') */
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  660  		dev_err(dev, "Failed to get hwspinlock\n");
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  661  		return ret;
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  662  	}
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  663  
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  664  	/* initialize host_data */
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  665  	drv_data = of_device_get_match_data(dev);
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  666  	if (!drv_data) {
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  667  		dev_err(dev, "no of match data\n");
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  668  		return -ENODEV;
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  669  	}
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  670  	host_data->drv_data = drv_data;
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  671  
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  672  	host_data->chips_data = devm_kcalloc(dev, drv_data->bank_nr,
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  673  					     sizeof(*host_data->chips_data),
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  674  					     GFP_KERNEL);
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  675  	if (!host_data->chips_data)
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  676  		return -ENOMEM;
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  677  
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  678  	host_data->base = devm_platform_ioremap_resource(pdev, 0);
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  679  	if (IS_ERR(host_data->base))
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  680  		return PTR_ERR(host_data->base);
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  681  
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  682  	for (i = 0; i < drv_data->bank_nr; i++)
42841a0e29d1bd Antonio Borneo 2024-05-07  683  		stm32mp_exti_chip_init(host_data, i, np);
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  684  
42841a0e29d1bd Antonio Borneo 2024-05-07  685  	stm32mp_exti_check_rif(host_data);
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  686  
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  687  	parent_domain = irq_find_host(of_irq_find_parent(np));
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  688  	if (!parent_domain) {
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  689  		dev_err(dev, "GIC interrupt-parent not found\n");
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  690  		return -EINVAL;
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  691  	}
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  692  
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  693  	domain = irq_domain_add_hierarchy(parent_domain, 0,
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  694  					  drv_data->bank_nr * IRQS_PER_BANK,
42841a0e29d1bd Antonio Borneo 2024-05-07  695  					  np, &stm32mp_exti_domain_ops,
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  696  					  host_data);
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  697  
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  698  	if (!domain) {
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  699  		dev_err(dev, "Could not register exti domain\n");
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  700  		return -ENOMEM;
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  701  	}
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  702  
42841a0e29d1bd Antonio Borneo 2024-05-07  703  	ret = devm_add_action_or_reset(dev, stm32mp_exti_remove_irq, domain);
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  704  	if (ret)
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  705  		return ret;
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  706  
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  707  	if (of_property_read_bool(np, "interrupts-extended"))
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  708  		host_data->dt_has_irqs_desc = true;
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  709  
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  710  	return 0;
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  711  }
1bb8b08b0f88a8 Antonio Borneo 2024-05-07  712  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
