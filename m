Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADDA133987
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Mar 2025 16:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742142043; cv=none; b=NdubhlW2ycsHFJ8xFPcJgs/mDCJuFkcn5DbBxuLt01hYIaj2KmlwzgqGlD+x0hSCGmL/cZFSeDSUeRxIymaz46A1FNfDjEVdjTt3YKg4QGqD2xuPwxefP+lgu6qzgJsbqJSpYBHKIT5oX5byjRA2/bUI0WLMVoOOmzQeK124GRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742142043; c=relaxed/simple;
	bh=2Sc2Xp9rEcvBs6meu7+Q3p4A4k8sWENW1EamIaYErks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GXDKWfEPblztQEUvcN15pjC/11OsFgYkCAugYRKYyUSIE+VgekcxNOCck1x/vSvDUSlRGGeva/H2S3RBGhDmM5Amesoybi8YI37pZbozHxBWnQ+WC08os7+h5ssbhDV7HvG2l8eQakF2brbuj+evsONw/W5/zcj6Kr8hJnAOfB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T7sOBxYd; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T7sOBxYd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742142041; x=1773678041;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2Sc2Xp9rEcvBs6meu7+Q3p4A4k8sWENW1EamIaYErks=;
  b=T7sOBxYd8iGW02ogQlv1Co/+7t1bdJXauDlFcSIEbO25EXKzNTVun7Jg
   fW84etHItrOxKVU+Q22I9Qr4YA/ECBrzzwZxmbuG91yA4t+VFVa6ZFN2d
   ZV01km84pYhOMirgjh8vA5fE1qLXUZTAz4AjueSaTNiRKIVZ2/JsJ/JBJ
   IGG0UbXb3LOgq2cl/SlT7c2uQh2x+s4U/a9OqShnKydTR52MYPxgjpaDV
   CwnOmEDCALQG0rLrnY19q2D5ORbCLMTBtZDh32V9wMdoPaQaszrgBCvUC
   vn+fYkBsmPH4zb/Q65JsWm2CR/MX1phCKjmO+vfEEXLj8c20A46Zl/UhM
   w==;
X-CSE-ConnectionGUID: bheYdj3wTTG0RG4Ln9ZRdA==
X-CSE-MsgGUID: FibrkLhuRPitGpNwPTzycA==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="46887175"
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="46887175"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 09:20:41 -0700
X-CSE-ConnectionGUID: StQx9bYOTjSBwAihR8Oe0w==
X-CSE-MsgGUID: 3j6267dQRZOnRvClx5ETkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="122237413"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 16 Mar 2025 09:20:40 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttqj7-000C63-1n;
	Sun, 16 Mar 2025 16:20:37 +0000
Date: Mon, 17 Mar 2025 00:19:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 6/6] clk: clk-axi-clkgen: fix coding style issues
Message-ID: <202503162319.83BPHA2N-lkp@intel.com>
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
In-Reply-To: <20250313-dev-axi-clkgen-limits-v2-6-173ae2ad6311@analog.com>
References: <20250313-dev-axi-clkgen-limits-v2-6-173ae2ad6311@analog.com>
TO: "Nuno Sá via B4 Relay" <devnull+nuno.sa.analog.com@kernel.org>
TO: linux-clk@vger.kernel.org
TO: linux-fpga@vger.kernel.org
CC: Stephen Boyd <sboyd@kernel.org>
CC: Michael Turquette <mturquette@baylibre.com>
CC: Moritz Fischer <mdf@kernel.org>
CC: Wu Hao <hao.wu@intel.com>
CC: Xu Yilun <yilun.xu@intel.com>
CC: Tom Rix <trix@redhat.com>

Hi Nuno,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 82f69876ef45ad66c0b114b786c7c6ac0f6a4580]

