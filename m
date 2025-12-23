Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AE8482EB
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 14:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766499567; cv=none; b=pE1iUp8kMauq0QU8ZHmTHtNyB12U1jObn7q4Jf2wHjO37Gsh6kRQyLQx8nkM2OUO2R67mobEHPqRqUGR69AT+LYyPJzm4cVxhKfQGbFI+N/KbwW+qd5Z6FlcenqoaPD5D5vjXD2Hx4E358i4VfKedhm/KItS9q+IduQr+N7J9qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766499567; c=relaxed/simple;
	bh=+Up7Nt1UgcCsPJnGwlTcwbfIWbzRg+x8Q3U9SE3x3Zw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=obmox2EOWAnkspFAO5HO+X57a9wuR+bl1S5Upvgt3keDl4A1uw/Nwv/6yydioJlNwUspSuUH1f4LyT1p+nnZd+8YDVm4eDFWcXKph3P2mYxh8371Koi3wpxTjcZ1FL4CO7uGXC1gk9thX6PbAp8fpqBnPvuyT7x2IIzcQBBzMKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZQkRKolX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZQkRKolX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766499565; x=1798035565;
  h=date:from:to:cc:subject:message-id;
  bh=+Up7Nt1UgcCsPJnGwlTcwbfIWbzRg+x8Q3U9SE3x3Zw=;
  b=ZQkRKolXRNKNk2aOTJe99m83A9SblMpZ/KPwX4h1qUC3/TivzVfqwgYU
   SJQekB57KSFbl40E/WnV7bruB7jTKEc/C5CcmP6VJXaUaG9yPUJVK0p1p
   rOagYLvRb+QCvR9sDry5qpXYmzIu9QQUw/Z3+iD1bn6QgWGPMjAmKDlOS
   9YHTQ9mB7qcrdHjux7NsZa5dST/01sThSznkBT9yO0YiUUKoAypPDsGtb
   IKUkyAose3DouPhY90NLuvcaajs1DvP3rc/a3NNjx31fthp3U+hasM4rq
   lBg0qf34qXnPedimuwkIcxe47r0c/CpLSZQsKV4E/62kOMr1kab+9yYm6
   A==;
X-CSE-ConnectionGUID: EKwV/PGCRiyDA7a/Lg6GHQ==
X-CSE-MsgGUID: +nAWhZ5oRUCOonUczYW3zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68103113"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="68103113"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 06:19:24 -0800
X-CSE-ConnectionGUID: lriS6YOJR4mevDzXdJY4yg==
X-CSE-MsgGUID: t25I4nWvTFqh2Cxyvzy1eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="200696049"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 23 Dec 2025 06:19:23 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY3EO-00000000219-3YMa;
	Tue, 23 Dec 2025 14:19:20 +0000
Date: Tue, 23 Dec 2025 22:17:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [gfs2:bio-cleanups 10/17] drivers/nvme/host/core.c:3941
 nvme_alloc_ns_head() warn: passing zero to 'ERR_PTR'
