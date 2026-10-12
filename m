Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B073BFAFA
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Oct 2026 11:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791804335; cv=none; b=RH/wvoQmMFjxd7jFngCLcM5pBvpHvTER/xjeQT6EJEy4wm8+nuG5x5H0H1akx8QgnEz7UqfDyteRibu+rGYR0wqByIZbn3ttRC9uAF0zlb3cwFungoU3Z9cIP825aJu+aWdK/9EtolFOcWerDdDaezr+hlFtSjFnXcmMF8nXnFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791804335; c=relaxed/simple;
	bh=VgI5J2Mr9v9Cb+mKmBij2+0BY/3Y6HlIqE+tFu6L+o0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A6PF5KYJ4Aq7SjAZnqmNR491QDaZ/HnoYo3zXmZxjh/9ZyYNOx4a+D7wzm15GqknaN9wI72qd4VAbxGPOZsA6Ju27DDSlY8rR/PtEnnbeswyD095rjqktSNQl1vIO795ToBsS1bBSbkBEMvcT85rftqKg8vot93nAUvNDnYlC4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/mDgPdA; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/mDgPdA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791804334; x=1823340334;
  h=date:from:to:cc:subject:message-id;
  bh=VgI5J2Mr9v9Cb+mKmBij2+0BY/3Y6HlIqE+tFu6L+o0=;
  b=S/mDgPdA8JfCqj/560eowAGadnwtzmuDzIrVkBsrpTqSJg6wY590D4r4
   qkvEIuJfPpbW2VVnA2czdkLGmHaAFsT2PN9JO12/c0HEBDOXRnVHXVWKq
   GXb3bJlU5SFPZHabhmjlfqs/Wd/9796QncHqzg++Q+yscWzL106iK1+Du
   bRZU3ofNlHUGDeZdYBpBbTkpz/xm7MlsKftl1K8hG09N6bgsqz9wqkG6f
   fCvBm7hiW50Ls/LFRQUgRJToYl28REX6KYNsvQSGK3vwLzfAD3Nh6i5e4
   AAxSW7SsJv+IFhg/CFz+eiUhlIUuohQPz03Q4armpBvPH5wiUIrkzvOy6
   g==;
X-CSE-ConnectionGUID: 5Q00OJbJQiaOWGOeCB0rIA==
X-CSE-MsgGUID: VevdYltzQouwDvOboxxsTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="501120"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="501120"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 04:25:34 -0700
X-CSE-ConnectionGUID: 5LJHVk1JTQSNmXTEnOWfvA==
X-CSE-MsgGUID: WcNglM3zS5i5ov+f+X1t6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="848599"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 12 Oct 2026 04:25:33 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGE9q-00000000A0V-1Eaa;
	Mon, 12 Oct 2026 11:25:30 +0000
Date: Mon, 12 Oct 2026 13:24:58 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [snitzer:kernel-7.3/snitzer-nfs-fixes-canary 6048/7360]
 kernel/rh_waived.c:77 rh_waived_parser() warn: we never enter this loop
