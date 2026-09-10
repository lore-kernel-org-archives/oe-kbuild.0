Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C459B39769D
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Sep 2026 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049709; cv=none; b=EPk0hq/7liasMhLQ67pBrNKD8u9wBgG8dLqlBE6TM98Cp7l6vi8uiHoGDiVDyoJ0AlojYUU+HLe/lVyzzRbK2sZdyQPP85Uj68JGlPzdwUODWZNK922iifiESPrCqDC5PbBKXZ4UlhMw3GTHQB1xTYst5/OEAJMt/IuObXDkJPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049709; c=relaxed/simple;
	bh=+IrkStw0mrJnoNaoxXc0kfhXDsbGkbwgoyoxGALtetc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QOd7O8Ow6tBWRevH3ikWxST0cGJqxFnv8SME9xMpn3lpveOL5v4OCHEV+qqOiFMJ6e5/OaZQ8Uw+nMtq0/jctMK5HX6xDWsBV+D1TjLCfjloFfRDPCheNNw8LUvIHLO+m8G+1GY//PoPMo80hpQVMZ5tZMA0PX+SrVt+uHRwhfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQT6GFEh; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQT6GFEh"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294496989aso194861066b.3
        for <oe-kbuild@lists.linux.dev>; Thu, 10 Sep 2026 07:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789049705; x=1789654505; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eub08Pv5QDUo99EQibdL0snCPfRiI1hkRKBxBjvzKGw=;
        b=OQT6GFEhawdZEj9cBwOJLlUxldQQ4l4wt4IOZzh+4wrkHmiWy5QvvXGZ/XcTTxIXoA
         yzVjn6RcTNP/yNkskHj8PJEyNIX8einkOSwLeXToQPX3T5YBDFd40A242Hlc/2BJwM1x
         OVNw6LGpA4lawub7sUH6koCfHOppCqjPVH3KlEErUJU0iSK8aC/FiJ94wY2Q5+AL8Clm
         BjMYC4y49G7sylBaHtwYnyte6VSNBCtkrT+ErmxF6xKynbrEPFPFjewsKje7ZCW+zj0D
         D+ipqu7uRfAUvse5Vn//Ga7GVR/IoYD5FALw1Antuca/sIiylODWJbNKZuUpE12upXxb
         ALNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789049705; x=1789654505;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eub08Pv5QDUo99EQibdL0snCPfRiI1hkRKBxBjvzKGw=;
        b=mTgqq/E9jIUMGekWTMuLUvOVe+bOW+pEsRsmf0+a1CnmSnY4QMsynt/Fg3jJY7d8FJ
         xRjuzFDqRGD7rdQ/wuFBKiwLLflqEpYiL+3JgJJ1C1BlE9hWadCPNlxo/nLrvkNzPGtE
         0rxZWVrrrDKWjeoQiI2UogM6Deia22hgFkJDzpS2eRvRlJyXZqkBjjOmexhOzvUOyyWp
         JMhY9HOC1LknEiAplbp/0xVrSW3f4YNIkGYaQZIOVoadPo726/J9HYKcgL55+YzPFyhY
         KMKbYx91e8kaZFC7rZ6taXZ9qc24eiFtYivxOPG/jmCvKY7qNbHE8r0BhjdLpUIFNJ3B
         JyEA==
X-Gm-Message-State: AFuF++nqdZ6/ZlZId2TWg4qyFrTa3UgiaKwgih3ABn/aLWPoKfACwSe3
	C2muJbaqA8g/5g1QB5ooJOkCSYq1+zYlwmatpGKBi1eZhOLZPilYCkhCQVXe+j37cZHsIw==
