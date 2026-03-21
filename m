Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D70212B0A
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Mar 2026 03:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774063313; cv=none; b=Q3cPlQiBmha3WPsGHgAHTLMRHdvyJMGVIOpANLhvD417lLXaMqgC6Ghnt3gKigDoUOAqV4sEEPtgw4eNraJtH3w1YofolFvWqIMNBMRR7CblOYdrz5WMfNGSdGof25GUmEoqperHyFxn8avfjkXBlqafI8bnG3Q+wV7dCyGqkGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774063313; c=relaxed/simple;
	bh=0J2NkILctMqZdvlskF5Edg8I6b0wBzi4Q5+gcIcYV7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KUlII9ZB+IT3fq9Yat05eQtw+w/DqBQOiSXfQ+F1up8O7AmuCDX5clV+Xxk8NTTvARObBSoVjPO15nSgscH3stqp+gfnka19i060KGYwQbc3Sn+uklHiVmnA9+CL/M3DkFgFl02/wZzV5d+TvkGIFPjQcc7ufcjRHxNAX+F6y8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9AtIC4i; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9AtIC4i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774063311; x=1805599311;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0J2NkILctMqZdvlskF5Edg8I6b0wBzi4Q5+gcIcYV7k=;
  b=i9AtIC4iplIPNzSXqB/cXbFzttOmpyjjwGq0K3ToL/UlFzN1bq24Qv1l
   Xu7RhXmvbjCWQun3CL/6IjKJi+1p2xzLqV3Di8Vn3rUThdwbfFWReEYw9
   8POlJvPpKe9SG7n69cnB+clrHwj3Hxj67U83UMkfcTFhA4s42QYJ8Z0hX
   3BGimDtnA/vIb4PPDKH4hzn/7B8TWLMByW/03cjv2yT8LTI8/elGUstok
   Kaf33Ojm/r5GSaK2nf5p4yFxRjXsuookaGGqNi4h+R9ahY2rtp7dLCyyI
   I42T9Nea0xSEnzxygILn9UwysRVWFm+cz43gqcG1aZPyW3oFZBPy8aKNC
   Q==;
X-CSE-ConnectionGUID: w9ZCiIY/QDmAdIVF1sY4PQ==
X-CSE-MsgGUID: 0zEjQ7IZSIasp+A6oy88NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="86515144"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="86515144"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 20:21:50 -0700
X-CSE-ConnectionGUID: wjW2k4jJQ8GFXHEqlfBilA==
X-CSE-MsgGUID: W9SRo7UzSOe8eKmxulTfGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="228422410"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 20 Mar 2026 20:21:48 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3mtr-000000000FB-12BG;
	Sat, 21 Mar 2026 03:21:23 +0000
Date: Sat, 21 Mar 2026 11:21:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/i915/display/intel_crtc.c:333
 __intel_crtc_init() warn: 'primary' can also be NULL
