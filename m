Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5FFB641
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Jan 2025 03:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737343261; cv=none; b=rpOlI3XvKgz+51ZLYmY7MpkMxtUBJZjRXmuiPpg6in7UO7FxNZMgrgH/uqv4OR2dDGOHCpevyWJ98ZjI4NGQzrvr8lRORbJHV3C4Mwanfe7ZQOBWX4Ss9jZACT9zLB0dbdleHBLMDcGbPl+yG5848U3GYyXSPzDPQtPcOk76YmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737343261; c=relaxed/simple;
	bh=dpN0ybrRhajpAGlMMb2j7bhZVaeKiU5K6bProjlIy/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZbF9/9hC1IaNuE6Mlf5U5vSZsPKKQMVOWPC+pGoBQAULVR8R1Z29vaIkL+GcDLh/9c6Slwf2hNTAC5T91b1EZslOSuTyeRJB72lOebGgA59hOaj23BSlrxLkJV1Xpjgehy/1xMnjx65XFtp3x5+YxUP8iCGGCZmZfK02ig3SkBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RiXIDn2L; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RiXIDn2L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737343259; x=1768879259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dpN0ybrRhajpAGlMMb2j7bhZVaeKiU5K6bProjlIy/k=;
  b=RiXIDn2LqbuL80Gc+FE1QPNyR2ZwsusqA1EIHbhd9yfQSznWYXn8nvet
   gBL3z+t0aY3e+GG0qgbKX0kbTkv5wLAzH1Xm8RH2Wex+Ftt7jd6VBNPM5
   PqPgbexCPdW8eGe5N3WRADgwnoV8jksreJBEijARMo4TgXP4q5BNm4bm/
   67aZ0mcZCUPqfp8WN49BVM/ujRMaYd1C/WK0Q/S3B2tYggzMmt2qAGoE+
   fxpFV7/ArNiTdgxCAng57kt9ixhJdfFSBX6W6pcE1RBzL5HTfeg6O0Tba
   XpDmo7FDUw3bRpAmZ11aRCH7ifYFE3pfg53K/CIXh+Ly9rzVSidh/AHlC
   w==;
X-CSE-ConnectionGUID: aK+Cn0waS9KhTLv/ppj5OQ==
X-CSE-MsgGUID: zcBFjn7WSp+VUGZ4CFsMvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37577941"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="37577941"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 19:20:59 -0800
X-CSE-ConnectionGUID: bMM/Y1iYQBaG6awbRcUBQQ==
X-CSE-MsgGUID: fVVxh+UmQqyYKF2Vbf3PPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="106163995"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Jan 2025 19:20:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZiLQ-000W7b-0i;
	Mon, 20 Jan 2025 03:20:56 +0000
Date: Mon, 20 Jan 2025 11:20:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:mtk-wip 12/48]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: sound: 'model' is a
 required property
Message-ID: <202501201108.inLxM3AR-lkp@intel.com>
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
TO: "Chen-Yu Tsai" <wenst@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mtk-wip
head:   a2f8143f6e1e6b3d8dac24f675646fbfdfc03202
commit: a6b000ff89b3dcf151de9d173be1132eef0620e6 [12/48] arm64: dts: mediatek: mt8186: Merge Voltorb device trees
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-053-20250117 (https://download.01.org/0day-ci/archive/20250120/202501201108.inLxM3AR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501201108.inLxM3AR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501201108.inLxM3AR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: spmi@10015000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
