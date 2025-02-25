Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBA214A4F0
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Feb 2025 02:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740450987; cv=none; b=PcQSOlMOmacCTGboas+ehBXKjW1YsMO42NlmMtsVfUf+q4jAfFO6y617oe7w9VramaXVgCEX8HUtD+AaIT3m4h29dnv/FZBHPoVAPxN3p4uUKdzWQ3dXKTLkNG2bVl1hiHW/0ZlCcTembkZkW78/82obuqJiMhXf5yycMQwLMzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740450987; c=relaxed/simple;
	bh=VdYc96AMV+u9jRztNIPHq4k59iLewne1iCWrmo2ksoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lfhNBJ979zQWzxCbYFzoa0WLr8zHoYDiZGbBpEjthMo+pDYo76nFRTuYH8g53mird3HlIgCm3n7eIkXsolBZRL7I2BX+Q2p3OzW3p5M3QD16McGXLp5GUnUJr5VohxgpilpC1itxLshm49m5kLvWLLEljltbaJ45r2JIPJN0AHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LvcRD/IM; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LvcRD/IM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740450985; x=1771986985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VdYc96AMV+u9jRztNIPHq4k59iLewne1iCWrmo2ksoo=;
  b=LvcRD/IMPaz9w+p17/nScQJUA1ulyrAIseV7yqhv7Cl9b7nPv9MPRSut
   RLcy2B+0YP9LgswrKbap0wEt9T8MLkklHYiecScxUcXEfNjW8l5QlJ/qB
   z1yFgIlrpjF7iZcbPZaqpYicAOe32NtoG6qZDEa4XHLmBOdffgTgB/g3W
   ujG1XFs7SvY3fbnRKn3aHe6radlbXmpPRuDrV68PTiJonzHI/0/TQjel7
   a7sSrqpda1/WYdgA3LIk+mxctwXSyIi514Fexpxf3yytB8BPvtqQ5JU+H
   MPpFqOzqBcz5ss9Nh1MgNmQOssClXu0G9fA8S/8OyMC7dUIj9b75+Q4uj
   Q==;
X-CSE-ConnectionGUID: 6Q3SvhhGSvWsbV3v1z6onw==
X-CSE-MsgGUID: MChUX/rrSaGWsBRPyGF4hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40943994"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="40943994"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 18:36:23 -0800
X-CSE-ConnectionGUID: kGYp6vVcSeq/tlkPoqL8dw==
X-CSE-MsgGUID: BsQF5IIiRxqsV+VLaUlnzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147127388"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 24 Feb 2025 18:36:21 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmknz-0009fF-1H;
	Tue, 25 Feb 2025 02:36:19 +0000
Date: Tue, 25 Feb 2025 10:35:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bp:edac-cxl 2/5] drivers/edac/edac_device.c:705 edac_dev_register()
 error: uninitialized symbol 'ret'.
