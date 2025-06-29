Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDD51754B
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Jun 2025 04:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751170788; cv=none; b=P/E7f5GKNM0N5LKKKtxw4zgQRSRisp5I2NNcFpurkOmcF8PQ9N2QslCjOcYfigVubxZFNPX9s1FOIjIH1lZk5gG/eJhbvarpBLjpcE1EK3DLuwMzxUthPmnmKEVxFTLB7ilMrnpFtKtRgBicWj41KkDpZIU93jaWMvHva4Bqc84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751170788; c=relaxed/simple;
	bh=P9z+BoS6utNUYoIe4EACVRMU99y4RMyF4TvTQ6ib8e4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WPjrXbbwadsGTreG0FRICJlq9o1qrcLRERgPqRvoPD3Tk6OXzI27n5oWlcEPNvMLFSjRK5wqtuxbKj2rfKx7E7g9xJ5bcD1LDlwEoYaPck1wXjW17fhuYv+HIREhsai+Eb/1bLP9DPE8tDJqR4+DcHB+EOjvVlT1TxyqrCnIfmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KgM0ez2d; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KgM0ez2d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751170784; x=1782706784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P9z+BoS6utNUYoIe4EACVRMU99y4RMyF4TvTQ6ib8e4=;
  b=KgM0ez2dnzgX6qByvK4F8kiOSMhnGVIF3gK/5eXJkMefyVOp9JcMX1MJ
   lQHET2PsVYoD8/ieV1cHJfHtP4fNdlTF+bWde7rtx+lKKhE93dyjwtXYc
   zHD1vWwZsp1uIOOW2PnKlGDECX2XUGptMwF5AzUIUKfxU+1K7V56Iw/gN
   HM1OCGpR62U+OU8n6VP88jCk+Yz8zFOOYMe/qCQ5GvfwPjn+TGh1OZdJ7
   VDons+Rzm1PQddb9dCdNBfof4ZYtnhzGoEb0mbCQNV/HiAUzgnOvdNZeH
   j9J8sVuM+a1StwaerMeAIZW8mp+t0B6s1BXfxmGhDswhXDorHAByj6BZo
   Q==;
X-CSE-ConnectionGUID: zkLqFCsqRPmF7SffrP+xRQ==
X-CSE-MsgGUID: R2L4sNJ4QrGhuNCnQT39jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="53298065"
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="53298065"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 21:19:44 -0700
X-CSE-ConnectionGUID: IkFuZfFBSSqgcTDtA77Lbg==
X-CSE-MsgGUID: 6tyX7KQRTBeeqvAgSYtPWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="184064602"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Jun 2025 21:19:42 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVjW0-000Xec-2I;
	Sun, 29 Jun 2025 04:19:40 +0000
Date: Sun, 29 Jun 2025 12:19:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCHv4] dt-bindings: net: convert socfpga-dwmac.txt to DT
 schema
Message-ID: <202506291142.5nkvkiSd-lkp@intel.com>
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
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20250627 (https://download.01.org/0day-ci/archive/20250629/202506291142.5nkvkiSd-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506291142.5nkvkiSd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506291142.5nkvkiSd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi:581.10-630.5: Warning (simple_bus_reg): /soc@0/eccmgr: missing or empty reg/ranges property
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: cb-intosc-hs-div2-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: cb-intosc-ls-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: f2s-free-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('mdio0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
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
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('mdio0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: rstmgr@ffd11000 (altr,stratix10-rst-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,stratix10-rst-mgr'] is too short
   	'altr,rst-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/reset/altr,rst-mgr.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
