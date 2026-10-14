Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2915C4E1C68
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Oct 2026 10:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973028; cv=none; b=XRvDOeA6lm8Q3gZlGpVIW+qFIesgrKsUZLe76DOLUVA8SqvZCd7akqwLYfNEw7A76A1sIOXtSeBTXeF3fRl7ns1wa2tS40AmIU2ZWHMVl7l/NnkuohCQVb5g/EARyxmpxWWgDMDxfxDBTshbkohDSZ+scXKwKhcd+FwdfZkuBqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973028; c=relaxed/simple;
	bh=xEfAhYJLhY8ciVMTfDd/KPtzWi6CA7n1iV3isXTNdcc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e4LKAJZoLb+gYwVM79kn7S64OLZq/skWDLsrdgXO6QH61SAGxjt4eTUJqL9MAspsU9RUiyJRTlmh+7/icqqkJ2DW7FkeApX/VCCDC2BpXHiPHQ4yFI0OpYkbpp5D42jTsjbB/nPB0O9nK44xW+dn87/jchs0KD9A97fr1uMgTQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k33p2kX5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k33p2kX5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791973019; x=1823509019;
  h=date:from:to:cc:subject:message-id;
  bh=xEfAhYJLhY8ciVMTfDd/KPtzWi6CA7n1iV3isXTNdcc=;
  b=k33p2kX5rTaPOAGv7K/dogr4bovOpho903cSWKTerEfcF7MyhuXWLvql
   OIiYsuZOqOzU0rQoA1IImfK7kUv8Ustx93pz4nGNzjmyx+pNic/UO0sNX
   kJMsynKaMcXYUnPIjR2CloyZMyYNoHgl4zpgDDg8UoQLarK/c/uqOZkRu
   lljNEeF5eDZDMfSIrYxBZv0krrg7GnRgmtVpsWLco/bbhDRQ8j23qIHBA
   YsJwNzlkR6fj42CSCy3JETGbcpz3wB7sPpKYWPuHGCciuw8ZmSagmLU1s
   QcoyJ+s4f5PvUclwGAw+6/4o5iJTzvbQFtLT9Vhh7SiwV86UICC7b6J6G
   w==;
X-CSE-ConnectionGUID: Z/fIEFLBQoSGlXTcMFaEqw==
X-CSE-MsgGUID: d52x/ObyT2m9tlAAu4oMYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="724554"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="724554"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 03:16:58 -0700
X-CSE-ConnectionGUID: Si6+JxT7TeKD3MLmo9QHyg==
X-CSE-MsgGUID: qcFiJShJSMCEtT8fS2RjAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1499538"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 14 Oct 2026 03:16:58 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGw2Y-00000000B15-47Id;
	Wed, 14 Oct 2026 10:16:54 +0000
Date: Wed, 14 Oct 2026 12:16:34 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:wip/eliza-integration-display-on-early-hwe
 27/29] arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dtb:
 display-subsystem@ae00000 (qcom,eliza-mdss): Unevaluated properties are not
 allowed ('hdmi-tx@aea0000' was unexpected)
Message-ID: <202610141225.fuYUxYUJ-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux wip/eliza-integration-display-on-early-hwe
head:   bc8619ef46818e58ca3d967ab1c52ad66162306a
commit: c0204026dbd3bbdc56d5ca86d2c7bc03e446a8f8 [27/29] WIP: arm64: dts: qcom: eliza-evk: Enable Native HDMI, DP, USB and fix DSI-to-HDMI bridge
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261014/202610141225.fuYUxYUJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261014/202610141225.fuYUxYUJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610141225.fuYUxYUJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/eliza.dtsi:3104.27-3191.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/eliza.dtsi:3213.27-3276.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dtb: display-subsystem@ae00000 (qcom,eliza-mdss): Unevaluated properties are not allowed ('hdmi-tx@aea0000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,eliza-mdss.yaml
--
   arch/arm64/boot/dts/qcom/eliza.dtsi:3104.27-3191.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/eliza.dtsi:3213.27-3276.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dtb: display-subsystem@ae00000 (qcom,eliza-mdss): Unevaluated properties are not allowed ('hdmi-tx@aea0000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,eliza-mdss.yaml
--
   arch/arm64/boot/dts/qcom/eliza.dtsi:3213.27-3276.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: display-subsystem@ae00000 (qcom,eliza-mdss): Unevaluated properties are not allowed ('hdmi-tx@aea0000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,eliza-mdss.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
