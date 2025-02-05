Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECF518CC15
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Feb 2025 15:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738770310; cv=none; b=PwxRXe+u8xyZVFEQVIFvG4E96iisb3Ok2RLWn3lTgBHaMxWCQO/tKkNzN2FFPJpV1HUZ7Mk6r3NBBHXy3MTzzT7S4zLhPVOwhNIQxkiaVPaMBb/F3OaloPiGNsWk5y+cJerpE2l8/IRtOaPO0AjZLrErAXyT8HJldpoQgO9ij9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738770310; c=relaxed/simple;
	bh=IP16gwhzpXoPuNOfXat9YqeASX9uVkwDgaLeDD/qKz8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tqt9KQsKrrVIoRxsoFr8kKNgV20Vx0rRf5Qs5SHB60LVwQSueJ4YugE4f1doJau8ljSOv+chqsPVoblNNRwOBM8QIcULtQvunPyKCYSlEb+M63LmZfkx9QCdyf/LVOjmdHxpfIt/M8wQXD3u3NB1ZJw8+BRCHgV/u3QTzMVC6wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N22n4kyD; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N22n4kyD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738770308; x=1770306308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IP16gwhzpXoPuNOfXat9YqeASX9uVkwDgaLeDD/qKz8=;
  b=N22n4kyDKJjE3rj4PBwhMTEMA7a+9O1ir9HACmiTxXgzxvxRWD8eZ1O+
   IIHVxdl44t+Ix8r7edB//VffXRjUNsLSd0W+G45JlHIadwk01GP2zPpN8
   EHbvwyl268mt4j7RI2LyWt6nZfCjuRf/RVTdnEmKCcoO72d+xS35BZ5ZH
   itF1j2wgN62zLERTjczBFfKTA1guSusm1PsV//gTRv+cCfpa/ZgnxrV3X
   Gslq3osaRut5YAPyLkKPXO8fSQhbFATvXgsum/v28c46+HnEQvpWSkAit
   EIxgGddjQugf47wTOk7LN91nJvuiQz6B9CJOFfs2QvRkBP6ukWbHLfHd3
   g==;
X-CSE-ConnectionGUID: 2UiZqwo7R6u6vWgs6ZReig==
X-CSE-MsgGUID: Hy5l7jvwS1Cl1Fw9Gjg5Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39237294"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="39237294"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 07:45:05 -0800
X-CSE-ConnectionGUID: g3DrOIrrTDWtItzyzxVevg==
X-CSE-MsgGUID: sWMS3vWQRqaJ2NqeUQBV5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="110833114"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Feb 2025 07:45:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfhaH-000viM-05;
	Wed, 05 Feb 2025 15:45:01 +0000
Date: Wed, 5 Feb 2025 23:44:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-drivers:topic/renesas-overlays-v6.14-rc1 8/159]
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl:
 pwm0:pwm0m1-ch1:rockchip,pins:0:2: 14 is greater than the maximum of 13
Message-ID: <202502052353.P8fJOwuk-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays-v6.14-rc1
head:   a6263076d33836d4e49c64ca19d2b4b0ac47779f
commit: fafabc942a7c420910bee7dddb8c6856efdd6fb2 [8/159] kbuild: Enable DT symbols when CONFIG_OF_OVERLAY is used
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-052-20250205 (https://download.01.org/0day-ci/archive/20250205/202502052353.P8fJOwuk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502052353.P8fJOwuk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502052353.P8fJOwuk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1777.20-1843.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl: pwm0:pwm0m1-ch1:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl: i3c1_sda:i3c1_sdam1-pu:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl: i3c1:i3c1m1-xfer:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl: i3c1:i3c1m1-xfer:rockchip,pins:1:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl: pwm1:pwm1m1-ch5:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl: pwm2:pwm2m0-ch2:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl: pwm2:pwm2m0-ch3:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl: pwm2:pwm2m1-ch6:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl: pwm2:pwm2m1-ch3:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl: pwm2:pwm2m1-ch1:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl: pwm2:pwm2m1-ch2:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl: pwm2:pwm2m1-ch0:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl: pwm2:pwm2m0-ch4:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl: pwm2:pwm2m1-ch5:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
