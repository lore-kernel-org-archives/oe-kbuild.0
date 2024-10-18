Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C9C13D52E
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Oct 2024 22:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729288869; cv=none; b=pY3v3DfCcIJCuW6GSUn3Godn7q/bN3poyqTRwoSNyD0S0SVfQEj+8ASMLGPLRgTaORHac7z0QKATbizSrodOibAfaObNow/lKNTBhn6azqZGW0/iVfb7JgFDYgsLWzRgGsYGpt0mbgTV516KvHaIkB4yY+fCSK56xrgxEiwOJhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729288869; c=relaxed/simple;
	bh=IizYhkj7rFrSwwUHj5BLPNSsuQdeIpCCAjBnCGBYfeY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eYXpA/qFPsymrFbcWOtfRq0xXEYbI3dzxBZ5N2NLR3uuiZEavgB30bwUkoiyPVAqaer4e4lbhrrbDREHjVYNJ5ET6zAvfi2eXvxG/eWeXRiUduqOWBPRZgur9z828b7TOLAkTV04r8/MmYDcVvYRtOxf7Oh0yrmN51I1fz0uU1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CqXi/KQC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CqXi/KQC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729288868; x=1760824868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IizYhkj7rFrSwwUHj5BLPNSsuQdeIpCCAjBnCGBYfeY=;
  b=CqXi/KQC5TjmCYdnVKGdNZTa/YtQzyN31YMvNVoPncA0fYHCXD0aKLEE
   IXdEf+kp42hHcEagu5g2rJMbN4GzfhMh7GihbeZCiApcMBLz3IQmUiRHF
   TZ7tdsQah/GYaAYZI1nfoZJhsdAAJMZg66fpuw0mp6StHSM3NbZYMvKIZ
   AB/SS2wpUuWo1MUGSVAgwdNOPxmgo6F+tXqosLvpDrL85nvT01fAniJ+W
   IVjoL6xluHK6h2BDVu7m/Bxbak8GncrZl7Lxq0H7cPXC8+C7ynZrC4Uxi
   b+2KCkuZocOZPVIAD5dI4Kb3uLhBaL5YRaE8+cRO0W/uevL6F8MfCFJ1p
   g==;
X-CSE-ConnectionGUID: 8Y5loEMKRXyRl5yPmUWxkQ==
X-CSE-MsgGUID: b1mcd9eeQ/6mLKiLET+0vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28996363"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28996363"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 15:01:07 -0700
X-CSE-ConnectionGUID: CATyfEZ8RFeCvt5tKL3Q1g==
X-CSE-MsgGUID: XoVDZKoJRLOlZjL4lbkNlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="83611224"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Oct 2024 15:01:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1v1r-000OLr-2C;
	Fri, 18 Oct 2024 22:01:03 +0000
Date: Sat, 19 Oct 2024 06:00:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/ingenic/cu1830-neo.dtb: expander@0: $nodename:0:
 'expander@0' does not match '^serial(@.*)?$'
Message-ID: <202410190534.u1V9W5Lw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Hugo Villeneuve <hvilleneuve@dimonoff.com>
CC: Rob Herring <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b04ae0f45168973edb658ac2385045ac13c5aca7
commit: 0d447e927ee86e9ff89010085a47a275c2bb5594 dt-bindings: sc16is7xx: convert to YAML
date:   1 year, 1 month ago
:::::: branch date: 3 hours ago
:::::: commit date: 1 year, 1 month ago
config: mips-randconfig-052-20241019 (https://download.01.org/0day-ci/archive/20241019/202410190534.u1V9W5Lw-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190534.u1V9W5Lw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410190534.u1V9W5Lw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /serial@10031000: failed to match any schema with compatible: ['ingenic,x1830-uart', 'ingenic,x1000-uart']
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: spi@10043000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-spi', 'ingenic,x1000-spi'] is too long
   	'ingenic,x1830-spi' is not one of ['ingenic,jz4750-spi', 'ingenic,jz4775-spi', 'ingenic,jz4780-spi', 'ingenic,x1000-spi', 'ingenic,x2000-spi']
   	'ingenic,x1830-spi' is not one of ['ingenic,jz4760-spi', 'ingenic,jz4770-spi']
   	'ingenic,jz4750-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/ingenic,spi.yaml#
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: spi@10043000: Unevaluated properties are not allowed ('clock-names', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/ingenic,spi.yaml#
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /spi@10043000: failed to match any schema with compatible: ['ingenic,x1830-spi', 'ingenic,x1000-spi']
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: expander@0: $nodename:0: 'expander@0' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/nxp,sc16is7xx.yaml#
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: expander@0: Unevaluated properties are not allowed ('sc16is752' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/nxp,sc16is7xx.yaml#
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: spi@10044000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-spi', 'ingenic,x1000-spi'] is too long
   	'ingenic,x1830-spi' is not one of ['ingenic,jz4750-spi', 'ingenic,jz4775-spi', 'ingenic,jz4780-spi', 'ingenic,x1000-spi', 'ingenic,x2000-spi']
   	'ingenic,x1830-spi' is not one of ['ingenic,jz4760-spi', 'ingenic,jz4770-spi']
   	'ingenic,jz4750-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/ingenic,spi.yaml#
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /spi@10044000: failed to match any schema with compatible: ['ingenic,x1830-spi', 'ingenic,x1000-spi']
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: i2c-controller@10050000: $nodename:0: 'i2c-controller@10050000' does not match '^i2c@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
