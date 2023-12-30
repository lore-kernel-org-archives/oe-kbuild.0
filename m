Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6DE23A0
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Dec 2023 09:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="msftNFcZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703927800; x=1735463800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XnhV/DVN7sO2JOkx2BZbEkGilCPhuuQrB670p2+zZcA=;
  b=msftNFcZ1t9dXZ+o6Cj458N+wK8tRyylN62yxfqI1RdxreJXwJd8sKXM
   /RaG+Q16bkPO7PUAw7PfqTvlV/Wzf2srJ2X/IlrTRx0ziLUm1KAO0L2/7
   kTHVxxHnG6yG4BR+K/dptJ3GGBJsomAwpglLqvUgnSWgZGMn2+yxXzD20
   FixMdnxvuvwQBeKj6vlvJ35UitQoO3aBdk9eH/hGNTyRIpS4G73AYkm4Z
   Hw06IDr9Ao96WVI4e1BRxKbCG+EC+SLHzmSvUMvli465MlqHTtXlhOAzh
   fwXUuajZJAFfTtT0FLQEsQ0KH+fmpS9Us7DinKvTOYuB2OoM6yqeLULZi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="400510053"
X-IronPort-AV: E=Sophos;i="6.04,317,1695711600"; 
   d="scan'208";a="400510053"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2023 01:16:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="922531006"
X-IronPort-AV: E=Sophos;i="6.04,317,1695711600"; 
   d="scan'208";a="922531006"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2023 01:16:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJVSO-000IIP-0B;
	Sat, 30 Dec 2023 09:16:36 +0000
Date: Sat, 30 Dec 2023 17:15:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c:258:2-8: preceding
 lock on line 251
Message-ID: <202312301746.jTF1fzL5-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Ben Skeggs <bskeggs@redhat.com>
CC: Lyude Paul <lyude@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f016f7547aeedefed9450499d002ba983b8fce15
commit: f48dd2936138882d7755cbbc5d9984015c75980c drm/nouveau/fifo: add new engine context tracking
date:   1 year, 2 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 1 year, 2 months ago
config: loongarch-randconfig-r062-20231222 (https://download.01.org/0day-ci/archive/20231230/202312301746.jTF1fzL5-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312301746.jTF1fzL5-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c:258:2-8: preceding lock on line 251

vim +258 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c

f48dd293613888 Ben Skeggs 2022-06-01  240  
f48dd293613888 Ben Skeggs 2022-06-01  241  int
f48dd293613888 Ben Skeggs 2022-06-01  242  nvkm_chan_cctx_get(struct nvkm_chan *chan, struct nvkm_engn *engn, struct nvkm_cctx **pcctx,
f48dd293613888 Ben Skeggs 2022-06-01  243  		   struct nvkm_client *client)
f48dd293613888 Ben Skeggs 2022-06-01  244  {
f48dd293613888 Ben Skeggs 2022-06-01  245  	struct nvkm_cgrp *cgrp = chan->cgrp;
f48dd293613888 Ben Skeggs 2022-06-01  246  	struct nvkm_vctx *vctx;
f48dd293613888 Ben Skeggs 2022-06-01  247  	struct nvkm_cctx *cctx;
f48dd293613888 Ben Skeggs 2022-06-01  248  	int ret;
f48dd293613888 Ben Skeggs 2022-06-01  249  
f48dd293613888 Ben Skeggs 2022-06-01  250  	/* Look for an existing channel context for this engine+VEID. */
f48dd293613888 Ben Skeggs 2022-06-01 @251  	mutex_lock(&cgrp->mutex);
f48dd293613888 Ben Skeggs 2022-06-01  252  	cctx = nvkm_list_find(cctx, &chan->cctxs, head,
f48dd293613888 Ben Skeggs 2022-06-01  253  			      cctx->vctx->ectx->engn == engn && cctx->vctx->vmm == chan->vmm);
f48dd293613888 Ben Skeggs 2022-06-01  254  	if (cctx) {
f48dd293613888 Ben Skeggs 2022-06-01  255  		refcount_inc(&cctx->refs);
f48dd293613888 Ben Skeggs 2022-06-01  256  		*pcctx = cctx;
f48dd293613888 Ben Skeggs 2022-06-01  257  		mutex_unlock(&chan->cgrp->mutex);
f48dd293613888 Ben Skeggs 2022-06-01 @258  		return 0;
f48dd293613888 Ben Skeggs 2022-06-01  259  	}
f48dd293613888 Ben Skeggs 2022-06-01  260  
f48dd293613888 Ben Skeggs 2022-06-01  261  	/* Nope - create a fresh one.  But, sub-context first. */
f48dd293613888 Ben Skeggs 2022-06-01  262  	ret = nvkm_cgrp_vctx_get(cgrp, engn, chan, &vctx, client);
f48dd293613888 Ben Skeggs 2022-06-01  263  	if (ret) {
f48dd293613888 Ben Skeggs 2022-06-01  264  		CHAN_ERROR(chan, "vctx %d[%s]: %d", engn->id, engn->engine->subdev.name, ret);
f48dd293613888 Ben Skeggs 2022-06-01  265  		goto done;
f48dd293613888 Ben Skeggs 2022-06-01  266  	}
f48dd293613888 Ben Skeggs 2022-06-01  267  
f48dd293613888 Ben Skeggs 2022-06-01  268  	/* Now, create the channel context - to track engine binding. */
f48dd293613888 Ben Skeggs 2022-06-01  269  	CHAN_TRACE(chan, "ctor cctx %d[%s]", engn->id, engn->engine->subdev.name);
f48dd293613888 Ben Skeggs 2022-06-01  270  	if (!(cctx = *pcctx = kzalloc(sizeof(*cctx), GFP_KERNEL))) {
f48dd293613888 Ben Skeggs 2022-06-01  271  		nvkm_cgrp_vctx_put(cgrp, &vctx);
f48dd293613888 Ben Skeggs 2022-06-01  272  		ret = -ENOMEM;
f48dd293613888 Ben Skeggs 2022-06-01  273  		goto done;
f48dd293613888 Ben Skeggs 2022-06-01  274  	}
f48dd293613888 Ben Skeggs 2022-06-01  275  
f48dd293613888 Ben Skeggs 2022-06-01  276  	cctx->vctx = vctx;
f48dd293613888 Ben Skeggs 2022-06-01  277  	refcount_set(&cctx->refs, 1);
f48dd293613888 Ben Skeggs 2022-06-01  278  	refcount_set(&cctx->uses, 0);
f48dd293613888 Ben Skeggs 2022-06-01  279  	list_add_tail(&cctx->head, &chan->cctxs);
f48dd293613888 Ben Skeggs 2022-06-01  280  done:
f48dd293613888 Ben Skeggs 2022-06-01  281  	mutex_unlock(&cgrp->mutex);
f48dd293613888 Ben Skeggs 2022-06-01  282  	return ret;
f48dd293613888 Ben Skeggs 2022-06-01  283  }
f48dd293613888 Ben Skeggs 2022-06-01  284  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
