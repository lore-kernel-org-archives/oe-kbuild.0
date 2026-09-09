Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7B8435A86
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Sep 2026 20:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788987284; cv=none; b=DZt/RUde/gO0PdE/VZmSICjuFUDEygE1GFxC5uuPRpxxDlew0j+wi0DGJRZ2VhccylbMtEfot1rL42BpwWG+zKe3fw3jBX0KKTi0pGUIUqFZG7zFm8Q3BVh1GDug02yGL5KuYzWaQroEttmX4lkKRqkllBEU3lBctHJa93nEf74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788987284; c=relaxed/simple;
	bh=6ePvyNTgc6JTUvlzj0JTHNdggk8gCvnhy+YnpwGG1gM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oca0iSCk75VN0zQ5ef7/uRPzkwvmSRjs50NJUBEk5indobR28HFpJZz2lPPvASDf0j3kx1V/zktXmrTIqmxjC08qPx9SNrctkGD/EvbCzCJlJ5hz/kZFvwE3kRTeynuC8lrpPYR3pFOYgQ1L6i1NTpLk6DQiYfNlYqPdgqLOpcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NvAm2B64; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NvAm2B64"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788987276; x=1820523276;
  h=date:from:to:cc:subject:message-id;
  bh=6ePvyNTgc6JTUvlzj0JTHNdggk8gCvnhy+YnpwGG1gM=;
  b=NvAm2B64e7KLrn4diZ964i5CMh3BB11OUoGTWSd/WTzwSQq01OVii9Ff
   OSVpVhclAqe6UOccYfotkzFn11YWXpkzbGdDkJ6+Xmf1VLhjEZvzdoCi3
   wtBA//DedNQ4W8YcQVGxIbxuLk94s4PJS7p8qVcWb3HaHD8LCWRWxyozm
   J4vN4nffYtLw0lQoMJWyTgV6m1NrDWV3wQFRoY3Uag4fmQFD7s/Q2f+1O
   HmOBqm+UCPT0sDIagYOnUr54RwkXFWl0QdQw49uL8RoiRz1Ewn+QZ44Lq
   0vfB9dCzpzFLZcTnW6ljApbHryr/CKbbg0EaJHJSI8ZWGBsCeQinCO7W4
   w==;
X-CSE-ConnectionGUID: Mh43FZs1Qk2p4EdCSkOQkg==
X-CSE-MsgGUID: sj5eyaiJQb+1bPy8mPcEhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89467608"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="89467608"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 13:54:32 -0700
X-CSE-ConnectionGUID: 0ogELjbNTWue3lSXNdFKlA==
X-CSE-MsgGUID: nT1RpfrtQm2aRofrHpVBTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="271913758"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Sep 2026 13:54:31 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4PJM-000000000vI-2Xil;
	Wed, 09 Sep 2026 20:54:28 +0000
Date: Thu, 10 Sep 2026 04:54:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4387/5391] fs/ntfs/mft.c:1065
 mft_bitmap_alloc_free_rec() warn: mask and shift to zero: expr='bit >> 3'
