Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999EA1FC10E
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Feb 2025 10:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740307098; cv=none; b=SX7NLsmyDRjBr9EOCcYBh3GlaPjwWcs72izeMyPcsXeN1ujE8hpjLvscu9IOSCOGvvqhS5BB4oHsEZZCPi5is2bG7KOKad3HBH4tqt9utQHyDiwqmueNV5Fmalfbaeqo9W/NkSsO98UsAXvBg+fPuNXeC7AvhB7aiijJPeYIWG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740307098; c=relaxed/simple;
	bh=Mtp8JpcPbmRs58t911KyhSzaoHumGe600AUpAZKAhPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E1+P3RJOCfszAq8l03KgC11gTeIB3Nmvp+SXow4GTL4XDivzMtx4M++WpuhUWiqKfPw0CKdDuSPSdK/9HdjeDtqr3A/y8RliU/4NHTzu2n8wZf4c3kinznf37CJTNi4ORTvTIMP3WkbBMLfwXvwM7GdL57nWLPV989WkKIW4BkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d2lnLHhL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2lnLHhL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740307097; x=1771843097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mtp8JpcPbmRs58t911KyhSzaoHumGe600AUpAZKAhPc=;
  b=d2lnLHhLmdOe4UreQlwQq9WKshKwrUwCtStpzaFkDAJMbMoQjWCVq85D
   ZdCtZTpWgZJ7mZOfKkfhYTy5I4JsvEqar0NkV/9iz0SjVwZqTSBqgbxak
   Lx7SdGL9Fgncl4rggik9f0IflkNiE2YYAQgCGhA+W5hPzCrzxG6AmAGmc
   lZwi+TKuzMIkl3NGyR/JlR3J0WKrYRAYTfNZScss7+Aw7wRoTSmcS5aqK
   mMag/aPCPIKkHZodgJ3xph0k+pdRj8l/bVQf42N5Ctg7BJkg45GaWxxtA
   9POwbfj0fU2+Nn3lIlo4gtlOL6mPuq2fvR4mQRwrTjWroPTVg6zplLMWN
   w==;
X-CSE-ConnectionGUID: RLBe+qR5QbW0V5G/aSjV3Q==
X-CSE-MsgGUID: 2kmYeBEwS3+CsV49HG3tPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41283930"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41283930"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 02:38:14 -0800
X-CSE-ConnectionGUID: k9lHq/LzR/ybLzbhTTWxDw==
X-CSE-MsgGUID: PwecP/YtSUSuU2fwU0fXng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116280453"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 23 Feb 2025 02:38:13 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tm9N4-0007Gt-2k;
	Sun, 23 Feb 2025 10:38:04 +0000
Date: Sun, 23 Feb 2025 18:37:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.15-armsoc/dts64 27/47]
 arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: vop@fdd90000:
 clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612],
 [31, 603], [103]] is too long
Message-ID: <202502231854.apaOTla0-lkp@intel.com>
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
TO: Quentin Schulz <quentin.schulz@cherry.de>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Dragan Simic <dsimic@manjaro.org>
CC: Jagan Teki <jagan@edgeble.ai>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.15-armsoc/dts64
head:   5c349537e298c9657eaf48e2768b308d04523052
commit: 91abdc6b36e12a2c3a477bde90e9f1dd8c2413bf [27/47] arm64: dts: rockchip: add overlay test for Edgeble NCM6A/NCM6B
:::::: branch date: 11 hours ago
:::::: commit date: 9 days ago
config: arm64-randconfig-051-20250217 (https://download.01.org/0day-ci/archive/20250223/202502231854.apaOTla0-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502231854.apaOTla0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502231854.apaOTla0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [103]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
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
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: /spdif-tx@fddb0000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: spdif-tx@fdde0000: compatible: 'oneOf' conditional failed, one must be fixed:
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
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: /spdif-tx@fdde0000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: spdif-tx@fe4e0000: compatible: 'oneOf' conditional failed, one must be fixed:
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
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: /spdif-tx@fe4e0000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: spdif-tx@fe4f0000: compatible: 'oneOf' conditional failed, one must be fixed:
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
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: /spdif-tx@fe4f0000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: spdif-tx@fddb8000: compatible: 'oneOf' conditional failed, one must be fixed:
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
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: /spdif-tx@fddb8000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: spdif-tx@fdde8000: compatible: 'oneOf' conditional failed, one must be fixed:
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
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: /spdif-tx@fdde8000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [103]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
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
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: /spdif-tx@fddb0000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: spdif-tx@fdde0000: compatible: 'oneOf' conditional failed, one must be fixed:
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
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: /spdif-tx@fdde0000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: spdif-tx@fe4e0000: compatible: 'oneOf' conditional failed, one must be fixed:
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
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: /spdif-tx@fe4e0000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: spdif-tx@fe4f0000: compatible: 'oneOf' conditional failed, one must be fixed:
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
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: /spdif-tx@fe4f0000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: spdif-tx@fddb8000: compatible: 'oneOf' conditional failed, one must be fixed:
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
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: /spdif-tx@fddb8000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: spdif-tx@fdde8000: compatible: 'oneOf' conditional failed, one must be fixed:
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
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: /spdif-tx@fdde8000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
