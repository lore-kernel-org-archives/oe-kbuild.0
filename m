Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B722E6CCD
	for <oe-kbuild@lists.linux.dev>; Sat, 23 May 2026 03:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779507775; cv=none; b=BIvmuEDefgRw8PWF0YcdCbOfMXuJ4fB4y5Sh1p8GYwyLoyG+HJdCoIZrH9vKhZVrz8cto2D4HWEpdrXnr08PaTKFZjrVnKFtR+uFTQ7j4NqDxuuQ+M7+4LxUGzhL1qcy84+cpbRouLf8lkdimdOyvoNiA6+O5xhRe+BGbwYJh7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779507775; c=relaxed/simple;
	bh=+XM6tretMWvvBOAER3xVXqg8cNB5VoAtXodgl+OzMw0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cYrRdH8Zm1PaJO9Eu0qBGqs5t8/UnILTqKGldpaMzBP7+N4W/BMYRmjSvWD7agOuxg7rfaCBjntO3OSvtAobfWAXig/On8efzsJBXD/qvloIDg+my5WbSNYsa8ZsKEJAVyhAk6L2GZvK/OEVHqdfz1ohYVWFE6riKzJBrizCvaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AuQljSb1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AuQljSb1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779507762; x=1811043762;
  h=date:from:to:cc:subject:message-id;
  bh=+XM6tretMWvvBOAER3xVXqg8cNB5VoAtXodgl+OzMw0=;
  b=AuQljSb1H6dJmIz1e7bqwAO4IuSoMf3XAmGuw2L8LBqpuBfWgIaaSauy
   hPiHZlZNqiIkO4+XxvtRMBoM/9kZBwlAmUPIyGfJ2PXlDfm53/BL07ViO
   9c+6LFNDPKMtGVGR71YQSpCTFemHwvXREbgyvFg+A3bBU7eqzxy55mLf7
   YW3un33D8RIfJSqJUMXIuTeIhUPHNKhFbZXXmEICHJrAFHoJoMBKS6I60
   HcTQnGhVjL/wl+if63db6g/ico51RbJBOWROs9mkh42bzjk6fqAezWEpQ
   btJUbFjKH9LaxKvwWkfhFj6gx5v8315xcUcLhxuyrKoISCkFX848Li7Ie
   A==;
X-CSE-ConnectionGUID: PynZ6AzxSkmjoIayawEG1g==
X-CSE-MsgGUID: pPj+Nx15QbG7XCQKNJKAdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="91119106"
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="91119106"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 20:42:41 -0700
X-CSE-ConnectionGUID: kv4wOLz6TPyZJqoU8c3ttw==
X-CSE-MsgGUID: MeN2B+qYQiCDBB2bcYY8cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="240053715"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 22 May 2026 20:42:39 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQdFz-00000000BVl-1r9s;
	Sat, 23 May 2026 03:42:35 +0000
Date: Sat, 23 May 2026 05:42:28 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/akebono.dtb: interrupt-controller
 (chrp,open-pic): 'reg' is a required property
