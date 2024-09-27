Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508DA1C1756
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Sep 2024 17:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727457579; cv=none; b=cIR03lbZHg/4iDVAfkLLwXbLaIdZ0Gdnz9to6TBdVEXBN2bGWn22xSxF6oRkyiPs6myohrqvN07EcxEjr1jWsqr3OuluHezJHo86dMyB44HtVw7vYu74XNyQ7QT11Z7WSRq91Xn9emD24d9bZc/H0/GDQdnp2HQRsRwbyrIW5Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727457579; c=relaxed/simple;
	bh=2wQAeTVi/kwd9adgRCsvM/3lYr4AuiLi6NzjmzzdWzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eSF73qXBvEmqwhWMREckJCL8z8xEBSugDyUSaohTLgUkK+ic2QklppUnKiM63iEDKHd8h8DcPyiDaT/wZpeR8Zvy1Yo+OHZyWgdPdTuskamTtjWiN2T73NFIzJlUlNrP7ivGeze6DI43KCXl/k7KY2pLsdp6ijRocvmWVe8MqXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EB9UgX4X; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EB9UgX4X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727457577; x=1758993577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2wQAeTVi/kwd9adgRCsvM/3lYr4AuiLi6NzjmzzdWzM=;
  b=EB9UgX4XC+GObBsDCMfRDG/VJP9my2C57NtmhkF4iBSJWS7l6OEaZ7Qh
   Is0M1VhH+rI0samc4G4cM8FI0jK01Laiu64gWPIwox7FHoXclVF+mJoLD
   p6pee7d6KnLlRVe72S+yHSra5zonSaOsiG70L/eJuS5KX5n3Dx5H+14gw
   UEFL4JC+BoQv60YuiLpaWKX0UAXy6PSrw66P4CK36dUuf7k0jEexwD3yp
   xMrYLjH8X9jLo3AlrqmAbRMx+n9TbLRyn1LVbVvWBg8UKcO8ghm73ASp7
   7xs7Zzm9qF+m8lneHvT5FBQVnsq5lEKYVn03to91x77AL3nkzOd118Nza
   A==;
X-CSE-ConnectionGUID: Tnqu5gr6RSi0V2OCGUq4hQ==
X-CSE-MsgGUID: eiFz5fepSu+NDU27WvRgCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26076297"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="26076297"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 10:19:37 -0700
X-CSE-ConnectionGUID: q5u/Bj86SJaYjrhCX69YOw==
X-CSE-MsgGUID: mdZ20vJfQcG+BKoABaODfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="77429807"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Sep 2024 10:19:35 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suEcu-000MQV-2l;
	Fri, 27 Sep 2024 17:19:32 +0000
Date: Sat, 28 Sep 2024 01:19:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/kasan/report_tags.c:63 kasan_complete_mode_report_info() error:
 we previously assumed 'info->cache' could be null (see line 37)
Message-ID: <202409280119.7gzM9E4h-lkp@intel.com>
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
head:   075dbe9f6e3c21596c5245826a4ee1f1c1676eb8
commit: 7d88e4f768b0fdb85b68f0e4679bb10fdb05c808 kasan: check object_size in kasan_complete_mode_report_info
date:   10 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-r071-20240923 (https://download.01.org/0day-ci/archive/20240928/202409280119.7gzM9E4h-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 8663a75fa2f31299ab8d1d90288d9df92aadee88)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409280119.7gzM9E4h-lkp@intel.com/

smatch warnings:
mm/kasan/report_tags.c:63 kasan_complete_mode_report_info() error: we previously assumed 'info->cache' could be null (see line 37)

vim +63 mm/kasan/report_tags.c

b89933e9a54d3e Andrey Konovalov 2022-09-05  29  
59e6e098d1c156 Andrey Konovalov 2022-09-05  30  void kasan_complete_mode_report_info(struct kasan_report_info *info)
b89933e9a54d3e Andrey Konovalov 2022-09-05  31  {
7bc0584e5d2a68 Andrey Konovalov 2022-09-05  32  	unsigned long flags;
7bc0584e5d2a68 Andrey Konovalov 2022-09-05  33  	u64 pos;
7bc0584e5d2a68 Andrey Konovalov 2022-09-05  34  	struct kasan_stack_ring_entry *entry;
7bc0584e5d2a68 Andrey Konovalov 2022-09-05  35  	bool alloc_found = false, free_found = false;
7bc0584e5d2a68 Andrey Konovalov 2022-09-05  36  
dcc579663f6073 Andrey Konovalov 2022-09-11 @37  	if ((!info->cache || !info->object) && !info->bug_type) {
1f538e1f2d294c Andrey Konovalov 2022-09-05  38  		info->bug_type = get_common_bug_type(info);
7bc0584e5d2a68 Andrey Konovalov 2022-09-05  39  		return;
7bc0584e5d2a68 Andrey Konovalov 2022-09-05  40  	}
7bc0584e5d2a68 Andrey Konovalov 2022-09-05  41  
7bc0584e5d2a68 Andrey Konovalov 2022-09-05  42  	write_lock_irqsave(&stack_ring.lock, flags);
7bc0584e5d2a68 Andrey Konovalov 2022-09-05  43  
7bc0584e5d2a68 Andrey Konovalov 2022-09-05  44  	pos = atomic64_read(&stack_ring.pos);
7bc0584e5d2a68 Andrey Konovalov 2022-09-05  45  
7bc0584e5d2a68 Andrey Konovalov 2022-09-05  46  	/*
7bc0584e5d2a68 Andrey Konovalov 2022-09-05  47  	 * The loop below tries to find stack ring entries relevant to the
7bc0584e5d2a68 Andrey Konovalov 2022-09-05  48  	 * buggy object. This is a best-effort process.
7bc0584e5d2a68 Andrey Konovalov 2022-09-05  49  	 *
7bc0584e5d2a68 Andrey Konovalov 2022-09-05  50  	 * First, another object with the same tag can be allocated in place of
7bc0584e5d2a68 Andrey Konovalov 2022-09-05  51  	 * the buggy object. Also, since the number of entries is limited, the
7bc0584e5d2a68 Andrey Konovalov 2022-09-05  52  	 * entries relevant to the buggy object can be overwritten.
7bc0584e5d2a68 Andrey Konovalov 2022-09-05  53  	 */
7bc0584e5d2a68 Andrey Konovalov 2022-09-05  54  
80b92bfe3bb75a Andrey Konovalov 2022-09-05  55  	for (u64 i = pos - 1; i != pos - 1 - stack_ring.size; i--) {
7bc0584e5d2a68 Andrey Konovalov 2022-09-05  56  		if (alloc_found && free_found)
7bc0584e5d2a68 Andrey Konovalov 2022-09-05  57  			break;
7bc0584e5d2a68 Andrey Konovalov 2022-09-05  58  
80b92bfe3bb75a Andrey Konovalov 2022-09-05  59  		entry = &stack_ring.entries[i % stack_ring.size];
7bc0584e5d2a68 Andrey Konovalov 2022-09-05  60  
f3b59798629940 Andrey Konovalov 2023-11-20  61  		if (kasan_reset_tag(entry->ptr) != info->object ||
7d88e4f768b0fd Andrey Konovalov 2023-11-20  62  		    get_tag(entry->ptr) != get_tag(info->access_addr) ||
7d88e4f768b0fd Andrey Konovalov 2023-11-20 @63  		    info->cache->object_size != entry->size)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
