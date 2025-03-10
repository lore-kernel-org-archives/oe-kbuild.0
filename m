Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C5622154C
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Mar 2025 13:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741614047; cv=none; b=rPNBsN6shmVZqjEJm0wIeMMlBpXHpTxHI1C0DmhHmR9sQC6iW5WMk11Tzj1m54wv5pZvIdNj0QKX87GAD1jckPdRy0Qu36hCrsw2CLuG1V81EjKdH0ukKjfOC1QhLI6EM0np+QqgwsQ2yyFkX85xnsBq/JeDM9b7bHNmrcSr5b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741614047; c=relaxed/simple;
	bh=f1jMhB9b+MhPuLUpFCQZsRuaDi67uNABoTZvI4bTsCE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zg0MOOygCj7CZkciz9Ipqj4wy3TnUCxaZTA+QlMl2melkuP8mgzOrL8yannPAzyElb4oLskOBPezysQpWpKYwJqIbTziI9tc8cw8R4hNQkGewzh7RW4yxjxYq+7F4wsJDH2iXi/ulT5I9wQ4/dfDcQ6TruSot7gzDKUUE2OAYUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vjy9nCo5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vjy9nCo5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741614046; x=1773150046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f1jMhB9b+MhPuLUpFCQZsRuaDi67uNABoTZvI4bTsCE=;
  b=Vjy9nCo576av/uKkwU5mhnNGhAiT4x6+Mej6fOARoxjW1q9moKzt9pKo
   LXMAlmYkpChrjvHmJbfHH5VXMryxumE2fXcC5g7Hfwgy5EMGyKgmRNrJ2
   ruugmcuxU9xuL/VNQAdMe5qqk/cd1IRzgImkv3/ZvBxynjMBRivBweI+p
   Ehj7lBS8rh/eNEd1kFjPw95wnHYfeXj7n7kyi7CNAbXuanpkwTsQJQXFv
   +XyfqAmbxIzyA+9C1IIEe0Sq+9gTDe6QDLS3m6XMRxmyH16OAjQH0aBjB
   XYqakAOQzEuLOWzEbr5vDUJr1PyvebbARpCkG7V+hXfwhvpE5ygMdQcBQ
   g==;
X-CSE-ConnectionGUID: FGcW+EUxSwCNzzpegCBz8Q==
X-CSE-MsgGUID: ZyEGntNfSC64Fjf+w8i+Sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="45401281"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="45401281"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 06:40:43 -0700
X-CSE-ConnectionGUID: VbKGoULtQBOfNx4AUDZUEg==
X-CSE-MsgGUID: WSG0Y9epTIydUYr4jazxDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="150792991"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 10 Mar 2025 06:40:42 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trdN1-0004Hk-1V;
	Mon, 10 Mar 2025 13:40:39 +0000
Date: Mon, 10 Mar 2025 21:40:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.15-armsoc/dts64 70/89]
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/vop@27d00000: failed
 to match any schema with compatible: ['rockchip,rk3576-vop']
Message-ID: <202503102106.4vdVfuP8-lkp@intel.com>
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
TO: Andy Yan <andy.yan@rock-chips.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.15-armsoc/dts64
head:   ba82f56bbf20e4166c988621cd0507509872848e
commit: d74b842cab0860e41a45df0dac41e4e56202c766 [70/89] arm64: dts: rockchip: Add vop for rk3576
:::::: branch date: 2 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-051-20250310 (https://download.01.org/0day-ci/archive/20250310/202503102106.4vdVfuP8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503102106.4vdVfuP8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503102106.4vdVfuP8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1884.20-1950.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/vop@27d00000: failed to match any schema with compatible: ['rockchip,rk3576-vop']
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/otp@2a580000: failed to match any schema with compatible: ['rockchip,rk3576-otp']
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1884.20-1950.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/vop@27d00000: failed to match any schema with compatible: ['rockchip,rk3576-vop']
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/otp@2a580000: failed to match any schema with compatible: ['rockchip,rk3576-otp']
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1884.20-1950.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/vop@27d00000: failed to match any schema with compatible: ['rockchip,rk3576-vop']
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/otp@2a580000: failed to match any schema with compatible: ['rockchip,rk3576-otp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
