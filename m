Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF542D6E72
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 06:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770705113; cv=none; b=N89qfUuT+gpibJvu/dYtUlkrz4ekDU626c1oqQqIvYSvMXzsb5yOYcWGuVIIIXvapsoLJK3AF6Wq+hL/mNyi3vRRxMNVMw5ntAh6X5SU8Ypu0ikxBEEXINvLVk9np6IL3jAUTQI9nOAtAxo/IfhehSyIFqnhqJEnpxIgYtKC6aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770705113; c=relaxed/simple;
	bh=+dY5A7nwRVBRBd7BJ1hDL2J+oBIHOmLAIhWPxMtTN4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=bKpXe5JOXwzmFukAz5b6IFX6ZTz8i2rvMRR5N2xVYAt8vrYaCbW4jGoQLF1AkcJgNgqLoyX6kPpZK224KgSf6Z5WnYAoWMXEFjRC4c+JKIeTFFvcvRqjEIqt9Pxm+ReHiC8b2LA7GpM6A0eUeC3Tdrkkkxt40xlQkxlTS2Mtxhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oYZc1Kc3; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oYZc1Kc3"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4832701b9b7so19624275e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 09 Feb 2026 22:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770705110; x=1771309910; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PuIvHjahYrqUwfgodntxdfFSIIlE9ggIgaeNW8+YxZc=;
        b=oYZc1Kc3Hw0CT2IPsF8cLE8qUP3V1ESNsTWB9bI1H7vhWiWL+hjQpmWX4AxZ802a4/
         p3OrLPfuGQ2KZ+NsRzCSbPW6+Zc7WS0NYEmdsbZFoabTUjpm+FuEN5zsaq7lUCnFk/xe
         jmobnfHyHoNHtWOPunfqh4QCp30quUgcVaZp8KZeSHZKQOksE8wCAllETlGhowx3o05e
         tH/QSNUWl28sDcgiwkHJwm2Gj2ln98qY9iUF0hK0xVf0bnxlnestsOH/MwdjBEZq9h+v
         Se0frXGx65eTlbNQCtoAIgSELASkISSqxUpkSR54oypVGcV8b9kvJOblT3F18NSwEja+
         bB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770705110; x=1771309910;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PuIvHjahYrqUwfgodntxdfFSIIlE9ggIgaeNW8+YxZc=;
        b=w4kF1P3utxW4mwxQ6pX4/cURQipWFu38i6ccSWMGTyF0PxlOQzJLruSXGvoFJVurZ0
         w1qGAaCPA7IRF08rUb9m55IFPb8j7jrxzYEvTBvezNDpe2AyeSQbiO0EAzUvBk3J+PxD
         pPJa0Ndfhf0PFhDo1WnKg7ZiAydh1VrhmOHvDydvU+E3iG0/1hzPEeQe4jjpegrAtGtM
         K25JHH+C5q6an7bt2b+AhVAGgfhMDSigsbzQbuwTVMXRmnuScR+k0ElxjkWi+h51OM3T
         GpwlGdT9RCe20mqg2Fg4w+Vj12ddbc2cXr2xfe4HczP/9TLH0WjNDpozQqUHk1bOrkI7
         YSsg==
X-Gm-Message-State: AOJu0YwqsDlcTDfMIBxB95J6ZkeYxsgi66N7VEpJj4vHm2ci3Xpie7rt
	kB8zgcji5oEQxIaD93bWbApNf6nCOV1NxikilfrhuP/N5HMpH+g+7t0ryKQiFmsZ35OGBZXQ9zu
	D0qQJ
X-Gm-Gg: AZuq6aK+oityKS7g6+SqmdCGte1OYe7Gi6QJFXPU4+6Uaamrj69ioS/XA4XDGbhhtSv
	uJsbRhO+1Fn8NOujjEz7oNrb2raZeOljPIeg1mKcCkmTfTWve9mNlUB1Zv2QICy4wlrak+NHk/v
	7RqqqA/lQDdGDO4vn4H7ZPXvfBmIa47ybb7bNNSWa5C9nyUUD9nqpIr+GBXO1jR20jWlAKWr2zl
	RHnRUorW5ppmgJLF9Dei8UFOgrC9dheHD55bqyXS6BB3D5pFmbhplhiyUHwlNeN56LWhB2P2/i0
	C+1ISQ+3AF4p38jkq2Xwytiks6pxyqasAhX8xBewmGrOb5jgmhfqUV2wJVYJHPhu6U0RoHegQRh
	ZvEm6/evJOrD4i93CfYO5SYhcqZSZAVTqstzCTJFXgur6ehI3pUnTfZ6HvivFmyr5BLYP0wcpit
	BxDn+RMaqcxKGftAhulzFVX/C6E9TH
