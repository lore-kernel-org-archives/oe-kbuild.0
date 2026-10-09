Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260B94EF14D
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Oct 2026 16:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791562312; cv=none; b=KXSwnU8s2QE2zHX1aDluw5OD1z3v8aWGuTzmhl25PMqqiqZiJuUJmu5LWdn+8a3iXOL2A6Uca+c/meMdq1kn56mgjKHgjhGKAbT/fhMtpeFW4ToTpw7DuBEsHercqeQI8QsIBCGiOfJJ53w79ZOhXrXpshZMBQWXXdkHgL57cDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791562312; c=relaxed/simple;
	bh=vV0cwr9zrV2eQqIkaUv4dLk7nO2PL/S2PnFnjL0zQHw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rDoxV8ymKy2E7bHU1V1GzdM5aY4Sl/6GlnyKzon+Qvr8k9B78EKSyN0rNH7CLr288bskk7BaEbbncyvdVdi2eaq9mJr5drX278LT3q4xhIilxPFUjHP4NhhQeQ6KM7M5ilyBuI3rL9kKKib26L5OKZXJCcM5H3tkr9j1exKwr2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W/Yipbwo; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/Yipbwo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791562304; x=1823098304;
  h=date:from:to:cc:subject:message-id;
  bh=vV0cwr9zrV2eQqIkaUv4dLk7nO2PL/S2PnFnjL0zQHw=;
  b=W/YipbwofzqaZj/XcT5c90CqYyWTbPIOE2uO8kfwTSiNBBPO87qNgwMX
   ULC8+KlH2R/8lvwAGCvg8ZyPej0M4EfPGnQguLX4ZnnkvrWomEOb/D5Ag
   McK/0axIFlliC9Vyy6ZzFDTatN0vME5vstgSkvxVW2Oh4JN6rWJL1kjof
   uraeuTENPh99WWRHKluihi81I6DR/BhgvIz7OhAFNZnmG4aX9Yaa7MLnb
   Y5QmGw0K11d9es4+nnE9FL4YEtBH0NG3C52Rka6nViXJr9g4LGz0XaCvq
   QzB5a13ZhGUR4WEursXtVj3sFziglwL7ClmYAWD6J9/iQ4IyXWVkeZNIy
   w==;
X-CSE-ConnectionGUID: RfC2VQ3gSYenAg6ehdVQBA==
X-CSE-MsgGUID: wu993WWbQx61CXBMkWb+1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="265049"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="265049"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 09:11:43 -0700
X-CSE-ConnectionGUID: 8/9256ODQ4qWKDBdflNvuQ==
X-CSE-MsgGUID: BVXj2VVfTAyQsHoCw7SgLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="694404"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 09 Oct 2026 09:11:42 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFDC8-0000000078Z-2Qeq;
	Fri, 09 Oct 2026 16:11:40 +0000
Date: Fri, 09 Oct 2026 18:11:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v7.4-armsoc/dts64 60/62]
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-4k-cam.dtb:
 /soc/video-capture@27c10000: failed to match any schema with compatible:
 ['rockchip,rk3576-vicap']
Message-ID: <202610091816.DoRrALz1-lkp@intel.com>
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
TO: Amin Gattout <amin.gattout@gmail.com>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Michael Riesch <michael.riesch@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v7.4-armsoc/dts64
head:   f204f28bd1fa9b4cf3e47488ba3ba25251aba18a
commit: eea8ce042825cea71009cffc13bf564afaf7dbe4 [60/62] arm64: dts: rockchip: add radxa camera 4k on rock 4d
:::::: branch date: 25 hours ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2402-20261006 (https://download.01.org/0day-ci/archive/20261009/202610091816.DoRrALz1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610091816.DoRrALz1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610091816.DoRrALz1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-4k-cam.dtb: /soc/video-capture@27c10000: failed to match any schema with compatible: ['rockchip,rk3576-vicap']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-4k-cam.dtb: csi@27c90000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-4k-cam.dtb: /soc/csi@27c90000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-4k-cam.dtb: csi@27cb0000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-4k-cam.dtb: /soc/csi@27cb0000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-4k-cam.dtb: /soc/phy@2b030000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-4k-cam.dtb: /soc/phy@2b070000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
