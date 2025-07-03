Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C13136E
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Jul 2025 06:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751523041; cv=none; b=hWMKuaxHnwsswFTVXzR5EqQ/ccf5MLDp77g8ezfGsgnsRQTKM1oAVoy6qAHUBtnry85c36yPTb1UD7sRbEPH4NQrfPpbxqTp82/LW2BMUguaLyDX16AbWNh/jGlEmGr2mpJRgiBHmcV3AqxvC6nzGBUeuPpV4qwyEOunNtjWuCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751523041; c=relaxed/simple;
	bh=BjnATBA8xd1ox46JSiusTYdnv4FQRNsdxHv27VhCbYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PyUgttV9J01UB2w9wFJwjTdb2QuS4nnrcOboR496roRo26sa6EpowhCh/aocI7kHw1XEXUcAvoEiGZk+OKHsXro3T/izS+Y5wd5SEbRH9yoccoxleHXfGEHjZlCePaX3lf3ppmn4u3/Ckoj+zEhoX+zGOMeeHmaOnzpdRD18qPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bDxhYVLC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bDxhYVLC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751523039; x=1783059039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BjnATBA8xd1ox46JSiusTYdnv4FQRNsdxHv27VhCbYQ=;
  b=bDxhYVLCxL5XA8AgZEYLGHKgA/KpW69Uc4C/jt5c45gdrBs856iTZLyX
   aviYvRKiTm/Fjfkp3jWLiSpv6ybYfzPtLZlTiyo/5nV8XENDqBOqbYy7R
   M3p8OTMiiWd9fj4Lm1BCm56OTduBXSjQUnxwefm2VR9QeVHJmshiAAK+Q
   ZNbCtORbu9KdGZXS5fkzJ6D1IxyFLsBliggc/zj50CzfhCv9+AwUfs/rq
   oZWQc3fSequ33+9qPq0KtUb4rL4BK62ZA4u0/y6KWf5k7BDLIBbDgoW68
   oLBVXtFjjjLus/oaAk2xJIr7nJFdUXq/g1GREgFP7ASmD6nV8akY7RzG9
   A==;
X-CSE-ConnectionGUID: CsoFtqWTS+iFieAIWv+BMw==
X-CSE-MsgGUID: 9hFAMLEuSYyM5zU2BKFikw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57510719"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="57510719"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 23:10:38 -0700
X-CSE-ConnectionGUID: C8D8YmkHRKCE8IncCFkmMw==
X-CSE-MsgGUID: h7TNnukcSPm3ZyGGhYjtig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="154769270"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa008.jf.intel.com with ESMTP; 02 Jul 2025 23:10:38 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXD9X-0000QH-0H;
	Thu, 03 Jul 2025 06:10:35 +0000
Date: Thu, 3 Jul 2025 08:10:23 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gustavoars:testing/wfamnae-next20250616 2176/2847]
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb@15820000
 (renesas,usbhs-r9a09g056): compatible: 'oneOf' conditional failed, one must
 be fixed:
Message-ID: <202507030800.sEEPXpuA-lkp@intel.com>
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
CC: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
CC: LKML <linux-kernel@vger.kernel.org>
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250616
head:   78f053980ba50a0becae798ab7d07527d97e790d
commit: 8cdba78ca5e7db0092ef0fe2677d7fb2ea6f32f8 [2176/2847] arm64: dts: renesas: r9a09g056: Add USB2.0 support
:::::: branch date: 8 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2051-20250702 (https://download.01.org/0day-ci/archive/20250703/202507030800.sEEPXpuA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507030800.sEEPXpuA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507030800.sEEPXpuA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'renesas,scif-r9a07g044' was expected
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb-phy@15800200 (renesas,usb2-phy-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,usb2-phy-r9a09g056', 'renesas,usb2-phy-r9a09g057'] is too long
   	'renesas,usb2-phy-r9a09g056' is not one of ['renesas,usb2-phy-r8a77470', 'renesas,usb2-phy-r9a08g045', 'renesas,usb2-phy-r9a09g057']
   	'renesas,usb2-phy-r9a09g056' is not one of ['renesas,usb2-phy-r7s9210', 'renesas,usb2-phy-r8a774a1', 'renesas,usb2-phy-r8a774b1', 'renesas,usb2-phy-r8a774c0', 'renesas,usb2-phy-r8a774e1', 'renesas,usb2-phy-r8a7795', 'renesas,usb2-phy-r8a7796', 'renesas,usb2-phy-r8a77961', 'renesas,usb2-phy-r8a77965', 'renesas,usb2-phy-r8a77990', 'renesas,usb2-phy-r8a77995']
   	'renesas,usb2-phy-r9a09g056' is not one of ['renesas,usb2-phy-r9a07g043', 'renesas,usb2-phy-r9a07g044', 'renesas,usb2-phy-r9a07g054']
   	'renesas,rcar-gen3-usb2-phy' was expected
   	'renesas,rzg2l-usb2-phy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/renesas,usb2-phy.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb@15820000 (renesas,usbhs-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	'renesas,usbhs-r7s72100' was expected
   	'renesas,usbhs-r9a09g056' is not one of ['renesas,usbhs-r7s9210']
   	'renesas,usbhs-r9a09g056' is not one of ['renesas,usbhs-r9a07g043', 'renesas,usbhs-r9a07g044', 'renesas,usbhs-r9a07g054', 'renesas,usbhs-r9a08g045', 'renesas,usbhs-r9a09g057']
   	'renesas,usbhs-r9a09g056' is not one of ['renesas,usbhs-r8a7742', 'renesas,usbhs-r8a7743', 'renesas,usbhs-r8a7744', 'renesas,usbhs-r8a7745', 'renesas,usbhs-r8a77470', 'renesas,usbhs-r8a7790', 'renesas,usbhs-r8a7791', 'renesas,usbhs-r8a7792', 'renesas,usbhs-r8a7793', 'renesas,usbhs-r8a7794']
   	'renesas,usbhs-r9a09g056' is not one of ['renesas,usbhs-r8a774a1', 'renesas,usbhs-r8a774b1', 'renesas,usbhs-r8a774c0', 'renesas,usbhs-r8a774e1', 'renesas,usbhs-r8a7795', 'renesas,usbhs-r8a7796', 'renesas,usbhs-r8a77961', 'renesas,usbhs-r8a77965', 'renesas,usbhs-r8a77990', 'renesas,usbhs-r8a77995']
   	'renesas,rza1-usbhs' was expected
   	'renesas,rza2-usbhs' was expected
   	'renesas,rcar-gen2-usbhs' was expected
   	'renesas,rcar-gen3-usbhs' was expected
   	from schema $id: http://devicetree.org/schemas/usb/renesas,usbhs.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): compatible:0: 'renesas,r9a09g057-usb2phy-reset' was expected
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): compatible: ['renesas,r9a09g056-usb2phy-reset', 'renesas,r9a09g057-usb2phy-reset'] is too long
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
