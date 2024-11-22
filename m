Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEFD524B0
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Nov 2024 14:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732285720; cv=none; b=lDSEwIP3k3/wkXhxRPgL28A04/ahXpxEpIRpunLCvWo/DmeltjoHlpotQFrg5k3vmioUH3AGERlS+TsmImRUUG9NIDlrLyvvNBTwXtZRNhRgKs0lPa49xMm7TMaVSFDLryZSKpKu2udwua/cm58YBTyWtTFXf/LJIFcPBkhHCLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732285720; c=relaxed/simple;
	bh=cIXLv/QjwYq5CxLDvJa/sNduKGb4YFk0bZzhR8si3ro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ViQPeC9CSEg4KPp2+IUNCbKt7iSBRkhRk0UVSOHbyKoE4ViKOu3etHdL47feJmDSOzHQ44eVgtpZsuycteLksEBlIog+kLJFZokpCmRNU2EoUQ45izEdfbiwUoX39zPoL4CtmMhqjn1GbyAhArDnflJjvaObjyCv1FeMfHfiTWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EcvZ8Nfy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EcvZ8Nfy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732285718; x=1763821718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cIXLv/QjwYq5CxLDvJa/sNduKGb4YFk0bZzhR8si3ro=;
  b=EcvZ8NfyUMmIl8LNV4gZR1knD4ODhzaJJy+3ZzdkoMzzaa7Ta3bmV6jI
   dvDueX913jDk3IqXGhKOMlBcmyjK4I79yblB4djA/hdj2y9Roo3Gl02T3
   GX0pWjQenbDk2qLwOV202tAZfRg0S/8EmLJe13qW/7n2RnBf2fLPupXkh
   YBH3fycsaorghymvlv8XmMgyi1VPqY1W5NAHfezQiK4HI/SxrjSIrBhB/
   Tz1hy+7kogaWpSG72DjzIGew/gchbqAJ0h7JSbQ+VlSDwNjYD6KUBojuQ
   Zzapw/Gu6IZ85CuE8C1aPHGELmpRKxAJcfKmEwZSBVqxxSTUPugmNDmU5
   w==;
X-CSE-ConnectionGUID: YQnybjgSSUG9bJJnYRICIg==
X-CSE-MsgGUID: W6Kp+NnKRUSyQFkHVoDFTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="43822152"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="43822152"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 06:28:38 -0800
X-CSE-ConnectionGUID: TYI57IrrRAGbW29OVAuhwA==
X-CSE-MsgGUID: a57a/7h6RpeicIDzZ9RlTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="95674355"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Nov 2024 06:28:36 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEUeA-0003zD-09;
	Fri, 22 Nov 2024 14:28:34 +0000
Date: Fri, 22 Nov 2024 22:28:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 07/11] ARM: dts: socfpga: add Mercury AA1 combinations
Message-ID: <202411222201.EziFrHcv-lkp@intel.com>
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
In-Reply-To: <20241116131025.114542-8-l.rubusch@gmail.com>
References: <20241116131025.114542-8-l.rubusch@gmail.com>
TO: Lothar Rubusch <l.rubusch@gmail.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: dinguyen@kernel.org
CC: marex@denx.de
CC: s.trumtrar@pengutronix.de
CC: l.rubusch@gmail.com
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Lothar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.12-rc7]
[also build test WARNING on linus/master next-20241121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lothar-Rubusch/ARM-dts-socfpga-add-Enclustra-boot-mode-dtsi/20241121-092540
base:   v6.12-rc7
patch link:    https://lore.kernel.org/r/20241116131025.114542-8-l.rubusch%40gmail.com
patch subject: [PATCH v5 07/11] ARM: dts: socfpga: add Mercury AA1 combinations
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-052-20241121 (https://download.01.org/0day-ci/archive/20241122/202411222201.EziFrHcv-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411222201.EziFrHcv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411222201.EziFrHcv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-a10-ecc-manager']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/eccmgr/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac-a10']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/eccmgr/l2-ecc@ffd06010: failed to match any schema with compatible: ['altr,socfpga-a10-l2-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/eccmgr/ocram-ecc@ff8c3000: failed to match any schema with compatible: ['altr,socfpga-a10-ocram-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/eccmgr/emac0-rx-ecc@ff8c0800: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/eccmgr/emac0-tx-ecc@ff8c0c00: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/eccmgr/sdmmca-ecc@ff8c2c00: failed to match any schema with compatible: ['altr,socfpga-sdmmc-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/eccmgr/dma-ecc@ff8c8000: failed to match any schema with compatible: ['altr,socfpga-dma-ecc']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/eccmgr/usb0-ecc@ff8c8800: failed to match any schema with compatible: ['altr,socfpga-usb-ecc']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: flash@0: Unevaluated properties are not allowed ('partition@raw', 'u-boot,dm-pre-reloc' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: flash@0: 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/sysmgr@ffd06000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: timer0@ffc02700: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: timer1@ffc02800: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: timer3@ffd00100: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
