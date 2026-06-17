Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBB33C5853
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Jun 2026 08:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683694; cv=none; b=Hqt+T0mVOdyBem/AKc6i3Z0dm1m3NsdB/6di+XBeMQrbqVbBq82i6NGOYW1o6XHGDa7ov43m75gW6FcCp9UvcuhpO5w7SLJ+Q8IobAGX71JbE2BAsD15fTgVGPgiqhocY1gDYIDBXYizHll5kjjLxDS9lfgrX9NKusuuct5Ko6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683694; c=relaxed/simple;
	bh=sJ7/LtqqYYHCubzz8R9Qbg7bnEhP026m2E65yBXoNYU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jZcr9A+zkcgv594SxwKWqGQeJbx2L30IcrYVX0b3nCedrAzAD3M32Qf/uuSuDmDmdVA9x2HgCtncJNIfSoggM9PhZW6STRUcyBvx/sRntq0K7ELYCJnzKWqWYYKvmmymYB//p7XZEdc7JloWxsRP3aEOIps98mbuUwlR5bEWxwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tczh/sYn; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tczh/sYn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781683691; x=1813219691;
  h=date:from:to:cc:subject:message-id;
  bh=sJ7/LtqqYYHCubzz8R9Qbg7bnEhP026m2E65yBXoNYU=;
  b=Tczh/sYngfMdE7IDmYrgge2ZIBwSkeDdawYYmOzKxW6DcbAKXm0seTAz
   AuGSvaS3Q6L1CsufRfvC5aUP7vquh8fuOa8NlMXTN3UwxuwW5MNZrZQHS
   5tnmmNmyrtcLLDZUcyGgSD3GpL4mYNsZouHrk5l6W/3qxKGjhLk4UA+XE
   ihaY//RzX3twlvfSaI4Cf3xc2v75P3I7A+Gohe6sMOD/7o0XuH5f1DKYt
   QToykFzU6mJn/mY/8iGem+FiQkyuoksoG0VGNi5WHlmHgbNA00o62BPIN
   rfuKW4mJKIe2XpI/J6ZGF+erI6BQhE2gOghN/ODayMYYbWQCTm47sBIaG
   w==;
X-CSE-ConnectionGUID: VZ/wmpi/QsyNfQXTGF6Oqw==
X-CSE-MsgGUID: HDaLqCfqS1KijCY0aWnc7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82478677"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="82478677"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 01:08:10 -0700
X-CSE-ConnectionGUID: TIry4wbYTxednaYsopVKMw==
X-CSE-MsgGUID: 36ho1ka6T2aBrKvCfst2aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="271720077"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 17 Jun 2026 01:08:09 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZlJf-000000005JV-2RnC;
	Wed, 17 Jun 2026 08:08:07 +0000
Date: Wed, 17 Jun 2026 10:07:45 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk-cn20-lcdc.dtb:
 fcp@920d0000 (renesas,r9a09g087-fcpvd): False schema does not allow ['aclk',
 'pclk', 'vclk']
Message-ID: <202606171039.7Y7sMYDo-lkp@intel.com>
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
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2054-20260615 (https://download.01.org/0day-ci/archive/20260617/202606171039.7Y7sMYDo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606171039.7Y7sMYDo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606171039.7Y7sMYDo-lkp@intel.com/

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
