Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BB419D
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jun 2023 00:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687480553; x=1719016553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j4Zp9cK9f9gCwugFe8OOITOzd12SmaskUharkwnkLmE=;
  b=g6r8yFAXr5C/CkVRw3OgXQpNth84IgSWDOrNzwFTgfWP0ZzeKZa4W+mw
   fMtdQ73p5yyTzqnseWMHGUUDYbQfUwBGJWi6XKgTqvcEsOA/5XMv0eagS
   dSbooGilVzRFfA8WrvgxbPcnG6I/KOU9UpM5OOKYzFJEPfriXupH+hHnk
   TS17RBxz+J+kZy2CTCMxGo0IgTAPiFDTfGYW79+ljzwvMxL4o61od8208
   yNGYlDpKT96pWrXXNJDe0EFf4a0+fywFtWROOWcE/E2zsqe4d/5xwmbvV
   slGfhWTEyhICeMod7RtH8uEhLIu18srBUYMOdaYuN+zYYVbkXM+exOba5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="363208042"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="363208042"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 17:35:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="805009686"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="805009686"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Jun 2023 17:35:51 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCUmE-0007qv-1N;
	Fri, 23 Jun 2023 00:35:50 +0000
Date: Fri, 23 Jun 2023 08:35:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH drm-next v5 12/14] drm/nouveau: nvkm/vmm: implement raw
 ops to manage uvmm
Message-ID: <202306230858.pAurt3QE-lkp@intel.com>
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
In-Reply-To: <20230620004217.4700-13-dakr@redhat.com>
References: <20230620004217.4700-13-dakr@redhat.com>
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
CC: dri-devel@lists.freedesktop.org
CC: nouveau@lists.freedesktop.org
CC: linux-doc@vger.kernel.org
CC: linux-mm@kvack.org
CC: linux-kernel@vger.kernel.org
CC: Danilo Krummrich <dakr@redhat.com>

Hi Danilo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2222dcb0775d36de28992f56455ab3967b30d380]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/drm-execution-context-for-GEM-buffers-v4/20230620-084448
base:   2222dcb0775d36de28992f56455ab3967b30d380
patch link:    https://lore.kernel.org/r/20230620004217.4700-13-dakr%40redhat.com
patch subject: [PATCH drm-next v5 12/14] drm/nouveau: nvkm/vmm: implement raw ops to manage uvmm
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: mips-randconfig-m031-20230620 (https://download.01.org/0day-ci/archive/20230623/202306230858.pAurt3QE-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230858.pAurt3QE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306230858.pAurt3QE-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/nvif/vmm.c:222 nvif_vmm_ctor() warn: possible memory leak of 'args'

vim +/args +222 drivers/gpu/drm/nouveau/nvif/vmm.c

920d2b5ef2157e Ben Skeggs       2017-11-01  197  
920d2b5ef2157e Ben Skeggs       2017-11-01  198  int
f5708c2f516f45 Danilo Krummrich 2023-06-20  199  nvif_vmm_ctor(struct nvif_mmu *mmu, const char *name, s32 oclass,
f5708c2f516f45 Danilo Krummrich 2023-06-20  200  	      enum nvif_vmm_type type, u64 addr, u64 size, void *argv, u32 argc,
f5708c2f516f45 Danilo Krummrich 2023-06-20  201  	      struct nvif_vmm *vmm)
920d2b5ef2157e Ben Skeggs       2017-11-01  202  {
920d2b5ef2157e Ben Skeggs       2017-11-01  203  	struct nvif_vmm_v0 *args;
920d2b5ef2157e Ben Skeggs       2017-11-01  204  	u32 argn = sizeof(*args) + argc;
920d2b5ef2157e Ben Skeggs       2017-11-01  205  	int ret = -ENOSYS, i;
920d2b5ef2157e Ben Skeggs       2017-11-01  206  
920d2b5ef2157e Ben Skeggs       2017-11-01  207  	vmm->object.client = NULL;
920d2b5ef2157e Ben Skeggs       2017-11-01  208  	vmm->page = NULL;
920d2b5ef2157e Ben Skeggs       2017-11-01  209  
920d2b5ef2157e Ben Skeggs       2017-11-01  210  	if (!(args = kmalloc(argn, GFP_KERNEL)))
920d2b5ef2157e Ben Skeggs       2017-11-01  211  		return -ENOMEM;
920d2b5ef2157e Ben Skeggs       2017-11-01  212  	args->version = 0;
920d2b5ef2157e Ben Skeggs       2017-11-01  213  	args->addr = addr;
920d2b5ef2157e Ben Skeggs       2017-11-01  214  	args->size = size;
f5708c2f516f45 Danilo Krummrich 2023-06-20  215  
f5708c2f516f45 Danilo Krummrich 2023-06-20  216  	switch (type) {
f5708c2f516f45 Danilo Krummrich 2023-06-20  217  	case UNMANAGED: args->type = NVIF_VMM_V0_TYPE_UNMANAGED; break;
f5708c2f516f45 Danilo Krummrich 2023-06-20  218  	case MANAGED: args->type = NVIF_VMM_V0_TYPE_MANAGED; break;
f5708c2f516f45 Danilo Krummrich 2023-06-20  219  	case RAW: args->type = NVIF_VMM_V0_TYPE_RAW; break;
f5708c2f516f45 Danilo Krummrich 2023-06-20  220  	default:
f5708c2f516f45 Danilo Krummrich 2023-06-20  221  		WARN_ON(1);
f5708c2f516f45 Danilo Krummrich 2023-06-20 @222  		return -EINVAL;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
