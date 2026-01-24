Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987EE263899
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 21:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769290121; cv=none; b=jJ0xBNxSKFN7B4JSZdw2CEVso/YyFfUJQMVZsjqxihSpJFyFZ7DoXv5nzQ9o91CPJv+ZSLePJBZ8thIov3qOp9i8FGCwpNEupmFtxCheMHwv68Zjyycb085+HxyQ8J/yBEgjTC+wNPUx9zC7G8Ax38gtvS/ZtwUIfemDPLu8FJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769290121; c=relaxed/simple;
	bh=wKhZM6sR9Qnet9gwEa8arSR1/BXgo/o1b+8gk3byjIs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=o7CEDQdORiSMJbKYfsblapyTBo30F9v63QngiS90wvRoDnGhfSwEuaQ29ZjN3Metw+W5DoVj4MPVxqznsdmn3r9OgfILT4++hGneyAsHaa/8DOBLbFA+shpj+FCmfM/ilfzSaczRmeFuM46DBKSC4TPbao6i6u4d1uDGVYwJh7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RLCIyqBK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RLCIyqBK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769290119; x=1800826119;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wKhZM6sR9Qnet9gwEa8arSR1/BXgo/o1b+8gk3byjIs=;
  b=RLCIyqBKO3XocctBv4/G62fflvKlMXM794ABdFKFm7kdLN0ncbobQkoE
   5d5bGdrLZCHPP9YemmtkSDLx0bOJr5wAUUvTh2JCZZF80RS+qkBQPZSKd
   K5tMbWtNURI7UHUKs0jYD+kNUsjHeWcwd7BYXilP55btbAAm2UIFmQAGq
   SDBnN59YT9p2kceNKoxNHvDMNCrz4UCA9mVr0mGCziztwowe/6b5jMs+2
   v+KsOnQbGxvuqJQk616D43Y3QIxbGuLCkfy5il+K3Vs6ner3esIMhJ3yH
   4ZJBo6nZdQPKx9sU/gNXK89EhQElrdoEIxNqvbExjOr99TZkq9HxrNEYE
   w==;
X-CSE-ConnectionGUID: t5aPLvhBT5SorP7Cv3mPBA==
X-CSE-MsgGUID: I/2r+SrWRimg67lAcVm7Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="70670464"
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="70670464"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 13:28:38 -0800
X-CSE-ConnectionGUID: VVJN4kWVTVm/JruVo9lorw==
X-CSE-MsgGUID: t6PV2WzdREmIwtTujRjmtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="207134998"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Jan 2026 13:28:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjlBK-00000000VYC-0bLx;
	Sat, 24 Jan 2026 21:28:34 +0000
Date: Sun, 25 Jan 2026 05:27:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-5.10 1/1]
 drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:573 ttm_dma_pool_init() warn: use
 'flags' here instead of GFP_KERNEL?
