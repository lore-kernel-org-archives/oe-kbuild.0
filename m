Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB67C15CD74
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Jun 2025 06:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748845164; cv=none; b=DxSgENZWOfgIfshqHN/QwGjdx5yV4wH9rqbaWRMAQ4KN+TEL7HXbo4pp1QlkoDFcR8BgCyJJQpR8t8SIvSrtaCBH5Z45YO6fIxFCmkt7KaJ5u/5Pm8Bv9LzLVsZKV7WJZqSL3b4Py/XGk5VmdS2vYXog+E0HuzZ6N0ghQ0KprlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748845164; c=relaxed/simple;
	bh=QggsHgHkUag4So3rlNz1hcGGCe1PT1E4Sbu/zKURssU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=IFbT5j9LD1eTVvsULcDQ6cU84lCTZP3czFvx0eHmiXkRlGcXFM30rCvo8puDQH6l6u1Xigg6NMuz5NqqT4d+HhUZodOCNzmmxmvjwIK19xchfIm+SXKbxYsSHidocZ9sD0dZ9v6dRghKwDwNO6BZLrznWthtGDo7QF4JqNf/5ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iLLfCXXI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iLLfCXXI"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451d54214adso8151545e9.3
        for <oe-kbuild@lists.linux.dev>; Sun, 01 Jun 2025 23:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748845160; x=1749449960; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IT5vqvwOspSDiBmBFrL1UB2oNCzpkkPcbBj98IhrcSA=;
        b=iLLfCXXIQdLjtEQYiMZPd1hLTAJex8ZG4yjRCJSKGD+yPKTnXOIcakGloETzw3xabW
         fGmxQWErfjnQxS/GIB2xJfhIwAVaeElBXaThzfv1lDCKwxRxOw07mcQkgZ4ZfObWAwH3
         HxNA62vclg9W3nEzkptDzWoA3MSXj943EO/EOLoBK6nOU8vI9U2jI3GbLLfLhn3ym/3k
         nsAAeRC214TAk7NEiXUOR2pbyFzY3zfwOg5G9GYuuXgAEiHIWXx6BdYqN4HOHfh87KTA
         qv/A4mf9NiUGbjjO+y/CM+qYxTHThyF297w7lvPFOS1gk3GBrmWyjoaC2KbkhGQaJXQj
         RW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748845160; x=1749449960;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IT5vqvwOspSDiBmBFrL1UB2oNCzpkkPcbBj98IhrcSA=;
        b=MiUIqL5zq5P0Fu053xLHy/gV0dibDdr4E4nw5lOU6fUMnqY1taOP5IdbAyjHjwhljb
         DjXbwpx86LmQjgi/ihfiCttiIQVRbH45WQA0XMfYHwAwLRq6KlYwbMH6/mbKP6SD48cx
         p+mA+uNos64RPPdEwYgpgE5uGlh+OSlxM3cXGjus8RSzDn1MHi7csT7HcKOANyxv9lVo
         29orVM3PXd4yyeEwZdISZgMmC2ley++FMsKgnTM2bqz/pU7yfpLkMQ9GSgGwQo9KwFYR
         kEKH4dDDCMrYGJqZ6kcVvU+MNBQz8BK6ZntLS7HhrVk9G8S17scBJP0MtUtJSWKvun5E
         w6mQ==
X-Gm-Message-State: AOJu0YzLhTJJUP6IPWcVx7Yyi+2iXv9Lkj8TezMJCe3X+RE0hjKNEJe6
	6xW/pFlkVGiWblOLIz1ljNvAwIi2kOgEfrKsBnF3u1r7b9u8IFtuOnu9WgFZyZMUqBScfNOz1ZS
	n5Ymt
