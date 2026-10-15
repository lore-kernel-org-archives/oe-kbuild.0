Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF54248893
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Oct 2026 00:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792023704; cv=none; b=DoM+GGFTKNLujyKcWkuD8G0qq3eL2FRUhWPvW/y5adRKg1WQYNhd32NyRPz58J0aQLkY1g8IhPgfcDOag/AR0bK48KywFTEA8qBP8uX8tHV55bb4e8wRlxCtqVzTSwg4Eh4JQUXsTpQf9uprvfZu1Ri91t/V4tprrlyPa0oBJnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792023704; c=relaxed/simple;
	bh=xSOt3hVtBLFS5O11K9YTMKw+wOfoShmUL4YhWCgMNpY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=r6XXeF9UkcVhdK4vWfdPMqjjp7MXP0L/GWpao3M9ZE8RVHtqhos0G8FB9KolUVaGmtV7EEag+dVk42Cf298R3bvLejh7cLFSc6xOFiLCXrf/DARQpbrAOiVlB3Bi9sdjGCV6NafGraXyRPIogEcRFyyDUMWAiOpS0LZ482VNMos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oCmKd0tI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oCmKd0tI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792023702; x=1823559702;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xSOt3hVtBLFS5O11K9YTMKw+wOfoShmUL4YhWCgMNpY=;
  b=oCmKd0tIZgx5Y0RngS73xfcBU2wxDHAzLiWH/adnEbIYYmatynxsCmvn
   dSHeV4zvhx/jd9ZMJab6B/Zg/FOfLw4QDGyOEgotL+PQd45eqB7sY4mMM
   Ulqa2VDhlRJVGpx87RQZP5NeMQxmDeQiXCu9znxaN/6oeaOaqwd7HmXBo
   WHZn5g0yYNxFmyAEjB+4HFuFFcEFmU18aM6iZOnSq/tUquggxDUPp5PQR
   f0kdLKjDVe7W7LiknmgnvJsDTgG7fN9EE1GCU3gyC7sBmYnLyoKR6Jdca
   VDAcBtlx/M4o5+wBiKMyr7tPVJ9T/YZ60d8faaTUQEjURD/MXbbvXK9ix
   A==;
X-CSE-ConnectionGUID: 3EwLNswUTqKxuHJEr4LFoQ==
X-CSE-MsgGUID: 6K2TLpDWR6i6Q63J3sxCiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="889452"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="889452"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 17:21:40 -0700
X-CSE-ConnectionGUID: H2pHOZQ2RU6xBqjRMhJ73w==
X-CSE-MsgGUID: 0Mr4qwVhSnGlhroByrwblA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1569852"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 14 Oct 2026 17:21:39 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH9E0-00000000BSH-26W9;
	Thu, 15 Oct 2026 00:21:36 +0000
Date: Thu, 15 Oct 2026 02:21:04 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iio/imu/adis16550.c:911 adis16550_config_sync()
 warn: '(__x + (__d / 2)) / __d' 123456789 can't fit into 65535 'sync_scale'
Message-ID: <202610150235.YXBuIUms-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Uwe Kleine-K=C3=B6nig (The Capable Hub)" <u.kleine-koenig@baylibre.com>
CC: Jonathan Cameron <jic23@kernel.org>
CC: "Nuno S=C3=A1" <nuno.sa@analog.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0fcb05b72344f40806cbe810de8872f1698bf053
commit: d9df71de85c2687d4250f8662296902bed430458 iio: imu: adis16550: Simpl=
ify device abstraction
date:   4 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
config: m68k-randconfig-r2201-20261014 (https://download.01.org/0day-ci/arc=
hive/20261015/202610150235.YXBuIUms-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: d9df71de85c2 ("iio: imu: adis16550: Simplify device abstraction")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610150235.YXBuIUms-lkp@intel.com/

smatch warnings:
drivers/iio/imu/adis16550.c:911 adis16550_config_sync() warn: '(__x + (__d =
/ 2)) / __d' 123456789 can't fit into 65535 'sync_scale'

vim +911 drivers/iio/imu/adis16550.c

