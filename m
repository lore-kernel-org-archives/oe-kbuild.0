Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928C1359A8F
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Mar 2026 08:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773217376; cv=none; b=kpXtc05vmeHixLV/2KkE3WbzDv4Dd1i1eERM/YoicwOKf7lj6ndEpisN4lNLkUVkgCsUN1IvcJiDRKRBUfxm5p/yhsV7SzLOSnlcl3X6sbluwDa5wKkrOq2Tt57MuHENwvYMk9U6LBjnOKXZQEu3eVaWgRzjqRoplH6QZR8bpzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773217376; c=relaxed/simple;
	bh=a9chHR7P5GBWq/G5NwVT7CLLmwVPY7IVBNDq3hxkZmY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XvHqdZLa9zVBDEiSUCHa6JgtOZcKUf/cdzO8nkzjs1L1CF+EBAyb54rOXZWgdt6jpMeHPVeENbC4hUwrZecmNPnZeTzNrxBmLwPQZlzkes8Cx1rQ6GzfyYK2b2G6lDJrU7fh/63m7o3gsLr28vBPVpwI1+MGqovAfREKVx4pC2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GL/eaQvt; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GL/eaQvt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773217375; x=1804753375;
  h=date:from:to:cc:subject:message-id;
  bh=a9chHR7P5GBWq/G5NwVT7CLLmwVPY7IVBNDq3hxkZmY=;
  b=GL/eaQvtZPLxtS5+AXQNDI4lU30ORC/jYPHgs8Fq1U0nqS0YAAHfrEVQ
   djsyYkRREpa4sc7OMQEXJV1KP+8+OIBZuw88uvCCTzNx83l/fve8GMJ7G
   MWPSJ2pYkuAKa1xkSz0XvYKatlrEX5P6Z2idMKRl2LjHwZwC01wzXXJ5g
   X3zQMND9sQIyAg875mbf6SSSrZ6paIZwy2aQb2yNipubVr5jBtS9tjShm
   fqgbUUKDPLKoFLYhJMhtj+yh3W9neeEWvVdXOJb2tvtlHGiWJQiRbnMsB
   pg0G5PKW8i+M4yW+JbLGNrQUt8L4ZHieq9jUiUnbvejEsgHAZpU0QmniH
   g==;
X-CSE-ConnectionGUID: cno9/zgZRzKJdjHAzjm3cQ==
X-CSE-MsgGUID: Ip7i2qw+QVuEaTnQSBFrZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="84984105"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="84984105"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 01:22:54 -0700
X-CSE-ConnectionGUID: 1hFSV+FJQnCvlWdomoUmqQ==
X-CSE-MsgGUID: 3jWOxtseRm6laMSOFfKrLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="224559429"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 11 Mar 2026 01:22:53 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0EqA-000000003IX-1bYs;
	Wed, 11 Mar 2026 08:22:50 +0000
Date: Wed, 11 Mar 2026 09:22:21 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 337/621]
 Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml:
 dcache-line-size: missing type definition
Message-ID: <202603110909.D84dVo2r-lkp@intel.com>
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
commit: e04af5bc72bc530fc5b3eba0338aea0bf9e6d93d [337/621] dt-bindings: nios2: Convert altr,nios2-1.0 to DT schema
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: arc-randconfig-2051-20260311 (https://download.01.org/0day-ci/archive/20260311/202603110909.D84dVo2r-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603110909.D84dVo2r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603110909.D84dVo2r-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: dcache-line-size: missing type definition
>> Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: icache-line-size: missing type definition
>> Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: dcache-size: missing type definition
>> Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: icache-size: missing type definition
>> Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,tlb-num-ways: missing type definition
>> Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,tlb-num-entries: missing type definition
>> Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,tlb-ptr-sz: missing type definition
>> Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,has-div: missing type definition
>> Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,has-mul: missing type definition
>> Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,has-initda: missing type definition
>> Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,has-mmu: missing type definition
>> Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,reset-addr: missing type definition
>> Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,fast-tlb-miss-addr: missing type definition
>> Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,exception-addr: missing type definition
   Documentation/devicetree/bindings/mmc/cavium,octeon-6130-mmc.yaml: cavium,bus-max-width: missing type definition
   Documentation/devicetree/bindings/memory-controllers/atmel,ebi.yaml: atmel,smc-page-mode: missing type definition
   Documentation/devicetree/bindings/memory-controllers/marvell,mvebu-devbus.yaml: devbus,bus-width: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: gpio-ext: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: timers: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: bright-addr: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,short-detection-threshold-volt: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,current-limit-mA: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: isel: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: fdim: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
