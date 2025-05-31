Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF49BCA52
	for <oe-kbuild@lists.linux.dev>; Sat, 31 May 2025 01:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748654180; cv=none; b=OzoYtQ1Mgvklmg++GxT9dpXEVUc5Tj/xAlga6TJTkHpHlUyhU/Aw1dCDoUnGAEaV758AfVf/eX4w++xyvqdgmMx44I9KKp6Y3EHv4qhbWyHG9ZdscTKGWdmWYt8QsMnsatAvLrn0H96NZ6Z44C1eQltjeJbDDOf9d6gBckUwJ8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748654180; c=relaxed/simple;
	bh=OlLelPz2AS45C+LMdzz0BdHwu52FisbAuAD1N7euXZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WrzeycNfO1EHbyMOJiqZYwUMYAe1bAAxz1N3EYkv96DlMtxsVKxDjV8Fw9Zm1XC+XAZOp8PhvIYao6Ojf6w9veLNtN3CHGH7m8wEsgrRku2ESUnFy4H9P2qIKJozCFhFUC+6/sRS9zqqVCLzTLULsSh1SxoDlSIKI4JSWPkT/uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fTI3kEoV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fTI3kEoV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748654179; x=1780190179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OlLelPz2AS45C+LMdzz0BdHwu52FisbAuAD1N7euXZo=;
  b=fTI3kEoV81Pq4P4X6+vxP0aOrmeuLNR75/Let1EOb6iVh4J+zwQXoL/j
   gKfxd1ye/r7nXwN/8zdv/YND/BKn9opjypJ+eTdy3Lp3zZCIlolaJuat6
   v2VxZt08JD4N9ktGqi8IfCGmOIWyOqZ6Nwl19H3YufwCnUIGdrmnQ+3u4
   HRfx38bJXszhzgXTm4Y5tywvlc6y5M0IXQi679OXS+DE53Q/iMtyN/b2C
   zDC2633Gr2Opoy4B4swqsYugKa7bNxeLFL4PVpXLkSH+eyHxNxAVUfId0
   4NsueGpc2NFHm/Z69yVkkgz+s/NL1T0379lof8g62A2aXXpjA8e42cGsx
   g==;
X-CSE-ConnectionGUID: DP4Vo01XQliEXEt963dmuQ==
X-CSE-MsgGUID: tu2WAW/XSeirL5vQf1/YDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="68304283"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="68304283"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 18:16:18 -0700
X-CSE-ConnectionGUID: Dq6+Iu30Qk+vM0LB8VBbAA==
X-CSE-MsgGUID: AtMwD5rNSGSspCTeBHBteg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="167211340"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 May 2025 18:16:17 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLApa-000Y6a-37;
	Sat, 31 May 2025 01:16:14 +0000
Date: Sat, 31 May 2025 09:16:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:master 16/33]
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: gpu@14850000
 (renesas,r9a09g056-mali): compatible: 'oneOf' conditional failed, one must
 be fixed:
Message-ID: <202505310947.XYXysW0l-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
head:   0cc4c9c39e8953745481c13288a46edc616dc7cd
commit: 8df5edc13b50c44f75c4148a9ea4b78aa120d71a [16/33] arm64: dts: renesas: r9a09g056: Add Mali-G31 GPU node
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-051-20250530 (https://download.01.org/0day-ci/archive/20250531/202505310947.XYXysW0l-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505310947.XYXysW0l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505310947.XYXysW0l-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'renesas,riic-r9a09g057' was expected
   	'renesas,riic-rz' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,riic.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: i2c@11c01000 (renesas,riic-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,riic-r9a09g056', 'renesas,riic-r9a09g057'] is too long
   	'renesas,riic-r9a09g056' is not one of ['renesas,riic-r7s72100', 'renesas,riic-r7s9210', 'renesas,riic-r9a07g043', 'renesas,riic-r9a07g044', 'renesas,riic-r9a07g054']
   	'renesas,riic-r9a09g056' is not one of ['renesas,riic-r9a08g045', 'renesas,riic-r9a09g047']
   	'renesas,riic-r9a09g057' was expected
   	'renesas,riic-rz' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,riic.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: gpu@14850000 (renesas,r9a09g056-mali): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g056-mali', 'arm,mali-bifrost'] is too short
   	'renesas,r9a09g056-mali' is not one of ['allwinner,sun50i-h616-mali', 'amlogic,meson-g12a-mali', 'mediatek,mt8183-mali', 'mediatek,mt8183b-mali', 'mediatek,mt8186-mali', 'realtek,rtd1619-mali', 'renesas,r9a07g044-mali', 'renesas,r9a07g054-mali', 'renesas,r9a09g057-mali', 'rockchip,px30-mali', 'rockchip,rk3562-mali', 'rockchip,rk3568-mali', 'rockchip,rk3576-mali']
   	'renesas,r9a09g056-mali' is not one of ['mediatek,mt8195-mali']
   	'renesas,r9a09g056-mali' is not one of ['mediatek,mt8188-mali', 'mediatek,mt8192-mali']
   	'mediatek,mt8192-mali' was expected
   	'arm,mali-valhall-jm' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: mmc@15c00000 (renesas,sdhi-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,sdhi-r9a09g056', 'renesas,sdhi-r9a09g057'] is too long
   	'renesas,sdhi-r9a09g056' is not one of ['renesas,sdhi-mmc-r8a77470', 'renesas,sdhi-r7s72100', 'renesas,sdhi-r7s9210', 'renesas,sdhi-r8a73a4', 'renesas,sdhi-r8a7740', 'renesas,sdhi-r9a09g057', 'renesas,sdhi-sh73a0']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
