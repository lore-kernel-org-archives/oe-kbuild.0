Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8177D1DE4F1
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Jul 2026 13:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785070979; cv=none; b=NiG4jyE+50Z8UYKQ4VLhr1Cc6Dmzdm3MSpBd0MTVLQKdB/KDRNJjdqdTEiE9hjRmGsPcX758VFXfEW4RCQpW0M84AUYqvyXVC/mHLs5lV3byfH4s0xlJsWs0X9qi5cBOq8Wx83ITHyW1jZphMYwM0/TnIiLvBI5mUAY6xphoI6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785070979; c=relaxed/simple;
	bh=uO+0NLvCuvzjbNF8F4dHFadFHCSOvZP/PngpdFiEdCE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=POOZvR5vqzxgLmmssyY1gwMvSH0lSrlyiZPEOeoSm230SWW7w87TvBocCuh/hNrQROS10leKgcbkjzeXOaV7hU+/lR/BJDxvsLlvwWrTRezcPsxt7wHIVE5EUEMmy9kAAimHEJHGDCYys7qMX1hmnY5z6nd02hz0tXqSw/jZKyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZGxzDYzo; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZGxzDYzo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785070977; x=1816606977;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uO+0NLvCuvzjbNF8F4dHFadFHCSOvZP/PngpdFiEdCE=;
  b=ZGxzDYzo6QxF4wz7343E/2tHN6DSdMvFDz6eR5fUNW2zVp6QnGX7wk0r
   Bp09u1f94cQiIi8SaPtjX3PdcAlul9zqsrcxHF5oq73wh3ByJPtSPLtPB
   m9C3ZgROIsmItN0lnpI15J0wFw1ytMO3twsHK5zX79y3YQfjRgtfhJLZp
   jEB5fopl40rwPj6QWKZkz0Z8CYyX0vRwmPM22iPWQ0hVqRA4CHJw92JwO
   d5rrjzWjpPa4joi7UzldCw+OjhPuxwUPlplwznrcxXwtYWapU3eOqGt2a
   jVPzKkqLmrweK3efsj3I90ymHlVPHaen6O7GPll9hoFUeTOgAc+uBTTaM
   A==;
X-CSE-ConnectionGUID: /dBvUn/NSQSJlxdHOOZgCg==
X-CSE-MsgGUID: FYvqnnAKTxC8WXE4ri6j5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="89331355"
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="89331355"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 06:02:56 -0700
X-CSE-ConnectionGUID: hpG3SiZ1SE2O1lcBzAD2Ew==
X-CSE-MsgGUID: ZfMQgfBISjauVGcnDf6/hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="262665300"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 26 Jul 2026 06:02:54 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnyVI-00000000cX0-2JlO;
	Sun, 26 Jul 2026 13:02:52 +0000
Date: Sun, 26 Jul 2026 21:02:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/i915/display/intel_crtc.c:333
 __intel_crtc_init() warn: 'primary' can also be NULL
