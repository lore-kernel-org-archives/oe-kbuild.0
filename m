Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0765B13D2FD
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Feb 2024 23:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709164764; cv=none; b=AvdW+bcBfHmQsPiOs8fMpRAj1gRGu6bD6Hfo6pfgliG0tG8eoWQJTy2FnQ1YdKrMGxwqBJmJ2OuWnhATwPkVwXvw3zKpN5J9asG4buQIskiK89+tLxrgnWXgrV96va0TGTKn9x0t+EdE+BGbCOBIgc+74/usr/5ZeTNmbYYUJ2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709164764; c=relaxed/simple;
	bh=Z32QizXqLkpdGe9SPZBDTgtzcMVvQZPUl8A2ydO674A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UzFr3xRo2x36+HJCqEgyyQinyzAWozRDwbaZqkI+K5U5xAn9I9R+8GnE5XFjx1O0axRh1zjheuznSRoC1+YULEhq/IA02LDMfZZdNtbna5euMfe0Rg2iS89U65zLRkDN+pdEzkWSVBUAS8JWVhrNuAtj6l9yTratSpeL9rXjGNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ffAMfO/b; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ffAMfO/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709164762; x=1740700762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z32QizXqLkpdGe9SPZBDTgtzcMVvQZPUl8A2ydO674A=;
  b=ffAMfO/bNuVZ8GXjVsbpANWBwmd+UmIopZ8z6fkXmCLlc9w+onexO4l/
   ParpCcqBMeO032lRqAnLkoaq/F13Qeki2Vg0nm+184ZU+QFfeKrzwE1kB
   fv8VKTFBEXP95aQOyq4UJavkGyBoRSEFYBr5MCFv7TLwE8BQFRQIkjuJY
   DAQAdM72nZeduMr1kBHOkyiowokfySAkrasvUy9M7d9j8Mb8ka29mJqdB
   DLuruObWkBi6vHAPTGJefiz+bf8s3wAMgW6arnOn6kO5NbmxTxRZ0H8rZ
   0mZLUM2cX9ruIuk2dSpxHpSn0tbosP4h+27XSJrmdPxja6LcBs1rk8pVi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14164436"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="14164436"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 15:59:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="12182040"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 28 Feb 2024 15:59:18 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfTpU-000CUb-0v;
	Wed, 28 Feb 2024 23:59:16 +0000
Date: Thu, 29 Feb 2024 07:58:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 10500/10830] net/mpls/af_mpls.c:2531
 resize_platform_label_table() error: kvzalloc() does not make sense for no
 sleep code
