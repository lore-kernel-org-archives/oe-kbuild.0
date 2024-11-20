Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6561E515
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Nov 2024 18:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732126228; cv=none; b=bqXU4CQFaVphyDz2rAVUqqKQ1H6MTKbAPSEP+3xh2iFNNAlsInimS5JG1lTfuI3x+nNj7P+11xkpJJHoMD7lajTHrg9NboIs7Za1MDcE9txqEpT7ESH2MePrzk49lbnqjOzK6QBnezYW4Z6bFgohHKVXhGfTyVDxS2tiSMg/ekg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732126228; c=relaxed/simple;
	bh=YfZU+ktSRpSCQfBrXKP7RQHWvWkiXVeFfgW7j5cdfOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CHtzPdAR4MjlDM+IElKJz5szRdkWgn1eGKvwGuC7BxhuzEbWnub+RC1K13RsbnMUFw/zYqtdwBSxDsB+u5s6LtxZfJoUSVgCIzTBTjFih4IIewELOsdDqJacq0RQkWgkbz0v9XAgTD486Q5A0pdKuNIvjnSAjmy5/cohHqqxQfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EWX1qAXg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EWX1qAXg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732126226; x=1763662226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YfZU+ktSRpSCQfBrXKP7RQHWvWkiXVeFfgW7j5cdfOA=;
  b=EWX1qAXgdm0YYYUTv/s0ih31bbiLm3L/+PvaUQ/XJsZa5HASKtjR2rzu
   ZOCeE4MCzQbZ0H3omRm3bo9c0KPmSC2zpRr7EiaeXAGUe7BxhOre2M1KD
   QYoOLKJsGg6G6wgN88QY5xExWtFkl9pvq6PxFSLjJyKMpzrwnrRFi5Evn
   BI65ltDDV6NlSlooBhY404ZGnV3liGnlAdlknSDSJJ3HN3ADpGdJjq12T
   yaskYijpiGYWv1mOsEQeVLdWo5jjBfr73MquKPLUL3w+QJh8jAgq50AGQ
   lUCDEWE9lSVIMK1105HAg4+xw/XZbdBCbanDr+bYFeVSaFaZkd8a4Zgxi
   w==;
X-CSE-ConnectionGUID: uOWxhFxKSsKf68YTK10Xmg==
X-CSE-MsgGUID: B8IZHyGXQQWE8Q+OKjHi6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="43273663"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="43273663"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 10:10:23 -0800
X-CSE-ConnectionGUID: YU+k4C9hR625B9uFlBh8KQ==
X-CSE-MsgGUID: cd06Zr9VSyuPS/phrZTWkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="95061483"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Nov 2024 10:10:21 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDp9e-000152-27;
	Wed, 20 Nov 2024 18:10:18 +0000
Date: Thu, 21 Nov 2024 02:10:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/proc/task_mmu.c:467 do_procmap_query() warn: comparison of a
 potentially tagged address (do_procmap_query, -2, usize)
