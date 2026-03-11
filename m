Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9D03BD231
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Mar 2026 09:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773220442; cv=none; b=UmiShoKg/JEMWpvREP9x9vk2pjMvpiR5CmSExn08qESVg4dKGHEAh3FK3Q4KlhBdCsUhupCrzEGA7Ajj+amAeuhmVoWEw9VSndR7fPsDjVYM6YGgXhA24Cl/SuZ+3JHG31AkSLM9RlSq9GUUbKy52/+ZHM2NVQc84J4ISQhH8vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773220442; c=relaxed/simple;
	bh=S7SFwhJCVL7DZI2YBq2OcF9E0YWzZ4HxoNx1BTOmMn8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AQmpjRYpaJcQ2CZbDn+qyZhOupsBjJVPAKckfOpEsnS69iHwkv2lXluabthlC8jJwesDMlC6koX7EbwXImya4n/Xl2fCrosABZpmZXURmWxaYVq16pF4CnqSS6RfxDSwiozReqwRpPT27fOuWy+Tg1XnajqUmFsrL6QSbUrOvas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ho/l/QAP; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ho/l/QAP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773220435; x=1804756435;
  h=date:from:to:cc:subject:message-id;
  bh=S7SFwhJCVL7DZI2YBq2OcF9E0YWzZ4HxoNx1BTOmMn8=;
  b=Ho/l/QAPHwHi8nApcw+0iiO0yMUpxt+wdr1td/q59+/9lHBukxromnK6
   /WiDcxD/tXpL4KEYEdiLFt1t/VoiIllNxLVT1gF9o/XUKb3Sz3L+mJ8MH
   6LC2xM/EqV9RqRtmUiflD9Ao5ohbuX5bUNzlq6V2QJraIKt2ogsjD8STq
   j2G0eBqjlP12Vf4CHCUMpHreKPJiDbIIywo57Qdu4Qr4Yc5fYl1FU7Xzl
   ILIio7fOrkgzrNeLuVQy2aa4/BPsCXp34VOrbswJsnpu/YZd3xgQO+F8G
   xBXkRPMqdmDWWe775aR/e35b/FDKlrXJTQwjyc7xm9CLh5TUXz+gL9ElO
   Q==;
X-CSE-ConnectionGUID: qrYzuH6IRuuVWl8b9ROKWQ==
X-CSE-MsgGUID: D+YYpmzFQPOQNuT+Nq60EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="77887792"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="77887792"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:13:54 -0700
X-CSE-ConnectionGUID: 8NuGr7y5R0WtOFu05OHG3A==
X-CSE-MsgGUID: +8TlESh2TIWMaNRhoEkYVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="224570108"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 11 Mar 2026 02:13:53 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0FdW-000000003Ij-2OiD;
	Wed, 11 Mar 2026 09:13:50 +0000
Date: Wed, 11 Mar 2026 10:13:11 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 348/621]
 Documentation/devicetree/bindings/pinctrl/atmel,sama5d2-pinctrl.yaml:
 atmel,drive-strength: missing type definition
Message-ID: <202603111059.YCi5XuBn-lkp@intel.com>
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
commit: 602a9ba5373fab04ad0a7c22dd6da6afe8c81cc3 [348/621] dt-bindings: pinctrl: Convert atmel,sama5d2-pinctrl to DT schema
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arc-randconfig-2051-20260311 (https://download.01.org/0day-ci/archive/20260311/202603111059.YCi5XuBn-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111059.YCi5XuBn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603111059.YCi5XuBn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,has-div: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,has-mul: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,has-initda: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,has-mmu: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,reset-addr: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,fast-tlb-miss-addr: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,exception-addr: missing type definition
   Documentation/devicetree/bindings/mmc/cavium,octeon-6130-mmc.yaml: cavium,bus-max-width: missing type definition
   Documentation/devicetree/bindings/memory-controllers/atmel,ebi.yaml: atmel,smc-page-mode: missing type definition
   Documentation/devicetree/bindings/memory-controllers/marvell,mvebu-devbus.yaml: devbus,bus-width: missing type definition
>> Documentation/devicetree/bindings/pinctrl/atmel,sama5d2-pinctrl.yaml: atmel,drive-strength: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: bright-addr: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: gpio-ext: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: timers: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,short-detection-threshold-volt: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,current-limit-mA: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: isel: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: fdim: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: mal-tx-channel: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: mal-rx-channel: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: rx-fifo-size: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
