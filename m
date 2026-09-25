Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A973E63AC
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Sep 2026 17:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790358469; cv=none; b=U2bwcbi2cIoQdjyh4Ip7azCbnprt2e946nxMc3mXCdeET1dMvcGvllpM38eA9LFSgtnKC7gB++YmRjQW7f0TjAnuuI7UdDDg920D+IUxVIvKr8Odcnz+EOCkFDNsb0UyAy3GgUdAkPEfnbNCE3CRgw3zFYTzuRxvUGxPgF8R5tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790358469; c=relaxed/simple;
	bh=7bOYbBLfPcldmnYgyQ4mX5LnzFZDGICYUzIjbi+hHJI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VZ67tsr63io1otzZ373zT9Do322FyRd30BiC+W+DkEEV8TI1nIuemnJ/dwnzbfWyk16M32m3m1NCGR7gt1rEiR2bn4tAc/xDlk4jNl8/3S3t4tzP0oH/91ZYlAC6zaFnlWGE9SOj/pODVsG7vtqXtycLpp2zVbOAeonPS8wjQkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UQ4+4G5y; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UQ4+4G5y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790358467; x=1821894467;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7bOYbBLfPcldmnYgyQ4mX5LnzFZDGICYUzIjbi+hHJI=;
  b=UQ4+4G5yDhZemnufEF9drXceMXVCo5lL2D1NGLTp2BECP4D0lpbqwZ5f
   xkZbkAZ9hMhqR2QyEwTmhETUKpCb1vCWn4KB1PPPEoPf/LjwIzSWlyq3k
   bjmxjF2ah8VSc5QGByeav8059e1q2dhVl7lJrdv5BSs2Tfv2FKG5CGEJE
   FHvo/hV54yPEIrDvxOE6ERPXOJaFefUtOmCxDN5ywaKoJr5xCSCjZLD8J
   eXylNWPcR4b9A9A1HUtPIDA/OOhspEKmf2rvRpH1jtJwPi17sYck2Np1L
   tugbfEWgVG1tgMsSTVAmgO+VywKnsPziyL+dCZQWJ3HYhzv5wPtGrMUPy
   Q==;
X-CSE-ConnectionGUID: ZWVyKQalRQWnbeOmxBWuaQ==
X-CSE-MsgGUID: +kqiFSBxQjCi9wiARuAx6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90014057"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="90014057"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 10:47:47 -0700
X-CSE-ConnectionGUID: bKPDv4/2Qky59YvfuygUYA==
X-CSE-MsgGUID: 0/6aq/4DQLOIbbyPleXk2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="272199316"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Sep 2026 10:47:46 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAA1P-00000000KzI-3w3p;
	Fri, 25 Sep 2026 17:47:43 +0000
Date: Sat, 26 Sep 2026 01:47:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/tiny/ch1115-i2c.c:493:11: error: use of
 undeclared identifier 'drm_atomic_helper_crtc_reset'; did you mean
 'drm_atomic_helper_check_modeset'?
Message-ID: <202609260122.KLDd6aW4-lkp@intel.com>
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
date:   20 hours ago
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: loongarch-randconfig-r1305-20260925 (https://download.01.org/0day-c=
i/archive/20260926/202609260122.KLDd6aW4-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c=
1ec4a3095ab096dd780e84d7ab81f3d7ff)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260926/202609260122.KLDd6aW4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609260122.KLDd6aW4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/tiny/ch1115-i2c.c:493:11: error: use of undeclared ident=
ifier 'drm_atomic_helper_crtc_reset'; did you mean 'drm_atomic_helper_check=
_modeset'?
     493 |         .reset =3D drm_atomic_helper_crtc_reset,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                  drm_atomic_helper_check_modeset
   include/drm/drm_atomic_helper.h:50:5: note: 'drm_atomic_helper_check_mod=
eset' declared here
      50 | int drm_atomic_helper_check_modeset(struct drm_device *dev,
         |     ^
>> drivers/gpu/drm/tiny/ch1115-i2c.c:493:3: error: field designator 'reset'=
 does not refer to any field in type 'const struct drm_crtc_funcs'
     493 |         .reset =3D drm_atomic_helper_crtc_reset,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


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
