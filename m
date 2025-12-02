Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B92F244661
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 03:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764647735; cv=none; b=h3GCzJcSazkGqwIMz/8/4Tlcf8DFRkAD+gzw4fY39DxXH97ccrA7+fepRtnb7lj3lc2hdzhJh+i3YZmvsz+iYfalpuKpxAuxkuS+cr1Yrf57mFdbxqfJhxAjEUPDivlPkT6lg7JX8zR/NAHDrYI1GA9br0mw/p3Lse0b921FRds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764647735; c=relaxed/simple;
	bh=YXRs+z87paYlfRKMxY3RclH3BRakamdK7I+XXjxidCA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Izwjh79GO91aCr1SixvqbsDEK/B8tnIW05y35DHQ7h9zEPB7yVciRWVeXclRJ0bBbkNF/G32FghQObHS23MxHAghQlpNpiJzTthw7b4DxTYBfPydp1WlmUT3h9NOWVogp6P7bfEx6irWKfeXx8WPX2zhBvEaoYnSu5Fd9t1fYrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N+A6rM01; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N+A6rM01"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764647733; x=1796183733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YXRs+z87paYlfRKMxY3RclH3BRakamdK7I+XXjxidCA=;
  b=N+A6rM01oHE7Me7WSCZ/uPId5CfLBuZQpVbFhQ1k+jx/w/h5SuubJwOR
   3K9e8xEbGymB+sGGG4RRNLwBsUfrPymFR2PMNz1smLINmMvk+HSOxPjTZ
   ByeqvuepOJLrorNGWis9FaZeq0/KEjeQUlTnRvikhwG+Lb85Z7eZPhTKP
   iHCwcw04jYvynLiXn7YbEsH/I7su+eHQFZUhNbqvJgmhWo9R0Y5FGOcC0
   9mfI6rQcIzoPEzU/n2RxsAEcE9iCtD/98UZz8n71S3fqdlKN2VVJJZBEe
   8E/AUyiNFK+txl1aLmTRy7om2tx+nwytVQd5bvvb+g6gGzYOYwU+RXeuK
   A==;
X-CSE-ConnectionGUID: HCZgILI1Soi+FR5cY9JTxw==
X-CSE-MsgGUID: O5GJFpCcRWqM3j2wNtW9wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66641895"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66641895"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 19:55:33 -0800
X-CSE-ConnectionGUID: ilhxkBALQl6h8H+6uMH1ZQ==
X-CSE-MsgGUID: QHjs4CghRhqBRYXaK6Ywjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="194244880"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 01 Dec 2025 19:55:32 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQHU9-000000002oH-2GY7;
	Tue, 02 Dec 2025 03:55:29 +0000
Date: Tue, 2 Dec 2025 04:54:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 12712/13171]
 tools/testing/selftests/vfio/vfio_pci_device_init_perf_test.c:2:10: fatal
 error: pthread.h: No such file or directory
Message-ID: <202512020403.lXv6hkOT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Matlack <dmatlack@google.com>
CC: Alex Williamson <alex@shazbot.org>
CC: Alex Mastro <amastro@fb.com>
CC: Raghavendra Rao Ananta <rananta@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
commit: d721f52e31553a848e0e9947ca15a49c5674aef3 [12712/13171] vfio: selftests: Add vfio_pci_device_init_perf_test
:::::: branch date: 25 hours ago
:::::: commit date: 3 days ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512020403.lXv6hkOT-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020403.lXv6hkOT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512020403.lXv6hkOT-lkp@intel.com/

Note: the linux-next/master HEAD 95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> tools/testing/selftests/vfio/vfio_pci_device_init_perf_test.c:2:10: fatal error: pthread.h: No such file or directory
       2 | #include <pthread.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +2 tools/testing/selftests/vfio/vfio_pci_device_init_perf_test.c

d721f52e31553a David Matlack 2025-11-26 @2  #include <pthread.h>
d721f52e31553a David Matlack 2025-11-26  3  #include <sys/ioctl.h>
d721f52e31553a David Matlack 2025-11-26  4  #include <sys/mman.h>
d721f52e31553a David Matlack 2025-11-26  5  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
