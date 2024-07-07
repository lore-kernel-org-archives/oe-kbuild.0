Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B180F4405
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Jul 2024 06:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720334621; cv=none; b=PDvGJzbHY6z7LRQvneZx6r735tCic4GoD9rwZXrU0zwOHeKnx+YwywQlxfamqcxeauYFaxaLlOMciuXOjZZ4dyNiThzKdLxDyF2HD0LBSGC+9yVhhf+4F0DES0THlCdQuTYwbclcJUpNSpuSpg0zusZHnlWVhfD/ByY9uBlEUzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720334621; c=relaxed/simple;
	bh=m6kzLknjZkIhTUIE2xcoQtJvPiI917ARtkag49MSS3g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k34cwkxpk2TzhnHg7Xx33t+0uKIZRuXJvBXUeJbg4rr610X27EX3I3lmZvapTPGWjB/1/mJjj8Oa0ls8kfkKkq5XlDzN3Vt9/aeof23nKCqhk8hhEz3U6X2MiZywErwOwMLX2SBfN7dToTrRLswmMTJswtkcHNpJa0QhwEKpK5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TOMPnj85; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TOMPnj85"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720334620; x=1751870620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m6kzLknjZkIhTUIE2xcoQtJvPiI917ARtkag49MSS3g=;
  b=TOMPnj85m1qsMvLGfwzEg6+tRXANkomP0c1VDMcdkGzX51VzjhZxdJvx
   HbpO5lOdyDmJIjbvloQZp33faXNjWhNvNGSRmpp7ZBn1U+H0MKrTJ2JnK
   4gUmTC+KBiCybKixlMtG1JFaQmaBkQBVII1t596nxoLMwCdD3xbshAWrR
   aK2m5tr7MBe5lxWNSZjzlBUBFfXYCH9A+0KY8jz24bT9ISp3T0A7YVgSb
   zxPfQP48r7zuCjfqMF47RasHT4x+lWJ3fPE1EE/AnONcE+eifP7Hu+6LP
   hlQfDw7IMYqr/H7C648AsatJjBgy1BwKUjD47WzCU3D+QmpRm5zTeL+Jr
   Q==;
X-CSE-ConnectionGUID: AN8NWsutQwq8iu10b8Dsng==
X-CSE-MsgGUID: OO4Lg09PTkajR+WSM3xh7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="21425709"
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="21425709"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 23:43:39 -0700
X-CSE-ConnectionGUID: zfpvHDsmS2qgTvYQFL0qqg==
X-CSE-MsgGUID: hty1i2vkSkmDKCDOYI9niQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="47279020"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Jul 2024 23:43:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQLcV-000UhK-2R;
	Sun, 07 Jul 2024 06:43:35 +0000
Date: Sun, 7 Jul 2024 14:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.11-armsoc/dts64 7/54]
 arch/arm64/boot/dts/rockchip/rk3308-evb.dtb: /grf@ff000000/io-domains:
 failed to match any schema with compatible:
 ['rockchip,rk3308-io-voltage-domain']
Message-ID: <202407071430.4sAEDEDw-lkp@intel.com>
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
TO: Jonas Karlman <jonas@kwiboo.se>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.11-armsoc/dts64
head:   0e1ab7efe34b3acc99387a9921123b8fc5f7af97
commit: d1829ba469d5743734e37d59fece73e3668ab084 [7/54] arm64: dts: rockchip: Add rk3308 IO voltage domains
:::::: branch date: 2 days ago
:::::: commit date: 6 weeks ago
config: arm64-randconfig-051-20240707 (https://download.01.org/0day-ci/archive/20240707/202407071430.4sAEDEDw-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407071430.4sAEDEDw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407071430.4sAEDEDw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3308-evb.dtb: /grf@ff000000/io-domains: failed to match any schema with compatible: ['rockchip,rk3308-io-voltage-domain']
   arch/arm64/boot/dts/rockchip/rk3308-evb.dtb: ethernet@ff4e0000: compatible: ['rockchip,rk3308-gmac'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
   arch/arm64/boot/dts/rockchip/rk3308-evb.dtb: codec@ff560000: reset-names:0: 'codec' was expected
   	from schema $id: http://devicetree.org/schemas/sound/rockchip,rk3308-codec.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dtb: /grf@ff000000/io-domains: failed to match any schema with compatible: ['rockchip,rk3308-io-voltage-domain']
   arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dtb: ethernet@ff4e0000: compatible: ['rockchip,rk3308-gmac'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
   arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dtb: codec@ff560000: reset-names:0: 'codec' was expected
   	from schema $id: http://devicetree.org/schemas/sound/rockchip,rk3308-codec.yaml#
   arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dtb: leds: led-0:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'ir-power-click' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'none', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'ir-power-click' does not match '^cpu[0-9]*$'
   	'ir-power-click' does not match '^hci[0-9]+-power$'
   	'ir-power-click' does not match '^mmc[0-9]+$'
   	'ir-power-click' does not match '^phy[0-9]+tx$'
--
>> arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dtb: /grf@ff000000/io-domains: failed to match any schema with compatible: ['rockchip,rk3308-io-voltage-domain']
   arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dtb: ethernet@ff4e0000: compatible: ['rockchip,rk3308-gmac'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
   arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dtb: ethernet@ff4e0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'reset-names', 'resets' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
   arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dtb: codec@ff560000: reset-names:0: 'codec' was expected
   	from schema $id: http://devicetree.org/schemas/sound/rockchip,rk3308-codec.yaml#
   arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dtb: leds: green-led-gpio: {'rockchip,pins': [[0, 6, 0, 90]], 'phandle': [[98]]} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dtb: leds: heartbeat-led-gpio: {'rockchip,pins': [[0, 5, 0, 90]], 'phandle': [[99]]} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