Message-ID: <202512232206.uwbn93HI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: gfs2@lists.linux.dev
TO: Andreas Gruenbacher <agruenba@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git bio-cleanups
head:   e78dbad88b9429cb8fc8317ab11ed977eebaccd7
commit: 9d5e6b0ecd588d584a9fdedbce1a266c26748cb8 [10/17] block: optimize blk_status <=> errno conversion
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: powerpc-randconfig-r072-20251223 (https://download.01.org/0day-ci/archive/20251223/202512232206.uwbn93HI-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512232206.uwbn93HI-lkp@intel.com/

New smatch warnings:
drivers/nvme/host/core.c:3941 nvme_alloc_ns_head() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
drivers/nvme/host/core.c:5033 nvme_free_cels() warn: iterator 'i' not incremented

vim +/ERR_PTR +3941 drivers/nvme/host/core.c

f333444708f82c Christoph Hellwig 2018-09-11  3895  
f333444708f82c Christoph Hellwig 2018-09-11  3896  	head = kzalloc(size, GFP_KERNEL);
ed754e5deeb17f Christoph Hellwig 2017-11-09  3897  	if (!head)
ed754e5deeb17f Christoph Hellwig 2017-11-09  3898  		goto out;
8b850475c08caa Sagi Grimberg     2022-02-14  3899  	ret = ida_alloc_min(&ctrl->subsys->ns_ida, 1, GFP_KERNEL);
ed754e5deeb17f Christoph Hellwig 2017-11-09  3900  	if (ret < 0)
ed754e5deeb17f Christoph Hellwig 2017-11-09  3901  		goto out_free_head;
ed754e5deeb17f Christoph Hellwig 2017-11-09  3902  	head->instance = ret;
ed754e5deeb17f Christoph Hellwig 2017-11-09  3903  	INIT_LIST_HEAD(&head->list);
fd92c77f58257a Max Gurtovoy      2018-04-12  3904  	ret = init_srcu_struct(&head->srcu);
fd92c77f58257a Max Gurtovoy      2018-04-12  3905  	if (ret)
fd92c77f58257a Max Gurtovoy      2018-04-12  3906  		goto out_ida_remove;
ed754e5deeb17f Christoph Hellwig 2017-11-09  3907  	head->subsys = ctrl->subsys;
1a893c2bfef46a Christoph Hellwig 2022-07-22  3908  	head->ns_id = info->nsid;
1a893c2bfef46a Christoph Hellwig 2022-07-22  3909  	head->ids = info->ids;
1a893c2bfef46a Christoph Hellwig 2022-07-22  3910  	head->shared = info->is_shared;
1d811438851bae Wang Yugui        2024-10-10  3911  	head->rotational = info->is_rotational;
a1a825ab6a6038 Daniel Wagner     2023-12-18  3912  	ratelimit_state_init(&head->rs_nuse, 5 * HZ, 1);
a1a825ab6a6038 Daniel Wagner     2023-12-18  3913  	ratelimit_set_flags(&head->rs_nuse, RATELIMIT_MSG_ON_RELEASE);
ed754e5deeb17f Christoph Hellwig 2017-11-09  3914  	kref_init(&head->ref);
ed754e5deeb17f Christoph Hellwig 2017-11-09  3915  
be93e87e780253 Keith Busch       2020-06-29  3916  	if (head->ids.csi) {
be93e87e780253 Keith Busch       2020-06-29  3917  		ret = nvme_get_effects_log(ctrl, head->ids.csi, &head->effects);
be93e87e780253 Keith Busch       2020-06-29  3918  		if (ret)
be93e87e780253 Keith Busch       2020-06-29  3919  			goto out_cleanup_srcu;
be93e87e780253 Keith Busch       2020-06-29  3920  	} else
be93e87e780253 Keith Busch       2020-06-29  3921  		head->effects = ctrl->effects;
be93e87e780253 Keith Busch       2020-06-29  3922  
32acab3181c705 Christoph Hellwig 2017-11-02  3923  	ret = nvme_mpath_alloc_disk(ctrl, head);
32acab3181c705 Christoph Hellwig 2017-11-02  3924  	if (ret)
32acab3181c705 Christoph Hellwig 2017-11-02  3925  		goto out_cleanup_srcu;
32acab3181c705 Christoph Hellwig 2017-11-02  3926  
ed754e5deeb17f Christoph Hellwig 2017-11-09  3927  	list_add_tail(&head->entry, &ctrl->subsys->nsheads);
12d9f07022dcde Jianchao Wang     2018-05-04  3928  
12d9f07022dcde Jianchao Wang     2018-05-04  3929  	kref_get(&ctrl->subsys->ref);
12d9f07022dcde Jianchao Wang     2018-05-04  3930  
ed754e5deeb17f Christoph Hellwig 2017-11-09  3931  	return head;
ed754e5deeb17f Christoph Hellwig 2017-11-09  3932  out_cleanup_srcu:
ed754e5deeb17f Christoph Hellwig 2017-11-09  3933  	cleanup_srcu_struct(&head->srcu);
fd92c77f58257a Max Gurtovoy      2018-04-12  3934  out_ida_remove:
8b850475c08caa Sagi Grimberg     2022-02-14  3935  	ida_free(&ctrl->subsys->ns_ida, head->instance);
ed754e5deeb17f Christoph Hellwig 2017-11-09  3936  out_free_head:
ed754e5deeb17f Christoph Hellwig 2017-11-09  3937  	kfree(head);
ed754e5deeb17f Christoph Hellwig 2017-11-09  3938  out:
538af88ea7d9de Sagi Grimberg     2019-08-02  3939  	if (ret > 0)
538af88ea7d9de Sagi Grimberg     2019-08-02  3940  		ret = blk_status_to_errno(nvme_error_status(ret));
ed754e5deeb17f Christoph Hellwig 2017-11-09 @3941  	return ERR_PTR(ret);
ed754e5deeb17f Christoph Hellwig 2017-11-09  3942  }
ed754e5deeb17f Christoph Hellwig 2017-11-09  3943  

:::::: The code at line 3941 was first introduced by commit
:::::: ed754e5deeb17f4e675c84e4b6c640cc7344e498 nvme: track shared namespaces

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
