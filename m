Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF90F9E6
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Oct 2024 07:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730013213; cv=none; b=iUwP4MJJE7OJ/GKL6mEpD6LnSjkJxvIXiOjdiVsrDgNO6PivgD23uAYLWy5GVbsJASSvwN2hckFyseGDVKhsKQ6E2AYryerD73eY0vIAj88N3kEKJBDK5zEcCf+B9U1TnjCMqarOmcq6CjuuBdh6BpgIijMBrLpVOu8GJyQA+UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730013213; c=relaxed/simple;
	bh=sZ4gy50Q9DsjPJnU11Y85sy8n9cbYF2y5SOkrCsMueg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U9wC+vFT5w96wDIwht/CHgeXvH+G41EDDt5rqMYGxKgW0Y09JtPJdx7/J9VO0AzZVETuWcVZmLyP4ipgWj5QJn0G5I84KexMylklmuz9CRacRIyEwqNnyrrmnZ/JKzF/hRAzJJluXuxLDoNYmNYbrU4nNXrg/Y+em0P+vkBUY14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iCFaJDWn; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iCFaJDWn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730013210; x=1761549210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sZ4gy50Q9DsjPJnU11Y85sy8n9cbYF2y5SOkrCsMueg=;
  b=iCFaJDWnx+zaPT0e85B2TwHX+upFJXUfgBMnrnqymg+NuZz7dfm/lsUD
   BPRoZPgx06IADybdXFpWwtYfskWx7e9soq8xnH3D5TZ4yzMnsSQa9e4Gz
   bmYKHL1vezY7MKfrIpX1OtfdnBx6tkHJqpQPJPF63vapoMGka5r1xcHMo
   077x3FPreO8Ak6i6QaHXCMxwm7eA9ACDt8Qv8cOpIQgaHpab5Xcy7C2TI
   XrfXRW5zCrSlpcHuyDD5sC8litNGwVXotppGeIFsotVGEJpCqFozVAhAz
   bfq53YKIQOBCL8aH3bNVMul4wMU4tO5FiN+PeBbWPhVyYM5+GEITH3wzL
   A==;
X-CSE-ConnectionGUID: cWBdXebrRl2fxvzR5qKd0Q==
X-CSE-MsgGUID: YYfkYpuuQLG0RKLqIfEDhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="55042624"
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="55042624"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 00:13:30 -0700
X-CSE-ConnectionGUID: Qz8+0BmKQGiv5MztJlkrHA==
X-CSE-MsgGUID: vbdbdF5dTqG2cMpahFsTQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="81471036"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Oct 2024 00:13:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4xSo-000aT6-0J;
	Sun, 27 Oct 2024 07:13:26 +0000
Date: Sun, 27 Oct 2024 15:13:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1: vfio: avoid unnecessary pin memory when dma map io
 address space 2/2]  vfio: avoid unnecessary pin memory when dma map io
 address space
Message-ID: <202410271506.dI0NxVtb-lkp@intel.com>
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
In-Reply-To: <15b38c90ef1eb0825b7492d633d46d901e428f7d.1729760996.git.qinyuntan@linux.alibaba.com>
References: <15b38c90ef1eb0825b7492d633d46d901e428f7d.1729760996.git.qinyuntan@linux.alibaba.com>
TO: Qinyun Tan <qinyuntan@linux.alibaba.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alex Williamson <alex.williamson@redhat.com>
CC: kvm@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Qinyun Tan <qinyuntan@linux.alibaba.com>
CC: Guanghui Feng <guanghuifeng@linux.alibaba.com>
CC: Xunlei Pang <xlpang@linux.alibaba.com>

