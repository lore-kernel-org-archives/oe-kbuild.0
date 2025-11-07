Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6529330DEC1
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Nov 2025 20:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762547725; cv=none; b=fHfObbkXsWBcnSjjA/klPhKdtlniLcLlYEzd+EsDlcoP/FLKUhGRMsccCfpaabEiMSD9tYYderbziGRmCRfJ6H0vEDBFD1qLHN9uOoce+OjeJJQlZX+kH0k05AcbFViRyrrvxt75Jl/4GaMetUSuebJ57XXAz4j8g6yOvcxKl0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762547725; c=relaxed/simple;
	bh=AS2YsuTQ/PNeKVFgisu5D8hewQHbFEExhRCdYWQOfbs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cg40fVFPligImgCt7CyYOz0W8uPdtstWWXPMs0ib1QVZ3OAEFMMkgUpT9pPOYe3Dl6SQD5gPEGRiNNRPYw/Me8+gUBsB8HeM+bUiZunHlLqf6mhyYhGJAeEZnbmx7Sl8qvqM0rDflH3MpMjMruFdH7C4pGTO0Ku9eet+Fwi0mlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gAloDfkF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gAloDfkF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762547723; x=1794083723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AS2YsuTQ/PNeKVFgisu5D8hewQHbFEExhRCdYWQOfbs=;
  b=gAloDfkFS8vxNTmBNSRwpPkPS451drw3uLaaw1ELHwPPeM3+p+N6Pq/l
   Gzoua+sUoGgftrwEusg4YztIKjXSVEr0ZZupXyFxTjNqUxn25LqivwLJ+
   NIKZUJwMyKLf2AI09Re+AwKEp04vI50DAHLqPAntb92/dO2Ue+G/Bb7qS
   C+T4Gn2qIlwx9IgUi5vEKWV6QC4SxHyQnH8kb3QMVp7tK6T/YaW5z/odv
   SK2F7w44KvjBeEBxmRNDiHSFltsYpnoPFE4v6Z7iA6/LVfFHFweAaVAvJ
   4UDfYyf9jnMP8pz/EDLyf2I7fVqxifSBAiZZETAoYzwgzQS1OyyOhB+VH
   A==;
X-CSE-ConnectionGUID: BoRzrPvkRoij1Pfxl8KPjw==
X-CSE-MsgGUID: ARK0GsIRTya2Rg0WVr+shg==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="67311583"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="67311583"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 12:35:22 -0800
X-CSE-ConnectionGUID: J3SegkV1R9O1DuBn3nCBVg==
X-CSE-MsgGUID: AWcjmCHwQfqRb7X8EuU/Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="192481736"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Nov 2025 12:35:21 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHTB1-0000Ln-0n;
	Fri, 07 Nov 2025 20:35:19 +0000
Date: Sat, 8 Nov 2025 04:34:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-testing 720/769]
 fs/bcachefs/data/extents.c:1352 bch2_bkey_ptrs_to_text() error: we
 previously assumed 'c' could be null (see line 1345)
