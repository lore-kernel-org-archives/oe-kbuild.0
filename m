Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BCC82C60
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Mar 2025 14:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742738919; cv=none; b=UEgd+JhOJKiFT/0paQJl1POKdQj1apHXbWbi8iHX/AvraL7YY8ZTt43RFDd93tl+sQhefkh+LgH0ctK2v1wG8ZGITjHONEJEBi5VoNKokf3LadWRap0O9oKy/AG+Qph0F27xR0iECz/0PYSEV//yzc7COk4rsw/j48vmUneWtKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742738919; c=relaxed/simple;
	bh=Vi6m3DHj20iWyLKG3xcokJF4KBd1wIC19d9VIbDZgOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QJaNWSCPx4tMe2h5jQAwQMN0zKTuc6NQ/QEbeRL3PedKGkZxN+bccx2HeN+UxvbM4HbNhE9yHjgYnKi02uNpTe+15AcfauYM9/bDbj+Ybbzpnvd2SQ35ReSX9ivLxlWuvO3L+N4ujzMD1WFboFqzA1AZT7Nl8sdHGd22pvGBpzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D/l9q19b; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D/l9q19b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742738918; x=1774274918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vi6m3DHj20iWyLKG3xcokJF4KBd1wIC19d9VIbDZgOQ=;
  b=D/l9q19bFt6Q2xJq1Lsi8Ou45oyIEXqbS7mNQ19ZuLUpf3l1KbC2rBlp
   9kBqNpoFiRK0Y/Z2u+dudOPkdKyw9FYJRJFgjFb5hxhCmKpq7YJC51Gbm
   F2r3VQhmo15mGunMgeawZg9HrfIWZZdiit0a9SJyzfWSg99bz80XqawXC
   UaQ4+aC6vv610QQ1mZ8ezcniZ6viLoku/icvi8jc3PyT++GNF787nXjKX
   FH7iG8ZXNeq+zcQGdXqTQV6edom3qbEm1fHr7geC7Qm4Q4tLU6MK6E7E2
   r6LQz0guIDAdBeSkvg1AovjwK902xr3DGl3ktdVUbkOXHmnfyOecKOkCn
   Q==;
X-CSE-ConnectionGUID: N1Z0DRO4QTmO5DDm+YMaVw==
X-CSE-MsgGUID: O1sH5zZBTXWUGp3IXN7CRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="47604201"
X-IronPort-AV: E=Sophos;i="6.14,270,1736841600"; 
   d="scan'208";a="47604201"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2025 07:08:36 -0700
X-CSE-ConnectionGUID: nfdPysefS++RJfOdhgXAbw==
X-CSE-MsgGUID: 0CT2ERgoSHK6Rf6jbbuXCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,270,1736841600"; 
   d="scan'208";a="128923661"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 23 Mar 2025 07:08:34 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twM08-0002mH-0T;
	Sun, 23 Mar 2025 14:08:32 +0000
Date: Sun, 23 Mar 2025 22:08:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bcachefs:bcachefs-testing 172/190] fs/bcachefs/io_write.c:900
 bch2_write_prep_encoded_data() warn: missing unwind goto?
