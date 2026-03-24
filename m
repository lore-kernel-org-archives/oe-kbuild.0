Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11242459C6
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Mar 2026 05:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774330570; cv=none; b=oleODph33KO4O4gLIBXBwOP6oybiZg5SjtThmMHVRep4lwMe780mizomVCN8+lBfhA0V2+o9O72o+/MTq2+mtXbv96QYejOARLZ/evn4FqM17GKrK/9ZoPYtj0t1KY1D4M3NMl/sjLiIIrlhLFDR8hEQ3U+1otcT6ZwUSLGJTrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774330570; c=relaxed/simple;
	bh=YZ26/GQvNrO3F2cLtxZyTVlASESsI2H+PmIu5NkU1Gw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Bps5AGMdCouyBqZbVpG8mj+PZDNs8R5ZdlHv/tKIL9NqMzv/TOMzMevoTjexujmshYnnGePtdrw4VDkaJbtlFPS37d8JiFTlC79H1GozRLRntJH8EEh4Z990ovJSq3ZsUouSIsR5pTU3KyzHnmfSgmSSbFeqePhoTq+HAunLd3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HXT6urrg; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HXT6urrg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774330569; x=1805866569;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YZ26/GQvNrO3F2cLtxZyTVlASESsI2H+PmIu5NkU1Gw=;
  b=HXT6urrgqV8tbZbOeo8DGRoO9QEmLK/sSu/jfXmtiCig55EOKXf/VR/m
   Tdt7koxvpg7CZ1AwcYJiTDP3zG3f21Hhz8H2Cc9E6otzX6PI2U9DDD69/
   UPjM5yaHJFJskl8GdOEeeo441gC6sOKFEAW84tN2aqPnJKnAYZ9HSHE63
   nfARrOGElxHVAbezRGDUT3eUG/z472mfGlz0TCSx6DTXbw/T3zZF6NPP8
   W43l6VINAzS7RtrbZUzx1UpckHRd3zzMp7cwaayh0auYA9NTyfS60T4e5
   hk4dJvi3QjsT4Rw0QPSO2CfEKtKqHFIEl0EseSjgpcpbrcJ+Ut6wxWWAC
   Q==;
X-CSE-ConnectionGUID: YBsqmFxPSLWBMv1J0aTOQQ==
X-CSE-MsgGUID: vsupYfUdRgCS0Nt+oeFENg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="74359775"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="74359775"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 22:36:08 -0700
X-CSE-ConnectionGUID: gV4I3rqUQoya7SFxC+fJhQ==
X-CSE-MsgGUID: IEQOntDqSp2clh7au0fA+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="228321219"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Mar 2026 22:36:05 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4uQs-000000003vV-47HU;
	Tue, 24 Mar 2026 05:36:02 +0000
Date: Tue, 24 Mar 2026 13:35:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/i915/display/intel_plane.c:687
 intel_plane_atomic_check_with_state() error: we previously assumed 'fb' could
 be null (see line 675)
