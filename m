Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B400849C
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Sep 2025 06:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758780651; cv=none; b=Q08LFSIFQIJRyyDKgh3Idpp4Y40iTf6n61rkmSgYKKOEPboNkT03EeasMyPLqMUKZgGtkJDZLRm9oI2m5GP8LtRmcfWeHoJ0RmRuDkdy4CiU3wRJvykZM1X4dxxhR7O/oGRYTYORb0y4uFbGwvvugDJyPxUPyAeAKTuIa9LEooc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758780651; c=relaxed/simple;
	bh=/A5azENy75fHdhtH4TwZlZwODLfr6p0veaq1uSmtdcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sbiIkInZ5TUYKtyaK/zQgeVRLN08rPxckcz/ectIrOwI5PlnCSYxGEGGp2DLFJZw+PYsih1EtsF+qJcseulwvfEM902G6rz1VNKHIgakac+DJ3N8e0BzTLNnUtC6tlGvijuL6gZX8EPV1l5mbs3sicWkQ3GANZ4KrX78oeWHdnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gxWQWwTr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gxWQWwTr"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46e2562e8cbso4683905e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 24 Sep 2025 23:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758780647; x=1759385447; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ClpT2HPoDa5jl/eHQe7heLtiwAm/J+kpez0x7BlPj90=;
        b=gxWQWwTrN/WcACKWBBQys2S4C93LtUDrFQMZWvF0We1wNLAmu/Tq+7dwuiS7uma+Bf
         IUopTwI9CUXARe2xBqfnrkM7hgQwyTyLoqsb7icvPG7akXFHD+/H7K2s0jpynelQRiw4
         wj4710LpZxe5iVysG5HdBAEP0jzMbC3ykkWxy3RvlH0vMwFt4BQ+aQ940v3J9BJyo408
         ke/sHlreNbl/DYfQaHU9rMTLfulnH+dM0PHEjECUTEDPGn35Qf9gaZQjsghi3Suwyzmy
         YJcy7YevOBjPvJGPQWf+qfJpxXm6+7EKGQ763QWpd2dpT9m1zfJbf2/chFirnu0UGluw
         RmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758780647; x=1759385447;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ClpT2HPoDa5jl/eHQe7heLtiwAm/J+kpez0x7BlPj90=;
        b=Xy612eoH/ceHV4POlwbwVsmaF5UQTasdKsTnREmGNXTPQQ8hQt6mnrio6XG7W432p/
         11QmfdkcAFSdYh/pjkaXbTxG7YeeoC76yLoaQKJh3Rqaf2LcOCYYQ0daz1vBsnX13o5Q
         JnluII2elAkEoYrlf8flGW7eIIZql2e+f7auE7ahOjM/00Ju46PVg3ndxo1ywZobUM4T
         oDJKfjgmVRqpkyt6hnbddZBPWtPkA8hVTzkxzKDRPNTR9AeNReANgu/pjAOv5dApzALa
         f2XbM7UzV4sAujgl/MFGO+0PoDBqEhJ6YWTJr+dQ+CUZPAV2dblz3iBVsPNmGgpvm4J0
         RLGA==
X-Gm-Message-State: AOJu0Yx+Wd8vqxEC5ptOiRMJ0llnerIt4Bl6gyPpBCj06BQ7ivUaBAZo
	DAJ/tnR+ltrlmnGDw5R6HwQUcEa8xs5tmobRCl8N84fyIKNIW53jK+xTCvglJ9/mhTHCJGnX1XA
	xkIz7
X-Gm-Gg: ASbGnctsUHkN8R51jPhn8wbBsUckQXb5JQmc0FhKL9OT203dxsBjlHGDlch1PR9hIGm
	etpf9Y3PiE2Su5kF/WpEZGKH9ljsGAT6GFN4GX4pX4Pjc7aQFbaiinE29rx4/fVESi874iUIWnl
	VAPID1glnZMagljONDQ//cp/P4kDdjuOHbgvQqFiR1PTU4ZUe7xfL7d+AgwRUzlTQ1XV04HknZG
	XTodk8X87KevK3r1CzbDLw9NIDD7VM3dEYl8AYOPrDJFi9JVWvXo7MSsJK+UJD0pRDOuFrzd2qB
	sBEj71JStKqspRhUX+m8bi1gfjmWAV7BBaUGJ3sDJWHvTohIR99jrkRotbyEJjV4N5FuBHOHcck
	fropC8CBDtyihce55DnV5EFUnohU=
