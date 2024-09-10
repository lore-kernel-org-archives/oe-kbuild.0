Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23179191F94
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Sep 2024 13:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725974864; cv=none; b=d3xDYgxGxxiMpthLGU6bPAYaQaJ53xmHUt2TGAnV8cjMrHT7LnTdv6YShcUlgHAo7YAVCmRbtzTjLZGP/o6+IQRG6b0bJw2uPne7Y1x8uP08kElHYyrG9RQ9j/mxNMN2WSpcyEWorC1hNwT9PV+X5rJ4Fq6KrS2rwZJeiiQnlBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725974864; c=relaxed/simple;
	bh=hSsEcx+nWhJWllnzCLQjfmiWLvyv30aaVxtmtIj/NOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L6jZhTmUQzydWv2Rpsqc1AoeglEJ2c2dMXZkU5OWU/nBsZauT2uGHUA3plBohmbwsh1AwkJdOIDmk9EusV55YWSFJbGkMjdHaCb51pKOhdad91PmDvOsCf3fwbavHGRSOo6kTjQ/XvIzpUY1n2b57ivqLva8PDaRdA0/x3QrxHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fNHSvNHd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fNHSvNHd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725974862; x=1757510862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hSsEcx+nWhJWllnzCLQjfmiWLvyv30aaVxtmtIj/NOI=;
  b=fNHSvNHdew4Vc9NWik7IgTzNGvisz5Nxx7pvQo2NqkDkUVhp74mGkj0J
   hgK0BUBMhFJHs2pZcwbGnmeQfKp1hEgj3Y+OFMe/hts/vc/7gRG+0Q8+m
   GH+2F3VLH0Hj7h1R9/mTScqv0QfuKNPPtXUfzV8zMCzBP6qR62hzUi29b
   omZAxw+zd7Vxd81EPew5H9WEhL2cDUxwUzfk5hWCMNhGmJapnfc841rDK
   a9vyQtDh+QoIOEo75sB91pXE7D4cfQnexEbBlgf7+YqfYp7qAE0yoVZqj
   nXMAJyqX4CSzPC4XqJSJvBcdapD0ZUsm1afRXFK3xAwh91eFPKtE9pR66
   g==;
X-CSE-ConnectionGUID: epTPhcq+RpOenkWl28rX8g==
X-CSE-MsgGUID: 7OZXQKcvSzijQpUumguBHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35858793"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="35858793"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 06:27:42 -0700
X-CSE-ConnectionGUID: JvP7z8b/RCSWc3AxOCkqiA==
X-CSE-MsgGUID: CTEjM1A2THiDh25iaWIT4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="67079151"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Sep 2024 06:27:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1so0uA-000280-0N;
	Tue, 10 Sep 2024 13:27:38 +0000
Date: Tue, 10 Sep 2024 21:27:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] mm/vma: Return the exact errno for __split_vma() and
 mas_store_gfp()
Message-ID: <202409102026.LOh8J1Lh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240909050226.2053-1-ice_yangxiao@163.com>
References: <20240909050226.2053-1-ice_yangxiao@163.com>
TO: Xiao Yang <ice_yangxiao@163.com>
TO: Liam.Howlett@Oracle.com
TO: linux-mm@kvack.org
CC: linux-kernel@vger.kernel.org
CC: ltp@lists.linux.it
CC: oliver.sang@intel.com
CC: Xiao Yang <ice_yangxiao@163.com>

Hi Xiao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiao-Yang/mm-vma-Return-the-exact-errno-for-__split_vma-and-mas_store_gfp/20240909-130325
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240909050226.2053-1-ice_yangxiao%40163.com
patch subject: [PATCH] mm/vma: Return the exact errno for __split_vma() and mas_store_gfp()
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: x86_64-randconfig-161-20240910 (https://download.01.org/0day-ci/archive/20240910/202409102026.LOh8J1Lh-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409102026.LOh8J1Lh-lkp@intel.com/

smatch warnings:
mm/vma.c:1263 vms_gather_munmap_vmas() warn: missing error code 'error'

vim +/error +1263 mm/vma.c

01cf21e9e11957 Liam R. Howlett 2024-08-30  1165  
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1166  /*
dba14840905f9e Liam R. Howlett 2024-08-30  1167   * vms_gather_munmap_vmas() - Put all VMAs within a range into a maple tree
6898c9039bc8e3 Liam R. Howlett 2024-08-30  1168   * for removal at a later date.  Handles splitting first and last if necessary
6898c9039bc8e3 Liam R. Howlett 2024-08-30  1169   * and marking the vmas as isolated.
6898c9039bc8e3 Liam R. Howlett 2024-08-30  1170   *
dba14840905f9e Liam R. Howlett 2024-08-30  1171   * @vms: The vma munmap struct
6898c9039bc8e3 Liam R. Howlett 2024-08-30  1172   * @mas_detach: The maple state tracking the detached tree
49b1b8d6f68310 Lorenzo Stoakes 2024-07-29  1173   *
6898c9039bc8e3 Liam R. Howlett 2024-08-30  1174   * Return: 0 on success, -EPERM on mseal vmas, -ENOMEM otherwise
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
