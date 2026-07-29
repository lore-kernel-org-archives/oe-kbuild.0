Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C5430FC26
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Jul 2026 08:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314272; cv=none; b=pEI0IV6at61saL+AEp/byUMC8a6ko541bNBQiFf+K8mu2PgjiH4CEcBtTY6brVfC5Eb8LYUAJf9EkOCctaNwP4Qdesj88Mg5WVNNFMXTp1hnf0e1KKoQ47tRlBOH912K/xSlhBhd07txCiA8lXabGFS3rsPiE+1sdbplPkebAzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314272; c=relaxed/simple;
	bh=DzYX2v7pg8s8XMyvu1dZSknYpQc3UMaAIRHiFaGJy/8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mwulTrPz+XhhNsacl3WNdOsgXyeI6Vos7AzUJvBdN0JCs+SR3mT9c9Onn0Or2seu7bxqE8GPaOn3R6xqhsn28GHL2Z+zQLjib1geXcK8/GswCUZy2Xkh+SXGbVwDxHylPHJjBHvOxs4sN7MNmhDXzwY+XkNb9468Yxi+iIdl4A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KKKsZ010; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KKKsZ010"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785314270; x=1816850270;
  h=date:from:to:cc:subject:message-id;
  bh=DzYX2v7pg8s8XMyvu1dZSknYpQc3UMaAIRHiFaGJy/8=;
  b=KKKsZ010ZE1FePyMUcT6avXwIg9FdgJnXpLJKvYil5dA0NT2SONUbiOu
   LYbHuOr3gvwiYgQYHXIQmxseMTccYMIfBwRSTjMfV9dl13CRTXYKCG/a2
   hgWN2BcQCMwqzvVX+zROrPGYUFF8YGHmPSSWAbfrADX8pIXEOU4PqGkyI
   k5k6/6rFkXW4z230jcFpNxm9fdWvfnoBuzf3SnJ/akk2EpZ4QleOZK99I
   LLUFNV61qXVuMOWrJJN1yY9Y9k+lj2KbyeV5ZhVySnHAzvihcEoLokut9
   Z8jdjMpmJwZ8fi/P88DLOevW7Nw73Uq5QvoLXvpGvZAJZBbYztRiOABy0
   Q==;
X-CSE-ConnectionGUID: ARH+4KrZT4mGB0yH/zSZXw==
X-CSE-MsgGUID: TiKJlksNRaaHoAUV5RxkFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97425199"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="97425199"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 01:37:50 -0700
X-CSE-ConnectionGUID: m349HypRR6Wm7H53nYvOlQ==
X-CSE-MsgGUID: Bylp6lz6S+OxoBTtrT6eHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="257278372"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 29 Jul 2026 01:37:49 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woznF-00000000fCX-0yqP;
	Wed, 29 Jul 2026 08:37:39 +0000
Date: Wed, 29 Jul 2026 16:36:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-nvme:nvme-7.3 45/48]
 drivers/nvme/host/multipath.c:249:38: warning: reading variable
 'current_path' requires holding __ctx_lock_RCU 'RCU'
Message-ID: <202607291634.E5clnaLh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-nvme@lists.infradead.org
TO: Nilay Shroff <nilay@linux.ibm.com>
CC: Keith Busch <kbusch@kernel.org>
CC: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/nvme.git nvme-7.3
head:   b53d495c7f0db46b6748b5ade48371a10dd5d3bc
commit: fccada336f6d29344e3853d44b96684807dd7d7d [45/48] nvme: enable context analysis support for nvme host driver
:::::: branch date: 11 hours ago
:::::: commit date: 15 hours ago
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260729/202607291634.E5clnaLh-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 890b11e09e45e9d8b29f2f94f22052be3934e757)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607291634.E5clnaLh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607291634.E5clnaLh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvme/host/multipath.c:249:38: warning: reading variable 'current_path' requires holding __ctx_lock_RCU 'RCU' [-Wthread-safety-analysis]
     249 |                 if (ns == rcu_access_pointer(head->current_path[node])) {
         |                                                    ^
   1 warning generated.


vim +249 drivers/nvme/host/multipath.c

0d0b660f214dc49 Christoph Hellwig 2018-05-14  241  
0157ec8dad3c8fc Sagi Grimberg     2019-07-25  242  bool nvme_mpath_clear_current_path(struct nvme_ns *ns)
32acab3181c7053 Christoph Hellwig 2017-11-02  243  {
f333444708f82c4 Christoph Hellwig 2018-09-11  244  	struct nvme_ns_head *head = ns->head;
0157ec8dad3c8fc Sagi Grimberg     2019-07-25  245  	bool changed = false;
f333444708f82c4 Christoph Hellwig 2018-09-11  246  	int node;
f333444708f82c4 Christoph Hellwig 2018-09-11  247  
f333444708f82c4 Christoph Hellwig 2018-09-11  248  	for_each_node(node) {
0157ec8dad3c8fc Sagi Grimberg     2019-07-25 @249  		if (ns == rcu_access_pointer(head->current_path[node])) {
f333444708f82c4 Christoph Hellwig 2018-09-11  250  			rcu_assign_pointer(head->current_path[node], NULL);
0157ec8dad3c8fc Sagi Grimberg     2019-07-25  251  			changed = true;
0157ec8dad3c8fc Sagi Grimberg     2019-07-25  252  		}
f333444708f82c4 Christoph Hellwig 2018-09-11  253  	}
0157ec8dad3c8fc Sagi Grimberg     2019-07-25  254  	return changed;
0157ec8dad3c8fc Sagi Grimberg     2019-07-25  255  }
0157ec8dad3c8fc Sagi Grimberg     2019-07-25  256  

:::::: The code at line 249 was first introduced by commit
:::::: 0157ec8dad3c8fc9bc9790f76e0831ffdaf2e7f0 nvme: fix controller removal race with scan work

:::::: TO: Sagi Grimberg <sagi@grimberg.me>
:::::: CC: Sagi Grimberg <sagi@grimberg.me>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
