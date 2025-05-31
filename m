Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617E61F03D4
	for <oe-kbuild@lists.linux.dev>; Sat, 31 May 2025 11:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748692328; cv=none; b=lDAtMtsWPweX/mdKCRmt1d3Mu6AC3518Siski064U85LpS+6Uf/UC675ou8qbkN8t0uD3kmjkJMSfMyUSKP6/CJUcvtNnuwtYwwSfB936TKS0r2fxt6yCkmrAj222Kyi9RHC7vurNMR2cMrnGU0DGkcHc6GTrYbr3t53vcIt4Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748692328; c=relaxed/simple;
	bh=LkTmFRv/hwoqCvXVcQI2WAcFTxz7J/kPG7VQTHuYsd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qxWPhVYChjqc90Bfz55G8Av8lvFId0sRg6jgF+ZcV1yT/iYJlY0yoyKdxZTATysFCPaSRSVRi/M2WZMmlvPPCeYRssX8lSHodVVPep8oePBVnQeOVRkVlqceV7087LXxeq6rk1PhRMyh93khRfVMwpevRJGZAfrg/c34dcGhdNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UsZLvYZY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UsZLvYZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748692326; x=1780228326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LkTmFRv/hwoqCvXVcQI2WAcFTxz7J/kPG7VQTHuYsd4=;
  b=UsZLvYZY0XvYibKyLEfRmpaU94lARmOoEw6P7TkJGcC04Sa3iG+DrXIF
   K1m5dk2hq2Wt08mKvY7YhE3qsXICPQin9dJFFi3e2OonIBWk8AJQqOCaX
   bqbPLIT8PVkdXtlsHZQeRtS90vsZ04hfdUxKozSZfxkA3/jbYuhAhVUvx
   LtuVWd6hVVIAMTQbuK9IM+X7VVKHRqQaIaPVUww0HZelh9tr9BqtrV7tN
   p/M/1Yhy/dw7AjnDnP+cYgW737g4Rx6D2ARoNxuFPh7q1ZK4DCxw4FpJm
   gfecQkx88cjrySj8Yqrl8KvdlhA2ZhsoooAoxvRMqx4jPFVAKZMHKMsD1
   Q==;
X-CSE-ConnectionGUID: A1w8qME0S3yrWUOGlV+C7Q==
X-CSE-MsgGUID: 5cNx/DazRV6ZriVn9mITsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="73305415"
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="73305415"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 04:52:05 -0700
X-CSE-ConnectionGUID: VFINQ4QsQLSK8iRaQMxypw==
X-CSE-MsgGUID: CIP7+OC1TFOq1PjwM7KA/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="175120391"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 May 2025 04:52:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLKks-000YNM-2V;
	Sat, 31 May 2025 11:52:02 +0000