X-Received: by 2002:a05:600c:4f8a:b0:47a:8cce:2940 with SMTP id 5b1f17b1804b1-483201e3aaemr189459165e9.14.1770705109669;
        Mon, 09 Feb 2026 22:31:49 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320961505sm215017735e9.4.2026.02.09.22.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 22:31:49 -0800 (PST)
Date: Tue, 10 Feb 2026 09:31:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Nhat Pham <nphamcs@gmail.com>,
	linux-mm@kvack.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, akpm@linux-foundation.org,
	hannes@cmpxchg.org, hughd@google.com, yosry.ahmed@linux.dev,
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, len.brown@intel.com,
	chengming.zhou@linux.dev, kasong@tencent.com, chrisl@kernel.org,
	huang.ying.caritas@gmail.com, ryan.roberts@arm.com,
	shikemeng@huaweicloud.com, viro@zeniv.linux.org.uk,
	baohua@kernel.org, bhe@redhat.com, osalvador@suse.de,
	lorenzo.stoakes@oracle.com, christophe.leroy@csgroup.eu,
	pavel@kernel.org, kernel-team@meta.com,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-pm@vger.kernel.org, peterx@redhat.com, riel@surriel.com,
	joshua.hahnjy@gmail.com
Subject: Re: [PATCH v3 14/20] mm: swap: decouple virtual swap slot from
 backing store
Message-ID: <202602092300.lZO4Ee4N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260208215839.87595-15-nphamcs@gmail.com>
Message-ID: <20260210063146.XbobdA0ResB7E5xe30YAiZB5p0-xW6NtDzsMstG0b3E@z>

