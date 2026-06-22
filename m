Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFCC3346A8
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jun 2026 15:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782141377; cv=none; b=F0eT5DyfcM/IReNgFWYVO/YNyMxrTsO/Uf4R6kn3TjordmLZwGEkg/Oc/ZjphxfwtbxihiGlfMzv9sHCOX4UT5u5iRkFiLokuzlx7ypi0C/38nHcCKPryCrPH7fuEOvhWCZFQHFioV84+Ih/LaOFemDt0Vew5Rc5UvYpGgbA86E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782141377; c=relaxed/simple;
	bh=8PeninhglvFjNr+UjDTaZe7737+yeSV6DWZECn36rsw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Wb1NF5CVbkkICUtBzT9vn/WgLuEYC+uxWQ7cqXCW5L5FWl+94InNWC+YlWS+0Xej/af8R/jmXFWv+SLes1mvII/1smKgEcDuJq/jrL8vJo/pLmxcSGKuVX+YP/qNG4u3CACASKVmShMYKON9yiPmdHJ8KuWfl6nbWKL+Z03jhWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A6vg3u/v; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A6vg3u/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782141375; x=1813677375;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8PeninhglvFjNr+UjDTaZe7737+yeSV6DWZECn36rsw=;
  b=A6vg3u/vdR/O3Wte07tQ3+8xiAYDsaeXDQH02O8Ab9W7gFPCRbw5G4Y4
   JVBWqYdEfh1CqQTxoD6mj0mksw9o/9GRylXhfZ/osIC+tEEYWiSPg8zXp
   szvZ1IdXLMo0+aKFG+W/iLUSWthJGAglpy63YSsmfrKVR3AmaUIk95BM/
   nEufyRnheY9H89Sy/xrvutgSXrcP1crm7uS+Wzu+nff3fZU7iouECZ0py
   EmiorzynkYdnOi6iFtOdd6g/bkqItGFIzesM528Jhqxni7ynXU52v+UYw
   w3SyCtqaj+N+71Gcu+HkcIuzcHOK4YWVAci91MekiZsJH/BVGBgTkLbkt
   g==;
X-CSE-ConnectionGUID: WCTZbyhsR8iW4m4AVPVzXQ==
X-CSE-MsgGUID: qgkajflpTlSZHo7hDuHAAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="93468999"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="93468999"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 08:16:13 -0700
X-CSE-ConnectionGUID: k/UFZfvMSfWbvDeXQFUtFg==
X-CSE-MsgGUID: mpa6hq/RS32crG/Mvc+0Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="272953558"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Jun 2026 08:16:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbgNe-000000001Nd-0PzS;
	Mon, 22 Jun 2026 15:16:10 +0000
Date: Mon, 22 Jun 2026 23:15:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpio/gpio-ltc4283.c:46 ltc4283_pgio_get_direction()
 warn: subtract is higher precedence than shift
