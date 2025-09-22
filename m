Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2772405E8
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Sep 2025 05:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758520706; cv=none; b=KQB/7YvQvwRQ4ZgA1pTNfpGE2K34fG3m6g4xNt6jznTFKjCkWqsQ1uD39gAIzEL+A7PV6xX/1JwQirXpDlmcQJTdyF1rPJeweVszTE/n4gxi2iCiQ42mMDSWfcrNa5lmRvdrg+qhoyW6pTEMjaoRBCAjqDcF0vW4K0ipFdW4f88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758520706; c=relaxed/simple;
	bh=JlBAInE7WNt0aC8dmDjod3DiQxxOS6woMl4vIQtbb5w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=KPVLIlNnjsm0zsfxrDVL+NxcFAU2lPhFY83XNrsj0ImXMJOpQarmRuwlmrZJKI4jGsCuc1StnezJzv/R3iL3TN4Kvo8NRE/rwhu9FrIIs55OQdguCc8X4cADsI1vgfneH+nZk3KZTZy58yaEgiXF5nwyHejYlY/3fIiQrDJPmFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k1oQRsZg; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k1oQRsZg"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so1762624f8f.3
        for <oe-kbuild@lists.linux.dev>; Sun, 21 Sep 2025 22:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758520703; x=1759125503; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mdDWL3TMdgBSHOB+xWlw04lsgYnWMsUsyKhmms0zNrU=;
        b=k1oQRsZgPZOGbZf51Qtc8uN0/Ntr08KcLDu6qKNxzfbcZtTAuDq9PALqaxjy6t4/kJ
         omREv5n/8gVOg3p+KMTUx/AKa9Os8ZUoSzeUTmhyvla1dGu8yXJu6PMN6Oi2r/47knrN
         t5RHPHLmtlqLM2AnpqcI7wtry/V8NkwvbCE+WvXD01ggSZZjAsLSOHC56Sy+fO63cHqk
         g8tWdOl/GFs65r8zthee2HGKx+JHNgr7w4KLZDSMaaxBaSCW1favNAzcx7Oh08K3Kwhn
         N7DbYLJFHJiLqJhzlp4iZj9z1VfG2uwmp3kpH9xrXuU/0gVULPEUaTrtStzQ9vgyj63N
         AbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758520703; x=1759125503;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mdDWL3TMdgBSHOB+xWlw04lsgYnWMsUsyKhmms0zNrU=;
        b=dX2HyYjm9VENo5UK2awXrw6e0Uu/h9r/9SvO2muhn+JwuctTJzG3fY/WyhBuqr55e4
         IAnLsjDyd7X5g1KTeHamkA2uSvaacQUx72FrYP9lMRVlApcE6pHWGa7Yk1aWW7P9d3xG
         tkp3c0WRHS0qSPvrgTdSSsITieEh0+NxHWWenqjDccz5daHFiTfZXUwoAxsiD9KLIjwH
         UHXaiGAWQdMSE6csocTWit7CuqBgu8bU+lRkwnz9KTCyrZxlQHdW8Esaa5a6WxnxVNo2
         r7CSiwvRfY8+ADQICgK5PE55ZDBRu5NiIHvFR7oeBihCOXjQeRjs682doJ1LtrfyhIxp
         hVDg==
X-Gm-Message-State: AOJu0Ywpwq+gZxH0xUIlw7+zeMthHySy7G2yhh9wq/6BiUl4LHt6SzO0
	7AjPG+oUaXo2GwZbg2AiK+TGGkP9f/IVCakOQqu7uprjPxmA/78oEFW+kPMwum2440Nkvs0ConY
	Sfaj0
X-Gm-Gg: ASbGncuj3iVSkGBAWO8TrSXKB4uafWF5jBuuX4d5bPORSrpPprRWQAlGsDPE/Qis+e3
	TnU8n4gfg8sEt27V52tk0CvS7YwJojKr6210sGZfwMaNmp8AB/6B3+3A76ivWhfedLTszhu3Dnr
	3ekLy2g4t/j6JBndq3JF/ml7/6RO9QB0BJ1KEM2oWqnsYY+hvAIcy7SelEyjx9wHnUWqAX/gjIM
	kN/NTuFFgf34aO81fOXCZurdq1nJX8oprFn3V2pkph8Aa8oTw5PTmvaF+m+8+UP5bM9v83UvQA2
	4GUxS2cgJ5yQtbn7ZfeUCagcYXotciAHQ31HIT9Nx+A//mrYdpqIVt4fFG7WenxkGxXbK7pSmev
	36ryZpLlc0Ho4KHjUp/lVA+zAGk2S
X-Google-Smtp-Source: AGHT+IFf4xjjwO1NzJ1x5bAptb4t/s/yNpPPlx4xq9N/+F6cJVMY1ddpfVvP6nh3H95c03ypCITFuQ==
X-Received: by 2002:a5d:5846:0:b0:3eb:734d:e2f2 with SMTP id ffacd0b85a97d-3ee86b845e6mr9847031f8f.56.1758520702563;
        Sun, 21 Sep 2025 22:58:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee15bfab67sm14716061f8f.43.2025.09.21.22.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 22:58:22 -0700 (PDT)
Date: Mon, 22 Sep 2025 08:58:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Wei Yang <richard.weiyang@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [Patch v2 1/2] mm/ksm: get mm_slot by mm_slot_entry() when slot
 is !NULL
Message-ID: <202509220348.96Aa4hMs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919071244.17020-2-richard.weiyang@gmail.com>
Message-ID: <20250922055819.YKuBxvmiP1yrmSgpZ0Wd7A9WoX38a7C4qiV70THcmCI@z>

