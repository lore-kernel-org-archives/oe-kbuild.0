Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66392EDC
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Aug 2024 03:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722827830; cv=none; b=URA+xBEgxur/Pz/0v9nH/1fPQ87HEPMF+d5klwEjGx0d+tu5ZdomU/PJMVK1nWSy2hbGFaNKTEK7Z73gkFxk/9KONuxwXYibCtmAh3b/6+MNCCOKUQz4U0gEeUY55qLmj5e7KN7PgiwYZsxQatuIZgoGCezwe2NO4zauNQGt5+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722827830; c=relaxed/simple;
	bh=3oJxDcpeQyiDuZFNd2kX76UV2eR0+8c6xX5wIfuEyVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tDVheCFMwZtl3UWm8JiqQuU0CGcZQ4hGNbihRQv8eEZ/ct8tnk7/Vncr/AfAb3Dp4Jr/Qtrzrjow42UxLoodvwHz9z1jyD+rb89PIoDNpql0yiUcAuJHsPtfoDLdrhX3jGq/4O7e7k5U/zHunq1JABI+PwyPEJ8oRId5G5NjE3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OwHLyuCn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OwHLyuCn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722827828; x=1754363828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3oJxDcpeQyiDuZFNd2kX76UV2eR0+8c6xX5wIfuEyVQ=;
  b=OwHLyuCngJQFWz3q2lWameFCI+kIUq6aujznGEA5fEQJSYDZ0oEUUUgZ
   DWZZoRxhZ1Sq7B+/BSjtA9+9rh4umESWQERI+Vvi9i/R8tYHHrI1d/PuJ
   7vHGLy0DXdr+4YubcaF3yhWUhOrCwr3LqNDBrtFH2Va+k13AjfuZ+Z73w
   Q1XH3srlq/gz61dEa4RvX314xbzaY+pIR/O2HgMj207VvUHkNT8pRknOI
   eFvRTzZPji3vy5tOVLRbaB8UxKSmSVDZSYWDGwU0d/LY+RNKLNROVEEB3
   b9Nox7yD57h1Rr3Lkoj97fpqNiHL/nB+pClvTdspapI0W1Jw77973Abcr
   g==;
X-CSE-ConnectionGUID: HxFi2RWuSl2R68bFDcD26g==
X-CSE-MsgGUID: 4W2DnLiRQDuJypwyBvuUMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20651258"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="20651258"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 20:17:07 -0700
X-CSE-ConnectionGUID: lfnp8BG5SpaKIVvHzThgpA==
X-CSE-MsgGUID: M35BrDcVQ4u3NuSCHorEAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="86588564"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 04 Aug 2024 20:17:06 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saoDY-0001gW-1k;
	Mon, 05 Aug 2024 03:17:04 +0000
Date: Mon, 5 Aug 2024 11:16:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 04/10] arm64: dts: fsl-ls1043a: change uqe to uqe-bus
 and remove #address-cells
Message-ID: <202408051035.zphJ26SU-lkp@intel.com>
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
In-Reply-To: <20240729-ls_warning_all-v2-4-942d80ddd441@nxp.com>
References: <20240729-ls_warning_all-v2-4-942d80ddd441@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: imx@lists.linux.dev
CC: Frank Li <Frank.Li@nxp.com>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8400291e289ee6b2bf9779ff1c83a291501f017b]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/arm64-dts-layerscape-rename-aux-bus-to-bus/20240730-031018
base:   8400291e289ee6b2bf9779ff1c83a291501f017b
patch link:    https://lore.kernel.org/r/20240729-ls_warning_all-v2-4-942d80ddd441%40nxp.com
patch subject: [PATCH v2 04/10] arm64: dts: fsl-ls1043a: change uqe to uqe-bus and remove #address-cells
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-051-20240804 (https://download.01.org/0day-ci/archive/20240805/202408051035.zphJ26SU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240805/202408051035.zphJ26SU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408051035.zphJ26SU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: thermal-zones: 'core-cluster-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/memory-controller@1530000/nand@1,0: failed to match any schema with compatible: ['fsl,ifc-nand']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/memory-controller@1530000/board-control@2,0: failed to match any schema with compatible: ['fsl,ls1043ardb-cpld']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: mmc@1560000: Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: memory-controller@1080000: 'big-endian' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/spi@2100000/slic@2: failed to match any schema with compatible: ['maxim,ds26522']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/spi@2100000/slic@3: failed to match any schema with compatible: ['maxim,ds26522']
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe-bus@2400000/ucc@2000: failed to match any schema with compatible: ['fsl,ucc-hdlc']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: pcie@3400000: fsl,pcie-scfg:0: [22, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: pcie@3500000: fsl,pcie-scfg:0: [22, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: pcie@3600000: fsl,pcie-scfg:0: [22, 2] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: dma-controller@8380000: compatible: ['fsl,ls1021a-qdma', 'fsl,ls1043a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
