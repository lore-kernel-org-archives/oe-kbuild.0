Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F087F2F50
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Jun 2025 06:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748845892; cv=none; b=I+sqVTyf7RIXSsauyVvU7AjNIH3sdrAYueUriJ40tw40O+EOMXfjQH61bxYi/s4hauEGtjTg3svm2FUcT9W2MoKOYTgAq6LveCsEHvqilkAy7q4JZ17FKemypF/hv8zIE1bMzNQZfjiSWSItqATyBqVNSwnyEykcnNT2qRYA4Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748845892; c=relaxed/simple;
	bh=CCgaHr5wvGodpXwrDoJI6lg0fuV95O9qItns6IQ8vpw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=hOXckfvh3o+Jx5gI6ScqQcMyDwpyc1aAmcwtdoc9AJ1K8aYltuU0jyAJWGe0J55T782LrpT5Xvemb7BboSA9GeJ5ArlByIj28TKyEI0nICw/eSGMAXtXNFIoUR3QNmCOuw1xo7RExkg/Zezd6ytiAN+aL3xvUMrWX36bslzgw7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j7BlC8oN; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j7BlC8oN"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d54214adso8222075e9.3
        for <oe-kbuild@lists.linux.dev>; Sun, 01 Jun 2025 23:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748845888; x=1749450688; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=63ZxHZ2U0UxnfOsPJ5TVYXlam4kwl54w7lSvbobAXnE=;
        b=j7BlC8oNrw+uHvOBDuwGmj+OiRoRp54CWrdiT10NApz6KP/vW1o6LnlEs4Wb679J0I
         wRD39eA0jcWLI9Kn3h1zOg7/RyyCU58iVJDGLqIzfeXa46lniZpyD4jdtjADgPBH2rlz
         jEOl3UcphNb4xOlpJN+G1kdLBRRKoLsg/Ofp+ampVx1hCjAiGbkto7jLkbZsJyfLhi9U
         CRBVCfaxuDmJioNjCzmJVarIWp/kpzoVl7ROL5IKiuWxwKR3jPggHnnZCXRnps4CcxRS
         +Ar/1kjz9IlOOggFnjLGxmq6Hzu1a9lAQJgtYq5FPPP3cgQDftGFqE2Ed8eDgx8YjN1Y
         g09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748845888; x=1749450688;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=63ZxHZ2U0UxnfOsPJ5TVYXlam4kwl54w7lSvbobAXnE=;
        b=SZy0YhEVWh2v0gZhqNE+rBBMD50LZ6djJhpHMP2gKJiF8GdnMG4G+aWRKwwdkGLWDH
         Y1TIkpSEudYoAQyf1HfudI0xIEUR/bow2ZqjAv3oMWEGMUxxq7KKAh9r3aW2ANTXD+ZR
         RaA+o3Z8NYBECVwjq1wQbDLft63Wzdu5YEebp4mpFPe5OiiZ8csNsHwlUiWTR++vod5z
         lPqK+QxJbcjpjJLLD6/LLtSG2GUWj3ECFxAgtr21tYdcxlAx25qTbbqAtHhtlV6iDgI2
         nBE3ZP/kWw/WWFffKcy8KAHB5AD0z7TlMbNRIAQxXgusazHj+2AeWxkDM8vhbSsQcrFP
         qkhQ==
X-Gm-Message-State: AOJu0YwXLCFXPSEF1ZYqT+7m5cq/2cpXa/AU0VDD3m7nXOLGkFl3Gmno
	SUdL0xTXlh23Zx8Df6+/p997/5yIgHmO1BFHCoGYcXVTBdE7/8b+E5OD04s6UikT7JTZbYsutmK
	mIW/S
X-Gm-Gg: ASbGncu0hJlz+F5r7uHH+K3Ag+B1wGd0S7WzqfXnFDdaGlBp6oLQcTrjnXEEzzulwrv
	xTKRrV4/Z2g41CVZNeptdxMgP08upCXRsi6FkYo+bgzkeKYj2bgNBf3reY/dubElWBkpAwYp9p3
	HDbdoiR3yAYxN5+IUsH5JW2A7UBI4+Ditc2f6E8VQAKk/vcps8d6VXNrYxmKuKQQS4iLg87zoYb
	ZsF4Ap0wL6edazgBQwDc49q5L8o1klve69trUinx7hzZbS6RMqh0BxjgRSH5xQxT2mlnzDYKSIh
	w/KIyUvHzI3cIDqEuAd4h1O9CvTmATiMdsSfeZ3NoCWL7kJot3jxElTJSase2tQaImcbcLgsiff
	Y
