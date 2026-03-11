Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97313DC4CA
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Mar 2026 12:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773232077; cv=none; b=tpJ8jIqBAitVmFWyfWNUtw7DSo79PLjr14iiEZB0Z3Y4AITi3IVN3UnOyCH4YCdfznVJJ3dDDB10FHWDTMRcUUYYU3qiKPb0rS1oTAsX83eW8m/uKGaZuQPL13Hyd7XNMYR1BrREh8UpUlbpMTOzh1SJGvYM1ylEdk63djCJHkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773232077; c=relaxed/simple;
	bh=xM/8oLAhYEnO5bLon1Hty891LdCsCEyNMHh2fX7q3uI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uCb6KeBgfMBhU19O3FoqkTi5atBtF0mJ1dOlOurQ+PwzfNBkt2r0ljaykHak7cvL83bFMWJpmoUsQCnjRR9v+r/kgv0gdKJOq1AXWP3RPhoEj3Gj2QHErkqSgY5iV5wd8iUKRNgilhPVNTefM+5pGc4JuSoTRxqTKSExTa0nN1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TqZeQlTb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TqZeQlTb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773232076; x=1804768076;
  h=date:from:to:cc:subject:message-id;
  bh=xM/8oLAhYEnO5bLon1Hty891LdCsCEyNMHh2fX7q3uI=;
  b=TqZeQlTbLfUNhC4rckiNSr+Fy2KylZ1so8YhcKaCKfkNDejRxhk+YB6Y
   OgxINIeOXKtjErgBo7fg+9DZro2NE7AzBzixcypuwahRuzFpbUjB7T1nL
   G+8FVhlrVsBdluB1a/4PWqElb2NupJoIbG30dOPSdL67AYQWVSMh19f4Z
   nUmSX8CKbAL4LxVDk706uMiEJQmcR3EMwYgQcVOPyU5p7+qOtrVhEJVE/
   SC0P66L0lymPe6h6gIO+1FNdI0XWCKNZEXCiQRx03X7fDHkquuiYx+KwE
   eWdX9etiL8rfgweCjxianhx8uIByKxWJvl7T4jxkecqGjC29IQzkKUXYx
   g==;
X-CSE-ConnectionGUID: sT1vNKCiRfOdaqcw3ihVzQ==
X-CSE-MsgGUID: xWbjWmOCQB2qDigIqiTGug==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74195136"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74195136"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 05:27:56 -0700
X-CSE-ConnectionGUID: fayhwpTYT3Se4upKeldalQ==
X-CSE-MsgGUID: wgCa8RMDQ5CthyeZpkcbUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="220397566"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 11 Mar 2026 05:27:54 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0IfH-000000003KA-3c4K;
	Wed, 11 Mar 2026 12:27:51 +0000
Date: Wed, 11 Mar 2026 13:27:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 411/621]
 Documentation/devicetree/bindings/power/reset/ti,keystone-reset.yaml:
 ti,syscon-pll: missing type definition
Message-ID: <202603111346.xcRCbknR-lkp@intel.com>
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
commit: 42b57e45086f542ab97370c1c1c1d5f3e8c24e24 [411/621] dt-bindings: power: Convert reset/ti,keystone-reset to DT schema
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arc-randconfig-2051-20260311 (https://download.01.org/0day-ci/archive/20260311/202603111346.xcRCbknR-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111346.xcRCbknR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603111346.xcRCbknR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,tlb-num-entries: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,tlb-ptr-sz: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,has-div: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,has-mul: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,has-initda: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,has-mmu: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,reset-addr: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,fast-tlb-miss-addr: missing type definition
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,exception-addr: missing type definition
   Documentation/devicetree/bindings/mmc/cavium,octeon-6130-mmc.yaml: cavium,bus-max-width: missing type definition
>> Documentation/devicetree/bindings/power/reset/ti,keystone-reset.yaml: ti,syscon-pll: missing type definition
   Documentation/devicetree/bindings/memory-controllers/atmel,ebi.yaml: atmel,smc-page-mode: missing type definition
   Documentation/devicetree/bindings/memory-controllers/marvell,mvebu-devbus.yaml: devbus,bus-width: missing type definition
   Documentation/devicetree/bindings/powerpc/ibm,vas.yaml: name: missing type definition
   Documentation/devicetree/bindings/pinctrl/st,spear300-pinmux.yaml: st,pinmux-mode: missing type definition
   Documentation/devicetree/bindings/pinctrl/st,spear300-pinmux.yaml: st,pins: missing type definition
   Documentation/devicetree/bindings/pinctrl/atmel,sama5d2-pinctrl.yaml: atmel,drive-strength: missing type definition
   Documentation/devicetree/bindings/pinctrl/sirf,prima2-pinctrl.yaml: sirf,function: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: gpio-ext: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: timers: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: bright-addr: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
