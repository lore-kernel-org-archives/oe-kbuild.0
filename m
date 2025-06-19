Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98352206B5;
	Thu, 19 Jun 2025 09:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750326825; cv=none; b=Kx9MJz5PQa1nHkaPbQuNGhjmAmHWlgZVXA3O8PyL/gRPp+46xQIcfJPTbYDICwlVh2T1J705wFtyDl79TwAnwUW55AjprS+EjxUtwXdy3mg8ro1zwLPrR7ScwWgy9b42rogk9laWmiYOhO1WLLmbHRR3DHS3Ld/HrMNCE70UFyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750326825; c=relaxed/simple;
	bh=aoabY3uN68FF/AqK9E73rIZP0Jr9EBrc7Uh6DHc60hk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+aTwNOM2OYF4hva4/R06uhGVGr59rcfUx2v1aJZRv7Te/gaqXz7ytNA/IMrFPX0742/C7ZR0eBm7bpEpcxeYnyRY5NOoRjreYJ7E5FnX/vljFHeMf2C0mPEHr/igHYDfzRrx3huKJ6rDyfPmkza77te+L80pwe99mGrLxvDmpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bt37SAm6; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bt37SAm6"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553c31542b1so493038e87.2;
        Thu, 19 Jun 2025 02:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750326822; x=1750931622; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8lxye2GX1z6QI+SRVMkfZEngbWK9B27pd3eBJcWGrlg=;
        b=Bt37SAm6IbFxUOnDK0eVCY3B88SbTKmhNLux6pIwSxH0x/FFPJ9CVCFZ2gRMvLRMBs
         CPExE6zNCQ6xg5zEYPS4YR++YkM6VJBbTyFZeASw2SfcgFzvb1towOqhmNk4tT4rAsQy
         wcdvNxru2r+oWt7byYN5/rBm+GDURcrtjoAVP+oOv8ZSPs+Y/pLNer2be5ZFZs9n9+WB
         6CIbPSdnaB36YEXHm1e7Zfil7Grm/NZm6RhUPEEKSP1i4e0E+EEFUWl6cIumDqJh3bU2
         1ZayiEdtQeSVAs3AoTZnJOwT9yreApFi6ICrJfFt/puItpa8RTAV/YHapkEH2wlodLw3
         C02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750326822; x=1750931622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lxye2GX1z6QI+SRVMkfZEngbWK9B27pd3eBJcWGrlg=;
        b=Z4EAGoTwkSkO1oD+0JO0iJ1R8pM/PRYHlBq0l1K0NSab3i6BRizxIh1HG+CVMWgL9T
         QjfuGO+Mqq8CKK8d/8AiZH8QY+XI/peWiMEWC3FCPBC/1mnTvWUYPXquzehHbTxHDCFQ
         UXekYbQbL9bhXz7jqenaEWWUZy3qF/NHdE3M+x+SGn2ZF/it7B2HuGf3LDVdrtRXTe9v
         AS/dbz1r6Fg/AyXdjCFVF2n70Q4fz1oc83JNsLPfJnqkdCBpMNCIsHFYnIkLiQbPzqae
         uZMur+hyY22SK+eIB5LVH8zACiaFN+GloPqm6Pp8tq2IDTtUqADUkBwIcY7lIMhgEivB
         u6+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUr4lD5BC+kWjZVsrjEaWqhivjlBR2gd+lG/0kSyDm9wr8mBRu1Tx/vV1ytWWx5hz5SDJ/jaRxl9WT2IlpC@lists.linux.dev
X-Gm-Message-State: AOJu0YzdXLnG4zI9O5xbJmPaKVMZVVYUQXUjL4NxsJtoKEXU9fWKzLbg
	Rd1RHG1/LgKUow+MP+eVDcNngTmSnzF8IAiNSB3S+Z7jhpMFjUvqovR5
