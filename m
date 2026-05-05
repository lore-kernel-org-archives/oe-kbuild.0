Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E16345CDC
	for <oe-kbuild@lists.linux.dev>; Tue,  5 May 2026 12:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983182; cv=none; b=kKeVAR6J/lhfUSCcQ8ZRRqYedMyENhZCKhbFmu2q/atiK4x7EU2biPI0hHGHZfn6b9lnKolbf+1QKF0jrG/tGjYHlEaP0CI80x2BBuf8WXMpjVr/kKgHeQv6CS14s6rz2S/HFoa+qb3pdf8NDqZ9vVgxxX7rD3r2yQR7IYOcY+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983182; c=relaxed/simple;
	bh=1gDwXBBPtGcIDcPBe5AJu9hL5G0eMm+/I4p8Bs4SrUg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RfZ2dJt6SGm6UFEKBJHs6X3mDHBA/F8sGWFOmZslI1pgWSOJhehFGjqDbjsrCVq6PjxwDX6KjFQgYFvZTpHMtWE/ia8Nusu/X7ZYTHjj6LFeVjLyAe6pD8IZs3P1P1nsyiBc8e6WX/DYIjkUtiOiVk9a255hQKKGZaWgM6O5p1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j3hFSnWk; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3hFSnWk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777983179; x=1809519179;
  h=date:from:to:cc:subject:message-id;
  bh=1gDwXBBPtGcIDcPBe5AJu9hL5G0eMm+/I4p8Bs4SrUg=;
  b=j3hFSnWkOO82jDjAhlZwQkpmswg2S9ynJzK4W2+tiES4VkwsY/65I9ii
   xC4X6W86oHbDNnbSg2jYwawy92WZk2WFZAfc0RDoenk2yXjJ8tXQaG4WO
   V4bjFh0s6+TExOoQe7x97dv1ykNdvnwLq2/jDqAxClWrkG69ATfxvdSoq
   VTkncJ30dUtZuNnVTEOXerzVkxjyMS+1gOLHeCHEnxn16jcWxGp9kGad1
   Lpi8EUxQJVQigjxyTn/zmV8VH3uk6lE04leuuAIOu3oVcpyIusXAhxyJV
   wzPBNXqvLYHndCCxIMAO0S8fP6uRgjUcuCiwJiJGPfCLjIVjhDMRm0mzu
   Q==;
X-CSE-ConnectionGUID: RXNceTlDSPGMMJozpOLYGA==
X-CSE-MsgGUID: zpVP3ESDSkmoEgGMaHPwag==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="82718257"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="82718257"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 05:12:59 -0700
X-CSE-ConnectionGUID: 88Te3HNiTtCZEEDpbQqzLg==
X-CSE-MsgGUID: TYVgku8qSeOgfBojcoKPuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="234928278"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 05 May 2026 05:12:58 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKEe0-000000006E1-1Kzx;
	Tue, 05 May 2026 12:12:56 +0000
Date: Tue, 05 May 2026 14:12:26 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb:
 nand-controller@ff100000 (xlnx,zynqmp-nand-controller): Unevaluated
 properties are not allowed ('power-domains' was unexpected)
Message-ID: <202605051453.bgwOXCJj-lkp@intel.com>
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
TO: Michal Simek <monstr@monstr.eu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a293ec25d59dd96309058c70df5a4dd0f889a1e4
commit: 7044b13e008d7033f2e966603a507401b11f913a arm64: zynqmp: Remove undocumented arasan,has-mdma property
date:   8 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 8 months ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260505/202605051453.bgwOXCJj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605051453.bgwOXCJj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7044b13e008d ("arm64: zynqmp: Remove undocumented arasan,has-mdma property")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605051453.bgwOXCJj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: nand-controller@ff100000 (xlnx,zynqmp-nand-controller): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/arasan,nand-controller.yaml
--
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dtb: nand-controller@ff100000 (xlnx,zynqmp-nand-controller): Unevaluated properties are not allowed ('num-cs', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/arasan,nand-controller.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
