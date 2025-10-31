Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4A21E25F9
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Oct 2025 05:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761888179; cv=none; b=ZT+pLMjcYotZfjSXb3u8X4cyFDXAs2lQLv4Z7/w3qTBx+Lmcoxhn+n1rYLV+A4URwPHy5a1MJo+uclgCa4qqATyKukugfD5kYAtG/MqHwOVx3VoaOh5pLfEZZJ6kIVII73SVu62HPYHns85Lxf3WH7u2kkoq3y2rHaD7pJ0XTsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761888179; c=relaxed/simple;
	bh=R34RNdHfLenmvgLgeWC/CaGqZ5s2qXVesvg26UCKFm8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LxfdjkmjBWxMFo7NhRyYCStnpe43xFT5MQvULP4XLs35+THGS+Leo+uyC3gnJ0W0tAyo92dQagVHaq4YPx5veqs2NL6mu8BFVMXDxTdSZ9zpXt1xgpQsTZaloiooImkNYjHDZguGsIjrz+N10TBzd+cqgZ33is7BmuEbLzJv2FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ve4/1X7h; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ve4/1X7h"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4710683a644so16533835e9.0
        for <oe-kbuild@lists.linux.dev>; Thu, 30 Oct 2025 22:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761888175; x=1762492975; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JEAcebBrLfuvI6ZqOIoqhHd8hKm6Gmtjk7upIV0IUIo=;
        b=ve4/1X7hRfStLZw88nOMsNuy3fxoo0MSEM94Sv+gTuJjNVIFEtpCWiyjiRtCBUGyBO
         cUkUfj4uiyID3TEsNCesrKSVzAbK/zj/q3Ro4C47+EBMP0Nhqm71P2kSjyY0Y/IwutWV
         NUEpOXwGbxGr0qxnpf84PAVRl2NtiEBJvPx/9MdccuYySek6DQB+zT4OV4w7ZdpPxVnR
         20ilz2C9tV0wQwncIKCg5pShdxktrZT40S3/olWT2ietQdkbLQK1St7ftZVwQuxJ8sod
         WrFSm/oiIiNfP0MaSxLq5a2+ootWYrCIKJGKRuItB1zJYi/pfH9YGHNk48JbNU45qj7X
         DY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761888175; x=1762492975;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JEAcebBrLfuvI6ZqOIoqhHd8hKm6Gmtjk7upIV0IUIo=;
        b=PcvQXG2eADjMSlbG3p2zxczwPnFTWXRAs5u0QBFHsbj2ECEYNJD6pGRbfzEyKqPAz9
         xy0z8VDjMxlgcOtkHbTFwOSj2U3CWYHflMjKtmJLx94SzhwaKJ+B+fdr+k2VRx2RMqjv
         0wo+7/SrW1dh1flC/GzPtteIzKRnfATpH97kiIiMAwsMCqYgDiM4AjA1HT35PIdS2axu
         Zgtt/oxtb8Fc/CYUHk5Zk/14eBzOHJlorY8GwFJE2a3IHy6JyLMcgr9f3hxjGI5JN9GE
         GRG/LcpaxOov5JMDRcT/c0nRXfxiR7V/jepIufZ6vcOpvcEPZJbWTGK1uYkyo+wmBgVQ
         /ptg==
X-Gm-Message-State: AOJu0YzDE7thgcjZbsEBa5b9U+Aq2P6PR0Cck1h5NWNS9dLTEygPJB1t
	vmCnq5g+QloWbSyIzc2OwRSIPn28AwARqUpcNuTqby6Dk5Vza2/RwprU2Z3l6DdfhiEHJKPVtSo
	ktbTx
X-Gm-Gg: ASbGncv2AIY3pIn5G3Netg11ztxNH2lrNgyTGAUWfVcSq0TW7l6GC4zLze1nL0THQE8
	aQ4FJdTO8mC5K+8To4HmmlDJ6xrav8Vsa8A9EvKNFg0p61JUIMuz75MwYitVgxPE7KAuk2xbLHk
	csjGsPPc55CTnE63bMBkn/ctKZvUp4w/AD2+zlahIVv5v33ckKwKWa4CFbhQuno1w1XILsnGde1
	+Q7ll3ArW2T/BmSWhcrLBQ5sQiPiT9/fSI7QUXn3Xov2Bk2cb5Qgvs35ZjG6FbsiPeHSEIaG8z2
	blYYpiBc55YyZbuJf6Qrwv5kxDIDXPChHYr45UqLm4MlEcvJr0eCwNkho2bikOOkuUrI/mx1SBK
	BHpV5tNq2HD6IHnfDskf1hLe7RjTrG2g+gbSeGFJ8KoCwOzz9fCtKIe0t61bjxLhEdk4xFvZZyJ
	rTZ9Y+E2U6cfQshsDT
