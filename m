Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38991F6687
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Jan 2025 08:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737102133; cv=none; b=TlUb6qgjM0KbGNixht7L/5NxLgCluPyeyck6k3l2efKGW5/hUrepk7gRP5rOCDv1XJqhAwNsLBhYQrqG9KlhJjEqkx10va/RKaMtpq7qpmejhUpnbAJZq142G5Bit5JVx8QEuj0MJ3SNhK+4DOhjaqPqI6szS2NT+0JDoEEr2UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737102133; c=relaxed/simple;
	bh=2mj44huz4Im1bKXQw73qJUL7mbmtcODYxP0OHaMh9R0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=crBICmylrWNA2by6ytr2X6d8ki31ioovEUKjB51fQ9ruymz4gcCdkkH9KfLIOouWkFCwnA/qmthFyK2wdBJLvqoGKsxYRfUxXDEiy/6hMhYoK3nZfGHNFHYT7ohcrngbfpIy6nbYmzFa9XKnQbEFJvPPYd8jnpLS/zAyi9gWHvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c68Fopx9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c68Fopx9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737102132; x=1768638132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2mj44huz4Im1bKXQw73qJUL7mbmtcODYxP0OHaMh9R0=;
  b=c68Fopx9joL8rSqluPOckEKtQxQBKViiRVyUaviOIut5HIT4tpww1WuJ
   kAfXXVJBbLqxcMEU2vi2f3LWoozmKT6pn6dkyoBSZ29MTPBwj+I7vqRnq
   678ml+o5ObBH5QN2XR8niRQWgtNbS3cn21QodRIrrK9Q8AFbGpvvhT40s
   6wY6YZ/mP/0PlJQliaXgHQwAJEXDP8BRiHPS8jUcgfEcHCDh6SWHEP59Q
   nL9KMFWbqmGeRVGSBzPxkBP0YPYHiO8HkjUz6lULnYGkel/IHIHb3+b4E
   gAqpubYKjsJINVav+XWhQcXVdL91/zL9um5BkB/9svXdokmWk+4121wEs
   Q==;
X-CSE-ConnectionGUID: AsOkQJuXTCOqFrrJxO+13w==
X-CSE-MsgGUID: zLmEo7svQ1uhJ0hyxqVImA==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="36807216"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="36807216"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 00:22:11 -0800
X-CSE-ConnectionGUID: l5aBZ9ZLT+CMivU464xSTg==
X-CSE-MsgGUID: cyFuj0WBQgyuE3VF7J8oIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="110752050"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jan 2025 00:22:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYhcF-000SxL-2F;
	Fri, 17 Jan 2025 08:22:07 +0000