Date: Sat, 31 May 2025 19:51:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:master 14/33]
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: watchdog@11c00400
 (renesas,r9a09g056-wdt): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202505311908.VAOa2HmN-lkp@intel.com>
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
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
head:   0cc4c9c39e8953745481c13288a46edc616dc7cd
commit: b02907e6cd423253a5b19fd42e43d1c16e0fed89 [14/33] arm64: dts: renesas: r9a09g056: Add WDT0-WDT3 nodes
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-051-20250530 (https://download.01.org/0day-ci/archive/20250531/202505311908.VAOa2HmN-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505311908.VAOa2HmN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505311908.VAOa2HmN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: timer@14001000 (renesas,r9a09g056-ostm): compatible:0: 'renesas,r9a09g056-ostm' is not one of ['renesas,r7s72100-ostm', 'renesas,r7s9210-ostm', 'renesas,r9a07g043-ostm', 'renesas,r9a07g044-ostm', 'renesas,r9a07g054-ostm', 'renesas,r9a09g057-ostm']
   	from schema $id: http://devicetree.org/schemas/timer/renesas,ostm.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: timer@12c00000 (renesas,r9a09g056-ostm): compatible:0: 'renesas,r9a09g056-ostm' is not one of ['renesas,r7s72100-ostm', 'renesas,r7s9210-ostm', 'renesas,r9a07g043-ostm', 'renesas,r9a07g044-ostm', 'renesas,r9a07g054-ostm', 'renesas,r9a09g057-ostm']
   	from schema $id: http://devicetree.org/schemas/timer/renesas,ostm.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: timer@12c01000 (renesas,r9a09g056-ostm): compatible:0: 'renesas,r9a09g056-ostm' is not one of ['renesas,r7s72100-ostm', 'renesas,r7s9210-ostm', 'renesas,r9a07g043-ostm', 'renesas,r9a07g044-ostm', 'renesas,r9a07g054-ostm', 'renesas,r9a09g057-ostm']
   	from schema $id: http://devicetree.org/schemas/timer/renesas,ostm.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: timer@12c02000 (renesas,r9a09g056-ostm): compatible:0: 'renesas,r9a09g056-ostm' is not one of ['renesas,r7s72100-ostm', 'renesas,r7s9210-ostm', 'renesas,r9a07g043-ostm', 'renesas,r9a07g044-ostm', 'renesas,r9a07g054-ostm', 'renesas,r9a09g057-ostm']
   	from schema $id: http://devicetree.org/schemas/timer/renesas,ostm.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: timer@12c03000 (renesas,r9a09g056-ostm): compatible:0: 'renesas,r9a09g056-ostm' is not one of ['renesas,r7s72100-ostm', 'renesas,r7s9210-ostm', 'renesas,r9a07g043-ostm', 'renesas,r9a07g044-ostm', 'renesas,r9a07g054-ostm', 'renesas,r9a09g057-ostm']
   	from schema $id: http://devicetree.org/schemas/timer/renesas,ostm.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: watchdog@11c00400 (renesas,r9a09g056-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g056-wdt', 'renesas,r9a09g057-wdt'] is too long
   	'renesas,r9a09g056-wdt' is not one of ['renesas,r7s72100-wdt', 'renesas,r7s9210-wdt']
   	'renesas,r9a09g056-wdt' is not one of ['renesas,r9a06g032-wdt']
   	'renesas,r9a09g056-wdt' is not one of ['renesas,r9a07g043-wdt', 'renesas,r9a07g044-wdt', 'renesas,r9a07g054-wdt', 'renesas,r9a08g045-wdt']
   	'renesas,r9a09g056-wdt' is not one of ['renesas,r9a09g011-wdt']
   	'renesas,r9a09g056-wdt' is not one of ['renesas,r8a7742-wdt', 'renesas,r8a7743-wdt', 'renesas,r8a7744-wdt', 'renesas,r8a7745-wdt', 'renesas,r8a77470-wdt', 'renesas,r8a7790-wdt', 'renesas,r8a7791-wdt', 'renesas,r8a7792-wdt', 'renesas,r8a7793-wdt', 'renesas,r8a7794-wdt']
   	'renesas,r9a09g056-wdt' is not one of ['renesas,r8a774a1-wdt', 'renesas,r8a774b1-wdt', 'renesas,r8a774c0-wdt', 'renesas,r8a774e1-wdt', 'renesas,r8a7795-wdt', 'renesas,r8a7796-wdt', 'renesas,r8a77961-wdt', 'renesas,r8a77965-wdt', 'renesas,r8a77970-wdt', 'renesas,r8a77980-wdt', 'renesas,r8a77990-wdt', 'renesas,r8a77995-wdt']
   	'renesas,r9a09g056-wdt' is not one of ['renesas,r8a779a0-wdt', 'renesas,r8a779f0-wdt', 'renesas,r8a779g0-wdt', 'renesas,r8a779h0-wdt']
   	'renesas,r9a09g047-wdt' was expected
   	'renesas,r9a09g057-wdt' was expected
   	'renesas,rza-wdt' was expected
   	'renesas,rzn1-wdt' was expected
   	'renesas,rzg2l-wdt' was expected
   	'renesas,rzv2m-wdt' was expected
   	'renesas,rcar-gen2-wdt' was expected
   	'renesas,rcar-gen3-wdt' was expected
   	'renesas,rcar-gen4-wdt' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/renesas,wdt.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: watchdog@14400000 (renesas,r9a09g056-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g056-wdt', 'renesas,r9a09g057-wdt'] is too long
   	'renesas,r9a09g056-wdt' is not one of ['renesas,r7s72100-wdt', 'renesas,r7s9210-wdt']
   	'renesas,r9a09g056-wdt' is not one of ['renesas,r9a06g032-wdt']
   	'renesas,r9a09g056-wdt' is not one of ['renesas,r9a07g043-wdt', 'renesas,r9a07g044-wdt', 'renesas,r9a07g054-wdt', 'renesas,r9a08g045-wdt']
   	'renesas,r9a09g056-wdt' is not one of ['renesas,r9a09g011-wdt']
   	'renesas,r9a09g056-wdt' is not one of ['renesas,r8a7742-wdt', 'renesas,r8a7743-wdt', 'renesas,r8a7744-wdt', 'renesas,r8a7745-wdt', 'renesas,r8a77470-wdt', 'renesas,r8a7790-wdt', 'renesas,r8a7791-wdt', 'renesas,r8a7792-wdt', 'renesas,r8a7793-wdt', 'renesas,r8a7794-wdt']
   	'renesas,r9a09g056-wdt' is not one of ['renesas,r8a774a1-wdt', 'renesas,r8a774b1-wdt', 'renesas,r8a774c0-wdt', 'renesas,r8a774e1-wdt', 'renesas,r8a7795-wdt', 'renesas,r8a7796-wdt', 'renesas,r8a77961-wdt', 'renesas,r8a77965-wdt', 'renesas,r8a77970-wdt', 'renesas,r8a77980-wdt', 'renesas,r8a77990-wdt', 'renesas,r8a77995-wdt']
   	'renesas,r9a09g056-wdt' is not one of ['renesas,r8a779a0-wdt', 'renesas,r8a779f0-wdt', 'renesas,r8a779g0-wdt', 'renesas,r8a779h0-wdt']
   	'renesas,r9a09g047-wdt' was expected
   	'renesas,r9a09g057-wdt' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
