Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E4313AD1C
	for <oe-kbuild@lists.linux.dev>; Sun, 24 May 2026 01:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779586629; cv=none; b=Zqo+ZYcfM4t0JuSgqfXIdj4OI8di+Oi7piFYx4bs7MXUnSEUlZqoxoaZYP98+aLxEIo7TPH01endg6JZMMvtPa62PpLAAEQRcf9tTXIn+xne0jRQ6gpcLmv9gZcgS73k5AaPujvLR+vsVzdpjXl7XuONUK/zRYmVfAZEU0SFFdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779586629; c=relaxed/simple;
	bh=4gq/cmL8WqbjisGNBY5cSOcDNugJUiGCNUA3SYTzXZ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hWt0UtgdlXigPtE9sDv+JB1jqrKI3bAbwu90Ty/etOvg6y1wnjVC+5yp7o+HVBccdMG+fL4WrPl4tDbxCtN+syXEPPSUWm6MS0G0r5VL55XaW8zQRT5KT4ebZ6Kllx3GvjYxYpbpk76p5oB2rS/Gsf3sT9CTqiUM8z2QNz9m6tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H02TBaBh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H02TBaBh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779586628; x=1811122628;
  h=date:from:to:cc:subject:message-id;
  bh=4gq/cmL8WqbjisGNBY5cSOcDNugJUiGCNUA3SYTzXZ0=;
  b=H02TBaBhELHgidC/fCIpTZMJT2MwKEgILFDvehA2N655BepQ/d2by2K0
   jI7G7qsEyrOSM5p0KfIm165UbR3TUf4Jqn8W52kAH/un/uZS0sbga/uVH
   S6dO96xUklaBVi4gPJfATXJ5R4C47YOG2ZPpBxESgYpUS96IQfOtMY9lx
   tG+YEjqz9whhM9i9gWp9PqJiyae9MpSlf6xpW4gYbLd5OYqBfLpWXElWs
   0bfUZbx2PFWOFN5qjPrqMKII6tBUZKefO/2sA1VqvNgTcjp2MkcqcgCSf
   B+Axvo8eBBcTSVFFyTO0atKtNBxFQNzZWBUxAjLGsz7QMGblg8UAHUfmX
   A==;
X-CSE-ConnectionGUID: nrC7BgPWSvaI4uGLah+A2Q==
X-CSE-MsgGUID: d/Esv8zLR/+fbLtOoBO/uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="91849628"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="91849628"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 18:37:07 -0700
X-CSE-ConnectionGUID: FqP10b8RTb+F/hzaYxe65Q==
X-CSE-MsgGUID: +PKNWKuNSsSwizQMmmLVHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="246336529"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 May 2026 18:37:06 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQxm4-000000000Y7-0K1z;
	Sun, 24 May 2026 01:37:04 +0000
Date: Sun, 24 May 2026 09:36:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rppt:uffd/merge+rwp 10/16] mm/userfaultfd.c:2604
 userfault_msg() warn: bitwise AND condition is false here
Message-ID: <202605240958.XsZr1L7I-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Mike Rapoport <rppt@kernel.org>
TO: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
CC: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git uffd/merge+rwp
head:   4acb6751ddb876e82b41ca0f81f7cb7b0bc08741
commit: 4ee4d7ce7336c4c2117ffab7d196ec18991d978e [10/16] userfaultfd: add UFFDIO_REGISTER_MODE_RWP and UFFDIO_RWPROTECT plumbing
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: i386-randconfig-r071-20260524 (https://download.01.org/0day-ci/archive/20260524/202605240958.XsZr1L7I-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605240958.XsZr1L7I-lkp@intel.com/

smatch warnings:
mm/userfaultfd.c:2604 userfault_msg() warn: bitwise AND condition is false here
mm/userfaultfd.c:3698 userfaultfd_register() warn: bitwise AND condition is false here

vim +2604 mm/userfaultfd.c

aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2576) 
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2577) static inline struct uffd_msg userfault_msg(unsigned long address,
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2578) 					    unsigned long real_address,
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2579) 					    unsigned int flags,
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2580) 					    unsigned long reason,
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2581) 					    unsigned int features)
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2582) {
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2583) 	struct uffd_msg msg;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2584) 
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2585) 	msg_init(&msg);
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2586) 	msg.event = UFFD_EVENT_PAGEFAULT;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2587) 
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2588) 	msg.arg.pagefault.address = (features & UFFD_FEATURE_EXACT_ADDRESS) ?
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2589) 				    real_address : address;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2590) 
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2591) 	/*
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2592) 	 * These flags indicate why the userfault occurred:
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2593) 	 * - UFFD_PAGEFAULT_FLAG_WP indicates a write protect fault.
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2594) 	 * - UFFD_PAGEFAULT_FLAG_MINOR indicates a minor fault.
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2595) 	 * - Neither of these flags being set indicates a MISSING fault.
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2596) 	 *
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2597) 	 * Separately, UFFD_PAGEFAULT_FLAG_WRITE indicates it was a write
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2598) 	 * fault. Otherwise, it was a read fault.
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2599) 	 */
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2600) 	if (flags & FAULT_FLAG_WRITE)
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2601) 		msg.arg.pagefault.flags |= UFFD_PAGEFAULT_FLAG_WRITE;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2602) 	if (reason & VM_UFFD_WP)
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2603) 		msg.arg.pagefault.flags |= UFFD_PAGEFAULT_FLAG_WP;
4ee4d7ce7336c4c Kiryl Shutsemau (Meta     2026-05-22 @2604) 	if (reason & VM_UFFD_RWP)
4ee4d7ce7336c4c Kiryl Shutsemau (Meta     2026-05-22  2605) 		msg.arg.pagefault.flags |= UFFD_PAGEFAULT_FLAG_RWP;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2606) 	if (reason & VM_UFFD_MINOR)
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2607) 		msg.arg.pagefault.flags |= UFFD_PAGEFAULT_FLAG_MINOR;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2608) 	if (features & UFFD_FEATURE_THREAD_ID)
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2609) 		msg.arg.pagefault.feat.ptid = task_pid_vnr(current);
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2610) 	return msg;
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2611) }
aa52c028b2f742d Mike Rapoport (Microsoft  2026-05-01  2612) 

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
