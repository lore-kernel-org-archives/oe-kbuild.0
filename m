Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165C827603C
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 19:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768764335; cv=none; b=UbLhOEeyKjUcemZWW2Dil7gMfdf0vu7W8FJOcPhi42bYDbTtpOSXl+Ribl6jFomjbX3KGul6G9s3CBSPyyftLGJcDgMgg9bbZY5GZt9NZk6vTP0e1G/gipyLVmfEO4JU+tosQfcQqwvD8H/pTIs1pJarKmbCO7i6naJEaiNMh0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768764335; c=relaxed/simple;
	bh=BXakfJ9bt81suJHiwm28EL4sEPpsJQoZujDv59wTlxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DgnE71omN57P6HkbTWaoxmzIAjkX8/yVq5H8PhTbe0STbAZRO1NUrl7X5n+26r3b800WTjAAZroGXEbydES08eLhTml016BDpYJumw7oKXCI2o59uOC39lDo91jtxSA59FhONCkurah6x8/K00PVcQwvNYj3JPJGdjD2JK/SVfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nRDAsr0o; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nRDAsr0o"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-432d256c2a9so3634647f8f.3
        for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 11:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768764332; x=1769369132; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6CZ9ZfuHmCDX2GcmMPsb/ojS/rZ/KYtmYpm0wz9WXBA=;
        b=nRDAsr0otXJXuig5eAKvI6G7FKfNKnyKjtSpiwHjyTVJ7Zveygnt9QWRhCTlCZS6mM
         /po7EKRqSn3MfyeZxetf6KIOIoB+hjcq3X526+NpvPKE7ogowJp8F00aWCNiHsayjafl
         HkRZ1asfkX7GcxtHPUENdlg8KuIwfOJsiDbkh/Rf7PfnEFzrpZIuiY13ZKvEm1cVkvfn
         HqQQzzz37EHsgt/nlIrHS+7Nnmmtzu5HfHgPwQS0edAru0U3ClyAn8SQp50R5KOr1UlE
         wWxhewECrXSMHJ/XeEXyOkGcGSMmeYsMQH4nO/avJ+lhysWsjecWjNgv408UkrQnr+bh
         OeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768764332; x=1769369132;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6CZ9ZfuHmCDX2GcmMPsb/ojS/rZ/KYtmYpm0wz9WXBA=;
        b=DQuyCLML/mshW8y5NCNJcjrwTUUil9niAirNNG6a375fiVQk7B0/x/myP+YzKjuqTl
         zU4fjTI1PGFx9cnqchpSIqYV4clY/0opQD8VBQruEkvZUXFAqVI6YH+YJlCs5hds4UZ/
         7jyXQDN7TtKwjg8Wudm0cSx4sImj6R9mk3AruQww2GjMpn/jw5k/wqUEtKTxVuiwc3N0
         y0xoyUNZ9R44JfTfUhhxV/Ks67ULi/Tv+lbfrckuPBtPP6MYI44uuThXugysjzkXdGUm
         PL6L+3gOdMQCFrB9xNhEL0iAyxDPrJ5V/AczxXORq8THd17XN7MtWKDSD7Dst8XqA427
         zrFw==
X-Gm-Message-State: AOJu0Yzplbh/pJi+MdT5fw5UNsZ5Svdm/5QqehqpRYxoP0SPyy2vKaV4
	jNREG4G4KrR7TeEW2HRaAJiqnMjo2744rmNIyqfphofJhU96YAY/GLe74eZxdIXl7HI+q6H6y3B
	ZvEDe
