Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15E314C5BD
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Nov 2024 18:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732212395; cv=none; b=ECGPL2m2Kc32/guFKXs/8a3tywhD3Sh1e8N9AetK/1NUfZasx70ooiqz2oSmyxKqtMADoa+tuAbmn2CL0g5UkdEs3rFYVkA8zLCobHSTMubZD6STXiuSuI9soibmHvjtYy2XOxrBxAozQ/j/ERc3fObBnrFvy+qT1iJ68GHI2aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732212395; c=relaxed/simple;
	bh=+e+zuXnNKnkFOn+Tv2ldYL208ss6LDvPgS3mDWep3zA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q+LdLbyem2BlCz876k2y3WoW6kUvMZqh8Q+xLp9jk86FRAyMLkLBdTSldxmZuHreoJNuH2xWbyvHEABdF8m/0WMgEsy8MfV9gulHxOLK7l6qOnz0ILI9XOVwTeQaY2Xo1FiBdvEwAzwcMdoEddhpvGFikzFDL2te6mrFl1pukPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i18m13Et; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i18m13Et"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732212394; x=1763748394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+e+zuXnNKnkFOn+Tv2ldYL208ss6LDvPgS3mDWep3zA=;
  b=i18m13Et6HmP0C3f7Y76KPCsBkcgu06OxvcMLxrgpwjyN8M36VCb2uOK
   l6OnNed7ELl9A6X4FtmZ6CaKc6MUFEsdMm3PW7JE5XvVC/I6Nfxs8FDge
   X03hYRcrIFalbvrIxVcjb/ukPgcbb/yAdAb54KF3Pu/nF58p9ZQziCfpD
   7lDJB8wCHillOXVRMfuT1T7CAd8gyYG61PgWkMBNqRysKaiyGUl5KZU4s
   YlNJlQL/YA4WM/nrKbnMwZdIPHn7RjItcayd4nRNS0/Jg2EgQMcSfkv65
   0zEums5hfwDrqKB22fW+pSxsFHDoEx6aCRELvt0msU20sHFIYMl8hWveV
   g==;
X-CSE-ConnectionGUID: pKM3HYWJTBSNWVou/Jipng==
X-CSE-MsgGUID: TgChI8KeRWKnprFwiCLH7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="49867209"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="49867209"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 10:06:33 -0800
X-CSE-ConnectionGUID: NUs1aq2+SayoO0wy2qBYdA==
X-CSE-MsgGUID: 1NUOic+6TJGMMW7pzhpakg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="95281784"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Nov 2024 10:06:32 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEBZV-0003EN-2E;
	Thu, 21 Nov 2024 18:06:29 +0000
Date: Fri, 22 Nov 2024 02:06:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-am62l: add initial reference
 board file
Message-ID: <202411220118.pC8Z5k1o-lkp@intel.com>
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
In-Reply-To: <20241117-am62lx-v1-2-4e71e42d781d@ti.com>
References: <20241117-am62lx-v1-2-4e71e42d781d@ti.com>
TO: Bryan Brattlof <bb@ti.com>
TO: Nishanth Menon <nm@ti.com>
TO: Vignesh Raghavendra <vigneshr@ti.com>
TO: Tero Kristo <kristo@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Bryan Brattlof <bb@ti.com>

Hi Bryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 767b6a0d0900c951e8b42306bd636268481a97ae]

