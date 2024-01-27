Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5330D21A09
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Jan 2024 12:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706360157; cv=none; b=UNoD8xR0uDJFfOcgSPuJfGMq5jvel5ZmHcHyZMCxn8nsRD/Q5+xK+FSEGTtvgFM3VJuClyotg/avjYxs/kVABpgALwIbCtr4CCozGTVuwIiP2KIRaQQ8PX+sbwm6Hs+X27IoXoq/ua+fX5reyto1LSFhKaet5Wzd8sC/c2Bd6Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706360157; c=relaxed/simple;
	bh=aVhsn7SdCNF/Cfwu46iBHELtXc8EbpKIDhCLcVe+Csg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AWAvW6mTQGbTqkNTd1OOkzX+XfunrzwIw8ZfuTVIk1PF1+KoHxHYcaq6bh/Dm94DjgL7czKy+bnQ9KxwWFzi637AwkBR7Uesq9cxNMc2k5fKnqix5gRNIfvJ8+pZeHabz/+vX1yBD76WUUWmY2FN7RN9HRe81LSQioPaAQ29U90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=flEZEgTI; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="flEZEgTI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706360155; x=1737896155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aVhsn7SdCNF/Cfwu46iBHELtXc8EbpKIDhCLcVe+Csg=;
  b=flEZEgTIxy1mVIjTjfgBX2kGmDpk4gF+A7r1uSBIJ4QKZOowu0Gn4kHF
   +sLcYJxsIs1XIPgBETHu4GXCQjRW3qm2aVt15lt5/6q6THFIpgaqJT8/W
   BSgZGXvNvLoqvUQq52sVHnG5OLzOlMOQOniwPknYeHUyeAkQw1/z+kiim
   jUl+rsBVK0SIkVUjXw6U8X+vFPEzCjKf3hy1Tn+5dslejcnLARMOGFRX6
   pEk6eIfdniDIms9sV06U6yLUamuk+hEiNnfaWa+d1nQsk32A/ARO/QcPz
   f5BnN1ZuOt/WDRO0Zlh4/rdFUMoyVDTdftHGJlIiEqNllqvm3Iq5xqyk/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="393108446"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="393108446"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 04:55:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="21635526"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jan 2024 04:55:53 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTiDv-0002KQ-1F;
	Sat, 27 Jan 2024 12:55:51 +0000
Date: Sat, 27 Jan 2024 20:55:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/regulator/mt6370-regulator.c:310:8-33: WARNING: Threaded IRQ
 with no primary handler requested without IRQF_ONESHOT (unless it is nested
 IRQ)
