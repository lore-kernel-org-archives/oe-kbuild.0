Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C9E230E8
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jun 2023 11:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687518728; x=1719054728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8KGGRt5R0gr162op60DPWNiMzIN5HbvBeD/bpFaQt3s=;
  b=Qv9OhsLg2lw0aQRKw4tCFpqfBC2TkWvr7Oe+QaILdbBP+LiUdgVHux+X
   XU27NyveVxcsg5TfS5/i0y/oNwvpfwwObDUJJ6eATsUKO6LgMabaCZe90
   CjgVZFK3pwb6EzbvFRkoRd4U10KKnkBr+6+hs+MgtW1R49FyxMH7wJlTt
   fDx5pFq4z0Zh4Mny3il1mKU0Ad+tlQHCYwAzwfV007AmcTMGOYRx/kIRJ
   D2iUibLuu/UhGWcEyUeiQ3mPjswAYvYx/QmF2SvE0AH7RedvQjmk+9JRY
   MlLnwNtLb8xgf/DEU4zAlIxpiGPdyDeczeKez5psJfxSA4mAOtyfA4/Jy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="345496592"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="345496592"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 04:12:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="780591774"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="780591774"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Jun 2023 04:12:06 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCehx-0008Dv-2r;
	Fri, 23 Jun 2023 11:12:05 +0000
Date: Fri, 23 Jun 2023 19:12:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH drm-next v5 13/14] drm/nouveau: implement new VM_BIND uAPI
Message-ID: <202306231838.qJDts46t-lkp@intel.com>
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
In-Reply-To: <20230620004217.4700-14-dakr@redhat.com>
References: <20230620004217.4700-14-dakr@redhat.com>
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
patch link:    https://lore.kernel.org/r/20230620004217.4700-14-dakr%40redhat.com
patch subject: [PATCH drm-next v5 13/14] drm/nouveau: implement new VM_BIND uAPI
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: mips-randconfig-m031-20230620 (https://download.01.org/0day-ci/archive/20230623/202306231838.qJDts46t-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306231838.qJDts46t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306231838.qJDts46t-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/nouveau_uvmm.c:1528 nouveau_uvmm_bind_job_run() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +1528 drivers/gpu/drm/nouveau/nouveau_uvmm.c

31c9499051f80c Danilo Krummrich 2023-06-20  1496  
31c9499051f80c Danilo Krummrich 2023-06-20  1497  static struct dma_fence *
31c9499051f80c Danilo Krummrich 2023-06-20  1498  nouveau_uvmm_bind_job_run(struct nouveau_job *job)
31c9499051f80c Danilo Krummrich 2023-06-20  1499  {
31c9499051f80c Danilo Krummrich 2023-06-20  1500  	struct nouveau_uvmm_bind_job *bind_job = to_uvmm_bind_job(job);
31c9499051f80c Danilo Krummrich 2023-06-20  1501  	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(job->cli);
31c9499051f80c Danilo Krummrich 2023-06-20  1502  	struct bind_job_op *op;
31c9499051f80c Danilo Krummrich 2023-06-20  1503  	int ret = 0;
31c9499051f80c Danilo Krummrich 2023-06-20  1504  
31c9499051f80c Danilo Krummrich 2023-06-20  1505  	list_for_each_op(op, &bind_job->ops) {
31c9499051f80c Danilo Krummrich 2023-06-20  1506  		switch (op->op) {
31c9499051f80c Danilo Krummrich 2023-06-20  1507  		case OP_MAP_SPARSE:
31c9499051f80c Danilo Krummrich 2023-06-20  1508  			/* noop */
31c9499051f80c Danilo Krummrich 2023-06-20  1509  			break;
31c9499051f80c Danilo Krummrich 2023-06-20  1510  		case OP_MAP:
31c9499051f80c Danilo Krummrich 2023-06-20  1511  			ret = nouveau_uvmm_sm_map(uvmm, &op->new, op->ops);
31c9499051f80c Danilo Krummrich 2023-06-20  1512  			if (ret)
31c9499051f80c Danilo Krummrich 2023-06-20  1513  				goto out;
31c9499051f80c Danilo Krummrich 2023-06-20  1514  			break;
31c9499051f80c Danilo Krummrich 2023-06-20  1515  		case OP_UNMAP_SPARSE:
31c9499051f80c Danilo Krummrich 2023-06-20  1516  			fallthrough;
31c9499051f80c Danilo Krummrich 2023-06-20  1517  		case OP_UNMAP:
31c9499051f80c Danilo Krummrich 2023-06-20  1518  			ret = nouveau_uvmm_sm_unmap(uvmm, &op->new, op->ops);
31c9499051f80c Danilo Krummrich 2023-06-20  1519  			if (ret)
31c9499051f80c Danilo Krummrich 2023-06-20  1520  				goto out;
31c9499051f80c Danilo Krummrich 2023-06-20  1521  			break;
31c9499051f80c Danilo Krummrich 2023-06-20  1522  		}
31c9499051f80c Danilo Krummrich 2023-06-20  1523  	}
31c9499051f80c Danilo Krummrich 2023-06-20  1524  
31c9499051f80c Danilo Krummrich 2023-06-20  1525  out:
31c9499051f80c Danilo Krummrich 2023-06-20  1526  	if (ret)
31c9499051f80c Danilo Krummrich 2023-06-20  1527  		NV_PRINTK(err, job->cli, "bind job failed: %d\n", ret);
31c9499051f80c Danilo Krummrich 2023-06-20 @1528  	return ERR_PTR(ret);
31c9499051f80c Danilo Krummrich 2023-06-20  1529  }
31c9499051f80c Danilo Krummrich 2023-06-20  1530  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
