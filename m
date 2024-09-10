Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6500819259E
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Sep 2024 13:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725975473; cv=none; b=lrtrYIkV+hGXGAsd54v5Dn7mURktscjn6TTIimhzXGo+ZsXhkXlY0xNY3cst3eDKxfJE/Cx/mX9Yg6ph0dTiy1UUbG/2VfpZ4zSlK36/fjmD7bTwWySrQRBGJRTnYmzXRdgByP7Ipbd5UZDN3miA7AnDTDAJHZPcg7IwDaahLNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725975473; c=relaxed/simple;
	bh=dVVYOtj4fttbsGjPYsxHLaRcb/hBWApKBh0TJ7WLCXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=t7h4l2nrIP8ZhKkBmVx45p1fJXvLIK3rAdJuUTtzFkkllKeQ+tdFxECqQGtMHvQwf6698lnpqHbkorZETJO19OsvZKSeGbcgNqfaKFoL7NpiCUtKLWcQiDG0tiYu4AovsYwHjLY1ZH2emqmwpF1AbgYUsTUKHnTMBomL2Z26upA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PXNgvaMm; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PXNgvaMm"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-374c7e64b60so456697f8f.2
        for <oe-kbuild@lists.linux.dev>; Tue, 10 Sep 2024 06:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725975469; x=1726580269; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YUAIO1FnoRnlWsjWCbOgSlRKjX5GupFyFtflTy016is=;
        b=PXNgvaMmjgSmPhrnHFBomao0spr0sFhDgbCFpn/qE0MUs1rVevsS6TLb4aXLTucaNE
         8ipPcIxK8jw0whGIk2ktAPdZMalMUI8qYtnYAhI8sP2oA7zXjDveFYena4h7GbZkbEbW
         Kdsujh/Z+Gja4cwiZ32uFJtpIHHFSPUut8qhyNu40f84xWVa/RQx5x0+7CrxIkvu3sDA
         A8LNWGaWFrsYV+lI2k+hB4+ag9LEIrB0bF/l/G1uShlR3h913TKvOeP6ShkTK8OCddVR
         SUXQqAJToleNLEp1d5BmZOqGdxQANpGEbVFcf3nSDeqAJnwOpnvNYGMdSO+gKOr7Rq9N
         odzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725975469; x=1726580269;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YUAIO1FnoRnlWsjWCbOgSlRKjX5GupFyFtflTy016is=;
        b=MpPrDxmyjlhmDjqYwHznATEX0EzaQBxTP7ZVT3XNgnNFfTiQfbohP1oq0A1kHwpBii
         0h3IRvObicewqbA2D7IGACatxAFY/V1g2/5VJgip8qIWe0LGV155l3Ppeey8GoK3TrMw
         FskV2/DaI05kT2lk9zHJ8c06TKGxztzv93Cspt06uiTXHnFln56gdtFlqvkhCN9wnKUx
         jmruwh1KkmnLb0C3dOkwzBaXezUBhi3E7q2PcwF6v3vYhXeoMjU89nbJngAz/riMs+Pw
         d/enOe/ombQ/0MTLqAGLrF9MWrG4sNo7xnlJPpqvHbbi8lv/IObg4+eFLsn49bPBUQl+
         nwgA==
X-Gm-Message-State: AOJu0Yze70Sm2O+GeMfKrkgsEYCswlGmjRPQbKIUQv1waJF/DbG2ORA6
	3o1tjCSI3ecSCJe87cNQZPJDkm19WL8t194fDKNECqte4UgLR95pZH8SujRphCaoU88VUyVGCY0
	e
X-Google-Smtp-Source: AGHT+IFZAurGcP7RS6kRlVX+Yh54BI3rcFSZZWKcCEf3Ou7t9Byx38yLJvJtBuSMd3ajD1wKab+Z9Q==
X-Received: by 2002:a05:6000:a84:b0:35f:122e:bd8c with SMTP id ffacd0b85a97d-378895ca7fbmr9340223f8f.17.1725975469141;
        Tue, 10 Sep 2024 06:37:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3789564a242sm8943756f8f.22.2024.09.10.06.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 06:37:48 -0700 (PDT)
Date: Tue, 10 Sep 2024 16:37:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Xiao Yang <ice_yangxiao@163.com>,
	Liam.Howlett@oracle.com, linux-mm@kvack.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, ltp@lists.linux.it,
	oliver.sang@intel.com, Xiao Yang <ice_yangxiao@163.com>
Subject: Re: [PATCH] mm/vma: Return the exact errno for __split_vma() and
 mas_store_gfp()
Message-ID: <d30bf8ee-6edc-4bea-adba-8d54ba520b6c@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909050226.2053-1-ice_yangxiao@163.com>

