Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4576D27E074
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Jan 2026 13:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767705110; cv=none; b=Wsc5xPr9otvw0CGFSua4xDUCQZ0nzPC23WCw9GghXWRyWKYOrDCv+eg+QTVavtWFWiq4O1Tb5CzmpOiXR24MQGT3l4QAngLGCGlz+X5T9nNg6EU2AA0zJgV27jlbCoXKzqruglp3aDwL08EnT9jMobeDBeBlgoDX7ZBmf5r5oBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767705110; c=relaxed/simple;
	bh=lRboT0sqgACS5JO+S0SyU1ORDVrqoz1vpBoPh7QG0L8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kegHDK8kNWEu4/1o4x6VVcRBjMojLxNAA8mUNhD8Bk2G5oiOm8x9Ziw381/896Ao4t8HUOjdXZTlNEDt6RgJf28oyrWDaqp5h9b2PjAcBit7q1wURdPp52jcV/TfB/sOvS5Ba124yHH89oogitfqx+QBH4S1H4q8OvVMx/Q8li8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cRqfcdJj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cRqfcdJj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767705107; x=1799241107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lRboT0sqgACS5JO+S0SyU1ORDVrqoz1vpBoPh7QG0L8=;
  b=cRqfcdJj2pV5mgRWpw/PQY6UtU8e9GHVyA30DK2Zdw3LDZvQ+HWt9Y5M
   r1BkH2I64cTYNhz+NqiOlJRzWlApO3yn8oTQDW8fnWP3NsK+Hi7pSEpVP
   uyRZSHG5hpXkdFWiKJDTdtWpidPbwaVLQggV/mTVTEcllnCm9iL5wO4QB
   1tfvPVK0cZgKNNphmguXLZwx0Pvbms/mVU12UBcc3SfP6nwBy9KtGF2Su
   UHIB4Q71ZLh4wukxRRO6sbG4QgjAAU6Ua/t1iNvZSgDj22puhCbHxl42U
   epWdfwOs6bQE9axB3+zuYOWL9qQJdKMK2QtGOTzWpexWcRRQbTeBtHF/2
   Q==;
X-CSE-ConnectionGUID: 7Kxd6MwwTLepRtkwqzNc0A==
X-CSE-MsgGUID: UQJbzrP6TtasZBvVp4536g==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="80518417"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="80518417"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 05:11:46 -0800
X-CSE-ConnectionGUID: pCVvCL9tTBWGC30cdzNl3A==
X-CSE-MsgGUID: DKX2I7EhTPCPzu8m0WrVqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="202546232"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 06 Jan 2026 05:11:45 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vd6qd-000000001Iv-1AmW;
	Tue, 06 Jan 2026 13:11:43 +0000
Date: Tue, 6 Jan 2026 14:11:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/3] dt-bindings: net: altr,socfpga-stmmac: deprecate
 'stmmaceth-ocp'
Message-ID: <202601061425.j2qu0THQ-lkp@intel.com>
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
In-Reply-To: <20260105-remove_ocp-v2-3-4fa2bda09521@kernel.org>
References: <20260105-remove_ocp-v2-3-4fa2bda09521@kernel.org>
TO: Dinh Nguyen <dinguyen@kernel.org>
TO: Maxime Chevallier <maxime.chevallier@bootlin.com>
TO: Andrew Lunn <andrew+netdev@lunn.ch>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Maxime Coquelin <mcoquelin.stm32@gmail.com>
TO: Alexandre Torgue <alexandre.torgue@foss.st.com>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Mamta Shukla <mamta.shukla@leica-geosystems.com>
TO: Ahmad Fatoum <a.fatoum@pengutronix.de>
CC: bsp-development.geo@leica-geosystems.com
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: linux-stm32@st-md-mailman.stormreply.com
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Dinh Nguyen <dinguyen@kernel.org>

