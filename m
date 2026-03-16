Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3511F8AC5
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Mar 2026 17:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773681410; cv=none; b=TzEDmMSCM9JE3N3I0gptxNWL4t4Buoxj3oxA0yNULw20koeNTWg8oWvqlJzzZQpauH9c7w4ScFKpmfv+ulQ1NlmBMC8oJKPTboeGkLqKeuIEbWvm4CeKJwHOUsFXb8a+QQrxUWV6LGxMnDSQ0MfKM9pVtfIb7n3HEmtgMOrQK2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773681410; c=relaxed/simple;
	bh=l+ek9L6xA59iTwn6qmetlirqxrAUrzGJlcTJZ8h43hg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ojj7/PpB+S4w5pP3jUpIZd4wyRJhd6EY51luV5TATawbLufW0zXZxdaH22ZONjFWggAj7GEXNn2Wq4Ful+w5aJ46ak3TRLQz9aerq1fXF+LKAmB6XKCTnDiBpmMFxYmMokI6uReRfFgJbDu7pqzTkFKvZODdll6Xo4TneqsvbxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eMWW/Gxd; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eMWW/Gxd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773681408; x=1805217408;
  h=date:from:to:cc:subject:message-id;
  bh=l+ek9L6xA59iTwn6qmetlirqxrAUrzGJlcTJZ8h43hg=;
  b=eMWW/GxdzpAkuxTh/HdaidcswDkkJCZVDGNCP3ziNDlv8hPBY1dH/OWF
   x1zO8bMLk5J8STncpjvDIVbuXZTLgXP0IxqfJNzJmhD63/exk/U6xuerE
   CRbOuzPpsJlaZoWaBBGq7f5hEKPaLVxcro8Mb0wnjgqkKHAjJ7tftTa/3
   RkRTK6tlINTznjyORLmAbe/6MfZaoi0rp48ueajQaqHOlChIeMFiQ0vtn
   9cjvfyjkq3OBxqgQtATlwHoa2Sx6nLtUAv4WIEdf20pygfZDY8ED2NO11
   yW0C8ULT3opx6GD/GXMcA84vHw0rRKupGkw9mwIvSoP1kSePLuhbBCHOB
   w==;
X-CSE-ConnectionGUID: E49Tsi89TcmM+ssjR0+Xtg==
X-CSE-MsgGUID: zpeKJZZdS9KvH46QIExeFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="78599943"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="78599943"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 10:16:47 -0700
X-CSE-ConnectionGUID: T2S1KIByR/6KEWhq3TMGrQ==
X-CSE-MsgGUID: vbIU8otQTTKjHvre7ybv0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="217784726"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 16 Mar 2026 10:16:47 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2BYa-000000004G1-30Wt;
	Mon, 16 Mar 2026 17:16:44 +0000
Date: Mon, 16 Mar 2026 18:15:57 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:renesas-dts-for-v7.1 24/31]
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: spi@12800000
 (renesas,r9a09g056-rspi): dma-names: ['rx', 'tx', 'rx', 'tx', 'rx', 'tx',
 'rx', 'tx', 'rx', 'tx'] is too long