Hi Xiao,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Xiao-Yang/mm-vma-Return-the-exact-errno-for-__split_vma-and-mas_store_gfp/20240909-130325
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240909050226.2053-1-ice_yangxiao%40163.com
patch subject: [PATCH] mm/vma: Return the exact errno for __split_vma() and mas_store_gfp()
config: x86_64-randconfig-161-20240910 (https://download.01.org/0day-ci/archive/20240910/202409102026.LOh8J1Lh-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409102026.LOh8J1Lh-lkp@intel.com/

smatch warnings:
mm/vma.c:1263 vms_gather_munmap_vmas() warn: missing error code 'error'

vim +/error +1263 mm/vma.c

49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1166  /*
dba14840905f9e Liam R. Howlett 2024-08-30  1167   * vms_gather_munmap_vmas() - Put all VMAs within a range into a maple tree
6898c9039bc8e3 Liam R. Howlett 2024-08-30  1168   * for removal at a later date.  Handles splitting first and last if necessary
6898c9039bc8e3 Liam R. Howlett 2024-08-30  1169   * and marking the vmas as isolated.
6898c9039bc8e3 Liam R. Howlett 2024-08-30  1170   *
dba14840905f9e Liam R. Howlett 2024-08-30  1171   * @vms: The vma munmap struct
6898c9039bc8e3 Liam R. Howlett 2024-08-30  1172   * @mas_detach: The maple state tracking the detached tree
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1173   *
6898c9039bc8e3 Liam R. Howlett 2024-08-30  1174   * Return: 0 on success, -EPERM on mseal vmas, -ENOMEM otherwise

This comment needs to be updated.

49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1175   */
9014b230d88d7f Liam R. Howlett 2024-08-30  1176  int vms_gather_munmap_vmas(struct vma_munmap_struct *vms,
dba14840905f9e Liam R. Howlett 2024-08-30  1177  		struct ma_state *mas_detach)
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1178  {
01cf21e9e11957 Liam R. Howlett 2024-08-30  1179  	struct vm_area_struct *next = NULL;
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1180  	int error = -ENOMEM;
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1181  
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1182  	/*
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1183  	 * If we need to split any vma, do it now to save pain later.
20831cd6f814ea Liam R. Howlett 2024-08-30  1184  	 * Does it split the first one?
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1185  	 */
dba14840905f9e Liam R. Howlett 2024-08-30  1186  	if (vms->start > vms->vma->vm_start) {
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1187  
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1188  		/*
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1189  		 * Make sure that map_count on return from munmap() will
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1190  		 * not exceed its limit; but let map_count go just above
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1191  		 * its limit temporarily, to help free resources as expected.
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1192  		 */
dba14840905f9e Liam R. Howlett 2024-08-30  1193  		if (vms->end < vms->vma->vm_end &&
63fc66f5b6b18f Liam R. Howlett 2024-08-30  1194  		    vms->vma->vm_mm->map_count >= sysctl_max_map_count)
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1195  			goto map_count_exceeded;
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1196  
df2a7df9a9aa32 Pedro Falcato   2024-08-17  1197  		/* Don't bother splitting the VMA if we can't unmap it anyway */
dba14840905f9e Liam R. Howlett 2024-08-30  1198  		if (!can_modify_vma(vms->vma)) {
df2a7df9a9aa32 Pedro Falcato   2024-08-17  1199  			error = -EPERM;
df2a7df9a9aa32 Pedro Falcato   2024-08-17  1200  			goto start_split_failed;
df2a7df9a9aa32 Pedro Falcato   2024-08-17  1201  		}
df2a7df9a9aa32 Pedro Falcato   2024-08-17  1202  
013545e1b9bca0 Xiao Yang       2024-09-09  1203  		error = __split_vma(vms->vmi, vms->vma, vms->start, 1);
013545e1b9bca0 Xiao Yang       2024-09-09  1204  		if (error)
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1205  			goto start_split_failed;
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1206  	}
17f1ae9b40c6b0 Liam R. Howlett 2024-08-30  1207  	vms->prev = vma_prev(vms->vmi);
9c3ebeda8fb5a8 Liam R. Howlett 2024-08-30  1208  	if (vms->prev)
9c3ebeda8fb5a8 Liam R. Howlett 2024-08-30  1209  		vms->unmap_start = vms->prev->vm_end;
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1210  
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1211  	/*
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1212  	 * Detach a range of VMAs from the mm. Using next as a temp variable as
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1213  	 * it is always overwritten.
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1214  	 */
17f1ae9b40c6b0 Liam R. Howlett 2024-08-30  1215  	for_each_vma_range(*(vms->vmi), next, vms->end) {
17f1ae9b40c6b0 Liam R. Howlett 2024-08-30  1216  		long nrpages;
17f1ae9b40c6b0 Liam R. Howlett 2024-08-30  1217  
df2a7df9a9aa32 Pedro Falcato   2024-08-17  1218  		if (!can_modify_vma(next)) {
df2a7df9a9aa32 Pedro Falcato   2024-08-17  1219  			error = -EPERM;
df2a7df9a9aa32 Pedro Falcato   2024-08-17  1220  			goto modify_vma_failed;
df2a7df9a9aa32 Pedro Falcato   2024-08-17  1221  		}
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1222  		/* Does it split the end? */
dba14840905f9e Liam R. Howlett 2024-08-30  1223  		if (next->vm_end > vms->end) {
013545e1b9bca0 Xiao Yang       2024-09-09  1224  			error = __split_vma(vms->vmi, next, vms->end, 0);
013545e1b9bca0 Xiao Yang       2024-09-09  1225  			if (error)
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1226  				goto end_split_failed;
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1227  		}
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1228  		vma_start_write(next);
dba14840905f9e Liam R. Howlett 2024-08-30  1229  		mas_set(mas_detach, vms->vma_count++);
013545e1b9bca0 Xiao Yang       2024-09-09  1230  		error = mas_store_gfp(mas_detach, next, GFP_KERNEL);
013545e1b9bca0 Xiao Yang       2024-09-09  1231  		if (error)
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1232  			goto munmap_gather_failed;
6898c9039bc8e3 Liam R. Howlett 2024-08-30  1233  
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1234  		vma_mark_detached(next, true);
17f1ae9b40c6b0 Liam R. Howlett 2024-08-30  1235  		nrpages = vma_pages(next);
17f1ae9b40c6b0 Liam R. Howlett 2024-08-30  1236  
17f1ae9b40c6b0 Liam R. Howlett 2024-08-30  1237  		vms->nr_pages += nrpages;
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1238  		if (next->vm_flags & VM_LOCKED)
17f1ae9b40c6b0 Liam R. Howlett 2024-08-30  1239  			vms->locked_vm += nrpages;
17f1ae9b40c6b0 Liam R. Howlett 2024-08-30  1240  
17f1ae9b40c6b0 Liam R. Howlett 2024-08-30  1241  		if (next->vm_flags & VM_ACCOUNT)
17f1ae9b40c6b0 Liam R. Howlett 2024-08-30  1242  			vms->nr_accounted += nrpages;
17f1ae9b40c6b0 Liam R. Howlett 2024-08-30  1243  
17f1ae9b40c6b0 Liam R. Howlett 2024-08-30  1244  		if (is_exec_mapping(next->vm_flags))
17f1ae9b40c6b0 Liam R. Howlett 2024-08-30  1245  			vms->exec_vm += nrpages;
17f1ae9b40c6b0 Liam R. Howlett 2024-08-30  1246  		else if (is_stack_mapping(next->vm_flags))
17f1ae9b40c6b0 Liam R. Howlett 2024-08-30  1247  			vms->stack_vm += nrpages;
17f1ae9b40c6b0 Liam R. Howlett 2024-08-30  1248  		else if (is_data_mapping(next->vm_flags))
17f1ae9b40c6b0 Liam R. Howlett 2024-08-30  1249  			vms->data_vm += nrpages;
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1250  
dba14840905f9e Liam R. Howlett 2024-08-30  1251  		if (unlikely(vms->uf)) {
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1252  			/*
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1253  			 * If userfaultfd_unmap_prep returns an error the vmas
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1254  			 * will remain split, but userland will get a
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1255  			 * highly unexpected error anyway. This is no
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1256  			 * different than the case where the first of the two
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1257  			 * __split_vma fails, but we don't undo the first
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1258  			 * split, despite we could. This is unlikely enough
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1259  			 * failure that it's not worth optimizing it for.
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1260  			 */
dba14840905f9e Liam R. Howlett 2024-08-30  1261  			if (userfaultfd_unmap_prep(next, vms->start, vms->end,
dba14840905f9e Liam R. Howlett 2024-08-30  1262  						   vms->uf))
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29 @1263  				goto userfaultfd_error;

Needs an "error = -ENOMEM;" here.  I haven't reviewed this function outside of
what the zero day bot puts into this email.

49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1264  		}
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1265  #ifdef CONFIG_DEBUG_VM_MAPLE_TREE
dba14840905f9e Liam R. Howlett 2024-08-30  1266  		BUG_ON(next->vm_start < vms->start);
dba14840905f9e Liam R. Howlett 2024-08-30  1267  		BUG_ON(next->vm_start > vms->end);
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1268  #endif
17f1ae9b40c6b0 Liam R. Howlett 2024-08-30  1269  	}
17f1ae9b40c6b0 Liam R. Howlett 2024-08-30  1270  
17f1ae9b40c6b0 Liam R. Howlett 2024-08-30  1271  	vms->next = vma_next(vms->vmi);
9c3ebeda8fb5a8 Liam R. Howlett 2024-08-30  1272  	if (vms->next)
9c3ebeda8fb5a8 Liam R. Howlett 2024-08-30  1273  		vms->unmap_end = vms->next->vm_start;
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1274  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

