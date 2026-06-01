Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05245378D84
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Jun 2026 12:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780316958; cv=none; b=ltZpaW+m4bTlO096D6Oj26jzgAoaexH80mHYBQTKNCQlAzLzHfkXYnlVkK2o3ymUjOkOs3E6N3RYpV2jdpfPkFVMmNMZTtVco9zxIUTRUSGDddgeHK/bwXhkXiMxOOGEVJLJyGzDvRzxlbxMqOSyDUQdFXgDjcUThUuZ4U+Onug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780316958; c=relaxed/simple;
	bh=Hnb4mRXDInluAz4C2DUfdgH19XtDt1Jlvg4E4zOnrco=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R5RrC75qJYpAQVbXeC/56zRH28O9zHg/AVe2KOYm6BdvWVIZ3t3Mk2ZP/Z06O3kUE5m7cr3YK9Lq6PpugVWHxU8bJEfI1/Fx1DxY10bZ6J+h6CXAagur1k7nolaS951UQ4QFfurgQIJcklFQXvZNrcHxbryQ/NGwIcUMxy+MUkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M35puLKp; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M35puLKp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780316957; x=1811852957;
  h=date:from:to:cc:subject:message-id;
  bh=Hnb4mRXDInluAz4C2DUfdgH19XtDt1Jlvg4E4zOnrco=;
  b=M35puLKpjbf3IDM40KplfXg5EhRtd8Uzf+2WxZL25F/EUbyCv+mo5fU9
   Z/+bA+MjnYizEb3tD9OtarG1JsURugm4l2UUKQ9DiwJz0BZjqAN/HGFqm
   m3FDosuuAzbVvzQAzd7RurwW3An5RBK0g5ChgoLfZ0KqpbKTNtQb44qxu
   jqCdnKpT0z41cr64YgSN3bqtCjdh4G+8BtVkNCY3c64spRmvhUoBM2ybh
   cYJ3B6pF3yes5AjBMg5ybT8jq/Nw52W7V8QK31pLhlZE5sG2hp3YztUYo
   N4sJOpk1kGKhelMelPHfOxoNrm4o6dVpJVewLpQ47wvjI5nlUnlQlENDP
   Q==;
X-CSE-ConnectionGUID: hVF/eJSISXqf0UXKF2VEtw==
X-CSE-MsgGUID: nlOVKLW/RgackEl+iYh97g==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80922879"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="80922879"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 05:29:16 -0700
X-CSE-ConnectionGUID: eVV7+xlVQaesJT56PitJCw==
X-CSE-MsgGUID: IwWVLyBISEqfIVvyLDSRIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="243686910"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 01 Jun 2026 05:29:15 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU1lY-000000001b3-3iyM;
	Mon, 01 Jun 2026 12:29:12 +0000
Date: Mon, 01 Jun 2026 14:28:34 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:renesas-dts-for-v7.2 79/83]
 arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000
 (renesas,r9a09g077-pinctrl): xspi1-pins:drive-strength-microamp: [9000] is
 not one of [2500, 5000, 9000, 11800]
