Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004C0277007
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Feb 2026 16:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770050777; cv=none; b=lUeFuwyAh3tCbNftQaARZEKuiGdvWP8SeMli+pXNWwQ+lIfSNN9pNuwOjCIscG8qER/1BIOBbPXlGexe2oxgawWbWeT4dN5q2qdjAb+Bp0nNNvPQvvklTVZjbqwn/RpGnj7f4FAeTUs5BnKZWAdew6fUy4VlTMp2pJJQP3PUw98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770050777; c=relaxed/simple;
	bh=92QmpRE+eMSnsFPhCXemRpPfkO2eK7tu6xdP0q1dcEM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Powd6C5nKRtKoU2oTv3dQo6j1Dbyqvc2FNNGjliflIvFWmIDGu9oPglDTVE4M5iu8Sg/L3CsTAkGFH5RaR7TjuJILMGexgA9slwS99cyYWnlQ4vG0AHUsCZjHA1Z0y+TTgcK4NEe8M1WIRNXw9uyqLB6yyyxaBSgSTd6MQ276rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cL/+/zbM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cL/+/zbM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770050774; x=1801586774;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=92QmpRE+eMSnsFPhCXemRpPfkO2eK7tu6xdP0q1dcEM=;
  b=cL/+/zbMdS5FK1vHdv6cMluT8jlVXdlmH+s58/MNn92mDK2kutDmkrUU
   SLI5mlm0jbjuQSJKJPwA/veoT2WVHezA4PS10juXf16n8YhOcrDmK3ILk
   pt7q7jggNJfzDjL5oeMMaab1xGDOG2liIv8KrsckQ/28owZosM8sryOnR
   NGSYuGxZC/sCSq7duVab5QzDS0rfgpLn6MZTqGLiNcDGMO/xoDKT7UNnA
   Q+P9YyiGREcQzOd6d9EHjMbVrq9AUbznF5LhtkYcdKNJPaXGSWwUqVRCi
   lGdTFOqeILWkKjPXGRaSdfaDabfQCc3bZY1xNBA3TlzBdqMmigX1+bd7F
   Q==;
X-CSE-ConnectionGUID: rfm2sqK/QfOxcf1gHyne0Q==
X-CSE-MsgGUID: F11+Bi5tTaaOgbFjgvFgbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="70230996"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="70230996"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 08:46:13 -0800
X-CSE-ConnectionGUID: LMQKUMHdTCSAmhYw64vE3Q==
X-CSE-MsgGUID: rZ2mmsS/RfGvw8PeWEq2fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="213687717"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Feb 2026 08:46:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmx3w-00000000fm0-1jcv;
	Mon, 02 Feb 2026 16:46:08 +0000
Date: Tue, 03 Feb 2026 00:46:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1003
 amdgpu_cs_parser_bos() warn: inconsistent returns
 '&p->bo_list->bo_list_mutex'.