X-Gm-Gg: AY/fxX4aQQg9eKzX4029QwZ2CKG1KsiCXHRqoXKaa9nJx0/q2KhYgw89mhkuD9LN9FB
	kcpQ6Y/RohB8G1If9+7lfVr1FmzfcePQ54G4JKJrUiy2ruBENy43tpOQKTmo+fitS2uRr2NkuAs
	8PeTaYdUZFHKk+AXq1JexLyaRFpMJD6HKTcQ6kNoFEJIf06n7f8llYHSpFQDoGqfPfpW0nLyiJP
	veovRETLpWscDihh6MNBo7lzIOh6kI2xwL+bwNwjTQxy7y/Ve5lmoiyju9nXjEUDs/KthBVLWjS
	QAOGKYr6OGpGm9Q+wruXPTsKtRmmb9YVHcpO2CJjraeYO0z039463obMLG8KV3+Ju8g7HFxvF89
	mcKCaBdKNMRYoarY90yyU7uzH1m+wTUvDRFz3xwmO3RA+y8kRZj4B7EZ+f6Lyx/HlUg9OFV5KlR
	SHOpJjK27cZicht7X1xwkM+qzJ/0s=
X-Received: by 2002:a05:6000:268a:b0:430:f7bc:4d0c with SMTP id ffacd0b85a97d-4356a04aaadmr11328619f8f.28.1768764332158;
        Sun, 18 Jan 2026 11:25:32 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435696fbea8sm18634423f8f.0.2026.01.18.11.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 11:25:31 -0800 (PST)
Date: Sun, 18 Jan 2026 22:25:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Prike Liang <Prike.Liang@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c:804
 amdgpu_gmc_flush_gpu_tlb_pasid() warn: inconsistent returns
 '&adev->reset_domain->sem'.
