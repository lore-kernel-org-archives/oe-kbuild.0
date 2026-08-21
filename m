Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F4B469854
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Aug 2026 10:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306515; cv=none; b=tWRXcoZCk5W1vCNgkPLxf60+VRPUJe8ElJ8rkQbR3c8MjSlMz7pAOOxBGNWZIIS8q1tTseE+vcPSovNLtKWwdGQDaRGmKWDTT9gIl0WjqdyrGUU9r7B2VJykD1mkkMBf5r+Uwk3Kzw0woeJaRrm1hI8h1HaGL/Uka+Hp7ADgmv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306515; c=relaxed/simple;
	bh=QkJmv/ypihEWYlYdbATO3wxamMJyLptxdMiweClvTv0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SQ+YQzSEjwkg2Ms1OxBPmREHXywtgbalu4fJYC/sjxmtkHjB9Ijen6D6Fe9pO0MmnoTrRCjEMVJGPcZU28v51icUBnUGEX+VydpqQOdF0g9Q5vJjDZpbMn4s9hEAQS/EZnOyJ4BkSE77VAJNG8Wdj1n3RsmlNOkYjuFSxJrpmuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IXEQItN8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IXEQItN8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787306508; x=1818842508;
  h=date:from:to:cc:subject:message-id;
  bh=QkJmv/ypihEWYlYdbATO3wxamMJyLptxdMiweClvTv0=;
  b=IXEQItN8KuyKE0kFTZL2Vbj40EEWnIuqgB/HntclXMcy+s6UXc0J4JI0
   A/coDbYCHCrazYAS1VTKzGdY3DF0/8U5SoPX9Ow7QmQBUFlLGzxsZOlkO
   1Eb6He36QVvDgjUQYPsBPc4n3fiUiXcWof83F9dLPyYTpxnizGoaEk6lP
   eH5vohfpj/Dq/2OXJvyhYzmujpEZljDWAV7R5Vu009ilbXSQml6o01bt+
   uoertt69arFbaHUlwiue+MuQnATmDFJXKOWYpSqHSa59YjOR9eX8WA/+O
   lx0MGfbweuljkPt5yxiiLL9Ufxh1X3n2zbdT8Q5gJPTExKWXFtYK7IIbS
   w==;
X-CSE-ConnectionGUID: q2LvY3YpT/eCVOctI6xw3g==
X-CSE-MsgGUID: CdduhasSTiWDqeAHWqaf4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="98518169"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="98518169"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 03:01:41 -0700
X-CSE-ConnectionGUID: zNsiMv6tRDuCUlD+spi9Pw==
X-CSE-MsgGUID: YvpjzyqATeasEwcQT9jg4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="291148642"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 21 Aug 2026 03:01:40 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxM49-000000007gR-2xpp;
	Fri, 21 Aug 2026 10:01:37 +0000
Date: Fri, 21 Aug 2026 12:01:35 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb:
 system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is
 too short
Message-ID: <202608211108.qPoB5dxO-lkp@intel.com>
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
TO: Elad Nachman <enachman@marvell.com>
CC: Gregory CLEMENT <gregory.clement@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   818bebeb63dd6bf5f4e07e145f6cdbace520a34c
commit: b3370479a5f7edf4baf0e307f1163f8fe9e09e17 arm64: dts: a7k: add COM Express boards
date:   7 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-2054-20260820 (https://download.01.org/0day-ci/archive/20260821/202608211108.qPoB5dxO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608211108.qPoB5dxO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b3370479a5f7 ("arm64: dts: a7k: add COM Express boards")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608211108.qPoB5dxO-lkp@intel.com/

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