Message-ID: <202605230514.aZf6gnW7-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   79bd2dded182b1d458b18e62684b7f82ffc682e5
commit: a241f1a1b338b714e4d7417f71af9a93a9bd3c92 dt-bindings: interrupt-controller: Convert chrp,open-pic to DT schema
date:   1 year ago
:::::: branch date: 4 hours ago
:::::: commit date: 1 year ago
config: powerpc-randconfig-2051-20260521 (https://download.01.org/0day-ci/archive/20260523/202605230514.aZf6gnW7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260523/202605230514.aZf6gnW7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a241f1a1b338 ("dt-bindings: interrupt-controller: Convert chrp,open-pic to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605230514.aZf6gnW7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/akebono.dts:63.9-66.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/akebono.dts:157.13-249.5: Warning (unit_address_vs_reg): /plb/opb: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/akebono.dtb: /: failed to match any schema with compatible: ['ibm,akebono', 'ibm,476gtr']
   arch/powerpc/boot/dts/akebono.dtb: /: failed to match any schema with compatible: ['ibm,akebono', 'ibm,476gtr']
   arch/powerpc/boot/dts/akebono.dtb: / (ibm,akebono): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/akebono.dtb: interrupt-controller (chrp,open-pic): '#size-cells', 'dcr-reg', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/akebono.dtb: interrupt-controller (chrp,open-pic): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/akebono.dtb: /plb: failed to match any schema with compatible: ['ibm,plb6']
   arch/powerpc/boot/dts/akebono.dtb: /plb/hsta@310000e0000: failed to match any schema with compatible: ['ibm,476gtr-hsta-msi', 'ibm,hsta-msi']
   arch/powerpc/boot/dts/akebono.dtb: /plb/hsta@310000e0000: failed to match any schema with compatible: ['ibm,476gtr-hsta-msi', 'ibm,hsta-msi']
   arch/powerpc/boot/dts/akebono.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-476gtr', 'ibm,mcmal2']
   arch/powerpc/boot/dts/akebono.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-476gtr', 'ibm,mcmal2']
   arch/powerpc/boot/dts/akebono.dtb: /plb/sd@30000000000: failed to match any schema with compatible: ['ibm,476gtr-sdhci', 'generic-sdhci']
   arch/powerpc/boot/dts/akebono.dtb: /plb/sd@30000000000: failed to match any schema with compatible: ['ibm,476gtr-sdhci', 'generic-sdhci']
   arch/powerpc/boot/dts/akebono.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-4xx', 'ibm,opb']
   arch/powerpc/boot/dts/akebono.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-4xx', 'ibm,opb']
--
   arch/powerpc/boot/dts/currituck.dts:62.9-65.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/currituck.dts:84.13-123.5: Warning (unit_address_vs_reg): /plb/opb: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/currituck.dtb: /: failed to match any schema with compatible: ['ibm,currituck']
   arch/powerpc/boot/dts/currituck.dtb: / (ibm,currituck): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/powerpc/boot/dts/currituck.dtb: interrupt-controller (chrp,open-pic): '#size-cells', 'dcr-reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/currituck.dtb: interrupt-controller (chrp,open-pic): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/currituck.dtb: /plb: failed to match any schema with compatible: ['ibm,plb6']
   arch/powerpc/boot/dts/currituck.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-4xx', 'ibm,opb']
   arch/powerpc/boot/dts/currituck.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-4xx', 'ibm,opb']
   arch/powerpc/boot/dts/currituck.dtb: serial@10000000 (ns16750): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/currituck.dtb: /plb/opb/fpga@50000000: failed to match any schema with compatible: ['ibm,currituck-fpga']
   arch/powerpc/boot/dts/currituck.dtb: /plb/opb/i2c@0: failed to match any schema with compatible: ['ibm,iic-currituck', 'ibm,iic']
   arch/powerpc/boot/dts/currituck.dtb: /plb/opb/i2c@0: failed to match any schema with compatible: ['ibm,iic-currituck', 'ibm,iic']
   arch/powerpc/boot/dts/currituck.dtb: rtc@68 (st,m41t80): compatible: ['st,m41t80', 'm41st85'] is too long
--
   	'bcm5461a' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/powerpc/boot/dts/holly.dtb: /tsi109@c0000000/ethernet@6200: failed to match any schema with compatible: ['tsi109-ethernet', 'tsi108-ethernet']
   arch/powerpc/boot/dts/holly.dtb: /tsi109@c0000000/ethernet@6200: failed to match any schema with compatible: ['tsi109-ethernet', 'tsi108-ethernet']
   arch/powerpc/boot/dts/holly.dtb: /tsi109@c0000000/ethernet@6600: failed to match any schema with compatible: ['tsi109-ethernet', 'tsi108-ethernet']
   arch/powerpc/boot/dts/holly.dtb: /tsi109@c0000000/ethernet@6600: failed to match any schema with compatible: ['tsi109-ethernet', 'tsi108-ethernet']
   arch/powerpc/boot/dts/holly.dtb: serial@7808 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/holly.dtb: serial@7c08 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/powerpc/boot/dts/holly.dtb: pic@7400 (chrp,open-pic): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/holly.dtb: pic@7400 (chrp,open-pic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/holly.dtb: pic@7400 (chrp,open-pic): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/holly.dtb: /pci@c0001000: failed to match any schema with compatible: ['tsi109-pci', 'tsi108-pci']
   arch/powerpc/boot/dts/holly.dtb: /pci@c0001000: failed to match any schema with compatible: ['tsi109-pci', 'tsi108-pci']
   arch/powerpc/boot/dts/holly.dtb: router@1180: 'reg' is a dependency of 'big-endian'
   	from schema $id: http://devicetree.org/schemas/reg.yaml
--
   arch/powerpc/boot/dts/iss4xx-mpic.dts:98.9-102.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/iss4xx-mpic.dts:121.13-140.5: Warning (unit_address_vs_reg): /plb/opb: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/iss4xx-mpic.dts:143.8-146.4: Warning (unit_address_vs_reg): /nvrtc: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/iss4xx-mpic.dts:147.12-150.4: Warning (unit_address_vs_reg): /iss-block: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/iss4xx-mpic.dtb: /: failed to match any schema with compatible: ['ibm,iss-4xx']
   arch/powerpc/boot/dts/iss4xx-mpic.dtb: / (ibm,iss-4xx): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/powerpc/boot/dts/iss4xx-mpic.dtb: interrupt-controller (chrp,open-pic): '#size-cells', 'dcr-reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/iss4xx-mpic.dtb: interrupt-controller (chrp,open-pic): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/iss4xx-mpic.dtb: /plb: failed to match any schema with compatible: ['ibm,plb-4xx', 'ibm,plb4']
   arch/powerpc/boot/dts/iss4xx-mpic.dtb: /plb: failed to match any schema with compatible: ['ibm,plb-4xx', 'ibm,plb4']
   arch/powerpc/boot/dts/iss4xx-mpic.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-4xx', 'ibm,opb']
   arch/powerpc/boot/dts/iss4xx-mpic.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-4xx', 'ibm,opb']
   arch/powerpc/boot/dts/iss4xx-mpic.dtb: serial@40000200 (ns16550a): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/iss4xx-mpic.dtb: /nvrtc: failed to match any schema with compatible: ['ds1743-nvram', 'ds1743', 'rtc-ds1743']
   arch/powerpc/boot/dts/iss4xx-mpic.dtb: /nvrtc: failed to match any schema with compatible: ['ds1743-nvram', 'ds1743', 'rtc-ds1743']
   arch/powerpc/boot/dts/iss4xx-mpic.dtb: /nvrtc: failed to match any schema with compatible: ['ds1743-nvram', 'ds1743', 'rtc-ds1743']
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/kuroboxHD.dtb: i2c@80003000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/kuroboxHD.dtb: serial@80004500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/kuroboxHD.dtb: serial@80004600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/powerpc/boot/dts/kuroboxHD.dtb: interrupt-controller@80040000 (chrp,open-pic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/kuroboxHD.dtb: pci@fec00000 (mpc10x-pci): '#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'clock-frequency', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'interrupt-parent', 'ranges', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml
   arch/powerpc/boot/dts/kuroboxHD.dtb: pci@fec00000 (mpc10x-pci): 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/kuroboxHG.dtb: i2c@80003000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/kuroboxHG.dtb: serial@80004500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/kuroboxHG.dtb: serial@80004600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/powerpc/boot/dts/kuroboxHG.dtb: interrupt-controller@80040000 (chrp,open-pic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/kuroboxHG.dtb: pci@fec00000 (mpc10x-pci): '#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'clock-frequency', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'interrupt-parent', 'ranges', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml
   arch/powerpc/boot/dts/kuroboxHG.dtb: pci@fec00000 (mpc10x-pci): 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml
--
   arch/powerpc/boot/dts/mvme5100.dtb: hawk@fef80000 (hawk-bridge): 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml
   arch/powerpc/boot/dts/mvme5100.dtb: serial@8000 (ns16550): Unevaluated properties are not allowed ('device_type' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/mvme5100.dtb: serial@8000 (ns16550): reg-shift: 4 is not one of [0, 1, 2]
   	from schema $id: http://devicetree.org/schemas/reg.yaml
   arch/powerpc/boot/dts/mvme5100.dtb: serial@8200 (ns16550): Unevaluated properties are not allowed ('device_type' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/mvme5100.dtb: serial@8200 (ns16550): reg-shift: 4 is not one of [0, 1, 2]
   	from schema $id: http://devicetree.org/schemas/reg.yaml
>> arch/powerpc/boot/dts/mvme5100.dtb: interrupt-controller@f3f80000 (chrp,open-pic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/mvme5100.dtb: pci@feff0000 (hawk-pci): '#address-cells', '#interrupt-cells', '#size-cells', '8259-interrupt-acknowledge', 'bus-range', 'clock-frequency', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'interrupt-parent', 'isa', 'ranges', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml
   arch/powerpc/boot/dts/mvme5100.dtb: pci@feff0000 (hawk-pci): 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml
   arch/powerpc/boot/dts/mvme5100.dtb: isa (isa): $nodename:0: 'isa' does not match '^isa@'
   	from schema $id: http://devicetree.org/schemas/isa/isa-bridge.yaml
   arch/powerpc/boot/dts/mvme5100.dtb: isa (isa): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'device_type', 'interrupt-controller@20', 'interrupt-parent', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/isa/isa-bridge.yaml
   arch/powerpc/boot/dts/mvme5100.dtb: /pci@feff0000/isa/interrupt-controller@20: failed to match any schema with compatible: ['chrp,iic']
--
   arch/powerpc/boot/dts/socrates.dtb: /soc8544@e0000000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,mpc8544-l2-cache-controller']
   arch/powerpc/boot/dts/socrates.dtb: i2c@3000 (fsl,mpc8544-i2c): Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/socrates.dtb: i2c@3100 (fsl,mpc8544-i2c): Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/socrates.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/socrates.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/socrates.dtb: /soc8544@e0000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8548-guts']
>> arch/powerpc/boot/dts/socrates.dtb: pic@40000 (chrp,open-pic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/socrates.dtb: /localbus: failed to match any schema with compatible: ['fsl,mpc8544-localbus', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/socrates.dtb: /localbus: failed to match any schema with compatible: ['fsl,mpc8544-localbus', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/socrates.dtb: nor_flash@0,0 (amd,s29gl256n): $nodename:0: 'nor_flash@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/socrates.dtb: nor_flash@0,0 (amd,s29gl256n): Unevaluated properties are not allowed ('partition@0', 'partition@1e0000', 'partition@200000', 'partition@3f80000', 'partition@3fc0000', 'partition@400000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/socrates.dtb: display@2,0 (fujitsu,lime): 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml
   arch/powerpc/boot/dts/socrates.dtb: display@2,0 (fujitsu,lime): 'broken-usage-of-incorrect-compatible' is a required property
--
   arch/powerpc/boot/dts/storcenter.dtb: /soc@fc000000: failed to match any schema with compatible: ['fsl,mpc8241', 'mpc10x']
   arch/powerpc/boot/dts/storcenter.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/storcenter.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/storcenter.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/powerpc/boot/dts/storcenter.dtb: interrupt-controller@40000 (chrp,open-pic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/storcenter.dtb: pci@fe800000 (mpc10x-pci): '#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'clock-frequency', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'interrupt-parent', 'ranges', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml
   arch/powerpc/boot/dts/storcenter.dtb: pci@fe800000 (mpc10x-pci): 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml
--
   arch/powerpc/boot/dts/stx_gp3_8560.dtb: /soc@fdf00000/ecm@1000: failed to match any schema with compatible: ['fsl,mpc8560-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/stx_gp3_8560.dtb: /soc@fdf00000/ecm@1000: failed to match any schema with compatible: ['fsl,mpc8560-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/stx_gp3_8560.dtb: /soc@fdf00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,mpc8540-l2-cache-controller']
   arch/powerpc/boot/dts/stx_gp3_8560.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/stx_gp3_8560.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
>> arch/powerpc/boot/dts/stx_gp3_8560.dtb: pic@40000 (chrp,open-pic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/stx_gp3_8560.dtb: cpm@919c0 (fsl,mpc8560-cpm): $nodename:0: 'cpm@919c0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/stx_gp3_8560.dtb: /soc@fdf00000/cpm@919c0: failed to match any schema with compatible: ['fsl,mpc8560-cpm', 'fsl,cpm2', 'simple-bus']
   arch/powerpc/boot/dts/stx_gp3_8560.dtb: /soc@fdf00000/cpm@919c0: failed to match any schema with compatible: ['fsl,mpc8560-cpm', 'fsl,cpm2', 'simple-bus']
   arch/powerpc/boot/dts/stx_gp3_8560.dtb: /soc@fdf00000/cpm@919c0/brg@919f0: failed to match any schema with compatible: ['fsl,mpc8560-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/stx_gp3_8560.dtb: /soc@fdf00000/cpm@919c0/brg@919f0: failed to match any schema with compatible: ['fsl,mpc8560-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/stx_gp3_8560.dtb: /soc@fdf00000/cpm@919c0/brg@919f0: failed to match any schema with compatible: ['fsl,mpc8560-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/stx_gp3_8560.dtb: /soc@fdf00000/cpm@919c0/pic@90c00: failed to match any schema with compatible: ['fsl,mpc8560-cpm-pic', 'fsl,cpm2-pic']
   arch/powerpc/boot/dts/stx_gp3_8560.dtb: /soc@fdf00000/cpm@919c0/pic@90c00: failed to match any schema with compatible: ['fsl,mpc8560-cpm-pic', 'fsl,cpm2-pic']
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/stxssa8555.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/stxssa8555.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/stxssa8555.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/powerpc/boot/dts/stxssa8555.dtb: pic@40000 (chrp,open-pic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/stxssa8555.dtb: /soc8555@e0000000/cpm@919c0: failed to match any schema with compatible: ['fsl,mpc8555-cpm', 'fsl,cpm2']
   arch/powerpc/boot/dts/stxssa8555.dtb: /soc8555@e0000000/cpm@919c0: failed to match any schema with compatible: ['fsl,mpc8555-cpm', 'fsl,cpm2']
   arch/powerpc/boot/dts/stxssa8555.dtb: /soc8555@e0000000/cpm@919c0/brg@919f0: failed to match any schema with compatible: ['fsl,mpc8555-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/stxssa8555.dtb: /soc8555@e0000000/cpm@919c0/brg@919f0: failed to match any schema with compatible: ['fsl,mpc8555-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/stxssa8555.dtb: /soc8555@e0000000/cpm@919c0/brg@919f0: failed to match any schema with compatible: ['fsl,mpc8555-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/stxssa8555.dtb: /soc8555@e0000000/cpm@919c0/pic@90c00: failed to match any schema with compatible: ['fsl,mpc8555-cpm-pic', 'fsl,cpm2-pic']
   arch/powerpc/boot/dts/stxssa8555.dtb: /soc8555@e0000000/cpm@919c0/pic@90c00: failed to match any schema with compatible: ['fsl,mpc8555-cpm-pic', 'fsl,cpm2-pic']
   arch/powerpc/boot/dts/stxssa8555.dtb: pci@e0008000 (fsl,mpc8540-pci): interrupt-map-mask:0: 129024 is greater than the maximum of 65280
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/tqm8540.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/tqm8540.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/tqm8540.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/powerpc/boot/dts/tqm8540.dtb: pic@40000 (chrp,open-pic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/tqm8540.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8540-localbus', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/tqm8540.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8540-localbus', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/tqm8540.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/tqm8540.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@180000', 'partition@1f40000', 'partition@1f80000', 'partition@1fc0000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/tqm8541.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/tqm8541.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/tqm8541.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/powerpc/boot/dts/tqm8541.dtb: pic@40000 (chrp,open-pic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/tqm8541.dtb: cpm@919c0 (fsl,mpc8541-cpm): $nodename:0: 'cpm@919c0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/tqm8541.dtb: /soc@e0000000/cpm@919c0: failed to match any schema with compatible: ['fsl,mpc8541-cpm', 'fsl,cpm2', 'simple-bus']
   arch/powerpc/boot/dts/tqm8541.dtb: /soc@e0000000/cpm@919c0: failed to match any schema with compatible: ['fsl,mpc8541-cpm', 'fsl,cpm2', 'simple-bus']
   arch/powerpc/boot/dts/tqm8541.dtb: /soc@e0000000/cpm@919c0/brg@919f0: failed to match any schema with compatible: ['fsl,mpc8541-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/tqm8541.dtb: /soc@e0000000/cpm@919c0/brg@919f0: failed to match any schema with compatible: ['fsl,mpc8541-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/tqm8541.dtb: /soc@e0000000/cpm@919c0/brg@919f0: failed to match any schema with compatible: ['fsl,mpc8541-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/tqm8541.dtb: /soc@e0000000/cpm@919c0/pic@90c00: failed to match any schema with compatible: ['fsl,mpc8541-cpm-pic', 'fsl,cpm2-pic']
   arch/powerpc/boot/dts/tqm8541.dtb: /soc@e0000000/cpm@919c0/pic@90c00: failed to match any schema with compatible: ['fsl,mpc8541-cpm-pic', 'fsl,cpm2-pic']
--
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: i2c@3100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: /soc@a0000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8548-guts']
>> arch/powerpc/boot/dts/tqm8548-bigflash.dtb: pic@40000 (chrp,open-pic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: /localbus@a0005000: failed to match any schema with compatible: ['fsl,mpc8548-localbus', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: /localbus@a0005000: failed to match any schema with compatible: ['fsl,mpc8548-localbus', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: /localbus@a0005000/can@2,0: failed to match any schema with compatible: ['bosch,cc770']
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: /localbus@a0005000/can@2,100: failed to match any schema with compatible: ['bosch,cc770']
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: /localbus@a0005000/upm@3,0: failed to match any schema with compatible: ['tqc,tqm8548-upm-nand', 'fsl,upm-nand']
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: /localbus@a0005000/upm@3,0: failed to match any schema with compatible: ['tqc,tqm8548-upm-nand', 'fsl,upm-nand']
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: nand@0: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: nand@0: 'reg' is a required property
--
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/tqm8548.dtb: i2c@3100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/tqm8548.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/tqm8548.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/tqm8548.dtb: /soc@e0000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8548-guts']
>> arch/powerpc/boot/dts/tqm8548.dtb: pic@40000 (chrp,open-pic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/tqm8548.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8548-localbus', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/tqm8548.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8548-localbus', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/tqm8548.dtb: /localbus@e0005000/can@2,0: failed to match any schema with compatible: ['bosch,cc770']
   arch/powerpc/boot/dts/tqm8548.dtb: /localbus@e0005000/can@2,100: failed to match any schema with compatible: ['bosch,cc770']
   arch/powerpc/boot/dts/tqm8548.dtb: /localbus@e0005000/upm@3,0: failed to match any schema with compatible: ['tqc,tqm8548-upm-nand', 'fsl,upm-nand']
   arch/powerpc/boot/dts/tqm8548.dtb: /localbus@e0005000/upm@3,0: failed to match any schema with compatible: ['tqc,tqm8548-upm-nand', 'fsl,upm-nand']
   arch/powerpc/boot/dts/tqm8548.dtb: nand@0: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml
   arch/powerpc/boot/dts/tqm8548.dtb: nand@0: 'reg' is a required property
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/tqm8555.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/tqm8555.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/tqm8555.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/powerpc/boot/dts/tqm8555.dtb: pic@40000 (chrp,open-pic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/tqm8555.dtb: cpm@919c0 (fsl,mpc8555-cpm): $nodename:0: 'cpm@919c0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/tqm8555.dtb: /soc@e0000000/cpm@919c0: failed to match any schema with compatible: ['fsl,mpc8555-cpm', 'fsl,cpm2', 'simple-bus']
   arch/powerpc/boot/dts/tqm8555.dtb: /soc@e0000000/cpm@919c0: failed to match any schema with compatible: ['fsl,mpc8555-cpm', 'fsl,cpm2', 'simple-bus']
   arch/powerpc/boot/dts/tqm8555.dtb: /soc@e0000000/cpm@919c0/brg@919f0: failed to match any schema with compatible: ['fsl,mpc8555-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/tqm8555.dtb: /soc@e0000000/cpm@919c0/brg@919f0: failed to match any schema with compatible: ['fsl,mpc8555-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/tqm8555.dtb: /soc@e0000000/cpm@919c0/brg@919f0: failed to match any schema with compatible: ['fsl,mpc8555-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/tqm8555.dtb: /soc@e0000000/cpm@919c0/pic@90c00: failed to match any schema with compatible: ['fsl,mpc8555-cpm-pic', 'fsl,cpm2-pic']
   arch/powerpc/boot/dts/tqm8555.dtb: /soc@e0000000/cpm@919c0/pic@90c00: failed to match any schema with compatible: ['fsl,mpc8555-cpm-pic', 'fsl,cpm2-pic']
--
   arch/powerpc/boot/dts/tqm8560.dtb: /soc@e0000000/ecm@1000: failed to match any schema with compatible: ['fsl,mpc8560-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/tqm8560.dtb: /soc@e0000000/ecm@1000: failed to match any schema with compatible: ['fsl,mpc8560-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/tqm8560.dtb: /soc@e0000000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,mpc8540-l2-cache-controller']
   arch/powerpc/boot/dts/tqm8560.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/tqm8560.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
>> arch/powerpc/boot/dts/tqm8560.dtb: pic@40000 (chrp,open-pic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/tqm8560.dtb: cpm@919c0 (fsl,mpc8560-cpm): $nodename:0: 'cpm@919c0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/tqm8560.dtb: /soc@e0000000/cpm@919c0: failed to match any schema with compatible: ['fsl,mpc8560-cpm', 'fsl,cpm2', 'simple-bus']
   arch/powerpc/boot/dts/tqm8560.dtb: /soc@e0000000/cpm@919c0: failed to match any schema with compatible: ['fsl,mpc8560-cpm', 'fsl,cpm2', 'simple-bus']
   arch/powerpc/boot/dts/tqm8560.dtb: /soc@e0000000/cpm@919c0/brg@919f0: failed to match any schema with compatible: ['fsl,mpc8560-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/tqm8560.dtb: /soc@e0000000/cpm@919c0/brg@919f0: failed to match any schema with compatible: ['fsl,mpc8560-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/tqm8560.dtb: /soc@e0000000/cpm@919c0/brg@919f0: failed to match any schema with compatible: ['fsl,mpc8560-brg', 'fsl,cpm2-brg', 'fsl,cpm-brg']
   arch/powerpc/boot/dts/tqm8560.dtb: /soc@e0000000/cpm@919c0/pic@90c00: failed to match any schema with compatible: ['fsl,mpc8560-cpm-pic', 'fsl,cpm2-pic']
   arch/powerpc/boot/dts/tqm8560.dtb: /soc@e0000000/cpm@919c0/pic@90c00: failed to match any schema with compatible: ['fsl,mpc8560-cpm-pic', 'fsl,cpm2-pic']
--
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/turris1x.dtb: crypto@30000 (fsl,sec3.1): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/turris1x.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/turris1x.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/turris1x.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/turris1x.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
   arch/powerpc/boot/dts/turris1x.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/turris1x.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/turris1x.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
--
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/xcalibur1501.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/xcalibur1501.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/xcalibur1501.dtb: /soc8572@ef000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8572-guts']
   arch/powerpc/boot/dts/xcalibur1501.dtb: /soc8572@ef000000/msi@41600: failed to match any schema with compatible: ['fsl,mpc8572-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/xcalibur1501.dtb: /soc8572@ef000000/msi@41600: failed to match any schema with compatible: ['fsl,mpc8572-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/xcalibur1501.dtb: crypto@30000 (fsl,sec3.0): interrupts: [[45, 2], [58, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/xcalibur1501.dtb: pic@40000 (chrp,open-pic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/xcalibur1501.dtb: gpio-leds (gpio-leds): 'green', 'heartbeat', 'red', 'yellow' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
   arch/powerpc/boot/dts/xcalibur1501.dtb: /soc8572@ef000000/pme@10000: failed to match any schema with compatible: ['fsl,mpc8572-pme', 'pme8572']
   arch/powerpc/boot/dts/xcalibur1501.dtb: /soc8572@ef000000/pme@10000: failed to match any schema with compatible: ['fsl,mpc8572-pme', 'pme8572']
   arch/powerpc/boot/dts/xcalibur1501.dtb: /soc8572@ef000000/tlu@2f000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
   arch/powerpc/boot/dts/xcalibur1501.dtb: /soc8572@ef000000/tlu@2f000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
   arch/powerpc/boot/dts/xcalibur1501.dtb: /soc8572@ef000000/tlu@15000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
   arch/powerpc/boot/dts/xcalibur1501.dtb: /soc8572@ef000000/tlu@15000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
--
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/xpedite5200.dtb: i2c@3100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/xpedite5200.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/xpedite5200.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/xpedite5200.dtb: /soc@ef000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8548-guts']
>> arch/powerpc/boot/dts/xpedite5200.dtb: pic@40000 (chrp,open-pic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/xpedite5200.dtb: /localbus@ef005000: failed to match any schema with compatible: ['fsl,mpc8548-localbus', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/xpedite5200.dtb: /localbus@ef005000: failed to match any schema with compatible: ['fsl,mpc8548-localbus', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/xpedite5200.dtb: nor-boot@0,0 (cfi-flash): $nodename:0: 'nor-boot@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/xpedite5200.dtb: nor-boot@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@180000', 'partition@300000', 'partition@3f80000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/xpedite5200.dtb: nor-alternate@1,0 (cfi-flash): $nodename:0: 'nor-alternate@1,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/xpedite5200.dtb: nor-alternate@1,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@3f80000' were unexpected)
--
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: i2c@3100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: /soc@ef000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8548-guts']
>> arch/powerpc/boot/dts/xpedite5200_xmon.dtb: pic@40000 (chrp,open-pic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: /localbus@ef005000: failed to match any schema with compatible: ['fsl,mpc8548-localbus', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: /localbus@ef005000: failed to match any schema with compatible: ['fsl,mpc8548-localbus', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: nor-boot@0,0 (cfi-flash): $nodename:0: 'nor-boot@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: nor-boot@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@180000', 'partition@300000', 'partition@3f80000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: nor-alternate@1,0 (cfi-flash): $nodename:0: 'nor-alternate@1,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: nor-alternate@1,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@3f80000' were unexpected)
--
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/xpedite5301.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/xpedite5301.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/xpedite5301.dtb: /soc8572@ef000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8572-guts']
   arch/powerpc/boot/dts/xpedite5301.dtb: /soc8572@ef000000/msi@41600: failed to match any schema with compatible: ['fsl,mpc8572-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/xpedite5301.dtb: /soc8572@ef000000/msi@41600: failed to match any schema with compatible: ['fsl,mpc8572-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/xpedite5301.dtb: crypto@30000 (fsl,sec3.0): interrupts: [[45, 2], [58, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/xpedite5301.dtb: pic@40000 (chrp,open-pic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/xpedite5301.dtb: gpio-leds (gpio-leds): 'green', 'heartbeat', 'red', 'yellow' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
   arch/powerpc/boot/dts/xpedite5301.dtb: /soc8572@ef000000/pme@10000: failed to match any schema with compatible: ['fsl,mpc8572-pme', 'pme8572']
   arch/powerpc/boot/dts/xpedite5301.dtb: /soc8572@ef000000/pme@10000: failed to match any schema with compatible: ['fsl,mpc8572-pme', 'pme8572']
   arch/powerpc/boot/dts/xpedite5301.dtb: /soc8572@ef000000/tlu@2f000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
   arch/powerpc/boot/dts/xpedite5301.dtb: /soc8572@ef000000/tlu@2f000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
   arch/powerpc/boot/dts/xpedite5301.dtb: /soc8572@ef000000/tlu@15000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
   arch/powerpc/boot/dts/xpedite5301.dtb: /soc8572@ef000000/tlu@15000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
--
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/xpedite5330.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/xpedite5330.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/xpedite5330.dtb: /soc8572@ef000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8572-guts']
   arch/powerpc/boot/dts/xpedite5330.dtb: /soc8572@ef000000/msi@41600: failed to match any schema with compatible: ['fsl,mpc8572-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/xpedite5330.dtb: /soc8572@ef000000/msi@41600: failed to match any schema with compatible: ['fsl,mpc8572-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/xpedite5330.dtb: crypto@30000 (fsl,sec3.0): interrupts: [[45, 2], [58, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/xpedite5330.dtb: pic@40000 (chrp,open-pic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/xpedite5330.dtb: gpio-leds (gpio-leds): 'green', 'heartbeat', 'red', 'yellow' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
   arch/powerpc/boot/dts/xpedite5330.dtb: /soc8572@ef000000/pme@10000: failed to match any schema with compatible: ['fsl,mpc8572-pme', 'pme8572']
   arch/powerpc/boot/dts/xpedite5330.dtb: /soc8572@ef000000/pme@10000: failed to match any schema with compatible: ['fsl,mpc8572-pme', 'pme8572']
   arch/powerpc/boot/dts/xpedite5330.dtb: /soc8572@ef000000/tlu@2f000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
   arch/powerpc/boot/dts/xpedite5330.dtb: /soc8572@ef000000/tlu@2f000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
   arch/powerpc/boot/dts/xpedite5330.dtb: /soc8572@ef000000/tlu@15000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
   arch/powerpc/boot/dts/xpedite5330.dtb: /soc8572@ef000000/tlu@15000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
--
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/xpedite5370.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/xpedite5370.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/xpedite5370.dtb: /soc8572@ef000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8572-guts']
   arch/powerpc/boot/dts/xpedite5370.dtb: /soc8572@ef000000/msi@41600: failed to match any schema with compatible: ['fsl,mpc8572-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/xpedite5370.dtb: /soc8572@ef000000/msi@41600: failed to match any schema with compatible: ['fsl,mpc8572-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/xpedite5370.dtb: crypto@30000 (fsl,sec3.0): interrupts: [[45, 2], [58, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
>> arch/powerpc/boot/dts/xpedite5370.dtb: pic@40000 (chrp,open-pic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/xpedite5370.dtb: gpio-leds (gpio-leds): 'green', 'heartbeat', 'red', 'yellow' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
   arch/powerpc/boot/dts/xpedite5370.dtb: /soc8572@ef000000/pme@10000: failed to match any schema with compatible: ['fsl,mpc8572-pme', 'pme8572']
   arch/powerpc/boot/dts/xpedite5370.dtb: /soc8572@ef000000/pme@10000: failed to match any schema with compatible: ['fsl,mpc8572-pme', 'pme8572']
   arch/powerpc/boot/dts/xpedite5370.dtb: /soc8572@ef000000/tlu@2f000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
   arch/powerpc/boot/dts/xpedite5370.dtb: /soc8572@ef000000/tlu@2f000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
   arch/powerpc/boot/dts/xpedite5370.dtb: /soc8572@ef000000/tlu@15000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
   arch/powerpc/boot/dts/xpedite5370.dtb: /soc8572@ef000000/tlu@15000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: mdio@e7000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,b4420-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/msi@41c00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,b4420-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,b4420-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: global-utilities@e1000 (fsl,b4420-clockgen): compatible: 'oneOf' conditional failed, one must be fixed:
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: mdio@f3000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,b4860-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/msi@41c00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,b4860-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,b4860-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: global-utilities@e1000 (fsl,b4860-clockgen): compatible: 'oneOf' conditional failed, one must be fixed:
--
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/crypto@30000: failed to match any schema with compatible: ['fsl,sec-v4.4', 'fsl,sec-v4.0']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/crypto@30000/jr@1000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/crypto@30000/jr@2000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/crypto@30000/jr@3000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/crypto@30000/jr@4000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-v1.2-msgr', 'fsl,mpic-msg']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-v1.2-msgr', 'fsl,mpic-msg']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,bsc9131-guts']
--
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/crypto@30000: failed to match any schema with compatible: ['fsl,sec-v4.4', 'fsl,sec-v4.0']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/crypto@30000/jr@1000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/crypto@30000/jr@2000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/crypto@30000/jr@3000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/crypto@30000/jr@4000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,bsc9132-guts']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /pcie@ff70a000: failed to match any schema with compatible: ['fsl,bsc9132-pcie', 'fsl,qoriq-pcie-v2.2']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /pcie@ff70a000: failed to match any schema with compatible: ['fsl,bsc9132-pcie', 'fsl,qoriq-pcie-v2.2']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: pcie@ff70a000 (fsl,bsc9132-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
--
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/crypto@c0000/jr@1000: failed to match any schema with compatible: ['fsl,sec-v6.0-job-ring', 'fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/crypto@c0000/jr@1000: failed to match any schema with compatible: ['fsl,sec-v6.0-job-ring', 'fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/crypto@c0000/jr@1000: failed to match any schema with compatible: ['fsl,sec-v6.0-job-ring', 'fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/crypto@c0000/jr@2000: failed to match any schema with compatible: ['fsl,sec-v6.0-job-ring', 'fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/crypto@c0000/jr@2000: failed to match any schema with compatible: ['fsl,sec-v6.0-job-ring', 'fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/crypto@c0000/jr@2000: failed to match any schema with compatible: ['fsl,sec-v6.0-job-ring', 'fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/c293pcie.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/c293pcie.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,c293-guts']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /pcie@fffe0a000: failed to match any schema with compatible: ['fsl,qoriq-pcie-v2.2', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /pcie@fffe0a000: failed to match any schema with compatible: ['fsl,qoriq-pcie-v2.2', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: pcie@fffe0a000 (fsl,qoriq-pcie-v2.2): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
--
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: i2c@119100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p5020-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p5020-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,qoriq-pin-control-1.0']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): '#sleep-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml
--
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: ptp_clock@24e00 (fsl,etsec-ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: sdhc@2e000 (fsl,p2020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: crypto@30000 (fsl,sec3.1): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: pcie@fef08000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 26 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: dma@21300 (fsl,mpc8641-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /soc@fef00000/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8641-dma-channel', 'fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /soc@fef00000/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8641-dma-channel', 'fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /soc@fef00000/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8641-dma-channel', 'fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /soc@fef00000/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8641-dma-channel', 'fsl,eloplus-dma-channel']
>> arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /soc@fef00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /soc@fef00000/msi@41600: failed to match any schema with compatible: ['fsl,mpc8641-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /soc@fef00000/msi@41600: failed to match any schema with compatible: ['fsl,mpc8641-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /soc@fef00000/msi@41800: failed to match any schema with compatible: ['fsl,mpc8641-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /soc@fef00000/msi@41800: failed to match any schema with compatible: ['fsl,mpc8641-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /soc@fef00000/msi@41a00: failed to match any schema with compatible: ['fsl,mpc8641-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /soc@fef00000/msi@41a00: failed to match any schema with compatible: ['fsl,mpc8641-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /soc@fef00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /soc@fef00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8641-guts']
--
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: dma@21300 (fsl,mpc8641-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /soc@fef00000/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8641-dma-channel', 'fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /soc@fef00000/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8641-dma-channel', 'fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /soc@fef00000/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8641-dma-channel', 'fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /soc@fef00000/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8641-dma-channel', 'fsl,eloplus-dma-channel']
>> arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /soc@fef00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /soc@fef00000/msi@41600: failed to match any schema with compatible: ['fsl,mpc8641-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /soc@fef00000/msi@41600: failed to match any schema with compatible: ['fsl,mpc8641-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /soc@fef00000/msi@41800: failed to match any schema with compatible: ['fsl,mpc8641-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /soc@fef00000/msi@41800: failed to match any schema with compatible: ['fsl,mpc8641-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /soc@fef00000/msi@41a00: failed to match any schema with compatible: ['fsl,mpc8641-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /soc@fef00000/msi@41a00: failed to match any schema with compatible: ['fsl,mpc8641-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /soc@fef00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /soc@fef00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8641-guts']
--
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: dma@21300 (fsl,mpc8641-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /soc@fef00000/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8641-dma-channel', 'fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /soc@fef00000/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8641-dma-channel', 'fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /soc@fef00000/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8641-dma-channel', 'fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /soc@fef00000/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8641-dma-channel', 'fsl,eloplus-dma-channel']
>> arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /soc@fef00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /soc@fef00000/msi@41600: failed to match any schema with compatible: ['fsl,mpc8641-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /soc@fef00000/msi@41600: failed to match any schema with compatible: ['fsl,mpc8641-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /soc@fef00000/msi@41800: failed to match any schema with compatible: ['fsl,mpc8641-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /soc@fef00000/msi@41800: failed to match any schema with compatible: ['fsl,mpc8641-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /soc@fef00000/msi@41a00: failed to match any schema with compatible: ['fsl,mpc8641-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /soc@fef00000/msi@41a00: failed to match any schema with compatible: ['fsl,mpc8641-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /soc@fef00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /soc@fef00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8641-guts']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: mdio@e9000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
--
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: sata@221000 (fsl,pq-sata-v2): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p2041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p2041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,qoriq-pin-control-1.0']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): '#sleep-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml
--
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/usb@2b000: failed to match any schema with compatible: ['fsl,mpc8536-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: sdhc@2e000 (fsl,mpc8536-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: crypto@30000 (fsl,sec3.0): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8536-guts']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: power@e0070 (fsl,mpc8536-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: pcie@ffe09000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 25 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/usb@2b000: failed to match any schema with compatible: ['fsl,mpc8536-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: sdhc@2e000 (fsl,mpc8536-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: crypto@30000 (fsl,sec3.0): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8536-guts']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: power@e0070 (fsl,mpc8536-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: pcie@fffe09000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 25 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /soc8544@e0000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /soc8544@e0000000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /soc8544@e0000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /soc8544@e0000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8544-guts']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: pcie@e0009000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 25 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: pcie@e0009000 (fsl,mpc8548-pcie): pcie@0:interrupts:0: [25, 2, 0, 0] is too long
--
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: crypto@30000 (fsl,sec2.1): Unevaluated properties are not allowed ('sleep' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/rmu@d3000: failed to match any schema with compatible: ['fsl,srio-rmu']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/rmu@d3000/message-unit@0: failed to match any schema with compatible: ['fsl,srio-msg-unit']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/rmu@d3000/message-unit@100: failed to match any schema with compatible: ['fsl,srio-msg-unit']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/rmu@d3000/doorbell-unit@400: failed to match any schema with compatible: ['fsl,srio-dbell-unit']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/rmu@d3000/port-write-unit@4e0: failed to match any schema with compatible: ['fsl,srio-port-write-unit']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8568-guts', 'fsl,mpc8548-guts']
--
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: crypto@30000 (fsl,sec3.1): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: crypto@30000 (fsl,sec3.1): Unevaluated properties are not allowed ('sleep' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/rmu@d3000: failed to match any schema with compatible: ['fsl,srio-rmu']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/rmu@d3000/message-unit@0: failed to match any schema with compatible: ['fsl,srio-msg-unit']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/rmu@d3000/message-unit@100: failed to match any schema with compatible: ['fsl,srio-msg-unit']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/rmu@d3000/doorbell-unit@400: failed to match any schema with compatible: ['fsl,srio-dbell-unit']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/rmu@d3000/port-write-unit@4e0: failed to match any schema with compatible: ['fsl,srio-port-write-unit']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8569-guts', 'fsl,mpc8548-guts']
--
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: ptp_clock@24e00 (fsl,etsec-ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: crypto@30000 (fsl,sec3.0): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8572-guts']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: pcie@ffe08000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: ptp_clock@24e00 (fsl,etsec-ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: crypto@30000 (fsl,sec3.0): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8572-guts']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: pcie@fffe08000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: ptp_clock@24e00 (fsl,etsec-ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: crypto@30000 (fsl,sec3.0): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'protected-sources', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8572-guts']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: pcie@ffe08000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: ptp_clock@24e00 (fsl,etsec-ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: crypto@30000 (fsl,sec3.0): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'protected-sources', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8572-guts']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: pcie@ffe08000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: sdhc@2e000 (fsl,p2020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: sdhc@2e000 (fsl,p2020-esdhc): Unevaluated properties are not allowed ('non-removable' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: crypto@30000 (fsl,sec3.1): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/mvme2500.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/mvme2500.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
--
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/mvme7100.dtb: dma@21300 (fsl,mpc8641-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/mvme7100.dtb: /soc@f1000000/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8641-dma-channel', 'fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mvme7100.dtb: /soc@f1000000/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8641-dma-channel', 'fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mvme7100.dtb: /soc@f1000000/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8641-dma-channel', 'fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mvme7100.dtb: /soc@f1000000/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8641-dma-channel', 'fsl,eloplus-dma-channel']
>> arch/powerpc/boot/dts/fsl/mvme7100.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mvme7100.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/mvme7100.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/mvme7100.dtb: /soc@f1000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mvme7100.dtb: /soc@f1000000/msi@41600: failed to match any schema with compatible: ['fsl,mpc8641-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mvme7100.dtb: /soc@f1000000/msi@41600: failed to match any schema with compatible: ['fsl,mpc8641-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mvme7100.dtb: /soc@f1000000/msi@41800: failed to match any schema with compatible: ['fsl,mpc8641-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mvme7100.dtb: /soc@f1000000/msi@41800: failed to match any schema with compatible: ['fsl,mpc8641-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mvme7100.dtb: /soc@f1000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpc8641-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mvme7100.dtb: /soc@f1000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpc8641-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mvme7100.dtb: /soc@f1000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mvme7100.dtb: /soc@f1000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8641-guts']
--
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/rmu@d3000: failed to match any schema with compatible: ['fsl,srio-rmu']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/rmu@d3000/message-unit@0: failed to match any schema with compatible: ['fsl,srio-msg-unit']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/rmu@d3000/message-unit@100: failed to match any schema with compatible: ['fsl,srio-msg-unit']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/rmu@d3000/doorbell-unit@400: failed to match any schema with compatible: ['fsl,srio-dbell-unit']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/rmu@d3000/port-write-unit@4e0: failed to match any schema with compatible: ['fsl,srio-port-write-unit']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/oca4080.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,qoriq-pin-control-1.0']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): '#sleep-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml
--
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec-v4.4', 'fsl,sec-v4.0']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/crypto@30000/jr@1000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/crypto@30000/jr@2000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/crypto@30000/jr@3000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/crypto@30000/jr@4000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1010-guts']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3']
--
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec-v4.4', 'fsl,sec-v4.0']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/crypto@30000/jr@1000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/crypto@30000/jr@2000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/crypto@30000/jr@3000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/crypto@30000/jr@4000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1010-guts']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /pcie@fffe09000: failed to match any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /pcie@fffe09000: failed to match any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3']
--
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec-v4.4', 'fsl,sec-v4.0']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/crypto@30000/jr@1000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/crypto@30000/jr@2000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/crypto@30000/jr@3000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/crypto@30000/jr@4000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1010-guts']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /pcie@ffe09000: failed to match any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3']
--
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec-v4.4', 'fsl,sec-v4.0']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/crypto@30000/jr@1000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/crypto@30000/jr@2000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/crypto@30000/jr@3000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/crypto@30000/jr@4000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1010-guts']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /pcie@fffe09000: failed to match any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /pcie@fffe09000: failed to match any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3']
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: pcie@ffe09000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: pcie@fffe09000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: pcie@ffe09000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: pcie@fffe09000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'protected-sources', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: pcie@ffe09000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'protected-sources', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: pcie@ffe09000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: pcie@ffe09000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: pcie@ffe09000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: pcie@fffe09000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: pcie@ffe09000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: pcie@fffe09000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: sdhc@2e000 (fsl,esdhc): compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: sdhc@2e000 (fsl,esdhc): compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1021-guts']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: pcie@ffe09000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: sdhc@2e000 (fsl,esdhc): compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: sdhc@2e000 (fsl,esdhc): compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1021-guts']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: pcie@ffe09000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: sdhc@2e000 (fsl,esdhc): compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: sdhc@2e000 (fsl,esdhc): compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1021-guts']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: pcie@fffe09000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: sdhc@2e000 (fsl,p1022-esdhc): compatible:0: 'fsl,p1022-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1022-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: ethernet@b0000 (fsl,etsec2): queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: ethernet@b0000 (fsl,etsec2): queue-group@b4000: '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: ethernet@b0000 (fsl,etsec2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000', 'queue-group@b4000' were unexpected)
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: sdhc@2e000 (fsl,p1022-esdhc): compatible:0: 'fsl,p1022-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1022-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: ethernet@b0000 (fsl,etsec2): queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: ethernet@b0000 (fsl,etsec2): queue-group@b4000: '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: ethernet@b0000 (fsl,etsec2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000', 'queue-group@b4000' were unexpected)
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: sdhc@2e000 (fsl,p1022-esdhc): compatible:0: 'fsl,p1022-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1022-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1022rdk.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1022rdk.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1022-guts']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: power@e0070 (fsl,p1022-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: pcie@ffe09000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/crypto@300000/jr@4000: failed to match any schema with compatible: ['fsl,sec-v4.2-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/crypto@300000/rtic@6000: failed to match any schema with compatible: ['fsl,sec-v4.2-rtic', 'fsl,sec-v4.0-rtic']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/crypto@300000/rtic@6000/rtic-a@0: failed to match any schema with compatible: ['fsl,sec-v4.2-rtic-memory', 'fsl,sec-v4.0-rtic-memory']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/crypto@300000/rtic@6000/rtic-b@20: failed to match any schema with compatible: ['fsl,sec-v4.2-rtic-memory', 'fsl,sec-v4.0-rtic-memory']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/crypto@300000/rtic@6000/rtic-c@40: failed to match any schema with compatible: ['fsl,sec-v4.2-rtic-memory', 'fsl,sec-v4.0-rtic-memory']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/crypto@300000/rtic@6000/rtic-d@60: failed to match any schema with compatible: ['fsl,sec-v4.2-rtic-memory', 'fsl,sec-v4.0-rtic-memory']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1023rdb.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1023rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1023-guts']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /localbus@ff605000: failed to match any schema with compatible: ['fsl,p1023-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /localbus@ff605000: failed to match any schema with compatible: ['fsl,p1023-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: pcie@ffe09000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: sdhc@2e000 (fsl,p1020-esdhc): compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: pcie@fffe09000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: sdhc@2e000 (fsl,esdhc): compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: sdhc@2e000 (fsl,esdhc): compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1021-guts']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: pcie@ffe09000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: sdhc@2e000 (fsl,esdhc): compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: sdhc@2e000 (fsl,esdhc): compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1021-guts']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: pcie@fffe09000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: sdhc@2e000 (fsl,esdhc): compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: sdhc@2e000 (fsl,esdhc): compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: crypto@30000 (fsl,sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1021-guts']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: pcie@ffe09000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: ethernet@26000 (gianfar): Unevaluated properties are not allowed ('fsl,pmc-handle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: sdhc@2e000 (fsl,p2020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: crypto@30000 (fsl,sec3.1): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p2020ds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p2020ds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: pcie@ffe08000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: sdhc@2e000 (fsl,p2020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: crypto@30000 (fsl,sec3.1): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pcie@ffe08000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: sdhc@2e000 (fsl,p2020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: crypto@30000 (fsl,sec3.1): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pcie@fffe08000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: sdhc@2e000 (fsl,p2020-esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: crypto@30000 (fsl,sec3.1): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pcie@ffe08000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 26 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
--
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p2041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p2041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,qoriq-pin-control-1.0']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): '#sleep-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml
--
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: i2c@119100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p3041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p3041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,qoriq-pin-control-1.0']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): '#sleep-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml
--
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/rmu@d3000: failed to match any schema with compatible: ['fsl,srio-rmu']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/rmu@d3000/message-unit@0: failed to match any schema with compatible: ['fsl,srio-msg-unit']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/rmu@d3000/message-unit@100: failed to match any schema with compatible: ['fsl,srio-msg-unit']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/rmu@d3000/doorbell-unit@400: failed to match any schema with compatible: ['fsl,srio-dbell-unit']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/rmu@d3000/port-write-unit@4e0: failed to match any schema with compatible: ['fsl,srio-port-write-unit']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,qoriq-pin-control-1.0']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): '#sleep-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml
--
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: i2c@119100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p5020-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p5020-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,qoriq-pin-control-1.0']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): '#sleep-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml
--
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: i2c@119100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p5040-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p5040-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p5040-device-config', 'fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p5040-device-config', 'fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,p5040-pin-control', 'fsl,qoriq-pin-control-1.0']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,p5040-pin-control', 'fsl,qoriq-pin-control-1.0']
--
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: dma@21300 (fsl,eloplus-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: pic@40000 (fsl,mpic): 'big-endian', 'last-interrupt-source', 'single-cpu-affinity' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/ppa8548.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/ppa8548.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000: failed to match any schema with compatible: ['fsl,srio-rmu']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000/message-unit@0: failed to match any schema with compatible: ['fsl,srio-msg-unit']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000/message-unit@100: failed to match any schema with compatible: ['fsl,srio-msg-unit']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000/doorbell-unit@400: failed to match any schema with compatible: ['fsl,srio-dbell-unit']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000/port-write-unit@4e0: failed to match any schema with compatible: ['fsl,srio-port-write-unit']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8548-guts']
--
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: mdio@e5000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: mdio@e7000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1023-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: global-utilities@e2000 (fsl,t1023-rcpm): compatible: 'oneOf' conditional failed, one must be fixed:
   	'fsl,t1023-rcpm' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
--
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: i2c@118000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1023-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: global-utilities@e2000 (fsl,t1023-rcpm): compatible: 'oneOf' conditional failed, one must be fixed:
   	'fsl,t1023-rcpm' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
--
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: mdio@e5000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: mdio@e7000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1023-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: global-utilities@e2000 (fsl,t1023-rcpm): compatible: 'oneOf' conditional failed, one must be fixed:
   	'fsl,t1023-rcpm' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
--
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: i2c@118100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: mdio@e9000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: mdio@e9000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: mdio@e9000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: mdio@e9000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: mdio@e9000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: mdio@e9000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: mdio@e9000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
--
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t2080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/msi@41c00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: mdio@f3000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t2080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t2080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/msi@41c00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: mdio@eb000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t4240-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/msi@41c00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t4240-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t4240-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t4240-sfp']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: mdio@f3000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t4240-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/msi@41c00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t4240-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t4240-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t4240-sfp']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
