Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502E2304976
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 01:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778723467; cv=none; b=b/n7dfvDwL+O/xz3MN/30d20H9PhaO8j6pb21P7W8FQCHzXIDv2r14xpEse+QfqZb50FKLBP6fPNnfAfFFxjbbppZlrRMDAc4zCRcymzwHCcNkewf81Pk5zpoC1Cl30Rg4N6LEjQjCrOSKCXTXRSOkfR6jMQKNy2kDBgaZPdMlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778723467; c=relaxed/simple;
	bh=JhvCqbVjMV8Ik0FbqzAKhGMOCLZ+wAQavD51MH00n0M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SC7aOFa6EWfxHOu8s6qx21dlG38TlDLGVohaLW9z5RM0Tk4ak+R7GZhDhCSZ/H/ektY8iyL0s0V6T4+PuimpkAJoIChsAc3vSUvfgnR0qAmhI3LUgPcuDJ43kr8hwLbfzSOnULuIDWI/b8XNn8Zuv2xRWbSG9zjIVpoiWomwExw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PHODLbmo; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PHODLbmo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778723466; x=1810259466;
  h=date:from:to:cc:subject:message-id;
  bh=JhvCqbVjMV8Ik0FbqzAKhGMOCLZ+wAQavD51MH00n0M=;
  b=PHODLbmoD+U8ZF+UOs3OiHCa/WbWqW9wBG7Y+Z0RTC2wgGXo52FB9KrP
   6suXYm/d/TxgU2qzMmK3qjn+zJ0Jp66amkXHDaq437hkOgMH3GwiQSmki
   IZB75icqxRN/TFgWtHHmn+EMJXU3fLvo10CY0JIgmIwzSXTZi+WCMxnPM
   3SOWS2WozfLSMa4uetKH3HTnimw83G6nNpzSk5WhQcgLWjHb40H4k3gqX
   mAfFJs+pXqJWjeKfNhNtovh+BV6SMXlbGLUYf5mzPovpbcktrDUqo+KkH
   KIzmtS5dK4P5eP6C35Bs2hxuuaYibbOI4PXLLtaLUt+bHNGgmnw5l7IYI
   Q==;
X-CSE-ConnectionGUID: ueAOGtXBRoGHv2wXiTCBNA==
X-CSE-MsgGUID: ubIouBE0RxyPVvtirrzWCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79614526"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="79614526"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 18:51:06 -0700
X-CSE-ConnectionGUID: msvxeEJyTKu65Mwo4R5IHA==
X-CSE-MsgGUID: TeKV+c7uQZy3r0LUCy+PLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="238365350"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 May 2026 18:51:04 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNLE5-000000005ZZ-32Eg;
	Thu, 14 May 2026 01:51:01 +0000
Date: Thu, 14 May 2026 09:50:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 465/799]
 fs/bcachefs/data/write.c:953 bch2_write_prep_encoded_data() warn: missing
 unwind goto?
Message-ID: <202605140925.BEsZBO0D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 78e53242d57830619d4964261dda9934f4d18c47 [465/799] bcachefs: move data code to subdir
:::::: branch date: 6 months ago
:::::: commit date: 7 months ago
config: i386-randconfig-141-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140925.BEsZBO0D-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605140925.BEsZBO0D-lkp@intel.com/

New smatch warnings:
fs/bcachefs/data/write.c:953 bch2_write_prep_encoded_data() warn: missing unwind goto?
fs/bcachefs/data/extents.c:1227 bch2_extent_ptr_set_cached() warn: variable dereferenced before check 'ptr' (see line 1201)

Old smatch warnings:
fs/bcachefs/data/write.c:770 bch2_write_endio() error: we previously assumed 'ca' could be null (see line 752)

vim +953 fs/bcachefs/data/write.c

