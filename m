Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8D82C0F81
	for <oe-kbuild@lists.linux.dev>; Thu,  7 May 2026 11:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778154441; cv=none; b=p37kjcxJ+x64tnyZrxhUdeUM0JdwL7d6RTd/Qatw8+xOv8LR3fmckGGSx0rcjnKHV+zrrEc1o+cMeqzqzZtMGyxS2tmGD8Kfdkr1VaFCXk/iSwh06eUoiAxXBh3GDa17e2uZsc3k8eViS5NfF8J1+YB0icNA28ZvjmOIFM6vkbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778154441; c=relaxed/simple;
	bh=bmNa1OnthFHGLkhkG7Hb0jGYEMzr832Gt1KEiWpPWKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xp8D+ktefgALAKTLKwcmTtie/XQyMmSyQZZ9dMO3WryWI2bLWajGcGs2dtVn1k2+kVL/ChjsNlH9ygqy/myVV0IOC+7c5xaZiixnX/MgAPkY2143a00X8BrIM1pLvAhEOjYpCF3DHwA8sP1U5EfuvsyjIqagcFFXVZoXtlu49ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DiMfuRHG; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DiMfuRHG"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-47c35be02fdso241219b6e.3
        for <oe-kbuild@lists.linux.dev>; Thu, 07 May 2026 04:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778154439; x=1778759239; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VWHyIO4uKdY73u/JXG8ePrGVr7HGAKSrplz6EI2JHZs=;
        b=DiMfuRHGnn/J6UwTe97Lh8X3SsBk0oC90RDEnEGuZXyMCW6vzlb25wEsG9TUVZ7+mB
         h8167ZED5amnob6YSqPXX5Hf3yM85jYsjGVX4fK++Z3j56bk0CouOf78vzHcHZzcVVne
         dhkrewKc9F1okYXly6lG1Qk0xMWtnHDWAxiGyEhm2cizuuCAnVUW2ZOfjBNJn8EKy0eP
         zvP3G+vkYj3qHGkJe4ycp9JUHXUfnzw+drg4KKQ+bEOmK8bn3btfWPfnP1W6CxPW2V4z
         w79EQL3xk0or3zvR+tZLwToieRj2bvO90CpsaMtHrsccpYw74GulH+L5EzyWOWky/bPb
         n2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778154439; x=1778759239;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VWHyIO4uKdY73u/JXG8ePrGVr7HGAKSrplz6EI2JHZs=;
        b=Pwb8vv/huUnmb6j3F8pKj9WrcLVnrrlrXs4vDClisyFVQz3HrC2gpyKWoHI6AmQkuK
         G9vg48n3y0VX6tj+UCf19lXu8sxuL5dRFSmJPZKmR2lR/K3U/x8W9xEBxQMMu2cs5h1E
         zaVKpUY3XMLtnbttjwbvE9ZR5jIaK9exBoUVagi2Xsur+/0RmISNKJgHfaE+of3Dz9qo
         7zyrNwV8o68e1ksZdf2BskFTFqbO2DWsm2yUBHHOyf4z3Me7/eV37lAweHNc9Vyps5Tz
         CkSLbTg0POha0XVe2q30KeDFP0IvQCalNJnDc6Dg2dKKhuydox9xpqanRdzchxgv9HXx
         cvEg==
X-Gm-Message-State: AOJu0YxjO+YH/d/0tUTIXgs0EqejfxfroDhNduUMsHN4Yk2FUuqgrmy1
	sZMT5mJ5aq8df8vp5oxKFzXqXbhctkxoGj8fSj+pTcfQa0eFGTYVNsgEeC/7u+KJ
X-Gm-Gg: AeBDievx7tfWrKu6hko+izL79C2G8Mo9gknRLMvt6RiBQi6fU1pngRIRXC6b+GOfobm
	isqqCSjmi4sV6zry7WS95C0WLKKdlss+Hgr7OAFOu8Y4rKEY24wk9eR60XIMd/DGEsYcBkMAE7E
	Ua5/EBaFovCmuj00SQOkKWd8uaW4FQ1u26Ti/fU0MgeCUc0DQs42sNFkxtGsfeszzjg9TG9n4vh
	V41Rkp7gjqGsQsrkH/aDxgS3vQPRXpACsh9rPhGkuLR3muOKUjvbF1VdxQRIsCc1Mbhtoy3ZWiT
	tP2If0uqlluWEvkY0d624hX51kwu1hS7IvvyO6ve0q8x+jJRf8lbTEF0zuqaowEdwaqW2+RbLDx
	EH0fMT0m9u4C1QErsgGgi1OQC+MPMGvXq1eoSAvMXqs+PBkRzv+0zPITdz7WXUsEZWF40ZN8ren
	jFPl7tqpx2g0xXN+ajFnybiL4ATes3Jg==
X-Received: by 2002:a05:6808:1822:b0:467:255a:7453 with SMTP id 5614622812f47-480422281d8mr4384019b6e.14.1778154438684;
        Thu, 07 May 2026 04:47:18 -0700 (PDT)
