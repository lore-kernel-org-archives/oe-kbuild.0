Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35592144C9
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 18:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754592075; cv=none; b=QuYvUwv3NFBrHUhtRPlec5bMG9df0S/dJJjQL8pzGJBf3nxZ22cqKFWyhlucPudxch9BZC+rsd0Ae61vxaWDrLYEKMXeqhNlvWVKR7MgDq2omzF3SIzTwvFB94qdw51b93OgskJcJDw6VbwzFLcHpPXPP62XZDI1zRh6VxVa4gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754592075; c=relaxed/simple;
	bh=rlT9CLolHzGqBfz6KWnaVesIseOKry0YbfNkjZqsKFM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U6zzMngOb+Eh0r9BdJGNnliQn9DdPSDS/IwSXFf6QfdDBkXSwaDZSmdgbtBjX+zGsvuRYhKenF/nC0Y87NxdG8XGYHBJRvofE2WEHjDuyrKV1i3E0OqWUSmD3bePpkKcv2wDzoaKOdpHuYXFlMk8YoHGq3o9km9wZREznBCzVUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PVvRCrzk; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PVvRCrzk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754592073; x=1786128073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rlT9CLolHzGqBfz6KWnaVesIseOKry0YbfNkjZqsKFM=;
  b=PVvRCrzk845K9xeMVeLh0Ysh85lfTQO86DZg93TtJ6UxiXHPZ/wc5Pp5
   hbzrR+LzdGjRaKlFmLTnsm99+bLWTU1KClFSfGtwH4JQ5+xlKl4leMVPg
   IMltYtXuFDWL275cJR1YX8wws0xATgc0DBzZIRQ0fFA5Kw5xP9L9b3Zj1
   CWi4jUDwiRXKQK90kghy1Y/kb9usgb7KPhs9Hh5K2TcDg6rJjC+iBlvFa
   rFZuQTcHUtvkdTYLuHWh9K5EcIWxinTtLrvnoSiC3RMDzS45r0VrJETev
   1PQoXtfqL355L8ZIdinGctmPSDRcCXSuxXGFxK2SG4VlNeGU6elRm1XJE
   w==;
X-CSE-ConnectionGUID: sgLXp3XFTKi6V9+EpLGQYA==
X-CSE-MsgGUID: I5U6d4ATT0mVgE3h6osNQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56145723"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56145723"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 11:41:11 -0700
X-CSE-ConnectionGUID: 8MeQecHeQ+60oXr7NT1pDA==
X-CSE-MsgGUID: oYapb4g+Ts+4MbHD+FuIIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169366529"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 07 Aug 2025 11:41:09 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk5Y3-00036y-0h;
	Thu, 07 Aug 2025 18:41:07 +0000
Date: Fri, 8 Aug 2025 02:41:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 303/801] arch/powerpc/boot/dts/fsl/kmcent2.dtb:
 chassis-mgmt@6,0 (keymile,bfticu): #interrupt-cells: 2 was expected
Message-ID: <202508080220.Q57Y3UHK-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 76c722bb9f162f23c19a8e53b624955006edcb4e [303/801] dt-bindings: mfd: Convert keymile,bfticu to DT schema
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: powerpc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250808/202508080220.Q57Y3UHK-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080220.Q57Y3UHK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508080220.Q57Y3UHK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   		'keymile,qriox' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'keymile,qriox' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: localbus@ffe124000 (fsl,ifc): board-control@2,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /localbus@ffe124000/board-control@2,0: failed to match any schema with compatible: ['keymile,qriox']
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: chassis-mgmt@6,0 (keymile,bfticu): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/keymile,bfticu.yaml#
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: chassis-mgmt@6,0 (keymile,bfticu): interrupts: [[11, 1, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/keymile,bfticu.yaml#
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: chassis-mgmt@6,0 (keymile,bfticu): reg: [[6, 0, 256]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/keymile,bfticu.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-corenet: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-npc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: dcsr@f00000000 (fsl,dcsr): $nodename:0: 'dcsr@f00000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /dcsr@f00000000: failed to match any schema with compatible: ['fsl,dcsr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1040-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1040-dcsr-epu', 'fsl,dcsr-epu']
--
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: localbus@ffe124000 (fsl,p2041-elbc): chassis-mgmt@3,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: localbus@ffe124000 (fsl,p2041-elbc): board-control@1,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: localbus@ffe124000 (fsl,p2041-elbc): nand@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p2041-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p2041-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /localbus@ffe124000/nand@0,0: failed to match any schema with compatible: ['fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /localbus@ffe124000/board-control@1,0: failed to match any schema with compatible: ['keymile,qriox']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: chassis-mgmt@3,0 (keymile,bfticu): interrupts: [[6, 1, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/keymile,bfticu.yaml#
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: chassis-mgmt@3,0 (keymile,bfticu): reg: [[3, 0, 256]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/keymile,bfticu.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /pcie@ffe200000: failed to match any schema with compatible: ['fsl,p2041-pcie', 'fsl,qoriq-pcie-v2.2']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /pcie@ffe200000: failed to match any schema with compatible: ['fsl,p2041-pcie', 'fsl,qoriq-pcie-v2.2']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: pcie@ffe200000 (fsl,p2041-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: pcie@ffe200000 (fsl,p2041-pcie): pcie@0:interrupts:0: [16, 2, 1, 15] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /pcie@ffe201000: failed to match any schema with compatible: ['fsl,p2041-pcie', 'fsl,qoriq-pcie-v2.2']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /pcie@ffe201000: failed to match any schema with compatible: ['fsl,p2041-pcie', 'fsl,qoriq-pcie-v2.2']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: pcie@ffe201000 (fsl,p2041-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
