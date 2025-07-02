Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D161CCB40
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Jul 2025 01:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751420023; cv=none; b=UHLB6d1eYeiHn7CXr8RNocEiKTudyywsqtXK62zNLwIGm98Dz/JdKiApilZFfBxG2MZguA62jFEN1R0CU10L+3r7BPv84LjzfS11Ojmvx6oNuNr6VX7Od8DJs3Tul2Bj/MDK3wWB54bL9uz1uYPEM8YIlW4lBw7tMg561JXoRWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751420023; c=relaxed/simple;
	bh=2wyuufEvNruoRPYoDbiU1s20EGSFyP0JGDXozrCIiaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oug35geIPGtBSJD9RkM3PG0m9/6/5v5OiPR6m15bE8gzpzw15pMRn9sF9+1VrBQPibomWBo+a7JkKcbsHpNOqSQ5N9DxzA9J8ESeQOxg16Bx2V1qXRFE7s1OEEh3Lg+HcgA7+69M0D1krwvTYkXW53IS5js+JKmYaV4KEe52Q6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/yTZC1w; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/yTZC1w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751420021; x=1782956021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2wyuufEvNruoRPYoDbiU1s20EGSFyP0JGDXozrCIiaY=;
  b=R/yTZC1w0zeVAgW3Nls3vohP12Cxuzjw7ZZXQgGcOij6WRDW9Ok4qbeK
   U/B1nPuP30ZUSw09Ow7k7Efhfa73bY98ckYE9MtXGIAo+/9T+pp15Jam2
   e/OO8H1E2ZEuAOGAFYL6uNgJUDsWEQyskQXqJCw95Y7FKc04eX0gKe+cW
   xFbfAtVwYkLlbaC09pi++2xbRUavgIqJ9K65F8atECiY506nPFcQXw+2l
   h+jFq3qkPfVws6aPFXj3sK2bUAkrbL/PG7ZAbdiVLegEp/C4aW2R/bwiu
   GL4AKnw2WiSgT2MzX6tK/c81Jf6j1gUDO3tXyu4z7l34M25lcajLRtgLD
   Q==;
X-CSE-ConnectionGUID: EoQl/JvfT3+2+bbSFe4iHg==
X-CSE-MsgGUID: Q7xW8CRlR8O/i5YskdZCZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53566318"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="53566318"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 18:33:41 -0700
X-CSE-ConnectionGUID: xapIFR39Rkq7rbPJ1hJBSQ==
X-CSE-MsgGUID: G1HSdMJSTlSuOXnKPavpsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="154661483"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 Jul 2025 18:33:39 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWmLx-000asE-0H;
	Wed, 02 Jul 2025 01:33:37 +0000
Date: Wed, 2 Jul 2025 09:32:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v7] dt-bindings: net: Convert socfpga-dwmac bindings to
 yaml
Message-ID: <202507020858.xOZA28HU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250630213748.71919-1-matthew.gerlach@altera.com>
References: <20250630213748.71919-1-matthew.gerlach@altera.com>
TO: Matthew Gerlach <matthew.gerlach@altera.com>
TO: dinguyen@kernel.org
TO: andrew+netdev@lunn.ch
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: maxime.chevallier@bootlin.com
TO: mcoquelin.stm32@gmail.com
TO: alexandre.torgue@foss.st.com
TO: richardcochran@gmail.com
TO: netdev@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-stm32@st-md-mailman.stormreply.com
TO: linux-arm-kernel@lists.infradead.org
CC: Matthew Gerlach <matthew.gerlach@altera.com>
CC: Mun Yew Tham <mun.yew.tham@altera.com>

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc4 next-20250701]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Gerlach/dt-bindings-net-Convert-socfpga-dwmac-bindings-to-yaml/20250701-054010
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250630213748.71919-1-matthew.gerlach%40altera.com
patch subject: [PATCH v7] dt-bindings: net: Convert socfpga-dwmac bindings to yaml
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: arm64-randconfig-051-20250701 (https://download.01.org/0day-ci/archive/20250702/202507020858.xOZA28HU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020858.xOZA28HU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507020858.xOZA28HU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi:581.10-630.5: Warning (simple_bus_reg): /soc@0/eccmgr: missing or empty reg/ranges property
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: cb-intosc-hs-div2-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: cb-intosc-ls-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: f2s-free-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): iommus: [[11, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): iommus: [[11, 2]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): iommus: [[11, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: rstmgr@ffd11000 (altr,stratix10-rst-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,stratix10-rst-mgr'] is too short
   	'altr,rst-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/reset/altr,rst-mgr.yaml#
--
   arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi:581.10-630.5: Warning (simple_bus_reg): /soc@0/eccmgr: missing or empty reg/ranges property
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: cb-intosc-hs-div2-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: cb-intosc-ls-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: f2s-free-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): iommus: [[11, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): iommus: [[11, 2]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): iommus: [[11, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: rstmgr@ffd11000 (altr,stratix10-rst-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,stratix10-rst-mgr'] is too short
   	'altr,rst-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/reset/altr,rst-mgr.yaml#
--
   arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi:581.10-630.5: Warning (simple_bus_reg): /soc@0/eccmgr: missing or empty reg/ranges property
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: cb-intosc-hs-div2-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: cb-intosc-ls-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: f2s-free-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
>> arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): iommus: [[11, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('iommus', 'phy-addr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): iommus: [[11, 2]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('iommus', 'phy-addr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): iommus: [[11, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('iommus', 'phy-addr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: rstmgr@ffd11000 (altr,stratix10-rst-mgr): altr,modrst-offset: False schema does not allow 32
   	from schema $id: http://devicetree.org/schemas/reset/altr,rst-mgr.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: rstmgr@ffd11000 (altr,stratix10-rst-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,stratix10-rst-mgr'] is too short
   	'altr,rst-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/reset/altr,rst-mgr.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: sysmgr@ffd12000 (altr,sys-mgr-s10): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: sysmgr@ffd12000 (altr,sys-mgr-s10): cpu1-start-addr: False schema does not allow 4291846704
--
   arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:610.10-667.5: Warning (simple_bus_reg): /soc@0/eccmgr: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: f2s-free-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: clock-controller@ffd10000 (intel,agilex-clkmgr): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/intel,agilex.yaml#
>> arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): iommus: [[9, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): iommus: [[9, 2]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): iommus: [[9, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
--
   arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:610.10-667.5: Warning (simple_bus_reg): /soc@0/eccmgr: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: f2s-free-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: clock-controller@ffd10000 (intel,agilex-clkmgr): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/intel,agilex.yaml#
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): iommus: [[9, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): iommus: [[9, 2]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): iommus: [[9, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
--
   arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:610.10-667.5: Warning (simple_bus_reg): /soc@0/eccmgr: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: f2s-free-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: clock-controller@ffd10000 (intel,agilex-clkmgr): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/intel,agilex.yaml#
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): iommus: [[9, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): iommus: [[9, 2]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): iommus: [[9, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: nand-controller@ffb90000 (altr,socfpga-denali-nand): Unevaluated properties are not allowed ('flash@0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/denali,nand.yaml#
--
   arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:610.10-667.5: Warning (simple_bus_reg): /soc@0/eccmgr: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: f2s-free-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: clock-controller@ffd10000 (intel,easic-n5x-clkmgr): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/intel,easic-n5x.yaml#
>> arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): iommus: [[9, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): iommus: [[9, 2]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): iommus: [[9, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
