Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A3A28EC
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Mar 2025 20:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743106862; cv=none; b=UqYC5MT+D0C95ikcdI1CPkkTkvesypKiO9Q6pwd0ZEIzpXMVajvHmd0AoCbHMS4LgKihS8VtAkVsoNnltpPjGoKdBxJWilJj0tmd+K1/TEdM2ys4VkfqlNg+OzT3O+SLL4Bzq2Au8LBq7USX4W0wt+lRj3S03akeEZM+Xci28O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743106862; c=relaxed/simple;
	bh=UEOItwrc0O/RHb00tzmTYl8D9cj7JXYo1fzgv1Cah14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QM0DIlsPIrgMmqQWa/v8crwSK75Nm3Wmptfd38nhh6HwVb6YHHWfX3bOyoIvjU3yHwln/xZRRdkgQ95DLw6L1F3NgMSkLGFqDoW/WUxd7djHcMlpmFc0gibbT2/bLmi8FsQ5+/UtVpQFHsSxfF1hNq9vJwOoDox7SYJ3nz8pU8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gzNOU6Xn; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gzNOU6Xn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743106860; x=1774642860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UEOItwrc0O/RHb00tzmTYl8D9cj7JXYo1fzgv1Cah14=;
  b=gzNOU6Xnuc4tLwch2ilnYMfmKM3SBb1fUTin7P6TT3j7Aax6FoQ2zrYI
   Etej5YWVeljZhaZCq2dtlN6bYUBeVtBI3+t0GkG1dFBydwIYMJF09Eyg7
   ngEh5XXgPplc04u2IHv2JwmlXYAKK6i2DNbf3ob7FdcJklur0kgt0EKRL
   MJFhcHz2k//p/H1B+p2WEgNU3eknzTKjScwXm5V6VM5zy+EFKTSOj5LPV
   Z89STn9YN95VSEeRa7XotZjR08jMEM7hU186f/ccrlInx7PlEtbhmLQZ7
   0j9Mf61zqgJsdFc+7sEHVYmzF7hqty+IjYvM+WZZKNWxgqSQ1YYafXx9Y
   g==;
X-CSE-ConnectionGUID: TRL43syfSpmWgJmWBDiX1A==
X-CSE-MsgGUID: SNpVTuGGSLu+9vAJ7rLrpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48242121"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="48242121"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 13:20:54 -0700
X-CSE-ConnectionGUID: mhW0sbgTQzCSx0kajMAaUA==
X-CSE-MsgGUID: g+kUhFDHQCuDziZzFQzSTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="130109467"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 27 Mar 2025 13:20:54 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txtid-0006wZ-0l;
	Thu, 27 Mar 2025 20:20:51 +0000
Date: Fri, 28 Mar 2025 04:20:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/5] arm64: dts: rockchip: fix internal USB hub
 instability on RK3399 Puma
Message-ID: <202503280317.Q51aTqRE-lkp@intel.com>
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
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: arm64-randconfig-051-20250327 (https://download.01.org/0day-ci/archive/20250328/202503280317.Q51aTqRE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503280317.Q51aTqRE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503280317.Q51aTqRE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@1: 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@1: 'vdd2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@2: 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@2: 'vdd2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
