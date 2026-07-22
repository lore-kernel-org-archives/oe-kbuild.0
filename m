Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7B834D929
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Jul 2026 21:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784754320; cv=none; b=QgpcnjCBwWQIV4c1sOVvqKMZ7dxaUR8BAVQAWZKfta8eNmG+o4lJloX3sL0XtpMQ58p4oj28yUb9PiWwC2f6UOuClVoGpO5iatKJ97cLvj5ng4Vw//vC19oCIdBNAfj6cB/Vw88nDdXOe3lb82Cn7af8wfOP1L/FzRs9Lr+9y9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784754320; c=relaxed/simple;
	bh=tJG1N11AkpbwX22YfRm+pcQNzIujtjdcTte1ILQTrmU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LqaSflvgLg+WgQAaDaV6TGhXoJKDnZAVmVjN4cr/KITO4qBd/tsBVM+bt8+I63jxAkZ0B40IGrsHTr0k+sMydm6ZBgKMH/RSagaXfZE2BtKGQZUrQOAeZDk+8hUgLe8G7TU5fQT1eL4xvLwDk21WFdQLOLDlXL4iTzQEFJtXnKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MMa9PTg9; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MMa9PTg9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784754319; x=1816290319;
  h=date:from:to:cc:subject:message-id;
  bh=tJG1N11AkpbwX22YfRm+pcQNzIujtjdcTte1ILQTrmU=;
  b=MMa9PTg9O8WUK+j/QiPl0NWlteXD5Sai5wIAObiz7EZJEag2cUDLYZww
   pjkYZutkK+GzIj64F2sR4zw7qQgRk4TXkbuedryoUjrDGMMwQ8OLMZzwF
   1qcs641VqoESN/pzHJS6hRtiobregV/mLDUpbaxEjY5KZW2A6YvaXceyT
   B9eMc6ilhvp/TuNA5zB1IePoqmxOIsxgRk4SEki9KrUAZxGYs6buU4yYj
   IgdcI2tvWauIGn6RDQJ5V2e9hfDR7eXcRlTN05h3Bxp8geKLbpIRp+rSB
   MHcp5u0dCSTOTEo/qEQHlcc/dvEg//5lv1ouBNAIchoSDMW5e0PQkuwJC
   w==;
X-CSE-ConnectionGUID: sRBVK8elR4O9bWyuCBsi/Q==
X-CSE-MsgGUID: s/KNKkvWTnumWBuuPeFxOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="72944627"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="72944627"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 14:05:19 -0700
X-CSE-ConnectionGUID: dP53AYbsSkaMsWLIGt0dvg==
X-CSE-MsgGUID: rLowUC0JR4W3VMXP0Xny4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="261994338"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 22 Jul 2026 14:05:17 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wme7v-000000000Xu-1I8c;
	Wed, 22 Jul 2026 21:05:15 +0000
Date: Wed, 22 Jul 2026 23:04:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb:
 /soc@0/i2c@f9963000/touch@2c: failed to match any schema with compatible:
 ['adi,ad7147_captouch']
Message-ID: <202607222219.IZNudHRB-lkp@intel.com>
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
TO: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Dmitry Baryshkov <lumag@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   248951ddc14de84de3910f9b13f51491a8cd91df
commit: 7db5fbe508deedec6c183d5056cf3c504c027f40 arm64: dts: qcom: msm8994-octagon: Fix Analog Devices vendor prefix of AD7147
date:   7 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-2055-20260721 (https://download.01.org/0day-ci/archive/20260722/202607222219.IZNudHRB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260722/202607222219.IZNudHRB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7db5fbe508de ("arm64: dts: qcom: msm8994-octagon: Fix Analog Devices vendor prefix of AD7147")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607222219.IZNudHRB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: usb@f92f8800 (qcom,msm8994-dwc3): interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: usb@f92f8800 (qcom,msm8994-dwc3): interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: usb@f92f8800 (qcom,msm8994-dwc3): interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: /soc@0/i2c@f9924000/tas2553@40: failed to match any schema with compatible: ['ti,tas2552']
>> arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: /soc@0/i2c@f9963000/touch@2c: failed to match any schema with compatible: ['adi,ad7147_captouch']
--
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: usb@f92f8800 (qcom,msm8994-dwc3): interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: usb@f92f8800 (qcom,msm8994-dwc3): interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: usb@f92f8800 (qcom,msm8994-dwc3): interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: /soc@0/i2c@f9924000/tas2553@40: failed to match any schema with compatible: ['ti,tas2552']
>> arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: /soc@0/i2c@f9963000/touch@2c: failed to match any schema with compatible: ['adi,ad7147_captouch']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
