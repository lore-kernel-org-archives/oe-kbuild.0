Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6632F21
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jan 2023 16:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674060693; x=1705596693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7nFWUjz0gBFGVYd8Qsqf/F8ufv1n7Rq6jDMYyrJq2oM=;
  b=eTbVJEEJAdbNe5VFawqwurUq3mqQTqGa5rmLpJo/VLuRu2z9qWRGaKhl
   5izpXk89vlfcUb3gAWEii4f/ixc4X13kv/HKk6LrPGn9q9z7SUvHdb718
   hs35BsFYkbrAe209LxOd7PLkkh27bEC75ou/0Jkf+XU6w5l6iEL4Xzo+3
   9rNGJ810YI4BCg3R68gnOuyjzhsiWXDj9E9BnlL8KRMd8xCPyRi4gdDm3
   8jPB5Un3GvOpO5McJnSW5ReJN+oQ/JS651g/AV0pa0s7MJK3yi87fDmW0
   MMXRTi5pXf0y6086y8EFhw+U8SQGU1ZyehAfGP/tB9D2r4Suh3g8uMHL2
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="327104756"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="327104756"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 08:51:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="692066334"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="692066334"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Jan 2023 08:51:02 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIBeK-0000XB-2X;
	Wed, 18 Jan 2023 16:50:56 +0000
Date: Thu, 19 Jan 2023 00:50:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH drm-next 03/14] drm: manager to keep track of GPUs VA
 mappings
Message-ID: <202301190004.9AzNXacp-lkp@intel.com>
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
In-Reply-To: <20230118061256.2689-4-dakr@redhat.com>
References: <20230118061256.2689-4-dakr@redhat.com>
TO: Danilo Krummrich <dakr@redhat.com>
TO: daniel@ffwll.ch
TO: airlied@redhat.com
TO: christian.koenig@amd.com
TO: bskeggs@redhat.com
TO: jason@jlekstrand.net
TO: tzimmermann@suse.de
TO: mripard@kernel.org
TO: corbet@lwn.net
CC: nouveau@lists.freedesktop.org
CC: Danilo Krummrich <dakr@redhat.com>
CC: linux-kernel@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: linux-doc@vger.kernel.org

Hi Danilo,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 0b45ac1170ea6416bc1d36798414c04870cd356d]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/drm-execution-context-for-GEM-buffers/20230118-141552
base:   0b45ac1170ea6416bc1d36798414c04870cd356d
patch link:    https://lore.kernel.org/r/20230118061256.2689-4-dakr%40redhat.com
patch subject: [PATCH drm-next 03/14] drm: manager to keep track of GPUs VA mappings
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: i386-randconfig-m021-20230116 (https://download.01.org/0day-ci/archive/20230119/202301190004.9AzNXacp-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/gpu/drm/drm_gpuva_mgr.c:739 drm_gpuva_region_destroy() warn: ignoring unreachable code.

vim +739 drivers/gpu/drm/drm_gpuva_mgr.c

fffbb2141e3b96 Danilo Krummrich 2023-01-18  725  
fffbb2141e3b96 Danilo Krummrich 2023-01-18  726  /**
fffbb2141e3b96 Danilo Krummrich 2023-01-18  727   * drm_gpuva_region_destroy - destroy a &drm_gpuva_region
fffbb2141e3b96 Danilo Krummrich 2023-01-18  728   * @mgr: the &drm_gpuva_manager holding the region
fffbb2141e3b96 Danilo Krummrich 2023-01-18  729   * @reg: the &drm_gpuva to destroy
fffbb2141e3b96 Danilo Krummrich 2023-01-18  730   *
fffbb2141e3b96 Danilo Krummrich 2023-01-18  731   * This removes the given &reg from the underlaying range allocator.
fffbb2141e3b96 Danilo Krummrich 2023-01-18  732   */
fffbb2141e3b96 Danilo Krummrich 2023-01-18  733  void
fffbb2141e3b96 Danilo Krummrich 2023-01-18  734  drm_gpuva_region_destroy(struct drm_gpuva_manager *mgr,
fffbb2141e3b96 Danilo Krummrich 2023-01-18  735  			 struct drm_gpuva_region *reg)
fffbb2141e3b96 Danilo Krummrich 2023-01-18  736  {
fffbb2141e3b96 Danilo Krummrich 2023-01-18  737  	struct drm_gpuva *va;
fffbb2141e3b96 Danilo Krummrich 2023-01-18  738  
fffbb2141e3b96 Danilo Krummrich 2023-01-18 @739  	drm_gpuva_for_each_va_in_range(va, mgr,
fffbb2141e3b96 Danilo Krummrich 2023-01-18  740  				       reg->node.start,
fffbb2141e3b96 Danilo Krummrich 2023-01-18  741  				       reg->node.size) {
fffbb2141e3b96 Danilo Krummrich 2023-01-18  742  		WARN(1, "GPU VA region must be empty on destroy.\n");
fffbb2141e3b96 Danilo Krummrich 2023-01-18  743  		return;
fffbb2141e3b96 Danilo Krummrich 2023-01-18  744  	}
fffbb2141e3b96 Danilo Krummrich 2023-01-18  745  
fffbb2141e3b96 Danilo Krummrich 2023-01-18  746  	if (&reg->node == &mgr->kernel_alloc_node) {
fffbb2141e3b96 Danilo Krummrich 2023-01-18  747  		WARN(1, "Can't destroy kernel reserved region.\n");
fffbb2141e3b96 Danilo Krummrich 2023-01-18  748  		return;
fffbb2141e3b96 Danilo Krummrich 2023-01-18  749  	}
fffbb2141e3b96 Danilo Krummrich 2023-01-18  750  
fffbb2141e3b96 Danilo Krummrich 2023-01-18  751  	drm_mm_remove_node(&reg->node);
fffbb2141e3b96 Danilo Krummrich 2023-01-18  752  }
fffbb2141e3b96 Danilo Krummrich 2023-01-18  753  EXPORT_SYMBOL(drm_gpuva_region_destroy);
fffbb2141e3b96 Danilo Krummrich 2023-01-18  754  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