Message-ID: <202609100452.olYH79h9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Namjae Jeon <linkinjeon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c68a982815dcce5464e3bf2a31ac94f5146c04ca
commit: 56a997d6008519d3a600a3bff064b850d6edbef7 [4387/5391] ntfs: use dynamic MFT tail reservation
:::::: branch date: 6 hours ago
:::::: commit date: 35 hours ago
config: x86_64-randconfig-161-20260909 (https://download.01.org/0day-ci/archive/20260910/202609100452.olYH79h9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609100452.olYH79h9-lkp@intel.com/

New smatch warnings:
fs/ntfs/mft.c:1065 mft_bitmap_alloc_free_rec() warn: mask and shift to zero: expr='bit >> 3'

Old smatch warnings:
fs/ntfs/mft.c:2686 ntfs_mft_record_alloc() error: we previously assumed '*ni' could be null (see line 2156)

vim +1065 fs/ntfs/mft.c

56a997d6008519d Namjae Jeon   2026-09-08   957  
56a997d6008519d Namjae Jeon   2026-09-08   958  /*
56a997d6008519d Namjae Jeon   2026-09-08   959   * mft_bitmap_alloc_free_rec - find and allocate a free MFT record
1e9ea7e04472d4e Namjae Jeon   2025-12-30   960   * @vol:	volume on which to search for a free mft record
1e9ea7e04472d4e Namjae Jeon   2025-12-30   961   * @base_ni:	open base inode if allocating an extent mft record or NULL
56a997d6008519d Namjae Jeon   2026-09-08   962   * @max_mft_no:	first record which must not be allocated, or -1
56a997d6008519d Namjae Jeon   2026-09-08   963   * @new_reserve_end: if not NULL, end of a free run starting after the result
1e9ea7e04472d4e Namjae Jeon   2025-12-30   964   *
1e9ea7e04472d4e Namjae Jeon   2025-12-30   965   * Search for a free mft record in the mft bitmap attribute on the ntfs volume
1e9ea7e04472d4e Namjae Jeon   2025-12-30   966   * @vol.
1e9ea7e04472d4e Namjae Jeon   2025-12-30   967   *
1e9ea7e04472d4e Namjae Jeon   2025-12-30   968   * If @base_ni is NULL start the search at the default allocator position.
1e9ea7e04472d4e Namjae Jeon   2025-12-30   969   *
1e9ea7e04472d4e Namjae Jeon   2025-12-30   970   * If @base_ni is not NULL start the search at the mft record after the base
1e9ea7e04472d4e Namjae Jeon   2025-12-30   971   * mft record @base_ni.
1e9ea7e04472d4e Namjae Jeon   2025-12-30   972   *
1e9ea7e04472d4e Namjae Jeon   2025-12-30   973   * Return the free mft record on success and -errno on error.  An error code of
1e9ea7e04472d4e Namjae Jeon   2025-12-30   974   * -ENOSPC means that there are no free mft records in the currently
1e9ea7e04472d4e Namjae Jeon   2025-12-30   975   * initialized mft bitmap.
1e9ea7e04472d4e Namjae Jeon   2025-12-30   976   *
1e9ea7e04472d4e Namjae Jeon   2025-12-30   977   * Locking: Caller must hold vol->mftbmp_lock for writing.
1e9ea7e04472d4e Namjae Jeon   2025-12-30   978   */
56a997d6008519d Namjae Jeon   2026-09-08   979  static s64 mft_bitmap_alloc_free_rec(struct ntfs_volume *vol,
56a997d6008519d Namjae Jeon   2026-09-08   980  				     struct ntfs_inode *base_ni,
56a997d6008519d Namjae Jeon   2026-09-08   981  				     s64 max_mft_no, s64 *new_reserve_end)
1e9ea7e04472d4e Namjae Jeon   2025-12-30   982  {
1e9ea7e04472d4e Namjae Jeon   2025-12-30   983  	s64 pass_end, ll, data_pos, pass_start, ofs, bit;
56a997d6008519d Namjae Jeon   2026-09-08   984  	s64 initialized_mft_records;
1e9ea7e04472d4e Namjae Jeon   2025-12-30   985  	unsigned long flags;
1e9ea7e04472d4e Namjae Jeon   2025-12-30   986  	struct address_space *mftbmp_mapping;
115380f9a2f9675 Namjae Jeon   2026-02-13   987  	u8 *buf = NULL, *byte;
115380f9a2f9675 Namjae Jeon   2026-02-13   988  	struct folio *folio;
115380f9a2f9675 Namjae Jeon   2026-02-13   989  	unsigned int folio_ofs, size;
1e9ea7e04472d4e Namjae Jeon   2025-12-30   990  	u8 pass, b;
1e9ea7e04472d4e Namjae Jeon   2025-12-30   991  
115380f9a2f9675 Namjae Jeon   2026-02-13   992  	ntfs_debug("Searching for free mft record in the currently initialized mft bitmap.");
1e9ea7e04472d4e Namjae Jeon   2025-12-30   993  	mftbmp_mapping = vol->mftbmp_ino->i_mapping;
1e9ea7e04472d4e Namjae Jeon   2025-12-30   994  	/*
1e9ea7e04472d4e Namjae Jeon   2025-12-30   995  	 * Set the end of the pass making sure we do not overflow the mft
1e9ea7e04472d4e Namjae Jeon   2025-12-30   996  	 * bitmap.
1e9ea7e04472d4e Namjae Jeon   2025-12-30   997  	 */
1e9ea7e04472d4e Namjae Jeon   2025-12-30   998  	read_lock_irqsave(&NTFS_I(vol->mft_ino)->size_lock, flags);
1e9ea7e04472d4e Namjae Jeon   2025-12-30   999  	pass_end = NTFS_I(vol->mft_ino)->allocated_size >>
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1000  			vol->mft_record_size_bits;
56a997d6008519d Namjae Jeon   2026-09-08  1001  	initialized_mft_records = NTFS_I(vol->mft_ino)->initialized_size >>
56a997d6008519d Namjae Jeon   2026-09-08  1002  			vol->mft_record_size_bits;
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1003  	read_unlock_irqrestore(&NTFS_I(vol->mft_ino)->size_lock, flags);
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1004  	read_lock_irqsave(&NTFS_I(vol->mftbmp_ino)->size_lock, flags);
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1005  	ll = NTFS_I(vol->mftbmp_ino)->initialized_size << 3;
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1006  	read_unlock_irqrestore(&NTFS_I(vol->mftbmp_ino)->size_lock, flags);
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1007  	if (pass_end > ll)
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1008  		pass_end = ll;
56a997d6008519d Namjae Jeon   2026-09-08  1009  	if (max_mft_no >= 0 && pass_end > max_mft_no)
56a997d6008519d Namjae Jeon   2026-09-08  1010  		pass_end = max_mft_no;
56a997d6008519d Namjae Jeon   2026-09-08  1011  	if (base_ni && base_ni->mft_no == FILE_MFT) {
56a997d6008519d Namjae Jeon   2026-09-08  1012  		data_pos = FILE_first_user;
56a997d6008519d Namjae Jeon   2026-09-08  1013  		pass = 2;
56a997d6008519d Namjae Jeon   2026-09-08  1014  		if (data_pos >= pass_end)
56a997d6008519d Namjae Jeon   2026-09-08  1015  			return -ENOSPC;
56a997d6008519d Namjae Jeon   2026-09-08  1016  	} else {
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1017  		pass = 1;
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1018  		if (!base_ni)
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1019  			data_pos = vol->mft_data_pos;
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1020  		else
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1021  			data_pos = base_ni->mft_no + 1;
56a997d6008519d Namjae Jeon   2026-09-08  1022  		if (data_pos < FIRST_NORMAL_MFT_RECORD)
56a997d6008519d Namjae Jeon   2026-09-08  1023  			data_pos = FIRST_NORMAL_MFT_RECORD;
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1024  		if (data_pos >= pass_end) {
56a997d6008519d Namjae Jeon   2026-09-08  1025  			data_pos = FIRST_NORMAL_MFT_RECORD;
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1026  			pass = 2;
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1027  			/* This happens on a freshly formatted volume. */
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1028  			if (data_pos >= pass_end)
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1029  				return -ENOSPC;
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1030  		}
115380f9a2f9675 Namjae Jeon   2026-02-13  1031  	}
115380f9a2f9675 Namjae Jeon   2026-02-13  1032  
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1033  	pass_start = data_pos;
115380f9a2f9675 Namjae Jeon   2026-02-13  1034  	ntfs_debug("Starting bitmap search: pass %u, pass_start 0x%llx, pass_end 0x%llx, data_pos 0x%llx.",
115380f9a2f9675 Namjae Jeon   2026-02-13  1035  			pass, pass_start, pass_end, data_pos);
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1036  	/* Loop until a free mft record is found. */
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1037  	for (; pass <= 2;) {
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1038  		/* Cap size to pass_end. */
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1039  		ofs = data_pos >> 3;
115380f9a2f9675 Namjae Jeon   2026-02-13  1040  		folio_ofs = ofs & ~PAGE_MASK;
115380f9a2f9675 Namjae Jeon   2026-02-13  1041  		size = PAGE_SIZE - folio_ofs;
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1042  		ll = ((pass_end + 7) >> 3) - ofs;
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1043  		if (size > ll)
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1044  			size = ll;
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1045  		size <<= 3;
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1046  		/*
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1047  		 * If we are still within the active pass, search the next page
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1048  		 * for a zero bit.
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1049  		 */
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1050  		if (size) {
115380f9a2f9675 Namjae Jeon   2026-02-13  1051  			folio = read_mapping_folio(mftbmp_mapping,
115380f9a2f9675 Namjae Jeon   2026-02-13  1052  					ofs >> PAGE_SHIFT, NULL);
115380f9a2f9675 Namjae Jeon   2026-02-13  1053  			if (IS_ERR(folio)) {
115380f9a2f9675 Namjae Jeon   2026-02-13  1054  				ntfs_error(vol->sb, "Failed to read mft bitmap, aborting.");
115380f9a2f9675 Namjae Jeon   2026-02-13  1055  				return PTR_ERR(folio);
115380f9a2f9675 Namjae Jeon   2026-02-13  1056  			}
115380f9a2f9675 Namjae Jeon   2026-02-13  1057  			folio_lock(folio);
115380f9a2f9675 Namjae Jeon   2026-02-13  1058  			buf = (u8 *)kmap_local_folio(folio, 0) + folio_ofs;
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1059  			bit = data_pos & 7;
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1060  			data_pos &= ~7ull;
115380f9a2f9675 Namjae Jeon   2026-02-13  1061  			ntfs_debug("Before inner for loop: size 0x%x, data_pos 0x%llx, bit 0x%llx",
115380f9a2f9675 Namjae Jeon   2026-02-13  1062  					size, data_pos, bit);
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1063  			for (; bit < size && data_pos + bit < pass_end;
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1064  					bit &= ~7ull, bit += 8) {
1e9ea7e04472d4e Namjae Jeon   2025-12-30 @1065  				byte = buf + (bit >> 3);
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1066  				if (*byte == 0xff)
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1067  					continue;
56a997d6008519d Namjae Jeon   2026-09-08  1068  				b = bit & 7;
56a997d6008519d Namjae Jeon   2026-09-08  1069  				for (; b < 8; b++) {
56a997d6008519d Namjae Jeon   2026-09-08  1070  					if (*byte & (1 << b))
56a997d6008519d Namjae Jeon   2026-09-08  1071  						continue;
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1072  					ll = data_pos + (bit & ~7ull) + b;
56a997d6008519d Namjae Jeon   2026-09-08  1073  					if (ll >= pass_end)
56a997d6008519d Namjae Jeon   2026-09-08  1074  						break;
56a997d6008519d Namjae Jeon   2026-09-08  1075  					/* Keep the dynamic tail reserve for $MFT metadata. */
56a997d6008519d Namjae Jeon   2026-09-08  1076  					if ((!base_ni || base_ni->mft_no != FILE_MFT) &&
56a997d6008519d Namjae Jeon   2026-09-08  1077  					    ll >= vol->mft_record_reserve_pos &&
56a997d6008519d Namjae Jeon   2026-09-08  1078  					    ll < vol->mft_record_reserve_end)
56a997d6008519d Namjae Jeon   2026-09-08  1079  						continue;
679ee5afd5b4764 DaeMyung Kang 2026-05-09  1080  					if (unlikely(ll >= (1ll << 32))) {
115380f9a2f9675 Namjae Jeon   2026-02-13  1081  						folio_unlock(folio);
115380f9a2f9675 Namjae Jeon   2026-02-13  1082  						kunmap_local(buf);
115380f9a2f9675 Namjae Jeon   2026-02-13  1083  						folio_put(folio);
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1084  						return -ENOSPC;
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1085  					}
56a997d6008519d Namjae Jeon   2026-09-08  1086  					goto found;
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1087  				}
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1088  			}
115380f9a2f9675 Namjae Jeon   2026-02-13  1089  			ntfs_debug("After inner for loop: size 0x%x, data_pos 0x%llx, bit 0x%llx",
115380f9a2f9675 Namjae Jeon   2026-02-13  1090  					size, data_pos, bit);
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1091  			data_pos += size;
115380f9a2f9675 Namjae Jeon   2026-02-13  1092  			folio_unlock(folio);
115380f9a2f9675 Namjae Jeon   2026-02-13  1093  			kunmap_local(buf);
115380f9a2f9675 Namjae Jeon   2026-02-13  1094  			folio_put(folio);
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1095  			/*
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1096  			 * If the end of the pass has not been reached yet,
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1097  			 * continue searching the mft bitmap for a zero bit.
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1098  			 */
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1099  			if (data_pos < pass_end)
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1100  				continue;
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1101  		}
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1102  		/* Do the next pass. */
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1103  		if (++pass == 2) {
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1104  			/*
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1105  			 * Starting the second pass, in which we scan the first
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1106  			 * part of the zone which we omitted earlier.
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1107  			 */
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1108  			pass_end = pass_start;
56a997d6008519d Namjae Jeon   2026-09-08  1109  			data_pos = FIRST_NORMAL_MFT_RECORD;
56a997d6008519d Namjae Jeon   2026-09-08  1110  			pass_start = FIRST_NORMAL_MFT_RECORD;
115380f9a2f9675 Namjae Jeon   2026-02-13  1111  			ntfs_debug("pass %i, pass_start 0x%llx, pass_end 0x%llx.",
115380f9a2f9675 Namjae Jeon   2026-02-13  1112  					pass, pass_start, pass_end);
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1113  			if (data_pos >= pass_end)
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1114  				break;
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1115  		}
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1116  	}
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1117  	/* No free mft records in currently initialized mft bitmap. */
115380f9a2f9675 Namjae Jeon   2026-02-13  1118  	ntfs_debug("Done.  (No free mft records left in currently initialized mft bitmap.)");
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1119  	return -ENOSPC;
56a997d6008519d Namjae Jeon   2026-09-08  1120  found:
56a997d6008519d Namjae Jeon   2026-09-08  1121  	if (new_reserve_end)
56a997d6008519d Namjae Jeon   2026-09-08  1122  		*new_reserve_end = mft_reserve_end(buf, data_pos,
56a997d6008519d Namjae Jeon   2026-09-08  1123  						   data_pos + size, ll, pass_end,
56a997d6008519d Namjae Jeon   2026-09-08  1124  						   initialized_mft_records);
56a997d6008519d Namjae Jeon   2026-09-08  1125  	*byte |= 1 << b;
56a997d6008519d Namjae Jeon   2026-09-08  1126  	folio_mark_dirty(folio);
56a997d6008519d Namjae Jeon   2026-09-08  1127  	folio_unlock(folio);
56a997d6008519d Namjae Jeon   2026-09-08  1128  	kunmap_local(buf);
56a997d6008519d Namjae Jeon   2026-09-08  1129  	folio_put(folio);
56a997d6008519d Namjae Jeon   2026-09-08  1130  	ntfs_debug("Done.  (Found and allocated mft record 0x%llx.)", ll);
56a997d6008519d Namjae Jeon   2026-09-08  1131  	return ll;
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1132  }
1e9ea7e04472d4e Namjae Jeon   2025-12-30  1133  

:::::: The code at line 1065 was first introduced by commit
:::::: 1e9ea7e04472d4e5e12e58c881eaacfb3e49b669 Revert "fs: Remove NTFS classic"

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
