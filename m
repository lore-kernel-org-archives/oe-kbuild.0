Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2195232B9AB
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Oct 2025 09:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761816013; cv=none; b=e5WkIvV/B5UWbYzXyuYvJ/S+iyidSKb+1bgoW2mKAPszVJt/4kgkjSA1Z7hKVmreXz+X4V1lkFhPb7nknTtjVb9AHm8nVZenstyKauGhHhWdSUKLyV01/rwDDZUsC8RksiEup6FajDIkIzJNZpNboCv96tF4dQKqPxN3MsfdrOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761816013; c=relaxed/simple;
	bh=Vv3s2BfqpZxv9TEtmFotwhpYouc6ojDte9zQRQgUiww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gIZRyF4TViYttGlrWpMFLRqJ4pD24wTSqXg9RIMAOJBp8V6o5DjMSWM7mPl5JA9LKDvdUo0a1ajBG4uvTnDY5/bP/X8zn049ky9wG3LNjqf44UfKK0b3+Y+eLy7dvyJJIePTf77ehKzWi3MWpARE/ZDGpuI8NpprqcYD0AhcAiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IrnEAceW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IrnEAceW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761816012; x=1793352012;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Vv3s2BfqpZxv9TEtmFotwhpYouc6ojDte9zQRQgUiww=;
  b=IrnEAceWZvMPLEBzWe/QvYD7Jw5/TjsWPSDonInYXxRgBOkeDO/xFfDq
   Yux3SDL0tLrdgT8hFw/znjvt1+L0+HPjJJ04H7WuS+6P5smPxL9gg3OWX
   0L3cCFiEwP4cZHn72wbTZsgWa6WbVKafo4s6Le30vTYzpqJONCX/AdqF/
   sarl05Yc5GizK3GRvvqwr9PozoCPkfFpiXE3v2vu8jQOV0Hx8tzrfQvBj
   GM8aFk7Tj2BV7whpRKOOuXEBnNRb8JRPVpSDzRD6ANubuGoQ70SoiCDqL
   QBHrLxwwdpLiSuCTQIpFG3MUeVk732MssJ/lY9qTHxLBJ8IOH56++oxc6
   g==;
X-CSE-ConnectionGUID: Tw5eTLvSRbGphkAQqkVDlA==
X-CSE-MsgGUID: CIVK5ysMQweiT+ujsR79uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="74242147"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="74242147"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 02:20:11 -0700
X-CSE-ConnectionGUID: n3QWoClgSlKcE61vilkC0g==
X-CSE-MsgGUID: k1u/0Oi9TR6PRQytBBxI3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="190238691"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 30 Oct 2025 02:20:09 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEOpD-000Llm-0M;
	Thu, 30 Oct 2025 09:20:07 +0000
