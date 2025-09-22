Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA391531C8
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Sep 2025 08:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758528196; cv=none; b=a1NM/Zcn6lLdGOmjChCjne6c/sPDZwZt17AMgcJ4gKAg0A2qpvtZ9Uq2fRdsTvO6WWqL/icLQChWV8Uxbzmy8CHQdH2tPjQAlJ+pcPhnRIhFgojUK4+8DJucwvZB/JxqEtRvU8qrm2KqX07DCrPXrRSESQ1AAS1tmeFM/4GyPQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758528196; c=relaxed/simple;
	bh=eM47ulAXqsB7PYlKhM7Ya6l0u6oY3RUaBmZxxRca+Zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=knZx2rfCqgALb6nQHiaU0jdUHi8o7Nlh5GHxS3Baouux4G3DlXaZcLZY1hDJ88tCLov+M4tMz0T2+Am0mqisoW3TWp1DpSskkgv6ebPLTpTs2+OMSYNBX2gwPULOlZv566SBoQtaR388KctAHlzA6PbYWWZnYHIUoGjuZwMcR+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wp8aZP3D; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wp8aZP3D"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b07c2908f3eso606874566b.1
        for <oe-kbuild@lists.linux.dev>; Mon, 22 Sep 2025 01:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758528193; x=1759132993; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GsUuh5Jf/DOqhzicHbLgWx6LAUT+miJ4b6U4mqtAcuc=;
        b=Wp8aZP3DHNoB6hMtxSp2QWwxIopdEpB6bXTFhOG3wpzrfYqjjQQQ/Uw+MI1azJAkxv
         ZhxTYyYwvIuVvTbuncTYeAcft/GdMMeFJORHRBGt+yDh0bOMdcIlltbrQwQKrjgazovC
         cpXEk2Ty4zOf7jRRvbwSJyR5eNApS1gDoyTdxQ9LHBkXo2bDIUxhuU+U3zRqeM74m2ud
         XPXdZ5Re2NlFa59uVYGWqNlnHQDz4s9d1S2IGw2ZRvsCTCK3CnbMx6EElZSTLSWZy69y
         5NYbaLZfSjEjt3b/sKbIrmLbZpZPlhQrl0gNgfM+u2n6EK4Bit7nl88HOF8UQLV2zVT5
         uArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758528193; x=1759132993;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GsUuh5Jf/DOqhzicHbLgWx6LAUT+miJ4b6U4mqtAcuc=;
        b=wnX4PeSzm5dLy3pBjzhYIEOKswVD189z8EfK1cnba1dVmkn8NN/hckrByStBp/7K7I
         sRJYytw2aVU4kxuANZt63VUOsNXcp5Tcg/23xXywZ6dtAEDpZueDioX+nESQTgK8wwZE
         GLH78cTImqLAqp8ozNYF56TpO953jq+QGEQT4MRa9d2d7Cei9F6xOTdxK2A4QjCdUIS5
         Pq3FHmWCN16bbuBWvco/7rB9gpctMBiTukEsfD2BUQsfijy+zxoRXa3kpIne/rCBsx9+
         6bxS16jskQ1M/99Ju3Sic/vKNxN0W2RK9WBEVTGsfXi7tlXVCbMUH+bBfdIZmOZR3x/O
         A9gA==
X-Gm-Message-State: AOJu0YxOZgn1/uTMsDcUzIlVWq1pk9iLt8UR6c1wVRhDHrvKnPgJm1YZ
	0+rKBpyv1JqOnr2X0P9owF8u4nZof4mow7bk99OXPvNcYteM0UFlSiCn
