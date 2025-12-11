Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE67C38DEC
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 06:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765434105; cv=none; b=Yd4lST+vUHRpSYqF05VHy8ID6pnXFlof7M7jXnrXRaUtrVq+WCG16nUOcTn5Z3sQ/Ux3y2pZNICJBfd1+Anl9dgMz9JQwelIxI/cpmO4R/IuXEoW8u1VB0jmWPLH6xnS5CHDgnQ941Epm5XHighEQuZD+1TWAJwlBdPPsQiCXHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765434105; c=relaxed/simple;
	bh=4EwI9m7sSKHkS43aqdRsh/8j4O+EM7pyztNHb1n7yoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gtlo2BG0giBgRfFx67tGExzV9WXmpUmDrwqoC3sIjnMYL5foScGeoBobgNwvAVSVJZleg8u7X00h9WwF6EtTiQll5VE38HonSoIZa9EnUse7mxH6408Ct/v6Mf+X32TVSTyiQ2STxyzWwmjuLn8dbDjrouf6J90Joa6Dk0BioE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VKDkt+0T; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VKDkt+0T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765434104; x=1796970104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4EwI9m7sSKHkS43aqdRsh/8j4O+EM7pyztNHb1n7yoM=;
  b=VKDkt+0TuaSJmFXzP7iFLU/+7E32dVumIRH7OolWCfJwOAwWSoHgK+ok
   WEG6l+X87wb28dFZwQjjc33AJCVtYU9dpZ655c3xfqpCNvIbAalvplL1P
   ueeT5WqqTi+Dtp2NZyF7A6RBZhgLIX5oGCY/kADuIbbQSOPSPLKyByA2J
   uKl/ihI7mo09bPZddpv+3H70oF0QOa96rh7Ma6cp1vQZArew+5dSXxnSx
   VgzD7owU76CGNwTJr9ZpFIgG5XTB1dAb9g7VlVnUwie5osYCWa0VfhfA7
   LMgw4p9nQPqOtlL6Rs3N/ibnoxHvTxvnslXvtYWabSZttVA6RCJfy48/b
   A==;
X-CSE-ConnectionGUID: G7JSTsf/TcSgZO7Zx3/zBw==
X-CSE-MsgGUID: CoFn+xNJQHGQpdlqDPWicg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67461500"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67461500"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 22:21:43 -0800
X-CSE-ConnectionGUID: 5NRKBtswR/64GeddO9ZAnA==
X-CSE-MsgGUID: tbaclyuGTmyFTrOdsfoMGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="195981178"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Dec 2025 22:21:42 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTa3Y-000000004Hn-0Hmy;
	Thu, 11 Dec 2025 06:21:40 +0000
Date: Thu, 11 Dec 2025 14:21:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/irq/affinity.c:99 irq_create_affinity_masks() warn:
 potentially one past the end of array 'masks[i]'
Message-ID: <202512111453.rwC5VO8D-lkp@intel.com>
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
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 07438779313caafe52ac1a1a6958d735a5938988 alloc_tag: avoid current->alloc_tag manipulations when profiling is disabled
date:   11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111453.rwC5VO8D-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512111453.rwC5VO8D-lkp@intel.com/

smatch warnings:
kernel/irq/affinity.c:99 irq_create_affinity_masks() warn: potentially one past the end of array 'masks[i]'
kernel/irq/affinity.c:99 irq_create_affinity_masks() warn: potentially one past the end of array 'masks[i]'

vim +99 kernel/irq/affinity.c

