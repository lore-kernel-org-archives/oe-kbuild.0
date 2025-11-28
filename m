Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186891FC8
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Nov 2025 03:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764300176; cv=none; b=dgXoqUH4BnD30rxw6zXzS/GYvcl525cOJLIZ6sc/1K2O2H5QzxfaLXNdy1NNjXaj7DRwZM5yO8ybx9KJP4FjSWHVOkXaXee3l/Pp2AO/4VdOf2t45jTC6grWJv3cgJExBSBC5m6C69PzZJmXI62BFp5JDSD6ujEqUeo7jNpUnzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764300176; c=relaxed/simple;
	bh=EezcQsqYkzrhkWD/Q2Sno/PPWvhTMV9vm7+19Aelgm0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HQKTqpe9OzM3MoyDN/Ytb3/vPETranVPCv7neZDGuB8kueGPqACvIckJUbpvz+gm1q28I2SjP/iJ+ZRYMkPUlJc/TMmiSS2v6onhBQQWa2l/ziqkPiSlrRCZDEhVcosEGEAwJ84se5z8ghnP7H/hsAiHMWqj1EYr16jQU1HRP+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aD5lpgkl; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aD5lpgkl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764300174; x=1795836174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EezcQsqYkzrhkWD/Q2Sno/PPWvhTMV9vm7+19Aelgm0=;
  b=aD5lpgklChcyVWlkn7Zj4bZSIZ9mkUQ43i9rMVt2cNA5mlKZ+fSCOIRo
   ZrHl4S+RdAGQjHXklXLgfRzT1uBk01kPkyOEjjKLysSwT6g/1y/GoLNbn
   FKZOTmr6bjsuHTOsgA9Lr79z0Y2NdlVlAR/npuwrthof8oRVD44H3dWm9
   31vOVPsTrCDkqPuq0bOE3i/Hf7n+2TRzEdBZEgbijY87FzqOM1EIZD0lM
   9BmfbNm8DQGOclrquscTzTWKtWvxeYwPscuxwIQ1fvkFRTu/E46saH6qY
   1hULztk65gybPCX8iFn537CcYKzg6h/LbECGx23IZBlhBtlbKqEP45wj5
   Q==;
X-CSE-ConnectionGUID: MOlsJpH1SVWE1cVk/GSYcw==
X-CSE-MsgGUID: ZRjJscIzSrG+gQmJHzGaMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="76967265"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="76967265"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 19:22:54 -0800
X-CSE-ConnectionGUID: VElXhCyVTWq65kOVP5/WWw==
X-CSE-MsgGUID: 5+Ikzq70QBisl/witeedYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="216712782"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Nov 2025 19:22:52 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOp4M-000000005yr-0TkF;
	Fri, 28 Nov 2025 03:22:50 +0000
Date: Fri, 28 Nov 2025 11:22:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCHv2 3/3] dm-crypt: dynamic scatterlist for many segments
Message-ID: <202511281018.FNOzcP4r-lkp@intel.com>
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
In-Reply-To: <20251124170903.3931792-4-kbusch@meta.com>
References: <20251124170903.3931792-4-kbusch@meta.com>
TO: Keith Busch <kbusch@meta.com>
TO: dm-devel@lists.linux.dev
TO: linux-block@vger.kernel.org
TO: snitzer@kernel.org
TO: hch@lst.de
TO: axboe@kernel.dk
TO: ebiggers@kernel.org
CC: Keith Busch <kbusch@kernel.org>

Hi Keith,

kernel test robot noticed the following build warnings:

