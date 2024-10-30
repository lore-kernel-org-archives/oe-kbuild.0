Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABCB1D0E30
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Oct 2024 12:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290572; cv=none; b=tCUL/UYKoVyecoZuAMxXAPPzKU8kxZSl4b1UXsDKzI6GsESA8FuZVlFtd/gIpvlZQrrqhOjnnwoLnIJm/KtKogq/PyrHq1yNrX5CUKs8FNQ8xeExy/JpgAP2ves73DgIfYCUnAfvBciR/ipE9v2oMYA9RKGV9pKv0GUjKxg71m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290572; c=relaxed/simple;
	bh=esR7yAam4jFMUGZgz7b9AqLIJQFX2Fz4MtJDNAJQrgs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rF/wuWm9p2Ozz80QqxYW5DP8Hab5DU2ivaYzW30WHurm4ZW7p6sQDLLrw/MnOO98A+nmbQpMuM99DepWZT9LR7BuuSdAV8FHMnf+xeWPXPjwh2QNF26zPrtkawj32tihCazuhxraKz+lqTckp0bj9ip4pC1eJUFEA3BpZMRzrSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G8ElflEA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G8ElflEA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730290570; x=1761826570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=esR7yAam4jFMUGZgz7b9AqLIJQFX2Fz4MtJDNAJQrgs=;
  b=G8ElflEA8Ksg3MTkfPZyco+5OuOHpijK54scDAKgsN3uvZ9cJw7nrCJ6
   N1kZMvd+coyDholvdmorNkQGsTPrihu12B3L94aXxA57TWZLboB2EcAx8
   PlSmigPsemvC/0F0JnZM/6H7cXVkDNjGfzjb+SSAWLOeQflRZuyPrDS3H
   ktIMs38zNCN31O9UqfbUjDpvS9dfv3ip4XtUKf/3GpPeEiMQvTtKeDiqr
   5lMeUJyihexGKpfaXYbNeLiHrfIS/dDqR+YoReHIgfFHZBpuogZ8a/Muj
   lRLmalGTrcmulIYpXFA0TcV3drKB2D/QG83Ibm1TyUzjsPh9PHqCmV+mk
   w==;
X-CSE-ConnectionGUID: DwGAEjLaRA+172FTHKzGOw==
X-CSE-MsgGUID: Cnz32vqjQYmOQc0Qo9+nQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29946901"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29946901"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 05:16:10 -0700
X-CSE-ConnectionGUID: idZgPeyFRHeFb/Uw9W6mAw==
X-CSE-MsgGUID: EBXmjxvwQmuYTFqw0ebclw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="87440588"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Oct 2024 05:16:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t67cM-000eok-0F;
	Wed, 30 Oct 2024 12:16:06 +0000
Date: Wed, 30 Oct 2024 20:15:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [peterz-queue:perf/core 21/21] kernel/events/uprobes.c:718
 hprobe_consume() error: uninitialized symbol 'state'.
Message-ID: <202410302020.1jHBLfss-lkp@intel.com>
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
TO: Andrii Nakryiko <andrii@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/core
head:   72a27524a4939fc0958796a46b51c1fab3729367
commit: 72a27524a4939fc0958796a46b51c1fab3729367 [21/21] uprobes: SRCU-protect uretprobe lifetime (with timeout)
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20241030 (https://download.01.org/0day-ci/archive/20241030/202410302020.1jHBLfss-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410302020.1jHBLfss-lkp@intel.com/

smatch warnings:
kernel/events/uprobes.c:718 hprobe_consume() error: uninitialized symbol 'state'.

vim +/state +718 kernel/events/uprobes.c

72a27524a4939f Andrii Nakryiko 2024-10-23  695  
72a27524a4939f Andrii Nakryiko 2024-10-23  696  /*
72a27524a4939f Andrii Nakryiko 2024-10-23  697   * hprobe_consume() fetches hprobe's underlying uprobe and detects whether
72a27524a4939f Andrii Nakryiko 2024-10-23  698   * uprobe is SRCU protected or is refcounted. hprobe_consume() can be
72a27524a4939f Andrii Nakryiko 2024-10-23  699   * used only once for a given hprobe.
72a27524a4939f Andrii Nakryiko 2024-10-23  700   *
72a27524a4939f Andrii Nakryiko 2024-10-23  701   * Caller has to call hprobe_finalize() and pass previous hprobe_state, so
72a27524a4939f Andrii Nakryiko 2024-10-23  702   * that hprobe_finalize() can perform SRCU unlock or put uprobe, whichever
72a27524a4939f Andrii Nakryiko 2024-10-23  703   * is appropriate.
72a27524a4939f Andrii Nakryiko 2024-10-23  704   */
72a27524a4939f Andrii Nakryiko 2024-10-23  705  static inline struct uprobe *hprobe_consume(struct hprobe *hprobe, enum hprobe_state *hstate)
72a27524a4939f Andrii Nakryiko 2024-10-23  706  {
72a27524a4939f Andrii Nakryiko 2024-10-23  707  	enum hprobe_state state;
72a27524a4939f Andrii Nakryiko 2024-10-23  708  
72a27524a4939f Andrii Nakryiko 2024-10-23  709  	*hstate = xchg(&hprobe->state, HPROBE_CONSUMED);
72a27524a4939f Andrii Nakryiko 2024-10-23  710  	switch (*hstate) {
72a27524a4939f Andrii Nakryiko 2024-10-23  711  	case HPROBE_LEASED:
72a27524a4939f Andrii Nakryiko 2024-10-23  712  	case HPROBE_STABLE:
72a27524a4939f Andrii Nakryiko 2024-10-23  713  		return hprobe->uprobe;
72a27524a4939f Andrii Nakryiko 2024-10-23  714  	case HPROBE_GONE:	/* uprobe is NULL, no SRCU */
72a27524a4939f Andrii Nakryiko 2024-10-23  715  	case HPROBE_CONSUMED:	/* uprobe was finalized already, do nothing */
72a27524a4939f Andrii Nakryiko 2024-10-23  716  		return NULL;
72a27524a4939f Andrii Nakryiko 2024-10-23  717  	default:
72a27524a4939f Andrii Nakryiko 2024-10-23 @718  		WARN(1, "hprobe invalid state %d", state);
72a27524a4939f Andrii Nakryiko 2024-10-23  719  		return NULL;
72a27524a4939f Andrii Nakryiko 2024-10-23  720  	}
72a27524a4939f Andrii Nakryiko 2024-10-23  721  }
72a27524a4939f Andrii Nakryiko 2024-10-23  722  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
