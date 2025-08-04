Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23901DF269
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Aug 2025 19:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754337113; cv=none; b=oy2wBzmhD+1PwDIPt2ykisfKmsGgN9pxPyxxwteAx68ftHIqthsWzNK4YI2kbuVGcR5owVMxcsSlZEwbAGpBBrQsFVCzrE970wBKuMolig3Cw4eaV6gsvO8/63F9j6xKnEvGbwCJb0THEQnZDvq9R48wd6ZfyNi8bqYN/UVwxWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754337113; c=relaxed/simple;
	bh=tz9Gxtto/Gfe38e+Cnca1zgFQWMXPi+wf4k5IecImfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EC9bWTOximyoeKJd4uiDjtGgzwbNiH3cF0VBjGXLn5pJ95yGRSUJ8IySWz6oyQT3go1cS+litddFTcvMz4n7moJTWcuW1tJDtSM/l1OaPvYBVYFn8ymlifMwOdca2TtBe6bulnLC3CX4iJxPT/63U673QaBprbJI87iwbDHcgso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a5uQ14oS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a5uQ14oS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754337112; x=1785873112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tz9Gxtto/Gfe38e+Cnca1zgFQWMXPi+wf4k5IecImfk=;
  b=a5uQ14oSOqg9P76Uern9fglgWyXSEJyW8LdJeXN3zcLctU5P44mbnP52
   gH77Ufc/4CLUzsszfA7HMa603u+iRkOXX49i+LiUA7+PbOfIsl9TD4+LO
   R56BkC0of97U4ZMoCQ6v5O1a7u8H+kP3wX2jFSt1KizpUfUuMm+DzTlgt
   ziHHRTELh46AZ8YU82+kXbfh0cDr2Ab2MUX0gbi4bulIa21te6Ykv1UuG
   yF0CJAr0f+A3iUuvNa2rhcpGtxFp/cmIskkGyNhxHOD3J9p1kUL2+gGbq
   iUCbaODVdCeA6aEM/TRDRDfBO+Fp+gxH0Yo0Pw4OBFk+ZCNJkBCeMpikS
   Q==;
X-CSE-ConnectionGUID: zbsa0OXEQz6BXY2vfADlsA==
X-CSE-MsgGUID: JJhMafK7RGWBboPG6t1sFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="68064541"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="68064541"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 12:51:51 -0700
X-CSE-ConnectionGUID: GroD4ANZQfuGn2p+l6WmzQ==
X-CSE-MsgGUID: KJBBmxW+Q+KLEhspbaEo/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="163517787"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 04 Aug 2025 12:51:50 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uj1Dk-0000Dn-25;
	Mon, 04 Aug 2025 19:51:45 +0000
Date: Tue, 5 Aug 2025 03:51:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:asahi-wip 6/208]
 arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@24e808000
 (apple,t8112-dart): compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is
 too long
Message-ID: <202508050340.4DegVKCl-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux asahi-wip
head:   0fcda52c969c6fe276e3f63f02438233ca592077
commit: d5993feae36f23237fddd7d4709857f4c1639592 [6/208] arm64: dts: apple: t8112: Add mtp device nodes for j413/j493
:::::: branch date: 25 hours ago
:::::: commit date: 8 days ago
config: arm64-randconfig-051-20250804 (https://download.01.org/0day-ci/archive/20250805/202508050340.4DegVKCl-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508050340.4DegVKCl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508050340.4DegVKCl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@4b (cirrus,cs42l84): 'sound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@24e808000 (apple,t8112-dart): compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@24e808000 (apple,t8112-dart): compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@24e808000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/fifo@24eb14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: usb@382280000 (apple,t8112-dwc3): iommus: [[107, 0], [108, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: usb@382280000 (apple,t8112-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,dwc3', 'snps,dwc3']
--
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3c (ti,sn012776): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@4b (cirrus,cs42l84): 'sound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@24e808000 (apple,t8112-dart): compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@24e808000 (apple,t8112-dart): compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@24e808000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/fifo@24eb14000: failed to match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/fifo@24eb14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: usb@382280000 (apple,t8112-dwc3): iommus: [[109, 0], [110, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: usb@382280000 (apple,t8112-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
