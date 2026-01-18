Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3DA2192F4
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 17:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768758787; cv=none; b=rCMJIBG0RFnuxyBwrgcSrt3jhUXCHTAvJobnZUleqw2IQUYiUoib6NfQuTVRFxXSauG4StTGHO5uGsPie7rPKYzTeaqV7K07OaSFD5+soA9wivVPz7eiaqxNKHFMRnm6q6K6Odk9z/96BeHj741nUS+1+CZxuMYsCAy1JwBB0HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768758787; c=relaxed/simple;
	bh=/iMxBQGujxA87y1nnP3rEEMNPpYk3KvztYxjZbZkeT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=I91y3Gnu+x86jccZpQfFR5I/1ypCvtUaLITFf0JaGlD9ffvWaU719cQcK34tSrWelMOQqQSWBrPCA4w4Cg2ok3OzxPnZry6WesZJteOnkHqP75J0iUHXNzA7EfwrV5t+GqsxAcTB5ec1eGnurqqz1OBPdNcBTDlnG2padPUp6RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+Wq9IHz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+Wq9IHz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768758785; x=1800294785;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/iMxBQGujxA87y1nnP3rEEMNPpYk3KvztYxjZbZkeT8=;
  b=U+Wq9IHzcF0VtQ6JPOKq+lAfDpYEdoc3dS0KHpBjXuMWwouwX30iTzH0
   puOaIne7Bxm0TauhG5tAgqNd2CiRs78Z2O0ggEtGyagus4QCyqeFJ20yU
   0xV9elrB8wNeSF8DkQ0xSIcy1ZpGTkHj7W49iE2m1fYyfVTCtN0mTcYoR
   DXd1jJ6lS6KFZMDGCnMIRjxsajSL+WqdaFg7vF5ngU22iM5fp7cxtzJ0+
   Tck4FEpp2XnXKcsGI8wZ5lUalDXji9IDl3frNeVrMCLcM4tG6+n69A6+t
   J3d+wM+Frv5ixG+3EW7LAmIXDLYPiTLMtcyPTB8k2qaX3EqE0IhktIcnT
   g==;
X-CSE-ConnectionGUID: GFtax43zTx20E8Njxk/nzg==
X-CSE-MsgGUID: SCUYfo5NR/+d9GJ18AU8vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="95460006"
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; 
   d="scan'208";a="95460006"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 09:53:04 -0800
X-CSE-ConnectionGUID: YmrTfOHjRvGLR2qlMseE2Q==
X-CSE-MsgGUID: UIbcSTygRCSX9/u7QMfPQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; 
   d="scan'208";a="206051866"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Jan 2026 09:53:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhWxR-00000000N8U-0dtb;
	Sun, 18 Jan 2026 17:53:01 +0000
Date: Mon, 19 Jan 2026 01:52:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c:804
 amdgpu_gmc_flush_gpu_tlb_pasid() warn: inconsistent returns
 '&adev->reset_domain->sem'.
