Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC23739EB4B
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 06:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778739470; cv=none; b=CDyg3f+flNxB1O6FXw8uPgSZtK69wOIu7FEMinuz1ZcLZj7PZt669PNmfdng+8S/6CP/igTzVBmgkCr1/qm64IWF7QaX7GFYjpb6T8Iz1Y+lfk3wRLI9PoeYbii89nS2yTNf76NIXfIsbvHDFHIj0yGB58+TWijb2HxcWZU5sMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778739470; c=relaxed/simple;
	bh=p0xDn0GQpPERefuizvKxCPKItO9V8oXnda3HKGua5kY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O39ok9yjk24rwTZEPN/hQdwM66khlxJEJob+iIRXCeJwxnn3g6X2bVFLL864ciYbaULZEE4DkTXWHxhutlJFwGdpSjwFpraHFawoLzEtaITGpuf+7njleXiIyBicETjt32lDupD+tNei3o0GnXAkKspfzvIpT42RerdBnRbPC9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I3Gt5nYl; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I3Gt5nYl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778739467; x=1810275467;
  h=date:from:to:cc:subject:message-id;
  bh=p0xDn0GQpPERefuizvKxCPKItO9V8oXnda3HKGua5kY=;
  b=I3Gt5nYlFh/y9pcdyBqD7yI4I1EE553KpWXrqDvhWGk9qBvSf2wpn17i
   njAiGF3NlJUwetZlCVg9Mta7NEYTrSgL/ixuw82MAgjhCpPgPGorsxms8
   8TsxHCPtbEQqgUmDpl6KNp1R4ToXMiHgwdLXROpveZJHjRxmeggsJ0ZIx
   zXs4SoG7Jl+vkMMH+vbWhTcl8I1DqXR2fS5/rbHdv5YCNeYhU0n4owmfu
   sxz9qkubp0Ox2sC2NDjNfdAclRJzrpe6m1OT99dxZ9vmcCsfLL7DMTnaB
   UuBJfq/jdkGJ+D3BwyAb3tCQ7p2mjX2m0d0TPue7ohAWHiF0M9LOcqCQa
   Q==;
X-CSE-ConnectionGUID: wcv0AFpsTmOcxiCqHDCWQw==
X-CSE-MsgGUID: tl2pI4rxT/2xBw7ce+WpKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="78700216"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="78700216"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 23:17:45 -0700
X-CSE-ConnectionGUID: wyFtAtQZQ4ScDAK05BqNvw==
X-CSE-MsgGUID: 6Hg4doweQSeGRMxwPH4wug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="242627697"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 May 2026 23:17:44 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNPO9-000000005wV-0WMa;
	Thu, 14 May 2026 06:17:41 +0000
Date: Thu, 14 May 2026 14:17:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kdave-btrfs-devel:ext/dv/fscrypt 29/43]
 fs/btrfs/extent_io.c:853 submit_extent_folio() error: we previously assumed
 'bio_ctrl->bbio' could be null (see line 836)
Message-ID: <202605141457.KSmPMgx0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Josef Bacik <josef@toxicpanda.com>
CC: David Sterba <dsterba@suse.com>
CC: Daniel Vacek <neelx@suse.com>

