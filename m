Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12641238D54
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Apr 2026 07:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776409700; cv=none; b=hhNg3ouyEqJvZ/UjRrDn/i7WOanJ6DOV/c6D21h2ZoxeHqAq09qzb5x/Kcl5zPKKtiEqUC6VaezpKd8uGzEMvikEpbkS/YCSaIivGpn0/rSfzRZxDW74zncPvUlijpcxE/akDsjtn0v0R/EvLUudQmrvJd1QsS53WqaHBzU9iUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776409700; c=relaxed/simple;
	bh=MmTz4DpAVYgFS3ozCj1gyAVixos4semJG6qe3e1YREI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uSVU8YLXsDrrWzTsCroIx4UCZW0bAzHdC3eNdGsTQGJf+RvYViQvWuTIVQemA/ifluuVCXycduWedUNbL4Yt3CNFcKTlVGw0cExVeRu7O1xAyZMluVKIR+Pc2o2jZlKuevGNtyKy/mRMiTQ0M/SZiyBGSVSqEuuDmJLnYDfXqYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QfNePrIO; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QfNePrIO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776409698; x=1807945698;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MmTz4DpAVYgFS3ozCj1gyAVixos4semJG6qe3e1YREI=;
  b=QfNePrIOiCogHWPkEqWTpGjf2QfhW3tpQ9HG1KGgEQxeijeLrvOK+y2O
   cW4ozSyCe6XYNNbJ4AtqIXTDFlIzle9wgSzk0XrYnY9ab4cYrXVwb1wXs
   PajRmWQyQWqr3YOKmg11qJjTn0HEIewG0cIM5y1i2hqFEE11ypqJLed62
   raiWfGZ1Z7ap3PC04+QmMULEBWvIUBH2bb1bEPU1Z7Ny2XFP/cvLC6pzN
   jHse9HQs2qnTHj5Qc4OmifVQurkGv8yDfscccK6m3Yy0uteMhSWyMk3U6
   8+0+em5wLF3lnV0l0esPYcpWCgQ2t8Q2AOkPkaHlbKoms8elaQe9D0iBq
   g==;
X-CSE-ConnectionGUID: YyYUnZWuS2WhIYTIj7zlyA==
X-CSE-MsgGUID: e0CkRR/pR9aQtF/reXHBxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="94824271"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="94824271"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 00:08:18 -0700
X-CSE-ConnectionGUID: CBPi7gSsR5WUWUxvhFj86A==
X-CSE-MsgGUID: YR8+3uyVQpWOFz6bXHVzew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="235336980"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Apr 2026 00:08:16 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDdJF-0000000004H-37mN;
	Fri, 17 Apr 2026 07:08:13 +0000
Date: Fri, 17 Apr 2026 15:08:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [agd5f:amd-staging-drm-next 2318/2412]
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c:470:27-28: WARNING kmalloc
 is used to allocate this memory at line 449
