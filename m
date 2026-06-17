Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CE734E779
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Jun 2026 05:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781673974; cv=none; b=YPpSvJcVKLVueJMiIqOQecXUavsqolo1R8H5j3kPiswluX5/oqvPQ5UuBDBEIwYTMcMTJVMTRQ1SKu3/oOPTdCAZ6dCy6j2O/VTwRXvrT2UzjYq5prRD6dnDd7qBcpkhuMiQX9BAImmgPSoaC4YhlmVeCjAuS/L1if6O9n/Lqdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781673974; c=relaxed/simple;
	bh=qXRqllmwn4ZepL+MhWntHr8s+RZOw25b8bX/ZUf5z+4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LkxAgC+bTVE6SNNUHql5uEUzOF4yIXde+d9HR8UuLAyDMSiasLjG26NBeBHFkqSdgV80gC++kCI/GdiG38hGMPQ/2ajEfCS1gP57m+a/ZvuntS5GWsJIQxzPxK8JED5JgUrajl+o23cCD+BUV8ymIj20PM7cCmyd5BEFmLbryO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eyZBHZbf; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eyZBHZbf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781673971; x=1813209971;
  h=date:from:to:cc:subject:message-id;
  bh=qXRqllmwn4ZepL+MhWntHr8s+RZOw25b8bX/ZUf5z+4=;
  b=eyZBHZbfKqTanfknunrX4os3kkdjbXUhcWRF4IWlOHqUFd29wlboRVmQ
   43+h9fX/IkoUOTvCgeGDtvHYhK5x76nZM5einehXQbmZeAfSOmpV2QYDg
   cLRm5zRE0lK4bfUPlg9r0D4JK4St1bJNWNccs1Nk4Jblil/JfxKJXa9kv
   ueWgw/x+aUsMkbH+/a3Xuegw/Q3rsvGzR11dRtIOqa0pxQXGYQs3AUtky
   gCguOKCVDhrVim175A3qVVI5CWgacZ4JQFrvhkQBC0kiyyBgYyQO52RDy
   s5XKDqNR+4d+IMrwYUb5Rz1tAGQHtOhNkgWofZ7X3aAKyQBWXOxCz+NOm
   g==;
X-CSE-ConnectionGUID: JJUYlawRSbW0wZe+SHS0xw==
X-CSE-MsgGUID: 7z4DmUG6QaaUhKBO90lGjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82357641"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="82357641"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 22:26:10 -0700
X-CSE-ConnectionGUID: 2HoDFtcFRoah6tf7oGeWNQ==
X-CSE-MsgGUID: 2d2TV+snTTyJ5qRCLA7qHw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 16 Jun 2026 22:26:09 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZims-000000005If-3PDY;
	Wed, 17 Jun 2026 05:26:06 +0000
Date: Wed, 17 Jun 2026 07:25:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb:
 fcp@920d0000 (renesas,r9a09g087-fcpvd): False schema does not allow ['aclk',
 'pclk', 'vclk']
Message-ID: <202606170759.ws9Ob3Oi-lkp@intel.com>
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
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2054-20260615 (https://download.01.org/0day-ci/archive/20260617/202606170759.ws9Ob3Oi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606170759.ws9Ob3Oi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606170759.ws9Ob3Oi-lkp@intel.com/

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
