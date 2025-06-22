Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C60167DB7
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Jun 2025 10:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750588536; cv=none; b=b7BBuvgqBHUSj7U6SxoGXfTQVN/jzjdkZmsMhVfglx8ivx1deZtc2LYbabDpqI2K260bJXiH1d1VXhuyQ6U8ISiXs+y69Tl4aQ5pE75HeQvCriHscY6PK80JF1w1Rxs8wnGqgL4gnx1hiuQ4MUWV2B0BkWAI+FQi1twMCN0mXSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750588536; c=relaxed/simple;
	bh=SQchC7gTy9EA19SjeFhqZhbZepYMHY5hGMBdL8aTbqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WwNqJ3Msnchy/xkQcqxDFOFIOH9aNf8g5kKQ+SXp4OcDZoGSLYdxYVLPgbZE1G8bql7D4GTH7n7dFmN0Ckh8UecVQEuobSl6NVjFuNmPUcnOLGXtKpOwXjbZYKqdPqBdJJ+MWGcfpZdOCzVkqgDMq3OFkvVdTMLyLgZtStlVEHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XXApWpSe; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XXApWpSe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750588533; x=1782124533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SQchC7gTy9EA19SjeFhqZhbZepYMHY5hGMBdL8aTbqo=;
  b=XXApWpSeLdxZTTwJyMMCZsD/P/63PxgO43dy+RXODCIUWB2No5spEHaJ
   UgzwRc15hKMW57F7hlOWb7Vp9StbtdTIP1xKItxAQFXCZoL5AbP0L88D0
   oSpgzXjRRKw9i8DQbvv4uDk91De8VSojyFG/FU7iButguYiOATL+NCSXi
   VllBtgtWsWajiVF4ohDHniF/vmdWbxckxMVvyRUjARcHOwoGNXu9O3RVk
   AYKulrS0PACRlTbzn7Hu4iunuSZ+rpm5wPXCEUP1UCshzMM+GHy+Tj5iY
   ZvXlzlYwL7AZw53uqHSORp2MFepw5Llis2XAPsKeFmM42q7dp6qfkGipV
   A==;
X-CSE-ConnectionGUID: UbMsUtX7QL6SuO4AbYHliA==
X-CSE-MsgGUID: bBr4KockT0u8m5L+p/kK5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="52888129"
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="52888129"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 03:35:32 -0700
X-CSE-ConnectionGUID: 8Wn+yJToTzqyrPN3oylYgA==
X-CSE-MsgGUID: 5DGKaXh0RJCPJ/yA6c11Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="152006926"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Jun 2025 03:35:32 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTI2r-000ND4-2f;
	Sun, 22 Jun 2025 10:35:29 +0000
Date: Sun, 22 Jun 2025 18:35:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.17-armsoc/dts64 25/34]
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: pinctrl
 (rockchip,rk3576-pinctrl): pwm1:pwm1m1-ch5:rockchip,pins:0:2: 14 is greater
 than the maximum of 13
Message-ID: <202506221808.cKIz701l-lkp@intel.com>
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
TO: Alexey Charkov <alchark@gmail.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.17-armsoc/dts64
head:   7f9509791507bd2aa89281d999cf0c8ad659f93d
commit: a8cdcbe6a9f64f56ee24c9e8325fb89cf41a5d63 [25/34] arm64: dts: rockchip: add overlay for the WiFi/BT module on Sige5 v1.2
:::::: branch date: 16 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-052-20250622 (https://download.01.org/0day-ci/archive/20250622/202506221808.cKIz701l-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250622/202506221808.cKIz701l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506221808.cKIz701l-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm1:pwm1m1-ch5:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch1:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m0-ch2:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch3:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch0:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch2:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch5:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch6:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m0-ch3:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m0-ch4:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: pinctrl (rockchip,rk3576-pinctrl): i3c1_sda:i3c1_sdam1-pu:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: pinctrl (rockchip,rk3576-pinctrl): i3c1:i3c1m1-xfer:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: pinctrl (rockchip,rk3576-pinctrl): i3c1:i3c1m1-xfer:rockchip,pins:1:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm0:pwm0m1-ch1:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
