Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9716B1FAC5E
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Feb 2025 14:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740062602; cv=none; b=Ehr+ZOHxhfW3yD+OgDLUk+rnFclA2Rly9lQJIjtV2Bbqt9Aa199bbrmsjEHoX36ZtOaolJ8HHkbL5y4s98g0cF7X1ZCSLNK9DZdYtsev5B+2iz8sumfquWF9D3E1Axgq7xZvaA0hzm4FefOKWrCdFPbuKMUzsT0q1uSuwfIQ00M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740062602; c=relaxed/simple;
	bh=fArZ7pNOmrvipHgsu1VB4toKDTEnVoWVpb4MiAfU3G8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nQN1lV560Y1f8X0CeeWuxZJ5oa/2nTxW/WdX42rXoQFmzVM20iAadjLOcUR8Csx3kLk1LtGMhL86IOkMhEebBPrNrJ7d7j8MAEeZOXP55BQLfR7KtPZwJXrtprRLxwc7LYQnkZQziIPYQvSMXR0CSZtYok11Y+BO99FVYNKn4n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QiHj5BtI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QiHj5BtI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740062601; x=1771598601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fArZ7pNOmrvipHgsu1VB4toKDTEnVoWVpb4MiAfU3G8=;
  b=QiHj5BtIMMnql/tZT3FX3Q23IGf3DyN6iQK8sY5Jb5ShhvHgUT4zFW/d
   FwSR0FrQjZGFoB6L72GdXF6KPacAelp5/vk39rFSFrf6vR+2QeBViHPXl
   dkHb673uYOml3c6ZWckdA/w7/6Aczo4OjMJrhX+sl13+K0pxZU+XmlKGX
   RwHbmeeArrvZHD1tpEBImlmiomSgLsB/gUjhL7tgJ45G8E5OVg+kqepZn
   RYZ6S7QEQv3FT8+1jQaqdn+aLzRkAYKVYhdqa8GKjBwlgYpxIqy98ddZi
   yWHQRhHtTMVLDfmYSwa3GYrKVj4Hp1YHX4f5oEhfMx6QmgRxn6E/EE+lG
   g==;
X-CSE-ConnectionGUID: 4bVV11woToKRnT1JZZ+hRg==
X-CSE-MsgGUID: QNp9Nf1eQy6mag0YbS+EhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51058533"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51058533"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:43:20 -0800
X-CSE-ConnectionGUID: N/t1RDxBQE+1G9hONPOZ9g==
X-CSE-MsgGUID: AQB6AmMoRUSoilL+wleDEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="114783396"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 20 Feb 2025 06:43:18 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tl7lk-0004Ot-2X;
	Thu, 20 Feb 2025 14:43:16 +0000
Date: Thu, 20 Feb 2025 22:42:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:track/x1e80100-t14s 1027/1079]
 arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: geniqup@ac0000: serial@a98000:
 Unevaluated properties are not allowed ('bt_wcn7850' was unexpected)
Message-ID: <202502202204.XEYLLAV7-lkp@intel.com>
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
TO: Abel Vesa <abel.vesa@linaro.org>

tree:   https://github.com/krzk/linux track/x1e80100-t14s
head:   0a5b996575143038f96d880868109359ede28367
commit: 37e4e967dac75a1afaac4013ff6e0265eb1d163a [1027/1079] arm64: dts: qcom: x1e80100-crd: Add bluetooth nodes
:::::: branch date: 2 days ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20250219 (https://download.01.org/0day-ci/archive/20250220/202502202204.XEYLLAV7-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
dtschema version: 2025.2
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502202204.XEYLLAV7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502202204.XEYLLAV7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4191.11-4201.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: geniqup@ac0000: serial@a98000: Unevaluated properties are not allowed ('bt_wcn7850' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: serial@a98000: Unevaluated properties are not allowed ('bt_wcn7850' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/qcom,serial-geni-qcom.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: bt_wcn7850: $nodename:0: 'bt_wcn7850' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: bt_wcn7850: 'vddrfacmn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: bt_wcn7850: 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: bt_wcn7850: 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: bt_wcn7850: 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: bt_wcn7850: 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: bt_wcn7850: 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: bt_wcn7850: 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@1bfc000: resets: [[56, 37], [56, 36]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@1bfc000: reset-names: ['phy', 'phy_nocsr'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pinctrl@f100000: Unevaluated properties are not allowed ('bt-en-sleep' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152], [0, 639631360, 0, 2097152]] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base', 'llcc_broadcast_and_base'] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152], [0, 639631360, 0, 2097152]] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base', 'llcc_broadcast_and_base'] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
