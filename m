Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93ED38A728
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 15:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768838155; cv=none; b=h5Cv+boJfbsAGaw454Ofv9Gdk0cns8ahMQYo+RMc1Fv3fExO0DuJ7gvOmjcxcWH6yPgDriQxlX+Js2p7bBG5IPX+zWU/833y/kQzmi3e5WMp60bI4DSsmogwoBNZvbsoqKDHAVuBDkwgi0yuMOtoi6rVVacD90sAiwiZ9WfkM+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768838155; c=relaxed/simple;
	bh=ZiBZAfxxZUrYD5R1LZ0x6pxnVPoeOYLJ3MIoi7sheLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=izR+qGIxaOdCS55RctD9kBUHItt+IiyHrYprob+2F4nULxOVvFv1S+aW78yq6CZAaG0kGjhqzaWkN292EaqJHUbRcUVPKScPTLFBvt4vQTQRqXS0ULEGDR9ZFqW/h2tpGm/eab+cV6SmQhgnZIChJz0kG9fiMUUx+5atUjcsaEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gEgw/unN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gEgw/unN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768838153; x=1800374153;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZiBZAfxxZUrYD5R1LZ0x6pxnVPoeOYLJ3MIoi7sheLQ=;
  b=gEgw/unNxr3eg6ML0HCPKZKxM17oY8P2qmm9LWXAXlvEorjOds6KdK0/
   T9RfLT7BG1HSLF5cmDFuPI4VV25vxDzpQd0Ivq97MIPZk5q0d+lM5zJ3G
   umQAmqdLf7ZpJjxDTqnnH6tH8yJ0Ryw8e9uJpJeETz9VqRZlbZ7HhPs0d
   6VsA1RiyuFqR2rN4U5wHc0hVP1d+pgW1yMCnFmwpIAnU65WsLC7uQ9ZA+
   t9zLxcFjH9LiQl/uRssMZEcxE/qbhRpUafoDK972pomjwjTS3jvoBR9r8
   xoyPdPRpki8bnXiwckVR9Fj0uox4s9Gv6/9qy0pfKlLz6Bk+xs4p6RjzG
   A==;
X-CSE-ConnectionGUID: zST0MfyuRHG9SDOjTRBSRA==
X-CSE-MsgGUID: v6l4Or8UTCa4xmIqhTB5FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="87464872"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="87464872"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 07:55:52 -0800
X-CSE-ConnectionGUID: 0pr7ZbzgSxewR+FDNEaKzw==
X-CSE-MsgGUID: 6dj/aak/RYSTsLY+rDiCgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="206249352"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Jan 2026 07:55:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhrbY-00000000Nyg-3eur;
	Mon, 19 Jan 2026 15:55:48 +0000
Date: Mon, 19 Jan 2026 23:55:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/i915/display/intel_ddi.c:755:8-10: WARNING:
 possible condition with no effect (if == else)
