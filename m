Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0602C2E1758
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jan 2026 09:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768555615; cv=none; b=X0m6bI3EJwlJOmwl1Qq0D3brp1E6dDE4cgSGWe7EYrthDkHyeQo+VVQKWlyZoJz0QHm+xtlDibF/AA3vLGhGFW5ZRO2fzeM+iuJv3jlTwO+qvW6ZYXu8PDu77lWv7jpv8qJJixTAZEe7jDSrML7Ud6t/agGaH5x1ND3JUREnBpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768555615; c=relaxed/simple;
	bh=+g06s6GxQ8nM5DE8djHLTzSqYl65t8uuiqUZE5SbmnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UA+NQIMOAXelPyeNzggd1UPDFMmgBJZvkvQAehpkk2zj5GJ04zKUac68CRXLZ6cOc0lUleMFjHDti4bfDozi59p+fLvuZRiliJSFLPfUqcYzLaoVcGSjGZXxANp0MGa28LCNjQdZi8MioLsjE9DwgJN02r2QU9Bm3ok86r4RXC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ExYNV7KL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ExYNV7KL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768555613; x=1800091613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+g06s6GxQ8nM5DE8djHLTzSqYl65t8uuiqUZE5SbmnI=;
  b=ExYNV7KLbWHwKq+8hzPSDki1Gwyd2bousNTUP3Je6ePO5cUJxD5S/qbC
   LHdj7Q+Zlm2NXWJPA7VQczf8em5rz0ME7j9IdFDlIKZkl7TZ6Iz25Nhp1
   mCXPMw/DlTjJhDwtn011c215D+UVLsRAbVlLY5TXyJz56wfxCRoh9tK7Y
   HimSA06qeicd8CUu+xrvjjJzRAzEzHCz+TNcrgW4+Xslml0S9gMBKGo8i
   GOFDneUnr+1/pQ9Iy5Z+0KeZspnLfM2djiuiuV4JSV7l3cc69TMABHzxp
   OiNbe3rma9z07wSSHIEyyLQy5EcpKtOhMRLjeA7JTEj6dOGEailUD5UK0
   g==;
X-CSE-ConnectionGUID: 7oa9IV0oR6KTiGrGrLKgpQ==
X-CSE-MsgGUID: aNPkkENHRbmyNtcYh4MPqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69960608"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="69960608"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 01:26:52 -0800
X-CSE-ConnectionGUID: 5ST9UXV/TJKdHNbM0AtgnQ==
X-CSE-MsgGUID: rZz6QYq2SoicManIzimYmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="204341582"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Jan 2026 01:26:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgg6S-00000000Kee-1uyi;
	Fri, 16 Jan 2026 09:26:48 +0000
Date: Fri, 16 Jan 2026 17:26:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/8] clk: tenstorrent: Add Atlantis clock controller
 driver
Message-ID: <202601161715.E6hA3NGi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/tenstorrent/atlantis-ccu.c:930:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260115-atlantis-clocks-v1-3-7356e671f28b@oss.tenstorrent.com>
References: <20260115-atlantis-clocks-v1-3-7356e671f28b@oss.tenstorrent.com>
TO: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
TO: Drew Fustini <dfustini@oss.tenstorrent.com>
TO: Joel Stanley <jms@oss.tenstorrent.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
TO: Philipp Zabel <p.zabel@pengutronix.de>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: joel@jms.id.au
CC: fustini@kernel.org
CC: mpe@kernel.org
CC: mpe@oss.tenstorrent.com
CC: npiggin@oss.tenstorrent.com
CC: agross@kernel.org
CC: agross@oss.tenstorrent.com

Hi Anirudh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9448598b22c50c8a5bb77a9103e2d49f134c9578]

