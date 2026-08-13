Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C446C2475D0
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Aug 2026 19:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786649785; cv=none; b=SfBOsxxjEcxk+3Y4LS2FEtimeYEm7kUmu8BOyACNKz59K3EYB+OpO0/Xrb5a8S49TmIEGJJLu8SSt4lLLV+FgILzdIBPKsIpZqqcyF6/LXREfZwalg+ZG556nAWNr1VVKnTsYGBThEst35ilk1pPcIR7btCCg2xl5yUYpT+bDRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786649785; c=relaxed/simple;
	bh=43YH2VzRuMSe/s3YMpD7hNguqSDLRBBxQ/gvia3eL3Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FRufx6lr15JQmhKLIdfcV+jRIiiyKLiQAtc80MlJMq41cSu+kTS0pWfsMv1nMsZ+jlIaxmHmXXur10Wp8Icm8dRj0d3ZCxVV047kH4P4qwqVZme8y6kzjRe9I+jTrfQ0WUX9WzeVShf9uRLmCBoY0G5uNONoZHbziBpK52u2858=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S63Fiqgo; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S63Fiqgo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786649784; x=1818185784;
  h=date:from:to:cc:subject:message-id;
  bh=43YH2VzRuMSe/s3YMpD7hNguqSDLRBBxQ/gvia3eL3Y=;
  b=S63FiqgormXRXFSz5qAQdwfULG/wCnovK0zRi4NdayB3rcKU8/msQINa
   MaRTKAFJ6PhkCJi6g1fg66RaeShRe2H270MUVFtRdUYz/zB6KP0niqcEP
   ljcLphYhTK/+khq9xuUqDdBrtgzG2QEt6elqv2C1Rn6IHSzUOMya82vMz
   U56Bk/flHcHL8+mRgamSecN4AbKhV7LKgzaPpu0raxe9iUilv3uhnz9k+
   BlNUjpk5YcLjFWHLPpUfNPuQ79fw8MKfZzrcfJdkCx/SMxFbxAW9e8U+/
   5sNxDIFDK3RgbxR3gHecTgpZHyiCJ4EuG/dQEbUEvP7V3Suh5IYdNT0tO
   w==;
X-CSE-ConnectionGUID: /Bc+O7P6QOelnwv6tl1Y3Q==
X-CSE-MsgGUID: hGtI4asyS/S77NO7K0vHVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87158030"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="87158030"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 12:36:23 -0700
X-CSE-ConnectionGUID: lTj7aFILSlWc+whzJ6h9wg==
X-CSE-MsgGUID: cIbEyDPbQDmfd05jSt9vIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="266027715"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 13 Aug 2026 12:36:22 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wubDw-0000000065y-1W8p;
	Thu, 13 Aug 2026 19:36:20 +0000
Date: Thu, 13 Aug 2026 21:36:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/microwatt.dtb:
 ibm,powerpc-cpu-features (ibm,powerpc-cpu-features): isa: b'\x00\x00\x0c\x1c'
 is not of type 'object', 'integer', 'array', 'boolean', 'null'
Message-ID: <202608132132.5TcjOUaO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Paul Mackerras <paulus@ozlabs.org>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3d6d817622b0a9721e3cc404df3469171582be13
commit: 7b7b08b508bdbc1c601fd60dd90ca6087609c253 powerpc/microwatt: Correct ISA version number in device tree
date:   1 year, 2 months ago
:::::: branch date: 28 hours ago
:::::: commit date: 1 year, 2 months ago
config: powerpc-randconfig-2051-20260813 (https://download.01.org/0day-ci/archive/20260813/202608132132.5TcjOUaO-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5ca6f7e1bb9eeef5ce8d474569274822b319cf4f)
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608132132.5TcjOUaO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7b7b08b508bd ("powerpc/microwatt: Correct ISA version number in device tree")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608132132.5TcjOUaO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/microwatt.dts:223.27-233.5: Warning (simple_bus_reg): /soc@c0000000/ethernet@8020000: simple-bus unit address format error, expected "8021000"
   arch/powerpc/boot/dts/microwatt.dts:235.15-246.5: Warning (simple_bus_reg): /soc@c0000000/mmc@8040000: simple-bus unit address format error, expected "8042800"
   arch/powerpc/boot/dts/microwatt.dtb: /: failed to match any schema with compatible: ['microwatt-soc']
   arch/powerpc/boot/dts/microwatt.dtb: /cpus/ibm,powerpc-cpu-features: failed to match any schema with compatible: ['ibm,powerpc-cpu-features']
   arch/powerpc/boot/dts/microwatt.dtb: ibm,powerpc-cpu-features (ibm,powerpc-cpu-features): display-name: b'Microwatt\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/powerpc/boot/dts/microwatt.dtb: ibm,powerpc-cpu-features (ibm,powerpc-cpu-features): isa: b'\x00\x00\x0c\x1c' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/microwatt.dtb: ibm,powerpc-cpu-features (ibm,powerpc-cpu-features): 'reg' is a dependency of 'little-endian'
   	from schema $id: http://devicetree.org/schemas/reg.yaml
   arch/powerpc/boot/dts/microwatt.dtb: ibm,powerpc-cpu-features (ibm,powerpc-cpu-features): little-endian: 'oneOf' conditional failed, one must be fixed:
   	True was expected
   	{'isa': b'\x00\x00\x00\x00', 'usable-privilege': b'\x00\x00\x00\x07', 'os-support': b'\x00\x00\x00\x00', 'hwcap-bit-nr': b'\x00\x00\x00\x01'} is not of type 'boolean'
   	{'isa': b'\x00\x00\x00\x00', 'usable-privilege': b'\x00\x00\x00\x07', 'os-support': b'\x00\x00\x00\x00', 'hwcap-bit-nr': b'\x00\x00\x00\x01'} is not of type 'null'
   	from schema $id: http://devicetree.org/schemas/reg.yaml
   arch/powerpc/boot/dts/microwatt.dtb: mmu-radix: isa: b'\x00\x00\x0b\xb8' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
