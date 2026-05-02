Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B9A2BE043
	for <oe-kbuild@lists.linux.dev>; Sat,  2 May 2026 03:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777693222; cv=none; b=W0xpGe6UhgwsOpIo8cG/UKxaddoCeVCXxmy/LYlCM57HTMGhSDi0IvRbiX7k6MKKsKZ5zNzwLPmKfROe5NrsjyHlOxc4ctZqr9yN0ekolMhLeQpWX4xU9Bi9ddOykEmlSp9mNSFjFmwCkCw+BK3ecZJE4cEHp+ZJbMuKFd61VJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777693222; c=relaxed/simple;
	bh=XyB31AyEproQ4NRNcU4IUmxZwDJJUv1leVa4UkTmMM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dExJBPeTzTWN55L9KB1G/M6lr1pLEPcNg/sqMX1scT12d263Dp8lAA5sWjFDkh5K7E55KC+BSVcMeA1+a7JXrva5aOVNX9lXZvqpZxyh2aNq5AONilcEa1frMAgaLsPUqYuOO2na1vggZRoGk/JD1SnGjRD56scV+r0bduA1qAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S3IklIR9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S3IklIR9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777693221; x=1809229221;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XyB31AyEproQ4NRNcU4IUmxZwDJJUv1leVa4UkTmMM8=;
  b=S3IklIR9ws0UZqMfTSoVvH27pr6IUlnB2W7AiSFlPex1iJmNuLL/YCLC
   tDUKif1k/ehwSRnaEYD5pihNIHoHeb6kF2D32EODGgRQCGhUQ57/Tg/Kh
   67FDLQIqwuIymlioaWKAF6OssTA20TqafnHYgZqqI+G6YrlLdqXZRuqr+
   IkFWlOeeyUxP1xwACjKc/NFtDwRTFClpXbR9uPOWXnUMiyRwLYk922aRK
   dD5i3HuG75QUpOVbApCuKBXyGqSZZMHI/2xD9PALkJyfdZHWLjIwHZlTV
   gkPwH8k2LuplrmN1DbFr+6jaU37Q1q5GKg83BsmFLMP6eqE1OrdWPKRQm
   A==;
X-CSE-ConnectionGUID: hOs3b6/RSzeEdM3kZ9GI5w==
X-CSE-MsgGUID: RiovCyFgQmWrNds7Vq4OEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="101316057"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="101316057"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 20:40:20 -0700
X-CSE-ConnectionGUID: PzmAbwixRX622vChBmT/5A==
X-CSE-MsgGUID: Nyx1a2NnTau2wxyvGXdx7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="230664814"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 May 2026 20:40:19 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJ1DE-0000000017m-21hi;
	Sat, 02 May 2026 03:40:16 +0000
Date: Sat, 02 May 2026 11:39:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/i2c/other/ak4xxx-adda.c:75 ak4529_reset() error:
 buffer overflow 'ak->images' 64 <= 255
Message-ID: <202605021128.egaOqbxA-lkp@intel.com>
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
head:   f1a5e78a55ebf2b05777fd5eb738038ddae609d6
commit: 66f6f543283e91b8899b0dd109d8f15a529e8464 ALSA: i2c: ak4xxx-adda: im=
plement AK4529 reset handling
date:   3 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/2026=
0502/202605021128.egaOqbxA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 66f6f543283e ("ALSA: i2c: ak4xxx-adda: implement AK4529 reset hand=
ling")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605021128.egaOqbxA-lkp@intel.com/

New smatch warnings:
sound/i2c/other/ak4xxx-adda.c:75 ak4529_reset() error: buffer overflow 'ak-=
>images' 64 <=3D 255

Old smatch warnings:
sound/i2c/other/ak4xxx-adda.c:93 ak435X_reset() error: buffer overflow 'ak-=
>images' 64 <=3D 255

vim +75 sound/i2c/other/ak4xxx-adda.c

cb9d24e43490136 Takashi Iwai   2006-06-27  55 =20
66f6f543283e91b C=C3=A1ssio Gabriel 2026-04-07  56  /* reset procedure for =
AK4529 */
66f6f543283e91b C=C3=A1ssio Gabriel 2026-04-07  57  static void ak4529_rese=
t(struct snd_akm4xxx *ak, int state)
66f6f543283e91b C=C3=A1ssio Gabriel 2026-04-07  58  {
66f6f543283e91b C=C3=A1ssio Gabriel 2026-04-07  59  	static const unsigned =
char regs[] =3D {
66f6f543283e91b C=C3=A1ssio Gabriel 2026-04-07  60  		0x0a, 0x00, 0x01, 0x0=
2, 0x03, 0x04, 0x05,
66f6f543283e91b C=C3=A1ssio Gabriel 2026-04-07  61  		0x06, 0x07, 0x0b, 0x0=
c, 0x08,
66f6f543283e91b C=C3=A1ssio Gabriel 2026-04-07  62  	};
66f6f543283e91b C=C3=A1ssio Gabriel 2026-04-07  63  	unsigned int i;
66f6f543283e91b C=C3=A1ssio Gabriel 2026-04-07  64  	unsigned char reg;
66f6f543283e91b C=C3=A1ssio Gabriel 2026-04-07  65 =20
66f6f543283e91b C=C3=A1ssio Gabriel 2026-04-07  66  	if (state) {
66f6f543283e91b C=C3=A1ssio Gabriel 2026-04-07  67  		snd_akm4xxx_write(ak,=
 0, 0x09,
66f6f543283e91b C=C3=A1ssio Gabriel 2026-04-07  68  				  snd_akm4xxx_get(a=
k, 0, 0x09) & ~0x01);
66f6f543283e91b C=C3=A1ssio Gabriel 2026-04-07  69  		return;
66f6f543283e91b C=C3=A1ssio Gabriel 2026-04-07  70  	}
66f6f543283e91b C=C3=A1ssio Gabriel 2026-04-07  71 =20
66f6f543283e91b C=C3=A1ssio Gabriel 2026-04-07  72  	for (i =3D 0; i < ARRA=
Y_SIZE(regs); i++) {
66f6f543283e91b C=C3=A1ssio Gabriel 2026-04-07  73  		reg =3D regs[i];
66f6f543283e91b C=C3=A1ssio Gabriel 2026-04-07  74  		snd_akm4xxx_write(ak,=
 0, reg,
66f6f543283e91b C=C3=A1ssio Gabriel 2026-04-07 @75  				  snd_akm4xxx_get(a=
k, 0, reg));
66f6f543283e91b C=C3=A1ssio Gabriel 2026-04-07  76  	}
66f6f543283e91b C=C3=A1ssio Gabriel 2026-04-07  77  	snd_akm4xxx_write(ak, =
0, 0x09,
66f6f543283e91b C=C3=A1ssio Gabriel 2026-04-07  78  			  snd_akm4xxx_get(ak=
, 0, 0x09) | 0x01);
66f6f543283e91b C=C3=A1ssio Gabriel 2026-04-07  79  }
66f6f543283e91b C=C3=A1ssio Gabriel 2026-04-07  80 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
