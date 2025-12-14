Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9C8243969
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 08:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765699863; cv=none; b=pgnoC+XObDQ0OlzyK1VpI6PoLQX7I8ey3CGpOZIcig6spFD8aAevhY7MyGsYk8DfgT8BgujYcg4HT/SRGLm25fm03hJIstxXDksMBWbUXmUt2rGT/fPFnIVjKDvKAdrZf8C/feXQxD/JdBvXx0nsNU1FgWNlsvpFjFYgp8H10wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765699863; c=relaxed/simple;
	bh=l/Zjx5aiy7Cj2tvFGSDhSj4w2kZNqT3Ahl6CBSfjzYI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gDFZDoZrPD1Iekh8uDxGQrCSfVPcCMnKupdSmXVqibNaCCPK89jYm50MAos9uuC8vDsXKShz9XRrRwQVEjN5SOsHh/8G9b+IweN1eMwJLbC77PTL1jmSJ0MumxGYeTGQ2JQ5mAPy0jFAMrfQODiGZdNhKLByAjqbY9NKk1NYuiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WSlNssE5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WSlNssE5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765699862; x=1797235862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l/Zjx5aiy7Cj2tvFGSDhSj4w2kZNqT3Ahl6CBSfjzYI=;
  b=WSlNssE5Ulg0ncN2tI5ELIi7ZN3JzbuX7e64HKagOYUKx9fvekB5KfkT
   HeqQVtxGFJHTiZu4CBH8tD7ohEOIoCHamluRWo8yokMChaBgEtb7OTsm0
   JfjnUxUtu98ghm1DRiuNk8LCdj0oeaeZqLvaJDY1e0rPnoeG5xfL8POs/
   sKHf7q9vCvBUR55cIZUXvih9PngC1oXk4ECoUQSR1PoxnSc1JrcyEHuun
   w1VkOWj/r9AHItwpl4vsfVDiWvwJCxh5s0r1RVytrJPz9j6Anwt/taJy9
   PRQDrkZpVP1w+4sxB0bNd5ZiTGTEiy9rG58fn6UFbkoPPZTeNUgEmI9kb
   g==;
X-CSE-ConnectionGUID: KbtwKPoCSHy8EyppWT3kNg==
X-CSE-MsgGUID: XJSme0MfSOKb9ekc6glzWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="90289174"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="90289174"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 00:11:02 -0800
X-CSE-ConnectionGUID: q0nSdSUNSNa0WIYs499QcA==
X-CSE-MsgGUID: nQrcv5vsQTSIPkLR4435kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="220843274"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Dec 2025 00:10:59 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUhBw-000000008rL-3F4m;
	Sun, 14 Dec 2025 08:10:56 +0000
Date: Sun, 14 Dec 2025 16:10:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/sched/ext.c:5332 scx_alloc_and_add_sched() warn: passing zero
 to 'ERR_PTR'
