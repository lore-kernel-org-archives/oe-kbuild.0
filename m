Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94D3236A73
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 10:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769251738; cv=none; b=rB0qKrMm7YeBB/ALSkPKzLtEMXW3jg3n0Wyod7jYUrmUqhSM1h6jj1SaAdBrB/aRUyCKKcvVhEaxBtwH8EQobeSb637UwQu4JDx+DC0XmfX7701XMjNx4yJ2uTZQdJmsZ2xt6BjVvgG6HjJNKvPMIOv5Ew9oRjGCTxrjqRkAybw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769251738; c=relaxed/simple;
	bh=aZJd/+MYPdxkirWEwobxl6RYt3CzOoYxSmC+UrW01EM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZY9reGCJTSn4RNjDAVUNPCtlrtFg6Uq6cUqbEe060MgSebUfJNDyxEIPJUf9rJOdy5SeSDzJkjfRppiMdqhxI+jmtDyhNRFOhWbc3Y+V4lvu9NN9SBVWnRLOokY6BanL3Eh8YIaYUUTCoj5lu1bVmwloj+cK6HQjmsN+wKNhcKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYeuOIHX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYeuOIHX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769251736; x=1800787736;
  h=date:from:to:cc:subject:message-id;
  bh=aZJd/+MYPdxkirWEwobxl6RYt3CzOoYxSmC+UrW01EM=;
  b=XYeuOIHXjhOfYoor5ZI4Pnh85T+05tuAvp00SmCoYCyGLxmR476aVyQu
   dgmqnqSGpI33gL3s5AC/uhAy7s/UV5w63X66MsFbWhlCCDwwS37YZ/eQP
   VyDatKUAVkiBq0CdgU6mau6wiyH8DjRJKQdyKUcnPB1CXkMjYCvB88I33
   YVA4QuFySUmiKGESYfbQnK/H6okapeG1aiQAV0fIfPOwtRwj8E2gxCzfU
   s9Qzq2yk4nrz0FCem9QeoRVd26yXn0iCS6DajzaOWDZL7SSdZe5soe4sM
   IID8+TNRKErjP5NxtF0P/tLsWVBhIoHKPuF2RuuAClyUVSAL5PiJjHT96
   w==;
X-CSE-ConnectionGUID: tbMBYUy9RvO37D3PGCUvCg==
X-CSE-MsgGUID: rVk1qOveTLWSmPAPg1WLaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70575271"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="70575271"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 02:48:55 -0800
X-CSE-ConnectionGUID: ukGjOKstR1KH0FTeU+A6wA==
X-CSE-MsgGUID: dd4b3eO1RAKhNoAXZiSE9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="207586958"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jan 2026 02:48:54 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjbCF-000000000wn-47cw;
	Sat, 24 Jan 2026 10:48:51 +0000
Date: Sat, 24 Jan 2026 11:48:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:renesas/dt64-2 38/48]
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb:
 pinctrl@10410000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a
 required property
Message-ID: <202601241132.w1CsZekm-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git renesas/dt64-2
head:   145a2a9e27562926c592645a05d682fe8e1f82e9
commit: 3d6c2bc7629c8b1bfd75416767122096bb75ba7b [38/48] arm64: dts: renesas: Add CN15 eMMC and SD overlays for RZ/V2H and RZ/V2N EVKs
:::::: branch date: 7 months ago
:::::: commit date: 7 months ago
config: arm64-randconfig-2052-20260123 (https://download.01.org/0day-ci/archive/20260124/202601241132.w1CsZekm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601241132.w1CsZekm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601241132.w1CsZekm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: serial@11c01400 (renesas,scif-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,scif-r9a09g056', 'renesas,scif-r9a09g057'] is too long
   	['renesas,scif-r9a09g056', 'renesas,scif-r9a09g057'] is too short
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r7s72100']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r7s9210']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a7778', 'renesas,scif-r8a7779']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a7742', 'renesas,scif-r8a7743', 'renesas,scif-r8a7744', 'renesas,scif-r8a7745', 'renesas,scif-r8a77470', 'renesas,scif-r8a7790', 'renesas,scif-r8a7791', 'renesas,scif-r8a7792', 'renesas,scif-r8a7793', 'renesas,scif-r8a7794']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
