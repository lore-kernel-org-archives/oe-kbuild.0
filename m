Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E156D24B34
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Mar 2025 06:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741586566; cv=none; b=QRiO/ObzfMgy0ywoPsv1FHf2YCW0hkoc0R7xCcm8LiM8z7KLToKamRhfn49PsZJ34BRidJ9CSQ3tqOkiP8x9a7Mr68PClCaajRYeRuKekokbDnFHX+8SvpCXmPXR9JdCWAedPdtRPYE1C1ljIiZPZZCe5njRqHbtEvxc3KIhgaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741586566; c=relaxed/simple;
	bh=mvBaijclFPk4NOj/7PGv8NTPq1BTiIDDzq4bm1echjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SHgTJpDFRDzpk0mIyxxcWGHS7ze7nipDwtBtV4H08g4WuoLCrW798d3MTkPRybNgqfrZkv8uvSNmfd5yQLutq7FzUWod4/wmK31zpGbRw3r0Uv36WtRsgxQNrv4RPzU4cVN67M2zBGhmVUHRg50LB2F0zlFjF82bngDJ8t1m75s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JToaivUR; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JToaivUR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741586565; x=1773122565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mvBaijclFPk4NOj/7PGv8NTPq1BTiIDDzq4bm1echjo=;
  b=JToaivURAi87Dorq/bbbkZ4qE98OHF7Q31AEj+0q86r7V0bNQMQLY5k+
   qHlvhqsIKx6ffSNsQnvN7G3Jd/wgo44cv2iTJ4m6zYtkGhVaqfQDaZ+Co
   kZtpyBuRDSaZXATQgFCenhHUm5UyQtPf/Axbz8UE3sNXAw7b1mxcLwCg4
   zQfNtsY9C3ENgnXvqWNHD/1A2qj5qK9BaqzSN6fVtbdbMou/1L2ti5pdu
   PXJbb3DkLIzVbEQTvvllAi1IkTTyUlWhsHZvvnACGnM8IMPO7dTZis4Ic
   38504zbaxI3I0bYwjVDiuKtHiXbp2q6RqjNG+VFcp09Os5daZYS+yKaMo
   w==;
X-CSE-ConnectionGUID: 7nOho3I2TaOzRTdc84rVTg==
X-CSE-MsgGUID: naTIgGGcQdu5LhXhvs7OSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="53946835"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="53946835"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 23:02:44 -0700
X-CSE-ConnectionGUID: +NN7l8DwR8KMgaNeegByzw==
X-CSE-MsgGUID: tZy5Kis4S1uQRcKaeoCcrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="150664316"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 09 Mar 2025 23:02:43 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trWDo-0003rL-1S;
	Mon, 10 Mar 2025 06:02:40 +0000
Date: Mon, 10 Mar 2025 14:01:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/irqchip/irq-renesas-rzv2h.c:496:1-7: ERROR: missing
 put_device; call of_find_device_by_node on line 432, but without a
 corresponding object release within this function.
Message-ID: <202503101313.TvXU5fjz-lkp@intel.com>
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
TO: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   80e54e84911a923c40d7bee33a34c1b4be148d7a
commit: 0d7605e75ac2d8620929148f932cde54746c485f irqchip: Add RZ/V2H(P) Interrupt Control Unit (ICU) driver
date:   5 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 months ago
config: microblaze-randconfig-r061-20250310 (https://download.01.org/0day-ci/archive/20250310/202503101313.TvXU5fjz-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202503101313.TvXU5fjz-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/irqchip/irq-renesas-rzv2h.c:496:1-7: ERROR: missing put_device; call of_find_device_by_node on line 432, but without a corresponding object release within this function.

vim +496 drivers/irqchip/irq-renesas-rzv2h.c

0d7605e75ac2d86 Fabrizio Castro 2024-10-10  423  
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  424  static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  425  {
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  426  	struct irq_domain *irq_domain, *parent_domain;
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  427  	struct rzv2h_icu_priv *rzv2h_icu_data;
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  428  	struct platform_device *pdev;
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  429  	struct reset_control *resetn;
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  430  	int ret;
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  431  
0d7605e75ac2d86 Fabrizio Castro 2024-10-10 @432  	pdev = of_find_device_by_node(node);
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  433  	if (!pdev)
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  434  		return -ENODEV;
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  435  
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  436  	parent_domain = irq_find_host(parent);
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  437  	if (!parent_domain) {
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  438  		dev_err(&pdev->dev, "cannot find parent domain\n");
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  439  		ret = -ENODEV;
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  440  		goto put_dev;
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  441  	}
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  442  
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  443  	rzv2h_icu_data = devm_kzalloc(&pdev->dev, sizeof(*rzv2h_icu_data), GFP_KERNEL);
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  444  	if (!rzv2h_icu_data) {
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  445  		ret = -ENOMEM;
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  446  		goto put_dev;
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  447  	}
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  448  
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  449  	rzv2h_icu_data->irqchip = &rzv2h_icu_chip;
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  450  
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  451  	rzv2h_icu_data->base = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  452  	if (IS_ERR(rzv2h_icu_data->base)) {
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  453  		ret = PTR_ERR(rzv2h_icu_data->base);
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  454  		goto put_dev;
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  455  	}
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  456  
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  457  	ret = rzv2h_icu_parse_interrupts(rzv2h_icu_data, node);
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  458  	if (ret) {
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  459  		dev_err(&pdev->dev, "cannot parse interrupts: %d\n", ret);
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  460  		goto put_dev;
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  461  	}
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  462  
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  463  	resetn = devm_reset_control_get_exclusive(&pdev->dev, NULL);
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  464  	if (IS_ERR(resetn)) {
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  465  		ret = PTR_ERR(resetn);
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  466  		goto put_dev;
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  467  	}
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  468  
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  469  	ret = reset_control_deassert(resetn);
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  470  	if (ret) {
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  471  		dev_err(&pdev->dev, "failed to deassert resetn pin, %d\n", ret);
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  472  		goto put_dev;
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  473  	}
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  474  
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  475  	pm_runtime_enable(&pdev->dev);
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  476  	ret = pm_runtime_resume_and_get(&pdev->dev);
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  477  	if (ret < 0) {
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  478  		dev_err(&pdev->dev, "pm_runtime_resume_and_get failed: %d\n", ret);
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  479  		goto pm_disable;
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  480  	}
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  481  
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  482  	raw_spin_lock_init(&rzv2h_icu_data->lock);
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  483  
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  484  	irq_domain = irq_domain_add_hierarchy(parent_domain, 0, ICU_NUM_IRQ, node,
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  485  					      &rzv2h_icu_domain_ops, rzv2h_icu_data);
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  486  	if (!irq_domain) {
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  487  		dev_err(&pdev->dev, "failed to add irq domain\n");
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  488  		ret = -ENOMEM;
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  489  		goto pm_put;
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  490  	}
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  491  
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  492  	/*
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  493  	 * coccicheck complains about a missing put_device call before returning, but it's a false
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  494  	 * positive. We still need &pdev->dev after successfully returning from this function.
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  495  	 */
0d7605e75ac2d86 Fabrizio Castro 2024-10-10 @496  	return 0;
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  497  
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  498  pm_put:
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  499  	pm_runtime_put(&pdev->dev);
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  500  pm_disable:
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  501  	pm_runtime_disable(&pdev->dev);
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  502  	reset_control_assert(resetn);
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  503  put_dev:
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  504  	put_device(&pdev->dev);
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  505  
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  506  	return ret;
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  507  }
0d7605e75ac2d86 Fabrizio Castro 2024-10-10  508  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