url:    https://github.com/intel-lab-lkp/linux/commits/Nuno-S-via-B4-Relay/clk-clk-axi-clkgen-fix-fpfd_max-frequency-for-zynq/20250313-231624
base:   82f69876ef45ad66c0b114b786c7c6ac0f6a4580
patch link:    https://lore.kernel.org/r/20250313-dev-axi-clkgen-limits-v2-6-173ae2ad6311%40analog.com
patch subject: [PATCH v2 6/6] clk: clk-axi-clkgen: fix coding style issues
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-r073-20250316 (https://download.01.org/0day-ci/archive/20250316/202503162319.83BPHA2N-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503162319.83BPHA2N-lkp@intel.com/

smatch warnings:
drivers/clk/clk-axi-clkgen.c:229 axi_clkgen_calc_clk_params() warn: add some parenthesis here?

vim +229 drivers/clk/clk-axi-clkgen.c

86378cf646d323d Lars-Peter Clausen 2020-10-01  198  
86378cf646d323d Lars-Peter Clausen 2020-10-01  199  static void axi_clkgen_calc_clk_params(unsigned int divider,
d737515c8ea3e30 Nuno Sá            2025-03-13  200  				       unsigned int frac_divider,
d737515c8ea3e30 Nuno Sá            2025-03-13  201  				       struct axi_clkgen_div_params *params)
0e646c52cf0ee18 Lars-Peter Clausen 2013-03-11  202  {
86378cf646d323d Lars-Peter Clausen 2020-10-01  203  	memset(params, 0x0, sizeof(*params));
86378cf646d323d Lars-Peter Clausen 2020-10-01  204  
86378cf646d323d Lars-Peter Clausen 2020-10-01  205  	if (divider == 1) {
86378cf646d323d Lars-Peter Clausen 2020-10-01  206  		params->nocount = 1;
86378cf646d323d Lars-Peter Clausen 2020-10-01  207  		return;
86378cf646d323d Lars-Peter Clausen 2020-10-01  208  	}
86378cf646d323d Lars-Peter Clausen 2020-10-01  209  
86378cf646d323d Lars-Peter Clausen 2020-10-01  210  	if (frac_divider == 0) {
86378cf646d323d Lars-Peter Clausen 2020-10-01  211  		params->high = divider / 2;
86378cf646d323d Lars-Peter Clausen 2020-10-01  212  		params->edge = divider % 2;
86378cf646d323d Lars-Peter Clausen 2020-10-01  213  		params->low = divider - params->high;
86378cf646d323d Lars-Peter Clausen 2020-10-01  214  	} else {
86378cf646d323d Lars-Peter Clausen 2020-10-01  215  		params->frac_en = 1;
86378cf646d323d Lars-Peter Clausen 2020-10-01  216  		params->frac = frac_divider;
86378cf646d323d Lars-Peter Clausen 2020-10-01  217  
86378cf646d323d Lars-Peter Clausen 2020-10-01  218  		params->high = divider / 2;
86378cf646d323d Lars-Peter Clausen 2020-10-01  219  		params->edge = divider % 2;
86378cf646d323d Lars-Peter Clausen 2020-10-01  220  		params->low = params->high;
86378cf646d323d Lars-Peter Clausen 2020-10-01  221  
86378cf646d323d Lars-Peter Clausen 2020-10-01  222  		if (params->edge == 0) {
86378cf646d323d Lars-Peter Clausen 2020-10-01  223  			params->high--;
86378cf646d323d Lars-Peter Clausen 2020-10-01  224  			params->frac_wf_r = 1;
86378cf646d323d Lars-Peter Clausen 2020-10-01  225  		}
86378cf646d323d Lars-Peter Clausen 2020-10-01  226  
86378cf646d323d Lars-Peter Clausen 2020-10-01  227  		if (params->edge == 0 || frac_divider == 1)
86378cf646d323d Lars-Peter Clausen 2020-10-01  228  			params->low--;
d737515c8ea3e30 Nuno Sá            2025-03-13 @229  		if ((params->edge == 0 ^ frac_divider == 1) ||
86378cf646d323d Lars-Peter Clausen 2020-10-01  230  		    (divider == 2 && frac_divider == 1))
86378cf646d323d Lars-Peter Clausen 2020-10-01  231  			params->frac_wf_f = 1;
86378cf646d323d Lars-Peter Clausen 2020-10-01  232  
86378cf646d323d Lars-Peter Clausen 2020-10-01  233  		params->frac_phase = params->edge * 4 + frac_divider / 2;
86378cf646d323d Lars-Peter Clausen 2020-10-01  234  	}
0e646c52cf0ee18 Lars-Peter Clausen 2013-03-11  235  }
0e646c52cf0ee18 Lars-Peter Clausen 2013-03-11  236  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
