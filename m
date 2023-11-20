Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978601B279
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 14:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a3qsQMSB"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-32f7bd27c2aso3363835f8f.2
        for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 06:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700492143; x=1701096943; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kGFXkVothP8GzTo2jzsCD/SdXLlf2F5wZiQpSoYT7RM=;
        b=a3qsQMSBvb5G/I2K7aKjVEkQU16t0x71j6lzOaxhumcR9uNOWppAq3NoyT+ZB7Nhc0
         j1/Geoy2Jqn7XqHNdG61n4ph0aKgY+Xq4Q9YzYK2q0/hthLigLb7TJJbkBGG+R8M8deG
         AUNi6tHFlgiEmKTCfaect+eTGnnn+9ZErm430hKD6xAxkH4HfqB6bbJoCsShRPZ39jyU
         kvCt70tGk7YH5lTK2TwKjmXTOjShRQ4cL5k7YsrtzfbFdEyMyhZGaAyVpVMq3GAzFZNz
         Mb32lTiL/pktoZA/Uyrdv5RTXsit+hM9uxlpDnkYKez4wmIpoKK6yUwG72X6srxZpYy1
         6WOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700492143; x=1701096943;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kGFXkVothP8GzTo2jzsCD/SdXLlf2F5wZiQpSoYT7RM=;
        b=pcB8XL5SQEGKGJpvMf2N+nFJSC8PdXokcfyvtrN4VWrX54xWYJm5ULPvgzSFKlf7C2
         Mx0lz+fUPiw04XjQl2llKwAFVEY3JT1QAut8mpgowELqd4q3YjBMq25f6iiT+vvRZR/9
         PMxtnJlPj3lq+1NmmiS/pfeGcAwc/ym9hy8NL0h4Bv1v/7GI3DZ0xoLfftr8g+wfGYVr
         1wkmfcTn5R+bZYCf8jtT3tXi7LoCm1oYaU8Y3/oI10ML22XOFtjki5HU5sDrvI0+eUE8
         y7OxnHQHnBLWhMph+Nmc/FSwu1nEM+OvayCNeXa13ca5ra+29mzsA5EHerLu3RquVDPB
         C6sw==
X-Gm-Message-State: AOJu0Yx2bx/5zIQxZYUsLooxxYJTum0gnlxe+4QWsQRzu58HJwR0rlLM
	dXZRE5ntcrgwGqsL5QnFnq+Np3tl0SEySJFy5Rs=
X-Google-Smtp-Source: AGHT+IFdemXx/VBd55p8WW6PTbADwdmABtmyFhPv5LoMpcPkl7d+s0athPBnib8Bo4DNxgkN7RrcTQ==
X-Received: by 2002:a05:6000:1845:b0:32f:9ad3:860f with SMTP id c5-20020a056000184500b0032f9ad3860fmr5696667wri.52.1700492143135;
        Mon, 20 Nov 2023 06:55:43 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c15-20020adfe70f000000b0032da8fb0d05sm11408245wrm.110.2023.11.20.06.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 06:55:42 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 20 Nov 2023 09:55:40 -0500
To: oe-kbuild@lists.linux.dev, Kairui Song <ryncsn@gmail.com>,
	linux-mm@kvack.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Huang, Ying" <ying.huang@intel.com>,
	David Hildenbrand <david@redhat.com>,
	Hugh Dickins <hughd@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Matthew Wilcox <willy@infradead.org>,
	Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: Re: [PATCH 03/24] mm/swap: move no readahead swapin code to a stand
 alone helper
Message-ID: <918235dd-44d0-470e-aad2-5001ac947cb8@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231119194740.94101-4-ryncsn@gmail.com>

