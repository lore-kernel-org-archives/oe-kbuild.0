Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FBD79CF
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Mar 2025 23:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741476766; cv=none; b=JlcKl/PPRuor13sGLlPvyu67wFYwJaGcqt4u/w5yUGi2dteaWxjWdjAz2KSPFDsFnWzw6YG9mUqSrgKsVy2nui73ojv5WTA9qNNZeAsJmAJOTg5pejdAnb+/pS0DDMRcqOKZpaHUYKBecEp7jbrWq9vQ/Fy28f+FJN2lr/lTldc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741476766; c=relaxed/simple;
	bh=A+6s+CeTh0HkBd8Xw2LIaY9gtXwK43j4/euDROpaxg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KyWq/mEQIZKWB2V1cAXCjupYZgQv0W6lAbVunFcpUIfFtrZNIQrUNvjE2exstOEWvnr36I7qvZmPJ3uxDZ8uJuGaN5BNI3OFMskBd/Ph/nfeZt+CYuQIURikMPYuPG4m6OUBlnbmmY0mWxYtllQ8eKkkGNCrJk7HWX0uippP/kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9NUsngP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9NUsngP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741476765; x=1773012765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A+6s+CeTh0HkBd8Xw2LIaY9gtXwK43j4/euDROpaxg4=;
  b=M9NUsngPdAlLkrji2aGJzDYau+3yZErvt82BWIiLJDh6jzzCj6dbQeX3
   xui758wUvu2+/Q9WrkfRGtWIndoY0OREkjL6vHOHYnMAjwS13NWXO0zst
   uUWvFijbv+3NyPEVlYWO1Ynnq7YowSNqXe3Vrruc2TwtkBZ+8mf5Itnhf
   PiAWp8AYBZkilBSbRvRJchwdFyGaHeKgaDc6/JjIL70iaWmB5NOJ84jPh
   /yPIZYH/K5ziw4+2FOwiIG/PFYdNM+O4eQ4PzAswC38Nzy74K2oJb5KFU
   LTBoaWhEuX/CzCsEjbWOtyBzVyQfREYZj2rH/jF3xAgGhXy3jm8Db9Q3C
   Q==;
X-CSE-ConnectionGUID: by2InWHWRDWXxvjJdEW0Tw==
X-CSE-MsgGUID: S2Ca7oJGSXGk4JimfdZVfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="42696122"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="42696122"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 15:32:43 -0800
X-CSE-ConnectionGUID: NEJPr/i1SxKEtRxYTcrR5Q==
X-CSE-MsgGUID: ChUKEcv+QeyCuXh+W5Eshg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="119648447"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 08 Mar 2025 15:32:41 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tr3ep-0002RQ-17;
	Sat, 08 Mar 2025 23:32:39 +0000
Date: Sun, 9 Mar 2025 07:32:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] arm64: dts: socfpga: add Agilex7 M-Series SoCDK
Message-ID: <202503090747.ShmWArXr-lkp@intel.com>
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
In-Reply-To: <20250305194951.7226-3-matthew.gerlach@altera.com>
References: <20250305194951.7226-3-matthew.gerlach@altera.com>
TO: Matthew Gerlach <matthew.gerlach@altera.com>
TO: dinguyen@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: Matthew Gerlach <matthew.gerlach@altera.com>

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.14-rc5 next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Gerlach/dt-bindings-intel-document-Agilex7-M-Series-SoCDK/20250306-035225
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250305194951.7226-3-matthew.gerlach%40altera.com
patch subject: [PATCH 2/2] arm64: dts: socfpga: add Agilex7 M-Series SoCDK
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250308 (https://download.01.org/0day-ci/archive/20250309/202503090747.ShmWArXr-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503090747.ShmWArXr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503090747.ShmWArXr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:604.10-661.5: Warning (simple_bus_reg): /soc@0/eccmgr: missing or empty reg/ranges property
>> arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dtb: /firmware/svc: failed to match any schema with compatible: ['intel,agilex-svc']
>> arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dtb: /firmware/svc/fpga-mgr: failed to match any schema with compatible: ['intel,agilex-soc-fpga-mgr']
>> arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dtb: cb-intosc-hs-div2-clk: 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
>> arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dtb: cb-intosc-ls-clk: 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
>> arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dtb: f2s-free-clk: 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
>> arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dtb: /soc@0/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
>> arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dtb: /soc@0/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
>> arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dtb: /soc@0/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
>> arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dtb: /soc@0/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
>> arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dtb: /soc@0/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
>> arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dtb: /soc@0/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
>> arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dtb: /soc@0/eccmgr: failed to match any schema with compatible: ['altr,socfpga-s10-ecc-manager', 'altr,socfpga-a10-ecc-manager']
>> arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dtb: /soc@0/eccmgr: failed to match any schema with compatible: ['altr,socfpga-s10-ecc-manager', 'altr,socfpga-a10-ecc-manager']
>> arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dtb: /soc@0/eccmgr/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac-s10']
>> arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dtb: /soc@0/eccmgr/ocram-ecc@ff8cc000: failed to match any schema with compatible: ['altr,socfpga-s10-ocram-ecc', 'altr,socfpga-a10-ocram-ecc']
>> arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dtb: /soc@0/eccmgr/ocram-ecc@ff8cc000: failed to match any schema with compatible: ['altr,socfpga-s10-ocram-ecc', 'altr,socfpga-a10-ocram-ecc']
>> arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dtb: /soc@0/eccmgr/usb0-ecc@ff8c4000: failed to match any schema with compatible: ['altr,socfpga-s10-usb-ecc', 'altr,socfpga-usb-ecc']
>> arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dtb: /soc@0/eccmgr/usb0-ecc@ff8c4000: failed to match any schema with compatible: ['altr,socfpga-s10-usb-ecc', 'altr,socfpga-usb-ecc']
>> arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dtb: /soc@0/eccmgr/emac0-rx-ecc@ff8c0000: failed to match any schema with compatible: ['altr,socfpga-s10-eth-mac-ecc', 'altr,socfpga-eth-mac-ecc']
>> arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dtb: /soc@0/eccmgr/emac0-rx-ecc@ff8c0000: failed to match any schema with compatible: ['altr,socfpga-s10-eth-mac-ecc', 'altr,socfpga-eth-mac-ecc']
>> arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dtb: /soc@0/eccmgr/emac0-tx-ecc@ff8c0400: failed to match any schema with compatible: ['altr,socfpga-s10-eth-mac-ecc', 'altr,socfpga-eth-mac-ecc']
>> arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dtb: /soc@0/eccmgr/emac0-tx-ecc@ff8c0400: failed to match any schema with compatible: ['altr,socfpga-s10-eth-mac-ecc', 'altr,socfpga-eth-mac-ecc']
>> arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dtb: /soc@0/eccmgr/sdmmca-ecc@ff8c8c00: failed to match any schema with compatible: ['altr,socfpga-s10-sdmmc-ecc', 'altr,socfpga-sdmmc-ecc']
>> arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dtb: /soc@0/eccmgr/sdmmca-ecc@ff8c8c00: failed to match any schema with compatible: ['altr,socfpga-s10-sdmmc-ecc', 'altr,socfpga-sdmmc-ecc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
