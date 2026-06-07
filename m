Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF74421767D
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Jun 2026 03:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780803888; cv=none; b=hr+QlP1DJAuaAdrw5dYIxiDaYVdc6Fa6es//v/qY60z84vJp5acsv/fGQz4DVC/FOVn5EhNZA/wDaxuDr6+dilAUEDnYdMjyvb9+HLGBQ7BPTYbeiNqdoCntBL2k+6Sl/9PZdz63uVAJhC5G31f/hw1zqgXb3tIf7O5oKE0py0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780803888; c=relaxed/simple;
	bh=+7rZhfSdRQ053yShyCeDSFqiXA4Gn5kNZCNQ9VP2iP4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hfIWckIkFGCpHBJk3FM7u7DZV+OQpa5T6Q+I+liqFzM093aiTt4MQ8l8Fj/YyWJ7v3hsIxzKqePmAJgh5sYatbclOs+qplFOxtTDHYaDVOaUR75Xd18mBSoltLHsymEAOweR/a86iklJr89Rd9040uPZ6F1FjfGFTITywmD6FZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cVv0KSgR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cVv0KSgR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780803887; x=1812339887;
  h=date:from:to:cc:subject:message-id;
  bh=+7rZhfSdRQ053yShyCeDSFqiXA4Gn5kNZCNQ9VP2iP4=;
  b=cVv0KSgRjrBx/YtGvuIHSjSh9kUNcogO/Gt7cMYggRuLT9+PlJvb1ud2
   hLbt+DY3IbtvR5fuCl+p9d2Myg0zYkvgj0c8MaDmnG7VfSGbmwGg0b7BG
   myK6892kIQyvHOC5u1ItJ/fbV1vOFi8mgq2T7zErGfHJywYj+FxPktbsN
   J7AGzvHVqSn8KPi6WDCPnFrulE7E+VrXT2TvvCRyuJPBdcawX+5Kr6jP5
   SRNkkJNzsQkTYoTHgcJ13B0gchSKoEnhVvjah/PzqtkffOR0Ch0TJm8v7
   JZVrwaLyak+Yi+K2T5s4FkcGVoJ/S3mW3bhlQZHHoGl3qGOhSnwtW9CPl
   w==;
X-CSE-ConnectionGUID: pCGy7xEUS62EYuUvFcABXg==
X-CSE-MsgGUID: oPMdGJM2TgODbHqPI3567g==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="81577874"
X-IronPort-AV: E=Sophos;i="6.24,192,1774335600"; 
   d="scan'208";a="81577874"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 20:44:47 -0700
X-CSE-ConnectionGUID: Z8j4FYNsRteuh7ytuze5gQ==
X-CSE-MsgGUID: Kvx6PyiDSnOX6R2TxJixgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,192,1774335600"; 
   d="scan'208";a="250303468"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 06 Jun 2026 20:44:45 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wW4RG-000000002zN-40fV;
	Sun, 07 Jun 2026 03:44:42 +0000
Date: Sun, 07 Jun 2026 05:43:46 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb:
 ethernet-phy@1c (ethernet-phy-id004d.d101): Unevaluated properties are not
 allowed ('snps,reset' was unexpected)
Message-ID: <202606070511.NtxPY7MD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Daniel Thompson <daniel@riscstar.com>
CC: 0day robot <lkp@intel.com>
CC: Alex Elder <elder@riscstar.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Alex-Elder/dt-bindings-net-qca-qca808x-Add-regulator-properties/20260605-091912
head:   a2cf643cd5401eea03d3f1a49d81e7d066ae6047
commit: a2cf643cd5401eea03d3f1a49d81e7d066ae6047 arm64: dts: qcom: qcs6490-rb3gen2: enable TC9564 with a single QCA8081 phy
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2051-20260605 (https://download.01.org/0day-ci/archive/20260607/202606070511.NtxPY7MD-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260607/202606070511.NtxPY7MD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606070511.NtxPY7MD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5463.26-5538.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pcie@0,0 (pci1179,0623): i2c-parent: [[217, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/toshiba,tc9563.yaml
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: ethernet-phy@1c (ethernet-phy-id004d.d101): Unevaluated properties are not allowed ('snps,reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qca,qca808x.yaml
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[401, 402]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[401, 402]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml
--
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pcie@0,0 (pci1179,0623): i2c-parent: [[530, 51]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/toshiba,tc9563.yaml
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pcie@0,0 (pci1179,0623): i2c-parent: [[217, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/toshiba,tc9563.yaml
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pcie@0,0 (pci1179,0623): i2c-parent: [[530, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/toshiba,tc9563.yaml
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: ethernet-phy@1c (ethernet-phy-id004d.d101): Unevaluated properties are not allowed ('snps,reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qca,qca808x.yaml
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[401, 402]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[401, 402]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml
--
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pcie@0,0 (pci1179,0623): i2c-parent: [[217, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/toshiba,tc9563.yaml
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: ethernet-phy@1c (ethernet-phy-id004d.d101): Unevaluated properties are not allowed ('snps,reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qca,qca808x.yaml
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[401, 402]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[401, 402]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
