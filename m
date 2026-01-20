Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C325136C5B8
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Jan 2026 06:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768890603; cv=none; b=eg0ozF0kMHEBX2B+L9YtIGxXYqReyUftFf6X5RMzw1daKwN2tbWXsjaqKs9zQoWpN8di3IAYG42NGFgqEiaLsBQ7u8ev7QcGvT5y8zaLRz3SQKE90MXohIv2F8NZJZD2c47mR/gGoGoIvPtV3rajsPU/i64Qc90z6zIsb/O7jVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768890603; c=relaxed/simple;
	bh=EDJDwOnRcBDl/yC0BG6E2q1EjuMZ/FUIoDQJsK/aYew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=qIisTfoOmQJW2q90Xw7gFMR8+cp8kSHeO16MBGeu0fGgRFQZit2AakbxTHtjNFV8Ch0qqGsm/LidYMv8TUIncmBEscD3FHkVy5z4YhPfLAvFUzf1/4dTF8ZHF66VaMNlhN5BB3q/vF0rQoVLD13TeDZM/q6e7F4BdMxN/xnYoMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=glsryiqR; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="glsryiqR"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47ee807a4c5so36658785e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 22:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768890599; x=1769495399; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AEWbkgnTvkqzPgeo47yZYvD2LbBZqNGtjtOFOPaqgWg=;
        b=glsryiqRBSN0xj5sYeamkiJyFuOcXxpQN0QYG+bo0iSRvirk6C/In5YUs5uhXPkGxx
         S06UoyBIZyAAVoejRJxsd/LXXLPasfimsevHs4xmaslf5umqzZIywcBd2JNCvwEPLY0W
         tbTwO88xUVTA9AXaoR9yAQ2KZryEmrjXJ/H8lHFxrDRRMFwbTQ+jWUsfXUEUfPPlFlTL
         nPKfsF3E/wyzavcp3QEAcjtHBMak26vRSKLgTwDGWzYTRlCucIp/0wbEmKmHMPpquQ3N
         3eLeBZDbaajL79V0qtyT70/dZ2yGg+MPNwESw2riH7ncPvcTHaEV+Tkb695dd9ifgm8x
         ToOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890599; x=1769495399;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AEWbkgnTvkqzPgeo47yZYvD2LbBZqNGtjtOFOPaqgWg=;
        b=TjYcgs6qzik/XnoUQFFQlyLdD8jPacA+2G07BP/wAyYGiDXN35rANtEAJLfkM6tC/w
         uaNi8ntcnfm+hPo3MxmLBqsHOlnkFNCDlUGP4TAVqM1h7v/g31AGk8SqHNUyhH4gaLTp
         3s3vt908UzkW3UMVb5lgbNKeh2vVCu1wtE5eVMBA45Kh/d89iLt1BRAQpVcpNQP2Dvv+
         2hsI7YK4pv2OoLx0PoOoVfe6cj4bUij1HJByl6GYx4/nYfZeCuGIFcCxmu4JY2keJ+FC
         dSYil3u6WocvoZLNU48G+dnrUetxRYH5V4yTQx825Iwg+RXeETx/68RwFEzE0cKBFEeX
         VTUQ==
X-Gm-Message-State: AOJu0YxRVY5vhQfsaTh7YGI6Dq7R84QC1vCQWJOA7llrTMW6D96gCB0n
	LwbzTwlYNZe14N4B5jBWMfxIa/v1kfoRdlGvypzVWzglsp+M9SorWfFGdpb9BRcefxIVIH77FNZ
	/0CJW