Message-ID: <202601250530.NGQqdYRI-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   34f18325482c3d746fbc51928e177996fb5d55f1
commit: 51c9ed876ce194f1f3c6bd778b7bb46a8deb1dd9 [1/1] ANDROID: GKI: Add DR=
M_TTM config to GKI
:::::: branch date: 9 hours ago
:::::: commit date: 6 years ago
config: x86_64-randconfig-161-20260125 (https://download.01.org/0day-ci/arc=
hive/20260125/202601250530.NGQqdYRI-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8=
addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601250530.NGQqdYRI-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:573 ttm_dma_pool_init() warn: use =
'flags' here instead of GFP_KERNEL?
drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:1191 ttm_dma_page_alloc_init() war=
n: Calling kobject_put|get with state->initialized unset from line: 1168

Old smatch warnings:
drivers/gpu/drm/ttm/ttm_page_alloc_dma.c:578 ttm_dma_pool_init() warn: use =
'flags' here instead of GFP_KERNEL?

vim +/flags +573 drivers/gpu/drm/ttm/ttm_page_alloc_dma.c

2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  552 =20
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  553  static struct dma_poo=
l *ttm_dma_pool_init(struct device *dev, gfp_t flags,
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  554  					  enum pool_type=
 type)
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  555  {
648bc357471640 Christian K=C3=B6nig       2017-07-06  556  	const char *n[]=
 =3D {"wc", "uc", "cached", " dma32", "huge"};
648bc357471640 Christian K=C3=B6nig       2017-07-06  557  	enum pool_type =
t[] =3D {IS_WC, IS_UC, IS_CACHED, IS_DMA32, IS_HUGE};
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  558  	struct device_pools =
*sec_pool =3D NULL;
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  559  	struct dma_pool *poo=
l =3D NULL, **ptr;
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  560  	unsigned i;
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  561  	int ret =3D -ENODEV;
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  562  	char *p;
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  563 =20
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  564  	if (!dev)
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  565  		return NULL;
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  566 =20
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  567  	ptr =3D devres_alloc=
(ttm_dma_pool_release, sizeof(*ptr), GFP_KERNEL);
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  568  	if (!ptr)
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  569  		return NULL;
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  570 =20
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  571  	ret =3D -ENOMEM;
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  572 =20
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03 @573  	pool =3D kmalloc_nod=
e(sizeof(struct dma_pool), GFP_KERNEL,
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  574  			    dev_to_node(de=
v));
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  575  	if (!pool)
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  576  		goto err_mem;
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  577 =20
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  578  	sec_pool =3D kmalloc=
_node(sizeof(struct device_pools), GFP_KERNEL,
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  579  				dev_to_node(dev));
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  580  	if (!sec_pool)
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  581  		goto err_mem;
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  582 =20
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  583  	INIT_LIST_HEAD(&sec_=
pool->pools);
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  584  	sec_pool->dev =3D de=
v;
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  585  	sec_pool->pool =3D  =
pool;
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  586 =20
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  587  	INIT_LIST_HEAD(&pool=
->free_list);
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  588  	INIT_LIST_HEAD(&pool=
->pools);
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  589  	spin_lock_init(&pool=
->lock);
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  590  	pool->dev =3D dev;
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  591  	pool->npages_free =
=3D pool->npages_in_use =3D 0;
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  592  	pool->nfrees =3D 0;
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  593  	pool->gfp_flags =3D =
flags;
648bc357471640 Christian K=C3=B6nig       2017-07-06  594  	if (type & IS_H=
UGE)
648bc357471640 Christian K=C3=B6nig       2017-07-06  595  #ifdef CONFIG_TR=
ANSPARENT_HUGEPAGE
648bc357471640 Christian K=C3=B6nig       2017-07-06  596  		pool->size =3D =
HPAGE_PMD_SIZE;
648bc357471640 Christian K=C3=B6nig       2017-07-06  597  #else
648bc357471640 Christian K=C3=B6nig       2017-07-06  598  		BUG();
648bc357471640 Christian K=C3=B6nig       2017-07-06  599  #endif
648bc357471640 Christian K=C3=B6nig       2017-07-06  600  	else
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  601  		pool->size =3D PAGE=
_SIZE;
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  602  	pool->type =3D type;
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  603  	pool->nrefills =3D 0;
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  604  	p =3D pool->name;
648bc357471640 Christian K=C3=B6nig       2017-07-06  605  	for (i =3D 0; i=
 < ARRAY_SIZE(t); i++) {
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  606  		if (type & t[i]) {
41252c6d1c3bc6 Takashi Iwai          2020-03-11  607  			p +=3D scnprintf(p=
, sizeof(pool->name) - (p - pool->name),
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  608  				      "%s", n[i]);
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  609  		}
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  610  	}
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  611  	*p =3D 0;
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  612  	/* We copy the name =
for pr_ calls b/c when dma_pool_destroy is called
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  613  	 * - the kobj->name =
has already been deallocated.*/
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  614  	snprintf(pool->dev_n=
ame, sizeof(pool->dev_name), "%s %s",
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  615  		 dev_driver_string(=
dev), dev_name(dev));
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  616  	mutex_lock(&_manager=
->lock);
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  617  	/* You can get the d=
ma_pool from either the global: */
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  618  	list_add(&sec_pool->=
pools, &_manager->pools);
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  619  	_manager->npools++;
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  620  	/* or from 'struct d=
evice': */
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  621  	list_add(&pool->pool=
s, &dev->dma_pools);
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  622  	mutex_unlock(&_manag=
er->lock);
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  623 =20
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  624  	*ptr =3D pool;
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  625  	devres_add(dev, ptr);
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  626 =20
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  627  	return pool;
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  628  err_mem:
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  629  	devres_free(ptr);
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  630  	kfree(sec_pool);
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  631  	kfree(pool);
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  632  	return ERR_PTR(ret);
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  633  }
2334b75ffbef6b Konrad Rzeszutek Wilk 2011-11-03  634 =20

:::::: The code at line 573 was first introduced by commit
:::::: 2334b75ffbef6b8932f09ec4418b65ddb764ae99 drm/ttm: provide dma aware =
ttm page pool code V9

:::::: TO: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
