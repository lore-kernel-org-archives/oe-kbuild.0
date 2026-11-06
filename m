Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793933269;
	b=gB6cTfPFhUgDoJ8idTe1hfQwziod9KhxILP+jFX+7dr0YgOPesitD+5wI04IBJtw1O7i
	 wMDqBXhI5zL/WzyP6w+vx2M9dWtZ776naSGG63+L8bMsZOVvBhnPztf5ejbTbyRiL8l+i
	 8AtQTLn5cC6OpkQnCLSR4Qq/385N9/M3PChknWd6X7QOnQLrnHtS9HOQQyN8pMqyuwPKN
	 LVvnq+Av4kWAKaNsWZ22/Y8c/4MEbw4N481F25qPEHLZ05kQD51dygrmsdvD7r3nZEqFT
	 nYecX7QqA12k0PEj0h3qFEma+mQVZ/amOFGRoyMWlvACeHIVtp7+vEd/2xRKiIDPYrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793933269;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Rb4CoOmRUhuf+FiCf4I91mfx6ufVMd8BU/0HJcK9Tdw=;
	b=ski21qT6TzIGKBuVfqO3LgJONE6mCggwQs8X+fr/p/5up2uslmjKQQKjN7xohJA2oa5v
	 OmnXc9Myfkd9bf7AWvMH6NJjLQPnbFOp7lNCA/cv05SgYzcraASlPhTD/9F8H6jowQjKF
	 Bhs8u2l0oOYaldfSE+IbgsXQQp5ZIWp0TIcWsIndvNyuzSvhexLt3rzW5+W488u9sAW3O
	 /tkoQajM10zVQtWM3DYXIaOezQ0V093ijlcSVw7qVVA5+xEAuEFo3dKuDrHFcIu1wlGJv
	 t/2Ts/ci+i3BI9yQ6i72sHpQSGVV4v5/Kk4cB1z5G+ild3yiDcBQUYU2GkENEhHzFBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WIW30RIA;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E89606A31B
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Nov 2026 02:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2E89606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WIW30RIA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793933268; x=1825469268;
  h=date:from:to:cc:subject:message-id;
  bh=ky3tKS8mQI6TPVlinntT8oYxuYjOF+tdscAUvakphzA=;
  b=WIW30RIAkxDIsh7aR1AWVQvQLAaNF1CXGVrACffNcUno5OymmzJSH03e
   A6T1vjTpFMbmO7FIFVHn0FMQM2PBy2iqFsAdTXIcMKgp559Or5dO2+EbF
   AxkyLHi36roWswgXTpKbMqOz0sA+IVRl6nYcTxxcoMwCCOd6hO+l4ky/6
   ve07FC9u19dB5m57tfGocg7ogfZaDy9MnuY2x5BMwJwuwB26l8STxtJTX
   HV9I2IDUwsfCqoD4mrYOBB/mi5bIdo5+e2WFyhFmNghRF//cZ2qdk4+vN
   GYoDNDOB9d+5ELwhHRWWYvPenNk1YdydFrKNQTdg/+ivGDNI5YpjldMHc
   Q==;
X-CSE-ConnectionGUID: b+ue0q1VSMu8HgHaXwKKVg==
X-CSE-MsgGUID: mtqw8J41RyOZqyP4X6a0rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2764355"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2764355"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 18:47:47 -0800
X-CSE-ConnectionGUID: ii9Ixt5QTwC5cDXVki+gDQ==
X-CSE-MsgGUID: mGZsLfxWQWeutIeIBrJi4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7493346"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 05 Nov 2026 18:47:46 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP9zS-000000009z9-2CaZ;
	Fri, 06 Nov 2026 02:47:42 +0000
Date: Fri, 06 Nov 2026 03:46:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android17-6.18-p3s 58/58] mm/madvise.c:2012
 do_madvise() warn: missing error code? 'error'
