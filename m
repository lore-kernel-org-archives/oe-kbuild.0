Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F562236E3
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Jan 2026 19:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767728091; cv=none; b=O7m1OAVCjoscI1CVprlHQsFn1TEBZ3d9Yx2Jz9UglMfDlgEkpDPT7bKtML2N9k39u5Ug6LOz9AzdJIbwpQP44pyXtMVp9s51oloB4ZXNycnHje7vb3x9FJSWvMl15M2WaQ91xfZuaPANstlFRXIdSMbdr0JPQy47v3ks3Avcal8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767728091; c=relaxed/simple;
	bh=Ke4gk+ozYTnHX5ILc2MrNqgfq6+TazPrUxItSOAhxSQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CGBisHx+tPX3tF/++E/g33X0OyNwlShTnMPVeZEX0xdaNtZh2ORyA70NI9zD9wYj0Y5QZH829GXsZHEuYzl3zWcMyU4+s8GuwPDcsxggTkx2Ywbw3rXZkl+M8Ravr2U2UMdczya709k5xnT3fP2rpu/VC4K6sER8vyXxv8OmOkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hZCAUj5M; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hZCAUj5M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767728089; x=1799264089;
  h=date:from:to:cc:subject:message-id;
  bh=Ke4gk+ozYTnHX5ILc2MrNqgfq6+TazPrUxItSOAhxSQ=;
  b=hZCAUj5MpTwY1a51dz0rYWdurXMxaZW68fdfV8Tq1IR6TY7FqYBQLyUJ
   VadRiGNIfQevyWqPstYMl5LvtaIsuM5bwh9+WBNdPpE4FV+f7U9Jreqfm
   7UMy72+J99crxPqy3YmZBVG80t2OoyibnlSqoEM0qgKUrtmvi3kr9wEZK
   CMyOUAH+DWfE0Zi9IVSS9JSK55F/7rRL0bYk8iFquH4f9YRMJTfDCRSP2
   gKdLj7Mgr5e811rvkLLWmwnf7HlgvYWrTk0HuZKULxmhprJJAOus/yR2j
   eXZFeJ3nrWtNQehmvSt6FFK+w/L67TrZZd0w1fWaEepWHClxWn5isLM1i
   g==;
X-CSE-ConnectionGUID: 5KgGzYK7Q+2BN8bEsCd4ig==
X-CSE-MsgGUID: BJhHzf8fT6G0k1UgcPwvtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="68295025"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="68295025"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 11:34:49 -0800
X-CSE-ConnectionGUID: G6nau2fKR+ePeTulY05vMg==
X-CSE-MsgGUID: oJgq5FrNRk2Y1uu3NE3j9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="202496154"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 06 Jan 2026 11:34:47 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdCpJ-000000001LV-1oBc;
	Tue, 06 Jan 2026 19:34:45 +0000
Date: Tue, 06 Jan 2026 20:34:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.20 111/126]
 arch/arm64/boot/dts/qcom/monaco-evk.dtb: phy@1c04000
 (qcom,qcs8300-qmp-gen4x2-pcie-phy): clock-names: ['aux', 'cfg_ahb', 'ref',
 'rchng', 'pipe', 'pipediv2'] is too short
Message-ID: <202601062005.BAKvjmT8-lkp@intel.com>
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
TO: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.20
head:   b5a3112bfd5742a5d831c0bdfac2cf6e6796ac9d
commit: 46a7c01e7e9d296ba09bad579ae0277cfb558b24 [111/126] arm64: dts: qcom: qcs8300: enable pcie0
:::::: branch date: 2 hours ago
:::::: commit date: 27 hours ago
config: arm64-randconfig-2052-20260106 (https://download.01.org/0day-ci/archive/20260106/202601062005.BAKvjmT8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601062005.BAKvjmT8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601062005.BAKvjmT8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/monaco.dtsi:2314.4-2317.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:2314.4-2317.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:2314.4-2317.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:2314.4-2317.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:5224.11-5235.7: Warning (graph_child_address): /soc@0/display-subsystem@ae00000/display-controller@ae01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/monaco-evk.dtb: phy@1c04000 (qcom,qcs8300-qmp-gen4x2-pcie-phy): clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
>> arch/arm64/boot/dts/qcom/monaco-evk.dtb: phy@1c04000 (qcom,qcs8300-qmp-gen4x2-pcie-phy): clocks: [[56, 56], [56, 54], [56, 80], [56, 58], [56, 60], [56, 63]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
--
   arch/arm64/boot/dts/qcom/monaco.dtsi:2314.4-2317.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:2314.4-2317.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:2314.4-2317.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:2314.4-2317.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:5224.11-5235.7: Warning (graph_child_address): /soc@0/display-subsystem@ae00000/display-controller@ae01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: phy@1c04000 (qcom,qcs8300-qmp-gen4x2-pcie-phy): clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: phy@1c04000 (qcom,qcs8300-qmp-gen4x2-pcie-phy): clocks: [[56, 56], [56, 54], [56, 80], [56, 58], [56, 60], [56, 63]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
