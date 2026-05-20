Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF1333345A
	for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 10:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779273638; cv=none; b=XzAS4yi7eYG7H3nhcYQlWCdTJTy3h6XIqy4DkDuKNFx4bW/ayg7soGyz00I1m2iEKdKD7D1tA9hardZI7ab7BDO5tFjZ2q1p5AWU/FSRqpPc8Ls2kewsP2GqXHj9UQyh97rs0rrgzvtZU6EcVi0pQBR+spxbNlSCDruq2ElaUy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779273638; c=relaxed/simple;
	bh=kYTEWWumnXhKME9Utg60DUBjzPXWXFKt6SaD3cX2s30=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JKM6ICBUNIb/xYp9oZNwp9KeOEyjf61hzPq87CA7bjMLa6VjEG3oralvu26QMlrX80Sh3F9yibgCgvEma4eV50A2H9cwjfanrIiJOP68vc15XOAe8sKI0SCSXCbEUZFzE9I4+4rzK8JAceU11Lzt/iU1ENd0oDsA7/7kHUypF5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NkGUx4pS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NkGUx4pS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779273636; x=1810809636;
  h=date:from:to:cc:subject:message-id;
  bh=kYTEWWumnXhKME9Utg60DUBjzPXWXFKt6SaD3cX2s30=;
  b=NkGUx4pSNbN5963EaXsvbyazVkl2QegN87ONsDhdoMh529xj3QCbhyhE
   EpsEzxvpftiL5DWaKMdtT4T4mVVbxvGeZ6o3LPW82T97oPymPHbzqf1j+
   pMCYIcKz82hBI0+jxcTMF0d1J337P87zmiZBGR3AzO7xjDwzmpu/kv5AM
   WtM02zt5dhMbxey/7/RRry2XgLcfShqfB45ZGqHAx2sZA+4jmFcDm8Bd3
   RQuUczndghnsH7XycWPUSCqiq5Tv2TcezfDD6dMRhFn72klR7W/rUlO7X
   0BI0qByUSgTRlnizJrgavHI1P4MQeisUFFTk/S1TCMKrXfz1g2q5/kMbY
   g==;
X-CSE-ConnectionGUID: DATZowk4QC+FBUtVHT1oXg==
X-CSE-MsgGUID: fIsf3Bn3TiKV1iESwgcEDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80019146"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="80019146"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 03:40:36 -0700
X-CSE-ConnectionGUID: rz5bVmANTeWcdrT40j1brA==
X-CSE-MsgGUID: nKIsVljqT3q56R3DBnHZVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="245113550"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 20 May 2026 03:40:35 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPeLo-00000000AWb-2sUZ;
	Wed, 20 May 2026 10:40:32 +0000
Date: Wed, 20 May 2026 12:40:07 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 10/114]
 arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match
 any schema with compatible: ['apple,t8112-mtp',
 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
Message-ID: <202605201232.NbvPG67x-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>
CC: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   2d563843e07af55de0249a409021af705f586961
commit: 4d2c235e2107bd3f81732eaa5ddfa15270456a87 [10/114] arm64: dts: apple: t8112: Add mtp device nodes for j413/j493
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/archive/20260520/202605201232.NbvPG67x-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605201232.NbvPG67x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605201232.NbvPG67x-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@24e808000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@24e808000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/fifo@24eb14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
--
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@24e808000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@24e808000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/fifo@24eb14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
--
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@24e808000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@24e808000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/fifo@24eb14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
--
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@24e808000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@24e808000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/fifo@24eb14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
