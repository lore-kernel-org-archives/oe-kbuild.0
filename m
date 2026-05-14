Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F3331E83E
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 01:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778722734; cv=none; b=hxKtu6NtAp/s4iHPftrOBVmppgcbXy0a3RGZAmYfsyOykiGsPzeS2BcjymZi8HNIIK2MazjUd+/q5k0gfeWtq1kB8EJDjTK6pNGt1LqoOg813PIIYPApGDP8Ed1XCaPlsiQIVWgFAY+mZlCpci0nK60Gl8TufukF4wHad9P6pQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778722734; c=relaxed/simple;
	bh=tU3TFMKYNk3aVQ2hbPKN8sbfMOQILCE9J3sNMM2gxuw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ThQwGBOtEk3p0YVLmUsOwRwj6fv4ka0xDNB1IFs0/cGLhwvkTDOksGif8VyQAjsQ6SEyeqSIoEXFbBDvG0PIM3pdltogmsR8zOr7wbgHL2LWhVepRWVgKARJM5sAeBfKEd/4NFKlmqa2i0/CnTMMRVkaa9ATTZKVe9lqPcuCCmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IF/ALCVm; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IF/ALCVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778722733; x=1810258733;
  h=date:from:to:cc:subject:message-id;
  bh=tU3TFMKYNk3aVQ2hbPKN8sbfMOQILCE9J3sNMM2gxuw=;
  b=IF/ALCVmB726UVaFb4unxlbLA/qSB415eNmrXZCBRXeCnX+kWfmF1qr3
   B3hJDYaDJbHRUoDoBV4mPcxzPpaQzRSI3Rz7yEN+Y68EhqVSzbioO9Q2U
   KloF8S7uIJuI7FuU1SyYK04iaw2EweHh8PqOQDu+seDnCJXRXE7xwDRif
   9vx005Ux0A5z0fIZEROdGHQFrl7wUI7mqFPqVa75xwWpPSbiK8CPuw4xo
   Sj9mSRo4krjV2LfjGtLqnYP4k4hpQCTHUov1jwk3XhkRNjkJjGrBXgN8A
   GXUTC010WvTllCTqtRgl1tHolI3KW1iTEHb2FLTwOm+lDSiYWedsYiCvi
   w==;
X-CSE-ConnectionGUID: GESa632GQJmNHtYmD9Ausg==
X-CSE-MsgGUID: gYDzFi/LTGGunbEfBUzBpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="83511617"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="83511617"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 18:38:53 -0700
X-CSE-ConnectionGUID: 0HrMCaOOTi+EZgwmnHvWXg==
X-CSE-MsgGUID: DyC4f54QTgiv8hjTql6ilQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="235593890"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 13 May 2026 18:38:51 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNL2H-000000008iT-2Qs4;
	Thu, 14 May 2026 01:38:49 +0000
Date: Thu, 14 May 2026 03:38:04 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pcie@0,0
 (pci1179,0623): i2c-parent: [[217, 119]] is too short
Message-ID: <202605140312.Y63nyRil-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Dmitry Baryshkov <lumag@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e1914add2799225a87502051415fc5c32aeb02ae
commit: aa7b4bbcb3a1ddf11a94f1500b05a39041efb7b4 arm64: dts: qcom: qcs6490-rb3gen2: Add TC9563 PCIe switch node
date:   4 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-2052-20260513 (https://download.01.org/0day-ci/archive/20260514/202605140312.Y63nyRil-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140312.Y63nyRil-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: aa7b4bbcb3a1 ("arm64: dts: qcom: qcs6490-rb3gen2: Add TC9563 PCIe switch node")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605140312.Y63nyRil-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5343.26-5418.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/kodiak.dtsi:4615.10-4625.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pcie@0,0 (pci1179,0623): i2c-parent: [[217, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/toshiba,tc9563.yaml
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[389, 390]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[389, 390]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml
--
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pcie@0,0 (pci1179,0623): i2c-parent: [[217, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/toshiba,tc9563.yaml
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[389, 390]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[389, 390]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml
--
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pcie@0,0 (pci1179,0623): i2c-parent: [[217, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/toshiba,tc9563.yaml
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[389, 390]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[389, 390]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