url:    https://github.com/intel-lab-lkp/linux/commits/Bryan-Brattlof/arm64-dts-ti-k3-am62l-add-initial-infrastructure/20241121-112416
base:   767b6a0d0900c951e8b42306bd636268481a97ae
patch link:    https://lore.kernel.org/r/20241117-am62lx-v1-2-4e71e42d781d%40ti.com
patch subject: [PATCH 2/2] arm64: dts: ti: k3-am62l: add initial reference board file
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm64-randconfig-r063-20241121 (https://download.01.org/0day-ci/archive/20241122/202411220118.pC8Z5k1o-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411220118.pC8Z5k1o-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am62l.dtsi:72.31-83.6: Warning (simple_bus_reg): /bus@f0000/bus@43000000: simple-bus unit address format error, expected "b00000"

vim +/b00000 +72 arch/arm64/boot/dts/ti/k3-am62l.dtsi

0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  14  
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  15  / {
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  16  	model = "Texas Instruments K3 AM62L3 SoC";
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  17  	compatible = "ti,am62l3";
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  18  	interrupt-parent = <&gic500>;
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  19  	#address-cells = <2>;
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  20  	#size-cells = <2>;
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  21  
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  22  	firmware {
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  23  		optee {
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  24  			compatible = "linaro,optee-tz";
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  25  			method = "smc";
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  26  		};
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  27  	};
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  28  
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  29  	a53_timer0: timer-cl0-cpu0 {
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  30  		compatible = "arm,armv8-timer";
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  31  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>, /* cntpsirq */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  32  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* cntpnsirq */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  33  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* cntvirq */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  34  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* cnthpirq */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  35  	};
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  36  
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  37  	pmu: pmu {
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  38  		compatible = "arm,cortex-a53-pmu";
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  39  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  40  	};
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  41  
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  42  	cbass_main: bus@f0000 {
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  43  		compatible = "simple-bus";
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  44  		ranges = <0x00 0x00600000 0x00 0x00600000 0x00 0x00001100>, /* GPIO */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  45  			 <0x00 0x00a40000 0x00 0x00a40000 0x00 0x00000800>, /* Timesync router */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  46  			 <0x00 0x00a80000 0x00 0x00a80000 0x00 0x00040000>, /* GTC */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  47  			 <0x00 0x01000000 0x00 0x01000000 0x00 0x01b28400>, /* First peripheral window */ 
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  48  			 <0x00 0x08000000 0x00 0x08000000 0x00 0x00200000>, /* CPSW */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  49  			 <0x00 0x09000000 0x00 0x09000000 0x00 0x00400000>, /* CTRL MMRs */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  50  			 <0x00 0x0e000000 0x00 0x0e000000 0x00 0x0bd28000>, /* Second peripheral window */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  51  			 <0x00 0x30200000 0x00 0x30200000 0x00 0x00400000>, /* DSS */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  52  			 <0x00 0x31000000 0x00 0x31000000 0x00 0x00050000>, /* USB0 DWC3 Core window */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  53  			 <0x00 0x31100000 0x00 0x31100000 0x00 0x00050000>, /* USB1 DWC3 Core window */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  54  			 <0x00 0x3b000000 0x00 0x3b000000 0x00 0x00001000>, /* GPMC0 */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  55  			 <0x00 0x47000000 0x00 0x47000000 0x00 0x02000000>, /* DMSS */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  56  			 <0x00 0x50000000 0x00 0x50000000 0x00 0x08000000>, /* GPMC DATA */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  57  			 <0x00 0x60000000 0x00 0x60000000 0x00 0x08000000>, /* FSS0 DAT1 */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  58  			 <0x00 0x70800000 0x00 0x70800000 0x00 0x00010000>, /* OCSRAM */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  59  			 <0x01 0x00000000 0x01 0x00000000 0x00 0x00310000>, /* A53 PERIPHBASE */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  60  			 <0x05 0x00000000 0x05 0x00000000 0x01 0x00000000>, /* FSS0 DAT3 */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  61  
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  62  			 /* Wakeup Domain Range */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  63  			 <0x00 0x00b00000 0x00 0x00b00000 0x00 0x00001400>, /* VTM */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  64  			 <0x00 0x04080000 0x00 0x04080000 0x00 0x00008000>, /* PDCFG */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  65  			 <0x00 0x04201000 0x00 0x04201000 0x00 0x00008000>, /* GPIO */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  66  			 <0x00 0x2b100000 0x00 0x2b000000 0x00 0x00200400>, /* TIMER */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  67  			 <0x00 0x40800000 0x00 0x40800000 0x00 0x00014000>, /* DMA */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  68  			 <0x00 0x43000000 0x00 0x43000000 0x00 0x00080000>; /* CTRL MMRs */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  69  		#address-cells = <2>;
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  70  		#size-cells = <2>;
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  71  
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17 @72  		 cbass_wakeup:  bus@43000000 {
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  73  			 compatible = "simple-bus";
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  74  			 ranges = <0x00 0x00b00000 0x00 0x00b00000 0x00 0x00001400>, /* VTM */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  75  				  <0x00 0x04080000 0x00 0x04080000 0x00 0x00008000>, /* PDCFG */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  76  				  <0x00 0x04201000 0x00 0x04201000 0x00 0x00008000>, /* GPIO */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  77  				  <0x00 0x2b100000 0x00 0x2b000000 0x00 0x00200400>, /* TIMER */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  78  				  <0x00 0x40800000 0x00 0x40800000 0x00 0x00014000>, /* DMA */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  79  				  <0x00 0x43000000 0x00 0x43000000 0x00 0x00080000>; /* CTRL MMRs */
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  80  			 #address-cells = <2>;
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  81  			 #size-cells = <2>;
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  82  			 bootph-all;
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  83  		 };
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  84  	};
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  85  };
0cda08c8e7b605 Vignesh Raghavendra 2024-11-17  86  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