1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  889  
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  890  static noinline int bch2_write_prep_encoded_data(struct bch_write_op *op, struct write_point *wp)
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  891  {
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  892  	struct bch_fs *c = op->c;
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  893  	struct bio *bio = &op->wbio.bio;
a76db26a9698285 fs/bcachefs/io_write.c Kent Overstreet 2025-03-24  894  	struct bch_csum csum;
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  895  	int ret = 0;
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  896  
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  897  	BUG_ON(bio_sectors(bio) != op->crc.compressed_size);
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  898  
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  899  	/* Can we just write the entire extent as is? */
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  900  	if (op->crc.uncompressed_size == op->crc.live_size &&
2d3908129147075 fs/bcachefs/io_write.c Kent Overstreet 2023-10-22  901  	    op->crc.uncompressed_size <= c->opts.encoded_extent_max >> 9 &&
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  902  	    op->crc.compressed_size <= wp->sectors_free &&
986e9842fb6825f fs/bcachefs/io.c       Kent Overstreet 2023-07-12  903  	    (op->crc.compression_type == bch2_compression_opt_to_type(op->compression_opt) ||
ab05de4ce4a1b80 fs/bcachefs/io.c       Kent Overstreet 2018-02-23  904  	     op->incompressible)) {
ab05de4ce4a1b80 fs/bcachefs/io.c       Kent Overstreet 2018-02-23  905  		if (!crc_is_compressed(op->crc) &&
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  906  		    op->csum_type != op->crc.csum_type) {
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  907  			ret = bch2_write_rechecksum(c, op, op->csum_type);
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  908  			if (ret)
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  909  				return ret;
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  910  		}
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  911  
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  912  		return 1;
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  913  	}
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  914  
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  915  	/*
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  916  	 * If the data is compressed and we couldn't write the entire extent as
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  917  	 * is, we have to decompress it:
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  918  	 */
ab05de4ce4a1b80 fs/bcachefs/io.c       Kent Overstreet 2018-02-23  919  	if (crc_is_compressed(op->crc)) {
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  920  		/* Last point we can still verify checksum: */
5af61dbd96275e1 fs/bcachefs/io_write.c Kent Overstreet 2025-03-25  921  		struct nonce nonce = extent_nonce(op->version, op->crc);
a76db26a9698285 fs/bcachefs/io_write.c Kent Overstreet 2025-03-24  922  		csum = bch2_checksum_bio(c, op->crc.csum_type, nonce, bio);
970a5096acc223e fs/bcachefs/io.c       Kent Overstreet 2023-07-16  923  		if (bch2_crc_cmp(op->crc.csum, csum) && !c->opts.no_data_io)
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  924  			goto csum_err;
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  925  
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  926  		if (bch2_csum_type_is_encryption(op->crc.csum_type)) {
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  927  			ret = bch2_encrypt_bio(c, op->crc.csum_type, nonce, bio);
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  928  			if (ret)
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  929  				return ret;
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  930  
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  931  			op->crc.csum_type = 0;
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  932  			op->crc.csum = (struct bch_csum) { 0, 0 };
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  933  		}
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  934  
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  935  		ret = bch2_bio_uncompress_inplace(op, bio);
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  936  		if (ret)
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  937  			return ret;
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  938  	}
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  939  
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  940  	/*
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  941  	 * No longer have compressed data after this point - data might be
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  942  	 * encrypted:
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  943  	 */
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  944  
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  945  	/*
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  946  	 * If the data is checksummed and we're only writing a subset,
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  947  	 * rechecksum and adjust bio to point to currently live data:
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  948  	 */
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  949  	if (op->crc.live_size != op->crc.uncompressed_size ||
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  950  	    op->crc.csum_type != op->csum_type) {
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  951  		ret = bch2_write_rechecksum(c, op, op->csum_type);
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  952  		if (ret)
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20 @953  			return ret;
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  954  	}
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  955  
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  956  	/*
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  957  	 * If we want to compress the data, it has to be decrypted:
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  958  	 */
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  959  	if (bch2_csum_type_is_encryption(op->crc.csum_type) &&
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  960  	    (op->compression_opt || op->crc.csum_type != op->csum_type)) {
5af61dbd96275e1 fs/bcachefs/io_write.c Kent Overstreet 2025-03-25  961  		struct nonce nonce = extent_nonce(op->version, op->crc);
a76db26a9698285 fs/bcachefs/io_write.c Kent Overstreet 2025-03-24  962  		csum = bch2_checksum_bio(c, op->crc.csum_type, nonce, bio);
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  963  		if (bch2_crc_cmp(op->crc.csum, csum) && !c->opts.no_data_io)
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  964  			goto csum_err;
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  965  
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  966  		ret = bch2_encrypt_bio(c, op->crc.csum_type, nonce, bio);
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  967  		if (ret)
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  968  			return ret;
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  969  
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  970  		op->crc.csum_type = 0;
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  971  		op->crc.csum = (struct bch_csum) { 0, 0 };
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  972  	}
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  973  
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  974  	return 0;
127d90d2823ef45 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  975  csum_err:
a76db26a9698285 fs/bcachefs/io_write.c Kent Overstreet 2025-03-24  976  	bch2_write_op_error(op, op->pos.offset,
a76db26a9698285 fs/bcachefs/io_write.c Kent Overstreet 2025-03-24  977  		"error verifying existing checksum while moving existing data (memory corruption?)\n"
a76db26a9698285 fs/bcachefs/io_write.c Kent Overstreet 2025-03-24  978  		"  expected %0llx:%0llx got %0llx:%0llx type %s",
a76db26a9698285 fs/bcachefs/io_write.c Kent Overstreet 2025-03-24  979  		op->crc.csum.hi,
a76db26a9698285 fs/bcachefs/io_write.c Kent Overstreet 2025-03-24  980  		op->crc.csum.lo,
a76db26a9698285 fs/bcachefs/io_write.c Kent Overstreet 2025-03-24  981  		csum.hi,
a76db26a9698285 fs/bcachefs/io_write.c Kent Overstreet 2025-03-24  982  		csum.lo,
a76db26a9698285 fs/bcachefs/io_write.c Kent Overstreet 2025-03-24  983  		op->crc.csum_type < BCH_CSUM_NR
a76db26a9698285 fs/bcachefs/io_write.c Kent Overstreet 2025-03-24  984  		? __bch2_csum_types[op->crc.csum_type]
a76db26a9698285 fs/bcachefs/io_write.c Kent Overstreet 2025-03-24  985  		: "(unknown)");
09b9c72bd4b77a9 fs/bcachefs/io_write.c Kent Overstreet 2025-05-28  986  	return bch_err_throw(c, data_write_csum);
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  987  }
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  988  

:::::: The code at line 953 was first introduced by commit
:::::: 127d90d2823ef45dd37246aaf7bb0392e6231c38 bcachefs: bch2_write_prep_encoded_data() now returns errcode

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
