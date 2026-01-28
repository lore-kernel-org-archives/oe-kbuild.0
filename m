Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FE632F746
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Jan 2026 11:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769598712; cv=none; b=CRenhD6gFC13kTtOcqN35hehKwc6OW0dVhcayaJq0ds1R0bVn+g7ZA3X0qit0fnu7siY62EMonmFPsjmQdC+rvwQjeivqw1BS0F8QcPbRHu87Imsva31sMZDUDFWE8TqnXxLrU4kuokLVFt+Mqyy+WMU3o1qAfDl108iW4Yzer0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769598712; c=relaxed/simple;
	bh=ouCM3CMULXX4qM/h/9xxDxws49HMqP5HykWDXUVOXgg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cCQ3/CAgroCqonS7ZYvyVwQ5RYcrk9OgLJGwbSBILUM+CEunpHeQ4dGfKw8B3VvmjvLRrDILPaXKg378FBlEphXWtzoNRpNmK8eYomg5P1KzB2X7xYJ+tpVmS5WM8Jyxc5RnEu4GBru1UQpvkdbLx7zP98P1fqIfvdUTPEcnyiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YawJo62W; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YawJo62W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769598709; x=1801134709;
  h=date:from:to:cc:subject:message-id;
  bh=ouCM3CMULXX4qM/h/9xxDxws49HMqP5HykWDXUVOXgg=;
  b=YawJo62WI+AY2GRFIgtayOjjkxuPPlpYnbOvTKSv/iwziWErTl2OmROC
   ZldEvg5SDzUTCPdh4M86VXpoUVSidDQYTmd68eNWmVlatOijE0hiZCtVA
   xjVEWA2tMn9z4XmSq9LBLVi8nK9XBvnRykKDnvrs7dBOxKNG+NlM4n79G
   7qQwZL6cw9JgoJsl/sJ1pjj5o9Z2VoLOUvoqRmY/O7WBXGjZ2Na9aqxdB
   xLoLXDdSfzJbRNMnDo4F/UhtQlfFG1eh6MriNnTVvE7J9cbIISjIUK+4c
   W2bsLhxEPDHJv1jS8l9c1fen1Xn5h4VUTkYVVvAGjABQRIcakbdPiBqf2
   A==;
X-CSE-ConnectionGUID: GtB/OYnDS5ykl3cs9zdzrw==
X-CSE-MsgGUID: SnjmkLo0S1G7Iue+UPldww==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70707803"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70707803"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 03:11:48 -0800
X-CSE-ConnectionGUID: bgqzrk1vShKkaAf1vojCWg==
X-CSE-MsgGUID: gq02KJfuTOCCR5sxOTHaAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="238956843"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 28 Jan 2026 03:11:46 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl3SZ-0000000022n-0kAD;
	Wed, 28 Jan 2026 11:11:43 +0000
Date: Wed, 28 Jan 2026 12:11:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-drivers:master 5/67]
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: rtc@11c00800
 (renesas,r9a09g056-rtca3): compatible:0: 'renesas,r9a09g056-rtca3' is not one
 of ['renesas,r9a08g045-rtca3', 'renesas,r9a09g057-rtca3']
