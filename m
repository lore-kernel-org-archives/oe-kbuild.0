Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683FC181D0E
	for <oe-kbuild@lists.linux.dev>; Thu, 30 May 2024 21:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717103619; cv=none; b=C02gQF1EFUJ5yKuD2VP8KgsZzFhtzfhpqvd0izTOxKSAXVuVvifk9zjqp+2qbeMTf2qZ0gKPaYUzRvdGd7ipaKhnqrhzhjotExzjhUuK8GeJSZVmSkXJrYyeD0aewdxhXed8lEzCIlrswfO/omNFIk8e0dcJW4lwoKMzgp3bA84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717103619; c=relaxed/simple;
	bh=rcO/4PzZpQP3T0WnNiYX+UhexaWcR1f4rVOxiXUjxrs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qmgPyzcA1nfBqbDws1a69REAkqJegrdJXgSMMLRejaRgMUtbRiXyFnzZabUUo5WiKVNtuXlLjplbRr6lfNKhWAvDsIA61+gVvRksOL/jjJsUxv+mj0D+2svi0So7aVILeWOaottXjZXqGSGOhY0Y3brDmKa/nXVzGYq78Cp7rLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIUDHfPf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIUDHfPf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717103617; x=1748639617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rcO/4PzZpQP3T0WnNiYX+UhexaWcR1f4rVOxiXUjxrs=;
  b=TIUDHfPfV0tdsmL1QFw1GZcv5ibhzxSfpfoW9nptORCUF/XJmnu9wZRB
   /nMzt3vEmUGgIzwIEbe7TqWUaXqObL9nNOWi9oZ/6L7pEux9dmh5hbyKT
   3TpSLx+SwT0l8oO46TrUgHWvFJHhtlxVMGH6ACZQ3Mw0GBzlX+ubyMzWI
   bD2/rywNQxQxteiQ8o+rPZKsT1udQIevflux5DxRAXOu+rer6JY7WBbrX
   +B/88CqX/x96U1O9LX/XeV47vkGOcD5ABuSstBjNFZqMSI9FAutLQrqNK
   l6Cl6DcN6yFTbha+cdRZIfbT0goKlfoK8Caa6N7wZsaVC3mPVLUYu3MA0
   g==;
X-CSE-ConnectionGUID: Pr+F8xrmQEauXdjNTGYTcA==
X-CSE-MsgGUID: bZpN+SVvRMi1v8cvw8I14Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13498420"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="13498420"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 14:13:37 -0700
X-CSE-ConnectionGUID: gjX/aiEZQ3Cu0RUGWlaPrg==
X-CSE-MsgGUID: v/B5tlZKTVeKe7jaepYlDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="40395584"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 30 May 2024 14:13:36 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCn5Z-000FzP-2c;
	Thu, 30 May 2024 21:13:33 +0000
Date: Fri, 31 May 2024 05:12:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [avpatel:riscv_acpi_b2_v6_610_rc1_full 48/54]
 drivers/irqchip/irq-riscv-aplic-direct.c:202
 aplic_direct_parse_parent_hwirq() error: uninitialized symbol 'rc'.
Message-ID: <202405310518.PSoGXyNv-lkp@intel.com>
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
TO: Sunil V L <sunilvl@ventanamicro.com>
CC: Anup Patel <anup@brainfault.org>

tree:   https://github.com/avpatel/linux.git riscv_acpi_b2_v6_610_rc1_full
head:   0dea64cc13417fc07df1d97a05904896f59fb329
commit: 9e014be7064b9ad2b121d1970cb8f27ec009f960 [48/54] irqchip/riscv-aplic: Add ACPI support
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-r071-20240530 (https://download.01.org/0day-ci/archive/20240531/202405310518.PSoGXyNv-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405310518.PSoGXyNv-lkp@intel.com/

smatch warnings:
drivers/irqchip/irq-riscv-aplic-direct.c:202 aplic_direct_parse_parent_hwirq() error: uninitialized symbol 'rc'.

vim +/rc +202 drivers/irqchip/irq-riscv-aplic-direct.c

2333df5ae51ead Anup Patel 2024-03-07  191  
2333df5ae51ead Anup Patel 2024-03-07  192  static int aplic_direct_parse_parent_hwirq(struct device *dev, u32 index,
9e014be7064b9a Sunil V L  2024-04-07  193  					   u32 *parent_hwirq, unsigned long *parent_hartid,
9e014be7064b9a Sunil V L  2024-04-07  194  					   struct aplic_priv *priv)
2333df5ae51ead Anup Patel 2024-03-07  195  {
2333df5ae51ead Anup Patel 2024-03-07  196  	struct of_phandle_args parent;
9e014be7064b9a Sunil V L  2024-04-07  197  	unsigned long hartid;
2333df5ae51ead Anup Patel 2024-03-07  198  	int rc;
2333df5ae51ead Anup Patel 2024-03-07  199  
9e014be7064b9a Sunil V L  2024-04-07  200  	if (!is_of_node(dev->fwnode)) {
9e014be7064b9a Sunil V L  2024-04-07  201  		hartid = acpi_get_ext_intc_parent_hartid(priv->id, index);
9e014be7064b9a Sunil V L  2024-04-07 @202  		if (rc)
9e014be7064b9a Sunil V L  2024-04-07  203  			return rc;
9e014be7064b9a Sunil V L  2024-04-07  204  
9e014be7064b9a Sunil V L  2024-04-07  205  		*parent_hartid = hartid;
9e014be7064b9a Sunil V L  2024-04-07  206  		*parent_hwirq = RV_IRQ_EXT;
9e014be7064b9a Sunil V L  2024-04-07  207  		return 0;
9e014be7064b9a Sunil V L  2024-04-07  208  	}
2333df5ae51ead Anup Patel 2024-03-07  209  
2333df5ae51ead Anup Patel 2024-03-07  210  	rc = of_irq_parse_one(to_of_node(dev->fwnode), index, &parent);
2333df5ae51ead Anup Patel 2024-03-07  211  	if (rc)
2333df5ae51ead Anup Patel 2024-03-07  212  		return rc;
2333df5ae51ead Anup Patel 2024-03-07  213  
2333df5ae51ead Anup Patel 2024-03-07  214  	rc = riscv_of_parent_hartid(parent.np, parent_hartid);
2333df5ae51ead Anup Patel 2024-03-07  215  	if (rc)
2333df5ae51ead Anup Patel 2024-03-07  216  		return rc;
2333df5ae51ead Anup Patel 2024-03-07  217  
2333df5ae51ead Anup Patel 2024-03-07  218  	*parent_hwirq = parent.args[0];
2333df5ae51ead Anup Patel 2024-03-07  219  	return 0;
2333df5ae51ead Anup Patel 2024-03-07  220  }
2333df5ae51ead Anup Patel 2024-03-07  221  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
