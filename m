Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8E2367
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Sep 2023 00:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694045604; x=1725581604;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vldHiWLbcpMyVwEdWYh+490OMVKZEI0TtBTtGtkCpXU=;
  b=eJhzFATCS8CUYagTPsCNVnp5P2WCbDBB1DYNsuY8LxcbW9H4WyNBnbNT
   Oe+SXak6cHGHQhK7W3DVdWpXZ7mQf17M6yRljOOwOHW/ylCCXXw+LNZlC
   JepVSHuwI/DCm0bzf5Ktp3bWaQF/dC20+d4Qg9+4O9DgYUPAL/KG5tv6J
   i3nQz2Wiq7A9SOyy3tQxnPuJ5MFv7Lc6uJPiaYvyKAPDztdHhjMIX0ToP
   kqtPjlUAdl0TeHbcpNmmTPrRHDp/LoksOeNPwvfSoDpaT1axn/DKdcHfd
   NtxJDtkp8PUQj17LlJiYMYXjs8HXGmWpRAGCy2MVmKcutMZuh9W7GqX2p
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="357532047"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="357532047"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 17:13:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="1072624253"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="1072624253"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Sep 2023 17:13:22 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qe2e8-0000iy-0N;
	Thu, 07 Sep 2023 00:13:20 +0000
Date: Thu, 7 Sep 2023 08:13:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v16 15/20] drm/shmem-helper: Add memory shrinker
Message-ID: <202309070814.jyGJOJzY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230903170736.513347-16-dmitry.osipenko@collabora.com>
References: <20230903170736.513347-16-dmitry.osipenko@collabora.com>
TO: Dmitry Osipenko <dmitry.osipenko@collabora.com>
TO: David Airlie <airlied@gmail.com>
TO: Gerd Hoffmann <kraxel@redhat.com>
TO: Gurchetan Singh <gurchetansingh@chromium.org>
TO: "Chia-I Wu" <olvaffe@gmail.com>
TO: Daniel Vetter <daniel@ffwll.ch>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: "Christian König" <christian.koenig@amd.com>
TO: Qiang Yu <yuq825@gmail.com>
TO: Steven Price <steven.price@arm.com>
TO: Boris Brezillon <bbrezillon@kernel.org>
TO: Emma Anholt <emma@anholt.net>
TO: Melissa Wen <mwen@igalia.com>
CC: kernel@collabora.com
CC: linux-kernel@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: virtualization@lists.linux-foundation.org

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on next-20230906]
[cannot apply to v6.5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Osipenko/drm-shmem-helper-Fix-UAF-in-error-path-when-freeing-SGT-of-imported-GEM/20230904-011037
base:   linus/master
patch link:    https://lore.kernel.org/r/20230903170736.513347-16-dmitry.osipenko%40collabora.com
patch subject: [PATCH v16 15/20] drm/shmem-helper: Add memory shrinker
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20230907 (https://download.01.org/0day-ci/archive/20230907/202309070814.jyGJOJzY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230907/202309070814.jyGJOJzY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309070814.jyGJOJzY-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_gem_shmem_helper.c:733 drm_gem_shmem_fault() error: we previously assumed 'shmem->pages' could be null (see line 724)

vim +733 drivers/gpu/drm/drm_gem_shmem_helper.c

2194a63a818db7 Noralf Trønnes  2019-03-12  701  
2194a63a818db7 Noralf Trønnes  2019-03-12  702  static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
2194a63a818db7 Noralf Trønnes  2019-03-12  703  {
2194a63a818db7 Noralf Trønnes  2019-03-12  704  	struct vm_area_struct *vma = vmf->vma;
2194a63a818db7 Noralf Trønnes  2019-03-12  705  	struct drm_gem_object *obj = vma->vm_private_data;
2194a63a818db7 Noralf Trønnes  2019-03-12  706  	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
2194a63a818db7 Noralf Trønnes  2019-03-12  707  	loff_t num_pages = obj->size >> PAGE_SHIFT;
d611b4a0907cec Neil Roberts    2021-02-23  708  	vm_fault_t ret;
2194a63a818db7 Noralf Trønnes  2019-03-12  709  	struct page *page;
11d5a4745e00e7 Neil Roberts    2021-02-23  710  	pgoff_t page_offset;
2c607edf57db6a Dmitry Osipenko 2023-09-03  711  	bool pages_unpinned;
2c607edf57db6a Dmitry Osipenko 2023-09-03  712  	int err;
11d5a4745e00e7 Neil Roberts    2021-02-23  713  
11d5a4745e00e7 Neil Roberts    2021-02-23  714  	/* We don't use vmf->pgoff since that has the fake offset */
11d5a4745e00e7 Neil Roberts    2021-02-23  715  	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
2194a63a818db7 Noralf Trønnes  2019-03-12  716  
21aa27ddc58269 Dmitry Osipenko 2023-05-30  717  	dma_resv_lock(shmem->base.resv, NULL);
2194a63a818db7 Noralf Trønnes  2019-03-12  718  
2c607edf57db6a Dmitry Osipenko 2023-09-03  719  	/* Sanity-check that we have the pages pointer when it should present */
2c607edf57db6a Dmitry Osipenko 2023-09-03  720  	pages_unpinned = (shmem->evicted || shmem->madv < 0 ||
2c607edf57db6a Dmitry Osipenko 2023-09-03  721  			  !refcount_read(&shmem->pages_use_count));
2c607edf57db6a Dmitry Osipenko 2023-09-03  722  	drm_WARN_ON_ONCE(obj->dev, !shmem->pages ^ pages_unpinned);
2c607edf57db6a Dmitry Osipenko 2023-09-03  723  
2c607edf57db6a Dmitry Osipenko 2023-09-03 @724  	if (page_offset >= num_pages || (!shmem->pages && !shmem->evicted)) {
d611b4a0907cec Neil Roberts    2021-02-23  725  		ret = VM_FAULT_SIGBUS;
d611b4a0907cec Neil Roberts    2021-02-23  726  	} else {
2c607edf57db6a Dmitry Osipenko 2023-09-03  727  		err = drm_gem_shmem_swapin_locked(shmem);
2c607edf57db6a Dmitry Osipenko 2023-09-03  728  		if (err) {
2c607edf57db6a Dmitry Osipenko 2023-09-03  729  			ret = VM_FAULT_OOM;
2c607edf57db6a Dmitry Osipenko 2023-09-03  730  			goto unlock;
2c607edf57db6a Dmitry Osipenko 2023-09-03  731  		}
2c607edf57db6a Dmitry Osipenko 2023-09-03  732  
11d5a4745e00e7 Neil Roberts    2021-02-23 @733  		page = shmem->pages[page_offset];
2194a63a818db7 Noralf Trønnes  2019-03-12  734  
8b93d1d7dbd578 Daniel Vetter   2021-08-12  735  		ret = vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
d611b4a0907cec Neil Roberts    2021-02-23  736  	}
d611b4a0907cec Neil Roberts    2021-02-23  737  
2c607edf57db6a Dmitry Osipenko 2023-09-03  738  unlock:
21aa27ddc58269 Dmitry Osipenko 2023-05-30  739  	dma_resv_unlock(shmem->base.resv);
d611b4a0907cec Neil Roberts    2021-02-23  740  
d611b4a0907cec Neil Roberts    2021-02-23  741  	return ret;
2194a63a818db7 Noralf Trønnes  2019-03-12  742  }
2194a63a818db7 Noralf Trønnes  2019-03-12  743  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
