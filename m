Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB87F1E32BE
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Mar 2025 06:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740898591; cv=none; b=Knpe49OggjEn3P2SAkb8V+/fKdi1ZvvvLHBIT7W7jAoDVuYNXxhtP+IW/L3FL1QBYDt4cuRrf/V3N/c5A0NZXM2MJO9e015iGnMJOP+c4llpDWu3jZI4UBEg5gu62bPSVrHiQ+nmSxnVD8aLRIr1M1orruRS5/JyYzX3LETNCxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740898591; c=relaxed/simple;
	bh=iytZKQIBKzWZqaHh8w/yex0LghLahwfUi86Jby841v8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=prg1ZEbCMticxODtfvom7ok4zFyfjT4nTjac8ZBboS782NJ3bDlwYZMwP9Bp3YbfbzZeO1mKL4bGNQ7xZSwcrqUMfj+4IQI9WdwFBF8ODXvKSOvOrfMLylreGXYgWd7AiutZIjXkCY5Qal7x0/oUKRG9r74z4zilKKTgyTHvL38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EyOwEY1g; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EyOwEY1g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740898588; x=1772434588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iytZKQIBKzWZqaHh8w/yex0LghLahwfUi86Jby841v8=;
  b=EyOwEY1g/bf0Op6H4xv1fzvpnW4P0fbIqjcqYXm9LWy3ea7dG2RVz52V
   favP8y7oOJ6SKLjuestexcRJAVffnr5zfD7V3B/pO6SB+8fARHYq93apg
   KwerC2+ZDgGgdoDuYvrQUX1hra8J1zmukFB9DIX+8wDTDGPbqvoW9KKOx
   jdjkNv+avO9/OZTSAm157X8Kw6SMLgVsXerrLGy0mvmzdzdvoXLWXM3h8
   OVZA5xpoTUrpFpdM2eMVXNukrmTQ59dgKOGbIY8HMywqi9timvOCRBaUV
   Ora8EigklJq/Zrd/uLN35x95nO7s1LsE/JDq2c8Wl89KgE0N+7jijd2T2
   Q==;
X-CSE-ConnectionGUID: vbLOO9W+Sgmqrz+M7CxOYw==
X-CSE-MsgGUID: JLbZ7VAmTIi1ICMKJIEv5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="52772821"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="52772821"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 22:56:28 -0800
X-CSE-ConnectionGUID: VtnzlJkgRdiktp283a+9jw==
X-CSE-MsgGUID: h8kMv5OgR7mqJwMbjZS9ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="118205049"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 01 Mar 2025 22:56:27 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1todFQ-000H94-2f;
	Sun, 02 Mar 2025 06:56:24 +0000
Date: Sun, 2 Mar 2025 14:56:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.15-armsoc/dts64 38/64]
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/otp@2a580000: failed
 to match any schema with compatible: ['rockchip,rk3576-otp']
Message-ID: <202503021418.cnBUu9EI-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
TO: Stephen Chen <stephen@radxa.com>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Detlev Casanova <detlev.casanova@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.15-armsoc/dts64
head:   c55c9e91d1643493d0434f246917aea7a2653e0f
commit: a0fb7eca9c099867596cbd1a44cc740882bdcbbe [38/64] arm64: dts: rockchip: Add Radxa ROCK 4D device tree
:::::: branch date: 33 hours ago
:::::: commit date: 7 days ago
config: arm64-randconfig-051-20250302 (https://download.01.org/0day-ci/archive/20250302/202503021418.cnBUu9EI-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021418.cnBUu9EI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503021418.cnBUu9EI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1816.20-1882.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/otp@2a580000: failed to match any schema with compatible: ['rockchip,rk3576-otp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
