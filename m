Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA63C199949
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Jan 2026 01:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767921738; cv=none; b=Vkti5dhmnHaE+8gE0ZFINjJzqptHYiqYrJUvR55ApO+E/Du0QoNdL1Z0UYXPxXhWkPTqdooKxFDLL9Qn7h7Nzln+qer+PjaJI33uibf88mfuInWFLemRdl0yT1CRF1EoZgwSf9sGv07Hcr9OBa5TCx+6j1+hUMVGNOj/GEg7asM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767921738; c=relaxed/simple;
	bh=Wx88t9fpXLw2Kna6YJvJex2xzYBMh8WGfYjvmCjfetg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WYNy384XTJ7AmNGmNh/Qkmnu60bDjVGAXTXC+Eggj3AB3a28H27D/iSD2w9eTdd02alhwiekHYMyG4ZKgvBfKSRsi3GDT/3uARnVihlbIQK/3ufBJTcEK0nNgRuPzO0OgD6kRjDdM6WYqQF9X7KFAxeFpBejbIQYbJnsEfRewPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PoDR71Cg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PoDR71Cg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767921737; x=1799457737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wx88t9fpXLw2Kna6YJvJex2xzYBMh8WGfYjvmCjfetg=;
  b=PoDR71CgdA21wvfdtpcCalwmTNwD8gIo8dYvYzRhGA64d4py3b6OtgoM
   gi6fzb7tcOZusuKVs/A+3cH2+tXAlgiygD71AzF7irITgqpOPTh1vkEC/
   UlqofL3Y6y+N+m1cWHfSWJLbPSXQZ79hDoP1wLJOAEqq0gGoRLbA9zQda
   Hr01Yhow6oRK9z3JYHYBNzG7tEhoT8xhrDwLP7M3sBXkd51Gd77PpTSCW
   onrsEGm7yg6S/P6A2AjIOcJgqjYGrok8GS2Ne4Mj7q2QbmI/plKTPwmmL
   r2q+iE5EEuHtg+RcdjACbfn9KOkMJn6TBoSjSIrgUl8nnQ09cfntGU+h4
   g==;
X-CSE-ConnectionGUID: Jk6bRtnoS/iaDCfRGSxMWQ==
X-CSE-MsgGUID: M07Ucld9SPCMRe63NS1R/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="91969065"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="91969065"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 17:22:16 -0800
X-CSE-ConnectionGUID: MBWXGX90S+iUZ0KYoohdFw==
X-CSE-MsgGUID: rPHO7tjlT/2Yab7EQKW7kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="208398597"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 08 Jan 2026 17:22:15 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve1Cf-000000001uS-0TVx;
	Fri, 09 Jan 2026 01:22:13 +0000
