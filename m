Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6667F3E5A2A
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Jun 2026 22:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781649668; cv=none; b=UJ6KdVDFTONJAosyh2Ggqc/oyCoysBVz19Fj69ECeXx9QRQoRCacfFVcNeVTz1XFb9joQkGROz+IbpOZM0nLnge2vKYhQXR29bbKjOiUWFvr/kwYzFZxTZdy4+rCFECXq/BvJWJYn0iZxs0RcOdo065DrRZBtHZr9N9CJvsyI0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781649668; c=relaxed/simple;
	bh=zyKgLka8IRItHSYTAwz15natNFzPW7YZWWCNiRyX/zM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KRuopETIDtZSXyMPuO3btFpYsxNjqM200S4amgy/BT/xm6sh9/v+YZ1a7usc22wx6b9JCoNYXPP3/voZa4R3n9140ASkFg/YcoUnJnNWR0vr4OtC39ZzGcEy2yAVYGFoEPYEGil6qdbKjbgcZ7cNFspgXfvd55Hegbqer8i+0pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YAWIN0Q1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YAWIN0Q1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781649666; x=1813185666;
  h=date:from:to:cc:subject:message-id;
  bh=zyKgLka8IRItHSYTAwz15natNFzPW7YZWWCNiRyX/zM=;
  b=YAWIN0Q1IVP1v9U4KrgklK9IP3/J6ZJEKApCC3dV9McHFcVdzCxeMvy6
   6pDwRqMBXjBJ5ugm/U90GRW4QFIr0MUX0kOJ5JFBtF+yzDWjIEFFXOQm6
   8DRcEtUWct60AnZdDdhDkJV87BKT6HZelHb3Cs09QKfHwGq1/rjVuTF7O
   aWDENlLfK1EhIGJDik3BoV7lXcwE5EsvF0Ryo+NKrgCmzY5oEGiDZ0aG+
   iI7iPXUMOkvpDcLnq7s2o1PC56+879bZZjkx1Udbcm9a/fISVl4ebdEae
   r0z95undO6qg6VNzi4OR7SjoSUbWYrqKLaqoy7Hd4afshFWmbXvDATa/+
   g==;
X-CSE-ConnectionGUID: BJbEWXHVQoamomGWjvKYIw==
X-CSE-MsgGUID: qxBFfWOISZer4aPH8fc/yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93552452"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="93552452"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 15:41:06 -0700
X-CSE-ConnectionGUID: uSuTG0UUS3yn4Z4/JJAczw==
X-CSE-MsgGUID: h602/CjkQUub7LhkiWVg9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="271614466"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 16 Jun 2026 15:41:04 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZcSt-000000005EP-00S8;
	Tue, 16 Jun 2026 22:41:03 +0000
Date: Wed, 17 Jun 2026 00:40:40 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk-cn20-lcdc.dtb:
 fcp@920d0000 (renesas,r9a09g087-fcpvd): False schema does not allow ['aclk',
 'pclk', 'vclk']
Message-ID: <202606170041.C3zlOlc3-lkp@intel.com>
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

tree:   https://github.com/intel-lab-lkp/linux/commits/Prabhakar/arm64-dts-renesas-r9a09g077-Add-VSPD-and-FCPVD-nodes/20260615-200213
head:   5e4f984fc5111f12047e6aec7dc50d02e958d971
commit: 5e4f984fc5111f12047e6aec7dc50d02e958d971 arm64: dts: renesas: Add LCDC overlays for RZ/T2H and RZ/N2H EVKs with ADV7513
date:   34 hours ago
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: arm64-randconfig-2054-20260615 (https://download.01.org/0day-ci/archive/20260617/202606170041.C3zlOlc3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.5.dev12+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606170041.C3zlOlc3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606170041.C3zlOlc3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk-cn20-lcdc.dtb: fcp@920d0000 (renesas,r9a09g087-fcpvd): False schema does not allow ['aclk', 'pclk', 'vclk']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk-cn20-lcdc.dtb: fcp@920d0000 (renesas,r9a09g087-fcpvd): clocks: [[3, 0, 8], [3, 1, 1204], [3, 0, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk-cn20-lcdc.dtb: fcp@920d0000 (renesas,r9a09g087-fcpvd): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g087-fcpvd', 'renesas,fcpv'] is too long
   	'renesas,r9a09g087-fcpvd' is not one of ['renesas,fcpv', 'renesas,fcpf']
   	'renesas,r9a09g087-fcpvd' is not one of ['renesas,r9a07g043u-fcpvd', 'renesas,r9a07g044-fcpvd', 'renesas,r9a07g054-fcpvd', 'renesas,r9a09g056-fcpvd', 'renesas,r9a09g057-fcpvd']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk-cn20-lcdc.dtb: fcp@920d0000 (renesas,r9a09g087-fcpvd): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk-cn20-lcdc.dtb: vsp@920e0000 (renesas,r9a09g087-vsp2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g087-vsp2', 'renesas,r9a07g044-vsp2'] is too long
   	'renesas,r9a09g087-vsp2' is not one of ['renesas,r9a07g044-vsp2', 'renesas,vsp1', 'renesas,vsp2']
   	'renesas,r9a09g087-vsp2' is not one of ['renesas,r9a07g043u-vsp2', 'renesas,r9a07g054-vsp2', 'renesas,r9a09g056-vsp2', 'renesas,r9a09g057-vsp2']
   	from schema $id: http://devicetree.org/schemas/media/renesas,vsp1.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk-cn20-lcdc.dtb: vsp@920e0000 (renesas,r9a09g087-vsp2): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/media/renesas,vsp1.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb: fcp@920d0000 (renesas,r9a09g077-fcpvd): False schema does not allow ['aclk', 'pclk', 'vclk']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb: fcp@920d0000 (renesas,r9a09g077-fcpvd): clocks: [[3, 0, 8], [3, 1, 1204], [3, 0, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb: fcp@920d0000 (renesas,r9a09g077-fcpvd): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g077-fcpvd', 'renesas,fcpv'] is too long
   	'renesas,r9a09g077-fcpvd' is not one of ['renesas,fcpv', 'renesas,fcpf']
   	'renesas,r9a09g077-fcpvd' is not one of ['renesas,r9a07g043u-fcpvd', 'renesas,r9a07g044-fcpvd', 'renesas,r9a07g054-fcpvd', 'renesas,r9a09g056-fcpvd', 'renesas,r9a09g057-fcpvd']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb: fcp@920d0000 (renesas,r9a09g077-fcpvd): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb: vsp@920e0000 (renesas,r9a09g077-vsp2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g077-vsp2', 'renesas,r9a07g044-vsp2'] is too long
   	'renesas,r9a09g077-vsp2' is not one of ['renesas,r9a07g044-vsp2', 'renesas,vsp1', 'renesas,vsp2']
   	'renesas,r9a09g077-vsp2' is not one of ['renesas,r9a07g043u-vsp2', 'renesas,r9a07g054-vsp2', 'renesas,r9a09g056-vsp2', 'renesas,r9a09g057-vsp2']
   	from schema $id: http://devicetree.org/schemas/media/renesas,vsp1.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb: vsp@920e0000 (renesas,r9a09g077-vsp2): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/media/renesas,vsp1.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