Message-ID: <202601192334.cdYMFjXE-lkp@intel.com>
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
CC: Imre Deak <imre.deak@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
commit: 68148b8ee1f213204528a603729e648f4de3be8c drm/i915/ddi: refactor int=
el_ddi_connector_get_hw_state()
date:   1 year, 2 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 1 year, 2 months ago
config: alpha-randconfig-r064-20260119 (https://download.01.org/0day-ci/arc=
hive/20260119/202601192334.cdYMFjXE-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601192334.cdYMFjXE-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_ddi.c:755:8-10: WARNING: possible con=
dition with no effect (if =3D=3D else)

vim +755 drivers/gpu/drm/i915/display/intel_ddi.c

2320175feb74a1 drivers/gpu/drm/i915/intel_ddi.c         Sean Paul       201=
8-01-08  715 =20
bcbc889bc44a78 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    201=
2-10-26  716  bool intel_ddi_connector_get_hw_state(struct intel_connector =
*intel_connector)
bcbc889bc44a78 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    201=
2-10-26  717  {
bd3b470e040ec5 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     202=
4-11-11  718  	struct intel_display *display =3D to_intel_display(intel_con=
nector);
bd3b470e040ec5 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     202=
4-11-11  719  	struct drm_i915_private *dev_priv =3D to_i915(display->drm);
fa7edcd25cd0ff drivers/gpu/drm/i915/display/intel_ddi.c Ville Syrj=C3=A4l=
=C3=A4   2019-12-04  720  	struct intel_encoder *encoder =3D intel_attached=
_encoder(intel_connector);
bcbc889bc44a78 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    201=
2-10-26  721  	int type =3D intel_connector->base.connector_type;
0fce04c8764bd0 drivers/gpu/drm/i915/intel_ddi.c         Ville Syrj=C3=A4l=
=C3=A4   2017-10-27  722  	enum port port =3D encoder->port;
bcbc889bc44a78 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    201=
2-10-26  723  	enum transcoder cpu_transcoder;
0e6e0be4c95237 drivers/gpu/drm/i915/intel_ddi.c         Chris Wilson    201=
9-01-14  724  	intel_wakeref_t wakeref;
0e6e0be4c95237 drivers/gpu/drm/i915/intel_ddi.c         Chris Wilson    201=
9-01-14  725  	enum pipe pipe =3D 0;
68148b8ee1f213 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     202=
4-11-20  726  	u32 ddi_mode;
e27daab49718e3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak       201=
6-02-12  727  	bool ret;
bcbc889bc44a78 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    201=
2-10-26  728 =20
0e6e0be4c95237 drivers/gpu/drm/i915/intel_ddi.c         Chris Wilson    201=
9-01-14  729  	wakeref =3D intel_display_power_get_if_enabled(dev_priv,
0e6e0be4c95237 drivers/gpu/drm/i915/intel_ddi.c         Chris Wilson    201=
9-01-14  730  						     encoder->power_domain);
0e6e0be4c95237 drivers/gpu/drm/i915/intel_ddi.c         Chris Wilson    201=
9-01-14  731  	if (!wakeref)
882244a3404088 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    201=
4-04-01  732  		return false;
882244a3404088 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    201=
4-04-01  733 =20
1524e93e1eb42e drivers/gpu/drm/i915/intel_ddi.c         Shashank Sharma 201=
7-03-09  734  	if (!encoder->get_hw_state(encoder, &pipe)) {
e27daab49718e3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak       201=
6-02-12  735  		ret =3D false;
e27daab49718e3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak       201=
6-02-12  736  		goto out;
e27daab49718e3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak       201=
6-02-12  737  	}
bcbc889bc44a78 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    201=
2-10-26  738 =20
10cf8e755a9ac7 drivers/gpu/drm/i915/display/intel_ddi.c Ville Syrj=C3=A4l=
=C3=A4   2020-03-18  739  	if (HAS_TRANSCODER(dev_priv, TRANSCODER_EDP) && =
port =3D=3D PORT_A)
bcbc889bc44a78 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    201=
2-10-26  740  		cpu_transcoder =3D TRANSCODER_EDP;
bcbc889bc44a78 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    201=
2-10-26  741  	else
1a240d4de2ccf4 drivers/gpu/drm/i915/intel_ddi.c         Simona Vetter   201=
2-11-29  742  		cpu_transcoder =3D (enum transcoder) pipe;
bcbc889bc44a78 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    201=
2-10-26  743 =20
68148b8ee1f213 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     202=
4-11-20  744  	ddi_mode =3D intel_de_read(dev_priv, TRANS_DDI_FUNC_CTL(dev_=
priv, cpu_transcoder)) &
68148b8ee1f213 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     202=
4-11-20  745  		TRANS_DDI_MODE_SELECT_MASK;
bcbc889bc44a78 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    201=
2-10-26  746 =20
68148b8ee1f213 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     202=
4-11-20  747  	if (ddi_mode =3D=3D TRANS_DDI_MODE_SELECT_HDMI ||
68148b8ee1f213 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     202=
4-11-20  748  	    ddi_mode =3D=3D TRANS_DDI_MODE_SELECT_DVI) {
e27daab49718e3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak       201=
6-02-12  749  		ret =3D type =3D=3D DRM_MODE_CONNECTOR_HDMIA;
68148b8ee1f213 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     202=
4-11-20  750  	} else if (ddi_mode =3D=3D TRANS_DDI_MODE_SELECT_FDI_OR_128B=
132B && !HAS_DP20(display)) {
68148b8ee1f213 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     202=
4-11-20  751  		ret =3D type =3D=3D DRM_MODE_CONNECTOR_VGA;
68148b8ee1f213 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     202=
4-11-20  752  	} else if (ddi_mode =3D=3D TRANS_DDI_MODE_SELECT_DP_SST) {
e27daab49718e3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak       201=
6-02-12  753  		ret =3D type =3D=3D DRM_MODE_CONNECTOR_eDP ||
e27daab49718e3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak       201=
6-02-12  754  			type =3D=3D DRM_MODE_CONNECTOR_DisplayPort;
68148b8ee1f213 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     202=
4-11-20 @755  	} else if (ddi_mode =3D=3D TRANS_DDI_MODE_SELECT_DP_MST ||
68148b8ee1f213 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     202=
4-11-20  756  		   (ddi_mode =3D=3D TRANS_DDI_MODE_SELECT_FDI_OR_128B132B &=
& HAS_DP20(display))) {
68148b8ee1f213 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     202=
4-11-20  757  		/*
68148b8ee1f213 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     202=
4-11-20  758  		 * If the transcoder is in MST state then connector isn't
68148b8ee1f213 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     202=
4-11-20  759  		 * connected.
68148b8ee1f213 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     202=
4-11-20  760  		 */
652135940ee20e drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     202=
1-09-09  761  		ret =3D false;
68148b8ee1f213 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     202=
4-11-20  762  	} else {
e27daab49718e3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak       201=
6-02-12  763  		ret =3D false;
bcbc889bc44a78 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    201=
2-10-26  764  	}
e27daab49718e3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak       201=
6-02-12  765 =20
e27daab49718e3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak       201=
6-02-12  766  out:
0e6e0be4c95237 drivers/gpu/drm/i915/intel_ddi.c         Chris Wilson    201=
9-01-14  767  	intel_display_power_put(dev_priv, encoder->power_domain, wak=
eref);
e27daab49718e3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak       201=
6-02-12  768 =20
e27daab49718e3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak       201=
6-02-12  769  	return ret;
bcbc889bc44a78 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    201=
2-10-26  770  }
bcbc889bc44a78 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    201=
2-10-26  771 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
