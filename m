Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C360B150997
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Oct 2025 07:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760944204; cv=none; b=PQcNI1rGfvAuYYuBMyi5jItU2gi9bsxpkpyxIL7jcWhJaD441GLNENWKHuCO/0jxI1+RFuCSZoH1pKS6i4qeX0yeioNIUXd2/v61glRGJ+U9r6jXo9KEqldGWw6g4UQAAR4X/SGF8TjpI0nzUfRbfGyASuJZv/N9ckxkCDlviz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760944204; c=relaxed/simple;
	bh=5ZcS5vtd88cC/n2H2YEhmeHkghmMlOBUsYZFLWeLkq4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OW6g7QdMpsvXVYympNXPi5u2Xf1wHa5G7j8D37i9HM5zgplgUcRN8abZVfI02gBsTSulSjzsiMFz/ONbhs7AdP3KgKZoccf+/r5EPo/QpwhSU93TrVRG/RNZLq3ET+cH+GKzhKeUkaBQBUOjZPiocFNZepO7XJn17g+tElM/j+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQ9M34gC; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQ9M34gC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760944202; x=1792480202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ZcS5vtd88cC/n2H2YEhmeHkghmMlOBUsYZFLWeLkq4=;
  b=hQ9M34gCN6JttcBvSTakzMW6BJQTxz6V4Iw/eRWzc8ZDKOg76RPBi9Mt
   N47tcEEEaC8UWr0J5vR/MHnx49L31no/rmrDBR0T0uGtuLHspu5U4wNOk
   63hQrYzeSOq40msNkWxe5vJMwABqliDJ+Q2P0n1WvRUKdhf+LgZo0DhdD
   okVlZRbcv/SYi4b6d2iIjsYYHDLcpdcShTHs8hHy1cfauQ5xrT4kRZfzz
   xP4MgJH80/EGTUzmq9pjSNZxyMN85dvotsbcrHr9mPuf6yhiRA3bt13R5
   lyOdGRqOu0vJq+Yip1sqaPd8V/KXHWZ4+mfqhgHiyy2AEln7WiUbXunyD
   g==;
X-CSE-ConnectionGUID: xZ8rXDA0QK2/6XQGNVG/Pw==
X-CSE-MsgGUID: 20UXbZpzRl+1aVCLcxipCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="62090614"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="62090614"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 00:10:00 -0700
X-CSE-ConnectionGUID: s1XUN7sYTnCdGrJlNAm2oQ==
X-CSE-MsgGUID: b6eAeg4QSsum9M68C5wrzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="182963562"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 20 Oct 2025 00:09:59 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAk1l-0009Zv-1d;
	Mon, 20 Oct 2025 07:09:57 +0000
Date: Mon, 20 Oct 2025 15:09:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 6/6] fuse: {io-uring} Queue background requests on a
 different core
Message-ID: <202510201259.MevZAfl5-lkp@intel.com>
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
In-Reply-To: <20251013-reduced-nr-ring-queues_3-v3-6-6d87c8aa31ae@ddn.com>
References: <20251013-reduced-nr-ring-queues_3-v3-6-6d87c8aa31ae@ddn.com>
TO: Bernd Schubert <bschubert@ddn.com>
TO: Miklos Szeredi <miklos@szeredi.hu>
CC: Joanne Koong <joannelkoong@gmail.com>
CC: linux-fsdevel@vger.kernel.org
CC: Luis Henriques <luis@igalia.com>
CC: Gang He <dchg2000@gmail.com>
CC: Bernd Schubert <bschubert@ddn.com>

Hi Bernd,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ec714e371f22f716a04e6ecb2a24988c92b26911]

