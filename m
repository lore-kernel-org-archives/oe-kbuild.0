Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D3113172C
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Feb 2024 13:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708608223; cv=none; b=lLFBnGTVJdFhn1j/O3SUh38wXz4/FcAgtKokh0MtweYDfWI+C9B3kH+qPTNsDEB7uUs2cgHyAKuY8/Sbmp58o8P+UOjDpGiwuqyJ0EafeDFN4CLGFwDf47ASKhopRlq43IxMqm6qcJUzpk8QxNEBTmIv9HzZnahzSSSKUIBXdQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708608223; c=relaxed/simple;
	bh=27uLl9YSdrdMX7K6pgoZ+9EOHrrjjcyvYjf0+6TTnQU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ablsSDa1+500YLGRpcr4GpN0o9J3A2B+UB68av33UWc5BE7BjMbC1f59quRNMBIDOXHxkNlpmxJEyhXLRB/m/5HNKNR4PixpFdHUf9y+kjek7dLwYSJuJF8QjfECHPaIF+1nKFVUQD/x5t7jSH2e8sOuaj19ORFZMyp01NL45hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E0Eq0ZUe; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0Eq0ZUe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708608220; x=1740144220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=27uLl9YSdrdMX7K6pgoZ+9EOHrrjjcyvYjf0+6TTnQU=;
  b=E0Eq0ZUeEamxqO2eIQGYQyiXBqdwkzHqhtnEjIew6PyyK1bVdKnE7cYu
   DblIIwMTHH9YDQPKz2WgH83fxqJTzGamB1pZ2D8wfY/XQ7RhLzEADE6Oy
   Lbd3/W/ZInsd+gr6Nijs7TiWzXGwQGik4OdHaCh66XY9Ybbr4tgnESCj5
   /lzuVNUu5OpRtoiPEfJutC1P+byxaXoFD1zfDK/yW5OWmoqqo2urxx48O
   mn7w/tsLTutUVfkrA9CDQcSvL9TB2Oz+P7EVIWeOrluHsG8Ry37JW+eMN
   l2f5+N9EpKRgH1ruAFc+yu73BE8aQ5cEB5bjwtnWT+SGKucHBsWMs1puJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2703160"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="2703160"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 05:23:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="936849536"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="936849536"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2024 05:23:38 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd92x-0006Lk-0B;
	Thu, 22 Feb 2024 13:23:36 +0000
Date: Thu, 22 Feb 2024 21:22:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6782/8260] mm/userfaultfd.c:1438 uffd_move_lock()
 error: we previously assumed '*src_vmap' could be null (see line 1423)
