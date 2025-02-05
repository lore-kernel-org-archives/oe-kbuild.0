Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13282219A8F
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Feb 2025 05:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738734295; cv=none; b=o76mbDDUu9GTfZ3+X1dYD//rN18AN8I9xn63ZxVAKrtb8xkyLjQOL6mnN/PIdv58WUPJClsOFPYQw2WfRFh1O8vKoUz0+aRdIwzcB67o/1DAoJr16AVTgmZJbLcM5aOw47ll6FbXBIX4zvKo3OOOFSA/p62Sdko8zxZMvvLV4HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738734295; c=relaxed/simple;
	bh=muVV7RnQWp5iWWWffse/pAikiFTqG6DYqfodNNkc4uM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JbUuDqz6g+4UjzNdsSK6MxP0y4PgAkevLt7LEsuxxBtPczKl13wKdf7Pj5U1MUZtB+U/RxFtWC+Pa8tcfc+GxHqx/A62xqwR1GivBLTNNqhAH2Mr7A12viKEx7+zGRZEPqZ2sEN/t8Tv+XT0rP+V3cWxxBDxm7qJec/SBvRCJjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cQB6UeKx; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQB6UeKx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738734295; x=1770270295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=muVV7RnQWp5iWWWffse/pAikiFTqG6DYqfodNNkc4uM=;
  b=cQB6UeKxT1dCI0lKRAk1AcLPAWyVBe8kGApYkehb3kR3k2mcK9DY9wl8
   nUdOJdLX7LRx3jLx/Fxj2BH3ZkHCl9SP0v5zzku39G9TimQmOqISgLjID
   GItNWbTyBTCx0xSbOyZe6k7CmvgNh/A6gfGzIYQqPD6dYFEsFYn4XOx4u
   rKwVi1xRhKwyrGmAbv21R+Ru7Mdc/PNbIuicnICH3N6/GiSCClQvSMlAS
   BNzqYMMcpCMyb4qvPlqTmvcljvgVkvMj4k2gQQDtYpvCXFQomt7clAoak
   ojmX62T6baP8hK2gvzrgQate8HZTbJUX84A/ur5dK8De685RUUn7IVfbT
   g==;
X-CSE-ConnectionGUID: Ovs9l48JQ4OebUsT7sHEWg==
X-CSE-MsgGUID: E/bZCoj4TkyzDEQiJ2kjaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50276008"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="50276008"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 21:44:54 -0800
X-CSE-ConnectionGUID: A+yUZNt7T0Cwkr5Nh4gDDg==
X-CSE-MsgGUID: wr9ELhTWQmOMEnVTHqHS3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="110587908"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Feb 2025 21:44:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfYDS-000tUM-0d;
	Wed, 05 Feb 2025 05:44:50 +0000
Date: Wed, 5 Feb 2025 13:44:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: internal error: arch/alpha/include/asm/core_marvel.h:340 SQL error
 #2: near "and": syntax error
Message-ID: <202502051346.sSKVfrl1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5c8c229261f14159b54b9a32f12e5fa89d88b905
commit: a4184174be36369c3af8d937e165f28a43ef1e02 alpha: drop pre-EV56 support
date:   9 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 9 months ago
config: alpha-randconfig-r073-20250205 (https://download.01.org/0day-ci/archive/20250205/202502051346.sSKVfrl1-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502051346.sSKVfrl1-lkp@intel.com/

smatch warnings:
internal error: arch/alpha/include/asm/core_marvel.h:340 SQL error #2: near "and": syntax error
internal error: arch/alpha/include/asm/core_marvel.h:340 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