Hi Wei,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Yang/mm-ksm-get-mm_slot-by-mm_slot_entry-when-slot-is-NULL/20250919-151547
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250919071244.17020-2-richard.weiyang%40gmail.com
patch subject: [Patch v2 1/2] mm/ksm: get mm_slot by mm_slot_entry() when slot is !NULL
config: microblaze-randconfig-r073-20250921 (https://download.01.org/0day-ci/archive/20250922/202509220348.96Aa4hMs-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509220348.96Aa4hMs-lkp@intel.com/

New smatch warnings:
mm/ksm.c:2959 __ksm_exit() error: uninitialized symbol 'mm_slot'.

vim +/mm_slot +2959 mm/ksm.c

1c2fb7a4c2ca7a Andrea Arcangeli  2009-09-21  2922  void __ksm_exit(struct mm_struct *mm)
f8af4da3b4c14e Hugh Dickins      2009-09-21  2923  {
21fbd59136e077 Qi Zheng          2022-08-31  2924  	struct ksm_mm_slot *mm_slot;
58730ab6c7cab4 Qi Zheng          2022-08-31  2925  	struct mm_slot *slot;
9ba6929480088a Hugh Dickins      2009-09-21  2926  	int easy_to_free = 0;
cd551f97519d35 Hugh Dickins      2009-09-21  2927  
31dbd01f314364 Izik Eidus        2009-09-21  2928  	/*
9ba6929480088a Hugh Dickins      2009-09-21  2929  	 * This process is exiting: if it's straightforward (as is the
9ba6929480088a Hugh Dickins      2009-09-21  2930  	 * case when ksmd was never running), free mm_slot immediately.
9ba6929480088a Hugh Dickins      2009-09-21  2931  	 * But if it's at the cursor or has rmap_items linked to it, use
c1e8d7c6a7a682 Michel Lespinasse 2020-06-08  2932  	 * mmap_lock to synchronize with any break_cows before pagetables
9ba6929480088a Hugh Dickins      2009-09-21  2933  	 * are freed, and leave the mm_slot on the list for ksmd to free.
9ba6929480088a Hugh Dickins      2009-09-21  2934  	 * Beware: ksm may already have noticed it exiting and freed the slot.
31dbd01f314364 Izik Eidus        2009-09-21  2935  	 */
9ba6929480088a Hugh Dickins      2009-09-21  2936  
cd551f97519d35 Hugh Dickins      2009-09-21  2937  	spin_lock(&ksm_mmlist_lock);
58730ab6c7cab4 Qi Zheng          2022-08-31  2938  	slot = mm_slot_lookup(mm_slots_hash, mm);
de4014f857d062 Wei Yang          2025-09-19  2939  	if (slot) {
58730ab6c7cab4 Qi Zheng          2022-08-31  2940  		mm_slot = mm_slot_entry(slot, struct ksm_mm_slot, slot);
de4014f857d062 Wei Yang          2025-09-19  2941  		if (ksm_scan.mm_slot != mm_slot) {
6514d511dbe5a7 Hugh Dickins      2009-12-14  2942  			if (!mm_slot->rmap_list) {
58730ab6c7cab4 Qi Zheng          2022-08-31  2943  				hash_del(&slot->hash);
58730ab6c7cab4 Qi Zheng          2022-08-31  2944  				list_del(&slot->mm_node);
9ba6929480088a Hugh Dickins      2009-09-21  2945  				easy_to_free = 1;
9ba6929480088a Hugh Dickins      2009-09-21  2946  			} else {
58730ab6c7cab4 Qi Zheng          2022-08-31  2947  				list_move(&slot->mm_node,
58730ab6c7cab4 Qi Zheng          2022-08-31  2948  					  &ksm_scan.mm_slot->slot.mm_node);
9ba6929480088a Hugh Dickins      2009-09-21  2949  			}
9ba6929480088a Hugh Dickins      2009-09-21  2950  		}
de4014f857d062 Wei Yang          2025-09-19  2951  	}

mm_slot isn't initialized on the else path

cd551f97519d35 Hugh Dickins      2009-09-21  2952  	spin_unlock(&ksm_mmlist_lock);
cd551f97519d35 Hugh Dickins      2009-09-21  2953  
9ba6929480088a Hugh Dickins      2009-09-21  2954  	if (easy_to_free) {
58730ab6c7cab4 Qi Zheng          2022-08-31  2955  		mm_slot_free(mm_slot_cache, mm_slot);
12e423ba4eaed7 Lorenzo Stoakes   2025-08-12  2956  		mm_flags_clear(MMF_VM_MERGE_ANY, mm);
12e423ba4eaed7 Lorenzo Stoakes   2025-08-12  2957  		mm_flags_clear(MMF_VM_MERGEABLE, mm);
9ba6929480088a Hugh Dickins      2009-09-21  2958  		mmdrop(mm);
9ba6929480088a Hugh Dickins      2009-09-21 @2959  	} else if (mm_slot) {
                                                                   ^^^^^^^
uninitialized

d8ed45c5dcd455 Michel Lespinasse 2020-06-08  2960  		mmap_write_lock(mm);
d8ed45c5dcd455 Michel Lespinasse 2020-06-08  2961  		mmap_write_unlock(mm);
9ba6929480088a Hugh Dickins      2009-09-21  2962  	}
739100c88f49a6 Stefan Roesch     2023-02-10  2963  
739100c88f49a6 Stefan Roesch     2023-02-10  2964  	trace_ksm_exit(mm);
31dbd01f314364 Izik Eidus        2009-09-21  2965  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

