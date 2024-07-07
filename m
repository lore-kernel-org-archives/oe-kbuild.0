Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F1AFBEA
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Jul 2024 12:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720353654; cv=none; b=Ym6mCZl5rSqtpjfKD2/lCjr6qf3tlhqEWXOStCUOwSCiwMZ04DndRfPV7J8QafSj0eA+J82lRWLqOELg25XCVv35SxAODbc/CwXg2BFZH/nLpDdZE+YnedqygY45x0cXP4y4L3T5BKpnollRIgdVDd0eUwyXF4BF9xXqWvRhSBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720353654; c=relaxed/simple;
	bh=cBdvQAc6sVAcSG9wihNJvhDrXlA1ZfGtVj15xFbSQe4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nMm1Y2VoI1QPrzDTxHvZGcrjYu372A1hbsgaBKtIdDXKC9ELVpxxk+H3TVzdD20i2952FkU5Ik9buJPDhN2v0yCrQdb1aMKag9A2Z2p0bbXCpgL+8sAjkSNh33k9FHk4LhpSEngY7O1baXYthr+qWkmaw39f/ApW3HeH6IeV4bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZANAaj3Q; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZANAaj3Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720353652; x=1751889652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cBdvQAc6sVAcSG9wihNJvhDrXlA1ZfGtVj15xFbSQe4=;
  b=ZANAaj3QSKfKtFrVXa4OmeeePfDTYt8jHv5uw1c88YH7QcXb18jg3C5v
   mOfiiHeY6WljpTRMEk/R/qOrQp9uVZBtEVcZykYmHVwOgMNjyNykic+Pj
   /TeuwJKfxQryC53tAj2l9Ay9KwYQdig/Uvd1EA/cYPqKUDSbzsN2r7ZlY
   vB2qA8wBhdu+x47TfnlcfPFtwQuV508kas1JKKwNtgCgxuGtpCCDIRuUA
   lydKy9K/TZuw9rZ/hmIryMoIwF8JYf12SO2+H40fMH3MKYoNUzikYXjcw
   6O9DJ/AsIKjaxL9IfObUL8fwsMFDp+BSM5wOUP4eYg4pKZmlWIDzIz4hI
   w==;
X-CSE-ConnectionGUID: F6T/ybbuSH67Z7AdivXR+Q==
X-CSE-MsgGUID: Fq6kF+wJQcirQbNjsz6UyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="28239797"
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="28239797"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 05:00:51 -0700
X-CSE-ConnectionGUID: zB5hVB/CTXGK6twri5K5eQ==
X-CSE-MsgGUID: IDCfVZI/Sdiq+QiHABhihw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="47987768"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Jul 2024 05:00:51 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQQZT-000Uuw-34;
	Sun, 07 Jul 2024 12:00:47 +0000
Date: Sun, 7 Jul 2024 20:00:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.11-armsoc/dts64 11/54]
 arch/arm64/boot/dts/rockchip/rk3308-rock-s0.dtb: /grf@ff000000/io-domains:
 failed to match any schema with compatible:
 ['rockchip,rk3308-io-voltage-domain']
Message-ID: <202407071934.JxDnfm9l-lkp@intel.com>
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
TO: Jonas Karlman <jonas@kwiboo.se>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.11-armsoc/dts64
head:   0e1ab7efe34b3acc99387a9921123b8fc5f7af97
commit: adeb5d2a4ba47910238b3c4f5fd960cc0c26a98b [11/54] arm64: dts: rockchip: Add Radxa ROCK S0
:::::: branch date: 3 days ago
:::::: commit date: 6 weeks ago
config: arm64-randconfig-051-20240707 (https://download.01.org/0day-ci/archive/20240707/202407071934.JxDnfm9l-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407071934.JxDnfm9l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407071934.JxDnfm9l-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3308-rock-s0.dtb: /grf@ff000000/io-domains: failed to match any schema with compatible: ['rockchip,rk3308-io-voltage-domain']
   arch/arm64/boot/dts/rockchip/rk3308-rock-s0.dtb: ethernet@ff4e0000: compatible: ['rockchip,rk3308-gmac'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
   arch/arm64/boot/dts/rockchip/rk3308-rock-s0.dtb: ethernet@ff4e0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'reset-names', 'resets' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3308-rock-s0.dtb: codec@ff560000: reset-names:0: 'codec' was expected
   	from schema $id: http://devicetree.org/schemas/sound/rockchip,rk3308-codec.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
