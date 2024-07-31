Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4190638F83
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Jul 2024 18:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722450599; cv=none; b=i0b3XP3F2PUbk8ZVleqk3ZFNvggsb+kfqmzFcnS6UTQPS7757zcIrWCPZ1exkUP1YqqiWEzo0sUxh9CdS7JFg6mc6u5SgeKQrWu/PRIBZzUfrWtHvwVoyNY2tlm7AwDU8u36W3yIJLEsVyxrlvz9xUlp3my9kfhTEuTNHSzMOnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722450599; c=relaxed/simple;
	bh=q4a+tNBpmbPkc4xWtJwkWyfjBuxPUwE7R9gyxQgxJx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gRPY8toYtM++U9hLEeYfQz5NbQNO9D8u8FQaZOJ40wWBnFfbp3NyTdqAQ2qKx6L5EnvAxgMHhTZowZ3Ap3qyYBF6vsJ2QxiYVzcYrZhjlOGsbkCwK55QlVbWfwM8NIbgzxypvRYbZ5DV6/xaUvGZDCfj/pQaZz7xQod2IhTukuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=emZHu+4e; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="emZHu+4e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722450597; x=1753986597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q4a+tNBpmbPkc4xWtJwkWyfjBuxPUwE7R9gyxQgxJx0=;
  b=emZHu+4erfC6Uua+sQcimviHsofD2XxOwiwpNHO7hI1ppwqjv0IOnzPY
   Hw3xTlwUXypolQ1TkqrprYiPQu1CcevgYM3plFHXXWzLHV9CKjLwCxcL3
   jptJ3rEVFu5xxUJkPI7fn11EgSbp1pcA48K4QFxil/BHklOLf3bNrgmFa
   Dyt9hcywJY7T/0PYwI5TUSopVIi/N2JlYRLyXHNhww4dNK5NkIxgKReFZ
   ePSE9UnWRAfLTutZaX3tVSV/VkOmSRdr2sg4mqaQdBsYT01hQ2h+0i9OI
   GKpM8W9QWPA3homOErHsJt+1JbMvhiafsbMpNnLG3TjwxaTRQ8gVgeV2C
   Q==;
X-CSE-ConnectionGUID: bcw1cX5hRoa8RloM90lZ0A==
X-CSE-MsgGUID: C+8wijMzRUOXXnHIDkoqwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="30984056"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="30984056"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 11:29:57 -0700
X-CSE-ConnectionGUID: orKwSaw7SReherfocHc6Pg==
X-CSE-MsgGUID: paScBs65RhW2xZHY5pZfyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="58908726"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Jul 2024 11:29:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZE5B-000uhs-1t;
	Wed, 31 Jul 2024 18:29:53 +0000
Date: Thu, 1 Aug 2024 02:29:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.11-armsoc/dtsfixes 4/4]
 arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: pinctrl: gpios:
 {'bios-disable-override-hog-pin': {'rockchip,pins': [[3, 29, 0, 188]],
 'phandle': 183}, 'q7-thermal-pin': {'rockchip,pins': [[0, 3, 0, 187]],
 'phandle': 182}} is not of type 'array'
Message-ID: <202408010214.6AK5dSn9-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.11-armsoc/dtsfixes
head:   741f5ba7ccba5d7ae796dd11c320e28045524771
commit: 741f5ba7ccba5d7ae796dd11c320e28045524771 [4/4] arm64: dts: rockchip: override BIOS_DISABLE signal via GPIO hog on RK3399 Puma
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: arm64-randconfig-051-20240801 (https://download.01.org/0day-ci/archive/20240801/202408010214.6AK5dSn9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408010214.6AK5dSn9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408010214.6AK5dSn9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3399.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: fan@18: '#cooling-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
>> arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: pinctrl: gpios: {'bios-disable-override-hog-pin': {'rockchip,pins': [[3, 29, 0, 188]], 'phandle': 183}, 'q7-thermal-pin': {'rockchip,pins': [[0, 3, 0, 187]], 'phandle': 182}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: /extcon-usb3: failed to match any schema with compatible: ['linux,extcon-usb-gpio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
