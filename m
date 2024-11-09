Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3314437C
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Nov 2024 22:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731191106; cv=none; b=Siasp+SGZgFBzFHL4EVXPdDlz/+6TgzQkK+drxCjlXuZTBtgRMRgvCYTtGCfgMQXkiAamPOs8AewfdpD0L/48lfQc6qJSt81rxLDZ0v19j71OE2B4a3dEj0id346BvABY7JARSmO46BTMo4ccOVCICxT1yhxnxgUfhSRJOCw8RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731191106; c=relaxed/simple;
	bh=ipIQCweWrbOBYHUAp1L0qH3uZEexKc+aEoW+zPNr4t8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UwuWTu0Ift7ETmvaQRg9Sy0aeaY46cozkZ4EdCfYK0UMOBYQa+UTs+3cSC1+G1l+wDzqgFAd6ksQ6RjfikJoUPgArgxHiuZkhWM6nV/p7jmL/LSFfZkkB/tepsGjuT2IijL8PIcC8vCe16cpD5ixUrUadyM1A6lhACAP+qG8Q38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJWu7NVl; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJWu7NVl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731191104; x=1762727104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ipIQCweWrbOBYHUAp1L0qH3uZEexKc+aEoW+zPNr4t8=;
  b=KJWu7NVl7cu62MXUD7jNumMoRytWg7qyDpara1ERMRJMsiF+nbb+k5sp
   rpDeBzwh+PKkZZcnWiRbvdbRePWzsOLqg5V13XwowOGBCW/iBnNcm3FC8
   Tc41uEDZHAk+ZaTLJlWLmhADfwthh8dOXkTIq/ASlOdY71AWQWRmFqVkQ
   zyXibZxxfwB6lnGHmekIQlbG/Pl+askf32IoTCfRJmMLXnxvrZaSeeKif
   O3ZOSKcMcLjNz7rtEG8UvW9wcVGTJF8enHIkRalXUk+VcoLXcaEYTtBAC
   4ZPg9xksKUDMoeNWEUi+9z07B6hQj++9CuggKcMK2zr45ImZjzql69QIO
   Q==;
X-CSE-ConnectionGUID: a+vfRURFR4Kydhrqy+8Dtw==
X-CSE-MsgGUID: IRPNQS5XSLONY5wA8iFCbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="48560368"
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="48560368"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 14:25:03 -0800
X-CSE-ConnectionGUID: 9mP72zm2QIev+E/QKDILdA==
X-CSE-MsgGUID: pijt3e6pSa2hqJPj75ogAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="91095113"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Nov 2024 14:25:03 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9tt6-000sio-0d;
	Sat, 09 Nov 2024 22:25:00 +0000
Date: Sun, 10 Nov 2024 06:24:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.13-armsoc/dts64 48/84]
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: analog-sound:
 'simple-audio-card,hp-det-gpios' does not match any of the regexes:
 '^simple-audio-card,codec(@[0-9a-f]+)?$',
 '^simple-audio-card,cpu(@[0-9a-f]+)?$',
 '^simple-audio-card,dai-link(@[0-9a-f]...
Message-ID: <202411100652.hrMNJbF4-lkp@intel.com>
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
TO: Jimmy Hon <honyuenkwun@gmail.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.13-armsoc/dts64
head:   2b47332134e4cd29078b3fb7d30b0a0555af01f3
commit: ae46756faff88f26aca8aba28397a6ab30d229c2 [48/84] arm64: dts: rockchip: analog audio on Orange Pi 5
:::::: branch date: 4 hours ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-051-20241108 (https://download.01.org/0day-ci/archive/20241110/202411100652.hrMNJbF4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411100652.hrMNJbF4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411100652.hrMNJbF4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: /hdmi@fde80000: failed to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: gpio-func: leds-gpio: {'rockchip,pins': [[0, 2, 0, 251]], 'phandle': 265} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: analog-sound: 'simple-audio-card,hp-det-gpios' does not match any of the regexes: '^simple-audio-card,codec(@[0-9a-f]+)?$', '^simple-audio-card,cpu(@[0-9a-f]+)?$', '^simple-audio-card,dai-link(@[0-9a-f]+)?$', '^simple-audio-card,plat(@[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/simple-card.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: vcc-3v3-sd-s0-regulator: Unevaluated properties are not allowed ('enable-active-low' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
