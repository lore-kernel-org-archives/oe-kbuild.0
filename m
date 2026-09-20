Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CFB3DFC86
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Sep 2026 07:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789889107; cv=none; b=YSxXqjjqYzS2j0K2jRGAsp/qR08p5RLXRgAZu9WURJUA9cS6r/A2902Rn8tQ4zn2BR2+ocYo6yhGGOvz91ICHBlW9QUD+DRpQcbXRVpq0ig9calQtIS9zI8t2KA7chx0saWiOJ2dQgIjeNlp8kInUfO99JwGRLqknq0EG7tzrM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789889107; c=relaxed/simple;
	bh=F3yHcTvSdR1M0VtvQ8ypCZP3Txh9gy6M86MLXdy3/4c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NXvOuGewZfzjob7KI5SfFKLUpkZ7ljaS8N6a4tFkhMZx0zxAGN4rg0bo2+Hp7vTsGRUnVMkBZgMMAKk/oROeLxcI+fxIHYOmIgvB0pjADWjuC9bg9+FjhjNFkmg3/ucCZ77mpujnF8y9UZ/JXMkwzLyvzALlercde8b1Iv0ZfO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+X4VQDh; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+X4VQDh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789889104; x=1821425104;
  h=date:from:to:cc:subject:message-id;
  bh=F3yHcTvSdR1M0VtvQ8ypCZP3Txh9gy6M86MLXdy3/4c=;
  b=R+X4VQDhuak6r7duIhwRNhXFSX44eT1j5OmvpXPLZ1kHAHa/JLVF48Jb
   HR4meRfT8WeW5hv1Uh0Xm8OFN5GzGgMwY/oSsdSqaC/A/4+gRkDJkDYuC
   e13OEwqldCGuGmdYePRX9gzrQt3RPE8CFNR9ndvXZm/vSJwM5dEv/5b0d
   8i/KGV0T8LssUxubK9sXLP6TJ/wHCT6BljsK6XRpU31WEDnD2bBm9i1Bv
   ID1pOTAD0MmL8/pPiXbOn2S419OFVI72Cs2Y4F7GVHTsMLGc2U9Cve8Ki
   ceO/95hpChXSn539KZFOa/inQ1gDST29j+X/TEeUm5K8a8JH6tIfMIKoy
   g==;
X-CSE-ConnectionGUID: KMjWL0+xSf2YAnyisyNmkg==
X-CSE-MsgGUID: 3+z/OAwiQTm2/FbCRneecQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="92901696"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="92901696"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 00:25:03 -0700
X-CSE-ConnectionGUID: VzMsZfgPSaCvCXhJ1xLPfg==
X-CSE-MsgGUID: 866ltt63QX2Pivsw9oEKBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="271331254"
Received: from igk-lkp-server01.igk.intel.com (HELO 24469cc966a8) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 20 Sep 2026 00:25:03 -0700
Received: from kbuild by 24469cc966a8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8Bv2-0000000005T-2b5P;
	Sun, 20 Sep 2026 07:25:00 +0000
Date: Sun, 20 Sep 2026 09:24:20 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb:
 hss-buffer@bfc00000 (shared-dma-pool): Unevaluated properties are not allowed
 ('no-map', 'reg' were unexpected)
Message-ID: <202609200941.rCvYRNXf-lkp@intel.com>
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
TO: "Pierre-Henry Moussay" <pierre-henry.moussay@microchip.com>
CC: Conor Dooley <conor.dooley@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   518e5b794c06c0f0eb40df3e202274a66202c137
commit: 7219d20f9f421445389eabeb198aca527054fdf9 riscv: dts: microchip: add pic64gx and its curiosity kit
date:   6 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 6 months ago
config: riscv-randconfig-2401-20260919 (https://download.01.org/0day-ci/archive/20260920/202609200941.rCvYRNXf-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260920/202609200941.rCvYRNXf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7219d20f9f42 ("riscv: dts: microchip: add pic64gx and its curiosity kit")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609200941.rCvYRNXf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000 (microchip,pic64gx-mss-top-sysreg): compatible:1: 'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000 (microchip,pic64gx-mss-top-sysreg): compatible:2: 'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000 (microchip,pic64gx-mss-top-sysreg): compatible: ['microchip,pic64gx-mss-top-sysreg', 'microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/syscon@20002000: failed to match any schema with compatible: ['microchip,pic64gx-mss-top-sysreg', 'microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd']
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: hss-buffer@bfc00000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