Message-ID: <202604171553.99vxMIFu-lkp@intel.com>
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
TO: "Pierre-Eric Pelloux-Prayer" <pierre-eric.pelloux-prayer@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   f0181ced20586d4d03c1e3a4bcbd5c8faa27399b
commit: 4ddd607e9697a826545876a3eb9b3c673879f579 [2318/2412] drm/amdgpu: sa=
ve ring content before resetting the device
:::::: branch date: 3 days ago
:::::: commit date: 2 weeks ago
config: arc-randconfig-r051-20260417 (https://download.01.org/0day-ci/archi=
ve/20260417/202604171553.99vxMIFu-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202604171553.99vxMIFu-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c:470:27-28: WARNING kmal=
loc is used to allocate this memory at line 449
   drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c:471:24-25: WARNING kmal=
loc is used to allocate this memory at line 450

vim +470 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c

9022f01b970933 Sunil Khatri               2024-03-21  398 =20
6122f5c72e38a8 Trigger Huang              2024-08-19  399  void amdgpu_core=
dump(struct amdgpu_device *adev, bool skip_vram_check,
6122f5c72e38a8 Trigger Huang              2024-08-19  400  		     bool vram=
_lost, struct amdgpu_job *job)
9022f01b970933 Sunil Khatri               2024-03-21  401  {
9022f01b970933 Sunil Khatri               2024-03-21  402  	struct drm_devi=
ce *dev =3D adev_to_drm(adev);
6122f5c72e38a8 Trigger Huang              2024-08-19  403  	struct amdgpu_c=
oredump_info *coredump;
9022f01b970933 Sunil Khatri               2024-03-21  404  	struct drm_sche=
d_job *s_job;
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  405  	u64 total_ring_=
size, ring_count;
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  406  	struct amdgpu_r=
ing *ring;
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  407  	int i, off, idx;
9022f01b970933 Sunil Khatri               2024-03-21  408 =20
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  409  	/* No need to g=
enerate a new coredump if there's one in progress already. */
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  410  	if (work_pendin=
g(&adev->coredump_work))
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  411  		return;
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  412 =20
9022f01b970933 Sunil Khatri               2024-03-21  413  	coredump =3D kz=
alloc(sizeof(*coredump), GFP_NOWAIT);
e2917298730952 Mario Limonciello (AMD     2025-12-14  414) 	if (!coredump)
9022f01b970933 Sunil Khatri               2024-03-21  415  		return;
9022f01b970933 Sunil Khatri               2024-03-21  416 =20
6122f5c72e38a8 Trigger Huang              2024-08-19  417  	coredump->skip_=
vram_check =3D skip_vram_check;
9022f01b970933 Sunil Khatri               2024-03-21  418  	coredump->reset=
_vram_lost =3D vram_lost;
9022f01b970933 Sunil Khatri               2024-03-21  419 =20
8d1a13816e5925 Christian K=C3=B6nig            2024-12-12  420  	if (job &&=
 job->pasid) {
9022f01b970933 Sunil Khatri               2024-03-21  421  		struct amdgpu_=
task_info *ti;
9022f01b970933 Sunil Khatri               2024-03-21  422 =20
8d1a13816e5925 Christian K=C3=B6nig            2024-12-12  423  		ti =3D am=
dgpu_vm_get_task_info_pasid(adev, job->pasid);
9022f01b970933 Sunil Khatri               2024-03-21  424  		if (ti) {
9022f01b970933 Sunil Khatri               2024-03-21  425  			coredump->res=
et_task_info =3D *ti;
9022f01b970933 Sunil Khatri               2024-03-21  426  			amdgpu_vm_put=
_task_info(ti);
9022f01b970933 Sunil Khatri               2024-03-21  427  		}
9022f01b970933 Sunil Khatri               2024-03-21  428  	}
9022f01b970933 Sunil Khatri               2024-03-21  429 =20
9022f01b970933 Sunil Khatri               2024-03-21  430  	if (job) {
9022f01b970933 Sunil Khatri               2024-03-21  431  		s_job =3D &job=
->base;
9022f01b970933 Sunil Khatri               2024-03-21  432  		coredump->ring=
 =3D to_amdgpu_ring(s_job->sched);
9022f01b970933 Sunil Khatri               2024-03-21  433  	}
9022f01b970933 Sunil Khatri               2024-03-21  434 =20
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  435  	/* Dump ring co=
ntent if memory allocation succeeds. */
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  436  	ring_count =3D =
0;
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  437  	total_ring_size=
 =3D 0;
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  438  	for (i =3D 0; i=
 < adev->num_rings; i++) {
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  439  		ring =3D adev-=
>rings[i];
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  440 =20
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  441  		/* Only dump r=
ings with unsignalled fences. */
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  442  		if (atomic_rea=
d(&ring->fence_drv.last_seq) =3D=3D ring->fence_drv.sync_seq &&
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  443  		    coredump->=
ring !=3D ring)
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  444  			continue;
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  445 =20
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  446  		total_ring_siz=
e +=3D ring->ring_size;
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  447  		ring_count++;
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  448  	}
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04 @449  	coredump->rings=
_dw =3D kzalloc(total_ring_size, GFP_NOWAIT);
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  450  	coredump->rings=
 =3D kcalloc(ring_count, sizeof(struct amdgpu_coredump_ring), GFP_NOWAIT);
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  451  	if (coredump->r=
ings && coredump->rings_dw) {
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  452  		for (i =3D 0, =
off =3D 0, idx =3D 0; i < adev->num_rings; i++) {
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  453  			ring =3D adev=
->rings[i];
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  454 =20
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  455  			if (atomic_re=
ad(&ring->fence_drv.last_seq) =3D=3D ring->fence_drv.sync_seq &&
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  456  			    coredump-=
>ring !=3D ring)
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  457  				continue;
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  458 =20
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  459  			coredump->rin=
gs[idx].ring_index =3D ring->idx;
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  460  			coredump->rin=
gs[idx].rptr =3D amdgpu_ring_get_rptr(ring);
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  461  			coredump->rin=
gs[idx].wptr =3D amdgpu_ring_get_wptr(ring);
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  462  			coredump->rin=
gs[idx].offset =3D off;
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  463 =20
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  464  			memcpy(&cored=
ump->rings_dw[off], ring->ring, ring->ring_size);
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  465  			off +=3D ring=
->ring_size;
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  466  			idx++;
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  467  		}
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  468  		coredump->num_=
rings =3D idx;
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  469  	} else {
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04 @470  		kvfree(coredum=
p->rings_dw);
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  471  		kvfree(coredum=
p->rings);
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  472  		coredump->ring=
s_dw =3D NULL;
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  473  		coredump->ring=
s =3D NULL;
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  474  	}
4ddd607e9697a8 Pierre-Eric Pelloux-Prayer 2026-02-04  475 =20
9022f01b970933 Sunil Khatri               2024-03-21  476  	coredump->adev =
=3D adev;
9022f01b970933 Sunil Khatri               2024-03-21  477 =20
9022f01b970933 Sunil Khatri               2024-03-21  478  	ktime_get_ts64(=
&coredump->reset_time);
9022f01b970933 Sunil Khatri               2024-03-21  479 =20
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  480  	/* Update the c=
urrent coredump pointer (no lock needed, this function can only be called
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  481  	 * from a singl=
e thread)
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  482  	 */
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  483  	adev->coredump =
=3D coredump;
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  484  	/* Kick off cor=
edump formatting to a worker thread. */
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  485  	queue_work(syst=
em_unbound_wq, &adev->coredump_work);
28d05f0836dfc4 Andr=C3=A9 Almeida              2025-02-20  486 =20
28d05f0836dfc4 Andr=C3=A9 Almeida              2025-02-20  487  	drm_info(d=
ev, "AMDGPU device coredump file has been created\n");
28d05f0836dfc4 Andr=C3=A9 Almeida              2025-02-20  488  	drm_info(d=
ev, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
28d05f0836dfc4 Andr=C3=A9 Almeida              2025-02-20  489  		 dev->pri=
mary->index);
9022f01b970933 Sunil Khatri               2024-03-21  490  }
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  491 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
