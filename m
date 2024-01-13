Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F134210F6
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Jan 2024 13:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgC0Ic2U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705153667; x=1736689667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7/Zitj+GHFcCvXK7kojmHOCxgguNhl+lR24oFJKosf0=;
  b=kgC0Ic2UbonKtzDgqF/3JyrhwbpLg6YTs0fzxQuLkdUWL64c3cGd6fxf
   tAl6249bd7noj7Bqr1jVmMm9TZ644uPSn/qTXCgUIWOK8cjMHLQKxR+8d
   F49oqq+WlRmj2yPTT/8fMpXh0sPxbX4lxrSzz/kx0AzIH65LWWOhE6xoz
   pHC+fxlQda4mMB/XYYxBm7UKg2hoHQmoOCA8waf51YBasZw8v3PPpMyaD
   6+zXqZHwD3SvZvzbbA8ZVunvxOo9ldeT/MMahgHBgiiCTO1n0oi+RmIDy
   JuAMykSDFRtgSyXNyau5tqQ3h1v55ALKkhzAydEjXoqRfl6diQNNdhqNu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="6098334"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="6098334"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 05:47:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="732856016"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="732856016"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 13 Jan 2024 05:47:44 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOeMP-000AXs-3D;
	Sat, 13 Jan 2024 13:47:42 +0000
Date: Sat, 13 Jan 2024 21:47:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: net/core/gro.c:38:25-29: ERROR: invalid reference to the index
 variable of the iterator on line 34
Message-ID: <202401132110.zfl2qy7d-lkp@intel.com>
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
TO: Eric Dumazet <edumazet@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   052d534373b7ed33712a63d5e17b2b6cdbce84fd
commit: 587652bbdd06ab38a4c1b85e40f933d2cf4a1147 net: gro: populate net/core/gro.c
date:   2 years, 2 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 2 years, 2 months ago
config: x86_64-randconfig-103-20240113 (https://download.01.org/0day-ci/archive/20240113/202401132110.zfl2qy7d-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401132110.zfl2qy7d-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/core/gro.c:38:25-29: ERROR: invalid reference to the index variable of the iterator on line 34

vim +38 net/core/gro.c

587652bbdd06ab Eric Dumazet 2021-11-15  16  
587652bbdd06ab Eric Dumazet 2021-11-15  17  /**
587652bbdd06ab Eric Dumazet 2021-11-15  18   *	dev_add_offload - register offload handlers
587652bbdd06ab Eric Dumazet 2021-11-15  19   *	@po: protocol offload declaration
587652bbdd06ab Eric Dumazet 2021-11-15  20   *
587652bbdd06ab Eric Dumazet 2021-11-15  21   *	Add protocol offload handlers to the networking stack. The passed
587652bbdd06ab Eric Dumazet 2021-11-15  22   *	&proto_offload is linked into kernel lists and may not be freed until
587652bbdd06ab Eric Dumazet 2021-11-15  23   *	it has been removed from the kernel lists.
587652bbdd06ab Eric Dumazet 2021-11-15  24   *
587652bbdd06ab Eric Dumazet 2021-11-15  25   *	This call does not sleep therefore it can not
587652bbdd06ab Eric Dumazet 2021-11-15  26   *	guarantee all CPU's that are in middle of receiving packets
587652bbdd06ab Eric Dumazet 2021-11-15  27   *	will see the new offload handlers (until the next received packet).
587652bbdd06ab Eric Dumazet 2021-11-15  28   */
587652bbdd06ab Eric Dumazet 2021-11-15  29  void dev_add_offload(struct packet_offload *po)
587652bbdd06ab Eric Dumazet 2021-11-15  30  {
587652bbdd06ab Eric Dumazet 2021-11-15  31  	struct packet_offload *elem;
587652bbdd06ab Eric Dumazet 2021-11-15  32  
587652bbdd06ab Eric Dumazet 2021-11-15  33  	spin_lock(&offload_lock);
587652bbdd06ab Eric Dumazet 2021-11-15 @34  	list_for_each_entry(elem, &offload_base, list) {
587652bbdd06ab Eric Dumazet 2021-11-15  35  		if (po->priority < elem->priority)
587652bbdd06ab Eric Dumazet 2021-11-15  36  			break;
587652bbdd06ab Eric Dumazet 2021-11-15  37  	}
587652bbdd06ab Eric Dumazet 2021-11-15 @38  	list_add_rcu(&po->list, elem->list.prev);
587652bbdd06ab Eric Dumazet 2021-11-15  39  	spin_unlock(&offload_lock);
587652bbdd06ab Eric Dumazet 2021-11-15  40  }
587652bbdd06ab Eric Dumazet 2021-11-15  41  EXPORT_SYMBOL(dev_add_offload);
587652bbdd06ab Eric Dumazet 2021-11-15  42  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
