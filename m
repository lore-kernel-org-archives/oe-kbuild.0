Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1424B04AF
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Aug 2026 00:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786925910; cv=none; b=AEad2JMNbDCRUCdCA9FX2W7LIDL+URpe4bIWCnBhYfQHpoghjFzB/VsTcC9MHh8GesYvI/O0xqcb4msqc+0LHxVs8lJDR5sgpYydIUXKdxERmECG4DPkhIUf0+7jIEhrLUpPbUIPyQ7pRZyFVnKLFfdGRupatfLDKvKxQU9GGaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786925910; c=relaxed/simple;
	bh=ZZawxMNesvTAJcuatTl4K05QrayLlU3chdSI2vox7m0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F+1hz7qBcyd6qyep1HmQfS0zE43gmkpNBMi9FF9e6Ci6SsaznxHEyQpxGDLQ2N18Q/RfJVEs4MslhlVdy83GcdMra7T/sFgGgbn+OgDmzVPv/g/MCkX7saa+YXjYZjYotu+FNKMTxWKk6tro5c4EpdvcbQOp69aZhJ1SCQPlTkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDKv79Ae; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDKv79Ae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786925908; x=1818461908;
  h=date:from:to:cc:subject:message-id;
  bh=ZZawxMNesvTAJcuatTl4K05QrayLlU3chdSI2vox7m0=;
  b=HDKv79AejCGEpq7W0uGUE74IbQ06rQh2jHAl/Tmmy7fq5jHJ5k1vNNfk
   n4QR189e9tDojOrfVmDSN+OLs96uwOY1ECt1ef8F/BUpmaFNtrv60IUrH
   6JiiuUeTq1kYmaYYGgUS3+UJU1BJiS6mJw03OOIX3n59YxUse68CWIEuZ
   eegxek9u9pYpKVEpmQWW5fgYQKq0mRy94JIq5rmJgnR89lMtvYpL3IoYF
   ZJPJXuh56bUbEVAVgDloGu0dUaW5SFeVqyU7YpAhttKcYvb/uFbLDNXu4
   B/fYAmTRwSqKzN5Zd9nLuwp7TUbFtTIvCvEyeWrzUecpldoBidsOp/TXZ
   A==;
X-CSE-ConnectionGUID: 5U1yG0XwSMefYEy4Jw59cA==
X-CSE-MsgGUID: SSsqLeTKRS+z9H99I4lpeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="104780846"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="104780846"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 17:18:27 -0700
X-CSE-ConnectionGUID: YzgbMr/sRMaWAIrWhoItKg==
X-CSE-MsgGUID: zD5I4BTwTTC932h/+6t5HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="261014167"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 16 Aug 2026 17:18:26 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvl3Y-000000006iP-1MPu;
	Mon, 17 Aug 2026 00:18:24 +0000
Date: Mon, 17 Aug 2026 02:17:46 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dtb:
 backlight@76 (awinic,aw99706): 'enable-gpios' is a required property
Message-ID: <202608170237.IhJo7vY0-lkp@intel.com>
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
TO: Pengyu Luo <mitltlatltl@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pengyu-Luo/dt-bindings-arm-qcom-Document-Lenovo-Legion-Y700-Gen4/20260811-103627
head:   2c4ddee5c903f029247b90aa92c98ee7245891e5
commit: 2c4ddee5c903f029247b90aa92c98ee7245891e5 arm64: dts: qcom: sm8750: Add Lenovo Legion Y700 Gen4
date:   6 days ago
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-2053-20260815 (https://download.01.org/0day-ci/archive/20260817/202608170237.IhJo7vY0-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project daa9d09970fed49996f42a8f7000b584f295991d)
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608170237.IhJo7vY0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608170237.IhJo7vY0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts:179.17-182.5: Warning (unit_address_vs_reg): /reserved-memory/splash-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/qcom/sm8750.dtsi:3164.27-3251.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8750.dtsi:3273.27-3336.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dtb: backlight@76 (awinic,aw99706): 'enable-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/leds/backlight/awinic,aw99706.yaml
>> arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dtb: backlight@76 (awinic,aw99706): Unevaluated properties are not allowed ('enable-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/backlight/awinic,aw99706.yaml
>> arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dtb: pcie@1c00000 (qcom,pcie-sm8750): Unevaluated properties are not allowed ('vdda-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