Message-ID: <202401272003.OI8Lgs4X-lkp@intel.com>
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
CC: Lee Jones <lee@kernel.org>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: ChiaEn Wu <chiaen_wu@richtek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3a5879d495b226d0404098e3564462d5f1daa33b
commit: b2adf788e6037cea0109313934f432f458190992 mfd: mt6370: Add MediaTek MT6370 support
date:   1 year, 4 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 1 year, 4 months ago
config: arm-randconfig-r062-20240117 (https://download.01.org/0day-ci/archive/20240127/202401272003.OI8Lgs4X-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401272003.OI8Lgs4X-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/regulator/mt6370-regulator.c:310:8-33: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +310 drivers/regulator/mt6370-regulator.c

8171c93bac1bf9 ChiYuan Huang 2022-06-23  286  
8171c93bac1bf9 ChiYuan Huang 2022-06-23  287  static int mt6370_regulator_irq_register(struct mt6370_priv *priv)
8171c93bac1bf9 ChiYuan Huang 2022-06-23  288  {
8171c93bac1bf9 ChiYuan Huang 2022-06-23  289  	struct platform_device *pdev = to_platform_device(priv->dev);
8171c93bac1bf9 ChiYuan Huang 2022-06-23  290  	static const struct {
8171c93bac1bf9 ChiYuan Huang 2022-06-23  291  		const char *name;
8171c93bac1bf9 ChiYuan Huang 2022-06-23  292  		int rid;
8171c93bac1bf9 ChiYuan Huang 2022-06-23  293  		irq_handler_t handler;
8171c93bac1bf9 ChiYuan Huang 2022-06-23  294  	} mt6370_irqs[] = {
8171c93bac1bf9 ChiYuan Huang 2022-06-23  295  		{ "db_vpos_scp", MT6370_IDX_DSVPOS, mt6370_scp_handler },
8171c93bac1bf9 ChiYuan Huang 2022-06-23  296  		{ "db_vneg_scp", MT6370_IDX_DSVNEG, mt6370_scp_handler },
8171c93bac1bf9 ChiYuan Huang 2022-06-23  297  		{ "db_vbst_ocp", MT6370_IDX_DSVBOOST, mt6370_ocp_handler },
8171c93bac1bf9 ChiYuan Huang 2022-06-23  298  		{ "db_vpos_ocp", MT6370_IDX_DSVPOS,  mt6370_ocp_handler },
8171c93bac1bf9 ChiYuan Huang 2022-06-23  299  		{ "db_vneg_ocp", MT6370_IDX_DSVNEG, mt6370_ocp_handler },
8171c93bac1bf9 ChiYuan Huang 2022-06-23  300  		{ "ldo_oc", MT6370_IDX_VIBLDO, mt6370_ocp_handler }
8171c93bac1bf9 ChiYuan Huang 2022-06-23  301  	};
8171c93bac1bf9 ChiYuan Huang 2022-06-23  302  	struct regulator_dev *rdev;
8171c93bac1bf9 ChiYuan Huang 2022-06-23  303  	int i, irq, ret;
8171c93bac1bf9 ChiYuan Huang 2022-06-23  304  
8171c93bac1bf9 ChiYuan Huang 2022-06-23  305  	for (i = 0; i < ARRAY_SIZE(mt6370_irqs); i++) {
8171c93bac1bf9 ChiYuan Huang 2022-06-23  306  		irq = platform_get_irq_byname(pdev, mt6370_irqs[i].name);
8171c93bac1bf9 ChiYuan Huang 2022-06-23  307  
8171c93bac1bf9 ChiYuan Huang 2022-06-23  308  		rdev = priv->rdev[mt6370_irqs[i].rid];
8171c93bac1bf9 ChiYuan Huang 2022-06-23  309  
8171c93bac1bf9 ChiYuan Huang 2022-06-23 @310  		ret = devm_request_threaded_irq(priv->dev, irq, NULL,
8171c93bac1bf9 ChiYuan Huang 2022-06-23  311  						mt6370_irqs[i].handler, 0,
8171c93bac1bf9 ChiYuan Huang 2022-06-23  312  						mt6370_irqs[i].name, rdev);
8171c93bac1bf9 ChiYuan Huang 2022-06-23  313  		if (ret) {
8171c93bac1bf9 ChiYuan Huang 2022-06-23  314  			dev_err(priv->dev,
8171c93bac1bf9 ChiYuan Huang 2022-06-23  315  				"Failed to register (%d) interrupt\n", i);
8171c93bac1bf9 ChiYuan Huang 2022-06-23  316  			return ret;
8171c93bac1bf9 ChiYuan Huang 2022-06-23  317  		}
8171c93bac1bf9 ChiYuan Huang 2022-06-23  318  	}
8171c93bac1bf9 ChiYuan Huang 2022-06-23  319  
8171c93bac1bf9 ChiYuan Huang 2022-06-23  320  	return 0;
8171c93bac1bf9 ChiYuan Huang 2022-06-23  321  }
8171c93bac1bf9 ChiYuan Huang 2022-06-23  322  

:::::: The code at line 310 was first introduced by commit
:::::: 8171c93bac1bf9e98269b2efb19ef4e6c4e55ed7 regulator: mt6370: Add mt6370 DisplayBias and VibLDO support

:::::: TO: ChiYuan Huang <cy_huang@richtek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