Message-ID: <202512141601.yAXDAeA9-lkp@intel.com>
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
TO: Tejun Heo <tj@kernel.org>
CC: Andrea Righi <arighi@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: c201ea1578d3b9eed29494ba3dc2abbccf62c4c8 sched_ext: Move event_stats_cpu into scx_sched
date:   8 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 months ago
config: powerpc64-randconfig-r073-20251213 (https://download.01.org/0day-ci/archive/20251214/202512141601.yAXDAeA9-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512141601.yAXDAeA9-lkp@intel.com/

smatch warnings:
kernel/sched/ext.c:5332 scx_alloc_and_add_sched() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +5332 kernel/sched/ext.c

f0e1a0643a59bf1 Tejun Heo 2024-06-18  5265  
d9f754631021802 Tejun Heo 2025-04-29  5266  static struct scx_sched *scx_alloc_and_add_sched(struct sched_ext_ops *ops)
d9f754631021802 Tejun Heo 2025-04-29  5267  {
d9f754631021802 Tejun Heo 2025-04-29  5268  	struct scx_sched *sch;
8409b800a0b1f14 Tejun Heo 2025-04-29  5269  	int node, ret;
d9f754631021802 Tejun Heo 2025-04-29  5270  
d9f754631021802 Tejun Heo 2025-04-29  5271  	sch = kzalloc(sizeof(*sch), GFP_KERNEL);
d9f754631021802 Tejun Heo 2025-04-29  5272  	if (!sch)
d9f754631021802 Tejun Heo 2025-04-29  5273  		return ERR_PTR(-ENOMEM);
d9f754631021802 Tejun Heo 2025-04-29  5274  
d9f754631021802 Tejun Heo 2025-04-29  5275  	sch->exit_info = alloc_exit_info(ops->exit_dump_len);
d9f754631021802 Tejun Heo 2025-04-29  5276  	if (!sch->exit_info) {
d9f754631021802 Tejun Heo 2025-04-29  5277  		ret = -ENOMEM;
d9f754631021802 Tejun Heo 2025-04-29  5278  		goto err_free_sch;
d9f754631021802 Tejun Heo 2025-04-29  5279  	}
d9f754631021802 Tejun Heo 2025-04-29  5280  
cdf5a6faa8cf0ef Tejun Heo 2025-04-29  5281  	ret = rhashtable_init(&sch->dsq_hash, &dsq_hash_params);
cdf5a6faa8cf0ef Tejun Heo 2025-04-29  5282  	if (ret < 0)
cdf5a6faa8cf0ef Tejun Heo 2025-04-29  5283  		goto err_free_ei;
cdf5a6faa8cf0ef Tejun Heo 2025-04-29  5284  
8409b800a0b1f14 Tejun Heo 2025-04-29  5285  	sch->global_dsqs = kcalloc(nr_node_ids, sizeof(sch->global_dsqs[0]),
8409b800a0b1f14 Tejun Heo 2025-04-29  5286  				   GFP_KERNEL);
8409b800a0b1f14 Tejun Heo 2025-04-29  5287  	if (!sch->global_dsqs) {
8409b800a0b1f14 Tejun Heo 2025-04-29  5288  		ret = -ENOMEM;
8409b800a0b1f14 Tejun Heo 2025-04-29  5289  		goto err_free_hash;
8409b800a0b1f14 Tejun Heo 2025-04-29  5290  	}
8409b800a0b1f14 Tejun Heo 2025-04-29  5291  
8409b800a0b1f14 Tejun Heo 2025-04-29  5292  	for_each_node_state(node, N_POSSIBLE) {
8409b800a0b1f14 Tejun Heo 2025-04-29  5293  		struct scx_dispatch_q *dsq;
8409b800a0b1f14 Tejun Heo 2025-04-29  5294  
8409b800a0b1f14 Tejun Heo 2025-04-29  5295  		dsq = kzalloc_node(sizeof(*dsq), GFP_KERNEL, node);
8409b800a0b1f14 Tejun Heo 2025-04-29  5296  		if (!dsq) {
8409b800a0b1f14 Tejun Heo 2025-04-29  5297  			ret = -ENOMEM;
8409b800a0b1f14 Tejun Heo 2025-04-29  5298  			goto err_free_gdsqs;
8409b800a0b1f14 Tejun Heo 2025-04-29  5299  		}
8409b800a0b1f14 Tejun Heo 2025-04-29  5300  
8409b800a0b1f14 Tejun Heo 2025-04-29  5301  		init_dsq(dsq, SCX_DSQ_GLOBAL);
8409b800a0b1f14 Tejun Heo 2025-04-29  5302  		sch->global_dsqs[node] = dsq;
8409b800a0b1f14 Tejun Heo 2025-04-29  5303  	}
8409b800a0b1f14 Tejun Heo 2025-04-29  5304  
c201ea1578d3b9e Tejun Heo 2025-04-29  5305  	sch->event_stats_cpu = alloc_percpu(struct scx_event_stats);
c201ea1578d3b9e Tejun Heo 2025-04-29  5306  	if (!sch->event_stats_cpu)
c201ea1578d3b9e Tejun Heo 2025-04-29  5307  		goto err_free_gdsqs;
c201ea1578d3b9e Tejun Heo 2025-04-29  5308  
d9f754631021802 Tejun Heo 2025-04-29  5309  	atomic_set(&sch->exit_kind, SCX_EXIT_NONE);
d9f754631021802 Tejun Heo 2025-04-29  5310  	sch->ops = *ops;
d9f754631021802 Tejun Heo 2025-04-29  5311  	ops->priv = sch;
d9f754631021802 Tejun Heo 2025-04-29  5312  
d9f754631021802 Tejun Heo 2025-04-29  5313  	sch->kobj.kset = scx_kset;
d9f754631021802 Tejun Heo 2025-04-29  5314  	ret = kobject_init_and_add(&sch->kobj, &scx_ktype, NULL, "root");
d9f754631021802 Tejun Heo 2025-04-29  5315  	if (ret < 0)
c201ea1578d3b9e Tejun Heo 2025-04-29  5316  		goto err_free_event_stats;
d9f754631021802 Tejun Heo 2025-04-29  5317  
d9f754631021802 Tejun Heo 2025-04-29  5318  	return sch;
d9f754631021802 Tejun Heo 2025-04-29  5319  
c201ea1578d3b9e Tejun Heo 2025-04-29  5320  err_free_event_stats:
c201ea1578d3b9e Tejun Heo 2025-04-29  5321  	free_percpu(sch->event_stats_cpu);
8409b800a0b1f14 Tejun Heo 2025-04-29  5322  err_free_gdsqs:
8409b800a0b1f14 Tejun Heo 2025-04-29  5323  	for_each_node_state(node, N_POSSIBLE)
8409b800a0b1f14 Tejun Heo 2025-04-29  5324  		kfree(sch->global_dsqs[node]);
8409b800a0b1f14 Tejun Heo 2025-04-29  5325  	kfree(sch->global_dsqs);
cdf5a6faa8cf0ef Tejun Heo 2025-04-29  5326  err_free_hash:
cdf5a6faa8cf0ef Tejun Heo 2025-04-29  5327  	rhashtable_free_and_destroy(&sch->dsq_hash, NULL, NULL);
d9f754631021802 Tejun Heo 2025-04-29  5328  err_free_ei:
d9f754631021802 Tejun Heo 2025-04-29  5329  	free_exit_info(sch->exit_info);
d9f754631021802 Tejun Heo 2025-04-29  5330  err_free_sch:
d9f754631021802 Tejun Heo 2025-04-29  5331  	kfree(sch);
d9f754631021802 Tejun Heo 2025-04-29 @5332  	return ERR_PTR(ret);
d9f754631021802 Tejun Heo 2025-04-29  5333  }
d9f754631021802 Tejun Heo 2025-04-29  5334  

:::::: The code at line 5332 was first introduced by commit
:::::: d9f754631021802b3bd3f58781b4c8ff3677b3a8 sched_ext: Factor out scx_alloc_and_add_sched()

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
