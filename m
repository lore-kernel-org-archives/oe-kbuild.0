Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA25025228D
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Jun 2026 02:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781490487; cv=none; b=jHth3zfJ6WkP36DyLH9iFXv7paVYqfmnr9RR7BPPpszHZtzsy/AN4jMgQeGqUgVrNhz7DJK4TbUDcJA82WT4QRy48BszVJ+qqvWLw/GaJ5FaXj3vZmr1W/dz/lUGKbLwClZo+G5+8VwEzmVR6yUBzDhvD9D608XzWWTPiYKZyjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781490487; c=relaxed/simple;
	bh=CfEhGspI890ewmI4voDnuCRBztuZUeuF5OZgrpaERDs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=An0xw3V9PWb+rAMJaycc5XFHHaECsCelEPtiiU7TwhugELTvcvkuOKzZFonUO0cLULItC91wXFm/cgCehPeLWMxTW+8Kpkv3VpDcB6o3TxyjRomJXfTCL5bn+E199rHRl05aGw2rfsPOmX0gjsn60HAjSkItH9Kpiz3r5hYBPfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FzZgpc74; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FzZgpc74"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781490486; x=1813026486;
  h=date:from:to:cc:subject:message-id;
  bh=CfEhGspI890ewmI4voDnuCRBztuZUeuF5OZgrpaERDs=;
  b=FzZgpc745NRG4cTp1j5nhq6bMgp7QVVJRx0wi8HhVSR6U0WqRrtr2Qed
   iVXIhcmqpt+x3oeA069mQJPCSkUKYRcqGkrcQwLi+/m5pW1urfNleHF/a
   puv9QD0AuymkOapmIg7xGJ6bhsyQfqa8wpK3+5GJVey1/+KkLo5j1DdE0
   68sB07uzP+xsENxYz2JgT8HQHOZVTSejFckUQ6lEbQXK6gjVPwwkYk1ly
   rUqV2EhaQ3IJRClFV94DUC4bsKdoclQLHCThTzadvFtQiLoUExc6Gi16U
   vhjtth2Wm+bWqTTONtqnW2ckNc2Xa4ABHb+wyiD0lFstL4Z947rVe9ag4
   g==;
X-CSE-ConnectionGUID: NZYQiYe0TcuH3kNbLNevNw==
X-CSE-MsgGUID: Yvm+9yDRQymQOMCHWInTYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="92784535"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="92784535"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 19:28:05 -0700
X-CSE-ConnectionGUID: o/nzkwihSlCMiPLnCw/hGQ==
X-CSE-MsgGUID: WkzVEi2dTm6ESJsp+0sx5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="277536915"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Jun 2026 19:28:05 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYx3R-00000000ROM-3QHL;
	Mon, 15 Jun 2026 02:28:01 +0000
Date: Mon, 15 Jun 2026 10:27:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/kexec_core.c:1253 crash_cma_ranges_show() warn: we
 never enter this loop
Message-ID: <202606151049.DPSumIO0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sourabh Jain <sourabhjain@linux.ibm.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cd9520d35a6c38db6567e97dd93b1f11f185dc6
commit: cf4340bdd967fe7f37b4361c85370515f11f4a37 kexec: move sysfs entries to /sys/kernel/kexec
date:   7 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-141-20260614 (https://download.01.org/0day-ci/archive/20260615/202606151049.DPSumIO0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cf4340bdd967 ("kexec: move sysfs entries to /sys/kernel/kexec")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606151049.DPSumIO0-lkp@intel.com/

smatch warnings:
kernel/kexec_core.c:1253 crash_cma_ranges_show() warn: we never enter this loop

vim +1253 kernel/kexec_core.c

cf4340bdd967fe Sourabh Jain 2025-11-18  1249  
cf4340bdd967fe Sourabh Jain 2025-11-18  1250  	ssize_t len = 0;
cf4340bdd967fe Sourabh Jain 2025-11-18  1251  	int i;
cf4340bdd967fe Sourabh Jain 2025-11-18  1252  
cf4340bdd967fe Sourabh Jain 2025-11-18 @1253  	for (i = 0; i < crashk_cma_cnt; ++i) {
cf4340bdd967fe Sourabh Jain 2025-11-18  1254  		len += sysfs_emit_at(buf, len, "%08llx-%08llx\n",
cf4340bdd967fe Sourabh Jain 2025-11-18  1255  				     crashk_cma_ranges[i].start,
cf4340bdd967fe Sourabh Jain 2025-11-18  1256  				     crashk_cma_ranges[i].end);
cf4340bdd967fe Sourabh Jain 2025-11-18  1257  	}
cf4340bdd967fe Sourabh Jain 2025-11-18  1258  	return len;
cf4340bdd967fe Sourabh Jain 2025-11-18  1259  }
cf4340bdd967fe Sourabh Jain 2025-11-18  1260  static struct kobj_attribute crash_cma_ranges_attr = __ATTR_RO(crash_cma_ranges);
cf4340bdd967fe Sourabh Jain 2025-11-18  1261  #endif
cf4340bdd967fe Sourabh Jain 2025-11-18  1262  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