url:    https://github.com/intel-lab-lkp/linux/commits/Bernd-Schubert/fuse-io-uring-Add-queue-length-counters/20251014-024703
base:   ec714e371f22f716a04e6ecb2a24988c92b26911
patch link:    https://lore.kernel.org/r/20251013-reduced-nr-ring-queues_3-v3-6-6d87c8aa31ae%40ddn.com
patch subject: [PATCH v3 6/6] fuse: {io-uring} Queue background requests on a different core
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: loongarch-randconfig-r072-20251019 (https://download.01.org/0day-ci/archive/20251020/202510201259.MevZAfl5-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510201259.MevZAfl5-lkp@intel.com/

smatch warnings:
fs/fuse/dev_uring.c:1389 fuse_uring_get_queue() error: uninitialized symbol 'best_numa'.

vim +/best_numa +1389 fs/fuse/dev_uring.c

aca09b212467554 Bernd Schubert 2025-10-13  1302  
aca09b212467554 Bernd Schubert 2025-10-13  1303  /*
aca09b212467554 Bernd Schubert 2025-10-13  1304   * Get the best queue for the current CPU
aca09b212467554 Bernd Schubert 2025-10-13  1305   */
2482ae85881b957 Bernd Schubert 2025-10-13  1306  static struct fuse_ring_queue *fuse_uring_get_queue(struct fuse_ring *ring,
2482ae85881b957 Bernd Schubert 2025-10-13  1307  						    bool background)
c2c9af9a0b13261 Bernd Schubert 2025-01-20  1308  {
c2c9af9a0b13261 Bernd Schubert 2025-01-20  1309  	unsigned int qid;
aca09b212467554 Bernd Schubert 2025-10-13  1310  	struct fuse_ring_queue *local_queue, *best_numa, *best_global;
aca09b212467554 Bernd Schubert 2025-10-13  1311  	int local_node;
aca09b212467554 Bernd Schubert 2025-10-13  1312  	const struct cpumask *numa_mask, *global_mask;
2482ae85881b957 Bernd Schubert 2025-10-13  1313  	int retries = 0;
2482ae85881b957 Bernd Schubert 2025-10-13  1314  	int weight = -1;
c2c9af9a0b13261 Bernd Schubert 2025-01-20  1315  
c2c9af9a0b13261 Bernd Schubert 2025-01-20  1316  	qid = task_cpu(current);
868e7728394dbc8 Bernd Schubert 2025-10-13  1317  	if (WARN_ONCE(qid >= ring->max_nr_queues,
c2c9af9a0b13261 Bernd Schubert 2025-01-20  1318  		      "Core number (%u) exceeds nr queues (%zu)\n", qid,
868e7728394dbc8 Bernd Schubert 2025-10-13  1319  		      ring->max_nr_queues))
c2c9af9a0b13261 Bernd Schubert 2025-01-20  1320  		qid = 0;
c2c9af9a0b13261 Bernd Schubert 2025-01-20  1321  
aca09b212467554 Bernd Schubert 2025-10-13  1322  	local_node = cpu_to_node(qid);
aca09b212467554 Bernd Schubert 2025-10-13  1323  	if (WARN_ON_ONCE(local_node > ring->nr_numa_nodes))
aca09b212467554 Bernd Schubert 2025-10-13  1324  		local_node = 0;
c2c9af9a0b13261 Bernd Schubert 2025-01-20  1325  
2482ae85881b957 Bernd Schubert 2025-10-13  1326  	local_queue = READ_ONCE(ring->queues[qid]);
2482ae85881b957 Bernd Schubert 2025-10-13  1327  
2482ae85881b957 Bernd Schubert 2025-10-13  1328  retry:
2482ae85881b957 Bernd Schubert 2025-10-13  1329  	/*
2482ae85881b957 Bernd Schubert 2025-10-13  1330  	 * For background requests, try next CPU in same NUMA domain.
2482ae85881b957 Bernd Schubert 2025-10-13  1331  	 * I.e. cpu-0 creates async requests, cpu-1 io processes.
2482ae85881b957 Bernd Schubert 2025-10-13  1332  	 * Similar for foreground requests, when the local queue does not
2482ae85881b957 Bernd Schubert 2025-10-13  1333  	 * exist - still better to always wake the same cpu id.
2482ae85881b957 Bernd Schubert 2025-10-13  1334  	 */
2482ae85881b957 Bernd Schubert 2025-10-13  1335  	if (background || !local_queue) {
2482ae85881b957 Bernd Schubert 2025-10-13  1336  		numa_mask = ring->numa_registered_q_mask[local_node];
2482ae85881b957 Bernd Schubert 2025-10-13  1337  
2482ae85881b957 Bernd Schubert 2025-10-13  1338  		if (weight == -1)
2482ae85881b957 Bernd Schubert 2025-10-13  1339  			weight = cpumask_weight(numa_mask);
2482ae85881b957 Bernd Schubert 2025-10-13  1340  
2482ae85881b957 Bernd Schubert 2025-10-13  1341  		if (weight == 0)
2482ae85881b957 Bernd Schubert 2025-10-13  1342  			goto global;
2482ae85881b957 Bernd Schubert 2025-10-13  1343  
2482ae85881b957 Bernd Schubert 2025-10-13  1344  		if (weight > 1) {
2482ae85881b957 Bernd Schubert 2025-10-13  1345  			int idx = (qid + 1) % weight;
2482ae85881b957 Bernd Schubert 2025-10-13  1346  
2482ae85881b957 Bernd Schubert 2025-10-13  1347  			qid = cpumask_nth(idx, numa_mask);
2482ae85881b957 Bernd Schubert 2025-10-13  1348  		} else {
2482ae85881b957 Bernd Schubert 2025-10-13  1349  			qid = cpumask_first(numa_mask);
2482ae85881b957 Bernd Schubert 2025-10-13  1350  		}
2482ae85881b957 Bernd Schubert 2025-10-13  1351  
2482ae85881b957 Bernd Schubert 2025-10-13  1352  		local_queue = READ_ONCE(ring->queues[qid]);
2482ae85881b957 Bernd Schubert 2025-10-13  1353  		if (WARN_ON_ONCE(!local_queue))
2482ae85881b957 Bernd Schubert 2025-10-13  1354  			return NULL;
2482ae85881b957 Bernd Schubert 2025-10-13  1355  	}
2482ae85881b957 Bernd Schubert 2025-10-13  1356  
2482ae85881b957 Bernd Schubert 2025-10-13  1357  	if (READ_ONCE(local_queue->nr_reqs) <= FURING_Q_NUMA_THRESHOLD)
aca09b212467554 Bernd Schubert 2025-10-13  1358  		return local_queue;
aca09b212467554 Bernd Schubert 2025-10-13  1359  
2482ae85881b957 Bernd Schubert 2025-10-13  1360  	if (retries < FURING_NEXT_QUEUE_RETRIES && weight > retries + 1) {
2482ae85881b957 Bernd Schubert 2025-10-13  1361  		retries++;
2482ae85881b957 Bernd Schubert 2025-10-13  1362  		local_queue = NULL;
2482ae85881b957 Bernd Schubert 2025-10-13  1363  		goto retry;
2482ae85881b957 Bernd Schubert 2025-10-13  1364  	}
2482ae85881b957 Bernd Schubert 2025-10-13  1365  
aca09b212467554 Bernd Schubert 2025-10-13  1366  	/* Find best NUMA-local queue */
aca09b212467554 Bernd Schubert 2025-10-13  1367  	numa_mask = ring->numa_registered_q_mask[local_node];
aca09b212467554 Bernd Schubert 2025-10-13  1368  	best_numa = fuse_uring_best_queue(numa_mask, ring);
aca09b212467554 Bernd Schubert 2025-10-13  1369  
aca09b212467554 Bernd Schubert 2025-10-13  1370  	/* If NUMA queue is under threshold, use it */
aca09b212467554 Bernd Schubert 2025-10-13  1371  	if (best_numa &&
aca09b212467554 Bernd Schubert 2025-10-13  1372  	    READ_ONCE(best_numa->nr_reqs) <= FURING_Q_NUMA_THRESHOLD)
aca09b212467554 Bernd Schubert 2025-10-13  1373  		return best_numa;
aca09b212467554 Bernd Schubert 2025-10-13  1374  
2482ae85881b957 Bernd Schubert 2025-10-13  1375  global:
aca09b212467554 Bernd Schubert 2025-10-13  1376  	/* NUMA queues above threshold, try global queues */
aca09b212467554 Bernd Schubert 2025-10-13  1377  	global_mask = ring->registered_q_mask;
aca09b212467554 Bernd Schubert 2025-10-13  1378  	best_global = fuse_uring_best_queue(global_mask, ring);
aca09b212467554 Bernd Schubert 2025-10-13  1379  
aca09b212467554 Bernd Schubert 2025-10-13  1380  	/* Might happen during tear down */
aca09b212467554 Bernd Schubert 2025-10-13  1381  	if (!best_global)
aca09b212467554 Bernd Schubert 2025-10-13  1382  		return NULL;
aca09b212467554 Bernd Schubert 2025-10-13  1383  
aca09b212467554 Bernd Schubert 2025-10-13  1384  	/* If global queue is under double threshold, use it */
aca09b212467554 Bernd Schubert 2025-10-13  1385  	if (READ_ONCE(best_global->nr_reqs) <= FURING_Q_GLOBAL_THRESHOLD)
aca09b212467554 Bernd Schubert 2025-10-13  1386  		return best_global;
aca09b212467554 Bernd Schubert 2025-10-13  1387  
aca09b212467554 Bernd Schubert 2025-10-13  1388  	/* There is no ideal queue, stay numa_local if possible */
aca09b212467554 Bernd Schubert 2025-10-13 @1389  	return best_numa ? best_numa : best_global;
c2c9af9a0b13261 Bernd Schubert 2025-01-20  1390  }
c2c9af9a0b13261 Bernd Schubert 2025-01-20  1391  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
