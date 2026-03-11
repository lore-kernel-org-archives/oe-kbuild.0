Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A8F3CFF7B
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Mar 2026 11:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773229016; cv=none; b=nE5g0/evyHMYQ/64h4LLKz1HxPFHsG5e9oU8L95+KYGwGlRj6/dY3+fSC/XJkmMK42PGf8U6+4JRZ9yR1AI0jMrTobGOJ3wdzKS+Clc0vKcg7Fwxtgr64vTBOdifJK9BMA762giSogAeYDbkCdQN/jE8NqLQ3bTaNV+vR7dC41k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773229016; c=relaxed/simple;
	bh=dL7R34PWE8PC/MW0n29hi98HPsIKtBsDLOrUf02FMhg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JiuZLFOoV49IvIL3t+n8sK0H15E2MGOS9ghr2aidzUh/0YxOTABaJrlWDyg84iUUnCliLQbdsP6+jRRHM/3Wt5VXeB0ehzqKZG0cZAHjZ9SM2rUUhvqC5vjJi/UWUk1QnWwJHXIcceJfu0opVdffOQ+saVFgFUa7r0bSkRRXDLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eYkuwZUj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eYkuwZUj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773229015; x=1804765015;
  h=date:from:to:cc:subject:message-id;
  bh=dL7R34PWE8PC/MW0n29hi98HPsIKtBsDLOrUf02FMhg=;
  b=eYkuwZUjAVGiFotogKtKX4vyly7W+XukZ6s/S8ondVEFemu4POHSL+lA
   1ABfNpE3KK9U8qOF+P+6MQBCcfs8VxwCZpgCPpNZmbox4Oh0TWYRIV5ff
   6K3YN5MVAZwkqOHl9t3Iye94qTklBPseU05+DUwjVlrjP7Wu+Y15OtPr+
   xIEfKrlpgvZHLPXYr4foytabOJ+dQcMg0zWRPRw5q0hm+3to4eeiaVJBq
   FNEmc6j20nKdLWYCk+ZdBN3kkWNjmqsmyqg76hVQwG2Gj0CV+GuGUnQV8
   3nGA/RBwRm4CFLgQek6iB9ISw+gNYHECSFE90SjurraWdAf4IWXA1nsCY
   Q==;
X-CSE-ConnectionGUID: spcU9QENRhiaalTHYkHNeg==
X-CSE-MsgGUID: mCWfeT1zTcaJYJdvf1wAfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85380431"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="85380431"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 04:36:54 -0700
X-CSE-ConnectionGUID: jZPU1oeGT/uid5IQe7TNkQ==
X-CSE-MsgGUID: AMmVuuMST8yR5Kt4p06gUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="220492083"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 11 Mar 2026 04:36:52 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0Hrv-000000003Jf-1k5q;
	Wed, 11 Mar 2026 11:36:51 +0000
Date: Wed, 11 Mar 2026 12:36:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 404/621]
 Documentation/devicetree/bindings/powerpc/ibm,vas.yaml: name: missing type
 definition
Message-ID: <202603111226.UA5TRLh2-lkp@intel.com>
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
commit: 05651a5de128a9271a9740feac5f2c92ffa1ec76 [404/621] dt-bindings: powerpc: Convert ibm,vas to DT schema
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arc-randconfig-2051-20260311 (https://download.01.org/0day-ci/archive/20260311/202603111226.UA5TRLh2-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111226.UA5TRLh2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603111226.UA5TRLh2-lkp@intel.com/

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
>> Documentation/devicetree/bindings/powerpc/ibm,vas.yaml: name: missing type definition
   Documentation/devicetree/bindings/pinctrl/st,spear300-pinmux.yaml: st,pinmux-mode: missing type definition
   Documentation/devicetree/bindings/pinctrl/st,spear300-pinmux.yaml: st,pins: missing type definition
   Documentation/devicetree/bindings/pinctrl/atmel,sama5d2-pinctrl.yaml: atmel,drive-strength: missing type definition
   Documentation/devicetree/bindings/pinctrl/sirf,prima2-pinctrl.yaml: sirf,function: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: gpio-ext: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: timers: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: bright-addr: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,short-detection-threshold-volt: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,current-limit-mA: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: isel: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
