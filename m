Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7128E2F46
	for <oe-kbuild@lists.linux.dev>; Fri, 30 Jun 2023 16:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688143057; x=1719679057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UZ7UB3oQahR9A91yH62vvRjILElxw/LteOtigXHE+KM=;
  b=cp2UpP/UDDdL2u7NRdD6IpzXYM/Xt1oN3JYlM8XVos8rw9VjKImI4oWQ
   QwMkq98eFQ8wtEl9DYwnVQcOds8DwOhGffs80kaU3Yo6NmvqeaMwZ8KFZ
   aqcLAJqFq6XyCTv4psP9BQKSHd3AtU2npjPWgnAz9yh7ab6wE5t5HTtuI
   9Ax2d7ToTLU45mRwNqYAOpH4XVOikez7RudHkNOpm8xLcxNN5skXRw5KQ
   bpVur45c1D7w1aYg/w+FTXzA55g+m0yZ+DvphwC8q3Tb8jYXAc+82h7OX
   jlpD9OATCyic0UThCTVKSc/B7EsU7Lgs7DI1uojJLpjKfSqwOs9ntoZ83
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="359913060"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="359913060"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 09:37:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="964455069"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="964455069"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2023 09:37:35 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFH7m-000F9Y-2I;
	Fri, 30 Jun 2023 16:37:34 +0000
Date: Sat, 1 Jul 2023 00:37:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH drm-next v5 04/14] drm: debugfs: provide infrastructure
 to dump a DRM GPU VA space
Message-ID: <202307010020.iUbaRl4i-lkp@intel.com>
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
In-Reply-To: <20230620004217.4700-5-dakr@redhat.com>
References: <20230620004217.4700-5-dakr@redhat.com>
TO: Danilo Krummrich <dakr@redhat.com>
TO: airlied@gmail.com
TO: daniel@ffwll.ch
TO: tzimmermann@suse.de
TO: mripard@kernel.org
TO: corbet@lwn.net
TO: christian.koenig@amd.com
TO: bskeggs@redhat.com
TO: Liam.Howlett@oracle.com
TO: matthew.brost@intel.com
TO: boris.brezillon@collabora.com
TO: alexdeucher@gmail.com
TO: ogabbay@kernel.org
TO: bagasdotme@gmail.com
TO: willy@infradead.org
TO: jason@jlekstrand.net
CC: linux-doc@vger.kernel.org
CC: nouveau@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: linux-mm@kvack.org
CC: Danilo Krummrich <dakr@redhat.com>

