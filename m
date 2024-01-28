Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A8E803
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Jan 2024 00:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706401571; cv=none; b=f906pkMD7ITCJDC/2W6UNSTjVE+FOZkCvUTXyFgLt0iHeNIoXGWF2Ipid9ORZ5YZbd/3HUAusYweVheRV52rBYFdqy+6rTCDyqR4FnMcPMVvyfSYyWHGpN6S+sGheqrLclIej52fhDQWsgm+Q68vXRjXaqwgo8gY2jwWxE0o/GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706401571; c=relaxed/simple;
	bh=7ysXVqff1Ya2naWjT8OyNwaiWHsEQTyUYnH8PShD/MA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bq1ohzWN3wWZ+5xYMjq+WLBsLJiTAYK69fLYSZHVkWrlLTzmPII5GQxdLiiaVnli9HzV+xnOrvJuQQtN5dXPf7rvlrod6b19j5qDEI+vK/+D/zy/0mChTeOeDlnGjMiq6DKC1pO+DoE2s+WfRGARvrm1WkTiZ66qj6k2UUqPU5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bifhP0tT; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bifhP0tT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706401570; x=1737937570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7ysXVqff1Ya2naWjT8OyNwaiWHsEQTyUYnH8PShD/MA=;
  b=bifhP0tTw4ocxKzeC03J9aUse1E69hJlo7tw+jCSVzF2Fqrh4ABYNU9J
   9rOnBadKjxzhNpUSPCF2Nu0VQ294ScoYL6gs0D0jqo9993/1r9W4TaDPz
   T/cJfVG+ULBkn0+6XopfwaOzv0tbp6jeFsz4fg1f7iHC1UimLQp6l3+0N
   fI4XRjabSJeX8+tRBwdT3w9IMTFwyE3vQ8TGl0z9WExBk8LzfMje3qzPD
   rD39C3htszz6OwG8nNrpMXrWJWzPP7gWNjN1xmNnwLCFX5SU0Dv25bO3v
   ghPiXzIu/YGOByRTXKvjFl8DU40wCvKfPe1jdIFBa9VPwNO37dm8aT2iM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="1659865"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="1659865"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 16:26:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="3028302"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Jan 2024 16:26:07 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTszt-0002ts-34;
	Sun, 28 Jan 2024 00:26:05 +0000
Date: Sun, 28 Jan 2024 08:25:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/input/misc/rt5120-pwrkey.c:82:9-34: WARNING: Threaded IRQ
 with no primary handler requested without IRQF_ONESHOT (unless it is nested
 IRQ)
Message-ID: <202401280843.6TiMAlBG-lkp@intel.com>
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
TO: ChiYuan Huang <cy_huang@richtek.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8a696a29c6905594e4abf78eaafcb62165ac61f1
commit: ed3d5bd20dcdfdbe110feeabf120cba7bd329ad8 Input: rt5120 - add power key support
date:   1 year, 5 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 1 year, 5 months ago
config: arm-randconfig-r062-20240117 (https://download.01.org/0day-ci/archive/20240128/202401280843.6TiMAlBG-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401280843.6TiMAlBG-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/input/misc/rt5120-pwrkey.c:82:9-34: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
   drivers/input/misc/rt5120-pwrkey.c:91:9-34: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +82 drivers/input/misc/rt5120-pwrkey.c

ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   40  
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   41  static int rt5120_pwrkey_probe(struct platform_device *pdev)
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   42  {
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   43  	struct rt5120_priv *priv;
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   44  	struct device *dev = &pdev->dev;
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   45  	int press_irq, release_irq;
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   46  	int error;
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   47  
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   48  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   49  	if (!priv)
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   50  		return -ENOMEM;
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   51  
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   52  	priv->regmap = dev_get_regmap(dev->parent, NULL);
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   53  	if (!priv->regmap) {
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   54  		dev_err(dev, "Failed to init regmap\n");
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   55  		return -ENODEV;
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   56  	}
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   57  
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   58  	press_irq = platform_get_irq_byname(pdev, "pwrkey-press");
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   59  	if (press_irq < 0)
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   60  		return press_irq;
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   61  
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   62  	release_irq = platform_get_irq_byname(pdev, "pwrkey-release");
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   63  	if (release_irq < 0)
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   64  		return release_irq;
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   65  
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   66  	/* Make input device be device resource managed */
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   67  	priv->input = devm_input_allocate_device(dev);
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   68  	if (!priv->input)
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   69  		return -ENOMEM;
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   70  
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   71  	priv->input->name = "rt5120_pwrkey";
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   72  	priv->input->phys = "rt5120_pwrkey/input0";
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   73  	priv->input->id.bustype = BUS_I2C;
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   74  	input_set_capability(priv->input, EV_KEY, KEY_POWER);
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   75  
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   76  	error = input_register_device(priv->input);
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   77  	if (error) {
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   78  		dev_err(dev, "Failed to register input device: %d\n", error);
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   79  		return error;
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   80  	}
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   81  
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12  @82  	error = devm_request_threaded_irq(dev, press_irq,
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   83  					  NULL, rt5120_pwrkey_handler,
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   84  					  0, "pwrkey-press", priv);
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   85  	if (error) {
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   86  		dev_err(dev,
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   87  			"Failed to register pwrkey press irq: %d\n", error);
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   88  		return error;
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   89  	}
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   90  
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   91  	error = devm_request_threaded_irq(dev, release_irq,
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   92  					  NULL, rt5120_pwrkey_handler,
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   93  					  0, "pwrkey-release", priv);
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   94  	if (error) {
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   95  		dev_err(dev,
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   96  			"Failed to register pwrkey release irq: %d\n", error);
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   97  		return error;
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   98  	}
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12   99  
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12  100  	return 0;
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12  101  }
ed3d5bd20dcdfd ChiYuan Huang 2022-08-12  102  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
