Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549D91FA8E9
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Dec 2024 18:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734545537; cv=none; b=M0TUo7Bt46JajF5jr7s6Nx8eZX3tlrbp+XtjSDy+uB9gTWoszrntyeaWM+I71ts1dwFL+uxvCTytDnDlUKV6vOIbzWBWgarOFnmxtHrzEjhW6Zymk7e4LKQJVKqVAB+3atpJMItF1bKCU2q9Yg65YtApM9LyOqEL1bul1MtjysQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734545537; c=relaxed/simple;
	bh=f59vC6zv8IlnPPbwS6NOxpiFbZlN3vuyNy4AOQXCDC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JULIY68gkfpS6nYo4MYwy/IPUpAJj2mvIhe/d4gYJrzbb6CBnanZA18VdTcwRuWdUXx9XmBz3/QIwbAQMmnwp1RrK6A/aiSI9vSJDjU75aFWWX048t071+qVBsefonV6kP6HTiqvaAc3siwGRXxKziJ7+bycqIjTteGFYHHRK7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=caGNo/Xw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="caGNo/Xw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734545535; x=1766081535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f59vC6zv8IlnPPbwS6NOxpiFbZlN3vuyNy4AOQXCDC0=;
  b=caGNo/Xw+F43cwx+fP9j+z4QGnpkuAtryoOHIme0QmKhP1aQbmW2M1TY
   24ZH7w/5gBUZLrSSuqbGG05ezizreh24tOcWfNWbXiHw8Q6lEiSA5pqvU
   cJVolf4wq66JDA0+T2MNHegmW/W7s2LGItjQ2OL6EZ2/ELV/NKhjUHoHN
   X+ASlDzojqXSrKr5wh3XykM+c4v+5vvdZHsTEfkYAWxChm2SXGYaLw8GX
   BzRJ6xac4xPQ3RH0qwqJz7Y0C/amSrkZajisB2f9tav7RItWuf3dnYiC4
   0uZjXs7lpon/9ADGaUFwPyy/JvqUzxMPCtgI8os4iaq9wpZSi+HLdC5Ia
   w==;
X-CSE-ConnectionGUID: 82tu8Xm4TU+u12x6tN7DiA==
X-CSE-MsgGUID: 9xxJtNFcTO+nVgtxuDGF8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="46044747"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="46044747"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 10:12:15 -0800
X-CSE-ConnectionGUID: qIJensgcSvqHLDKOT5YSsA==
X-CSE-MsgGUID: dxQ0rfTXSSWLqkGh3klI/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="98179950"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Dec 2024 10:12:13 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNyWp-000GXg-00;
	Wed, 18 Dec 2024 18:12:11 +0000
Date: Thu, 19 Dec 2024 02:11:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-xfs:xfs-zoned-rebase 5/53] fs/iomap/ioend.c:69
 iomap_split_ioend() warn: passing zero to 'ERR_CAST'