Hi Danilo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2222dcb0775d36de28992f56455ab3967b30d380]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/drm-execution-context-for-GEM-buffers-v4/20230620-084448
base:   2222dcb0775d36de28992f56455ab3967b30d380
patch link:    https://lore.kernel.org/r/20230620004217.4700-5-dakr%40redhat.com
patch subject: [PATCH drm-next v5 04/14] drm: debugfs: provide infrastructure to dump a DRM GPU VA space
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: parisc-randconfig-m041-20230629 (https://download.01.org/0day-ci/archive/20230701/202307010020.iUbaRl4i-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230701/202307010020.iUbaRl4i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307010020.iUbaRl4i-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_debugfs.c:213 drm_debugfs_gpuva_info() warn: argument 6 to %016llx specifier is cast from pointer

vim +213 drivers/gpu/drm/drm_debugfs.c

28a62277e06f93 Ben Gamari       2009-02-17  178  
61f21add16fe23 Danilo Krummrich 2023-06-20  179  /**
61f21add16fe23 Danilo Krummrich 2023-06-20  180   * drm_debugfs_gpuva_info - dump the given DRM GPU VA space
61f21add16fe23 Danilo Krummrich 2023-06-20  181   * @m: pointer to the &seq_file to write
61f21add16fe23 Danilo Krummrich 2023-06-20  182   * @mgr: the &drm_gpuva_manager representing the GPU VA space
61f21add16fe23 Danilo Krummrich 2023-06-20  183   *
61f21add16fe23 Danilo Krummrich 2023-06-20  184   * Dumps the GPU VA mappings of a given DRM GPU VA manager.
61f21add16fe23 Danilo Krummrich 2023-06-20  185   *
61f21add16fe23 Danilo Krummrich 2023-06-20  186   * For each DRM GPU VA space drivers should call this function from their
61f21add16fe23 Danilo Krummrich 2023-06-20  187   * &drm_info_list's show callback.
61f21add16fe23 Danilo Krummrich 2023-06-20  188   *
61f21add16fe23 Danilo Krummrich 2023-06-20  189   * Returns: 0 on success, -ENODEV if the &mgr is not initialized
61f21add16fe23 Danilo Krummrich 2023-06-20  190   */
61f21add16fe23 Danilo Krummrich 2023-06-20  191  int drm_debugfs_gpuva_info(struct seq_file *m,
61f21add16fe23 Danilo Krummrich 2023-06-20  192  			   struct drm_gpuva_manager *mgr)
61f21add16fe23 Danilo Krummrich 2023-06-20  193  {
61f21add16fe23 Danilo Krummrich 2023-06-20  194  	DRM_GPUVA_ITER(it, mgr, 0);
61f21add16fe23 Danilo Krummrich 2023-06-20  195  	struct drm_gpuva *va, *kva = &mgr->kernel_alloc_node;
61f21add16fe23 Danilo Krummrich 2023-06-20  196  
61f21add16fe23 Danilo Krummrich 2023-06-20  197  	if (!mgr->name)
61f21add16fe23 Danilo Krummrich 2023-06-20  198  		return -ENODEV;
61f21add16fe23 Danilo Krummrich 2023-06-20  199  
61f21add16fe23 Danilo Krummrich 2023-06-20  200  	seq_printf(m, "DRM GPU VA space (%s) [0x%016llx;0x%016llx]\n",
61f21add16fe23 Danilo Krummrich 2023-06-20  201  		   mgr->name, mgr->mm_start, mgr->mm_start + mgr->mm_range);
61f21add16fe23 Danilo Krummrich 2023-06-20  202  	seq_printf(m, "Kernel reserved node [0x%016llx;0x%016llx]\n",
61f21add16fe23 Danilo Krummrich 2023-06-20  203  		   kva->va.addr, kva->va.addr + kva->va.range);
61f21add16fe23 Danilo Krummrich 2023-06-20  204  	seq_puts(m, "\n");
61f21add16fe23 Danilo Krummrich 2023-06-20  205  	seq_puts(m, " VAs | start              | range              | end                | object             | object offset\n");
61f21add16fe23 Danilo Krummrich 2023-06-20  206  	seq_puts(m, "-------------------------------------------------------------------------------------------------------------\n");
61f21add16fe23 Danilo Krummrich 2023-06-20  207  	drm_gpuva_iter_for_each(va, it) {
61f21add16fe23 Danilo Krummrich 2023-06-20  208  		if (unlikely(va == &mgr->kernel_alloc_node))
61f21add16fe23 Danilo Krummrich 2023-06-20  209  			continue;
61f21add16fe23 Danilo Krummrich 2023-06-20  210  
61f21add16fe23 Danilo Krummrich 2023-06-20  211  		seq_printf(m, "     | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx\n",
61f21add16fe23 Danilo Krummrich 2023-06-20  212  			   va->va.addr, va->va.range, va->va.addr + va->va.range,
61f21add16fe23 Danilo Krummrich 2023-06-20 @213  			   (u64)va->gem.obj, va->gem.offset);
61f21add16fe23 Danilo Krummrich 2023-06-20  214  	}
61f21add16fe23 Danilo Krummrich 2023-06-20  215  
61f21add16fe23 Danilo Krummrich 2023-06-20  216  	return 0;
61f21add16fe23 Danilo Krummrich 2023-06-20  217  }
61f21add16fe23 Danilo Krummrich 2023-06-20  218  EXPORT_SYMBOL(drm_debugfs_gpuva_info);
28a62277e06f93 Ben Gamari       2009-02-17  219  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
