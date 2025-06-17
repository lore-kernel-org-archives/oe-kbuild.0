Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F2772607
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Jun 2025 11:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750160788; cv=none; b=maN4BAerZ9av4pFObbBgj1TPfP5POJkV+hiNMF5pBUcLsrSKlKdp3vKFPQwaXgoQTpeCrRsNVcXtCSGJRUnTMeY2hfU49iCnPAxe4fTki/MN6/y8khBmzc6wVlauBzT+27T6jo0vGCNrB6f5tAskJBnyBrOC0JRGzhZQ+yvm+So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750160788; c=relaxed/simple;
	bh=yUmYQ4ekUTpGpLjz34RYQvm5pQlIvyCTxQXc5HvImxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X6HhxXu6IoPXtMZTG06rQ5sgkcDbpeX1eo56IPfx6dhOHKqG0JuOGcKZxcCGaCMQdEtNB72/e/PafH6VJ94a1BjCEZsSV/fiRHmhyKVrR1diRaiNtNiaYbZWcV2/mKmqj98bDfPvZzasnwFri38+7Q7PtdD8xjLvEh1ZHnbeRM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lpjQnTDO; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpjQnTDO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750160785; x=1781696785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yUmYQ4ekUTpGpLjz34RYQvm5pQlIvyCTxQXc5HvImxM=;
  b=lpjQnTDOs7bJD9eH5WtPGQSMwBFvETkyGst089Ew7ocaiaKjBH02/aRf
   /n63xPiKD33fk2VMcz7JvjnjSrz2eyHquhBQPdCgSAUNpl1G6WE60mCZE
   kpUGFurGRztk/H2z8n3XoV7xUWW7oGmZ+OCUGLuVsJSIJQWOpVylNpjY2
   jbgpiNETEAdgtcOLE09Gb6SmO7XgZLITQwISmpnXqBOumHQdBCKBQ3Kln
   Mmb0+08MYX91zGxoGOA03usOxcgij/4AJYKrEls/4dvfCMNqEpQ35Oavc
   kXSi8nXfUbxeS6dM7TkQDUIIFUhfTv6e+cS/xI32aQ6QM9njoU8IW0emR
   A==;
X-CSE-ConnectionGUID: Qk4Oosc2QxWTgMOkRY+dPw==
X-CSE-MsgGUID: AzJMvuoQRhuTPuxQ14BFhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63747853"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="63747853"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 04:46:25 -0700
X-CSE-ConnectionGUID: BcoJMGiTTOK8yat831nohA==
X-CSE-MsgGUID: KybWmcldRCq/68YvKQ8f2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="152613372"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Jun 2025 04:46:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRUlh-000Fw6-0p;
	Tue, 17 Jun 2025 11:46:21 +0000
Date: Tue, 17 Jun 2025 19:46:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-drivers:topic/renesas-overlays-v6.16-rc1 8/163]
 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dtb: pmic: soc-slppin-gpio:
 {'rockchip,pins': [[0, 2, 0, 17]], 'phandle': 257} is not of type 'array'
Message-ID: <202506171950.9vfkiP8g-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays-v6.16-rc1
head:   10b98ce46d188419d958674bb09e3dd30f3a291b
commit: cf09bdd0e6bf87cf5f9242843c85ccb765b9a580 [8/163] kbuild: Enable DT symbols when CONFIG_OF_OVERLAY is used
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: arm64-randconfig-051-20250617 (https://download.01.org/0day-ci/archive/20250617/202506171950.9vfkiP8g-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506171950.9vfkiP8g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506171950.9vfkiP8g-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dtb: pmic: soc-slppin-gpio: {'rockchip,pins': [[0, 2, 0, 17]], 'phandle': 257} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): i3c1:i3c1m1-xfer:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): i3c1:i3c1m1-xfer:rockchip,pins:1:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): i3c1_sda:i3c1_sdam1-pu:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch5:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m0-ch2:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch2:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m0-ch3:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch0:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch6:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch3:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m0-ch4:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch1:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm1:pwm1m1-ch5:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm0:pwm0m1-ch1:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl (rockchip,rk3576-pinctrl): i3c1:i3c1m1-xfer:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl (rockchip,rk3576-pinctrl): i3c1:i3c1m1-xfer:rockchip,pins:1:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl (rockchip,rk3576-pinctrl): i3c1_sda:i3c1_sdam1-pu:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm1:pwm1m1-ch5:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm0:pwm0m1-ch1:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch0:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m0-ch3:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch3:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m0-ch4:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch5:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch6:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m0-ch2:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch2:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch1:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): i3c1:i3c1m1-xfer:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): i3c1:i3c1m1-xfer:rockchip,pins:1:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m0-ch3:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch5:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m0-ch2:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch2:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch1:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch6:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch3:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m0-ch4:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch0:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): i3c1_sda:i3c1_sdam1-pu:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm1:pwm1m1-ch5:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm0:pwm0m1-ch1:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: pinctrl (rockchip,rk3576-pinctrl): i3c1:i3c1m1-xfer:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: pinctrl (rockchip,rk3576-pinctrl): i3c1:i3c1m1-xfer:rockchip,pins:1:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m0-ch2:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m0-ch3:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch6:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch1:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch0:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch5:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch2:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch3:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m0-ch4:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm1:pwm1m1-ch5:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm0:pwm0m1-ch1:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: pinctrl (rockchip,rk3576-pinctrl): i3c1_sda:i3c1_sdam1-pu:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
