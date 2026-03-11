Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AE63BC66C
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Mar 2026 10:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773223496; cv=none; b=TMjXcXbHz9ho6YiPCOtmsJTnOCpY9PoYyNIRUTsZrH7briR8UDeqP1h15sk+CfrC7EakjQ6PBVf02t2t6cBXxSgsf1S+XDx2s9EK2MjD7P05OdEhxYlIDQnGhez5fl5DEblCCOUcwCiIarAnrqIh58ryzDxYzsMd3XC5PWhcApA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773223496; c=relaxed/simple;
	bh=wUytd9fOb/qRmq0f/7d3eASzCGOTzGrfqAXKMUq12Tk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pAY4f4GkPI+ZAieWkQMvkkmpOrizNhx/vIIZUES2PiZoDrkLH8K7O5AEia1um2VhuSo1GyeTOTnLOlVFIikxNSSm6tG6p/onbd0N2jz4udeKVbESSadtyuAPC+CYOkiYAAsCMJU1ket49shAGnUXTJ1tC8D3/zpvg4RvYuhQPDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O0u+63JR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0u+63JR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773223495; x=1804759495;
  h=date:from:to:cc:subject:message-id;
  bh=wUytd9fOb/qRmq0f/7d3eASzCGOTzGrfqAXKMUq12Tk=;
  b=O0u+63JRL3ZZpMAQu/+pukcadaJphSiAOzAKxzNuPB2Mz97zf54CPhbh
   xv/Z28miIVE3voYLFuSIrLMJ6W7a0l5Ho0t9uSAvrMLCBNx/7FggJGT46
   40YA7y1T3HAWSBnroltjSSo+DphLcAg/izSjA7pe+Nc9uGwGHkQhtsxaP
   jYAiA7923JBYMXSSYV3Z1iN+rT7UItqNrt2JZynYpbw8h2Sp2wQfycixe
   AG6pCHkfhrp/WzA2DsIVTxTnltOwjRrWgyhwPkTnGDnKbyU+QntZ8ZgT+
   98GQftUfNKZNhAIDRzwsPo7YMyDFk2xygDs08vatHqClO8CrTX7XvWp2e
   A==;
X-CSE-ConnectionGUID: sn1zYna7SXKPwGPE+4xgKQ==
X-CSE-MsgGUID: uxjckFn1QfW5iqq0a7xsZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="73984225"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="73984225"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 03:04:54 -0700
X-CSE-ConnectionGUID: Qe5v4xVdSSy6/svHMr+yig==
X-CSE-MsgGUID: dbtCzEH8RFCDovpl4NmuIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="225375509"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 11 Mar 2026 03:04:54 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0GQs-000000003In-2ox8;
	Wed, 11 Mar 2026 10:04:50 +0000
Date: Wed, 11 Mar 2026 11:03:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 373/621]
 Documentation/devicetree/bindings/pinctrl/sirf,prima2-pinctrl.yaml:
 sirf,function: missing type definition
Message-ID: <202603111025.XPu5RhQw-lkp@intel.com>
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
commit: 9b88438c2032e54a4f82c1681d16abc5bb2b0628 [373/621] dt-bindings: pinctrl: Convert sirf,prima2-pinctrl to DT schema
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arc-randconfig-2051-20260311 (https://download.01.org/0day-ci/archive/20260311/202603111025.XPu5RhQw-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111025.XPu5RhQw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603111025.XPu5RhQw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,has-mul: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,has-initda: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,has-mmu: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,reset-addr: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,fast-tlb-miss-addr: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,exception-addr: missing type definition
   Documentation/devicetree/bindings/mmc/cavium,octeon-6130-mmc.yaml: cavium,bus-max-width: missing type definition
   Documentation/devicetree/bindings/memory-controllers/atmel,ebi.yaml: atmel,smc-page-mode: missing type definition
   Documentation/devicetree/bindings/memory-controllers/marvell,mvebu-devbus.yaml: devbus,bus-width: missing type definition
   Documentation/devicetree/bindings/pinctrl/atmel,sama5d2-pinctrl.yaml: atmel,drive-strength: missing type definition
>> Documentation/devicetree/bindings/pinctrl/sirf,prima2-pinctrl.yaml: sirf,function: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: gpio-ext: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: timers: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: bright-addr: missing type definition
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