[auto build test WARNING on device-mapper-dm/for-next]
[also build test WARNING on axboe/for-next linus/master v6.18-rc7 next-20251127]
[cannot apply to hch-configfs/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/block-remove-stacking-default-dma_alignment/20251125-051340
base:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
patch link:    https://lore.kernel.org/r/20251124170903.3931792-4-kbusch%40meta.com
patch subject: [PATCHv2 3/3] dm-crypt: dynamic scatterlist for many segments
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20251127 (https://download.01.org/0day-ci/archive/20251128/202511281018.FNOzcP4r-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511281018.FNOzcP4r-lkp@intel.com/

New smatch warnings:
drivers/md/dm-crypt.c:1510 crypt_convert_block_skcipher() warn: was || intended here instead of &&?

Old smatch warnings:
drivers/md/dm-crypt.c:3092 crypt_ctr_cipher_old() warn: missing unwind goto?

vim +1510 drivers/md/dm-crypt.c

c1048b5b3bef81 Keith Busch       2025-11-24  1432  
ef43aa38063a6b Milan Broz        2017-01-04  1433  static int crypt_convert_block_skcipher(struct crypt_config *cc,
ef43aa38063a6b Milan Broz        2017-01-04  1434  					struct convert_context *ctx,
ef43aa38063a6b Milan Broz        2017-01-04  1435  					struct skcipher_request *req,
ef43aa38063a6b Milan Broz        2017-01-04  1436  					unsigned int tag_offset)
ef43aa38063a6b Milan Broz        2017-01-04  1437  {
ef43aa38063a6b Milan Broz        2017-01-04  1438  	struct scatterlist *sg_in, *sg_out;
ef43aa38063a6b Milan Broz        2017-01-04  1439  	struct dm_crypt_request *dmreq;
ef43aa38063a6b Milan Broz        2017-01-04  1440  	u8 *iv, *org_iv, *tag_iv;
c13b5487d9dec7 Christoph Hellwig 2019-04-04  1441  	__le64 *sector;
c1048b5b3bef81 Keith Busch       2025-11-24  1442  	int r;
8f0009a225171c Milan Broz        2017-03-16  1443  
ef43aa38063a6b Milan Broz        2017-01-04  1444  	dmreq = dmreq_of_req(cc, req);
c66029f4d42264 Mikulas Patocka   2012-07-27  1445  	dmreq->iv_sector = ctx->cc_sector;
8f0009a225171c Milan Broz        2017-03-16  1446  	if (test_bit(CRYPT_IV_LARGE_SECTORS, &cc->cipher_flags))
ff3af92b4461be Mikulas Patocka   2017-03-23  1447  		dmreq->iv_sector >>= cc->sector_shift;
b2174eebd1fadb Ying Huang        2009-03-16  1448  	dmreq->ctx = ctx;
45711f1af6eff1 Jens Axboe        2007-10-22  1449  
ef43aa38063a6b Milan Broz        2017-01-04  1450  	*org_tag_of_dmreq(cc, dmreq) = tag_offset;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1451  
ef43aa38063a6b Milan Broz        2017-01-04  1452  	iv = iv_of_dmreq(cc, dmreq);
ef43aa38063a6b Milan Broz        2017-01-04  1453  	org_iv = org_iv_of_dmreq(cc, dmreq);
ef43aa38063a6b Milan Broz        2017-01-04  1454  	tag_iv = iv_tag_from_dmreq(cc, dmreq);
ef43aa38063a6b Milan Broz        2017-01-04  1455  
ef43aa38063a6b Milan Broz        2017-01-04  1456  	sector = org_sector_of_dmreq(cc, dmreq);
ef43aa38063a6b Milan Broz        2017-01-04  1457  	*sector = cpu_to_le64(ctx->cc_sector - cc->iv_offset);
ef43aa38063a6b Milan Broz        2017-01-04  1458  
02664d2ac0d3cf Keith Busch       2025-11-24  1459  	dmreq->__sg_in = NULL;
02664d2ac0d3cf Keith Busch       2025-11-24  1460  	dmreq->__sg_out = NULL;
ef43aa38063a6b Milan Broz        2017-01-04  1461  	sg_in  = &dmreq->sg_in[0];
ef43aa38063a6b Milan Broz        2017-01-04  1462  	sg_out = &dmreq->sg_out[0];
^1da177e4c3f41 Linus Torvalds    2005-04-16  1463  
02664d2ac0d3cf Keith Busch       2025-11-24  1464  	r = crypt_build_sgl(cc, &sg_in, &ctx->iter_in, ctx->bio_in,
c1048b5b3bef81 Keith Busch       2025-11-24  1465  			    ARRAY_SIZE(dmreq->sg_in));
c1048b5b3bef81 Keith Busch       2025-11-24  1466  	if (r < 0)
c1048b5b3bef81 Keith Busch       2025-11-24  1467  		return r;
02664d2ac0d3cf Keith Busch       2025-11-24  1468  	else if (sg_in != dmreq->sg_in)
02664d2ac0d3cf Keith Busch       2025-11-24  1469  		dmreq->__sg_in = sg_in;
ef43aa38063a6b Milan Broz        2017-01-04  1470  
02664d2ac0d3cf Keith Busch       2025-11-24  1471  	r = crypt_build_sgl(cc, &sg_out, &ctx->iter_out, ctx->bio_out,
c1048b5b3bef81 Keith Busch       2025-11-24  1472  			    ARRAY_SIZE(dmreq->sg_out));
02664d2ac0d3cf Keith Busch       2025-11-24  1473  	if (r < 0) {
02664d2ac0d3cf Keith Busch       2025-11-24  1474  		kfree(dmreq->__sg_in);
c1048b5b3bef81 Keith Busch       2025-11-24  1475  		return r;
02664d2ac0d3cf Keith Busch       2025-11-24  1476  	} else if (sg_out != dmreq->sg_out) {
02664d2ac0d3cf Keith Busch       2025-11-24  1477  		dmreq->__sg_in = sg_out;
02664d2ac0d3cf Keith Busch       2025-11-24  1478  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1479  
3a7f6c990ad04e Milan Broz        2008-02-08  1480  	if (cc->iv_gen_ops) {
ef43aa38063a6b Milan Broz        2017-01-04  1481  		/* For READs use IV stored in integrity metadata */
ef43aa38063a6b Milan Broz        2017-01-04  1482  		if (cc->integrity_iv_size && bio_data_dir(ctx->bio_in) != WRITE) {
ef43aa38063a6b Milan Broz        2017-01-04  1483  			memcpy(org_iv, tag_iv, cc->integrity_iv_size);
ef43aa38063a6b Milan Broz        2017-01-04  1484  		} else {
ef43aa38063a6b Milan Broz        2017-01-04  1485  			r = cc->iv_gen_ops->generator(cc, org_iv, dmreq);
3a7f6c990ad04e Milan Broz        2008-02-08  1486  			if (r < 0)
02664d2ac0d3cf Keith Busch       2025-11-24  1487  				goto out;
bbb1658461ac85 Milan Broz        2020-01-03  1488  			/* Data can be already preprocessed in generator */
bbb1658461ac85 Milan Broz        2020-01-03  1489  			if (test_bit(CRYPT_ENCRYPT_PREPROCESS, &cc->cipher_flags))
bbb1658461ac85 Milan Broz        2020-01-03  1490  				sg_in = sg_out;
ef43aa38063a6b Milan Broz        2017-01-04  1491  			/* Store generated IV in integrity metadata */
ef43aa38063a6b Milan Broz        2017-01-04  1492  			if (cc->integrity_iv_size)
ef43aa38063a6b Milan Broz        2017-01-04  1493  				memcpy(tag_iv, org_iv, cc->integrity_iv_size);
ef43aa38063a6b Milan Broz        2017-01-04  1494  		}
ef43aa38063a6b Milan Broz        2017-01-04  1495  		/* Working copy of IV, to be modified in crypto API */
ef43aa38063a6b Milan Broz        2017-01-04  1496  		memcpy(iv, org_iv, cc->iv_size);
3a7f6c990ad04e Milan Broz        2008-02-08  1497  	}
3a7f6c990ad04e Milan Broz        2008-02-08  1498  
8f0009a225171c Milan Broz        2017-03-16  1499  	skcipher_request_set_crypt(req, sg_in, sg_out, cc->sector_size, iv);
3a7f6c990ad04e Milan Broz        2008-02-08  1500  
3a7f6c990ad04e Milan Broz        2008-02-08  1501  	if (bio_data_dir(ctx->bio_in) == WRITE)
bbdb23b5d69521 Herbert Xu        2016-01-24  1502  		r = crypto_skcipher_encrypt(req);
3a7f6c990ad04e Milan Broz        2008-02-08  1503  	else
bbdb23b5d69521 Herbert Xu        2016-01-24  1504  		r = crypto_skcipher_decrypt(req);
3a7f6c990ad04e Milan Broz        2008-02-08  1505  
2dc5327d3acb33 Milan Broz        2011-01-13  1506  	if (!r && cc->iv_gen_ops && cc->iv_gen_ops->post)
ef43aa38063a6b Milan Broz        2017-01-04  1507  		r = cc->iv_gen_ops->post(cc, org_iv, dmreq);
ef43aa38063a6b Milan Broz        2017-01-04  1508  
02664d2ac0d3cf Keith Busch       2025-11-24  1509  out:
02664d2ac0d3cf Keith Busch       2025-11-24 @1510  	if (r == -EINPROGRESS && r == -EBUSY) {
02664d2ac0d3cf Keith Busch       2025-11-24  1511  		kfree(dmreq->__sg_in);
02664d2ac0d3cf Keith Busch       2025-11-24  1512  		kfree(dmreq->__sg_out);
02664d2ac0d3cf Keith Busch       2025-11-24  1513  		dmreq->__sg_in = NULL;
02664d2ac0d3cf Keith Busch       2025-11-24  1514  		dmreq->__sg_out = NULL;
02664d2ac0d3cf Keith Busch       2025-11-24  1515  	}
3a7f6c990ad04e Milan Broz        2008-02-08  1516  	return r;
01482b7671d014 Milan Broz        2008-02-08  1517  }
01482b7671d014 Milan Broz        2008-02-08  1518  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
