Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843A97E0E8
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Aug 2025 01:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754790853; cv=none; b=VD9txcExd0PAeerWZR8j7fYPrnc6UtzYKXNeIGCoN0GQoCtdaSH+vxzmkiAyfZeJ73RYgTd+dVN41sky39GitFgxE8nyxaHWXbY5TNcPRLiV0CeGykfnJ7ds4Im5/PVcAauMb/MrgZhKTVHQ3LL/i/GZKLUu5CkuIdARXc0Hf6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754790853; c=relaxed/simple;
	bh=yfapUs4abwh3T+zp6js8NSkHnrvmxWhd5e3YUDUi7Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UXm0HNHXnMNG7PVbYBzRdg1cFSJCdqzLaf6HOOKIzSGmRx0wlDbcWnvd/YlJ3PhMhWT/WeY945wISXAN3BN+z1HXfK+MytBa3jpkUhPa/Fae90xeHEqZYBDjnC53eWNIsZQ9e8uTOcQvf/2HAHJFSUiTui8Huj+jSeujB3ALwrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Thdeoe1A; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Thdeoe1A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754790851; x=1786326851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yfapUs4abwh3T+zp6js8NSkHnrvmxWhd5e3YUDUi7Ao=;
  b=Thdeoe1AVh1Mt6tcYBChznNwy+AQFNT69cV3glYDxHjbdKNDXU+rDqt6
   n16RfcbBJNIGUbdZhu7AEaXfsULYfUXJTQgkDug42rf4xUivds6bOweRZ
   8eMgXo/jgRVtZ5gWwtO6II/sLU9OFPKkG+EvnDZkjMdCr/34i/rL6dADF
   trDID1iTsFrS/fffiDkrhbpwfv8gvkJH1p7YxHI7+8rg65nxtH/BOSdYn
   uJWz/sn4AzrJcyz7SFp+Q0Js3rktr2MIqnM2plLcKk6Z8S9+h5YxvPzmu
   PxPr4pO/7r/ZqP58Js0d/9Fl/LkTOrYmdtBVcTcPpEi4jJITsplnv6/9n
   Q==;
X-CSE-ConnectionGUID: 5XqzQmsoTAaP+5T+UDUPrQ==
X-CSE-MsgGUID: yUcZIbYVTk636D25GbVMZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="57216765"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57216765"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 18:54:10 -0700
X-CSE-ConnectionGUID: qSnoJgvhSMKfioPYAJ0Kew==
X-CSE-MsgGUID: Ed0P/NJLQZOin5vvgNZBHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="196600039"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 09 Aug 2025 18:54:08 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukvGA-00057M-1Z;
	Sun, 10 Aug 2025 01:54:06 +0000
Date: Sun, 10 Aug 2025 09:53:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 383/801]
 arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: gpio@40049000
 (fsl,vf610-gpio): #gpio-cells: 2 was expected
Message-ID: <202508100909.vEcQymz9-lkp@intel.com>
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
commit: a92832e2ff52e63d0c65935767a13aaa487625e1 [383/801] dt-bindings: mux: Convert adi,adgs1408 to DT schema
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-054-20250807 (https://download.01.org/0day-ci/archive/20250810/202508100909.vEcQymz9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250810/202508100909.vEcQymz9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508100909.vEcQymz9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml#
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: iomuxc@40048000 (fsl,vf610-iomuxc): $nodename:0: 'iomuxc@40048000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,vf610-iomuxc.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: gpio@40049000 (fsl,vf610-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: gpio@40049000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: gpio@40049000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: gpio@4004a000 (fsl,vf610-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: gpio@4004a000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: gpio@4004a000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: gpio@4004b000 (fsl,vf610-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: gpio@4004b000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: gpio@4004b000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: gpio@4004c000 (fsl,vf610-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: gpio@4004c000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: gpio@4004c000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: gpio@4004d000 (fsl,vf610-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: gpio@4004d000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: gpio@4004d000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: nand@400e0000 (fsl,vf610-nfc): $nodename:0: 'nand@400e0000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: iomuxc@40048000 (fsl,vf610-iomuxc): $nodename:0: 'iomuxc@40048000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,vf610-iomuxc.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: gpio@40049000 (fsl,vf610-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: gpio@40049000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: gpio@40049000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: gpio@4004a000 (fsl,vf610-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: gpio@4004a000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: gpio@4004a000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: gpio@4004b000 (fsl,vf610-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: gpio@4004b000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: gpio@4004b000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: gpio@4004c000 (fsl,vf610-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: gpio@4004c000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: gpio@4004c000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: gpio@4004d000 (fsl,vf610-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: gpio@4004d000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: gpio@4004d000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: nand@400e0000 (fsl,vf610-nfc): $nodename:0: 'nand@400e0000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
--
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml#
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: iomuxc@40048000 (fsl,vf610-iomuxc): $nodename:0: 'iomuxc@40048000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,vf610-iomuxc.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: gpio@40049000 (fsl,vf610-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: gpio@40049000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: gpio@40049000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: gpio@4004a000 (fsl,vf610-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: gpio@4004a000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: gpio@4004a000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: gpio@4004b000 (fsl,vf610-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: gpio@4004b000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: gpio@4004b000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: gpio@4004c000 (fsl,vf610-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: gpio@4004c000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: gpio@4004c000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: gpio@4004d000 (fsl,vf610-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: gpio@4004d000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: gpio@4004d000 (fsl,vf610-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /soc/bus@40000000/src@4006e000: failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
   arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: nand@400e0000 (fsl,vf610-nfc): $nodename:0: 'nand@400e0000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
--
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: scm_conf@270 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: scm_conf@270 (syscon): $nodename:0: 'scm_conf@270' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/scm@2000/scm_conf@270/pbias_regulator@230: failed to match any schema with compatible: ['ti,pbias-omap2', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000/scm@2000/scm_conf@270/pbias_regulator@230: failed to match any schema with compatible: ['ti,pbias-omap2', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: counter@0 (ti,omap-counter32k): reg: [[0, 32]] is too short
   	from schema $id: http://devicetree.org/schemas/ti,omap-counter32k.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: counter@0 (ti,omap-counter32k): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap-counter32k.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@4900c000 (ti,omap2-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/ti,omap-gpio.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@4900c000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@4900c000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@4900e000 (ti,omap2-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/ti,omap-gpio.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@4900e000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@4900e000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@49010000 (ti,omap2-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/ti,omap-gpio.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@49010000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@49010000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@49012000 (ti,omap2-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/ti,omap-gpio.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@49012000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@49012000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@480b6000 (ti,omap2-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/ti,omap-gpio.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@480b6000 (ti,omap2-gpio): #gpio-cells: [2] is not of type 'integer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
