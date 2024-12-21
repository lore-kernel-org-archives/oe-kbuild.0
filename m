Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EBA1A8406
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Dec 2024 09:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734772160; cv=none; b=V9GU7IW0eztFzfiwYGc1iORIgaIb/xFSmvK7Pw4h95REaU+qCadeU8O1/lAg58nQNBqbAOL19lhmgaxX8v5OT2fQb++t9OvLGHiiucbfoCRSGIv4j79ZZELxrgu5S/Im5LOG+tguiSXejl3FkLWINdNvyNQH5eUHEAbXqq07e1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734772160; c=relaxed/simple;
	bh=kWXb4tkbXM/Of2k0jPRgT47YoqRZLthPtljjU9CpdyA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pr5q8h160YYIkmEYs8uvkjYvR+c4TkJ1L3GgKjow3NV5Xy1JNoc0GECELxJmyY0QRfYjppHU3B7Rkgjupnvmvxv1l5RgDk9DPsr9SiU/kk5vfGJ7n9jQiQOdBd6hpWRkbOUZC2MIxY5j6Fp3Fo2kH8Z0lC6dqNBBBJ70sfWXWFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eLE7li84; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eLE7li84"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734772159; x=1766308159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kWXb4tkbXM/Of2k0jPRgT47YoqRZLthPtljjU9CpdyA=;
  b=eLE7li84AYSzaMAKYJLxBWqAIVzyAxwHLRnfrbNuNXA/ymHei3x6SeCo
   FfBdCD3DJOLZcdvJvrnTl07jZBiyXR+32QttGwWgo9qVbUYPfurxqh30z
   E1vRPGaVLgfkKUE+CjcvcjfrLY5/EF2kQfoUP3CxBUrWnMwL/JOeK+WIY
   S5eHuxIgbdCzejdvJGcETwtJRtZB1iriiamLD8eOkBauA8Wlh8tT9dwe2
   RVBe7ubWt9V0VZmQ8u/3+8ytico8ep/zCHgl+i4MeVdqm3GSLhPZcG73O
   3G2KjWWU4Br9wOIy7WlVLOErbCifLP1cQ0HgrXUO8ys+23q7051FUGyxC
   w==;
X-CSE-ConnectionGUID: 8b4QWIyvQ/KjnhcXKKKOXA==
X-CSE-MsgGUID: ZXt/JECQSISQkFVnJTZXeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35195744"
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="35195744"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 01:09:17 -0800
X-CSE-ConnectionGUID: WJk2N5qeS02RdFDm01F8IQ==
X-CSE-MsgGUID: UFJofoF9QTeRfiVJddFzqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="98550632"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Dec 2024 01:09:16 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOvU1-00026N-38;
	Sat, 21 Dec 2024 09:09:13 +0000
Date: Sat, 21 Dec 2024 17:08:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: MECSBC: Add FRAM MB85RS128TY
Message-ID: <202412211600.t3ovGJXX-lkp@intel.com>
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
In-Reply-To: <20241219-mb85rs128ty-mecsbc-v1-2-77a0e851ef19@pengutronix.de>
References: <20241219-mb85rs128ty-mecsbc-v1-2-77a0e851ef19@pengutronix.de>
TO: Jonas Rebmann <jre@pengutronix.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Heiko Stuebner <heiko@sntech.de>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Jonas Rebmann <jre@pengutronix.de>
CC: David Jander <david@protonic.nl>

Hi Jonas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 47f34eab58294d7bb2583f9519b4022e74d56437]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonas-Rebmann/arm64-dts-rockchip-MECSBC-Remove-i2c2-node/20241219-203753
base:   47f34eab58294d7bb2583f9519b4022e74d56437
patch link:    https://lore.kernel.org/r/20241219-mb85rs128ty-mecsbc-v1-2-77a0e851ef19%40pengutronix.de
patch subject: [PATCH 2/2] arm64: dts: rockchip: MECSBC: Add FRAM MB85RS128TY
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20241220 (https://download.01.org/0day-ci/archive/20241221/202412211600.t3ovGJXX-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412211600.t3ovGJXX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412211600.t3ovGJXX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dtb: /spi@fe610000/fram@0: failed to match any schema with compatible: ['fujitsu,mb85rs128ty']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
