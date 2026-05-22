Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E7E3E5A1D
	for <oe-kbuild@lists.linux.dev>; Fri, 22 May 2026 10:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445173; cv=none; b=WZQaRYni6o8pGvDTXaSrq0g+w2BCPkHPYampy+ZnmoBuAJfWwdDUwKH0c03q1xAcdrUUCejiGnAmVZlEQtZXj2qNSQDSyJTltwcV1gkSE8CLr8Rez19zvfl3Qq10ljaLThS7VuHxV8RHLLQoC3tJhh/VFPT91z8Nig25HyZ/ukA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445173; c=relaxed/simple;
	bh=mSIZUfC00pLuQS2v11av19SndRNyYABd6MGThhVLIIA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fwIPwBW+FPWP6WJ5PMfTUT3oElnhUwow9irDqkfY0FNXxyjhWTNhRjhr2ceheDZhI92Oea5rwTEDxMaNRAFv6zz+Bd4tbmTqJEmgZcn9SxTpyK/MaU80aRoA9VfNSrPTbYedMDY2qfRnfMATSzDRbdnvoGcQm/BwA96sfw6O+jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SUjqn7sd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SUjqn7sd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779445170; x=1810981170;
  h=date:from:to:cc:subject:message-id;
  bh=mSIZUfC00pLuQS2v11av19SndRNyYABd6MGThhVLIIA=;
  b=SUjqn7sdIaXK4qubXBZfkbinCsYFqraPKb0b7behNn/1WIY0nhMpadUN
   kwEi7fRWrEhHMoFcImA+nm98SKKbjgF+l6B57LgO057xjVDyME3cEgPeM
   NDlhim0U3wHbCDkV5vkMzx/y/1nI1/EEgQzvzgoClRkUD5iUQW0KXSmrF
   Zu/muYv1ijGuzx8h4L5j8dFw54xMFU83EWobsuTPVUSlrg54h2ZsFicXE
   m6EBC8cm18rUCMIkx2EIBtJKNx6BUtYD9N7+rKXmn08x0RIjycZ7TZwTD
   FSapeIusIMs0H8oqar0L2ilTO37dV1/PYIrHU8SjaB+CJgUpHyOQeHE3W
   A==;
X-CSE-ConnectionGUID: 0LgATd3QSDO/TWbSU6rOhA==
X-CSE-MsgGUID: hus7iuDURR2exuMw1UZDvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80358663"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="80358663"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 03:19:30 -0700
X-CSE-ConnectionGUID: mDlCX1SORx+Tu6j/2rG9qA==
X-CSE-MsgGUID: nm/QyoCbRQCaTXl5ZEVjcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="240754380"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 22 May 2026 03:19:28 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQMyT-00000000BLF-1UTv;
	Fri, 22 May 2026 10:19:25 +0000
Date: Fri, 22 May 2026 12:19:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 22/114]
 arch/arm64/boot/dts/apple/t8112-j413.dtb: pcie@690000000 (apple,t8112-pcie):
 Unevaluated properties are not allowed ('dma-coherent' was unexpected)
Message-ID: <202605221235.7n4qjNJT-lkp@intel.com>
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

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   2d563843e07af55de0249a409021af705f586961
commit: bed28073ca128b80061466d069dc8041c4437fec [22/114] arm64: dts: apple: t8112: Mark pcie node as dma-coherent
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/archive/20260522/202605221235.7n4qjNJT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605221235.7n4qjNJT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605221235.7n4qjNJT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@24e808000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@24e808000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/fifo@24eb14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: pcie@690000000 (apple,t8112-pcie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /sound: failed to match any schema with compatible: ['apple,j413-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /sound: failed to match any schema with compatible: ['apple,j413-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@24e808000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@24e808000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/fifo@24eb14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: pcie@690000000 (apple,t8112-pcie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /sound: failed to match any schema with compatible: ['apple,j415-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /sound: failed to match any schema with compatible: ['apple,j415-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@24e808000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@24e808000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/fifo@24eb14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: pcie@690000000 (apple,t8112-pcie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /sound: failed to match any schema with compatible: ['apple,j473-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /sound: failed to match any schema with compatible: ['apple,j473-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@24e808000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@24e808000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/fifo@24eb14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: pcie@690000000 (apple,t8112-pcie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /sound: failed to match any schema with compatible: ['apple,j493-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /sound: failed to match any schema with compatible: ['apple,j493-macaudio', 'apple,macaudio']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