X-Gm-Gg: AYBFou25RtEBGkn9rI4VuyXICVR+WIzx3h/G9ec+eSYwYpUIfByUfTj0vrzjY+LzIsB
	r3ES4PaPCj5sjV+jCTyFU4zG7m4gtFkaIWy7Azp2274W0npEvK5KRA7hOpV50aWn2d9Epph5u+E
	HQay+y4s932qyFA6dUKas7efVzXgtLuzmIdjKwXjpSg3urb5MLSzU3kDcs5oldMrVNNShRDLXHe
	anEpkZZ4OGm1XaucRlMGN+APfZ/LSK2IbIYCjYuY4DKOtCb655Whx1VByebJ7nxtCkPXjTs9hz5
	OV/C9S1fQ4oP5VUh6D8OwLZ+QbfZf9R/e2J7Ryi4Xk+iTXTUWuVFsvuySUVlNs4DSKxsPrVpu6g
	nmF/QrfGdPoaek9c5dnynvQbJTc3N1g7aDmlNW9lzzig2eHukG0O9Y1q+BrjLZtHs7yFApUil2I
	i9Spnor5Azp/5RvUmRwnFIePcIsJmj8VJ52l6pTCQdHrMd1GzbE86TIkvZQhRmMQqBFACyMQcuI
	dP5fg==
X-Received: by 2002:a17:907:c518:b0:c26:1648:a06f with SMTP id a640c23a62f3a-c2941ba6395mr308697466b.42.1789049704679;
        Thu, 10 Sep 2026 07:15:04 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c293b6246c4sm225737966b.20.2026.09.10.07.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:15:04 -0700 (PDT)
Date: Thu, 10 Sep 2026 17:15:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Jason Gunthorpe <jgg@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: drivers/dma-buf/st-dma-fence-chain.c:207 test_find_seqno() warn:
 passing freed memory 'fence' (line 195)
