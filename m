Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979493563E5
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Mar 2026 15:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773241258; cv=none; b=AzF1JRznxSNk9WFC1d+qb3pfeqq0g8C9IbA40sqPKrVICBO04g1NTUCWobXqcjAZPwlaw3iRYz385QMFipNo8cKHNgf3UDiocOwZY0kpwXKi9GKAql3EF9zSfXlCRmzEjLcPU6Vh+m6oT4W1sNrwHQrGLwrcbqei3OSIF3bCbFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773241258; c=relaxed/simple;
	bh=L1GzdzAPg/jkfF8Jm+cNEgs3Nd1oSyiSJFLHzB27YFs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R49PvSnQZ7/ywdqikCtOQk7cgW1Qlil2WTg8u6qLlx7R1A6IwDRdXuQplD8db4D3cG1wBCOFvrlXZ8t66mWbG9jVSvwOoURDgQA6M6n5hdkfm/8V84u2zvH142cICQLwIdcOgI0SsTmoOLwiDn/JSyFReui19nms5BHX0/ZT/mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Us1yxzod; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Us1yxzod"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773241258; x=1804777258;
  h=date:from:to:cc:subject:message-id;
  bh=L1GzdzAPg/jkfF8Jm+cNEgs3Nd1oSyiSJFLHzB27YFs=;
  b=Us1yxzod3nhdOSwPbu6jGDk3F7tfc/od0ZriRJVjs5ayw6ENRr2xJ6lk
   s71BkWacnMkgtbyT2cHXAjakU7DT4rzSNjxTFagjocpFjb0xiDIzm/0db
   AUFQPwwze3rfUOLhXF83aEmkqv17QkTkqjzaO+vvD+Kw4z+42ZbvEwtAt
   iNFMBkdeLSEd+zjq4WieyNV1bcEdtwFUR9qbnF17EI416UWdkD6BCz4zd
   FS4qmiP0PXQIY8XSFSmgebyNBiMwcEOO7lWQNqnPezZWRRlQ6AsKnyau8
   +BFgscjwawXMXyIc3Rwym2LHJNXL9zNm2KAKAjJtLFhrXjGWITkwgWN5r
   Q==;
X-CSE-ConnectionGUID: jYLgH1LGRSqGeDArMRw2fA==
X-CSE-MsgGUID: VnISsVdjSkKuGiCfTPZm7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74501888"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74501888"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 08:00:57 -0700
X-CSE-ConnectionGUID: aeRvd2L5RRG0hevXpbRbNw==
X-CSE-MsgGUID: cQ7gbD+cSMyL7+Aycw5MUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="225198951"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 11 Mar 2026 08:00:55 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0L3N-000000003LZ-0NKJ;
	Wed, 11 Mar 2026 15:00:53 +0000
Date: Wed, 11 Mar 2026 16:00:33 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 621/621]
 Documentation/devicetree/bindings/mfd/maxim,max77620.yaml:
 maxim,active-fps-source: missing type definition
Message-ID: <202603111518.6ZL9So8z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   c8198e311a98fefcf9efff078bf3930ff94b60d2
commit: c8198e311a98fefcf9efff078bf3930ff94b60d2 [621/621] fixup! dt-bindings: mfd: Convert maxim,max77620 to DT schema
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: arc-randconfig-2051-20260311 (https://download.01.org/0day-ci/archive/20260311/202603111518.6ZL9So8z-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111518.6ZL9So8z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603111518.6ZL9So8z-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/memory-controllers/marvell,mvebu-devbus.yaml: devbus,bus-width: missing type definition
   Documentation/devicetree/bindings/powerpc/ibm,vas.yaml: name: missing type definition
   Documentation/devicetree/bindings/sound/ti,abe-twl6040.yaml: ti,mclk-freq: missing type definition
   Documentation/devicetree/bindings/sound/ti,abe-twl6040.yaml: ti,mcpdm: missing type definition
   Documentation/devicetree/bindings/sound/ti,abe-twl6040.yaml: ti,dmic: missing type definition
   Documentation/devicetree/bindings/sound/ti,abe-twl6040.yaml: ti,twl6040: missing type definition
   Documentation/devicetree/bindings/pinctrl/st,spear300-pinmux.yaml: st,pinmux-mode: missing type definition
   Documentation/devicetree/bindings/pinctrl/st,spear300-pinmux.yaml: st,pins: missing type definition
   Documentation/devicetree/bindings/pinctrl/atmel,sama5d2-pinctrl.yaml: atmel,drive-strength: missing type definition
   Documentation/devicetree/bindings/pinctrl/sirf,prima2-pinctrl.yaml: sirf,function: missing type definition
>> Documentation/devicetree/bindings/mfd/maxim,max77620.yaml: maxim,active-fps-source: missing type definition
>> Documentation/devicetree/bindings/mfd/maxim,max77620.yaml: maxim,active-fps-power-up-slot: missing type definition
>> Documentation/devicetree/bindings/mfd/maxim,max77620.yaml: maxim,active-fps-power-down-slot: missing type definition
   Documentation/devicetree/bindings/soc/fsl/cpm_qe/cpm/fsl,cpm1-i2c.yaml: linux,i2c-index: missing type definition
   Documentation/devicetree/bindings/soc/fsl/cpm_qe/cpm/fsl,cpm1-i2c.yaml: linux,i2c-class: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: gpio-ext: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: timers: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: bright-addr: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,short-detection-threshold-volt: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,current-limit-mA: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: mal-tx-channel: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: mal-rx-channel: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: rx-fifo-size: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
