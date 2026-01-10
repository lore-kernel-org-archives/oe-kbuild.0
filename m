Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8BC1DF736
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 05:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768023334; cv=none; b=DG/9gFB9YAhEl4oV8/nVuEWHi+CYsBHX0YH/EGyfgnR9GVT++FdIhrTq6V5giuR4nn2g3QYeowgl3N9YmkiCOgIJvN37znEibXA6s7pgkBRYD1xy1GSy/zZHmhPQoPNYZagwNtidkusXNXCpbyD2qv+5gCKUECfBmwJ+XAiGX1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768023334; c=relaxed/simple;
	bh=zujfAoWy+GVMDzSRP9ge0/fry7fMFsMfUglAicmOL/U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fY2n2N4M+RXNKn0X1ZYxRiHLSkhPinRSFlrMGu5UEjr6UofpvMdGp8fV5uiYYbrx6toWI3YIuvse37bHEUniWJndAfwZ/luIhhsP2GOiSwfmYK+pz12aPkOsHUYhQ0hE57z6tbf+KlmFnLLQrgPuzVzwEtnp+DtwXYTB+YTy6M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j7cScWxK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j7cScWxK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768023332; x=1799559332;
  h=date:from:to:cc:subject:message-id;
  bh=zujfAoWy+GVMDzSRP9ge0/fry7fMFsMfUglAicmOL/U=;
  b=j7cScWxKIEJLQCOT1BXVLaUWAuOpD3T9Gx4385w12LSwrSlakCKMKSph
   IBE4VoEAJ2uztHJ9YhmlyYFhj2p3cp9FBmx2T32KQOfx7Qu3p+NZ/ro5W
   L8oxanMaRacBDqsGaQdk+gJb7lr7zJJe8KkBQ54POEh+Zd6YsM34iGg1W
   8dWTOXD2eF/C+o0OwKuKVa7RFtp7BevLUU2ji8BntU+Pn56aamjzoY6NC
   vA71nRaEMNlw/qN5K4i+P6ZTPPcxBFtEbddITPsCLOCI52lmjhlg3dGmW
   iLk3wETG4J9esC9Qw1qvbpXl69MGFUTCoENKmJ7ldKQHrjfaj5Pvw3vBs
   g==;
X-CSE-ConnectionGUID: 47ZsedTTSfSNEKqa8dgxKQ==
X-CSE-MsgGUID: PWByBBUSQJCb3aWfEBVRvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69325015"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69325015"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 21:35:32 -0800
X-CSE-ConnectionGUID: wHXAzt+2S4WxYGFLJq6FUw==
X-CSE-MsgGUID: L57sP7BpTs+p51/lC7tWbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="207780305"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 09 Jan 2026 21:35:31 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veRdI-000000002Ek-3NO3;
	Sat, 10 Jan 2026 05:35:28 +0000
Date: Sat, 10 Jan 2026 06:34:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.20-armsoc/dts64 9/40]
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/i2c@2ac90000/eeprom@50:
 failed to match any schema with compatible: ['belling,bl24c16f',
 'atmel,24c16']
Message-ID: <202601100605.uF3k2oco-lkp@intel.com>
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
CC: linux-rockchip@lists.infradead.org
TO: FUKAUMI Naoki <naoki@radxa.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.20-armsoc/dts64
head:   da0de806d8b46238ac3891a894806da4d1c26cdf
commit: e3b12fc3336240e7dee4989b9e8634be3c959c94 [9/40] arm64: dts: rockchip: Add EEPROMs for Radxa rk35xx boards
:::::: branch date: 10 hours ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2051-20260109 (https://download.01.org/0day-ci/archive/20260110/202601100605.uF3k2oco-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601100605.uF3k2oco-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601100605.uF3k2oco-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/i2c@2ac90000/eeprom@50: failed to match any schema with compatible: ['belling,bl24c16f', 'atmel,24c16']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: eeprom@50 (belling,bl24c16f): compatible: 'oneOf' conditional failed, one must be fixed:
>> 	arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: eeprom@50 (belling,bl24c16f): compatible: 'oneOf' conditional failed, one must be fixed:
   		'belling,bl24c16f' does not match 'c00$'
   		'belling,bl24c16f' does not match 'c01$'
   		'belling,bl24c16f' does not match 'cs01$'
   		'belling,bl24c16f' does not match 'c02$'
   		'belling,bl24c16f' does not match 'cs02$'
   		'belling,bl24c16f' does not match 'mac402$'
   		'belling,bl24c16f' does not match 'mac602$'
   		'belling,bl24c16f' does not match 'c04$'
   		'belling,bl24c16f' does not match 'cs04$'
   		'belling,bl24c16f' does not match 'c08$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
