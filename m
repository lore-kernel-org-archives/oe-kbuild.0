Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A044189B97
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Nov 2024 08:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730709082; cv=none; b=GKDagSeC66kjGWCpbqi11bO+RD9e0yms1wRjuDCASnqP1iJ8nczJRDbcpbMxsWMYe6boSoJ51cbKYGQOypN2Fd+WeT0CwntYTyGMlTXVwneNRbT5kZep96jFcWI6gt5w+JGQJy2dvOrdA/GEd1vgFNqguy1aVFCulEUBlVfcywI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730709082; c=relaxed/simple;
	bh=RMFwDMojD3zrSAgOcjuKC+xriirvgs/o1aANeynXSuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=KCa3O7E00QjfxfdM6zJm+HTfHxOoSmdJ8ps9eK9mn9mB/5qfG4AuQSaUdYr5GXCu551cYvxSWgSnjw7Itdxh3DNW/uC953E29h+y1BlG4sxDOCmToXLc/MC61riirklNm2VlU/cQiugaAlTXvjwhRXQFWeG0PZhw5pSjo0QR4fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CipQRwbi; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CipQRwbi"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43155afca99so28512985e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 04 Nov 2024 00:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730709078; x=1731313878; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T5vDLGsbEr0SVIowN1t5ye+7OUL4pjjT2D7werAFSjM=;
        b=CipQRwbi07lCjzQ56qnODXfhqIbzL5HSbwFs8PiPp7wfLO74D/1MhGth6a745+t9SK
         wybzrvWe6MEBlK1mZ516VDcsA2wkHeT7wwNa3W91wnJNb6JzDZkI39dVnTQ5uUWbPdYe
         UMV0+VN1A0iPnRTRFf4QbiiEt17kpMTdawgOUTv1RsFhPxr0U8qFBpA0TvSfJY5YMxCJ
         3aH91p7XjNYW5WkEmxM3eqrYLlc9Z5hyU51N/vKS7su2JDerqdH+gr0fK5tpSK2NXNCJ
         R3x23jgLfG1I3SlfXmrSK5/1wR6DTrMIJ/URoBtgHaUW3PXBFMS1HtVaZg5oFc+zNN8O
         0OIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730709078; x=1731313878;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5vDLGsbEr0SVIowN1t5ye+7OUL4pjjT2D7werAFSjM=;
        b=PF8ugTnF3BNdGLFQ+TO9BvfQIyZeYPdWfnzxFnv4Y93gfAMEUh1WiyJWscjoeNlTTS
         Pm5WnCJAK0uO+57BcZo2l4cP571dhTo7TC170AUX2YxBpK+67236atIdmZmfI/YAFJZc
         bMCmG9okGiTlX8Th65jvp51iXn87sD3c3e51jC0gG6hqGmWO1XhY8OHRMQPizzSeoy2L
         g/XjVRhvK4nm52NoAnmxW11TlHp9/0RwgF+Y0ROU5PTsSA4tehqJqw9qkbEYrwm6WsWu
         bkGS0yQ/sruEmwmMSqN6b1t4FRVlf0susxsKcuIvxkJ6yLo06JlwugnawcMqqM09PNt1
         EapA==
X-Gm-Message-State: AOJu0Yz8J6r/7tGgx5FWyUw/6V+vZEE8Yu/OYsEgwVhkWmixbBE3qqJZ
	RLnO5ZJoM7sy8XLXVcD4XmJB059AeW8IkePGULuEzfZXVJ49qpy0mBktWFZtJV7DS5ZBwqe/7rG
	V
X-Google-Smtp-Source: AGHT+IFFiT8xMGT+o7kM5vRaU6KjK8tqr+AcRQcVqXIZYuM1L7HGi9LZqQfv+QQLXIRdVtTWEYW6xA==
X-Received: by 2002:a5d:64a7:0:b0:374:c7cd:8818 with SMTP id ffacd0b85a97d-381c79e366dmr9155476f8f.22.1730709078297;
        Mon, 04 Nov 2024 00:31:18 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d439esm12549514f8f.44.2024.11.04.00.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 00:31:17 -0800 (PST)
Date: Mon, 4 Nov 2024 11:31:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Kanchana P Sridhar <kanchana.p.sridhar@intel.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	hannes@cmpxchg.org, yosryahmed@google.com, nphamcs@gmail.com,
	chengming.zhou@linux.dev, usamaarif642@gmail.com,
	ryan.roberts@arm.com, ying.huang@intel.com, 21cnbao@gmail.com,
	akpm@linux-foundation.org, linux-crypto@vger.kernel.org,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	clabbe@baylibre.com, ardb@kernel.org, ebiggers@google.com,
	surenb@google.com, kristen.c.accardi@intel.com, zanussi@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, wajdi.k.feghali@intel.com,
	vinodh.gopal@intel.com, kanchana.p.sridhar@intel.com
Subject: Re: [PATCH v2 13/13] mm: zswap: Compress batching with Intel IAA in
 zswap_store() of large folios.
Message-ID: <89728727-0fd2-4539-bc89-17a699d7179a@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241103032111.333282-14-kanchana.p.sridhar@intel.com>

Hi Kanchana,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Kanchana-P-Sridhar/crypto-acomp-Define-two-new-interfaces-for-compress-decompress-batching/20241103-112337
base:   5c4cf96cd70230100b5d396d45a5c9a332539d19
patch link:    https://lore.kernel.org/r/20241103032111.333282-14-kanchana.p.sridhar%40intel.com
patch subject: [PATCH v2 13/13] mm: zswap: Compress batching with Intel IAA in zswap_store() of large folios.
config: x86_64-randconfig-161-20241104 (https://download.01.org/0day-ci/archive/20241104/202411040859.2z0MfFkR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411040859.2z0MfFkR-lkp@intel.com/

smatch warnings:
mm/zswap.c:1788 zswap_store_propagate_errors() warn: variable dereferenced before check 'sbp->entry' (see line 1785)

vim +1788 mm/zswap.c

c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1771  static __always_inline void zswap_store_propagate_errors(
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1772  	struct zswap_store_pipeline_state *zst,
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1773  	u8 error_batch_idx)
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1774  {
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1775  	u8 i;
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1776  
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1777  	if (zst->errors[error_batch_idx])
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1778  		return;
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1779  
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1780  	for (i = 0; i < zst->nr_comp_pages; ++i) {
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1781  		struct zswap_store_sub_batch_page *sbp = &zst->sub_batch[i];
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1782  
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1783  		if (sbp->batch_idx == error_batch_idx) {
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1784  			if (!sbp->error) {
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02 @1785  				if (!IS_ERR_VALUE(sbp->entry->handle))
                                                                                                  ^^^^^^^^^^^^^^^^^^
Dereferenced

c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1786  					zpool_free(zst->pool->zpool, sbp->entry->handle);
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1787  
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02 @1788  				if (sbp->entry) {
                                                                                    ^^^^^^^^^^
Checked too late

c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1789  					zswap_entry_cache_free(sbp->entry);
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1790  					sbp->entry = NULL;
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1791  				}
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1792  				sbp->error = -EINVAL;
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1793  			}
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1794  		}
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1795  	}
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1796  
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1797  	/*
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1798  	 * Set zswap status for the folio to "error"
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1799  	 * for use in swap_writepage.
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1800  	 */
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1801  	zst->errors[error_batch_idx] = -EINVAL;
c1252ac91d6a6a Kanchana P Sridhar 2024-11-02  1802  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

