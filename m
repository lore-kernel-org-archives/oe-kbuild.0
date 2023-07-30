Received: from mgamail.intel.com (unknown [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC0F20EE
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Jul 2023 14:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690727759; x=1722263759;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rTPQ/nUV5onJgBdTaqqBTiEmMEW1p//rNKKWz0/8qDE=;
  b=i6+ONJeGBSMiWdWyKU0Yi9/H2tXhqUZla53jb8xQol44hwOZt9J4YykH
   d6CNnN4ykIhuibXgDdar9WjyBTGD/m2+qjGUIS0tz5oLIj+d6LvguSuXw
   4poCkLPvKLt2JoOHdjMgztWAhhaUemCmgtO5qUd3S6dd78cjX+HLK0Gz4
   jwJHzuaj8RFeCt3tT5+syBS7YmJfp5EhKfHUJ4aS197DQzXic4whwLm96
   m+uz/4AaLVJF5KgCggwMCWY7geMNlmZPk5XgzDBS1efRW2xHe0ESdQIgH
   8Wp0arqWjJMJ2oTE14+mHIWFlNizkXhguww+TYi/a2Vr/Z1hO6IKFtGa5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="371556625"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="371556625"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 07:35:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="705093147"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="705093147"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 30 Jul 2023 07:35:57 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQ7WW-0004cl-33;
	Sun, 30 Jul 2023 14:35:56 +0000
Date: Sun, 30 Jul 2023 22:35:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2743/5284] drivers/gpu/drm/drm_debugfs.c:212
 drm_debugfs_gpuva_info() warn: argument 6 to %016llx specifier is cast from
 pointer
Message-ID: <202307302257.16vuZLts-lkp@intel.com>
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
TO: Danilo Krummrich <dakr@redhat.com>
CC: Boris Brezillon <bbrezillon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d7b3af5a77e8d8da28f435f313e069aea5bcf172
commit: 4f66feeab173bd73e71028b8c2e1dcea07e32dd5 [2743/5284] drm: debugfs: provide infrastructure to dump a DRM GPU VA space
:::::: branch date: 2 days ago
:::::: commit date: 10 days ago
config: i386-randconfig-m021-20230728 (https://download.01.org/0day-ci/archive/20230730/202307302257.16vuZLts-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307302257.16vuZLts-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307302257.16vuZLts-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_debugfs.c:212 drm_debugfs_gpuva_info() warn: argument 6 to %016llx specifier is cast from pointer

vim +212 drivers/gpu/drm/drm_debugfs.c

28a62277e06f93 Ben Gamari       2009-02-17  178  
4f66feeab173bd Danilo Krummrich 2023-07-20  179  /**
4f66feeab173bd Danilo Krummrich 2023-07-20  180   * drm_debugfs_gpuva_info - dump the given DRM GPU VA space
4f66feeab173bd Danilo Krummrich 2023-07-20  181   * @m: pointer to the &seq_file to write
4f66feeab173bd Danilo Krummrich 2023-07-20  182   * @mgr: the &drm_gpuva_manager representing the GPU VA space
4f66feeab173bd Danilo Krummrich 2023-07-20  183   *
4f66feeab173bd Danilo Krummrich 2023-07-20  184   * Dumps the GPU VA mappings of a given DRM GPU VA manager.
4f66feeab173bd Danilo Krummrich 2023-07-20  185   *
4f66feeab173bd Danilo Krummrich 2023-07-20  186   * For each DRM GPU VA space drivers should call this function from their
4f66feeab173bd Danilo Krummrich 2023-07-20  187   * &drm_info_list's show callback.
4f66feeab173bd Danilo Krummrich 2023-07-20  188   *
4f66feeab173bd Danilo Krummrich 2023-07-20  189   * Returns: 0 on success, -ENODEV if the &mgr is not initialized
4f66feeab173bd Danilo Krummrich 2023-07-20  190   */
4f66feeab173bd Danilo Krummrich 2023-07-20  191  int drm_debugfs_gpuva_info(struct seq_file *m,
4f66feeab173bd Danilo Krummrich 2023-07-20  192  			   struct drm_gpuva_manager *mgr)
4f66feeab173bd Danilo Krummrich 2023-07-20  193  {
4f66feeab173bd Danilo Krummrich 2023-07-20  194  	struct drm_gpuva *va, *kva = &mgr->kernel_alloc_node;
4f66feeab173bd Danilo Krummrich 2023-07-20  195  
4f66feeab173bd Danilo Krummrich 2023-07-20  196  	if (!mgr->name)
4f66feeab173bd Danilo Krummrich 2023-07-20  197  		return -ENODEV;
4f66feeab173bd Danilo Krummrich 2023-07-20  198  
4f66feeab173bd Danilo Krummrich 2023-07-20  199  	seq_printf(m, "DRM GPU VA space (%s) [0x%016llx;0x%016llx]\n",
4f66feeab173bd Danilo Krummrich 2023-07-20  200  		   mgr->name, mgr->mm_start, mgr->mm_start + mgr->mm_range);
4f66feeab173bd Danilo Krummrich 2023-07-20  201  	seq_printf(m, "Kernel reserved node [0x%016llx;0x%016llx]\n",
4f66feeab173bd Danilo Krummrich 2023-07-20  202  		   kva->va.addr, kva->va.addr + kva->va.range);
4f66feeab173bd Danilo Krummrich 2023-07-20  203  	seq_puts(m, "\n");
4f66feeab173bd Danilo Krummrich 2023-07-20  204  	seq_puts(m, " VAs | start              | range              | end                | object             | object offset\n");
4f66feeab173bd Danilo Krummrich 2023-07-20  205  	seq_puts(m, "-------------------------------------------------------------------------------------------------------------\n");
4f66feeab173bd Danilo Krummrich 2023-07-20  206  	drm_gpuva_for_each_va(va, mgr) {
4f66feeab173bd Danilo Krummrich 2023-07-20  207  		if (unlikely(va == kva))
4f66feeab173bd Danilo Krummrich 2023-07-20  208  			continue;
4f66feeab173bd Danilo Krummrich 2023-07-20  209  
4f66feeab173bd Danilo Krummrich 2023-07-20  210  		seq_printf(m, "     | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx\n",
4f66feeab173bd Danilo Krummrich 2023-07-20  211  			   va->va.addr, va->va.range, va->va.addr + va->va.range,
4f66feeab173bd Danilo Krummrich 2023-07-20 @212  			   (u64)va->gem.obj, va->gem.offset);
4f66feeab173bd Danilo Krummrich 2023-07-20  213  	}
4f66feeab173bd Danilo Krummrich 2023-07-20  214  
4f66feeab173bd Danilo Krummrich 2023-07-20  215  	return 0;
4f66feeab173bd Danilo Krummrich 2023-07-20  216  }
4f66feeab173bd Danilo Krummrich 2023-07-20  217  EXPORT_SYMBOL(drm_debugfs_gpuva_info);
28a62277e06f93 Ben Gamari       2009-02-17  218  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
