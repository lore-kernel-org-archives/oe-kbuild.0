Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE88561FFE
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Nov 2025 18:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763231202; cv=none; b=rrOPgDlZ2cRe0+YYMMH9GlkSFMGtatEllQN5F4w/R2y3d1SQY5M2ik6AYjy478WhARJZAmda7qEEr5YrIEXnv6Eyatwz577FtBINIz3Pl53Z8CUoIQiUrDdKvnzXi4Dv/7eosN7OLIT4sVjlQSISUG2J+HsdRIzXDd73LfOyyQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763231202; c=relaxed/simple;
	bh=u/YRJPVAepgxTUiUnMeBOjgKJFrbVR8PNbosg1tl588=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gD2lBJoR6BlVmpZUsE4vBxG5D62Ta6UCTtuKxxKYgkWFREl3Lqc8pnT+OURC5hDIe2PL8UqC0mC2ce5NZ7QMll0aSo/XFVvvoEJV4xT/cQ9xdIcI5bO8a2M7+xnwwjjFSCf5qaicPq/Erv7bJMazQSM6Mw5CLNjTZad+COGnZIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/lTa21u; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/lTa21u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763231201; x=1794767201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u/YRJPVAepgxTUiUnMeBOjgKJFrbVR8PNbosg1tl588=;
  b=i/lTa21uVEGwR8B4Xz2a7HrBwe2Nu8lviZ5PjaKUEQ/ZD8wiUfk8zN14
   F/oW+XD0SVbeyT4HJ9KC7xcVPntRbPVG1NLVZl6pw7U13UxmtCS+rJIag
   TKTGa5maaXkv9aP7gUCnWY7QMTRE9e7dwqohTgMjD9mNgVDHE3sD6eu8c
   FSQuTUh2um7jZk7HGFH1IyQBAzNTYzpmkjj09+kaoo3Z9KT9+W9bKkTBH
   YZfvPZT+pH8c3qcrpSCbs/7+ejrPiKZSe+sXYDBRH0NJUZrdKjo8qFeAH
   HvICgFivkPZ4pqoZS+SdIbxlXPtp+NltLP1dEFf9d8UebUAEefsPjDLL9
   g==;
X-CSE-ConnectionGUID: YOqT/Na+TWuVnSmd1r6FNw==
X-CSE-MsgGUID: UDNnG3s+QhG+ayIQWR/JIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="76398222"
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="76398222"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 10:26:40 -0800
X-CSE-ConnectionGUID: 13PMM8xAT0uhjJDTl8yBug==
X-CSE-MsgGUID: NjqHt63AQzKb9C5zY3je+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="220733627"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Nov 2025 10:26:39 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKKyq-0008Ap-10;
	Sat, 15 Nov 2025 18:26:36 +0000
Date: Sun, 16 Nov 2025 02:25:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 5/5] crash: export crashkernel CMA reservation to
 userspace
Message-ID: <202511160111.u914wwkd-lkp@intel.com>
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
In-Reply-To: <20251114051504.614937-6-sourabhjain@linux.ibm.com>
References: <20251114051504.614937-6-sourabhjain@linux.ibm.com>
TO: Sourabh Jain <sourabhjain@linux.ibm.com>
TO: linux-kernel@vger.kernel.org
CC: Sourabh Jain <sourabhjain@linux.ibm.com>
CC: Aditya Gupta <adityag@linux.ibm.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Baoquan he <bhe@redhat.com>
CC: Dave Young <dyoung@redhat.com>
CC: Hari Bathini <hbathini@linux.ibm.com>
CC: Jiri Bohac <jbohac@suse.cz>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
CC: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
CC: Pingfan Liu <piliu@redhat.com>
CC: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
CC: Shivang Upadhyay <shivangu@linux.ibm.com>
CC: Vivek Goyal <vgoyal@redhat.com>
CC: linuxppc-dev@lists.ozlabs.org
CC: kexec@lists.infradead.org

Hi Sourabh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.18-rc5 next-20251114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sourabh-Jain/Documentation-ABI-add-kexec-and-kdump-sysfs-interface/20251114-131729
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251114051504.614937-6-sourabhjain%40linux.ibm.com
patch subject: [PATCH v4 5/5] crash: export crashkernel CMA reservation to userspace
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sh-randconfig-r071-20251115 (https://download.01.org/0day-ci/archive/20251116/202511160111.u914wwkd-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511160111.u914wwkd-lkp@intel.com/

smatch warnings:
kernel/kexec_core.c:1280 crash_cma_ranges_show() warn: we never enter this loop

vim +1280 kernel/kexec_core.c

33da2f799a7b0d Sourabh Jain 2025-11-14  1276  
33da2f799a7b0d Sourabh Jain 2025-11-14  1277  	ssize_t len = 0;
33da2f799a7b0d Sourabh Jain 2025-11-14  1278  	int i;
33da2f799a7b0d Sourabh Jain 2025-11-14  1279  
33da2f799a7b0d Sourabh Jain 2025-11-14 @1280  	for (i = 0; i < crashk_cma_cnt; ++i) {
33da2f799a7b0d Sourabh Jain 2025-11-14  1281  		len += sysfs_emit_at(buf, len, "%08llx-%08llx\n",
33da2f799a7b0d Sourabh Jain 2025-11-14  1282  				     crashk_cma_ranges[i].start,
33da2f799a7b0d Sourabh Jain 2025-11-14  1283  				     crashk_cma_ranges[i].end);
33da2f799a7b0d Sourabh Jain 2025-11-14  1284  	}
33da2f799a7b0d Sourabh Jain 2025-11-14  1285  	return len;
33da2f799a7b0d Sourabh Jain 2025-11-14  1286  }
33da2f799a7b0d Sourabh Jain 2025-11-14  1287  static struct kobj_attribute crash_cma_ranges_attr = __ATTR_RO(crash_cma_ranges);
33da2f799a7b0d Sourabh Jain 2025-11-14  1288  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