Message-ID: <202502251009.0sGkolEJ-lkp@intel.com>
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
TO: Shiju Jose <shiju.jose@huawei.com>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git edac-cxl
head:   4fab25b62bc682c0df886d97dcb106d4989c9ff1
commit: e777719d5bec32af859990456f4b0e0e362f425a [2/5] EDAC: Add scrub control feature
:::::: branch date: 15 hours ago
:::::: commit date: 19 hours ago
config: i386-randconfig-141-20250225 (https://download.01.org/0day-ci/archive/20250225/202502251009.0sGkolEJ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502251009.0sGkolEJ-lkp@intel.com/

smatch warnings:
drivers/edac/edac_device.c:705 edac_dev_register() error: uninitialized symbol 'ret'.

vim +/ret +705 drivers/edac/edac_device.c

9222ad0e3fd4c35 Shiju Jose 2025-02-12  592  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  593  /**
9222ad0e3fd4c35 Shiju Jose 2025-02-12  594   * edac_dev_register - register device for RAS features with EDAC
9222ad0e3fd4c35 Shiju Jose 2025-02-12  595   * @parent: parent device.
9222ad0e3fd4c35 Shiju Jose 2025-02-12  596   * @name: name for the folder in the /sys/bus/edac/devices/,
9222ad0e3fd4c35 Shiju Jose 2025-02-12  597   *	  which is derived from the parent device.
9222ad0e3fd4c35 Shiju Jose 2025-02-12  598   *	  For e.g. /sys/bus/edac/devices/cxl_mem0/
9222ad0e3fd4c35 Shiju Jose 2025-02-12  599   * @private: parent driver's data to store in the context if any.
9222ad0e3fd4c35 Shiju Jose 2025-02-12  600   * @num_features: number of RAS features to register.
9222ad0e3fd4c35 Shiju Jose 2025-02-12  601   * @ras_features: list of RAS features to register.
9222ad0e3fd4c35 Shiju Jose 2025-02-12  602   *
9222ad0e3fd4c35 Shiju Jose 2025-02-12  603   * Return:
9222ad0e3fd4c35 Shiju Jose 2025-02-12  604   *  * %0       - Success.
9222ad0e3fd4c35 Shiju Jose 2025-02-12  605   *  * %-EINVAL - Invalid parameters passed.
9222ad0e3fd4c35 Shiju Jose 2025-02-12  606   *  * %-ENOMEM - Dynamic memory allocation failed.
9222ad0e3fd4c35 Shiju Jose 2025-02-12  607   *
9222ad0e3fd4c35 Shiju Jose 2025-02-12  608   */
9222ad0e3fd4c35 Shiju Jose 2025-02-12  609  int edac_dev_register(struct device *parent, char *name,
9222ad0e3fd4c35 Shiju Jose 2025-02-12  610  		      void *private, int num_features,
9222ad0e3fd4c35 Shiju Jose 2025-02-12  611  		      const struct edac_dev_feature *ras_features)
9222ad0e3fd4c35 Shiju Jose 2025-02-12  612  {
9222ad0e3fd4c35 Shiju Jose 2025-02-12  613  	const struct attribute_group **ras_attr_groups;
e777719d5bec32a Shiju Jose 2025-02-12  614  	struct edac_dev_data *dev_data;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  615  	struct edac_dev_feat_ctx *ctx;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  616  	int attr_gcnt = 0;
e777719d5bec32a Shiju Jose 2025-02-12  617  	int scrub_cnt = 0;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  618  	int ret, feat;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  619  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  620  	if (!parent || !name || !num_features || !ras_features)
9222ad0e3fd4c35 Shiju Jose 2025-02-12  621  		return -EINVAL;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  622  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  623  	/* Double parse to make space for attributes */
9222ad0e3fd4c35 Shiju Jose 2025-02-12  624  	for (feat = 0; feat < num_features; feat++) {
9222ad0e3fd4c35 Shiju Jose 2025-02-12  625  		switch (ras_features[feat].ft_type) {
e777719d5bec32a Shiju Jose 2025-02-12  626  		case RAS_FEAT_SCRUB:
e777719d5bec32a Shiju Jose 2025-02-12  627  			attr_gcnt++;
e777719d5bec32a Shiju Jose 2025-02-12  628  			scrub_cnt++;
e777719d5bec32a Shiju Jose 2025-02-12  629  			break;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  630  		default:
9222ad0e3fd4c35 Shiju Jose 2025-02-12  631  			return -EINVAL;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  632  		}
9222ad0e3fd4c35 Shiju Jose 2025-02-12  633  	}
9222ad0e3fd4c35 Shiju Jose 2025-02-12  634  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  635  	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
9222ad0e3fd4c35 Shiju Jose 2025-02-12  636  	if (!ctx)
9222ad0e3fd4c35 Shiju Jose 2025-02-12  637  		return -ENOMEM;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  638  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  639  	ras_attr_groups = kcalloc(attr_gcnt + 1, sizeof(*ras_attr_groups), GFP_KERNEL);
9222ad0e3fd4c35 Shiju Jose 2025-02-12  640  	if (!ras_attr_groups) {
9222ad0e3fd4c35 Shiju Jose 2025-02-12  641  		ret = -ENOMEM;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  642  		goto ctx_free;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  643  	}
9222ad0e3fd4c35 Shiju Jose 2025-02-12  644  
e777719d5bec32a Shiju Jose 2025-02-12  645  	if (scrub_cnt) {
e777719d5bec32a Shiju Jose 2025-02-12  646  		ctx->scrub = kcalloc(scrub_cnt, sizeof(*ctx->scrub), GFP_KERNEL);
e777719d5bec32a Shiju Jose 2025-02-12  647  		if (!ctx->scrub) {
e777719d5bec32a Shiju Jose 2025-02-12  648  			ret = -ENOMEM;
e777719d5bec32a Shiju Jose 2025-02-12  649  			goto groups_free;
e777719d5bec32a Shiju Jose 2025-02-12  650  		}
e777719d5bec32a Shiju Jose 2025-02-12  651  	}
e777719d5bec32a Shiju Jose 2025-02-12  652  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  653  	attr_gcnt = 0;
e777719d5bec32a Shiju Jose 2025-02-12  654  	scrub_cnt = 0;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  655  	for (feat = 0; feat < num_features; feat++, ras_features++) {
9222ad0e3fd4c35 Shiju Jose 2025-02-12  656  		switch (ras_features->ft_type) {
e777719d5bec32a Shiju Jose 2025-02-12  657  		case RAS_FEAT_SCRUB:
e777719d5bec32a Shiju Jose 2025-02-12  658  			if (!ras_features->scrub_ops ||
e777719d5bec32a Shiju Jose 2025-02-12  659  			    scrub_cnt != ras_features->instance)
e777719d5bec32a Shiju Jose 2025-02-12  660  				goto data_mem_free;
e777719d5bec32a Shiju Jose 2025-02-12  661  
e777719d5bec32a Shiju Jose 2025-02-12  662  			dev_data = &ctx->scrub[scrub_cnt];
e777719d5bec32a Shiju Jose 2025-02-12  663  			dev_data->instance = scrub_cnt;
e777719d5bec32a Shiju Jose 2025-02-12  664  			dev_data->scrub_ops = ras_features->scrub_ops;
e777719d5bec32a Shiju Jose 2025-02-12  665  			dev_data->private = ras_features->ctx;
e777719d5bec32a Shiju Jose 2025-02-12  666  			ret = edac_scrub_get_desc(parent, &ras_attr_groups[attr_gcnt],
e777719d5bec32a Shiju Jose 2025-02-12  667  						  ras_features->instance);
e777719d5bec32a Shiju Jose 2025-02-12  668  			if (ret)
e777719d5bec32a Shiju Jose 2025-02-12  669  				goto data_mem_free;
e777719d5bec32a Shiju Jose 2025-02-12  670  
e777719d5bec32a Shiju Jose 2025-02-12  671  			scrub_cnt++;
e777719d5bec32a Shiju Jose 2025-02-12  672  			attr_gcnt++;
e777719d5bec32a Shiju Jose 2025-02-12  673  			break;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  674  		default:
9222ad0e3fd4c35 Shiju Jose 2025-02-12  675  			ret = -EINVAL;
e777719d5bec32a Shiju Jose 2025-02-12  676  			goto data_mem_free;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  677  		}
9222ad0e3fd4c35 Shiju Jose 2025-02-12  678  	}
9222ad0e3fd4c35 Shiju Jose 2025-02-12  679  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  680  	ctx->dev.parent = parent;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  681  	ctx->dev.bus = edac_get_sysfs_subsys();
9222ad0e3fd4c35 Shiju Jose 2025-02-12  682  	ctx->dev.type = &edac_dev_type;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  683  	ctx->dev.groups = ras_attr_groups;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  684  	ctx->private = private;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  685  	dev_set_drvdata(&ctx->dev, ctx);
9222ad0e3fd4c35 Shiju Jose 2025-02-12  686  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  687  	ret = dev_set_name(&ctx->dev, name);
9222ad0e3fd4c35 Shiju Jose 2025-02-12  688  	if (ret)
e777719d5bec32a Shiju Jose 2025-02-12  689  		goto data_mem_free;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  690  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  691  	ret = device_register(&ctx->dev);
9222ad0e3fd4c35 Shiju Jose 2025-02-12  692  	if (ret) {
9222ad0e3fd4c35 Shiju Jose 2025-02-12  693  		put_device(&ctx->dev);
9222ad0e3fd4c35 Shiju Jose 2025-02-12  694  		return ret;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  695  	}
9222ad0e3fd4c35 Shiju Jose 2025-02-12  696  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  697  	return devm_add_action_or_reset(parent, edac_dev_unreg, &ctx->dev);
9222ad0e3fd4c35 Shiju Jose 2025-02-12  698  
e777719d5bec32a Shiju Jose 2025-02-12  699  data_mem_free:
e777719d5bec32a Shiju Jose 2025-02-12  700  	kfree(ctx->scrub);
9222ad0e3fd4c35 Shiju Jose 2025-02-12  701  groups_free:
9222ad0e3fd4c35 Shiju Jose 2025-02-12  702  	kfree(ras_attr_groups);
9222ad0e3fd4c35 Shiju Jose 2025-02-12  703  ctx_free:
9222ad0e3fd4c35 Shiju Jose 2025-02-12  704  	kfree(ctx);
9222ad0e3fd4c35 Shiju Jose 2025-02-12 @705  	return ret;

:::::: The code at line 705 was first introduced by commit
:::::: 9222ad0e3fd4c35a63e59bba1c297f13e70cdc1d EDAC: Add support for EDAC device features control

:::::: TO: Shiju Jose <shiju.jose@huawei.com>
:::::: CC: Borislav Petkov (AMD) <bp@alien8.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
