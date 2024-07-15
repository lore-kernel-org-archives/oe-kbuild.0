Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F855F9EC
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Jul 2024 15:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721058012; cv=none; b=TTSrTYZhfY0+n0khS+zaSpKYKCBSiF+X3de1KnjUJQc/rxutp5vPH2SgAMNLoUu+DJkGMZJ1ff5uITlhP7OMaQYgxZ42UlDZebBxoH8CQvXZSbRJa/+HKm4G+6zMZjJe4KixNr4B+TwLsTvf1JmeRJxZ67e0/ZIyqxLGpqAKup8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721058012; c=relaxed/simple;
	bh=7EHLMi4TS4apdVEJyTC/LNFmawobmpiRdBxflZc7Fcg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V817FwPGxx0c153ZG1Iwx+oc1zSLBbrycQJHTuGAsjjwZ8H/XLc61ibi2Wg7M7DDRqey8oNN+O1IHKRX5dGNwGZ5PZmZIfi0kj0wB9XoojFwvtW9nS2oaLEHzLRlokDeG12Qnwma/HSnka0GhaSfcc5GpaN2lL3B/K8sQCpoxV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AWFilVJv; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AWFilVJv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721058011; x=1752594011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7EHLMi4TS4apdVEJyTC/LNFmawobmpiRdBxflZc7Fcg=;
  b=AWFilVJvfoCqSM8Hb4DHHtUCyj/yAsX/AUKz7aKuR9mXlbnH2bMdNjYX
   rX+FJsRIsTRbhKuLlM85vC7L66hcQF7sQSRFW08uLpmRgz69zUsE2v7UJ
   HC7IBWzdbOot67dVbkgskDp+7pb41A7YVJ/Sucp2m9W6+RLyd4BFT0li+
   pAfJJcT9oc5daCq7DjyBMzRCTiQUCKFQol3OuZFIs1PwB7urCn15/DvRs
   ZNBiYu1/hU/vlWri1pNI5W6SzH2FOFkS0HEqSOKdUanx0yjw8D887N1i2
   IiC8JpHcioVKdk++y0zqIxBHFGJPhkvEC0q7V65qAHcrs/nex5i8+rBRk
   A==;
X-CSE-ConnectionGUID: ln70rcTqTtqijAiitSWRLQ==
X-CSE-MsgGUID: 7Xc0lKFJQp24N0rBjbxwCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="22211350"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; 
   d="scan'208";a="22211350"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 08:40:10 -0700
X-CSE-ConnectionGUID: qM5YGAIfSjC9EwgI9cIiEQ==
X-CSE-MsgGUID: pBQFVMonTAKFxsdYD9k5bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; 
   d="scan'208";a="54028521"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Jul 2024 08:40:09 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTNo6-000eME-1l;
	Mon, 15 Jul 2024 15:40:06 +0000
Date: Mon, 15 Jul 2024 23:39:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v2 4/4] clk: samsung: add top clock support for Exynos
 Auto v920 SoC
Message-ID: <202407152320.DENx7dJa-lkp@intel.com>
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
In-Reply-To: <20240707231331.3433340-5-sunyeal.hong@samsung.com>
References: <20240707231331.3433340-5-sunyeal.hong@samsung.com>
TO: Sunyeal Hong <sunyeal.hong@samsung.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Sylwester Nawrocki <s.nawrocki@samsung.com>
TO: Chanwoo Choi <cw00.choi@samsung.com>
TO: Alim Akhtar <alim.akhtar@samsung.com>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-samsung-soc@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Sunyeal Hong <sunyeal.hong@samsung.com>

Hi Sunyeal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on pinctrl-samsung/for-next krzk-dt/for-next linus/master v6.10 next-20240715]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sunyeal-Hong/dt-bindings-clock-add-Exynos-Auto-v920-SoC-CMU-bindings/20240708-072150
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20240707231331.3433340-5-sunyeal.hong%40samsung.com
patch subject: [PATCH v2 4/4] clk: samsung: add top clock support for Exynos Auto v920 SoC
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arc-randconfig-r052-20240715 (https://download.01.org/0day-ci/archive/20240715/202407152320.DENx7dJa-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202407152320.DENx7dJa-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/samsung/clk-exynosautov920.c:1157:1-2: exynosautov920_cmu_of_match is not NULL terminated at line 1157

vim +1157 drivers/clk/samsung/clk-exynosautov920.c

dfe510511cb669 Sunyeal Hong 2024-07-08  1152  
dfe510511cb669 Sunyeal Hong 2024-07-08  1153  static const struct of_device_id exynosautov920_cmu_of_match[] = {
dfe510511cb669 Sunyeal Hong 2024-07-08  1154  	{
dfe510511cb669 Sunyeal Hong 2024-07-08  1155  		.compatible = "samsung,exynosautov920-cmu-peric0",
dfe510511cb669 Sunyeal Hong 2024-07-08  1156  		.data = &peric0_cmu_info,
dfe510511cb669 Sunyeal Hong 2024-07-08 @1157  	},
dfe510511cb669 Sunyeal Hong 2024-07-08  1158  };
dfe510511cb669 Sunyeal Hong 2024-07-08  1159  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
