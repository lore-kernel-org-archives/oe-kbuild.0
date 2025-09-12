Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC096275B03
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Sep 2025 18:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757702730; cv=none; b=uPEEKDzvyyoyfrK0SpuuMameFmC/s38VXKUhVZEo8GToeTTk0vQyEPS2ro7aEmmYjG1sFoh3ciEScxtuLUUv5V+O0PbYMX/1Y1rEwIinuSHhj7h1tT+tDO/gQHgy25QoPfYohlHzY1MuX0db2bAbSTxa10CoLLtBDjDZrps30yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757702730; c=relaxed/simple;
	bh=uA1GbXLjnMpM09hd0cZ31nouJmOAtA5n+pta+2spkWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mCC+5C3T0zcnQQPAA42Akek+2JlAkWJqpatWgXqSKR5VIWt+N3sQgO6Rs30o3xAvkduuePkl8WD3Eg0djJPfrJd/d4N3sbGf1NHJyLablILPUxlXyG9mcOrP/F4eIn+7+SPC106vKcg0kQINoU+eSTNp7GiEPRiU9HLGVpo1HjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WR8y/CIt; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WR8y/CIt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757702728; x=1789238728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uA1GbXLjnMpM09hd0cZ31nouJmOAtA5n+pta+2spkWk=;
  b=WR8y/CItJG+su5XJN/cQ1BI1MRu0uKVq+P5q9ajKDsR8WawV9UDcFX7W
   V6XmTMdNvMcf1jDifqdEj3No2SZsIdRQh0ePkYs9Bj2vgQNmvx5EDNnrf
   jGbo0K8VafXHtNWico+W4bHU0tT0S300wHAeKf8Oi7UX9UAX964dHmnLc
   sydoQPfHfYiONOqBKifybowA1aFNmfifLqOqGoz5hXF8pt4evxd3xufK6
   SCsvmQPIBgzpy+eDsFxIBlnqD50uMqUMFaYYZwbBfZH8W2MdRCUlqng69
   RUYUwoZFpLy3os0DdhgBVo5CmdwM/HlBod/+ssNPXnHwQEm13s/QPOp15
   Q==;
X-CSE-ConnectionGUID: s4PfcWmoRnWwq2zobbgbpQ==
X-CSE-MsgGUID: z3pJg1DvRgCrRHOY3wnj8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60115009"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60115009"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 11:45:27 -0700
X-CSE-ConnectionGUID: r0cnmnTYTXmsg8h2VM5RKQ==
X-CSE-MsgGUID: bcpiesc0TpusT6Bt+MaUgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="179207292"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 12 Sep 2025 11:45:26 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ux8lv-0001Ak-2T;
	Fri, 12 Sep 2025 18:45:23 +0000
Date: Sat, 13 Sep 2025 02:44:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:x5h-upstream-2025-09-12 6/13]
 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@0
 (arm,cortex-a720ae): Unevaluated properties are not allowed
 ('cache-controller' was unexpected)
Message-ID: <202509130245.otRL3lK6-lkp@intel.com>
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
TO: Hai Pham <hai.pham.ud@renesas.com>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
CC: Takeshi Kihara <takeshi.kihara.df@renesas.com>
CC: Khanh Le <khanh.le.xr@renesas.com>
CC: Huy Bui <huy.bui.wm@renesas.com>
CC: Phong Hoang <phong.hoang.wz@renesas.com>

