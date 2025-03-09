Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659A93208
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Mar 2025 21:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741555764; cv=none; b=MeWDznV//LWJtg5RQHZ1vggR3Eb3vnXF377dBsEGjv2BE0lIFo66utl5qVZv84jAY+WiKatSr3oRwVyfoshiZveiYe6wlAvod/NXSuOruZTUDlzAbODR/ZdYxd45G1/+OFENe/HaEnFggKyquDE6EOL2Pjjgpfhqs+vo2upVpi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741555764; c=relaxed/simple;
	bh=nMrzXrbXT5qE7WzEdbKt5Y7jJcyMTrViNPG3g1vhv84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GPyCVa/4aonfuP9IV0i9K8kPVCBiQKKSb9fQ/WjeW1YJL3vH8LFFZ2jYF7/Hwb1QKFhX8jV1Z94c/MzuUh64jXvVF6Mh8qoHkiWGHboEefgGRcyUoH3TTMGFws1l3yXrpOMfgHu2Y9OWLPePLXcjczotMAwNe/SUZAOMHFvPZ1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OeQO9Yxq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OeQO9Yxq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741555762; x=1773091762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nMrzXrbXT5qE7WzEdbKt5Y7jJcyMTrViNPG3g1vhv84=;
  b=OeQO9YxqPHttVphtzowRl/QsJELJDQnaxB21W9fqcFP9Vvp/d+hQB5Xm
   YwiJscwH6RmDlsfuUWUYBwdyDe0A12ZWmbnmsxBQjCc3eys0rThNNHxvm
   u13FpBOqJwmY1yFtZKHZpGaNipwbO8GpLS7rJSc2sg2MS6tIU1Eexm+LY
   nBTgnvNk5KEPuANEWBblSsvUafHV+OhBEwU2//iJ3GYjbppfaeCmeg+9k
   K8y4Lg8SzZMSioeOX9/JhQlWQ0mRVVQI9lCBGrgdP+Xa5HGn79fdIXLE3
   VgN2L09Te+4mH6Bd/tWjyjFAUrFnmMiWpNHYsCyLULQlnIjgqH2A65hJR
   w==;
X-CSE-ConnectionGUID: uyBL2JQrSFW5mTVgrvYR8g==
X-CSE-MsgGUID: 0gnac/xJTumFxUiK0uOY4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="41706971"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="41706971"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 14:29:22 -0700
X-CSE-ConnectionGUID: U5Q8huugT8mFcrAeIKxbRQ==
X-CSE-MsgGUID: A8bHyr2ERk+bSVJEiX2bVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120719933"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 09 Mar 2025 14:29:21 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trOD0-0003U0-1C;
	Sun, 09 Mar 2025 21:29:18 +0000
Date: Mon, 10 Mar 2025 05:29:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.15-armsoc/dts64 77/89]
 arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: spdif-tx@fddb0000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202503100528.KDsy8T5o-lkp@intel.com>
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
TO: Patrick Wildt <patrick@blueri.se>
CC: Heiko Stuebner <heiko@sntech.de>
CC: "Lukas F. Hartmann" <lukas@mntre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.15-armsoc/dts64
head:   ba82f56bbf20e4166c988621cd0507509872848e
commit: 5324af2d029d47a39ce22ae1613e2753e5e372a2 [77/89] arm64: dts: rockchip: add MNT Reform 2 laptop
:::::: branch date: 28 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-052-20250308 (https://download.01.org/0day-ci/archive/20250310/202503100528.KDsy8T5o-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503100528.KDsy8T5o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503100528.KDsy8T5o-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [106], [107]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
   	'rockchip,rk3588-spdif' is not one of ['rockchip,rk3128-spdif', 'rockchip,rk3188-spdif', 'rockchip,rk3288-spdif', 'rockchip,rk3308-spdif']
   	from schema $id: http://devicetree.org/schemas/sound/rockchip-spdif.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: /spdif-tx@fddb0000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: spdif-tx@fdde0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
   	'rockchip,rk3588-spdif' is not one of ['rockchip,rk3128-spdif', 'rockchip,rk3188-spdif', 'rockchip,rk3288-spdif', 'rockchip,rk3308-spdif']
   	from schema $id: http://devicetree.org/schemas/sound/rockchip-spdif.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: /spdif-tx@fdde0000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: /rng@fe378000: failed to match any schema with compatible: ['rockchip,rk3588-rng']
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: spdif-tx@fe4e0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
   	'rockchip,rk3588-spdif' is not one of ['rockchip,rk3128-spdif', 'rockchip,rk3188-spdif', 'rockchip,rk3288-spdif', 'rockchip,rk3308-spdif']
   	from schema $id: http://devicetree.org/schemas/sound/rockchip-spdif.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: /spdif-tx@fe4e0000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: spdif-tx@fe4f0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
   	'rockchip,rk3588-spdif' is not one of ['rockchip,rk3128-spdif', 'rockchip,rk3188-spdif', 'rockchip,rk3288-spdif', 'rockchip,rk3308-spdif']
   	from schema $id: http://devicetree.org/schemas/sound/rockchip-spdif.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: /spdif-tx@fe4f0000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: spdif-tx@fddb8000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
   	'rockchip,rk3588-spdif' is not one of ['rockchip,rk3128-spdif', 'rockchip,rk3188-spdif', 'rockchip,rk3288-spdif', 'rockchip,rk3308-spdif']
   	from schema $id: http://devicetree.org/schemas/sound/rockchip-spdif.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: /spdif-tx@fddb8000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: spdif-tx@fdde8000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
   	'rockchip,rk3588-spdif' is not one of ['rockchip,rk3128-spdif', 'rockchip,rk3188-spdif', 'rockchip,rk3288-spdif', 'rockchip,rk3308-spdif']
   	from schema $id: http://devicetree.org/schemas/sound/rockchip-spdif.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: /spdif-tx@fdde8000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
