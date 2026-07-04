Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499E43AA504
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Jul 2026 12:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783168072; cv=none; b=leAEKpoFx9XvOfKdEYJ+AbATBZlqFK1Tjcu1F9srjaUwolS6FKvKiZFMtfqgJE52SgsTcaba6hfaSK8wPBoUkGQbPvCKfMqgbShszpmueLQC5vew+l+quLXknnqrn/4YFumJnvkRqcv6eD1yfbW06B9fGWzNS3YeiHYzH/JXStw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783168072; c=relaxed/simple;
	bh=dkGP0SjrA6pET3t7hNITZMLMULwiYHsLl9ZTGh3djP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gyw6P9u1k9Mt//vHec3KFQZBpuoiDeWYWd3kWSmvUGOQbE2ib1Y7/CgQ8LU0f8+DFS8/+IJ21+1BgYJEyWf8x4ozQ4exvbh7cFzQBFM3zsiWI/sGy+aEuwqxgjni//0LqHlsYcRejqDBp7/ZESWXcdaZMtyY61yi5HRFfXUD+PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GsikcpuX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GsikcpuX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783168068; x=1814704068;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dkGP0SjrA6pET3t7hNITZMLMULwiYHsLl9ZTGh3djP8=;
  b=GsikcpuXbL1imiuSawEzPf+HIeJJMcNhqKLMtfbiAKVgbicfMxtMRoH9
   c+t5ag8SFWQSFGY2wvoxfYj6MQuPyu9OSYfiK/xz05y8/P7CY8K+lMogl
   xEGs7Om7V21a31L3PCnq5QzrMz0CxGtEF92HswKXuXi5VwTDKvTUxOVAQ
   FBDf9TnCTllPX/AB+e9Kw1n5EYuKDBBoFNYpms8aOwIJ7XlTC9nCDUAgv
   aGmlljZX/2BkkcLHxQtZsoiynQPP8zLPHBZX9gluiR/8AAXDGnEy51Xr2
   UtoxkAFYYzQMqCPw2rYZiIDlsXDAi7KtRA1HIOL4ObhAu+xMmZPbMpwjY
   Q==;
X-CSE-ConnectionGUID: Ss7oTUqET4KMJFO+DE+lgA==
X-CSE-MsgGUID: NkpFv/G/Rn+uP1akHAPPwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="94238251"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="94238251"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 05:27:46 -0700
X-CSE-ConnectionGUID: s3hU+f+OSHC5bPSIJNn0Aw==
X-CSE-MsgGUID: Gpq09Xc1Qj6aeOlHKGW+lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="256879416"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 04 Jul 2026 05:27:45 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfzTC-00000000D3N-2kFY;
	Sat, 04 Jul 2026 12:27:42 +0000
Date: Sat, 04 Jul 2026 20:27:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jic23-iio:testing 83/118] drivers/iio/imu/adis16550.c:911
 adis16550_config_sync() warn: '(__x + (__d / 2)) / __d' 123456789 can't fit
 into 65535 'sync_scale'
Message-ID: <202607042029.JPsbMNiw-lkp@intel.com>
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
TO: "Uwe Kleine-K=C3=B6nig (The Capable Hub)" <u.kleine-koenig@baylibre.com>
CC: Jonathan Cameron <jic23@kernel.org>
CC: "Nuno S=C3=A1" <nuno.sa@analog.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testi=
ng
head:   b4d8a2e93ff3d963f672e2e8c866caf35585139a
commit: d9df71de85c2687d4250f8662296902bed430458 [83/118] iio: imu: adis165=
50: Simplify device abstraction
:::::: branch date: 18 hours ago
:::::: commit date: 3 days ago
config: hexagon-randconfig-r072-20260704 (https://download.01.org/0day-ci/a=
rchive/20260704/202607042029.JPsbMNiw-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2=
fb2a2269da0e2a3e230beb6cad39ca314db33)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607042029.JPsbMNiw-lkp@intel.com/

smatch warnings:
drivers/iio/imu/adis16550.c:911 adis16550_config_sync() warn: '(__x + (__d =
/ 2)) / __d' 123456789 can't fit into 65535 'sync_scale'

vim +911 drivers/iio/imu/adis16550.c

