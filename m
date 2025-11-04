Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E68227470
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Nov 2025 12:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762258964; cv=none; b=g4/5hvVg5NQWEz3SSondUVbaBX0ykiy3DPqd0lVa8LELK2i0rFW3CmMKrBaKMlEW5v4UjJqjVFrCRbfoV9YKccsbDCe1yflmZ/ypIpFpqADTr/V24kIX6x5C1a7G9spBGXyDFC1QgXwLLpC5jIefk/+ql9hk4Qxsw03to/VRNsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762258964; c=relaxed/simple;
	bh=Z6S8ymc6HWsqDHce5E8fID/jueS4sXh7WK87fZM5wVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fJ9f6YvJ47+vrv4by8tQrNnPHItjdqcJhuBI1jWuphUlCTzNTieaOexOFCqL7+5yCrLp4AQFqLnsbr3ilvbZGlk8DPeg2F95y/rMzq6/lQRE8vA+zIwcdQ5LudeP4jYFZpi/nJ52R/IcMFwLM/6kQLnhcRiMcRGuZDN1fcQ7tkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AU6AMQhi; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AU6AMQhi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762258962; x=1793794962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z6S8ymc6HWsqDHce5E8fID/jueS4sXh7WK87fZM5wVg=;
  b=AU6AMQhi2LvZQiX+wObfCZFILYTs+10GyNs7quw4+HDss6gm6qK2mrht
   M5Ccfi6aV0ueEwCyaiwCE011CnWedYkak68ixWcKs6MaEVyMFzbFw0Xkj
   JWgOhXH7AYl3PggJFuAIDcSKmsaAZccVBtSaeb6nT9oyKIK+hqrKY5Cw0
   7Ctsj5PTStkY0+P8klBamqFFyxAyJFEPy288a9VdKbuX+IHbAonHCC+tT
   jKY+hWbbFq6tgx9WVgXY5acB3ttsfB2fSL4aBaRtDBE/udnU2eBnt7wA+
   duykas07zTsUNQXPjIuXFzgdBo0142fFoTtW2nmEyNo8u1AKAyKo+vFW3
   g==;
X-CSE-ConnectionGUID: NXbSgAj3St+qg8QBth5R6A==
X-CSE-MsgGUID: 1nhT1pp+TqCW6tftD6nePA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68187940"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68187940"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 04:22:42 -0800
X-CSE-ConnectionGUID: TbfqkNRGQH+knfadV+3qtA==
X-CSE-MsgGUID: xmZi2doISVqhBW8Vz7FVVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="186437770"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 04 Nov 2025 04:22:41 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGG3F-000ROA-0e;
	Tue, 04 Nov 2025 12:22:25 +0000
Date: Tue, 4 Nov 2025 20:20:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/nfsd/blocklayoutxdr.c:145 nfsd4_block_decode_layoutupdate() warn:
 potential user controlled sizeof overflow '4 + nr_iomaps * (7 * 4 + 16)' '4
 + 0-u32max'
