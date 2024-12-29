Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3B5800
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Dec 2024 01:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735436374; cv=none; b=g/5nvoxPG9rpOoTEEOJev+18841EddwGV0MmxVFn5YmHCaP4GMchXp/Wsmn3y7tdusDX+WXk0ytQ9WFexMNVIs64tjveRYgnYlvQhDuAJr/ix1whgpaQ9eaNm6wcpGXbYo/BVXMSN/clVnxaSho0ZlJAWSoosHF2bFa5zeCm+VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735436374; c=relaxed/simple;
	bh=wSdgbOA7tNRnKwpku8ficfDuAZktFUuQ8Q6VvjCpHwc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u8Qk7iXqSzXl6ad4/CbVNeepyw9p0Q90fIWWuVz7zm2uiULTvET0MkdfxQi5xTnjU/ACenQyGBPN/KPzp0x1pIgaef/LX7RgbrIRKvu61dEUftUBFtjshKsCZV3Znzw3d8mJuAzHMbVVxoep5Q9yZu4HKwaDYb3hbSrcuvdqNRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/2XQ3cM; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/2XQ3cM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735436372; x=1766972372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wSdgbOA7tNRnKwpku8ficfDuAZktFUuQ8Q6VvjCpHwc=;
  b=G/2XQ3cMj8mcfsTSmHK0gXKs4yrAelmMNyRFbajo8a/EJBMBQWO6NyFz
   PHzZmek7otIsYXo62N3cIuZF14V3khLcc/QblEd7ee5qU0wHbP5LYdn6C
   ekDj1dv2OdanaFzPQ+R4d45VRZeKU1KO1GVdKZ13yfeEJzZuRY2wXUjzv
   /fQSlbDfT+m0T5ozcLfZ+DxFtE8bo+jqME5GRvRkvemwpYNYQFqXXKhvL
   6dLIk0YZHcW/QRXCAC8v2Qat6Uych8kEPxKQLnnd5nyQnAbYkyn4+cZpU
   xjdX5UXNB9QxkF4873ts99RCUUeKQtUBIq30A466KgjgyKep1VSNQKu0h
   A==;
X-CSE-ConnectionGUID: 5A8VpxrTTmC9Zh7wMLVGeA==
X-CSE-MsgGUID: S0qoU1pQQFajy3IkAdlF0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35802045"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="35802045"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 17:39:32 -0800
X-CSE-ConnectionGUID: rSghgHQVQXW95KRLyT6q1Q==
X-CSE-MsgGUID: h3v8f9kzT9yyNBbbKGsWSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100302580"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Dec 2024 17:39:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRiHA-0004QQ-0Y;
	Sun, 29 Dec 2024 01:39:28 +0000
Date: Sun, 29 Dec 2024 09:39:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi:488.10-499.6:
 Warning (graph_child_address): /i2c@fe5c0000/tcpc@60/connector/ports: graph
 node has single child node 'port@0', #address-cells/#size-cells are not
 necessary
