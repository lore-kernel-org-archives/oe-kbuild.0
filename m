Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88988495
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Jul 2024 22:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720995155; cv=none; b=lTO/1Ld+wxwYQCwgJU4YudTQbcyqwOgx0E9LcE3kN/CNLLQOOaRt/RcNPa/CgfqfsTqZ0fsKMfIMksc5LbzzUmoTo7w3YzafkZSCjri4V7ONGaZBS+qQhd8UEZn0ye6Rc2LZAN5KEjbiyjECkcw/ptzQ0bfJChQ/SA0KIDfyYJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720995155; c=relaxed/simple;
	bh=xF6t3k2hhBA22AHFEj5ufdVr5m2MWY4bDLf7m4M3pOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q5nHHRMBfxFFXmj4LGDrLX+KWUnM5+dYFuy18A8k8jg1rW5PnnHrLxcRQyM17sqwEZ1uCDceyA1+QxRmRA8RPTOLvd/OI7ZoEHfKJs8zvPzincktNpVHUwJ3Es7WbIzp2f+yYTLu5IxMr0G2ZmlRrj/8qKWhpbZ5DlREWS0Z464=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l1tVzuds; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l1tVzuds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720995153; x=1752531153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xF6t3k2hhBA22AHFEj5ufdVr5m2MWY4bDLf7m4M3pOk=;
  b=l1tVzudsIuJ/PxYEord1goCsuGAUkfkwJFUy2ziylN4t8sylihXHigbP
   Tt+SpLhuYQdNR9OAZgcUS+54//zwxrjsIvPwehdGhOKlSuPtsH5ndtpm+
   zwLz6bu4fIWvkF9w3wPzeyU5UVILkTKySJcGkGA7zf3UL/axp2Wb3ZijG
   ILWxmRBWBGJ9DTldLyBJpGjAcVVFkmte5GtBaIte8Fl/7H5Tm8qtWw/0r
   N1iGMlDw9rj0DvH2QuxueSWcT5KIcKzL6KAPsxKxm4i/cLC8rxY0tn5m6
   7yFLnZlwPy0xavyzvWr85760R/fUZ8oRzPBMX6WRORh+aX13k/mX0rhTa
   g==;
X-CSE-ConnectionGUID: eTyAn1S9RNi8sPPlP4btSw==
X-CSE-MsgGUID: vmtZ/v/FSOaH+HyNHcQqEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="29759796"
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="29759796"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2024 15:12:31 -0700
X-CSE-ConnectionGUID: OoDZLpXjTEWcx4CGZkcSzw==
X-CSE-MsgGUID: zYr6BkYORkGzyMQ8mUqbOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="72654459"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Jul 2024 15:12:29 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sT7SF-000dll-2G;
	Sun, 14 Jul 2024 22:12:27 +0000
Date: Mon, 15 Jul 2024 06:12:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rppt:numa/memblks/v0.1 13/17] mm/numa_memblks.c:105
 numa_set_distance() error: we previously assumed 'numa_distance' could be
 null (see line 88)
Message-ID: <202407150648.DpdebbIo-lkp@intel.com>
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
CC: Mike Rapoport <rppt@kernel.org>
TO: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Hi Mike,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git numa/memblks/v0.1
head:   1386d3ef0ea65efd26c4ad6b034910535f0a7f91
commit: 638a43db1c03bcb20e6061cab1ba8ffde3ee4c2c [13/17] mm: move numa_distance and related code from x86 to numa_memblks
:::::: branch date: 8 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240715 (https://download.01.org/0day-ci/archive/20240715/202407150648.DpdebbIo-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407150648.DpdebbIo-lkp@intel.com/

smatch warnings:
mm/numa_memblks.c:105 numa_set_distance() error: we previously assumed 'numa_distance' could be null (see line 88)

vim +/numa_distance +105 mm/numa_memblks.c

638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   66) 
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   67) /**
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   68)  * numa_set_distance - Set NUMA distance from one NUMA to another
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   69)  * @from: the 'from' node to set distance
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   70)  * @to: the 'to'  node to set distance
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   71)  * @distance: NUMA distance
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   72)  *
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   73)  * Set the distance from node @from to @to to @distance.  If distance table
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   74)  * doesn't exist, one which is large enough to accommodate all the currently
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   75)  * known nodes will be created.
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   76)  *
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   77)  * If such table cannot be allocated, a warning is printed and further
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   78)  * calls are ignored until the distance table is reset with
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   79)  * numa_reset_distance().
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   80)  *
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   81)  * If @from or @to is higher than the highest known node or lower than zero
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   82)  * at the time of table creation or @distance doesn't make sense, the call
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   83)  * is ignored.
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   84)  * This is to allow simplification of specific NUMA config implementations.
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   85)  */
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   86) void __init numa_set_distance(int from, int to, int distance)
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   87) {
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11  @88) 	if (!numa_distance && numa_alloc_distance() < 0)
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   89) 		return;
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   90) 
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   91) 	if (from >= numa_distance_cnt || to >= numa_distance_cnt ||
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   92) 			from < 0 || to < 0) {
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   93) 		pr_warn_once("Warning: node ids are out of bound, from=%d to=%d distance=%d\n",
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   94) 			     from, to, distance);
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   95) 		return;
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   96) 	}
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   97) 
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   98) 	if ((u8)distance != distance ||
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11   99) 	    (from == to && distance != LOCAL_DISTANCE)) {
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11  100) 		pr_warn_once("Warning: invalid distance parameter, from=%d to=%d distance=%d\n",
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11  101) 			     from, to, distance);
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11  102) 		return;
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11  103) 	}
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11  104) 
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11 @105) 	numa_distance[from * numa_distance_cnt + to] = distance;
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11  106) }
638a43db1c03bcb Mike Rapoport (Microsoft  2024-07-11  107) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