Hi Kairui,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/mm-swap-fix-a-potential-undefined-behavior-issue/20231120-035926
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231119194740.94101-4-ryncsn%40gmail.com
patch subject: [PATCH 03/24] mm/swap: move no readahead swapin code to a stand alone helper
config: um-randconfig-r081-20231120 (https://download.01.org/0day-ci/archive/20231120/202311201135.iG2KLShW-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231120/202311201135.iG2KLShW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311201135.iG2KLShW-lkp@intel.com/

smatch warnings:
mm/swap_state.c:881 swapin_no_readahead() warn: use 'gfp_mask' here instead of GFP_KERNEL?

vim +/gfp_mask +881 mm/swap_state.c

19f582d2684e47 Kairui Song 2023-11-20  856  /**
19f582d2684e47 Kairui Song 2023-11-20  857   * swapin_no_readahead - swap in pages skipping swap cache and readahead
19f582d2684e47 Kairui Song 2023-11-20  858   * @entry: swap entry of this memory
19f582d2684e47 Kairui Song 2023-11-20  859   * @gfp_mask: memory allocation flags
19f582d2684e47 Kairui Song 2023-11-20  860   * @vmf: fault information
19f582d2684e47 Kairui Song 2023-11-20  861   *
19f582d2684e47 Kairui Song 2023-11-20  862   * Returns the struct page for entry and addr after the swap entry is read
19f582d2684e47 Kairui Song 2023-11-20  863   * in.
19f582d2684e47 Kairui Song 2023-11-20  864   */
19f582d2684e47 Kairui Song 2023-11-20  865  struct page *swapin_no_readahead(swp_entry_t entry, gfp_t gfp_mask,
19f582d2684e47 Kairui Song 2023-11-20  866  				 struct vm_fault *vmf)
19f582d2684e47 Kairui Song 2023-11-20  867  {
19f582d2684e47 Kairui Song 2023-11-20  868  	struct vm_area_struct *vma = vmf->vma;
19f582d2684e47 Kairui Song 2023-11-20  869  	struct page *page = NULL;
19f582d2684e47 Kairui Song 2023-11-20  870  	struct folio *folio;
19f582d2684e47 Kairui Song 2023-11-20  871  	void *shadow = NULL;
19f582d2684e47 Kairui Song 2023-11-20  872  
19f582d2684e47 Kairui Song 2023-11-20  873  	folio = vma_alloc_folio(GFP_HIGHUSER_MOVABLE, 0,
19f582d2684e47 Kairui Song 2023-11-20  874  				vma, vmf->address, false);
19f582d2684e47 Kairui Song 2023-11-20  875  	if (folio) {
19f582d2684e47 Kairui Song 2023-11-20  876  		__folio_set_locked(folio);
19f582d2684e47 Kairui Song 2023-11-20  877  		__folio_set_swapbacked(folio);
19f582d2684e47 Kairui Song 2023-11-20  878  
19f582d2684e47 Kairui Song 2023-11-20  879  		if (mem_cgroup_swapin_charge_folio(folio,
19f582d2684e47 Kairui Song 2023-11-20  880  					vma->vm_mm, GFP_KERNEL,

s/GFP_KERNEL/gfp_mask/?

19f582d2684e47 Kairui Song 2023-11-20 @881  					entry)) {
19f582d2684e47 Kairui Song 2023-11-20  882  			folio_unlock(folio);
19f582d2684e47 Kairui Song 2023-11-20  883  			folio_put(folio);
19f582d2684e47 Kairui Song 2023-11-20  884  			return NULL;
19f582d2684e47 Kairui Song 2023-11-20  885  		}
19f582d2684e47 Kairui Song 2023-11-20  886  		mem_cgroup_swapin_uncharge_swap(entry);
19f582d2684e47 Kairui Song 2023-11-20  887  
19f582d2684e47 Kairui Song 2023-11-20  888  		shadow = get_shadow_from_swap_cache(entry);
19f582d2684e47 Kairui Song 2023-11-20  889  		if (shadow)
19f582d2684e47 Kairui Song 2023-11-20  890  			workingset_refault(folio, shadow);
19f582d2684e47 Kairui Song 2023-11-20  891  
19f582d2684e47 Kairui Song 2023-11-20  892  		folio_add_lru(folio);
19f582d2684e47 Kairui Song 2023-11-20  893  
19f582d2684e47 Kairui Song 2023-11-20  894  		/* To provide entry to swap_readpage() */
19f582d2684e47 Kairui Song 2023-11-20  895  		folio->swap = entry;
19f582d2684e47 Kairui Song 2023-11-20  896  		page = &folio->page;
19f582d2684e47 Kairui Song 2023-11-20  897  		swap_readpage(page, true, NULL);
19f582d2684e47 Kairui Song 2023-11-20  898  		folio->private = NULL;
19f582d2684e47 Kairui Song 2023-11-20  899  	}
19f582d2684e47 Kairui Song 2023-11-20  900  
19f582d2684e47 Kairui Song 2023-11-20  901  	return page;
19f582d2684e47 Kairui Song 2023-11-20  902  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