Message-ID: <202603161843.yBv6PVWc-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v7.1
head:   a1310b78ad797f1c43faf522f7aafe40de53edd7
commit: ce2c7ca2c2acd252c495da0d924f48b70f2f4198 [24/31] arm64: dts: renesas: r9a09g056: Add DMA support for RSPI channels
:::::: branch date: 7 hours ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2055-20260315 (https://download.01.org/0day-ci/archive/20260316/202603161843.yBv6PVWc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260316/202603161843.yBv6PVWc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603161843.yBv6PVWc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: spi@12800000 (renesas,r9a09g056-rspi): dma-names: ['rx', 'tx', 'rx', 'tx', 'rx', 'tx', 'rx', 'tx', 'rx', 'tx'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/renesas,rzv2h-rspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: spi@12800000 (renesas,r9a09g056-rspi): dmas: [[14, 17548], [14, 17549], [15, 17548], [15, 17549], [16, 17548], [16, 17549], [17, 17548], [17, 17549], [18, 17548], [18, 17549]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/renesas,rzv2h-rspi.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: spi@12800400 (renesas,r9a09g056-rspi): dma-names: ['rx', 'tx', 'rx', 'tx', 'rx', 'tx', 'rx', 'tx', 'rx', 'tx'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/renesas,rzv2h-rspi.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: spi@12800400 (renesas,r9a09g056-rspi): dmas: [[14, 17550], [14, 17551], [15, 17550], [15, 17551], [16, 17550], [16, 17551], [17, 17550], [17, 17551], [18, 17550], [18, 17551]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/renesas,rzv2h-rspi.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: spi@12800800 (renesas,r9a09g056-rspi): dma-names: ['rx', 'tx', 'rx', 'tx', 'rx', 'tx', 'rx', 'tx', 'rx', 'tx'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/renesas,rzv2h-rspi.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: spi@12800800 (renesas,r9a09g056-rspi): dmas: [[14, 17552], [14, 17553], [15, 17552], [15, 17553], [16, 17552], [16, 17553], [17, 17552], [17, 17553], [18, 17552], [18, 17553]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/renesas,rzv2h-rspi.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
--
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: spi@12800000 (renesas,r9a09g056-rspi): dma-names: ['rx', 'tx', 'rx', 'tx', 'rx', 'tx', 'rx', 'tx', 'rx', 'tx'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/renesas,rzv2h-rspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: spi@12800000 (renesas,r9a09g056-rspi): dmas: [[14, 17548], [14, 17549], [15, 17548], [15, 17549], [16, 17548], [16, 17549], [17, 17548], [17, 17549], [18, 17548], [18, 17549]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/renesas,rzv2h-rspi.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: spi@12800400 (renesas,r9a09g056-rspi): dma-names: ['rx', 'tx', 'rx', 'tx', 'rx', 'tx', 'rx', 'tx', 'rx', 'tx'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/renesas,rzv2h-rspi.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: spi@12800400 (renesas,r9a09g056-rspi): dmas: [[14, 17550], [14, 17551], [15, 17550], [15, 17551], [16, 17550], [16, 17551], [17, 17550], [17, 17551], [18, 17550], [18, 17551]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/renesas,rzv2h-rspi.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: spi@12800800 (renesas,r9a09g056-rspi): dma-names: ['rx', 'tx', 'rx', 'tx', 'rx', 'tx', 'rx', 'tx', 'rx', 'tx'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/renesas,rzv2h-rspi.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: spi@12800800 (renesas,r9a09g056-rspi): dmas: [[14, 17552], [14, 17553], [15, 17552], [15, 17553], [16, 17552], [16, 17553], [17, 17552], [17, 17553], [18, 17552], [18, 17553]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/renesas,rzv2h-rspi.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
--
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: spi@12800000 (renesas,r9a09g056-rspi): dma-names: ['rx', 'tx', 'rx', 'tx', 'rx', 'tx', 'rx', 'tx', 'rx', 'tx'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/renesas,rzv2h-rspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: spi@12800000 (renesas,r9a09g056-rspi): dmas: [[14, 17548], [14, 17549], [15, 17548], [15, 17549], [16, 17548], [16, 17549], [17, 17548], [17, 17549], [18, 17548], [18, 17549]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/renesas,rzv2h-rspi.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: spi@12800400 (renesas,r9a09g056-rspi): dma-names: ['rx', 'tx', 'rx', 'tx', 'rx', 'tx', 'rx', 'tx', 'rx', 'tx'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/renesas,rzv2h-rspi.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: spi@12800400 (renesas,r9a09g056-rspi): dmas: [[14, 17550], [14, 17551], [15, 17550], [15, 17551], [16, 17550], [16, 17551], [17, 17550], [17, 17551], [18, 17550], [18, 17551]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/renesas,rzv2h-rspi.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: spi@12800800 (renesas,r9a09g056-rspi): dma-names: ['rx', 'tx', 'rx', 'tx', 'rx', 'tx', 'rx', 'tx', 'rx', 'tx'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/renesas,rzv2h-rspi.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: spi@12800800 (renesas,r9a09g056-rspi): dmas: [[14, 17552], [14, 17553], [15, 17552], [15, 17553], [16, 17552], [16, 17553], [17, 17552], [17, 17553], [18, 17552], [18, 17553]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/renesas,rzv2h-rspi.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