url:    https://github.com/intel-lab-lkp/linux/commits/Anirudh-Srinivasan/dt-bindings-soc-tenstorrent-Add-tenstorrent-atlantis-syscon/20260116-074618
base:   9448598b22c50c8a5bb77a9103e2d49f134c9578
patch link:    https://lore.kernel.org/r/20260115-atlantis-clocks-v1-3-7356e671f28b%40oss.tenstorrent.com
patch subject: [PATCH 3/8] clk: tenstorrent: Add Atlantis clock controller driver
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: csky-randconfig-r131-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161715.E6hA3NGi-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161715.E6hA3NGi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601161715.E6hA3NGi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/clk/tenstorrent/atlantis-ccu.c:744:25: sparse: sparse: typename in expression
   drivers/clk/tenstorrent/atlantis-ccu.c:744:32: sparse: sparse: Expected ; at end of statement
   drivers/clk/tenstorrent/atlantis-ccu.c:744:32: sparse: sparse: got atlantis_clk_mux
   drivers/clk/tenstorrent/atlantis-ccu.c:783:25: sparse: sparse: typename in expression
   drivers/clk/tenstorrent/atlantis-ccu.c:783:32: sparse: sparse: Expected ; at end of statement
   drivers/clk/tenstorrent/atlantis-ccu.c:783:32: sparse: sparse: got atlantis_clk_divider
   drivers/clk/tenstorrent/atlantis-ccu.c:801:25: sparse: sparse: typename in expression
   drivers/clk/tenstorrent/atlantis-ccu.c:801:32: sparse: sparse: Expected ; at end of statement
   drivers/clk/tenstorrent/atlantis-ccu.c:801:32: sparse: sparse: got atlantis_clk_gate
   drivers/clk/tenstorrent/atlantis-ccu.c:818:25: sparse: sparse: typename in expression
   drivers/clk/tenstorrent/atlantis-ccu.c:818:32: sparse: sparse: Expected ; at end of statement
   drivers/clk/tenstorrent/atlantis-ccu.c:818:32: sparse: sparse: got atlantis_clk_fixed_factor
   drivers/clk/tenstorrent/atlantis-ccu.c:840:25: sparse: sparse: typename in expression
   drivers/clk/tenstorrent/atlantis-ccu.c:840:32: sparse: sparse: Expected ; at end of statement
   drivers/clk/tenstorrent/atlantis-ccu.c:840:32: sparse: sparse: got atlantis_clk_gate_shared
>> drivers/clk/tenstorrent/atlantis-ccu.c:930:1: sparse: sparse: bad integer constant expression
   drivers/clk/tenstorrent/atlantis-ccu.c:930:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/clk/tenstorrent/atlantis-ccu.c:931:1: sparse: sparse: bad integer constant expression
   drivers/clk/tenstorrent/atlantis-ccu.c:931:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/clk/tenstorrent/atlantis-ccu.c:932:1: sparse: sparse: bad integer constant expression
   drivers/clk/tenstorrent/atlantis-ccu.c:932:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/clk/tenstorrent/atlantis-ccu.c:744:25: sparse: sparse: undefined identifier 'struct'
   drivers/clk/tenstorrent/atlantis-ccu.c:747:30: sparse: sparse: undefined identifier 'mux'
   drivers/clk/tenstorrent/atlantis-ccu.c:783:25: sparse: sparse: undefined identifier 'struct'
   drivers/clk/tenstorrent/atlantis-ccu.c:786:30: sparse: sparse: undefined identifier 'div'
   drivers/clk/tenstorrent/atlantis-ccu.c:801:25: sparse: sparse: undefined identifier 'struct'
   drivers/clk/tenstorrent/atlantis-ccu.c:804:30: sparse: sparse: undefined identifier 'gate'
   drivers/clk/tenstorrent/atlantis-ccu.c:818:25: sparse: sparse: undefined identifier 'struct'
   drivers/clk/tenstorrent/atlantis-ccu.c:825:58: sparse: sparse: undefined identifier 'factor'
   drivers/clk/tenstorrent/atlantis-ccu.c:830:58: sparse: sparse: undefined identifier 'factor'
   drivers/clk/tenstorrent/atlantis-ccu.c:840:25: sparse: sparse: undefined identifier 'struct'
   drivers/clk/tenstorrent/atlantis-ccu.c:842:25: sparse: sparse: undefined identifier 'gate_shared'

vim +930 drivers/clk/tenstorrent/atlantis-ccu.c