Message-ID: <202603211130.jAqRrZgA-lkp@intel.com>
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
TO: Jani Nikula <jani.nikula@intel.com>
CC: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   42bddab0563fe67882b2722620a66dd98c8dbf33
commit: 668e88877a9ba73182ad686e871e8678a7dbca61 drm/i915/crtc: move crtc i=
nitialization loop to intel_crtc.c
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20260321 (https://download.01.org/0day-ci/arc=
hive/20260321/202603211130.jAqRrZgA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603211130.jAqRrZgA-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/intel_crtc.c:333 __intel_crtc_init() warn: 'pr=
imary' can also be NULL
drivers/gpu/drm/i915/display/intel_crtc.c:348 __intel_crtc_init() warn: 'pl=
ane' can also be NULL

vim +/primary +333 drivers/gpu/drm/i915/display/intel_crtc.c

fbf756c31cca387 Dave Airlie   2021-01-14  310 =20
668e88877a9ba73 Jani Nikula   2025-12-04  311  static int __intel_crtc_init=
(struct intel_display *display, enum pipe pipe)
fbf756c31cca387 Dave Airlie   2021-01-14  312  {
fbf756c31cca387 Dave Airlie   2021-01-14  313  	struct intel_plane *primary=
, *cursor;
fbf756c31cca387 Dave Airlie   2021-01-14  314  	const struct drm_crtc_funcs=
 *funcs;
fbf756c31cca387 Dave Airlie   2021-01-14  315  	struct intel_crtc *crtc;
fbf756c31cca387 Dave Airlie   2021-01-14  316  	int sprite, ret;
fbf756c31cca387 Dave Airlie   2021-01-14  317 =20
fbf756c31cca387 Dave Airlie   2021-01-14  318  	crtc =3D intel_crtc_alloc();
fbf756c31cca387 Dave Airlie   2021-01-14  319  	if (IS_ERR(crtc))
fbf756c31cca387 Dave Airlie   2021-01-14  320  		return PTR_ERR(crtc);
fbf756c31cca387 Dave Airlie   2021-01-14  321 =20
fbf756c31cca387 Dave Airlie   2021-01-14  322  	crtc->pipe =3D pipe;
b2479f7231d8b16 Ville Syrj=C3=A4l=C3=A4 2025-02-06  323  	crtc->num_scalers=
 =3D DISPLAY_RUNTIME_INFO(display)->num_scalers[pipe];
fbf756c31cca387 Dave Airlie   2021-01-14  324 =20
b2479f7231d8b16 Ville Syrj=C3=A4l=C3=A4 2025-02-06  325  	if (DISPLAY_VER(d=
isplay) >=3D 9)
a2ed9f845247950 Ville Syrj=C3=A4l=C3=A4 2025-02-06  326  		primary =3D skl_=
universal_plane_create(display, pipe, PLANE_1);
46d12f911821f7b Dave Airlie   2021-02-05  327  	else
880ed2d84db9a1d Ville Syrj=C3=A4l=C3=A4 2025-02-06  328  		primary =3D inte=
l_primary_plane_create(display, pipe);
fbf756c31cca387 Dave Airlie   2021-01-14  329  	if (IS_ERR(primary)) {
fbf756c31cca387 Dave Airlie   2021-01-14  330  		ret =3D PTR_ERR(primary);
fbf756c31cca387 Dave Airlie   2021-01-14  331  		goto fail;
fbf756c31cca387 Dave Airlie   2021-01-14  332  	}
fbf756c31cca387 Dave Airlie   2021-01-14 @333  	crtc->plane_ids_mask |=3D B=
IT(primary->id);
fbf756c31cca387 Dave Airlie   2021-01-14  334 =20
f414bb4f717ad5a Jani Nikula   2025-02-12  335  	intel_init_fifo_underrun_re=
porting(display, crtc, false);
66560f33059ebe6 Ville Syrj=C3=A4l=C3=A4 2023-01-25  336 =20
b2479f7231d8b16 Ville Syrj=C3=A4l=C3=A4 2025-02-06  337  	for_each_sprite(d=
isplay, pipe, sprite) {
fbf756c31cca387 Dave Airlie   2021-01-14  338  		struct intel_plane *plane;
fbf756c31cca387 Dave Airlie   2021-01-14  339 =20
a76a2be26df3733 Jani Nikula   2025-05-06  340  		if (DISPLAY_VER(display) >=
=3D 9)
a2ed9f845247950 Ville Syrj=C3=A4l=C3=A4 2025-02-06  341  			plane =3D skl_u=
niversal_plane_create(display, pipe, PLANE_2 + sprite);
46d12f911821f7b Dave Airlie   2021-02-05  342  		else
9665025b57796f1 Ville Syrj=C3=A4l=C3=A4 2025-02-06  343  			plane =3D intel=
_sprite_plane_create(display, pipe, sprite);
fbf756c31cca387 Dave Airlie   2021-01-14  344  		if (IS_ERR(plane)) {
fbf756c31cca387 Dave Airlie   2021-01-14  345  			ret =3D PTR_ERR(plane);
fbf756c31cca387 Dave Airlie   2021-01-14  346  			goto fail;
fbf756c31cca387 Dave Airlie   2021-01-14  347  		}
fbf756c31cca387 Dave Airlie   2021-01-14 @348  		crtc->plane_ids_mask |=3D =
BIT(plane->id);
fbf756c31cca387 Dave Airlie   2021-01-14  349  	}
fbf756c31cca387 Dave Airlie   2021-01-14  350 =20
69e79a3a3208fbc Ville Syrj=C3=A4l=C3=A4 2025-02-06  351  	cursor =3D intel_=
cursor_plane_create(display, pipe);
fbf756c31cca387 Dave Airlie   2021-01-14  352  	if (IS_ERR(cursor)) {
fbf756c31cca387 Dave Airlie   2021-01-14  353  		ret =3D PTR_ERR(cursor);
fbf756c31cca387 Dave Airlie   2021-01-14  354  		goto fail;
fbf756c31cca387 Dave Airlie   2021-01-14  355  	}
fbf756c31cca387 Dave Airlie   2021-01-14  356  	crtc->plane_ids_mask |=3D B=
IT(cursor->id);
fbf756c31cca387 Dave Airlie   2021-01-14  357 =20
b2479f7231d8b16 Ville Syrj=C3=A4l=C3=A4 2025-02-06  358  	if (HAS_GMCH(disp=
lay)) {
b2479f7231d8b16 Ville Syrj=C3=A4l=C3=A4 2025-02-06  359  		if (display->pla=
tform.cherryview ||
b2479f7231d8b16 Ville Syrj=C3=A4l=C3=A4 2025-02-06  360  		    display->pla=
tform.valleyview ||
b2479f7231d8b16 Ville Syrj=C3=A4l=C3=A4 2025-02-06  361  		    display->pla=
tform.g4x)
fbf756c31cca387 Dave Airlie   2021-01-14  362  			funcs =3D &g4x_crtc_funcs;
b2479f7231d8b16 Ville Syrj=C3=A4l=C3=A4 2025-02-06  363  		else if (DISPLAY=
_VER(display) =3D=3D 4)
fbf756c31cca387 Dave Airlie   2021-01-14  364  			funcs =3D &i965_crtc_func=
s;
b2479f7231d8b16 Ville Syrj=C3=A4l=C3=A4 2025-02-06  365  		else if (display=
->platform.i945gm ||
b2479f7231d8b16 Ville Syrj=C3=A4l=C3=A4 2025-02-06  366  			 display->platf=
orm.i915gm)
fbf756c31cca387 Dave Airlie   2021-01-14  367  			funcs =3D &i915gm_crtc_fu=
ncs;
b2479f7231d8b16 Ville Syrj=C3=A4l=C3=A4 2025-02-06  368  		else if (DISPLAY=
_VER(display) =3D=3D 3)
fbf756c31cca387 Dave Airlie   2021-01-14  369  			funcs =3D &i915_crtc_func=
s;
fbf756c31cca387 Dave Airlie   2021-01-14  370  		else
fbf756c31cca387 Dave Airlie   2021-01-14  371  			funcs =3D &i8xx_crtc_func=
s;
fbf756c31cca387 Dave Airlie   2021-01-14  372  	} else {
b2479f7231d8b16 Ville Syrj=C3=A4l=C3=A4 2025-02-06  373  		if (DISPLAY_VER(=
display) >=3D 8)
fbf756c31cca387 Dave Airlie   2021-01-14  374  			funcs =3D &bdw_crtc_funcs;
fbf756c31cca387 Dave Airlie   2021-01-14  375  		else
fbf756c31cca387 Dave Airlie   2021-01-14  376  			funcs =3D &ilk_crtc_funcs;
fbf756c31cca387 Dave Airlie   2021-01-14  377  	}
fbf756c31cca387 Dave Airlie   2021-01-14  378 =20
b2479f7231d8b16 Ville Syrj=C3=A4l=C3=A4 2025-02-06  379  	ret =3D drm_crtc_=
init_with_planes(display->drm, &crtc->base,
fbf756c31cca387 Dave Airlie   2021-01-14  380  					&primary->base, &cursor=
->base,
fbf756c31cca387 Dave Airlie   2021-01-14  381  					funcs, "pipe %c", pipe_=
name(pipe));
fbf756c31cca387 Dave Airlie   2021-01-14  382  	if (ret)
fbf756c31cca387 Dave Airlie   2021-01-14  383  		goto fail;
fbf756c31cca387 Dave Airlie   2021-01-14  384 =20
b2479f7231d8b16 Ville Syrj=C3=A4l=C3=A4 2025-02-06  385  	if (DISPLAY_VER(d=
isplay) >=3D 11)
fbf756c31cca387 Dave Airlie   2021-01-14  386  		drm_crtc_create_scaling_fi=
lter_property(&crtc->base,
fbf756c31cca387 Dave Airlie   2021-01-14  387  						BIT(DRM_SCALING_FILTER=
_DEFAULT) |
fbf756c31cca387 Dave Airlie   2021-01-14  388  						BIT(DRM_SCALING_FILTER=
_NEAREST_NEIGHBOR));
fbf756c31cca387 Dave Airlie   2021-01-14  389 =20
a2b1d9ecaa755c4 Ville Syrj=C3=A4l=C3=A4 2022-10-04  390  	intel_color_crtc_=
init(crtc);
a2b1d9ecaa755c4 Ville Syrj=C3=A4l=C3=A4 2022-10-04  391  	intel_drrs_crtc_i=
nit(crtc);
fbf756c31cca387 Dave Airlie   2021-01-14  392  	intel_crtc_crc_init(crtc);
fbf756c31cca387 Dave Airlie   2021-01-14  393 =20
2bbc6fcaf8c58a7 Ville Syrj=C3=A4l=C3=A4 2021-10-21  394  	cpu_latency_qos_a=
dd_request(&crtc->vblank_pm_qos, PM_QOS_DEFAULT_VALUE);
2bbc6fcaf8c58a7 Ville Syrj=C3=A4l=C3=A4 2021-10-21  395 =20
b2479f7231d8b16 Ville Syrj=C3=A4l=C3=A4 2025-02-06  396  	drm_WARN_ON(displ=
ay->drm, drm_crtc_index(&crtc->base) !=3D crtc->pipe);
fbf756c31cca387 Dave Airlie   2021-01-14  397 =20
1552691f960a9ee Nemesa Garg   2025-11-26  398  	if (HAS_CASF(display) && cr=
tc->num_scalers >=3D 2)
7460b69f1d61e89 Nemesa Garg   2025-10-28  399  		drm_crtc_create_sharpness_=
strength_property(&crtc->base);
7460b69f1d61e89 Nemesa Garg   2025-10-28  400 =20
fbf756c31cca387 Dave Airlie   2021-01-14  401  	return 0;
fbf756c31cca387 Dave Airlie   2021-01-14  402 =20
fbf756c31cca387 Dave Airlie   2021-01-14  403  fail:
fbf756c31cca387 Dave Airlie   2021-01-14  404  	intel_crtc_free(crtc);
fbf756c31cca387 Dave Airlie   2021-01-14  405 =20
fbf756c31cca387 Dave Airlie   2021-01-14  406  	return ret;
fbf756c31cca387 Dave Airlie   2021-01-14  407  }
d471008b00c1a0f Dave Airlie   2021-02-05  408 =20

:::::: The code at line 333 was first introduced by commit
:::::: fbf756c31cca387510f4950bdd9704162e8196da drm/i915: refactor some crt=
c code out of intel display. (v2)

:::::: TO: Dave Airlie <airlied@redhat.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
