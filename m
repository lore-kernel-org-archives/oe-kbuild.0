Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E072D3A93
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Jun 2026 19:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781638686; cv=none; b=gFbVSNhHEFrswdNjG5KPsJKN3PdHWIRSHxxklv57uxoO1F6IZjEY0mR7murm/bkN3M98ewvQ0qbNohf30novpQ/dHB1SQa/wP4rWYFIbl03EyC8qdSckeb6PwBI/AVxbBFpHdDSw0DAGkt0AofOfQv6o1rQVG7tzUO7lhlnozVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781638686; c=relaxed/simple;
	bh=QYEeIZjbd5Whw1mpY3zfrkxwBrf/hjOvF1hqwLP2YgA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RAcRG2w1qtX/HR4qIuVzmdzz0WRHGPR80Zg8VpNMDo2QRz5z0ce9MggEmJ9rBbRWxhX/w6vJ2PtfwODAuhInM7BxuUT2OZJMXuJBWBL4hjLgwuc3VdHhmpFaVeRWYepsavG375SZAm1qLfmZ8ZEGamrAFwAxivvMPLe9L/RyuNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SiER6585; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SiER6585"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781638684; x=1813174684;
  h=date:from:to:cc:subject:message-id;
  bh=QYEeIZjbd5Whw1mpY3zfrkxwBrf/hjOvF1hqwLP2YgA=;
  b=SiER6585aHvrAzYhV4DA/XIXfM3MOUnybrnx2Znl7OQSD0V4dFOyD/zY
   0KDwDfgefjEt8nO71ORfrRSg/MYWQyM/a6xT9NBAs2+RgaMlv/1z2Eo5H
   nwse/9za/IEaxB8O7a9kdiUz6H3P+wGU5DHWFsK8FsnopLxwjtnYSnKiI
   BXJfbUNtZrwwJ2Sl7T5qE3vaom8CtVO5H23LcCjj81wMifNcUl6LA/mph
   3GZz6IGme3GOx5uWqB6XpyPK81Vl5dIT+YXdF3N6wusWh1aorXonVwwh6
   YpFVRQnaIq5ejQisnhsW7BNxhGJoYFw8qL/5VbCEWD5I9Mj5WKi/5EDiF
   g==;
X-CSE-ConnectionGUID: 5ys+sPmKRha7zkDxGkD9NA==
X-CSE-MsgGUID: oG4DdEHpT0yzSCO7jc01Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82520566"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82520566"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 12:38:03 -0700
X-CSE-ConnectionGUID: xD4EvjduSEWJiHs5rtyJ2w==
X-CSE-MsgGUID: DnBsjWLST5W87OSCdD8YMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="246975950"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 16 Jun 2026 12:38:02 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZZbk-000000005Ar-07t7;
	Tue, 16 Jun 2026 19:38:00 +0000
Date: Tue, 16 Jun 2026 21:37:42 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb:
 fcp@920d0000 (renesas,r9a09g087-fcpvd): False schema does not allow ['aclk',
 'pclk', 'vclk']
Message-ID: <202606162118.ZAmklM3T-lkp@intel.com>
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
commit: 09348a2e6b7889ba53284b1b0636b5328a77097c arm64: dts: renesas: r9a09g087: Add VSPD and FCPVD nodes
date:   32 hours ago
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: arm64-randconfig-2054-20260615 (https://download.01.org/0day-ci/archive/20260616/202606162118.ZAmklM3T-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.5.dev12+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606162118.ZAmklM3T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606162118.ZAmklM3T-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: fcp@920d0000 (renesas,r9a09g087-fcpvd): False schema does not allow ['aclk', 'pclk', 'vclk']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: fcp@920d0000 (renesas,r9a09g087-fcpvd): clocks: [[3, 0, 8], [3, 1, 1204], [3, 0, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: fcp@920d0000 (renesas,r9a09g087-fcpvd): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g087-fcpvd', 'renesas,fcpv'] is too long
   	'renesas,r9a09g087-fcpvd' is not one of ['renesas,fcpv', 'renesas,fcpf']
   	'renesas,r9a09g087-fcpvd' is not one of ['renesas,r9a07g043u-fcpvd', 'renesas,r9a07g044-fcpvd', 'renesas,r9a07g054-fcpvd', 'renesas,r9a09g056-fcpvd', 'renesas,r9a09g057-fcpvd']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: fcp@920d0000 (renesas,r9a09g087-fcpvd): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: vsp@920e0000 (renesas,r9a09g087-vsp2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g087-vsp2', 'renesas,r9a07g044-vsp2'] is too long
   	'renesas,r9a09g087-vsp2' is not one of ['renesas,r9a07g044-vsp2', 'renesas,vsp1', 'renesas,vsp2']
   	'renesas,r9a09g087-vsp2' is not one of ['renesas,r9a07g043u-vsp2', 'renesas,r9a07g054-vsp2', 'renesas,r9a09g056-vsp2', 'renesas,r9a09g057-vsp2']
   	from schema $id: http://devicetree.org/schemas/media/renesas,vsp1.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: vsp@920e0000 (renesas,r9a09g087-vsp2): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/media/renesas,vsp1.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
