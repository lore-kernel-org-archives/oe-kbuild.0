Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B053CF207
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 23:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783036254; cv=none; b=kSKgyfo+2494dFlQNY3DBwLjoR+JU7iz/GPc/AI8XMlgaUAonGAtJD7zASfyNQH4g/9XdmN6oRFQO0YoW5sKiwWSBaBbsqQA1I3URsWCg4r1upxExYeqJMOQsIi35VsaOVoVc8NjQTRNMCuuyJOHA+RJ6QoH83RaFsc8acsO5yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783036254; c=relaxed/simple;
	bh=KD7JJvLK5EtaONLYgiEPfaXQZ/s2nTg9RvQnyndhVHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EFeJflXIDRjKUR93rHoAC0ckgk+oUlpR0AbR+yVVQLWYj6tbVqsuhjdDuf3C6u2ABQ2bSxqVxzSbJMkUy1Y1CA99CYNeY7nXRlCWHEsNcDDrsohBLRjnaN+pZnclgAMtrdmDWs/8ozoG5CutqIrU8in0jBQ/zgltegTxkpqn85o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hfk3+mXD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hfk3+mXD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783036252; x=1814572252;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KD7JJvLK5EtaONLYgiEPfaXQZ/s2nTg9RvQnyndhVHo=;
  b=Hfk3+mXDygtLtk6ZiQ3d5hIehZREAGV0lDxaXya3aY7mNiViu8MEmtlh
   N3f5kUzNnhxo/3bkC1I+UkSHl9qVmj1Ope0fj1y7yvwzKqC2gd7ASvkoU
   VlSn2i4Hkz84QUutrpQg1s8hrC3t/ztI5K7xYFXLsyB6jcB5MKCSDN++O
   2XPNhjLnoz7N0cJpTeiDu5+rzVtD3Mt7l8LAnQZLgZXzlyvt2nuV61j6z
   IWhokaSXmqlQM3LGxutPFGVGQdqhmTA1DXZDHJYarrrlwLAnvWIHcrmWD
   xgS4Vo8MpW+s8vABr8hPpSJIQ6QS1lYWJ2j2XdQPW4TKkmDwJ50ZbebgO
   Q==;
X-CSE-ConnectionGUID: CvuD/6nqTjCQppU5X+MxvQ==
X-CSE-MsgGUID: k4X6cNC3S5ucrr5hoXl7UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83919511"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="83919511"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 16:50:51 -0700
X-CSE-ConnectionGUID: ypZDKmlDRSajGZJssKZd1g==
X-CSE-MsgGUID: 5je2chhoSEmM6kXEB4/c1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="251246174"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 02 Jul 2026 16:50:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfRAp-00000000BQp-0klK;
	Thu, 02 Jul 2026 23:50:27 +0000
Date: Fri, 03 Jul 2026 07:49:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:664
 amdgpu_userq_wait_count_fences() warn: passing freed memory 'fence' (line
 652)
