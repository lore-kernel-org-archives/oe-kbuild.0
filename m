Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A4B1DF736
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 16:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765643226; cv=none; b=dU48ebu0yZ4yt5Hi7JGoMgxyOPKHn7thlrnk0fJiKUkW9bvMhfVlp+eWdegNBht1FGILkDiv3ysKvlmcHYvs9+UJ0N9SFfqfZN2QV0re/KT/BBl/064gAk7JSjVZrs2f2B5Imn1XS3yESzfn5rgPjfzd/MuAOma/OSNK0QLNmMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765643226; c=relaxed/simple;
	bh=SaF5/UCtpsM2/cPfcySfo34a13Rici6mB2M2JqPUexI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NNuvEn0UKTGcRsBwpEHvbOe//joftKU+0S7TTkIc3kjs9Otb0dxywsUF5+amr9AlFhipGQtqzQhm/4oEZz/TWe8RBWgwjB35XJoOb4OTCcqSDGhOzAjf3IHfXMmD10opiRhMK/IlYysWBjtIWlJxsHXHkASSJFLJRLeqvVaZhK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NCzDHjkF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NCzDHjkF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765643224; x=1797179224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SaF5/UCtpsM2/cPfcySfo34a13Rici6mB2M2JqPUexI=;
  b=NCzDHjkFfFdHETrjQ/OGBWhRMps+WbM7g5cfuZd1R7FG2QVZpjoBe4nM
   dpZ6E/Gl4dVozzqG5D25OPy8LSxy1rBeolp37gwNzwnYkDi95KCVd4g1s
   fBR8exr9utInrsycLLqcpX0ewP3LM+7WuKpozKpVxvv1qcUpIbmP7W1pr
   mlxrlBQJ7zy4wfy9LMTqNQlQPyad+5uhpvmCCDH4wwLuK9JgPHAd5b3xI
   vUCKsOh0VlJtTC7od8n7s2GVC+zSvwxhwffVnC9xxaylNEuxooeHklYIS
   IXzH4a7onI/NcBjyjzDTUvH/KwmiNVDNdjpDVCSF1uq+uPc1rZQWLRtNo
   Q==;
X-CSE-ConnectionGUID: Ff5KwctpReSbR4tfotGPTw==
X-CSE-MsgGUID: S7h7pHvSSriWcHfBf+/A+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="85025027"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="85025027"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 08:27:03 -0800
X-CSE-ConnectionGUID: JXA9P/kVQ22NU+GNPl+bbw==
X-CSE-MsgGUID: gggsTlS+T8WFMGBOgk/5Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="202252226"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Dec 2025 08:27:01 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUSSR-000000007uc-2ZZi;
	Sat, 13 Dec 2025 16:26:59 +0000
Date: Sun, 14 Dec 2025 00:26:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/memory/stm32_omm.c:121 stm32_omm_set_amcr() error:
 uninitialized symbol 'ret'.