Message-ID: <202609081301.6ARYAElY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260910141500.WR_49sgzebAMLsOLQFEEcDXTIXyce2qMbu5yLSRSd5M@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   28924df2a08f440c73991b83028032c901de2ae4
commit: 6055c9e333cfbb5af3eabe204caea92757094d19 dma-buf: Change st-dma-fence-chain.c to use kunit
config: arm-randconfig-r071-20260908 (https://download.01.org/0day-ci/archive/20260908/202609081301.6ARYAElY-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2362eeb5f75560740146975e9eabe84c6bd25a0d)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6055c9e333cf ("dma-buf: Change st-dma-fence-chain.c to use kunit")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609081301.6ARYAElY-lkp@intel.com/

New smatch warnings:
drivers/dma-buf/st-dma-fence-chain.c:207 test_find_seqno() warn: passing freed memory 'fence' (line 195)
drivers/dma-buf/st-dma-fence-chain.c:339 test_find_gap() error: dereferencing freed memory 'fence' (line 332)

Old smatch warnings:
drivers/dma-buf/st-dma-fence-chain.c:219 test_find_seqno() warn: passing freed memory 'fence' (line 209)
drivers/dma-buf/st-dma-fence-chain.c:228 test_find_seqno() warn: passing freed memory 'fence' (line 221)
drivers/dma-buf/st-dma-fence-chain.c:266 test_find_signaled() error: dereferencing freed memory 'fence' (line 259)
drivers/dma-buf/st-dma-fence-chain.c:307 test_find_out_of_order() error: dereferencing freed memory 'fence' (line 293)
drivers/dma-buf/st-dma-fence-chain.c:346 test_find_gap() warn: passing freed memory 'fence' (line 332)

vim +/fence +207 drivers/dma-buf/st-dma-fence-chain.c

6055c9e333cfbb Jason Gunthorpe   2026-03-01  174  static void test_find_seqno(struct kunit *test)
dc2f7e67a28a5c Chris Wilson      2020-04-09  175  {
dc2f7e67a28a5c Chris Wilson      2020-04-09  176  	struct fence_chains fc;
dc2f7e67a28a5c Chris Wilson      2020-04-09  177  	struct dma_fence *fence;
dc2f7e67a28a5c Chris Wilson      2020-04-09  178  	int err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  179  	int i;
dc2f7e67a28a5c Chris Wilson      2020-04-09  180  
dc2f7e67a28a5c Chris Wilson      2020-04-09  181  	err = fence_chains_init(&fc, 64, seqno_inc);
6055c9e333cfbb Jason Gunthorpe   2026-03-01  182  	KUNIT_ASSERT_EQ_MSG(test, err, 0, "Failed to init fence chains");
dc2f7e67a28a5c Chris Wilson      2020-04-09  183  
dc2f7e67a28a5c Chris Wilson      2020-04-09  184  	fence = dma_fence_get(fc.tail);
dc2f7e67a28a5c Chris Wilson      2020-04-09  185  	err = dma_fence_chain_find_seqno(&fence, 0);
dc2f7e67a28a5c Chris Wilson      2020-04-09  186  	dma_fence_put(fence);

The zero day bot is warning about this code because it moved, but
calling dma_fence_put() and then calling dma_fence_get() doesn't
make much sense.  Why even bother with refcounting it at that point
if we know it's unnecessary?

fence is the same as fc.tail...

I don't think there is any cleanup.h magic for dma fences?

dc2f7e67a28a5c Chris Wilson      2020-04-09  187  	if (err) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01  188  		KUNIT_FAIL(test, "Reported %d for find_seqno(0)!", err);
dc2f7e67a28a5c Chris Wilson      2020-04-09  189  		goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  190  	}
dc2f7e67a28a5c Chris Wilson      2020-04-09  191  
dc2f7e67a28a5c Chris Wilson      2020-04-09  192  	for (i = 0; i < fc.chain_length; i++) {
dc2f7e67a28a5c Chris Wilson      2020-04-09  193  		fence = dma_fence_get(fc.tail);
dc2f7e67a28a5c Chris Wilson      2020-04-09  194  		err = dma_fence_chain_find_seqno(&fence, i + 1);
dc2f7e67a28a5c Chris Wilson      2020-04-09 @195  		dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  196  		if (err) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01  197  			KUNIT_FAIL(test, "Reported %d for find_seqno(%d:%d)!",
dc2f7e67a28a5c Chris Wilson      2020-04-09  198  				   err, fc.chain_length + 1, i + 1);
dc2f7e67a28a5c Chris Wilson      2020-04-09  199  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  200  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  201  		if (fence != fc.chains[i]) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01  202  			KUNIT_FAIL(test, "Incorrect fence reported by find_seqno(%d:%d)",
dc2f7e67a28a5c Chris Wilson      2020-04-09  203  				   fc.chain_length + 1, i + 1);
dc2f7e67a28a5c Chris Wilson      2020-04-09  204  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  205  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  206  
dc2f7e67a28a5c Chris Wilson      2020-04-09 @207  		dma_fence_get(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  208  		err = dma_fence_chain_find_seqno(&fence, i + 1);
dc2f7e67a28a5c Chris Wilson      2020-04-09  209  		dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  210  		if (err) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01  211  			KUNIT_FAIL(test, "Error reported for finding self");
dc2f7e67a28a5c Chris Wilson      2020-04-09  212  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  213  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  214  		if (fence != fc.chains[i]) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01  215  			KUNIT_FAIL(test, "Incorrect fence reported by find self");
dc2f7e67a28a5c Chris Wilson      2020-04-09  216  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  217  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  218  
dc2f7e67a28a5c Chris Wilson      2020-04-09  219  		dma_fence_get(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  220  		err = dma_fence_chain_find_seqno(&fence, i + 2);
dc2f7e67a28a5c Chris Wilson      2020-04-09  221  		dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  222  		if (!err) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01  223  			KUNIT_FAIL(test, "Error not reported for future fence: find_seqno(%d:%d)!",
dc2f7e67a28a5c Chris Wilson      2020-04-09  224  				   i + 1, i + 2);
dc2f7e67a28a5c Chris Wilson      2020-04-09  225  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  226  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  227  
dc2f7e67a28a5c Chris Wilson      2020-04-09  228  		dma_fence_get(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  229  		err = dma_fence_chain_find_seqno(&fence, i);
dc2f7e67a28a5c Chris Wilson      2020-04-09  230  		dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  231  		if (err) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01  232  			KUNIT_FAIL(test, "Error reported for previous fence!");
dc2f7e67a28a5c Chris Wilson      2020-04-09  233  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  234  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  235  		if (i > 0 && fence != fc.chains[i - 1]) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01  236  			KUNIT_FAIL(test, "Incorrect fence reported by find_seqno(%d:%d)",
dc2f7e67a28a5c Chris Wilson      2020-04-09  237  				   i + 1, i);
dc2f7e67a28a5c Chris Wilson      2020-04-09  238  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  239  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  240  	}
dc2f7e67a28a5c Chris Wilson      2020-04-09  241  
dc2f7e67a28a5c Chris Wilson      2020-04-09  242  err:
dc2f7e67a28a5c Chris Wilson      2020-04-09  243  	fence_chains_fini(&fc);
dc2f7e67a28a5c Chris Wilson      2020-04-09  244  }
dc2f7e67a28a5c Chris Wilson      2020-04-09  245  
6055c9e333cfbb Jason Gunthorpe   2026-03-01  246  static void test_find_signaled(struct kunit *test)
dc2f7e67a28a5c Chris Wilson      2020-04-09  247  {
dc2f7e67a28a5c Chris Wilson      2020-04-09  248  	struct fence_chains fc;
dc2f7e67a28a5c Chris Wilson      2020-04-09  249  	struct dma_fence *fence;
dc2f7e67a28a5c Chris Wilson      2020-04-09  250  	int err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  251  
dc2f7e67a28a5c Chris Wilson      2020-04-09  252  	err = fence_chains_init(&fc, 2, seqno_inc);
6055c9e333cfbb Jason Gunthorpe   2026-03-01  253  	KUNIT_ASSERT_EQ_MSG(test, err, 0, "Failed to init fence chains");
dc2f7e67a28a5c Chris Wilson      2020-04-09  254  
dc2f7e67a28a5c Chris Wilson      2020-04-09  255  	dma_fence_signal(fc.fences[0]);
dc2f7e67a28a5c Chris Wilson      2020-04-09  256  
dc2f7e67a28a5c Chris Wilson      2020-04-09  257  	fence = dma_fence_get(fc.tail);
dc2f7e67a28a5c Chris Wilson      2020-04-09  258  	err = dma_fence_chain_find_seqno(&fence, 1);
dc2f7e67a28a5c Chris Wilson      2020-04-09  259  	dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  260  	if (err) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01  261  		KUNIT_FAIL(test, "Reported %d for find_seqno()!", err);
dc2f7e67a28a5c Chris Wilson      2020-04-09  262  		goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  263  	}
dc2f7e67a28a5c Chris Wilson      2020-04-09  264  
dc2f7e67a28a5c Chris Wilson      2020-04-09  265  	if (fence && fence != fc.chains[0]) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01  266  		KUNIT_FAIL(test, "Incorrect chain-fence.seqno:%lld reported for completed seqno:1",
dc2f7e67a28a5c Chris Wilson      2020-04-09  267  			   fence->seqno);
dc2f7e67a28a5c Chris Wilson      2020-04-09  268  
dc2f7e67a28a5c Chris Wilson      2020-04-09  269  		dma_fence_get(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  270  		err = dma_fence_chain_find_seqno(&fence, 1);
dc2f7e67a28a5c Chris Wilson      2020-04-09  271  		dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  272  		if (err)
6055c9e333cfbb Jason Gunthorpe   2026-03-01  273  			KUNIT_FAIL(test, "Reported %d for finding self!", err);
dc2f7e67a28a5c Chris Wilson      2020-04-09  274  	}
dc2f7e67a28a5c Chris Wilson      2020-04-09  275  
dc2f7e67a28a5c Chris Wilson      2020-04-09  276  err:
dc2f7e67a28a5c Chris Wilson      2020-04-09  277  	fence_chains_fini(&fc);
dc2f7e67a28a5c Chris Wilson      2020-04-09  278  }
dc2f7e67a28a5c Chris Wilson      2020-04-09  279  
6055c9e333cfbb Jason Gunthorpe   2026-03-01  280  static void test_find_out_of_order(struct kunit *test)
dc2f7e67a28a5c Chris Wilson      2020-04-09  281  {
dc2f7e67a28a5c Chris Wilson      2020-04-09  282  	struct fence_chains fc;
dc2f7e67a28a5c Chris Wilson      2020-04-09  283  	struct dma_fence *fence;
dc2f7e67a28a5c Chris Wilson      2020-04-09  284  	int err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  285  
dc2f7e67a28a5c Chris Wilson      2020-04-09  286  	err = fence_chains_init(&fc, 3, seqno_inc);
6055c9e333cfbb Jason Gunthorpe   2026-03-01  287  	KUNIT_ASSERT_EQ_MSG(test, err, 0, "Failed to init fence chains");
dc2f7e67a28a5c Chris Wilson      2020-04-09  288  
dc2f7e67a28a5c Chris Wilson      2020-04-09  289  	dma_fence_signal(fc.fences[1]);
dc2f7e67a28a5c Chris Wilson      2020-04-09  290  
dc2f7e67a28a5c Chris Wilson      2020-04-09  291  	fence = dma_fence_get(fc.tail);
dc2f7e67a28a5c Chris Wilson      2020-04-09  292  	err = dma_fence_chain_find_seqno(&fence, 2);
dc2f7e67a28a5c Chris Wilson      2020-04-09  293  	dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  294  	if (err) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01  295  		KUNIT_FAIL(test, "Reported %d for find_seqno()!", err);
dc2f7e67a28a5c Chris Wilson      2020-04-09  296  		goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  297  	}
dc2f7e67a28a5c Chris Wilson      2020-04-09  298  
4cca2e64164176 Lionel Landwerlin 2020-06-25  299  	/*
4cca2e64164176 Lionel Landwerlin 2020-06-25  300  	 * We signaled the middle fence (2) of the 1-2-3 chain. The behavior
4cca2e64164176 Lionel Landwerlin 2020-06-25  301  	 * of the dma-fence-chain is to make us wait for all the fences up to
4cca2e64164176 Lionel Landwerlin 2020-06-25  302  	 * the point we want. Since fence 1 is still not signaled, this what
4cca2e64164176 Lionel Landwerlin 2020-06-25  303  	 * we should get as fence to wait upon (fence 2 being garbage
4cca2e64164176 Lionel Landwerlin 2020-06-25  304  	 * collected during the traversal of the chain).
4cca2e64164176 Lionel Landwerlin 2020-06-25  305  	 */
6055c9e333cfbb Jason Gunthorpe   2026-03-01  306  	if (fence != fc.chains[0])
6055c9e333cfbb Jason Gunthorpe   2026-03-01  307  		KUNIT_FAIL(test, "Incorrect chain-fence.seqno:%lld reported for completed seqno:2",
4cca2e64164176 Lionel Landwerlin 2020-06-25  308  			   fence ? fence->seqno : 0);
dc2f7e67a28a5c Chris Wilson      2020-04-09  309  
dc2f7e67a28a5c Chris Wilson      2020-04-09  310  err:
dc2f7e67a28a5c Chris Wilson      2020-04-09  311  	fence_chains_fini(&fc);
dc2f7e67a28a5c Chris Wilson      2020-04-09  312  }
dc2f7e67a28a5c Chris Wilson      2020-04-09  313  
dc2f7e67a28a5c Chris Wilson      2020-04-09  314  static uint64_t seqno_inc2(unsigned int i)
dc2f7e67a28a5c Chris Wilson      2020-04-09  315  {
dc2f7e67a28a5c Chris Wilson      2020-04-09  316  	return 2 * i + 2;
dc2f7e67a28a5c Chris Wilson      2020-04-09  317  }
dc2f7e67a28a5c Chris Wilson      2020-04-09  318  
6055c9e333cfbb Jason Gunthorpe   2026-03-01  319  static void test_find_gap(struct kunit *test)
dc2f7e67a28a5c Chris Wilson      2020-04-09  320  {
dc2f7e67a28a5c Chris Wilson      2020-04-09  321  	struct fence_chains fc;
dc2f7e67a28a5c Chris Wilson      2020-04-09  322  	struct dma_fence *fence;
dc2f7e67a28a5c Chris Wilson      2020-04-09  323  	int err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  324  	int i;
dc2f7e67a28a5c Chris Wilson      2020-04-09  325  
dc2f7e67a28a5c Chris Wilson      2020-04-09  326  	err = fence_chains_init(&fc, 64, seqno_inc2);
6055c9e333cfbb Jason Gunthorpe   2026-03-01  327  	KUNIT_ASSERT_EQ_MSG(test, err, 0, "Failed to init fence chains");
dc2f7e67a28a5c Chris Wilson      2020-04-09  328  
dc2f7e67a28a5c Chris Wilson      2020-04-09  329  	for (i = 0; i < fc.chain_length; i++) {
dc2f7e67a28a5c Chris Wilson      2020-04-09  330  		fence = dma_fence_get(fc.tail);
dc2f7e67a28a5c Chris Wilson      2020-04-09  331  		err = dma_fence_chain_find_seqno(&fence, 2 * i + 1);
dc2f7e67a28a5c Chris Wilson      2020-04-09 @332  		dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  333  		if (err) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01  334  			KUNIT_FAIL(test, "Reported %d for find_seqno(%d:%d)!",
dc2f7e67a28a5c Chris Wilson      2020-04-09  335  				   err, fc.chain_length + 1, 2 * i + 1);
dc2f7e67a28a5c Chris Wilson      2020-04-09  336  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  337  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  338  		if (fence != fc.chains[i]) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01 @339  			KUNIT_FAIL(test, "Incorrect fence.seqno:%lld reported by find_seqno(%d:%d)",
dc2f7e67a28a5c Chris Wilson      2020-04-09  340  				   fence->seqno,
dc2f7e67a28a5c Chris Wilson      2020-04-09  341  				   fc.chain_length + 1,
dc2f7e67a28a5c Chris Wilson      2020-04-09  342  				   2 * i + 1);
dc2f7e67a28a5c Chris Wilson      2020-04-09  343  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  344  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  345  
dc2f7e67a28a5c Chris Wilson      2020-04-09  346  		dma_fence_get(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  347  		err = dma_fence_chain_find_seqno(&fence, 2 * i + 2);
dc2f7e67a28a5c Chris Wilson      2020-04-09  348  		dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  349  		if (err) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01  350  			KUNIT_FAIL(test, "Error reported for finding self");
dc2f7e67a28a5c Chris Wilson      2020-04-09  351  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  352  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  353  		if (fence != fc.chains[i]) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01  354  			KUNIT_FAIL(test, "Incorrect fence reported by find self");
dc2f7e67a28a5c Chris Wilson      2020-04-09  355  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  356  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  357  	}
dc2f7e67a28a5c Chris Wilson      2020-04-09  358  
dc2f7e67a28a5c Chris Wilson      2020-04-09  359  err:
dc2f7e67a28a5c Chris Wilson      2020-04-09  360  	fence_chains_fini(&fc);
dc2f7e67a28a5c Chris Wilson      2020-04-09  361  }
dc2f7e67a28a5c Chris Wilson      2020-04-09  362  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

