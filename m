Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3A43093D8
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Oct 2026 18:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791226063; cv=none; b=QXVZvEr2ZJ/ZsS8vG3zbUpLbSLKRQuM7Y01EwrFv/98iPrVN2qQRQxze3kJNPCnWjcydwGAwIr3Ns2m3qVD0ysj2b/hbsMXlCzSx44obMZdP1+4PNlzGYSO+p/c2mh6eiojscELrdoWh/dEorBbQgHOkfqqXAUMSq2mAr6oNkHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791226063; c=relaxed/simple;
	bh=k3AcNHK9QbWSe7KqSX3ubP67CjKUZX8txtR97vZUkVo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b/i9/Vi6eSr/6UxxzDuwgTC85I5FsYaVWTkIK05HGmK5EopD69PSAGBguRb7Y9+cKz/w2yVehRxf16R68z0OQUG28pBoc+brsdFQ6YDgZO876b7GU6qWs4vUvT/7tZjqNELkieFMJotXvrNGGNIfbJtizk3kwn0Cpk3CpXak41s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KWljchVw; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KWljchVw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791226060; x=1822762060;
  h=date:from:to:cc:subject:message-id;
  bh=k3AcNHK9QbWSe7KqSX3ubP67CjKUZX8txtR97vZUkVo=;
  b=KWljchVwrKz4bfW+4Sz90lTb7yVa7aFgh7TVJqiGTMihESpLeGuFQglp
   L9aqwSsj1u/dCAWTYXWUFDm57GcQVerh/sAbueD5XEOBZuVeKkMd8JNis
   UCp3YY8NY+MGXGhA0aDPBzjhokd4gbWAinipBHRWIn7P0jB2cvbPGyMPZ
   L6W5QtfHEv+vY0KodXka9zilJ3uknkNrVCae3L0wfKUh4MBkea7ocRVlU
   P2i+wVSd0jLw85/YUUSwI78QIhyxpqT/KKufb9hy+ILcmOgZtH0BdZtMZ
   GEY8uAf2BKu5KpS3Hum67TqGuUepuDV7pMV6umF89hsTGfhBt2uldHk3Z
   A==;
X-CSE-ConnectionGUID: O8DKMxzBQLWOK0M/+jogMA==
X-CSE-MsgGUID: EHGmNNi2S6ui+SyuB701ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="94616169"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="94616169"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:47:38 -0700
X-CSE-ConnectionGUID: cduV3JNRT7a2kGXuQ57HWQ==
X-CSE-MsgGUID: b2KQwGb8QNOyRFQmq5SVgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="273294839"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 05 Oct 2026 11:47:36 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDnio-000000000Gh-2XbQ;
	Mon, 05 Oct 2026 18:47:34 +0000
Date: Mon, 05 Oct 2026 20:46:44 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 13161/14242] fs/ntfs/attrib.c:4719
 ntfs_non_resident_attr_expand() warn: missing unwind goto?
