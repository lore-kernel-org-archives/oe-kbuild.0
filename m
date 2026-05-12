Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0714B36F913
	for <oe-kbuild@lists.linux.dev>; Tue, 12 May 2026 20:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778618168; cv=none; b=T5VTLYOyEQOMiKHVX5yQYcAiwprbWBjqjLl4mG4LQoOS/yWkd1ZkYMim9SRoBvdTZ06ejKjMwqFWNOwxzN3zQtt3cfJyXFYJepOT7aENK8SaUM269i4rleP29vH1aG9vIInUwxjT4K4aZKkA4WxIuo6qfWYSTnoxm9arwxL/lzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778618168; c=relaxed/simple;
	bh=56zF8yb7Yk+TQYsFLJj3P7lYY5UDTrEBr2uyrmcF/xo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FA18qwhKd8AuaVHMixf2bGc1/jK7jcfJmmzAZpNhfOmCrHs23x6XYQlAIrxXgQaqX9De5D/x07IBIQvku0WAi37+Z0JKtm21pZlPlZICGUro6Pb8LlHSykgobX+9Wvb1vBnA86pyeHU99YKLhg5gt6TwO3O8XVtbI3kgpEUX4eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=byST0g1D; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="byST0g1D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778618166; x=1810154166;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=56zF8yb7Yk+TQYsFLJj3P7lYY5UDTrEBr2uyrmcF/xo=;
  b=byST0g1DE+VdQTfUc1Js9mO0BpDbuWAvf4FUWOUnfv0bkf9QBCa+du1Q
   SPiLiGWKOER555KrRlKQ7Nh21J/uUa4CRoVrZpO/UKwF1wxcqVLdk5lDh
   W3V803n8mwkRse7Ywgc1fP8QwLuYwjJMETAhiQRmjpcy2gk785RR5A6Gc
   LZgZLuWYjp/UD7eNO7m1KXw182wQRIax+T9HKzYEGd/DCTVSn28Jkv2yn
   LrKUM4KIguLLo4jOvV/HgxM4mhUPbhLwrGccPsOS6mk5H8sFpyEGEGvxJ
   AKy16F0Fo5Lg6W/ApbVaEXxB02a4j3mwiSIhSGPB48Hc/WR9TidMqGJwQ
   g==;
X-CSE-ConnectionGUID: xPzHDGVvTKugZdrqBunBzA==
X-CSE-MsgGUID: 5ENN0aDsS5OxBBvCqVnpwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="90922456"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="90922456"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 13:36:05 -0700
X-CSE-ConnectionGUID: I+K+QA2tRdWHD/bkmZqByg==
X-CSE-MsgGUID: Z/lNZVkPQhyxNBjnuODvtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="242227295"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 May 2026 13:36:04 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMtph-000000002md-3PoZ;
	Tue, 12 May 2026 20:36:01 +0000
Date: Wed, 13 May 2026 04:35:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jic23-iio:fixes-togreg 31/32]
 drivers/iio/potentiostat/lmp91000.c:353 lmp91000_probe() warn: missing unwind
 goto?