Date: Fri, 17 Jan 2025 16:21:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] phy: stm32: Optimize tuning values from DT.
Message-ID: <202501171619.0XDYDyBZ-lkp@intel.com>
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
In-Reply-To: <20250113092001.1344151-1-christian.bruel@foss.st.com>
References: <20250113092001.1344151-1-christian.bruel@foss.st.com>
TO: Christian Bruel <christian.bruel@foss.st.com>
TO: vkoul@kernel.org
TO: kishon@kernel.org
TO: mcoquelin.stm32@gmail.com
TO: alexandre.torgue@foss.st.com
TO: p.zabel@pengutronix.de
TO: linux-phy@lists.infradead.org
TO: linux-stm32@st-md-mailman.stormreply.com
TO: linux-arm-kernel@lists.infradead.org
TO: linux-kernel@vger.kernel.org
TO: fabrice.gasnier@foss.st.com
CC: Christian Bruel <christian.bruel@foss.st.com>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.13-rc7]
[also build test WARNING on linus/master next-20250116]
[cannot apply to atorgue-stm32/stm32-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Bruel/phy-stm32-Optimize-tuning-values-from-DT/20250113-172435
base:   v6.13-rc7
patch link:    https://lore.kernel.org/r/20250113092001.1344151-1-christian.bruel%40foss.st.com
patch subject: [PATCH v2] phy: stm32: Optimize tuning values from DT.
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-r071-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171619.0XDYDyBZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501171619.0XDYDyBZ-lkp@intel.com/

New smatch warnings:
drivers/phy/st/phy-stm32-combophy.c:147 stm32_impedance_tune() error: buffer overflow 'imp_lookup' 8 <= 8 (assuming for loop doesn't break)
drivers/phy/st/phy-stm32-combophy.c:564 stm32_combophy_probe() warn: passing zero to 'dev_err_probe'

Old smatch warnings:
drivers/phy/st/phy-stm32-combophy.c:569 stm32_combophy_probe() warn: passing zero to 'dev_err_probe'

vim +147 drivers/phy/st/phy-stm32-combophy.c

47e1bb6b4ba098 Christian Bruel 2024-09-30  118  
31219ca5436f01 Christian Bruel 2025-01-13  119  static void stm32_impedance_tune(struct stm32_combophy *combophy)
47e1bb6b4ba098 Christian Bruel 2024-09-30  120  {
47e1bb6b4ba098 Christian Bruel 2024-09-30  121  	u8 imp_of, vswing_of;
2de679ecd724b8 Arnd Bergmann   2024-11-11  122  	u32 regval;
47e1bb6b4ba098 Christian Bruel 2024-09-30  123  
31219ca5436f01 Christian Bruel 2025-01-13  124  	if (combophy->microohm) {
2de679ecd724b8 Arnd Bergmann   2024-11-11  125  		regval = 0;
2de679ecd724b8 Arnd Bergmann   2024-11-11  126  		for (imp_of = 0; imp_of < ARRAY_SIZE(imp_lookup); imp_of++) {
31219ca5436f01 Christian Bruel 2025-01-13  127  			if (imp_lookup[imp_of].microohm <= combophy->microohm) {
2de679ecd724b8 Arnd Bergmann   2024-11-11  128  				regval = FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_OHM, imp_of);
47e1bb6b4ba098 Christian Bruel 2024-09-30  129  				break;
2de679ecd724b8 Arnd Bergmann   2024-11-11  130  			}
2de679ecd724b8 Arnd Bergmann   2024-11-11  131  		}
47e1bb6b4ba098 Christian Bruel 2024-09-30  132  
47e1bb6b4ba098 Christian Bruel 2024-09-30  133  		dev_dbg(combophy->dev, "Set %u micro-ohms output impedance\n",
47e1bb6b4ba098 Christian Bruel 2024-09-30  134  			imp_lookup[imp_of].microohm);
47e1bb6b4ba098 Christian Bruel 2024-09-30  135  
47e1bb6b4ba098 Christian Bruel 2024-09-30  136  		regmap_update_bits(combophy->regmap, SYSCFG_PCIEPRGCR,
47e1bb6b4ba098 Christian Bruel 2024-09-30  137  				   STM32MP25_PCIEPRG_IMPCTRL_OHM,
2de679ecd724b8 Arnd Bergmann   2024-11-11  138  				   regval);
47e1bb6b4ba098 Christian Bruel 2024-09-30  139  	} else {
31219ca5436f01 Christian Bruel 2025-01-13  140  		/* default is 50 ohm */
31219ca5436f01 Christian Bruel 2025-01-13  141  		imp_of = 3;
47e1bb6b4ba098 Christian Bruel 2024-09-30  142  	}
47e1bb6b4ba098 Christian Bruel 2024-09-30  143  
31219ca5436f01 Christian Bruel 2025-01-13  144  	if (combophy->microvolt) {
2de679ecd724b8 Arnd Bergmann   2024-11-11  145  		regval = 0;
2de679ecd724b8 Arnd Bergmann   2024-11-11  146  		for (vswing_of = 0; vswing_of < ARRAY_SIZE(imp_lookup[imp_of].vswing); vswing_of++) {
31219ca5436f01 Christian Bruel 2025-01-13 @147  			if (imp_lookup[imp_of].vswing[vswing_of] >= combophy->microvolt) {
2de679ecd724b8 Arnd Bergmann   2024-11-11  148  				regval = FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_VSWING, vswing_of);
47e1bb6b4ba098 Christian Bruel 2024-09-30  149  				break;
2de679ecd724b8 Arnd Bergmann   2024-11-11  150  			}
2de679ecd724b8 Arnd Bergmann   2024-11-11  151  		}
47e1bb6b4ba098 Christian Bruel 2024-09-30  152  
47e1bb6b4ba098 Christian Bruel 2024-09-30  153  		dev_dbg(combophy->dev, "Set %u microvolt swing\n",
47e1bb6b4ba098 Christian Bruel 2024-09-30  154  			 imp_lookup[imp_of].vswing[vswing_of]);
47e1bb6b4ba098 Christian Bruel 2024-09-30  155  
47e1bb6b4ba098 Christian Bruel 2024-09-30  156  		regmap_update_bits(combophy->regmap, SYSCFG_PCIEPRGCR,
47e1bb6b4ba098 Christian Bruel 2024-09-30  157  				   STM32MP25_PCIEPRG_IMPCTRL_VSWING,
2de679ecd724b8 Arnd Bergmann   2024-11-11  158  				   regval);
47e1bb6b4ba098 Christian Bruel 2024-09-30  159  	}
47e1bb6b4ba098 Christian Bruel 2024-09-30  160  }
47e1bb6b4ba098 Christian Bruel 2024-09-30  161  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