Message-ID: <202610052015.jmbMsWHP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Matthias Goergens <matthias.goergens@gmail.com>
CC: Namjae Jeon <linkinjeon@kernel.org>
CC: Baolin Liu <liubaolin@kylinos.cn>
CC: Hyunchul Lee <hyc.lee@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
commit: e29de9195f6424a3728580e836c32f80e94d2254 [13161/14242] ntfs: hold the runlist lock while expanding a non-resident attribute
:::::: branch date: 6 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-2200-20261005 (https://download.01.org/0day-ci/archive/20261005/202610052015.jmbMsWHP-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610052015.jmbMsWHP-lkp@intel.com/

smatch warnings:
fs/ntfs/attrib.c:4719 ntfs_non_resident_attr_expand() warn: missing unwind goto?

vim +4719 fs/ntfs/attrib.c

495e90fa334828d Namjae Jeon       2026-02-13  4463  
495e90fa334828d Namjae Jeon       2026-02-13  4464  /*
495e90fa334828d Namjae Jeon       2026-02-13  4465   * ntfs_non_resident_attr_expand - expand a non-resident, open ntfs attribute
495e90fa334828d Namjae Jeon       2026-02-13  4466   * @ni:			non-resident ntfs attribute to expand
495e90fa334828d Namjae Jeon       2026-02-13  4467   * @prealloc_size:	preallocation size (in bytes) to which to expand the attribute
495e90fa334828d Namjae Jeon       2026-02-13  4468   * @newsize:		new size (in bytes) to which to expand the attribute
495e90fa334828d Namjae Jeon       2026-02-13  4469   * @holes:		how to create a hole if expanding
91709ba5d6d709b Namjae Jeon       2026-09-06  4470   * @locked_ni:		inode whose runlist lock is already held
495e90fa334828d Namjae Jeon       2026-02-13  4471   *
495e90fa334828d Namjae Jeon       2026-02-13  4472   * Expand the size of a non-resident, open ntfs attribute @na to @newsize bytes,
495e90fa334828d Namjae Jeon       2026-02-13  4473   * by allocating new clusters.
495e90fa334828d Namjae Jeon       2026-02-13  4474   */
495e90fa334828d Namjae Jeon       2026-02-13  4475  static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsize,
91709ba5d6d709b Namjae Jeon       2026-09-06  4476  		const s64 prealloc_size, unsigned int holes,
91709ba5d6d709b Namjae Jeon       2026-09-06  4477  		struct ntfs_inode *locked_ni)
495e90fa334828d Namjae Jeon       2026-02-13  4478  {
495e90fa334828d Namjae Jeon       2026-02-13  4479  	s64 lcn_seek_from;
495e90fa334828d Namjae Jeon       2026-02-13  4480  	s64 first_free_vcn;
495e90fa334828d Namjae Jeon       2026-02-13  4481  	struct ntfs_volume *vol;
495e90fa334828d Namjae Jeon       2026-02-13  4482  	struct ntfs_attr_search_ctx *ctx = NULL;
495e90fa334828d Namjae Jeon       2026-02-13  4483  	struct runlist_element *rl, *rln;
495e90fa334828d Namjae Jeon       2026-02-13  4484  	s64 org_alloc_size, org_compressed_size;
495e90fa334828d Namjae Jeon       2026-02-13  4485  	int err, err2;
495e90fa334828d Namjae Jeon       2026-02-13  4486  	struct ntfs_inode *base_ni;
495e90fa334828d Namjae Jeon       2026-02-13  4487  	struct super_block *sb = ni->vol->sb;
495e90fa334828d Namjae Jeon       2026-02-13  4488  	size_t new_rl_count;
e43715851cf184a Matthias Goergens 2026-09-30  4489  	unsigned long flags;
e29de9195f6424a Matthias Goergens 2026-10-01  4490  	bool runlist_locked = locked_ni == ni;
495e90fa334828d Namjae Jeon       2026-02-13  4491  
495e90fa334828d Namjae Jeon       2026-02-13  4492  	ntfs_debug("Inode 0x%llx, attr 0x%x, new size %lld old size %lld\n",
495e90fa334828d Namjae Jeon       2026-02-13  4493  			(unsigned long long)ni->mft_no, ni->type,
495e90fa334828d Namjae Jeon       2026-02-13  4494  			(long long)newsize, (long long)ni->data_size);
495e90fa334828d Namjae Jeon       2026-02-13  4495  
495e90fa334828d Namjae Jeon       2026-02-13  4496  	vol = ni->vol;
495e90fa334828d Namjae Jeon       2026-02-13  4497  
495e90fa334828d Namjae Jeon       2026-02-13  4498  	if (NInoAttr(ni))
495e90fa334828d Namjae Jeon       2026-02-13  4499  		base_ni = ni->ext.base_ntfs_ino;
495e90fa334828d Namjae Jeon       2026-02-13  4500  	else
495e90fa334828d Namjae Jeon       2026-02-13  4501  		base_ni = ni;
495e90fa334828d Namjae Jeon       2026-02-13  4502  
495e90fa334828d Namjae Jeon       2026-02-13  4503  	/*
495e90fa334828d Namjae Jeon       2026-02-13  4504  	 * Check the attribute type and the corresponding maximum size
495e90fa334828d Namjae Jeon       2026-02-13  4505  	 * against @newsize and fail if @newsize is too big.
495e90fa334828d Namjae Jeon       2026-02-13  4506  	 */
495e90fa334828d Namjae Jeon       2026-02-13  4507  	err = ntfs_attr_size_bounds_check(vol, ni->type, newsize);
495e90fa334828d Namjae Jeon       2026-02-13  4508  	if (err	< 0) {
495e90fa334828d Namjae Jeon       2026-02-13  4509  		ntfs_error(sb, "%s: bounds check failed", __func__);
495e90fa334828d Namjae Jeon       2026-02-13  4510  		return err;
495e90fa334828d Namjae Jeon       2026-02-13  4511  	}
495e90fa334828d Namjae Jeon       2026-02-13  4512  
495e90fa334828d Namjae Jeon       2026-02-13  4513  	/* Save for future use. */
495e90fa334828d Namjae Jeon       2026-02-13  4514  	org_alloc_size = ni->allocated_size;
495e90fa334828d Namjae Jeon       2026-02-13  4515  	org_compressed_size = ni->itype.compressed.size;
495e90fa334828d Namjae Jeon       2026-02-13  4516  
495e90fa334828d Namjae Jeon       2026-02-13  4517  	/* The first cluster outside the new allocation. */
495e90fa334828d Namjae Jeon       2026-02-13  4518  	if (prealloc_size)
495e90fa334828d Namjae Jeon       2026-02-13  4519  		first_free_vcn =
495e90fa334828d Namjae Jeon       2026-02-13  4520  			ntfs_bytes_to_cluster(vol, prealloc_size + vol->cluster_size - 1);
495e90fa334828d Namjae Jeon       2026-02-13  4521  	else
495e90fa334828d Namjae Jeon       2026-02-13  4522  		first_free_vcn =
495e90fa334828d Namjae Jeon       2026-02-13  4523  			ntfs_bytes_to_cluster(vol, newsize + vol->cluster_size - 1);
495e90fa334828d Namjae Jeon       2026-02-13  4524  	if (first_free_vcn < 0)
495e90fa334828d Namjae Jeon       2026-02-13  4525  		return -EFBIG;
495e90fa334828d Namjae Jeon       2026-02-13  4526  
495e90fa334828d Namjae Jeon       2026-02-13  4527  	/*
495e90fa334828d Namjae Jeon       2026-02-13  4528  	 * Compare the new allocation with the old one and only allocate
495e90fa334828d Namjae Jeon       2026-02-13  4529  	 * clusters if there is a change.
495e90fa334828d Namjae Jeon       2026-02-13  4530  	 */
495e90fa334828d Namjae Jeon       2026-02-13  4531  	if (ntfs_bytes_to_cluster(vol, ni->allocated_size) < first_free_vcn) {
e29de9195f6424a Matthias Goergens 2026-10-01  4532  		/*
e29de9195f6424a Matthias Goergens 2026-10-01  4533  		 * The runlist array is replaced below.  Readers such as the
e29de9195f6424a Matthias Goergens 2026-10-01  4534  		 * iomap read path hold only the runlist lock, not mrec_lock.
e29de9195f6424a Matthias Goergens 2026-10-01  4535  		 */
e29de9195f6424a Matthias Goergens 2026-10-01  4536  		if (runlist_locked)
e29de9195f6424a Matthias Goergens 2026-10-01  4537  			lockdep_assert_held_write(&ni->runlist.lock);
e29de9195f6424a Matthias Goergens 2026-10-01  4538  		else
e29de9195f6424a Matthias Goergens 2026-10-01  4539  			down_write(&ni->runlist.lock);
e29de9195f6424a Matthias Goergens 2026-10-01  4540  
495e90fa334828d Namjae Jeon       2026-02-13  4541  		err = ntfs_attr_map_whole_runlist(ni);
495e90fa334828d Namjae Jeon       2026-02-13  4542  		if (err) {
495e90fa334828d Namjae Jeon       2026-02-13  4543  			ntfs_error(sb, "ntfs_attr_map_whole_runlist failed");
e29de9195f6424a Matthias Goergens 2026-10-01  4544  			goto unlock_runlist;
495e90fa334828d Namjae Jeon       2026-02-13  4545  		}
495e90fa334828d Namjae Jeon       2026-02-13  4546  
495e90fa334828d Namjae Jeon       2026-02-13  4547  		/*
495e90fa334828d Namjae Jeon       2026-02-13  4548  		 * If we extend $DATA attribute on NTFS 3+ volume, we can add
495e90fa334828d Namjae Jeon       2026-02-13  4549  		 * sparse runs instead of real allocation of clusters.
495e90fa334828d Namjae Jeon       2026-02-13  4550  		 */
495e90fa334828d Namjae Jeon       2026-02-13  4551  		if ((ni->type == AT_DATA && (vol->major_ver >= 3 || !NInoSparseDisabled(ni))) &&
495e90fa334828d Namjae Jeon       2026-02-13  4552  		    (holes != HOLES_NO)) {
495e90fa334828d Namjae Jeon       2026-02-13  4553  			if (NInoCompressed(ni)) {
495e90fa334828d Namjae Jeon       2026-02-13  4554  				int last = 0, i = 0;
495e90fa334828d Namjae Jeon       2026-02-13  4555  				s64 alloc_size;
495e90fa334828d Namjae Jeon       2026-02-13  4556  				u64 more_entries = round_up(first_free_vcn -
495e90fa334828d Namjae Jeon       2026-02-13  4557  						 ntfs_bytes_to_cluster(vol, ni->allocated_size),
495e90fa334828d Namjae Jeon       2026-02-13  4558  						 ni->itype.compressed.block_clusters);
495e90fa334828d Namjae Jeon       2026-02-13  4559  
495e90fa334828d Namjae Jeon       2026-02-13  4560  				do_div(more_entries, ni->itype.compressed.block_clusters);
495e90fa334828d Namjae Jeon       2026-02-13  4561  
495e90fa334828d Namjae Jeon       2026-02-13  4562  				while (ni->runlist.rl[last].length)
495e90fa334828d Namjae Jeon       2026-02-13  4563  					last++;
495e90fa334828d Namjae Jeon       2026-02-13  4564  
495e90fa334828d Namjae Jeon       2026-02-13  4565  				rl = ntfs_rl_realloc(ni->runlist.rl, last + 1,
495e90fa334828d Namjae Jeon       2026-02-13  4566  						last + more_entries + 1);
495e90fa334828d Namjae Jeon       2026-02-13  4567  				if (IS_ERR(rl)) {
495e90fa334828d Namjae Jeon       2026-02-13  4568  					err = -ENOMEM;
e29de9195f6424a Matthias Goergens 2026-10-01  4569  					goto unlock_runlist;
495e90fa334828d Namjae Jeon       2026-02-13  4570  				}
495e90fa334828d Namjae Jeon       2026-02-13  4571  
495e90fa334828d Namjae Jeon       2026-02-13  4572  				alloc_size = ni->allocated_size;
495e90fa334828d Namjae Jeon       2026-02-13  4573  				while (i++ < more_entries) {
495e90fa334828d Namjae Jeon       2026-02-13  4574  					rl[last].vcn = ntfs_bytes_to_cluster(vol,
495e90fa334828d Namjae Jeon       2026-02-13  4575  							round_up(alloc_size, vol->cluster_size));
495e90fa334828d Namjae Jeon       2026-02-13  4576  					rl[last].length = ni->itype.compressed.block_clusters -
495e90fa334828d Namjae Jeon       2026-02-13  4577  						(rl[last].vcn &
495e90fa334828d Namjae Jeon       2026-02-13  4578  						 (ni->itype.compressed.block_clusters - 1));
495e90fa334828d Namjae Jeon       2026-02-13  4579  					rl[last].lcn = LCN_HOLE;
495e90fa334828d Namjae Jeon       2026-02-13  4580  					last++;
495e90fa334828d Namjae Jeon       2026-02-13  4581  					alloc_size += ni->itype.compressed.block_size;
495e90fa334828d Namjae Jeon       2026-02-13  4582  				}
495e90fa334828d Namjae Jeon       2026-02-13  4583  
495e90fa334828d Namjae Jeon       2026-02-13  4584  				rl[last].vcn = first_free_vcn;
495e90fa334828d Namjae Jeon       2026-02-13  4585  				rl[last].lcn = LCN_ENOENT;
495e90fa334828d Namjae Jeon       2026-02-13  4586  				rl[last].length = 0;
495e90fa334828d Namjae Jeon       2026-02-13  4587  
495e90fa334828d Namjae Jeon       2026-02-13  4588  				ni->runlist.rl = rl;
495e90fa334828d Namjae Jeon       2026-02-13  4589  				ni->runlist.count += more_entries;
495e90fa334828d Namjae Jeon       2026-02-13  4590  			} else {
495e90fa334828d Namjae Jeon       2026-02-13  4591  				rl = kmalloc(sizeof(struct runlist_element) * 2, GFP_NOFS);
495e90fa334828d Namjae Jeon       2026-02-13  4592  				if (!rl) {
495e90fa334828d Namjae Jeon       2026-02-13  4593  					err = -ENOMEM;
e29de9195f6424a Matthias Goergens 2026-10-01  4594  					goto unlock_runlist;
495e90fa334828d Namjae Jeon       2026-02-13  4595  				}
495e90fa334828d Namjae Jeon       2026-02-13  4596  
495e90fa334828d Namjae Jeon       2026-02-13  4597  				rl[0].vcn = ntfs_bytes_to_cluster(vol, ni->allocated_size);
495e90fa334828d Namjae Jeon       2026-02-13  4598  				rl[0].lcn = LCN_HOLE;
495e90fa334828d Namjae Jeon       2026-02-13  4599  				rl[0].length = first_free_vcn -
495e90fa334828d Namjae Jeon       2026-02-13  4600  					ntfs_bytes_to_cluster(vol, ni->allocated_size);
495e90fa334828d Namjae Jeon       2026-02-13  4601  				rl[1].vcn = first_free_vcn;
495e90fa334828d Namjae Jeon       2026-02-13  4602  				rl[1].lcn = LCN_ENOENT;
495e90fa334828d Namjae Jeon       2026-02-13  4603  				rl[1].length = 0;
495e90fa334828d Namjae Jeon       2026-02-13  4604  			}
495e90fa334828d Namjae Jeon       2026-02-13  4605  		} else {
495e90fa334828d Namjae Jeon       2026-02-13  4606  			/*
495e90fa334828d Namjae Jeon       2026-02-13  4607  			 * Determine first after last LCN of attribute.
495e90fa334828d Namjae Jeon       2026-02-13  4608  			 * We will start seek clusters from this LCN to avoid
495e90fa334828d Namjae Jeon       2026-02-13  4609  			 * fragmentation.  If there are no valid LCNs in the
495e90fa334828d Namjae Jeon       2026-02-13  4610  			 * attribute let the cluster allocator choose the
495e90fa334828d Namjae Jeon       2026-02-13  4611  			 * starting LCN.
495e90fa334828d Namjae Jeon       2026-02-13  4612  			 */
495e90fa334828d Namjae Jeon       2026-02-13  4613  			lcn_seek_from = -1;
495e90fa334828d Namjae Jeon       2026-02-13  4614  			if (ni->runlist.rl->length) {
495e90fa334828d Namjae Jeon       2026-02-13  4615  				/* Seek to the last run list element. */
495e90fa334828d Namjae Jeon       2026-02-13  4616  				for (rl = ni->runlist.rl; (rl + 1)->length; rl++)
495e90fa334828d Namjae Jeon       2026-02-13  4617  					;
495e90fa334828d Namjae Jeon       2026-02-13  4618  				/*
495e90fa334828d Namjae Jeon       2026-02-13  4619  				 * If the last LCN is a hole or similar seek
495e90fa334828d Namjae Jeon       2026-02-13  4620  				 * back to last valid LCN.
495e90fa334828d Namjae Jeon       2026-02-13  4621  				 */
495e90fa334828d Namjae Jeon       2026-02-13  4622  				while (rl->lcn < 0 && rl != ni->runlist.rl)
495e90fa334828d Namjae Jeon       2026-02-13  4623  					rl--;
495e90fa334828d Namjae Jeon       2026-02-13  4624  				/*
495e90fa334828d Namjae Jeon       2026-02-13  4625  				 * Only set lcn_seek_from it the LCN is valid.
495e90fa334828d Namjae Jeon       2026-02-13  4626  				 */
495e90fa334828d Namjae Jeon       2026-02-13  4627  				if (rl->lcn >= 0)
495e90fa334828d Namjae Jeon       2026-02-13  4628  					lcn_seek_from = rl->lcn + rl->length;
495e90fa334828d Namjae Jeon       2026-02-13  4629  			}
495e90fa334828d Namjae Jeon       2026-02-13  4630  
495e90fa334828d Namjae Jeon       2026-02-13  4631  			rl = ntfs_cluster_alloc(vol,
495e90fa334828d Namjae Jeon       2026-02-13  4632  					ntfs_bytes_to_cluster(vol, ni->allocated_size),
495e90fa334828d Namjae Jeon       2026-02-13  4633  					first_free_vcn -
495e90fa334828d Namjae Jeon       2026-02-13  4634  					ntfs_bytes_to_cluster(vol, ni->allocated_size),
b1d732e62a5b394 Namjae Jeon       2026-09-06  4635  					lcn_seek_from, DATA_ZONE, false,
b1d732e62a5b394 Namjae Jeon       2026-09-06  4636  					ni->type == AT_ATTRIBUTE_LIST, false);
495e90fa334828d Namjae Jeon       2026-02-13  4637  			if (IS_ERR(rl)) {
495e90fa334828d Namjae Jeon       2026-02-13  4638  				ntfs_debug("Cluster allocation failed (%lld)",
495e90fa334828d Namjae Jeon       2026-02-13  4639  						(long long)first_free_vcn -
495e90fa334828d Namjae Jeon       2026-02-13  4640  						ntfs_bytes_to_cluster(vol, ni->allocated_size));
e29de9195f6424a Matthias Goergens 2026-10-01  4641  				err = PTR_ERR(rl);
e29de9195f6424a Matthias Goergens 2026-10-01  4642  				goto unlock_runlist;
495e90fa334828d Namjae Jeon       2026-02-13  4643  			}
b1d732e62a5b394 Namjae Jeon       2026-09-06  4644  			/*
b1d732e62a5b394 Namjae Jeon       2026-09-06  4645  			 * A contiguous ATTRIBUTE_LIST allocation keeps its mapping
b1d732e62a5b394 Namjae Jeon       2026-09-06  4646  			 * pairs small enough to fit in the base MFT record. The
b1d732e62a5b394 Namjae Jeon       2026-09-06  4647  			 * allocator can return a short run when contiguity was
b1d732e62a5b394 Namjae Jeon       2026-09-06  4648  			 * requested, so discard it and retry normally if necessary.
b1d732e62a5b394 Namjae Jeon       2026-09-06  4649  			 */
b1d732e62a5b394 Namjae Jeon       2026-09-06  4650  			if (ni->type == AT_ATTRIBUTE_LIST &&
b1d732e62a5b394 Namjae Jeon       2026-09-06  4651  				(rl->vcn != ntfs_bytes_to_cluster(vol,
b1d732e62a5b394 Namjae Jeon       2026-09-06  4652  						ni->allocated_size) ||
b1d732e62a5b394 Namjae Jeon       2026-09-06  4653  				 rl->length != first_free_vcn -
b1d732e62a5b394 Namjae Jeon       2026-09-06  4654  					ntfs_bytes_to_cluster(vol, ni->allocated_size) ||
b1d732e62a5b394 Namjae Jeon       2026-09-06  4655  				 rl[1].length)) {
b1d732e62a5b394 Namjae Jeon       2026-09-06  4656  				ntfs_cluster_free_from_rl(vol, rl);
b1d732e62a5b394 Namjae Jeon       2026-09-06  4657  				kvfree(rl);
b1d732e62a5b394 Namjae Jeon       2026-09-06  4658  				rl = ntfs_cluster_alloc(vol,
b1d732e62a5b394 Namjae Jeon       2026-09-06  4659  						ntfs_bytes_to_cluster(vol,
b1d732e62a5b394 Namjae Jeon       2026-09-06  4660  								ni->allocated_size),
b1d732e62a5b394 Namjae Jeon       2026-09-06  4661  						first_free_vcn -
b1d732e62a5b394 Namjae Jeon       2026-09-06  4662  						ntfs_bytes_to_cluster(vol,
b1d732e62a5b394 Namjae Jeon       2026-09-06  4663  								ni->allocated_size),
b1d732e62a5b394 Namjae Jeon       2026-09-06  4664  						lcn_seek_from, DATA_ZONE, false,
b1d732e62a5b394 Namjae Jeon       2026-09-06  4665  						false, false);
e29de9195f6424a Matthias Goergens 2026-10-01  4666  				if (IS_ERR(rl)) {
e29de9195f6424a Matthias Goergens 2026-10-01  4667  					err = PTR_ERR(rl);
e29de9195f6424a Matthias Goergens 2026-10-01  4668  					goto unlock_runlist;
e29de9195f6424a Matthias Goergens 2026-10-01  4669  				}
b1d732e62a5b394 Namjae Jeon       2026-09-06  4670  			}
495e90fa334828d Namjae Jeon       2026-02-13  4671  		}
495e90fa334828d Namjae Jeon       2026-02-13  4672  
495e90fa334828d Namjae Jeon       2026-02-13  4673  		if (!NInoCompressed(ni)) {
495e90fa334828d Namjae Jeon       2026-02-13  4674  			/* Append new clusters to attribute runlist. */
495e90fa334828d Namjae Jeon       2026-02-13  4675  			rln = ntfs_runlists_merge(&ni->runlist, rl, 0, &new_rl_count);
495e90fa334828d Namjae Jeon       2026-02-13  4676  			if (IS_ERR(rln)) {
495e90fa334828d Namjae Jeon       2026-02-13  4677  				/* Failed, free just allocated clusters. */
495e90fa334828d Namjae Jeon       2026-02-13  4678  				ntfs_error(sb, "Run list merge failed");
495e90fa334828d Namjae Jeon       2026-02-13  4679  				ntfs_cluster_free_from_rl(vol, rl);
495e90fa334828d Namjae Jeon       2026-02-13  4680  				kvfree(rl);
e29de9195f6424a Matthias Goergens 2026-10-01  4681  				err = -EIO;
e29de9195f6424a Matthias Goergens 2026-10-01  4682  				goto unlock_runlist;
495e90fa334828d Namjae Jeon       2026-02-13  4683  			}
495e90fa334828d Namjae Jeon       2026-02-13  4684  			ni->runlist.rl = rln;
495e90fa334828d Namjae Jeon       2026-02-13  4685  			ni->runlist.count = new_rl_count;
495e90fa334828d Namjae Jeon       2026-02-13  4686  		}
495e90fa334828d Namjae Jeon       2026-02-13  4687  
495e90fa334828d Namjae Jeon       2026-02-13  4688  		/* Prepare to mapping pairs update. */
495e90fa334828d Namjae Jeon       2026-02-13  4689  		ni->allocated_size = ntfs_cluster_to_bytes(vol, first_free_vcn);
e29de9195f6424a Matthias Goergens 2026-10-01  4690  		if (ni->type == AT_ATTRIBUTE_LIST && !runlist_locked) {
e29de9195f6424a Matthias Goergens 2026-10-01  4691  			/*
e29de9195f6424a Matthias Goergens 2026-10-01  4692  			 * Making room for the list's mapping pairs can resize
e29de9195f6424a Matthias Goergens 2026-10-01  4693  			 * this attribute list again through
e29de9195f6424a Matthias Goergens 2026-10-01  4694  			 * ntfs_attrlist_update_locked(), which takes its
e29de9195f6424a Matthias Goergens 2026-10-01  4695  			 * runlist lock.
e29de9195f6424a Matthias Goergens 2026-10-01  4696  			 */
e29de9195f6424a Matthias Goergens 2026-10-01  4697  			up_write(&ni->runlist.lock);
e29de9195f6424a Matthias Goergens 2026-10-01  4698  			err = ntfs_attr_update_mapping_pairs_locked(ni, 0,
e29de9195f6424a Matthias Goergens 2026-10-01  4699  								    locked_ni);
495e90fa334828d Namjae Jeon       2026-02-13  4700  			if (err) {
495e90fa334828d Namjae Jeon       2026-02-13  4701  				ntfs_debug("Mapping pairs update failed");
495e90fa334828d Namjae Jeon       2026-02-13  4702  				goto rollback;
495e90fa334828d Namjae Jeon       2026-02-13  4703  			}
e29de9195f6424a Matthias Goergens 2026-10-01  4704  		} else {
e29de9195f6424a Matthias Goergens 2026-10-01  4705  			err = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
e29de9195f6424a Matthias Goergens 2026-10-01  4706  			if (err) {
e29de9195f6424a Matthias Goergens 2026-10-01  4707  				ntfs_debug("Mapping pairs update failed");
e29de9195f6424a Matthias Goergens 2026-10-01  4708  				goto rollback_locked;
e29de9195f6424a Matthias Goergens 2026-10-01  4709  			}
e29de9195f6424a Matthias Goergens 2026-10-01  4710  			if (!runlist_locked)
e29de9195f6424a Matthias Goergens 2026-10-01  4711  				up_write(&ni->runlist.lock);
e29de9195f6424a Matthias Goergens 2026-10-01  4712  		}
495e90fa334828d Namjae Jeon       2026-02-13  4713  	}
495e90fa334828d Namjae Jeon       2026-02-13  4714  
495e90fa334828d Namjae Jeon       2026-02-13  4715  	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
495e90fa334828d Namjae Jeon       2026-02-13  4716  	if (!ctx) {
495e90fa334828d Namjae Jeon       2026-02-13  4717  		err = -ENOMEM;
495e90fa334828d Namjae Jeon       2026-02-13  4718  		if (ni->allocated_size == org_alloc_size)
495e90fa334828d Namjae Jeon       2026-02-13 @4719  			return err;
495e90fa334828d Namjae Jeon       2026-02-13  4720  		goto rollback;
495e90fa334828d Namjae Jeon       2026-02-13  4721  	}
495e90fa334828d Namjae Jeon       2026-02-13  4722  
495e90fa334828d Namjae Jeon       2026-02-13  4723  	err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len, CASE_SENSITIVE,
495e90fa334828d Namjae Jeon       2026-02-13  4724  			       0, NULL, 0, ctx);
495e90fa334828d Namjae Jeon       2026-02-13  4725  	if (err) {
495e90fa334828d Namjae Jeon       2026-02-13  4726  		if (err == -ENOENT)
495e90fa334828d Namjae Jeon       2026-02-13  4727  			err = -EIO;
495e90fa334828d Namjae Jeon       2026-02-13  4728  		if (ni->allocated_size != org_alloc_size)
495e90fa334828d Namjae Jeon       2026-02-13  4729  			goto rollback;
495e90fa334828d Namjae Jeon       2026-02-13  4730  		goto put_err_out;
495e90fa334828d Namjae Jeon       2026-02-13  4731  	}
495e90fa334828d Namjae Jeon       2026-02-13  4732  
495e90fa334828d Namjae Jeon       2026-02-13  4733  	/* Update data size. */
495e90fa334828d Namjae Jeon       2026-02-13  4734  	ni->data_size = newsize;
495e90fa334828d Namjae Jeon       2026-02-13  4735  	ctx->attr->data.non_resident.data_size = cpu_to_le64(newsize);
495e90fa334828d Namjae Jeon       2026-02-13  4736  	/* Update data size in the index. */
495e90fa334828d Namjae Jeon       2026-02-13  4737  	if (ni->type == AT_DATA && ni->name == AT_UNNAMED)
495e90fa334828d Namjae Jeon       2026-02-13  4738  		NInoSetFileNameDirty(ni);
495e90fa334828d Namjae Jeon       2026-02-13  4739  	/* Set the inode dirty so it is written out later. */
495e90fa334828d Namjae Jeon       2026-02-13  4740  	mark_mft_record_dirty(ctx->ntfs_ino);
495e90fa334828d Namjae Jeon       2026-02-13  4741  	/* Done! */
495e90fa334828d Namjae Jeon       2026-02-13  4742  	ntfs_attr_put_search_ctx(ctx);
495e90fa334828d Namjae Jeon       2026-02-13  4743  	return 0;
495e90fa334828d Namjae Jeon       2026-02-13  4744  rollback:
e29de9195f6424a Matthias Goergens 2026-10-01  4745  	if (!runlist_locked)
e29de9195f6424a Matthias Goergens 2026-10-01  4746  		down_write(&ni->runlist.lock);
e29de9195f6424a Matthias Goergens 2026-10-01  4747  rollback_locked:
495e90fa334828d Namjae Jeon       2026-02-13  4748  	/* Free allocated clusters. */
495e90fa334828d Namjae Jeon       2026-02-13  4749  	err2 = ntfs_cluster_free(ni, ntfs_bytes_to_cluster(vol, org_alloc_size),
495e90fa334828d Namjae Jeon       2026-02-13  4750  				-1, ctx);
495e90fa334828d Namjae Jeon       2026-02-13  4751  	if (err2)
495e90fa334828d Namjae Jeon       2026-02-13  4752  		ntfs_debug("Leaking clusters");
495e90fa334828d Namjae Jeon       2026-02-13  4753  
e43715851cf184a Matthias Goergens 2026-09-30  4754  	/*
e43715851cf184a Matthias Goergens 2026-09-30  4755  	 * Now, truncate the runlist itself.  Restore allocated_size before
e43715851cf184a Matthias Goergens 2026-09-30  4756  	 * dropping the lock: ntfs_attr_vcn_to_rl() fails a lookup below the
e43715851cf184a Matthias Goergens 2026-09-30  4757  	 * allocated size that falls past the end of the runlist.
e43715851cf184a Matthias Goergens 2026-09-30  4758  	 */
495e90fa334828d Namjae Jeon       2026-02-13  4759  	err2 = ntfs_rl_truncate_nolock(vol, &ni->runlist,
495e90fa334828d Namjae Jeon       2026-02-13  4760  			ntfs_bytes_to_cluster(vol, org_alloc_size));
e43715851cf184a Matthias Goergens 2026-09-30  4761  	if (!err2) {
e43715851cf184a Matthias Goergens 2026-09-30  4762  		write_lock_irqsave(&ni->size_lock, flags);
e43715851cf184a Matthias Goergens 2026-09-30  4763  		ni->allocated_size = org_alloc_size;
e43715851cf184a Matthias Goergens 2026-09-30  4764  		write_unlock_irqrestore(&ni->size_lock, flags);
e43715851cf184a Matthias Goergens 2026-09-30  4765  	}
495e90fa334828d Namjae Jeon       2026-02-13  4766  	if (err2) {
495e90fa334828d Namjae Jeon       2026-02-13  4767  		/*
495e90fa334828d Namjae Jeon       2026-02-13  4768  		 * Failed to truncate the runlist, so just throw it away, it
495e90fa334828d Namjae Jeon       2026-02-13  4769  		 * will be mapped afresh on next use.
495e90fa334828d Namjae Jeon       2026-02-13  4770  		 */
495e90fa334828d Namjae Jeon       2026-02-13  4771  		kvfree(ni->runlist.rl);
495e90fa334828d Namjae Jeon       2026-02-13  4772  		ni->runlist.rl = NULL;
495e90fa334828d Namjae Jeon       2026-02-13  4773  		ntfs_error(sb, "Couldn't truncate runlist. Rollback failed");
495e90fa334828d Namjae Jeon       2026-02-13  4774  	} else {
495e90fa334828d Namjae Jeon       2026-02-13  4775  		/* Restore mapping pairs. */
e29de9195f6424a Matthias Goergens 2026-10-01  4776  		if (__ntfs_attr_update_mapping_pairs(ni, 0, ni, true))
495e90fa334828d Namjae Jeon       2026-02-13  4777  			ntfs_error(sb, "Failed to restore old mapping pairs");
495e90fa334828d Namjae Jeon       2026-02-13  4778  
495e90fa334828d Namjae Jeon       2026-02-13  4779  		if (NInoSparse(ni) || NInoCompressed(ni)) {
495e90fa334828d Namjae Jeon       2026-02-13  4780  			ni->itype.compressed.size =  org_compressed_size;
495e90fa334828d Namjae Jeon       2026-02-13  4781  			VFS_I(base_ni)->i_blocks = ni->itype.compressed.size >> 9;
495e90fa334828d Namjae Jeon       2026-02-13  4782  		} else
495e90fa334828d Namjae Jeon       2026-02-13  4783  			VFS_I(base_ni)->i_blocks = ni->allocated_size >> 9;
495e90fa334828d Namjae Jeon       2026-02-13  4784  	}
e29de9195f6424a Matthias Goergens 2026-10-01  4785  	if (!runlist_locked)
e29de9195f6424a Matthias Goergens 2026-10-01  4786  		up_write(&ni->runlist.lock);
495e90fa334828d Namjae Jeon       2026-02-13  4787  	if (ctx)
495e90fa334828d Namjae Jeon       2026-02-13  4788  		ntfs_attr_put_search_ctx(ctx);
495e90fa334828d Namjae Jeon       2026-02-13  4789  	return err;
495e90fa334828d Namjae Jeon       2026-02-13  4790  put_err_out:
495e90fa334828d Namjae Jeon       2026-02-13  4791  	if (ctx)
495e90fa334828d Namjae Jeon       2026-02-13  4792  		ntfs_attr_put_search_ctx(ctx);
495e90fa334828d Namjae Jeon       2026-02-13  4793  	return err;
e29de9195f6424a Matthias Goergens 2026-10-01  4794  unlock_runlist:
e29de9195f6424a Matthias Goergens 2026-10-01  4795  	if (!runlist_locked)
e29de9195f6424a Matthias Goergens 2026-10-01  4796  		up_write(&ni->runlist.lock);
e29de9195f6424a Matthias Goergens 2026-10-01  4797  	return err;
495e90fa334828d Namjae Jeon       2026-02-13  4798  }
495e90fa334828d Namjae Jeon       2026-02-13  4799  

:::::: The code at line 4719 was first introduced by commit
:::::: 495e90fa334828d4119061e2726af51d0a0fb4ed ntfs: update attrib operations

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