tree:   https://github.com/morimoto/linux x5h-upstream-2025-09-12
head:   0eb95c8741433390cd9b90399428fdddcbb54b7b
commit: a2abdec2af0287e433eab131e0cb53dd6a4344d0 [6/13] arm64: dts: renesas: R8A78000: Add initial Ironhide support
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-randconfig-051-20250912 (https://download.01.org/0day-ci/archive/20250913/202509130245.otRL3lK6-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250913/202509130245.otRL3lK6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509130245.otRL3lK6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@0 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@100 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@200 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
--
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@70200 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@70300 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0700000 (renesas,scif-r8a78000): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,scif-r8a78000', 'renesas,scif'] is too long
   	['renesas,scif-r8a78000', 'renesas,scif'] is too short
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r7s72100']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r7s9210']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a7778', 'renesas,scif-r8a7779']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a7742', 'renesas,scif-r8a7743', 'renesas,scif-r8a7744', 'renesas,scif-r8a7745', 'renesas,scif-r8a77470', 'renesas,scif-r8a7790', 'renesas,scif-r8a7791', 'renesas,scif-r8a7792', 'renesas,scif-r8a7793', 'renesas,scif-r8a7794']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a774a1', 'renesas,scif-r8a774a3', 'renesas,scif-r8a774b1', 'renesas,scif-r8a774c0', 'renesas,scif-r8a774e1', 'renesas,scif-r8a7795', 'renesas,scif-r8a7796', 'renesas,scif-r8a77961', 'renesas,scif-r8a77965', 'renesas,scif-r8a77970', 'renesas,scif-r8a77980', 'renesas,scif-r8a77990', 'renesas,scif-r8a77995']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a779a0', 'renesas,scif-r8a779f0', 'renesas,scif-r8a779g0', 'renesas,scif-r8a779h0']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a07g044']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a07g043', 'renesas,scif-r9a07g054', 'renesas,scif-r9a08g045']
--
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a07g043', 'renesas,scif-r9a07g054', 'renesas,scif-r9a08g045']
   	'renesas,scif-r9a09g057' was expected
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a09g047', 'renesas,scif-r9a09g056']
   	'renesas,rcar-gen1-scif' was expected
   	'renesas,rcar-gen2-scif' was expected
   	'renesas,rcar-gen3-scif' was expected
   	'renesas,rcar-gen4-scif' was expected
   	'renesas,rcar-gen5-scif' was expected
   	'renesas,scif-r9a07g044' was expected
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0708000 (renesas,scif-r8a78000): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,scif-r8a78000', 'renesas,scif'] is too long
   	['renesas,scif-r8a78000', 'renesas,scif'] is too short
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r7s72100']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r7s9210']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a7778', 'renesas,scif-r8a7779']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a7742', 'renesas,scif-r8a7743', 'renesas,scif-r8a7744', 'renesas,scif-r8a7745', 'renesas,scif-r8a77470', 'renesas,scif-r8a7790', 'renesas,scif-r8a7791', 'renesas,scif-r8a7792', 'renesas,scif-r8a7793', 'renesas,scif-r8a7794']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a774a1', 'renesas,scif-r8a774a3', 'renesas,scif-r8a774b1', 'renesas,scif-r8a774c0', 'renesas,scif-r8a774e1', 'renesas,scif-r8a7795', 'renesas,scif-r8a7796', 'renesas,scif-r8a77961', 'renesas,scif-r8a77965', 'renesas,scif-r8a77970', 'renesas,scif-r8a77980', 'renesas,scif-r8a77990', 'renesas,scif-r8a77995']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a779a0', 'renesas,scif-r8a779f0', 'renesas,scif-r8a779g0', 'renesas,scif-r8a779h0']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a07g044']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a07g043', 'renesas,scif-r9a07g054', 'renesas,scif-r9a08g045']
--
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a07g043', 'renesas,scif-r9a07g054', 'renesas,scif-r9a08g045']
   	'renesas,scif-r9a09g057' was expected
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a09g047', 'renesas,scif-r9a09g056']
   	'renesas,rcar-gen1-scif' was expected
   	'renesas,rcar-gen2-scif' was expected
   	'renesas,rcar-gen3-scif' was expected
   	'renesas,rcar-gen4-scif' was expected
   	'renesas,rcar-gen5-scif' was expected
   	'renesas,scif-r9a07g044' was expected
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,hscif-r8a78000', 'renesas,hscif'] is too short
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a7778', 'renesas,hscif-r8a7779']
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a7742', 'renesas,hscif-r8a7743', 'renesas,hscif-r8a7744', 'renesas,hscif-r8a7745', 'renesas,hscif-r8a77470', 'renesas,hscif-r8a7790', 'renesas,hscif-r8a7791', 'renesas,hscif-r8a7792', 'renesas,hscif-r8a7793', 'renesas,hscif-r8a7794']
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a774a1', 'renesas,hscif-r8a774b1', 'renesas,hscif-r8a774c0', 'renesas,hscif-r8a774e1', 'renesas,hscif-r8a7795', 'renesas,hscif-r8a7796', 'renesas,hscif-r8a77961', 'renesas,hscif-r8a77965', 'renesas,hscif-r8a77970', 'renesas,hscif-r8a77980', 'renesas,hscif-r8a77990', 'renesas,hscif-r8a77995']
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a779a0', 'renesas,hscif-r8a779f0', 'renesas,hscif-r8a779g0', 'renesas,hscif-r8a779h0']
   	'renesas,rcar-gen1-hscif' was expected
   	'renesas,rcar-gen2-hscif' was expected
   	'renesas,rcar-gen3-hscif' was expected
   	'renesas,rcar-gen4-hscif' was expected
   	'renesas,rcar-gen5-hscif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0714000 (renesas,hscif-r8a78000): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,hscif-r8a78000', 'renesas,hscif'] is too short
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a7778', 'renesas,hscif-r8a7779']
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a7742', 'renesas,hscif-r8a7743', 'renesas,hscif-r8a7744', 'renesas,hscif-r8a7745', 'renesas,hscif-r8a77470', 'renesas,hscif-r8a7790', 'renesas,hscif-r8a7791', 'renesas,hscif-r8a7792', 'renesas,hscif-r8a7793', 'renesas,hscif-r8a7794']
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a774a1', 'renesas,hscif-r8a774b1', 'renesas,hscif-r8a774c0', 'renesas,hscif-r8a774e1', 'renesas,hscif-r8a7795', 'renesas,hscif-r8a7796', 'renesas,hscif-r8a77961', 'renesas,hscif-r8a77965', 'renesas,hscif-r8a77970', 'renesas,hscif-r8a77980', 'renesas,hscif-r8a77990', 'renesas,hscif-r8a77995']
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a779a0', 'renesas,hscif-r8a779f0', 'renesas,hscif-r8a779g0', 'renesas,hscif-r8a779h0']
   	'renesas,rcar-gen1-hscif' was expected
   	'renesas,rcar-gen2-hscif' was expected
   	'renesas,rcar-gen3-hscif' was expected
