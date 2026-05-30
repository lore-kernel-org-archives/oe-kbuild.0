Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA631427A
	for <oe-kbuild@lists.linux.dev>; Sat, 30 May 2026 19:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780168316; cv=none; b=fLV2OL3cUU2xWa4tMvQFlAdzKP6kTTHaJu6ey6XfWvcs+CMzoUCMNf0mtjeyir6Izcp2x0Ti19L2dpn/tGPULdysm16HYSCLoh9TqhBiMqTlIz06gZZHQMpWNfqiTCCs9W8Wmwxet4oWjxH2C1j9EdAS+xxJf7mMoBg2phf3rsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780168316; c=relaxed/simple;
	bh=t3aVSTd7j8MlNQaC9AD+oZXlMSTR2VcY0sW1EAk2dYU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SV/M+I9+i9ZV5CnN0ckSSQBCTHU0u0ywvo+XdcL2GBNPSIGhoi4vsjCCyRSc7IZRa8FVLyfUi067CGtHW+Lpfxbpodn2wMVJHpqZu0L5E1GlsrQr71YaS0tzwFDKD83Pn/5tglH7bQSp+JTDkykAdIKqKA2140ggn2dH1RjnWTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UGMJ6LpK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UGMJ6LpK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780168314; x=1811704314;
  h=date:from:to:cc:subject:message-id;
  bh=t3aVSTd7j8MlNQaC9AD+oZXlMSTR2VcY0sW1EAk2dYU=;
  b=UGMJ6LpKcf3k0mPK30w2hr3le2GhtwfCzsh+DsNqmfrVXE5ER5xI5m9G
   by+9LCxSVvK5W96s9rtnGORSlh1okP19bHdbHp4s9rqXeS4nqeMOtiQmT
   WVuIv/+9ALUsnfeDA3sHOf1GeDfoZWqzl7KI/qqGb34lU9zvX0bhgn6UN
   cXe+vuZtUD5aXngZZGNTKrDJTxkyxzq2wZSGRtJsvHG2dSeLlSvQ5Zs4Q
   jjUln7ncLmk24qvoRVQ73QQOGgX5rXIh6JETo2dY37T8NLT9qksDu6CCn
   gx7nIs72lY+W2aq/3Pw7sM0ggU/6WusJ1ptsmbIYkepttcVfJTuIkt6CR
   w==;
X-CSE-ConnectionGUID: 9H+60JQERJiKfKpgNZQIMQ==
X-CSE-MsgGUID: Zt7++qfeQJeYFaopjR8VWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="91559665"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="91559665"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 12:11:53 -0700
X-CSE-ConnectionGUID: Zt7+Z1ZoRoyiXo/DxZyskw==
X-CSE-MsgGUID: MSWA/ur3Tpi8ggnolJ0MNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="267021266"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 30 May 2026 12:11:53 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTP66-000000001Cn-2Q2a;
	Sat, 30 May 2026 19:11:50 +0000
Date: Sat, 30 May 2026 21:11:41 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb:
 pinctrl@802c0000 (renesas,r9a09g077-pinctrl):
 sci0-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000,
 11800]
Message-ID: <202605302150.hZgGrplW-lkp@intel.com>
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
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Prabhakar/arm64-dts-renesas-rzt2h-n2h-evk-Remove-unused-MII-GMII-pins/20260529-020043
head:   2f8b96077a9359e2dd4b43cb4b1c455b99cd7639
commit: 2f8b96077a9359e2dd4b43cb4b1c455b99cd7639 arm64: dts: renesas: rzt2h-n2h-evk: Configure SCI0 pins
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260529 (https://download.01.org/0day-ci/archive/20260530/202605302150.hZgGrplW-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605302150.hZgGrplW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605302150.hZgGrplW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: spi@801c1000 (renesas,r9a09g077-xspi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g077-xspi', 'renesas,r9a09g047-xspi'] is too long
   	'renesas,r9a09g047-xspi' was expected
   	'renesas,r9a09g077-xspi' is not one of ['renesas,r9a09g056-xspi', 'renesas,r9a09g057-xspi']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: spi@801c1000 (renesas,r9a09g077-xspi): reset-names: ['hresetn'] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: spi@801c1000 (renesas,r9a09g077-xspi): resets: [[3, 5]] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sci0-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd0-emmc-group:data-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd0-emmc-group:clk-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd0-emmc-group:cmd-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd0-emmc-group:rst-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd0-emmc-uhs-group:data-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
--
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: spi@801c1000 (renesas,r9a09g087-xspi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g087-xspi', 'renesas,r9a09g047-xspi'] is too long
   	'renesas,r9a09g047-xspi' was expected
   	'renesas,r9a09g087-xspi' is not one of ['renesas,r9a09g056-xspi', 'renesas,r9a09g057-xspi']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: spi@801c1000 (renesas,r9a09g087-xspi): reset-names: ['hresetn'] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: spi@801c1000 (renesas,r9a09g087-xspi): resets: [[3, 5]] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sci0-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd0-emmc-group:data-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd0-emmc-group:clk-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd0-emmc-group:cmd-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd0-emmc-group:rst-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd0-emmc-uhs-group:data-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
