Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4896372ED4
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 07:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772781868; cv=none; b=MnuoFZkkwiKKotkVjUjWgsDWZHoZ+t1LCTCi2z98RUMda6ESiXdRyALLr0py7ISZKvWxZwmoM+TDg0RBTtKluvUbL616dAcIC2T6d1jQdri/N4I9bVQWl62ellaunP6wvbiWgKzlXnUBpMES2icDegv4VeF+Rrr97fYGf2dbCI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772781868; c=relaxed/simple;
	bh=xy0d2CWp8k00H5MCo4iuoVbgEJ430v37+oaK5jxtuwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m+VkBygsW5eGym7fBuIQu90MeOhRXl7lzvhackZPtxgStfkak5Qa+qOVDedqI4f/xa/72OcJSxj+wXNo5ODErQsN5uV2fz8Z+Ryi1GkzAuSTIYGLaAzT5MjH2i5Nqyb7UfR3YVw5DsXf2NBeqZIKY9HKUXGRocghJGoSWwKXUTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pKMLwdxS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pKMLwdxS"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso76709795e9.3
        for <oe-kbuild@lists.linux.dev>; Thu, 05 Mar 2026 23:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772781865; x=1773386665; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XosiABtFX1f7B/CW19TAehcX0bvOa3LXzhquH++ZON4=;
        b=pKMLwdxSbbT4DVZtqlFOQiL17em8ki9iw2nODo732exF9mrXYkccsek5F4+1+bGfmu
         yifOCYq/+7AQZnfKyNTtxpj2Zrpr9GMoAYek0UFgSXYGU48DM5LsaTqQurEQpE8iC3my
         hxgVyqlXpVMJoRxyNH4f5h5qi9628dFP4UVpHRTfEmxo4axp6EMGa8RxoI1vnT1gPMrU
         /QsKJ9tFOSrmRFcBND28P6dM6VGjCYbezpUDPPCwIClmXBcagb4e5GabtQFpPo+IbQr3
         yZGd9fnclz65CUSDLT28jUBA3hiRAym0EMAC7Ovc5CH7SzLvb+ZEBirDdjd0M6jgUkzs
         sS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772781865; x=1773386665;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XosiABtFX1f7B/CW19TAehcX0bvOa3LXzhquH++ZON4=;
        b=EUJ/FjPnwpZcyvfEsCGkkbjphv35IxY9e3t2QQL5GVZi/mXHi+wDfZVaSIjghTQ4FK
         VqKhYCuy6OzuDYt52Li8sxvoo3jDc4rfM3cSLvlJ1H4JhAP0DPkV/jp8CkN+GJ0a9XLt
         yavpwV48/zSn5YNg570aAr4Nr1Z3zSYtyzfk0k1VBpUlexp3Ing/K8a8pRduqqkz9evZ
         1kNyxbTA92m11vNfkCBNMtFmPPC9XRiZ/SjvljpoBf+LCPl2ZQWYylDIcfFI4XaTEDA+
         3PM7OcQRNLHiTSLxWU+/eBDgHrwu/5sUvrxoVG9BO6sksmIngf+2qq1BWPs7smKtoLdc
         fwEg==
X-Gm-Message-State: AOJu0YyKxmuxmuTrF/Iu3or4jKR3PremwIMsWGGVn7yaujFPounEj6+8
	t4g4OUMl4yGreACx2GwUH+UmjrJVFi8hVKPGiNisTZV08m1xM9wWjv+Bg6ok40fWvA8Qi8BZaiZ
	VgFXl
X-Gm-Gg: ATEYQzyQdvM0oufT0wOOxb8TJLYAEAXk2mPjvTG7gPbB1nTAZu5+m5XxbhvfqUri+qc
	1dgL80uoRppXamqEmaRVfS7P6kTVZ7+wPI+IkuNBISEsVcWHKTn4mRCZuWw4VD+00UhO5ZHtMcN
	YC78Xt+rYo+8qp3Ykl6j2vXzLnmrkZ1FCbFIiCqtG/0Pa+KNGs6YnrtnnX3X2P/6Y096nfXIAms
	fXdt8LtATLDiWU/M4nk3H8ZKf902bj9H29khRqY5q+cRxWVKurgtcHs/N7aKAra1QlUbogH+X7K
	gn5vFE5hK2D1Vn42ZkreBtH9EzTDQA8Nd7LvV1cY8ST8gumEqL234su+jYhkmB9pHvDA7G0Eb30
	feARWCp9/RxOwDkE+TSKY9JTrMS5C56gP32xgWQpFvtmP0YE4cgg2Rg7d8tLmzwgjzsUAP8vToS
	+mOJFrUxgfB8PhFKZjnLVcmDlPbmt270E/xKfwrRg=
X-Received: by 2002:a05:600c:45d1:b0:480:6ab1:ed0d with SMTP id 5b1f17b1804b1-4852691d5f0mr15816005e9.9.1772781865058;
        Thu, 05 Mar 2026 23:24:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276bc6bbsm14138885e9.15.2026.03.05.23.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:24:24 -0800 (PST)
Date: Fri, 6 Mar 2026 10:24:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>
Subject: drivers/net/ethernet/qlogic/qede/qede_fp.c:989 qede_tpa_end() error:
 testing array offset 'i' after use.
