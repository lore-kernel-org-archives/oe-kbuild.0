Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED01E1DE2A5
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Nov 2024 21:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731879100; cv=none; b=G+CtwdVpQbN7RafJ0F2eiPvYIRCgPwSOzfNVuflbcyWodkYP/4dLvpBNGqqKZf6ZZeUA+Suub+hY8wZ4+llbrCXuLMHUH2Rur5Ul6+oiebuHVdNovzCED/oZXgWt17w4ReQfxQNrmIz4UsXqrvK5kZEJp5QWEb3pSqqL+rh/nwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731879100; c=relaxed/simple;
	bh=JCXZikPW7iy1B/3sPVFOLaukimBlGQlMz28ns+kAIj8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RYg+J8MOe5+B6X2YDko20ejYQlMvP1QFda/vp7h82UzNRN81NmN3rtGF92aCOvdNf5NSg1aYTEVWGO5/kU+5afBhygTHtuT+TMvdxGxWd0S1iiiIKzP69BfHOXsouoXKATdBt78PDP7r5F2LFHnzGHyO6O3DOYsPg0O/C8rD97w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bo6+lM7q; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bo6+lM7q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731879098; x=1763415098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JCXZikPW7iy1B/3sPVFOLaukimBlGQlMz28ns+kAIj8=;
  b=bo6+lM7quZdAvQkoNSnU1NcuBulJ0UxGjVARCkHOuaHyFBrmqiKdqFZd
   TYJ6iPBsv+AWb34jYbqzeINlMojgZga+sdv0flomnK6DvKd4gmnReo/rU
   RswOZF7K0d89avO1qXXSIL28ycFIhn6F0VsGxza60lJOHIhkswcv3/uEH
   1e+JN7T3lwZp2paBm6wWpVwASYqh4hSxBDGf5H5RFubYhNQlXU139XLyF
   cpN9bYLBx6VM2SyEQd+UtsVt9MUpzG1bjFBM1JUhkWc6zRs1Ax/Iz5qU6
   2A9mvyx3MZjYJ/p9sYNlnMqRPpW04w1AvN2Pbv56/vx/wd+P8ZQto1vHG
   Q==;
X-CSE-ConnectionGUID: 8zfMXrr+RkCkwemshLq84A==
X-CSE-MsgGUID: TXRV6eRYTweumJbzwmTeSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="42456308"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="42456308"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 13:31:37 -0800
X-CSE-ConnectionGUID: 2NKc4YQ0QViBy/4ujxCiPg==
X-CSE-MsgGUID: jeWU/qxPR+md3aKF0u6h1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="93507245"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Nov 2024 13:31:36 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCmrl-00022r-06;
	Sun, 17 Nov 2024 21:31:33 +0000
Date: Mon, 18 Nov 2024 05:30:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/5] dt-bindings: rtc: pcf8563: Add Haoyu HYM8563
 compatibility
Message-ID: <202411180540.dZDtBfDq-lkp@intel.com>
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
In-Reply-To: <20241113085355.1972607-4-iwamatsu@nigauri.org>
References: <20241113085355.1972607-4-iwamatsu@nigauri.org>
TO: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
TO: linux-rtc@vger.kernel.org
TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: Arnd Bergmann <arnd@arndb.de>
TO: Olof Johansson <olof@lixom.net>
CC: linux-amlogic@lists.infradead.org
CC: Neil Armstrong <neil.armstrong@linaro.org>
CC: Kevin Hilman <khilman@baylibre.com>
CC: Jerome Brunet <jbrunet@baylibre.com>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: linux-kernel@vger.kernel.org
CC: Heiko Stuebner <heiko@sntech.de>
CC: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>

Hi Nobuhiro,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on arm64/for-next/core robh/for-next linus/master v6.12-rc7 next-20241115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nobuhiro-Iwamatsu/ARM-multi_v7_defconfig-Add-RTC-PCF8563-support/20241113-165720
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20241113085355.1972607-4-iwamatsu%40nigauri.org
patch subject: [PATCH 3/5] dt-bindings: rtc: pcf8563: Add Haoyu HYM8563 compatibility
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-051-20241114 (https://download.01.org/0day-ci/archive/20241118/202411180540.dZDtBfDq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180540.dZDtBfDq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411180540.dZDtBfDq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dts:77.32-80.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dtb: hym8563@51: $nodename:0: 'hym8563@51' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/nxp,pcf8563.yaml#
>> arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dtb: hym8563@51: 'clock-frequency' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/rtc/nxp,pcf8563.yaml#
   arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dtb: es8328@10: clocks: [[7, 462], [7, 82]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
   arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dtb: es8328@10: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
   arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dtb: power-controller: 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: '^power-domain@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
   arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dtb: power-controller: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