Message-ID: <202606222317.1aSqZdjK-lkp@intel.com>
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
TO: "Nuno S=C3=A1" <nuno.sa@analog.com>
CC: Guenter Roeck <linux@roeck-us.net>
CC: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ef0c9f75a19532d7675384708fc8621e10850104
commit: 55c01d37949d215281106a3e532dd56fe678493d gpio: gpio-ltc4283: Add su=
pport for the LTC4283 Swap Controller
date:   13 days ago
:::::: branch date: 18 hours ago
:::::: commit date: 13 days ago
config: alpha-randconfig-r072-20260622 (https://download.01.org/0day-ci/arc=
hive/20260622/202606222317.1aSqZdjK-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 55c01d37949d ("gpio: gpio-ltc4283: Add support for the LTC4283 Swa=
p Controller")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606222317.1aSqZdjK-lkp@intel.com/

smatch warnings:
drivers/gpio/gpio-ltc4283.c:46 ltc4283_pgio_get_direction() warn: subtract =
is higher precedence than shift
drivers/gpio/gpio-ltc4283.c:46 ltc4283_pgio_get_direction() warn: subtract =
is higher precedence than shift
drivers/gpio/gpio-ltc4283.c:46 ltc4283_pgio_get_direction() warn: subtract =
is higher precedence than shift
drivers/gpio/gpio-ltc4283.c:46 ltc4283_pgio_get_direction() warn: subtract =
is higher precedence than shift
drivers/gpio/gpio-ltc4283.c:81 ltc4283_gpio_direction_set() warn: subtract =
is higher precedence than shift
drivers/gpio/gpio-ltc4283.c:81 ltc4283_gpio_direction_set() warn: subtract =
is higher precedence than shift
drivers/gpio/gpio-ltc4283.c:81 ltc4283_gpio_direction_set() warn: subtract =
is higher precedence than shift
drivers/gpio/gpio-ltc4283.c:81 ltc4283_gpio_direction_set() warn: subtract =
is higher precedence than shift

vim +46 drivers/gpio/gpio-ltc4283.c

55c01d37949d21 Nuno S=C3=A1 2026-05-02  36 =20
55c01d37949d21 Nuno S=C3=A1 2026-05-02  37  static int ltc4283_pgio_get_dir=
ection(const struct ltc4283_gpio *st, unsigned int off)
55c01d37949d21 Nuno S=C3=A1 2026-05-02  38  {
55c01d37949d21 Nuno S=C3=A1 2026-05-02  39  	unsigned int val;
55c01d37949d21 Nuno S=C3=A1 2026-05-02  40  	int ret;
55c01d37949d21 Nuno S=C3=A1 2026-05-02  41 =20
55c01d37949d21 Nuno S=C3=A1 2026-05-02  42  	ret =3D regmap_read(st->regmap=
, LTC4283_PGIO_CONFIG, &val);
55c01d37949d21 Nuno S=C3=A1 2026-05-02  43  	if (ret)
55c01d37949d21 Nuno S=C3=A1 2026-05-02  44  		return ret;
55c01d37949d21 Nuno S=C3=A1 2026-05-02  45 =20
55c01d37949d21 Nuno S=C3=A1 2026-05-02 @46  	val =3D field_get(LTC4283_PGIO=
_CFG_MASK(off), val);
55c01d37949d21 Nuno S=C3=A1 2026-05-02  47  	if (val =3D=3D LTC4283_PGIO_DI=
R_IN)
55c01d37949d21 Nuno S=C3=A1 2026-05-02  48  		return GPIO_LINE_DIRECTION_IN;
55c01d37949d21 Nuno S=C3=A1 2026-05-02  49 =20
55c01d37949d21 Nuno S=C3=A1 2026-05-02  50  	return GPIO_LINE_DIRECTION_OUT;
55c01d37949d21 Nuno S=C3=A1 2026-05-02  51  }
55c01d37949d21 Nuno S=C3=A1 2026-05-02  52 =20
55c01d37949d21 Nuno S=C3=A1 2026-05-02  53  static int ltc4283_gpio_get_dir=
ection(struct gpio_chip *gc, unsigned int off)
55c01d37949d21 Nuno S=C3=A1 2026-05-02  54  {
55c01d37949d21 Nuno S=C3=A1 2026-05-02  55  	struct ltc4283_gpio *st =3D gp=
iochip_get_data(gc);
55c01d37949d21 Nuno S=C3=A1 2026-05-02  56  	unsigned int val;
55c01d37949d21 Nuno S=C3=A1 2026-05-02  57  	int ret;
55c01d37949d21 Nuno S=C3=A1 2026-05-02  58 =20
55c01d37949d21 Nuno S=C3=A1 2026-05-02  59  	if (off >=3D LTC4283_PGIOX_STA=
RT_NR)
55c01d37949d21 Nuno S=C3=A1 2026-05-02  60  		return ltc4283_pgio_get_direc=
tion(st, off);
55c01d37949d21 Nuno S=C3=A1 2026-05-02  61 =20
55c01d37949d21 Nuno S=C3=A1 2026-05-02  62  	ret =3D regmap_read(st->regmap=
, LTC4283_ADIO_CONFIG, &val);
55c01d37949d21 Nuno S=C3=A1 2026-05-02  63  	if (ret)
55c01d37949d21 Nuno S=C3=A1 2026-05-02  64  		return ret;
55c01d37949d21 Nuno S=C3=A1 2026-05-02  65 =20
55c01d37949d21 Nuno S=C3=A1 2026-05-02  66  	if (val & LTC4283_ADIOX_CONFIG=
_MASK(off))
55c01d37949d21 Nuno S=C3=A1 2026-05-02  67  		return GPIO_LINE_DIRECTION_IN;
55c01d37949d21 Nuno S=C3=A1 2026-05-02  68 =20
55c01d37949d21 Nuno S=C3=A1 2026-05-02  69  	return GPIO_LINE_DIRECTION_OUT;
55c01d37949d21 Nuno S=C3=A1 2026-05-02  70  }
55c01d37949d21 Nuno S=C3=A1 2026-05-02  71 =20
55c01d37949d21 Nuno S=C3=A1 2026-05-02  72  static int ltc4283_gpio_directi=
on_set(const struct ltc4283_gpio *st,
55c01d37949d21 Nuno S=C3=A1 2026-05-02  73  				      unsigned int off, boo=
l input)
55c01d37949d21 Nuno S=C3=A1 2026-05-02  74  {
55c01d37949d21 Nuno S=C3=A1 2026-05-02  75  	if (off >=3D LTC4283_PGIOX_STA=
RT_NR) {
55c01d37949d21 Nuno S=C3=A1 2026-05-02  76  		unsigned int val =3D LTC4283_=
PGIO_DIR_OUT;
55c01d37949d21 Nuno S=C3=A1 2026-05-02  77 =20
55c01d37949d21 Nuno S=C3=A1 2026-05-02  78  		if (input)
55c01d37949d21 Nuno S=C3=A1 2026-05-02  79  			val =3D LTC4283_PGIO_DIR_IN;
55c01d37949d21 Nuno S=C3=A1 2026-05-02  80 =20
55c01d37949d21 Nuno S=C3=A1 2026-05-02 @81  		val =3D field_prep(LTC4283_PG=
IO_CFG_MASK(off), val);
55c01d37949d21 Nuno S=C3=A1 2026-05-02  82  		return regmap_update_bits(st-=
>regmap, LTC4283_PGIO_CONFIG,
55c01d37949d21 Nuno S=C3=A1 2026-05-02  83  					  LTC4283_PGIO_CFG_MASK(of=
f), val);
55c01d37949d21 Nuno S=C3=A1 2026-05-02  84  	}
55c01d37949d21 Nuno S=C3=A1 2026-05-02  85 =20
55c01d37949d21 Nuno S=C3=A1 2026-05-02  86  	return regmap_update_bits(st->=
regmap, LTC4283_ADIO_CONFIG,
55c01d37949d21 Nuno S=C3=A1 2026-05-02  87  				  LTC4283_ADIOX_CONFIG_MASK=
(off),
55c01d37949d21 Nuno S=C3=A1 2026-05-02  88  				  field_prep(LTC4283_ADIOX_=
CONFIG_MASK(off), input));
55c01d37949d21 Nuno S=C3=A1 2026-05-02  89  }
55c01d37949d21 Nuno S=C3=A1 2026-05-02  90 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