Message-ID: <202602030017.7E0xShmH-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Sunil Khatri <sunil.khatri@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: "Christian K=C3=B6nig" <christian.koenig@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   18f7fcd5e69a04df57b563360b88be72471d6b62
commit: e095b55155ef69a8ae0eb114a7fd2a381c012f33 drm/amdgpu: use user provi=
ded hmm_range buffer in amdgpu_ttm_tt_get_user_pages
date:   4 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 4 months ago
config: s390-randconfig-r072-20260202 (https://download.01.org/0day-ci/arch=
ive/20260203/202602030017.7E0xShmH-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602030017.7E0xShmH-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1003 amdgpu_cs_parser_bos() warn: in=
consistent returns '&p->bo_list->bo_list_mutex'.

vim +1003 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c

9a02ece43ee49e Christian K=C3=B6nig   2018-08-17   854 =20
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   855  static int amdgpu_c=
s_parser_bos(struct amdgpu_cs_parser *p,
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   856  				union drm_amdgp=
u_cs *cs)
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   857  {
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   858  	struct amdgpu_fpri=
v *fpriv =3D p->filp->driver_priv;
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   859  	struct ttm_operati=
on_ctx ctx =3D { true, false };
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   860  	struct amdgpu_vm *=
vm =3D &fpriv->vm;
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   861  	struct amdgpu_bo_l=
ist_entry *e;
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   862  	struct drm_gem_obj=
ect *obj;
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   863  	unsigned long inde=
x;
4624459c84d71e Christian K=C3=B6nig   2022-03-02   864  	unsigned int i;
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   865  	int r;
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   866 =20
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   867  	/* p->bo_list coul=
d already be assigned if AMDGPU_CHUNK_ID_BO_HANDLES is present */
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   868  	if (cs->in.bo_list=
_handle) {
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   869  		if (p->bo_list)
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   870  			return -EINVAL;
d38ceaf99ed015 Alex Deucher      2015-04-20   871 =20
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   872  		r =3D amdgpu_bo_l=
ist_get(fpriv, cs->in.bo_list_handle,
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   873  				       &p->bo_l=
ist);
bbca24d0a3c111 Ma=C3=ADra Canal       2022-08-15   874  		if (r)
d38ceaf99ed015 Alex Deucher      2015-04-20   875  			return r;
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   876  	} else if (!p->bo_=
list) {
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   877  		/* Create a empty=
 bo_list when no handle is provided */
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   878  		r =3D amdgpu_bo_l=
ist_create(p->adev, p->filp, NULL, 0,
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   879  					  &p->bo_list);
bbca24d0a3c111 Ma=C3=ADra Canal       2022-08-15   880  		if (r)
91e1a5207edec9 Christian K=C3=B6nig   2015-07-06   881  			return r;
d38ceaf99ed015 Alex Deucher      2015-04-20   882  	}
b495bd3a54e732 Christian K=C3=B6nig   2015-09-10   883 =20
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   884  	mutex_lock(&p->bo_=
list->bo_list_mutex);
d5884513a31df0 Christian K=C3=B6nig   2017-09-08   885 =20
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   886  	/* Get userptr bac=
king pages. If pages are updated after registered
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   887  	 * in amdgpu_gem_u=
serptr_ioctl(), amdgpu_cs_list_validate() will do
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   888  	 * amdgpu_ttm_back=
end_bind() to flush and invalidate new pages
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   889  	 */
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   890  	amdgpu_bo_list_for=
_each_userptr_entry(e, p->bo_list) {
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   891  		bool userpage_inv=
alidated =3D false;
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   892  		struct amdgpu_bo =
*bo =3D e->bo;
ad864d243826ce Andrey Grodzovsky 2017-10-10   893 =20
e095b55155ef69 Sunil Khatri      2025-09-24   894  		e->range =3D kzalloc(s=
izeof(*e->range), GFP_KERNEL);
e095b55155ef69 Sunil Khatri      2025-09-24   895  		if (unlikely(!e->range=
))
e095b55155ef69 Sunil Khatri      2025-09-24   896  			return -ENOMEM;
e095b55155ef69 Sunil Khatri      2025-09-24   897 =20
e095b55155ef69 Sunil Khatri      2025-09-24   898  		r =3D amdgpu_ttm_tt_ge=
t_user_pages(bo, e->range);
c5b3cc417b0260 Sunil Khatri      2025-09-17   899  		if (r)
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   900  			goto out_free_us=
er_pages;
d38ceaf99ed015 Alex Deucher      2015-04-20   901 =20
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   902  		for (i =3D 0; i <=
 bo->tbo.ttm->num_pages; i++) {
c5b3cc417b0260 Sunil Khatri      2025-09-17   903  			if (bo->tbo.ttm->page=
s[i] !=3D hmm_pfn_to_page(e->range->hmm_pfns[i])) {
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   904  				userpage_invali=
dated =3D true;
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   905  				break;
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   906  			}
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   907  		}
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   908  		e->user_invalidat=
ed =3D userpage_invalidated;
9a79588c42bf89 Christian K=C3=B6nig   2016-06-22   909  	}
9a79588c42bf89 Christian K=C3=B6nig   2016-06-22   910 =20
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   911  	drm_exec_until_all=
_locked(&p->exec) {
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   912  		r =3D amdgpu_vm_l=
ock_pd(&fpriv->vm, &p->exec, 1 + p->gang_size);
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   913  		drm_exec_retry_on=
_contention(&p->exec);
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   914  		if (unlikely(r))
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   915  			goto out_free_us=
er_pages;
d38ceaf99ed015 Alex Deucher      2015-04-20   916 =20
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   917  		amdgpu_bo_list_fo=
r_each_entry(e, p->bo_list) {
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   918  			/* One fence for=
 TTM and one for each CS job */
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   919  			r =3D drm_exec_p=
repare_obj(&p->exec, &e->bo->tbo.base,
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   920  						 1 + p->gang_=
size);
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   921  			drm_exec_retry_o=
n_contention(&p->exec);
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   922  			if (unlikely(r))
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   923  				goto out_free_u=
ser_pages;
d38ceaf99ed015 Alex Deucher      2015-04-20   924 =20
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   925  			e->bo_va =3D amd=
gpu_vm_bo_find(vm, e->bo);
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   926  		}
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   927 =20
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   928  		if (p->uf_bo) {
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   929  			r =3D drm_exec_p=
repare_obj(&p->exec, &p->uf_bo->tbo.base,
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   930  						 1 + p->gang_=
size);
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   931  			drm_exec_retry_o=
n_contention(&p->exec);
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   932  			if (unlikely(r))
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   933  				goto out_free_u=
ser_pages;
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   934  		}
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   935  	}
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   936 =20
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   937  	amdgpu_bo_list_for=
_each_userptr_entry(e, p->bo_list) {
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   938  		struct mm_struct =
*usermm;
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   939 =20
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   940  		usermm =3D amdgpu=
_ttm_tt_get_usermm(e->bo->tbo.ttm);
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   941  		if (usermm && use=
rmm !=3D current->mm) {
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   942  			r =3D -EPERM;
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   943  			goto out_free_us=
er_pages;
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   944  		}
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   945 =20
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   946  		if (amdgpu_ttm_tt=
_is_userptr(e->bo->tbo.ttm) &&
c5b3cc417b0260 Sunil Khatri      2025-09-17   947  		    e->user_invalidate=
d) {
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   948  			amdgpu_bo_placem=
ent_from_domain(e->bo,
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   949  							AMDGPU_GEM_D=
OMAIN_CPU);
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   950  			r =3D ttm_bo_val=
idate(&e->bo->tbo, &e->bo->placement,
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   951  					    &ctx);
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   952  			if (r)
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   953  				goto out_free_u=
ser_pages;
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   954 =20
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   955  			amdgpu_ttm_tt_se=
t_user_pages(e->bo->tbo.ttm,
c5b3cc417b0260 Sunil Khatri      2025-09-17   956  						     e->range);
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   957  		}
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   958  	}
d38ceaf99ed015 Alex Deucher      2015-04-20   959 =20
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   960  	amdgpu_cs_get_thre=
shold_for_moves(p->adev, &p->bytes_moved_threshold,
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   961  					  &p->bytes_mo=
ved_vis_threshold);
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   962  	p->bytes_moved =3D =
0;
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   963  	p->bytes_moved_vis=
 =3D 0;
9a1b3af10d6268 Monk Liu          2017-03-08   964 =20
50661eb1a2c88c Felix Kuehling    2024-01-03   965  	r =3D amdgpu_vm_validat=
e(p->adev, &fpriv->vm, NULL,
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   966  			       amdgpu_cs=
_bo_validate, p);
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   967  	if (r) {
cc51bbc7d7a7ff Mario Limonciello 2025-07-15   968  		drm_err(adev_to_drm(p-=
>adev), "amdgpu_vm_validate() failed.\n");
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   969  		goto out_free_use=
r_pages;
65333e4429c60b Monk Liu          2017-03-27   970  	}
9a1b3af10d6268 Monk Liu          2017-03-08   971 =20
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   972  	drm_exec_for_each_=
locked_object(&p->exec, index, obj) {
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   973  		r =3D amdgpu_cs_b=
o_validate(p, gem_to_amdgpu_bo(obj));
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   974  		if (unlikely(r))
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   975  			goto out_free_us=
er_pages;
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   976  	}
b07c60c0652c49 Christian K=C3=B6nig   2016-01-31   977 =20
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   978  	if (p->uf_bo) {
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   979  		r =3D amdgpu_ttm_=
alloc_gart(&p->uf_bo->tbo);
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   980  		if (unlikely(r))
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   981  			goto out_free_us=
er_pages;
4953b6b22ab9d7 Christian K=C3=B6nig   2022-09-13   982 =20
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   983  		p->gang_leader->u=
f_addr +=3D amdgpu_bo_gpu_offset(p->uf_bo);
d38ceaf99ed015 Alex Deucher      2015-04-20   984  	}
d38ceaf99ed015 Alex Deucher      2015-04-20   985 =20
4953b6b22ab9d7 Christian K=C3=B6nig   2022-09-13   986  	amdgpu_cs_report_m=
oved_bytes(p->adev, p->bytes_moved,
4953b6b22ab9d7 Christian K=C3=B6nig   2022-09-13   987  				     p->bytes_m=
oved_vis);
4624459c84d71e Christian K=C3=B6nig   2022-03-02   988 =20
4624459c84d71e Christian K=C3=B6nig   2022-03-02   989  	for (i =3D 0; i < =
p->gang_size; ++i)
4624459c84d71e Christian K=C3=B6nig   2022-03-02   990  		amdgpu_job_set_re=
sources(p->jobs[i], p->bo_list->gds_obj,
4624459c84d71e Christian K=C3=B6nig   2022-03-02   991  					 p->bo_list->g=
ws_obj,
4624459c84d71e Christian K=C3=B6nig   2022-03-02   992  					 p->bo_list->o=
a_obj);
4953b6b22ab9d7 Christian K=C3=B6nig   2022-09-13   993  	return 0;
4953b6b22ab9d7 Christian K=C3=B6nig   2022-09-13   994 =20
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   995  out_free_user_pages:
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08   996  	amdgpu_bo_list_for=
_each_userptr_entry(e, p->bo_list) {
ca6c1e210aa7d7 Christian K=C3=B6nig   2022-04-16   997  		struct amdgpu_bo =
*bo =3D e->bo;
d38ceaf99ed015 Alex Deucher      2015-04-20   998 =20
fec8fdb54e8f74 Christian K=C3=B6nig   2022-11-10   999  		amdgpu_ttm_tt_get=
_user_pages_done(bo->tbo.ttm, e->range);
fec8fdb54e8f74 Christian K=C3=B6nig   2022-11-10  1000  		e->range =3D NULL;
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08  1001  	}
c70e2166967dc4 Philip Yang       2022-11-03  1002  	mutex_unlock(&p->bo_lis=
t->bo_list_mutex);
d4e8ad908b2095 Christian K=C3=B6nig   2022-09-08 @1003  	return r;
d38ceaf99ed015 Alex Deucher      2015-04-20  1004  }
d38ceaf99ed015 Alex Deucher      2015-04-20  1005 =20

:::::: The code at line 1003 was first introduced by commit
:::::: d4e8ad908b2095388a300b19d76b78c170052a8a drm/amdgpu: reorder CS code

:::::: TO: Christian K=C3=B6nig <christian.koenig@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
