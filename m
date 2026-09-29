Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344E4515881
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Sep 2026 11:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790682241; cv=none; b=OEnaPDohy2ztZ04QKZf0OKR2vJHS/XJ8spMlhYy9fwVeTPQwiQSHlo+ozytRhNnzZNiCtusFAhxGyphq5zkA3XdZqdK4Uf4ju66NMfrtZbiSR+CIl/TydlByB+a86rywuO5Q6JJJ3dTgoTSNJBpWQfjmclCAhYM9JNm26ckSA7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790682241; c=relaxed/simple;
	bh=L9vKjGRhO8gSnOR2Tp11TZAfi4Q/pFx85RCQdMicLeY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XcqOGHqpP4THaapBWDEP7TZ7a5/tRNF1NjqFTYDy7wHXquMwHSciPyLeaXSy7g7tFLPXNao21R9TDAgAszRsrFcOSNrl0DU567yiS7jk9rJdNEyjAj7aCDJlZOCBy/XnaEEvC87k/PPN4KTjtGwSJx1ZMlzXP0ySXbP0icaXcFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XTlrVQpK; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XTlrVQpK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790682239; x=1822218239;
  h=date:from:to:cc:subject:message-id;
  bh=L9vKjGRhO8gSnOR2Tp11TZAfi4Q/pFx85RCQdMicLeY=;
  b=XTlrVQpKI3QZVuJLy9qrNl6BMgavyTA/JKnj88tnQg5maSibvgI8wP3r
   JHNaqfXZGAO6uj5JYhiXzk33HlcfrUfkZTs/9U9SBMP8v0qXlQjcOGGFm
   VdC7SnEL+12KOayE5DpLtcqRa1oiWKxvn1aRwdufK0qgwnxC5TWW9IGp4
   j5bfEEllXQZck4qCvIZwMklL27aClGhvOvbtJmMKNs223eXzBrhNgXF6a
   1n5WUB7xqbb6jw9lWkqpuQWTpvgttrBafJgbC6DaTdJDmR6X4MA47cOzD
   4jp0gtJI67EEX4eRX7Ehe2xQFCAD1k3w0CCwKaHBBnSdC5Gfujv5iEbN7
   A==;
X-CSE-ConnectionGUID: mmV281PWTsarvnSVg5cG5Q==
X-CSE-MsgGUID: Oa8pSRr7Q12SYoe5z296xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="116929425"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="116929425"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 04:43:59 -0700
X-CSE-ConnectionGUID: udD7BEhbSXygv8bhpzwt6g==
X-CSE-MsgGUID: f5ToUuJ3TFyfhFgdimK6+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="271838876"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 29 Sep 2026 04:43:57 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBWFX-000000001OR-2TQU;
	Tue, 29 Sep 2026 11:43:55 +0000
Date: Tue, 29 Sep 2026 13:43:04 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:clk-for-7.4 41/147]
 arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: clock-controller@100000
 (qcom,gcc-sm8150): 'power-domains' is a required property
Message-ID: <202609291359.q6ykkYZR-lkp@intel.com>
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
TO: Abel Vesa <abel.vesa@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux clk-for-7.4
head:   ea31ddaa31e9763e7ce7683947c3d37746b371ad
commit: 80d35f528a46b5f1e9777ce83de48fd9efa7c422 [41/147] dt-bindings: clock: qcom: gcc-sm8150: Add CX power domain
:::::: branch date: 13 hours ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2404-20260927 (https://download.01.org/0day-ci/archive/20260929/202609291359.q6ykkYZR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609291359.q6ykkYZR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609291359.q6ykkYZR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3979.27-4053.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4074.27-4129.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:163.9-178.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: clock-controller@100000 (qcom,gcc-sm8150): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm8150.yaml
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3979.27-4053.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4074.27-4129.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:163.9-178.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: clock-controller@100000 (qcom,gcc-sm8150): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm8150.yaml
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3979.27-4053.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4074.27-4129.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:163.9-178.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb: clock-controller@100000 (qcom,gcc-sm8150): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm8150.yaml
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3979.27-4053.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4074.27-4129.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: clock-controller@100000 (qcom,gcc-sm8150): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm8150.yaml
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3979.27-4053.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4074.27-4129.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:163.9-178.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: clock-controller@100000 (qcom,gcc-sm8150): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm8150.yaml
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3979.27-4053.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4074.27-4129.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:163.9-178.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb: clock-controller@100000 (qcom,gcc-sm8150): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm8150.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
