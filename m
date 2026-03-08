Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821DF31A7E4
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Mar 2026 23:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773012208; cv=none; b=bC4Qcl5Qo0Kt9yaU4VkelIR7F0nD3AMyonXqsgudPcwlasXQmpijdqqbfR5QFNcdtbrugNehsUn4xn4LbH+WfS7R2x92VR3FZjm3s/sFLkeFVFrnLRP7rpdWsi82IZmU7+uukYuqNAAtU39YC9Ty8V9xmKokKjr6pG7lqlS3HXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773012208; c=relaxed/simple;
	bh=0bEVY5qt0jyo+1ie6/jNLKVtwfMjgCvYrbhPXlO5RA4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GWF9nDaHef8IzB8kfypVorhioM2ZiDfanHL83UFxDqfLBevfs2DeFfDuGXijdAVC7+EBWbsxZvbnH4Oz2YwsRy0Uu2zGJU27PsMl9hyoQX7tamD/y1FKnZHLG0PfszeI67V+NRg9ki6DjZ3c2m+ml6HfdlhpobI5ehcxa1axCSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PWg6XIOV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PWg6XIOV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773012207; x=1804548207;
  h=date:from:to:cc:subject:message-id;
  bh=0bEVY5qt0jyo+1ie6/jNLKVtwfMjgCvYrbhPXlO5RA4=;
  b=PWg6XIOVv4Ya7PM/ViPhop7YqHiwK31XlJSDHo2zC1whExY5+yZl/NmN
   YoJc5WFJJk54qV7HyckBt47ArVTM2ojzwj/rwZqgwhWVN+0FeCRbY6K+p
   knC/j63mQXiZzOg2pqEPDLML7MHGHSwtQcZRUCHGMbRROGWUmNrD+Jsc5
   cbB3Vqssb+v3scCs3dm8ZVT55IFCdKz+lelDyAxrJEqIoLINomJwNZGuU
   TLdEYl/rI2EqcOf6MEvQmiHxAYT0o9znEkiUdgZ4TRKDcdGx5Q+sDvO/n
   iaedAnQSrx81K1fL17Eb5H/7p05gEzNw7S9tbXPRRotca6m4uaIpxFFDl
   g==;
X-CSE-ConnectionGUID: rea+yZETTu+ckDFGAD3VZQ==
X-CSE-MsgGUID: ojZC6sOwTzGR6rlxyHa9FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73734585"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="73734585"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 16:23:26 -0700
X-CSE-ConnectionGUID: cQNFmXYtRYCWNlKh7ZrhYA==
X-CSE-MsgGUID: AOzxOWYPR4uT2oCixMUEYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="250054469"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 08 Mar 2026 16:23:25 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzNSz-000000002lO-3Xy3;
	Sun, 08 Mar 2026 23:23:21 +0000
Date: Mon, 09 Mar 2026 00:22:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb:
 ddr3phy@e3804000 (microchip,sama7g5-ddr3phy): compatible: 'oneOf' conditional
 failed, one must be fixed:
Message-ID: <202603090016.B1HF2PwM-lkp@intel.com>
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
TO: Conor Dooley <conor.dooley@microchip.com>
CC: Lee Jones <lee@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   014441d1e4b2f5be728433b761df3377dee7a487
commit: 1f9793a4d5188cddc0eb69d7840b7c5c57c939a6 dt-bindings: mfd: Document control-scb and sysreg-scb on pic64gx
date:   4 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-2051-20260307 (https://download.01.org/0day-ci/archive/20260309/202603090016.B1HF2PwM-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603090016.B1HF2PwM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603090016.B1HF2PwM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: timer@e2814000 (atmel,sama5d2-tcb): clock-names: ['t0_clk', 't1_clk', 't2_clk', 'slow_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: timer@e2814000 (atmel,sama5d2-tcb): clocks: [[2, 2, 88], [2, 2, 89], [2, 2, 90], [17, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: /soc/uddrc@e3800000: failed to match any schema with compatible: ['microchip,sama7g5-uddrc']
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7g5-ddr3phy): compatible: ['microchip,sama7g5-ddr3phy'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7g5-ddr3phy): compatible: ['microchip,sama7g5-ddr3phy'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
>> arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7g5-ddr3phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7g5-ddr3phy'] is too short
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
--
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: timer@e2814000 (atmel,sama5d2-tcb): clock-names: ['t0_clk', 't1_clk', 't2_clk', 'slow_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: timer@e2814000 (atmel,sama5d2-tcb): clocks: [[2, 2, 88], [2, 2, 89], [2, 2, 90], [16, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: /soc/uddrc@e3800000: failed to match any schema with compatible: ['microchip,sama7g5-uddrc']
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: ddr3phy@e3804000 (microchip,sama7g5-ddr3phy): compatible: ['microchip,sama7g5-ddr3phy'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: ddr3phy@e3804000 (microchip,sama7g5-ddr3phy): compatible: ['microchip,sama7g5-ddr3phy'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
>> arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: ddr3phy@e3804000 (microchip,sama7g5-ddr3phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7g5-ddr3phy'] is too short
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