X-Google-Smtp-Source: AGHT+IGGUR1ELYcBx6zfpXv3GClC0V8C/yZllEBAJBUoCfb1tYmGTgprO4ytpww++uPb731RRJjtdw==
X-Received: by 2002:a05:600c:8189:b0:475:de75:84c6 with SMTP id 5b1f17b1804b1-477262a941emr50545115e9.12.1761888174912;
        Thu, 30 Oct 2025 22:22:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47732fe1121sm12871175e9.12.2025.10.30.22.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 22:22:54 -0700 (PDT)
Date: Fri, 31 Oct 2025 08:22:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	Xu Raoqing <xuraoqing@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3064/3064] arch/arm64/kvm/rme.c:789
 populate_region() error: uninitialized symbol 'tmp_page'.
Message-ID: <202510310208.Zw9yEOKD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251031052250.OUm9kW7oqXEJLr_g2VIhwVvzS0vZCS2qCFsGYlURyq8@z>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7f38ece6b510adaa28c8e625ff574fe6357a3960
commit: a74f93b7e7c0d8a2114055ed0c652cc735a7a07b [3064/3064] [backport]rme: populate guest memory region without guest_memfd
config: arm64-randconfig-r073-20251029 (https://download.01.org/0day-ci/archive/20251031/202510310208.Zw9yEOKD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510310208.Zw9yEOKD-lkp@intel.com/

New smatch warnings:
arch/arm64/kvm/rme.c:789 populate_region() error: uninitialized symbol 'tmp_page'.

vim +/tmp_page +789 arch/arm64/kvm/rme.c

e216f77846eeb7 Steven Price 2025-06-14  716  static int populate_region(struct kvm *kvm,
e216f77846eeb7 Steven Price 2025-06-14  717  			   phys_addr_t ipa_base,
e216f77846eeb7 Steven Price 2025-06-14  718  			   phys_addr_t ipa_end,
e216f77846eeb7 Steven Price 2025-06-14  719  			   unsigned long data_flags)
e216f77846eeb7 Steven Price 2025-06-14  720  {
e216f77846eeb7 Steven Price 2025-06-14  721  	struct realm *realm = &kvm->arch.realm;
e216f77846eeb7 Steven Price 2025-06-14  722  	struct kvm_memory_slot *memslot;
e216f77846eeb7 Steven Price 2025-06-14  723  	gfn_t base_gfn, end_gfn;
e216f77846eeb7 Steven Price 2025-06-14  724  	int idx;
e216f77846eeb7 Steven Price 2025-06-14  725  	phys_addr_t ipa = ipa_base;
a74f93b7e7c0d8 Steven Price 2025-06-14  726  	struct page *tmp_page;
e216f77846eeb7 Steven Price 2025-06-14  727  	int ret = 0;
e216f77846eeb7 Steven Price 2025-06-14  728  
e216f77846eeb7 Steven Price 2025-06-14  729  	base_gfn = gpa_to_gfn(ipa_base);
e216f77846eeb7 Steven Price 2025-06-14  730  	end_gfn = gpa_to_gfn(ipa_end);
e216f77846eeb7 Steven Price 2025-06-14  731  
e216f77846eeb7 Steven Price 2025-06-14  732  	idx = srcu_read_lock(&kvm->srcu);
e216f77846eeb7 Steven Price 2025-06-14  733  	memslot = gfn_to_memslot(kvm, base_gfn);
e216f77846eeb7 Steven Price 2025-06-14  734  	if (!memslot) {
e216f77846eeb7 Steven Price 2025-06-14  735  		ret = -EFAULT;
e216f77846eeb7 Steven Price 2025-06-14  736  		goto out;

tmp_page uninitialized here

e216f77846eeb7 Steven Price 2025-06-14  737  	}
e216f77846eeb7 Steven Price 2025-06-14  738  
e216f77846eeb7 Steven Price 2025-06-14  739  	/* We require the region to be contained within a single memslot */
e216f77846eeb7 Steven Price 2025-06-14  740  	if (memslot->base_gfn + memslot->npages < end_gfn) {
e216f77846eeb7 Steven Price 2025-06-14  741  		ret = -EINVAL;
e216f77846eeb7 Steven Price 2025-06-14  742  		goto out;
e216f77846eeb7 Steven Price 2025-06-14  743  	}
e216f77846eeb7 Steven Price 2025-06-14  744  
a74f93b7e7c0d8 Steven Price 2025-06-14  745  	tmp_page = alloc_page(GFP_KERNEL);
a74f93b7e7c0d8 Steven Price 2025-06-14  746  	if (!tmp_page) {
a74f93b7e7c0d8 Steven Price 2025-06-14  747  		ret = -ENOMEM;
e216f77846eeb7 Steven Price 2025-06-14  748  		goto out;
e216f77846eeb7 Steven Price 2025-06-14  749  	}
e216f77846eeb7 Steven Price 2025-06-14  750  
a74f93b7e7c0d8 Steven Price 2025-06-14  751  	mmap_read_lock(current->mm);
a74f93b7e7c0d8 Steven Price 2025-06-14  752  
e216f77846eeb7 Steven Price 2025-06-14  753  	while (ipa < ipa_end) {
e216f77846eeb7 Steven Price 2025-06-14  754  		struct vm_area_struct *vma;
e216f77846eeb7 Steven Price 2025-06-14  755  		unsigned long hva;
e216f77846eeb7 Steven Price 2025-06-14  756  		struct page *page;
e216f77846eeb7 Steven Price 2025-06-14  757  		kvm_pfn_t pfn;
e216f77846eeb7 Steven Price 2025-06-14  758  
e216f77846eeb7 Steven Price 2025-06-14  759  		hva = gfn_to_hva_memslot(memslot, gpa_to_gfn(ipa));
e216f77846eeb7 Steven Price 2025-06-14  760  		vma = vma_lookup(current->mm, hva);
e216f77846eeb7 Steven Price 2025-06-14  761  		if (!vma) {
e216f77846eeb7 Steven Price 2025-06-14  762  			ret = -EFAULT;
e216f77846eeb7 Steven Price 2025-06-14  763  			break;
e216f77846eeb7 Steven Price 2025-06-14  764  		}
e216f77846eeb7 Steven Price 2025-06-14  765  
a74f93b7e7c0d8 Steven Price 2025-06-14  766  		pfn = gfn_to_pfn_memslot(memslot, gpa_to_gfn(ipa));
e216f77846eeb7 Steven Price 2025-06-14  767  
e216f77846eeb7 Steven Price 2025-06-14  768  		if (is_error_pfn(pfn)) {
e216f77846eeb7 Steven Price 2025-06-14  769  			ret = -EFAULT;
e216f77846eeb7 Steven Price 2025-06-14  770  			break;
e216f77846eeb7 Steven Price 2025-06-14  771  		}
e216f77846eeb7 Steven Price 2025-06-14  772  
a74f93b7e7c0d8 Steven Price 2025-06-14  773  		page = pfn_to_page(pfn);
e216f77846eeb7 Steven Price 2025-06-14  774  
e216f77846eeb7 Steven Price 2025-06-14  775  		ret = realm_create_protected_data_page(realm, ipa,
a74f93b7e7c0d8 Steven Price 2025-06-14  776  						       page,
a74f93b7e7c0d8 Steven Price 2025-06-14  777  						       tmp_page,
e216f77846eeb7 Steven Price 2025-06-14  778  						       data_flags);
a74f93b7e7c0d8 Steven Price 2025-06-14  779  		if (ret) {
e216f77846eeb7 Steven Price 2025-06-14  780  			kvm_release_page_clean(page);
e216f77846eeb7 Steven Price 2025-06-14  781  			break;
a74f93b7e7c0d8 Steven Price 2025-06-14  782  		}
e216f77846eeb7 Steven Price 2025-06-14  783  
e216f77846eeb7 Steven Price 2025-06-14  784  		ipa += PAGE_SIZE;
a74f93b7e7c0d8 Steven Price 2025-06-14  785  		kvm_release_pfn_dirty(pfn);
e216f77846eeb7 Steven Price 2025-06-14  786  	}
e216f77846eeb7 Steven Price 2025-06-14  787  out:
a74f93b7e7c0d8 Steven Price 2025-06-14  788  	mmap_read_unlock(current->mm);
a74f93b7e7c0d8 Steven Price 2025-06-14 @789  	__free_page(tmp_page);
                                                            ^^^^^^^^

e216f77846eeb7 Steven Price 2025-06-14  790  	srcu_read_unlock(&kvm->srcu, idx);
e216f77846eeb7 Steven Price 2025-06-14  791  	return ret;
e216f77846eeb7 Steven Price 2025-06-14  792  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