Message-ID: <202607030723.dZmHjLbL-lkp@intel.com>
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
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Sunil Khatri <sunil.khatri@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   87320be9f0d24fce67631b7eef919f0b79c3e45c
commit: a1371d9f0e611ef40cd31b02565e2325701c1d82 drm/amdgpu: rework amdgpu_=
userq_wait_ioctl v4
date:   4 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 months ago
config: sparc-randconfig-r071-20260702 (https://download.01.org/0day-ci/arc=
hive/20260703/202607030723.dZmHjLbL-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: a1371d9f0e61 ("drm/amdgpu: rework amdgpu_userq_wait_ioctl v4")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607030723.dZmHjLbL-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:664 amdgpu_userq_wait_count=
_fences() warn: passing freed memory 'fence' (line 652)

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:599 amdgpu_userq_signal_ioc=
tl() error: we previously assumed 'gobj_write' could be null (see line 581)
drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:603 amdgpu_userq_signal_ioc=
tl() error: we previously assumed 'gobj_read' could be null (see line 573)

vim +/fence +664 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c

a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  618 =20
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  619  /* Count the =
number of expected fences so userspace can alloc a buffer */
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  620  static int
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  621  amdgpu_userq_=
wait_count_fences(struct drm_file *filp,
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  622  			       str=
uct drm_amdgpu_userq_wait *wait_info,
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  623  			       u32=
 *syncobj_handles, u32 *timeline_points,
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  624  			       u32=
 *timeline_handles,
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  625  			       str=
uct drm_gem_object **gobj_write,
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  626  			       str=
uct drm_gem_object **gobj_read)
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  627  {
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  628  	int num_read=
_bo_handles, num_write_bo_handles;
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  629  	struct dma_f=
ence_unwrap iter;
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  630  	struct dma_f=
ence *fence, *f;
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  631  	unsigned int=
 num_fences =3D 0;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  632  	struct drm_exec e=
xec;
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  633  	int i, r;
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  634 =20
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  635  	/*
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  636  	 * This need=
s to be outside of the lock provided by drm_exec for
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  637  	 * DRM_SYNCO=
BJ_WAIT_FLAGS_WAIT_FOR_SUBMIT to work correctly.
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  638  	 */
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  639 =20
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  640  	/* Count tim=
eline fences */
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  641  	for (i =3D 0=
; i < wait_info->num_syncobj_timeline_handles; i++) {
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  642  		r =3D drm_syncob=
j_find_fence(filp, timeline_handles[i],
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  643  					   timeline_p=
oints[i],
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  644  					   DRM_SYNCOB=
J_WAIT_FLAGS_WAIT_FOR_SUBMIT,
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  645  					   &fence);
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  646  		if (r)
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  647  			return r;
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  648 =20
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  649  		dma_fence_unwrap=
_for_each(f, &iter, fence)
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  650  			num_fences++;
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  651 =20
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30 @652  		dma_fence_put(fe=
nce);
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  653  	}
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  654 =20
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  655  	/* Count boo=
lean fences */
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  656  	for (i =3D 0=
; i < wait_info->num_syncobj_handles; i++) {
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  657  		r =3D drm_s=
yncobj_find_fence(filp, syncobj_handles[i], 0,
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  658  					   DRM_SYNCOB=
J_WAIT_FLAGS_WAIT_FOR_SUBMIT,
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  659  					   &fence);
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  660  		if (r)
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  661  			return r;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  662 =20
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  663  		num_fences++;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30 @664  		dma_fence_put(fe=
nce);
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  665  	}
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  666 =20
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  667  	/* Lock all =
the GEM objects */
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  668  	/* TODO: It =
is actually not necessary to lock them */
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  669  	num_read_bo_=
handles =3D wait_info->num_bo_read_handles;
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  670  	num_write_bo=
_handles =3D wait_info->num_bo_write_handles;
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  671  	drm_exec_ini=
t(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT,
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  672  		      num_r=
ead_bo_handles + num_write_bo_handles);
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  673 =20
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  674  	drm_exec_unt=
il_all_locked(&exec) {
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  675  		r =3D drm_e=
xec_prepare_array(&exec, gobj_read,
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  676  					   num_r=
ead_bo_handles, 1);
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  677  		drm_exec_re=
try_on_contention(&exec);
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  678  		if (r)
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  679  			goto error=
_unlock;
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  680 =20
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  681  		r =3D drm_e=
xec_prepare_array(&exec, gobj_write,
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  682  					   num_w=
rite_bo_handles, 1);
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  683  		drm_exec_re=
try_on_contention(&exec);
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  684  		if (r)
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  685  			goto error=
_unlock;
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  686  	}
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  687 =20
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  688  	/* Count rea=
d fences */
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  689  	for (i =3D 0; i <=
 num_read_bo_handles; i++) {
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  690  		struct dma_resv_=
iter resv_cursor;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  691  		struct dma_fence=
 *fence;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  692 =20
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  693  		dma_resv_for_eac=
h_fence(&resv_cursor, gobj_read[i]->resv,
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  694  					DMA_RESV_USAG=
E_READ, fence)
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  695  			num_fences++;
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  696  	}
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  697 =20
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  698  	/* Count wri=
te fences */
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  699  	for (i =3D 0; i <=
 num_write_bo_handles; i++) {
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  700  		struct dma_resv_=
iter resv_cursor;
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  701  		struct dma_fence=
 *fence;
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  702 =20
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  703  		dma_resv_for_eac=
h_fence(&resv_cursor, gobj_write[i]->resv,
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  704  					DMA_RESV_USAG=
E_WRITE, fence)
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  705  			num_fences++;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  706  	}
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  707 =20
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  708  	wait_info->num_fe=
nces =3D num_fences;
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  709  	r =3D 0;
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  710 =20
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  711  error_unlock:
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  712  	/* Unlock al=
l the GEM objects */
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  713  	drm_exec_fin=
i(&exec);
a1371d9f0e611e Christian K=C3=B6nig          2026-01-29  714  	return r;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  715  }
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  716 =20

:::::: The code at line 664 was first introduced by commit
:::::: a292fdecd72834b3bec380baa5db1e69e7f70679 drm/amdgpu: Implement userq=
ueue signal/wait IOCTL

:::::: TO: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