X-Gm-Gg: ASbGncuGVXCV58WZGVuCMPkILa2EYf4KvN94FRplA/siwfjwCc2giGcPuRZ1jBJVjRv
	UGTiovjoA9mRztBcTOEjg1Bn8BHWgruNTXtJ2aQzv8GEW53el71E0y3/AOV8eCCDtGRoI4qebIN
	qayzkykcxx/HP9KPcx8MJ754W0J9UkEE8VJO27lQXQm4uHioGQ/+718Thuff05W8qdSNsyquCz0
	4FwHc1EiNYsL3cNcnBC5xREmaxSAItbeftDPC0/B3YiOtX5H8sgbAr1i9P5vQN/MkUXHwqXUMai
	idETCMwc38QosdVV0fL5CooNp9bkW+b5v7YXXLpl86p3WVyBGwrWHILBTZqQMMmNMBBkuuP1L81
	kCX5H/CIQO24=
X-Google-Smtp-Source: AGHT+IEJV7RqZa9E1nD948cD6oSgemriE8btKJowGkw8tp48NbrB1jrcDoGclBvee7YrwcLZgS368g==
X-Received: by 2002:a05:6512:1049:b0:553:1f90:cca4 with SMTP id 2adb3069b0e04-553b6e74ae6mr5656846e87.13.1750326821436;
        Thu, 19 Jun 2025 02:53:41 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1367e9sm2541889e87.79.2025.06.19.02.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 02:53:41 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 19 Jun 2025 11:53:38 +0200
To: Dan Carpenter <dan.carpenter@linaro.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild@lists.linux.dev, Alexander Gordeev <agordeev@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, Hugh Dickins <hughd@google.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
	Jeremy Fitzhardinge <jeremy@goop.org>,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH 2/6] mm: Lock kernel page tables before entering lazy MMU
 mode
Message-ID: <aFPeIisE3ufUGEUq@pc636>
References: <7bd3a45dbc375dc2c15cebae09cb2bb972d6039f.1749747752.git.agordeev@linux.ibm.com>
 <0be7d42e-5898-4b94-829b-59c661c2f07b@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0be7d42e-5898-4b94-829b-59c661c2f07b@suswa.mountain>