Hi Dinh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Dinh-Nguyen/net-stmmac-socfpga-add-call-to-assert-deassert-ahb-reset-line/20260105-201043
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20260105-remove_ocp-v2-3-4fa2bda09521%40kernel.org
patch subject: [PATCH v2 3/3] dt-bindings: net: altr,socfpga-stmmac: deprecate 'stmmaceth-ocp'
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: arm64-randconfig-2051-20260105 (https://download.01.org/0day-ci/archive/20260106/202601061425.j2qu0THQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601061425.j2qu0THQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601061425.j2qu0THQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi:584.10-642.5: Warning (simple_bus_reg): /soc@0/eccmgr: missing or empty reg/ranges property
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): resets: [[9, 32], [9, 40]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): resets: [[9, 33], [9, 41]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): resets: [[9, 34], [9, 42]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
--
   arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi:584.10-642.5: Warning (simple_bus_reg): /soc@0/eccmgr: missing or empty reg/ranges property
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): resets: [[9, 32], [9, 40]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): resets: [[9, 33], [9, 41]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): resets: [[9, 34], [9, 42]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
--
   arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi:584.10-642.5: Warning (simple_bus_reg): /soc@0/eccmgr: missing or empty reg/ranges property
>> arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): resets: [[9, 32], [9, 40]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): resets: [[9, 33], [9, 41]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): resets: [[9, 34], [9, 42]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
--
   arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:612.10-669.5: Warning (simple_bus_reg): /soc@0/eccmgr: missing or empty reg/ranges property
>> arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): resets: [[9, 32], [9, 40]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): resets: [[9, 33], [9, 41]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): resets: [[9, 34], [9, 42]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
--
   arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:612.10-669.5: Warning (simple_bus_reg): /soc@0/eccmgr: missing or empty reg/ranges property
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): resets: [[9, 32], [9, 40]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): resets: [[9, 33], [9, 41]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): resets: [[9, 34], [9, 42]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
--
   arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:612.10-669.5: Warning (simple_bus_reg): /soc@0/eccmgr: missing or empty reg/ranges property
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): resets: [[9, 32], [9, 40]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): resets: [[9, 33], [9, 41]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): resets: [[9, 34], [9, 42]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
--
>> arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): resets: [[6, 32], [6, 40]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: ethernet@10820000 (altr,socfpga-stmmac-agilex5): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: ethernet@10820000 (altr,socfpga-stmmac-agilex5): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: ethernet@10820000 (altr,socfpga-stmmac-agilex5): resets: [[6, 33], [6, 41]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: ethernet@10830000 (altr,socfpga-stmmac-agilex5): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dtb: ethernet@10830000 (altr,socfpga-stmmac-agilex5): reset-names: ['stmmaceth', 'ahb'] is too long
--
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): resets: [[6, 32], [6, 40]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: ethernet@10820000 (altr,socfpga-stmmac-agilex5): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: ethernet@10820000 (altr,socfpga-stmmac-agilex5): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: ethernet@10820000 (altr,socfpga-stmmac-agilex5): resets: [[6, 33], [6, 41]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: ethernet@10830000 (altr,socfpga-stmmac-agilex5): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: ethernet@10830000 (altr,socfpga-stmmac-agilex5): reset-names: ['stmmaceth', 'ahb'] is too long
--
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): resets: [[6, 32], [6, 40]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: ethernet@10820000 (altr,socfpga-stmmac-agilex5): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: ethernet@10820000 (altr,socfpga-stmmac-agilex5): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: ethernet@10820000 (altr,socfpga-stmmac-agilex5): resets: [[6, 33], [6, 41]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: ethernet@10830000 (altr,socfpga-stmmac-agilex5): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dtb: ethernet@10830000 (altr,socfpga-stmmac-agilex5): reset-names: ['stmmaceth', 'ahb'] is too long
--
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): resets: [[6, 32], [6, 40]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: ethernet@10820000 (altr,socfpga-stmmac-agilex5): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: ethernet@10820000 (altr,socfpga-stmmac-agilex5): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: ethernet@10820000 (altr,socfpga-stmmac-agilex5): resets: [[6, 33], [6, 41]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: ethernet@10830000 (altr,socfpga-stmmac-agilex5): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: ethernet@10830000 (altr,socfpga-stmmac-agilex5): reset-names: ['stmmaceth', 'ahb'] is too long
--
   arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:612.10-669.5: Warning (simple_bus_reg): /soc@0/eccmgr: missing or empty reg/ranges property
>> arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): resets: [[9, 32], [9, 40]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): resets: [[9, 33], [9, 41]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): reset-names:0: 'stmmaceth-ocp' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): reset-names: ['stmmaceth', 'ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): resets: [[9, 34], [9, 42]] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