Message-ID: <202601190121.z9C0uml5-lkp@intel.com>
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
TO: Prike Liang <Prike.Liang@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: "Christian K=C3=B6nig" <christian.koenig@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e84d960149e71e8d5e4db69775ce31305898ed0c
commit: 0bea77b13b7649710108e6b67937ab4c7f8a9363 drm/amdgpu: validate the f=
lush_gpu_tlb_pasid()
date:   4 days ago
:::::: branch date: 14 hours ago
:::::: commit date: 4 days ago
config: powerpc64-randconfig-r071-20260118 (https://download.01.org/0day-ci=
/archive/20260119/202601190121.z9C0uml5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8=
addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601190121.z9C0uml5-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c:804 amdgpu_gmc_flush_gpu_tlb_pasid(=
) warn: inconsistent returns '&adev->reset_domain->sem'.

vim +804 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c

a70cb2176f7ef6 Christian K=C3=B6nig 2023-09-01  716 =20
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  717  int amdgpu_gmc_flush_g=
pu_tlb_pasid(struct amdgpu_device *adev, uint16_t pasid,
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  718  				   uint32_t flush_=
type, bool all_hub,
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  719  				   uint32_t inst)
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  720  {
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  721  	struct amdgpu_ring *r=
ing =3D &adev->gfx.kiq[inst].ring;
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  722  	struct amdgpu_kiq *ki=
q =3D &adev->gfx.kiq[inst];
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  723  	unsigned int ndw;
3666ed821832f4 Jay Cornwall    2025-03-21  724  	int r, cnt =3D 0;
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  725  	uint32_t seq;
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  726 =20
9c33e5fd4fb63b Yunxiang Li     2024-05-23  727  	/*
9c33e5fd4fb63b Yunxiang Li     2024-05-23  728  	 * A GPU reset should flus=
h all TLBs anyway, so no need to do
9c33e5fd4fb63b Yunxiang Li     2024-05-23  729  	 * this while one is ongoi=
ng.
9c33e5fd4fb63b Yunxiang Li     2024-05-23  730  	 */
9c33e5fd4fb63b Yunxiang Li     2024-05-23  731  	if (!down_read_trylock(&ad=
ev->reset_domain->sem))
9c33e5fd4fb63b Yunxiang Li     2024-05-23  732  		return 0;
08abccc9a7a7ff Christian K=C3=B6nig 2023-09-04  733 =20
9c33e5fd4fb63b Yunxiang Li     2024-05-23  734  	if (!adev->gmc.flush_pasid=
_uses_kiq || !ring->sched.ready) {
0bea77b13b7649 Prike Liang     2026-01-06  735 =20
0bea77b13b7649 Prike Liang     2026-01-06  736  		if (!adev->gmc.gmc_funcs-=
>flush_gpu_tlb_pasid)
0bea77b13b7649 Prike Liang     2026-01-06  737  			return 0;
0bea77b13b7649 Prike Liang     2026-01-06  738 =20
08abccc9a7a7ff Christian K=C3=B6nig 2023-09-04  739  		if (adev->gmc.flush_=
tlb_needs_extra_type_2)
08abccc9a7a7ff Christian K=C3=B6nig 2023-09-04  740  			adev->gmc.gmc_funcs=
->flush_gpu_tlb_pasid(adev, pasid,
08abccc9a7a7ff Christian K=C3=B6nig 2023-09-04  741  								 2, all_hub,
08abccc9a7a7ff Christian K=C3=B6nig 2023-09-04  742  								 inst);
08abccc9a7a7ff Christian K=C3=B6nig 2023-09-04  743 =20
08abccc9a7a7ff Christian K=C3=B6nig 2023-09-04  744  		if (adev->gmc.flush_=
tlb_needs_extra_type_0 && flush_type =3D=3D 2)
08abccc9a7a7ff Christian K=C3=B6nig 2023-09-04  745  			adev->gmc.gmc_funcs=
->flush_gpu_tlb_pasid(adev, pasid,
08abccc9a7a7ff Christian K=C3=B6nig 2023-09-04  746  								 0, all_hub,
08abccc9a7a7ff Christian K=C3=B6nig 2023-09-04  747  								 inst);
08abccc9a7a7ff Christian K=C3=B6nig 2023-09-04  748 =20
3983c9fd2d8b5a Christian K=C3=B6nig 2023-09-04  749  		adev->gmc.gmc_funcs-=
>flush_gpu_tlb_pasid(adev, pasid,
3983c9fd2d8b5a Christian K=C3=B6nig 2023-09-04  750  							 flush_type, al=
l_hub,
3983c9fd2d8b5a Christian K=C3=B6nig 2023-09-04  751  							 inst);
9c33e5fd4fb63b Yunxiang Li     2024-05-23  752  		r =3D 0;
9c33e5fd4fb63b Yunxiang Li     2024-05-23  753  	} else {
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  754  		/* 2 dwords flush + =
8 dwords fence */
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  755  		ndw =3D kiq->pmf->in=
validate_tlbs_size + 8;
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  756 =20
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  757  		if (adev->gmc.flush_=
tlb_needs_extra_type_2)
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  758  			ndw +=3D kiq->pmf->=
invalidate_tlbs_size;
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  759 =20
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  760  		if (adev->gmc.flush_=
tlb_needs_extra_type_0)
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  761  			ndw +=3D kiq->pmf->=
invalidate_tlbs_size;
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  762 =20
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  763  		spin_lock(&adev->gfx=
.kiq[inst].ring_lock);
9ff2e14cf013fa Bob Zhou        2024-06-20  764  		r =3D amdgpu_ring_alloc(r=
ing, ndw);
9ff2e14cf013fa Bob Zhou        2024-06-20  765  		if (r) {
9ff2e14cf013fa Bob Zhou        2024-06-20  766  			spin_unlock(&adev->gfx.k=
iq[inst].ring_lock);
9ff2e14cf013fa Bob Zhou        2024-06-20  767  			goto error_unlock_reset;
9ff2e14cf013fa Bob Zhou        2024-06-20  768  		}
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  769  		if (adev->gmc.flush_=
tlb_needs_extra_type_2)
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  770  			kiq->pmf->kiq_inval=
idate_tlbs(ring, pasid, 2, all_hub);
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  771 =20
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  772  		if (flush_type =3D=
=3D 2 && adev->gmc.flush_tlb_needs_extra_type_0)
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  773  			kiq->pmf->kiq_inval=
idate_tlbs(ring, pasid, 0, all_hub);
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  774 =20
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  775  		kiq->pmf->kiq_invali=
date_tlbs(ring, pasid, flush_type, all_hub);
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  776  		r =3D amdgpu_fence_e=
mit_polling(ring, &seq, MAX_KIQ_REG_WAIT);
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  777  		if (r) {
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  778  			amdgpu_ring_undo(ri=
ng);
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  779  			spin_unlock(&adev->=
gfx.kiq[inst].ring_lock);
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  780  			goto error_unlock_r=
eset;
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  781  		}
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  782 =20
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  783  		amdgpu_ring_commit(r=
ing);
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  784  		spin_unlock(&adev->g=
fx.kiq[inst].ring_lock);
3666ed821832f4 Jay Cornwall    2025-03-21  785 =20
3666ed821832f4 Jay Cornwall    2025-03-21  786  		r =3D amdgpu_fence_wait_p=
olling(ring, seq, MAX_KIQ_REG_WAIT);
3666ed821832f4 Jay Cornwall    2025-03-21  787 =20
3666ed821832f4 Jay Cornwall    2025-03-21  788  		might_sleep();
3666ed821832f4 Jay Cornwall    2025-03-21  789  		while (r < 1 && cnt++ < M=
AX_KIQ_REG_TRY &&
3666ed821832f4 Jay Cornwall    2025-03-21  790  		       !amdgpu_reset_pend=
ing(adev->reset_domain)) {
3666ed821832f4 Jay Cornwall    2025-03-21  791  			msleep(MAX_KIQ_REG_BAILO=
UT_INTERVAL);
3666ed821832f4 Jay Cornwall    2025-03-21  792  			r =3D amdgpu_fence_wait_=
polling(ring, seq, MAX_KIQ_REG_WAIT);
3666ed821832f4 Jay Cornwall    2025-03-21  793  		}
3666ed821832f4 Jay Cornwall    2025-03-21  794 =20
3666ed821832f4 Jay Cornwall    2025-03-21  795  		if (cnt > MAX_KIQ_REG_TRY=
) {
9c33e5fd4fb63b Yunxiang Li     2024-05-23  796  			dev_err(adev->dev, "time=
out waiting for kiq fence\n");
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  797  			r =3D -ETIME;
3666ed821832f4 Jay Cornwall    2025-03-21  798  		} else
3666ed821832f4 Jay Cornwall    2025-03-21  799  			r =3D 0;
9c33e5fd4fb63b Yunxiang Li     2024-05-23  800  	}
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  801 =20
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  802  error_unlock_reset:
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  803  	up_read(&adev->reset_=
domain->sem);
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04 @804  	return r;
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  805  }
e7b90e99fa8fd6 Christian K=C3=B6nig 2023-09-04  806 =20

:::::: The code at line 804 was first introduced by commit
:::::: e7b90e99fa8fd65bc37628c0ba8a7363e8757f3e drm/amdgpu: fix and cleanup=
 gmc_v9_0_flush_gpu_tlb_pasid

:::::: TO: Christian K=C3=B6nig <christian.koenig@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
