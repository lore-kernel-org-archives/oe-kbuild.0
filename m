Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805F1192B84
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Aug 2025 08:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756283157; cv=none; b=K59zk+v5LHZLD3M3lCdHCpxpwB60xRlFo/5ENioYwfTQZpvC4s7sOWtnn+hOfP3/LG2DZLTpqkrHQkrJsvv8vSXTluOJQWm3l4DTeP9My8SAIflcPs9uA0s5F7CF3RLBroQet1PnvZ6f/FytgLWqRQJVCs4LmS8/vLpTOemMaRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756283157; c=relaxed/simple;
	bh=uciWeUGYUtd10uGzWLGb76XKLw36Sr48QfEPe2Tx/bI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MhBe64BDnNbIYpXCN3FJHIdf9yQDFxOUR5aogHZtavtKN4G17b148P+vpQVlJoH5nTSoC+IhTZGlpRZjc1IUXHdGvEfMtRJVRHTd0r3auoRpS+GNHzBjJEg7xCFyxj8v+4EtgHYrDhUtZL/GfvEDnbwQDFsqasveQKlu4nO0Pf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WPyeKkIk; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WPyeKkIk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756283156; x=1787819156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uciWeUGYUtd10uGzWLGb76XKLw36Sr48QfEPe2Tx/bI=;
  b=WPyeKkIkAIOLWsPxaDBp89I7YsDkuKkahmg2y8iAF+UF0aGhNtMVn6Wv
   a3+8sVobK+uEVIdeOm5IV4EFP75NVxPNu+Eam25qEJ24L4EQhhEztugNS
   IpF3vFsMTYfJw23W7AEUO103FZat4i7g7TUpDYRKx9qRfiX9vlEut7uWc
   Xp3QhFxJamZ35qAvmDfN1bgRRGq5P1JJB+vzNR1T3L+X1O5btahp6c/9W
   xDhCnEEVxOiLVfzcSN3200k7t1WZIMoi3puxJGK/l3UcwCXGabzNsEmLK
   ZmfruXRFPcMPxOSRIHJdcKjGUFlCzRa8GmjVG3svwBoM1Xieit0wnbaKY
   Q==;
X-CSE-ConnectionGUID: w9LT/VK7QYi0WTGhA7sAaA==
X-CSE-MsgGUID: xnhoKBW0Qn6+5AmkV1Beew==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="58241689"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="58241689"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 01:25:54 -0700
X-CSE-ConnectionGUID: XMfAjtE8RUqNNn5Dy7zuNA==
X-CSE-MsgGUID: 69tRNmAqR2WEcvgefBs0Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169077675"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 27 Aug 2025 01:25:53 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urBT4-000SnX-0B;
	Wed, 27 Aug 2025 08:25:27 +0000
Date: Wed, 27 Aug 2025 16:24:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: panel: lvds: Append
 ampire,amp19201200b5tzqw-t03 in panel-lvds
Message-ID: <202508271559.8nW5QTTp-lkp@intel.com>
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
In-Reply-To: <20250826-drm-misc-next-v1-1-980d0a0592b9@foss.st.com>
References: <20250826-drm-misc-next-v1-1-980d0a0592b9@foss.st.com>
TO: "Raphael Gallais-Pou" <raphael.gallais-pou@foss.st.com>
TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
TO: Thierry Reding <thierry.reding@gmail.com>
CC: dri-devel@lists.freedesktop.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Raphael,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7399c13f619f33dc8bdce838f3c83e88a18765ee]

url:    https://github.com/intel-lab-lkp/linux/commits/Raphael-Gallais-Pou/dt-bindings-panel-lvds-Append-ampire-amp19201200b5tzqw-t03-in-panel-lvds/20250826-200018
base:   7399c13f619f33dc8bdce838f3c83e88a18765ee
patch link:    https://lore.kernel.org/r/20250826-drm-misc-next-v1-1-980d0a0592b9%40foss.st.com
patch subject: [PATCH] dt-bindings: panel: lvds: Append ampire,amp19201200b5tzqw-t03 in panel-lvds
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-052-20250827 (https://download.01.org/0day-ci/archive/20250827/202508271559.8nW5QTTp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508271559.8nW5QTTp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508271559.8nW5QTTp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1689.12-1699.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1717.12-1727.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1745.12-1755.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1773.12-1783.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: lvds (panel-lvds): panel-timing:vsync-active: 3 is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
>> arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: lvds (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: lvds (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: lvds (panel-lvds): Unevaluated properties are not allowed ('backlight', 'compatible', 'height-mm', 'panel-timing', 'port', 'power-supply', 'width-mm' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: lvds (panel-lvds): panel-timing:vsync-active: 3 is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
>> arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: lvds (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: lvds (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: lvds (panel-lvds): Unevaluated properties are not allowed ('backlight', 'compatible', 'height-mm', 'panel-timing', 'port', 'power-supply', 'width-mm' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: lvds (panel-lvds): panel-timing:vsync-active: 3 is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
>> arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: lvds (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: lvds (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: lvds (panel-lvds): Unevaluated properties are not allowed ('backlight', 'compatible', 'height-mm', 'panel-timing', 'port', 'power-supply', 'width-mm' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
