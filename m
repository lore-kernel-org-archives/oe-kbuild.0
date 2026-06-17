Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD365347C6
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Jun 2026 03:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781665527; cv=none; b=Deyj20mBHBG7jSjCHgr880NmNtmkCO8u5akR67hiYmR8i+VQv4etZuvMj7vuhLcBWZkHVCxmwrxsN/9ERX8K7C16YK76HjzupSPt7OpFbNCU984AUPZnMGjuJW4I+WdJzSxPdT+sTzu7CApq8WjRz4o7YYMWLGIWdeY/l/kVnBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781665527; c=relaxed/simple;
	bh=s1E7jy38fQRui23I7aL1fWlkYIQqMFDAN1Hh+4pHV0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LtzZ/FHutA//yHJD91gMVB/qh2kwibu9WtHbDt+FEAoEmN2i8AhDISAeqqFYcYYkqriooHwCWEmNiD838G+MJiYPVjfBLLbHWAGEd5WbIqE3a5BSayHXh5RbLutfmIXtvV/4jcPO/nV9DU8nWBont22oUiPu+UlpDWZZs5E4WDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XwBy8IQ6; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XwBy8IQ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781665526; x=1813201526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s1E7jy38fQRui23I7aL1fWlkYIQqMFDAN1Hh+4pHV0s=;
  b=XwBy8IQ6CIUKaFplWqGehXFbGY94ZDbqI8uTC8hM8pXcZKe8BIpSAKpy
   87FtUTNXt6orRLxx8rlHXP3Y+kvyB7Lj4x/1tTgElmy2/u8Lqmmc0St5r
   GWs2Lnrq0gMPNjz1B1Xmzob0rcIiZFUOh5sxc9VKSFVOJL3FQQIa8JpHy
   ZD8IwzBO5sQmotBsf73qA4vRSVXLvlFUtOOS269d00nzH9Ch3L5AFBs7s
   gGn2IO5onVhRjuy+9p2fwehrNO+mgduFiW9aH5ANR2HNZHwVk4hNPgP7+
   i69LgHbopSFVvbocCNjUdhTEHGtGGcjYvrIhHLSGzRQW8s+ClGYE3yPrd
   Q==;
X-CSE-ConnectionGUID: qwfnKQBWQU6YC2bP8sHjkA==
X-CSE-MsgGUID: H3fy9vX6T5C9gWbuLayBGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82458835"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82458835"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 20:05:10 -0700
X-CSE-ConnectionGUID: q/GdudzqTziiXvoyeMXz/A==
X-CSE-MsgGUID: /ONQk8j9RyKJ9DnQ5DZ1NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="271662008"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 16 Jun 2026 20:05:08 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZgaQ-000000005I9-1I88;
	Wed, 17 Jun 2026 03:05:06 +0000
Date: Wed, 17 Jun 2026 05:04:20 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 5/5] arm64: dts: renesas: Add LCDC overlays for RZ/T2H
 and RZ/N2H EVKs with ADV7513
Message-ID: <202606170407.U4rBBoaq-lkp@intel.com>
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
In-Reply-To: <20260615115455.1412098-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615115455.1412098-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
TO: Prabhakar <prabhakar.csengg@gmail.com>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: Magnus Damm <magnus.damm@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-renesas-soc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Prabhakar <prabhakar.csengg@gmail.com>
CC: Biju Das <biju.das.jz@bp.renesas.com>
CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Lad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linux-review/Prabhakar/clk-renesas-rzv2h-cpg-Use-per-SoC-PLL-reference-frequency-for-calculations/20260615-190846]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/arm64-dts-renesas-r9a09g077-Add-VSPD-and-FCPVD-nodes/20260615-200213
base:   https://github.com/intel-lab-lkp/linux Prabhakar/clk-renesas-rzv2h-cpg-Use-per-SoC-PLL-reference-frequency-for-calculations/20260615-190846
patch link:    https://lore.kernel.org/r/20260615115455.1412098-6-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [PATCH v2 5/5] arm64: dts: renesas: Add LCDC overlays for RZ/T2H and RZ/N2H EVKs with ADV7513
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2054-20260615 (https://download.01.org/0day-ci/archive/20260617/202606170407.U4rBBoaq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606170407.U4rBBoaq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606170407.U4rBBoaq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: fcp@920d0000 (renesas,r9a09g077-fcpvd): False schema does not allow ['aclk', 'pclk', 'vclk']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: fcp@920d0000 (renesas,r9a09g077-fcpvd): clocks: [[3, 0, 8], [3, 1, 1204], [3, 0, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: fcp@920d0000 (renesas,r9a09g077-fcpvd): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g077-fcpvd', 'renesas,fcpv'] is too long
   	'renesas,r9a09g077-fcpvd' is not one of ['renesas,fcpv', 'renesas,fcpf']
   	'renesas,r9a09g077-fcpvd' is not one of ['renesas,r9a07g043u-fcpvd', 'renesas,r9a07g044-fcpvd', 'renesas,r9a07g054-fcpvd', 'renesas,r9a09g056-fcpvd', 'renesas,r9a09g057-fcpvd']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: fcp@920d0000 (renesas,r9a09g077-fcpvd): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: vsp@920e0000 (renesas,r9a09g077-vsp2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g077-vsp2', 'renesas,r9a07g044-vsp2'] is too long
   	'renesas,r9a09g077-vsp2' is not one of ['renesas,r9a07g044-vsp2', 'renesas,vsp1', 'renesas,vsp2']
   	'renesas,r9a09g077-vsp2' is not one of ['renesas,r9a07g043u-vsp2', 'renesas,r9a07g054-vsp2', 'renesas,r9a09g056-vsp2', 'renesas,r9a09g057-vsp2']
   	from schema $id: http://devicetree.org/schemas/media/renesas,vsp1.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: vsp@920e0000 (renesas,r9a09g077-vsp2): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/media/renesas,vsp1.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
