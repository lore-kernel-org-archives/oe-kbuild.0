Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2852749DC
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Feb 2026 05:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770960682; cv=none; b=RHWUxDsZuK4JOiPtLD0Iq7mpKi+T13paNiOkRnU6ax4RlTMGquRzevmiAMcQCgsCHgR8jVKMTuU2sov8hcfncxVKWPo6oWLMKnsUwbLhNzr6wg9YnnJPeGHlQp+C3I5ODvS4yUwjbhf4yMB+36gsEZ0slxbaq6ve1uwrsPIV9uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770960682; c=relaxed/simple;
	bh=NZ9Tkc98jejoWAJVNV61cFFuhFtinzM103MyRxvpMtQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=azLD+ieKh1VrXxB9szpLiKnk4Hm6eXsaJZRDEyDTvB/hXzEQmUg7parIQfMQtlLlpDeD4NshU/1jjRYEeY1kgrwHFD6BbLj9MW7lOk1SxnoYMQ+zxL4zcodIIbnkrpizuCvI7Hu7t616O57EamFPBLbtBuVwSqEDoSeTPMAixNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OgmsMFqj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OgmsMFqj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770960678; x=1802496678;
  h=date:from:to:cc:subject:message-id;
  bh=NZ9Tkc98jejoWAJVNV61cFFuhFtinzM103MyRxvpMtQ=;
  b=OgmsMFqjErMO/hoLUtYSHqtHuzep0oZ8rzwGARFpXczTFZcGvT7lxdMy
   7a9dXs6sM0aYPRo7wfn6zVHJRTt9J0x/eQTcFeHqu9g2IAzkl7Usd0U6y
   OFEchBA6LwYu5Xb/kuzCsi1M1QFatm5TUeLDP+y6Sn9HpJhpTilrKGK55
   wT5JpM4LptbQp1jgGrTdqQxKzFvXR0zz94rXcah03lprMp3hBUTj/yPNl
   eYycJpuezEhQpJlPq7zsUx+oPORW6sFbME/cphPC2YrhfpipoCbqsVcbH
   mEUHYFouIRR09r1d2OuAB4KfyJ3xxmTseGemCFPKfqH0rR4RRNkalf2U8
   w==;
X-CSE-ConnectionGUID: ymk3rQhlRHGODdrZZSXofg==
X-CSE-MsgGUID: chTEeSN7SUOS/c0KhAkHwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="89730691"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="89730691"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 21:31:17 -0800
X-CSE-ConnectionGUID: E0iYqE4VQ/W8TgNesU26MQ==
X-CSE-MsgGUID: EBfxW4UlSeOd0HW8OIcTMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="212656626"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Feb 2026 21:31:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqllp-00000000v7g-1FUw;
	Fri, 13 Feb 2026 05:31:13 +0000
Date: Fri, 13 Feb 2026 13:30:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jgunthorpe:dmabuf_map_type 5/34]
 drivers/dma-buf/st-dma-fence-chain.c:209 test_find_seqno() warn: passing
 freed memory 'fence' (line 197)