X-Gm-Gg: ASbGncv/v54dk+0RhhTr4GttiCBT5EPb58cp3p5xY+0NXkxiYqW65z6KOg56v+z1jOX
	XVMN+gKbMSSrdPHrZvGmRjgIv2e6A0i6nt5mlG4nm3sXPBTXz7OdWSFL45/szGKMffNL2GMfuYX
	h9O/26vvdObGJfxGvhmuoKdDuCGcsC+pEWIoGNCmB2IULZWwNUtKnivDivDSvDwyTjzTt9MMHCb
	j+1pZpxrC6Wzk8LmDXes6ccs3fBvSZHAGzaCT8tgqsz3yL8U0dYxc5VbcTXUlvv4GynsgBUDHas
	YiDCG6K6FveoQ6EXRxGtjpRuNai7IicI3CvO6T51V0VRzyL53FmtPupMUwcs5U0RWeziQ2n+716
	hnb8+k3XT3atMoHPJE2vsdxUiWuVBw6a4
X-Google-Smtp-Source: AGHT+IGzXu2BRUSEOHuaLxiQYPrq48pwt4dOk70NyhVjzNOgyY4rLWgssRqM76J9ZRtKBOvp/lev7Q==
X-Received: by 2002:a17:907:3d16:b0:b04:6cf7:75d4 with SMTP id a640c23a62f3a-b24f4ebfce2mr1185702266b.49.1758528192420;
        Mon, 22 Sep 2025 01:03:12 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2a660738d1sm371513766b.77.2025.09.22.01.03.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Sep 2025 01:03:12 -0700 (PDT)
Date: Mon, 22 Sep 2025 08:03:10 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Wei Yang <richard.weiyang@gmail.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [Patch v2 1/2] mm/ksm: get mm_slot by mm_slot_entry() when slot
 is !NULL
Message-ID: <20250922080310.pj7nz3xtxxrpjnnc@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250919071244.17020-2-richard.weiyang@gmail.com>
 <202509220348.96Aa4hMs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202509220348.96Aa4hMs-lkp@intel.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Mon, Sep 22, 2025 at 08:58:19AM +0300, Dan Carpenter wrote:
