Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6130336ECF
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Mar 2026 14:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773238200; cv=none; b=QwvRF9Cej5kf+aB+VkMjP/Kf4vnOJCnGs1UHRyd3kO4IsCl90CldVwRxegqeessNuYTghXJ5BvUPnwKqUKfmToceuzocwqQdKmzxb1yi+CDLljhuIWZH5Ufj3+PoRFV+LJsxrmrEFdK+WLZ/KRclPkKlELMhY0ktYpmWETo/s0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773238200; c=relaxed/simple;
	bh=hssdFx/5ysFtl4BhOGp/ZcBc0KLrrs+Zl+J/eZc5a7g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SPldW8yOarMGkVKaDVOprbmYUa/Esw5mSNeAdtc5Qz/R21EPuGsp3QV93WsBeZnEXD2BUr9sGptKh2Yk/MHZxhe6NckY6xr4Ywy+q9tiZRJpKV1bjTYXttUWJYBKIFyGQjrntgQsMfluoa9U7har+koIFfl4DYHcRdJ0gW4P+LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ISAuCnJp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISAuCnJp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773238197; x=1804774197;
  h=date:from:to:cc:subject:message-id;
  bh=hssdFx/5ysFtl4BhOGp/ZcBc0KLrrs+Zl+J/eZc5a7g=;
  b=ISAuCnJpMnNmyN9eQX+H5CaXdKc5GZytrtXxx5LJAEOGVAz0kzGjgcOI
   KgWVEXIZoujKUbb4ePM9ECkhV+HXZHoUBNugeTOFSZuKt7jDZR5PWJ1gt
   yH02BkCWBTB3LeQ+X48Jx+bsMhuFqCu8FLEVXHK6yzm/b/86V+LaB/EbL
   soJCTk00ifJf9ePebG3RZ1BJxXM3IVj3CbFBZD8KtgDtG4OcqHVuKJ65C
   PJ1dgHNqIqCDT7D+snSMK4x8ynv0feMdnXEubfTRE8nfbZF5a4baRS/TZ
   C5xSYey0pB6aoeEmNg9wlJMQY01eWgVgaJTydKjTFCsu4CfrtcW1aaO1M
   A==;
X-CSE-ConnectionGUID: MxXImgnbQ+qNbLuAaRPGzQ==
X-CSE-MsgGUID: I60ZYzVbRMmNaZ7p3Mc/tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="76917148"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="76917148"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 07:09:56 -0700
X-CSE-ConnectionGUID: 2yBNEU5+QFyKS+x/HZQPUA==
X-CSE-MsgGUID: KVS6DUeTRWWccgwGsiy27w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="220421868"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 11 Mar 2026 07:09:55 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0KG0-000000003Kr-1wLU;
	Wed, 11 Mar 2026 14:09:52 +0000
Date: Wed, 11 Mar 2026 15:09:20 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 546/621]
 Documentation/devicetree/bindings/sound/ti,abe-twl6040.yaml: ti,mclk-freq:
 missing type definition
Message-ID: <202603111532.4vwbQtYf-lkp@intel.com>
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
commit: 11218dbc3e1194c2a4df7a18c5018cf94ac36796 [546/621] dt-bindings: sound: Convert ti,abe-twl6040 to DT schema
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arc-randconfig-2051-20260311 (https://download.01.org/0day-ci/archive/20260311/202603111532.4vwbQtYf-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111532.4vwbQtYf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603111532.4vwbQtYf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,has-initda: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,has-mmu: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,reset-addr: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,fast-tlb-miss-addr: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,exception-addr: missing type definition
   Documentation/devicetree/bindings/mmc/cavium,octeon-6130-mmc.yaml: cavium,bus-max-width: missing type definition
   Documentation/devicetree/bindings/power/reset/ti,keystone-reset.yaml: ti,syscon-pll: missing type definition
   Documentation/devicetree/bindings/memory-controllers/atmel,ebi.yaml: atmel,smc-page-mode: missing type definition
   Documentation/devicetree/bindings/memory-controllers/marvell,mvebu-devbus.yaml: devbus,bus-width: missing type definition
   Documentation/devicetree/bindings/powerpc/ibm,vas.yaml: name: missing type definition
>> Documentation/devicetree/bindings/sound/ti,abe-twl6040.yaml: ti,mclk-freq: missing type definition
>> Documentation/devicetree/bindings/sound/ti,abe-twl6040.yaml: ti,mcpdm: missing type definition
>> Documentation/devicetree/bindings/sound/ti,abe-twl6040.yaml: ti,dmic: missing type definition
>> Documentation/devicetree/bindings/sound/ti,abe-twl6040.yaml: ti,twl6040: missing type definition
   Documentation/devicetree/bindings/pinctrl/st,spear300-pinmux.yaml: st,pinmux-mode: missing type definition
   Documentation/devicetree/bindings/pinctrl/st,spear300-pinmux.yaml: st,pins: missing type definition
   Documentation/devicetree/bindings/pinctrl/atmel,sama5d2-pinctrl.yaml: atmel,drive-strength: missing type definition
   Documentation/devicetree/bindings/pinctrl/sirf,prima2-pinctrl.yaml: sirf,function: missing type definition
   Documentation/devicetree/bindings/soc/fsl/cpm_qe/cpm/fsl,cpm1-i2c.yaml: linux,i2c-index: missing type definition
   Documentation/devicetree/bindings/soc/fsl/cpm_qe/cpm/fsl,cpm1-i2c.yaml: linux,i2c-class: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: gpio-ext: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: timers: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: bright-addr: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,short-detection-threshold-volt: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
