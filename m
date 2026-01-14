Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D63397AA0
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Jan 2026 13:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768396969; cv=none; b=Wq/8buaAXkwq852GqpwXTsuhw+ceTguHWpqTnvehU10vjbr2pRRTtUqJyCTsW/Nh2+ZZTsbaqCD78iQbT6kAePkHJYkHlQWhp6TPvmRuI7GvsDw0nnO6JolVhZsRw/aTwiXuzebS+ah9vuVRgMhDEsfor0p/9qivIiqSHTu6lk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768396969; c=relaxed/simple;
	bh=xR2Sek46YGbC/Yq56RyTi3QMHNBBf/0pi8M0SZk3ufQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AYyVkJkO9VAo1KiEwovOpGxkV0HVQZwqDjJZ9D/AP/hGUf59Qvk4E3t/H0HbOt2W1uug/xbtCPBjT17PkprLkj1dAG1S0yH/X6FS6TROEhHcLLIOxMc2YLchax/mI7QMHc9MNyXpsotuV3rqbfGl7QjvxBfPVFYYhZSo/FuB1b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TqGN5wIw; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TqGN5wIw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768396967; x=1799932967;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xR2Sek46YGbC/Yq56RyTi3QMHNBBf/0pi8M0SZk3ufQ=;
  b=TqGN5wIwP0px9YkP0xBD7vMtnO7J68UU3RHCdG+vmW8Fe4MwrLjjwKpG
   NMDhmPvb7AXdRmQmywU7VrtAKDWeEukFgWS/JFPkRZJ/9vnvDimyZ627R
   QI73PUm10+A2WVTS5zo4TysIxk263chc2zUpyZ31xQOGe43mBCZECo9MZ
   trwtAaiqN2/jtRTKS/d1FcXwVV4cQI3IBKYFRUri1/f7A5DshyCjcTE1K
   vlWiZCb0TBguQrjGU0xWME3GgXM/PhS3mfAZF5tvHfEGOmAPi4O2siakw
   O/alA1eySVfYWdzehNKTihwU0rfAcIg4MK/ZdyRGxfDdWawHjvHqT7QsM
   g==;
X-CSE-ConnectionGUID: iHzzpTi3Rtu6BhxScsnD0A==
X-CSE-MsgGUID: 0LaClgwDSROd32gJnyQWDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73329651"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="73329651"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 05:22:46 -0800
X-CSE-ConnectionGUID: InzA9bGZQJ+WJv2Wz0kWcA==
X-CSE-MsgGUID: EwnPWPqpTQqRALH1RN1a1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="242222611"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Jan 2026 05:22:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg0pe-00000000GQS-43pp;
	Wed, 14 Jan 2026 13:22:42 +0000
Date: Wed, 14 Jan 2026 21:22:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5767/6121]
 drivers/gpu/drm/gud/gud_pipe.c:616 gud_plane_atomic_update() error: we
 previously assumed 'crtc' could be null (see line 597)
Message-ID: <202601142159.0v8ilfVs-lkp@intel.com>
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
TO: Shenghao Yang <me@shenghaoyang.info>
CC: Ruben Wauters <rubenru09@aol.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   b775e489bec70895b7ef6b66927886bbac79598f
commit: dc2d5ddb193e363187bae2ad358245642d2721fb [5767/6121] drm/gud: fix N=
ULL fb and crtc dereferences on USB disconnect
:::::: branch date: 8 hours ago
:::::: commit date: 23 hours ago
config: x86_64-randconfig-161-20260114 (https://download.01.org/0day-ci/arc=
hive/20260114/202601142159.0v8ilfVs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601142159.0v8ilfVs-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/gud/gud_pipe.c:616 gud_plane_atomic_update() error: we prev=
iously assumed 'crtc' could be null (see line 597)

vim +/crtc +616 drivers/gpu/drm/gud/gud_pipe.c

40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  582 =20
73cfd166e04576 Ruben Wauters  2025-08-18  583  void gud_plane_atomic_update=
(struct drm_plane *plane,
73cfd166e04576 Ruben Wauters  2025-08-18  584  			     struct drm_atomic_st=
ate *atomic_state)
40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  585  {
73cfd166e04576 Ruben Wauters  2025-08-18  586  	struct drm_device *drm =3D =
plane->dev;
40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  587  	struct gud_device *gdr=
m =3D to_gud_device(drm);
73cfd166e04576 Ruben Wauters  2025-08-18  588  	struct drm_plane_state *old=
_state =3D drm_atomic_get_old_plane_state(atomic_state, plane);
73cfd166e04576 Ruben Wauters  2025-08-18  589  	struct drm_plane_state *new=
_state =3D drm_atomic_get_new_plane_state(atomic_state, plane);
73cfd166e04576 Ruben Wauters  2025-08-18  590  	struct drm_shadow_plane_sta=
te *shadow_plane_state =3D to_drm_shadow_plane_state(new_state);
73cfd166e04576 Ruben Wauters  2025-08-18  591  	struct drm_framebuffer *fb =
=3D new_state->fb;
73cfd166e04576 Ruben Wauters  2025-08-18  592  	struct drm_crtc *crtc =3D n=
ew_state->crtc;
40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  593  	struct drm_rect damage;
73cfd166e04576 Ruben Wauters  2025-08-18  594  	struct drm_atomic_helper_da=
mage_iter iter;
c17d048609bf09 Noralf Tr=C3=B8nnes 2022-11-30  595  	int ret, idx;
40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  596 =20
dc2d5ddb193e36 Shenghao Yang  2025-12-31 @597  	if (!crtc || crtc->state->m=
ode_changed || !crtc->state->enable) {
40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  598  		cancel_work_sync(&gdr=
m->work);
40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  599  		mutex_lock(&gdrm->dam=
age_lock);
40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  600  		if (gdrm->fb) {
40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  601  			drm_framebuffer_put(=
gdrm->fb);
40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  602  			gdrm->fb =3D NULL;
40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  603  		}
40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  604  		gud_clear_damage(gdrm=
);
c17d048609bf09 Noralf Tr=C3=B8nnes 2022-11-30  605  		vfree(gdrm->shadow_bu=
f);
c17d048609bf09 Noralf Tr=C3=B8nnes 2022-11-30  606  		gdrm->shadow_buf =3D =
NULL;
40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  607  		mutex_unlock(&gdrm->d=
amage_lock);
40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  608  	}
40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  609 =20
40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  610  	if (!drm_dev_enter(drm=
, &idx))
40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  611  		return;
40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  612 =20
40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  613  	if (!old_state->fb)
40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  614  		gud_usb_set_u8(gdrm, =
GUD_REQ_SET_CONTROLLER_ENABLE, 1);
40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  615 =20
40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13 @616  	if (fb && (crtc->state=
->mode_changed || crtc->state->connectors_changed))

:::::: The code at line 616 was first introduced by commit
:::::: 40e1a70b4aedf2859a1829991b48ef0ebe650bf2 drm: Add GUD USB Display dr=
iver

:::::: TO: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
:::::: CC: Noralf Tr=C3=B8nnes <noralf@tronnes.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
