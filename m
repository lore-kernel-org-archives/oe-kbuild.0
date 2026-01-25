Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C23AD24
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jan 2026 02:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769306446; cv=none; b=b9YuAqYB6fHaGdKC7O4DOI5GNYLX42Ekp1cdg8pAp0riWvz/UicwuU/b1vsHUhRBhH8b885LvejcrUCD/xL6/KLdDOUIH/fVkMShaOO4fvM2m9tjQkodvVaxehSfwSFdaYN1DIO8BjNvJEbSC2iWaWAQ4ghQMb1kTE4mwRgyxuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769306446; c=relaxed/simple;
	bh=RnANLeeedY7PPKz1xUyMWRNsCQ86J5Rd56fhQxz+O5k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YbXXQuvaemW4Qbu/OdMVZJ98OlqefiuB5zDYEyBGmhRRslZ8vWJG6kZ9PplfNS3jCMrUQ3ngXrVeDzV3WMONx/A8xvEMU7zinZDgFOaBzfYAKs2GGj1I9CGjm3s2aawWygzN+9FNcUaj/OAjlH1L05WEU8IzYr2g6HNCp/nqNOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BPyCpuLE; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPyCpuLE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769306445; x=1800842445;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RnANLeeedY7PPKz1xUyMWRNsCQ86J5Rd56fhQxz+O5k=;
  b=BPyCpuLEgTVk2XOCT32eQBZWpdmppJETDoitFG+/wiLuHphI3VG2+fxC
   rs8V2A9e+6Fzg2ZeFDXmr7tRjbdUaYvAaFrny42q7T0djw4MGETzPfwRY
   6iTli/EyBryU8pTG9PZ9URgdYH5d5IxZBdr3ez+gqsFN4GROkvI5Iqhlu
   bH1u+hzzVqgjiaNgWKyfnrVxPIw9RSi7vhNw1TFtLnzGu3Y5U2YyPWiAs
   U6A2G1IUS11XkT5s6L0QFbANnBcGgvkXjw9/7DsN5+ZVJVkJi9AaFClnq
   lQpsge+9+OAyCUHTdQ4YfwjM+BU78QovBkPWCzKc4thbRS1+hwXcFgxXr
   g==;
X-CSE-ConnectionGUID: VELYkhOVRmWKS1KbbNHk+A==
X-CSE-MsgGUID: 9ORxC0DFTmCwhwNpMlmOQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="88092872"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="88092872"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 18:00:44 -0800
X-CSE-ConnectionGUID: sd3ValegT8CrF+pJNcj2Hw==
X-CSE-MsgGUID: YdBWXoDQTFOKJuMSLWgxMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="238612837"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Jan 2026 18:00:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjpQe-00000000Vg6-2vzv;
	Sun, 25 Jan 2026 02:00:40 +0000
Date: Sun, 25 Jan 2026 10:00:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-kiwi-5.10 198/198]
 drivers/gpu/drm/ttm/ttm_bo.c:854 ttm_mem_evict_first() warn: inconsistent
 returns 'global &ttm_bo_glob.lru_lock'.