X-Google-Smtp-Source: AGHT+IEgbUB5OxbY42O0MPSTAaI0bRwcjOZPkIrEdrG+Hk9EtZDYwpk3QV1+IR+72duOmZZMiyuqsQ==
X-Received: by 2002:a05:600c:3b27:b0:450:d00d:d0 with SMTP id 5b1f17b1804b1-450d6515da1mr89049445e9.19.1748845887937;
        Sun, 01 Jun 2025 23:31:27 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4efe73f22sm13524760f8f.43.2025.06.01.23.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 23:31:27 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:31:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
	intel-xe@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v3 09/19] drm/xe/svm: Split system allocator vma incase
 of madvise call
Message-ID: <202505300720.uhAJlLnM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527164003.1068118-10-himal.prasad.ghimiray@intel.com>
Message-ID: <20250602063123.tcAueSdVYjIL3SD6ptNmCw3Vj6I9jUU8JE-8XYODlLQ@z>

Hi Himal,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Himal-Prasad-Ghimiray/Introduce-drm_gpuvm_sm_map_ops_flags-enums-for-sm_map_ops/20250528-041919
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250527164003.1068118-10-himal.prasad.ghimiray%40intel.com
patch subject: [PATCH v3 09/19] drm/xe/svm: Split system allocator vma incase of madvise call
config: loongarch-randconfig-r073-20250529 (https://download.01.org/0day-ci/archive/20250530/202505300720.uhAJlLnM-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505300720.uhAJlLnM-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:4255 xe_vm_alloc_madvise_vma() warn: variable dereferenced before check 'ops' (see line 4194)

vim +/ops +4255 drivers/gpu/drm/xe/xe_vm.c

524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4175  int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4176  {
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4177  	struct xe_vma_ops vops;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4178  	struct drm_gpuva_ops *ops = NULL;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4179  	struct drm_gpuva_op *__op;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4180  	bool is_cpu_addr_mirror = false;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4181  	int err;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4182  
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4183  	vm_dbg(&vm->xe->drm, "MADVISE IN: addr=0x%016llx, size=0x%016llx", start, range);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4184  
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4185  	lockdep_assert_held_write(&vm->lock);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4186  
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4187  	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4188  	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, start, range,
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4189  					  DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE,
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4190  					  NULL, start);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4191  	if (IS_ERR(ops))
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4192  		return PTR_ERR(ops);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4193  
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27 @4194  	if (list_empty(&ops->list)) {
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4195  		err = 0;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4196  		goto free_ops;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4197  	}
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4198  

[ snip ]

524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4252  unwind_ops:
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4253  	vm_bind_ioctl_ops_unwind(vm, &ops, 1);
                                                                                     ^^^^
It might  be nicer to change this...  See below?

524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4254  free_ops:
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27 @4255  	if (ops)
                                                        ^^^^^^^^
This check is unnecessary.

If we applied this diff then it wouldn't look like maybe
vm_bind_ioctl_ops_unwind() frees ops and sets it to NULL?

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5a978da411b0..48723754b0f9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2822,13 +2822,13 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 }
 
 static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
-				     struct drm_gpuva_ops **ops,
+				     struct drm_gpuva_ops *ops,
 				     int num_ops_list)
 {
 	int i;
 
 	for (i = num_ops_list - 1; i >= 0; --i) {
-		struct drm_gpuva_ops *__ops = ops[i];
+		struct drm_gpuva_ops *__ops = &ops[i];
 		struct drm_gpuva_op *__op;
 
 		if (!__ops)
@@ -3703,7 +3703,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 unwind_ops:
 	if (err && err != -ENODATA)
-		vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
+		vm_bind_ioctl_ops_unwind(vm, *ops, args->num_binds);
 	xe_vma_ops_fini(&vops);
 	for (i = args->num_binds - 1; i >= 0; --i)
 		if (ops[i])
@@ -3788,7 +3788,7 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
 
 unwind_ops:
 	if (err && err != -ENODATA)
-		vm_bind_ioctl_ops_unwind(vm, &ops, 1);
+		vm_bind_ioctl_ops_unwind(vm, ops, 1);
 
 	xe_vma_ops_fini(&vops);
 	drm_gpuva_ops_free(&vm->gpuvm, ops);


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

