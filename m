Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0438118D643
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Jul 2025 23:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753138912; cv=none; b=mv3Oy+MTWnUUn+dZZYecernbD71ouTiSkF6f+gstUq/PBiZMUpVwu/GDhhITeyfvKWtWfkPnJBR6sty1czwwT4JFNskkLqL3YHK1G5/rx1vslBxPdwskfaEYjepcJjLtkqaCDV0dm8HM044vuVYTb6/jGYqnRxlZmzGn/O7duvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753138912; c=relaxed/simple;
	bh=Hq5yLnSQOfgpoSH1c0k3b2OPfSZqWoFtFepSL2oA6eU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tGTMCeTNtw5KjYOCBSVXIf9lmkGgnnmM+tUk3NiiiZcJGC17ms93XewuXVEvgYQ4RdMa1tnzbYxzl45eqU3SvPwNdGGUJfPqh0pS5snIor7aFTn5zxUB+8PlLeirRq2oPWM7nsXBEr2xFAszAGW77lWsvbqNKwbITLj8gD0Vgxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DFQ29KfB; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DFQ29KfB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753138910; x=1784674910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hq5yLnSQOfgpoSH1c0k3b2OPfSZqWoFtFepSL2oA6eU=;
  b=DFQ29KfBrQxFR1ju6VWPmJSvfPu1R7VjPydbTLZb2XJQ/+AspeEQYWEK
   I8AZvF1qTBB+zeXWAsI1CVGAQcz6XqtsDbLXCWtcdN4wW/qL7N+bwBqXF
   sAykqHegy9Hs43GAwxKMoltBDdAR0MPiMzpU2Dho54jnGQExJeVcGmK8a
   wCUFmNoJTEfRDNnwq40P34laVeNno2JvYkr2cIdo7zqltQF/eL0G0d4Qx
   opm4VEp0/Cn8V8SAW65t8vspK4Fn3J8ue5/I7ONBmuZcO2UI6mpJ85eWD
   yP+6YFr6vsWbyy09BvJZMdNXgV38vRe9CGLo9N6GQTJiF/TZmhD0qGX0U
   w==;
X-CSE-ConnectionGUID: YaH+u5CDTC2k6xD9aEQIxQ==
X-CSE-MsgGUID: NKIbAPjfS1i8+s0BzX3Uew==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="65636895"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="65636895"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 16:01:50 -0700
X-CSE-ConnectionGUID: BsHgICnySayjQIdPboYu8w==
X-CSE-MsgGUID: eqcsD6LBRDyb/kKt77HC6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="182685233"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 21 Jul 2025 16:01:48 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udzVy-0001RT-0n;
	Mon, 21 Jul 2025 23:01:46 +0000
Date: Tue, 22 Jul 2025 01:01:45 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:renesas/dt64-2 47/48]
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb:
 spi@11030000 (renesas,r9a09g056-xspi): Unevaluated properties are not
 allowed ('compatible' was unexpected)
Message-ID: <202507220128.gwuSNO6n-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git renesas/dt64-2
head:   145a2a9e27562926c592645a05d682fe8e1f82e9
commit: 885bf52d044ad24acab2b7f4d9e7a0d233dc8f13 [47/48] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable serial NOR FLASH
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2051-20250717 (https://download.01.org/0day-ci/archive/20250722/202507220128.gwuSNO6n-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507220128.gwuSNO6n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507220128.gwuSNO6n-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: spi@11030000 (renesas,r9a09g056-xspi): compatible:0: 'renesas,r9a09g047-xspi' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: spi@11030000 (renesas,r9a09g056-xspi): compatible: ['renesas,r9a09g056-xspi', 'renesas,r9a09g047-xspi'] is too long
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: spi@11030000 (renesas,r9a09g056-xspi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: serial@11c01400 (renesas,scif-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,scif-r9a09g056', 'renesas,scif-r9a09g057'] is too long
   	['renesas,scif-r9a09g056', 'renesas,scif-r9a09g057'] is too short
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r7s72100']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r7s9210']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a7778', 'renesas,scif-r8a7779']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a7742', 'renesas,scif-r8a7743', 'renesas,scif-r8a7744', 'renesas,scif-r8a7745', 'renesas,scif-r8a77470', 'renesas,scif-r8a7790', 'renesas,scif-r8a7791', 'renesas,scif-r8a7792', 'renesas,scif-r8a7793', 'renesas,scif-r8a7794']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a774a1', 'renesas,scif-r8a774a3', 'renesas,scif-r8a774b1', 'renesas,scif-r8a774c0', 'renesas,scif-r8a774e1', 'renesas,scif-r8a7795', 'renesas,scif-r8a7796', 'renesas,scif-r8a77961', 'renesas,scif-r8a77965', 'renesas,scif-r8a77970', 'renesas,scif-r8a77980', 'renesas,scif-r8a77990', 'renesas,scif-r8a77995']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a779a0', 'renesas,scif-r8a779f0', 'renesas,scif-r8a779g0', 'renesas,scif-r8a779h0']
--
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: spi@11030000 (renesas,r9a09g056-xspi): compatible:0: 'renesas,r9a09g047-xspi' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: spi@11030000 (renesas,r9a09g056-xspi): compatible: ['renesas,r9a09g056-xspi', 'renesas,r9a09g047-xspi'] is too long
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: spi@11030000 (renesas,r9a09g056-xspi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: serial@11c01400 (renesas,scif-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,scif-r9a09g056', 'renesas,scif-r9a09g057'] is too long
   	['renesas,scif-r9a09g056', 'renesas,scif-r9a09g057'] is too short
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r7s72100']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r7s9210']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a7778', 'renesas,scif-r8a7779']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a7742', 'renesas,scif-r8a7743', 'renesas,scif-r8a7744', 'renesas,scif-r8a7745', 'renesas,scif-r8a77470', 'renesas,scif-r8a7790', 'renesas,scif-r8a7791', 'renesas,scif-r8a7792', 'renesas,scif-r8a7793', 'renesas,scif-r8a7794']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a774a1', 'renesas,scif-r8a774a3', 'renesas,scif-r8a774b1', 'renesas,scif-r8a774c0', 'renesas,scif-r8a774e1', 'renesas,scif-r8a7795', 'renesas,scif-r8a7796', 'renesas,scif-r8a77961', 'renesas,scif-r8a77965', 'renesas,scif-r8a77970', 'renesas,scif-r8a77980', 'renesas,scif-r8a77990', 'renesas,scif-r8a77995']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a779a0', 'renesas,scif-r8a779f0', 'renesas,scif-r8a779g0', 'renesas,scif-r8a779h0']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
