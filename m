Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C38E8837
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Dec 2024 00:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733964234; cv=none; b=KY8TCUgW6QolpAjB0N4r9LerWyBlEZ2oGXM6GGAwMoBPYHycHI6AkDrjMBu8bDGO6q7CqrhBf8Sk3h/JPq7hkl6kA3UIfEG1KFkCazG0z9GsRpBEk55Ql5vAX1XlQFpgrd8CapEJStPwWsT85qCGTstT849ecUXkbShrJeQG2x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733964234; c=relaxed/simple;
	bh=OiFDxNvt4Ct0VXh8GMpHH4/Pdh+TbWweecw+Kzkp/Ok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nRIWd0qcrg/zOueCjHHbV6KkLaufF8RPsVaQ/18Z8r254ebjIFTZu6F2a7k/giVZx+31ZDb5SeHWkZTxZ50nktFvBwl0XZZLkaZ5VbUIGWVbI8QSeaK4doIxgTqKhrnC2/CpzvN/ZOz75ftbgkyVrVkeu4wLBJlx6O2gFO0qzIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jKDMEnxJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jKDMEnxJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733964232; x=1765500232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OiFDxNvt4Ct0VXh8GMpHH4/Pdh+TbWweecw+Kzkp/Ok=;
  b=jKDMEnxJyNubCDAbmg/AIyojnEhU9bkCmKQmVMy7T2b7NXcowWomeMK6
   nahr5OCLVf5+NWWOf9y/0hGRB2Z7legQ8a1gbs7trxxc+apaVj9p2R0ne
   4dFMRZytfOWZKlh3r+wSnz5Vrksv2Zq16AL8qcVjg6apG42S0yGfhl8D0
   ms0hrN/NjAOz9zfwCBBsPnPvfJ+z4j2wIoTPvIkuubxpENyjFTmv2IKeG
   u5hiutASULtPnrRAu/qzSESKcOwMBdwVA858v3vMHF0o4HhQNWppVGo+r
   Bw3OajNhbxlhHyAMwHypetdxZE9BwXFnxpb4OfPPFnBpaP5M443iNUxiJ
   w==;
X-CSE-ConnectionGUID: t5AHXsAFRm6mlj7Wh2b5KA==
X-CSE-MsgGUID: W9jeXKPSTHCwO2EQ/E97hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34495334"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="34495334"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 16:43:52 -0800
X-CSE-ConnectionGUID: 3CgkXH1lSeywQ2MnDkX7AQ==
X-CSE-MsgGUID: viRD9bjNQHWot1lZnQ3NNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="101048725"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Dec 2024 16:43:50 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLXIy-0007GK-0b;
	Thu, 12 Dec 2024 00:43:48 +0000
Date: Thu, 12 Dec 2024 08:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/kasan/report_tags.c:63 kasan_complete_mode_report_info() error:
 we previously assumed 'info->cache' could be null (see line 37)
Message-ID: <202412120809.Tiq6Vag9-lkp@intel.com>
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
TO: Andrey Konovalov <andreyknvl@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Alexander Potapenko <glider@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f92f4749861b06fed908d336b4dee1326003291b
commit: 7d88e4f768b0fdb85b68f0e4679bb10fdb05c808 kasan: check object_size in kasan_complete_mode_report_info
date:   1 year ago
:::::: branch date: 22 hours ago
:::::: commit date: 1 year ago
config: arm64-randconfig-r072-20241210 (https://download.01.org/0day-ci/archive/20241212/202412120809.Tiq6Vag9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412120809.Tiq6Vag9-lkp@intel.com/

smatch warnings:
mm/kasan/report_tags.c:63 kasan_complete_mode_report_info() error: we previously assumed 'info->cache' could be null (see line 37)

vim +63 mm/kasan/report_tags.c

b89933e9a54d3e7 Andrey Konovalov 2022-09-05  29  
59e6e098d1c156f Andrey Konovalov 2022-09-05  30  void kasan_complete_mode_report_info(struct kasan_report_info *info)
b89933e9a54d3e7 Andrey Konovalov 2022-09-05  31  {
7bc0584e5d2a687 Andrey Konovalov 2022-09-05  32  	unsigned long flags;
7bc0584e5d2a687 Andrey Konovalov 2022-09-05  33  	u64 pos;
7bc0584e5d2a687 Andrey Konovalov 2022-09-05  34  	struct kasan_stack_ring_entry *entry;
7bc0584e5d2a687 Andrey Konovalov 2022-09-05  35  	bool alloc_found = false, free_found = false;
7bc0584e5d2a687 Andrey Konovalov 2022-09-05  36  
dcc579663f60739 Andrey Konovalov 2022-09-11 @37  	if ((!info->cache || !info->object) && !info->bug_type) {
1f538e1f2d294cf Andrey Konovalov 2022-09-05  38  		info->bug_type = get_common_bug_type(info);
7bc0584e5d2a687 Andrey Konovalov 2022-09-05  39  		return;
7bc0584e5d2a687 Andrey Konovalov 2022-09-05  40  	}
7bc0584e5d2a687 Andrey Konovalov 2022-09-05  41  
7bc0584e5d2a687 Andrey Konovalov 2022-09-05  42  	write_lock_irqsave(&stack_ring.lock, flags);
7bc0584e5d2a687 Andrey Konovalov 2022-09-05  43  
7bc0584e5d2a687 Andrey Konovalov 2022-09-05  44  	pos = atomic64_read(&stack_ring.pos);
7bc0584e5d2a687 Andrey Konovalov 2022-09-05  45  
7bc0584e5d2a687 Andrey Konovalov 2022-09-05  46  	/*
7bc0584e5d2a687 Andrey Konovalov 2022-09-05  47  	 * The loop below tries to find stack ring entries relevant to the
7bc0584e5d2a687 Andrey Konovalov 2022-09-05  48  	 * buggy object. This is a best-effort process.
7bc0584e5d2a687 Andrey Konovalov 2022-09-05  49  	 *
7bc0584e5d2a687 Andrey Konovalov 2022-09-05  50  	 * First, another object with the same tag can be allocated in place of
7bc0584e5d2a687 Andrey Konovalov 2022-09-05  51  	 * the buggy object. Also, since the number of entries is limited, the
7bc0584e5d2a687 Andrey Konovalov 2022-09-05  52  	 * entries relevant to the buggy object can be overwritten.
7bc0584e5d2a687 Andrey Konovalov 2022-09-05  53  	 */
7bc0584e5d2a687 Andrey Konovalov 2022-09-05  54  
80b92bfe3bb75aa Andrey Konovalov 2022-09-05  55  	for (u64 i = pos - 1; i != pos - 1 - stack_ring.size; i--) {
7bc0584e5d2a687 Andrey Konovalov 2022-09-05  56  		if (alloc_found && free_found)
7bc0584e5d2a687 Andrey Konovalov 2022-09-05  57  			break;
7bc0584e5d2a687 Andrey Konovalov 2022-09-05  58  
80b92bfe3bb75aa Andrey Konovalov 2022-09-05  59  		entry = &stack_ring.entries[i % stack_ring.size];
7bc0584e5d2a687 Andrey Konovalov 2022-09-05  60  
f3b597986299408 Andrey Konovalov 2023-11-20  61  		if (kasan_reset_tag(entry->ptr) != info->object ||
7d88e4f768b0fdb Andrey Konovalov 2023-11-20  62  		    get_tag(entry->ptr) != get_tag(info->access_addr) ||
7d88e4f768b0fdb Andrey Konovalov 2023-11-20 @63  		    info->cache->object_size != entry->size)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