Date: Thu, 30 Oct 2025 17:19:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/pwm/pwm-mediatek.c:380:16-17: WARNING: Use struct_size
Message-ID: <202510301753.iqGmTwae-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
commit: ed5902a2464834656f94f1c23fa61f99ea38f328 pwm: mediatek: Lock and cache clock rate
date:   6 weeks ago
:::::: branch date: 32 hours ago
:::::: commit date: 6 weeks ago
config: powerpc-randconfig-r054-20251029 (https://download.01.org/0day-ci/archive/20251030/202510301753.iqGmTwae-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510301753.iqGmTwae-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pwm/pwm-mediatek.c:380:16-17: WARNING: Use struct_size

vim +380 drivers/pwm/pwm-mediatek.c

a911f15745fd4a9 Uwe Kleine-König           2025-07-25  368  
2503781c97fa66f Sam Shih                   2019-09-20  369  static int pwm_mediatek_probe(struct platform_device *pdev)
caf065f8fd583b4 John Crispin               2017-01-23  370  {
1c8090d7b3babd2 Uwe Kleine-König           2024-02-14  371  	struct pwm_chip *chip;
2503781c97fa66f Sam Shih                   2019-09-20  372  	struct pwm_mediatek_chip *pc;
1c8090d7b3babd2 Uwe Kleine-König           2024-02-14  373  	const struct pwm_mediatek_of_data *soc;
caf065f8fd583b4 John Crispin               2017-01-23  374  	unsigned int i;
caf065f8fd583b4 John Crispin               2017-01-23  375  	int ret;
caf065f8fd583b4 John Crispin               2017-01-23  376  
1c8090d7b3babd2 Uwe Kleine-König           2024-02-14  377  	soc = of_device_get_match_data(&pdev->dev);
1c8090d7b3babd2 Uwe Kleine-König           2024-02-14  378  
ed5902a24648346 Uwe Kleine-König           2025-07-25  379  	chip = devm_pwmchip_alloc(&pdev->dev, soc->num_pwms,
ed5902a24648346 Uwe Kleine-König           2025-07-25 @380  				  sizeof(*pc) + soc->num_pwms * sizeof(*pc->clk_pwms));
1c8090d7b3babd2 Uwe Kleine-König           2024-02-14  381  	if (IS_ERR(chip))
1c8090d7b3babd2 Uwe Kleine-König           2024-02-14  382  		return PTR_ERR(chip);
1c8090d7b3babd2 Uwe Kleine-König           2024-02-14  383  	pc = to_pwm_mediatek_chip(chip);
caf065f8fd583b4 John Crispin               2017-01-23  384  
1c8090d7b3babd2 Uwe Kleine-König           2024-02-14  385  	pc->soc = soc;
424268c7494c2ae Zhi Mao                    2017-10-25  386  
7681c2bd2ab2dd1 Yangtao Li                 2019-12-29  387  	pc->regs = devm_platform_ioremap_resource(pdev, 0);
caf065f8fd583b4 John Crispin               2017-01-23  388  	if (IS_ERR(pc->regs))
caf065f8fd583b4 John Crispin               2017-01-23  389  		return PTR_ERR(pc->regs);
caf065f8fd583b4 John Crispin               2017-01-23  390  
efecdeb82f21d41 Sam Shih                   2019-09-20  391  	pc->clk_top = devm_clk_get(&pdev->dev, "top");
5264e8ca762bb1b AngeloGioacchino Del Regno 2022-02-14  392  	if (IS_ERR(pc->clk_top))
5264e8ca762bb1b AngeloGioacchino Del Regno 2022-02-14  393  		return dev_err_probe(&pdev->dev, PTR_ERR(pc->clk_top),
4d690e508a69f42 AngeloGioacchino Del Regno 2022-02-14  394  				     "Failed to get top clock\n");
efecdeb82f21d41 Sam Shih                   2019-09-20  395  
efecdeb82f21d41 Sam Shih                   2019-09-20  396  	pc->clk_main = devm_clk_get(&pdev->dev, "main");
5264e8ca762bb1b AngeloGioacchino Del Regno 2022-02-14  397  	if (IS_ERR(pc->clk_main))
5264e8ca762bb1b AngeloGioacchino Del Regno 2022-02-14  398  		return dev_err_probe(&pdev->dev, PTR_ERR(pc->clk_main),
4d690e508a69f42 AngeloGioacchino Del Regno 2022-02-14  399  				     "Failed to get main clock\n");
efecdeb82f21d41 Sam Shih                   2019-09-20  400  
1c8090d7b3babd2 Uwe Kleine-König           2024-02-14  401  	for (i = 0; i < soc->num_pwms; i++) {
efecdeb82f21d41 Sam Shih                   2019-09-20  402  		char name[8];
efecdeb82f21d41 Sam Shih                   2019-09-20  403  
efecdeb82f21d41 Sam Shih                   2019-09-20  404  		snprintf(name, sizeof(name), "pwm%d", i + 1);
efecdeb82f21d41 Sam Shih                   2019-09-20  405  
ed5902a24648346 Uwe Kleine-König           2025-07-25  406  		pc->clk_pwms[i].clk = devm_clk_get(&pdev->dev, name);
ed5902a24648346 Uwe Kleine-König           2025-07-25  407  		if (IS_ERR(pc->clk_pwms[i].clk))
ed5902a24648346 Uwe Kleine-König           2025-07-25  408  			return dev_err_probe(&pdev->dev, PTR_ERR(pc->clk_pwms[i].clk),
4d690e508a69f42 AngeloGioacchino Del Regno 2022-02-14  409  					     "Failed to get %s clock\n", name);
ed5902a24648346 Uwe Kleine-König           2025-07-25  410  
ed5902a24648346 Uwe Kleine-König           2025-07-25  411  		ret = devm_clk_rate_exclusive_get(&pdev->dev, pc->clk_pwms[i].clk);
ed5902a24648346 Uwe Kleine-König           2025-07-25  412  		if (ret)
ed5902a24648346 Uwe Kleine-König           2025-07-25  413  			return dev_err_probe(&pdev->dev, ret,
ed5902a24648346 Uwe Kleine-König           2025-07-25  414  					     "Failed to lock clock rate for %s\n", name);
424268c7494c2ae Zhi Mao                    2017-10-25  415  	}
caf065f8fd583b4 John Crispin               2017-01-23  416  
a911f15745fd4a9 Uwe Kleine-König           2025-07-25  417  	ret = pwm_mediatek_init_used_clks(pc);
a911f15745fd4a9 Uwe Kleine-König           2025-07-25  418  	if (ret)
a911f15745fd4a9 Uwe Kleine-König           2025-07-25  419  		return dev_err_probe(&pdev->dev, ret, "Failed to initialize used clocks\n");
a911f15745fd4a9 Uwe Kleine-König           2025-07-25  420  
1c8090d7b3babd2 Uwe Kleine-König           2024-02-14  421  	chip->ops = &pwm_mediatek_ops;
caf065f8fd583b4 John Crispin               2017-01-23  422  
1c8090d7b3babd2 Uwe Kleine-König           2024-02-14  423  	ret = devm_pwmchip_add(&pdev->dev, chip);
5264e8ca762bb1b AngeloGioacchino Del Regno 2022-02-14  424  	if (ret < 0)
5264e8ca762bb1b AngeloGioacchino Del Regno 2022-02-14  425  		return dev_err_probe(&pdev->dev, ret, "pwmchip_add() failed\n");
caf065f8fd583b4 John Crispin               2017-01-23  426  
caf065f8fd583b4 John Crispin               2017-01-23  427  	return 0;
caf065f8fd583b4 John Crispin               2017-01-23  428  }
caf065f8fd583b4 John Crispin               2017-01-23  429  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
