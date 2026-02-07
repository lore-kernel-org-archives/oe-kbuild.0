Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CAB1B424F
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Feb 2026 01:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770426115; cv=none; b=EIyxTd7BBo4VvsRdnVRFpMoMkEn/A1/srehJJ1gQ5pn9o6hRDp7P7isXf1fC3SNg3PD8fnFtQIM6vN0R1l/rGoBIm1f5xJhK80uM/KF8XtOGYO6uSzMY5irUx3ki0VCsvLBNokKAm7v1kNPrsC4XpuzwPykPO/k86a1YrCRnrE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770426115; c=relaxed/simple;
	bh=NB0ny9PdvmGFlXJe2OCPf7brFUuhSxutlez6RHRPODg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lOBW8gdyGk6nyuyWK0c430v79LoWg6YdGBsqVCGUi+Ti20/orUqCnxtdgoyUiDiUgxfF+zPtAjZyMDmw8UzsjXMkkYFCizfrW/rHwFH+igCPWj5PrBiaDup8S45YC5jd3iqcXieIS3x+lwYEQDEEjtQMrh4YQjuj7hcVM7tVdmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DlYq9A8d; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DlYq9A8d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770426115; x=1801962115;
  h=date:from:to:cc:subject:message-id;
  bh=NB0ny9PdvmGFlXJe2OCPf7brFUuhSxutlez6RHRPODg=;
  b=DlYq9A8dSCUt4xPoQvO/pcx6nk3eUnwE9jIIs30mR+Gw/ao0WGsj2U1N
   RK9/ZoaOvVXl3A31RK9u4JU34U6ntDaKJPcO3LoZ9NswXaAdjnYfL6KgK
   ifNJ7Nnf8EHwLy9llGQFDsIbP0G+FHFxwRhOatUkTxJS/lL0vU1a6jLI0
   b5d0IXp+Ir/FQg9I427hmkOthiE7R/vBLKHWxpx3v9A98+E5B7Tndstio
   Ud6P1Qicc95XuuIg2OfLvPtXVlSYoD6QnU4igjqQrUjYS4+0tRCAX/7QA
   etnXQUIok5CtI60hgsIlMGkYJ30IFBK8HXkmv9ATJfQLYpZz9lQJDcgmW
   w==;
X-CSE-ConnectionGUID: 8LWb3o9zS9mbo5moL42s9Q==
X-CSE-MsgGUID: qBuJDwbUToiNDTBJH8KtNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="75486203"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="75486203"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 17:01:54 -0800
X-CSE-ConnectionGUID: uNQuejcmT5mPnmh+gcfXYQ==
X-CSE-MsgGUID: 6QCBjSmHSlysmRODH8B0Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="210778330"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 06 Feb 2026 17:01:54 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voWhr-000000004lR-310A;
	Sat, 07 Feb 2026 01:01:51 +0000
Date: Sat, 07 Feb 2026 02:00:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb:
 touchscreen@55 (sitronix,st1624): Unevaluated properties are not allowed
 ('wakeup-source' was unexpected)
Message-ID: <202602070223.OReB0e4N-lkp@intel.com>
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
TO: Quentin Schulz <quentin.schulz@cherry.de>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Michael Riesch <michael.riesch@wolfvision.net>
CC: Dragan Simic <dsimic@manjaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
commit: eb439f16861a8f1fca2c6d021cf7fce0a7a0ca8d arm64: dts: rockchip: add overlay test for WolfVision PF5
date:   12 months ago
:::::: branch date: 8 months ago
:::::: commit date: 12 months ago
config: arm64-randconfig-2051-20260205 (https://download.01.org/0day-ci/archive/20260207/202602070223.OReB0e4N-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070223.OReB0e4N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602070223.OReB0e4N-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: panel@0 (jasonic,jt240mhqs-hwt-ek-e3): compatible: ['jasonic,jt240mhqs-hwt-ek-e3', 'sitronix,st7789v'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/sitronix,st7789v.yaml
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: touchscreen@55 (sitronix,st1624): compatible:0: 'sitronix,st1624' is not one of ['sitronix,st1232', 'sitronix,st1633']
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/sitronix,st1232.yaml
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: touchscreen@55 (sitronix,st1624): compatible: ['sitronix,st1624', 'sitronix,st1633'] is too long
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/sitronix,st1232.yaml
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: touchscreen@55 (sitronix,st1624): Unevaluated properties are not allowed ('wakeup-source' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/sitronix,st1232.yaml
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: /i2c@fe5a0000/touchscreen@55: failed to match any schema with compatible: ['sitronix,st1624', 'sitronix,st1633']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