Message-ID: <202503240039.gKv6sFvd-lkp@intel.com>
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
CC: Kent Overstreet <kent.overstreet@linux.dev>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   b4de3a7a16a7408d1387efb8636c6702c2c288d8
commit: 6221f750e3033fa1e21ef70f427d3f77a98bdb88 [172/190] bcachefs: bch2_write_prep_encoded_data() now returns errcode
:::::: branch date: 20 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250323 (https://download.01.org/0day-ci/archive/20250324/202503240039.gKv6sFvd-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503240039.gKv6sFvd-lkp@intel.com/

smatch warnings:
fs/bcachefs/io_write.c:900 bch2_write_prep_encoded_data() warn: missing unwind goto?

vim +900 fs/bcachefs/io_write.c

1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  837  
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  838  static noinline int bch2_write_prep_encoded_data(struct bch_write_op *op, struct write_point *wp)
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  839  {
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  840  	struct bch_fs *c = op->c;
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  841  	struct bio *bio = &op->wbio.bio;
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  842  	struct nonce nonce = extent_nonce(op->version, op->crc);
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  843  	int ret = 0;
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  844  
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  845  	BUG_ON(bio_sectors(bio) != op->crc.compressed_size);
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  846  
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  847  	/* Can we just write the entire extent as is? */
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  848  	if (op->crc.uncompressed_size == op->crc.live_size &&
2d3908129147075 fs/bcachefs/io_write.c Kent Overstreet 2023-10-22  849  	    op->crc.uncompressed_size <= c->opts.encoded_extent_max >> 9 &&
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  850  	    op->crc.compressed_size <= wp->sectors_free &&
986e9842fb6825f fs/bcachefs/io.c       Kent Overstreet 2023-07-12  851  	    (op->crc.compression_type == bch2_compression_opt_to_type(op->compression_opt) ||
ab05de4ce4a1b80 fs/bcachefs/io.c       Kent Overstreet 2018-02-23  852  	     op->incompressible)) {
ab05de4ce4a1b80 fs/bcachefs/io.c       Kent Overstreet 2018-02-23  853  		if (!crc_is_compressed(op->crc) &&
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  854  		    op->csum_type != op->crc.csum_type) {
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  855  			ret = bch2_write_rechecksum(c, op, op->csum_type);
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  856  			if (ret)
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  857  				return ret;
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  858  		}
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  859  
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  860  		return 1;
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  861  	}
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  862  
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  863  	/*
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  864  	 * If the data is compressed and we couldn't write the entire extent as
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  865  	 * is, we have to decompress it:
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  866  	 */
ab05de4ce4a1b80 fs/bcachefs/io.c       Kent Overstreet 2018-02-23  867  	if (crc_is_compressed(op->crc)) {
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  868  		/* Last point we can still verify checksum: */
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  869  		struct bch_csum csum = bch2_checksum_bio(c, op->crc.csum_type, nonce, bio);
970a5096acc223e fs/bcachefs/io.c       Kent Overstreet 2023-07-16  870  		if (bch2_crc_cmp(op->crc.csum, csum) && !c->opts.no_data_io)
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  871  			goto csum_err;
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  872  
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  873  		if (bch2_csum_type_is_encryption(op->crc.csum_type)) {
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  874  			ret = bch2_encrypt_bio(c, op->crc.csum_type, nonce, bio);
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  875  			if (ret)
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  876  				return ret;
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  877  
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  878  			op->crc.csum_type = 0;
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  879  			op->crc.csum = (struct bch_csum) { 0, 0 };
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  880  		}
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  881  
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  882  		ret = bch2_bio_uncompress_inplace(op, bio);
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  883  		if (ret)
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  884  			return ret;
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  885  	}
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  886  
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  887  	/*
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  888  	 * No longer have compressed data after this point - data might be
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  889  	 * encrypted:
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  890  	 */
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  891  
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  892  	/*
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  893  	 * If the data is checksummed and we're only writing a subset,
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  894  	 * rechecksum and adjust bio to point to currently live data:
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  895  	 */
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  896  	if (op->crc.live_size != op->crc.uncompressed_size ||
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  897  	    op->crc.csum_type != op->csum_type) {
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  898  		ret = bch2_write_rechecksum(c, op, op->csum_type);
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  899  		if (ret)
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20 @900  			return ret;
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  901  	}
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  902  
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  903  	/*
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  904  	 * If we want to compress the data, it has to be decrypted:
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  905  	 */
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  906  	if (bch2_csum_type_is_encryption(op->crc.csum_type) &&
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  907  	    (op->compression_opt || op->crc.csum_type != op->csum_type)) {
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  908  		struct bch_csum csum = bch2_checksum_bio(c, op->crc.csum_type, nonce, bio);
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  909  		if (bch2_crc_cmp(op->crc.csum, csum) && !c->opts.no_data_io)
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  910  			goto csum_err;
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  911  
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  912  		ret = bch2_encrypt_bio(c, op->crc.csum_type, nonce, bio);
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  913  		if (ret)
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  914  			return ret;
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  915  
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  916  		op->crc.csum_type = 0;
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  917  		op->crc.csum = (struct bch_csum) { 0, 0 };
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  918  	}
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  919  
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  920  	return 0;
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  921  csum_err:
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  922  	bch2_write_csum_err_msg(op);
6221f750e3033fa fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  923  	return -EIO;
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  924  }
1c6fdbd8f2465dd fs/bcachefs/io.c       Kent Overstreet 2017-03-16  925  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
