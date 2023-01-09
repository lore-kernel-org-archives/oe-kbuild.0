Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871F08C09
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Jan 2023 19:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673292714; x=1704828714;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ubRMhRM/DdpQZULU1brWYpf2G7WYO20WG4NkSunm5y8=;
  b=hyRL00aW31vx+HOMFVlE2Te9CSyDefqvqH5y68M5z4KqBksKfQLZHSKy
   +pABTXIm7x18iKbdFiwfmUl5BrVCFkJdz7f7YGUSbaSzojrVLFUZxmveH
   rwieLDjTv2GfGPawF+iNEqcUvfHxMzAwdOKR26byh4OV1HaHxUSGSVdfy
   Q+QA7UY26vDoEFsmzsRvqlUTJBHmdaV602VUj8ePkwXyEamuiRe/uP1gY
   SHtmqyaAwS0rb1cVob8nTaop2WzQsOugQ3VZS6qtF33NhD6AWyBeAybF8
   cYC2QJQybyB0zwLUARqYmwh36MS4fCQHG+BWxArrIi8zzpGRdVUX74+uH
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="385267534"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="385267534"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 11:31:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="764423571"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="764423571"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 09 Jan 2023 11:31:45 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pExs0-0007Ag-06;
	Mon, 09 Jan 2023 19:31:44 +0000
Date: Tue, 10 Jan 2023 03:31:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v10 08/11] drm/shmem-helper: Add memory shrinker
Message-ID: <202301100303.TWptkeFz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/drm_gem_shmem_helper.c:663:43: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230108210445.3948344-9-dmitry.osipenko@collabora.com>
References: <20230108210445.3948344-9-dmitry.osipenko@collabora.com>
TO: Dmitry Osipenko <dmitry.osipenko@collabora.com>
TO: David Airlie <airlied@gmail.com>
TO: Gerd Hoffmann <kraxel@redhat.com>
TO: Gurchetan Singh <gurchetansingh@chromium.org>
TO: "Chia-I Wu" <olvaffe@gmail.com>
TO: Daniel Vetter <daniel@ffwll.ch>
TO: Daniel Almeida <daniel.almeida@collabora.com>
TO: Gustavo Padovan <gustavo.padovan@collabora.com>
TO: Daniel Stone <daniel@fooishbar.org>
TO: Tomeu Vizoso <tomeu.vizoso@collabora.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: Rob Clark <robdclark@gmail.com>
TO: Sumit Semwal <sumit.semwal@linaro.org>
TO: "Christian König" <christian.koenig@amd.com>
TO: Qiang Yu <yuq825@gmail.com>
TO: Steven Price <steven.price@arm.com>
TO: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
TO: Rob Herring <robh@kernel.org>
TO: Sean Paul <sean@poorly.run>
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
TO: Abhinav Kumar <quic_abhinavk@quicinc.com>
CC: kernel@collabora.com
CC: linux-kernel@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: virtualization@lists.linux-foundation.org

Hi Dmitry,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.2-rc3 next-20230109]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Osipenko/drm-msm-gem-Prevent-blocking-within-shrinker-loop/20230109-050832
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20230108210445.3948344-9-dmitry.osipenko%40collabora.com
patch subject: [PATCH v10 08/11] drm/shmem-helper: Add memory shrinker
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 89aba07a34b867e93ed694f2a5cd77c343bc81b5
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/drm_gem_shmem_helper.c:663:43: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
    drm_WARN_ON_ONCE(obj->dev, !shmem->pages ^ pages_unpinned);
                                             ^

vim +663 drivers/gpu/drm/drm_gem_shmem_helper.c