Message-ID: <202606011407.fxgOGRLp-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v7.2
head:   0d4ed954061efc3e47fa889d3de0675f933f438f
commit: f4418ce75760e5f546a1bdd0876056febc430b1f [79/83] arm64: dts: renesas: rzt2h-n2h-evk: Enable xSPI nodes
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: arm64-randconfig-2054-20260531 (https://download.01.org/0day-ci/archive/20260601/202606011407.fxgOGRLp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606011407.fxgOGRLp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606011407.fxgOGRLp-lkp@intel.com/

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
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): xspi1-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
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
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd1-group:clk-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd1-group:ctrl-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd1-uhs-group:data-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd1-uhs-group:clk-pins:drive-strength-microamp: [11800] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd1-uhs-group:ctrl-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): xspi0-group:ctrl-data-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): xspi0-group:ecs-pins:drive-strength-microamp: [2500] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: timer@90001200 (renesas,r9a09g077-mtu3): compatible:0: 'renesas,r9a09g077-mtu3' is not one of ['renesas,r9a07g043-mtu3', 'renesas,r9a07g044-mtu3', 'renesas,r9a07g054-mtu3']
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: timer@90001200 (renesas,r9a09g077-mtu3): interrupt-names: ['tgia0', 'tgib0', 'tgic0', 'tgid0', 'tciv0', 'tgie0', 'tgif0', 'tgia1', 'tgib1', 'tciv1', 'tciu1', 'tgia2', 'tgib2', 'tciv2', 'tciu2', 'tgia3', 'tgib3', 'tgic3', 'tgid3', 'tciv3', 'tgia4', 'tgib4', 'tgic4', 'tgid4', 'tciv4', 'tgiu5', 'tgiv5', 'tgiw5', 'tgia6', 'tgib6', 'tgic6', 'tgid6', 'tciv6', 'tgia7', 'tgib7', 'tgic7', 'tgid7', 'tciv7', 'tgia8', 'tgib8', 'tgic8', 'tgid8', 'tciv8'] is too short
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: timer@90001200 (renesas,r9a09g077-mtu3): interrupts: [[0, 420, 1], [0, 421, 1], [0, 422, 1], [0, 423, 1], [0, 424, 1], [0, 425, 1], [0, 426, 1], [0, 427, 1], [0, 428, 1], [0, 429, 1], [0, 430, 1], [0, 431, 1], [0, 432, 1], [0, 433, 1], [0, 434, 1], [0, 435, 1], [0, 436, 1], [0, 437, 1], [0, 438, 1], [0, 439, 1], [0, 440, 1], [0, 441, 1], [0, 442, 1], [0, 443, 1], [0, 444, 1], [0, 445, 1], [0, 446, 1], [0, 447, 1], [0, 448, 1], [0, 449, 1], [0, 450, 1], [0, 451, 1], [0, 452, 1], [0, 453, 1], [0, 454, 1], [0, 455, 1], [0, 456, 1], [0, 457, 1], [0, 458, 1], [0, 459, 1], [0, 460, 1], [0, 461, 1], [0, 462, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
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
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): xspi1-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
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
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd1-group:clk-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd1-group:ctrl-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd1-uhs-group:data-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd1-uhs-group:clk-pins:drive-strength-microamp: [11800] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd1-uhs-group:ctrl-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): xspi0-group:ctrl-data-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: timer@90001200 (renesas,r9a09g087-mtu3): compatible:0: 'renesas,r9a09g087-mtu3' is not one of ['renesas,r9a07g043-mtu3', 'renesas,r9a07g044-mtu3', 'renesas,r9a07g054-mtu3']
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: timer@90001200 (renesas,r9a09g087-mtu3): interrupt-names: ['tgia0', 'tgib0', 'tgic0', 'tgid0', 'tciv0', 'tgie0', 'tgif0', 'tgia1', 'tgib1', 'tciv1', 'tciu1', 'tgia2', 'tgib2', 'tciv2', 'tciu2', 'tgia3', 'tgib3', 'tgic3', 'tgid3', 'tciv3', 'tgia4', 'tgib4', 'tgic4', 'tgid4', 'tciv4', 'tgiu5', 'tgiv5', 'tgiw5', 'tgia6', 'tgib6', 'tgic6', 'tgid6', 'tciv6', 'tgia7', 'tgib7', 'tgic7', 'tgid7', 'tciv7', 'tgia8', 'tgib8', 'tgic8', 'tgid8', 'tciv8'] is too short
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: timer@90001200 (renesas,r9a09g087-mtu3): interrupts: [[0, 420, 1], [0, 421, 1], [0, 422, 1], [0, 423, 1], [0, 424, 1], [0, 425, 1], [0, 426, 1], [0, 427, 1], [0, 428, 1], [0, 429, 1], [0, 430, 1], [0, 431, 1], [0, 432, 1], [0, 433, 1], [0, 434, 1], [0, 435, 1], [0, 436, 1], [0, 437, 1], [0, 438, 1], [0, 439, 1], [0, 440, 1], [0, 441, 1], [0, 442, 1], [0, 443, 1], [0, 444, 1], [0, 445, 1], [0, 446, 1], [0, 447, 1], [0, 448, 1], [0, 449, 1], [0, 450, 1], [0, 451, 1], [0, 452, 1], [0, 453, 1], [0, 454, 1], [0, 455, 1], [0, 456, 1], [0, 457, 1], [0, 458, 1], [0, 459, 1], [0, 460, 1], [0, 461, 1], [0, 462, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