Message-ID: <202412190204.T8rLMK28-lkp@intel.com>
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
head:   69e1b78ac115f502b16c5f2aa1dae24d23f05901
commit: edcbea1a78ba35ed88438ff0d45c8f136804a5a3 [5/53] iomap: split bios to zone append limits in the submission handlers
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: i386-randconfig-141-20241218 (https://download.01.org/0day-ci/archive/20241219/202412190204.T8rLMK28-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412190204.T8rLMK28-lkp@intel.com/

smatch warnings:
fs/iomap/ioend.c:69 iomap_split_ioend() warn: passing zero to 'ERR_CAST'

vim +/ERR_CAST +69 fs/iomap/ioend.c

edcbea1a78ba35 Christoph Hellwig 2024-11-24  24  
edcbea1a78ba35 Christoph Hellwig 2024-11-24  25  /*
edcbea1a78ba35 Christoph Hellwig 2024-11-24  26   * Split up to the first @max_len bytes from @ioend if the ioend covers more
edcbea1a78ba35 Christoph Hellwig 2024-11-24  27   * than @max_len bytes.
edcbea1a78ba35 Christoph Hellwig 2024-11-24  28   *
edcbea1a78ba35 Christoph Hellwig 2024-11-24  29   * If @is_append is set, the split will be based on the hardware limits for
edcbea1a78ba35 Christoph Hellwig 2024-11-24  30   * REQ_OP_ZONE_APPEND commands and can be less than @max_len if the hardware
edcbea1a78ba35 Christoph Hellwig 2024-11-24  31   * limits don't allow the entire @max_len length.
edcbea1a78ba35 Christoph Hellwig 2024-11-24  32   *
edcbea1a78ba35 Christoph Hellwig 2024-11-24  33   * The bio embedded into @ioend must be a REQ_OP_WRITE because the block layer
edcbea1a78ba35 Christoph Hellwig 2024-11-24  34   * does not allow splitting REQ_OP_ZONE_APPEND bios.  The file systems has to
edcbea1a78ba35 Christoph Hellwig 2024-11-24  35   * switch the operation after this call, but before submitting the bio.
edcbea1a78ba35 Christoph Hellwig 2024-11-24  36   */
edcbea1a78ba35 Christoph Hellwig 2024-11-24  37  struct iomap_ioend *iomap_split_ioend(struct iomap_ioend *ioend,
edcbea1a78ba35 Christoph Hellwig 2024-11-24  38  		unsigned int max_len, bool is_append)
edcbea1a78ba35 Christoph Hellwig 2024-11-24  39  {
edcbea1a78ba35 Christoph Hellwig 2024-11-24  40  	struct bio *bio = &ioend->io_bio;
edcbea1a78ba35 Christoph Hellwig 2024-11-24  41  	struct iomap_ioend *split_ioend;
edcbea1a78ba35 Christoph Hellwig 2024-11-24  42  	unsigned int nr_segs;
edcbea1a78ba35 Christoph Hellwig 2024-11-24  43  	int sector_offset;
edcbea1a78ba35 Christoph Hellwig 2024-11-24  44  	struct bio *split;
edcbea1a78ba35 Christoph Hellwig 2024-11-24  45  
edcbea1a78ba35 Christoph Hellwig 2024-11-24  46  	if (is_append) {
edcbea1a78ba35 Christoph Hellwig 2024-11-24  47  		struct queue_limits *lim = bdev_limits(bio->bi_bdev);
edcbea1a78ba35 Christoph Hellwig 2024-11-24  48  
edcbea1a78ba35 Christoph Hellwig 2024-11-24  49  		max_len = min(max_len,
edcbea1a78ba35 Christoph Hellwig 2024-11-24  50  			      lim->max_zone_append_sectors << SECTOR_SHIFT);
edcbea1a78ba35 Christoph Hellwig 2024-11-24  51  
edcbea1a78ba35 Christoph Hellwig 2024-11-24  52  		sector_offset = bio_split_rw_at(bio, lim, &nr_segs, max_len);
edcbea1a78ba35 Christoph Hellwig 2024-11-24  53  		if (unlikely(sector_offset < 0))
edcbea1a78ba35 Christoph Hellwig 2024-11-24  54  			return ERR_PTR(sector_offset);
edcbea1a78ba35 Christoph Hellwig 2024-11-24  55  		if (!sector_offset)
edcbea1a78ba35 Christoph Hellwig 2024-11-24  56  			return NULL;
edcbea1a78ba35 Christoph Hellwig 2024-11-24  57  	} else {
edcbea1a78ba35 Christoph Hellwig 2024-11-24  58  		if (bio->bi_iter.bi_size <= max_len)
edcbea1a78ba35 Christoph Hellwig 2024-11-24  59  			return NULL;
edcbea1a78ba35 Christoph Hellwig 2024-11-24  60  		sector_offset = max_len >> SECTOR_SHIFT;
edcbea1a78ba35 Christoph Hellwig 2024-11-24  61  	}
edcbea1a78ba35 Christoph Hellwig 2024-11-24  62  
edcbea1a78ba35 Christoph Hellwig 2024-11-24  63  	/* ensure the split ioend is still block size aligned */
edcbea1a78ba35 Christoph Hellwig 2024-11-24  64  	sector_offset = ALIGN_DOWN(sector_offset << SECTOR_SHIFT,
edcbea1a78ba35 Christoph Hellwig 2024-11-24  65  			i_blocksize(ioend->io_inode)) >> SECTOR_SHIFT;
edcbea1a78ba35 Christoph Hellwig 2024-11-24  66  
edcbea1a78ba35 Christoph Hellwig 2024-11-24  67  	split = bio_split(bio, sector_offset, GFP_NOFS, &iomap_ioend_bioset);
edcbea1a78ba35 Christoph Hellwig 2024-11-24  68  	if (IS_ERR_OR_NULL(split))
edcbea1a78ba35 Christoph Hellwig 2024-11-24 @69  		return ERR_CAST(split);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
