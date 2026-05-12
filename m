Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B53B349CCB
	for <oe-kbuild@lists.linux.dev>; Tue, 12 May 2026 12:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778589282; cv=none; b=pZxrdpmxn95CriR3uUHVNZUJJYP8EiN27bSAxBrDROLZ6lUjjipOwQVqJxWY359THSq2TvrNAxhnLCpgtNraxiR2uF3kbe5SaSZJ1IQAuqK8Wv4+whP2NuvMp8MOnraDsxT1/xKhrVb/k3pOj6GYhE3rDTo3t4LrEMu8bDt9dcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778589282; c=relaxed/simple;
	bh=YX4gFXFwUjxgvLGGxepmj1t8iuq5A/B7nprlljDIKXU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OR4vHp6sIw4o3Oqg/BOXTepAED9iLBNmLDq5CP/VFtHPF6zDDf/fWYLjI0ETbAZI/w/Sga9QJKGRQcQ2qHpIlGR6JcO+YwB21U/7xJ0y3fzzK/eH6tF+NYwq6NFAh/p5doP/LNpl61SRSMKYhiahUlRWqeuzW0R8pY74mgjuSVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c+xWjd5c; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+xWjd5c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778589270; x=1810125270;
  h=date:from:to:cc:subject:message-id;
  bh=YX4gFXFwUjxgvLGGxepmj1t8iuq5A/B7nprlljDIKXU=;
  b=c+xWjd5cnInZhsPkQ0a9HOrEhoGc9XC/byyP04PV9bIQQvpToq0T6PGZ
   mGv77OpEJ+UM7s+REzNPTyarEeVW0LMQulMpV81dwRqDjKIAkoVK5V1JF
   EQjBtmYn+kj9gj84Wuxv1POmPWdwgObvkUESDErO14h6EcE/kybzlIgL/
   CE/u+OGugEWxpoRSPCRKvIPHaIEbSagLPHbc/o+A6/K0dK57XvmdJzWoP
   e0AdnQWbfv3KtLYUtu+33DCr+aAhChr81R3treoufJ99Sswfwv9JK6f8w
   ryvTiHuN1AvKacTT6+X11yXsa2nu5htDKsXcygWXS8a6CkuVcZ+05vB3M
   A==;
X-CSE-ConnectionGUID: nn+ApIZWSPW/dIuC2ypoLQ==
X-CSE-MsgGUID: 6xX4MwiLT/CEN8U9sav31w==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="104950861"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="104950861"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:34:26 -0700
X-CSE-ConnectionGUID: ylrP2hSsRRuAukauHNUHew==
X-CSE-MsgGUID: JS22AnCoT0aPnKzxe3cmtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="234693510"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 12 May 2026 05:34:25 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMmJb-000000008Gv-2sRL;
	Tue, 12 May 2026 12:34:23 +0000
Date: Tue, 12 May 2026 14:34:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrv54g.dtb:
 partitions (fixed-partitions): partition@240000: Unevaluated properties are
 not allowed ('read-write' was unexpected)
Message-ID: <202605121404.HtZOu7RW-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   50897c955902c93ae71c38698abb910525ebdc89
commit: 1eb9fabd52933cdf9be349de5391920fac4ed30b dt-bindings: mtd: Ensure partition node properties are documented
date:   4 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-2051 (https://download.01.org/0day-ci/archive/20260512/202605121404.HtZOu7RW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605121404.HtZOu7RW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1eb9fabd5293 ("dt-bindings: mtd: Ensure partition node properties are documented")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605121404.HtZOu7RW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrv54g.dts:173.4-179.31: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrv54g.dts:173.4-179.31: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrv54g.dts:173.4-179.31: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrv54g.dts:173.4-179.31: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrv54g.dtb: partitions (fixed-partitions): partition@240000: Unevaluated properties are not allowed ('read-write' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/fixed-partitions.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
