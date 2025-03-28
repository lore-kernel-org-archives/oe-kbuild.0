Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5F323AD
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Mar 2025 00:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743120542; cv=none; b=mscsVjSGzuZ0wlH845ldZmMS0m0Ii/IC4TRKjqGqoF2wJ2LFFJCA4bQvFJGqc+rLSKesp+Mx6ejT0ibpc8yDpA7VUFm2oZO8yGUSSUdxuXyImlzRGEahHiA/F63R7NS9EqFwbOO5AtBZZPylEqdZJwdpcE4DpDlndatiWT6tBXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743120542; c=relaxed/simple;
	bh=1izC4hkYhk+cPpjgh3KL0bXJ98pjVuEFpHYxqOyIzCU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KE905tLuUP5CsVcR9e+7/UuhJ5CTdEiIsAuGO6x1QKUtEcWMu4xbv0Cy5Lxh0HlrOwsXmKFOlr4mZT4geIcHKuXKsTlTx6gAAk/9tR/myvSYw9KYhBBpO+PEfLQQKFLY+WwGCcXnwIb+orJyFu2OQx5tmaCM/MN89qwghcg2ibs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NdFLJMnw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NdFLJMnw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743120539; x=1774656539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1izC4hkYhk+cPpjgh3KL0bXJ98pjVuEFpHYxqOyIzCU=;
  b=NdFLJMnwuFM/fWP0DPKgfzLAxzmyVejzMj9TsugNKoEclC+SUIYzwYte
   IQptPtWQHPU9UVzi/MTSmoJX2xyPFA9U/zbQ/n82w6mwbNkBOC60+czj4
   rlL2b6sh3/1uAZF22NfXrcNFqzRWlLKEF2HRfSol6GaGvSDpMOfPJltfx
   ArGmPA0dSpGrSwswD2oUUb3fSHxbPAhCUvpxOCTYltfUssCAJH8Hhwgbe
   DU2aPmyqaLu6nc7ouzDFjU69qTk+IOtgHlWr+XMjk1dK4u5mGpbu3XZio
   UUQJwoheWz31GDDs9R7gckzySjB8ifA+M8jGl5oUxGNIPQlvJ8C97jyRb
   Q==;
X-CSE-ConnectionGUID: LPiNIs8OS86z+6iMdxxqMA==
X-CSE-MsgGUID: k7w9hq13TkiWuuz88GMeDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43716626"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="43716626"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 17:08:59 -0700
X-CSE-ConnectionGUID: PuKA8OQIQ4ufFENoQ7yMzw==
X-CSE-MsgGUID: 88JVf+AvRba6/vWdSltxsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="130012748"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 27 Mar 2025 17:08:58 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txxHH-00071C-32;
	Fri, 28 Mar 2025 00:08:53 +0000
Date: Fri, 28 Mar 2025 08:08:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/5] arm64: dts: rockchip: fix internal USB hub
 instability on RK3399 Puma
Message-ID: <202503280730.C16FE55q-lkp@intel.com>
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
In-Reply-To: <20250326-onboard_usb_dev-v1-3-a4b0a5d1b32c@thaumatec.com>
References: <20250326-onboard_usb_dev-v1-3-a4b0a5d1b32c@thaumatec.com>
TO: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
TO: Matthias Kaehlcke <mka@chromium.org>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Benjamin Bara <benjamin.bara@skidata.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Heiko Stuebner <heiko@sntech.de>
TO: Klaus Goger <klaus.goger@theobroma-systems.com>
CC: linux-usb@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
CC: quentin.schulz@cherry.de
CC: stable@vger.kernel.org

Hi Lukasz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1e26c5e28ca5821a824e90dd359556f5e9e7b89f]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukasz-Czechowski/usb-misc-onboard_usb_dev-fix-support-for-Cypress-HX3-hubs/20250327-002824
base:   1e26c5e28ca5821a824e90dd359556f5e9e7b89f
patch link:    https://lore.kernel.org/r/20250326-onboard_usb_dev-v1-3-a4b0a5d1b32c%40thaumatec.com
patch subject: [PATCH 3/5] arm64: dts: rockchip: fix internal USB hub instability on RK3399 Puma
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: arm64-randconfig-052-20250327 (https://download.01.org/0day-ci/archive/20250328/202503280730.C16FE55q-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503280730.C16FE55q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503280730.C16FE55q-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@1: 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@1: 'vdd2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@2: 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@2: 'vdd2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: pinctrl: gpios: {'bios-disable-override-hog-pin': {'rockchip,pins': [[3, 29, 0, 190]], 'phandle': 185}, 'q7-thermal-pin': {'rockchip,pins': [[0, 3, 0, 189]], 'phandle': 184}} is not of type 'array'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
