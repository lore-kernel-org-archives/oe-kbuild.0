Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BDC2BEFE8
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Aug 2026 19:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786736352; cv=none; b=FqxlA9JIzyFNb43YySAM0b2+umriCEUKVXvjHyJpLN0pbXK2mgmly3Evif2xKm2jOdLgSdH/+j8n89B82aJH5v/ie5RYIIlVRLaemOfynCHncZPMXb5FH+tf/bovSPYODUDFXzd3gEwMXZWckHXOLlZFJKunZZ9aUlZsjotBCJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786736352; c=relaxed/simple;
	bh=3TthddoMWvJF+646LGPnybGueYFEE0OX+JwRdvFM8Ag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ILtkNQDCSghd9Jn9Qf0iT/sgnW1y2PwKvBHYF1HNn6gVp+KyXuatvJM73NvUx2j1VQDcQizGKPeq7WGQIJvOWw0paf54D7ehRWp/vGc0Al4CXu45L13FwppGzO8BmK5ir2vZbU7DhzuxaeeBCQNQjJL3+rCIzkXRM8nFZqxFu8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZhlFoN5k; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZhlFoN5k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786736351; x=1818272351;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3TthddoMWvJF+646LGPnybGueYFEE0OX+JwRdvFM8Ag=;
  b=ZhlFoN5koIwA72jganLl1EKTLaMZlfhmmOoBWSWjPnX1UeUtPerT48C3
   Dnh9IJjHyD9VhJmbnssjPKqEV68ZCTXvon8uoQZGYH6t6A5hxfAi0JiQw
   XQoE5jf6h8EI/ihzCge7PzPzf9a8XIjebX/gxA87wM1xmEEnFDrpFdFn6
   GR3clQvTiW/zgm4Ss1ZhuFOR9KnujbcVCJsACtVABVEA1YNZuA+EUqdhD
   5lXP1ishqIHJNQvBS1TO1lquceaUbI4EsyJQvU8YEMzOn/QEF1oKsdTCi
   EiJgCFpAdkgT7vKmQiafDFER9cQrNebDOYOwBmyE+C3zoJMVrR9XNvopx
   A==;
X-CSE-ConnectionGUID: +CQU44qPSWaTbzXBuO9+3g==
X-CSE-MsgGUID: G7T95IYEQp+g59IboPphvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="90993608"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="90993608"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 12:39:07 -0700
X-CSE-ConnectionGUID: kPcN+OBYT+6R5zE0phghug==
X-CSE-MsgGUID: fykBwOimT5ywjDFJzgA13A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="263862981"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Aug 2026 12:39:05 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuxk6-00000000Zxw-41HV;
	Fri, 14 Aug 2026 19:39:02 +0000
Date: Sat, 15 Aug 2026 03:38:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/i915/display/intel_color.c:2392
 i9xx_color_check() error: we previously assumed 'crtc_state->hw.gamma_lut'
 could be null (see line 2385)
Message-ID: <202608150344.S6VQCwJF-lkp@intel.com>
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
TO: Yury Norov <ynorov@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2f1baf1fc8929e6c48370be543ad028ac7ad4131
commit: 09472f591aa0b72c2dd6c693f48b2d6fea66c7ba bitfield: wire __bf_shf to=
 __builtin_ctzll
