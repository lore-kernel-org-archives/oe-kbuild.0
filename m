Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4252620CE
	for <oe-kbuild@lists.linux.dev>; Fri,  9 May 2025 20:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746822237; cv=none; b=X5Wb7nHBN6OqvFg5AdaIXKRtfypeC7O76zYfrEzKNTaIChtmy+lrC4eSjvXOXaKYSvkZ7ddXMJmauRzKgJcZFqkgAtRtMlvZwi8my2EZwrCmPBDZisN23yVBVMye8Jfua3WQL68IincXEgqFyUUaT/DCbKcRoAQ74s9A4cSLZ/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746822237; c=relaxed/simple;
	bh=tG7mP8pcRmpsrWBmFeyEa91vpEbRKc8wiSjm8tDqyTc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DrvXtKuGNXm3gyCOEw70lqTjdy4zfaxfuhCd+SEdjryv1DiAqY6Zt5N6fx3PjaflUNNNi3y6zmXDrHhRA2d1DMA8VypJhRUO9tM+Nv28cIv7DEkKAHNGubBP0Ejjogd2fl01JKmrp2auyDl/AEzFkHAenTwAW6Ys8echhSH/59g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l+eAfN6J; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l+eAfN6J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746822235; x=1778358235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tG7mP8pcRmpsrWBmFeyEa91vpEbRKc8wiSjm8tDqyTc=;
  b=l+eAfN6Jdas0beeEHGQ0Yjbln2oqme0eJEoYJZA6uT6mRjtBh2QrbmuB
   X7k2b0LCBucFfIfs4COF6UpJXSHaR7IXOKYZtrRKtZywbnFhyRsyduB/w
   TRE8IvKtJaCDx/VywdllfbL2ffsmErDZRtT8fQVVLdbCKNtc35lNBbBxs
   Dn7J4VgBx1wGvEf+kBOOEORpkxTlH2ZB2ov1H11t87mgxpOEizHwLAMcp
   8C4lsARdvFVBBhrq2+4tqZ/2husWHNxwDPXYhZhYP6qYaUI3LRpv2ddlu
   zQ4npUqDe/rRVZcrmfR4M3JL+M3daUkipvhbbIIwP5P3569WVuW9fr2is
   g==;
X-CSE-ConnectionGUID: DYaEiyRuTimNQOtfNrApEQ==
X-CSE-MsgGUID: 8I/eRZy4T5i8OVYyCqmAUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="52477621"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="52477621"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 13:23:54 -0700
X-CSE-ConnectionGUID: MCOo0DjmReOHniBm0Yeb5g==
X-CSE-MsgGUID: t5i7Vs9mQW63uqyQzLmiCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="141681948"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 May 2025 13:23:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDUG7-000CR9-0n;
	Fri, 09 May 2025 20:23:51 +0000
Date: Sat, 10 May 2025 04:23:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/3] ARM: tegra: Add device-tree for ASUS Transformer
 Pad LTE TF300TL
Message-ID: <202505100400.MHd3fUsA-lkp@intel.com>
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
In-Reply-To: <20250503102950.32744-4-clamor95@gmail.com>
References: <20250503102950.32744-4-clamor95@gmail.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.15-rc5 next-20250508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/dt-bindings-arm-tegra-group-Tegra30-based-ASUS-Transformers/20250503-183229
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250503102950.32744-4-clamor95%40gmail.com
patch subject: [PATCH v2 3/3] ARM: tegra: Add device-tree for ASUS Transformer Pad LTE TF300TL
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-052-20250507 (https://download.01.org/0day-ci/archive/20250510/202505100400.MHd3fUsA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505100400.MHd3fUsA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505100400.MHd3fUsA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi:53.22-59.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1110.15-1123.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1196.15-1208.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra30-ictlr']
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /dma@6000a000: failed to match any schema with compatible: ['nvidia,tegra30-apbdma', 'nvidia,tegra20-apbdma']
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /dma@6000a000: failed to match any schema with compatible: ['nvidia,tegra30-apbdma', 'nvidia,tegra20-apbdma']
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /i2c@7000d000/pmic@2d: failed to match any schema with compatible: ['ti,tps65911']
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: core-regulator@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
