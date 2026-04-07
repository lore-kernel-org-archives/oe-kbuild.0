Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281C92D594F
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Apr 2026 04:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775535946; cv=none; b=CnG1VuK1AnCl79gSnBzboeaA3WtO7aba54YyskR8sQeQfocrwVg4/5fpbxJcs3K5r3dOssDOqPUDB4xtXt8/SQ8dHbquovJ4pacCglFgw3qGZ7gWSmdnaKIy0vhUMZm6easwtabXuW/HtYfVPhXOxlJ0Jd1R6nAnGd9i67724NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775535946; c=relaxed/simple;
	bh=2QNJ6i4kuIoB0GipZAcAKDVtYgxqLzdsSh1id91fJjg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OxLFQUScSTENWH5s5voUT/8ZokKyL1kEgKz2pvx/RYKwNjJKz8yksEeKUHloRff/0OH2jc36pk3gcpJbHgu1SAODW52SRXlMpZH4rsrS3LhWhH/v50oar7MtmYtyb5QX+3R70b5PToUUKQIJf8/AnyNAMKPZO6dVymm4J9Nyhk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZzmvE4mE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZzmvE4mE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775535944; x=1807071944;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2QNJ6i4kuIoB0GipZAcAKDVtYgxqLzdsSh1id91fJjg=;
  b=ZzmvE4mE4p/HdfKQyNGgD5+kEGZOJ6Lj97R71pMDtHHYkGU9zm0iSUpk
   Y12hMKU6+UfjzJAxdhfGH+ZzfAXE58F9CKh7jeMR0KK+cjTO2N07zE8IL
   4FtdG5g7ZoOcXDXtF/7kVP/1eyRD7VLdb/jnu4VeWtV3JYN2gpNQu8aS2
   6veyrvh43GPBdJclzjoLcfeFdPGfIMnU07Wusm0wtby26L5/aq1tgkzjF
   T5DY7tEEPyeQbN9IVY2f0pDhj54n8sa+KZIXILpk1ZyoiEoDAqEe68zur
   WdiO1s9hq4Tw+NbZTNt2BAvGwKVfYwcoPN2AV3pIMjL5cNDpTwBBFxEP1
   g==;
X-CSE-ConnectionGUID: uKCQ9D2cRBi39BrLBuBJlA==
X-CSE-MsgGUID: mSR7MHJcTUuOxwdSmDQs7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87877481"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87877481"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:25:44 -0700
X-CSE-ConnectionGUID: dBv7ehvGSDCs6XAfObM45g==
X-CSE-MsgGUID: PQD7hIC+TMCohYofNDR0ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="251196718"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Apr 2026 21:25:42 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9y0S-000000000Ar-09ox;
	Tue, 07 Apr 2026 04:25:40 +0000
Date: Tue, 07 Apr 2026 12:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [agd5f:drm-next-7.1 55/56]
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c:423 amdgpu_coredump() error:
 we previously assumed 'job' could be null (see line 414)