Message-ID: <202605130437.SgMZ43gQ-lkp@intel.com>
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
TO: Salah Triki <salah.triki@gmail.com>
CC: Jonathan Cameron <jic23@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git fixes=
-togreg
head:   2ec11ebb4d0dea4aa9604f8336cd1e1c390d5dcb
commit: 82764dcb3643c70649f14fe8e92e667955574a8c [31/32] iio: potentiostat:=
 lmp91000: fix probe order and cleanup paths
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: i386-randconfig-141-20260512 (https://download.01.org/0day-ci/archi=
ve/20260513/202605130437.SgMZ43gQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605130437.SgMZ43gQ-lkp@intel.com/

smatch warnings:
drivers/iio/potentiostat/lmp91000.c:353 lmp91000_probe() warn: missing unwi=
nd goto?

vim +353 drivers/iio/potentiostat/lmp91000.c

67e17300dc1d760 Matt Ranostay    2016-09-24  294 =20
7d8b3e100abeeff Uwe Kleine-K=C3=B6nig 2022-11-18  295  static int lmp91000_=
probe(struct i2c_client *client)
67e17300dc1d760 Matt Ranostay    2016-09-24  296  {
67e17300dc1d760 Matt Ranostay    2016-09-24  297  	struct device *dev =3D &=
client->dev;
67e17300dc1d760 Matt Ranostay    2016-09-24  298  	struct lmp91000_data *da=
ta;
67e17300dc1d760 Matt Ranostay    2016-09-24  299  	struct iio_dev *indio_de=
v;
67e17300dc1d760 Matt Ranostay    2016-09-24  300  	int ret;
67e17300dc1d760 Matt Ranostay    2016-09-24  301 =20
67e17300dc1d760 Matt Ranostay    2016-09-24  302  	indio_dev =3D devm_iio_d=
evice_alloc(dev, sizeof(*data));
67e17300dc1d760 Matt Ranostay    2016-09-24  303  	if (!indio_dev)
67e17300dc1d760 Matt Ranostay    2016-09-24  304  		return -ENOMEM;
67e17300dc1d760 Matt Ranostay    2016-09-24  305 =20
67e17300dc1d760 Matt Ranostay    2016-09-24  306  	indio_dev->info =3D &lmp=
91000_info;
67e17300dc1d760 Matt Ranostay    2016-09-24  307  	indio_dev->channels =3D =
lmp91000_channels;
67e17300dc1d760 Matt Ranostay    2016-09-24  308  	indio_dev->num_channels =
=3D ARRAY_SIZE(lmp91000_channels);
67e17300dc1d760 Matt Ranostay    2016-09-24  309  	indio_dev->name =3D LMP9=
1000_DRV_NAME;
67e17300dc1d760 Matt Ranostay    2016-09-24  310  	indio_dev->modes =3D IND=
IO_DIRECT_MODE;
67e17300dc1d760 Matt Ranostay    2016-09-24  311  	i2c_set_clientdata(clien=
t, indio_dev);
67e17300dc1d760 Matt Ranostay    2016-09-24  312 =20
67e17300dc1d760 Matt Ranostay    2016-09-24  313  	data =3D iio_priv(indio_=
dev);
67e17300dc1d760 Matt Ranostay    2016-09-24  314  	data->dev =3D dev;
67e17300dc1d760 Matt Ranostay    2016-09-24  315  	data->regmap =3D devm_re=
gmap_init_i2c(client, &lmp91000_regmap_config);
67e17300dc1d760 Matt Ranostay    2016-09-24  316  	if (IS_ERR(data->regmap)=
) {
67e17300dc1d760 Matt Ranostay    2016-09-24  317  		dev_err(dev, "regmap in=
itialization failed.\n");
67e17300dc1d760 Matt Ranostay    2016-09-24  318  		return PTR_ERR(data->re=
gmap);
67e17300dc1d760 Matt Ranostay    2016-09-24  319  	}
67e17300dc1d760 Matt Ranostay    2016-09-24  320 =20
4d031666560da23 Gwendal Grignou  2021-03-09  321  	data->trig =3D devm_iio_=
trigger_alloc(dev, "%s-mux%d",
15ea2878bfb2550 Jonathan Cameron 2021-04-26  322  					    indio_dev->name,
15ea2878bfb2550 Jonathan Cameron 2021-04-26  323  					    iio_device_id(in=
dio_dev));
368e8718875f17a Dixit Parmar     2025-08-22  324  	if (!data->trig)
67e17300dc1d760 Matt Ranostay    2016-09-24  325  		return -ENOMEM;
67e17300dc1d760 Matt Ranostay    2016-09-24  326 =20
67e17300dc1d760 Matt Ranostay    2016-09-24  327  	init_completion(&data->c=
ompletion);
67e17300dc1d760 Matt Ranostay    2016-09-24  328 =20
67e17300dc1d760 Matt Ranostay    2016-09-24  329  	ret =3D lmp91000_read_co=
nfig(data);
67e17300dc1d760 Matt Ranostay    2016-09-24  330  	if (ret)
67e17300dc1d760 Matt Ranostay    2016-09-24  331  		return ret;
67e17300dc1d760 Matt Ranostay    2016-09-24  332 =20
82764dcb3643c70 Salah Triki      2026-05-07  333  	data->cb_buffer =3D iio_=
channel_get_all_cb(dev, &lmp91000_buffer_cb, indio_dev);
82764dcb3643c70 Salah Triki      2026-05-07  334  	if (IS_ERR(data->cb_buff=
er)) {
82764dcb3643c70 Salah Triki      2026-05-07  335  		if (PTR_ERR(data->cb_bu=
ffer) =3D=3D -ENODEV)
82764dcb3643c70 Salah Triki      2026-05-07  336  			ret =3D -EPROBE_DEFER;
82764dcb3643c70 Salah Triki      2026-05-07  337  		else
82764dcb3643c70 Salah Triki      2026-05-07  338  			ret =3D PTR_ERR(data->=
cb_buffer);
82764dcb3643c70 Salah Triki      2026-05-07  339 =20
82764dcb3643c70 Salah Triki      2026-05-07  340  		goto error_unreg_buffer;
82764dcb3643c70 Salah Triki      2026-05-07  341  	}
82764dcb3643c70 Salah Triki      2026-05-07  342 =20
67e17300dc1d760 Matt Ranostay    2016-09-24  343  	ret =3D iio_trigger_set_=
immutable(iio_channel_cb_get_iio_dev(data->cb_buffer),
67e17300dc1d760 Matt Ranostay    2016-09-24  344  					data->trig);
67e17300dc1d760 Matt Ranostay    2016-09-24  345  	if (ret) {
67e17300dc1d760 Matt Ranostay    2016-09-24  346  		dev_err(dev, "cannot se=
t immutable trigger.\n");
67e17300dc1d760 Matt Ranostay    2016-09-24  347  		return ret;
67e17300dc1d760 Matt Ranostay    2016-09-24  348  	}
67e17300dc1d760 Matt Ranostay    2016-09-24  349 =20
67e17300dc1d760 Matt Ranostay    2016-09-24  350  	ret =3D iio_trigger_regi=
ster(data->trig);
67e17300dc1d760 Matt Ranostay    2016-09-24  351  	if (ret) {
67e17300dc1d760 Matt Ranostay    2016-09-24  352  		dev_err(dev, "cannot re=
gister iio trigger.\n");
67e17300dc1d760 Matt Ranostay    2016-09-24 @353  		return ret;
67e17300dc1d760 Matt Ranostay    2016-09-24  354  	}
67e17300dc1d760 Matt Ranostay    2016-09-24  355 =20
67e17300dc1d760 Matt Ranostay    2016-09-24  356  	ret =3D iio_triggered_bu=
ffer_setup(indio_dev, NULL,
67e17300dc1d760 Matt Ranostay    2016-09-24  357  					 &lmp91000_buffer_ha=
ndler,
67e17300dc1d760 Matt Ranostay    2016-09-24  358  					 &lmp91000_buffer_se=
tup_ops);
67e17300dc1d760 Matt Ranostay    2016-09-24  359  	if (ret)
67e17300dc1d760 Matt Ranostay    2016-09-24  360  		goto error_unreg_trigge=
r;
67e17300dc1d760 Matt Ranostay    2016-09-24  361 =20
67e17300dc1d760 Matt Ranostay    2016-09-24  362  	data->adc_chan =3D iio_c=
hannel_cb_get_channels(data->cb_buffer);
67e17300dc1d760 Matt Ranostay    2016-09-24  363 =20
67e17300dc1d760 Matt Ranostay    2016-09-24  364  	ret =3D iio_device_regis=
ter(indio_dev);
67e17300dc1d760 Matt Ranostay    2016-09-24  365  	if (ret)
67e17300dc1d760 Matt Ranostay    2016-09-24  366  		goto error_unreg_cb_buf=
fer;
67e17300dc1d760 Matt Ranostay    2016-09-24  367 =20
67e17300dc1d760 Matt Ranostay    2016-09-24  368  	return 0;
67e17300dc1d760 Matt Ranostay    2016-09-24  369 =20
67e17300dc1d760 Matt Ranostay    2016-09-24  370  error_unreg_cb_buffer:
67e17300dc1d760 Matt Ranostay    2016-09-24  371  	iio_channel_release_all_=
cb(data->cb_buffer);
67e17300dc1d760 Matt Ranostay    2016-09-24  372 =20
67e17300dc1d760 Matt Ranostay    2016-09-24  373  error_unreg_trigger:
67e17300dc1d760 Matt Ranostay    2016-09-24  374  	iio_trigger_unregister(d=
ata->trig);
67e17300dc1d760 Matt Ranostay    2016-09-24  375 =20
82764dcb3643c70 Salah Triki      2026-05-07  376  error_unreg_buffer:
82764dcb3643c70 Salah Triki      2026-05-07  377  	iio_triggered_buffer_cle=
anup(indio_dev);
82764dcb3643c70 Salah Triki      2026-05-07  378 =20
67e17300dc1d760 Matt Ranostay    2016-09-24  379  	return ret;
67e17300dc1d760 Matt Ranostay    2016-09-24  380  }
67e17300dc1d760 Matt Ranostay    2016-09-24  381 =20

:::::: The code at line 353 was first introduced by commit
:::::: 67e17300dc1d76091d2d513d6aa57e50af2c9648 iio: potentiostat: add LMP9=
1000 support

:::::: TO: Matt Ranostay <mranostay@gmail.com>
:::::: CC: Jonathan Cameron <jic23@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