--
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a7778', 'renesas,hscif-r8a7779']
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a7742', 'renesas,hscif-r8a7743', 'renesas,hscif-r8a7744', 'renesas,hscif-r8a7745', 'renesas,hscif-r8a77470', 'renesas,hscif-r8a7790', 'renesas,hscif-r8a7791', 'renesas,hscif-r8a7792', 'renesas,hscif-r8a7793', 'renesas,hscif-r8a7794']
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a774a1', 'renesas,hscif-r8a774b1', 'renesas,hscif-r8a774c0', 'renesas,hscif-r8a774e1', 'renesas,hscif-r8a7795', 'renesas,hscif-r8a7796', 'renesas,hscif-r8a77961', 'renesas,hscif-r8a77965', 'renesas,hscif-r8a77970', 'renesas,hscif-r8a77980', 'renesas,hscif-r8a77990', 'renesas,hscif-r8a77995']
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a779a0', 'renesas,hscif-r8a779f0', 'renesas,hscif-r8a779g0', 'renesas,hscif-r8a779h0']
   	'renesas,rcar-gen1-hscif' was expected
   	'renesas,rcar-gen2-hscif' was expected
   	'renesas,rcar-gen3-hscif' was expected
   	'renesas,rcar-gen4-hscif' was expected
   	'renesas,rcar-gen5-hscif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c071c000 (renesas,hscif-r8a78000): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,hscif-r8a78000', 'renesas,hscif'] is too short
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a7778', 'renesas,hscif-r8a7779']
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a7742', 'renesas,hscif-r8a7743', 'renesas,hscif-r8a7744', 'renesas,hscif-r8a7745', 'renesas,hscif-r8a77470', 'renesas,hscif-r8a7790', 'renesas,hscif-r8a7791', 'renesas,hscif-r8a7792', 'renesas,hscif-r8a7793', 'renesas,hscif-r8a7794']
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a774a1', 'renesas,hscif-r8a774b1', 'renesas,hscif-r8a774c0', 'renesas,hscif-r8a774e1', 'renesas,hscif-r8a7795', 'renesas,hscif-r8a7796', 'renesas,hscif-r8a77961', 'renesas,hscif-r8a77965', 'renesas,hscif-r8a77970', 'renesas,hscif-r8a77980', 'renesas,hscif-r8a77990', 'renesas,hscif-r8a77995']
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a779a0', 'renesas,hscif-r8a779f0', 'renesas,hscif-r8a779g0', 'renesas,hscif-r8a779h0']
   	'renesas,rcar-gen1-hscif' was expected
   	'renesas,rcar-gen2-hscif' was expected
   	'renesas,rcar-gen3-hscif' was expected
   	'renesas,rcar-gen4-hscif' was expected
   	'renesas,rcar-gen5-hscif' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
