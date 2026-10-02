Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E6647D95C
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Oct 2026 23:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790982633; cv=none; b=Y+oSZNBDaF8Jtr/dLGa9Oeya17nXX2wnEqBAHmNl5pG0ni+yYuNgXYw0bQOBvb+DuU/wUDl6hHYBhFYoRIOXLg8XTMGqu9LqNuaIuM7vAPfs7nwtgbyA3Ei4ZcDK7j23wKNDS5UuYOsYseqnIyZME6HqHsC81pO4OUmYisLvRhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790982633; c=relaxed/simple;
	bh=NX7tmktiT/9XqmkKqPRUz/i1ImY9tr33XJDyOFE3HBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cvXKYxWeBEd371QpjW3ISzPr48bvE8LAJ2IAQT6md9pTvYkvZbbMF/qGyYPbHtvXoc5/1v58Up55ac7OROk7z/ntbozHBwDhFzcgzu5wXAmEwipivzQWA3T4uYaX15IwJTQWiqMVsZlRLNzDvRsuhrgBMQAoesNFs8WsIkA+dV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YwnP7OsO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YwnP7OsO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790982629; x=1822518629;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NX7tmktiT/9XqmkKqPRUz/i1ImY9tr33XJDyOFE3HBQ=;
  b=YwnP7OsOl/+4SB139pkL7mjgw8XuDKDsN42/G5RL4SC9+sjtPhNaWK1k
   Z0FSZjsNIKuBqUOxlH8rwHtgl4P/LRXoYW/Z95b1+PAHnLJSJlCSN1QL6
   c5WIXEfKK/nzqZPp2XoyYtj80rlPDLLTiWKPD4BAt2VDw3YYlGbfKL9Kf
   9bmcmnVQ2KKJVipXwPz3bLJDpBLKX0OcNtaSMO7Y0IL51QjYZ8fsi5hNF
   ErLYTEPDxDakxzt4xKfz9Y+SCL9IJTeqE5M1qIALMaQzXm2qfx+/kj1jw
   WtJfyFI+6TsWAs0Oa7YQNf6X2ti2YeVpVTeoX4iwndiSclnOTxVQX8RvY
   w==;
X-CSE-ConnectionGUID: RUPF60hwQ/a/+v8y5nd4vw==
X-CSE-MsgGUID: 2sQCuo/mTKCT/bE3n0ZXQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="103126207"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="103126207"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 16:10:27 -0700
X-CSE-ConnectionGUID: z+lv2HqfRDqKSgiHbDWVLQ==
X-CSE-MsgGUID: qrPan50AQoGHg32IKGGPwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="347522"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 02 Oct 2026 16:10:26 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCmOV-000000000op-2kO9;
	Fri, 02 Oct 2026 23:10:23 +0000
Date: Sat, 03 Oct 2026 01:09:40 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [drm-amdgpu:drm-amdgpu-next 166/175]
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c:535 amdgpu_vm_pt_alloc() warn:
 missing error code 'r'
Message-ID: <202610030116.Fl3NpsoK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Natalie Vock <nat@pixelcluster.dev>

tree:   https://gitlab.freedesktop.org/drm/amdgpu/kernel drm-amdgpu-next
head:   41505ac433cc4c5179deee8860d197b04f6d1c1d
commit: 0dc93a683a9470b7cda79468404384c8d50088d4 [166/175] drm/amdgpu: rewo=
rk eviction lock handling into critical section v3
:::::: branch date: 7 hours ago
:::::: commit date: 28 hours ago
config: i386-randconfig-2200-20261002 (https://download.01.org/0day-ci/arch=
ive/20261003/202610030116.Fl3NpsoK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610030116.Fl3NpsoK-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c:535 amdgpu_vm_pt_alloc() warn: mi=
ssing error code 'r'

vim +/r +535 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c

184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  504 =20
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  505  /**
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  506   * amdgpu_vm_pt_alloc =
- Allocate a specific page table
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  507   *
0dc93a683a9470 Christian K=C3=B6nig 2026-05-27  508   * @p: see amdgpu_vm_u=
pdate_params definition
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  509   * @cursor: Which page=
 table to allocate
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  510   *
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  511   * Make sure a specifi=
c page table or directory is allocated.
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  512   *
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  513   * Returns:
0dc93a683a9470 Christian K=C3=B6nig 2026-05-27  514   *
0dc93a683a9470 Christian K=C3=B6nig 2026-05-27  515   * 0 on success or a n=
egative error code on failure.
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  516   */
0dc93a683a9470 Christian K=C3=B6nig 2026-05-27  517  static int amdgpu_vm_p=
t_alloc(struct amdgpu_vm_update_params *p,
0dc93a683a9470 Christian K=C3=B6nig 2026-05-27  518  			      struct amdgpu=
_vm_pt_cursor *cursor)
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  519  {
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  520  	struct amdgpu_vm_bo_b=
ase *entry =3D cursor->entry;
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  521  	struct amdgpu_bo *pt_=
bo;
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  522  	struct amdgpu_bo_vm *=
pt;
0dc93a683a9470 Christian K=C3=B6nig 2026-05-27  523  	int r, r2;
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  524 =20
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  525  	if (entry->bo)
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  526  		return 0;
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  527 =20
0dc93a683a9470 Christian K=C3=B6nig 2026-05-27  528  	amdgpu_vm_end_critica=
l(p);
0dc93a683a9470 Christian K=C3=B6nig 2026-05-27  529  	r =3D amdgpu_vm_pt_cr=
eate(p->adev, p->vm, cursor->level, p->immediate,
0dc93a683a9470 Christian K=C3=B6nig 2026-05-27  530  				&pt, p->vm->root.b=
o->xcp_id);
0dc93a683a9470 Christian K=C3=B6nig 2026-05-27  531  	r2 =3D amdgpu_vm_begi=
n_critical(p);
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  532  	if (r)
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  533  		return r;
0dc93a683a9470 Christian K=C3=B6nig 2026-05-27  534  	if (r2)
0dc93a683a9470 Christian K=C3=B6nig 2026-05-27 @535  		goto error_free_pt;
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  536 =20
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  537  	/* Keep a reference t=
o the root directory to avoid
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  538  	 * freeing them up in=
 the wrong order.
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  539  	 */
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  540  	pt_bo =3D &pt->bo;
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  541  	pt_bo->parent =3D amd=
gpu_bo_ref(cursor->parent->bo);
0dc93a683a9470 Christian K=C3=B6nig 2026-05-27  542  	amdgpu_vm_bo_base_ini=
t(entry, p->vm, pt_bo);
0dc93a683a9470 Christian K=C3=B6nig 2026-05-27  543  	r =3D amdgpu_vm_pt_cl=
ear(p->adev, p->vm, pt, p->immediate);
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  544  	if (r)
0dc93a683a9470 Christian K=C3=B6nig 2026-05-27  545  		goto error_unpin;
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  546 =20
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  547  	return 0;
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  548 =20
0dc93a683a9470 Christian K=C3=B6nig 2026-05-27  549  error_unpin:
0dc93a683a9470 Christian K=C3=B6nig 2026-05-27  550  	if (p->vm->is_npa)
e05a54573df7df Felix Kuehling  2026-06-08  551  		amdgpu_bo_unpin(pt_bo);
0dc93a683a9470 Christian K=C3=B6nig 2026-05-27  552  error_free_pt:
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  553  	amdgpu_bo_unref(&pt_b=
o);
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  554  	return r;
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  555  }
184a69ca4d4125 Christian K=C3=B6nig 2022-03-15  556 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
