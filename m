Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A295B22FE0E
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Nov 2025 08:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762157401; cv=none; b=BwjGaOkNEOB2KJa5DCf6EVM6xjGABeJbM9shdyFxI+Tg5CadugDtJtFG5MxPKAbg+pQfcDBCQscGJz8YWIFiVuYOnNnN0wYrvrSpPhZvA1LoSR4gKlwgTDLfxCqyz+t2yAnfmFXjamnab3Rk3MYE6xb4qmjdwVZprwV3mfcfaI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762157401; c=relaxed/simple;
	bh=CvO/EFZOELfO4f38e5/S+VWPDl8ERY/4GmgtaqlLRWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nL6yzeWKobV+ls/NSj/DCscLNP1N/tblowLxtrcbCW0QhW3KUUgG+NJ8OQQFCKUuoKtOWpawfUGDH+xPARC6e49zPEDe90GC40DV+rG9qH24uCVyazm2opl+jLLDrFDPoB+repeiZmIXm9HiypKbI1DrQjLYcZrvQy6DU0a7C9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hxmPmVYN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hxmPmVYN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762157400; x=1793693400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CvO/EFZOELfO4f38e5/S+VWPDl8ERY/4GmgtaqlLRWA=;
  b=hxmPmVYNEllfOGXrLBXb6SQAFiyQk0S32UnIAgiVp84DAaHNnVuPu6oh
   gmJV3waCiG9m0rbTfGksO/IXt/gj7j4AvJyaE+gZ24uNZDkIW1dhsZlGH
   CcZXBDVtepgdEUnVkDGz30w6mFn2XEgsUr24VHPcTfgaEwtTTuFmM+65s
   RVt9RGTjjooU3StpPecP0cSKalg9ZbFI6XUajDIO606eGect51dwZi0WE
   EE3Fxu+XBFvm/hOPDYpz5RTyj3DniMZNS73B5ZZTjtKfHLCt23iyl0/XE
   ZvNUJiS3Hxng5jq7rtv0bMy/WS96HuE7m7M/s1qqxll041/ob8ZpW5R0F
   g==;
X-CSE-ConnectionGUID: oWIGcdmMR6Krbo0H53GrnQ==
X-CSE-MsgGUID: HGeIeuhITLKwoyhbQF3AKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="66840572"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="66840572"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 00:09:55 -0800
X-CSE-ConnectionGUID: dUcMXu4hRqKrDv0NhRQdLg==
X-CSE-MsgGUID: jELYM5VnRF2uOD1agtTvKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="217438755"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 03 Nov 2025 00:09:54 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vFpdP-000000001eC-1I4O;
	Mon, 03 Nov 2025 08:09:51 +0000
Date: Mon, 3 Nov 2025 09:09:15 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:syscon-rework-5 7/10]
 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: syscon@20002000
 (microchip,mpfs-mss-top-sysreg): compatible:
 ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
Message-ID: <202511030955.h64bAIgr-lkp@intel.com>
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
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git syscon-rework-5
head:   4ff63fd155d37d3d094142d50ef8e0887008d47d
commit: ae72df1822d0fb4420a5b12eb1bdbc5a01b5407e [7/10] riscv: dts: microchip: convert clock and reset to use syscon
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-2051-20251102 (https://download.01.org/0day-ci/archive/20251103/202511030955.h64bAIgr-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 20c323aa0e5dea6f3d340c721c5cee30801db850)
dtschema version: 2025.9.dev13+gc72762e0c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511030955.h64bAIgr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511030955.h64bAIgr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
--
>> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
--
>> arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
--
>> arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
--
>> arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
--
>> arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