>Hi Wei,
>
>kernel test robot noticed the following build warnings:
>
>https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
>url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Yang/mm-ksm-get-mm_slot-by-mm_slot_entry-when-slot-is-NULL/20250919-151547
>base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
>patch link:    https://lore.kernel.org/r/20250919071244.17020-2-richard.weiyang%40gmail.com
>patch subject: [Patch v2 1/2] mm/ksm: get mm_slot by mm_slot_entry() when slot is !NULL
>config: microblaze-randconfig-r073-20250921 (https://download.01.org/0day-ci/archive/20250922/202509220348.96Aa4hMs-lkp@intel.com/config)
>compiler: microblaze-linux-gcc (GCC) 12.5.0
>
>If you fix the issue in a separate patch/commit (i.e. not just a new version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>| Closes: https://lore.kernel.org/r/202509220348.96Aa4hMs-lkp@intel.com/
>
>New smatch warnings:
>mm/ksm.c:2959 __ksm_exit() error: uninitialized symbol 'mm_slot'.
>
>vim +/mm_slot +2959 mm/ksm.c
>
>1c2fb7a4c2ca7a Andrea Arcangeli  2009-09-21  2922  void __ksm_exit(struct mm_struct *mm)
>f8af4da3b4c14e Hugh Dickins      2009-09-21  2923  {
>21fbd59136e077 Qi Zheng          2022-08-31  2924  	struct ksm_mm_slot *mm_slot;
>58730ab6c7cab4 Qi Zheng          2022-08-31  2925  	struct mm_slot *slot;
>9ba6929480088a Hugh Dickins      2009-09-21  2926  	int easy_to_free = 0;
>cd551f97519d35 Hugh Dickins      2009-09-21  2927  
>31dbd01f314364 Izik Eidus        2009-09-21  2928  	/*
>9ba6929480088a Hugh Dickins      2009-09-21  2929  	 * This process is exiting: if it's straightforward (as is the
>9ba6929480088a Hugh Dickins      2009-09-21  2930  	 * case when ksmd was never running), free mm_slot immediately.
>9ba6929480088a Hugh Dickins      2009-09-21  2931  	 * But if it's at the cursor or has rmap_items linked to it, use
>c1e8d7c6a7a682 Michel Lespinasse 2020-06-08  2932  	 * mmap_lock to synchronize with any break_cows before pagetables
>9ba6929480088a Hugh Dickins      2009-09-21  2933  	 * are freed, and leave the mm_slot on the list for ksmd to free.
>9ba6929480088a Hugh Dickins      2009-09-21  2934  	 * Beware: ksm may already have noticed it exiting and freed the slot.
>31dbd01f314364 Izik Eidus        2009-09-21  2935  	 */
>9ba6929480088a Hugh Dickins      2009-09-21  2936  
>cd551f97519d35 Hugh Dickins      2009-09-21  2937  	spin_lock(&ksm_mmlist_lock);
>58730ab6c7cab4 Qi Zheng          2022-08-31  2938  	slot = mm_slot_lookup(mm_slots_hash, mm);
>de4014f857d062 Wei Yang          2025-09-19  2939  	if (slot) {
>58730ab6c7cab4 Qi Zheng          2022-08-31  2940  		mm_slot = mm_slot_entry(slot, struct ksm_mm_slot, slot);
>de4014f857d062 Wei Yang          2025-09-19  2941  		if (ksm_scan.mm_slot != mm_slot) {
>6514d511dbe5a7 Hugh Dickins      2009-12-14  2942  			if (!mm_slot->rmap_list) {
>58730ab6c7cab4 Qi Zheng          2022-08-31  2943  				hash_del(&slot->hash);
>58730ab6c7cab4 Qi Zheng          2022-08-31  2944  				list_del(&slot->mm_node);
>9ba6929480088a Hugh Dickins      2009-09-21  2945  				easy_to_free = 1;
>9ba6929480088a Hugh Dickins      2009-09-21  2946  			} else {
>58730ab6c7cab4 Qi Zheng          2022-08-31  2947  				list_move(&slot->mm_node,
>58730ab6c7cab4 Qi Zheng          2022-08-31  2948  					  &ksm_scan.mm_slot->slot.mm_node);
>9ba6929480088a Hugh Dickins      2009-09-21  2949  			}
>9ba6929480088a Hugh Dickins      2009-09-21  2950  		}
>de4014f857d062 Wei Yang          2025-09-19  2951  	}
>
>mm_slot isn't initialized on the else path
>
>cd551f97519d35 Hugh Dickins      2009-09-21  2952  	spin_unlock(&ksm_mmlist_lock);
>cd551f97519d35 Hugh Dickins      2009-09-21  2953  
>9ba6929480088a Hugh Dickins      2009-09-21  2954  	if (easy_to_free) {
>58730ab6c7cab4 Qi Zheng          2022-08-31  2955  		mm_slot_free(mm_slot_cache, mm_slot);
>12e423ba4eaed7 Lorenzo Stoakes   2025-08-12  2956  		mm_flags_clear(MMF_VM_MERGE_ANY, mm);
>12e423ba4eaed7 Lorenzo Stoakes   2025-08-12  2957  		mm_flags_clear(MMF_VM_MERGEABLE, mm);
>9ba6929480088a Hugh Dickins      2009-09-21  2958  		mmdrop(mm);
>9ba6929480088a Hugh Dickins      2009-09-21 @2959  	} else if (mm_slot) {
>                                                                   ^^^^^^^
>uninitialized
>

Thanks, will initialize it at the beginning.

>d8ed45c5dcd455 Michel Lespinasse 2020-06-08  2960  		mmap_write_lock(mm);
>d8ed45c5dcd455 Michel Lespinasse 2020-06-08  2961  		mmap_write_unlock(mm);
>9ba6929480088a Hugh Dickins      2009-09-21  2962  	}
>739100c88f49a6 Stefan Roesch     2023-02-10  2963  
>739100c88f49a6 Stefan Roesch     2023-02-10  2964  	trace_ksm_exit(mm);
>31dbd01f314364 Izik Eidus        2009-09-21  2965  }
>
>-- 
>0-DAY CI Kernel Test Service
>https://github.com/intel/lkp-tests/wiki

-- 
Wei Yang
Help you, Help me