Message-ID: <202604071441.vAPwv1su-lkp@intel.com>
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

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-7.1
head:   7b15fc2d1f1a00fb99f0146e404ff2600999ec74
commit: 32ab301b89b30d71a2e68d86f564eca66f7c52c5 [55/56] drm/amdgpu: store =
ib info for devcoredump
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20260405 (https://download.01.org/0day-ci/arc=
hive/20260407/202604071441.vAPwv1su-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604071441.vAPwv1su-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c:423 amdgpu_coredump() erro=
r: we previously assumed 'job' could be null (see line 414)
drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c:425 amdgpu_coredump() warn=
: variable dereferenced before check 'job' (see line 423)

vim +/job +423 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c

9022f01b9709331 Sunil Khatri               2024-03-21  398 =20
6122f5c72e38a88 Trigger Huang              2024-08-19  399  void amdgpu_cor=
edump(struct amdgpu_device *adev, bool skip_vram_check,
6122f5c72e38a88 Trigger Huang              2024-08-19  400  		     bool vra=
m_lost, struct amdgpu_job *job)
9022f01b9709331 Sunil Khatri               2024-03-21  401  {
9022f01b9709331 Sunil Khatri               2024-03-21  402  	struct drm_dev=
ice *dev =3D adev_to_drm(adev);
6122f5c72e38a88 Trigger Huang              2024-08-19  403  	struct amdgpu_=
coredump_info *coredump;
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04  404  	size_t size =
=3D sizeof(*coredump);
9022f01b9709331 Sunil Khatri               2024-03-21  405  	struct drm_sch=
ed_job *s_job;
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  406  	u64 total_ring=
_size, ring_count;
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  407  	struct amdgpu_=
ring *ring;
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  408  	int i, off, id=
x;
9022f01b9709331 Sunil Khatri               2024-03-21  409 =20
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  410  	/* No need to =
generate a new coredump if there's one in progress already. */
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  411  	if (work_pendi=
ng(&adev->coredump_work))
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  412  		return;
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  413 =20
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04 @414  	if (job && job=
->pasid)
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04  415  		size +=3D siz=
eof(struct amdgpu_coredump_ib_info) * job->num_ibs;
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04  416 =20
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04  417  	coredump =3D k=
zalloc(size, GFP_NOWAIT);
e29172987309526 Mario Limonciello (AMD     2025-12-14  418) 	if (!coredump)
9022f01b9709331 Sunil Khatri               2024-03-21  419  		return;
9022f01b9709331 Sunil Khatri               2024-03-21  420 =20
6122f5c72e38a88 Trigger Huang              2024-08-19  421  	coredump->skip=
_vram_check =3D skip_vram_check;
9022f01b9709331 Sunil Khatri               2024-03-21  422  	coredump->rese=
t_vram_lost =3D vram_lost;
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04 @423  	coredump->pasi=
d =3D job->pasid;
9022f01b9709331 Sunil Khatri               2024-03-21  424 =20
8d1a13816e59254 Christian K=C3=B6nig            2024-12-12 @425  	if (job &=
& job->pasid) {
9022f01b9709331 Sunil Khatri               2024-03-21  426  		struct amdgpu=
_task_info *ti;
9022f01b9709331 Sunil Khatri               2024-03-21  427 =20
8d1a13816e59254 Christian K=C3=B6nig            2024-12-12  428  		ti =3D a=
mdgpu_vm_get_task_info_pasid(adev, job->pasid);
9022f01b9709331 Sunil Khatri               2024-03-21  429  		if (ti) {
9022f01b9709331 Sunil Khatri               2024-03-21  430  			coredump->re=
set_task_info =3D *ti;
9022f01b9709331 Sunil Khatri               2024-03-21  431  			amdgpu_vm_pu=
t_task_info(ti);
9022f01b9709331 Sunil Khatri               2024-03-21  432  		}
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04  433  		coredump->num=
_ibs =3D job->num_ibs;
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04  434  		for (i =3D 0;=
 i < job->num_ibs; ++i) {
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04  435  			coredump->ib=
s[i].gpu_addr =3D job->ibs[i].gpu_addr;
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04  436  			coredump->ib=
s[i].ib_size_dw =3D job->ibs[i].length_dw;
32ab301b89b30d7 Pierre-Eric Pelloux-Prayer 2026-02-04  437  		}
9022f01b9709331 Sunil Khatri               2024-03-21  438  	}
9022f01b9709331 Sunil Khatri               2024-03-21  439 =20
9022f01b9709331 Sunil Khatri               2024-03-21  440  	if (job) {
9022f01b9709331 Sunil Khatri               2024-03-21  441  		s_job =3D &jo=
b->base;
9022f01b9709331 Sunil Khatri               2024-03-21  442  		coredump->rin=
g =3D to_amdgpu_ring(s_job->sched);
9022f01b9709331 Sunil Khatri               2024-03-21  443  	}
9022f01b9709331 Sunil Khatri               2024-03-21  444 =20
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  445  	/* Dump ring c=
ontent if memory allocation succeeds. */
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  446  	ring_count =3D =
0;
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  447  	total_ring_siz=
e =3D 0;
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  448  	for (i =3D 0; =
i < adev->num_rings; i++) {
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  449  		ring =3D adev=
->rings[i];
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  450 =20
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  451  		/* Only dump =
rings with unsignalled fences. */
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  452  		if (atomic_re=
ad(&ring->fence_drv.last_seq) =3D=3D ring->fence_drv.sync_seq &&
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  453  		    coredump-=
>ring !=3D ring)
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  454  			continue;
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  455 =20
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  456  		total_ring_si=
ze +=3D ring->ring_size;
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  457  		ring_count++;
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  458  	}
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  459  	coredump->ring=
s_dw =3D kzalloc(total_ring_size, GFP_NOWAIT);
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  460  	coredump->ring=
s =3D kcalloc(ring_count, sizeof(struct amdgpu_coredump_ring), GFP_NOWAIT);
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  461  	if (coredump->=
rings && coredump->rings_dw) {
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  462  		for (i =3D 0,=
 off =3D 0, idx =3D 0; i < adev->num_rings; i++) {
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  463  			ring =3D ade=
v->rings[i];
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  464 =20
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  465  			if (atomic_r=
ead(&ring->fence_drv.last_seq) =3D=3D ring->fence_drv.sync_seq &&
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  466  			    coredump=
->ring !=3D ring)
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  467  				continue;
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  468 =20
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  469  			coredump->ri=
ngs[idx].ring_index =3D ring->idx;
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  470  			coredump->ri=
ngs[idx].rptr =3D amdgpu_ring_get_rptr(ring);
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  471  			coredump->ri=
ngs[idx].wptr =3D amdgpu_ring_get_wptr(ring);
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  472  			coredump->ri=
ngs[idx].offset =3D off;
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  473 =20
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  474  			memcpy(&core=
dump->rings_dw[off], ring->ring, ring->ring_size);
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  475  			off +=3D rin=
g->ring_size;
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  476  			idx++;
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  477  		}
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  478  		coredump->num=
_rings =3D idx;
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  479  	} else {
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  480  		kvfree(coredu=
mp->rings_dw);
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  481  		kvfree(coredu=
mp->rings);
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  482  		coredump->rin=
gs_dw =3D NULL;
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  483  		coredump->rin=
gs =3D NULL;
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  484  	}
eea85914d15bfe3 Pierre-Eric Pelloux-Prayer 2026-02-04  485 =20
9022f01b9709331 Sunil Khatri               2024-03-21  486  	coredump->adev=
 =3D adev;
9022f01b9709331 Sunil Khatri               2024-03-21  487 =20
9022f01b9709331 Sunil Khatri               2024-03-21  488  	ktime_get_ts64=
(&coredump->reset_time);
9022f01b9709331 Sunil Khatri               2024-03-21  489 =20
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  490  	/* Update the =
current coredump pointer (no lock needed, this function can only be called
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  491  	 * from a sing=
le thread)
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  492  	 */
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  493  	adev->coredump=
 =3D coredump;
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  494  	/* Kick off co=
redump formatting to a worker thread. */
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  495  	queue_work(sys=
tem_unbound_wq, &adev->coredump_work);
28d05f0836dfc44 Andr=C3=A9 Almeida              2025-02-20  496 =20
28d05f0836dfc44 Andr=C3=A9 Almeida              2025-02-20  497  	drm_info(=
dev, "AMDGPU device coredump file has been created\n");
28d05f0836dfc44 Andr=C3=A9 Almeida              2025-02-20  498  	drm_info(=
dev, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
28d05f0836dfc44 Andr=C3=A9 Almeida              2025-02-20  499  		 dev->pr=
imary->index);
9022f01b9709331 Sunil Khatri               2024-03-21  500  }
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  501 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
