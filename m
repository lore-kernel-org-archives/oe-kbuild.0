Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D1A2C3258
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Jun 2025 13:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751030224; cv=none; b=Muf/S87yT811ZoEK00TBxXCG8++1SMbriY29LhNvy1hxKTzv6MFRP2LhybINpItHstw0c5Co5M3bdMJWZrWGM1eROn9xU/h3QzDFQM7Y5/CPpd6+GMRCHZj68sJkevmYIP9ScW5md466nTC0V7dx3IdLLFJmz22SEHKJnHPOyDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751030224; c=relaxed/simple;
	bh=Hq3+yqgZCN3BXFPKctT+4MPksO+4d9eXsTiLeWU86tI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ductKIi1RLYM7V3vuGwvFBJIvXLqz0sOomf5o1YFz7D1F0HZ8WChGLFVTy9F7mbD58KDDS3Ot+zNTxELZoXXDp8R17GqgPyY1doH8YtM+9hdKQRfNBpOcb1zwMIKWXvP1UNPSBqP5EbxWFdAL1mwhLLLEWSN1AjqRcl0nWV68vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSf604cd; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSf604cd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751030223; x=1782566223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hq3+yqgZCN3BXFPKctT+4MPksO+4d9eXsTiLeWU86tI=;
  b=GSf604cdc7Nhbrt333qHnS5pEqQ9XZn0IlZR7yxx8Xgfr7arCM1amH0o
   4YGk5hnqbG/RhyjqwF88a/RHwIewRj2jg7TbDgaAKBDBMAt3qW9SyvOzi
   4Zn4J8LK66FvROkGG0bfQJBhFif60BLcT5ABtIiL+0011VGbkSnI7UWAb
   /j2NmNs30EUPJ+y3FmHjwT/cOB6MhifJCBVcn/51YRAt5C6MD1YtYd5Tb
   gYm4fNofNhit7i8Z4K+Eaq2UnFMU9wm2otQSUd8w+oeZpE6HlHtBRf94T
   KEeOVg3hlC5IeUtQhbaIjVWoPHULy6+JuSF3VJkXO61bDa2SC2kfYu2ZT
   w==;
X-CSE-ConnectionGUID: PSoJx6RgS2qHy5x845t58w==
X-CSE-MsgGUID: VjDti3c/QR2XobypwDBlfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53466979"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53466979"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 06:17:02 -0700
X-CSE-ConnectionGUID: Qt7+99PORZC49dj6tQL10w==
X-CSE-MsgGUID: /mfs5V/pTOSTt+JOgu8Y1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="183839978"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Jun 2025 06:17:01 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV8ws-000WBq-2o;
	Fri, 27 Jun 2025 13:16:58 +0000
Date: Fri, 27 Jun 2025 21:16:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCHv4] dt-bindings: net: convert socfpga-dwmac.txt to DT
 schema
Message-ID: <202506272102.UItpyO0K-lkp@intel.com>
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
In-Reply-To: <20250624191549.474686-1-dinguyen@kernel.org>
References: <20250624191549.474686-1-dinguyen@kernel.org>
TO: Dinh Nguyen <dinguyen@kernel.org>
TO: robh+dt@kernel.org
TO: krzysztof.kozlowskii+dt@linaro.org
TO: conor+dt@kernel.org
CC: dinguyen@kernel.org
CC: devicetree@vger.kernel.org

Hi Dinh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc3 next-20250627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dinh-Nguyen/dt-bindings-net-convert-socfpga-dwmac-txt-to-DT-schema/20250625-031749
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250624191549.474686-1-dinguyen%40kernel.org
patch subject: [PATCHv4] dt-bindings: net: convert socfpga-dwmac.txt to DT schema
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250627 (https://download.01.org/0day-ci/archive/20250627/202506272102.UItpyO0K-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506272102.UItpyO0K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506272102.UItpyO0K-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:610.10-667.5: Warning (simple_bus_reg): /soc@0/eccmgr: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: f2s-free-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: clock-controller@ffd10000 (intel,agilex-clkmgr): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/intel,agilex.yaml#
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('mdio0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
--
   arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:610.10-667.5: Warning (simple_bus_reg): /soc@0/eccmgr: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: f2s-free-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: clock-controller@ffd10000 (intel,agilex-clkmgr): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/intel,agilex.yaml#
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('mdio0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: nand-controller@ffb90000 (altr,socfpga-denali-nand): Unevaluated properties are not allowed ('flash@0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/denali,nand.yaml#
--
   arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:610.10-667.5: Warning (simple_bus_reg): /soc@0/eccmgr: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: f2s-free-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: clock-controller@ffd10000 (intel,easic-n5x-clkmgr): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/intel,easic-n5x.yaml#
>> arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('mdio0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