X-Gm-Gg: AY/fxX5q1RZkZ5Pvqb2DmD7pEv2i4HKKiGE+2jTbPbzJapiXDRPphNq+xjxU0R7xyTm
	f0+57NJckWY5zZ8ifExQWOfkx88lxcBnzoYaVdPeDSP6m9a0kdpvow05HODgMRbEH443C0DKFhe
	9LdMslKDJbEOa+iF4vMw5EPzbyjgJyuuSone/juQjh8xqrf/eAIl5Y7Lf2VdWO5I95G0XbU42Nk
	gWtPqWzoEEhiHSEZ10nKqx1vV3svWzVGM9YtXCR1q5bGr4508hZLdsxzp7jhXsPLEgyS1WhlmBg
	+uv56E0gfekFRqkO8qtFOdv7fB2gblrE6YHFLOhsQZTorSA84Z6IdF1i8aCPWTUCTo+WJNoY8GC
	ltWMk+YjP9uXzSdiWZr1ZiYbptZpK/Csu6q3P41OQFRjuk9s6EbOhS/LZKREYvRqHuZ9oWfWjW3
	I1rfCTpRIE9PJBh3kr
X-Received: by 2002:a05:600c:870e:b0:47d:264e:b35a with SMTP id 5b1f17b1804b1-4801eabf1eamr154903985e9.13.1768890598747;
        Mon, 19 Jan 2026 22:29:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879537sm231880515e9.5.2026.01.19.22.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:29:58 -0800 (PST)
Date: Tue, 20 Jan 2026 09:29:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, mpenttil@redhat.com, linux-mm@kvack.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2 1/3] mm: unified hmm fault and migrate device pagewalk
 paths
Message-ID: <202601200251.uRdWeQPq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260119112502.645059-2-mpenttil@redhat.com>
Message-ID: <20260120062955.WG2IdjkOlo7vgy8D_eLrNKxGUC4cHbgnw35VP8y9XXY@z>

Hi,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/mpenttil-redhat-com/mm-unified-hmm-fault-and-migrate-device-pagewalk-paths/20260119-193100
base:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
patch link:    https://lore.kernel.org/r/20260119112502.645059-2-mpenttil%40redhat.com
patch subject: [PATCH v2 1/3] mm: unified hmm fault and migrate device pagewalk paths
config: sparc-randconfig-r071-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200251.uRdWeQPq-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601200251.uRdWeQPq-lkp@intel.com/

smatch warnings:
mm/hmm.c:960 hmm_vma_walk_pmd() warn: missing error code? 'r'
mm/hmm.c:1310 hmm_range_fault() error: we previously assumed 'range->notifier' could be null (see line 1296)

vim +/r +960 mm/hmm.c

