Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A973C2F29
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 23:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674171155; x=1705707155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N2TLH0GHszLBPxC/iHTEtakKwqFyqqEDHUswrRkOtbk=;
  b=fYse324FsjC8i9FqVajCx0ghnaDXUgiViZgMgB41dlVGi6qvuns2HIsa
   JkTwmMZCaeDMklEjMgJDIEx4beVyJL0/lc+TzEyLH/+RgBvs1LiCyHyrC
   NFx76ffHzjSOtqHKmtb9goZjD8RYdBtQXvGCW7TrMpA4p7QZIxtWeYTZP
   1+StDHNN4JHq96f0lNm1mjwRYb783dlry7oApjLoL70juAS9TUKpJTqbr
   l6BpL7lE8/84ixOOkYl2J9EvVhzXDYfHD1K6CjDmg1n/Kcq02eY6mYBg9
   qSxqFvffla+FlFo8sj9Le8YYqVyY8v3fnoOUUGggttPGFGLvR3T0JdsSS
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="313349805"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="313349805"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 15:32:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="690828485"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="690828485"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Jan 2023 15:32:28 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIeOS-0001yG-0n;
	Thu, 19 Jan 2023 23:32:28 +0000
Date: Fri, 20 Jan 2023 07:32:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH drm-next 13/14] drm/nouveau: implement new VM_BIND UAPI
Message-ID: <202301200752.muIBg2TR-lkp@intel.com>
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
In-Reply-To: <20230118061256.2689-14-dakr@redhat.com>
References: <20230118061256.2689-14-dakr@redhat.com>
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
patch link:    https://lore.kernel.org/r/20230118061256.2689-14-dakr%40redhat.com
patch subject: [PATCH drm-next 13/14] drm/nouveau: implement new VM_BIND UAPI
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: ia64-randconfig-m041-20230119 (https://download.01.org/0day-ci/archive/20230120/202301200752.muIBg2TR-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/gpu/drm/nouveau/nouveau_sched.c:256 nouveau_bind_job_run() warn: passing zero to 'ERR_PTR'
drivers/gpu/drm/nouveau/nouveau_sched.c:466 nouveau_exec_job_submit() warn: inconsistent returns '&uvmm->mutex'.

vim +/ERR_PTR +256 drivers/gpu/drm/nouveau/nouveau_sched.c

85eb5d5193ee71 Danilo Krummrich 2023-01-18  204  
85eb5d5193ee71 Danilo Krummrich 2023-01-18  205  static struct dma_fence *
85eb5d5193ee71 Danilo Krummrich 2023-01-18  206  nouveau_bind_job_run(struct nouveau_job *job)
85eb5d5193ee71 Danilo Krummrich 2023-01-18  207  {
85eb5d5193ee71 Danilo Krummrich 2023-01-18  208  	struct nouveau_bind_job *bind_job = to_nouveau_bind_job(job);
85eb5d5193ee71 Danilo Krummrich 2023-01-18  209  	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(job->cli);
85eb5d5193ee71 Danilo Krummrich 2023-01-18  210  	struct bind_job_op *op;
85eb5d5193ee71 Danilo Krummrich 2023-01-18  211  	int ret = 0;
85eb5d5193ee71 Danilo Krummrich 2023-01-18  212  
85eb5d5193ee71 Danilo Krummrich 2023-01-18  213  	nouveau_uvmm_lock(uvmm);
85eb5d5193ee71 Danilo Krummrich 2023-01-18  214  	list_for_each_op(op, &bind_job->ops) {
85eb5d5193ee71 Danilo Krummrich 2023-01-18  215  		switch (op->op) {
85eb5d5193ee71 Danilo Krummrich 2023-01-18  216  		case OP_ALLOC: {
85eb5d5193ee71 Danilo Krummrich 2023-01-18  217  			bool sparse = op->flags & DRM_NOUVEAU_VM_BIND_SPARSE;
85eb5d5193ee71 Danilo Krummrich 2023-01-18  218  
85eb5d5193ee71 Danilo Krummrich 2023-01-18  219  			ret = nouveau_uvma_region_new(uvmm,
85eb5d5193ee71 Danilo Krummrich 2023-01-18  220  						      op->va.addr,
85eb5d5193ee71 Danilo Krummrich 2023-01-18  221  						      op->va.range,
85eb5d5193ee71 Danilo Krummrich 2023-01-18  222  						      sparse);
85eb5d5193ee71 Danilo Krummrich 2023-01-18  223  			if (ret)
85eb5d5193ee71 Danilo Krummrich 2023-01-18  224  				goto out_unlock;
85eb5d5193ee71 Danilo Krummrich 2023-01-18  225  			break;
85eb5d5193ee71 Danilo Krummrich 2023-01-18  226  		}
85eb5d5193ee71 Danilo Krummrich 2023-01-18  227  		case OP_FREE:
85eb5d5193ee71 Danilo Krummrich 2023-01-18  228  			ret = nouveau_uvma_region_destroy(uvmm,
85eb5d5193ee71 Danilo Krummrich 2023-01-18  229  							  op->va.addr,
85eb5d5193ee71 Danilo Krummrich 2023-01-18  230  							  op->va.range);
85eb5d5193ee71 Danilo Krummrich 2023-01-18  231  			if (ret)
85eb5d5193ee71 Danilo Krummrich 2023-01-18  232  				goto out_unlock;
85eb5d5193ee71 Danilo Krummrich 2023-01-18  233  			break;
85eb5d5193ee71 Danilo Krummrich 2023-01-18  234  		case OP_MAP:
85eb5d5193ee71 Danilo Krummrich 2023-01-18  235  			ret = nouveau_uvmm_sm_map(uvmm,
85eb5d5193ee71 Danilo Krummrich 2023-01-18  236  						  op->va.addr, op->va.range,
85eb5d5193ee71 Danilo Krummrich 2023-01-18  237  						  op->gem.obj, op->gem.offset,
85eb5d5193ee71 Danilo Krummrich 2023-01-18  238  						  op->flags && 0xff);
85eb5d5193ee71 Danilo Krummrich 2023-01-18  239  			if (ret)
85eb5d5193ee71 Danilo Krummrich 2023-01-18  240  				goto out_unlock;
85eb5d5193ee71 Danilo Krummrich 2023-01-18  241  			break;
85eb5d5193ee71 Danilo Krummrich 2023-01-18  242  		case OP_UNMAP:
85eb5d5193ee71 Danilo Krummrich 2023-01-18  243  			ret = nouveau_uvmm_sm_unmap(uvmm,
85eb5d5193ee71 Danilo Krummrich 2023-01-18  244  						    op->va.addr,
85eb5d5193ee71 Danilo Krummrich 2023-01-18  245  						    op->va.range);
85eb5d5193ee71 Danilo Krummrich 2023-01-18  246  			if (ret)
85eb5d5193ee71 Danilo Krummrich 2023-01-18  247  				goto out_unlock;
85eb5d5193ee71 Danilo Krummrich 2023-01-18  248  			break;
85eb5d5193ee71 Danilo Krummrich 2023-01-18  249  		}
85eb5d5193ee71 Danilo Krummrich 2023-01-18  250  	}
85eb5d5193ee71 Danilo Krummrich 2023-01-18  251  
85eb5d5193ee71 Danilo Krummrich 2023-01-18  252  out_unlock:
85eb5d5193ee71 Danilo Krummrich 2023-01-18  253  	nouveau_uvmm_unlock(uvmm);
85eb5d5193ee71 Danilo Krummrich 2023-01-18  254  	if (ret)
85eb5d5193ee71 Danilo Krummrich 2023-01-18  255  		NV_PRINTK(err, job->cli, "bind job failed: %d\n", ret);
85eb5d5193ee71 Danilo Krummrich 2023-01-18 @256  	return ERR_PTR(ret);
85eb5d5193ee71 Danilo Krummrich 2023-01-18  257  }
85eb5d5193ee71 Danilo Krummrich 2023-01-18  258  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