bac4368fab62c72 Robert Budai                       2025-02-17  873 =20
bac4368fab62c72 Robert Budai                       2025-02-17  874  static =
int adis16550_config_sync(struct adis16550 *st)
bac4368fab62c72 Robert Budai                       2025-02-17  875  {
bac4368fab62c72 Robert Budai                       2025-02-17  876  	struct=
 device *dev =3D &st->adis.spi->dev;
bac4368fab62c72 Robert Budai                       2025-02-17  877  	const =
struct adis16550_sync *sync_mode_data;
bac4368fab62c72 Robert Budai                       2025-02-17  878  	struct=
 clk *clk;
bac4368fab62c72 Robert Budai                       2025-02-17  879  	int re=
t, i;
bac4368fab62c72 Robert Budai                       2025-02-17  880  	u16 mo=
de;
bac4368fab62c72 Robert Budai                       2025-02-17  881 =20
bac4368fab62c72 Robert Budai                       2025-02-17  882  	clk =
=3D devm_clk_get_optional_enabled(dev, NULL);
bac4368fab62c72 Robert Budai                       2025-02-17  883  	if (IS=
_ERR(clk))
bac4368fab62c72 Robert Budai                       2025-02-17  884  		retur=
n PTR_ERR(clk);
bac4368fab62c72 Robert Budai                       2025-02-17  885  	if (!c=
lk) {
d9df71de85c2687 Uwe Kleine-K=C3=B6nig (The Capable Hub  2026-06-30  886) 		=
st->clk_freq_hz =3D 4000000;
bac4368fab62c72 Robert Budai                       2025-02-17  887  		retur=
n 0;
bac4368fab62c72 Robert Budai                       2025-02-17  888  	}
bac4368fab62c72 Robert Budai                       2025-02-17  889 =20
bac4368fab62c72 Robert Budai                       2025-02-17  890  	st->cl=
k_freq_hz =3D clk_get_rate(clk);
bac4368fab62c72 Robert Budai                       2025-02-17  891 =20
d9df71de85c2687 Uwe Kleine-K=C3=B6nig (The Capable Hub  2026-06-30  892) 	f=
or (i =3D 0; i < ARRAY_SIZE(adis16550_sync_modes); i++) {
d9df71de85c2687 Uwe Kleine-K=C3=B6nig (The Capable Hub  2026-06-30  893) 		=
if (st->clk_freq_hz >=3D adis16550_sync_modes[i].min_rate &&
d9df71de85c2687 Uwe Kleine-K=C3=B6nig (The Capable Hub  2026-06-30  894) 		=
    st->clk_freq_hz <=3D adis16550_sync_modes[i].max_rate) {
d9df71de85c2687 Uwe Kleine-K=C3=B6nig (The Capable Hub  2026-06-30  895) 		=
	sync_mode_data =3D &adis16550_sync_modes[i];
bac4368fab62c72 Robert Budai                       2025-02-17  896  			brea=
k;
bac4368fab62c72 Robert Budai                       2025-02-17  897  		}
bac4368fab62c72 Robert Budai                       2025-02-17  898  	}
bac4368fab62c72 Robert Budai                       2025-02-17  899 =20
d9df71de85c2687 Uwe Kleine-K=C3=B6nig (The Capable Hub  2026-06-30  900) 	i=
f (i =3D=3D ARRAY_SIZE(adis16550_sync_modes))
bac4368fab62c72 Robert Budai                       2025-02-17  901  		retur=
n dev_err_probe(dev, -EINVAL, "Clk rate: %lu not in a valid range",
bac4368fab62c72 Robert Budai                       2025-02-17  902  				   =
  st->clk_freq_hz);
bac4368fab62c72 Robert Budai                       2025-02-17  903 =20
bac4368fab62c72 Robert Budai                       2025-02-17  904  	if (sy=
nc_mode_data->sync_mode =3D=3D ADIS16550_SYNC_MODE_SCALED) {
bac4368fab62c72 Robert Budai                       2025-02-17  905  		u16 s=
ync_scale;
bac4368fab62c72 Robert Budai                       2025-02-17  906  		/*
bac4368fab62c72 Robert Budai                       2025-02-17  907  		 * In=
 sps scaled sync we must scale the input clock to a range
bac4368fab62c72 Robert Budai                       2025-02-17  908  		 * of=
 [3000 4500].
bac4368fab62c72 Robert Budai                       2025-02-17  909  		 */
bac4368fab62c72 Robert Budai                       2025-02-17  910 =20
d9df71de85c2687 Uwe Kleine-K=C3=B6nig (The Capable Hub  2026-06-30 @911) 		=
sync_scale =3D DIV_ROUND_CLOSEST(4000, st->clk_freq_hz);
bac4368fab62c72 Robert Budai                       2025-02-17  912 =20
bac4368fab62c72 Robert Budai                       2025-02-17  913  		if (3=
000 > sync_scale || 4500 < sync_scale)
bac4368fab62c72 Robert Budai                       2025-02-17  914  			retu=
rn dev_err_probe(dev, -EINVAL,
bac4368fab62c72 Robert Budai                       2025-02-17  915  					  =
   "Invalid value:%u for sync_scale",
bac4368fab62c72 Robert Budai                       2025-02-17  916  					  =
   sync_scale);
bac4368fab62c72 Robert Budai                       2025-02-17  917 =20
bac4368fab62c72 Robert Budai                       2025-02-17  918  		ret =
=3D adis_write_reg_16(&st->adis, ADIS16550_REG_SYNC_SCALE,
bac4368fab62c72 Robert Budai                       2025-02-17  919  					sy=
nc_scale);
bac4368fab62c72 Robert Budai                       2025-02-17  920  		if (r=
et)
bac4368fab62c72 Robert Budai                       2025-02-17  921  			retu=
rn ret;
bac4368fab62c72 Robert Budai                       2025-02-17  922 =20
d9df71de85c2687 Uwe Kleine-K=C3=B6nig (The Capable Hub  2026-06-30  923) 		=
st->clk_freq_hz =3D 4000;
bac4368fab62c72 Robert Budai                       2025-02-17  924  	}
bac4368fab62c72 Robert Budai                       2025-02-17  925 =20
bac4368fab62c72 Robert Budai                       2025-02-17  926  	st->cl=
k_freq_hz *=3D 1000;
bac4368fab62c72 Robert Budai                       2025-02-17  927 =20
bac4368fab62c72 Robert Budai                       2025-02-17  928  	mode =
=3D FIELD_PREP(ADIS16550_SYNC_MODE_MASK, sync_mode_data->sync_mode) |
bac4368fab62c72 Robert Budai                       2025-02-17  929  	      =
 FIELD_PREP(ADIS16550_SYNC_EN_MASK, true);
bac4368fab62c72 Robert Budai                       2025-02-17  930 =20
bac4368fab62c72 Robert Budai                       2025-02-17  931  	return=
 __adis_update_bits(&st->adis, ADIS16550_REG_CONFIG,
bac4368fab62c72 Robert Budai                       2025-02-17  932  				  A=
DIS16550_SYNC_MASK, mode);
bac4368fab62c72 Robert Budai                       2025-02-17  933  }
bac4368fab62c72 Robert Budai                       2025-02-17  934 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
