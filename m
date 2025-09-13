Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B7BDDA9
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Sep 2025 08:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757751276; cv=none; b=U4e3lS/wkAIGRF5ZDOsbbYRDOrfq9fqvqT73ScsK8/NA0VZ6eWoP3H9fyC4Nfo2vnAwfIFs/sZlnK9ghrnRSmV78Hv227EQ+QBYYkE3kxk9Nr6o4ZWaiREDK3dWW6MeyMqaiKHGZTwP1fkHzj7Zm3h1iLTd+SZvWnDSbvKadYDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757751276; c=relaxed/simple;
	bh=iTJ7a3yUWJKQqETkCXL3Ee5m7924WQ073wygysfPHuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gg75t+o0igdOfOtbGVFaAXHNIqXT1jX0LgVoFhG08DS57TOQ4D+zPJdbn4Z3REYQVLvKPcFpoP3C+wdJln63MJ2x+1qYijCs+ecBTA3vkqHSlZytXSNtz/52YpoG5mn5+VBUwzlgH4bupUQjNbus8UpBv7kqFFZEVE3SqwVTKeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GaMVxGZZ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GaMVxGZZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757751274; x=1789287274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iTJ7a3yUWJKQqETkCXL3Ee5m7924WQ073wygysfPHuc=;
  b=GaMVxGZZVdud/nuyAPwQC84VAqfW+NyNdqlZGD0paeojEgyj4v6PecoX
   nQ4BGm0UtBr3/7OsyzzWYdRyJ7znbQastVKK9tUrXi8NRWwIvSJczBSXl
   M34borTWy9RweBF1MdPjlIFP0FjGBDbTnMXcmPl1NRm6D0xDwnjzlNlOY
   AlgaMr+YWCnFq1dR7MO4DJdQ3qsO4O1oQMKbWiYYJFlhpT3xzz1ykkrGF
   p+uwdIDdQNdIJZXgs+FykX9+5X039R/F/DL1OajzH5LLELflbbiy2dT5C
   Z4xa7wjsjLUTqH4JpKtlgZbuBdSClq2Yc4cSP1LriYmjHFEHsa7XSDFiG
   Q==;
X-CSE-ConnectionGUID: IUOCWfq0Rfe/xmgpN82QMQ==
X-CSE-MsgGUID: 85WtDTXrRlayOryY6yLj2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="77696360"
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="77696360"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 01:14:33 -0700
X-CSE-ConnectionGUID: nq4dM1zwR7qCSStSg6LL8Q==
X-CSE-MsgGUID: humhgHGTSIyd51aIp+aaNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="174111469"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 13 Sep 2025 01:14:32 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxLOw-0001Pc-0Y;
	Sat, 13 Sep 2025 08:14:30 +0000
Date: Sat, 13 Sep 2025 16:13:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mediatek:v6.17-next/dts64.2 18/38]
 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb:
 /soc/pwrap@1000d000/pmic/regulators: failed to match any schema with
 compatible: ['mediatek,mt6331-regulator']
Message-ID: <202509131627.emktKnwO-lkp@intel.com>
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
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>
CC: Fei Shao <fshao@chromium.org>

Hi AngeloGioacchino,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v6.17-next/dts64.2
head:   ffe6a5d1dd4d4d8af0779526cf4e40522647b25f
commit: 98967109c9c0e2de4140827628c63f96314099ab [18/38] arm64: dts: mediatek: mt6331: Fix pmic, regulators, rtc, keys node names
:::::: branch date: 18 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-051-20250913 (https://download.01.org/0day-ci/archive/20250913/202509131627.emktKnwO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250913/202509131627.emktKnwO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509131627.emktKnwO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'mediatek,mt6765-timer' was expected
   	from schema $id: http://devicetree.org/schemas/timer/mediatek,timer.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: /soc/timer@10008000: failed to match any schema with compatible: ['mediatek,mt6795-timer', 'mediatek,mt6577-timer']
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: pmic (mediatek,mt6331): 'mt6332-led' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: pmic (mediatek,mt6331): regulators:compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6331-regulator'] is too short
   	'mediatek,mt6331-regulator' is not one of ['mediatek,mt6323-regulator', 'mediatek,mt6328-regulator', 'mediatek,mt6358-regulator', 'mediatek,mt6359-regulator', 'mediatek,mt6397-regulator']
   	'mediatek,mt6331-regulator' is not one of ['mediatek,mt6366-regulator']
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: /soc/pwrap@1000d000/pmic/regulators: failed to match any schema with compatible: ['mediatek,mt6331-regulator']
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: intpol-controller@10200620 (mediatek,mt6795-sysirq): $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: iommu@10205000 (mediatek,mt6795-m4u): 'mediatek,infracfg' is a required property
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11230000 (mediatek,mt6795-mmc): mediatek,latch-ck: 20 is greater than the maximum of 7
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11230000 (mediatek,mt6795-mmc): Unevaluated properties are not allowed ('mediatek,latch-ck' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11240000 (mediatek,mt6795-mmc): 'pinctrl-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