Message-ID: <202402222154.xRj2t91B-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Lokesh Gidra <lokeshgidra@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Liam R. Howlett" <Liam.Howlett@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4893c639cc3659cefaa675bf1e59f4e7571afb5c
commit: 17464ec6a91f3d4645b9795c5cb58d98bd643cf7 [6782/8260] userfaultfd: use per-vma locks in userfaultfd operations
:::::: branch date: 32 hours ago
:::::: commit date: 7 days ago
config: arm64-randconfig-r081-20240216 (https://download.01.org/0day-ci/archive/20240222/202402222154.xRj2t91B-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402222154.xRj2t91B-lkp@intel.com/

smatch warnings:
mm/userfaultfd.c:1438 uffd_move_lock() error: we previously assumed '*src_vmap' could be null (see line 1423)

vim +1438 mm/userfaultfd.c

17464ec6a91f3d Lokesh Gidra     2024-02-15  1385  
17464ec6a91f3d Lokesh Gidra     2024-02-15  1386  #ifdef CONFIG_PER_VMA_LOCK
17464ec6a91f3d Lokesh Gidra     2024-02-15  1387  static int uffd_move_lock(struct mm_struct *mm,
17464ec6a91f3d Lokesh Gidra     2024-02-15  1388  			  unsigned long dst_start,
17464ec6a91f3d Lokesh Gidra     2024-02-15  1389  			  unsigned long src_start,
17464ec6a91f3d Lokesh Gidra     2024-02-15  1390  			  struct vm_area_struct **dst_vmap,
17464ec6a91f3d Lokesh Gidra     2024-02-15  1391  			  struct vm_area_struct **src_vmap)
17464ec6a91f3d Lokesh Gidra     2024-02-15  1392  {
17464ec6a91f3d Lokesh Gidra     2024-02-15  1393  	struct vm_area_struct *vma;
17464ec6a91f3d Lokesh Gidra     2024-02-15  1394  	int err;
17464ec6a91f3d Lokesh Gidra     2024-02-15  1395  
17464ec6a91f3d Lokesh Gidra     2024-02-15  1396  	vma = lock_vma(mm, dst_start);
17464ec6a91f3d Lokesh Gidra     2024-02-15  1397  	if (IS_ERR(vma))
17464ec6a91f3d Lokesh Gidra     2024-02-15  1398  		return PTR_ERR(vma);
17464ec6a91f3d Lokesh Gidra     2024-02-15  1399  
17464ec6a91f3d Lokesh Gidra     2024-02-15  1400  	*dst_vmap = vma;
adef440691bab8 Andrea Arcangeli 2023-12-06  1401  	/*
17464ec6a91f3d Lokesh Gidra     2024-02-15  1402  	 * Skip finding src_vma if src_start is in dst_vma. This also ensures
17464ec6a91f3d Lokesh Gidra     2024-02-15  1403  	 * that we don't lock the same vma twice.
adef440691bab8 Andrea Arcangeli 2023-12-06  1404  	 */
17464ec6a91f3d Lokesh Gidra     2024-02-15  1405  	if (src_start >= vma->vm_start && src_start < vma->vm_end) {
17464ec6a91f3d Lokesh Gidra     2024-02-15  1406  		*src_vmap = vma;
17464ec6a91f3d Lokesh Gidra     2024-02-15  1407  		return 0;
17464ec6a91f3d Lokesh Gidra     2024-02-15  1408  	}
adef440691bab8 Andrea Arcangeli 2023-12-06  1409  
17464ec6a91f3d Lokesh Gidra     2024-02-15  1410  	/*
17464ec6a91f3d Lokesh Gidra     2024-02-15  1411  	 * Using lock_vma() to get src_vma can lead to following deadlock:
17464ec6a91f3d Lokesh Gidra     2024-02-15  1412  	 *
17464ec6a91f3d Lokesh Gidra     2024-02-15  1413  	 * Thread1				Thread2
17464ec6a91f3d Lokesh Gidra     2024-02-15  1414  	 * -------				-------
17464ec6a91f3d Lokesh Gidra     2024-02-15  1415  	 * vma_start_read(dst_vma)
17464ec6a91f3d Lokesh Gidra     2024-02-15  1416  	 *					mmap_write_lock(mm)
17464ec6a91f3d Lokesh Gidra     2024-02-15  1417  	 *					vma_start_write(src_vma)
17464ec6a91f3d Lokesh Gidra     2024-02-15  1418  	 * vma_start_read(src_vma)
17464ec6a91f3d Lokesh Gidra     2024-02-15  1419  	 * mmap_read_lock(mm)
17464ec6a91f3d Lokesh Gidra     2024-02-15  1420  	 *					vma_start_write(dst_vma)
17464ec6a91f3d Lokesh Gidra     2024-02-15  1421  	 */
17464ec6a91f3d Lokesh Gidra     2024-02-15  1422  	*src_vmap = lock_vma_under_rcu(mm, src_start);
17464ec6a91f3d Lokesh Gidra     2024-02-15 @1423  	if (likely(*src_vmap))
adef440691bab8 Andrea Arcangeli 2023-12-06  1424  		return 0;
17464ec6a91f3d Lokesh Gidra     2024-02-15  1425  
17464ec6a91f3d Lokesh Gidra     2024-02-15  1426  	/* Undo any locking and retry in mmap_lock critical section */
17464ec6a91f3d Lokesh Gidra     2024-02-15  1427  	vma_end_read(*dst_vmap);
17464ec6a91f3d Lokesh Gidra     2024-02-15  1428  
17464ec6a91f3d Lokesh Gidra     2024-02-15  1429  	mmap_read_lock(mm);
17464ec6a91f3d Lokesh Gidra     2024-02-15  1430  	err = find_vmas_mm_locked(mm, dst_start, src_start, dst_vmap, src_vmap);
17464ec6a91f3d Lokesh Gidra     2024-02-15  1431  	if (!err) {
17464ec6a91f3d Lokesh Gidra     2024-02-15  1432  		/*
17464ec6a91f3d Lokesh Gidra     2024-02-15  1433  		 * See comment in lock_vma() as to why not using
17464ec6a91f3d Lokesh Gidra     2024-02-15  1434  		 * vma_start_read() here.
17464ec6a91f3d Lokesh Gidra     2024-02-15  1435  		 */
17464ec6a91f3d Lokesh Gidra     2024-02-15  1436  		down_read(&(*dst_vmap)->vm_lock->lock);
17464ec6a91f3d Lokesh Gidra     2024-02-15  1437  		if (*dst_vmap != *src_vmap)
17464ec6a91f3d Lokesh Gidra     2024-02-15 @1438  			down_read(&(*src_vmap)->vm_lock->lock);
17464ec6a91f3d Lokesh Gidra     2024-02-15  1439  	}
17464ec6a91f3d Lokesh Gidra     2024-02-15  1440  	mmap_read_unlock(mm);
17464ec6a91f3d Lokesh Gidra     2024-02-15  1441  	return err;
17464ec6a91f3d Lokesh Gidra     2024-02-15  1442  }
17464ec6a91f3d Lokesh Gidra     2024-02-15  1443  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
