Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9064B341068
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Aug 2026 02:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786589802; cv=none; b=hezTNtKBSwNqacxSvN+pIdtp9ZmXqbVXGHVp++n/9AaCIaEVhLkIzLSaBoSN9Z8GjPHxiNCdr4owtpaRfJ2fHX5QhSZk6s1bkF3F5DyTdEDPbeHqKUsfcaYFNt42WjBVi0rFr95lHKPDyMlXMJlGxtxnEOmTBebAfratWHyg9nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786589802; c=relaxed/simple;
	bh=Nq+GicSuu+iewiotntJLdmAAS0sffuOeZbmxHZbSRWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mMZuC4iFdLa9VR4Gwa6fyXQ8dFsDyKE+EYCAIwgDj6n0NsFTDfotwnjoDs1Z+yjANhb+qoApSFHDUiK3rBK8e37bpgIaety5d8HxXKtoMZeGrVlP3F78dgJVCos+aB7My50JGG2fTgWLrsPbWR+grgq/WIUPeeGaGDLaQwY3jzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZamWhlAd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZamWhlAd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786589800; x=1818125800;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Nq+GicSuu+iewiotntJLdmAAS0sffuOeZbmxHZbSRWo=;
  b=ZamWhlAdV4XY0CvhqbXSwSrwmDp4W2J5AO3cIx/1MzdBDiT2sAZJVFGA
   5lKa6wZv1mXvUIMDxZU30EZ1W5q4XQveRTeRF2Qdlf/Bgr1ESbh9juGtk
   2AqsTJ6eNW4mkRQZwnDXt59h4pR3J07KSXybUHfzjiOAzKU+wRdlFZoa/
   b5Nmdq0CmSHGGHV5S5fH1h2iV9n0KMrK0WLm4qp+sAfKC0MWmIO3YJiLR
   U0/egHmsYn2waER23m9D8j8Apv88MDL1j1yYkqIomyEeX26tVc64acLlm
   wurrmcwzaJSam2ZBchPvZLkKR7aT6n7O4Dixs3KvCPtD8Sa9pcQpcLlK/
   Q==;
X-CSE-ConnectionGUID: 4fD0lQuvToKsHdqhjyvFlw==
X-CSE-MsgGUID: V+d3DhgdSrqn2AgoooXNLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97822101"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="97822101"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 19:56:39 -0700
X-CSE-ConnectionGUID: Ju44yubbTB+wbRE7wYxd1w==
X-CSE-MsgGUID: /Ip8EN0kT7ic0AJqnVDSYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="288603194"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Aug 2026 19:56:34 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuLcO-00000000ScC-1XUA;
	Thu, 13 Aug 2026 02:56:32 +0000
Date: Thu, 13 Aug 2026 10:55:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/i915/display/intel_color.c:2392
 i9xx_color_check() error: we previously assumed 'crtc_state->hw.gamma_lut'
 could be null (see line 2385)
Message-ID: <202608131036.WHh1csLP-lkp@intel.com>
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
head:   f5bbbfec59b4e2fb7520a91de3df8a6174325d6a
commit: 09472f591aa0b72c2dd6c693f48b2d6fea66c7ba bitfield: wire __bf_shf to=
 __builtin_ctzll
date:   3 months ago
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20260813 (https://download.01.org/0day-ci/arc=
hive/20260813/202608131036.WHh1csLP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 09472f591aa0 ("bitfield: wire __bf_shf to __builtin_ctzll")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608131036.WHh1csLP-lkp@intel.com/

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
