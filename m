Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AE82EEE63
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jun 2026 22:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780785649; cv=none; b=Pc5OZB0zjedq6o2baI580IJS1/8Fn/wqJk75kdtqXF18EXYq7yHMLQove8CBecIXUBMxXPVToVG1eFmKc4dioXjBOM7Ztg5r6RbR2yg255+5+VrIiWiQJLq7veUVEVefmTTKffBzcziMXWAyoIh2m710JY+nOfK9oJy2vVpA09c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780785649; c=relaxed/simple;
	bh=LeZ7yNPgZbaE+6j0sO1KRAtIhlkwqL29PV2H817G3/M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DnCopaEkOvTLdRYosDEUaNMkFurFub8GIuTnT1iMvaN5kuVxxlXYpjyJhPmDw/O6bX/JT3ynRcky5izFdJ8rhGArlMIVxZ+aUuus6v4kYZ3+MvcEF8BkpCgcNWr9nSEDQ+Z7tsbWWBO+EoOfecPDEUGgzEORNTfmsAiKotLFROY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ieS/bsJs; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ieS/bsJs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780785642; x=1812321642;
  h=date:from:to:cc:subject:message-id;
  bh=LeZ7yNPgZbaE+6j0sO1KRAtIhlkwqL29PV2H817G3/M=;
  b=ieS/bsJsUkLk/oNzTmVbyy3YHaWpHUw18GWPQDpHZvTAWYtxWLgk0FP2
   Gk1HTe5lzmLh0XJVV5TdjlEets4bmpFncEbbXdHdOuKFrhrHoOLDsbIT8
   XQhk0laLcQzERmLUYohyZih5IxTqxyej43hhZEB8QyiXn5IeUll5f27eN
   4+znLggaIr6OH98XdpV4T0exAGCPqiJBXoB42yLkJ4YKwmjRpak04+m74
   04uJYgb0CG4QTNjH6UDn3tRhveEavddKGB/WcOJocnaK1lPd/vuNwEAFg
   T5qc9sVN6seFlGZArQfqbWLU+tzkaPhKSH9uxGW45+vbndgW8LfBxaqqj
   A==;
X-CSE-ConnectionGUID: 7yCk0h/dSPOLz9prya5tJg==
X-CSE-MsgGUID: /8bED8i1SHOqpOaUZIr42Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="85429038"
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="85429038"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 15:40:42 -0700
X-CSE-ConnectionGUID: Nxa4ucAsSFyyFohgVpoybw==
X-CSE-MsgGUID: 2IadB7NRR2+EVsZphJ5ohw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="242696869"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 06 Jun 2026 15:40:40 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVzh0-000000002ub-0OP3;
	Sat, 06 Jun 2026 22:40:38 +0000
Date: Sun, 07 Jun 2026 00:40:25 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb:
 edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
Message-ID: <202606070026.6OMGONzb-lkp@intel.com>
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
TO: Damon Ding <damon.ding@rock-chips.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Damon-Ding/arm64-dts-rockchip-Add-missing-hclk-for-RK3588-eDP0/20260605-114349
head:   02ed4244ae52e493a5700e9d9048932a28186af5
commit: b74676dc02f5cc92d79fca03efb2fdb39585d2b5 arm64: dts: rockchip: Add missing hclk for RK3588 eDP1
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2051-20260605 (https://download.01.org/0day-ci/archive/20260607/202606070026.6OMGONzb-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260607/202606070026.6OMGONzb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606070026.6OMGONzb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: pcie-ep@fe150000 (rockchip,rk3588-pcie-ep): Unevaluated properties are not allowed ('vpcie3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie-ep.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): ports:port@0:endpoint: 'bus-type' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
