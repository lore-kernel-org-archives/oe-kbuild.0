Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E581F233939
	for <oe-kbuild@lists.linux.dev>; Sun, 24 May 2026 18:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779648493; cv=none; b=LH9Ch4bmW6kjIBn8sVsT3++DvJsYbbxrttg75ytkR7ZBt5Jx4edtMa6NA9pXQue03zvreAkfh+uHFTnWKeCLumjU3MI+/3n1WzwIHKoOgkRzhwBaDCHwS2SAUFtODjVy7TOU3N4n7HSCTvhF5YPXGaH9ZcPu/QN6IeUPAnxwH68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779648493; c=relaxed/simple;
	bh=LmLNM+Jic4Y2bAKZi8D22D9qzUba3i/n3DGGi3TT4yU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S1Yjev+S/wSmWM0YPyo/zTWbHLj4co14TpYO8LuE2PSvAnuxNIiyT5rHrKhDB0/aABtl6Kd0ehEUvNxzPw5w9HGpkLMl1KyiYA+RxUSyCF/2+e7RHJkXIN+W0hsQEI3mDEY9xauGGGymmcjT+yJVjXA1dWNRGk9WvWh6ys6whYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1SbihvM; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1SbihvM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779648491; x=1811184491;
  h=date:from:to:cc:subject:message-id;
  bh=LmLNM+Jic4Y2bAKZi8D22D9qzUba3i/n3DGGi3TT4yU=;
  b=M1SbihvM3er9t/j1QkIvzxk9rJ707W7AcWwIH6BZKuKirpEP5GC7PATs
   suDeiMAvOoDFfnuHsQXRulKoYqgvK/zMxocVCWZ0rbbohmQzWU1GmZuTS
   s/p1gkHuznaPRb/aGDsHAU3MYO0HbHnSLeG0DZkaE6wUw/K5dvCjkhVTc
   Cqu3V0uOIu+wTH5q2M1fAtmJdKJE/uGoeIYpL8kLevPCnuPFT8O0XbQTB
   axV2ySgPmAk9rkWBMSUKclyBFEExiqsM7oQZBZF7cJhTwlkGz6cugraXr
   xiHSV2aBnp7cK4MwNLZpcgGyKVTNcrc+F7CiPvEL+RvTp1p2tz+oREZGi
   Q==;
X-CSE-ConnectionGUID: MCjgpFwsTnKggswP3NNBIQ==
X-CSE-MsgGUID: 05U+QqCjQQ6pshtCGuvpIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="80539292"
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="80539292"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 11:48:11 -0700
X-CSE-ConnectionGUID: eASvMehFRTKTWiA0zYd/oA==
X-CSE-MsgGUID: Mk7g9lg2RRil3vshIKOsxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="240568048"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 24 May 2026 11:48:09 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRDrq-00000000C2D-44lF;
	Sun, 24 May 2026 18:48:06 +0000
Date: Sun, 24 May 2026 20:47:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dtb:
 wireless-wlan: wifi-poweren-gpio: {'rockchip,pins': [[1, 22, 0, 26]],
 'phandle': 231} is not of type 'array'
Message-ID: <202605242003.LVCbV70o-lkp@intel.com>
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
TO: Liu Changjie <liucj1228@outlook.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Liu-Changjie/arm64-dts-rockchip-Add-LCKFB-Taishan-Pi-3M/20260512-232002
head:   139c4b9d47a4dd486d178247e07cea105592fcd1
commit: 139c4b9d47a4dd486d178247e07cea105592fcd1 arm64: dts: rockchip: Add LCKFB Taishan Pi 3M
date:   12 days ago
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: arm64-randconfig-2055-20260524 (https://download.01.org/0day-ci/archive/20260524/202605242003.LVCbV70o-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605242003.LVCbV70o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605242003.LVCbV70o-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>> arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dtb: wireless-wlan: wifi-poweren-gpio: {'rockchip,pins': [[1, 22, 0, 26]], 'phandle': 231} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dtb: usb2-phy@0 (rockchip,rk3576-usb2phy): otg-port: 'rockchip,typec-vbus-det' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dtb: usb2-phy@2000 (rockchip,rk3576-usb2phy): otg-port: 'dr_mode' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dtb: usb-typec@22 (fcs,fusb302): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