Message-ID: <202411210252.5UK5fy4Z-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Andrii Nakryiko <andrii@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Andrii,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bf9aa14fc523d2763fc9a10672a709224e8fcaf4
commit: bfc69fd05ef9b6416f4811aafafb7f2b34daa000 fs/procfs: add build ID fetching to PROCMAP_QUERY API
date:   4 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-r073-20241119 (https://download.01.org/0day-ci/archive/20241121/202411210252.5UK5fy4Z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411210252.5UK5fy4Z-lkp@intel.com/

New smatch warnings:
fs/proc/task_mmu.c:467 do_procmap_query() warn: comparison of a potentially tagged address (do_procmap_query, -2, usize)

Old smatch warnings:
fs/proc/task_mmu.c:2675 pagemap_scan_get_args() warn: potential user controlled sizeof overflow 'arg->vec_len * 24' '0-u64max * 24'

vim +467 fs/proc/task_mmu.c

ed5d583a88a9207 Andrii Nakryiko 2024-06-27  453  
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  454  static int do_procmap_query(struct proc_maps_private *priv, void __user *uarg)
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  455  {
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  456  	struct procmap_query karg;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  457  	struct vm_area_struct *vma;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  458  	struct mm_struct *mm;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  459  	const char *name = NULL;
bfc69fd05ef9b64 Andrii Nakryiko 2024-06-27  460  	char build_id_buf[BUILD_ID_SIZE_MAX], *name_buf = NULL;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  461  	__u64 usize;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  462  	int err;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  463  
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  464  	if (copy_from_user(&usize, (void __user *)uarg, sizeof(usize)))
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  465  		return -EFAULT;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  466  	/* argument struct can never be that large, reject abuse */
ed5d583a88a9207 Andrii Nakryiko 2024-06-27 @467  	if (usize > PAGE_SIZE)
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  468  		return -E2BIG;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  469  	/* argument struct should have at least query_flags and query_addr fields */
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  470  	if (usize < offsetofend(struct procmap_query, query_addr))
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  471  		return -EINVAL;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  472  	err = copy_struct_from_user(&karg, sizeof(karg), uarg, usize);
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  473  	if (err)
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  474  		return err;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  475  
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  476  	/* reject unknown flags */
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  477  	if (karg.query_flags & ~PROCMAP_QUERY_VALID_FLAGS_MASK)
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  478  		return -EINVAL;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  479  	/* either both buffer address and size are set, or both should be zero */
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  480  	if (!!karg.vma_name_size != !!karg.vma_name_addr)
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  481  		return -EINVAL;
bfc69fd05ef9b64 Andrii Nakryiko 2024-06-27  482  	if (!!karg.build_id_size != !!karg.build_id_addr)
bfc69fd05ef9b64 Andrii Nakryiko 2024-06-27  483  		return -EINVAL;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  484  
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  485  	mm = priv->mm;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  486  	if (!mm || !mmget_not_zero(mm))
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  487  		return -ESRCH;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  488  
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  489  	err = query_vma_setup(mm);
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  490  	if (err) {
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  491  		mmput(mm);
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  492  		return err;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  493  	}
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  494  
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  495  	vma = query_matching_vma(mm, karg.query_addr, karg.query_flags);
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  496  	if (IS_ERR(vma)) {
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  497  		err = PTR_ERR(vma);
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  498  		vma = NULL;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  499  		goto out;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  500  	}
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  501  
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  502  	karg.vma_start = vma->vm_start;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  503  	karg.vma_end = vma->vm_end;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  504  
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  505  	karg.vma_flags = 0;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  506  	if (vma->vm_flags & VM_READ)
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  507  		karg.vma_flags |= PROCMAP_QUERY_VMA_READABLE;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  508  	if (vma->vm_flags & VM_WRITE)
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  509  		karg.vma_flags |= PROCMAP_QUERY_VMA_WRITABLE;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  510  	if (vma->vm_flags & VM_EXEC)
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  511  		karg.vma_flags |= PROCMAP_QUERY_VMA_EXECUTABLE;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  512  	if (vma->vm_flags & VM_MAYSHARE)
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  513  		karg.vma_flags |= PROCMAP_QUERY_VMA_SHARED;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  514  
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  515  	karg.vma_page_size = vma_kernel_pagesize(vma);
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  516  
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  517  	if (vma->vm_file) {
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  518  		const struct inode *inode = file_user_inode(vma->vm_file);
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  519  
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  520  		karg.vma_offset = ((__u64)vma->vm_pgoff) << PAGE_SHIFT;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  521  		karg.dev_major = MAJOR(inode->i_sb->s_dev);
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  522  		karg.dev_minor = MINOR(inode->i_sb->s_dev);
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  523  		karg.inode = inode->i_ino;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  524  	} else {
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  525  		karg.vma_offset = 0;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  526  		karg.dev_major = 0;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  527  		karg.dev_minor = 0;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  528  		karg.inode = 0;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  529  	}
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  530  
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  531  	if (karg.build_id_size) {
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  532  		__u32 build_id_sz;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  533  
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  534  		err = build_id_parse(vma, build_id_buf, &build_id_sz);
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  535  		if (err) {
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  536  			karg.build_id_size = 0;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  537  		} else {
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  538  			if (karg.build_id_size < build_id_sz) {
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  539  				err = -ENAMETOOLONG;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  540  				goto out;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  541  			}
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  542  			karg.build_id_size = build_id_sz;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  543  		}
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  544  	}
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  545  
bfc69fd05ef9b64 Andrii Nakryiko 2024-06-27  546  	if (karg.build_id_size) {
bfc69fd05ef9b64 Andrii Nakryiko 2024-06-27  547  		__u32 build_id_sz;
bfc69fd05ef9b64 Andrii Nakryiko 2024-06-27  548  
bfc69fd05ef9b64 Andrii Nakryiko 2024-06-27  549  		err = build_id_parse(vma, build_id_buf, &build_id_sz);
bfc69fd05ef9b64 Andrii Nakryiko 2024-06-27  550  		if (err) {
bfc69fd05ef9b64 Andrii Nakryiko 2024-06-27  551  			karg.build_id_size = 0;
bfc69fd05ef9b64 Andrii Nakryiko 2024-06-27  552  		} else {
bfc69fd05ef9b64 Andrii Nakryiko 2024-06-27  553  			if (karg.build_id_size < build_id_sz) {
bfc69fd05ef9b64 Andrii Nakryiko 2024-06-27  554  				err = -ENAMETOOLONG;
bfc69fd05ef9b64 Andrii Nakryiko 2024-06-27  555  				goto out;
bfc69fd05ef9b64 Andrii Nakryiko 2024-06-27  556  			}
bfc69fd05ef9b64 Andrii Nakryiko 2024-06-27  557  			karg.build_id_size = build_id_sz;
bfc69fd05ef9b64 Andrii Nakryiko 2024-06-27  558  		}
bfc69fd05ef9b64 Andrii Nakryiko 2024-06-27  559  	}
bfc69fd05ef9b64 Andrii Nakryiko 2024-06-27  560  
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  561  	if (karg.vma_name_size) {
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  562  		size_t name_buf_sz = min_t(size_t, PATH_MAX, karg.vma_name_size);
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  563  		const struct path *path;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  564  		const char *name_fmt;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  565  		size_t name_sz = 0;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  566  
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  567  		get_vma_name(vma, &path, &name, &name_fmt);
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  568  
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  569  		if (path || name_fmt || name) {
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  570  			name_buf = kmalloc(name_buf_sz, GFP_KERNEL);
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  571  			if (!name_buf) {
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  572  				err = -ENOMEM;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  573  				goto out;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  574  			}
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  575  		}
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  576  		if (path) {
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  577  			name = d_path(path, name_buf, name_buf_sz);
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  578  			if (IS_ERR(name)) {
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  579  				err = PTR_ERR(name);
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  580  				goto out;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  581  			}
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  582  			name_sz = name_buf + name_buf_sz - name;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  583  		} else if (name || name_fmt) {
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  584  			name_sz = 1 + snprintf(name_buf, name_buf_sz, name_fmt ?: "%s", name);
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  585  			name = name_buf;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  586  		}
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  587  		if (name_sz > name_buf_sz) {
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  588  			err = -ENAMETOOLONG;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  589  			goto out;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  590  		}
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  591  		karg.vma_name_size = name_sz;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  592  	}
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  593  
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  594  	/* unlock vma or mmap_lock, and put mm_struct before copying data to user */
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  595  	query_vma_teardown(mm, vma);
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  596  	mmput(mm);
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  597  
bfc69fd05ef9b64 Andrii Nakryiko 2024-06-27  598  	if (karg.vma_name_size && copy_to_user(u64_to_user_ptr(karg.vma_name_addr),
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  599  					       name, karg.vma_name_size)) {
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  600  		kfree(name_buf);
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  601  		return -EFAULT;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  602  	}
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  603  	kfree(name_buf);
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  604  
bfc69fd05ef9b64 Andrii Nakryiko 2024-06-27  605  	if (karg.build_id_size && copy_to_user(u64_to_user_ptr(karg.build_id_addr),
bfc69fd05ef9b64 Andrii Nakryiko 2024-06-27  606  					       build_id_buf, karg.build_id_size))
bfc69fd05ef9b64 Andrii Nakryiko 2024-06-27  607  		return -EFAULT;
bfc69fd05ef9b64 Andrii Nakryiko 2024-06-27  608  
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  609  	if (copy_to_user(uarg, &karg, min_t(size_t, sizeof(karg), usize)))
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  610  		return -EFAULT;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  611  
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  612  	return 0;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  613  
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  614  out:
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  615  	query_vma_teardown(mm, vma);
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  616  	mmput(mm);
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  617  	kfree(name_buf);
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  618  	return err;
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  619  }
ed5d583a88a9207 Andrii Nakryiko 2024-06-27  620  

:::::: The code at line 467 was first introduced by commit
:::::: ed5d583a88a9207b866c14ba834984c6f3c51d23 fs/procfs: implement efficient VMA querying API for /proc/<pid>/maps

:::::: TO: Andrii Nakryiko <andrii@kernel.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