X-Gm-Gg: ASbGncuk+oq+z8gEdLScly9LvlBPkoQ8jeUHFZDO9OTwnGA1PqHgE4juAri+lE3M3yK
	X04X5IIFSfeRw/begYnl9aZdEBYgusYWH5jH97WVVATndqQ42T2TdhbHGF1p5x32l4P5c61lQYr
	MFiac5MEF2K8eJjySEffm99m3Lu35+69gt5eK+//zsqg1Ne3JX5GZHMqye0BwTEKIvGOJeVPUzB
	Th/r8XcvqwN81TW4/MYbBOp4EgHrfvX3AHoqmip/PScgKacJV2i30y6Po0vFLjVrb85CO6M7sAz
	J1fdYIS7fwVTB8H/cNMQldUQUjjyC1JAnP508x9oBPIB+/mNRKLZK4w=
X-Google-Smtp-Source: AGHT+IFUJ26+dlg55xw3hspSgcyX/wWZSVOWg45+KpmdVFhcuhM9vFylL6S1uqLEhcd1ZwyWpfYFCg==
X-Received: by 2002:a05:600c:4688:b0:44a:ac77:26d5 with SMTP id 5b1f17b1804b1-450d64fedb2mr112371855e9.14.1748845160283;
        Sun, 01 Jun 2025 23:19:20 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4f00972c1sm13837801f8f.68.2025.06.01.23.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 23:19:19 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:19:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
	intel-xe@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v3 05/19] drm/xe/vma: Modify new_vma to accept struct
 xe_vma_mem_attr as parameter
Message-ID: <202505300251.vkfxetWu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250527164003.1068118-6-himal.prasad.ghimiray@intel.com>
Message-ID: <20250602061915.Aq0WC300VFMNJj0ZTxGIHg-L2zNa68_hPFCgkPM9a4c@z>