Hi Qinyun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on awilliam-vfio/next]
[also build test WARNING on akpm-mm/mm-everything awilliam-vfio/for-linus linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qinyun-Tan/vfio-avoid-unnecessary-pin-memory-when-dma-map-io-address-space/20241024-183456
base:   https://github.com/awilliam/linux-vfio.git next
patch link:    https://lore.kernel.org/r/15b38c90ef1eb0825b7492d633d46d901e428f7d.1729760996.git.qinyuntan%40linux.alibaba.com
patch subject: [PATCH v1: vfio: avoid unnecessary pin memory when dma map io address space 2/2]  vfio: avoid unnecessary pin memory when dma map io address space
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271506.dI0NxVtb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410271506.dI0NxVtb-lkp@intel.com/

New smatch warnings:
drivers/vfio/vfio_iommu_type1.c:1482 vfio_pin_map_dma() warn: bitwise AND condition is false here

Old smatch warnings:
drivers/vfio/vfio_iommu_type1.c:2371 vfio_iommu_type1_attach_group() warn: '&group->next' not removed from list

vim +1482 drivers/vfio/vfio_iommu_type1.c

73fa0d10d077d9 Alex Williamson 2012-07-31  1444  
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1445  static int vfio_pin_map_dma(struct vfio_iommu *iommu, struct vfio_dma *dma,
19cc190329de5e Qinyun Tan      2024-10-24  1446  			    size_t map_size, unsigned int map_flags)
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1447  {
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1448  	dma_addr_t iova = dma->iova;
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1449  	unsigned long vaddr = dma->vaddr;
4b6c33b3229678 Daniel Jordan   2021-02-19  1450  	struct vfio_batch batch;
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1451  	size_t size = map_size;
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1452  	long npage;
7cb671e7a34d73 Alex Williamson 2017-04-17  1453  	unsigned long pfn, limit = rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1454  	int ret = 0;
19cc190329de5e Qinyun Tan      2024-10-24  1455  	struct mm_struct *mm = current->mm;
19cc190329de5e Qinyun Tan      2024-10-24  1456  	bool mmio_dont_pin = map_flags & VFIO_DMA_MAP_FLAG_MMIO_DONT_PIN;
19cc190329de5e Qinyun Tan      2024-10-24  1457  
19cc190329de5e Qinyun Tan      2024-10-24  1458  	/* This code path is only user initiated */
19cc190329de5e Qinyun Tan      2024-10-24  1459  	if (!mm) {
19cc190329de5e Qinyun Tan      2024-10-24  1460  		ret = -ENODEV;
19cc190329de5e Qinyun Tan      2024-10-24  1461  		goto out;
19cc190329de5e Qinyun Tan      2024-10-24  1462  	}
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1463  
4b6c33b3229678 Daniel Jordan   2021-02-19  1464  	vfio_batch_init(&batch);
4b6c33b3229678 Daniel Jordan   2021-02-19  1465  
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1466  	while (size) {
19cc190329de5e Qinyun Tan      2024-10-24  1467  		struct vm_area_struct *vma;
19cc190329de5e Qinyun Tan      2024-10-24  1468  		unsigned long start = vaddr + dma->size;
19cc190329de5e Qinyun Tan      2024-10-24  1469  		bool do_pin_pages = true;
19cc190329de5e Qinyun Tan      2024-10-24  1470  
19cc190329de5e Qinyun Tan      2024-10-24  1471  		if (mmio_dont_pin) {
19cc190329de5e Qinyun Tan      2024-10-24  1472  			mmap_read_lock(mm);
19cc190329de5e Qinyun Tan      2024-10-24  1473  
19cc190329de5e Qinyun Tan      2024-10-24  1474  			vma = find_vma_intersection(mm, start, start+1);
19cc190329de5e Qinyun Tan      2024-10-24  1475  
19cc190329de5e Qinyun Tan      2024-10-24  1476  			/*
19cc190329de5e Qinyun Tan      2024-10-24  1477  			 * If this dma address rang belongs to the IO address space with VMA flags
19cc190329de5e Qinyun Tan      2024-10-24  1478  			 * VM_IO | VM_PFNMAP | VM_PGOFF_IS_PFN, it doesn't need to be pinned.
19cc190329de5e Qinyun Tan      2024-10-24  1479  			 * Simply skip the pin operation to avoid unnecessary overhead.
19cc190329de5e Qinyun Tan      2024-10-24  1480  			 */
19cc190329de5e Qinyun Tan      2024-10-24  1481  			if (vma && (vma->vm_flags & VM_PFNMAP) && (vma->vm_flags & VM_IO)
19cc190329de5e Qinyun Tan      2024-10-24 @1482  							&& (vma->vm_flags & VM_PGOFF_IS_PFN)) {
19cc190329de5e Qinyun Tan      2024-10-24  1483  				pfn = vma->vm_pgoff + ((start - vma->vm_start) >> PAGE_SHIFT);
19cc190329de5e Qinyun Tan      2024-10-24  1484  				npage = min_t(long, (vma->vm_end - start), size) >> PAGE_SHIFT;
19cc190329de5e Qinyun Tan      2024-10-24  1485  				do_pin_pages = false;
19cc190329de5e Qinyun Tan      2024-10-24  1486  			}
19cc190329de5e Qinyun Tan      2024-10-24  1487  			mmap_read_unlock(mm);
19cc190329de5e Qinyun Tan      2024-10-24  1488  		}
19cc190329de5e Qinyun Tan      2024-10-24  1489  
19cc190329de5e Qinyun Tan      2024-10-24  1490  		if (do_pin_pages) {
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1491  			/* Pin a contiguous chunk of memory */
19cc190329de5e Qinyun Tan      2024-10-24  1492  			npage = vfio_pin_pages_remote(dma, start, size >> PAGE_SHIFT, &pfn,
19cc190329de5e Qinyun Tan      2024-10-24  1493  							limit, &batch);
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1494  			if (npage <= 0) {
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1495  				WARN_ON(!npage);
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1496  				ret = (int)npage;
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1497  				break;
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1498  			}
19cc190329de5e Qinyun Tan      2024-10-24  1499  		}
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1500  
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1501  		/* Map it! */
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1502  		ret = vfio_iommu_map(iommu, iova + dma->size, pfn, npage,
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1503  				     dma->prot);
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1504  		if (ret) {
19cc190329de5e Qinyun Tan      2024-10-24  1505  			if (do_pin_pages) {
a54eb55045ae9b Kirti Wankhede  2016-11-17  1506  				vfio_unpin_pages_remote(dma, iova + dma->size, pfn,
a54eb55045ae9b Kirti Wankhede  2016-11-17  1507  							npage, true);
4d83de6da265cd Daniel Jordan   2021-02-19  1508  				vfio_batch_unpin(&batch, dma);
19cc190329de5e Qinyun Tan      2024-10-24  1509  			}
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1510  			break;
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1511  		}
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1512  
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1513  		size -= npage << PAGE_SHIFT;
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1514  		dma->size += npage << PAGE_SHIFT;
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1515  	}
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1516  
4b6c33b3229678 Daniel Jordan   2021-02-19  1517  	vfio_batch_fini(&batch);
a54eb55045ae9b Kirti Wankhede  2016-11-17  1518  	dma->iommu_mapped = true;
a54eb55045ae9b Kirti Wankhede  2016-11-17  1519  
19cc190329de5e Qinyun Tan      2024-10-24  1520  out:
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1521  	if (ret)
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1522  		vfio_remove_dma(iommu, dma);
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1523  
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1524  	return ret;
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1525  }
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1526  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