Message-ID: <202602131342.TQQGDqoT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://github.com/jgunthorpe/linux dmabuf_map_type
head:   1ad398661db790cc39e13bd89ef731b89fc0fddc
commit: 8606cb0ea9365ee67d34b8060c4773b036193be7 [5/34] dma-buf: Change st-dma-fence-chain.c to use kunit
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20260213 (https://download.01.org/0day-ci/archive/20260213/202602131342.TQQGDqoT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602131342.TQQGDqoT-lkp@intel.com/

New smatch warnings:
drivers/dma-buf/st-dma-fence-chain.c:209 test_find_seqno() warn: passing freed memory 'fence' (line 197)
drivers/dma-buf/st-dma-fence-chain.c:268 test_find_signaled() error: dereferencing freed memory 'fence' (line 261)
drivers/dma-buf/st-dma-fence-chain.c:309 test_find_out_of_order() error: dereferencing freed memory 'fence' (line 295)
drivers/dma-buf/st-dma-fence-chain.c:341 test_find_gap() error: dereferencing freed memory 'fence' (line 334)
drivers/dma-buf/st-dma-fence-chain.c:348 test_find_gap() warn: passing freed memory 'fence' (line 334)

Old smatch warnings:
drivers/dma-buf/st-dma-fence-chain.c:221 test_find_seqno() warn: passing freed memory 'fence' (line 211)
drivers/dma-buf/st-dma-fence-chain.c:230 test_find_seqno() warn: passing freed memory 'fence' (line 223)

vim +/fence +209 drivers/dma-buf/st-dma-fence-chain.c

dc2f7e67a28a5c Chris Wilson      2020-04-09  175  
8606cb0ea9365e Jason Gunthorpe   2026-02-07  176  static void test_find_seqno(struct kunit *test)
dc2f7e67a28a5c Chris Wilson      2020-04-09  177  {
dc2f7e67a28a5c Chris Wilson      2020-04-09  178  	struct fence_chains fc;
dc2f7e67a28a5c Chris Wilson      2020-04-09  179  	struct dma_fence *fence;
dc2f7e67a28a5c Chris Wilson      2020-04-09  180  	int err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  181  	int i;
dc2f7e67a28a5c Chris Wilson      2020-04-09  182  
dc2f7e67a28a5c Chris Wilson      2020-04-09  183  	err = fence_chains_init(&fc, 64, seqno_inc);
8606cb0ea9365e Jason Gunthorpe   2026-02-07  184  	KUNIT_ASSERT_EQ_MSG(test, err, 0, "Failed to init fence chains");
dc2f7e67a28a5c Chris Wilson      2020-04-09  185  
dc2f7e67a28a5c Chris Wilson      2020-04-09  186  	fence = dma_fence_get(fc.tail);
dc2f7e67a28a5c Chris Wilson      2020-04-09  187  	err = dma_fence_chain_find_seqno(&fence, 0);
dc2f7e67a28a5c Chris Wilson      2020-04-09  188  	dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  189  	if (err) {
8606cb0ea9365e Jason Gunthorpe   2026-02-07  190  		KUNIT_FAIL(test, "Reported %d for find_seqno(0)!", err);
dc2f7e67a28a5c Chris Wilson      2020-04-09  191  		goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  192  	}
dc2f7e67a28a5c Chris Wilson      2020-04-09  193  
dc2f7e67a28a5c Chris Wilson      2020-04-09  194  	for (i = 0; i < fc.chain_length; i++) {
dc2f7e67a28a5c Chris Wilson      2020-04-09  195  		fence = dma_fence_get(fc.tail);
dc2f7e67a28a5c Chris Wilson      2020-04-09  196  		err = dma_fence_chain_find_seqno(&fence, i + 1);
dc2f7e67a28a5c Chris Wilson      2020-04-09 @197  		dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  198  		if (err) {
8606cb0ea9365e Jason Gunthorpe   2026-02-07  199  			KUNIT_FAIL(test, "Reported %d for find_seqno(%d:%d)!",
dc2f7e67a28a5c Chris Wilson      2020-04-09  200  				   err, fc.chain_length + 1, i + 1);
dc2f7e67a28a5c Chris Wilson      2020-04-09  201  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  202  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  203  		if (fence != fc.chains[i]) {
8606cb0ea9365e Jason Gunthorpe   2026-02-07  204  			KUNIT_FAIL(test, "Incorrect fence reported by find_seqno(%d:%d)",
dc2f7e67a28a5c Chris Wilson      2020-04-09  205  				   fc.chain_length + 1, i + 1);
dc2f7e67a28a5c Chris Wilson      2020-04-09  206  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  207  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  208  
dc2f7e67a28a5c Chris Wilson      2020-04-09 @209  		dma_fence_get(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  210  		err = dma_fence_chain_find_seqno(&fence, i + 1);
dc2f7e67a28a5c Chris Wilson      2020-04-09  211  		dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  212  		if (err) {
8606cb0ea9365e Jason Gunthorpe   2026-02-07  213  			KUNIT_FAIL(test, "Error reported for finding self");
dc2f7e67a28a5c Chris Wilson      2020-04-09  214  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  215  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  216  		if (fence != fc.chains[i]) {
8606cb0ea9365e Jason Gunthorpe   2026-02-07  217  			KUNIT_FAIL(test, "Incorrect fence reported by find self");
dc2f7e67a28a5c Chris Wilson      2020-04-09  218  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  219  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  220  
dc2f7e67a28a5c Chris Wilson      2020-04-09  221  		dma_fence_get(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  222  		err = dma_fence_chain_find_seqno(&fence, i + 2);
dc2f7e67a28a5c Chris Wilson      2020-04-09  223  		dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  224  		if (!err) {
8606cb0ea9365e Jason Gunthorpe   2026-02-07  225  			KUNIT_FAIL(test, "Error not reported for future fence: find_seqno(%d:%d)!",
dc2f7e67a28a5c Chris Wilson      2020-04-09  226  				   i + 1, i + 2);
dc2f7e67a28a5c Chris Wilson      2020-04-09  227  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  228  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  229  
dc2f7e67a28a5c Chris Wilson      2020-04-09  230  		dma_fence_get(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  231  		err = dma_fence_chain_find_seqno(&fence, i);
dc2f7e67a28a5c Chris Wilson      2020-04-09  232  		dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  233  		if (err) {
8606cb0ea9365e Jason Gunthorpe   2026-02-07  234  			KUNIT_FAIL(test, "Error reported for previous fence!");
dc2f7e67a28a5c Chris Wilson      2020-04-09  235  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  236  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  237  		if (i > 0 && fence != fc.chains[i - 1]) {
8606cb0ea9365e Jason Gunthorpe   2026-02-07  238  			KUNIT_FAIL(test, "Incorrect fence reported by find_seqno(%d:%d)",
dc2f7e67a28a5c Chris Wilson      2020-04-09  239  				   i + 1, i);
dc2f7e67a28a5c Chris Wilson      2020-04-09  240  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  241  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  242  	}
dc2f7e67a28a5c Chris Wilson      2020-04-09  243  
dc2f7e67a28a5c Chris Wilson      2020-04-09  244  err:
dc2f7e67a28a5c Chris Wilson      2020-04-09  245  	fence_chains_fini(&fc);
dc2f7e67a28a5c Chris Wilson      2020-04-09  246  }
dc2f7e67a28a5c Chris Wilson      2020-04-09  247  
8606cb0ea9365e Jason Gunthorpe   2026-02-07  248  static void test_find_signaled(struct kunit *test)
dc2f7e67a28a5c Chris Wilson      2020-04-09  249  {
dc2f7e67a28a5c Chris Wilson      2020-04-09  250  	struct fence_chains fc;
dc2f7e67a28a5c Chris Wilson      2020-04-09  251  	struct dma_fence *fence;
dc2f7e67a28a5c Chris Wilson      2020-04-09  252  	int err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  253  
dc2f7e67a28a5c Chris Wilson      2020-04-09  254  	err = fence_chains_init(&fc, 2, seqno_inc);
8606cb0ea9365e Jason Gunthorpe   2026-02-07  255  	KUNIT_ASSERT_EQ_MSG(test, err, 0, "Failed to init fence chains");
dc2f7e67a28a5c Chris Wilson      2020-04-09  256  
dc2f7e67a28a5c Chris Wilson      2020-04-09  257  	dma_fence_signal(fc.fences[0]);
dc2f7e67a28a5c Chris Wilson      2020-04-09  258  
dc2f7e67a28a5c Chris Wilson      2020-04-09  259  	fence = dma_fence_get(fc.tail);
dc2f7e67a28a5c Chris Wilson      2020-04-09  260  	err = dma_fence_chain_find_seqno(&fence, 1);
dc2f7e67a28a5c Chris Wilson      2020-04-09 @261  	dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  262  	if (err) {
8606cb0ea9365e Jason Gunthorpe   2026-02-07  263  		KUNIT_FAIL(test, "Reported %d for find_seqno()!", err);
dc2f7e67a28a5c Chris Wilson      2020-04-09  264  		goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  265  	}
dc2f7e67a28a5c Chris Wilson      2020-04-09  266  
dc2f7e67a28a5c Chris Wilson      2020-04-09  267  	if (fence && fence != fc.chains[0]) {
8606cb0ea9365e Jason Gunthorpe   2026-02-07 @268  		KUNIT_FAIL(test, "Incorrect chain-fence.seqno:%lld reported for completed seqno:1",
dc2f7e67a28a5c Chris Wilson      2020-04-09  269  			   fence->seqno);
dc2f7e67a28a5c Chris Wilson      2020-04-09  270  
dc2f7e67a28a5c Chris Wilson      2020-04-09  271  		dma_fence_get(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  272  		err = dma_fence_chain_find_seqno(&fence, 1);
dc2f7e67a28a5c Chris Wilson      2020-04-09  273  		dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  274  		if (err)
8606cb0ea9365e Jason Gunthorpe   2026-02-07  275  			KUNIT_FAIL(test, "Reported %d for finding self!", err);
dc2f7e67a28a5c Chris Wilson      2020-04-09  276  	}
dc2f7e67a28a5c Chris Wilson      2020-04-09  277  
dc2f7e67a28a5c Chris Wilson      2020-04-09  278  err:
dc2f7e67a28a5c Chris Wilson      2020-04-09  279  	fence_chains_fini(&fc);
dc2f7e67a28a5c Chris Wilson      2020-04-09  280  }
dc2f7e67a28a5c Chris Wilson      2020-04-09  281  
8606cb0ea9365e Jason Gunthorpe   2026-02-07  282  static void test_find_out_of_order(struct kunit *test)
dc2f7e67a28a5c Chris Wilson      2020-04-09  283  {
dc2f7e67a28a5c Chris Wilson      2020-04-09  284  	struct fence_chains fc;
dc2f7e67a28a5c Chris Wilson      2020-04-09  285  	struct dma_fence *fence;
dc2f7e67a28a5c Chris Wilson      2020-04-09  286  	int err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  287  
dc2f7e67a28a5c Chris Wilson      2020-04-09  288  	err = fence_chains_init(&fc, 3, seqno_inc);
8606cb0ea9365e Jason Gunthorpe   2026-02-07  289  	KUNIT_ASSERT_EQ_MSG(test, err, 0, "Failed to init fence chains");
dc2f7e67a28a5c Chris Wilson      2020-04-09  290  
dc2f7e67a28a5c Chris Wilson      2020-04-09  291  	dma_fence_signal(fc.fences[1]);
dc2f7e67a28a5c Chris Wilson      2020-04-09  292  
dc2f7e67a28a5c Chris Wilson      2020-04-09  293  	fence = dma_fence_get(fc.tail);
dc2f7e67a28a5c Chris Wilson      2020-04-09  294  	err = dma_fence_chain_find_seqno(&fence, 2);
dc2f7e67a28a5c Chris Wilson      2020-04-09 @295  	dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  296  	if (err) {
8606cb0ea9365e Jason Gunthorpe   2026-02-07  297  		KUNIT_FAIL(test, "Reported %d for find_seqno()!", err);
dc2f7e67a28a5c Chris Wilson      2020-04-09  298  		goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  299  	}
dc2f7e67a28a5c Chris Wilson      2020-04-09  300  
4cca2e64164176 Lionel Landwerlin 2020-06-25  301  	/*
4cca2e64164176 Lionel Landwerlin 2020-06-25  302  	 * We signaled the middle fence (2) of the 1-2-3 chain. The behavior
4cca2e64164176 Lionel Landwerlin 2020-06-25  303  	 * of the dma-fence-chain is to make us wait for all the fences up to
4cca2e64164176 Lionel Landwerlin 2020-06-25  304  	 * the point we want. Since fence 1 is still not signaled, this what
4cca2e64164176 Lionel Landwerlin 2020-06-25  305  	 * we should get as fence to wait upon (fence 2 being garbage
4cca2e64164176 Lionel Landwerlin 2020-06-25  306  	 * collected during the traversal of the chain).
4cca2e64164176 Lionel Landwerlin 2020-06-25  307  	 */
8606cb0ea9365e Jason Gunthorpe   2026-02-07  308  	if (fence != fc.chains[0])
8606cb0ea9365e Jason Gunthorpe   2026-02-07 @309  		KUNIT_FAIL(test, "Incorrect chain-fence.seqno:%lld reported for completed seqno:2",
4cca2e64164176 Lionel Landwerlin 2020-06-25  310  			   fence ? fence->seqno : 0);
dc2f7e67a28a5c Chris Wilson      2020-04-09  311  
dc2f7e67a28a5c Chris Wilson      2020-04-09  312  err:
dc2f7e67a28a5c Chris Wilson      2020-04-09  313  	fence_chains_fini(&fc);
dc2f7e67a28a5c Chris Wilson      2020-04-09  314  }
dc2f7e67a28a5c Chris Wilson      2020-04-09  315  
dc2f7e67a28a5c Chris Wilson      2020-04-09  316  static uint64_t seqno_inc2(unsigned int i)
dc2f7e67a28a5c Chris Wilson      2020-04-09  317  {
dc2f7e67a28a5c Chris Wilson      2020-04-09  318  	return 2 * i + 2;
dc2f7e67a28a5c Chris Wilson      2020-04-09  319  }
dc2f7e67a28a5c Chris Wilson      2020-04-09  320  
8606cb0ea9365e Jason Gunthorpe   2026-02-07  321  static void test_find_gap(struct kunit *test)
dc2f7e67a28a5c Chris Wilson      2020-04-09  322  {
dc2f7e67a28a5c Chris Wilson      2020-04-09  323  	struct fence_chains fc;
dc2f7e67a28a5c Chris Wilson      2020-04-09  324  	struct dma_fence *fence;
dc2f7e67a28a5c Chris Wilson      2020-04-09  325  	int err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  326  	int i;
dc2f7e67a28a5c Chris Wilson      2020-04-09  327  
dc2f7e67a28a5c Chris Wilson      2020-04-09  328  	err = fence_chains_init(&fc, 64, seqno_inc2);
8606cb0ea9365e Jason Gunthorpe   2026-02-07  329  	KUNIT_ASSERT_EQ_MSG(test, err, 0, "Failed to init fence chains");
dc2f7e67a28a5c Chris Wilson      2020-04-09  330  
dc2f7e67a28a5c Chris Wilson      2020-04-09  331  	for (i = 0; i < fc.chain_length; i++) {
dc2f7e67a28a5c Chris Wilson      2020-04-09  332  		fence = dma_fence_get(fc.tail);
dc2f7e67a28a5c Chris Wilson      2020-04-09  333  		err = dma_fence_chain_find_seqno(&fence, 2 * i + 1);
dc2f7e67a28a5c Chris Wilson      2020-04-09 @334  		dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  335  		if (err) {
8606cb0ea9365e Jason Gunthorpe   2026-02-07  336  			KUNIT_FAIL(test, "Reported %d for find_seqno(%d:%d)!",
dc2f7e67a28a5c Chris Wilson      2020-04-09  337  				   err, fc.chain_length + 1, 2 * i + 1);
dc2f7e67a28a5c Chris Wilson      2020-04-09  338  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  339  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  340  		if (fence != fc.chains[i]) {
8606cb0ea9365e Jason Gunthorpe   2026-02-07 @341  			KUNIT_FAIL(test, "Incorrect fence.seqno:%lld reported by find_seqno(%d:%d)",
dc2f7e67a28a5c Chris Wilson      2020-04-09  342  				   fence->seqno,
dc2f7e67a28a5c Chris Wilson      2020-04-09  343  				   fc.chain_length + 1,
dc2f7e67a28a5c Chris Wilson      2020-04-09  344  				   2 * i + 1);
dc2f7e67a28a5c Chris Wilson      2020-04-09  345  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  346  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  347  
dc2f7e67a28a5c Chris Wilson      2020-04-09 @348  		dma_fence_get(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  349  		err = dma_fence_chain_find_seqno(&fence, 2 * i + 2);
dc2f7e67a28a5c Chris Wilson      2020-04-09  350  		dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  351  		if (err) {
8606cb0ea9365e Jason Gunthorpe   2026-02-07  352  			KUNIT_FAIL(test, "Error reported for finding self");
dc2f7e67a28a5c Chris Wilson      2020-04-09  353  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  354  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  355  		if (fence != fc.chains[i]) {
8606cb0ea9365e Jason Gunthorpe   2026-02-07  356  			KUNIT_FAIL(test, "Incorrect fence reported by find self");
dc2f7e67a28a5c Chris Wilson      2020-04-09  357  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  358  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  359  	}
dc2f7e67a28a5c Chris Wilson      2020-04-09  360  
dc2f7e67a28a5c Chris Wilson      2020-04-09  361  err:
dc2f7e67a28a5c Chris Wilson      2020-04-09  362  	fence_chains_fini(&fc);
dc2f7e67a28a5c Chris Wilson      2020-04-09  363  }
dc2f7e67a28a5c Chris Wilson      2020-04-09  364  

:::::: The code at line 209 was first introduced by commit
:::::: dc2f7e67a28a5cbe4ea905dafaa6903df670014a dma-buf: Exercise dma-fence-chain under selftests

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
