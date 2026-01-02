Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770E7F9D9
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Jan 2026 15:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767367090; cv=none; b=kO4Gj3HSDfVQGj7uhU/77Qgt2QmSTxiiPUSwK8xpZVuosZ63DfL+GapqqXxo/ASS2umImPn66mdOAZsbaMBHjs27iy71fSja9xwmcjjJq6y0Q+qG2fIXG/aIrvIU95cFmt6O/g6hbX0UO0J9oqhHTkuFTIrEqoHyIlciNf2ggYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767367090; c=relaxed/simple;
	bh=vrZxWFIG1YJUUZ3fWzpqpw4jot6QdXYPgY2AJ+S2W+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jcsud7I5gOH0Chuggbljh1p874VIcfhFeuEgJdsa6AA5QfjdIYk2BqR9pExnNmtnFzjm3e54Osa448d5FFETfF9BlMOLtpG2+IiHvV4xCnngFjIqwQz+OieE/eqvcgFCvfSsrm5lU6n6rOmHN6QGNhGi9dpBrID7WvnOoVpTC4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R96lAf/V; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R96lAf/V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767367088; x=1798903088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vrZxWFIG1YJUUZ3fWzpqpw4jot6QdXYPgY2AJ+S2W+E=;
  b=R96lAf/Vf9DS2ek60TZChV18MP+f00MpCA1ZW6AecHPhLkByzOyGybD7
   5nXws3lmig8c92F8irr8NdZqZE9/lx7WhoZZlkmZLC3QrAhU+0jiKjb8w
   ryR4rHETbh1R+x88CS0lcNVkCf3SRoHARFOGKzc7N4ansjqGvnCTkmv3c
   uCb4vEem71B+kkyaYBgSkMzo7li/+xYhwyKIItppy29SENmFMkwbkxb+d
   brKqj+64dY2p65eIh3EN4kgl4bPGVXdntVjxiByMOu6K50dbEzmzGuplY
   vhBCbfnrc52oehSI14urhWTbE9G4R/2QJQZnuQQ4VK+V8N6eTOh1T/y2Q
   A==;
X-CSE-ConnectionGUID: FqoGs4pRRA+esbPGPDq9AQ==
X-CSE-MsgGUID: lv4XkR0NSoKvA1KJ+W3l0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="91513208"
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="91513208"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 07:18:07 -0800
X-CSE-ConnectionGUID: xU+SxrySR2mEixxgi5jLVA==
X-CSE-MsgGUID: wKqVNNxdRMSaJoIpCpaWJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="201838137"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 02 Jan 2026 07:18:07 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbgui-000000000Rh-3Onw;
	Fri, 02 Jan 2026 15:18:04 +0000
Date: Fri, 2 Jan 2026 16:17:21 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] ARM: dts: lpc32xx: change NAND controllers node names
Message-ID: <202601021605.x4ffvMLj-lkp@intel.com>
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
In-Reply-To: <20251224165845.1261926-2-vz@mleia.com>
References: <20251224165845.1261926-2-vz@mleia.com>
TO: Vladimir Zapolskiy <vz@mleia.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org

Hi Vladimir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.16-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Zapolskiy/ARM-dts-lpc32xx-change-NAND-controllers-node-names/20251225-010247
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251224165845.1261926-2-vz%40mleia.com
patch subject: [PATCH 1/2] ARM: dts: lpc32xx: change NAND controllers node names
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm-randconfig-2051-20251227 (https://download.01.org/0day-ci/archive/20260102/202601021605.x4ffvMLj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260102/202601021605.x4ffvMLj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601021605.x4ffvMLj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi:89.7-134.5: Warning (simple_bus_reg): /ahb/usb: simple-bus unit address format error, expected "31020000"
   arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi:168.7-308.5: Warning (simple_bus_reg): /ahb/apb: simple-bus unit address format error, expected "20000000"
   arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi:310.7-509.5: Warning (simple_bus_reg): /ahb/fab: simple-bus unit address format error, expected "20000000"
   arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi:317.8-331.6: Warning (simple_bus_reg): /ahb/fab/scb: simple-bus unit address format error, expected "40004000"
   arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: ahb (simple-bus): fab:ranges: [[536870912, 536870912, 805306368]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: ahb (simple-bus): apb:ranges: [[536870912, 536870912, 805306368]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: ahb (simple-bus): usb:ranges: [[0, 822214656, 4096]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: /ahb/nand-controller@20020000: failed to match any schema with compatible: ['nxp,lpc3220-slc']
>> arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: nand-controller@20020000 (nxp,lpc3220-slc): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: nand-controller@20020000 (nxp,lpc3220-slc): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: /ahb/nand-controller@200a8000: failed to match any schema with compatible: ['nxp,lpc3220-mlc']
   arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: usb (simple-bus): $nodename:0: 'usb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: memory-controller@31080000 (arm,pl175): #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/arm,pl172.yaml
   arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: spi@20084000 (arm,pl022): clock-names:0: 'sspclk' was expected
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml
   arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: spi@20084000 (arm,pl022): clock-names: ['apb_pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml
   arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: spi@20084000 (arm,pl022): clocks: [[2, 9]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml
--
   arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi:89.7-134.5: Warning (simple_bus_reg): /ahb/usb: simple-bus unit address format error, expected "31020000"
   arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi:168.7-308.5: Warning (simple_bus_reg): /ahb/apb: simple-bus unit address format error, expected "20000000"
   arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi:310.7-509.5: Warning (simple_bus_reg): /ahb/fab: simple-bus unit address format error, expected "20000000"
   arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi:317.8-331.6: Warning (simple_bus_reg): /ahb/fab/scb: simple-bus unit address format error, expected "40004000"
   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: ahb (simple-bus): apb:ranges: [[536870912, 536870912, 805306368]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: ahb (simple-bus): fab:ranges: [[536870912, 536870912, 805306368]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: ahb (simple-bus): usb:ranges: [[0, 822214656, 4096]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: /ahb/nand-controller@20020000: failed to match any schema with compatible: ['nxp,lpc3220-slc']
>> arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: nand-controller@20020000 (nxp,lpc3220-slc): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: nand-controller@20020000 (nxp,lpc3220-slc): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
>> arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: /ahb/nand-controller@200a8000: failed to match any schema with compatible: ['nxp,lpc3220-mlc']
   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: usb (simple-bus): $nodename:0: 'usb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: memory-controller@31080000 (arm,pl175): #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/arm,pl172.yaml
   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: spi@20084000 (arm,pl022): clock-names:0: 'sspclk' was expected
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml
   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: spi@20084000 (arm,pl022): clock-names: ['apb_pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml
   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: spi@20084000 (arm,pl022): clocks: [[2, 9]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
