Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E03965C
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Sep 2023 04:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695272328; x=1726808328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sHyyRrLxaNDozMr6a8n8Dv429fnF8kIqIk2k5iOlyW8=;
  b=gh0GqSn6jlYqIc7Dexu8+eh+LS7Xpcb1xcoR5AEQxaadvwDWqV0BJ4hW
   2CKd+LcWBUjU4Ilj3BzRoTkHWHyVkm1Oi9/FAm+AEyjfa4mosxwh/FkEj
   gdEkuOH/mDwajm+ar0JScGwqbldDO7AyTR8cJZOx3Bs9Tkenv4vGChLLR
   hN4bf9/RucqM80a1KgHJLgTSklVCYw4PMPxPgZ1quQhUbtvth73qkqkcy
   6D6n3mi5JMyR1GWlltcRxnCmnXc5rprwKoBE8McEA1iALl5TL+Dfs8u4q
   dKk3CafPL7leb8fjOw/lfb4I/SygC6o/RZ8ME/oMd1f2nywX29boeeVPV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="446888809"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="446888809"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 21:58:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="723600560"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="723600560"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 20 Sep 2023 21:58:46 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjBlx-0009WQ-2b;
	Thu, 21 Sep 2023 04:58:43 +0000
Date: Thu, 21 Sep 2023 12:57:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c:282
 nvkm_chan_cctx_get() warn: inconsistent returns '&cgrp->mutex'.
Message-ID: <202309211208.i7zIRZQ9-lkp@intel.com>
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
head:   42dc814987c1feb6410904e58cfd4c36c4146150
commit: f48dd2936138882d7755cbbc5d9984015c75980c drm/nouveau/fifo: add new engine context tracking
date:   11 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-141-20230920 (https://download.01.org/0day-ci/archive/20230921/202309211208.i7zIRZQ9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230921/202309211208.i7zIRZQ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309211208.i7zIRZQ9-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c:282 nvkm_chan_cctx_get() warn: inconsistent returns '&cgrp->mutex'.

vim +282 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c

f48dd2936138882 Ben Skeggs 2022-06-01  240  
f48dd2936138882 Ben Skeggs 2022-06-01  241  int
f48dd2936138882 Ben Skeggs 2022-06-01  242  nvkm_chan_cctx_get(struct nvkm_chan *chan, struct nvkm_engn *engn, struct nvkm_cctx **pcctx,
f48dd2936138882 Ben Skeggs 2022-06-01  243  		   struct nvkm_client *client)
f48dd2936138882 Ben Skeggs 2022-06-01  244  {
f48dd2936138882 Ben Skeggs 2022-06-01  245  	struct nvkm_cgrp *cgrp = chan->cgrp;
f48dd2936138882 Ben Skeggs 2022-06-01  246  	struct nvkm_vctx *vctx;
f48dd2936138882 Ben Skeggs 2022-06-01  247  	struct nvkm_cctx *cctx;
f48dd2936138882 Ben Skeggs 2022-06-01  248  	int ret;
f48dd2936138882 Ben Skeggs 2022-06-01  249  
f48dd2936138882 Ben Skeggs 2022-06-01  250  	/* Look for an existing channel context for this engine+VEID. */
f48dd2936138882 Ben Skeggs 2022-06-01  251  	mutex_lock(&cgrp->mutex);
f48dd2936138882 Ben Skeggs 2022-06-01  252  	cctx = nvkm_list_find(cctx, &chan->cctxs, head,
f48dd2936138882 Ben Skeggs 2022-06-01  253  			      cctx->vctx->ectx->engn == engn && cctx->vctx->vmm == chan->vmm);
f48dd2936138882 Ben Skeggs 2022-06-01  254  	if (cctx) {
f48dd2936138882 Ben Skeggs 2022-06-01  255  		refcount_inc(&cctx->refs);
f48dd2936138882 Ben Skeggs 2022-06-01  256  		*pcctx = cctx;
f48dd2936138882 Ben Skeggs 2022-06-01  257  		mutex_unlock(&chan->cgrp->mutex);
f48dd2936138882 Ben Skeggs 2022-06-01  258  		return 0;
f48dd2936138882 Ben Skeggs 2022-06-01  259  	}
f48dd2936138882 Ben Skeggs 2022-06-01  260  
f48dd2936138882 Ben Skeggs 2022-06-01  261  	/* Nope - create a fresh one.  But, sub-context first. */
f48dd2936138882 Ben Skeggs 2022-06-01  262  	ret = nvkm_cgrp_vctx_get(cgrp, engn, chan, &vctx, client);
f48dd2936138882 Ben Skeggs 2022-06-01  263  	if (ret) {
f48dd2936138882 Ben Skeggs 2022-06-01  264  		CHAN_ERROR(chan, "vctx %d[%s]: %d", engn->id, engn->engine->subdev.name, ret);
f48dd2936138882 Ben Skeggs 2022-06-01  265  		goto done;
f48dd2936138882 Ben Skeggs 2022-06-01  266  	}
f48dd2936138882 Ben Skeggs 2022-06-01  267  
f48dd2936138882 Ben Skeggs 2022-06-01  268  	/* Now, create the channel context - to track engine binding. */
f48dd2936138882 Ben Skeggs 2022-06-01  269  	CHAN_TRACE(chan, "ctor cctx %d[%s]", engn->id, engn->engine->subdev.name);
f48dd2936138882 Ben Skeggs 2022-06-01  270  	if (!(cctx = *pcctx = kzalloc(sizeof(*cctx), GFP_KERNEL))) {
f48dd2936138882 Ben Skeggs 2022-06-01  271  		nvkm_cgrp_vctx_put(cgrp, &vctx);
f48dd2936138882 Ben Skeggs 2022-06-01  272  		ret = -ENOMEM;
f48dd2936138882 Ben Skeggs 2022-06-01  273  		goto done;
f48dd2936138882 Ben Skeggs 2022-06-01  274  	}
f48dd2936138882 Ben Skeggs 2022-06-01  275  
f48dd2936138882 Ben Skeggs 2022-06-01  276  	cctx->vctx = vctx;
f48dd2936138882 Ben Skeggs 2022-06-01  277  	refcount_set(&cctx->refs, 1);
f48dd2936138882 Ben Skeggs 2022-06-01  278  	refcount_set(&cctx->uses, 0);
f48dd2936138882 Ben Skeggs 2022-06-01  279  	list_add_tail(&cctx->head, &chan->cctxs);
f48dd2936138882 Ben Skeggs 2022-06-01  280  done:
f48dd2936138882 Ben Skeggs 2022-06-01  281  	mutex_unlock(&cgrp->mutex);
f48dd2936138882 Ben Skeggs 2022-06-01 @282  	return ret;
f48dd2936138882 Ben Skeggs 2022-06-01  283  }
f48dd2936138882 Ben Skeggs 2022-06-01  284  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