Message-ID: <202512140033.jhpg6haO-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Patrice Chotard <patrice.chotard@foss.st.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d9c1cfec01cdbf24bd9322ed555713a20422115
commit: 6d8b18ae647bb456d2a2dac9771d007f243537cf memory: stm32_omm: Use syscon_regmap_lookup_by_phandle_args
date:   6 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-r073-20251212 (https://download.01.org/0day-ci/archive/20251214/202512140033.jhpg6haO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512140033.jhpg6haO-lkp@intel.com/

smatch warnings:
drivers/memory/stm32_omm.c:121 stm32_omm_set_amcr() error: uninitialized symbol 'ret'.

vim +/ret +121 drivers/memory/stm32_omm.c

8181d061dcff14 Patrice Chotard     2025-04-28   40  
8181d061dcff14 Patrice Chotard     2025-04-28   41  static int stm32_omm_set_amcr(struct device *dev, bool set)
8181d061dcff14 Patrice Chotard     2025-04-28   42  {
8181d061dcff14 Patrice Chotard     2025-04-28   43  	struct stm32_omm *omm = dev_get_drvdata(dev);
8181d061dcff14 Patrice Chotard     2025-04-28   44  	resource_size_t mm_ospi2_size = 0;
8181d061dcff14 Patrice Chotard     2025-04-28   45  	static const char * const mm_name[] = { "ospi1", "ospi2" };
8181d061dcff14 Patrice Chotard     2025-04-28   46  	struct regmap *syscfg_regmap;
8181d061dcff14 Patrice Chotard     2025-04-28   47  	struct device_node *node;
8181d061dcff14 Patrice Chotard     2025-04-28   48  	struct resource res, res1;
6d8b18ae647bb4 Krzysztof Kozlowski 2025-05-25   49  	unsigned int syscon_args[2];
8181d061dcff14 Patrice Chotard     2025-04-28   50  	int ret, idx;
8181d061dcff14 Patrice Chotard     2025-04-28   51  	unsigned int i, amcr, read_amcr;
8181d061dcff14 Patrice Chotard     2025-04-28   52  
8181d061dcff14 Patrice Chotard     2025-04-28   53  	for (i = 0; i < omm->nb_child; i++) {
8181d061dcff14 Patrice Chotard     2025-04-28   54  		idx = of_property_match_string(dev->of_node,
8181d061dcff14 Patrice Chotard     2025-04-28   55  					       "memory-region-names",
8181d061dcff14 Patrice Chotard     2025-04-28   56  					       mm_name[i]);
8181d061dcff14 Patrice Chotard     2025-04-28   57  		if (idx < 0)
8181d061dcff14 Patrice Chotard     2025-04-28   58  			continue;
8181d061dcff14 Patrice Chotard     2025-04-28   59  
8181d061dcff14 Patrice Chotard     2025-04-28   60  		/* res1 only used on second loop iteration */
8181d061dcff14 Patrice Chotard     2025-04-28   61  		res1.start = res.start;
8181d061dcff14 Patrice Chotard     2025-04-28   62  		res1.end = res.end;
8181d061dcff14 Patrice Chotard     2025-04-28   63  
8181d061dcff14 Patrice Chotard     2025-04-28   64  		node = of_parse_phandle(dev->of_node, "memory-region", idx);
8181d061dcff14 Patrice Chotard     2025-04-28   65  		if (!node)
8181d061dcff14 Patrice Chotard     2025-04-28   66  			continue;
8181d061dcff14 Patrice Chotard     2025-04-28   67  
8181d061dcff14 Patrice Chotard     2025-04-28   68  		ret = of_address_to_resource(node, 0, &res);
8181d061dcff14 Patrice Chotard     2025-04-28   69  		if (ret) {
8181d061dcff14 Patrice Chotard     2025-04-28   70  			of_node_put(node);
8181d061dcff14 Patrice Chotard     2025-04-28   71  			dev_err(dev, "unable to resolve memory region\n");
8181d061dcff14 Patrice Chotard     2025-04-28   72  			return ret;
8181d061dcff14 Patrice Chotard     2025-04-28   73  		}
8181d061dcff14 Patrice Chotard     2025-04-28   74  
8181d061dcff14 Patrice Chotard     2025-04-28   75  		/* check that memory region fits inside OMM memory map area */
8181d061dcff14 Patrice Chotard     2025-04-28   76  		if (!resource_contains(omm->mm_res, &res)) {
8181d061dcff14 Patrice Chotard     2025-04-28   77  			dev_err(dev, "%s doesn't fit inside OMM memory map area\n",
8181d061dcff14 Patrice Chotard     2025-04-28   78  				mm_name[i]);
8181d061dcff14 Patrice Chotard     2025-04-28   79  			dev_err(dev, "%pR doesn't fit inside %pR\n", &res, omm->mm_res);
8181d061dcff14 Patrice Chotard     2025-04-28   80  			of_node_put(node);
8181d061dcff14 Patrice Chotard     2025-04-28   81  
8181d061dcff14 Patrice Chotard     2025-04-28   82  			return -EFAULT;
8181d061dcff14 Patrice Chotard     2025-04-28   83  		}
8181d061dcff14 Patrice Chotard     2025-04-28   84  
8181d061dcff14 Patrice Chotard     2025-04-28   85  		if (i == 1) {
8181d061dcff14 Patrice Chotard     2025-04-28   86  			mm_ospi2_size = resource_size(&res);
8181d061dcff14 Patrice Chotard     2025-04-28   87  
8181d061dcff14 Patrice Chotard     2025-04-28   88  			/* check that OMM memory region 1 doesn't overlap memory region 2 */
8181d061dcff14 Patrice Chotard     2025-04-28   89  			if (resource_overlaps(&res, &res1)) {
8181d061dcff14 Patrice Chotard     2025-04-28   90  				dev_err(dev, "OMM memory-region %s overlaps memory region %s\n",
8181d061dcff14 Patrice Chotard     2025-04-28   91  					mm_name[0], mm_name[1]);
8181d061dcff14 Patrice Chotard     2025-04-28   92  				dev_err(dev, "%pR overlaps %pR\n", &res1, &res);
8181d061dcff14 Patrice Chotard     2025-04-28   93  				of_node_put(node);
8181d061dcff14 Patrice Chotard     2025-04-28   94  
8181d061dcff14 Patrice Chotard     2025-04-28   95  				return -EFAULT;
8181d061dcff14 Patrice Chotard     2025-04-28   96  			}
8181d061dcff14 Patrice Chotard     2025-04-28   97  		}
8181d061dcff14 Patrice Chotard     2025-04-28   98  		of_node_put(node);
8181d061dcff14 Patrice Chotard     2025-04-28   99  	}
8181d061dcff14 Patrice Chotard     2025-04-28  100  
6d8b18ae647bb4 Krzysztof Kozlowski 2025-05-25  101  	syscfg_regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "st,syscfg-amcr",
6d8b18ae647bb4 Krzysztof Kozlowski 2025-05-25  102  							     2, syscon_args);
8181d061dcff14 Patrice Chotard     2025-04-28  103  	if (IS_ERR(syscfg_regmap))
8181d061dcff14 Patrice Chotard     2025-04-28  104  		return dev_err_probe(dev, PTR_ERR(syscfg_regmap),
8181d061dcff14 Patrice Chotard     2025-04-28  105  				     "Failed to get st,syscfg-amcr property\n");
8181d061dcff14 Patrice Chotard     2025-04-28  106  
8181d061dcff14 Patrice Chotard     2025-04-28  107  	amcr = mm_ospi2_size / SZ_64M;
8181d061dcff14 Patrice Chotard     2025-04-28  108  
8181d061dcff14 Patrice Chotard     2025-04-28  109  	if (set)
6d8b18ae647bb4 Krzysztof Kozlowski 2025-05-25  110  		regmap_update_bits(syscfg_regmap, syscon_args[0], syscon_args[1], amcr);
8181d061dcff14 Patrice Chotard     2025-04-28  111  
8181d061dcff14 Patrice Chotard     2025-04-28  112  	/* read AMCR and check coherency with memory-map areas defined in DT */
6d8b18ae647bb4 Krzysztof Kozlowski 2025-05-25  113  	regmap_read(syscfg_regmap, syscon_args[0], &read_amcr);
6d8b18ae647bb4 Krzysztof Kozlowski 2025-05-25  114  	read_amcr = read_amcr >> (ffs(syscon_args[1]) - 1);
8181d061dcff14 Patrice Chotard     2025-04-28  115  
8181d061dcff14 Patrice Chotard     2025-04-28  116  	if (amcr != read_amcr) {
8181d061dcff14 Patrice Chotard     2025-04-28  117  		dev_err(dev, "AMCR value not coherent with DT memory-map areas\n");
8181d061dcff14 Patrice Chotard     2025-04-28  118  		ret = -EINVAL;
8181d061dcff14 Patrice Chotard     2025-04-28  119  	}
8181d061dcff14 Patrice Chotard     2025-04-28  120  
8181d061dcff14 Patrice Chotard     2025-04-28 @121  	return ret;
8181d061dcff14 Patrice Chotard     2025-04-28  122  }
8181d061dcff14 Patrice Chotard     2025-04-28  123  

:::::: The code at line 121 was first introduced by commit
:::::: 8181d061dcff140fd5a40e568d8adb81f1403a28 memory: Add STM32 Octo Memory Manager driver

:::::: TO: Patrice Chotard <patrice.chotard@foss.st.com>
:::::: CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
