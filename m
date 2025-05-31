Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6503A208A7
	for <oe-kbuild@lists.linux.dev>; Sat, 31 May 2025 06:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748674305; cv=none; b=nAbvnR2r5b2iUYAToisSX5SiOYy+iqlG9TEhHjndc98yKOj+fF8MF5rQcZj/hXgMtEqXHNGwBgIuPGbf0aU1Mi7fsxaTok0xxGKljvCq+vTnlOfTI9/oRb3FYM8LEDepj8s5r3ZrOnXh/C/DBKr3eigQRxuONQESE5agnCidRGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748674305; c=relaxed/simple;
	bh=DLFz4Gbi0bwMy32XLdgzeh13Z8zDCGXoWBW4bIhxOPA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z8KwDDHCnkgCSKnlkLpZ240cSg0/lqHWRUPqqeqIoMldshj72VfGYfB6hnqhAg7NOhoXnX+njXf4fSQBaE5wm/F8lkCuQhNY8PAbtWM2x+Am+/+Glxv+lGuuX/GhojiYL2KiWxFmSaGYn/ijVcoQeef+D/r2uyUq6q3JU83Mgjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dtSgq/ww; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dtSgq/ww"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748674303; x=1780210303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DLFz4Gbi0bwMy32XLdgzeh13Z8zDCGXoWBW4bIhxOPA=;
  b=dtSgq/wwu4dOuDAJc/FC/KBfcljv72DFEgKJ0M4X5m9fcrP0dXTvaSok
   zc3xCwCiy3kXyd5ppg/b5Is/ulJAs3LFBZMcZWAkcOqxSa4XGvC/XL50J
   7vN8OYtnZJZ4mL6rLzEu7tg/9lKfjwWSfDxFQuabRHhFxjx2rOX3CFbUd
   2WIglCXTTWkXDAHcgnSTdZxYsHaXxziRO62SUw/+clCIjeR/uhAmwe247
   mdEF3H5VhQFQGNh1JKtnY3XyLGtznwjut5vFfDGWxcJ/t1eXc0NXLMQQA
   gnKyHG+UqFS7ga0/6gRF8Ro7cW8a4SNFaEEMxDDz8DBk0GkhNyLUXNMSf
   g==;
X-CSE-ConnectionGUID: a8aQ9tNoS9mXJvqWV8NZbQ==
X-CSE-MsgGUID: 7mUEGoYmQLaYwBlUNqOlEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="61388755"
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="61388755"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 23:51:43 -0700
X-CSE-ConnectionGUID: 0civyq3EQnipWlaCpYlJcQ==
X-CSE-MsgGUID: Olnvxrp/RZmN2yfvyREuZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="144546619"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 May 2025 23:51:42 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLG4B-000YFc-2h;
	Sat, 31 May 2025 06:51:39 +0000
Date: Sat, 31 May 2025 14:51:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:master 12/33]
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: i2c@14400400
 (renesas,riic-r9a09g056): compatible: 'oneOf' conditional failed, one must
 be fixed:
Message-ID: <202505311427.4KOiD7Rt-lkp@intel.com>
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
commit: dd019682b48de9895eb62a0c7f213fceac4e316b [12/33] arm64: dts: renesas: r9a09g056: Add RIIC controllers
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-051-20250530 (https://download.01.org/0day-ci/archive/20250531/202505311427.4KOiD7Rt-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505311427.4KOiD7Rt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505311427.4KOiD7Rt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r9a07g043', 'renesas,scif-r9a07g054', 'renesas,scif-r9a08g045']
   	'renesas,scif-r9a09g057' was expected
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r9a09g047']
   	'renesas,scif' was expected
   	'renesas,rcar-gen1-scif' was expected
   	'renesas,rcar-gen2-scif' was expected
   	'renesas,rcar-gen3-scif' was expected
   	'renesas,rcar-gen4-scif' was expected
   	'renesas,scif-r9a07g044' was expected
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: i2c@14400400 (renesas,riic-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,riic-r9a09g056', 'renesas,riic-r9a09g057'] is too long
   	'renesas,riic-r9a09g056' is not one of ['renesas,riic-r7s72100', 'renesas,riic-r7s9210', 'renesas,riic-r9a07g043', 'renesas,riic-r9a07g044', 'renesas,riic-r9a07g054']
   	'renesas,riic-r9a09g056' is not one of ['renesas,riic-r9a08g045', 'renesas,riic-r9a09g047']
   	'renesas,riic-r9a09g057' was expected
   	'renesas,riic-rz' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,riic.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: i2c@14400800 (renesas,riic-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,riic-r9a09g056', 'renesas,riic-r9a09g057'] is too long
   	'renesas,riic-r9a09g056' is not one of ['renesas,riic-r7s72100', 'renesas,riic-r7s9210', 'renesas,riic-r9a07g043', 'renesas,riic-r9a07g044', 'renesas,riic-r9a07g054']
   	'renesas,riic-r9a09g056' is not one of ['renesas,riic-r9a08g045', 'renesas,riic-r9a09g047']
   	'renesas,riic-r9a09g057' was expected
   	'renesas,riic-rz' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,riic.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: i2c@14400c00 (renesas,riic-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,riic-r9a09g056', 'renesas,riic-r9a09g057'] is too long
   	'renesas,riic-r9a09g056' is not one of ['renesas,riic-r7s72100', 'renesas,riic-r7s9210', 'renesas,riic-r9a07g043', 'renesas,riic-r9a07g044', 'renesas,riic-r9a07g054']
   	'renesas,riic-r9a09g056' is not one of ['renesas,riic-r9a08g045', 'renesas,riic-r9a09g047']
   	'renesas,riic-r9a09g057' was expected
   	'renesas,riic-rz' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,riic.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: i2c@14401000 (renesas,riic-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,riic-r9a09g056', 'renesas,riic-r9a09g057'] is too long
   	'renesas,riic-r9a09g056' is not one of ['renesas,riic-r7s72100', 'renesas,riic-r7s9210', 'renesas,riic-r9a07g043', 'renesas,riic-r9a07g044', 'renesas,riic-r9a07g054']
   	'renesas,riic-r9a09g056' is not one of ['renesas,riic-r9a08g045', 'renesas,riic-r9a09g047']
--
   	'renesas,riic-r9a09g057' was expected
   	'renesas,riic-rz' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,riic.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: i2c@14401800 (renesas,riic-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,riic-r9a09g056', 'renesas,riic-r9a09g057'] is too long
   	'renesas,riic-r9a09g056' is not one of ['renesas,riic-r7s72100', 'renesas,riic-r7s9210', 'renesas,riic-r9a07g043', 'renesas,riic-r9a07g044', 'renesas,riic-r9a07g054']
   	'renesas,riic-r9a09g056' is not one of ['renesas,riic-r9a08g045', 'renesas,riic-r9a09g047']
   	'renesas,riic-r9a09g057' was expected
   	'renesas,riic-rz' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,riic.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: i2c@14401c00 (renesas,riic-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,riic-r9a09g056', 'renesas,riic-r9a09g057'] is too long
   	'renesas,riic-r9a09g056' is not one of ['renesas,riic-r7s72100', 'renesas,riic-r7s9210', 'renesas,riic-r9a07g043', 'renesas,riic-r9a07g044', 'renesas,riic-r9a07g054']
   	'renesas,riic-r9a09g056' is not one of ['renesas,riic-r9a08g045', 'renesas,riic-r9a09g047']
   	'renesas,riic-r9a09g057' was expected
   	'renesas,riic-rz' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,riic.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: i2c@14402000 (renesas,riic-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,riic-r9a09g056', 'renesas,riic-r9a09g057'] is too long
   	'renesas,riic-r9a09g056' is not one of ['renesas,riic-r7s72100', 'renesas,riic-r7s9210', 'renesas,riic-r9a07g043', 'renesas,riic-r9a07g044', 'renesas,riic-r9a07g054']
   	'renesas,riic-r9a09g056' is not one of ['renesas,riic-r9a08g045', 'renesas,riic-r9a09g047']
   	'renesas,riic-r9a09g057' was expected
   	'renesas,riic-rz' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,riic.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: i2c@11c01000 (renesas,riic-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,riic-r9a09g056', 'renesas,riic-r9a09g057'] is too long
   	'renesas,riic-r9a09g056' is not one of ['renesas,riic-r7s72100', 'renesas,riic-r7s9210', 'renesas,riic-r9a07g043', 'renesas,riic-r9a07g044', 'renesas,riic-r9a07g054']
   	'renesas,riic-r9a09g056' is not one of ['renesas,riic-r9a08g045', 'renesas,riic-r9a09g047']
   	'renesas,riic-r9a09g057' was expected
   	'renesas,riic-rz' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/renesas,riic.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: mmc@15c00000 (renesas,sdhi-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,sdhi-r9a09g056', 'renesas,sdhi-r9a09g057'] is too long
   	'renesas,sdhi-r9a09g056' is not one of ['renesas,sdhi-mmc-r8a77470', 'renesas,sdhi-r7s72100', 'renesas,sdhi-r7s9210', 'renesas,sdhi-r8a73a4', 'renesas,sdhi-r8a7740', 'renesas,sdhi-r9a09g057', 'renesas,sdhi-sh73a0']
   	'renesas,sdhi-r9a09g056' is not one of ['renesas,sdhi-r8a7778', 'renesas,sdhi-r8a7779']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