Message-ID: <202610121350.ijNUs4az-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ricardo Robaina <rrobaina@redhat.com>
CC: "Justin M. Forbes" <jforbes@fedoraproject.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git kernel-7.3/snitzer-nfs-fixes-canary
head:   b9072da39a2d18ccf13258af55b6f6fe3c14d737
commit: c49fa66a4dcc9b00c08e5a0d75ccf36244cb00a4 [6048/7360] kernel: extend rh_waived to cope better with the CVE mitigations case
:::::: branch date: 7 hours ago
:::::: commit date: 8 weeks ago
config: hexagon-randconfig-r2201-20261012 (https://download.01.org/0day-ci/archive/20261012/202610121350.ijNUs4az-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ce2a4984a3f43327a2b7c40baa74907bc10eb899)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610121350.ijNUs4az-lkp@intel.com/

smatch warnings:
kernel/rh_waived.c:77 rh_waived_parser() warn: we never enter this loop

vim +77 kernel/rh_waived.c

1f06b4b22f09a2 Ricardo Robaina 2024-05-22   68  
c49fa66a4dcc9b Ricardo Robaina 2025-10-23   69  static void __init rh_waived_parser(char *s, rh_waived_t type)
1f06b4b22f09a2 Ricardo Robaina 2024-05-22   70  {
1f06b4b22f09a2 Ricardo Robaina 2024-05-22   71  	int i;
1f06b4b22f09a2 Ricardo Robaina 2024-05-22   72  	char *token;
1f06b4b22f09a2 Ricardo Robaina 2024-05-22   73  
1f06b4b22f09a2 Ricardo Robaina 2024-05-22   74  	pr_info(KERN_CONT "rh_waived: ");
1f06b4b22f09a2 Ricardo Robaina 2024-05-22   75  
1f06b4b22f09a2 Ricardo Robaina 2024-05-22   76  	if (!s) {
c49fa66a4dcc9b Ricardo Robaina 2025-10-23  @77  		for (i = 0; i < RH_WAIVED_ITEMS; i++) {
c49fa66a4dcc9b Ricardo Robaina 2025-10-23   78  			if (type != RH_WAIVED_ANY && rh_waived_list[i].type != type)
c49fa66a4dcc9b Ricardo Robaina 2025-10-23   79  				continue;
c49fa66a4dcc9b Ricardo Robaina 2025-10-23   80  
c49fa66a4dcc9b Ricardo Robaina 2025-10-23   81  			rh_waived_list[i].waived = 1;
c49fa66a4dcc9b Ricardo Robaina 2025-10-23   82  			pr_info(KERN_CONT "%s%s", rh_waived_list[i].name,
c49fa66a4dcc9b Ricardo Robaina 2025-10-23   83  				i < RH_WAIVED_ITEMS - 1 ? " " : "\n");
1f06b4b22f09a2 Ricardo Robaina 2024-05-22   84  		}
c49fa66a4dcc9b Ricardo Robaina 2025-10-23   85  
c49fa66a4dcc9b Ricardo Robaina 2025-10-23   86  		add_rh_flag = true;
c49fa66a4dcc9b Ricardo Robaina 2025-10-23   87  		return;
1f06b4b22f09a2 Ricardo Robaina 2024-05-22   88  	}
1f06b4b22f09a2 Ricardo Robaina 2024-05-22   89  
1f06b4b22f09a2 Ricardo Robaina 2024-05-22   90  	while ((token = strsep(&s, ",")) != NULL) {
c49fa66a4dcc9b Ricardo Robaina 2025-10-23   91  		for (i = 0; i < RH_WAIVED_ITEMS; i++) {
c49fa66a4dcc9b Ricardo Robaina 2025-10-23   92  			char *alias = rh_waived_list[i].alias;
c49fa66a4dcc9b Ricardo Robaina 2025-10-23   93  
c49fa66a4dcc9b Ricardo Robaina 2025-10-23   94  			if (type != RH_WAIVED_ANY && rh_waived_list[i].type != type)
c49fa66a4dcc9b Ricardo Robaina 2025-10-23   95  				continue;
c49fa66a4dcc9b Ricardo Robaina 2025-10-23   96  
c49fa66a4dcc9b Ricardo Robaina 2025-10-23   97  			if (!strcmp(token, rh_waived_list[i].name) ||
c49fa66a4dcc9b Ricardo Robaina 2025-10-23   98  			    (alias && !strcmp(token, alias))) {
c49fa66a4dcc9b Ricardo Robaina 2025-10-23   99  				rh_waived_list[i].waived = 1;
c49fa66a4dcc9b Ricardo Robaina 2025-10-23  100  				pr_info(KERN_CONT "%s ", rh_waived_list[i].name);
1f06b4b22f09a2 Ricardo Robaina 2024-05-22  101  			}
1f06b4b22f09a2 Ricardo Robaina 2024-05-22  102  		}
1f06b4b22f09a2 Ricardo Robaina 2024-05-22  103  	}
1f06b4b22f09a2 Ricardo Robaina 2024-05-22  104  
c49fa66a4dcc9b Ricardo Robaina 2025-10-23  105  	pr_info(KERN_CONT "\n");
1f06b4b22f09a2 Ricardo Robaina 2024-05-22  106  	add_rh_flag = true;
c49fa66a4dcc9b Ricardo Robaina 2025-10-23  107  }
c49fa66a4dcc9b Ricardo Robaina 2025-10-23  108  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