Message-ID: <202607262038.N7pTymzw-lkp@intel.com>
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
head:   0ce37745d4bfbc493f718169c3974898ffec8ee7
commit: 668e88877a9ba73182ad686e871e8678a7dbca61 drm/i915/crtc: move crtc i=
nitialization loop to intel_crtc.c
date:   8 months ago
:::::: branch date: 34 hours ago
:::::: commit date: 8 months ago
config: alpha-randconfig-r071-20260726 (https://download.01.org/0day-ci/arc=
hive/20260726/202607262038.N7pTymzw-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 668e88877a9b ("drm/i915/crtc: move crtc initialization loop to int=
el_crtc.c")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607262038.N7pTymzw-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/intel_crtc.c:333 __intel_crtc_init() warn: 'pr=
imary' can also be NULL
drivers/gpu/drm/i915/display/intel_crtc.c:348 __intel_crtc_init() warn: 'pl=
ane' can also be NULL

vim +/primary +333 drivers/gpu/drm/i915/display/intel_crtc.c

fbf756c31cca38 Dave Airlie   2021-01-14  310 =20
668e88877a9ba7 Jani Nikula   2025-12-04  311  static int __intel_crtc_init(=
struct intel_display *display, enum pipe pipe)
fbf756c31cca38 Dave Airlie   2021-01-14  312  {
fbf756c31cca38 Dave Airlie   2021-01-14  313  	struct intel_plane *primary,=
 *cursor;
fbf756c31cca38 Dave Airlie   2021-01-14  314  	const struct drm_crtc_funcs =
*funcs;
fbf756c31cca38 Dave Airlie   2021-01-14  315  	struct intel_crtc *crtc;
fbf756c31cca38 Dave Airlie   2021-01-14  316  	int sprite, ret;
fbf756c31cca38 Dave Airlie   2021-01-14  317 =20
fbf756c31cca38 Dave Airlie   2021-01-14  318  	crtc =3D intel_crtc_alloc();
fbf756c31cca38 Dave Airlie   2021-01-14  319  	if (IS_ERR(crtc))
fbf756c31cca38 Dave Airlie   2021-01-14  320  		return PTR_ERR(crtc);
fbf756c31cca38 Dave Airlie   2021-01-14  321 =20
fbf756c31cca38 Dave Airlie   2021-01-14  322  	crtc->pipe =3D pipe;
b2479f7231d8b1 Ville Syrj=C3=A4l=C3=A4 2025-02-06  323  	crtc->num_scalers =
=3D DISPLAY_RUNTIME_INFO(display)->num_scalers[pipe];
fbf756c31cca38 Dave Airlie   2021-01-14  324 =20
b2479f7231d8b1 Ville Syrj=C3=A4l=C3=A4 2025-02-06  325  	if (DISPLAY_VER(di=
splay) >=3D 9)
a2ed9f84524795 Ville Syrj=C3=A4l=C3=A4 2025-02-06  326  		primary =3D skl_u=
niversal_plane_create(display, pipe, PLANE_1);
46d12f911821f7 Dave Airlie   2021-02-05  327  	else
880ed2d84db9a1 Ville Syrj=C3=A4l=C3=A4 2025-02-06  328  		primary =3D intel=
_primary_plane_create(display, pipe);
fbf756c31cca38 Dave Airlie   2021-01-14  329  	if (IS_ERR(primary)) {
fbf756c31cca38 Dave Airlie   2021-01-14  330  		ret =3D PTR_ERR(primary);
fbf756c31cca38 Dave Airlie   2021-01-14  331  		goto fail;
fbf756c31cca38 Dave Airlie   2021-01-14  332  	}
fbf756c31cca38 Dave Airlie   2021-01-14 @333  	crtc->plane_ids_mask |=3D BI=
T(primary->id);
fbf756c31cca38 Dave Airlie   2021-01-14  334 =20
f414bb4f717ad5 Jani Nikula   2025-02-12  335  	intel_init_fifo_underrun_rep=
orting(display, crtc, false);
66560f33059ebe Ville Syrj=C3=A4l=C3=A4 2023-01-25  336 =20
b2479f7231d8b1 Ville Syrj=C3=A4l=C3=A4 2025-02-06  337  	for_each_sprite(di=
splay, pipe, sprite) {
fbf756c31cca38 Dave Airlie   2021-01-14  338  		struct intel_plane *plane;
fbf756c31cca38 Dave Airlie   2021-01-14  339 =20
a76a2be26df373 Jani Nikula   2025-05-06  340  		if (DISPLAY_VER(display) >=
=3D 9)
a2ed9f84524795 Ville Syrj=C3=A4l=C3=A4 2025-02-06  341  			plane =3D skl_un=
iversal_plane_create(display, pipe, PLANE_2 + sprite);
46d12f911821f7 Dave Airlie   2021-02-05  342  		else
9665025b57796f Ville Syrj=C3=A4l=C3=A4 2025-02-06  343  			plane =3D intel_=
sprite_plane_create(display, pipe, sprite);
fbf756c31cca38 Dave Airlie   2021-01-14  344  		if (IS_ERR(plane)) {
fbf756c31cca38 Dave Airlie   2021-01-14  345  			ret =3D PTR_ERR(plane);
fbf756c31cca38 Dave Airlie   2021-01-14  346  			goto fail;
fbf756c31cca38 Dave Airlie   2021-01-14  347  		}
fbf756c31cca38 Dave Airlie   2021-01-14 @348  		crtc->plane_ids_mask |=3D B=
IT(plane->id);
fbf756c31cca38 Dave Airlie   2021-01-14  349  	}
fbf756c31cca38 Dave Airlie   2021-01-14  350 =20
69e79a3a3208fb Ville Syrj=C3=A4l=C3=A4 2025-02-06  351  	cursor =3D intel_c=
ursor_plane_create(display, pipe);
fbf756c31cca38 Dave Airlie   2021-01-14  352  	if (IS_ERR(cursor)) {
fbf756c31cca38 Dave Airlie   2021-01-14  353  		ret =3D PTR_ERR(cursor);
fbf756c31cca38 Dave Airlie   2021-01-14  354  		goto fail;
fbf756c31cca38 Dave Airlie   2021-01-14  355  	}
fbf756c31cca38 Dave Airlie   2021-01-14  356  	crtc->plane_ids_mask |=3D BI=
T(cursor->id);
fbf756c31cca38 Dave Airlie   2021-01-14  357 =20
b2479f7231d8b1 Ville Syrj=C3=A4l=C3=A4 2025-02-06  358  	if (HAS_GMCH(displ=
ay)) {
b2479f7231d8b1 Ville Syrj=C3=A4l=C3=A4 2025-02-06  359  		if (display->plat=
form.cherryview ||
b2479f7231d8b1 Ville Syrj=C3=A4l=C3=A4 2025-02-06  360  		    display->plat=
form.valleyview ||
b2479f7231d8b1 Ville Syrj=C3=A4l=C3=A4 2025-02-06  361  		    display->plat=
form.g4x)
fbf756c31cca38 Dave Airlie   2021-01-14  362  			funcs =3D &g4x_crtc_funcs;
b2479f7231d8b1 Ville Syrj=C3=A4l=C3=A4 2025-02-06  363  		else if (DISPLAY_=
VER(display) =3D=3D 4)
fbf756c31cca38 Dave Airlie   2021-01-14  364  			funcs =3D &i965_crtc_funcs;
b2479f7231d8b1 Ville Syrj=C3=A4l=C3=A4 2025-02-06  365  		else if (display-=
>platform.i945gm ||
b2479f7231d8b1 Ville Syrj=C3=A4l=C3=A4 2025-02-06  366  			 display->platfo=
rm.i915gm)
fbf756c31cca38 Dave Airlie   2021-01-14  367  			funcs =3D &i915gm_crtc_fun=
cs;
b2479f7231d8b1 Ville Syrj=C3=A4l=C3=A4 2025-02-06  368  		else if (DISPLAY_=
VER(display) =3D=3D 3)
fbf756c31cca38 Dave Airlie   2021-01-14  369  			funcs =3D &i915_crtc_funcs;
fbf756c31cca38 Dave Airlie   2021-01-14  370  		else
fbf756c31cca38 Dave Airlie   2021-01-14  371  			funcs =3D &i8xx_crtc_funcs;
fbf756c31cca38 Dave Airlie   2021-01-14  372  	} else {
b2479f7231d8b1 Ville Syrj=C3=A4l=C3=A4 2025-02-06  373  		if (DISPLAY_VER(d=
isplay) >=3D 8)
fbf756c31cca38 Dave Airlie   2021-01-14  374  			funcs =3D &bdw_crtc_funcs;
fbf756c31cca38 Dave Airlie   2021-01-14  375  		else
fbf756c31cca38 Dave Airlie   2021-01-14  376  			funcs =3D &ilk_crtc_funcs;
fbf756c31cca38 Dave Airlie   2021-01-14  377  	}
fbf756c31cca38 Dave Airlie   2021-01-14  378 =20
b2479f7231d8b1 Ville Syrj=C3=A4l=C3=A4 2025-02-06  379  	ret =3D drm_crtc_i=
nit_with_planes(display->drm, &crtc->base,
fbf756c31cca38 Dave Airlie   2021-01-14  380  					&primary->base, &cursor-=
>base,
fbf756c31cca38 Dave Airlie   2021-01-14  381  					funcs, "pipe %c", pipe_n=
ame(pipe));
fbf756c31cca38 Dave Airlie   2021-01-14  382  	if (ret)
fbf756c31cca38 Dave Airlie   2021-01-14  383  		goto fail;
fbf756c31cca38 Dave Airlie   2021-01-14  384 =20
b2479f7231d8b1 Ville Syrj=C3=A4l=C3=A4 2025-02-06  385  	if (DISPLAY_VER(di=
splay) >=3D 11)
fbf756c31cca38 Dave Airlie   2021-01-14  386  		drm_crtc_create_scaling_fil=
ter_property(&crtc->base,
fbf756c31cca38 Dave Airlie   2021-01-14  387  						BIT(DRM_SCALING_FILTER_=
DEFAULT) |
fbf756c31cca38 Dave Airlie   2021-01-14  388  						BIT(DRM_SCALING_FILTER_=
NEAREST_NEIGHBOR));
fbf756c31cca38 Dave Airlie   2021-01-14  389 =20
a2b1d9ecaa755c Ville Syrj=C3=A4l=C3=A4 2022-10-04  390  	intel_color_crtc_i=
nit(crtc);
a2b1d9ecaa755c Ville Syrj=C3=A4l=C3=A4 2022-10-04  391  	intel_drrs_crtc_in=
it(crtc);
fbf756c31cca38 Dave Airlie   2021-01-14  392  	intel_crtc_crc_init(crtc);
fbf756c31cca38 Dave Airlie   2021-01-14  393 =20
2bbc6fcaf8c58a Ville Syrj=C3=A4l=C3=A4 2021-10-21  394  	cpu_latency_qos_ad=
d_request(&crtc->vblank_pm_qos, PM_QOS_DEFAULT_VALUE);
2bbc6fcaf8c58a Ville Syrj=C3=A4l=C3=A4 2021-10-21  395 =20
b2479f7231d8b1 Ville Syrj=C3=A4l=C3=A4 2025-02-06  396  	drm_WARN_ON(displa=
y->drm, drm_crtc_index(&crtc->base) !=3D crtc->pipe);
fbf756c31cca38 Dave Airlie   2021-01-14  397 =20
1552691f960a9e Nemesa Garg   2025-11-26  398  	if (HAS_CASF(display) && crt=
c->num_scalers >=3D 2)
7460b69f1d61e8 Nemesa Garg   2025-10-28  399  		drm_crtc_create_sharpness_s=
trength_property(&crtc->base);
7460b69f1d61e8 Nemesa Garg   2025-10-28  400 =20
fbf756c31cca38 Dave Airlie   2021-01-14  401  	return 0;
fbf756c31cca38 Dave Airlie   2021-01-14  402 =20
fbf756c31cca38 Dave Airlie   2021-01-14  403  fail:
fbf756c31cca38 Dave Airlie   2021-01-14  404  	intel_crtc_free(crtc);
fbf756c31cca38 Dave Airlie   2021-01-14  405 =20
fbf756c31cca38 Dave Airlie   2021-01-14  406  	return ret;
fbf756c31cca38 Dave Airlie   2021-01-14  407  }
d471008b00c1a0 Dave Airlie   2021-02-05  408 =20

:::::: The code at line 333 was first introduced by commit
:::::: fbf756c31cca387510f4950bdd9704162e8196da drm/i915: refactor some crt=
c code out of intel display. (v2)

:::::: TO: Dave Airlie <airlied@redhat.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