Message-ID: <202412290950.FfXusXHx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Samuel Holland <samuel@sholland.org>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   059dd502b263d8a4e2a84809cf1068d6a3905e6f
commit: 87a267b4af09477721e9d2bad63555f0dc49d08a arm64: dts: rockchip: Add USB and TCPC to rk3566-pinenote
date:   2 years, 8 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 2 years, 8 months ago
config: arm64-randconfig-003-20241220 (https://download.01.org/0day-ci/archive/20241229/202412290950.FfXusXHx-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290950.FfXusXHx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412290950.FfXusXHx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi:488.10-499.6: Warning (graph_child_address): /i2c@fe5c0000/tcpc@60/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +488 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi

d449121e5e8add Samuel Holland 2022-01-29  443  
d449121e5e8add Samuel Holland 2022-01-29  444  &i2c3 {
d449121e5e8add Samuel Holland 2022-01-29  445  	pinctrl-0 = <&i2c3m1_xfer>;
d449121e5e8add Samuel Holland 2022-01-29  446  	status = "okay";
d449121e5e8add Samuel Holland 2022-01-29  447  
d449121e5e8add Samuel Holland 2022-01-29  448  	led-controller@36 {
d449121e5e8add Samuel Holland 2022-01-29  449  		compatible = "ti,lm3630a";
d449121e5e8add Samuel Holland 2022-01-29  450  		reg = <0x36>;
d449121e5e8add Samuel Holland 2022-01-29  451  		enable-gpios = <&gpio0 RK_PB7 GPIO_ACTIVE_HIGH>;
d449121e5e8add Samuel Holland 2022-01-29  452  		pinctrl-0 = <&backlight_hwen_h>;
d449121e5e8add Samuel Holland 2022-01-29  453  		pinctrl-names = "default";
d449121e5e8add Samuel Holland 2022-01-29  454  		#address-cells = <1>;
d449121e5e8add Samuel Holland 2022-01-29  455  		#size-cells = <0>;
d449121e5e8add Samuel Holland 2022-01-29  456  
d449121e5e8add Samuel Holland 2022-01-29  457  		led@0 {
d449121e5e8add Samuel Holland 2022-01-29  458  			reg = <0>;
d449121e5e8add Samuel Holland 2022-01-29  459  			label = "backlight_cool";
d449121e5e8add Samuel Holland 2022-01-29  460  			default-brightness = <0>;
d449121e5e8add Samuel Holland 2022-01-29  461  		};
d449121e5e8add Samuel Holland 2022-01-29  462  
d449121e5e8add Samuel Holland 2022-01-29  463  		led@1 {
d449121e5e8add Samuel Holland 2022-01-29  464  			reg = <1>;
d449121e5e8add Samuel Holland 2022-01-29  465  			label = "backlight_warm";
d449121e5e8add Samuel Holland 2022-01-29  466  			default-brightness = <0>;
d449121e5e8add Samuel Holland 2022-01-29  467  		};
d449121e5e8add Samuel Holland 2022-01-29  468  	};
87a267b4af0947 Samuel Holland 2022-04-12  469  
87a267b4af0947 Samuel Holland 2022-04-12  470  	wusb3801: tcpc@60 {
87a267b4af0947 Samuel Holland 2022-04-12  471  		compatible = "willsemi,wusb3801";
87a267b4af0947 Samuel Holland 2022-04-12  472  		reg = <0x60>;
87a267b4af0947 Samuel Holland 2022-04-12  473  		interrupt-parent = <&gpio0>;
87a267b4af0947 Samuel Holland 2022-04-12  474  		interrupts = <RK_PA4 IRQ_TYPE_LEVEL_LOW>;
87a267b4af0947 Samuel Holland 2022-04-12  475  		pinctrl-0 = <&tcpc_int_l>;
87a267b4af0947 Samuel Holland 2022-04-12  476  		pinctrl-names = "default";
87a267b4af0947 Samuel Holland 2022-04-12  477  
87a267b4af0947 Samuel Holland 2022-04-12  478  		connector {
87a267b4af0947 Samuel Holland 2022-04-12  479  			compatible = "usb-c-connector";
87a267b4af0947 Samuel Holland 2022-04-12  480  			label = "USB-C";
87a267b4af0947 Samuel Holland 2022-04-12  481  			vbus-supply = <&otg_switch>;
87a267b4af0947 Samuel Holland 2022-04-12  482  			power-role = "dual";
87a267b4af0947 Samuel Holland 2022-04-12  483  			try-power-role = "sink";
87a267b4af0947 Samuel Holland 2022-04-12  484  			data-role = "dual";
87a267b4af0947 Samuel Holland 2022-04-12  485  			typec-power-opmode = "default";
87a267b4af0947 Samuel Holland 2022-04-12  486  			pd-disable;
87a267b4af0947 Samuel Holland 2022-04-12  487  
87a267b4af0947 Samuel Holland 2022-04-12 @488  			ports {
87a267b4af0947 Samuel Holland 2022-04-12  489  				#address-cells = <0x1>;
87a267b4af0947 Samuel Holland 2022-04-12  490  				#size-cells = <0x0>;
87a267b4af0947 Samuel Holland 2022-04-12  491  
87a267b4af0947 Samuel Holland 2022-04-12  492  				port@0 {
87a267b4af0947 Samuel Holland 2022-04-12  493  					reg = <0x0>;
87a267b4af0947 Samuel Holland 2022-04-12  494  
87a267b4af0947 Samuel Holland 2022-04-12  495  					typec_hs_usb2phy0: endpoint {
87a267b4af0947 Samuel Holland 2022-04-12  496  						remote-endpoint = <&usb2phy0_typec_hs>;
87a267b4af0947 Samuel Holland 2022-04-12  497  					};
87a267b4af0947 Samuel Holland 2022-04-12  498  				};
87a267b4af0947 Samuel Holland 2022-04-12  499  			};
87a267b4af0947 Samuel Holland 2022-04-12  500  		};
87a267b4af0947 Samuel Holland 2022-04-12  501  	};
d449121e5e8add Samuel Holland 2022-01-29  502  };
d449121e5e8add Samuel Holland 2022-01-29  503  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
