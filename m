Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70BE341AC1
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Oct 2025 16:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761062773; cv=none; b=eqtSJ89cN+k0xldivHUUYJHUVzDi2K7yAhItBFnqGSHZWe4AR944QYplcr0mrRq1aAvA+Qv+P74gocJ17zBvb6xEGsAKa+3O98iJEQ7L0ucCHAkIf3a1eyADB99E8Dj/AfM3mWNQCxtphvvNANIXLHzlmJce7XSbibuC4T1Y7u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761062773; c=relaxed/simple;
	bh=qfBNCW56qzZcOlLx2wKmCxFcQX9WAOGNT/KjMO2mgo8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kmSdhU3ZoQnVyE4kv2NIZab/uSAkeIBD17ZP39FIJsJaYNsM6Br+uyCUech7L3mztoq6zAzAsMmrkMWIJgauhotUaQon+/dyngz75Clpe1Ksxv+dac+wMIZq8ypOUDaAtsQzME+/1EI2GnLLxual17GdE+As5mIIivSlaWEYOOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BrM+/QwC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BrM+/QwC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761062769; x=1792598769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qfBNCW56qzZcOlLx2wKmCxFcQX9WAOGNT/KjMO2mgo8=;
  b=BrM+/QwC/0DxehsS4cQEY2fVhq+6Jv2vZOskMhzGRv+Wg+oXZeGcJY2f
   geAXJTRaGf1SdSYd0uzuduGYXHwKL2BsMupiXul1nqlItysePpNI3LWMu
   sXy0t4I//nuabkkcB/UYX04GwWUg3+DH6dYUP7bd3Wxh0KIowQJgzhLzt
   jjTuhAdVvlVa9UHtlAfJ1SdRnMgZ/XWO2AlWlwqiZtya2oFJqsqB2cOH2
   /6tfWbZGGJfQulZXci3CvRai1oZBGVmQnunYPFAFLMJbA+eiYBzryZtC1
   fhaxBEy75QY1QyvHP2XlWP+E+Fwf0px/FJs1uWX9f96+O+XKNbnAdnQdf
   Q==;
X-CSE-ConnectionGUID: m2yLErm5RVWZy5KTrAXJgw==
X-CSE-MsgGUID: 9BJUpqMFRFqiJpZkJ7B+bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="85818583"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="85818583"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 09:06:09 -0700
X-CSE-ConnectionGUID: CcQd4nWuRneA+0/8UuH8Bg==
X-CSE-MsgGUID: Mes4ORsORS6BI4fE9GHXwQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 21 Oct 2025 09:06:07 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBEs9-000AzS-0f;
	Tue, 21 Oct 2025 16:06:05 +0000
