Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650394414
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Jun 2025 22:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750719525; cv=none; b=Uv/F60yat+qTzHZ1qc0Ywh+aLjWhPjTElwMGZ5DeC4GgIPgpF0WdLu1IHhMVhnI638dJsBtdp22JtB/Mld79civx409zqz1bKu8gEqtaXlsy0E9DalM/+k6NESSuketgPHhjiINQcquLr4Xkg+050RAmIb2YonQ9SklCZNDdKOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750719525; c=relaxed/simple;
	bh=uIdSx+aGhWqYV6KbzsoiYRpoBbIFQuO3KRSnK3F9DXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qSQ6j6A/ZFW8rj02ACVgZbe0cOzZEKbtHZqqG1Ik+6QEcO1TRydHBtc+/h9wEeLA9UM6XOcvjQMVQ2xJCCz/PoycM0AJ09qLDh0j+pRSRLF3kMyFyPkNo2hNabNtgqduqc15IfvayXdfBdhDObxAI5MfSCFgysOWXLO4tPAudCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UcvUVqRN; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UcvUVqRN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750719523; x=1782255523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uIdSx+aGhWqYV6KbzsoiYRpoBbIFQuO3KRSnK3F9DXw=;
  b=UcvUVqRNQ6lwoECJYpEfvRk9e1NyFElk2u5At8gRZoPWWT0ndi/fjJg8
   8T0D8/wznDQrhL8kqR7mnWfZfQ93JqqwFeU1HMLUkKBxkD1cZJB5KPyVD
   R+F7Pv17Dpi7e1rzkgczQ7V+cE+bYZedj4G8vf0dRhN+4834GMugzt3cx
   5hKOddYQQpf1jxgHknYUzm/y0zebpb7nUIv04CTXu/fg2A4FoXAsPU+81
   /K7dHENPTWwuBlMH4b2B4DqnfQGRW5ShIWVqgn/b1VkNYNdKBlUBnBk47
   8e6mIfsTJ/eIWptC0XvqeWosjzNGajVDwUldaoAcA+AyV6YgBcxSd0CJG
   g==;
X-CSE-ConnectionGUID: yVRJqHl5TIKo4+VJf7znAg==
X-CSE-MsgGUID: W4ZrtG50Q6i8JQwvDmGprg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52061276"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="52061276"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 15:58:42 -0700
X-CSE-ConnectionGUID: daB25SbXR5SWGYvqgUdeiw==
X-CSE-MsgGUID: MjudwPpgT5e/KF6mS7cW5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="155739938"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Jun 2025 15:58:41 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTq7b-000RUR-1z;
	Mon, 23 Jun 2025 22:58:39 +0000
Date: Tue, 24 Jun 2025 06:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5] dt-bindings: memory-controllers: Convert Altera SDRAM
 EDAC .txt to YAML
Message-ID: <202506240643.0A7RTyWE-lkp@intel.com>
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
In-Reply-To: <20250620091429.388981-1-shankari.ak0208@gmail.com>
References: <20250620091429.388981-1-shankari.ak0208@gmail.com>
TO: Shankari Anand <shankari.ak0208@gmail.com>
TO: devicetree@vger.kernel.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: matthew.gerlach@altera.com
CC: Shankari Anand <shankari.ak0208@gmail.com>

Hi Shankari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk-mem-ctrl/for-next linus/master v6.16-rc3 next-20250623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shankari-Anand/dt-bindings-memory-controllers-Convert-Altera-SDRAM-EDAC-txt-to-YAML/20250620-171643
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250620091429.388981-1-shankari.ak0208%40gmail.com
patch subject: [PATCH v5] dt-bindings: memory-controllers: Convert Altera SDRAM EDAC .txt to YAML
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-052-20250621 (https://download.01.org/0day-ci/archive/20250624/202506240643.0A7RTyWE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240643.0A7RTyWE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506240643.0A7RTyWE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: clock-controller@ffd10000 (intel,agilex-clkmgr): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/intel,agilex.yaml#
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: /soc@0/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: /soc@0/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: /soc@0/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: /soc@0/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: /soc@0/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: /soc@0/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: nand-controller@ffb90000 (altr,socfpga-denali-nand): Unevaluated properties are not allowed ('flash@0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/denali,nand.yaml#
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: sdramedac (altr,sdram-edac-s10): interrupts: [[16, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/altr,sdram-edac.yaml#
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: sdramedac (altr,sdram-edac-s10): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/altr,sdram-edac.yaml#
--
   arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: f2s-free-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: clock-controller@ffd10000 (intel,easic-n5x-clkmgr): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/intel,easic-n5x.yaml#
   arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: /soc@0/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: /soc@0/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: /soc@0/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: /soc@0/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: /soc@0/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: /soc@0/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
>> arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: sdramedac (altr,sdram-edac-s10): interrupts: [[16, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/altr,sdram-edac.yaml#
   arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: sdramedac (altr,sdram-edac-s10): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/altr,sdram-edac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