Message-ID: <202601250905.skPDsShd-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   23658a471d5af4e7b9df0559075c0b57bbf22a67
commit: 51c9ed876ce194f1f3c6bd778b7bb46a8deb1dd9 [198/198] ANDROID: GKI: Ad=
d DRM_TTM config to GKI
:::::: branch date: 13 hours ago
:::::: commit date: 6 years ago
config: i386-randconfig-141-20260125 (https://download.01.org/0day-ci/archi=
ve/20260125/202601250905.skPDsShd-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601250905.skPDsShd-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/ttm/ttm_bo.c:854 ttm_mem_evict_first() warn: inconsistent r=
eturns 'global &ttm_bo_glob.lru_lock'.
drivers/gpu/drm/ttm/ttm_bo.c:1875 ttm_bo_swapout() warn: inconsistent retur=
ns '&glob->lru_lock'.
drivers/gpu/drm/ttm/ttm_bo_util.c:424 ttm_bo_move_memcpy() error: we previo=
usly assumed 'ttm' could be null (see line 399)
drivers/gpu/drm/ttm/ttm_page_alloc.c:499 ttm_alloc_new_pages() warn: use 'g=
fp_flags' here instead of GFP_KERNEL?
drivers/gpu/drm/ttm/ttm_page_alloc.c:1008 ttm_page_alloc_init() warn: Calli=
ng kobject_put|get with state->initialized unset from line: 967

Old smatch warnings:
drivers/gpu/drm/ttm/ttm_bo.c:840 ttm_mem_evict_first() warn: iterator used =
outside loop: 'bo'

vim +854 drivers/gpu/drm/ttm/ttm_bo.c

d367bd2a5e2b12 Christian K=C3=B6nig   2019-05-22  783 =20
ca262a9998d461 Jerome Glisse     2009-12-08  784  static int ttm_mem_evict_=
first(struct ttm_bo_device *bdev,
ba4e7d973dd09b Thomas Hellstrom  2009-06-10  785  			       uint32_t mem_ty=
pe,
e300180f71037f Michel D=C3=A4nzer     2014-10-09  786  			       const stru=
ct ttm_place *place,
d367bd2a5e2b12 Christian K=C3=B6nig   2019-05-22  787  			       struct ttm=
_operation_ctx *ctx,
d367bd2a5e2b12 Christian K=C3=B6nig   2019-05-22  788  			       struct ww_=
acquire_ctx *ticket)
ba4e7d973dd09b Thomas Hellstrom  2009-06-10  789  {
d367bd2a5e2b12 Christian K=C3=B6nig   2019-05-22  790  	struct ttm_buffer_o=
bject *bo =3D NULL, *busy_bo =3D NULL;
ba4e7d973dd09b Thomas Hellstrom  2009-06-10  791  	struct ttm_mem_type_mana=
ger *man =3D &bdev->man[mem_type];
6ba435812e0d85 Christian K=C3=B6nig   2017-11-08  792  	bool locked =3D fal=
se;
cf6c467d67d319 Christian K=C3=B6nig   2017-01-10  793  	unsigned i;
6ba435812e0d85 Christian K=C3=B6nig   2017-11-08  794  	int ret;
ba4e7d973dd09b Thomas Hellstrom  2009-06-10  795 =20
97588b5b9a6b33 Christian K=C3=B6nig   2019-09-25  796  	spin_lock(&ttm_bo_g=
lob.lru_lock);
cf6c467d67d319 Christian K=C3=B6nig   2017-01-10  797  	for (i =3D 0; i < T=
TM_MAX_BO_PRIORITY; ++i) {
cf6c467d67d319 Christian K=C3=B6nig   2017-01-10  798  		list_for_each_entr=
y(bo, &man->lru[i], lru) {
d367bd2a5e2b12 Christian K=C3=B6nig   2019-05-22  799  			bool busy;
d367bd2a5e2b12 Christian K=C3=B6nig   2019-05-22  800 =20
d367bd2a5e2b12 Christian K=C3=B6nig   2019-05-22  801  			if (!ttm_bo_evict=
_swapout_allowable(bo, ctx, &locked,
d367bd2a5e2b12 Christian K=C3=B6nig   2019-05-22  802  							    &busy)) {
0dbd555a011c2d Christian K=C3=B6nig   2019-07-31  803  				if (busy && !bus=
y_bo && ticket !=3D
52791eeec1d9f4 Christian K=C3=B6nig   2019-08-11  804  				    dma_resv_loc=
king_ctx(bo->base.resv))
d367bd2a5e2b12 Christian K=C3=B6nig   2019-05-22  805  					busy_bo =3D bo;
6ba435812e0d85 Christian K=C3=B6nig   2017-11-08  806  				continue;
d367bd2a5e2b12 Christian K=C3=B6nig   2019-05-22  807  			}
a2ab19fed9d1dc Christian K=C3=B6nig   2016-08-30  808 =20
cf6c467d67d319 Christian K=C3=B6nig   2017-01-10  809  			if (place && !bde=
v->driver->eviction_valuable(bo,
cf6c467d67d319 Christian K=C3=B6nig   2017-01-10  810  								      place)=
) {
6ba435812e0d85 Christian K=C3=B6nig   2017-11-08  811  				if (locked)
52791eeec1d9f4 Christian K=C3=B6nig   2019-08-11  812  					dma_resv_unlock=
(bo->base.resv);
e300180f71037f Michel D=C3=A4nzer     2014-10-09  813  				continue;
e300180f71037f Michel D=C3=A4nzer     2014-10-09  814  			}
1ec39923ef24f5 Christian K=C3=B6nig   2019-11-11  815  			if (!ttm_bo_get_u=
nless_zero(bo)) {
1ec39923ef24f5 Christian K=C3=B6nig   2019-11-11  816  				if (locked)
1ec39923ef24f5 Christian K=C3=B6nig   2019-11-11  817  					dma_resv_unlock=
(bo->base.resv);
1ec39923ef24f5 Christian K=C3=B6nig   2019-11-11  818  				continue;
1ec39923ef24f5 Christian K=C3=B6nig   2019-11-11  819  			}
e7ab20197be3ee Maarten Lankhorst 2012-11-28  820  			break;
e7ab20197be3ee Maarten Lankhorst 2012-11-28  821  		}
e7ab20197be3ee Maarten Lankhorst 2012-11-28  822 =20
6ba435812e0d85 Christian K=C3=B6nig   2017-11-08  823  		/* If the inner lo=
op terminated early, we have our candidate */
6ba435812e0d85 Christian K=C3=B6nig   2017-11-08  824  		if (&bo->lru !=3D =
&man->lru[i])
cf6c467d67d319 Christian K=C3=B6nig   2017-01-10  825  			break;
6ba435812e0d85 Christian K=C3=B6nig   2017-11-08  826 =20
6ba435812e0d85 Christian K=C3=B6nig   2017-11-08  827  		bo =3D NULL;
cf6c467d67d319 Christian K=C3=B6nig   2017-01-10  828  	}
cf6c467d67d319 Christian K=C3=B6nig   2017-01-10  829 =20
6ba435812e0d85 Christian K=C3=B6nig   2017-11-08  830  	if (!bo) {
1ec39923ef24f5 Christian K=C3=B6nig   2019-11-11  831  		if (busy_bo && !tt=
m_bo_get_unless_zero(busy_bo))
1ec39923ef24f5 Christian K=C3=B6nig   2019-11-11  832  			busy_bo =3D NULL;
97588b5b9a6b33 Christian K=C3=B6nig   2019-09-25  833  		spin_unlock(&ttm_b=
o_glob.lru_lock);
d367bd2a5e2b12 Christian K=C3=B6nig   2019-05-22  834  		ret =3D ttm_mem_ev=
ict_wait_busy(busy_bo, ctx, ticket);
d367bd2a5e2b12 Christian K=C3=B6nig   2019-05-22  835  		if (busy_bo)
1ec39923ef24f5 Christian K=C3=B6nig   2019-11-11  836  			ttm_bo_put(busy_b=
o);
d367bd2a5e2b12 Christian K=C3=B6nig   2019-05-22  837  		return ret;
9c51ba1db37cab Thomas Hellstrom  2009-12-02  838  	}
9c51ba1db37cab Thomas Hellstrom  2009-12-02  839 =20
1ec39923ef24f5 Christian K=C3=B6nig   2019-11-11  840  	if (bo->deleted) {
83876c1bed8c91 Christian K=C3=B6nig   2017-04-12  841  		ret =3D ttm_bo_cle=
anup_refs(bo, ctx->interruptible,
83876c1bed8c91 Christian K=C3=B6nig   2017-04-12  842  					  ctx->no_wait_=
gpu, locked);
1ec39923ef24f5 Christian K=C3=B6nig   2019-11-11  843  		ttm_bo_put(bo);
ba4e7d973dd09b Thomas Hellstrom  2009-06-10  844  		return ret;
9c51ba1db37cab Thomas Hellstrom  2009-12-02  845  	}
9c51ba1db37cab Thomas Hellstrom  2009-12-02  846 =20
97588b5b9a6b33 Christian K=C3=B6nig   2019-09-25  847  	spin_unlock(&ttm_bo=
_glob.lru_lock);
9c51ba1db37cab Thomas Hellstrom  2009-12-02  848 =20
83876c1bed8c91 Christian K=C3=B6nig   2017-04-12  849  	ret =3D ttm_bo_evic=
t(bo, ctx);
9165fb879f62a7 Christian K=C3=B6nig   2019-09-19  850  	if (locked)
ca262a9998d461 Jerome Glisse     2009-12-08  851  		ttm_bo_unreserve(bo);
9c51ba1db37cab Thomas Hellstrom  2009-12-02  852 =20
1ec39923ef24f5 Christian K=C3=B6nig   2019-11-11  853  	ttm_bo_put(bo);
ca262a9998d461 Jerome Glisse     2009-12-08 @854  	return ret;
ca262a9998d461 Jerome Glisse     2009-12-08  855  }
ba4e7d973dd09b Thomas Hellstrom  2009-06-10  856 =20

:::::: The code at line 854 was first introduced by commit
:::::: ca262a9998d46196750bb19a9dc4bd465b170ff7 drm/ttm: Rework validation =
& memory space allocation (V3)

:::::: TO: Jerome Glisse <jglisse@redhat.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
