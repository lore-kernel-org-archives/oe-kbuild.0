Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FA937C90D
	for <oe-kbuild@lists.linux.dev>; Sun, 24 May 2026 22:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779662474; cv=none; b=mvj4q8zeVcYD0M7CBz8+8N/uPo6oiyk9XIcCU6IZ66VXTLLc6EweLAnEYFl7CrYItvJDrQnN0U/vRmkd5ILTaLSjYt37/u7W4Ajz040eO8iuUiDyqOU2cijR+qf2nkM5R/8E2dwPZDhjqylyjJ2d/1V5WbiXaPX/pjyrccsI0HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779662474; c=relaxed/simple;
	bh=QDqLyis6J+CuMnQFLZtyt+7Drt4BSXboDPThi99IuWA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cbkOURR12CVbr4MadofPeSNfIdep08Oa6WSlSEeQK91QzGZ9hKPY+sYDJ8SzD8Te7n6H8PBLtKDdW8WRiuliQALTEHlhqmsD0XVdp/fuZQZqCpz7M9sVQeCsYDDTUFVD9eGrUcZT7UDHPXwXKt3UAYMx6ZkX+TYsXNWgCDGTZVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n9qXh0eG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n9qXh0eG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779662473; x=1811198473;
  h=date:from:to:cc:subject:message-id;
  bh=QDqLyis6J+CuMnQFLZtyt+7Drt4BSXboDPThi99IuWA=;
  b=n9qXh0eGqHZFPbcwtZsLdRvGAJGOUs6xaljuI85UGfSYAcWuuuE1TDRU
   Xpq7PxJtZw06QX4gknH4dByyQTDrpbQP2L2CTcjR4GX4cRe5//VawnQRx
   nRueMN9n5zXQhc5Z3HxKtdCvDgldCKI6yFbA5q3+3zYwRqKZXMHekbYD3
   NZf6PMD7VPlkLg6P6cs524zwaHlHAnNuKZ5xxPx/Xsp8rR//OpGttdNg7
   lI5mP6R8Er2vQXrPpptqxn88K0IehXuoRu9YBkFlx057AnjxXPcunBqBf
   UxjbvFQ8ydM+ryO1EhnJlw7n02AlCQsnYtGT7qFvZEchOjbFYR3PZkA4W
   w==;
X-CSE-ConnectionGUID: eL/RbQLhTGaM+xspgrfjQQ==
X-CSE-MsgGUID: oy3FGEopSkWIR73nUWSfKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="80221665"
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="80221665"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 15:41:12 -0700
X-CSE-ConnectionGUID: Plj8lPm7QvOMY5joETKPLw==
X-CSE-MsgGUID: FUdpyGamTzaPHpxhcwTOcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="241511898"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 24 May 2026 15:41:10 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRHVM-00000000C4L-3OEu;
	Sun, 24 May 2026 22:41:08 +0000
Date: Mon, 25 May 2026 00:41:06 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2.dtb: usb@32f10100
 (fsl,imx8mp-dwc3): 'maximum-speed' does not match any of the regexes:
 '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
Message-ID: <202605250008.OrVX9HmX-lkp@intel.com>
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
TO: Paul Gerber <paul.gerber@tq-group.com>
CC: 0day robot <lkp@intel.com>
CC: Alexander Stein <alexander.stein@ew.tq-group.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Alexander-Stein/arm64-dts-freescale-add-initial-device-tree-for-TQMa8MPQS-with-i-MX8MP/20260512-231020
head:   0db6b3dc0bbbc5eced4a287fd5518714157dec29
commit: 0db6b3dc0bbbc5eced4a287fd5518714157dec29 arm64: dts: freescale: add initial device tree for TQMa8MPQS with i.MX8MP
date:   12 days ago
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: arm64-randconfig-2055-20260524 (https://download.01.org/0day-ci/archive/20260525/202605250008.OrVX9HmX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260525/202605250008.OrVX9HmX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605250008.OrVX9HmX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2.dtb: usb@32f10100 (fsl,imx8mp-dwc3): 'maximum-speed' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mp-dwc3.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
