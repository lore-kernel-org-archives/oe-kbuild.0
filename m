Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DD89463
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 05:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dNaPnHWt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699249171; x=1730785171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p4hHksG89GdD+p0MRATnmFjDsTCH/P+VEvVfkM4m2XQ=;
  b=dNaPnHWt20ByI39H3ti1p8HR2q/VUbqlbPLwfXxAET/LwFhgz/PbkBqE
   sq/4IXB0mDTjE3s5R12pW+yGZ7mCY2SWvX1qLA0a0v+uFFKEQqdGqsKy+
   QXQUPFSCG7p5q+FtSnYWBA6vxc+R5taHgKHMKxnfeU88NvrcKtDmUQVw4
   72e/HSnGClhJ/qzecbOeXBZp6/HB1Ai3xm7dnOpH6vlbfBbB4VPmC6Y4P
   1wNK9hz9FWL6g3dWVn/6lhh5KNwwFad/FRdOAhYSKVcpFDJmF5KHtL5DZ
   CZFdu8stUgMm6YeAWVgzWqk1sSVLpTyCeAfm/7TQDMRGX8rtIMdHh7PIZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="7846138"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="7846138"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 21:39:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="885790485"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="885790485"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Nov 2023 21:39:29 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzsKc-00069Q-1D;
	Mon, 06 Nov 2023 05:39:26 +0000
Date: Mon, 6 Nov 2023 13:37:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ebiggers:wip-crypto 14/14] drivers/md/dm-verity-target.c:509
 verity_compute_hash() warn: missing unwind goto?