Message-ID: <202601190121.z9C0uml5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20260118192529.GOuUrMmRG4Pr-FKdqB6nVTGn72S-sz3XzygI_KiwRvw@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e84d960149e71e8d5e4db69775ce31305898ed0c
commit: 0bea77b13b7649710108e6b67937ab4c7f8a9363 drm/amdgpu: validate the flush_gpu_tlb_pasid()
config: powerpc64-randconfig-r071-20260118 (https://download.01.org/0day-ci/archive/20260119/202601190121.z9C0uml5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601190121.z9C0uml5-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c:804 amdgpu_gmc_flush_gpu_tlb_pasid() warn: inconsistent returns '&adev->reset_domain->sem'.

vim +804 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c

e7b90e99fa8fd6 Christian König 2023-09-04  717  int amdgpu_gmc_flush_gpu_tlb_pasid(struct amdgpu_device *adev, uint16_t pasid,
e7b90e99fa8fd6 Christian König 2023-09-04  718  				   uint32_t flush_type, bool all_hub,
e7b90e99fa8fd6 Christian König 2023-09-04  719  				   uint32_t inst)
e7b90e99fa8fd6 Christian König 2023-09-04  720  {
e7b90e99fa8fd6 Christian König 2023-09-04  721  	struct amdgpu_ring *ring = &adev->gfx.kiq[inst].ring;
e7b90e99fa8fd6 Christian König 2023-09-04  722  	struct amdgpu_kiq *kiq = &adev->gfx.kiq[inst];
e7b90e99fa8fd6 Christian König 2023-09-04  723  	unsigned int ndw;
3666ed821832f4 Jay Cornwall    2025-03-21  724  	int r, cnt = 0;
e7b90e99fa8fd6 Christian König 2023-09-04  725  	uint32_t seq;
e7b90e99fa8fd6 Christian König 2023-09-04  726  
9c33e5fd4fb63b Yunxiang Li     2024-05-23  727  	/*
9c33e5fd4fb63b Yunxiang Li     2024-05-23  728  	 * A GPU reset should flush all TLBs anyway, so no need to do
9c33e5fd4fb63b Yunxiang Li     2024-05-23  729  	 * this while one is ongoing.
9c33e5fd4fb63b Yunxiang Li     2024-05-23  730  	 */
9c33e5fd4fb63b Yunxiang Li     2024-05-23  731  	if (!down_read_trylock(&adev->reset_domain->sem))
9c33e5fd4fb63b Yunxiang Li     2024-05-23  732  		return 0;
08abccc9a7a7ff Christian König 2023-09-04  733  
9c33e5fd4fb63b Yunxiang Li     2024-05-23  734  	if (!adev->gmc.flush_pasid_uses_kiq || !ring->sched.ready) {
0bea77b13b7649 Prike Liang     2026-01-06  735  
0bea77b13b7649 Prike Liang     2026-01-06  736  		if (!adev->gmc.gmc_funcs->flush_gpu_tlb_pasid)
0bea77b13b7649 Prike Liang     2026-01-06  737  			return 0;

need to call up_read(&adev->reset_domain->sem) before returning.

0bea77b13b7649 Prike Liang     2026-01-06  738  
08abccc9a7a7ff Christian König 2023-09-04  739  		if (adev->gmc.flush_tlb_needs_extra_type_2)
08abccc9a7a7ff Christian König 2023-09-04  740  			adev->gmc.gmc_funcs->flush_gpu_tlb_pasid(adev, pasid,
08abccc9a7a7ff Christian König 2023-09-04  741  								 2, all_hub,
08abccc9a7a7ff Christian König 2023-09-04  742  								 inst);
08abccc9a7a7ff Christian König 2023-09-04  743  
08abccc9a7a7ff Christian König 2023-09-04  744  		if (adev->gmc.flush_tlb_needs_extra_type_0 && flush_type == 2)
08abccc9a7a7ff Christian König 2023-09-04  745  			adev->gmc.gmc_funcs->flush_gpu_tlb_pasid(adev, pasid,
08abccc9a7a7ff Christian König 2023-09-04  746  								 0, all_hub,
08abccc9a7a7ff Christian König 2023-09-04  747  								 inst);
08abccc9a7a7ff Christian König 2023-09-04  748  
3983c9fd2d8b5a Christian König 2023-09-04  749  		adev->gmc.gmc_funcs->flush_gpu_tlb_pasid(adev, pasid,
3983c9fd2d8b5a Christian König 2023-09-04  750  							 flush_type, all_hub,
3983c9fd2d8b5a Christian König 2023-09-04  751  							 inst);
9c33e5fd4fb63b Yunxiang Li     2024-05-23  752  		r = 0;
9c33e5fd4fb63b Yunxiang Li     2024-05-23  753  	} else {
e7b90e99fa8fd6 Christian König 2023-09-04  754  		/* 2 dwords flush + 8 dwords fence */
e7b90e99fa8fd6 Christian König 2023-09-04  755  		ndw = kiq->pmf->invalidate_tlbs_size + 8;
e7b90e99fa8fd6 Christian König 2023-09-04  756  
e7b90e99fa8fd6 Christian König 2023-09-04  757  		if (adev->gmc.flush_tlb_needs_extra_type_2)
e7b90e99fa8fd6 Christian König 2023-09-04  758  			ndw += kiq->pmf->invalidate_tlbs_size;
e7b90e99fa8fd6 Christian König 2023-09-04  759  
e7b90e99fa8fd6 Christian König 2023-09-04  760  		if (adev->gmc.flush_tlb_needs_extra_type_0)
e7b90e99fa8fd6 Christian König 2023-09-04  761  			ndw += kiq->pmf->invalidate_tlbs_size;
e7b90e99fa8fd6 Christian König 2023-09-04  762  
e7b90e99fa8fd6 Christian König 2023-09-04  763  		spin_lock(&adev->gfx.kiq[inst].ring_lock);
9ff2e14cf013fa Bob Zhou        2024-06-20  764  		r = amdgpu_ring_alloc(ring, ndw);
9ff2e14cf013fa Bob Zhou        2024-06-20  765  		if (r) {
9ff2e14cf013fa Bob Zhou        2024-06-20  766  			spin_unlock(&adev->gfx.kiq[inst].ring_lock);
9ff2e14cf013fa Bob Zhou        2024-06-20  767  			goto error_unlock_reset;
9ff2e14cf013fa Bob Zhou        2024-06-20  768  		}
e7b90e99fa8fd6 Christian König 2023-09-04  769  		if (adev->gmc.flush_tlb_needs_extra_type_2)
e7b90e99fa8fd6 Christian König 2023-09-04  770  			kiq->pmf->kiq_invalidate_tlbs(ring, pasid, 2, all_hub);
e7b90e99fa8fd6 Christian König 2023-09-04  771  
e7b90e99fa8fd6 Christian König 2023-09-04  772  		if (flush_type == 2 && adev->gmc.flush_tlb_needs_extra_type_0)
e7b90e99fa8fd6 Christian König 2023-09-04  773  			kiq->pmf->kiq_invalidate_tlbs(ring, pasid, 0, all_hub);
e7b90e99fa8fd6 Christian König 2023-09-04  774  
e7b90e99fa8fd6 Christian König 2023-09-04  775  		kiq->pmf->kiq_invalidate_tlbs(ring, pasid, flush_type, all_hub);
e7b90e99fa8fd6 Christian König 2023-09-04  776  		r = amdgpu_fence_emit_polling(ring, &seq, MAX_KIQ_REG_WAIT);
e7b90e99fa8fd6 Christian König 2023-09-04  777  		if (r) {
e7b90e99fa8fd6 Christian König 2023-09-04  778  			amdgpu_ring_undo(ring);
e7b90e99fa8fd6 Christian König 2023-09-04  779  			spin_unlock(&adev->gfx.kiq[inst].ring_lock);
e7b90e99fa8fd6 Christian König 2023-09-04  780  			goto error_unlock_reset;
e7b90e99fa8fd6 Christian König 2023-09-04  781  		}
e7b90e99fa8fd6 Christian König 2023-09-04  782  
e7b90e99fa8fd6 Christian König 2023-09-04  783  		amdgpu_ring_commit(ring);
e7b90e99fa8fd6 Christian König 2023-09-04  784  		spin_unlock(&adev->gfx.kiq[inst].ring_lock);
3666ed821832f4 Jay Cornwall    2025-03-21  785  
3666ed821832f4 Jay Cornwall    2025-03-21  786  		r = amdgpu_fence_wait_polling(ring, seq, MAX_KIQ_REG_WAIT);
3666ed821832f4 Jay Cornwall    2025-03-21  787  
3666ed821832f4 Jay Cornwall    2025-03-21  788  		might_sleep();
3666ed821832f4 Jay Cornwall    2025-03-21  789  		while (r < 1 && cnt++ < MAX_KIQ_REG_TRY &&
3666ed821832f4 Jay Cornwall    2025-03-21  790  		       !amdgpu_reset_pending(adev->reset_domain)) {
3666ed821832f4 Jay Cornwall    2025-03-21  791  			msleep(MAX_KIQ_REG_BAILOUT_INTERVAL);
3666ed821832f4 Jay Cornwall    2025-03-21  792  			r = amdgpu_fence_wait_polling(ring, seq, MAX_KIQ_REG_WAIT);
3666ed821832f4 Jay Cornwall    2025-03-21  793  		}
3666ed821832f4 Jay Cornwall    2025-03-21  794  
3666ed821832f4 Jay Cornwall    2025-03-21  795  		if (cnt > MAX_KIQ_REG_TRY) {
9c33e5fd4fb63b Yunxiang Li     2024-05-23  796  			dev_err(adev->dev, "timeout waiting for kiq fence\n");
e7b90e99fa8fd6 Christian König 2023-09-04  797  			r = -ETIME;
3666ed821832f4 Jay Cornwall    2025-03-21  798  		} else
3666ed821832f4 Jay Cornwall    2025-03-21  799  			r = 0;
9c33e5fd4fb63b Yunxiang Li     2024-05-23  800  	}
e7b90e99fa8fd6 Christian König 2023-09-04  801  
e7b90e99fa8fd6 Christian König 2023-09-04  802  error_unlock_reset:
e7b90e99fa8fd6 Christian König 2023-09-04  803  	up_read(&adev->reset_domain->sem);
e7b90e99fa8fd6 Christian König 2023-09-04 @804  	return r;
e7b90e99fa8fd6 Christian König 2023-09-04  805  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

