Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49B01C8633
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 22:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754604789; cv=none; b=XguVEFxqaEvS0fF2ERpUZZ4fqie1WaQboM5g6xlQm7RXXgA2+VDsW50LKrmZCpMC+pDzlcpxyMiCjxvjFFu7iRvXJMqXFMM9Jtz/ACxRkyF/kgn5P0aP2HoWSAMJfHUIf5CZaktBtf3ICQP9TkGtfrLE/vHYIQK1EGKhKUrzaPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754604789; c=relaxed/simple;
	bh=j0eNHq/mgwHkpDQ9x2pl6lmLtejrBttD7mnXirc7IZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o3uSx9BQlWqkBpmhuewSAlD6h+9mHSghGOrCodFpXWDOEYXLJXuMiMOKZvFZAp+Qyz5GyE17v8Umf9EmEGHOQv1/Xs9WZty4rwcyleLCx4uVxeHmp+FhtJ0EKKra7RWvXqtEvDs1FA92bpXEM5HwJ1aLR42YkBpI3Gs2+FZl/UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Exxt43o/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Exxt43o/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754604787; x=1786140787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j0eNHq/mgwHkpDQ9x2pl6lmLtejrBttD7mnXirc7IZA=;
  b=Exxt43o/aDtclBasaKOsEhYEGfXAIFzxc2Pow8CRjB/fQUr1CR6Ip7bT
   2QD/tmNKKdI+/WwBQpvKJii892uZhwP5/jOTS6l12cP9I/cbzJrEoyx8w
   8njzCHB7rHYHEZSGvDnBWLOW3aNaw3QJeTN4JMKrWQoGKdXIl/YJosmMm
   axISIjSX1jtHyZcHrrFK/6yhW7adKXmKYkyDt52ByoRy6RGGCYZUJzTmU
   n1kzlXPI31/TRP7thcneawAjpvW3pGvGNjP4R1Vq1E3iNC1U4tRwcMgom
   t7lI7+Svn6dUm1i7TvB4p4Iq8zXkF0dLHJ/iQ2SU+eBsy/4450jeBJMea
   Q==;
X-CSE-ConnectionGUID: qu2obTGlTmm7KWJ6oI4v5w==
X-CSE-MsgGUID: +KqRNU8qRnWWPFJdsufiBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56669130"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="56669130"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 15:13:06 -0700
X-CSE-ConnectionGUID: 5XiDjKIdSn6rAnBOAHkH6g==
X-CSE-MsgGUID: 2D2vMU7dRUyq+gMWpC9R7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="169293000"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 07 Aug 2025 15:13:05 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk8r9-0003J0-00;
	Thu, 07 Aug 2025 22:13:03 +0000
Date: Fri, 8 Aug 2025 06:12:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 315/801] arch/powerpc/boot/dts/fsl/kmcent2.dtb:
 board-control@2,0 (keymile,qriox): reg: [[2, 0, 128]] is too short
Message-ID: <202508080616.w4Q3YNJh-lkp@intel.com>
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
commit: 48acac79c161c8f4dc4da4320ce243f179090225 [315/801] dt-bindings: mfd: Convert keymile,qriox to DT schema
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: powerpc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250808/202508080616.w4Q3YNJh-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080616.w4Q3YNJh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508080616.w4Q3YNJh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   		'keymile,qriox' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'keymile,qriox' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'keymile,qriox' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: localbus@ffe124000 (fsl,ifc): board-control@2,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: board-control@2,0 (keymile,qriox): reg: [[2, 0, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/keymile,qriox.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: chassis-mgmt@6,0 (keymile,bfticu): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/keymile,bfticu.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: chassis-mgmt@6,0 (keymile,bfticu): interrupts: [[11, 1, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/keymile,bfticu.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: chassis-mgmt@6,0 (keymile,bfticu): reg: [[6, 0, 256]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/keymile,bfticu.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-npc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-corenet: 'ranges' is a required property
--
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /rapidio@ffe0c0000: failed to match any schema with compatible: ['fsl,srio']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: localbus@ffe124000 (fsl,p2041-elbc): nand@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: localbus@ffe124000 (fsl,p2041-elbc): chassis-mgmt@3,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: localbus@ffe124000 (fsl,p2041-elbc): board-control@1,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p2041-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p2041-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /localbus@ffe124000/nand@0,0: failed to match any schema with compatible: ['fsl,elbc-fcm-nand']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: board-control@1,0 (keymile,qriox): reg: [[1, 0, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/keymile,qriox.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: chassis-mgmt@3,0 (keymile,bfticu): interrupts: [[6, 1, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/keymile,bfticu.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: chassis-mgmt@3,0 (keymile,bfticu): reg: [[3, 0, 256]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/keymile,bfticu.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /pcie@ffe200000: failed to match any schema with compatible: ['fsl,p2041-pcie', 'fsl,qoriq-pcie-v2.2']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /pcie@ffe200000: failed to match any schema with compatible: ['fsl,p2041-pcie', 'fsl,qoriq-pcie-v2.2']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: pcie@ffe200000 (fsl,p2041-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: pcie@ffe200000 (fsl,p2041-pcie): pcie@0:interrupts:0: [16, 2, 1, 15] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