bac4368fab62c7 Robert Budai                       2025-02-17  873 =20
bac4368fab62c7 Robert Budai                       2025-02-17  874  static i=
nt adis16550_config_sync(struct adis16550 *st)
bac4368fab62c7 Robert Budai                       2025-02-17  875  {
bac4368fab62c7 Robert Budai                       2025-02-17  876  	struct =
device *dev =3D &st->adis.spi->dev;
bac4368fab62c7 Robert Budai                       2025-02-17  877  	const s=
truct adis16550_sync *sync_mode_data;
bac4368fab62c7 Robert Budai                       2025-02-17  878  	struct =
clk *clk;
bac4368fab62c7 Robert Budai                       2025-02-17  879  	int ret=
, i;
bac4368fab62c7 Robert Budai                       2025-02-17  880  	u16 mod=
e;
bac4368fab62c7 Robert Budai                       2025-02-17  881 =20
bac4368fab62c7 Robert Budai                       2025-02-17  882  	clk =3D =
devm_clk_get_optional_enabled(dev, NULL);
bac4368fab62c7 Robert Budai                       2025-02-17  883  	if (IS_=
ERR(clk))
bac4368fab62c7 Robert Budai                       2025-02-17  884  		return=
 PTR_ERR(clk);
bac4368fab62c7 Robert Budai                       2025-02-17  885  	if (!cl=
k) {
d9df71de85c268 Uwe Kleine-K=C3=B6nig (The Capable Hub  2026-06-30  886) 		s=
t->clk_freq_hz =3D 4000000;
bac4368fab62c7 Robert Budai                       2025-02-17  887  		return=
 0;
bac4368fab62c7 Robert Budai                       2025-02-17  888  	}
bac4368fab62c7 Robert Budai                       2025-02-17  889 =20
bac4368fab62c7 Robert Budai                       2025-02-17  890  	st->clk=
_freq_hz =3D clk_get_rate(clk);
bac4368fab62c7 Robert Budai                       2025-02-17  891 =20
d9df71de85c268 Uwe Kleine-K=C3=B6nig (The Capable Hub  2026-06-30  892) 	fo=
r (i =3D 0; i < ARRAY_SIZE(adis16550_sync_modes); i++) {
d9df71de85c268 Uwe Kleine-K=C3=B6nig (The Capable Hub  2026-06-30  893) 		i=
f (st->clk_freq_hz >=3D adis16550_sync_modes[i].min_rate &&
d9df71de85c268 Uwe Kleine-K=C3=B6nig (The Capable Hub  2026-06-30  894) 		 =
   st->clk_freq_hz <=3D adis16550_sync_modes[i].max_rate) {
d9df71de85c268 Uwe Kleine-K=C3=B6nig (The Capable Hub  2026-06-30  895) 			=
sync_mode_data =3D &adis16550_sync_modes[i];
bac4368fab62c7 Robert Budai                       2025-02-17  896  			break;
bac4368fab62c7 Robert Budai                       2025-02-17  897  		}
bac4368fab62c7 Robert Budai                       2025-02-17  898  	}
bac4368fab62c7 Robert Budai                       2025-02-17  899 =20
d9df71de85c268 Uwe Kleine-K=C3=B6nig (The Capable Hub  2026-06-30  900) 	if=
 (i =3D=3D ARRAY_SIZE(adis16550_sync_modes))
bac4368fab62c7 Robert Budai                       2025-02-17  901  		return=
 dev_err_probe(dev, -EINVAL, "Clk rate: %lu not in a valid range",
bac4368fab62c7 Robert Budai                       2025-02-17  902  				    =
 st->clk_freq_hz);
bac4368fab62c7 Robert Budai                       2025-02-17  903 =20
bac4368fab62c7 Robert Budai                       2025-02-17  904  	if (syn=
c_mode_data->sync_mode =3D=3D ADIS16550_SYNC_MODE_SCALED) {
bac4368fab62c7 Robert Budai                       2025-02-17  905  		u16 sy=
nc_scale;
bac4368fab62c7 Robert Budai                       2025-02-17  906  		/*
bac4368fab62c7 Robert Budai                       2025-02-17  907  		 * In =
sps scaled sync we must scale the input clock to a range
bac4368fab62c7 Robert Budai                       2025-02-17  908  		 * of =
[3000 4500].
bac4368fab62c7 Robert Budai                       2025-02-17  909  		 */
bac4368fab62c7 Robert Budai                       2025-02-17  910 =20
d9df71de85c268 Uwe Kleine-K=C3=B6nig (The Capable Hub  2026-06-30 @911) 		s=
ync_scale =3D DIV_ROUND_CLOSEST(4000, st->clk_freq_hz);
bac4368fab62c7 Robert Budai                       2025-02-17  912 =20
bac4368fab62c7 Robert Budai                       2025-02-17  913  		if (30=
00 > sync_scale || 4500 < sync_scale)
bac4368fab62c7 Robert Budai                       2025-02-17  914  			retur=
n dev_err_probe(dev, -EINVAL,
bac4368fab62c7 Robert Budai                       2025-02-17  915  					   =
  "Invalid value:%u for sync_scale",
bac4368fab62c7 Robert Budai                       2025-02-17  916  					   =
  sync_scale);
bac4368fab62c7 Robert Budai                       2025-02-17  917 =20
bac4368fab62c7 Robert Budai                       2025-02-17  918  		ret =
=3D adis_write_reg_16(&st->adis, ADIS16550_REG_SYNC_SCALE,
bac4368fab62c7 Robert Budai                       2025-02-17  919  					syn=
c_scale);
bac4368fab62c7 Robert Budai                       2025-02-17  920  		if (re=
t)
bac4368fab62c7 Robert Budai                       2025-02-17  921  			retur=
n ret;
bac4368fab62c7 Robert Budai                       2025-02-17  922 =20
d9df71de85c268 Uwe Kleine-K=C3=B6nig (The Capable Hub  2026-06-30  923) 		s=
t->clk_freq_hz =3D 4000;
bac4368fab62c7 Robert Budai                       2025-02-17  924  	}
bac4368fab62c7 Robert Budai                       2025-02-17  925 =20
bac4368fab62c7 Robert Budai                       2025-02-17  926  	st->clk=
_freq_hz *=3D 1000;
bac4368fab62c7 Robert Budai                       2025-02-17  927 =20
bac4368fab62c7 Robert Budai                       2025-02-17  928  	mode =
=3D FIELD_PREP(ADIS16550_SYNC_MODE_MASK, sync_mode_data->sync_mode) |
bac4368fab62c7 Robert Budai                       2025-02-17  929  	       =
FIELD_PREP(ADIS16550_SYNC_EN_MASK, true);
bac4368fab62c7 Robert Budai                       2025-02-17  930 =20
bac4368fab62c7 Robert Budai                       2025-02-17  931  	return =
__adis_update_bits(&st->adis, ADIS16550_REG_CONFIG,
bac4368fab62c7 Robert Budai                       2025-02-17  932  				  AD=
IS16550_SYNC_MASK, mode);
bac4368fab62c7 Robert Budai                       2025-02-17  933  }
bac4368fab62c7 Robert Budai                       2025-02-17  934 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
