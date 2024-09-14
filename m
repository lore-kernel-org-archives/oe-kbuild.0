Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FFB1CDFC6
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Sep 2024 18:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726337898; cv=none; b=QNerDbuvEtgtq4TdQHMwAUYsInDBN06dtlOP6yBnat3GvFmOOGmyhV6MmqdMq1lbb6glExr9PDdtVaf4Kld+xmSdllZODeKuZiYAVeUlXqcU8fsJDa+BcdnO1a30iIBVkrocRK7s7iz38FiPQ6IRyw/SBUuwH59RFTE2cay4Z4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726337898; c=relaxed/simple;
	bh=0RaVA7N5faBOU3qLaCa6XKNKBGn5Y2ekW7jm65YPZG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eGsrl9D5jK3gyEcATIWM4b5CCNmOwYH0rqRwsIvpQrTFDOWRQuwuCvoctbfbr7FmZ9Ix+efU2T2OReVytKCjdACjvVERBzIDvh0z/+RQ9Y8jjZtJ7go2TcustMN9Xmo4XDIKlHWlV4hW16BDCNZ1LMzFOLVqeX1Z2bFeNOc3OSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ell9+4ch; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ell9+4ch"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726337896; x=1757873896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0RaVA7N5faBOU3qLaCa6XKNKBGn5Y2ekW7jm65YPZG8=;
  b=Ell9+4choVDrzpuwIFB675NqysWNhyqnKkEmtz6riHQqCCAiWyT5cccT
   kFloCFc9Lk/O0usT2pg/VAeP7xVtQZudIXby/edjNsBOC0DRTFOBHu5JS
   FJZHXR0M+JvYLeM7Ikd23iMvpfp7oVgi0v4uHolceiwQCajlk3+QigdP4
   0lFDAY/1HSse6EHqET9rBDbLo4kDKAvxm/4vSvXiqVNwUrcR9rSwCPwey
   VPKRO4PwywfdVRRYNvqQlsfctNDsBVdvcBpHrogEEXYAEgcqBbGmjMiFJ
   11fUGzaTxMj/xJEOS/6MTmZrlW6vGckk15or/V5WrxWErKqQeHxbWUDzx
   Q==;
X-CSE-ConnectionGUID: OPPFw8yAR6myPtR9VqMUHQ==
X-CSE-MsgGUID: PLOOCa4+TM6nIS8XiihRuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="25050968"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="25050968"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 11:18:16 -0700
X-CSE-ConnectionGUID: Pb7XPo14Q9mvPiADZ6NO7Q==
X-CSE-MsgGUID: GhVi7zZ4ROSXiRX86qVtQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="68399456"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Sep 2024 11:18:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spXLY-00083E-07;
	Sat, 14 Sep 2024 18:18:12 +0000
Date: Sun, 15 Sep 2024 02:18:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-xfs:xfs-zoned-rebase 51/57] fs/xfs/xfs_zone_gc.c:322
 xfs_zone_gc_data_alloc() error: buffer overflow 'data->scratch' 2 <= s32max
Message-ID: <202409150207.qmhcRNcV-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned-rebase
head:   ccc2db4d79624bc274d9879eb76670cad04efeff
commit: e334accc28179d073922768f2deec41758403cf0 [51/57] xfs: support zoned RT devices
:::::: branch date: 33 hours ago
:::::: commit date: 34 hours ago
config: x86_64-randconfig-161-20240914 (https://download.01.org/0day-ci/archive/20240915/202409150207.qmhcRNcV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409150207.qmhcRNcV-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_zone_gc.c:322 xfs_zone_gc_data_alloc() error: buffer overflow 'data->scratch' 2 <= s32max

vim +322 fs/xfs/xfs_zone_gc.c

e334accc28179d Christoph Hellwig 2024-09-10  290  
e334accc28179d Christoph Hellwig 2024-09-10  291  static struct xfs_zone_gc_data *
e334accc28179d Christoph Hellwig 2024-09-10  292  xfs_zone_gc_data_alloc(
e334accc28179d Christoph Hellwig 2024-09-10  293  	struct xfs_mount	*mp)
e334accc28179d Christoph Hellwig 2024-09-10  294  {
e334accc28179d Christoph Hellwig 2024-09-10  295  	struct xfs_zone_gc_data	*data;
e334accc28179d Christoph Hellwig 2024-09-10  296  	int i;
e334accc28179d Christoph Hellwig 2024-09-10  297  
e334accc28179d Christoph Hellwig 2024-09-10  298  	data = kzalloc(sizeof(*data), GFP_KERNEL);
e334accc28179d Christoph Hellwig 2024-09-10  299  	if (!data)
e334accc28179d Christoph Hellwig 2024-09-10  300  		return NULL;
e334accc28179d Christoph Hellwig 2024-09-10  301  
e334accc28179d Christoph Hellwig 2024-09-10  302  	/*
e334accc28179d Christoph Hellwig 2024-09-10  303  	 * We actually only need a single bio_vec.  It would be nice to have
e334accc28179d Christoph Hellwig 2024-09-10  304  	 * a flag that only allocates the inline bvecs and not the separate
e334accc28179d Christoph Hellwig 2024-09-10  305  	 * bvec pool.
e334accc28179d Christoph Hellwig 2024-09-10  306  	 */
e334accc28179d Christoph Hellwig 2024-09-10  307  	if (bioset_init(&data->bio_set, 4, offsetof(struct xfs_gc_bio, bio),
e334accc28179d Christoph Hellwig 2024-09-10  308  			BIOSET_NEED_BVECS))
e334accc28179d Christoph Hellwig 2024-09-10  309  		goto out_free_data;
e334accc28179d Christoph Hellwig 2024-09-10  310  	for (i = 0; i < XFS_ZONE_GC_NR_SCRATCH; i++) {
e334accc28179d Christoph Hellwig 2024-09-10  311  		data->scratch[i].folio =
e334accc28179d Christoph Hellwig 2024-09-10  312  			folio_alloc(GFP_KERNEL, get_order(XFS_GC_CHUNK_SIZE));
e334accc28179d Christoph Hellwig 2024-09-10  313  		if (!data->scratch[i].folio)
e334accc28179d Christoph Hellwig 2024-09-10  314  			goto out_free_scratch;
e334accc28179d Christoph Hellwig 2024-09-10  315  	}
e334accc28179d Christoph Hellwig 2024-09-10  316  	spin_lock_init(&data->list_lock);
e334accc28179d Christoph Hellwig 2024-09-10  317  	data->mp = mp;
e334accc28179d Christoph Hellwig 2024-09-10  318  	return data;
e334accc28179d Christoph Hellwig 2024-09-10  319  
e334accc28179d Christoph Hellwig 2024-09-10  320  out_free_scratch:
e334accc28179d Christoph Hellwig 2024-09-10  321  	while (--i > 0)
e334accc28179d Christoph Hellwig 2024-09-10 @322  		folio_put(data->scratch[i].folio);
e334accc28179d Christoph Hellwig 2024-09-10  323  	bioset_exit(&data->bio_set);
e334accc28179d Christoph Hellwig 2024-09-10  324  out_free_data:
e334accc28179d Christoph Hellwig 2024-09-10  325  	kfree(data);
e334accc28179d Christoph Hellwig 2024-09-10  326  	return NULL;
e334accc28179d Christoph Hellwig 2024-09-10  327  }
e334accc28179d Christoph Hellwig 2024-09-10  328  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
