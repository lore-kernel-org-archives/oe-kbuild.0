Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996401AA7A6
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Mar 2026 01:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773709252; cv=none; b=uRrSXgoG2DF329B35W1MbpIp1dvPaoduN7x/qV9FtokDHNiGEg5FHNTgqFCeXIplAvVb9Nw6S+/jRI/s96RIpEjuU/fTL3RRqxo9xOWPLD2XmQ/oN7grWasGVTjmjczNun0ld7GcCKdS8GLUyqMhYYo2Pmuck4VzRaX29D89iCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773709252; c=relaxed/simple;
	bh=1/UxokAK6NAUVoYPP/S1enXKowJwaSex8fSxl16kEio=;
	h=Date:From:To:Cc:Subject:Message-ID; b=stOM7O7ZRhmuXMW/P1Blc9ClfvgKVz5Wj3TQ5EridBuhqzekV+nufF7XaKIt5RPjLcecNhc7dA42SGOOshiQ3eUdgNkjt1A+NBSmgb/Jq2siiXi+UozlpGNvqmz6wZY2uUIm8iJTYghz+WX/lqgBo2+PoxjSgsTYBHv0cOupL9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DfkGv+Tc; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DfkGv+Tc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773709250; x=1805245250;
  h=date:from:to:cc:subject:message-id;
  bh=1/UxokAK6NAUVoYPP/S1enXKowJwaSex8fSxl16kEio=;
  b=DfkGv+TcrhGAPvTsbr0xL8vUR/JY5/Px3afEDNX56iFmPoNhHOpTa6Zt
   ehhmMVz88sSMbq4m/ih3C7k5JjU+XmHtdo/v5cP0UHJ6euT1mCLMR5gGg
   6TUfXYLmIl11Xw4Nef1aMgJhaSDuwLJ+QanEovcF+W/2V3pKNcVjRHkeC
   lcUNrkDTtwy+usWF25rC+fYg5EyBZH0dB357TU/7nQ43Ql1Y5ddcjRpK/
   J1roxEmaku6VP66QPznKR7k514Q22KRgeyMZCja7eExKSOQlrKXnmVT6M
   upQvYZWiEdkXEJEo7I+W7WpDGJqVNqZmHeegL3I79lRvcwTEgZRlo1/WD
   Q==;
X-CSE-ConnectionGUID: SC4DoS7iTTukNkd8iIlc/Q==
X-CSE-MsgGUID: aGxwb6IfSuexPz3/MUZ9aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="86091054"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="86091054"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 18:00:49 -0700
X-CSE-ConnectionGUID: R0xmD/k2SXWixyFaUlsTjA==
X-CSE-MsgGUID: eBWWDEUYQh60/kcKkFub1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="222305465"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Mar 2026 18:00:48 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2Ind-000000001Zm-2uTB;
	Tue, 17 Mar 2026 01:00:45 +0000
Date: Tue, 17 Mar 2026 09:00:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/tests/liveupdate.c:130 liveupdate_test_register() warn:
 passing zero to 'ERR_PTR'
Message-ID: <202603170803.OkJuT0LU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Pasha Tatashin <pasha.tatashin@soleen.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2d1373e4246da3b58e1df058374ed6b101804e07
commit: f653ff7af96951faa69c68665d44bed80702544f tests/liveupdate: add in-kernel liveupdate test
date:   5 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-161-20260317 (https://download.01.org/0day-ci/archive/20260317/202603170803.OkJuT0LU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603170803.OkJuT0LU-lkp@intel.com/

smatch warnings:
lib/tests/liveupdate.c:130 liveupdate_test_register() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +130 lib/tests/liveupdate.c

f653ff7af96951f Pasha Tatashin 2025-12-18  111  
f653ff7af96951f Pasha Tatashin 2025-12-18  112  void liveupdate_test_register(struct liveupdate_file_handler *fh)
f653ff7af96951f Pasha Tatashin 2025-12-18  113  {
f653ff7af96951f Pasha Tatashin 2025-12-18  114  	int err, i;
f653ff7af96951f Pasha Tatashin 2025-12-18  115  
f653ff7af96951f Pasha Tatashin 2025-12-18  116  	liveupdate_test_init();
f653ff7af96951f Pasha Tatashin 2025-12-18  117  
f653ff7af96951f Pasha Tatashin 2025-12-18  118  	for (i = 0; i < TEST_NFLBS; i++) {
f653ff7af96951f Pasha Tatashin 2025-12-18  119  		struct liveupdate_flb *flb = &test_flbs[i];
f653ff7af96951f Pasha Tatashin 2025-12-18  120  
f653ff7af96951f Pasha Tatashin 2025-12-18  121  		err = liveupdate_register_flb(fh, flb);
f653ff7af96951f Pasha Tatashin 2025-12-18  122  		if (err) {
f653ff7af96951f Pasha Tatashin 2025-12-18  123  			pr_err("Failed to register %s %pe\n",
f653ff7af96951f Pasha Tatashin 2025-12-18  124  			       flb->compatible, ERR_PTR(err));
f653ff7af96951f Pasha Tatashin 2025-12-18  125  		}
f653ff7af96951f Pasha Tatashin 2025-12-18  126  	}
f653ff7af96951f Pasha Tatashin 2025-12-18  127  
f653ff7af96951f Pasha Tatashin 2025-12-18  128  	err = liveupdate_register_flb(fh, &test_flbs[0]);
f653ff7af96951f Pasha Tatashin 2025-12-18  129  	if (!err || err != -EEXIST) {
f653ff7af96951f Pasha Tatashin 2025-12-18 @130  		pr_err("Failed: %s should be already registered, but got err: %pe\n",
f653ff7af96951f Pasha Tatashin 2025-12-18  131  		       test_flbs[0].compatible, ERR_PTR(err));
f653ff7af96951f Pasha Tatashin 2025-12-18  132  	}
f653ff7af96951f Pasha Tatashin 2025-12-18  133  
f653ff7af96951f Pasha Tatashin 2025-12-18  134  	pr_info("Registered %d FLBs with file handler: [%s]\n",
f653ff7af96951f Pasha Tatashin 2025-12-18  135  		TEST_NFLBS, fh->compatible);
f653ff7af96951f Pasha Tatashin 2025-12-18  136  }
f653ff7af96951f Pasha Tatashin 2025-12-18  137  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
