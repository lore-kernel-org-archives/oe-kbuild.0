Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA49E32B99A
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Oct 2025 14:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761055801; cv=none; b=VVtxJUxyBkyjLusC6A/LAmJXSAWZ8kRMuHxDP8i7RsjS4g6LNwPVY1AhMn23PEF7/2zUnS7yyIupQRAjQTspa+DdWT4f0pwTV/bNWMcUOAXvwLsZykIZR2hK38nJNfGaxKYrGI5YXQOWItF3Jdkvq3Tv31x86pHhKDiKat/Rwhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761055801; c=relaxed/simple;
	bh=VQWeT7nBePDp415zJtJ8+DiVtBsGS1hQWDrnMmRMSt0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IujdEyOTdhhDz+OYmkF4iqPV3hZ/gPzjxMdemda6hBOkws6vCsnYSsi684ORGjeYpRXlL9151w3TkuQyFF3di/VEKYee0sJTZ7rcHR20YwzsuJYMSrH6c9/bVBJhdadkeJebrXYhYlfJILQbYA2AA+9CVaGB1eY55V7Xz+WVuKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LnmFpKGi; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LnmFpKGi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761055800; x=1792591800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VQWeT7nBePDp415zJtJ8+DiVtBsGS1hQWDrnMmRMSt0=;
  b=LnmFpKGi1DV+VxoGWSRK3ezk+bko7qJ35PxiAEmvvCOqChatPPUQrMfs
   SIz+6+e8L+43ibIE9P82J7zcmywhRyisQBwpykyy6dp6yKgU+dfTsgkTz
   124ehXfigjOHsEKBT4j5gzxyn7sbEMChwqPr5o0wNJJh3LON5AsZbzq5x
   C8ZLZ75E1dxz6pnmm+6pwpIKMIE/xQC47f4kkoqjrcwgXxiWBTRvfmoMn
   /NbFS+7AEL2K+ovOILaAtEVxG+qXT4asL2lxaGXJZHDjyXh/6R4dIpRjI
   Y8gonZnfARaDr8btZ+MYXZLmUNNC5PBxHteMhEmKEzoQ2/JtexungPLMP
   A==;
X-CSE-ConnectionGUID: ITx0UgxMTuO7cVIZC8FFiw==
X-CSE-MsgGUID: bYRIjXS3TJyEz8i9MW44EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63078361"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="63078361"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 07:09:59 -0700
X-CSE-ConnectionGUID: 3ZSEKqZMTQK8gze0rx1xJg==
X-CSE-MsgGUID: qkPG2ox6S1yzOoo8vk0qHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="187636516"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 21 Oct 2025 07:09:58 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBD3j-000AtL-2y;
	Tue, 21 Oct 2025 14:09:55 +0000