2194a63a818db7 Noralf Trønnes  2019-03-12  643  
2194a63a818db7 Noralf Trønnes  2019-03-12  644  static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
2194a63a818db7 Noralf Trønnes  2019-03-12  645  {
2194a63a818db7 Noralf Trønnes  2019-03-12  646  	struct vm_area_struct *vma = vmf->vma;
2194a63a818db7 Noralf Trønnes  2019-03-12  647  	struct drm_gem_object *obj = vma->vm_private_data;
2194a63a818db7 Noralf Trønnes  2019-03-12  648  	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
2194a63a818db7 Noralf Trønnes  2019-03-12  649  	loff_t num_pages = obj->size >> PAGE_SHIFT;
d611b4a0907cec Neil Roberts    2021-02-23  650  	vm_fault_t ret;
2194a63a818db7 Noralf Trønnes  2019-03-12  651  	struct page *page;
11d5a4745e00e7 Neil Roberts    2021-02-23  652  	pgoff_t page_offset;
89aba07a34b867 Dmitry Osipenko 2023-01-09  653  	bool pages_unpinned;
89aba07a34b867 Dmitry Osipenko 2023-01-09  654  	int err;
11d5a4745e00e7 Neil Roberts    2021-02-23  655  
11d5a4745e00e7 Neil Roberts    2021-02-23  656  	/* We don't use vmf->pgoff since that has the fake offset */
11d5a4745e00e7 Neil Roberts    2021-02-23  657  	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
2194a63a818db7 Noralf Trønnes  2019-03-12  658  
dc20c97d02a977 Dmitry Osipenko 2023-01-09  659  	dma_resv_lock(shmem->base.resv, NULL);
2194a63a818db7 Noralf Trønnes  2019-03-12  660  
89aba07a34b867 Dmitry Osipenko 2023-01-09  661  	/* Sanity-check that we have the pages pointer when it should present */
89aba07a34b867 Dmitry Osipenko 2023-01-09  662  	pages_unpinned = (shmem->evicted || shmem->madv < 0 || !shmem->pages_use_count);
89aba07a34b867 Dmitry Osipenko 2023-01-09 @663  	drm_WARN_ON_ONCE(obj->dev, !shmem->pages ^ pages_unpinned);
89aba07a34b867 Dmitry Osipenko 2023-01-09  664  
89aba07a34b867 Dmitry Osipenko 2023-01-09  665  	if (page_offset >= num_pages || (!shmem->pages && !shmem->evicted)) {
d611b4a0907cec Neil Roberts    2021-02-23  666  		ret = VM_FAULT_SIGBUS;
d611b4a0907cec Neil Roberts    2021-02-23  667  	} else {
89aba07a34b867 Dmitry Osipenko 2023-01-09  668  		err = drm_gem_shmem_swap_in(shmem);
89aba07a34b867 Dmitry Osipenko 2023-01-09  669  		if (err) {
89aba07a34b867 Dmitry Osipenko 2023-01-09  670  			ret = VM_FAULT_OOM;
89aba07a34b867 Dmitry Osipenko 2023-01-09  671  			goto unlock;
89aba07a34b867 Dmitry Osipenko 2023-01-09  672  		}
89aba07a34b867 Dmitry Osipenko 2023-01-09  673  
11d5a4745e00e7 Neil Roberts    2021-02-23  674  		page = shmem->pages[page_offset];
2194a63a818db7 Noralf Trønnes  2019-03-12  675  
8b93d1d7dbd578 Daniel Vetter   2021-08-12  676  		ret = vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
d611b4a0907cec Neil Roberts    2021-02-23  677  	}
d611b4a0907cec Neil Roberts    2021-02-23  678  
89aba07a34b867 Dmitry Osipenko 2023-01-09  679  unlock:
dc20c97d02a977 Dmitry Osipenko 2023-01-09  680  	dma_resv_unlock(shmem->base.resv);
d611b4a0907cec Neil Roberts    2021-02-23  681  
d611b4a0907cec Neil Roberts    2021-02-23  682  	return ret;
2194a63a818db7 Noralf Trønnes  2019-03-12  683  }
2194a63a818db7 Noralf Trønnes  2019-03-12  684  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
