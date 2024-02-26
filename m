Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF9FEADD
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Feb 2024 05:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708924263; cv=none; b=uH0gFnOzQb2JddkjFKscVucOhnuct4ec8DqU/57qJgtouKnefY8hILxlrVDZHjpQH7Q1So6qnclSirMiac7BgoVTQcuEsD6voGt9/jFL6pwcrTirjjb+6ZEDvFC0IwS05OaNxTe1XCElRYDZe0hZEsX+ZK2EHnkLD1oCNlZdW24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708924263; c=relaxed/simple;
	bh=w1krU8eWV0LZk8u6Trhoe+Kkeg0y7LUfUMlbLxAK1tk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y5vNDouY/J2qJkGKY6hZXemmb3CfTMWWbvjyjldBKKRWytJvDcc0TfbGMzo1X+0WB4UJuDmvPHWLIykVtJK3yR0yslhZDx1z1ihAq/ceF+q0wI5GUJOExL9K+dgwycvUleYbAy4k0Lz5T0Uwz87qBwdeslEebjiN94EMizI0UEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lcNHUlF7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lcNHUlF7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708924261; x=1740460261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w1krU8eWV0LZk8u6Trhoe+Kkeg0y7LUfUMlbLxAK1tk=;
  b=lcNHUlF7C2+6j1KVzuFd9U7rN8m6pbcYgv3M1PZ6o8OqJ7p0vusvyJj5
   wxm8oxpeSoz16p4Yqk/23fmyBK41Ktzqqj6yWEnfP7r+b+xUYYvE3udv1
   wS9lIbk2s8KrF7dn5xbT6LTTMsEzbQ5vtFkWww74/aV3BhdNS+Cqf5Sib
   oZ+qMVFsVwG78hG/pzxLBKu48LyNXHtjUZn6I5uWH9OkiEQoJf8DjZqKD
   cJSL8ck8UX3PtD1ocvGv5Ti7g6MxDan9tRyMcxgofJrDlMo6TIUwzUa/u
   xGMde71d5SrwIYJSvwwF6HXDh7bWJrP3iQoSDP2qEI72eakO1lWZJzst5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="20735847"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="20735847"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 21:10:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6686596"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 25 Feb 2024 21:10:30 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reTFx-000A5S-1F;
	Mon, 26 Feb 2024 05:10:26 +0000
Date: Mon, 26 Feb 2024 13:09:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-xfs:xfs-zoned 38/40] fs/xfs/xfs_zone_gc.c:112
 xfs_zone_gc_data_alloc() error: buffer overflow 'data->scratch' 2 <= s32max
Message-ID: <202402261358.7YHmTvgC-lkp@intel.com>
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

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   4e17b283ae75b62778885e4650d98e417578884e
commit: d1b56952cd4ddd3e67b03cffa9d1bbdccde4030d [38/40] xfs: support zoned RT devices
:::::: branch date: 12 hours ago
:::::: commit date: 23 hours ago
config: loongarch-randconfig-r081-20240225 (https://download.01.org/0day-ci/archive/20240226/202402261358.7YHmTvgC-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402261358.7YHmTvgC-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_zone_gc.c:112 xfs_zone_gc_data_alloc() error: buffer overflow 'data->scratch' 2 <= s32max

Old smatch warnings:
arch/loongarch/include/asm/atomic.h:133 arch_atomic_fetch_add_unless() warn: inconsistent indenting

vim +112 fs/xfs/xfs_zone_gc.c

d1b56952cd4ddd Christoph Hellwig 2024-02-25   80  
d1b56952cd4ddd Christoph Hellwig 2024-02-25   81  static struct xfs_zone_gc_data *
d1b56952cd4ddd Christoph Hellwig 2024-02-25   82  xfs_zone_gc_data_alloc(
d1b56952cd4ddd Christoph Hellwig 2024-02-25   83  	struct xfs_mount	*mp)
d1b56952cd4ddd Christoph Hellwig 2024-02-25   84  {
d1b56952cd4ddd Christoph Hellwig 2024-02-25   85  	struct xfs_zone_gc_data	*data;
d1b56952cd4ddd Christoph Hellwig 2024-02-25   86  	int i;
d1b56952cd4ddd Christoph Hellwig 2024-02-25   87  
d1b56952cd4ddd Christoph Hellwig 2024-02-25   88  	data = kzalloc(sizeof(*data), GFP_KERNEL);
d1b56952cd4ddd Christoph Hellwig 2024-02-25   89  	if (!data)
d1b56952cd4ddd Christoph Hellwig 2024-02-25   90  		return NULL;
d1b56952cd4ddd Christoph Hellwig 2024-02-25   91  
d1b56952cd4ddd Christoph Hellwig 2024-02-25   92  	/*
d1b56952cd4ddd Christoph Hellwig 2024-02-25   93  	 * We actually only need a single bio_vec.  It would be nice to have
d1b56952cd4ddd Christoph Hellwig 2024-02-25   94  	 * a flag that only allocates the inline bvecs and not the separate
d1b56952cd4ddd Christoph Hellwig 2024-02-25   95  	 * bvec pool.
d1b56952cd4ddd Christoph Hellwig 2024-02-25   96  	 */
d1b56952cd4ddd Christoph Hellwig 2024-02-25   97  	if (bioset_init(&data->bio_set, 4, offsetof(struct xfs_gc_bio, bio),
d1b56952cd4ddd Christoph Hellwig 2024-02-25   98  			BIOSET_NEED_BVECS))
d1b56952cd4ddd Christoph Hellwig 2024-02-25   99  		goto out_free_data;
d1b56952cd4ddd Christoph Hellwig 2024-02-25  100  	for (i = 0; i < XFS_ZONE_GC_NR_SCRATCH; i++) {
d1b56952cd4ddd Christoph Hellwig 2024-02-25  101  		data->scratch[i].folio =
d1b56952cd4ddd Christoph Hellwig 2024-02-25  102  			folio_alloc(GFP_KERNEL, get_order(XFS_GC_CHUNK_SIZE));
d1b56952cd4ddd Christoph Hellwig 2024-02-25  103  		if (!data->scratch[i].folio)
d1b56952cd4ddd Christoph Hellwig 2024-02-25  104  			goto out_free_scratch;
d1b56952cd4ddd Christoph Hellwig 2024-02-25  105  	}
d1b56952cd4ddd Christoph Hellwig 2024-02-25  106  	spin_lock_init(&data->list_lock);
d1b56952cd4ddd Christoph Hellwig 2024-02-25  107  	data->mp = mp;
d1b56952cd4ddd Christoph Hellwig 2024-02-25  108  	return data;
d1b56952cd4ddd Christoph Hellwig 2024-02-25  109  
d1b56952cd4ddd Christoph Hellwig 2024-02-25  110  out_free_scratch:
d1b56952cd4ddd Christoph Hellwig 2024-02-25  111  	while (--i > 0)
d1b56952cd4ddd Christoph Hellwig 2024-02-25 @112  		folio_put(data->scratch[i].folio);
d1b56952cd4ddd Christoph Hellwig 2024-02-25  113  	bioset_exit(&data->bio_set);
d1b56952cd4ddd Christoph Hellwig 2024-02-25  114  out_free_data:
d1b56952cd4ddd Christoph Hellwig 2024-02-25  115  	kfree(data);
d1b56952cd4ddd Christoph Hellwig 2024-02-25  116  	return NULL;
d1b56952cd4ddd Christoph Hellwig 2024-02-25  117  }
d1b56952cd4ddd Christoph Hellwig 2024-02-25  118  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
