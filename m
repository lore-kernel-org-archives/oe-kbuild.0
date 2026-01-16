Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90671B87C9
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jan 2026 12:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768566543; cv=none; b=lSfT0HP4mzWip1qxmspLcwELZTehQ75lnZHqMQdF9VRmvZbDOQONwzwTyE0H6x3KcSecXgx8dUqW++s0E5TghGAI8ImT4uIudGD2QyXeCLcQ3eHPvQmdllyZcHywDj6TBUK4oK/ftFcRlFey8luShBH4OrH30ttZM+wpMpHOmyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768566543; c=relaxed/simple;
	bh=WVVjSSE0kQvxP2mYu25ZUiZt+Vjez4xiLmgMU64V3fo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=G7Ms9MouAsLIidY5o8tUj2/qPaS+IPAqD316IXqFh8YOgKlVa+ag6rdTndmAkLiIyBZoFforJuDoR6XZKwnWFGt3lBgEAgwUf3jFVPueaeJiErRhA7HTQGb+AcSAgsqpWqBIguxv86IwP6FPA4v3DuUgiZQOgq7p9VWNKyJuIFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RrjxP1PT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RrjxP1PT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768566541; x=1800102541;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WVVjSSE0kQvxP2mYu25ZUiZt+Vjez4xiLmgMU64V3fo=;
  b=RrjxP1PTv6tyxSQRv/8TvtOIZaOLxzLCkbJSRVdsMZkwJT2rIn6nOlfn
   K26QQlTfBOBe7wYHUxidP3Dn0nmfqqId3E5rp4Z5aGsHCbO/kfyidlDjr
   +Xw3NybeAwgTjbBF3KWvy5SuBDk/jskRyYKxG1vAhjsPjjAoJdGisR7My
   mllBTwnle41UbR1smhnAaUBbdBNBwhCrIHS6poQHd+TwwJ5sE0UwxCi9V
   +36CPbStPRQIL17lh5l5WnHAl9UDFFiyiZ7zsJNuDME/IrXJ+thgYPUXJ
   GBFpN1DQLngkaz8MIEcgpCqSpDKNNNTSk0fY4FMlHeSxhVG0SAmAIWXOG
   A==;
X-CSE-ConnectionGUID: OUPP5lD4RuWvrK59znSMdw==
X-CSE-MsgGUID: Q340w9zoTCuRwl56YjOLGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="68889853"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="68889853"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:29:00 -0800
X-CSE-ConnectionGUID: pB2f/XHGQQWmJtWrcv255g==
X-CSE-MsgGUID: nnqEwv5oTxaBSLsejTV1hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="204384757"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Jan 2026 04:28:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgiwi-00000000KpG-0PzN;
	Fri, 16 Jan 2026 12:28:56 +0000
Date: Fri, 16 Jan 2026 20:28:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android15-6.6 4/4]
 drivers/gpu/drm/ttm/ttm_resource.c:440 ttm_resource_manager_evict_all()
 error: uninitialized symbol 'ret'.
Message-ID: <202601162042.mrCEt4Ms-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   a58a97026588e9128868c7778ca1ffacbb53c931
commit: 3c9ca275100e4fae48ab5206021b3ec82cf37b04 [4/4] drm/ttm: Should to r=
eturn the evict error
:::::: branch date: 13 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-141-20260116 (https://download.01.org/0day-ci/archi=
ve/20260116/202601162042.mrCEt4Ms-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601162042.mrCEt4Ms-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/ttm/ttm_resource.c:440 ttm_resource_manager_evict_all() err=
or: uninitialized symbol 'ret'.

vim +/ret +440 drivers/gpu/drm/ttm/ttm_resource.c

b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  401 =20
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  402  /*
4ce032d64c2a30c Christian K=C3=B6nig 2020-10-01  403   * ttm_resource_manag=
er_evict_all
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  404   *
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  405   * @bdev - device to =
use
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  406   * @man - manager to =
use
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  407   *
4ce032d64c2a30c Christian K=C3=B6nig 2020-10-01  408   * Evict all the obje=
cts out of a memory manager until it is empty.
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  409   * Part of memory man=
ager cleanup sequence.
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  410   */
8af8a109b34fa88 Christian K=C3=B6nig 2020-10-01  411  int ttm_resource_mana=
ger_evict_all(struct ttm_device *bdev,
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  412  				   struct ttm_res=
ource_manager *man)
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  413  {
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  414  	struct ttm_operation=
_ctx ctx =3D {
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  415  		.interruptible =3D =
false,
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  416  		.no_wait_gpu =3D fa=
lse,
c44dfe4de053914 Christian K=C3=B6nig 2020-11-02  417  		.force_alloc =3D tr=
ue
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  418  	};
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  419  	struct dma_fence *fe=
nce;
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  420  	int ret;
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  421  	unsigned i;
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  422 =20
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  423  	/*
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  424  	 * Can't use standar=
d list traversal since we're unlocking.
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  425  	 */
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  426 =20
a1f091f8ef2b680 Christian K=C3=B6nig 2020-10-06  427  	spin_lock(&bdev->lru=
_lock);
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  428  	for (i =3D 0; i < TT=
M_MAX_BO_PRIORITY; ++i) {
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  429  		while (!list_empty(=
&man->lru[i])) {
a1f091f8ef2b680 Christian K=C3=B6nig 2020-10-06  430  			spin_unlock(&bdev-=
>lru_lock);
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  431  			ret =3D ttm_mem_ev=
ict_first(bdev, man, NULL, &ctx,
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  432  						  NULL);
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  433  			if (ret)
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  434  				return ret;
a1f091f8ef2b680 Christian K=C3=B6nig 2020-10-06  435  			spin_lock(&bdev->l=
ru_lock);
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  436  		}
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  437  	}
a1f091f8ef2b680 Christian K=C3=B6nig 2020-10-06  438  	spin_unlock(&bdev->l=
ru_lock);
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  439 =20
3c9ca275100e4fa Emily Deng      2025-06-03 @440  	if (ret && ret !=3D -ENOE=
NT)
3c9ca275100e4fa Emily Deng      2025-06-03  441  		return ret;
3c9ca275100e4fa Emily Deng      2025-06-03  442 =20
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  443  	spin_lock(&man->move=
_lock);
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  444  	fence =3D dma_fence_=
get(man->move);
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  445  	spin_unlock(&man->mo=
ve_lock);
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  446 =20
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  447  	if (fence) {
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  448  		ret =3D dma_fence_w=
ait(fence, false);
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  449  		dma_fence_put(fence=
);
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  450  		if (ret)
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  451  			return ret;
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  452  	}
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  453 =20
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  454  	return 0;
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  455  }
4ce032d64c2a30c Christian K=C3=B6nig 2020-10-01  456  EXPORT_SYMBOL(ttm_res=
ource_manager_evict_all);
b2458726b38cb69 Christian K=C3=B6nig 2020-08-03  457 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
