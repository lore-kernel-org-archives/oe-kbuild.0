Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105CB364A0
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Sep 2024 03:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727667229; cv=none; b=LSzaV6TTeoGlHkOwP7+Ilwt+VdrRRft/zi//2M7JormOdWREgo3TJqFWW6a1Sn9R4gJMSk6daVOmW36OxMzETtqWTXEdU/DUiY8y3L/pzOoHoKnwqSUkim+/7W0Nqo9B+rEsrQfQYzGyRCnqGruSZR7eZMyoXpc/rRa/OfE76To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727667229; c=relaxed/simple;
	bh=+dITrpRiTQKaQQnSkvg66ebh7vjmzdXSjLDiGjUgRWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GNX8Wj6pJuvrl0OO4FJqdXPVayZ1++MmuITl7oR9q0I/xFH2xi6KATSoMDSIvq83yO637Ol08gd8TLfHzI3NyfFIA7VM+veigxMF7QrU/o6IGLIGP987FDrjg2GHFtj+iD8R66fAwdD+4dmuBSnDeTJq/Dyd0/vagrgv+thGIp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GeM3L3a5; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GeM3L3a5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727667227; x=1759203227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+dITrpRiTQKaQQnSkvg66ebh7vjmzdXSjLDiGjUgRWI=;
  b=GeM3L3a5sExAElQsd7jAiOG468Oix7i+pLy5BlsGljJHyIFAOz9kK5Lr
   vEuwr0sjTj96k7bE+wFvFYGbjQvCKghUueY2+JP8x1klJqSiWfWx7BG/T
   Epk3ulzg715DGUp7g+n0MD0fYxDebLourRwjSmnfo1uiMjjlyqYHyvMfW
   HUOk7xKYxnX3hQWAskOEW+EFJSEFil7jJO811oqkP+UhJrMpikq/syLbw
   U4pN7aoCAATqC8EhaX89KDIpzkMc9ABx5s/nQZwwd4Op33uFU/Rdp8hQt
   zaFkk7dSbH3NxaEtlBou/tKuap7ZkiPi2pA6myBbHnwRn7p9WDvFWtQ73
   g==;
X-CSE-ConnectionGUID: onDkH3f7TdeoFtaoI4NNPw==
X-CSE-MsgGUID: xZyfxqbEQCKDRr0UNX5mqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26687676"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="26687676"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 20:33:46 -0700
X-CSE-ConnectionGUID: cazKlrdfS+Gv1W+l+v9eiA==
X-CSE-MsgGUID: cUORqaDiRv61EAs+TpK0Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="77921896"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Sep 2024 20:33:45 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv7AN-000P03-0x;
	Mon, 30 Sep 2024 03:33:43 +0000
Date: Mon, 30 Sep 2024 11:33:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/bcachefs/rcu_pending.c:167:8-10: ERROR: reference preceded by
 free on line 167
Message-ID: <202409301153.iVknLl2R-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9852d85ec9d492ebef56dc5f229416c925758edc
commit: d2ed0f206a9d8b3add18879f39dd128ff55e4d77 bcachefs: rcu_pending now works in userspace
date:   3 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 weeks ago
config: m68k-randconfig-r053-20240930 (https://download.01.org/0day-ci/archive/20240930/202409301153.iVknLl2R-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409301153.iVknLl2R-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/rcu_pending.c:167:8-10: ERROR: reference preceded by free on line 167

vim +167 fs/bcachefs/rcu_pending.c

8e973a4f3c7482 Kent Overstreet 2024-06-10  162  
d2ed0f206a9d8b Kent Overstreet 2024-08-23  163  #ifndef __KERNEL__
d2ed0f206a9d8b Kent Overstreet 2024-08-23  164  static inline void kfree_bulk(size_t nr, void ** p)
d2ed0f206a9d8b Kent Overstreet 2024-08-23  165  {
d2ed0f206a9d8b Kent Overstreet 2024-08-23  166  	while (nr--)
d2ed0f206a9d8b Kent Overstreet 2024-08-23 @167  		kfree(*p);
d2ed0f206a9d8b Kent Overstreet 2024-08-23  168  }
d2ed0f206a9d8b Kent Overstreet 2024-08-23  169  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