Date: Tue, 21 Oct 2025 22:09:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: crypto/testmgr.c:646:39: sparse: signed value source
Message-ID: <202510212228.P0Hs7pPy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: crypto/testmgr.c:646:39: sparse: signed value source"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Eric Biggers <ebiggers@google.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6548d364a3e850326831799d7e3ea2d7bb97ba08
commit: 40b9969796bfa49ed1b0f7ddc254f48cb2ac6d2c crypto: testmgr - replace CRYPTO_MANAGER_DISABLE_TESTS with CRYPTO_SELFTESTS
date:   5 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 5 months ago
config: m68k-randconfig-r131-20251021 (https://download.01.org/0day-ci/archive/20251021/202510212228.P0Hs7pPy-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510212228.P0Hs7pPy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510212228.P0Hs7pPy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   crypto/testmgr.c: note: in included file:
   include/linux/scatterlist.h:187:9: sparse: sparse: unsigned value that used to be signed checked against zero?
>> crypto/testmgr.c:646:39: sparse: signed value source
   include/linux/scatterlist.h:187:9: sparse: sparse: unsigned value that used to be signed checked against zero?
   crypto/testmgr.c:4002:37: sparse: signed value source
   include/linux/scatterlist.h:187:9: sparse: sparse: unsigned value that used to be signed checked against zero?
   crypto/testmgr.c:4003:43: sparse: signed value source

vim +646 crypto/testmgr.c

3f47a03df6e8117 Eric Biggers 2019-01-31  570  
3f47a03df6e8117 Eric Biggers 2019-01-31  571  /**
3f47a03df6e8117 Eric Biggers 2019-01-31  572   * build_test_sglist() - build a scatterlist for a crypto test
3f47a03df6e8117 Eric Biggers 2019-01-31  573   *
3f47a03df6e8117 Eric Biggers 2019-01-31  574   * @tsgl: the scatterlist to build.  @tsgl->bufs[] contains an array of 2-page
3f47a03df6e8117 Eric Biggers 2019-01-31  575   *	  buffers which the scatterlist @tsgl->sgl[] will be made to point into.
3f47a03df6e8117 Eric Biggers 2019-01-31  576   * @divs: the layout specification on which the scatterlist will be based
3f47a03df6e8117 Eric Biggers 2019-01-31  577   * @alignmask: the algorithm's alignmask
3f47a03df6e8117 Eric Biggers 2019-01-31  578   * @total_len: the total length of the scatterlist to build in bytes
3f47a03df6e8117 Eric Biggers 2019-01-31  579   * @data: if non-NULL, the buffers will be filled with this data until it ends.
3f47a03df6e8117 Eric Biggers 2019-01-31  580   *	  Otherwise the buffers will be poisoned.  In both cases, some bytes
3f47a03df6e8117 Eric Biggers 2019-01-31  581   *	  past the end of each buffer will be poisoned to help detect overruns.
3f47a03df6e8117 Eric Biggers 2019-01-31  582   * @out_divs: if non-NULL, the test_sg_division to which each scatterlist entry
3f47a03df6e8117 Eric Biggers 2019-01-31  583   *	      corresponds will be returned here.  This will match @divs except
3f47a03df6e8117 Eric Biggers 2019-01-31  584   *	      that divisions resolving to a length of 0 are omitted as they are
3f47a03df6e8117 Eric Biggers 2019-01-31  585   *	      not included in the scatterlist.
3f47a03df6e8117 Eric Biggers 2019-01-31  586   *
3f47a03df6e8117 Eric Biggers 2019-01-31  587   * Return: 0 or a -errno value
3f47a03df6e8117 Eric Biggers 2019-01-31  588   */
3f47a03df6e8117 Eric Biggers 2019-01-31  589  static int build_test_sglist(struct test_sglist *tsgl,
3f47a03df6e8117 Eric Biggers 2019-01-31  590  			     const struct test_sg_division *divs,
3f47a03df6e8117 Eric Biggers 2019-01-31  591  			     const unsigned int alignmask,
3f47a03df6e8117 Eric Biggers 2019-01-31  592  			     const unsigned int total_len,
3f47a03df6e8117 Eric Biggers 2019-01-31  593  			     struct iov_iter *data,
3f47a03df6e8117 Eric Biggers 2019-01-31  594  			     const struct test_sg_division *out_divs[XBUFSIZE])
3f47a03df6e8117 Eric Biggers 2019-01-31  595  {
3f47a03df6e8117 Eric Biggers 2019-01-31  596  	struct {
3f47a03df6e8117 Eric Biggers 2019-01-31  597  		const struct test_sg_division *div;
3f47a03df6e8117 Eric Biggers 2019-01-31  598  		size_t length;
3f47a03df6e8117 Eric Biggers 2019-01-31  599  	} partitions[XBUFSIZE];
3f47a03df6e8117 Eric Biggers 2019-01-31  600  	const unsigned int ndivs = count_test_sg_divisions(divs);
3f47a03df6e8117 Eric Biggers 2019-01-31  601  	unsigned int len_remaining = total_len;
3f47a03df6e8117 Eric Biggers 2019-01-31  602  	unsigned int i;
3f47a03df6e8117 Eric Biggers 2019-01-31  603  
3f47a03df6e8117 Eric Biggers 2019-01-31  604  	BUILD_BUG_ON(ARRAY_SIZE(partitions) != ARRAY_SIZE(tsgl->sgl));
3f47a03df6e8117 Eric Biggers 2019-01-31  605  	if (WARN_ON(ndivs > ARRAY_SIZE(partitions)))
3f47a03df6e8117 Eric Biggers 2019-01-31  606  		return -EINVAL;
3f47a03df6e8117 Eric Biggers 2019-01-31  607  
3f47a03df6e8117 Eric Biggers 2019-01-31  608  	/* Calculate the (div, length) pairs */
3f47a03df6e8117 Eric Biggers 2019-01-31  609  	tsgl->nents = 0;
3f47a03df6e8117 Eric Biggers 2019-01-31  610  	for (i = 0; i < ndivs; i++) {
3f47a03df6e8117 Eric Biggers 2019-01-31  611  		unsigned int len_this_sg =
3f47a03df6e8117 Eric Biggers 2019-01-31  612  			min(len_remaining,
3f47a03df6e8117 Eric Biggers 2019-01-31  613  			    (total_len * divs[i].proportion_of_total +
3f47a03df6e8117 Eric Biggers 2019-01-31  614  			     TEST_SG_TOTAL / 2) / TEST_SG_TOTAL);
3f47a03df6e8117 Eric Biggers 2019-01-31  615  
3f47a03df6e8117 Eric Biggers 2019-01-31  616  		if (len_this_sg != 0) {
3f47a03df6e8117 Eric Biggers 2019-01-31  617  			partitions[tsgl->nents].div = &divs[i];
3f47a03df6e8117 Eric Biggers 2019-01-31  618  			partitions[tsgl->nents].length = len_this_sg;
3f47a03df6e8117 Eric Biggers 2019-01-31  619  			tsgl->nents++;
3f47a03df6e8117 Eric Biggers 2019-01-31  620  			len_remaining -= len_this_sg;
3f47a03df6e8117 Eric Biggers 2019-01-31  621  		}
3f47a03df6e8117 Eric Biggers 2019-01-31  622  	}
3f47a03df6e8117 Eric Biggers 2019-01-31  623  	if (tsgl->nents == 0) {
3f47a03df6e8117 Eric Biggers 2019-01-31  624  		partitions[tsgl->nents].div = &divs[0];
3f47a03df6e8117 Eric Biggers 2019-01-31  625  		partitions[tsgl->nents].length = 0;
3f47a03df6e8117 Eric Biggers 2019-01-31  626  		tsgl->nents++;
3f47a03df6e8117 Eric Biggers 2019-01-31  627  	}
3f47a03df6e8117 Eric Biggers 2019-01-31  628  	partitions[tsgl->nents - 1].length += len_remaining;
3f47a03df6e8117 Eric Biggers 2019-01-31  629  
3f47a03df6e8117 Eric Biggers 2019-01-31  630  	/* Set up the sgl entries and fill the data or poison */
3f47a03df6e8117 Eric Biggers 2019-01-31  631  	sg_init_table(tsgl->sgl, tsgl->nents);
3f47a03df6e8117 Eric Biggers 2019-01-31  632  	for (i = 0; i < tsgl->nents; i++) {
3f47a03df6e8117 Eric Biggers 2019-01-31  633  		unsigned int offset = partitions[i].div->offset;
3f47a03df6e8117 Eric Biggers 2019-01-31  634  		void *addr;
3f47a03df6e8117 Eric Biggers 2019-01-31  635  
3f47a03df6e8117 Eric Biggers 2019-01-31  636  		if (partitions[i].div->offset_relative_to_alignmask)
3f47a03df6e8117 Eric Biggers 2019-01-31  637  			offset += alignmask;
3f47a03df6e8117 Eric Biggers 2019-01-31  638  
3f47a03df6e8117 Eric Biggers 2019-01-31  639  		while (offset + partitions[i].length + TESTMGR_POISON_LEN >
3f47a03df6e8117 Eric Biggers 2019-01-31  640  		       2 * PAGE_SIZE) {
3f47a03df6e8117 Eric Biggers 2019-01-31  641  			if (WARN_ON(offset <= 0))
3f47a03df6e8117 Eric Biggers 2019-01-31  642  				return -EINVAL;
3f47a03df6e8117 Eric Biggers 2019-01-31  643  			offset /= 2;
3f47a03df6e8117 Eric Biggers 2019-01-31  644  		}
3f47a03df6e8117 Eric Biggers 2019-01-31  645  
3f47a03df6e8117 Eric Biggers 2019-01-31 @646  		addr = &tsgl->bufs[i][offset];
3f47a03df6e8117 Eric Biggers 2019-01-31  647  		sg_set_buf(&tsgl->sgl[i], addr, partitions[i].length);
3f47a03df6e8117 Eric Biggers 2019-01-31  648  
3f47a03df6e8117 Eric Biggers 2019-01-31  649  		if (out_divs)
3f47a03df6e8117 Eric Biggers 2019-01-31  650  			out_divs[i] = partitions[i].div;
3f47a03df6e8117 Eric Biggers 2019-01-31  651  
3f47a03df6e8117 Eric Biggers 2019-01-31  652  		if (data) {
3f47a03df6e8117 Eric Biggers 2019-01-31  653  			size_t copy_len, copied;
3f47a03df6e8117 Eric Biggers 2019-01-31  654  
3f47a03df6e8117 Eric Biggers 2019-01-31  655  			copy_len = min(partitions[i].length, data->count);
3f47a03df6e8117 Eric Biggers 2019-01-31  656  			copied = copy_from_iter(addr, copy_len, data);
3f47a03df6e8117 Eric Biggers 2019-01-31  657  			if (WARN_ON(copied != copy_len))
3f47a03df6e8117 Eric Biggers 2019-01-31  658  				return -EINVAL;
3f47a03df6e8117 Eric Biggers 2019-01-31  659  			testmgr_poison(addr + copy_len, partitions[i].length +
3f47a03df6e8117 Eric Biggers 2019-01-31  660  				       TESTMGR_POISON_LEN - copy_len);
3f47a03df6e8117 Eric Biggers 2019-01-31  661  		} else {
3f47a03df6e8117 Eric Biggers 2019-01-31  662  			testmgr_poison(addr, partitions[i].length +
3f47a03df6e8117 Eric Biggers 2019-01-31  663  				       TESTMGR_POISON_LEN);
3f47a03df6e8117 Eric Biggers 2019-01-31  664  		}
3f47a03df6e8117 Eric Biggers 2019-01-31  665  	}
3f47a03df6e8117 Eric Biggers 2019-01-31  666  
3f47a03df6e8117 Eric Biggers 2019-01-31  667  	sg_mark_end(&tsgl->sgl[tsgl->nents - 1]);
3f47a03df6e8117 Eric Biggers 2019-01-31  668  	tsgl->sgl_ptr = tsgl->sgl;
3f47a03df6e8117 Eric Biggers 2019-01-31  669  	memcpy(tsgl->sgl_saved, tsgl->sgl, tsgl->nents * sizeof(tsgl->sgl[0]));
3f47a03df6e8117 Eric Biggers 2019-01-31  670  	return 0;
3f47a03df6e8117 Eric Biggers 2019-01-31  671  }
3f47a03df6e8117 Eric Biggers 2019-01-31  672  

:::::: The code at line 646 was first introduced by commit
:::::: 3f47a03df6e81174558f4604828851cb600e1db6 crypto: testmgr - add testvec_config struct and helper functions

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
