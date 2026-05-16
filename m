Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5F11448E0
	for <oe-kbuild@lists.linux.dev>; Sat, 16 May 2026 09:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778924073; cv=none; b=m41X7Bt1a4BSzTDD0WaVARNH+lbi/kiIWYxbHq8iyKkAeyalGdk09/1zU+PtI9p9paeJYpA7REX/K7NJcBlac/80YBdajzvJ+hW4ikxncWrH/3K8+SaiLtiJgbz54LTKRUjGP4G6t73BdyWtymeKJzcAE6/ul7LGaiFNf7hV10Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778924073; c=relaxed/simple;
	bh=V6bXxqziWyuKHk6N990wVMQWZTVzPGcdlJlidPbAgzo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MHxqt9Cyv5Ty2WJDbXfaEuk/qNEp56iggoJh5Ci4CHYjDCvye8Jn7qgV0DpKiCbaHk2ge5CGWswKDrQLIAvdxDfiuOSUWBl53a6YhfdLVeuErCSa69kmrx6HNhPf6Z5H5YOl+Fz7zSNp5yqhvHv8kD07BhHi+ONq+hdXFMLGALQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USJ3RbNL; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USJ3RbNL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778924071; x=1810460071;
  h=date:from:to:cc:subject:message-id;
  bh=V6bXxqziWyuKHk6N990wVMQWZTVzPGcdlJlidPbAgzo=;
  b=USJ3RbNLI9w0MvW/vMkLGfeeg1URtl2671qzgdEHXSrnnxGVrQLYtmmZ
   87hi/vqGE4whvVN+UxhtnShNvzDj5Pw3qHNTEgSzQBllwyFqKNlOWc0F9
   I36ayXUXfVY1GPW0yXvtd+Y8e3RcK8dwBTItryRccZHURN6qAWLslngDT
   cGApl1g9u71MN3I0nPeGrY9ooPqZOhB1yors/7dcAE5BIw1GRr7Dgc0/k
   uIuR8QLRkVf3NS5enj32d77womGPiK0gZl34D2b47k0loftMqNBTBWY8U
   PV9LIusGDaWiYIcavqHwssN3wdwO4OrBu7BPDJS2CRvi1Fl82LzUn5rNG
   g==;
X-CSE-ConnectionGUID: YV+gThjOQHaqLdnnNp+7uA==
X-CSE-MsgGUID: u6jbMfhnShKY1wi7wI3Aag==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="90441866"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="90441866"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 02:34:30 -0700
X-CSE-ConnectionGUID: mSez5nMFQ+SnF3evRAxrOw==
X-CSE-MsgGUID: hpU/I2j3TbqahZmKD1thVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="237951498"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 16 May 2026 02:34:29 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOBPd-000000009Iv-0q8y;
	Sat, 16 May 2026 09:34:25 +0000
Date: Sat, 16 May 2026 11:34:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:riscv-dt-for-next 2/10]
 arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000
 (microchip,pic64gx-mss-top-sysreg): interrupt-controller@54:compatible:0:
 'microchip,mpfs-irqmux' was expected
Message-ID: <202605161130.2bhKAGvG-lkp@intel.com>
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
TO: Conor Dooley <conor.dooley@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git riscv-dt-for-next
head:   3869417f8996fb076998342d0db560fdd795a3a6
commit: 4ce4a46cdb2404bcd53ca58a18aeda673f37fbe9 [2/10] riscv: dts: microchip: update pic64gx gpio interrupts to better match the SoC
:::::: branch date: 17 hours ago
:::::: commit date: 11 days ago
config: riscv-randconfig-2052-20260516 (https://download.01.org/0day-ci/archive/20260516/202605161130.2bhKAGvG-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.4.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161130.2bhKAGvG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605161130.2bhKAGvG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000 (microchip,pic64gx-mss-top-sysreg): interrupt-controller@54:compatible:0: 'microchip,mpfs-irqmux' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000 (microchip,pic64gx-mss-top-sysreg): interrupt-controller@54:compatible: ['microchip,pic64gx-irqmux', 'microchip,mpfs-irqmux'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: interrupt-controller@54 (microchip,pic64gx-irqmux): compatible:0: 'microchip,mpfs-irqmux' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-irqmux.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: interrupt-controller@54 (microchip,pic64gx-irqmux): compatible: ['microchip,pic64gx-irqmux', 'microchip,mpfs-irqmux'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-irqmux.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/syscon@20002000/interrupt-controller@54: failed to match any schema with compatible: ['microchip,pic64gx-irqmux', 'microchip,mpfs-irqmux']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: gpio@20120000 (microchip,pic64gx-gpio): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: gpio@20121000 (microchip,pic64gx-gpio): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: gpio@20122000 (microchip,pic64gx-gpio): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