Date: Wed, 22 Oct 2025 00:05:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: crypto/ahash.c:472:23: sparse: signed value source
Message-ID: <202510212332.8Yvvsxcz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: crypto/ahash.c:472:23: sparse: signed value source"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6548d364a3e850326831799d7e3ea2d7bb97ba08
commit: 9d7a0ab1c75365158b28a5f7fa516061ea40b1b8 crypto: ahash - Handle partial blocks in API
date:   5 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 5 months ago
config: m68k-randconfig-r131-20251021 (https://download.01.org/0day-ci/archive/20251021/202510212332.8Yvvsxcz-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510212332.8Yvvsxcz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510212332.8Yvvsxcz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   crypto/ahash.c: note: in included file (through include/crypto/scatterwalk.h):
   include/linux/scatterlist.h:187:9: sparse: sparse: unsigned value that used to be signed checked against zero?
>> crypto/ahash.c:472:23: sparse: signed value source
   include/linux/scatterlist.h:187:9: sparse: sparse: unsigned value that used to be signed checked against zero?
   crypto/ahash.c:554:23: sparse: signed value source

vim +472 crypto/ahash.c

f2ffe5a9183d22 Herbert Xu   2025-02-16  453  
9d7a0ab1c75365 Herbert Xu   2025-05-15  454  int crypto_ahash_update(struct ahash_request *req)
2f1f34c1bf7b30 Eric Biggers 2023-10-22  455  {
2f1f34c1bf7b30 Eric Biggers 2023-10-22  456  	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
9d7a0ab1c75365 Herbert Xu   2025-05-15  457  	bool nonzero = crypto_ahash_final_nonzero(tfm);
9d7a0ab1c75365 Herbert Xu   2025-05-15  458  	int bs = crypto_ahash_blocksize(tfm);
9d7a0ab1c75365 Herbert Xu   2025-05-15  459  	u8 *blenp = ahash_request_ctx(req);
9d7a0ab1c75365 Herbert Xu   2025-05-15  460  	int blen, err;
9d7a0ab1c75365 Herbert Xu   2025-05-15  461  	u8 *buf;
2f1f34c1bf7b30 Eric Biggers 2023-10-22  462  
5bb61dc76d11a6 Herbert Xu   2025-04-12  463  	if (likely(tfm->using_shash))
9d7a0ab1c75365 Herbert Xu   2025-05-15  464  		return shash_ahash_update(req, ahash_request_ctx(req));
04bfa4c7d5119c Herbert Xu   2025-04-12  465  	if (ahash_req_on_stack(req) && ahash_is_async(tfm))
04bfa4c7d5119c Herbert Xu   2025-04-12  466  		return -EAGAIN;
9d7a0ab1c75365 Herbert Xu   2025-05-15  467  	if (!crypto_ahash_block_only(tfm))
9d7a0ab1c75365 Herbert Xu   2025-05-15  468  		return ahash_do_req_chain(req, &crypto_ahash_alg(tfm)->update);
f2ffe5a9183d22 Herbert Xu   2025-02-16  469  
9d7a0ab1c75365 Herbert Xu   2025-05-15  470  	blenp += crypto_ahash_reqsize(tfm) - 1;
9d7a0ab1c75365 Herbert Xu   2025-05-15  471  	blen = *blenp;
9d7a0ab1c75365 Herbert Xu   2025-05-15 @472  	buf = blenp - bs;
66f6ce5e52f2f2 Herbert Xu   2009-07-15  473  
9d7a0ab1c75365 Herbert Xu   2025-05-15  474  	if (blen + req->nbytes < bs + nonzero) {
9d7a0ab1c75365 Herbert Xu   2025-05-15  475  		if (ahash_request_isvirt(req))
9d7a0ab1c75365 Herbert Xu   2025-05-15  476  			memcpy(buf + blen, req->svirt, req->nbytes);
9d7a0ab1c75365 Herbert Xu   2025-05-15  477  		else
9d7a0ab1c75365 Herbert Xu   2025-05-15  478  			memcpy_from_sglist(buf + blen, req->src, 0,
9d7a0ab1c75365 Herbert Xu   2025-05-15  479  					   req->nbytes);
66f6ce5e52f2f2 Herbert Xu   2009-07-15  480  
9d7a0ab1c75365 Herbert Xu   2025-05-15  481  		*blenp += req->nbytes;
1ffc9fbd1e5071 Marek Vasut  2014-03-14  482  		return 0;
1ffc9fbd1e5071 Marek Vasut  2014-03-14  483  	}
1ffc9fbd1e5071 Marek Vasut  2014-03-14  484  
9d7a0ab1c75365 Herbert Xu   2025-05-15  485  	if (blen) {
9d7a0ab1c75365 Herbert Xu   2025-05-15  486  		memset(req->sg_head, 0, sizeof(req->sg_head[0]));
9d7a0ab1c75365 Herbert Xu   2025-05-15  487  		sg_set_buf(req->sg_head, buf, blen);
9d7a0ab1c75365 Herbert Xu   2025-05-15  488  		if (req->src != req->sg_head + 1)
9d7a0ab1c75365 Herbert Xu   2025-05-15  489  			sg_chain(req->sg_head, 2, req->src);
9d7a0ab1c75365 Herbert Xu   2025-05-15  490  		req->src = req->sg_head;
9d7a0ab1c75365 Herbert Xu   2025-05-15  491  		req->nbytes += blen;
9d7a0ab1c75365 Herbert Xu   2025-05-15  492  	}
9d7a0ab1c75365 Herbert Xu   2025-05-15  493  	req->nbytes -= nonzero;
f2ffe5a9183d22 Herbert Xu   2025-02-16  494  
9d7a0ab1c75365 Herbert Xu   2025-05-15  495  	ahash_save_req(req, ahash_update_done);
f2ffe5a9183d22 Herbert Xu   2025-02-16  496  
9d7a0ab1c75365 Herbert Xu   2025-05-15  497  	err = ahash_do_req_chain(req, &crypto_ahash_alg(tfm)->update);
9d7a0ab1c75365 Herbert Xu   2025-05-15  498  	if (err == -EINPROGRESS || err == -EBUSY)
9d7a0ab1c75365 Herbert Xu   2025-05-15  499  		return err;
ef0579b64e9318 Herbert Xu   2017-04-10  500  
9d7a0ab1c75365 Herbert Xu   2025-05-15  501  	return ahash_update_finish(req, err);
1ffc9fbd1e5071 Marek Vasut  2014-03-14  502  }
9d7a0ab1c75365 Herbert Xu   2025-05-15  503  EXPORT_SYMBOL_GPL(crypto_ahash_update);
1ffc9fbd1e5071 Marek Vasut  2014-03-14  504  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