Message-ID: <202603060852.8GvwVQFk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260306072420.BTF3_LJzy8MiGXwjdterqAKOXRfC9w_w1gtx581hXCA@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5ee8dbf54602dc340d6235b1d6aa17c0f283f48c
commit: 896f1a2493b59beb2b5ccdf990503dbb16cb2256 net: qlogic/qede: fix potential out-of-bounds read in qede_tpa_cont() and qede_tpa_end()
config: mips-randconfig-r071-20260306 (https://download.01.org/0day-ci/archive/20260306/202603060852.8GvwVQFk-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603060852.8GvwVQFk-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/qlogic/qede/qede_fp.c:989 qede_tpa_end() error: testing array offset 'i' after use.
drivers/net/ethernet/qlogic/qede/qede_fp.c:964 qede_tpa_cont() error: testing array offset 'i' after use.

vim +/i +989 drivers/net/ethernet/qlogic/qede/qede_fp.c

cdda926d409869 Mintz, Yuval   2017-01-01   958  static inline void qede_tpa_cont(struct qede_dev *edev,
cdda926d409869 Mintz, Yuval   2017-01-01   959  				 struct qede_rx_queue *rxq,
cdda926d409869 Mintz, Yuval   2017-01-01   960  				 struct eth_fast_path_rx_tpa_cont_cqe *cqe)
cdda926d409869 Mintz, Yuval   2017-01-01   961  {
cdda926d409869 Mintz, Yuval   2017-01-01   962  	int i;
cdda926d409869 Mintz, Yuval   2017-01-01   963  
896f1a2493b59b Pavel Zhigulin 2025-11-13  @964  	for (i = 0; cqe->len_list[i] && i < ARRAY_SIZE(cqe->len_list); i++)

Flip this around check if "i" is within bounds first before checking if
cqe->len_list[i] is non-zero.

	for (i = 0; i < ARRAY_SIZE(cqe->len_list) && cqe->len_list[i]; i++)

cdda926d409869 Mintz, Yuval   2017-01-01   965  		qede_fill_frag_skb(edev, rxq, cqe->tpa_agg_index,
cdda926d409869 Mintz, Yuval   2017-01-01   966  				   le16_to_cpu(cqe->len_list[i]));
cdda926d409869 Mintz, Yuval   2017-01-01   967  
cdda926d409869 Mintz, Yuval   2017-01-01   968  	if (unlikely(i > 1))
cdda926d409869 Mintz, Yuval   2017-01-01   969  		DP_ERR(edev,
cdda926d409869 Mintz, Yuval   2017-01-01   970  		       "Strange - TPA cont with more than a single len_list entry\n");
cdda926d409869 Mintz, Yuval   2017-01-01   971  }
cdda926d409869 Mintz, Yuval   2017-01-01   972  
10a0176e4e6eb6 Mintz, Yuval   2017-04-07   973  static int qede_tpa_end(struct qede_dev *edev,
cdda926d409869 Mintz, Yuval   2017-01-01   974  			struct qede_fastpath *fp,
cdda926d409869 Mintz, Yuval   2017-01-01   975  			struct eth_fast_path_rx_tpa_end_cqe *cqe)
cdda926d409869 Mintz, Yuval   2017-01-01   976  {
cdda926d409869 Mintz, Yuval   2017-01-01   977  	struct qede_rx_queue *rxq = fp->rxq;
cdda926d409869 Mintz, Yuval   2017-01-01   978  	struct qede_agg_info *tpa_info;
cdda926d409869 Mintz, Yuval   2017-01-01   979  	struct sk_buff *skb;
cdda926d409869 Mintz, Yuval   2017-01-01   980  	int i;
cdda926d409869 Mintz, Yuval   2017-01-01   981  
cdda926d409869 Mintz, Yuval   2017-01-01   982  	tpa_info = &rxq->tpa_info[cqe->tpa_agg_index];
cdda926d409869 Mintz, Yuval   2017-01-01   983  	skb = tpa_info->skb;
cdda926d409869 Mintz, Yuval   2017-01-01   984  
8a8633978b842c Manish Chopra  2018-05-17   985  	if (tpa_info->buffer.page_offset == PAGE_SIZE)
8a8633978b842c Manish Chopra  2018-05-17   986  		dma_unmap_page(rxq->dev, tpa_info->buffer.mapping,
8a8633978b842c Manish Chopra  2018-05-17   987  			       PAGE_SIZE, rxq->data_direction);
8a8633978b842c Manish Chopra  2018-05-17   988  
896f1a2493b59b Pavel Zhigulin 2025-11-13  @989  	for (i = 0; cqe->len_list[i] && i < ARRAY_SIZE(cqe->len_list); i++)

Same.

cdda926d409869 Mintz, Yuval   2017-01-01   990  		qede_fill_frag_skb(edev, rxq, cqe->tpa_agg_index,
cdda926d409869 Mintz, Yuval   2017-01-01   991  				   le16_to_cpu(cqe->len_list[i]));
cdda926d409869 Mintz, Yuval   2017-01-01   992  	if (unlikely(i > 1))
cdda926d409869 Mintz, Yuval   2017-01-01   993  		DP_ERR(edev,
cdda926d409869 Mintz, Yuval   2017-01-01   994  		       "Strange - TPA emd with more than a single len_list entry\n");
cdda926d409869 Mintz, Yuval   2017-01-01   995  
cdda926d409869 Mintz, Yuval   2017-01-01   996  	if (unlikely(tpa_info->state != QEDE_AGG_STATE_START))
cdda926d409869 Mintz, Yuval   2017-01-01   997  		goto err;
cdda926d409869 Mintz, Yuval   2017-01-01   998  
cdda926d409869 Mintz, Yuval   2017-01-01   999  	/* Sanity */
cdda926d409869 Mintz, Yuval   2017-01-01  1000  	if (unlikely(cqe->num_of_bds != tpa_info->frag_id + 1))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

