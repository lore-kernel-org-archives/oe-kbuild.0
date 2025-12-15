Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DD931B102
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 04:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765771616; cv=none; b=NljxZ9DfGV6qiHRiFoBYwXlarfok8sZrpeYrGHKFaZS6iuVXBCI3uIIJ7OmSusTuUfIDTM8xHXMXZx3MeG/tYG04FD2xG96rR/Xem+S29lSV9b9grCLsh19x5FCErK9FcHXNiAw2xgJZPUiSGkxzP4+yzwmCUljZLuTOKY86F3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765771616; c=relaxed/simple;
	bh=znhbHm3Hy0AJgKvoMUlBwyfL0Nata/9/IoCmZhkGJ60=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oNf0nNSQqdZ5/uSE3gZWiozfQPEo8cibagdMIopV0oL/+qbXy5jUse2nua5YH6OlPZ1aX8PzSoly/YrDPI4TcdDaAikH31ydz/zYg9FSuQVGm8lYvQwrqL7Y3yiLH9y+MYeVjFuNW2cfqXNyKzHRVEJu5A9rzmxTglOkwrS8XFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PTeJKity; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PTeJKity"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765771614; x=1797307614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=znhbHm3Hy0AJgKvoMUlBwyfL0Nata/9/IoCmZhkGJ60=;
  b=PTeJKityl4YGdxyV3rNI7CxmH8Xgd+VIQaWchhSIYpgoDlXrNT8oXLyi
   mpnpSr/q1pG2qaEdPExH0owwZr23DLQNJOSmCj8I8fCbeW3NtE/VDwZHQ
   sqYWI2ENuSE1zkPbxUpkQfOy2ACeYuZRCV9IqdibMG7CGW3Z+s0R8ATZg
   2eJgsgvtXSGsVR1mwRpxx/YV7UBN5QBNBm5jRXz1gGL/SOXoGM4IcYgOQ
   aPGZgY/5R4DDOKI3qYpE2l2Cfe4iNZT/eTh1ysNDc8p0JcWCJAZEM1qEE
   ZuhR2RKuWhSWog5v/7VLOfTJLzKLEY6jOqhQsOezbBiZ9k3AVDm7Vj7tZ
   A==;
X-CSE-ConnectionGUID: hAzsqWERRgyNNPlFom4kAg==
X-CSE-MsgGUID: F+wSpDICQDOBY1KWn5RlMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="78784908"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="78784908"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 20:06:54 -0800
X-CSE-ConnectionGUID: Et3G9x/lR1GFasNGiG0DPQ==
X-CSE-MsgGUID: 9WhBiK19RFGFYvMN0abbrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="202120665"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 14 Dec 2025 20:06:53 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUzrG-000000002Ym-3Qm5;
	Mon, 15 Dec 2025 04:06:50 +0000
Date: Mon, 15 Dec 2025 05:06:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:mediatek/dt64 16/27]
 arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: gpu@13040000
 (mediatek,mt8365-mali): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202512150551.0XmZWzlJ-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git mediatek/dt64
head:   9b2d2beaefcfa17259fdbce16d59d660894147cb
commit: 499af66b8f421a1f1612ff84c81a47ca569654b8 [16/27] arm64: dts: mediatek: mt8365: Add GPU support
:::::: branch date: 6 weeks ago
:::::: commit date: 7 weeks ago
config: arm64-randconfig-2052-20251214 (https://download.01.org/0day-ci/archive/20251215/202512150551.0XmZWzlJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ecaf673850beb241957352bd61e95ed34256635f)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150551.0XmZWzlJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512150551.0XmZWzlJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:994.12-1002.7: Warning (graph_child_address): /soc/aal@14011000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:1004.12-1012.7: Warning (graph_child_address): /soc/aal@14011000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:1026.12-1034.7: Warning (graph_child_address): /soc/gamma@14012000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:1036.12-1044.7: Warning (graph_child_address): /soc/gamma@14012000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:1058.12-1066.7: Warning (graph_child_address): /soc/dither@14013000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:1068.12-1075.7: Warning (graph_child_address): /soc/dither@14013000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365-evk.dts:229.8-236.5: Warning (graph_child_address): /soc/dsi@14014000/panel@0/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365-evk.dts:242.10-250.5: Warning (graph_child_address): /soc/dsi@14014000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365-evk.dts:252.10-260.5: Warning (graph_child_address): /soc/dsi@14014000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365-evk.dts:36.8-43.5: Warning (graph_child_address): /connector/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: gpu@13040000 (mediatek,mt8365-mali): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8365-mali', 'arm,mali-bifrost'] is too short
   	'mediatek,mt8365-mali' is not one of ['allwinner,sun50i-h616-mali', 'amlogic,meson-g12a-mali', 'mediatek,mt8183-mali', 'mediatek,mt8183b-mali', 'mediatek,mt8186-mali', 'realtek,rtd1619-mali', 'renesas,r9a07g044-mali', 'renesas,r9a07g054-mali', 'renesas,r9a09g047-mali', 'renesas,r9a09g056-mali', 'renesas,r9a09g057-mali', 'rockchip,px30-mali', 'rockchip,rk3562-mali', 'rockchip,rk3568-mali', 'rockchip,rk3576-mali']
   	'mediatek,mt8365-mali' is not one of ['mediatek,mt8195-mali']
   	'mediatek,mt8365-mali' is not one of ['allwinner,sun55i-a523-mali', 'mediatek,mt8188-mali', 'mediatek,mt8192-mali', 'mediatek,mt8370-mali']
   	'mediatek,mt8192-mali' was expected
   	'arm,mali-valhall-jm' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: /soc/gpu@13040000: failed to match any schema with compatible: ['mediatek,mt8365-mali', 'arm,mali-bifrost']
   arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): 'adc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