date:   3 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20260813 (https://download.01.org/0day-ci/arc=
hive/20260815/202608150344.S6VQCwJF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 09472f591aa0 ("bitfield: wire __bf_shf to __builtin_ctzll")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608150344.S6VQCwJF-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/display/intel_color.c:2392 i9xx_color_check() error: w=
e previously assumed 'crtc_state->hw.gamma_lut' could be null (see line 238=
5)

Old smatch warnings:
drivers/gpu/drm/i915/display/intel_color.c:1544 ivb_load_luts() error: we p=
reviously assumed 'post_csc_lut' could be null (see line 1534)

vim +2392 drivers/gpu/drm/i915/display/intel_color.c

18f1b5ae7ecab0 drivers/gpu/drm/i915/display/intel_color.c Ville Syrj=C3=A4l=
=C3=A4     2022-10-24  2371 =20
5f128aa1052e7d drivers/gpu/drm/i915/display/intel_color.c Ville Syrj=C3=A4l=
=C3=A4     2024-05-23  2372  static int i9xx_color_check(struct intel_atomi=
c_state *state,
5f128aa1052e7d drivers/gpu/drm/i915/display/intel_color.c Ville Syrj=C3=A4l=
=C3=A4     2024-05-23  2373  			    struct intel_crtc *crtc)
e98f35624ca4a4 drivers/gpu/drm/i915/intel_color.c         Ville Syrj=C3=A4l=
=C3=A4     2019-03-27  2374  {
9d476ce24f72fc drivers/gpu/drm/i915/display/intel_color.c Ville Syrj=C3=A4l=
=C3=A4     2024-10-24  2375  	struct intel_display *display =3D to_intel_di=
splay(state);
5f128aa1052e7d drivers/gpu/drm/i915/display/intel_color.c Ville Syrj=C3=A4l=
=C3=A4     2024-05-23  2376  	struct intel_crtc_state *crtc_state =3D
5f128aa1052e7d drivers/gpu/drm/i915/display/intel_color.c Ville Syrj=C3=A4l=
=C3=A4     2024-05-23  2377  		intel_atomic_get_new_crtc_state(state, crtc);
e98f35624ca4a4 drivers/gpu/drm/i915/intel_color.c         Ville Syrj=C3=A4l=
=C3=A4     2019-03-27  2378  	int ret;
e98f35624ca4a4 drivers/gpu/drm/i915/intel_color.c         Ville Syrj=C3=A4l=
=C3=A4     2019-03-27  2379 =20
e98f35624ca4a4 drivers/gpu/drm/i915/intel_color.c         Ville Syrj=C3=A4l=
=C3=A4     2019-03-27  2380  	ret =3D check_luts(crtc_state);
e98f35624ca4a4 drivers/gpu/drm/i915/intel_color.c         Ville Syrj=C3=A4l=
=C3=A4     2019-03-27  2381  	if (ret)
e98f35624ca4a4 drivers/gpu/drm/i915/intel_color.c         Ville Syrj=C3=A4l=
=C3=A4     2019-03-27  2382  		return ret;
e98f35624ca4a4 drivers/gpu/drm/i915/intel_color.c         Ville Syrj=C3=A4l=
=C3=A4     2019-03-27  2383 =20
e98f35624ca4a4 drivers/gpu/drm/i915/intel_color.c         Ville Syrj=C3=A4l=
=C3=A4     2019-03-27  2384  	crtc_state->gamma_enable =3D
1326a92c346641 drivers/gpu/drm/i915/display/intel_color.c Maarten Lankhorst=
 2019-10-31 @2385  		crtc_state->hw.gamma_lut &&
e98f35624ca4a4 drivers/gpu/drm/i915/intel_color.c         Ville Syrj=C3=A4l=
=C3=A4     2019-03-27  2386  		!crtc_state->c8_planes;
e98f35624ca4a4 drivers/gpu/drm/i915/intel_color.c         Ville Syrj=C3=A4l=
=C3=A4     2019-03-27  2387 =20
e262568eb58fe7 drivers/gpu/drm/i915/intel_color.c         Ville Syrj=C3=A4l=
=C3=A4     2019-04-01  2388  	crtc_state->gamma_mode =3D i9xx_gamma_mode(cr=
tc_state);
e98f35624ca4a4 drivers/gpu/drm/i915/intel_color.c         Ville Syrj=C3=A4l=
=C3=A4     2019-03-27  2389 =20
9d476ce24f72fc drivers/gpu/drm/i915/display/intel_color.c Ville Syrj=C3=A4l=
=C3=A4     2024-10-24  2390  	if (DISPLAY_VER(display) < 4 &&
67630bacae2354 drivers/gpu/drm/i915/display/intel_color.c Ville Syrj=C3=A4l=
=C3=A4     2022-11-14  2391  	    crtc_state->gamma_mode =3D=3D GAMMA_MODE_=
MODE_10BIT) {
dd3721a76f0b8a drivers/gpu/drm/i915/display/intel_color.c Ville Syrj=C3=A4l=
=C3=A4     2024-10-24 @2392  		ret =3D i9xx_check_lut_10(crtc, crtc_state->=
hw.gamma_lut);
67630bacae2354 drivers/gpu/drm/i915/display/intel_color.c Ville Syrj=C3=A4l=
=C3=A4     2022-11-14  2393  		if (ret)
67630bacae2354 drivers/gpu/drm/i915/display/intel_color.c Ville Syrj=C3=A4l=
=C3=A4     2022-11-14  2394  			return ret;
67630bacae2354 drivers/gpu/drm/i915/display/intel_color.c Ville Syrj=C3=A4l=
=C3=A4     2022-11-14  2395  	}
67630bacae2354 drivers/gpu/drm/i915/display/intel_color.c Ville Syrj=C3=A4l=
=C3=A4     2022-11-14  2396 =20
5f128aa1052e7d drivers/gpu/drm/i915/display/intel_color.c Ville Syrj=C3=A4l=
=C3=A4     2024-05-23  2397  	ret =3D intel_color_add_affected_planes(state=
, crtc);
e98f35624ca4a4 drivers/gpu/drm/i915/intel_color.c         Ville Syrj=C3=A4l=
=C3=A4     2019-03-27  2398  	if (ret)
e98f35624ca4a4 drivers/gpu/drm/i915/intel_color.c         Ville Syrj=C3=A4l=
=C3=A4     2019-03-27  2399  		return ret;
e98f35624ca4a4 drivers/gpu/drm/i915/intel_color.c         Ville Syrj=C3=A4l=
=C3=A4     2019-03-27  2400 =20
18f1b5ae7ecab0 drivers/gpu/drm/i915/display/intel_color.c Ville Syrj=C3=A4l=
=C3=A4     2022-10-24  2401  	intel_assign_luts(crtc_state);
18f1b5ae7ecab0 drivers/gpu/drm/i915/display/intel_color.c Ville Syrj=C3=A4l=
=C3=A4     2022-10-24  2402 =20
5f128aa1052e7d drivers/gpu/drm/i915/display/intel_color.c Ville Syrj=C3=A4l=
=C3=A4     2024-05-23  2403  	crtc_state->preload_luts =3D intel_can_preloa=
d_luts(state, crtc);
0ccc42a2fd5107 drivers/gpu/drm/i915/display/intel_color.c Ville Syrj=C3=A4l=
=C3=A4     2019-10-30  2404 =20
e98f35624ca4a4 drivers/gpu/drm/i915/intel_color.c         Ville Syrj=C3=A4l=
=C3=A4     2019-03-27  2405  	return 0;
e98f35624ca4a4 drivers/gpu/drm/i915/intel_color.c         Ville Syrj=C3=A4l=
=C3=A4     2019-03-27  2406  }
e98f35624ca4a4 drivers/gpu/drm/i915/intel_color.c         Ville Syrj=C3=A4l=
=C3=A4     2019-03-27  2407 =20

:::::: The code at line 2392 was first introduced by commit
:::::: dd3721a76f0b8a0054acc1befe5298a7bef47f07 drm/i915/color: Pimp debugs

:::::: TO: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
:::::: CC: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
