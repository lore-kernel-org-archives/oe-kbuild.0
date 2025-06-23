Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25D619049B
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Jun 2025 19:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750706105; cv=none; b=Q+ZhM2Hh84oW3DEmdaY/mAPVc3lXCdf72jehbRFG9cvfDjigl6869+2t4QRbG90vKyZzC9kN05KbI1q/D1JkTGKI8hdoLbjfM/HQkAfxONi3nbBDvy8/7vpefBmuRVJirnCI6ttsuFKpbI0g8hc1AA5Xt2ArYbewFgPLuxh5Y0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750706105; c=relaxed/simple;
	bh=qfTiOJjQA7V8lWIOwzNviVflymlVvdhloaAqx73Rzhs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mu0bGI7xIIxk4wXvSV0TlXgkSt2imapmVLXqhjaFwR9tXKUsqtu+GLTjn+T0sGALq6If+i3wrtVwG1w7q2l2NFufEAsHpOTsds9jm9r7avIkCRe5EoAkveqIo5PMwQaJc/P/q168wHy8TU1eOLvuae28qsprOlG0oLdOcP5PW0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YPWVAzPR; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YPWVAzPR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750706104; x=1782242104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qfTiOJjQA7V8lWIOwzNviVflymlVvdhloaAqx73Rzhs=;
  b=YPWVAzPRqvmD1lfME2bG6P+2h63RMK+BXkJq3Njb95Y75n7ESRphLNzw
   KgJSQrXdesMPUqnU+kTbOJwusi9L4yqL/Yb9lzZMINjTYH/mEiwJLlMpb
   n6Q7zYEMNYCX1/I+GmQxm7VLcrGHlQ8sm5bbnWFIFebT9LByj2z/eCv4g
   K4Mrj1lhE+gkqfem8qd6TBd1c9KP74QGVu+oSLy2kgzV2qfdZmeduTd7P
   yKasSuYRUI2Y0Vyb9epXdTbCnq2XSHGKvv3unf6qfl7P1/BA2K0WIQ4PV
   odTSsdoku6aqjDQfqYHZ8+8rNnw5dE0PXvrzDRWIjF55n/k6cmMNHATtI
   g==;
X-CSE-ConnectionGUID: iuJBdDnVTZ+vkIkbwnnJ1A==
X-CSE-MsgGUID: 27cl1DyEQnC+mmzq8EXTnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52043700"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="52043700"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 12:15:03 -0700
X-CSE-ConnectionGUID: bofnwP6hSHCDldbIizSqTA==
X-CSE-MsgGUID: aqHf6YmLR5ip3wFT36AQ3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="151268856"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Jun 2025 12:15:02 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTmdA-000PFa-0f;
	Mon, 23 Jun 2025 19:15:00 +0000
Date: Tue, 24 Jun 2025 03:14:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: rockchip: use cs-gpios for spi1 on ringneck
Message-ID: <202506240319.lxm8nXj8-lkp@intel.com>
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
In-Reply-To: <20250620113549.2900285-1-jakob.unterwurzacher@cherry.de>
References: <20250620113549.2900285-1-jakob.unterwurzacher@cherry.de>
TO: Jakob Unterwurzacher <jakobunt@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Heiko Stuebner <heiko@sntech.de>
TO: Quentin Schulz <quentin.schulz@cherry.de>
TO: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
TO: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
TO: Dragan Simic <dsimic@manjaro.org>
TO: Diederik de Haas <didi.debian@cknow.org>
TO: Farouk Bouabid <farouk.bouabid@cherry.de>
TO: Johan Jonker <jbx6244@gmail.com>
CC: stable@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Jakob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next linus/master v6.16-rc3 next-20250623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jakob-Unterwurzacher/arm64-dts-rockchip-use-cs-gpios-for-spi1-on-ringneck/20250620-193703
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20250620113549.2900285-1-jakob.unterwurzacher%40cherry.de
patch subject: [PATCH] arm64: dts: rockchip: use cs-gpios for spi1 on ringneck
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250621 (https://download.01.org/0day-ci/archive/20250624/202506240319.lxm8nXj8-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240319.lxm8nXj8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506240319.lxm8nXj8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/px30.dtsi:351.26-371.4: Warning (avoid_unnecessary_addr_size): /syscon@ff010000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/px30.dtsi:453.23-497.4: Warning (avoid_unnecessary_addr_size): /syscon@ff140000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/px30.dtsi:1128.20-1168.4: Warning (avoid_unnecessary_addr_size): /dsi@ff450000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dtb: spi1: spi1-csn0-gpio: {'rockchip,pins': [[3, 9, 0, 150]], 'phandle': 87} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
>> arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dtb: spi1: spi1-csn1-gpio: {'rockchip,pins': [[3, 10, 0, 150]], 'phandle': 88} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
--
   arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-haikou-lvds-9904379.dtb: spi1: spi1-csn0-gpio: {'rockchip,pins': [[3, 9, 0, 150]], 'phandle': 87} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
>> arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-haikou-lvds-9904379.dtb: spi1: spi1-csn1-gpio: {'rockchip,pins': [[3, 10, 0, 150]], 'phandle': 88} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
--
   arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-haikou-video-demo.dtb: spi1: spi1-csn0-gpio: {'rockchip,pins': [[3, 9, 0, 150]], 'phandle': 87} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
>> arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-haikou-video-demo.dtb: spi1: spi1-csn1-gpio: {'rockchip,pins': [[3, 10, 0, 150]], 'phandle': 88} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