On Wed, Jun 18, 2025 at 08:32:28PM +0300, Dan Carpenter wrote:
> Hi Alexander,
> 
> kernel test robot noticed the following build warnings:
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Gordeev/mm-Cleanup-apply_to_pte_range-routine/20250613-013835
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/7bd3a45dbc375dc2c15cebae09cb2bb972d6039f.1749747752.git.agordeev%40linux.ibm.com
> patch subject: [PATCH 2/6] mm: Lock kernel page tables before entering lazy MMU mode
> config: x86_64-randconfig-161-20250613 (https://download.01.org/0day-ci/archive/20250613/202506132017.T1l1l6ME-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202506132017.T1l1l6ME-lkp@intel.com/
> 
> smatch warnings:
> mm/vmalloc.c:552 vmap_pages_pte_range() warn: inconsistent returns 'global &init_mm.page_table_lock'.
> 
> vim +552 mm/vmalloc.c
> 
> 0a264884046f1ab Nicholas Piggin   2021-04-29  517  static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
> 2ba3e6947aed9bb Joerg Roedel      2020-06-01  518  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> 2ba3e6947aed9bb Joerg Roedel      2020-06-01  519  		pgtbl_mod_mask *mask)
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  520  {
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  521  	pte_t *pte;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  522  
> db64fe02258f150 Nicholas Piggin   2008-10-18  523  	/*
> db64fe02258f150 Nicholas Piggin   2008-10-18  524  	 * nr is a running index into the array which helps higher level
> db64fe02258f150 Nicholas Piggin   2008-10-18  525  	 * callers keep track of where we're up to.
> db64fe02258f150 Nicholas Piggin   2008-10-18  526  	 */
> db64fe02258f150 Nicholas Piggin   2008-10-18  527  
> 2ba3e6947aed9bb Joerg Roedel      2020-06-01  528  	pte = pte_alloc_kernel_track(pmd, addr, mask);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  529  	if (!pte)
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  530  		return -ENOMEM;
> 44562c71e2cfc9e Ryan Roberts      2025-04-22  531  
> dac0cc793368851 Alexander Gordeev 2025-06-12  532  	spin_lock(&init_mm.page_table_lock);
> 44562c71e2cfc9e Ryan Roberts      2025-04-22  533  	arch_enter_lazy_mmu_mode();
> 44562c71e2cfc9e Ryan Roberts      2025-04-22  534  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  535  	do {
> db64fe02258f150 Nicholas Piggin   2008-10-18  536  		struct page *page = pages[*nr];
> db64fe02258f150 Nicholas Piggin   2008-10-18  537  
> c33c794828f2121 Ryan Roberts      2023-06-12  538  		if (WARN_ON(!pte_none(ptep_get(pte))))
> db64fe02258f150 Nicholas Piggin   2008-10-18  539  			return -EBUSY;
> db64fe02258f150 Nicholas Piggin   2008-10-18  540  		if (WARN_ON(!page))
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  541  			return -ENOMEM;
> 4fcdcc12915c707 Yury Norov        2022-04-28  542  		if (WARN_ON(!pfn_valid(page_to_pfn(page))))
> 4fcdcc12915c707 Yury Norov        2022-04-28  543  			return -EINVAL;
> 
> These error paths don't unlock &init_mm.page_table_lock?
> 
> 4fcdcc12915c707 Yury Norov        2022-04-28  544  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  545  		set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
> db64fe02258f150 Nicholas Piggin   2008-10-18  546  		(*nr)++;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  547  	} while (pte++, addr += PAGE_SIZE, addr != end);
> 44562c71e2cfc9e Ryan Roberts      2025-04-22  548  
> 44562c71e2cfc9e Ryan Roberts      2025-04-22  549  	arch_leave_lazy_mmu_mode();
> dac0cc793368851 Alexander Gordeev 2025-06-12  550  	spin_unlock(&init_mm.page_table_lock);
> 2ba3e6947aed9bb Joerg Roedel      2020-06-01  551  	*mask |= PGTBL_PTE_MODIFIED;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16 @552  	return 0;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  553  }
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
> 
This patch introduce a huge performance degrade when testing this by
the test_vmalloc.sh performance tool. We return back to a single, not
serialized global spilock where we spend 90% of cycles:

<snip>
+   91.01%     1.67%  [kernel]          [k] _raw_spin_lock
-   89.29%    89.25%  [kernel]          [k] native_queued_spin_lock_slowpath
     69.82% ret_from_fork_asm
      - ret_from_fork
         - 69.81% kthread
            - 69.66% test_func
               - 26.31% full_fit_alloc_test
                  - 19.11% __vmalloc_node_noprof
                     - __vmalloc_node_range_noprof
                        - 13.73% vmap_small_pages_range_noflush
                             _raw_spin_lock
                             native_queued_spin_lock_slowpath
                        - 5.38% __get_vm_area_node
                             alloc_vmap_area
                             _raw_spin_lock
                             native_queued_spin_lock_slowpath
                  - 13.32% vfree.part.0
                     - 13.31% remove_vm_area
                        - 13.27% __vunmap_range_noflush
                             _raw_spin_lock
                             native_queued_spin_lock_slowpath
               - 25.57% fix_size_alloc_test
                  - 22.59% __vmalloc_node_noprof
                     - __vmalloc_node_range_noprof
                        - 17.34% vmap_small_pages_range_noflush
                             _raw_spin_lock
                             native_queued_spin_lock_slowpath
                        - 5.25% __get_vm_area_node
                             alloc_vmap_area
                             _raw_spin_lock
                             native_queued_spin_lock_slowpath
                  - 11.59% vfree.part.0
                     - remove_vm_area
                        - 11.55% __vunmap_range_noflush
                             _raw_spin_lock
                             native_queued_spin_lock_slowpath
               - 17.78% long_busy_list_alloc_test
                  - 13.90% __vmalloc_node_noprof
                     - __vmalloc_node_range_noprof
                        - 9.95% vmap_small_pages_range_noflush
                             _raw_spin_lock
<snip>

No, we can not take this patch.

--
Uladzislau Rezki
