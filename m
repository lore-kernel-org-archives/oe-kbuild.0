Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5864F299A90
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Sep 2025 11:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757762315; cv=none; b=XjMNymWECwMwx7xZsxwwuhNhO+V27VTqYQIOhKeNuGwlgHvJIH5zn8OISHE76PPCBYxvcS5bz/OcnkWfp7pyrA2ib7ogDrIGjq69FtwfWQDyAVZBlqUY8nFIXZnmzZy8S1hoXixgMe8c75zLT/moI84DxfVhZ+gXmT8ke3hNfx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757762315; c=relaxed/simple;
	bh=rOtGGBEsxCjSo34GMay0V7sfTjk16EsXcbx0FqHwiXM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bn+joahahl3CvgJdR0dlH1zgN7AbMy5nP5g0EgKkOjH7l+flJ2iufB9nU1aLOG8xjtoCU6QVJpglFcf+XRimIXBvjhl1k1bsUoJNjrl4GbnkZ3KvRNULhxGwnISn6UVMoWjHAWib4DIsTM+WlgxRL+bqJ7BBqPyOAKnNH4ybdPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gGYZx57Q; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gGYZx57Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757762313; x=1789298313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rOtGGBEsxCjSo34GMay0V7sfTjk16EsXcbx0FqHwiXM=;
  b=gGYZx57QNz4Jy6nzMigAktJHtaPR0F0U1IstruWcYvmA6EKhPthxSdvW
   FOOzIx7Sza2GYozudp7WdA1UCVgj+m+ngHyxUMDA9AC0qZzwVOJAsqNEL
   aOg7apS9w6FkIHWo/blLK0RvvMomCGydGuBZfJn0+2Py+riAPHZQiR/hb
   kQoaepITxTshYarY722jG59tgt1ZfKxPTAjCHIPDr86tGQDxfRpbBadwx
   Q1lCyGy9onsKX2vf25dP+4S431GodWkk+Bay0AvZAVYgFqwkhy1l7K4Hv
   VLwIYhgOTrNn1bedSEMsennwHL/z4bt4a77yNVEEmMMRgLud2QKgrKc1G
   Q==;
X-CSE-ConnectionGUID: LZ1P9/feSrWX98SA1SabOA==
X-CSE-MsgGUID: fmnGcAYATQ+ooZSsqUbTIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="60025363"
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="60025363"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 04:18:33 -0700
X-CSE-ConnectionGUID: KXUaKDQyQs6Gejs9NVza7A==
X-CSE-MsgGUID: pJGio9tQRLiYAwJPumtUVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="173495842"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 13 Sep 2025 04:18:31 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1uxOGy-000000001bn-3msA;
	Sat, 13 Sep 2025 11:18:28 +0000
Date: Sat, 13 Sep 2025 13:18:07 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mediatek:v6.17-next/dts64.2 23/38]
 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11240000
 (mediatek,mt6795-mmc): pinctrl-names: ['default'] is too short
Message-ID: <202509131349.8VVRJsUA-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v6.17-next/dts64.2
head:   ffe6a5d1dd4d4d8af0779526cf4e40522647b25f
commit: 20be341f0b911a184934b17e9a9cf025da208974 [23/38] arm64: dts: mediatek: mt6795-sony-xperia-m5: Add pinctrl for mmc1/mmc2
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm64-randconfig-2051-20250913 (https://download.01.org/0day-ci/archive/20250913/202509131349.8VVRJsUA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ead0e976ed870ce10e88e94f6bac307190a70e62)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250913/202509131349.8VVRJsUA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509131349.8VVRJsUA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: pmic (mediatek,mt6331): 'mt6332-led' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: pmic (mediatek,mt6331): regulators:compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6331-regulator'] is too short
   	'mediatek,mt6331-regulator' is not one of ['mediatek,mt6323-regulator', 'mediatek,mt6328-regulator', 'mediatek,mt6358-regulator', 'mediatek,mt6359-regulator', 'mediatek,mt6397-regulator']
   	'mediatek,mt6331-regulator' is not one of ['mediatek,mt6366-regulator']
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: /soc/pwrap@1000d000/pmic/regulators: failed to match any schema with compatible: ['mediatek,mt6331-regulator']
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: intpol-controller@10200620 (mediatek,mt6795-sysirq): $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
>> arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11240000 (mediatek,mt6795-mmc): pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11240000 (mediatek,mt6795-mmc): 'pinctrl-1' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11240000 (mediatek,mt6795-mmc): Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11250000 (mediatek,mt6795-mmc): pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11250000 (mediatek,mt6795-mmc): 'pinctrl-1' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11250000 (mediatek,mt6795-mmc): Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: syscon@14000000 (mediatek,mt6795-mmsys): 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: ufoe@1401a000 (mediatek,mt6795-disp-ufoe): 'mediatek,gce-client-reg' does not match any of the regexes: '^pinctrl-[0-9]+$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