Message-ID: <202511080430.CvyNQFtd-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   b03e9e378570732f3d301bcf3be415010f3d2888
commit: 44c1946444a82ad32156eeb7f8258c5e63372a56 [720/769] bcachefs: extent_entry_u64s() reads from bch_fs.extent_type_u64s
:::::: branch date: 4 hours ago
:::::: commit date: 29 hours ago
config: openrisc-randconfig-r073-20251108 (https://download.01.org/0day-ci/archive/20251108/202511080430.CvyNQFtd-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511080430.CvyNQFtd-lkp@intel.com/

New smatch warnings:
fs/bcachefs/data/extents.c:1352 bch2_bkey_ptrs_to_text() error: we previously assumed 'c' could be null (see line 1345)

Old smatch warnings:
fs/bcachefs/data/extents.c:1213 bch2_extent_ptr_set_cached() warn: variable dereferenced before check 'ptr' (see line 1187)

vim +/c +1352 fs/bcachefs/data/extents.c

bc02e6becd729d fs/bcachefs/extents.c      Kent Overstreet 2025-09-02  1338  
4409b8081d1624 fs/bcachefs/extents.c      Kent Overstreet 2024-03-11  1339  void bch2_bkey_ptrs_to_text(struct printbuf *out, struct bch_fs *c,
4409b8081d1624 fs/bcachefs/extents.c      Kent Overstreet 2024-03-11  1340  			    struct bkey_s_c k)
4409b8081d1624 fs/bcachefs/extents.c      Kent Overstreet 2024-03-11  1341  {
4409b8081d1624 fs/bcachefs/extents.c      Kent Overstreet 2024-03-11  1342  	struct bkey_ptrs_c ptrs = bch2_bkey_ptrs_c(k);
4409b8081d1624 fs/bcachefs/extents.c      Kent Overstreet 2024-03-11  1343  	const union bch_extent_entry *entry;
4409b8081d1624 fs/bcachefs/extents.c      Kent Overstreet 2024-03-11  1344  
4409b8081d1624 fs/bcachefs/extents.c      Kent Overstreet 2024-03-11 @1345  	if (c)
4409b8081d1624 fs/bcachefs/extents.c      Kent Overstreet 2024-03-11  1346  		prt_printf(out, "durability: %u ", bch2_bkey_durability_safe(c, k));
4409b8081d1624 fs/bcachefs/extents.c      Kent Overstreet 2024-03-11  1347  
bc02e6becd729d fs/bcachefs/extents.c      Kent Overstreet 2025-09-02  1348  	guard(printbuf_indent)(out);
b8ead3a8a663ac fs/bcachefs/data/extents.c Kent Overstreet 2025-10-13  1349  	guard(printbuf_atomic)(out);
b8ead3a8a663ac fs/bcachefs/data/extents.c Kent Overstreet 2025-10-13  1350  	guard(rcu)();
bc02e6becd729d fs/bcachefs/extents.c      Kent Overstreet 2025-09-02  1351  
4409b8081d1624 fs/bcachefs/extents.c      Kent Overstreet 2024-03-11 @1352  	bkey_extent_entry_for_each(ptrs, entry) {
bc02e6becd729d fs/bcachefs/extents.c      Kent Overstreet 2025-09-02  1353  		prt_newline(out);
bc02e6becd729d fs/bcachefs/extents.c      Kent Overstreet 2025-09-02  1354  
44c1946444a82a fs/bcachefs/data/extents.c Kent Overstreet 2025-11-05  1355  		unsigned type = extent_entry_type(entry);
bc02e6becd729d fs/bcachefs/extents.c      Kent Overstreet 2025-09-02  1356  		if (type < BCH_EXTENT_ENTRY_MAX) {
44c1946444a82a fs/bcachefs/data/extents.c Kent Overstreet 2025-11-05  1357  			prt_str(out, bch2_extent_entry_types[extent_entry_type(entry)]);
bc02e6becd729d fs/bcachefs/extents.c      Kent Overstreet 2025-09-02  1358  			prt_str(out, ": ");
bc02e6becd729d fs/bcachefs/extents.c      Kent Overstreet 2025-09-02  1359  		}
4409b8081d1624 fs/bcachefs/extents.c      Kent Overstreet 2024-03-11  1360  
bc02e6becd729d fs/bcachefs/extents.c      Kent Overstreet 2025-09-02  1361  		switch (type) {
4409b8081d1624 fs/bcachefs/extents.c      Kent Overstreet 2024-03-11  1362  		case BCH_EXTENT_ENTRY_ptr:
4409b8081d1624 fs/bcachefs/extents.c      Kent Overstreet 2024-03-11  1363  			bch2_extent_ptr_to_text(out, c, entry_to_ptr(entry));
4409b8081d1624 fs/bcachefs/extents.c      Kent Overstreet 2024-03-11  1364  			break;
4409b8081d1624 fs/bcachefs/extents.c      Kent Overstreet 2024-03-11  1365  
4de774952b1296 fs/bcachefs/extents.c      Kent Overstreet 2019-11-16  1366  		case BCH_EXTENT_ENTRY_crc32:
4de774952b1296 fs/bcachefs/extents.c      Kent Overstreet 2019-11-16  1367  		case BCH_EXTENT_ENTRY_crc64:
ef435abd6a9920 fs/bcachefs/extents.c      Kent Overstreet 2023-10-22  1368  		case BCH_EXTENT_ENTRY_crc128: {
ef435abd6a9920 fs/bcachefs/extents.c      Kent Overstreet 2023-10-22  1369  			struct bch_extent_crc_unpacked crc =
ef435abd6a9920 fs/bcachefs/extents.c      Kent Overstreet 2023-10-22  1370  				bch2_extent_crc_unpack(k.k, entry_to_crc(entry));
1c6fdbd8f2465d fs/bcachefs/extents.c      Kent Overstreet 2017-03-16  1371  
9d9d212e26399c fs/bcachefs/extents.c      Kent Overstreet 2024-06-28  1372  			bch2_extent_crc_unpacked_to_text(out, &crc);
4de774952b1296 fs/bcachefs/extents.c      Kent Overstreet 2019-11-16  1373  			break;
ef435abd6a9920 fs/bcachefs/extents.c      Kent Overstreet 2023-10-22  1374  		}
ef435abd6a9920 fs/bcachefs/extents.c      Kent Overstreet 2023-10-22  1375  		case BCH_EXTENT_ENTRY_stripe_ptr: {
ef435abd6a9920 fs/bcachefs/extents.c      Kent Overstreet 2023-10-22  1376  			const struct bch_extent_stripe_ptr *ec = &entry->stripe_ptr;
4de774952b1296 fs/bcachefs/extents.c      Kent Overstreet 2019-11-16  1377  
bc02e6becd729d fs/bcachefs/extents.c      Kent Overstreet 2025-09-02  1378  			prt_printf(out, "idx %llu block %u", (u64) ec->idx, ec->block);
4de774952b1296 fs/bcachefs/extents.c      Kent Overstreet 2019-11-16  1379  			break;
ef435abd6a9920 fs/bcachefs/extents.c      Kent Overstreet 2023-10-22  1380  		}
2d21d112538ea3 fs/bcachefs/extents.c      Kent Overstreet 2024-10-19  1381  		case BCH_EXTENT_ENTRY_rebalance:
2d21d112538ea3 fs/bcachefs/extents.c      Kent Overstreet 2024-10-19  1382  			bch2_extent_rebalance_to_text(out, c, &entry->rebalance);
fb3f57bb1177ae fs/bcachefs/extents.c      Kent Overstreet 2023-10-20  1383  			break;
2d21d112538ea3 fs/bcachefs/extents.c      Kent Overstreet 2024-10-19  1384  
4a90675cfe18ac fs/bcachefs/extents.c      Kent Overstreet 2025-02-24  1385  		case BCH_EXTENT_ENTRY_flags:
4a90675cfe18ac fs/bcachefs/extents.c      Kent Overstreet 2025-02-24  1386  			prt_bitflags(out, bch2_extent_flags_strs, entry->flags.flags);
4a90675cfe18ac fs/bcachefs/extents.c      Kent Overstreet 2025-02-24  1387  			break;
4a90675cfe18ac fs/bcachefs/extents.c      Kent Overstreet 2025-02-24  1388  
4de774952b1296 fs/bcachefs/extents.c      Kent Overstreet 2019-11-16  1389  		default:
44c1946444a82a fs/bcachefs/data/extents.c Kent Overstreet 2025-11-05  1390  			prt_printf(out, "(unknown extent entry %.16llx)", *((u64 *) entry));
4de774952b1296 fs/bcachefs/extents.c      Kent Overstreet 2019-11-16  1391  			return;
1c6fdbd8f2465d fs/bcachefs/extents.c      Kent Overstreet 2017-03-16  1392  		}
1c6fdbd8f2465d fs/bcachefs/extents.c      Kent Overstreet 2017-03-16  1393  	}
1c6fdbd8f2465d fs/bcachefs/extents.c      Kent Overstreet 2017-03-16  1394  }
1c6fdbd8f2465d fs/bcachefs/extents.c      Kent Overstreet 2017-03-16  1395  

:::::: The code at line 1352 was first introduced by commit
:::::: 4409b8081d1624af814a9cda781ad9cdda3973cb bcachefs: Repair pass for scanning for btree nodes

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