Hi Himal,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Himal-Prasad-Ghimiray/Introduce-drm_gpuvm_sm_map_ops_flags-enums-for-sm_map_ops/20250528-041919
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250527164003.1068118-6-himal.prasad.ghimiray%40intel.com
patch subject: [PATCH v3 05/19] drm/xe/vma: Modify new_vma to accept struct xe_vma_mem_attr as parameter
config: loongarch-randconfig-r073-20250529 (https://download.01.org/0day-ci/archive/20250530/202505300251.vkfxetWu-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505300251.vkfxetWu-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:2492 new_vma() error: 'vma' dereferencing possible ERR_PTR()

vim +/vma +2492 drivers/gpu/drm/xe/xe_vm.c

b06d47be7c83165 Matthew Brost         2023-07-07  2444  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
341ac2942dd2087 Himal Prasad Ghimiray 2025-05-27  2445  			      struct xe_vma_mem_attr attr, unsigned int flags)
b06d47be7c83165 Matthew Brost         2023-07-07  2446  {
b06d47be7c83165 Matthew Brost         2023-07-07  2447  	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
24f947d58fe554c Thomas Hellström      2023-12-12  2448  	struct drm_exec exec;
b06d47be7c83165 Matthew Brost         2023-07-07  2449  	struct xe_vma *vma;
33991ae8f40a824 Matthew Brost         2024-06-17  2450  	int err = 0;
b06d47be7c83165 Matthew Brost         2023-07-07  2451  
b06d47be7c83165 Matthew Brost         2023-07-07  2452  	lockdep_assert_held_write(&vm->lock);
b06d47be7c83165 Matthew Brost         2023-07-07  2453  
b06d47be7c83165 Matthew Brost         2023-07-07  2454  	if (bo) {
d2197029026021e Dave Airlie           2023-12-22  2455  		drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
24f947d58fe554c Thomas Hellström      2023-12-12  2456  		drm_exec_until_all_locked(&exec) {
24f947d58fe554c Thomas Hellström      2023-12-12  2457  			err = 0;
24f947d58fe554c Thomas Hellström      2023-12-12  2458  			if (!bo->vm) {
24f947d58fe554c Thomas Hellström      2023-12-12  2459  				err = drm_exec_lock_obj(&exec, xe_vm_obj(vm));
24f947d58fe554c Thomas Hellström      2023-12-12  2460  				drm_exec_retry_on_contention(&exec);
24f947d58fe554c Thomas Hellström      2023-12-12  2461  			}
24f947d58fe554c Thomas Hellström      2023-12-12  2462  			if (!err) {
24f947d58fe554c Thomas Hellström      2023-12-12  2463  				err = drm_exec_lock_obj(&exec, &bo->ttm.base);
24f947d58fe554c Thomas Hellström      2023-12-12  2464  				drm_exec_retry_on_contention(&exec);
24f947d58fe554c Thomas Hellström      2023-12-12  2465  			}
24f947d58fe554c Thomas Hellström      2023-12-12  2466  			if (err) {
24f947d58fe554c Thomas Hellström      2023-12-12  2467  				drm_exec_fini(&exec);
b06d47be7c83165 Matthew Brost         2023-07-07  2468  				return ERR_PTR(err);
dd08ebf6c3525a7 Matthew Brost         2023-03-30  2469  			}
24f947d58fe554c Thomas Hellström      2023-12-12  2470  		}
24f947d58fe554c Thomas Hellström      2023-12-12  2471  	}
b06d47be7c83165 Matthew Brost         2023-07-07  2472  	vma = xe_vma_create(vm, bo, op->gem.offset,
b06d47be7c83165 Matthew Brost         2023-07-07  2473  			    op->va.addr, op->va.addr +
341ac2942dd2087 Himal Prasad Ghimiray 2025-05-27  2474  			    op->va.range - 1, attr.pat_index, flags);
33991ae8f40a824 Matthew Brost         2024-06-17  2475  	if (IS_ERR(vma))
33991ae8f40a824 Matthew Brost         2024-06-17  2476  		goto err_unlock;

Missing "err = PTR_ERR(vma);"

dd08ebf6c3525a7 Matthew Brost         2023-03-30  2477  
33991ae8f40a824 Matthew Brost         2024-06-17  2478  	if (xe_vma_is_userptr(vma))
5bd24e78829ad56 Thomas Hellström      2024-01-31  2479  		err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
33991ae8f40a824 Matthew Brost         2024-06-17  2480  	else if (!xe_vma_has_no_bo(vma) && !bo->vm)
b06d47be7c83165 Matthew Brost         2023-07-07  2481  		err = add_preempt_fences(vm, bo);
33991ae8f40a824 Matthew Brost         2024-06-17  2482  
33991ae8f40a824 Matthew Brost         2024-06-17  2483  err_unlock:
33991ae8f40a824 Matthew Brost         2024-06-17  2484  	if (bo)
33991ae8f40a824 Matthew Brost         2024-06-17  2485  		drm_exec_fini(&exec);
33991ae8f40a824 Matthew Brost         2024-06-17  2486  
b06d47be7c83165 Matthew Brost         2023-07-07  2487  	if (err) {
b06d47be7c83165 Matthew Brost         2023-07-07  2488  		prep_vma_destroy(vm, vma, false);
b06d47be7c83165 Matthew Brost         2023-07-07  2489  		xe_vma_destroy_unlocked(vma);
33991ae8f40a824 Matthew Brost         2024-06-17  2490  		vma = ERR_PTR(err);
341ac2942dd2087 Himal Prasad Ghimiray 2025-05-27  2491  	} else {
341ac2942dd2087 Himal Prasad Ghimiray 2025-05-27 @2492  		cp_vma_mem_attr(&vma->attr, &attr);
                                                                                        ^^^^
leads to error pointer dereference.

dd08ebf6c3525a7 Matthew Brost         2023-03-30  2493  	}
dd08ebf6c3525a7 Matthew Brost         2023-03-30  2494  
b06d47be7c83165 Matthew Brost         2023-07-07  2495  	return vma;

I was wondering why Smatch doesn't catch the missing error code but
actually we return the error code...  #ABitConfusing

b06d47be7c83165 Matthew Brost         2023-07-07  2496  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