tree:   https://github.com/kdave/btrfs-devel.git ext/dv/fscrypt
head:   4c05f02641d57f578a685f7e8d27b9cb18d17cc7
commit: d0087580116ff1206b1ff871aa8c89ae22b45fb7 [29/43] btrfs: set the bio fscrypt context when applicable
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-161-20260514 (https://download.01.org/0day-ci/archive/20260514/202605141457.KSmPMgx0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605141457.KSmPMgx0-lkp@intel.com/

smatch warnings:
fs/btrfs/extent_io.c:853 submit_extent_folio() error: we previously assumed 'bio_ctrl->bbio' could be null (see line 836)

vim +853 fs/btrfs/extent_io.c

e0eefe07f89516f Qu Wenruo         2021-07-26  802  
4b81ba48c66b1f9 David Sterba      2017-06-06  803  /*
0c64c33c603f692 Qu Wenruo         2021-01-06  804   * @disk_bytenr: logical bytenr where the write will be
209ecde55c4a642 Qu Wenruo         2022-09-13  805   * @page:	page to add to the bio
0c64c33c603f692 Qu Wenruo         2021-01-06  806   * @size:	portion of page that we want to write to
b8b3d625ce67e4d David Sterba      2017-06-12  807   * @pg_offset:	offset of the new bio or to check whether we are adding
b8b3d625ce67e4d David Sterba      2017-06-12  808   *              a contiguous page to the previous one
f07b855c56b1fd7 Boris Burkov      2024-10-21  809   * @read_em_generation: generation of the extent_map we are submitting
f07b855c56b1fd7 Boris Burkov      2024-10-21  810   *			(only used for read)
814b6f915884776 Qu Wenruo         2022-09-13  811   *
9dfde1b47b9d7e0 Christoph Hellwig 2023-03-07  812   * The will either add the page into the existing @bio_ctrl->bbio, or allocate a
9dfde1b47b9d7e0 Christoph Hellwig 2023-03-07  813   * new one in @bio_ctrl->bbio.
17dc82dc1e77a6f David Sterba      2025-08-22  814   * The mirror number for this IO should already be initialized in
814b6f915884776 Qu Wenruo         2022-09-13  815   * @bio_ctrl->mirror_num.
4b81ba48c66b1f9 David Sterba      2017-06-06  816   */
b35397d1d325f43 Josef Bacik       2024-07-23  817  static void submit_extent_folio(struct btrfs_bio_ctrl *bio_ctrl,
b35397d1d325f43 Josef Bacik       2024-07-23  818  			       u64 disk_bytenr, struct folio *folio,
f07b855c56b1fd7 Boris Burkov      2024-10-21  819  			       size_t size, unsigned long pg_offset,
f07b855c56b1fd7 Boris Burkov      2024-10-21  820  			       u64 read_em_generation)
d1310b2e0cd98eb Chris Mason       2008-01-24  821  {
b35397d1d325f43 Josef Bacik       2024-07-23  822  	struct btrfs_inode *inode = folio_to_inode(folio);
f6b2d8b134b2413 Christoph Hellwig 2025-04-09  823  	loff_t file_offset = folio_pos(folio) + pg_offset;
5467abba1cbd9e1 Qu Wenruo         2022-09-13  824  
ebaa602d52cf6a7 Qu Wenruo         2025-02-20  825  	ASSERT(pg_offset + size <= folio_size(folio));
5467abba1cbd9e1 Qu Wenruo         2022-09-13  826  	ASSERT(bio_ctrl->end_io_func);
5467abba1cbd9e1 Qu Wenruo         2022-09-13  827  
9dfde1b47b9d7e0 Christoph Hellwig 2023-03-07  828  	if (bio_ctrl->bbio &&
f6b2d8b134b2413 Christoph Hellwig 2025-04-09  829  	    !btrfs_bio_is_contig(bio_ctrl, disk_bytenr, file_offset))
78a2ef1b7b332ca Christoph Hellwig 2023-02-27  830  		submit_one_bio(bio_ctrl);
78a2ef1b7b332ca Christoph Hellwig 2023-02-27  831  
24e6c8082208d3e Christoph Hellwig 2023-02-27  832  	do {
24e6c8082208d3e Christoph Hellwig 2023-02-27  833  		u32 len = size;
429aebc0a9a0636 David Sterba      2019-11-18  834  
e0eefe07f89516f Qu Wenruo         2021-07-26  835  		/* Allocate new bio if needed */
f6b2d8b134b2413 Christoph Hellwig 2025-04-09 @836  		if (!bio_ctrl->bbio)
f6b2d8b134b2413 Christoph Hellwig 2025-04-09  837  			alloc_new_bio(inode, bio_ctrl, disk_bytenr, file_offset);
24e6c8082208d3e Christoph Hellwig 2023-02-27  838  
24e6c8082208d3e Christoph Hellwig 2023-02-27  839  		/* Cap to the current ordered extent boundary if there is one. */
24e6c8082208d3e Christoph Hellwig 2023-02-27  840  		if (len > bio_ctrl->len_to_oe_boundary) {
24e6c8082208d3e Christoph Hellwig 2023-02-27  841  			ASSERT(bio_ctrl->compress_type == BTRFS_COMPRESS_NONE);
8610ba7eab8f8dc David Sterba      2022-06-15  842  			ASSERT(is_data_inode(inode));
24e6c8082208d3e Christoph Hellwig 2023-02-27  843  			len = bio_ctrl->len_to_oe_boundary;
d1310b2e0cd98eb Chris Mason       2008-01-24  844  		}
24e6c8082208d3e Christoph Hellwig 2023-02-27  845  
d0087580116ff12 Josef Bacik       2026-05-13  846  		/*
d0087580116ff12 Josef Bacik       2026-05-13  847  		 * Encryption has to allocate bounce buffers to encrypt the bio,
d0087580116ff12 Josef Bacik       2026-05-13  848  		 * and we need to make sure that it doesn't split the bio so we
d0087580116ff12 Josef Bacik       2026-05-13  849  		 * retain all of our special info in the btrfs_bio, so submit
d0087580116ff12 Josef Bacik       2026-05-13  850  		 * any bio that gets up to BIO_MAX_VECS worth of segments.
d0087580116ff12 Josef Bacik       2026-05-13  851  		 */
d0087580116ff12 Josef Bacik       2026-05-13  852  		if (IS_ENCRYPTED(&inode->vfs_inode) &&
d0087580116ff12 Josef Bacik       2026-05-13 @853  		    bio_data_dir(&bio_ctrl->bbio->bio) == WRITE &&
d0087580116ff12 Josef Bacik       2026-05-13  854  		    bio_segments(&bio_ctrl->bbio->bio) == BIO_MAX_VECS) {
d0087580116ff12 Josef Bacik       2026-05-13  855  			submit_one_bio(bio_ctrl);
d0087580116ff12 Josef Bacik       2026-05-13  856  			continue;
d0087580116ff12 Josef Bacik       2026-05-13  857  		}
d0087580116ff12 Josef Bacik       2026-05-13  858  
b35397d1d325f43 Josef Bacik       2024-07-23  859  		if (!bio_add_folio(&bio_ctrl->bbio->bio, folio, len, pg_offset)) {
24e6c8082208d3e Christoph Hellwig 2023-02-27  860  			/* bio full: move on to a new one */
24e6c8082208d3e Christoph Hellwig 2023-02-27  861  			submit_one_bio(bio_ctrl);
24e6c8082208d3e Christoph Hellwig 2023-02-27  862  			continue;
e0eefe07f89516f Qu Wenruo         2021-07-26  863  		}
f07b855c56b1fd7 Boris Burkov      2024-10-21  864  		/*
f07b855c56b1fd7 Boris Burkov      2024-10-21  865  		 * Now that the folio is definitely added to the bio, include its
f07b855c56b1fd7 Boris Burkov      2024-10-21  866  		 * generation in the max generation calculation.
f07b855c56b1fd7 Boris Burkov      2024-10-21  867  		 */
f07b855c56b1fd7 Boris Burkov      2024-10-21  868  		bio_ctrl->generation = max(bio_ctrl->generation, read_em_generation);
f6b2d8b134b2413 Christoph Hellwig 2025-04-09  869  		bio_ctrl->next_file_offset += len;
24e6c8082208d3e Christoph Hellwig 2023-02-27  870  
24e6c8082208d3e Christoph Hellwig 2023-02-27  871  		if (bio_ctrl->wbc)
f6b2d8b134b2413 Christoph Hellwig 2025-04-09  872  			wbc_account_cgroup_owner(bio_ctrl->wbc, folio, len);
24e6c8082208d3e Christoph Hellwig 2023-02-27  873  
24e6c8082208d3e Christoph Hellwig 2023-02-27  874  		size -= len;
24e6c8082208d3e Christoph Hellwig 2023-02-27  875  		pg_offset += len;
24e6c8082208d3e Christoph Hellwig 2023-02-27  876  		disk_bytenr += len;
f6b2d8b134b2413 Christoph Hellwig 2025-04-09  877  		file_offset += len;
09c3717c3a60e3e Chris Mason       2023-08-01  878  
09c3717c3a60e3e Chris Mason       2023-08-01  879  		/*
b35397d1d325f43 Josef Bacik       2024-07-23  880  		 * len_to_oe_boundary defaults to U32_MAX, which isn't folio or
09c3717c3a60e3e Chris Mason       2023-08-01  881  		 * sector aligned.  alloc_new_bio() then sets it to the end of
09c3717c3a60e3e Chris Mason       2023-08-01  882  		 * our ordered extent for writes into zoned devices.
09c3717c3a60e3e Chris Mason       2023-08-01  883  		 *
09c3717c3a60e3e Chris Mason       2023-08-01  884  		 * When len_to_oe_boundary is tracking an ordered extent, we
09c3717c3a60e3e Chris Mason       2023-08-01  885  		 * trust the ordered extent code to align things properly, and
09c3717c3a60e3e Chris Mason       2023-08-01  886  		 * the check above to cap our write to the ordered extent
09c3717c3a60e3e Chris Mason       2023-08-01  887  		 * boundary is correct.
09c3717c3a60e3e Chris Mason       2023-08-01  888  		 *
09c3717c3a60e3e Chris Mason       2023-08-01  889  		 * When len_to_oe_boundary is U32_MAX, the cap above would
b35397d1d325f43 Josef Bacik       2024-07-23  890  		 * result in a 4095 byte IO for the last folio right before
b35397d1d325f43 Josef Bacik       2024-07-23  891  		 * we hit the bio limit of UINT_MAX.  bio_add_folio() has all
09c3717c3a60e3e Chris Mason       2023-08-01  892  		 * the checks required to make sure we don't overflow the bio,
09c3717c3a60e3e Chris Mason       2023-08-01  893  		 * and we should just ignore len_to_oe_boundary completely
09c3717c3a60e3e Chris Mason       2023-08-01  894  		 * unless we're using it to track an ordered extent.
09c3717c3a60e3e Chris Mason       2023-08-01  895  		 *
09c3717c3a60e3e Chris Mason       2023-08-01  896  		 * It's pretty hard to make a bio sized U32_MAX, but it can
09c3717c3a60e3e Chris Mason       2023-08-01  897  		 * happen when the page cache is able to feed us contiguous
b35397d1d325f43 Josef Bacik       2024-07-23  898  		 * folios for large extents.
09c3717c3a60e3e Chris Mason       2023-08-01  899  		 */
09c3717c3a60e3e Chris Mason       2023-08-01  900  		if (bio_ctrl->len_to_oe_boundary != U32_MAX)
24e6c8082208d3e Christoph Hellwig 2023-02-27  901  			bio_ctrl->len_to_oe_boundary -= len;
24e6c8082208d3e Christoph Hellwig 2023-02-27  902  
24e6c8082208d3e Christoph Hellwig 2023-02-27  903  		/* Ordered extent boundary: move on to a new bio. */
24e6c8082208d3e Christoph Hellwig 2023-02-27  904  		if (bio_ctrl->len_to_oe_boundary == 0)
24e6c8082208d3e Christoph Hellwig 2023-02-27  905  			submit_one_bio(bio_ctrl);
24e6c8082208d3e Christoph Hellwig 2023-02-27  906  	} while (size);
e0eefe07f89516f Qu Wenruo         2021-07-26  907  }
d1310b2e0cd98eb Chris Mason       2008-01-24  908  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
