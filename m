Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914E6271443
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Nov 2025 08:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762330845; cv=none; b=ViedXYBiRHkwluAqF1tUQuGRPzXc7mgeB8+ekeJnMuw7BHzJoQWaR1rT9hvOm6oB2mqOft3s4F79fm+36qhHstz+E+eEIr4Sn6QMkbg4WIZyck9S5eYyWxTl8WvGsBtNOwN1f0vks3YoJVgl7MjN56g9duAD4VjAvGl+AIHXp1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762330845; c=relaxed/simple;
	bh=hXEPMnuuZZb9dKG4f1AWszZN8Wl0EMt4rrTxlDPRVoE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O+ga08UJwaCbpD/AqHvmdLWPrfjGwmr4jo8HqyIZc+IVCxGsLg7/Nvb3CLhPOAn5boasi6xW5ZD9pJ3ruBTacj2YY3kok1b2b3xtJFwh0Td37MgFluju2cw1tnb7vYIU8etouJDqG/1yIT++ZKtbEwsDfXBcht3b3VWtFqFNx+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lg1VtWSY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lg1VtWSY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762330844; x=1793866844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hXEPMnuuZZb9dKG4f1AWszZN8Wl0EMt4rrTxlDPRVoE=;
  b=Lg1VtWSYTBcfuw4w9LaMrVOaH+XzPVaPnKVNFSfn+cZAGhos6gLN8Op8
   SrYvYdJdQiSZKVuYB+nACcnzGP20ntjb7AYd/anzzr3eoiTSS2z9S5Wvr
   9HxtMN3r8QmG4urh16LiSSF/Th5YhpgXZwqjEAGxHX7xS5n3M2ZE/IusV
   uZHfNFHWkIuZcG+2QGff1LZPegrAAtu5P41VgcuYtzvP4RSQQCBwDq1lP
   04Kol/la4W384WIBDf0TirCxG1WlD728EQvfyjBQJ4KUUo7gSGKDgYVC3
   lie+YbwGJi5bZLcHn76L44UJU5eLU4/Y2DqVZqPOxfEAzFYlxHJemunMS
   A==;
X-CSE-ConnectionGUID: 2GhQtYUoTemL6QE2SOw47Q==
X-CSE-MsgGUID: uLs6H92GTb2AnrzYvziDMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68091510"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="68091510"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 00:20:43 -0800
X-CSE-ConnectionGUID: qCCDFjFmTOCPE/MKLamOOQ==
X-CSE-MsgGUID: 1OnI6IszTT+4UwSkyCdQOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="187081265"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 05 Nov 2025 00:20:42 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vGYkx-000000002Ue-3Gsv;
	Wed, 05 Nov 2025 08:20:39 +0000
Date: Wed, 5 Nov 2025 09:20:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /: failed to match
 any schema with compatible: ['lantiq,xway', 'lantiq,danube']
Message-ID: <202511050941.miPNLDxQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   284922f4c563aa3a8558a00f2a05722133237fe8
commit: 61a6ba233fe1198e9eacc9ca1d1cbdb27f70cee5 dt-bindings: Unify "fsl,liodn" type definitions
date:   11 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 11 months ago
config: mips-randconfig-2051-20251031 (https://download.01.org/0day-ci/archive/20251105/202511050941.miPNLDxQ-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.3.0
dtschema version: 2025.9.dev13+gc72762e0c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511050941.miPNLDxQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511050941.miPNLDxQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/lantiq/danube.dtsi:8.9-10.5: Warning (unit_address_vs_reg): /cpus/cpu@0: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/lantiq/danube.dtsi:93.21-103.5: Warning (simple_bus_reg): /fpi@10000000/pci@e105400: simple-bus unit address format error, expected "7000000"
   arch/mips/boot/dts/lantiq/danube_easy50712.dts:107.4-109.6: Warning (interrupt_map): /fpi@10000000/pci@e105400:interrupt-map: property size (28) too small, expected > 40
   lantiq,groups: size (6) error for type uint32
   lantiq,groups: size (5) error for type uint32
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /: failed to match any schema with compatible: ['lantiq,xway', 'lantiq,danube']
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /: failed to match any schema with compatible: ['lantiq,xway', 'lantiq,danube']
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: / (lantiq,xway): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: cpus: cpu@0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: cpus: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: cpus: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: cpu@0 (mips,mips24Kc): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: biu@1f800000 (lantiq,biu): $nodename:0: 'biu@1f800000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /biu@1f800000: failed to match any schema with compatible: ['lantiq,biu', 'simple-bus']
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /biu@1f800000/icu@80200: failed to match any schema with compatible: ['lantiq,icu']
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /biu@1f800000/watchdog@803f0: failed to match any schema with compatible: ['lantiq,wdt']
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /sram@1f000000: failed to match any schema with compatible: ['lantiq,sram']
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /sram@1f000000/eiu@101000: failed to match any schema with compatible: ['lantiq,eiu-xway']
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: cgu@103000 (lantiq,cgu-xway): '#clock-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mips/lantiq/lantiq,cgu.yaml
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /sram@1f000000/rcu@203000: failed to match any schema with compatible: ['lantiq,rcu-xway']
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: fpi@10000000 (lantiq,fpi): $nodename:0: 'fpi@10000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /fpi@10000000: failed to match any schema with compatible: ['lantiq,fpi', 'simple-bus']
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /fpi@10000000/gptu@e100a00: failed to match any schema with compatible: ['lantiq,gptu-xway']
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /fpi@10000000/serial@e100c00: failed to match any schema with compatible: ['lantiq,asc']
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /fpi@10000000/pci@e105400: failed to match any schema with compatible: ['lantiq,pci-xway']
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: pci@e105400 (lantiq,pci-xway): 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /fpi@10000000/localbus@0: failed to match any schema with compatible: ['lantiq,localbus', 'simple-bus']
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /fpi@10000000/localbus@0/nor-boot@0: failed to match any schema with compatible: ['lantiq,nor']
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /fpi@10000000/pinmux@e100b10: failed to match any schema with compatible: ['lantiq,danube-pinctrl']
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: exin: lantiq,groups: b'exin1\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: pci: lantiq,groups: b'gnt1\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: etop@e180000 (lantiq,etop-xway): 'mac-address' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/lantiq,etop-xway.yaml
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: etop@e180000 (lantiq,etop-xway): $nodename:0: 'etop@e180000' does not match '^ethernet@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/net/lantiq,etop-xway.yaml
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: etop@e180000 (lantiq,etop-xway): 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/lantiq,etop-xway.yaml
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: etop@e180000 (lantiq,etop-xway): 'lantiq,tx-burst-length' is a required property
   	from schema $id: http://devicetree.org/schemas/net/lantiq,etop-xway.yaml
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: etop@e180000 (lantiq,etop-xway): 'lantiq,rx-burst-length' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
