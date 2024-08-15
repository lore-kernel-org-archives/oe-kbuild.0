Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C038522066
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Aug 2024 03:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723693677; cv=none; b=VPBVD8Gem32atR9qYnqAjiXjdmI/m/r9OcVufJmIfqB6nSNCgIdMKS2tkLI99IBzAD2lT2FwT5P85CKuCCTnxnu3IlWkb9F2IKY72RNvI8EJF8n7DyVd8c8Gr9MWoYAqxBiz/697lOwsA9RebJIpwhukg2XBQWvHZdbqszBF5mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723693677; c=relaxed/simple;
	bh=q8uqAeFz/La+5FY7opy83U8bllJ0tUud0mNwprNEcJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dBGNKzVDM1WLWRUdxdyNvAegGfxFeS59T+2aJiogvXyS+FZPYIfKpSEeV9aIWkgU3XKNM5SEvh6Ww0ayHAUCSP5o3qsuJ4FQ2zdH3/520TeFkn4qE061Duh/sXeeyV2FfMjqx2xUFPJhxuqNHzdK9m6n/TJOiy3+4fY/iIUPQwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LlL6oik8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LlL6oik8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723693675; x=1755229675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q8uqAeFz/La+5FY7opy83U8bllJ0tUud0mNwprNEcJY=;
  b=LlL6oik8T+03FopwBKaiBShbdW9aN2K0lwRyKacQ2F+hxgP+ZjAKNgLH
   J/vZE1yFf50aQ8JWORxuvSiBZUqQUNyZ4WDUQiJrfa44aCtDsV1KU2xB8
   wZ4kpVCXhTD27RzLjW/C4ePsWc1+ULGGmDRIQW4Nl9iDwT7K6sIyKglkv
   oBKn0AB1GsQhPez/YHNNM8UVi+1x9kO9bmgB5ezUhthPUdts+DBuInsgH
   cox3RMow8exkwchhj+8gYgsp4P6m3B301mWzGG/xI98TUkiHtATP0gqXh
   NBnKRXsMysHx0BQdjNafEIoq3hJH33ZSpC0FKbBlAXOkrHjwYuBx2uZOh
   g==;
X-CSE-ConnectionGUID: u/SoJdf/RJCBnTRV8t8CHw==
X-CSE-MsgGUID: 2JU0EDdyRMiZFPrFFRflMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="33331247"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="33331247"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 20:47:55 -0700
X-CSE-ConnectionGUID: nfRkiK4UQnmsX4fLjXiSoQ==
X-CSE-MsgGUID: GhFxWb1TQFq0jqjNSl/m6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="59389065"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Aug 2024 20:47:54 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seRSp-00039p-2N;
	Thu, 15 Aug 2024 03:47:51 +0000
Date: Thu, 15 Aug 2024 11:47:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [chrome-os:chromeos-5.15 22/30] mm/vmscan.c:4259
 try_to_inc_max_seq() error: uninitialized symbol 'walk'.
