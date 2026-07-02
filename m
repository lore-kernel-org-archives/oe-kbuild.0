Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2A43382FC
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 23:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783034370; cv=none; b=eGtCxbRwcCB2GqDwR7pHD0715BMU8TBBJOe5XPLcYF1A/883enbbE0zkuhsruKBRy4uakGyOVwhf14udoJjI43M5Mv55SSDvAfXPAmd+mtmiAREyHJW9nybkg+o/gYaDWClDB902sQyWMH9uVQGXu5FB+4q9oLU1+OKnPA8rt7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783034370; c=relaxed/simple;
	bh=Bj5HCUAVpWYNvtAZgzuciOLNDLvFcuY8SydARQDmCq8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UhN+pFvy2ZFc2aXGUmVgPX6t2MMkjSJQrMhkEqzSpsaPp3po12DqA4etzW0MYtL1eGChCPzqHG2d38Cbguhc2dxfzIBBSBvwkzpEeiDPrMkXSHGK8lhJ1uFHDUt9cEeiKEH8vZKZbFq3srhvV0MP8Nv9eAeIKHPqA+/jvzMGD+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mzOpmNTo; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mzOpmNTo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783034366; x=1814570366;
  h=date:from:to:cc:subject:message-id;
  bh=Bj5HCUAVpWYNvtAZgzuciOLNDLvFcuY8SydARQDmCq8=;
  b=mzOpmNTomSTKheEBhb8CqyMtnfSAQplD/CtF4kI2R9h0jC6Ff6ouFPNg
   3XbhT4RTveuZU5SOGJpRfvID7EzPfAQ5+M95rlYtYd2h8PlAgHlWAlGhh
   tqLzimdMk7Z3TZ1Z70HF1stcZzExPiGJTLM6UMw31Wz3aACvhiUDKD8+a
   KlfsWTlxHeEUfCGBHVAaWDwpz3PhtNQB7KdSVDyOPhS3dSXhKxECDafSc
   tt27OhNHRUqe0AfbKNZDNe0bACaEOTnOobe8biYYld1pz3a/2IbbVidrd
   mGSwclOOLnS6MldcewujDM9YVYwhyyG9YoSZukfe3achpJkDmkPPNaIXS
   A==;
X-CSE-ConnectionGUID: t/HxvHLsSSCc+4x0ap1YFQ==
X-CSE-MsgGUID: eBtgzf8eTliM36bZZ/AKRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83821826"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="83821826"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 16:19:25 -0700
X-CSE-ConnectionGUID: SRbfPJo3T5SuTnKYUyVN4w==
X-CSE-MsgGUID: TiJZpX38QjKEMzTz/5UvLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="251242753"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 02 Jul 2026 16:19:24 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfQgj-00000000BPP-41Sm;
	Thu, 02 Jul 2026 23:19:21 +0000
Date: Fri, 03 Jul 2026 07:18:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/tests/liveupdate.c:130 liveupdate_test_register() warn:
 passing zero to 'ERR_PTR'
Message-ID: <202607030701.UujNlooD-lkp@intel.com>
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
head:   87320be9f0d24fce67631b7eef919f0b79c3e45c
commit: f653ff7af96951faa69c68665d44bed80702544f tests/liveupdate: add in-kernel liveupdate test
date:   5 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-161-20260703 (https://download.01.org/0day-ci/archive/20260703/202607030701.UujNlooD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f653ff7af969 ("tests/liveupdate: add in-kernel liveupdate test")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607030701.UujNlooD-lkp@intel.com/

smatch warnings:
lib/tests/liveupdate.c:130 liveupdate_test_register() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +130 lib/tests/liveupdate.c

f653ff7af96951 Pasha Tatashin 2025-12-18  111  
f653ff7af96951 Pasha Tatashin 2025-12-18  112  void liveupdate_test_register(struct liveupdate_file_handler *fh)
f653ff7af96951 Pasha Tatashin 2025-12-18  113  {
f653ff7af96951 Pasha Tatashin 2025-12-18  114  	int err, i;
f653ff7af96951 Pasha Tatashin 2025-12-18  115  
f653ff7af96951 Pasha Tatashin 2025-12-18  116  	liveupdate_test_init();
f653ff7af96951 Pasha Tatashin 2025-12-18  117  
f653ff7af96951 Pasha Tatashin 2025-12-18  118  	for (i = 0; i < TEST_NFLBS; i++) {
f653ff7af96951 Pasha Tatashin 2025-12-18  119  		struct liveupdate_flb *flb = &test_flbs[i];
f653ff7af96951 Pasha Tatashin 2025-12-18  120  
f653ff7af96951 Pasha Tatashin 2025-12-18  121  		err = liveupdate_register_flb(fh, flb);
f653ff7af96951 Pasha Tatashin 2025-12-18  122  		if (err) {
f653ff7af96951 Pasha Tatashin 2025-12-18  123  			pr_err("Failed to register %s %pe\n",
f653ff7af96951 Pasha Tatashin 2025-12-18  124  			       flb->compatible, ERR_PTR(err));
f653ff7af96951 Pasha Tatashin 2025-12-18  125  		}
f653ff7af96951 Pasha Tatashin 2025-12-18  126  	}
f653ff7af96951 Pasha Tatashin 2025-12-18  127  
f653ff7af96951 Pasha Tatashin 2025-12-18  128  	err = liveupdate_register_flb(fh, &test_flbs[0]);
f653ff7af96951 Pasha Tatashin 2025-12-18  129  	if (!err || err != -EEXIST) {
f653ff7af96951 Pasha Tatashin 2025-12-18 @130  		pr_err("Failed: %s should be already registered, but got err: %pe\n",
f653ff7af96951 Pasha Tatashin 2025-12-18  131  		       test_flbs[0].compatible, ERR_PTR(err));
f653ff7af96951 Pasha Tatashin 2025-12-18  132  	}
f653ff7af96951 Pasha Tatashin 2025-12-18  133  
f653ff7af96951 Pasha Tatashin 2025-12-18  134  	pr_info("Registered %d FLBs with file handler: [%s]\n",
f653ff7af96951 Pasha Tatashin 2025-12-18  135  		TEST_NFLBS, fh->compatible);
f653ff7af96951 Pasha Tatashin 2025-12-18  136  }
f653ff7af96951 Pasha Tatashin 2025-12-18  137  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