Received: from localhost ([206.212.255.140])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47c76936271sm12325156b6e.9.2026.05.07.04.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 04:47:17 -0700 (PDT)
Date: Thu, 7 May 2026 14:47:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Lorenzo Stoakes <ljs@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [ljs:project/cow-context 14/18] mm/vma.c:3281 expand_downwards()
 warn: variable dereferenced before check 'vma->anon_vma' (see line 3263)
Message-ID: <202605071933.lpIPQ3YN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260507114710.7i-vhZT7gFKfgys6b8Gg_JZtUCXU0flrtog0fqiY3p0@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ljs/linux.git project/cow-context
head:   e02aa02fef8128743869032cb20d26f752cd9154
commit: e6f934583c43ab0189504a82904d071b1a22b1a1 [14/18] HACK: track remap changes on merges, splits
config: arc-randconfig-r072-20260507 (https://download.01.org/0day-ci/archive/20260507/202605071933.lpIPQ3YN-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605071933.lpIPQ3YN-lkp@intel.com/

smatch warnings:
mm/vma.c:3281 expand_downwards() warn: variable dereferenced before check 'vma->anon_vma' (see line 3263)

vim +3281 mm/vma.c

a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3221  int expand_downwards(struct vm_area_struct *vma, unsigned long address)
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3222  {
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3223  	struct mm_struct *mm = vma->vm_mm;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3224  	struct vm_area_struct *prev;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3225  	int error = 0;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3226  	VMA_ITERATOR(vmi, mm, vma->vm_start);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3227  
769669bd9ca4cba Lorenzo Stoakes (Oracle  2026-03-20  3228) 	if (!vma_test(vma, VMA_GROWSDOWN_BIT))
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3229  		return -EFAULT;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3230  
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3231  	mmap_assert_write_locked(mm);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3232  
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3233  	address &= PAGE_MASK;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3234  	if (address < mmap_min_addr || address < FIRST_USER_ADDRESS)
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3235  		return -EPERM;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3236  
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3237  	/* Enforce stack_guard_gap */
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3238  	prev = vma_prev(&vmi);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3239  	/* Check that both stack segments have the same anon_vma? */
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3240  	if (prev) {
769669bd9ca4cba Lorenzo Stoakes (Oracle  2026-03-20  3241) 		if (!vma_test(prev, VMA_GROWSDOWN_BIT) &&
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3242  		    vma_is_accessible(prev) &&
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3243  		    (address - prev->vm_end < stack_guard_gap))
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3244  			return -ENOMEM;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3245  	}
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3246  
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3247  	if (prev)
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3248  		vma_iter_next_range_limit(&vmi, vma->vm_start);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3249  
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3250  	vma_iter_config(&vmi, address, vma->vm_end);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3251  	if (vma_iter_prealloc(&vmi, vma))
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3252  		return -ENOMEM;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3253  
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3254  	/* We must make sure the anon_vma is allocated. */
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3255  	if (unlikely(anon_vma_prepare(vma))) {
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3256  		vma_iter_free(&vmi);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3257  		return -ENOMEM;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3258  	}
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3259  
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3260  	/* Lock the VMA before expanding to prevent concurrent page faults */
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3261  	vma_start_write(vma);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3262  	/* We update the anon VMA tree. */
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03 @3263  	anon_vma_lock_write(vma->anon_vma);
                                                                                    ^^^^^^^^^^^^^
Dereference

a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3264  
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3265  	/* Somebody else might have raced and expanded it already */
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3266  	if (address < vma->vm_start) {
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3267  		unsigned long size, grow;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3268  
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3269  		size = vma->vm_end - address;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3270  		grow = (vma->vm_start - address) >> PAGE_SHIFT;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3271  
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3272  		error = -ENOMEM;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3273  		if (grow <= vma->vm_pgoff) {
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3274  			error = acct_stack_growth(vma, size, grow);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3275  			if (!error) {
769669bd9ca4cba Lorenzo Stoakes (Oracle  2026-03-20  3276) 				if (vma_test(vma, VMA_LOCKED_BIT))
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3277  					mm->locked_vm += grow;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3278  				vm_stat_account(mm, vma->vm_flags, grow);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3279  				anon_vma_interval_tree_pre_update_vma(vma);
e6f934583c43ab0 Lorenzo Stoakes          2026-05-01  3280  
e6f934583c43ab0 Lorenzo Stoakes          2026-05-01 @3281  				if (vma->anon_vma)
                                                                                            ^^^^^^^^^^^^^
Checked in between too unchecked dereference.

e6f934583c43ab0 Lorenzo Stoakes          2026-05-01  3282  					cow_context_vma_adjust(vma, address, vma->vm_end);
e6f934583c43ab0 Lorenzo Stoakes          2026-05-01  3283  
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3284  				vma->vm_start = address;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3285  				vma->vm_pgoff -= grow;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3286  				/* Overwrite old entry in mtree. */
55e50223bf3e06a Suren Baghdasaryan       2025-02-13  3287  				vma_iter_store_overwrite(&vmi, vma);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3288  				anon_vma_interval_tree_post_update_vma(vma);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3289  
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3290  				perf_event_mmap(vma);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3291  			}
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3292  		}
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3293  	}
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3294  	anon_vma_unlock_write(vma->anon_vma);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3295  	vma_iter_free(&vmi);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3296  	validate_mm(mm);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3297  	return error;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3298  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