Message-ID: <202408151126.WX90QAHA-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   ca3d4c5eb0a6ed652cd1a345584483d564a1fd38
commit: 1feb0f684d7748b40305c514dda26dac13853d7f [22/30] CHROMIUM: mm/mglru: Split scan seqno from gen seqno
:::::: branch date: 11 hours ago
:::::: commit date: 24 hours ago
config: i386-randconfig-141-20240815 (https://download.01.org/0day-ci/archive/20240815/202408151126.WX90QAHA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408151126.WX90QAHA-lkp@intel.com/

smatch warnings:
mm/vmscan.c:4259 try_to_inc_max_seq() error: uninitialized symbol 'walk'.
mm/vmscan.c:4259 try_to_inc_max_seq() error: we previously assumed 'walk' could be null (see line 4238)

vim +/walk +4259 mm/vmscan.c

dcd151cea99b85 Yu Zhao       2022-09-18  4207  
43d015dfbf4c2e Yu Zhao       2022-09-18  4208  static bool try_to_inc_max_seq(struct lruvec *lruvec, unsigned long max_seq,
1feb0f684d7748 David Stevens 2024-06-05  4209  			       unsigned long scan_seq, struct scan_control *sc,
1feb0f684d7748 David Stevens 2024-06-05  4210  			       bool can_swap, bool force_scan)
43d015dfbf4c2e Yu Zhao       2022-09-18  4211  {
43d015dfbf4c2e Yu Zhao       2022-09-18  4212  	bool success;
43d015dfbf4c2e Yu Zhao       2022-09-18  4213  	struct lru_gen_mm_walk *walk;
43d015dfbf4c2e Yu Zhao       2022-09-18  4214  	struct mm_struct *mm = NULL;
a2abc441807f51 Yu Zhao       2022-12-21  4215  	struct lru_gen_page *lrugen = &lruvec->lrugen;
43d015dfbf4c2e Yu Zhao       2022-09-18  4216  
43d015dfbf4c2e Yu Zhao       2022-09-18  4217  	VM_WARN_ON_ONCE(max_seq > READ_ONCE(lrugen->max_seq));
43d015dfbf4c2e Yu Zhao       2022-09-18  4218  
1feb0f684d7748 David Stevens 2024-06-05  4219  	/* see the comment on SCAN_ITER_FINISHING and in iterate_mm_list() */
1feb0f684d7748 David Stevens 2024-06-05  4220  	if (scan_seq == SCAN_ITER_FINISHING ||
1feb0f684d7748 David Stevens 2024-06-05  4221  	    scan_seq < READ_ONCE(lruvec->mm_state.scan_seq)) {
43d015dfbf4c2e Yu Zhao       2022-09-18  4222  		success = false;
43d015dfbf4c2e Yu Zhao       2022-09-18  4223  		goto done;
43d015dfbf4c2e Yu Zhao       2022-09-18  4224  	}
43d015dfbf4c2e Yu Zhao       2022-09-18  4225  
43d015dfbf4c2e Yu Zhao       2022-09-18  4226  	/*
43d015dfbf4c2e Yu Zhao       2022-09-18  4227  	 * If the hardware doesn't automatically set the accessed bit, fallback
43d015dfbf4c2e Yu Zhao       2022-09-18  4228  	 * to lru_gen_look_around(), which only clears the accessed bit in a
43d015dfbf4c2e Yu Zhao       2022-09-18  4229  	 * handful of PTEs. Spreading the work out over a period of time usually
43d015dfbf4c2e Yu Zhao       2022-09-18  4230  	 * is less efficient, but it avoids bursty page faults.
43d015dfbf4c2e Yu Zhao       2022-09-18  4231  	 */
6579994789d90e Yu Zhao       2022-09-18  4232  	if (!force_scan && !(arch_has_hw_pte_young() && get_cap(LRU_GEN_MM_WALK))) {
1feb0f684d7748 David Stevens 2024-06-05  4233  		success = iterate_mm_list_nowalk(lruvec, scan_seq);
43d015dfbf4c2e Yu Zhao       2022-09-18  4234  		goto done;
43d015dfbf4c2e Yu Zhao       2022-09-18  4235  	}
43d015dfbf4c2e Yu Zhao       2022-09-18  4236  
784bac21e098dd Yu Zhao       2022-12-21  4237  	walk = set_mm_walk(NULL, true);
43d015dfbf4c2e Yu Zhao       2022-09-18 @4238  	if (!walk) {
1feb0f684d7748 David Stevens 2024-06-05  4239  		success = iterate_mm_list_nowalk(lruvec, scan_seq);
43d015dfbf4c2e Yu Zhao       2022-09-18  4240  		goto done;
43d015dfbf4c2e Yu Zhao       2022-09-18  4241  	}
43d015dfbf4c2e Yu Zhao       2022-09-18  4242  
43d015dfbf4c2e Yu Zhao       2022-09-18  4243  	walk->lruvec = lruvec;
43d015dfbf4c2e Yu Zhao       2022-09-18  4244  	walk->max_seq = max_seq;
1feb0f684d7748 David Stevens 2024-06-05  4245  	walk->scan_seq = scan_seq;
43d015dfbf4c2e Yu Zhao       2022-09-18  4246  	walk->can_swap = can_swap;
6579994789d90e Yu Zhao       2022-09-18  4247  	walk->force_scan = force_scan;
43d015dfbf4c2e Yu Zhao       2022-09-18  4248  
43d015dfbf4c2e Yu Zhao       2022-09-18  4249  	do {
43d015dfbf4c2e Yu Zhao       2022-09-18  4250  		success = iterate_mm_list(lruvec, walk, &mm);
43d015dfbf4c2e Yu Zhao       2022-09-18  4251  		if (mm)
43d015dfbf4c2e Yu Zhao       2022-09-18  4252  			walk_mm(lruvec, mm, walk);
43d015dfbf4c2e Yu Zhao       2022-09-18  4253  	} while (mm);
43d015dfbf4c2e Yu Zhao       2022-09-18  4254  done:
3fca93bfccc1c3 Kalesh Singh  2023-04-13  4255  	if (success) {
6579994789d90e Yu Zhao       2022-09-18  4256  		inc_max_seq(lruvec, can_swap, force_scan);
1feb0f684d7748 David Stevens 2024-06-05  4257  
1feb0f684d7748 David Stevens 2024-06-05  4258  		VM_WARN_ON_ONCE(lruvec->mm_state.scan_seq != SCAN_ITER_FINISHING);
1feb0f684d7748 David Stevens 2024-06-05 @4259  		WRITE_ONCE(lruvec->mm_state.scan_seq, walk->scan_seq + 1);
1feb0f684d7748 David Stevens 2024-06-05  4260  
ba7bdcf40461dd Koki Ryu      2022-12-22  4261  		kernfs_notify(lru_gen_admin_node);
3fca93bfccc1c3 Kalesh Singh  2023-04-13  4262  	}
43d015dfbf4c2e Yu Zhao       2022-09-18  4263  
3fca93bfccc1c3 Kalesh Singh  2023-04-13  4264  	return success;
43d015dfbf4c2e Yu Zhao       2022-09-18  4265  }
43d015dfbf4c2e Yu Zhao       2022-09-18  4266  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