737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  710  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  711  static int atlantis_ccu_clocks_register(struct device *dev,
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  712  					struct atlantis_ccu *ccu,
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  713  					const struct atlantis_ccu_data *data)
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  714  {
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  715  	struct regmap *regmap = ccu->regmap;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  716  	struct clk_hw_onecell_data *clk_data;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  717  	int i, ret;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  718  	size_t num_clks = data->num;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  719  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  720  	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  721  				GFP_KERNEL);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  722  	if (!clk_data)
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  723  		return -ENOMEM;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  724  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  725  	ccu->clk_data = clk_data;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  726  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  727  	for (i = 0; i < data->num; i++) {
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  728  		struct clk_hw *hw = data->hws[i];
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  729  		const char *name = hw->init->name;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  730  		struct atlantis_clk_common *common =
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  731  			hw_to_atlantis_clk_common(hw);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  732  		common->regmap = regmap;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  733  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  734  		/* Fixup missing handle to parent for gates/muxes/dividers */
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  735  		if (hw->init->parent_hws && hw->init->num_parents == 1) {
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  736  			const struct atlantis_clk_common *parent =
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  737  				hw_to_atlantis_clk_common(
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  738  					hw->init->parent_hws[0]);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  739  			hw->init->parent_hws[0] = clk_data->hws[parent->clkid];
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  740  		}
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  741  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  742  		switch (common->clk_type) {
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  743  		case ATLANTIS_CLK_MUX:
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  744  			struct atlantis_clk_mux *mux =
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  745  				hw_to_atlantis_clk_mux(hw);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  746  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  747  			hw = devm_clk_hw_register_mux_parent_data_table(
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  748  				ccu->dev, name, hw->init->parent_data,
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  749  				hw->init->num_parents, hw->init->flags,
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  750  				ccu->base + mux->config.reg_offset,
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  751  				mux->config.shift, mux->config.width, 0, NULL,
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  752  				&lock);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  753  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  754  			if (IS_ERR(hw)) {
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  755  				dev_err(dev, "Cannot register clock %d - %s\n",
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  756  					i, name);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  757  				return ret;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  758  			}
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  759  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  760  			if (data == &atlantis_ccu_rcpu_data) {
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  761  				switch (common->clkid) {
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  762  				case CLK_RCPU_ROOT:
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  763  					ret = clk_hw_set_parent(
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  764  						hw,
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  765  						clk_data->hws[CLK_RCPU_PLL]);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  766  					if (ret)
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  767  						dev_err(ccu->dev,
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  768  							"Failed to set RCPU ROOT MUX parent: %d\n",
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  769  							ret);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  770  					break;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  771  				case CLK_NOCC_CLK:
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  772  					ret = clk_hw_set_parent(
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  773  						hw, clk_data->hws[CLK_NOC_PLL]);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  774  					if (ret)
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  775  						dev_err(ccu->dev,
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  776  							"Failed to set NOCC Mux parent: %d\n",
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  777  							ret);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  778  					break;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  779  				}
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  780  			}
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  781  			break;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  782  		case ATLANTIS_CLK_DIVIDER:
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  783  			struct atlantis_clk_divider *div =
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  784  				hw_to_atlantis_clk_divider(hw);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  785  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  786  			hw = devm_clk_hw_register_divider_parent_hw(
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  787  				ccu->dev, name, common->hw.init->parent_hws[0],
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  788  				div->common.hw.init->flags,
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  789  				ccu->base + div->config.reg_offset,
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  790  				div->config.shift, div->config.width,
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  791  				div->config.flags, &lock);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  792  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  793  			if (IS_ERR(hw)) {
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  794  				dev_err(dev, "Cannot register clock %d - %s\n",
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  795  					i, name);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  796  				return ret;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  797  			}
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  798  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  799  			break;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  800  		case ATLANTIS_CLK_GATE:
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15 @801  			struct atlantis_clk_gate *gate =
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  802  				hw_to_atlantis_clk_gate(hw);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  803  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  804  			hw = devm_clk_hw_register_gate_parent_hw(
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  805  				ccu->dev, name, common->hw.init->parent_hws[0],
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  806  				hw->init->flags,
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  807  				ccu->base + gate->config.reg_offset,
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  808  				ffs(gate->config.enable) - 1, 0, &lock);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  809  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  810  			if (IS_ERR(hw)) {
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  811  				dev_err(dev, "Cannot register clock %d - %s\n",
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  812  					i, name);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  813  				return ret;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  814  			}
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  815  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  816  			break;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  817  		case ATLANTIS_CLK_FIXED_FACTOR:
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  818  			struct atlantis_clk_fixed_factor *factor =
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  819  				hw_to_atlantis_clk_fixed_factor(hw);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  820  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  821  			if (hw->init->parent_data) {
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  822  				hw = devm_clk_hw_register_fixed_factor_index(
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  823  					dev, name,
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  824  					hw->init->parent_data[0].index,
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  825  					hw->init->flags, factor->config.mult,
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  826  					factor->config.div);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  827  			} else {
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  828  				hw = devm_clk_hw_register_fixed_factor_parent_hw(
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  829  					dev, name, hw->init->parent_hws[0],
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  830  					hw->init->flags, factor->config.mult,
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  831  					factor->config.div);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  832  			}
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  833  			if (IS_ERR(hw)) {
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  834  				dev_err(dev, "Cannot register clock %d - %s\n",
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  835  					i, name);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  836  				return ret;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  837  			}
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  838  			break;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  839  		case ATLANTIS_CLK_GATE_SHARED:
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  840  			struct atlantis_clk_gate_shared *gate_shared =
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  841  				hw_to_atlantis_clk_gate_shared(hw);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  842  			gate_shared->config.refcount_lock = &refcount_lock;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  843  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  844  			ret = devm_clk_hw_register(dev, hw);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  845  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  846  			if (ret) {
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  847  				dev_err(dev, "Cannot register clock %d - %s\n",
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  848  					i, name);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  849  				return ret;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  850  			}
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  851  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  852  			break;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  853  		default:
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  854  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  855  			ret = devm_clk_hw_register(dev, hw);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  856  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  857  			if (ret) {
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  858  				dev_err(dev, "Cannot register clock %d - %s\n",
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  859  					i, name);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  860  				return ret;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  861  			}
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  862  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  863  			break;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  864  		}
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  865  		clk_data->hws[common->clkid] = hw;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  866  	}
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  867  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  868  	clk_data->num = num_clks;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  869  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  870  	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  871  	if (ret)
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  872  		dev_err(dev, "failed to add clock hardware provider (%d)\n",
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  873  			ret);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  874  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  875  	return ret;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  876  }
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  877  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  878  static int atlantis_ccu_probe(struct platform_device *pdev)
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  879  {
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  880  	const struct atlantis_ccu_data *data;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  881  	struct device *dev = &pdev->dev;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  882  	int ret;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  883  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  884  	struct atlantis_ccu *ccu = devm_kzalloc(dev, sizeof(*ccu), GFP_KERNEL);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  885  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  886  	if (!ccu)
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  887  		return -ENOMEM;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  888  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  889  	ccu->dev = dev;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  890  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  891  	ccu->base = devm_platform_ioremap_resource(pdev, 0);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  892  	if (IS_ERR(ccu->base))
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  893  		return dev_err_probe(dev, PTR_ERR(ccu->base),
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  894  				     "Failed to map registers\n");
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  895  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  896  	ccu->regmap = devm_regmap_init_mmio(dev, ccu->base,
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  897  					    &atlantis_ccu_regmap_config);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  898  	if (IS_ERR(ccu->regmap))
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  899  		return dev_err_probe(dev, PTR_ERR(ccu->regmap),
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  900  				     "Failed to init regmap\n");
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  901  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  902  	data = of_device_get_match_data(dev);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  903  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  904  	ret = atlantis_ccu_clocks_register(dev, ccu, data);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  905  	if (ret)
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  906  		return dev_err_probe(dev, ret, "failed to register clocks\n");
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  907  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  908  	return 0;
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  909  }
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  910  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  911  static const struct of_device_id atlantis_ccu_of_match[] = {
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  912  	{
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  913  		.compatible = "tenstorrent,atlantis-syscon-rcpu",
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  914  		.data = &atlantis_ccu_rcpu_data,
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  915  	},
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  916  	{}
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  917  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  918  };
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  919  MODULE_DEVICE_TABLE(of, atlantis_ccu_of_match);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  920  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  921  static struct platform_driver atlantis_ccu_driver = {
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  922  	.probe = atlantis_ccu_probe,
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  923  	.driver = {
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  924  		.name = "atlantis-ccu",
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  925  		.of_match_table = atlantis_ccu_of_match,
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  926  	},
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  927  };
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  928  module_platform_driver(atlantis_ccu_driver);
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15  929  
737c3bcb5f0dbd Anirudh Srinivasan 2026-01-15 @930  MODULE_DESCRIPTION("Tenstorrent Atlantis Clock Controller Driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
