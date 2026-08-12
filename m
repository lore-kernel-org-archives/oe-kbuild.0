Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1860739D6FF
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Aug 2026 21:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786569769; cv=none; b=LmdwDM586J/HTEgViTjeGhP16jX8KWzOEBVn4HcuKR2Zv7ihBCvCicgmb1aqUIKdkvOyJoYa9rQo30EaJjXTVKZjpBJ4rggyPqEL5AIh6UOideDFlla2D8LPaPyV/LjwSUh6ThebGiNeD8vtTLoYzkEx8/dSaN6DzIDRKsR2zGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786569769; c=relaxed/simple;
	bh=/ExVWL82btNUZn1fg+fMZ74Bzp8D/DiKIJtwytqZOCA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tsWIPN/nNGngubnZl6dnLuaL7QaHWKk4uJuoIcactFNeMkI7TNpcy9L++Mbtik7LCNiA4Wbnsf2KC2fAXHjQJewsj2O2TV6iKyNPRks4EBKR0XKf3M+QqefNd6C1xMmt8LTlj6G2BgG9ONcjz6OaUq5OjJYFSwesW8TQVO4JFCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aEAr5Pk0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aEAr5Pk0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786569768; x=1818105768;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/ExVWL82btNUZn1fg+fMZ74Bzp8D/DiKIJtwytqZOCA=;
  b=aEAr5Pk0SNl90z7+5iqH+cKiH+zDp0S8YZdl/hunsenMlLXx3DK3526v
   GKPTC9FV0jrD67tHqEFtvudXNpU3LWdg5MRQgpFdibUKkfMa1qMbD0QBf
   /m/mKaO8/xLQ1hzidu08BVyciL4DDNSbxpfRGQbiXHaELMxxFT4Cy7Lz/
   /diNF2gjVR/bE1yMRPTUxFvCG4bp5gP4zdnKvLFARTEAEvrkJl+iyeXjE
   6xUYNMh5fghAC+oHEJqJ5rqhtOXzULZRQZkA58xqtfhArptdIdaszr2Hv
   cMxYG5KcEqss+gpo1oMw6TH/E7WRobTpQI6or/KcEv/uBqy92H7Exus1B
   Q==;
X-CSE-ConnectionGUID: mP/oXAYIQwii7Jf5LcgrLQ==
X-CSE-MsgGUID: nI8AhvVQQH+IeSerWl3xjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97485360"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="97485360"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 14:22:47 -0700
X-CSE-ConnectionGUID: u/aAV9qRSEOXUn/j1qLktQ==
X-CSE-MsgGUID: BBkHy92qTDmdwYHf4jO5Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="257545813"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Aug 2026 14:22:46 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuGPL-00000000Rkr-47Xy;
	Wed, 12 Aug 2026 21:22:43 +0000
Date: Thu, 13 Aug 2026 05:21:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/i2c/other/ak4xxx-adda.c:75 ak4529_reset() error:
 buffer overflow 'ak->images' 64 <= 255
Message-ID: <202608130552.Tyon6afY-lkp@intel.com>
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
TO: "C=C3=A1ssio Gabriel" <cassiogabrielcontato@gmail.com>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f5bbbfec59b4e2fb7520a91de3df8a6174325d6a
commit: 66f6f543283e91b8899b0dd109d8f15a529e8464 ALSA: i2c: ak4xxx-adda: im=
plement AK4529 reset handling
date:   4 months ago
:::::: branch date: 31 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/2026=
0813/202608130552.Tyon6afY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 66f6f543283e ("ALSA: i2c: ak4xxx-adda: implement AK4529 reset hand=
ling")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608130552.Tyon6afY-lkp@intel.com/

New smatch warnings:
sound/i2c/other/ak4xxx-adda.c:75 ak4529_reset() error: buffer overflow 'ak-=
>images' 64 <=3D 255

Old smatch warnings:
sound/i2c/other/ak4xxx-adda.c:93 ak435X_reset() error: buffer overflow 'ak-=
>images' 64 <=3D 255

vim +75 sound/i2c/other/ak4xxx-adda.c

cb9d24e4349013 Takashi Iwai   2006-06-27  55 =20
66f6f543283e91 C=C3=A1ssio Gabriel 2026-04-07  56  /* reset procedure for A=
K4529 */
66f6f543283e91 C=C3=A1ssio Gabriel 2026-04-07  57  static void ak4529_reset=
(struct snd_akm4xxx *ak, int state)
66f6f543283e91 C=C3=A1ssio Gabriel 2026-04-07  58  {
66f6f543283e91 C=C3=A1ssio Gabriel 2026-04-07  59  	static const unsigned c=
har regs[] =3D {
66f6f543283e91 C=C3=A1ssio Gabriel 2026-04-07  60  		0x0a, 0x00, 0x01, 0x02=
, 0x03, 0x04, 0x05,
66f6f543283e91 C=C3=A1ssio Gabriel 2026-04-07  61  		0x06, 0x07, 0x0b, 0x0c=
, 0x08,
66f6f543283e91 C=C3=A1ssio Gabriel 2026-04-07  62  	};
66f6f543283e91 C=C3=A1ssio Gabriel 2026-04-07  63  	unsigned int i;
66f6f543283e91 C=C3=A1ssio Gabriel 2026-04-07  64  	unsigned char reg;
66f6f543283e91 C=C3=A1ssio Gabriel 2026-04-07  65 =20
66f6f543283e91 C=C3=A1ssio Gabriel 2026-04-07  66  	if (state) {
66f6f543283e91 C=C3=A1ssio Gabriel 2026-04-07  67  		snd_akm4xxx_write(ak, =
0, 0x09,
66f6f543283e91 C=C3=A1ssio Gabriel 2026-04-07  68  				  snd_akm4xxx_get(ak=
, 0, 0x09) & ~0x01);
66f6f543283e91 C=C3=A1ssio Gabriel 2026-04-07  69  		return;
66f6f543283e91 C=C3=A1ssio Gabriel 2026-04-07  70  	}
66f6f543283e91 C=C3=A1ssio Gabriel 2026-04-07  71 =20
66f6f543283e91 C=C3=A1ssio Gabriel 2026-04-07  72  	for (i =3D 0; i < ARRAY=
_SIZE(regs); i++) {
66f6f543283e91 C=C3=A1ssio Gabriel 2026-04-07  73  		reg =3D regs[i];
66f6f543283e91 C=C3=A1ssio Gabriel 2026-04-07  74  		snd_akm4xxx_write(ak, =
0, reg,
66f6f543283e91 C=C3=A1ssio Gabriel 2026-04-07 @75  				  snd_akm4xxx_get(ak=
, 0, reg));
66f6f543283e91 C=C3=A1ssio Gabriel 2026-04-07  76  	}
66f6f543283e91 C=C3=A1ssio Gabriel 2026-04-07  77  	snd_akm4xxx_write(ak, 0=
, 0x09,
66f6f543283e91 C=C3=A1ssio Gabriel 2026-04-07  78  			  snd_akm4xxx_get(ak,=
 0, 0x09) | 0x01);
66f6f543283e91 C=C3=A1ssio Gabriel 2026-04-07  79  }
66f6f543283e91 C=C3=A1ssio Gabriel 2026-04-07  80 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
