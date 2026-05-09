Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877583C0607
	for <oe-kbuild@lists.linux.dev>; Sat,  9 May 2026 19:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778354079; cv=none; b=Ap7hl/xFS56R/DSQFQjI2RisE64ZvLqjrIMN0dcRlstKsd6h/0BQQUDYoSfzpw/rh1tpEDJHbn8NS4dNKkYX43J6a21vqlBwd8j5+Oo6am/t9iM2Y4Yqfe9CxfZFUZvre1g4U5M8YEukgFKTgp+p4OIFW7ITsA+UwJ3Yj3cnDb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778354079; c=relaxed/simple;
	bh=nhuB71XKaTlqip1/3e0/inMZ/6ghUN6M5+LF2BQ52SA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NL78TMn6J6OYMbR88I4ysEmcCuBhmMPeXst/useBXujHDQXVVUoT2Q6Lj8z2fSmz15sk51GcGN6xGf9TnDOX/U5N/A3zKRkuxkb2nQeOBga1e0xoLWB1dqQMFLiXgDV2CzgOhCvgfPCWkV2R6L4c00YOWyqRocf14cPnczSLFA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wz+2bPOt; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wz+2bPOt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778354075; x=1809890075;
  h=date:from:to:cc:subject:message-id;
  bh=nhuB71XKaTlqip1/3e0/inMZ/6ghUN6M5+LF2BQ52SA=;
  b=Wz+2bPOtBmIff5vG+B/hlQ/1GJ0z+ebQnrX94QYK46dVLKbJ5L7CKB3R
   tcqeidbmkTM0Tq1cM2BcsID6jwHvrDaGxAzfVqIyH6n3obfIXh7c4ocwx
   zg5xIGyowBdqPEsuzEup9LanF77i1ySbDsaUmQAI8zgeO8KHLLFeimMBM
   eelRjvgJdmPLv2iUjx1PL9pSQOsmSskhMIdjhr7tiPhg79Ah2Kjn6kw2J
   Q/6LoxWXZid6EgJvwDAn7EF0QJyjyOnDpF7ED280L3RQ7lJ/5CxN1qRgt
   kvr62cHtnylXBdyexhpZR8ABsgSdIjZR/k8qaJ02hKl1c+5Nqg5EIHmP3
   g==;
X-CSE-ConnectionGUID: lwg3Q+XQT6CjtIO3aAEb/g==
X-CSE-MsgGUID: zYlxinTHQ5ujF52DGhDRQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="90680605"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="90680605"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 12:14:32 -0700
X-CSE-ConnectionGUID: D05ECs0JRZ+4yqVqYbsb0w==
X-CSE-MsgGUID: cuj3HkRjT6SIXpIadkdN4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="236090426"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 09 May 2026 12:14:31 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLn88-000000007XF-3wll;
	Sat, 09 May 2026 19:14:28 +0000
Date: Sat, 09 May 2026 21:14:19 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:mvebu/dt64 6/7]
 arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb:
 system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is
 too short
Message-ID: <202605092146.XDtIlTWl-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Elad Nachman <enachman@marvell.com>
CC: Gregory CLEMENT <gregory.clement@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git mvebu/dt64
head:   fcaf733ca526b69595ed1d227e2cc59ddd24eff7
commit: b3370479a5f7edf4baf0e307f1163f8fe9e09e17 [6/7] arm64: dts: a7k: add COM Express boards
:::::: branch date: 4 months ago
:::::: commit date: 4 months ago
config: arm64-randconfig-2055-20260506 (https://download.01.org/0day-ci/archive/20260509/202605092146.XDtIlTWl-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605092146.XDtIlTWl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605092146.XDtIlTWl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'marvell,armada-ap806-quad' was expected
   	'marvell,armada-ap810-octa' was expected
   	'marvell,armada-ap807' was expected
   	'marvell,cn9130-cpu-module' was expected
   	'marvell,cn9131-cpu-module' was expected
   	'marvell,armada-ap810' was expected
   	from schema $id: http://devicetree.org/schemas/arm/marvell/armada-7k-8k.yaml
   arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: /: failed to match any schema with compatible: ['marvell,armada7020-falcon-carrier', 'marvell,db-falcon-carrier', 'marvell,armada7020-cpu-module', 'marvell,armada7020', 'marvell,armada-ap806-dual', 'marvell,armada-ap806']
   arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: /: failed to match any schema with compatible: ['marvell,armada7020-falcon-carrier', 'marvell,db-falcon-carrier', 'marvell,armada7020-cpu-module', 'marvell,armada7020', 'marvell,armada-ap806-dual', 'marvell,armada-ap806']
   arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: /: failed to match any schema with compatible: ['marvell,armada7020-falcon-carrier', 'marvell,db-falcon-carrier', 'marvell,armada7020-cpu-module', 'marvell,armada7020', 'marvell,armada-ap806-dual', 'marvell,armada-ap806']
>> arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
>> arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
>> arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: crypto@800000 (marvell,armada-cp110-crypto): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,armada-cp110-crypto', 'inside-secure,safexcel-eip197b'] is too long
   	'inside-secure,safexcel-eip197b' was expected
   	'inside-secure,safexcel-eip197d' was expected
   	'inside-secure,safexcel-eip97ies' was expected
   	'inside-secure,safexcel-eip197' was expected
   	'inside-secure,safexcel-eip97' was expected

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