Message-ID: <202603241312.B3QPyear-lkp@intel.com>
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
CC: Gustavo Sousa <gustavo.sousa@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: a649c2abfae0c68d07f127ff4e570c44636afe7e drm/i915/plane: rename int=
el_atomic_plane.[ch] to intel_plane.[ch]
date:   9 months ago
:::::: branch date: 32 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-r073-20260323 (https://download.01.org/0day-ci/ar=
chive/20260324/202603241312.B3QPyear-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603241312.B3QPyear-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/intel_plane.c:687 intel_plane_atomic_check_wit=
h_state() error: we previously assumed 'fb' could be null (see line 675)

vim +/fb +687 drivers/gpu/drm/i915/display/intel_plane.c

c17897428e1d25 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2022-02-11  655 =20
b2b55502d683c7 drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrj=
=C3=A4l=C3=A4     2017-08-23  656  int intel_plane_atomic_check_with_state(=
const struct intel_crtc_state *old_crtc_state,
790cc9941b137e drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrj=
=C3=A4l=C3=A4     2019-01-11  657  					struct intel_crtc_state *new_crtc_s=
tate,
b2b55502d683c7 drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrj=
=C3=A4l=C3=A4     2017-08-23  658  					const struct intel_plane_state *old=
_plane_state,
790cc9941b137e drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrj=
=C3=A4l=C3=A4     2019-01-11  659  					struct intel_plane_state *new_plane=
_state)
ea2c67bb4affa8 drivers/gpu/drm/i915/intel_atomic_plane.c         Matt Roper=
        2014-12-23  660  {
f90a85e76c2a89 drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten La=
nkhorst 2019-10-31  661  	struct intel_plane *plane =3D to_intel_plane(new_=
plane_state->uapi.plane);
7d8d2cbce5af5e drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2020-01-10  662  	const struct drm_framebuffer *fb =3D ne=
w_plane_state->hw.fb;
da20eabd2c6976 drivers/gpu/drm/i915/intel_atomic_plane.c         Maarten La=
nkhorst 2015-06-15  663  	int ret;
ea2c67bb4affa8 drivers/gpu/drm/i915/intel_atomic_plane.c         Matt Roper=
        2014-12-23  664 =20
cb1824bb1ec6b4 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2020-03-18  665  	intel_plane_set_invisible(new_crtc_stat=
e, new_plane_state);
ee42ec19ca2e55 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2020-11-24  666  	new_crtc_state->enabled_planes &=3D ~BI=
T(plane->id);
62ef0dd3cc0c21 drivers/gpu/drm/i915/intel_atomic_plane.c         Maarten La=
nkhorst 2018-09-20  667 =20
7b3cb17a48dc1b drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten La=
nkhorst 2019-10-31  668  	if (!new_plane_state->hw.crtc && !old_plane_state=
->hw.crtc)
c196e1d66c36b0 drivers/gpu/drm/i915/intel_atomic_plane.c         Matt Roper=
        2015-01-21  669  		return 0;
c196e1d66c36b0 drivers/gpu/drm/i915/intel_atomic_plane.c         Matt Roper=
        2015-01-21  670 =20
790cc9941b137e drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrj=
=C3=A4l=C3=A4     2019-01-11  671  	ret =3D plane->check_plane(new_crtc_sta=
te, new_plane_state);
c389c9c4d981e4 drivers/gpu/drm/i915/intel_atomic_plane.c         Maarten La=
nkhorst 2015-06-15  672  	if (ret)
da20eabd2c6976 drivers/gpu/drm/i915/intel_atomic_plane.c         Maarten La=
nkhorst 2015-06-15  673  		return ret;
da20eabd2c6976 drivers/gpu/drm/i915/intel_atomic_plane.c         Maarten La=
nkhorst 2015-06-15  674 =20
97bc7ffa1b1e9a drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2021-03-05 @675  	if (fb)
97bc7ffa1b1e9a drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2021-03-05  676  		new_crtc_state->enabled_planes |=3D BI=
T(plane->id);
97bc7ffa1b1e9a drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2021-03-05  677 =20
e9728bd888e1fa drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrj=
=C3=A4l=C3=A4     2017-03-02  678  	/* FIXME pre-g4x don't work like this */
f90a85e76c2a89 drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten La=
nkhorst 2019-10-31  679  	if (new_plane_state->uapi.visible)
790cc9941b137e drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrj=
=C3=A4l=C3=A4     2019-01-11  680  		new_crtc_state->active_planes |=3D BIT=
(plane->id);
e9728bd888e1fa drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrj=
=C3=A4l=C3=A4     2017-03-02  681 =20
3358e2ca0ebd64 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2022-02-11  682  	if (new_plane_state->uapi.visible &&
3358e2ca0ebd64 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2022-02-11  683  	    intel_plane_is_scaled(new_plane_sta=
te))
3358e2ca0ebd64 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2022-02-11  684  		new_crtc_state->scaled_planes |=3D BIT=
(plane->id);
3358e2ca0ebd64 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2022-02-11  685 =20
f90a85e76c2a89 drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten La=
nkhorst 2019-10-31  686  	if (new_plane_state->uapi.visible &&
4941f35b48f7f3 drivers/gpu/drm/i915/display/intel_atomic_plane.c Imre Deak =
        2019-12-21 @687  	    intel_format_info_is_yuv_semiplanar(fb->forma=
t, fb->modifier))
790cc9941b137e drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrj=
=C3=A4l=C3=A4     2019-01-11  688  		new_crtc_state->nv12_planes |=3D BIT(p=
lane->id);
8e021151948c56 drivers/gpu/drm/i915/intel_atomic_plane.c         Maarten La=
nkhorst 2018-05-12  689 =20
f90a85e76c2a89 drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten La=
nkhorst 2019-10-31  690  	if (new_plane_state->uapi.visible &&
d1d23d7f4be6a6 drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2019-09-13  691  	    fb->format->format =3D=3D DRM_FORMA=
T_C8)
02c52f1ed20aba drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrj=
=C3=A4l=C3=A4     2019-02-07  692  		new_crtc_state->c8_planes |=3D BIT(pla=
ne->id);
02c52f1ed20aba drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrj=
=C3=A4l=C3=A4     2019-02-07  693 =20
f90a85e76c2a89 drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten La=
nkhorst 2019-10-31  694  	if (new_plane_state->uapi.visible || old_plane_st=
ate->uapi.visible)
790cc9941b137e drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrj=
=C3=A4l=C3=A4     2019-01-11  695  		new_crtc_state->update_planes |=3D BIT=
(plane->id);
afbd8a722bd64e drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrj=
=C3=A4l=C3=A4     2018-11-27  696 =20
943ed3cc02191b drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2022-03-03  697  	if (new_plane_state->uapi.visible &&
943ed3cc02191b drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2022-03-03  698  	    intel_format_info_is_yuv_semiplanar=
(fb->format, fb->modifier)) {
943ed3cc02191b drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2022-03-03  699  		new_crtc_state->data_rate_y[plane->id]=
 =3D
943ed3cc02191b drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2022-03-03  700  			intel_plane_data_rate(new_crtc_state,=
 new_plane_state, 0);
c457d9cf256e94 drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrj=
=C3=A4l=C3=A4     2019-05-24  701  		new_crtc_state->data_rate[plane->id] =
=3D
943ed3cc02191b drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2022-03-03  702  			intel_plane_data_rate(new_crtc_state,=
 new_plane_state, 1);
c034363ca898ea drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2022-03-03  703 =20
c034363ca898ea drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2022-03-03  704  		new_crtc_state->rel_data_rate_y[plane-=
>id] =3D
c034363ca898ea drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2022-03-03  705  			intel_plane_relative_data_rate(new_cr=
tc_state,
c034363ca898ea drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2022-03-03  706  						       new_plane_state, 0);
c034363ca898ea drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2022-03-03  707  		new_crtc_state->rel_data_rate[plane->i=
d] =3D
c034363ca898ea drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2022-03-03  708  			intel_plane_relative_data_rate(new_cr=
tc_state,
c034363ca898ea drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2022-03-03  709  						       new_plane_state, 1);
943ed3cc02191b drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2022-03-03  710  	} else if (new_plane_state->uapi.visibl=
e) {
943ed3cc02191b drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2022-03-03  711  		new_crtc_state->data_rate[plane->id] =
=3D
943ed3cc02191b drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2022-03-03  712  			intel_plane_data_rate(new_crtc_state,=
 new_plane_state, 0);
c034363ca898ea drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2022-03-03  713 =20
c034363ca898ea drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2022-03-03  714  		new_crtc_state->rel_data_rate[plane->i=
d] =3D
c034363ca898ea drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2022-03-03  715  			intel_plane_relative_data_rate(new_cr=
tc_state,
c034363ca898ea drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2022-03-03  716  						       new_plane_state, 0);
943ed3cc02191b drivers/gpu/drm/i915/display/intel_atomic_plane.c Ville Syrj=
=C3=A4l=C3=A4     2022-03-03  717  	}
c457d9cf256e94 drivers/gpu/drm/i915/intel_atomic_plane.c         Ville Syrj=
=C3=A4l=C3=A4     2019-05-24  718 =20
4f25720b2c04a3 drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten La=
nkhorst 2019-06-28  719  	return intel_plane_atomic_calc_changes(old_crtc_s=
tate, new_crtc_state,
4f25720b2c04a3 drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten La=
nkhorst 2019-06-28  720  					       old_plane_state, new_plane_state);
4f25720b2c04a3 drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten La=
nkhorst 2019-06-28  721  }
4f25720b2c04a3 drivers/gpu/drm/i915/display/intel_atomic_plane.c Maarten La=
nkhorst 2019-06-28  722 =20

:::::: The code at line 687 was first introduced by commit
:::::: 4941f35b48f7f329bdf2ccad17d6fdb2190f8d34 drm/i915: Make sure CCS YUV=
 semiplanar format checks work

:::::: TO: Imre Deak <imre.deak@intel.com>
:::::: CC: Imre Deak <imre.deak@intel.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