Message-ID: <202611060315.68wjrcYb-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android17-6.18-p3s
head:   5bcdf096fa9a02f8ee295f36a2daf645e18327a5
commit: 648be4d49264c6eea182eb958b6c7c1637a716ba [58/58] ANDROID: vendor_hook: Added hook to tune reclaimed huge page
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-2200-20261105 (https://download.01.org/0day-ci/archive/20261106/202611060315.68wjrcYb-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611060315.68wjrcYb-lkp@intel.com/

smatch warnings:
mm/madvise.c:2012 do_madvise() warn: missing error code? 'error'

vim +/error +2012 mm/madvise.c

457753da646202 SeongJae Park     2025-02-05  1919  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1920  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16  1921   * The madvise(2) system call.
^1da177e4c3f41 Linus Torvalds    2005-04-16  1922   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  1923   * Applications can use madvise() to advise the kernel how it should
^1da177e4c3f41 Linus Torvalds    2005-04-16  1924   * handle paging I/O in this VM area.  The idea is to help the kernel
^1da177e4c3f41 Linus Torvalds    2005-04-16  1925   * use appropriate read-ahead and caching techniques.  The information
^1da177e4c3f41 Linus Torvalds    2005-04-16  1926   * provided is advisory only, and can be safely disregarded by the
^1da177e4c3f41 Linus Torvalds    2005-04-16  1927   * kernel without affecting the correct operation of the application.
^1da177e4c3f41 Linus Torvalds    2005-04-16  1928   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  1929   * behavior values:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1930   *  MADV_NORMAL - the default behavior is to read clusters.  This
^1da177e4c3f41 Linus Torvalds    2005-04-16  1931   *		results in some read-ahead and read-behind.
^1da177e4c3f41 Linus Torvalds    2005-04-16  1932   *  MADV_RANDOM - the system should read the minimum amount of data
^1da177e4c3f41 Linus Torvalds    2005-04-16  1933   *		on any access, since it is unlikely that the appli-
^1da177e4c3f41 Linus Torvalds    2005-04-16  1934   *		cation will need more than what it asks for.
^1da177e4c3f41 Linus Torvalds    2005-04-16  1935   *  MADV_SEQUENTIAL - pages in the given range will probably be accessed
^1da177e4c3f41 Linus Torvalds    2005-04-16  1936   *		once, so they can be aggressively read ahead, and
^1da177e4c3f41 Linus Torvalds    2005-04-16  1937   *		can be freed soon after they are accessed.
^1da177e4c3f41 Linus Torvalds    2005-04-16  1938   *  MADV_WILLNEED - the application is notifying the system to read
^1da177e4c3f41 Linus Torvalds    2005-04-16  1939   *		some pages ahead.
^1da177e4c3f41 Linus Torvalds    2005-04-16  1940   *  MADV_DONTNEED - the application is finished with the given range,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1941   *		so the kernel can free resources associated with it.
d7206a70af5c09 Naoya Horiguchi   2016-03-15  1942   *  MADV_FREE - the application marks pages in the given range as lazy free,
d7206a70af5c09 Naoya Horiguchi   2016-03-15  1943   *		where actual purges are postponed until memory pressure happens.
f6b3ec238d12c8 Badari Pulavarty  2006-01-06  1944   *  MADV_REMOVE - the application wants to free up the given range of
f6b3ec238d12c8 Badari Pulavarty  2006-01-06  1945   *		pages and associated backing store.
3866ea90d3635d Hugh Dickins      2009-09-21  1946   *  MADV_DONTFORK - omit this area from child's address space when forking:
3866ea90d3635d Hugh Dickins      2009-09-21  1947   *		typically, to avoid COWing pages pinned by get_user_pages().
3866ea90d3635d Hugh Dickins      2009-09-21  1948   *  MADV_DOFORK - cancel MADV_DONTFORK: no longer omit this area when forking.
c02c3009325418 Yang Shi          2017-10-13  1949   *  MADV_WIPEONFORK - present the child process with zero-filled memory in this
c02c3009325418 Yang Shi          2017-10-13  1950   *              range after a fork.
c02c3009325418 Yang Shi          2017-10-13  1951   *  MADV_KEEPONFORK - undo the effect of MADV_WIPEONFORK
d7206a70af5c09 Naoya Horiguchi   2016-03-15  1952   *  MADV_HWPOISON - trigger memory error handler as if the given memory range
d7206a70af5c09 Naoya Horiguchi   2016-03-15  1953   *		were corrupted by unrecoverable hardware memory failure.
d7206a70af5c09 Naoya Horiguchi   2016-03-15  1954   *  MADV_SOFT_OFFLINE - try to soft-offline the given range of memory.
f8af4da3b4c14e Hugh Dickins      2009-09-21  1955   *  MADV_MERGEABLE - the application recommends that KSM try to merge pages in
f8af4da3b4c14e Hugh Dickins      2009-09-21  1956   *		this area with pages of identical content from other such areas.
f8af4da3b4c14e Hugh Dickins      2009-09-21  1957   *  MADV_UNMERGEABLE- cancel MADV_MERGEABLE: no longer merge pages with others.
d7206a70af5c09 Naoya Horiguchi   2016-03-15  1958   *  MADV_HUGEPAGE - the application wants to back the given range by transparent
d7206a70af5c09 Naoya Horiguchi   2016-03-15  1959   *		huge pages in the future. Existing pages might be coalesced and
d7206a70af5c09 Naoya Horiguchi   2016-03-15  1960   *		new pages might be allocated as THP.
d7206a70af5c09 Naoya Horiguchi   2016-03-15  1961   *  MADV_NOHUGEPAGE - mark the given range as not worth being backed by
d7206a70af5c09 Naoya Horiguchi   2016-03-15  1962   *		transparent huge pages so the existing pages will not be
d7206a70af5c09 Naoya Horiguchi   2016-03-15  1963   *		coalesced into THP and new pages will not be allocated as THP.
7d8faaf155454f Zach O'Keefe      2022-07-06  1964   *  MADV_COLLAPSE - synchronously coalesce pages into new THP.
d7206a70af5c09 Naoya Horiguchi   2016-03-15  1965   *  MADV_DONTDUMP - the application wants to prevent pages in the given range
d7206a70af5c09 Naoya Horiguchi   2016-03-15  1966   *		from being included in its core dump.
d7206a70af5c09 Naoya Horiguchi   2016-03-15  1967   *  MADV_DODUMP - cancel MADV_DONTDUMP: no longer exclude from core dump.
ecb8ac8b1f1469 Minchan Kim       2020-10-17  1968   *  MADV_COLD - the application is not expected to use this memory soon,
ecb8ac8b1f1469 Minchan Kim       2020-10-17  1969   *		deactivate pages in this range so that they can be reclaimed
f0953a1bbaca71 Ingo Molnar       2021-05-06  1970   *		easily if memory pressure happens.
ecb8ac8b1f1469 Minchan Kim       2020-10-17  1971   *  MADV_PAGEOUT - the application is not expected to use this memory soon,
ecb8ac8b1f1469 Minchan Kim       2020-10-17  1972   *		page out the pages in this range immediately.
4ca9b3859dac14 David Hildenbrand 2021-06-30  1973   *  MADV_POPULATE_READ - populate (prefault) page tables readable by
4ca9b3859dac14 David Hildenbrand 2021-06-30  1974   *		triggering read faults if required
4ca9b3859dac14 David Hildenbrand 2021-06-30  1975   *  MADV_POPULATE_WRITE - populate (prefault) page tables writable by
4ca9b3859dac14 David Hildenbrand 2021-06-30  1976   *		triggering write faults if required
^1da177e4c3f41 Linus Torvalds    2005-04-16  1977   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  1978   * return values:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1979   *  zero    - success
^1da177e4c3f41 Linus Torvalds    2005-04-16  1980   *  -EINVAL - start + len < 0, start is not page-aligned,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1981   *		"behavior" is not a valid value, or application
c02c3009325418 Yang Shi          2017-10-13  1982   *		is attempting to release locked or shared pages,
c02c3009325418 Yang Shi          2017-10-13  1983   *		or the specified address range includes file, Huge TLB,
c02c3009325418 Yang Shi          2017-10-13  1984   *		MAP_SHARED or VMPFNMAP range.
^1da177e4c3f41 Linus Torvalds    2005-04-16  1985   *  -ENOMEM - addresses in the specified range are not currently
^1da177e4c3f41 Linus Torvalds    2005-04-16  1986   *		mapped, or are outside the AS of the process.
^1da177e4c3f41 Linus Torvalds    2005-04-16  1987   *  -EIO    - an I/O error occurred while paging in data.
^1da177e4c3f41 Linus Torvalds    2005-04-16  1988   *  -EBADF  - map exists, but area maps something that isn't a file.
^1da177e4c3f41 Linus Torvalds    2005-04-16  1989   *  -EAGAIN - a kernel resource was temporarily unavailable.
8be7258aad44b5 Jeff Xu           2024-04-15  1990   *  -EPERM  - memory is sealed.
^1da177e4c3f41 Linus Torvalds    2005-04-16  1991   */
0726b01e70455f Minchan Kim       2020-10-17  1992  int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int behavior)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1993  {
ac1e9acc5acf0b Colin Cross       2022-01-14  1994  	int error;
01bef02bf9301e SeongJae Park     2025-04-09  1995  	struct mmu_gather tlb;
01bef02bf9301e SeongJae Park     2025-04-09  1996  	struct madvise_behavior madv_behavior = {
20d3aea927808b Lorenzo Stoakes   2025-06-20  1997  		.mm = mm,
01bef02bf9301e SeongJae Park     2025-04-09  1998  		.behavior = behavior,
01bef02bf9301e SeongJae Park     2025-04-09  1999  		.tlb = &tlb,
01bef02bf9301e SeongJae Park     2025-04-09  2000  	};
648be4d49264c6 Pengfei Li        2025-07-17  2001  	bool bypass = false;
84d96d897671cf Rasmus Villemoes  2013-04-29  2002  
0a6ffacb3b4223 SeongJae Park     2025-03-12  2003  	if (madvise_should_skip(start, len_in, behavior, &error))
0a6ffacb3b4223 SeongJae Park     2025-03-12  2004  		return error;
20d3aea927808b Lorenzo Stoakes   2025-06-20  2005  	error = madvise_lock(&madv_behavior);
4cc39f91ef6c6f SeongJae Park     2025-02-05  2006  	if (error)
4cc39f91ef6c6f SeongJae Park     2025-02-05  2007  		return error;
648be4d49264c6 Pengfei Li        2025-07-17  2008  
648be4d49264c6 Pengfei Li        2025-07-17  2009  	trace_android_vh_mm_do_madvise_bypass(mm, start, len_in, behavior,
648be4d49264c6 Pengfei Li        2025-07-17  2010  					      &error, &bypass);
648be4d49264c6 Pengfei Li        2025-07-17  2011  	if (bypass)
648be4d49264c6 Pengfei Li        2025-07-17 @2012  		return error;
648be4d49264c6 Pengfei Li        2025-07-17  2013  
20d3aea927808b Lorenzo Stoakes   2025-06-20  2014  	madvise_init_tlb(&madv_behavior);
20d3aea927808b Lorenzo Stoakes   2025-06-20  2015  	error = madvise_do_behavior(start, len_in, &madv_behavior);
01bef02bf9301e SeongJae Park     2025-04-09  2016  	madvise_finish_tlb(&madv_behavior);
20d3aea927808b Lorenzo Stoakes   2025-06-20  2017  	madvise_unlock(&madv_behavior);
0a27a14a62921b Nicholas Piggin   2007-05-06  2018  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2019  	return error;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2020  }
db08ca25253d56 Jens Axboe        2019-12-25  2021  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
