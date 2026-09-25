Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E660B3B71B0
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Sep 2026 21:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790372681; cv=none; b=qRCCgoWX9+Y4NwsgEAVw3FHtd9VlqJSoY1s0ykHGuAiT9TzgPW6+wyObrOPgVjJcFLxRA7cy2yXd1f47md/mje/Vi0LnhMDvLWtAyLcUSmXWfe3EoNotcvM2w6pfzXgEl4YpZW1rms15Va7Xi4g2CRsFj4qbsqNx1apaO0G9N24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790372681; c=relaxed/simple;
	bh=r07CzdfNCjJQ5ILmy4BXeLI9Tag0sD5JbXGZLrbWj+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ffyZNMCV+ccCAc9hXet4vS/k2HfweF83ony/LSr4r/ZDQGUygVM78QuySHH19hcb8uHXS/HkizP0KzQlEucz7i9KHP0eqjsFYYCKklLftdoL10u353VoMbS2zqi0LIcbdlHOXGkCiSgZEwbMPS8Q1say0IqV0HEIiiT3evz5Xa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DunOiBvj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DunOiBvj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790372679; x=1821908679;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=r07CzdfNCjJQ5ILmy4BXeLI9Tag0sD5JbXGZLrbWj+U=;
  b=DunOiBvjo4IgPNVpYTYdCGmwTsY9b92pxGXUVHxNd7k7bedrZzqMy1bq
   yAKyXHZkyZw4+8cV8cGyhMeoQCk7GlmrKxu1QaHGNnm1dOI74bAxypjRd
   kRHYKcoXi3+0k18+4RFlOIKo9IETvPzX5hKZHrtuGikoxQHNf8uEONrO/
   Jeuh56mcyByxOrvOUiDTAN9uPML7CqQt2ZOG7KZvlhB9smkwKToYCN/04
   +vVlK7Pm38HwrqrRvCklOZdHkPK6AU925IV1pvcKbiNDRoH/dCfwm72dm
   AQHeImIzDLBIIq+hw5jTN/qfQoW/mPnr7MahAhLsX8TjknGCsiU+VS2YZ
   Q==;
X-CSE-ConnectionGUID: Gf4gfUaTTSGGQIMAclS3UQ==
X-CSE-MsgGUID: kYOGQAqFTxe7tBzJWg/YOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="101825912"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="101825912"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 14:44:38 -0700
X-CSE-ConnectionGUID: GPAY8lCyTIKY5kBeXdL59Q==
X-CSE-MsgGUID: uffmUfaGRGKpED8W/39K6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="312359572"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Sep 2026 14:44:37 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xADid-00000000LEu-0MbP;
	Fri, 25 Sep 2026 21:44:35 +0000
Date: Sat, 26 Sep 2026 05:44:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/tiny/ch1115-i2c.c:493:10: error: 'const
 struct drm_crtc_funcs' has no member named 'reset'
Message-ID: <202609260545.eEm9FCKo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "bisect to a FBC not belonging to original linu=
x-review patches: branch: linux-review/UPDATE-20260924-184557/Nicol-s-Antin=
ori/dt-bindings-display-add-Chipwealth-CH1115-OLED-Controller/20260923-1935=
13, commit: ec9256c9e620f5fb54a559661a9f714e40157b48"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Nicol=C3=A1s Antinori" <nico.antinori.7@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20260924-1845=
57/Nicol-s-Antinori/dt-bindings-display-add-Chipwealth-CH1115-OLED-Controll=
er/20260923-193513
head:   55ad3472c1a2fa78925e731df3f9af6c1f482948
commit: ec9256c9e620f5fb54a559661a9f714e40157b48 drm/ch1115: add support fo=
r Chipwealth CH1115 OLED controller
date:   24 hours ago
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260926/=
202609260545.eEm9FCKo-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260926/202609260545.eEm9FCKo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609260545.eEm9FCKo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/tiny/ch1115-i2c.c:493:10: error: 'const struct drm_crtc_=
funcs' has no member named 'reset'
     493 |         .reset =3D drm_atomic_helper_crtc_reset,
         |          ^~~~~
>> drivers/gpu/drm/tiny/ch1115-i2c.c:493:18: error: 'drm_atomic_helper_crtc=
_reset' undeclared here (not in a function); did you mean 'drm_atomic_helpe=
r_check_modeset'?
     493 |         .reset =3D drm_atomic_helper_crtc_reset,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                  drm_atomic_helper_check_modeset


vim +493 drivers/gpu/drm/tiny/ch1115-i2c.c

ec9256c9e620f5 Nicol=C3=A1s Antinori 2026-09-23  491 =20
ec9256c9e620f5 Nicol=C3=A1s Antinori 2026-09-23  492  static const struct d=
rm_crtc_funcs ch1115_crtc_funcs =3D {
ec9256c9e620f5 Nicol=C3=A1s Antinori 2026-09-23 @493  	.reset =3D drm_atomi=
c_helper_crtc_reset,
ec9256c9e620f5 Nicol=C3=A1s Antinori 2026-09-23  494  	.destroy =3D drm_crt=
c_cleanup,
ec9256c9e620f5 Nicol=C3=A1s Antinori 2026-09-23  495  	.set_config =3D drm_=
atomic_helper_set_config,
ec9256c9e620f5 Nicol=C3=A1s Antinori 2026-09-23  496  	.page_flip =3D drm_a=
tomic_helper_page_flip,
ec9256c9e620f5 Nicol=C3=A1s Antinori 2026-09-23  497  	.atomic_duplicate_st=
ate =3D drm_atomic_helper_crtc_duplicate_state,
ec9256c9e620f5 Nicol=C3=A1s Antinori 2026-09-23  498  	.atomic_destroy_stat=
e =3D drm_atomic_helper_crtc_destroy_state,
ec9256c9e620f5 Nicol=C3=A1s Antinori 2026-09-23  499  };
ec9256c9e620f5 Nicol=C3=A1s Antinori 2026-09-23  500 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
