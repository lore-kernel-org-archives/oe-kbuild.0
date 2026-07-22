Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EB5357D05
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Jul 2026 17:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784740284; cv=none; b=MrPs2ZKKv+E/AKxmyO3wwRcPL6s5Y5cLGiHorU2FKe0uhTFuMgTRR36rYHwttdUvRrv3MLk9wzXi8O+BfUrRWBBacy0zaD7S9hR/Ya6AJjaL2Iv1E6ywM0ydrYTtAsMKsJr7E3y647uOgh8/TsA0bRu8l5huNQZuIpFeLd9lxBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784740284; c=relaxed/simple;
	bh=WBth3TjXHScr3F6KcIulPM49pSQUFUSuao93GfErLcg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TEUc+B8U06xZWJycss1BoAUASCTcaUoZ6DEswzxnerJZiUt6Gn1IEAz9dmBiNAfqZavj9Z3kDtBbsFON5y4yjZ26Zi4ztTsRPGITwwG0JNpgYTk0c04gOSAoLmcIai2xgXAtajbkAvaP9SeQd0RyYT8JWJ3rOh/MDXnCzvCWsWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AMbn92lG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AMbn92lG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784740281; x=1816276281;
  h=date:from:to:cc:subject:message-id;
  bh=WBth3TjXHScr3F6KcIulPM49pSQUFUSuao93GfErLcg=;
  b=AMbn92lGL/SRnI2fIsIpr+3JLt4FJ0qquSpJW6W+eGiAlLwbxE0xTimj
   S2Pn8FnMb01qV7LRki5WWt1mBLDMblUIIdV5O/uL/48peoQx4akL4BUVZ
   YvAbZakQT1vf3bXwH5drDnanXE8OVbTR5fN30FtvGlbg5D8kxSgV92AYD
   WqEyzFhzrHLfO+OCC4plFIkIiSC2IJ3OcxCZXqhlncx3UQ5PRypIqfbTs
   QgUG6Ete5nhxbKHRgnYLuVGomO0BXN0JkSUbbSAQAibNlDnsF1aimYWfW
   1psU7uF/lwWEd7Zdbgc86UhjZ66OYuJ1DoySrysN6M3KE87nGpu/pgbZU
   A==;
X-CSE-ConnectionGUID: LXvDut8QThObMpfq/dMldA==
X-CSE-MsgGUID: 7yB/pQltSzGbR/Gp/pe+Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85503313"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="85503313"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 10:11:17 -0700
X-CSE-ConnectionGUID: uZYsZ13qQ42CgpVENo9Rig==
X-CSE-MsgGUID: G4V9nBxPRlm5c9ES6+dA+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="255495968"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 22 Jul 2026 10:11:15 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmaTN-000000000W4-3Zo9;
	Wed, 22 Jul 2026 17:11:09 +0000
Date: Wed, 22 Jul 2026 19:10:54 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb:
 serial@c0710000 (renesas,hscif-r8a78000): 'power-domains' is a required
 property
Message-ID: <202607221921.T83PeSJK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Hai Pham <hai.pham.ud@renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
CC: Takeshi Kihara <takeshi.kihara.df@renesas.com>
CC: Khanh Le <khanh.le.xr@renesas.com>
CC: Huy Bui <huy.bui.wm@renesas.com>
CC: Phong Hoang <phong.hoang.wz@renesas.com>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   248951ddc14de84de3910f9b13f51491a8cd91df
commit: ad142a4ef7106326bbf5c67eb39f21ef77fe8be3 arm64: dts: renesas: r8a78000: Add initial Ironhide board support
date:   9 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 9 months ago
config: arm64-randconfig-2055-20260721 (https://download.01.org/0day-ci/archive/20260722/202607221921.T83PeSJK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260722/202607221921.T83PeSJK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ad142a4ef710 ("arm64: dts: renesas: r8a78000: Add initial Ironhide board support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607221921.T83PeSJK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