Hi Nhat,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Nhat-Pham/mm-swap-decouple-swap-cache-from-physical-swap-infrastructure/20260209-120606
base:   05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
patch link:    https://lore.kernel.org/r/20260208215839.87595-15-nphamcs%40gmail.com
patch subject: [PATCH v3 14/20] mm: swap: decouple virtual swap slot from backing store
config: powerpc-randconfig-r073-20260209 (https://download.01.org/0day-ci/archive/20260209/202602092300.lZO4Ee4N-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602092300.lZO4Ee4N-lkp@intel.com/

smatch warnings:
mm/vswap.c:733 vswap_alloc_swap_slot() warn: variable dereferenced before check 'folio' (see line 701)

vim +/folio +733 mm/vswap.c

19a5fe94e9aae4 Nhat Pham 2026-02-08  694  bool vswap_alloc_swap_slot(struct folio *folio)
19a5fe94e9aae4 Nhat Pham 2026-02-08  695  {
19a5fe94e9aae4 Nhat Pham 2026-02-08  696  	int i, nr = folio_nr_pages(folio);
19a5fe94e9aae4 Nhat Pham 2026-02-08  697  	struct vswap_cluster *cluster = NULL;
19a5fe94e9aae4 Nhat Pham 2026-02-08  698  	struct swap_info_struct *si;
19a5fe94e9aae4 Nhat Pham 2026-02-08  699  	struct swap_cluster_info *ci;
19a5fe94e9aae4 Nhat Pham 2026-02-08  700  	swp_slot_t slot = { .val = 0 };
19a5fe94e9aae4 Nhat Pham 2026-02-08 @701  	swp_entry_t entry = folio->swap;

folio dereference here

19a5fe94e9aae4 Nhat Pham 2026-02-08  702  	struct swp_desc *desc;
19a5fe94e9aae4 Nhat Pham 2026-02-08  703  	bool fallback = false;
19a5fe94e9aae4 Nhat Pham 2026-02-08  704  
19a5fe94e9aae4 Nhat Pham 2026-02-08  705  	/*
19a5fe94e9aae4 Nhat Pham 2026-02-08  706  	 * We might have already allocated a backing physical swap slot in past
19a5fe94e9aae4 Nhat Pham 2026-02-08  707  	 * attempts (for instance, when we disable zswap). If the entire range is
19a5fe94e9aae4 Nhat Pham 2026-02-08  708  	 * already swapfile-backed we can skip swapfile case.
19a5fe94e9aae4 Nhat Pham 2026-02-08  709  	 */
19a5fe94e9aae4 Nhat Pham 2026-02-08  710  	if (vswap_swapfile_backed(entry, nr))
19a5fe94e9aae4 Nhat Pham 2026-02-08  711  		return true;
19a5fe94e9aae4 Nhat Pham 2026-02-08  712  
19a5fe94e9aae4 Nhat Pham 2026-02-08  713  	if (swap_slot_alloc(&slot, folio_order(folio)))

and here

19a5fe94e9aae4 Nhat Pham 2026-02-08  714  		return false;
19a5fe94e9aae4 Nhat Pham 2026-02-08  715  
19a5fe94e9aae4 Nhat Pham 2026-02-08  716  	if (!slot.val)
19a5fe94e9aae4 Nhat Pham 2026-02-08  717  		return false;
19a5fe94e9aae4 Nhat Pham 2026-02-08  718  
7f88e3ea20f231 Nhat Pham 2026-02-08  719  	/* establish the vrtual <-> physical swap slots linkages. */
7f88e3ea20f231 Nhat Pham 2026-02-08  720  	si = __swap_slot_to_info(slot);
7f88e3ea20f231 Nhat Pham 2026-02-08  721  	ci = swap_cluster_lock(si, swp_slot_offset(slot));
7f88e3ea20f231 Nhat Pham 2026-02-08  722  	vswap_rmap_set(ci, slot, entry.val, nr);
7f88e3ea20f231 Nhat Pham 2026-02-08  723  	swap_cluster_unlock(ci);
7f88e3ea20f231 Nhat Pham 2026-02-08  724  
7f88e3ea20f231 Nhat Pham 2026-02-08  725  	rcu_read_lock();
7f88e3ea20f231 Nhat Pham 2026-02-08  726  	for (i = 0; i < nr; i++) {
7f88e3ea20f231 Nhat Pham 2026-02-08  727  		desc = vswap_iter(&cluster, entry.val + i);
7f88e3ea20f231 Nhat Pham 2026-02-08  728  		VM_WARN_ON(!desc);
7f88e3ea20f231 Nhat Pham 2026-02-08  729  
19a5fe94e9aae4 Nhat Pham 2026-02-08  730  		if (desc->type == VSWAP_FOLIO) {
19a5fe94e9aae4 Nhat Pham 2026-02-08  731  			/* case 1: fallback from zswap store failure */
19a5fe94e9aae4 Nhat Pham 2026-02-08  732  			fallback = true;
19a5fe94e9aae4 Nhat Pham 2026-02-08 @733  			if (!folio)

So it can't be NULL here.

19a5fe94e9aae4 Nhat Pham 2026-02-08  734  				folio = desc->swap_cache;

So we'll never do this assignment and it will never become NULL.

19a5fe94e9aae4 Nhat Pham 2026-02-08  735  			else
19a5fe94e9aae4 Nhat Pham 2026-02-08  736  				VM_WARN_ON(folio != desc->swap_cache);
19a5fe94e9aae4 Nhat Pham 2026-02-08  737  		} else {
19a5fe94e9aae4 Nhat Pham 2026-02-08  738  			/*
19a5fe94e9aae4 Nhat Pham 2026-02-08  739  			 * Case 2: zswap writeback.
19a5fe94e9aae4 Nhat Pham 2026-02-08  740  			 *
19a5fe94e9aae4 Nhat Pham 2026-02-08  741  			 * No need to free zswap entry here - it will be freed once zswap
19a5fe94e9aae4 Nhat Pham 2026-02-08  742  			 * writeback suceeds.
19a5fe94e9aae4 Nhat Pham 2026-02-08  743  			 */
19a5fe94e9aae4 Nhat Pham 2026-02-08  744  			VM_WARN_ON(desc->type != VSWAP_ZSWAP);
19a5fe94e9aae4 Nhat Pham 2026-02-08  745  			VM_WARN_ON(fallback);
19a5fe94e9aae4 Nhat Pham 2026-02-08  746  		}
19a5fe94e9aae4 Nhat Pham 2026-02-08  747  		desc->type = VSWAP_SWAPFILE;
7f88e3ea20f231 Nhat Pham 2026-02-08  748  		desc->slot.val = slot.val + i;
7f88e3ea20f231 Nhat Pham 2026-02-08  749  	}
7f88e3ea20f231 Nhat Pham 2026-02-08  750  	spin_unlock(&cluster->lock);
7f88e3ea20f231 Nhat Pham 2026-02-08  751  	rcu_read_unlock();
19a5fe94e9aae4 Nhat Pham 2026-02-08  752  	return true;
7f88e3ea20f231 Nhat Pham 2026-02-08  753  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