Date: Fri, 9 Jan 2026 02:21:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 08/13] arm64: dts: broadcom: Use preferred node names
Message-ID: <202601090258.QKbamPc3-lkp@intel.com>
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
In-Reply-To: <20260106-dt-dtbs-broadcom-fixes-v1-8-ba45874e4553@kernel.org>
References: <20260106-dt-dtbs-broadcom-fixes-v1-8-ba45874e4553@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6cd6c12031130a349a098dbeb19d8c3070d2dfbe]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/ARM-dts-broadcom-bcm2711-Fix-simple-bus-node-names/20260107-101623
base:   6cd6c12031130a349a098dbeb19d8c3070d2dfbe
patch link:    https://lore.kernel.org/r/20260106-dt-dtbs-broadcom-fixes-v1-8-ba45874e4553%40kernel.org
patch subject: [PATCH 08/13] arm64: dts: broadcom: Use preferred node names
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2051-20260107 (https://download.01.org/0day-ci/archive/20260109/202601090258.QKbamPc3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601090258.QKbamPc3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601090258.QKbamPc3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'arm,cci-400-pmu' was expected
   	'arm,cci-500-pmu,r0' was expected
   	'arm,cci-550-pmu,r0' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,cci-400.yaml
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: eeprom@0 (atmel,at25): 'pagesize' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: eeprom@0 (atmel,at25): 'size' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: eeprom@0 (atmel,at25): 'address-width' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml
>> arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: nand-controller@66460000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: spi@66470200 (brcm,spi-ns2-qspi): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dtb: soc (simple-bus): iprocmed: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dtb: cci@65590000 (arm,cci-400): pmu@9000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['arm,cci-400-pmu,r1', 'arm,cci-400-pmu'] is too long
   	'arm,cci-400-pmu,r0' was expected
   	'arm,cci-400-pmu' was expected
   	'arm,cci-500-pmu,r0' was expected
   	'arm,cci-550-pmu,r0' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,cci-400.yaml
>> arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dtb: nand-controller@66460000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
   arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dtb: spi@66470200 (brcm,spi-ns2-qspi): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml
--
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:110.27-114.5: Warning (unit_address_vs_reg): /cpus/l2-cache@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:116.29-120.5: Warning (unit_address_vs_reg): /cpus/l2-cache@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:122.29-126.5: Warning (unit_address_vs_reg): /cpus/l2-cache@200: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:128.29-132.5: Warning (unit_address_vs_reg): /cpus/l2-cache@300: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/broadcom/stingray/stingray-pinctrl.dtsi:43.25-346.5: Warning (avoid_unnecessary_addr_size): /hsls-bus@68900000/pinmux@14029c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:46.9-52.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@0: duplicate unit-address (also used in node /cpus/l2-cache@0)
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:62.11-68.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@100: duplicate unit-address (also used in node /cpus/l2-cache@100)
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:78.11-84.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@200: duplicate unit-address (also used in node /cpus/l2-cache@200)
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:94.11-100.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@300: duplicate unit-address (also used in node /cpus/l2-cache@300)
>> arch/arm64/boot/dts/broadcom/stingray/bcm958742k.dtb: nand-controller@360000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
   arch/arm64/boot/dts/broadcom/stingray/bcm958742k.dtb: i2c@26100 (brcm,iproc-nic-i2c): reg: [[155904, 256], [6292488, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml
--
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:110.27-114.5: Warning (unit_address_vs_reg): /cpus/l2-cache@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:116.29-120.5: Warning (unit_address_vs_reg): /cpus/l2-cache@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:122.29-126.5: Warning (unit_address_vs_reg): /cpus/l2-cache@200: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:128.29-132.5: Warning (unit_address_vs_reg): /cpus/l2-cache@300: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/broadcom/stingray/stingray-pinctrl.dtsi:43.25-346.5: Warning (avoid_unnecessary_addr_size): /hsls-bus@68900000/pinmux@14029c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:46.9-52.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@0: duplicate unit-address (also used in node /cpus/l2-cache@0)
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:62.11-68.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@100: duplicate unit-address (also used in node /cpus/l2-cache@100)
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:78.11-84.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@200: duplicate unit-address (also used in node /cpus/l2-cache@200)
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:94.11-100.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@300: duplicate unit-address (also used in node /cpus/l2-cache@300)
>> arch/arm64/boot/dts/broadcom/stingray/bcm958742t.dtb: nand-controller@360000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
   arch/arm64/boot/dts/broadcom/stingray/bcm958742t.dtb: i2c@26100 (brcm,iproc-nic-i2c): reg: [[155904, 256], [6292488, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml
--
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:110.27-114.5: Warning (unit_address_vs_reg): /cpus/l2-cache@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:116.29-120.5: Warning (unit_address_vs_reg): /cpus/l2-cache@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:122.29-126.5: Warning (unit_address_vs_reg): /cpus/l2-cache@200: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:128.29-132.5: Warning (unit_address_vs_reg): /cpus/l2-cache@300: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/broadcom/stingray/stingray-pinctrl.dtsi:43.25-346.5: Warning (avoid_unnecessary_addr_size): /hsls-bus@68900000/pinmux@14029c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:46.9-52.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@0: duplicate unit-address (also used in node /cpus/l2-cache@0)
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:62.11-68.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@100: duplicate unit-address (also used in node /cpus/l2-cache@100)
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:78.11-84.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@200: duplicate unit-address (also used in node /cpus/l2-cache@200)
   arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi:94.11-100.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@300: duplicate unit-address (also used in node /cpus/l2-cache@300)
>> arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: nand-controller@360000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: i2c@26100 (brcm,iproc-nic-i2c): reg: [[155904, 256], [6292488, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
