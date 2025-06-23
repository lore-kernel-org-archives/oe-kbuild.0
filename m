Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1BD231C8D
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Jun 2025 09:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750669648; cv=none; b=kwWYx+ooJ49/pdbWPMVVxJk9UWwV+QzLNZ+q+2gUzgacjXGSW2EBSlsQ+e3hPZqGwpKfl/jFsFe/3pxRcipsS3pxuEE8ykmPeFhGPH3VNIAw54QFcZUA0KbaaAKv/x6DwyJuBFKHh196cuRZ2Lh5jmyLXeWEtOnUtHB1zUSf6Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750669648; c=relaxed/simple;
	bh=lIlSQO77iQO0FjnbItctn1ou5OsPg9MLorQRmtpvJLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UcBt3uXSFGJ5qfTIZ7F2je2XkLXY7aRsfa1d2TDcTNc7HEcc75HyxOpQM9kGo9ryEiL7aqQ5oGRgpLCnQHqmadKVbeCNTosBsgx00xEGnwQVsRDcY2ZWa0Ua+Tao/sji7j/AyS2nlTWKH/RwQ9lgYQMy1Q6OFCKddi49UkZPIsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PhC1QD5F; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PhC1QD5F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750669647; x=1782205647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lIlSQO77iQO0FjnbItctn1ou5OsPg9MLorQRmtpvJLU=;
  b=PhC1QD5FynBAhv1mdf7WS0nTBbiuTI3Zi6t3xrjkbn2mxAX8RnzuTsgY
   nMHwgr3njp1+nWC/X7//p/NLTnTtvftgTcpf9WoE/vj5z4WJ6X56jN922
   izI2YATeKCCR0kHuc8doVMGBjIlPIZTzM7iy+1meyzzdYGednxRNwUXnX
   3T+5rRNr3AeTV8z8VKiQBoS/PpbJEXSpI4TJ3nO/Ho1Z1b/v+vwzyfsM8
   ALPvqncGit95qwvpEX+seWZ9ZPo6fHHhQCluXUqoinBi4Rtqa5E2clC7P
   Ld99fD0ed2Jd8BM7wjwBp62ILUejD4A4J/yGRLCDjh14R0VxBUzxmHxoK
   w==;
X-CSE-ConnectionGUID: aAgmgQffSq6OVBZPPdtvmQ==
X-CSE-MsgGUID: CouIOIVCQyKkbdNki13J8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52837334"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52837334"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:07:24 -0700
X-CSE-ConnectionGUID: 3w47lJvFRmGGXMxiRSpU6g==
X-CSE-MsgGUID: n1Y/OLVvSu2o7JquNKpnAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="152215267"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Jun 2025 02:07:22 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTd96-000Nt0-3A;
	Mon, 23 Jun 2025 09:07:20 +0000
Date: Mon, 23 Jun 2025 17:06:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: net: convert socfpga-dwmac.txt to DT schema
Message-ID: <202506231622.5Az9zCyL-lkp@intel.com>
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
In-Reply-To: <20250621034401.586780-1-dinguyen@kernel.org>
References: <20250621034401.586780-1-dinguyen@kernel.org>
TO: Dinh Nguyen <dinguyen@kernel.org>
TO: robh+dt@kernel.org
TO: krzysztof.kozlowskii+dt@linaro.org
TO: conor+dt@kernel.org
CC: dinguyen@kernel.org
CC: devicetree@vger.kernel.org

Hi Dinh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc3 next-20250623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dinh-Nguyen/dt-bindings-net-convert-socfpga-dwmac-txt-to-DT-schema/20250621-114611
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250621034401.586780-1-dinguyen%40kernel.org
patch subject: [PATCH] dt-bindings: net: convert socfpga-dwmac.txt to DT schema
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-051-20250621 (https://download.01.org/0day-ci/archive/20250623/202506231622.5Az9zCyL-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506231622.5Az9zCyL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506231622.5Az9zCyL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: ethernet@10020000 (starfive,jh7100-dwmac): 'max-frame-size', 'mdio', 'phy-handle', 'snps,axi-config', 'snps,fixed-burst', 'snps,force_thresh_dma_mode', 'snps,perfect-filter-entries', 'starfive,syscon', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: ethernet@10020000 (starfive,jh7100-dwmac): clock-names: ['stmmaceth', 'pclk', 'ptp_ref', 'tx', 'gtx'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: ethernet@10020000 (starfive,jh7100-dwmac): clocks: [[8, 121], [8, 120], [8, 122], [8, 127], [8, 123]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: ethernet@10020000 (starfive,jh7100-dwmac): compatible:0: 'starfive,jh7100-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: ethernet@10020000 (starfive,jh7100-dwmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: ethernet@10020000 (starfive,jh7100-dwmac): interrupts: [[6], [7]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb: ethernet@10020000 (starfive,jh7100-dwmac): phy-mode:0: 'rgmii-id' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: ethernet@10020000 (starfive,jh7100-dwmac): 'max-frame-size', 'mdio', 'phy-handle', 'snps,axi-config', 'snps,fixed-burst', 'snps,force_thresh_dma_mode', 'snps,perfect-filter-entries', 'starfive,syscon', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: ethernet@10020000 (starfive,jh7100-dwmac): clock-names: ['stmmaceth', 'pclk', 'ptp_ref', 'tx', 'gtx'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: ethernet@10020000 (starfive,jh7100-dwmac): clocks: [[8, 121], [8, 120], [8, 122], [8, 127], [8, 123]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: ethernet@10020000 (starfive,jh7100-dwmac): compatible:0: 'starfive,jh7100-dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: ethernet@10020000 (starfive,jh7100-dwmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: ethernet@10020000 (starfive,jh7100-dwmac): interrupts: [[6], [7]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dtb: ethernet@10020000 (starfive,jh7100-dwmac): phy-mode:0: 'rgmii-id' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000 (thead,th1520-gmac): 'mdio', 'phy-handle', 'reg-names', 'snps,axi-config', 'snps,fixed-burst', 'snps,pbl', 'snps,perfect-filter-entries' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000 (thead,th1520-gmac): compatible:0: 'thead,th1520-gmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000 (thead,th1520-gmac): phy-mode:0: 'rgmii-id' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000 (thead,th1520-gmac): reg: [[255, 3875930112, 0, 8192], [255, 3959439360, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000 (thead,th1520-gmac): 'mdio', 'phy-handle', 'reg-names', 'snps,axi-config', 'snps,fixed-burst', 'snps,pbl', 'snps,perfect-filter-entries' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000 (thead,th1520-gmac): compatible:0: 'thead,th1520-gmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000 (thead,th1520-gmac): phy-mode:0: 'rgmii-id' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000 (thead,th1520-gmac): reg: [[255, 3875995648, 0, 8192], [255, 3959435264, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7060000 (thead,th1520-gmac): 'mdio', 'reg-names', 'snps,axi-config', 'snps,fixed-burst', 'snps,pbl', 'snps,perfect-filter-entries' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7060000 (thead,th1520-gmac): compatible:0: 'thead,th1520-gmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7060000 (thead,th1520-gmac): reg: [[255, 3875930112, 0, 8192], [255, 3959439360, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000 (thead,th1520-gmac): 'mdio', 'phy-handle', 'reg-names', 'snps,axi-config', 'snps,fixed-burst', 'snps,pbl', 'snps,perfect-filter-entries' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000 (thead,th1520-gmac): compatible:0: 'thead,th1520-gmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000 (thead,th1520-gmac): phy-mode:0: 'rgmii-id' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000 (thead,th1520-gmac): reg: [[255, 3875995648, 0, 8192], [255, 3959435264, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