Message-ID: <202601281259.3NYi16Zd-lkp@intel.com>
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
TO: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   9fc6d405cb5dcae56d3740feabd528f9bf050d4a
commit: b88c0a016486f7ec56b72735cdee47179641cdb9 [5/67] arm64: dts: renesas: r9a09g056: Add RTC node
:::::: branch date: 22 hours ago
:::::: commit date: 25 hours ago
config: arm64-randconfig-2052-20260127 (https://download.01.org/0day-ci/archive/20260128/202601281259.3NYi16Zd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281259.3NYi16Zd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601281259.3NYi16Zd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'renesas,r9a09g057-dmac' was expected
   	'renesas,rz-dmac' was expected
   	from schema $id: http://devicetree.org/schemas/dma/renesas,rz-dmac.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: dma-controller@12010000 (renesas,r9a09g056-dmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g056-dmac', 'renesas,r9a09g057-dmac'] is too long
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r7s72100-dmac', 'renesas,r9a07g043-dmac', 'renesas,r9a07g044-dmac', 'renesas,r9a07g054-dmac', 'renesas,r9a08g045-dmac']
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r9a09g047-dmac']
   	'renesas,r9a09g057-dmac' was expected
   	'renesas,rz-dmac' was expected
   	from schema $id: http://devicetree.org/schemas/dma/renesas,rz-dmac.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: rtc@11c00800 (renesas,r9a09g056-rtca3): compatible:0: 'renesas,r9a09g056-rtca3' is not one of ['renesas,r9a08g045-rtca3', 'renesas,r9a09g057-rtca3']
   	from schema $id: http://devicetree.org/schemas/rtc/renesas,rz-rtca3.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: can@12440000 (renesas,r9a09g056-canfd): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g056-canfd', 'renesas,r9a09g047-canfd'] is too long
   	'renesas,r9a09g056-canfd' is not one of ['renesas,r8a774a1-canfd', 'renesas,r8a774b1-canfd', 'renesas,r8a774c0-canfd', 'renesas,r8a774e1-canfd', 'renesas,r8a7795-canfd', 'renesas,r8a7796-canfd', 'renesas,r8a77961-canfd', 'renesas,r8a77965-canfd', 'renesas,r8a77970-canfd', 'renesas,r8a77980-canfd', 'renesas,r8a77990-canfd', 'renesas,r8a77995-canfd']
   	'renesas,r9a09g056-canfd' is not one of ['renesas,r8a779a0-canfd', 'renesas,r8a779g0-canfd', 'renesas,r8a779h0-canfd']
   	'renesas,r9a09g056-canfd' is not one of ['renesas,r9a07g043-canfd', 'renesas,r9a07g044-canfd', 'renesas,r9a07g054-canfd']
   	'renesas,r9a09g047-canfd' was expected
   	'renesas,rcar-gen3-canfd' was expected
   	'renesas,rcar-gen4-canfd' was expected
   	'renesas,rzg2l-canfd' was expected
--
   	'renesas,r9a09g057-dmac' was expected
   	'renesas,rz-dmac' was expected
   	from schema $id: http://devicetree.org/schemas/dma/renesas,rz-dmac.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: dma-controller@12010000 (renesas,r9a09g056-dmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g056-dmac', 'renesas,r9a09g057-dmac'] is too long
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r7s72100-dmac', 'renesas,r9a07g043-dmac', 'renesas,r9a07g044-dmac', 'renesas,r9a07g054-dmac', 'renesas,r9a08g045-dmac']
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r9a09g047-dmac']
   	'renesas,r9a09g057-dmac' was expected
   	'renesas,rz-dmac' was expected
   	from schema $id: http://devicetree.org/schemas/dma/renesas,rz-dmac.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: rtc@11c00800 (renesas,r9a09g056-rtca3): compatible:0: 'renesas,r9a09g056-rtca3' is not one of ['renesas,r9a08g045-rtca3', 'renesas,r9a09g057-rtca3']
   	from schema $id: http://devicetree.org/schemas/rtc/renesas,rz-rtca3.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: can@12440000 (renesas,r9a09g056-canfd): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g056-canfd', 'renesas,r9a09g047-canfd'] is too long
   	'renesas,r9a09g056-canfd' is not one of ['renesas,r8a774a1-canfd', 'renesas,r8a774b1-canfd', 'renesas,r8a774c0-canfd', 'renesas,r8a774e1-canfd', 'renesas,r8a7795-canfd', 'renesas,r8a7796-canfd', 'renesas,r8a77961-canfd', 'renesas,r8a77965-canfd', 'renesas,r8a77970-canfd', 'renesas,r8a77980-canfd', 'renesas,r8a77990-canfd', 'renesas,r8a77995-canfd']
   	'renesas,r9a09g056-canfd' is not one of ['renesas,r8a779a0-canfd', 'renesas,r8a779g0-canfd', 'renesas,r8a779h0-canfd']
   	'renesas,r9a09g056-canfd' is not one of ['renesas,r9a07g043-canfd', 'renesas,r9a07g044-canfd', 'renesas,r9a07g054-canfd']
   	'renesas,r9a09g047-canfd' was expected
   	'renesas,rcar-gen3-canfd' was expected
   	'renesas,rcar-gen4-canfd' was expected
   	'renesas,rzg2l-canfd' was expected
--
   	'renesas,r9a09g057-dmac' was expected
   	'renesas,rz-dmac' was expected
   	from schema $id: http://devicetree.org/schemas/dma/renesas,rz-dmac.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: dma-controller@12010000 (renesas,r9a09g056-dmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g056-dmac', 'renesas,r9a09g057-dmac'] is too long
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r7s72100-dmac', 'renesas,r9a07g043-dmac', 'renesas,r9a07g044-dmac', 'renesas,r9a07g054-dmac', 'renesas,r9a08g045-dmac']
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r9a09g047-dmac']
   	'renesas,r9a09g057-dmac' was expected
   	'renesas,rz-dmac' was expected
   	from schema $id: http://devicetree.org/schemas/dma/renesas,rz-dmac.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: rtc@11c00800 (renesas,r9a09g056-rtca3): compatible:0: 'renesas,r9a09g056-rtca3' is not one of ['renesas,r9a08g045-rtca3', 'renesas,r9a09g057-rtca3']
   	from schema $id: http://devicetree.org/schemas/rtc/renesas,rz-rtca3.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: can@12440000 (renesas,r9a09g056-canfd): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g056-canfd', 'renesas,r9a09g047-canfd'] is too long
   	'renesas,r9a09g056-canfd' is not one of ['renesas,r8a774a1-canfd', 'renesas,r8a774b1-canfd', 'renesas,r8a774c0-canfd', 'renesas,r8a774e1-canfd', 'renesas,r8a7795-canfd', 'renesas,r8a7796-canfd', 'renesas,r8a77961-canfd', 'renesas,r8a77965-canfd', 'renesas,r8a77970-canfd', 'renesas,r8a77980-canfd', 'renesas,r8a77990-canfd', 'renesas,r8a77995-canfd']
   	'renesas,r9a09g056-canfd' is not one of ['renesas,r8a779a0-canfd', 'renesas,r8a779g0-canfd', 'renesas,r8a779h0-canfd']
   	'renesas,r9a09g056-canfd' is not one of ['renesas,r9a07g043-canfd', 'renesas,r9a07g044-canfd', 'renesas,r9a07g054-canfd']
   	'renesas,r9a09g047-canfd' was expected
   	'renesas,rcar-gen3-canfd' was expected
   	'renesas,rcar-gen4-canfd' was expected
   	'renesas,rzg2l-canfd' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
