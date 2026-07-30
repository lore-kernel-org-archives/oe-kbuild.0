Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F25434E3C
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Jul 2026 13:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785417813; cv=none; b=fEkTfghGyo3wBEDET2kF+aELQBR02H+xArlxe9qO6gykCNTr6j6CbIhQXF9KwIEhK156CrnZUrAs2kOGR2K/mT0t58hRznLDx9SSG7Rq6lKbtE68QfV46TLp1IniQw9oOrIgeVTJ44PocVms7RIIt76pyPM2J3msYSTGpNlru2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785417813; c=relaxed/simple;
	bh=pfRXHsv+AGIESn3UP5iJOs1ehHk3xZ5EnK9QlHmOEQA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a7vZky4yX1jFWXQWzsYrz1T9amLsE1DiE1DF5Qrby26SWPhsL1edsdGULkM9XizN+8RJ2cqtt9QjUGb9hr4/rjOhUCm2MWzdC3W6nTNhCo9V2s+U0l0xRg6y+yH1XvQhvL5TZlQVvXL3XgSWKrol76bozrWJwistwD2AV6ynbbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OLHj3nuk; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OLHj3nuk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785417810; x=1816953810;
  h=date:from:to:cc:subject:message-id;
  bh=pfRXHsv+AGIESn3UP5iJOs1ehHk3xZ5EnK9QlHmOEQA=;
  b=OLHj3nukQyQyqqJkKWdCBfXzvPhBYkw1y2h1KE3LGQhgTWmJYOm4gr16
   WAlM0HWb9VZndGtYhoFr3UXIkqdB/biS8hD8hu5YeljPs4oGxIC0gPmmD
   rAezZs03KAOhlR3FDq0h3xk+EpntggfosJP16Ej4VgP/GvVT8IDEgdf/l
   HnPPCOJw47pEQj7emx0hqD0cFZXsR9Dh1zUexeE6fTb6Vf+ExAtqf+SX9
   /atQ6Txw/YIJ1qO/QQ/xnDftT0u2952yvEkj7su/NF2177GQXc8uMcmM+
   ozaxHNjvhMf8z7hAbZCA92dyJ59RIuVPk/zQOm6IQlzMNb0CmbyGOYyO9
   g==;
X-CSE-ConnectionGUID: ihmEOt4YQUKw1nDo1EeOQQ==
X-CSE-MsgGUID: NzUFd9O8QjiaITnkIfedwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85799646"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="85799646"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 06:23:29 -0700
X-CSE-ConnectionGUID: Zr52QbBlSVihXiB0+reU2w==
X-CSE-MsgGUID: lQqIGJ0lRUGpIGKHAfOxHA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jul 2026 06:23:29 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpQjO-000000002Ne-37MA;
	Thu, 30 Jul 2026 13:23:26 +0000
Date: Thu, 30 Jul 2026 15:22:30 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v7.3-armsoc/dts64 43/50]
 arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb:
 /soc/dsi@27d80000/panel@0: failed to match any schema with compatible:
 ['anbernic,panel-vita-pro', 'anbernic,td4310']
Message-ID: <202607301537.71Y51Djh-lkp@intel.com>
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
TO: Chris Morgan <macromorgan@hotmail.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v7.3-armsoc/dts64
head:   6d9430d58714909071853c0949cdc93756aa3ad4
commit: aaed846aa94076aa670c60089a7143a0f43327b4 [43/50] arm64: dts: rockchip: Add Anbernic RG Vita-Pro
:::::: branch date: 21 hours ago
:::::: commit date: 23 hours ago
config: arm64-randconfig-2053-20260730 (https://download.01.org/0day-ci/archive/20260730/202607301537.71Y51Djh-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 9521d0c03324fb5950727522cdf71d94fd3f68b1)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607301537.71Y51Djh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607301537.71Y51Djh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: /soc/dsi@27d80000/panel@0: failed to match any schema with compatible: ['anbernic,panel-vita-pro', 'anbernic,td4310']
>> arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: /soc/dsi@27d80000/panel@0: failed to match any schema with compatible: ['anbernic,panel-vita-pro', 'anbernic,td4310']
>> arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
   arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: /soc/i2c@2ac90000/charger@3b: failed to match any schema with compatible: ['sgmicro,sgm41542']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
