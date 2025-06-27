Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E492BAF9
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Jun 2025 19:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751050841; cv=none; b=csg5EOUlh2dJSAYitdiF4xlMcWDvb9yZjDAuJMGapM5grwaETomokhexcFSK+pwl7IsINLQAGR3OJfawvwrTvd3QYdnHGZVVamTmE3av2Z+gECSeRW3OEduNyEnZQfV/gcvUzxhSeJSZKsm7yhAFy4GIJF8Jlihb0Rxvqqk4aec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751050841; c=relaxed/simple;
	bh=yW4GlbWMeO1GeMZkgaW+8LZ8S5xhHkFo37210fDj9F4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YTUWwRqsmujwf/4nEomPqq2fckzBRoVAzneSzyBbsufrx/He8qVI7Sdkc2F5i75ibTk4iHRVtDL4YevYFy5iZroD6Gt/M7kfcnDVmBzy4WBPWGy1P8APryDXuGnRvvsPqLG2mJtA6VjWbPnAQ/jQOHBXkucNLG8reMom8yhMhFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hpTJKD5M; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpTJKD5M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751050840; x=1782586840;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yW4GlbWMeO1GeMZkgaW+8LZ8S5xhHkFo37210fDj9F4=;
  b=hpTJKD5Mi4diU2+/s2g/n52yVLavjIJoAcrKbXyRh+tXyeHaLkdCJiTR
   oN9Kc2onLkH4UKtuSDpffxxfFk3sL+Bxef738dnceO+BCLS149G3lXvvN
   QaqlraQTz7UGAFlt/RITXXAZMR6b7AlhpS4RBUh1xk5gZ/pzp4/+Kr45S
   Lm9ft4erm7q6WrXjk1i3HagzzS6k3Chv/S5v2ObstJPhJ8WHQVEkVjeYC
   bA/LDNS0HBy0XoPjwV/HOZwDE+ZriLZj1gixQhy52D5QoW+g1uhUp7/vQ
   LXoVd6ADB3vZlLMlBgt07+kwpHn2ESwHjqQ93Byi4NmPLzWe3tSU41RaI
   w==;
X-CSE-ConnectionGUID: ILiT05CTRCWbMAgCO4zOXg==
X-CSE-MsgGUID: UUbwKIaLSG6JYv8DFbjXTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="64724153"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="64724153"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 12:00:37 -0700
X-CSE-ConnectionGUID: AKaJHkJRQE+Pa2NhOwwhIw==
X-CSE-MsgGUID: nnj/LvsCQ2Wq9pdOW0Lz1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="158611669"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Jun 2025 12:00:36 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVEJM-000WTW-2b;
	Fri, 27 Jun 2025 19:00:32 +0000
Date: Sat, 28 Jun 2025 02:59:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 4/6] regulator: Add support for MediaTek MT6363 SPMI
 PMIC Regulators
Message-ID: <202506280258.somyWWgp-lkp@intel.com>
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
In-Reply-To: <20250624073548.29732-5-angelogioacchino.delregno@collabora.com>
References: <20250624073548.29732-5-angelogioacchino.delregno@collabora.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: broonie@kernel.org
CC: lgirdwood@gmail.com
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: matthias.bgg@gmail.com
CC: angelogioacchino.delregno@collabora.com
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: kernel@collabora.com

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-regulator/for-next]
[also build test WARNING on linus/master v6.16-rc3 next-20250627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-regulator-Document-MediaTek-MT6316-PMIC-Regulators/20250624-154048
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20250624073548.29732-5-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v2 4/6] regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20250627 (https://download.01.org/0day-ci/archive/20250628/202506280258.somyWWgp-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506280258.somyWWgp-lkp@intel.com/

New smatch warnings:
drivers/regulator/mt6363-regulator.c:351 mt6363_regulator_set_mode() error: uninitialized symbol 'regmap'.
drivers/regulator/mt6363-regulator.c:388 mt6363_regulator_set_mode() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/regulator/mt6363-regulator.c:367 mt6363_regulator_set_mode() error: uninitialized symbol 'regmap'.
drivers/regulator/mt6363-regulator.c:376 mt6363_regulator_set_mode() error: uninitialized symbol 'regmap'.
drivers/regulator/mt6363-regulator.c:382 mt6363_regulator_set_mode() error: uninitialized symbol 'regmap'.

vim +/regmap +351 drivers/regulator/mt6363-regulator.c

5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  341  
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  342  static int mt6363_regulator_set_mode(struct regulator_dev *rdev,
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  343  				     unsigned int mode)
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  344  {
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  345  	struct mt6363_regulator_info *info = rdev_get_drvdata(rdev);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  346  	struct regmap *regmap;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  347  	int cur_mode, ret;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  348  
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  349  	switch (mode) {
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  350  	case REGULATOR_MODE_FAST:
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24 @351  		ret = mt6363_buck_unlock(regmap, true);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  352  		if (ret)
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  353  			break;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  354  
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  355  		ret = regmap_set_bits(regmap, info->modeset_reg, info->modeset_mask);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  356  
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  357  		mt6363_buck_unlock(regmap, false);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  358  		break;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  359  	case REGULATOR_MODE_NORMAL:
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  360  		cur_mode = mt6363_regulator_get_mode(rdev);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  361  		if (cur_mode < 0) {
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  362  			ret = cur_mode;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  363  			break;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  364  		}
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  365  
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  366  		if (cur_mode == REGULATOR_MODE_FAST) {
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  367  			ret = mt6363_buck_unlock(regmap, true);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  368  			if (ret)
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  369  				break;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  370  
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  371  			ret = regmap_clear_bits(regmap, info->modeset_reg, info->modeset_mask);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  372  
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  373  			mt6363_buck_unlock(regmap, false);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  374  			break;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  375  		} else if (cur_mode == REGULATOR_MODE_IDLE) {
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  376  			ret = regmap_clear_bits(regmap, info->lp_mode_reg, info->lp_mode_mask);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  377  			if (ret == 0)
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  378  				usleep_range(100, 200);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  379  		}
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  380  		break;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  381  	case REGULATOR_MODE_IDLE:
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  382  		ret = regmap_set_bits(regmap, info->lp_mode_reg, info->lp_mode_mask);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  383  		break;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  384  	default:
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  385  		ret = -EINVAL;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  386  	}
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  387  
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24 @388  	if (ret) {
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  389  		dev_err(&rdev->dev, "Failed to set mode %u: %d\n", mode, ret);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  390  		return ret;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  391  	}
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  392  
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  393  	return 0;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  394  }
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  395  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