X-Google-Smtp-Source: AGHT+IFa77m8x7ZOSKxqVy7k9ZpC8FvBjzk/j7HoydRbNcW4lvCJobv/tZNJb9yt47RqP11Rxx+lMg==
X-Received: by 2002:a05:600c:1d16:b0:46d:fd71:f69 with SMTP id 5b1f17b1804b1-46e329bd6a7mr18607035e9.14.1758780647424;
        Wed, 24 Sep 2025 23:10:47 -0700 (PDT)
Received: from localhost ([41.210.143.179])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-40fb871d051sm1507927f8f.14.2025.09.24.23.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:10:46 -0700 (PDT)
Date: Thu, 25 Sep 2025 09:10:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Qu Wenruo <wqu@suse.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	David Sterba <dsterba@suse.com>
Subject: [linux-next:master 11380/12207] fs/btrfs/extent_io.c:401
 find_lock_delalloc_range() error: we previously assumed 'fs_info' could be
 null (see line 378)
Message-ID: <202509250925.4L4JQTtn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250925061042.D1Y4lL2CN_A6NeLhJLP1c9kRv3WySqMdWWHnwHB8LbE@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b5a4da2c459f79a2c87c867398f1c0c315779781
commit: 7b26da407420e5054e3f06c5d13271697add9423 [11380/12207] btrfs: fix the incorrect max_bytes value for find_lock_delalloc_range()
config: i386-randconfig-141-20250925 (https://download.01.org/0day-ci/archive/20250925/202509250925.4L4JQTtn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509250925.4L4JQTtn-lkp@intel.com/

smatch warnings:
fs/btrfs/extent_io.c:401 find_lock_delalloc_range() error: we previously assumed 'fs_info' could be null (see line 378)

vim +/fs_info +401 fs/btrfs/extent_io.c

ce9f967f31ea91 Johannes Thumshirn 2018-11-19  368  EXPORT_FOR_TESTS
3522e90301d7a6 Lu Fengqi          2018-11-29  369  noinline_for_stack bool find_lock_delalloc_range(struct inode *inode,
c987f1e6d4435a Josef Bacik        2024-07-24  370  						 struct folio *locked_folio,
c987f1e6d4435a Josef Bacik        2024-07-24  371  						 u64 *start, u64 *end)
c8b978188c9a0f Chris Mason        2008-10-29  372  {
41044b41ad2c8c David Sterba       2023-09-14  373  	struct btrfs_fs_info *fs_info = inode_to_fs_info(inode);
9978059be8a1af Goldwyn Rodrigues  2019-06-21  374  	struct extent_io_tree *tree = &BTRFS_I(inode)->io_tree;
2749f7ef3643fe Qu Wenruo          2021-09-27  375  	const u64 orig_start = *start;
2749f7ef3643fe Qu Wenruo          2021-09-27  376  	const u64 orig_end = *end;
f7b12a62f008a3 Naohiro Aota       2022-07-09  377  	/* The sanity tests may not set a valid fs_info. */
f7b12a62f008a3 Naohiro Aota       2022-07-09 @378  	u64 max_bytes = fs_info ? fs_info->max_extent_size : BTRFS_MAX_EXTENT_SIZE;
                                                                        ^^^^^^^
NULL check

c8b978188c9a0f Chris Mason        2008-10-29  379  	u64 delalloc_start;
c8b978188c9a0f Chris Mason        2008-10-29  380  	u64 delalloc_end;
3522e90301d7a6 Lu Fengqi          2018-11-29  381  	bool found;
9655d2982b53fd Chris Mason        2009-09-02  382  	struct extent_state *cached_state = NULL;
c8b978188c9a0f Chris Mason        2008-10-29  383  	int ret;
c8b978188c9a0f Chris Mason        2008-10-29  384  	int loops = 0;
c8b978188c9a0f Chris Mason        2008-10-29  385  
2749f7ef3643fe Qu Wenruo          2021-09-27  386  	/* Caller should pass a valid @end to indicate the search range end */
2749f7ef3643fe Qu Wenruo          2021-09-27  387  	ASSERT(orig_end > orig_start);
2749f7ef3643fe Qu Wenruo          2021-09-27  388  
c987f1e6d4435a Josef Bacik        2024-07-24  389  	/* The range should at least cover part of the folio */
55cd57faa50346 David Sterba       2025-06-10  390  	ASSERT(!(orig_start >= folio_end(locked_folio) ||
c987f1e6d4435a Josef Bacik        2024-07-24  391  		 orig_end <= folio_pos(locked_folio)));
c8b978188c9a0f Chris Mason        2008-10-29  392  again:
c8b978188c9a0f Chris Mason        2008-10-29  393  	/* step one, find a bunch of delalloc bytes starting at start */
c8b978188c9a0f Chris Mason        2008-10-29  394  	delalloc_start = *start;
c8b978188c9a0f Chris Mason        2008-10-29  395  	delalloc_end = 0;
7b26da407420e5 Qu Wenruo          2025-09-19  396  
7b26da407420e5 Qu Wenruo          2025-09-19  397  	/*
7b26da407420e5 Qu Wenruo          2025-09-19  398  	 * If @max_bytes is smaller than a block, btrfs_find_delalloc_range() can
7b26da407420e5 Qu Wenruo          2025-09-19  399  	 * return early without handling any dirty ranges.
7b26da407420e5 Qu Wenruo          2025-09-19  400  	 */
7b26da407420e5 Qu Wenruo          2025-09-19 @401  	ASSERT(max_bytes >= fs_info->sectorsize);
                                                                            ^^^^^^^^^^^^^^^^^^^
Unchecked dereference

7b26da407420e5 Qu Wenruo          2025-09-19  402  
083e75e7e6a9e2 Josef Bacik        2019-09-23  403  	found = btrfs_find_delalloc_range(tree, &delalloc_start, &delalloc_end,
c2a128d28a2e78 Josef Bacik        2010-02-02  404  					  max_bytes, &cached_state);
2749f7ef3643fe Qu Wenruo          2021-09-27  405  	if (!found || delalloc_end <= *start || delalloc_start > orig_end) {
c8b978188c9a0f Chris Mason        2008-10-29  406  		*start = delalloc_start;
2749f7ef3643fe Qu Wenruo          2021-09-27  407  
2749f7ef3643fe Qu Wenruo          2021-09-27  408  		/* @delalloc_end can be -1, never go beyond @orig_end */
2749f7ef3643fe Qu Wenruo          2021-09-27  409  		*end = min(delalloc_end, orig_end);
b351161f4f6643 Filipe Manana      2025-04-04  410  		btrfs_free_extent_state(cached_state);
3522e90301d7a6 Lu Fengqi          2018-11-29  411  		return false;
c8b978188c9a0f Chris Mason        2008-10-29  412  	}
c8b978188c9a0f Chris Mason        2008-10-29  413  
70b99e6959a4c2 Chris Mason        2008-10-31  414  	/*
c987f1e6d4435a Josef Bacik        2024-07-24  415  	 * start comes from the offset of locked_folio.  We have to lock
c987f1e6d4435a Josef Bacik        2024-07-24  416  	 * folios in order, so we can't process delalloc bytes before
c987f1e6d4435a Josef Bacik        2024-07-24  417  	 * locked_folio
70b99e6959a4c2 Chris Mason        2008-10-31  418  	 */
d397712bcc6a75 Chris Mason        2009-01-05  419  	if (delalloc_start < *start)
70b99e6959a4c2 Chris Mason        2008-10-31  420  		delalloc_start = *start;
70b99e6959a4c2 Chris Mason        2008-10-31  421  
c8b978188c9a0f Chris Mason        2008-10-29  422  	/*
c987f1e6d4435a Josef Bacik        2024-07-24  423  	 * make sure to limit the number of folios we try to lock down
c8b978188c9a0f Chris Mason        2008-10-29  424  	 */
7bf811a595a895 Josef Bacik        2013-10-07  425  	if (delalloc_end + 1 - delalloc_start > max_bytes)
7bf811a595a895 Josef Bacik        2013-10-07  426  		delalloc_end = delalloc_start + max_bytes - 1;
d397712bcc6a75 Chris Mason        2009-01-05  427  
17dc82dc1e77a6 David Sterba       2025-08-22  428  	/* step two, lock all the folios after the folios that has start */
e4d80ebe50de25 Josef Bacik        2024-07-24  429  	ret = lock_delalloc_folios(inode, locked_folio, delalloc_start,
e4d80ebe50de25 Josef Bacik        2024-07-24  430  				   delalloc_end);
9bfd61d9755a51 Nikolay Borisov    2018-10-26  431  	ASSERT(!ret || ret == -EAGAIN);
c8b978188c9a0f Chris Mason        2008-10-29  432  	if (ret == -EAGAIN) {
7b26da407420e5 Qu Wenruo          2025-09-19  433  		/*
7b26da407420e5 Qu Wenruo          2025-09-19  434  		 * Some of the folios are gone, lets avoid looping by
7b26da407420e5 Qu Wenruo          2025-09-19  435  		 * shortening the size of the delalloc range we're searching.
c8b978188c9a0f Chris Mason        2008-10-29  436  		 */
b351161f4f6643 Filipe Manana      2025-04-04  437  		btrfs_free_extent_state(cached_state);
7d78874273463a Chris Mason        2014-05-21  438  		cached_state = NULL;
c8b978188c9a0f Chris Mason        2008-10-29  439  		if (!loops) {
7b26da407420e5 Qu Wenruo          2025-09-19  440  			max_bytes = fs_info->sectorsize;
                                                                                    ^^^^^^^^^^^^^^^^^^^
Here too, I suppose.

c8b978188c9a0f Chris Mason        2008-10-29  441  			loops = 1;
c8b978188c9a0f Chris Mason        2008-10-29  442  			goto again;
c8b978188c9a0f Chris Mason        2008-10-29  443  		} else {
3522e90301d7a6 Lu Fengqi          2018-11-29  444  			found = false;
c8b978188c9a0f Chris Mason        2008-10-29  445  			goto out_failed;
c8b978188c9a0f Chris Mason        2008-10-29  446  		}
c8b978188c9a0f Chris Mason        2008-10-29  447  	}
c8b978188c9a0f Chris Mason        2008-10-29  448  
c8b978188c9a0f Chris Mason        2008-10-29  449  	/* step three, lock the state bits for the whole range */
242570e80bfdf3 Filipe Manana      2025-03-31  450  	btrfs_lock_extent(tree, delalloc_start, delalloc_end, &cached_state);
c8b978188c9a0f Chris Mason        2008-10-29  451  
c8b978188c9a0f Chris Mason        2008-10-29  452  	/* then test to make sure it is all still delalloc */
f81c2aea711205 Filipe Manana      2025-04-04  453  	ret = btrfs_test_range_bit(tree, delalloc_start, delalloc_end,
893fe243999466 David Sterba       2020-08-14  454  				   EXTENT_DELALLOC, cached_state);
c0707c9e1e36d5 Josef Bacik        2024-02-12  455  
242570e80bfdf3 Filipe Manana      2025-03-31  456  	btrfs_unlock_extent(tree, delalloc_start, delalloc_end, &cached_state);
c8b978188c9a0f Chris Mason        2008-10-29  457  	if (!ret) {
2b41599bff1714 David Sterba       2025-01-09  458  		unlock_delalloc_folio(inode, locked_folio, delalloc_start,
79be4a28d834ea Josef Bacik        2024-07-24  459  				      delalloc_end);
c8b978188c9a0f Chris Mason        2008-10-29  460  		cond_resched();
c8b978188c9a0f Chris Mason        2008-10-29  461  		goto again;
c8b978188c9a0f Chris Mason        2008-10-29  462  	}
c8b978188c9a0f Chris Mason        2008-10-29  463  	*start = delalloc_start;
c8b978188c9a0f Chris Mason        2008-10-29  464  	*end = delalloc_end;
c8b978188c9a0f Chris Mason        2008-10-29  465  out_failed:
c8b978188c9a0f Chris Mason        2008-10-29  466  	return found;
c8b978188c9a0f Chris Mason        2008-10-29  467  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