53f5c3f489ecdd Jérôme Glisse   2018-04-10   926  static int hmm_vma_walk_pmd(pmd_t *pmdp,
53f5c3f489ecdd Jérôme Glisse   2018-04-10   927  			    unsigned long start,
53f5c3f489ecdd Jérôme Glisse   2018-04-10   928  			    unsigned long end,
53f5c3f489ecdd Jérôme Glisse   2018-04-10   929  			    struct mm_walk *walk)
53f5c3f489ecdd Jérôme Glisse   2018-04-10   930  {
53f5c3f489ecdd Jérôme Glisse   2018-04-10   931  	struct hmm_vma_walk *hmm_vma_walk = walk->private;
53f5c3f489ecdd Jérôme Glisse   2018-04-10   932  	struct hmm_range *range = hmm_vma_walk->range;
2733ea144dcce7 Jason Gunthorpe 2020-05-01   933  	unsigned long *hmm_pfns =
2733ea144dcce7 Jason Gunthorpe 2020-05-01   934  		&range->hmm_pfns[(start - range->start) >> PAGE_SHIFT];
2288a9a68175ce Jason Gunthorpe 2020-03-05   935  	unsigned long npages = (end - start) >> PAGE_SHIFT;
adc5de78797562 Mika Penttilä   2026-01-19   936  	struct mm_struct *mm = walk->vma->vm_mm;
2288a9a68175ce Jason Gunthorpe 2020-03-05   937  	unsigned long addr = start;
adc5de78797562 Mika Penttilä   2026-01-19   938  	enum migrate_vma_info minfo;
adc5de78797562 Mika Penttilä   2026-01-19   939  	unsigned long i;
adc5de78797562 Mika Penttilä   2026-01-19   940  	spinlock_t *ptl;
53f5c3f489ecdd Jérôme Glisse   2018-04-10   941  	pte_t *ptep;
d08faca018c461 Jérôme Glisse   2018-10-30   942  	pmd_t pmd;
adc5de78797562 Mika Penttilä   2026-01-19   943  	int r;
adc5de78797562 Mika Penttilä   2026-01-19   944  
adc5de78797562 Mika Penttilä   2026-01-19   945  	minfo = hmm_select_migrate(range);
53f5c3f489ecdd Jérôme Glisse   2018-04-10   946  
53f5c3f489ecdd Jérôme Glisse   2018-04-10   947  again:
adc5de78797562 Mika Penttilä   2026-01-19   948  	hmm_vma_walk->locked = false;
adc5de78797562 Mika Penttilä   2026-01-19   949  	hmm_vma_walk->pmdlocked = false;
26e1a0c3277d7f Hugh Dickins    2023-06-08   950  	pmd = pmdp_get_lockless(pmdp);
adc5de78797562 Mika Penttilä   2026-01-19   951  	if (pmd_none(pmd)) {
adc5de78797562 Mika Penttilä   2026-01-19   952  		r = hmm_vma_walk_hole(start, end, -1, walk);
adc5de78797562 Mika Penttilä   2026-01-19   953  		if (r || !minfo)
adc5de78797562 Mika Penttilä   2026-01-19   954  			return r;

if minfo is NULL do we return success?

adc5de78797562 Mika Penttilä   2026-01-19   955  
adc5de78797562 Mika Penttilä   2026-01-19   956  		ptl = pmd_lock(walk->mm, pmdp);
adc5de78797562 Mika Penttilä   2026-01-19   957  		if (pmd_none(*pmdp)) {
adc5de78797562 Mika Penttilä   2026-01-19   958  			// hmm_vma_walk_hole() filled migration needs
adc5de78797562 Mika Penttilä   2026-01-19   959  			spin_unlock(ptl);
adc5de78797562 Mika Penttilä   2026-01-19  @960  			return r;

And here?

adc5de78797562 Mika Penttilä   2026-01-19   961  		}
adc5de78797562 Mika Penttilä   2026-01-19   962  		spin_unlock(ptl);
adc5de78797562 Mika Penttilä   2026-01-19   963  	}
53f5c3f489ecdd Jérôme Glisse   2018-04-10   964  
0ac881efe16468 Lorenzo Stoakes 2025-11-10   965  	if (thp_migration_supported() && pmd_is_migration_entry(pmd)) {
adc5de78797562 Mika Penttilä   2026-01-19   966  		if (!minfo) {
2733ea144dcce7 Jason Gunthorpe 2020-05-01   967  			if (hmm_range_need_fault(hmm_vma_walk, hmm_pfns, npages, 0)) {
d08faca018c461 Jérôme Glisse   2018-10-30   968  				hmm_vma_walk->last = addr;
d2e8d551165ccb Ralph Campbell  2019-07-25   969  				pmd_migration_entry_wait(walk->mm, pmdp);
73231612dc7c90 Jérôme Glisse   2019-05-13   970  				return -EBUSY;
d08faca018c461 Jérôme Glisse   2018-10-30   971  			}
2288a9a68175ce Jason Gunthorpe 2020-03-05   972  		}
adc5de78797562 Mika Penttilä   2026-01-19   973  		for (i = 0; addr < end; addr += PAGE_SIZE, i++)
adc5de78797562 Mika Penttilä   2026-01-19   974  			hmm_pfns[i] &= HMM_PFN_INOUT_FLAGS;
2288a9a68175ce Jason Gunthorpe 2020-03-05   975  
adc5de78797562 Mika Penttilä   2026-01-19   976  		return 0;
adc5de78797562 Mika Penttilä   2026-01-19   977  	}
adc5de78797562 Mika Penttilä   2026-01-19   978  
adc5de78797562 Mika Penttilä   2026-01-19   979  	if (minfo) {
adc5de78797562 Mika Penttilä   2026-01-19   980  		hmm_vma_walk->ptl = pmd_lock(mm, pmdp);
adc5de78797562 Mika Penttilä   2026-01-19   981  		hmm_vma_walk->pmdlocked = true;
adc5de78797562 Mika Penttilä   2026-01-19   982  		pmd = pmdp_get(pmdp);
adc5de78797562 Mika Penttilä   2026-01-19   983  	} else
adc5de78797562 Mika Penttilä   2026-01-19   984  		pmd = pmdp_get_lockless(pmdp);
adc5de78797562 Mika Penttilä   2026-01-19   985  
adc5de78797562 Mika Penttilä   2026-01-19   986  	if (pmd_trans_huge(pmd) || !pmd_present(pmd)) {
adc5de78797562 Mika Penttilä   2026-01-19   987  
adc5de78797562 Mika Penttilä   2026-01-19   988  		if (!pmd_present(pmd)) {
adc5de78797562 Mika Penttilä   2026-01-19   989  			r = hmm_vma_handle_absent_pmd(walk, start, end, hmm_pfns,
10b9feee2d0dc8 Francois Dugast 2025-09-08   990  						      pmd);
adc5de78797562 Mika Penttilä   2026-01-19   991  			if (r || !minfo)
adc5de78797562 Mika Penttilä   2026-01-19   992  				return r;

Same

adc5de78797562 Mika Penttilä   2026-01-19   993  		} else {
d08faca018c461 Jérôme Glisse   2018-10-30   994  
53f5c3f489ecdd Jérôme Glisse   2018-04-10   995  			/*
adc5de78797562 Mika Penttilä   2026-01-19   996  			 * No need to take pmd_lock here if not migrating,
adc5de78797562 Mika Penttilä   2026-01-19   997  			 * even if some other thread is splitting the huge
adc5de78797562 Mika Penttilä   2026-01-19   998  			 * pmd we will get that event through mmu_notifier callback.
53f5c3f489ecdd Jérôme Glisse   2018-04-10   999  			 *
d2e8d551165ccb Ralph Campbell  2019-07-25  1000  			 * So just read pmd value and check again it's a transparent
53f5c3f489ecdd Jérôme Glisse   2018-04-10  1001  			 * huge or device mapping one and compute corresponding pfn
53f5c3f489ecdd Jérôme Glisse   2018-04-10  1002  			 * values.
53f5c3f489ecdd Jérôme Glisse   2018-04-10  1003  			 */
adc5de78797562 Mika Penttilä   2026-01-19  1004  
adc5de78797562 Mika Penttilä   2026-01-19  1005  			if (!pmd_trans_huge(pmd)) {
adc5de78797562 Mika Penttilä   2026-01-19  1006  				// must be lockless
53f5c3f489ecdd Jérôme Glisse   2018-04-10  1007  				goto again;
adc5de78797562 Mika Penttilä   2026-01-19  1008  			}
adc5de78797562 Mika Penttilä   2026-01-19  1009  
adc5de78797562 Mika Penttilä   2026-01-19  1010  			r = hmm_vma_handle_pmd(walk, addr, end, hmm_pfns, pmd);
adc5de78797562 Mika Penttilä   2026-01-19  1011  
adc5de78797562 Mika Penttilä   2026-01-19  1012  			if (r || !minfo)
adc5de78797562 Mika Penttilä   2026-01-19  1013  				return r;

Same?

adc5de78797562 Mika Penttilä   2026-01-19  1014  		}
adc5de78797562 Mika Penttilä   2026-01-19  1015  
adc5de78797562 Mika Penttilä   2026-01-19  1016  		r = hmm_vma_handle_migrate_prepare_pmd(walk, pmdp, start, end, hmm_pfns);
adc5de78797562 Mika Penttilä   2026-01-19  1017  
adc5de78797562 Mika Penttilä   2026-01-19  1018  		if (hmm_vma_walk->pmdlocked) {
adc5de78797562 Mika Penttilä   2026-01-19  1019  			spin_unlock(hmm_vma_walk->ptl);
adc5de78797562 Mika Penttilä   2026-01-19  1020  			hmm_vma_walk->pmdlocked = false;
adc5de78797562 Mika Penttilä   2026-01-19  1021  		}
adc5de78797562 Mika Penttilä   2026-01-19  1022  
adc5de78797562 Mika Penttilä   2026-01-19  1023  		if (r == -ENOENT) {
adc5de78797562 Mika Penttilä   2026-01-19  1024  			r = hmm_vma_walk_split(pmdp, addr, walk);
adc5de78797562 Mika Penttilä   2026-01-19  1025  			if (r) {
adc5de78797562 Mika Penttilä   2026-01-19  1026  				/* Split not successful, skip */
adc5de78797562 Mika Penttilä   2026-01-19  1027  				return hmm_pfns_fill(start, end, hmm_vma_walk, HMM_PFN_ERROR);
adc5de78797562 Mika Penttilä   2026-01-19  1028  			}
adc5de78797562 Mika Penttilä   2026-01-19  1029  
adc5de78797562 Mika Penttilä   2026-01-19  1030  			/* Split successful or "again", reloop */
adc5de78797562 Mika Penttilä   2026-01-19  1031  			hmm_vma_walk->last = addr;
adc5de78797562 Mika Penttilä   2026-01-19  1032  			return -EBUSY;
adc5de78797562 Mika Penttilä   2026-01-19  1033  		}
adc5de78797562 Mika Penttilä   2026-01-19  1034  
adc5de78797562 Mika Penttilä   2026-01-19  1035  		return r;
53f5c3f489ecdd Jérôme Glisse   2018-04-10  1036  
adc5de78797562 Mika Penttilä   2026-01-19  1037  	}
adc5de78797562 Mika Penttilä   2026-01-19  1038  
adc5de78797562 Mika Penttilä   2026-01-19  1039  	if (hmm_vma_walk->pmdlocked) {
adc5de78797562 Mika Penttilä   2026-01-19  1040  		spin_unlock(hmm_vma_walk->ptl);
adc5de78797562 Mika Penttilä   2026-01-19  1041  		hmm_vma_walk->pmdlocked = false;
53f5c3f489ecdd Jérôme Glisse   2018-04-10  1042  	}
53f5c3f489ecdd Jérôme Glisse   2018-04-10  1043  
d08faca018c461 Jérôme Glisse   2018-10-30  1044  	/*
d2e8d551165ccb Ralph Campbell  2019-07-25  1045  	 * We have handled all the valid cases above ie either none, migration,
d08faca018c461 Jérôme Glisse   2018-10-30  1046  	 * huge or transparent huge. At this point either it is a valid pmd
d08faca018c461 Jérôme Glisse   2018-10-30  1047  	 * entry pointing to pte directory or it is a bad pmd that will not
d08faca018c461 Jérôme Glisse   2018-10-30  1048  	 * recover.
d08faca018c461 Jérôme Glisse   2018-10-30  1049  	 */
2288a9a68175ce Jason Gunthorpe 2020-03-05  1050  	if (pmd_bad(pmd)) {
2733ea144dcce7 Jason Gunthorpe 2020-05-01  1051  		if (hmm_range_need_fault(hmm_vma_walk, hmm_pfns, npages, 0))
2288a9a68175ce Jason Gunthorpe 2020-03-05  1052  			return -EFAULT;
adc5de78797562 Mika Penttilä   2026-01-19  1053  		return hmm_pfns_fill(start, end, hmm_vma_walk, HMM_PFN_ERROR);
2288a9a68175ce Jason Gunthorpe 2020-03-05  1054  	}
53f5c3f489ecdd Jérôme Glisse   2018-04-10  1055  
adc5de78797562 Mika Penttilä   2026-01-19  1056  	if (minfo) {
adc5de78797562 Mika Penttilä   2026-01-19  1057  		ptep = pte_offset_map_lock(mm, pmdp, addr, &hmm_vma_walk->ptl);
adc5de78797562 Mika Penttilä   2026-01-19  1058  		if (ptep)
adc5de78797562 Mika Penttilä   2026-01-19  1059  			hmm_vma_walk->locked = true;
adc5de78797562 Mika Penttilä   2026-01-19  1060  	} else
53f5c3f489ecdd Jérôme Glisse   2018-04-10  1061  		ptep = pte_offset_map(pmdp, addr);
6ec1905f6ec7f9 Hugh Dickins    2023-06-08  1062  	if (!ptep)
6ec1905f6ec7f9 Hugh Dickins    2023-06-08  1063  		goto again;
adc5de78797562 Mika Penttilä   2026-01-19  1064  
2733ea144dcce7 Jason Gunthorpe 2020-05-01  1065  	for (; addr < end; addr += PAGE_SIZE, ptep++, hmm_pfns++) {
53f5c3f489ecdd Jérôme Glisse   2018-04-10  1066  
2733ea144dcce7 Jason Gunthorpe 2020-05-01  1067  		r = hmm_vma_handle_pte(walk, addr, end, pmdp, ptep, hmm_pfns);
53f5c3f489ecdd Jérôme Glisse   2018-04-10  1068  		if (r) {
dfdc22078f3f06 Jason Gunthorpe 2020-02-28  1069  			/* hmm_vma_handle_pte() did pte_unmap() */
53f5c3f489ecdd Jérôme Glisse   2018-04-10  1070  			return r;
53f5c3f489ecdd Jérôme Glisse   2018-04-10  1071  		}
adc5de78797562 Mika Penttilä   2026-01-19  1072  
adc5de78797562 Mika Penttilä   2026-01-19  1073  		r = hmm_vma_handle_migrate_prepare(walk, pmdp, ptep, addr, hmm_pfns);
adc5de78797562 Mika Penttilä   2026-01-19  1074  		if (r == -EAGAIN) {
adc5de78797562 Mika Penttilä   2026-01-19  1075  			goto again;
adc5de78797562 Mika Penttilä   2026-01-19  1076  		}
adc5de78797562 Mika Penttilä   2026-01-19  1077  		if (r) {
adc5de78797562 Mika Penttilä   2026-01-19  1078  			hmm_pfns_fill(addr, end, hmm_vma_walk, HMM_PFN_ERROR);
adc5de78797562 Mika Penttilä   2026-01-19  1079  			break;
da4c3c735ea4dc Jérôme Glisse   2017-09-08  1080  		}
adc5de78797562 Mika Penttilä   2026-01-19  1081  	}
adc5de78797562 Mika Penttilä   2026-01-19  1082  
adc5de78797562 Mika Penttilä   2026-01-19  1083  	if (hmm_vma_walk->locked)
adc5de78797562 Mika Penttilä   2026-01-19  1084  		pte_unmap_unlock(ptep - 1, hmm_vma_walk->ptl);
adc5de78797562 Mika Penttilä   2026-01-19  1085  	else
da4c3c735ea4dc Jérôme Glisse   2017-09-08  1086  		pte_unmap(ptep - 1);
adc5de78797562 Mika Penttilä   2026-01-19  1087  
da4c3c735ea4dc Jérôme Glisse   2017-09-08  1088  	return 0;
da4c3c735ea4dc Jérôme Glisse   2017-09-08  1089  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