Message-ID: <202402290716.3E439pYO-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Kees Cook <keescook@chromium.org>
CC: Pasha Tatashin <pasha.tatashin@soleen.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20af1ca418d2c0b11bc2a1fe8c0c88f67bcc2a7e
commit: 211ec89ce404de50f19bccf444644d6b4c7d592c [10500/10830] mm: enumerate all gfp flags
:::::: branch date: 20 hours ago
:::::: commit date: 28 hours ago
config: i386-randconfig-141-20240228 (https://download.01.org/0day-ci/archive/20240229/202402290716.3E439pYO-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402290716.3E439pYO-lkp@intel.com/

New smatch warnings:
net/mpls/af_mpls.c:2531 resize_platform_label_table() error: kvzalloc() does not make sense for no sleep code
drivers/media/common/videobuf2/videobuf2-dma-sg.c:129 vb2_dma_sg_alloc() error: kvcalloc() does not make sense for no sleep code
drivers/input/evdev.c:477 evdev_open() error: kvzalloc() does not make sense for no sleep code
fs/pstore/platform.c:228 allocate_buf_for_compression() error: kvzalloc() does not make sense for no sleep code
fs/pstore/platform.c:613 decompress_record() error: kvzalloc() does not make sense for no sleep code
security/apparmor/match.c:63 unpack_table() error: kvzalloc() does not make sense for no sleep code
security/apparmor/policy_unpack.c:150 aa_loaddata_alloc() error: kvzalloc() does not make sense for no sleep code
security/selinux/ss/avtab.c:262 avtab_alloc_common() error: kvcalloc() does not make sense for no sleep code
security/apparmor/policy_compat.c:161 compute_fperms() error: kvcalloc() does not make sense for no sleep code
security/apparmor/policy_compat.c:185 compute_xmatch_perms() error: kvcalloc() does not make sense for no sleep code
security/apparmor/policy_compat.c:260 compute_perms() error: kvcalloc() does not make sense for no sleep code
drivers/media/v4l2-core/v4l2-event.c:238 v4l2_event_subscribe() error: kvzalloc() does not make sense for no sleep code
drivers/media/v4l2-core/v4l2-subdev.c:1471 __v4l2_subdev_state_alloc() error: kvcalloc() does not make sense for no sleep code
drivers/media/v4l2-core/v4l2-subdev.c:1710 v4l2_subdev_init_stream_configs() error: kvcalloc() does not make sense for no sleep code
fs/btrfs/scrub.c:351 scrub_setup_ctx() error: kvzalloc() does not make sense for no sleep code
fs/btrfs/raid56.c:138 btrfs_alloc_stripe_hash_table() error: kvzalloc() does not make sense for no sleep code
fs/btrfs/free-space-tree.c:179 alloc_bitmap() error: kvzalloc() does not make sense for no sleep code
fs/xfs/xfs_ioctl.c:410 xfs_ioc_attr_list() error: kvzalloc() does not make sense for no sleep code
fs/xfs/xfs_ioctl.c:1488 xfs_ioc_getbmap() error: kvcalloc() does not make sense for no sleep code
fs/xfs/xfs_ioctl.c:1542 xfs_ioc_getfsmap() error: kvcalloc() does not make sense for no sleep code
fs/xfs/xfs_log.c:1616 xlog_alloc_log() error: kvzalloc() does not make sense for no sleep code
fs/xfs/xfs_log_recover.c:104 xlog_alloc_buffer() error: kvzalloc() does not make sense for no sleep code
fs/xfs/xfs_acl.c:200 __xfs_set_acl() error: kvzalloc() does not make sense for no sleep code

Old smatch warnings:
security/apparmor/policy_unpack.c:137 aa_loaddata_kref() warn: can 'd' even be NULL?
security/apparmor/policy_unpack.c:1236 verify_profile() warn: can 'rules' even be NULL?
fs/btrfs/scrub.c:2145 scrub_simple_mirror() error: uninitialized symbol 'ret'.
fs/xfs/xfs_ioctl.c:1546 xfs_ioc_getfsmap() error: kvcalloc() does not make sense for no sleep code

vim +2531 net/mpls/af_mpls.c

397fc9e5cefee0 Roopa Prabhu      2017-07-03  2520  
7720c01f3f5901 Eric W. Biederman 2015-03-03  2521  static int resize_platform_label_table(struct net *net, size_t limit)
7720c01f3f5901 Eric W. Biederman 2015-03-03  2522  {
7720c01f3f5901 Eric W. Biederman 2015-03-03  2523  	size_t size = sizeof(struct mpls_route *) * limit;
7720c01f3f5901 Eric W. Biederman 2015-03-03  2524  	size_t old_limit;
7720c01f3f5901 Eric W. Biederman 2015-03-03  2525  	size_t cp_size;
7720c01f3f5901 Eric W. Biederman 2015-03-03  2526  	struct mpls_route __rcu **labels = NULL, **old;
7720c01f3f5901 Eric W. Biederman 2015-03-03  2527  	struct mpls_route *rt0 = NULL, *rt2 = NULL;
7720c01f3f5901 Eric W. Biederman 2015-03-03  2528  	unsigned index;
7720c01f3f5901 Eric W. Biederman 2015-03-03  2529  
7720c01f3f5901 Eric W. Biederman 2015-03-03  2530  	if (size) {
752ade68cbd81d Michal Hocko      2017-05-08 @2531  		labels = kvzalloc(size, GFP_KERNEL);
7720c01f3f5901 Eric W. Biederman 2015-03-03  2532  		if (!labels)
7720c01f3f5901 Eric W. Biederman 2015-03-03  2533  			goto nolabels;
7720c01f3f5901 Eric W. Biederman 2015-03-03  2534  	}
7720c01f3f5901 Eric W. Biederman 2015-03-03  2535  
7720c01f3f5901 Eric W. Biederman 2015-03-03  2536  	/* In case the predefined labels need to be populated */
78f5b899195019 Tom Herbert       2015-05-07  2537  	if (limit > MPLS_LABEL_IPV4NULL) {
7720c01f3f5901 Eric W. Biederman 2015-03-03  2538  		struct net_device *lo = net->loopback_dev;
a4ac8c986d3f72 David Ahern       2017-03-31  2539  		rt0 = mpls_rt_alloc(1, lo->addr_len, 0);
df1c631648c55b David Ahern       2017-03-31  2540  		if (IS_ERR(rt0))
7720c01f3f5901 Eric W. Biederman 2015-03-03  2541  			goto nort0;
189168181bb678 Benjamin Poirier  2021-11-29  2542  		rt0->rt_nh->nh_dev = lo;
7720c01f3f5901 Eric W. Biederman 2015-03-03  2543  		rt0->rt_protocol = RTPROT_KERNEL;
118d5234636ca3 Robert Shearman   2015-08-06  2544  		rt0->rt_payload_type = MPT_IPV4;
5b441ac8784c1e Robert Shearman   2017-03-10  2545  		rt0->rt_ttl_propagate = MPLS_TTL_PROP_DEFAULT;
f8efb73c97e2fa Roopa Prabhu      2015-10-23  2546  		rt0->rt_nh->nh_via_table = NEIGH_LINK_TABLE;
b4e04fc7357b6c Robert Shearman   2015-10-27  2547  		rt0->rt_nh->nh_via_alen = lo->addr_len;
cf4b24f0024fc2 Robert Shearman   2015-10-27  2548  		memcpy(__mpls_nh_via(rt0, rt0->rt_nh), lo->dev_addr,
cf4b24f0024fc2 Robert Shearman   2015-10-27  2549  		       lo->addr_len);
7720c01f3f5901 Eric W. Biederman 2015-03-03  2550  	}
78f5b899195019 Tom Herbert       2015-05-07  2551  	if (limit > MPLS_LABEL_IPV6NULL) {
7720c01f3f5901 Eric W. Biederman 2015-03-03  2552  		struct net_device *lo = net->loopback_dev;
a4ac8c986d3f72 David Ahern       2017-03-31  2553  		rt2 = mpls_rt_alloc(1, lo->addr_len, 0);
df1c631648c55b David Ahern       2017-03-31  2554  		if (IS_ERR(rt2))
7720c01f3f5901 Eric W. Biederman 2015-03-03  2555  			goto nort2;
189168181bb678 Benjamin Poirier  2021-11-29  2556  		rt2->rt_nh->nh_dev = lo;
7720c01f3f5901 Eric W. Biederman 2015-03-03  2557  		rt2->rt_protocol = RTPROT_KERNEL;
118d5234636ca3 Robert Shearman   2015-08-06  2558  		rt2->rt_payload_type = MPT_IPV6;
6a18c312320766 David Ahern       2017-03-23  2559  		rt2->rt_ttl_propagate = MPLS_TTL_PROP_DEFAULT;
f8efb73c97e2fa Roopa Prabhu      2015-10-23  2560  		rt2->rt_nh->nh_via_table = NEIGH_LINK_TABLE;
b4e04fc7357b6c Robert Shearman   2015-10-27  2561  		rt2->rt_nh->nh_via_alen = lo->addr_len;
cf4b24f0024fc2 Robert Shearman   2015-10-27  2562  		memcpy(__mpls_nh_via(rt2, rt2->rt_nh), lo->dev_addr,
cf4b24f0024fc2 Robert Shearman   2015-10-27  2563  		       lo->addr_len);
7720c01f3f5901 Eric W. Biederman 2015-03-03  2564  	}
7720c01f3f5901 Eric W. Biederman 2015-03-03  2565  
7720c01f3f5901 Eric W. Biederman 2015-03-03  2566  	rtnl_lock();
7720c01f3f5901 Eric W. Biederman 2015-03-03  2567  	/* Remember the original table */
19d0c341d9d5cd Eric W. Biederman 2015-03-07  2568  	old = rtnl_dereference(net->mpls.platform_label);
7720c01f3f5901 Eric W. Biederman 2015-03-03  2569  	old_limit = net->mpls.platform_labels;
7720c01f3f5901 Eric W. Biederman 2015-03-03  2570  
7720c01f3f5901 Eric W. Biederman 2015-03-03  2571  	/* Free any labels beyond the new table */
7720c01f3f5901 Eric W. Biederman 2015-03-03  2572  	for (index = limit; index < old_limit; index++)
f8efb73c97e2fa Roopa Prabhu      2015-10-23  2573  		mpls_route_update(net, index, NULL, NULL);
7720c01f3f5901 Eric W. Biederman 2015-03-03  2574  
7720c01f3f5901 Eric W. Biederman 2015-03-03  2575  	/* Copy over the old labels */
7720c01f3f5901 Eric W. Biederman 2015-03-03  2576  	cp_size = size;
7720c01f3f5901 Eric W. Biederman 2015-03-03  2577  	if (old_limit < limit)
7720c01f3f5901 Eric W. Biederman 2015-03-03  2578  		cp_size = old_limit * sizeof(struct mpls_route *);
7720c01f3f5901 Eric W. Biederman 2015-03-03  2579  
7720c01f3f5901 Eric W. Biederman 2015-03-03  2580  	memcpy(labels, old, cp_size);
7720c01f3f5901 Eric W. Biederman 2015-03-03  2581  
7720c01f3f5901 Eric W. Biederman 2015-03-03  2582  	/* If needed set the predefined labels */
78f5b899195019 Tom Herbert       2015-05-07  2583  	if ((old_limit <= MPLS_LABEL_IPV6NULL) &&
78f5b899195019 Tom Herbert       2015-05-07  2584  	    (limit > MPLS_LABEL_IPV6NULL)) {
78f5b899195019 Tom Herbert       2015-05-07  2585  		RCU_INIT_POINTER(labels[MPLS_LABEL_IPV6NULL], rt2);
7720c01f3f5901 Eric W. Biederman 2015-03-03  2586  		rt2 = NULL;
7720c01f3f5901 Eric W. Biederman 2015-03-03  2587  	}
7720c01f3f5901 Eric W. Biederman 2015-03-03  2588  
78f5b899195019 Tom Herbert       2015-05-07  2589  	if ((old_limit <= MPLS_LABEL_IPV4NULL) &&
78f5b899195019 Tom Herbert       2015-05-07  2590  	    (limit > MPLS_LABEL_IPV4NULL)) {
78f5b899195019 Tom Herbert       2015-05-07  2591  		RCU_INIT_POINTER(labels[MPLS_LABEL_IPV4NULL], rt0);
7720c01f3f5901 Eric W. Biederman 2015-03-03  2592  		rt0 = NULL;
7720c01f3f5901 Eric W. Biederman 2015-03-03  2593  	}
7720c01f3f5901 Eric W. Biederman 2015-03-03  2594  
7720c01f3f5901 Eric W. Biederman 2015-03-03  2595  	/* Update the global pointers */
7720c01f3f5901 Eric W. Biederman 2015-03-03  2596  	net->mpls.platform_labels = limit;
19d0c341d9d5cd Eric W. Biederman 2015-03-07  2597  	rcu_assign_pointer(net->mpls.platform_label, labels);
7720c01f3f5901 Eric W. Biederman 2015-03-03  2598  
7720c01f3f5901 Eric W. Biederman 2015-03-03  2599  	rtnl_unlock();
7720c01f3f5901 Eric W. Biederman 2015-03-03  2600  
7720c01f3f5901 Eric W. Biederman 2015-03-03  2601  	mpls_rt_free(rt2);
7720c01f3f5901 Eric W. Biederman 2015-03-03  2602  	mpls_rt_free(rt0);
7720c01f3f5901 Eric W. Biederman 2015-03-03  2603  
7720c01f3f5901 Eric W. Biederman 2015-03-03  2604  	if (old) {
7720c01f3f5901 Eric W. Biederman 2015-03-03  2605  		synchronize_rcu();
7720c01f3f5901 Eric W. Biederman 2015-03-03  2606  		kvfree(old);
7720c01f3f5901 Eric W. Biederman 2015-03-03  2607  	}
7720c01f3f5901 Eric W. Biederman 2015-03-03  2608  	return 0;
7720c01f3f5901 Eric W. Biederman 2015-03-03  2609  
7720c01f3f5901 Eric W. Biederman 2015-03-03  2610  nort2:
7720c01f3f5901 Eric W. Biederman 2015-03-03  2611  	mpls_rt_free(rt0);
7720c01f3f5901 Eric W. Biederman 2015-03-03  2612  nort0:
7720c01f3f5901 Eric W. Biederman 2015-03-03  2613  	kvfree(labels);
7720c01f3f5901 Eric W. Biederman 2015-03-03  2614  nolabels:
7720c01f3f5901 Eric W. Biederman 2015-03-03  2615  	return -ENOMEM;
7720c01f3f5901 Eric W. Biederman 2015-03-03  2616  }
7720c01f3f5901 Eric W. Biederman 2015-03-03  2617  

:::::: The code at line 2531 was first introduced by commit
:::::: 752ade68cbd81d0321dfecc188f655a945551b25 treewide: use kv[mz]alloc* rather than opencoded variants

:::::: TO: Michal Hocko <mhocko@suse.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