c66d4bd110a1f8 Ming Lei          2019-02-16   17  
b3e6aaa8d94d61 Ming Lei          2018-03-08   18  /**
b3e6aaa8d94d61 Ming Lei          2018-03-08   19   * irq_create_affinity_masks - Create affinity masks for multiqueue spreading
b3e6aaa8d94d61 Ming Lei          2018-03-08   20   * @nvecs:	The total number of vectors
b3e6aaa8d94d61 Ming Lei          2018-03-08   21   * @affd:	Description of the affinity requirements
b3e6aaa8d94d61 Ming Lei          2018-03-08   22   *
bec04037e4e484 Dou Liyang        2018-12-04   23   * Returns the irq_affinity_desc pointer or NULL if allocation failed.
b3e6aaa8d94d61 Ming Lei          2018-03-08   24   */
bec04037e4e484 Dou Liyang        2018-12-04   25  struct irq_affinity_desc *
9cfef55bb57e76 Ming Lei          2019-02-16   26  irq_create_affinity_masks(unsigned int nvecs, struct irq_affinity *affd)
b3e6aaa8d94d61 Ming Lei          2018-03-08   27  {
c66d4bd110a1f8 Ming Lei          2019-02-16   28  	unsigned int affvecs, curvec, usedvecs, i;
bec04037e4e484 Dou Liyang        2018-12-04   29  	struct irq_affinity_desc *masks = NULL;
b3e6aaa8d94d61 Ming Lei          2018-03-08   30  
b3e6aaa8d94d61 Ming Lei          2018-03-08   31  	/*
c66d4bd110a1f8 Ming Lei          2019-02-16   32  	 * Determine the number of vectors which need interrupt affinities
c66d4bd110a1f8 Ming Lei          2019-02-16   33  	 * assigned. If the pre/post request exhausts the available vectors
c66d4bd110a1f8 Ming Lei          2019-02-16   34  	 * then nothing to do here except for invoking the calc_sets()
491beed3b102b6 Ming Lei          2019-08-05   35  	 * callback so the device driver can adjust to the situation.
b3e6aaa8d94d61 Ming Lei          2018-03-08   36  	 */
491beed3b102b6 Ming Lei          2019-08-05   37  	if (nvecs > affd->pre_vectors + affd->post_vectors)
c66d4bd110a1f8 Ming Lei          2019-02-16   38  		affvecs = nvecs - affd->pre_vectors - affd->post_vectors;
c66d4bd110a1f8 Ming Lei          2019-02-16   39  	else
c66d4bd110a1f8 Ming Lei          2019-02-16   40  		affvecs = 0;
c66d4bd110a1f8 Ming Lei          2019-02-16   41  
c66d4bd110a1f8 Ming Lei          2019-02-16   42  	/*
c66d4bd110a1f8 Ming Lei          2019-02-16   43  	 * Simple invocations do not provide a calc_sets() callback. Install
a6a309edba1386 Thomas Gleixner   2019-02-16   44  	 * the generic one.
c66d4bd110a1f8 Ming Lei          2019-02-16   45  	 */
a6a309edba1386 Thomas Gleixner   2019-02-16   46  	if (!affd->calc_sets)
c66d4bd110a1f8 Ming Lei          2019-02-16   47  		affd->calc_sets = default_calc_sets;
c66d4bd110a1f8 Ming Lei          2019-02-16   48  
a6a309edba1386 Thomas Gleixner   2019-02-16   49  	/* Recalculate the sets */
c66d4bd110a1f8 Ming Lei          2019-02-16   50  	affd->calc_sets(affd, affvecs);
b3e6aaa8d94d61 Ming Lei          2018-03-08   51  
9cfef55bb57e76 Ming Lei          2019-02-16   52  	if (WARN_ON_ONCE(affd->nr_sets > IRQ_AFFINITY_MAX_SETS))
9cfef55bb57e76 Ming Lei          2019-02-16   53  		return NULL;
9cfef55bb57e76 Ming Lei          2019-02-16   54  
c66d4bd110a1f8 Ming Lei          2019-02-16   55  	/* Nothing to assign? */
c66d4bd110a1f8 Ming Lei          2019-02-16   56  	if (!affvecs)
c66d4bd110a1f8 Ming Lei          2019-02-16   57  		return NULL;
c66d4bd110a1f8 Ming Lei          2019-02-16   58  
b3e6aaa8d94d61 Ming Lei          2018-03-08   59  	masks = kcalloc(nvecs, sizeof(*masks), GFP_KERNEL);
b3e6aaa8d94d61 Ming Lei          2018-03-08   60  	if (!masks)
347253c42d7c67 Ming Lei          2019-01-25   61  		return NULL;
b3e6aaa8d94d61 Ming Lei          2018-03-08   62  
b3e6aaa8d94d61 Ming Lei          2018-03-08   63  	/* Fill out vectors at the beginning that don't need affinity */
b3e6aaa8d94d61 Ming Lei          2018-03-08   64  	for (curvec = 0; curvec < affd->pre_vectors; curvec++)
bec04037e4e484 Dou Liyang        2018-12-04   65  		cpumask_copy(&masks[curvec].mask, irq_default_affinity);
c66d4bd110a1f8 Ming Lei          2019-02-16   66  
6da4b3ab9a6e9b Jens Axboe        2018-11-02   67  	/*
6da4b3ab9a6e9b Jens Axboe        2018-11-02   68  	 * Spread on present CPUs starting from affd->pre_vectors. If we
6da4b3ab9a6e9b Jens Axboe        2018-11-02   69  	 * have multiple sets, build each sets affinity mask separately.
6da4b3ab9a6e9b Jens Axboe        2018-11-02   70  	 */
c66d4bd110a1f8 Ming Lei          2019-02-16   71  	for (i = 0, usedvecs = 0; i < affd->nr_sets; i++) {
c66d4bd110a1f8 Ming Lei          2019-02-16   72  		unsigned int this_vecs = affd->set_size[i];
e7bdd7f0cbd1c0 Ming Lei          2022-12-27   73  		int j;
523f1ea76aad90 Ming Lei          2022-12-27   74  		struct cpumask *result = group_cpus_evenly(this_vecs);
6da4b3ab9a6e9b Jens Axboe        2018-11-02   75  
e7bdd7f0cbd1c0 Ming Lei          2022-12-27   76  		if (!result) {
6da4b3ab9a6e9b Jens Axboe        2018-11-02   77  			kfree(masks);
347253c42d7c67 Ming Lei          2019-01-25   78  			return NULL;
6da4b3ab9a6e9b Jens Axboe        2018-11-02   79  		}
e7bdd7f0cbd1c0 Ming Lei          2022-12-27   80  
e7bdd7f0cbd1c0 Ming Lei          2022-12-27   81  		for (j = 0; j < this_vecs; j++)
e7bdd7f0cbd1c0 Ming Lei          2022-12-27   82  			cpumask_copy(&masks[curvec + j].mask, &result[j]);
e7bdd7f0cbd1c0 Ming Lei          2022-12-27   83  		kfree(result);
e7bdd7f0cbd1c0 Ming Lei          2022-12-27   84  
6da4b3ab9a6e9b Jens Axboe        2018-11-02   85  		curvec += this_vecs;
6da4b3ab9a6e9b Jens Axboe        2018-11-02   86  		usedvecs += this_vecs;
6da4b3ab9a6e9b Jens Axboe        2018-11-02   87  	}
67c93c218dc5d1 Christoph Hellwig 2016-11-08   88  
67c93c218dc5d1 Christoph Hellwig 2016-11-08   89  	/* Fill out vectors at the end that don't need affinity */
d3056812e7dfe6 Ming Lei          2018-03-08   90  	if (usedvecs >= affvecs)
d3056812e7dfe6 Ming Lei          2018-03-08   91  		curvec = affd->pre_vectors + affvecs;
d3056812e7dfe6 Ming Lei          2018-03-08   92  	else
d3056812e7dfe6 Ming Lei          2018-03-08   93  		curvec = affd->pre_vectors + usedvecs;
67c93c218dc5d1 Christoph Hellwig 2016-11-08   94  	for (; curvec < nvecs; curvec++)
bec04037e4e484 Dou Liyang        2018-12-04   95  		cpumask_copy(&masks[curvec].mask, irq_default_affinity);
d3056812e7dfe6 Ming Lei          2018-03-08   96  
c410abbbacb9b3 Dou Liyang        2018-12-04   97  	/* Mark the managed interrupts */
c410abbbacb9b3 Dou Liyang        2018-12-04   98  	for (i = affd->pre_vectors; i < nvecs - affd->post_vectors; i++)
c410abbbacb9b3 Dou Liyang        2018-12-04  @99  		masks[i].is_managed = 1;
c410abbbacb9b3 Dou Liyang        2018-12-04  100  
34c3d9819fda46 Thomas Gleixner   2016-09-14  101  	return masks;
34c3d9819fda46 Thomas Gleixner   2016-09-14  102  }
34c3d9819fda46 Thomas Gleixner   2016-09-14  103  

:::::: The code at line 99 was first introduced by commit
:::::: c410abbbacb9b378365ba17a30df08b4b9eec64f genirq/affinity: Add is_managed to struct irq_affinity_desc

:::::: TO: Dou Liyang <douliyangs@gmail.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