Message-ID: <202511042043.iT5ju9O4-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Sergey Bashirov <sergeybashirov@gmail.com>
CC: Chuck Lever <chuck.lever@oracle.com>
CC: Konstantin Evtushenko <koevtushenko@yandex.com>
CC: Jeff Layton <jlayton@kernel.org>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c9cfc122f03711a5124b4aafab3211cf4d35a2ac
commit: f963cf2b91a30b5614c514f3ad53ca124cb65280 NFSD: Implement large extent array support in pNFS
date:   6 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 6 weeks ago
config: i386-randconfig-r072-20251104 (https://download.01.org/0day-ci/archive/20251104/202511042043.iT5ju9O4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511042043.iT5ju9O4-lkp@intel.com/

smatch warnings:
fs/nfsd/blocklayoutxdr.c:145 nfsd4_block_decode_layoutupdate() warn: potential user controlled sizeof overflow '4 + nr_iomaps * (7 * 4 + 16)' '4 + 0-u32max'
fs/nfsd/blocklayoutxdr.c:239 nfsd4_scsi_decode_layoutupdate() warn: potential user controlled sizeof overflow '4 + nr_iomaps * (4 * 4)' '4 + 0-u32max'

vim +145 fs/nfsd/blocklayoutxdr.c

8650b8a058502d Christoph Hellwig 2015-01-21  113  
26d05e1c37d276 Sergey Bashirov   2025-06-13  114  /**
26d05e1c37d276 Sergey Bashirov   2025-06-13  115   * nfsd4_block_decode_layoutupdate - decode the block layout extent array
f963cf2b91a30b Sergey Bashirov   2025-07-21  116   * @xdr: subbuf set to the encoded array
26d05e1c37d276 Sergey Bashirov   2025-06-13  117   * @iomapp: pointer to store the decoded extent array
26d05e1c37d276 Sergey Bashirov   2025-06-13  118   * @nr_iomapsp: pointer to store the number of extents
26d05e1c37d276 Sergey Bashirov   2025-06-13  119   * @block_size: alignment of extent offset and length
26d05e1c37d276 Sergey Bashirov   2025-06-13  120   *
26d05e1c37d276 Sergey Bashirov   2025-06-13  121   * This function decodes the opaque field of the layoutupdate4 structure
26d05e1c37d276 Sergey Bashirov   2025-06-13  122   * in a layoutcommit request for the block layout driver. The field is
26d05e1c37d276 Sergey Bashirov   2025-06-13  123   * actually an array of extents sent by the client. It also checks that
26d05e1c37d276 Sergey Bashirov   2025-06-13  124   * the file offset, storage offset and length of each extent are aligned
26d05e1c37d276 Sergey Bashirov   2025-06-13  125   * by @block_size.
26d05e1c37d276 Sergey Bashirov   2025-06-13  126   *
26d05e1c37d276 Sergey Bashirov   2025-06-13  127   * Return values:
26d05e1c37d276 Sergey Bashirov   2025-06-13  128   *   %nfs_ok: Successful decoding, @iomapp and @nr_iomapsp are valid
f963cf2b91a30b Sergey Bashirov   2025-07-21  129   *   %nfserr_bad_xdr: The encoded array in @xdr is invalid
26d05e1c37d276 Sergey Bashirov   2025-06-13  130   *   %nfserr_inval: An unaligned extent found
26d05e1c37d276 Sergey Bashirov   2025-06-13  131   *   %nfserr_delay: Failed to allocate memory for @iomapp
26d05e1c37d276 Sergey Bashirov   2025-06-13  132   */
26d05e1c37d276 Sergey Bashirov   2025-06-13  133  __be32
f963cf2b91a30b Sergey Bashirov   2025-07-21  134  nfsd4_block_decode_layoutupdate(struct xdr_stream *xdr, struct iomap **iomapp,
26d05e1c37d276 Sergey Bashirov   2025-06-13  135  		int *nr_iomapsp, u32 block_size)
8650b8a058502d Christoph Hellwig 2015-01-21  136  {
8650b8a058502d Christoph Hellwig 2015-01-21  137  	struct iomap *iomaps;
f963cf2b91a30b Sergey Bashirov   2025-07-21  138  	u32 nr_iomaps, expected, len, i;
f963cf2b91a30b Sergey Bashirov   2025-07-21  139  	__be32 nfserr;
8650b8a058502d Christoph Hellwig 2015-01-21  140  
f963cf2b91a30b Sergey Bashirov   2025-07-21  141  	if (xdr_stream_decode_u32(xdr, &nr_iomaps))
26d05e1c37d276 Sergey Bashirov   2025-06-13  142  		return nfserr_bad_xdr;
8650b8a058502d Christoph Hellwig 2015-01-21  143  
f963cf2b91a30b Sergey Bashirov   2025-07-21  144  	len = sizeof(__be32) + xdr_stream_remaining(xdr);
f963cf2b91a30b Sergey Bashirov   2025-07-21 @145  	expected = sizeof(__be32) + nr_iomaps * PNFS_BLOCK_EXTENT_SIZE;
f963cf2b91a30b Sergey Bashirov   2025-07-21  146  	if (len != expected)
26d05e1c37d276 Sergey Bashirov   2025-06-13  147  		return nfserr_bad_xdr;
8650b8a058502d Christoph Hellwig 2015-01-21  148  
8650b8a058502d Christoph Hellwig 2015-01-21  149  	iomaps = kcalloc(nr_iomaps, sizeof(*iomaps), GFP_KERNEL);
e339967eecf130 Sergey Bashirov   2025-06-21  150  	if (!iomaps)
26d05e1c37d276 Sergey Bashirov   2025-06-13  151  		return nfserr_delay;
8650b8a058502d Christoph Hellwig 2015-01-21  152  
8650b8a058502d Christoph Hellwig 2015-01-21  153  	for (i = 0; i < nr_iomaps; i++) {
8650b8a058502d Christoph Hellwig 2015-01-21  154  		struct pnfs_block_extent bex;
8650b8a058502d Christoph Hellwig 2015-01-21  155  
f963cf2b91a30b Sergey Bashirov   2025-07-21  156  		if (nfsd4_decode_deviceid4(xdr, &bex.vol_id)) {
f963cf2b91a30b Sergey Bashirov   2025-07-21  157  			nfserr = nfserr_bad_xdr;
f963cf2b91a30b Sergey Bashirov   2025-07-21  158  			goto fail;
f963cf2b91a30b Sergey Bashirov   2025-07-21  159  		}
f963cf2b91a30b Sergey Bashirov   2025-07-21  160  
f963cf2b91a30b Sergey Bashirov   2025-07-21  161  		if (xdr_stream_decode_u64(xdr, &bex.foff)) {
f963cf2b91a30b Sergey Bashirov   2025-07-21  162  			nfserr = nfserr_bad_xdr;
f963cf2b91a30b Sergey Bashirov   2025-07-21  163  			goto fail;
f963cf2b91a30b Sergey Bashirov   2025-07-21  164  		}
8650b8a058502d Christoph Hellwig 2015-01-21  165  		if (bex.foff & (block_size - 1)) {
f963cf2b91a30b Sergey Bashirov   2025-07-21  166  			nfserr = nfserr_inval;
f963cf2b91a30b Sergey Bashirov   2025-07-21  167  			goto fail;
f963cf2b91a30b Sergey Bashirov   2025-07-21  168  		}
f963cf2b91a30b Sergey Bashirov   2025-07-21  169  
f963cf2b91a30b Sergey Bashirov   2025-07-21  170  		if (xdr_stream_decode_u64(xdr, &bex.len)) {
f963cf2b91a30b Sergey Bashirov   2025-07-21  171  			nfserr = nfserr_bad_xdr;
8650b8a058502d Christoph Hellwig 2015-01-21  172  			goto fail;
8650b8a058502d Christoph Hellwig 2015-01-21  173  		}
8650b8a058502d Christoph Hellwig 2015-01-21  174  		if (bex.len & (block_size - 1)) {
f963cf2b91a30b Sergey Bashirov   2025-07-21  175  			nfserr = nfserr_inval;
f963cf2b91a30b Sergey Bashirov   2025-07-21  176  			goto fail;
f963cf2b91a30b Sergey Bashirov   2025-07-21  177  		}
f963cf2b91a30b Sergey Bashirov   2025-07-21  178  
f963cf2b91a30b Sergey Bashirov   2025-07-21  179  		if (xdr_stream_decode_u64(xdr, &bex.soff)) {
f963cf2b91a30b Sergey Bashirov   2025-07-21  180  			nfserr = nfserr_bad_xdr;
8650b8a058502d Christoph Hellwig 2015-01-21  181  			goto fail;
8650b8a058502d Christoph Hellwig 2015-01-21  182  		}
8650b8a058502d Christoph Hellwig 2015-01-21  183  		if (bex.soff & (block_size - 1)) {
f963cf2b91a30b Sergey Bashirov   2025-07-21  184  			nfserr = nfserr_inval;
f963cf2b91a30b Sergey Bashirov   2025-07-21  185  			goto fail;
f963cf2b91a30b Sergey Bashirov   2025-07-21  186  		}
f963cf2b91a30b Sergey Bashirov   2025-07-21  187  
f963cf2b91a30b Sergey Bashirov   2025-07-21  188  		if (xdr_stream_decode_u32(xdr, &bex.es)) {
f963cf2b91a30b Sergey Bashirov   2025-07-21  189  			nfserr = nfserr_bad_xdr;
8650b8a058502d Christoph Hellwig 2015-01-21  190  			goto fail;
8650b8a058502d Christoph Hellwig 2015-01-21  191  		}
8650b8a058502d Christoph Hellwig 2015-01-21  192  		if (bex.es != PNFS_BLOCK_READWRITE_DATA) {
f963cf2b91a30b Sergey Bashirov   2025-07-21  193  			nfserr = nfserr_inval;
8650b8a058502d Christoph Hellwig 2015-01-21  194  			goto fail;
8650b8a058502d Christoph Hellwig 2015-01-21  195  		}
8650b8a058502d Christoph Hellwig 2015-01-21  196  
8650b8a058502d Christoph Hellwig 2015-01-21  197  		iomaps[i].offset = bex.foff;
8650b8a058502d Christoph Hellwig 2015-01-21  198  		iomaps[i].length = bex.len;
8650b8a058502d Christoph Hellwig 2015-01-21  199  	}
8650b8a058502d Christoph Hellwig 2015-01-21  200  
8650b8a058502d Christoph Hellwig 2015-01-21  201  	*iomapp = iomaps;
26d05e1c37d276 Sergey Bashirov   2025-06-13  202  	*nr_iomapsp = nr_iomaps;
26d05e1c37d276 Sergey Bashirov   2025-06-13  203  	return nfs_ok;
8650b8a058502d Christoph Hellwig 2015-01-21  204  fail:
8650b8a058502d Christoph Hellwig 2015-01-21  205  	kfree(iomaps);
f963cf2b91a30b Sergey Bashirov   2025-07-21  206  	return nfserr;
8650b8a058502d Christoph Hellwig 2015-01-21  207  }
f99d4fbdae6765 Christoph Hellwig 2016-03-04  208  
26d05e1c37d276 Sergey Bashirov   2025-06-13  209  /**
26d05e1c37d276 Sergey Bashirov   2025-06-13  210   * nfsd4_scsi_decode_layoutupdate - decode the scsi layout extent array
f963cf2b91a30b Sergey Bashirov   2025-07-21  211   * @xdr: subbuf set to the encoded array
26d05e1c37d276 Sergey Bashirov   2025-06-13  212   * @iomapp: pointer to store the decoded extent array
26d05e1c37d276 Sergey Bashirov   2025-06-13  213   * @nr_iomapsp: pointer to store the number of extents
26d05e1c37d276 Sergey Bashirov   2025-06-13  214   * @block_size: alignment of extent offset and length
26d05e1c37d276 Sergey Bashirov   2025-06-13  215   *
26d05e1c37d276 Sergey Bashirov   2025-06-13  216   * This function decodes the opaque field of the layoutupdate4 structure
26d05e1c37d276 Sergey Bashirov   2025-06-13  217   * in a layoutcommit request for the scsi layout driver. The field is
26d05e1c37d276 Sergey Bashirov   2025-06-13  218   * actually an array of extents sent by the client. It also checks that
26d05e1c37d276 Sergey Bashirov   2025-06-13  219   * the offset and length of each extent are aligned by @block_size.
26d05e1c37d276 Sergey Bashirov   2025-06-13  220   *
26d05e1c37d276 Sergey Bashirov   2025-06-13  221   * Return values:
26d05e1c37d276 Sergey Bashirov   2025-06-13  222   *   %nfs_ok: Successful decoding, @iomapp and @nr_iomapsp are valid
f963cf2b91a30b Sergey Bashirov   2025-07-21  223   *   %nfserr_bad_xdr: The encoded array in @xdr is invalid
26d05e1c37d276 Sergey Bashirov   2025-06-13  224   *   %nfserr_inval: An unaligned extent found
26d05e1c37d276 Sergey Bashirov   2025-06-13  225   *   %nfserr_delay: Failed to allocate memory for @iomapp
26d05e1c37d276 Sergey Bashirov   2025-06-13  226   */
26d05e1c37d276 Sergey Bashirov   2025-06-13  227  __be32
f963cf2b91a30b Sergey Bashirov   2025-07-21  228  nfsd4_scsi_decode_layoutupdate(struct xdr_stream *xdr, struct iomap **iomapp,
26d05e1c37d276 Sergey Bashirov   2025-06-13  229  		int *nr_iomapsp, u32 block_size)
f99d4fbdae6765 Christoph Hellwig 2016-03-04  230  {
f99d4fbdae6765 Christoph Hellwig 2016-03-04  231  	struct iomap *iomaps;
f963cf2b91a30b Sergey Bashirov   2025-07-21  232  	u32 nr_iomaps, expected, len, i;
f963cf2b91a30b Sergey Bashirov   2025-07-21  233  	__be32 nfserr;
f99d4fbdae6765 Christoph Hellwig 2016-03-04  234  
f963cf2b91a30b Sergey Bashirov   2025-07-21  235  	if (xdr_stream_decode_u32(xdr, &nr_iomaps))
26d05e1c37d276 Sergey Bashirov   2025-06-13  236  		return nfserr_bad_xdr;
f99d4fbdae6765 Christoph Hellwig 2016-03-04  237  
f963cf2b91a30b Sergey Bashirov   2025-07-21  238  	len = sizeof(__be32) + xdr_stream_remaining(xdr);
f99d4fbdae6765 Christoph Hellwig 2016-03-04 @239  	expected = sizeof(__be32) + nr_iomaps * PNFS_SCSI_RANGE_SIZE;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