Message-ID: <202311061342.RJVm8z01-lkp@intel.com>
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
TO: Eric Biggers <ebiggers@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-crypto
head:   656794a48aa8a5d6f411db4ec4279c7c6c80d3e9
commit: 656794a48aa8a5d6f411db4ec4279c7c6c80d3e9 [14/14] dm-verity: hash blocks with shash import+finup when possible
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: i386-randconfig-141-20231103 (https://download.01.org/0day-ci/archive/20231106/202311061342.RJVm8z01-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311061342.RJVm8z01-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311061342.RJVm8z01-lkp@intel.com/

smatch warnings:
drivers/md/dm-verity-target.c:509 verity_compute_hash() warn: missing unwind goto?

vim +509 drivers/md/dm-verity-target.c

d1ac3ff008fb9a Gilad Ben-Yossef 2017-02-19  471  
656794a48aa8a5 Eric Biggers     2023-10-29  472  static int verity_compute_hash(struct dm_verity *v, struct dm_verity_io *io,
656794a48aa8a5 Eric Biggers     2023-10-29  473  			       struct bvec_iter *iter, u8 *digest)
656794a48aa8a5 Eric Biggers     2023-10-29  474  {
656794a48aa8a5 Eric Biggers     2023-10-29  475  	int r;
656794a48aa8a5 Eric Biggers     2023-10-29  476  
656794a48aa8a5 Eric Biggers     2023-10-29  477  	if (static_branch_unlikely(&ahash_enabled) && !v->shash_tfm) {
656794a48aa8a5 Eric Biggers     2023-10-29  478  		struct ahash_request *req = verity_io_hash_req(v, io);
656794a48aa8a5 Eric Biggers     2023-10-29  479  		struct crypto_wait wait;
656794a48aa8a5 Eric Biggers     2023-10-29  480  
656794a48aa8a5 Eric Biggers     2023-10-29  481  		r = verity_ahash_init(v, req, &wait);
656794a48aa8a5 Eric Biggers     2023-10-29  482  		if (unlikely(r))
656794a48aa8a5 Eric Biggers     2023-10-29  483  			goto error;
656794a48aa8a5 Eric Biggers     2023-10-29  484  
656794a48aa8a5 Eric Biggers     2023-10-29  485  		r = verity_ahash_update_block(v, io, iter, &wait);
656794a48aa8a5 Eric Biggers     2023-10-29  486  		if (unlikely(r))
656794a48aa8a5 Eric Biggers     2023-10-29  487  			goto error;
656794a48aa8a5 Eric Biggers     2023-10-29  488  
656794a48aa8a5 Eric Biggers     2023-10-29  489  		r = verity_ahash_final(v, req, digest, &wait);
656794a48aa8a5 Eric Biggers     2023-10-29  490  		if (unlikely(r))
656794a48aa8a5 Eric Biggers     2023-10-29  491  			goto error;
656794a48aa8a5 Eric Biggers     2023-10-29  492  	} else {
656794a48aa8a5 Eric Biggers     2023-10-29  493  		struct shash_desc *desc = verity_io_hash_req(v, io);
656794a48aa8a5 Eric Biggers     2023-10-29  494  		struct bio *bio =
656794a48aa8a5 Eric Biggers     2023-10-29  495  			dm_bio_from_per_bio_data(io, v->ti->per_io_data_size);
656794a48aa8a5 Eric Biggers     2023-10-29  496  		struct bio_vec bv = bio_iter_iovec(bio, *iter);
656794a48aa8a5 Eric Biggers     2023-10-29  497  		const unsigned int len = 1 << v->data_dev_block_bits;
656794a48aa8a5 Eric Biggers     2023-10-29  498  		const void *virt;
656794a48aa8a5 Eric Biggers     2023-10-29  499  
656794a48aa8a5 Eric Biggers     2023-10-29  500  		if (unlikely(len > bv.bv_len)) {
656794a48aa8a5 Eric Biggers     2023-10-29  501  			/*
656794a48aa8a5 Eric Biggers     2023-10-29  502  			 * Data block spans pages.  This should not happen,
656794a48aa8a5 Eric Biggers     2023-10-29  503  			 * since this code path is not used if the data block
656794a48aa8a5 Eric Biggers     2023-10-29  504  			 * size is greater than the page size, and all I/O
656794a48aa8a5 Eric Biggers     2023-10-29  505  			 * should be data block aligned because dm-verity sets
656794a48aa8a5 Eric Biggers     2023-10-29  506  			 * logical_block_size to the data block size.
656794a48aa8a5 Eric Biggers     2023-10-29  507  			 */
656794a48aa8a5 Eric Biggers     2023-10-29  508  			DMERR_LIMIT("unaligned io (data block spans pages)");
656794a48aa8a5 Eric Biggers     2023-10-29 @509  			return -EIO;
656794a48aa8a5 Eric Biggers     2023-10-29  510  		}
656794a48aa8a5 Eric Biggers     2023-10-29  511  
656794a48aa8a5 Eric Biggers     2023-10-29  512  		desc->tfm = v->shash_tfm;
656794a48aa8a5 Eric Biggers     2023-10-29  513  		r = crypto_shash_import(desc, v->initial_hashstate);
656794a48aa8a5 Eric Biggers     2023-10-29  514  		if (unlikely(r))
656794a48aa8a5 Eric Biggers     2023-10-29  515  			goto error;
656794a48aa8a5 Eric Biggers     2023-10-29  516  
656794a48aa8a5 Eric Biggers     2023-10-29  517  		virt = bvec_kmap_local(&bv);
656794a48aa8a5 Eric Biggers     2023-10-29  518  		r = crypto_shash_finup(desc, virt, len, digest);
656794a48aa8a5 Eric Biggers     2023-10-29  519  		kunmap_local(virt);
656794a48aa8a5 Eric Biggers     2023-10-29  520  		if (unlikely(r))
656794a48aa8a5 Eric Biggers     2023-10-29  521  			goto error;
656794a48aa8a5 Eric Biggers     2023-10-29  522  
656794a48aa8a5 Eric Biggers     2023-10-29  523  		bio_advance_iter(bio, iter, len);
656794a48aa8a5 Eric Biggers     2023-10-29  524  	}
656794a48aa8a5 Eric Biggers     2023-10-29  525  	return 0;
656794a48aa8a5 Eric Biggers     2023-10-29  526  
656794a48aa8a5 Eric Biggers     2023-10-29  527  error:
656794a48aa8a5 Eric Biggers     2023-10-29  528  	DMERR("Error hashing block from bio iter: %d", r);
656794a48aa8a5 Eric Biggers     2023-10-29  529  	return r;
656794a48aa8a5 Eric Biggers     2023-10-29  530  }
656794a48aa8a5 Eric Biggers     2023-10-29  531  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
