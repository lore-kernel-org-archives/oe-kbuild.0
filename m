Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CB63242BE
	for <oe-kbuild@lists.linux.dev>; Sat, 30 May 2026 16:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780159796; cv=none; b=bh6iyh1SKZ6mX0PXDUxH5b4ovYt4s60x/aZ4zQZfLOS2fglSK2/wzbK+N/GZxL+wKpeMwAV63iLEQAjGOYHiEL9QYsLmMSFUMIJpx6P+5F7B6wfw1QIE5db4ASjNdtvoWR4qCD8y7q2gGfIxipvP4fPiCCMUWCqbBhbGIm01FUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780159796; c=relaxed/simple;
	bh=7IB618gSOxqsRkjWZo2eJaNVxkAC/Ispv0qpAkWqhGs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=By6tVbhQq4xKV2zGN3M6kwflXMgjL6WoVAFIzIRcQdVNBS1H4PT5u3rkvmx8YDF7Em8gxeDEb8nw5t78E0CxmTtLHOuDa4rMwvXOrHlGmQUVAAGJGyu6bziCg2Xtv7UaQK8ueVYQIsgDVJdym7I60HFmZJaRIrRFo946+zhY1OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oCpHS95/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oCpHS95/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780159794; x=1811695794;
  h=date:from:to:cc:subject:message-id;
  bh=7IB618gSOxqsRkjWZo2eJaNVxkAC/Ispv0qpAkWqhGs=;
  b=oCpHS95/HWSpcGKr3dSzuNjmmi8jqKP2abmPfGr38LPPGcTgdocQYc96
   REKzjKqCnDMAlYN2OFij7CkLoonmVMTeQFfF0z8VLke9mVdbxL677JgaS
   jfu1jJcfGgg42Fm1qT4ZCIU21LDJGKHg6tPenni2Zr4os6HvecAtjmVoe
   WU5/rKixhUV3iDt27C6HbzSTAts4VAZKopuY9O8U7sWL1dWEKzudwaiOj
   fdAbDI+5wkQnksKZY3bUlmLEL88hTphyefh2ftrSTpFVzrBv9UmH1TV+z
   hwDzh9AXB2nPyDL57HpaC1fEw8mZjLx6LLagh4vOzB9IljX7DQkaQrAW+
   A==;
X-CSE-ConnectionGUID: zyQCPbN7RwqWWp/ezFhQgg==
X-CSE-MsgGUID: wmQOy0iFTouStgfuyl3iiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="68515929"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="68515929"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 09:49:53 -0700
X-CSE-ConnectionGUID: Y7jqa1S4SUqW3fWICHuTLQ==
X-CSE-MsgGUID: j+YSc/haTbqLh50t/QL9UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="242996948"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 30 May 2026 09:49:52 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTMsf-000000001BF-1dF9;
	Sat, 30 May 2026 16:49:49 +0000
Date: Sat, 30 May 2026 18:49:39 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb:
 pinctrl@802c0000 (renesas,r9a09g077-pinctrl):
 gmac1-group:txclk-pins:drive-strength-microamp: [11800] is not one of [2500,
 5000, 9000, 11800]
Message-ID: <202605301851.YtjXJaZo-lkp@intel.com>
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
commit: 6697f1217e9855da2237a40b0ea1aec67be006a5 arm64: dts: renesas: rzt2h-n2h-evk: Configure ETH pins
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260529 (https://download.01.org/0day-ci/archive/20260530/202605301851.YtjXJaZo-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605301851.YtjXJaZo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605301851.YtjXJaZo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
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
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): gmac1-group:txclk-pins:drive-strength-microamp: [11800] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): gmac1-group:txd-en-pins:drive-strength-microamp: [11800] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): gmac1-group:md-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): gmac1-group:refclk-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): gmac1-group:irq-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): gmac2-group:txclk-pins:drive-strength-microamp: [11800] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): gmac2-group:txd-en-pins:drive-strength-microamp: [11800] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): gmac2-group:md-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): gmac2-group:refclk-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): gmac2-group:irq-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: timer@90001200 (renesas,r9a09g077-mtu3): compatible:0: 'renesas,r9a09g077-mtu3' is not one of ['renesas,r9a07g043-mtu3', 'renesas,r9a07g044-mtu3', 'renesas,r9a07g054-mtu3']
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: timer@90001200 (renesas,r9a09g077-mtu3): interrupt-names: ['tgia0', 'tgib0', 'tgic0', 'tgid0', 'tciv0', 'tgie0', 'tgif0', 'tgia1', 'tgib1', 'tciv1', 'tciu1', 'tgia2', 'tgib2', 'tciv2', 'tciu2', 'tgia3', 'tgib3', 'tgic3', 'tgid3', 'tciv3', 'tgia4', 'tgib4', 'tgic4', 'tgid4', 'tciv4', 'tgiu5', 'tgiv5', 'tgiw5', 'tgia6', 'tgib6', 'tgic6', 'tgid6', 'tciv6', 'tgia7', 'tgib7', 'tgic7', 'tgid7', 'tciv7', 'tgia8', 'tgib8', 'tgic8', 'tgid8', 'tciv8'] is too short
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: timer@90001200 (renesas,r9a09g077-mtu3): interrupts: [[0, 420, 1], [0, 421, 1], [0, 422, 1], [0, 423, 1], [0, 424, 1], [0, 425, 1], [0, 426, 1], [0, 427, 1], [0, 428, 1], [0, 429, 1], [0, 430, 1], [0, 431, 1], [0, 432, 1], [0, 433, 1], [0, 434, 1], [0, 435, 1], [0, 436, 1], [0, 437, 1], [0, 438, 1], [0, 439, 1], [0, 440, 1], [0, 441, 1], [0, 442, 1], [0, 443, 1], [0, 444, 1], [0, 445, 1], [0, 446, 1], [0, 447, 1], [0, 448, 1], [0, 449, 1], [0, 450, 1], [0, 451, 1], [0, 452, 1], [0, 453, 1], [0, 454, 1], [0, 455, 1], [0, 456, 1], [0, 457, 1], [0, 458, 1], [0, 459, 1], [0, 460, 1], [0, 461, 1], [0, 462, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
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
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): gmac1-group:txclk-pins:drive-strength-microamp: [11800] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): gmac1-group:txd-en-pins:drive-strength-microamp: [11800] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): gmac1-group:md-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): gmac1-group:refclk-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): gmac1-group:irq-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): gmac2-group:txclk-pins:drive-strength-microamp: [11800] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): gmac2-group:txd-en-pins:drive-strength-microamp: [11800] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): gmac2-group:md-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): gmac2-group:refclk-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): gmac2-group:irq-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
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
