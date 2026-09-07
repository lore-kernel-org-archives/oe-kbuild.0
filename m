Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748F145C70F
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Sep 2026 11:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779062; cv=none; b=HgBJtZLuWh0Zicyh/X90JeHtZdXWFtHuHtaxbFty1cwU5lkA3//foApN5Ob/KGdptp4jbd5AuRcchSaiV/DgpVttNv0UOK1mA8A0CNX8XAd4NHb1nSn1ZZa8K+i6OrTgQVzp73PUbEZvZJCnpHVF7qP2mEEkXWUK/99nv3Q+nGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779062; c=relaxed/simple;
	bh=2pjGBekxH1QZ2aRbajOFdYXVMuxEAqECKZJgf+Y0V78=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TOlmi85WlUjEWDg6pxpYIW3o7sJWoq6O304WwG6NHlTEtL40lgqUJjJrPsKKEMlofZGEznSJYtZgOaTXeM4PWqBcMITaIWOgStfR6igaRaBjWlKRLEFAtw2ipBUrkmdsivFFwXNHc9XyL1fhWO2ofi8pXmnmITI9256vsWJo1CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dzdAjFuq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dzdAjFuq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788779060; x=1820315060;
  h=date:from:to:cc:subject:message-id;
  bh=2pjGBekxH1QZ2aRbajOFdYXVMuxEAqECKZJgf+Y0V78=;
  b=dzdAjFuqZ+9v5A5yFpZaS8WgX3YDaWlxklHrt+FDuYxL6Y3BzXVsmC8c
   myrUbfLCO9aZUDVmuHgOs1bPkCfTLUMkqvfZifYg9bpDEvnpKaCH5AHYA
   vRhX4yBEY0PGMkgZqdrmJCG3Frwwwqjsih6Sullgrx01htUcljUZboqPm
   0qeOe41U9txe1kul223zjTZ8FfX0VcqJ1h5Pu+wy4XYa0K5E5mobdmDHq
   EY9rRqhhteMW1h1IWeqCoOEoV3yFBSXmFeI5B0AavN7VeriXkZrUzb3NQ
   O5LhXCobD9/x/9Tu9SYZTCFKLihuf1IbxRnHCkDKijdbRS+t+CnKPYs8H
   A==;
X-CSE-ConnectionGUID: Hm3FNtMXQxaIM/xw5U+CsA==
X-CSE-MsgGUID: cdV/ZjPGSCqAXD4Min9KEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="99839775"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="99839775"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 04:04:19 -0700
X-CSE-ConnectionGUID: NwG2Nbr4SwCiuS0qrlYnXA==
X-CSE-MsgGUID: BpdEzxyTRvuWk6qasw4jbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="300563602"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 07 Sep 2026 04:04:18 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3X95-000000000D8-30no;
	Mon, 07 Sep 2026 11:04:15 +0000
Date: Mon, 07 Sep 2026 13:03:20 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android17-6.18-kminext 2/2] /usr/bin/ld:
 tools/testing/selftests/vfio/lib/vfio_pci_driver.o:undefined reference to
 `ioat_ops'
Message-ID: <202609071200.fdWMQp97-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi David,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-kminext
head:   c0a35f3366299626497a612a9fdb7e01c77eb7f3
commit: 2223587df5c5e935cc6f973f62a9608eef81bec8 [2/2] vfio: selftests: Add driver for Intel CBDMA
:::::: branch date: 4 days ago
:::::: commit date: 1 year ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260907/202609071200.fdWMQp97-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260907/202609071200.fdWMQp97-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2223587df5c5 ("vfio: selftests: Add driver for Intel CBDMA")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609071200.fdWMQp97-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /usr/bin/ld: tools/testing/selftests/vfio/lib/vfio_pci_driver.o:(.data.rel+0x0): undefined reference to `ioat_ops'
   collect2: error: ld returned 1 exit status

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
