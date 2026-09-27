Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463963BB57
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Sep 2026 00:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790469987; cv=none; b=oGZvrIQeQ7AjZX7QsRJch3F69SpVh5nJ1Q0oSxAuCh1Qb4FqsoPn7HYTUA1Yd9nVIA0oPpgXaz20s0kohX+zlKYNIT0L1j1FtVaCNNoS0g66qLC/Og/yVQMx0xQ3Y2JT8j9gdbgHQw4P9Yb3O+RmRnGC5TmIsFBXF+b554wTCE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790469987; c=relaxed/simple;
	bh=yTV8TVX2q9LDkPMurhsoivKOh1HMkPdpsV9D5oWJ7Po=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Iqe6XNsEdQvf6q4aEPXCcxVb8OBFiQRgTL2IWklgpXpHdLQF1Ce5be6Jmy03mqr8dNAcNfLMRVfo5dn0d9/7k60t9IIPn7AYxnL5+sX9NyzPAwmkXifr33cmeJ/VaxlJH1dMrcsaszwu266ggsRVSvGar9Jnrai4GBZfSa3BakE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+wxPc45; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+wxPc45"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790469985; x=1822005985;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yTV8TVX2q9LDkPMurhsoivKOh1HMkPdpsV9D5oWJ7Po=;
  b=f+wxPc45X7VzkOttP0owYgxe5cJ47USzv7FbMNvTDayI4NyRSyp16eJ8
   VXPQgKP4ezk9MpL71NhzVSvjVerzTgs1dg+E5vucI+slqvSPVFmc7SxV3
   Tb1HmTbqWrF8TDmFYaAk3Hdi7i4YD0W7/nFkPA98wUjbLQz5+uAkV1wyX
   0/0VJozLJ0g+Uy01eknvTjEexE2NvzB/meMLTRPCy+sVWvN7gHdAFEXuU
   pembrH0EqUiol/Y47H/GYVlwPdYq8s0C31+fpnqoSQj8JmV5atiT7hN8a
   QYItTavBYZ0pJX4TkDjusNvTetA/YKTM6eH51UJB5dmumh8q+3X2IZStG
   g==;
X-CSE-ConnectionGUID: Yi1kLJ9GRCaZWA9e8ifMtA==
X-CSE-MsgGUID: gxOyd4xXT9qiCgqaeISAYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="94091694"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="94091694"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 17:46:25 -0700
X-CSE-ConnectionGUID: 2dMM0z9xSAKIScCRabl57A==
X-CSE-MsgGUID: EnlynVcfQ4qDsAJU0nN6Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="282750928"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 26 Sep 2026 17:46:23 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAd25-000000000JW-2zis;
	Sun, 27 Sep 2026 00:46:21 +0000
Date: Sun, 27 Sep 2026 02:45:48 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jic23-iio:testing 66/82]
 drivers/iio/magnetometer/ak8975.c:627 ak8975_setup() warn: passing zero to
 'dev_err_probe'
Message-ID: <202609270219.cCECv2b8-lkp@intel.com>
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
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
CC: "Nuno S=C3=A1" <nuno.sa@analog.com>
CC: Joshua Crofts <joshua.crofts1@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testi=
ng
head:   e5b9e42a20392b669097c8c4aa09c3aed82ba10c
commit: 4f8ee49c28b1a537a23e64cfee6ff2e5ec616f7f [66/82] iio: magnetometer:=
 ak8975: use temporary variable for struct device
:::::: branch date: 23 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-2200-20260926 (https://download.01.org/0day-ci/ar=
chive/20260927/202609270219.cCECv2b8-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933=
e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609270219.cCECv2b8-lkp@intel.com/

smatch warnings:
drivers/iio/magnetometer/ak8975.c:627 ak8975_setup() warn: passing zero to =
'dev_err_probe'

vim +/dev_err_probe +627 drivers/iio/magnetometer/ak8975.c

94a6d5cf7caa50 drivers/iio/magnetometer/ak8975.c         Jacek Anaszewski 2=
013-05-07  603 =20
3285aae1edd04f drivers/staging/iio/magnetometer/ak8975.c Andrew Chew      2=
010-09-08  604  /*
3285aae1edd04f drivers/staging/iio/magnetometer/ak8975.c Andrew Chew      2=
010-09-08  605   * Perform some start-of-day setup, including reading the a=
sa calibration
3285aae1edd04f drivers/staging/iio/magnetometer/ak8975.c Andrew Chew      2=
010-09-08  606   * values and caching them.
3285aae1edd04f drivers/staging/iio/magnetometer/ak8975.c Andrew Chew      2=
010-09-08  607   */
79ab48ae4f9e06 drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2=
026-05-11  608  static int ak8975_setup(struct ak8975_data *data)
3285aae1edd04f drivers/staging/iio/magnetometer/ak8975.c Andrew Chew      2=
010-09-08  609  {
79ab48ae4f9e06 drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2=
026-05-11  610  	struct i2c_client *client =3D data->client;
4f8ee49c28b1a5 drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2=
026-09-20  611  	struct device *dev =3D &client->dev;
3285aae1edd04f drivers/staging/iio/magnetometer/ak8975.c Andrew Chew      2=
010-09-08  612  	int ret;
3285aae1edd04f drivers/staging/iio/magnetometer/ak8975.c Andrew Chew      2=
010-09-08  613 =20
3285aae1edd04f drivers/staging/iio/magnetometer/ak8975.c Andrew Chew      2=
010-09-08  614  	/* Write the fused rom access mode. */
286f74c2533ac4 drivers/iio/magnetometer/ak8975.c         Gwendal Grignou  2=
014-11-21  615  	ret =3D ak8975_set_mode(data, FUSE_ROM);
4f8ee49c28b1a5 drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2=
026-09-20  616  	if (ret < 0)
4f8ee49c28b1a5 drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2=
026-09-20  617  		return dev_err_probe(dev, ret, "Error in setting fuse acc=
ess mode\n");
3285aae1edd04f drivers/staging/iio/magnetometer/ak8975.c Andrew Chew      2=
010-09-08  618 =20
3285aae1edd04f drivers/staging/iio/magnetometer/ak8975.c Andrew Chew      2=
010-09-08  619  	/* Get asa data and store in the device data. */
dbb1f2fa2bba8d drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2=
026-05-05  620  	ret =3D i2c_smbus_read_i2c_block_data_or_emulated(client,
dbb1f2fa2bba8d drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2=
026-05-05  621  							data->def->ctrl_regs[ASA_BASE],
dbb1f2fa2bba8d drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2=
026-05-05  622  							sizeof(data->asa),
dbb1f2fa2bba8d drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2=
026-05-05  623  							data->asa);
4f8ee49c28b1a5 drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2=
026-09-20  624  	if (ret < 0)
4f8ee49c28b1a5 drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2=
026-09-20  625  		return dev_err_probe(dev, ret, "Not able to read asa data=
\n");
4f8ee49c28b1a5 drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2=
026-09-20  626  	if (ret !=3D sizeof(data->asa))
4f8ee49c28b1a5 drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2=
026-09-20 @627  		return dev_err_probe(dev, ret, "Error reading asa data\n"=
);
3285aae1edd04f drivers/staging/iio/magnetometer/ak8975.c Andrew Chew      2=
010-09-08  628 =20
040f3e5833b942 drivers/staging/iio/magnetometer/ak8975.c Leed Aguilar     2=
012-06-06  629  	/* After reading fuse ROM data set power-down mode */
286f74c2533ac4 drivers/iio/magnetometer/ak8975.c         Gwendal Grignou  2=
014-11-21  630  	ret =3D ak8975_set_mode(data, POWER_DOWN);
4f8ee49c28b1a5 drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2=
026-09-20  631  	if (ret < 0)
4f8ee49c28b1a5 drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2=
026-09-20  632  		return dev_err_probe(dev, ret, "Error in setting power-do=
wn mode\n");
94a6d5cf7caa50 drivers/iio/magnetometer/ak8975.c         Jacek Anaszewski 2=
013-05-07  633 =20
2c289e63944467 drivers/iio/magnetometer/ak8975.c         Linus Walleij    2=
019-12-02  634  	if (data->eoc_gpiod || client->irq > 0) {
94a6d5cf7caa50 drivers/iio/magnetometer/ak8975.c         Jacek Anaszewski 2=
013-05-07  635  		ret =3D ak8975_setup_irq(data);
4f8ee49c28b1a5 drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2=
026-09-20  636  		if (ret < 0)
4f8ee49c28b1a5 drivers/iio/magnetometer/ak8975.c         Andy Shevchenko  2=
026-09-20  637  			return dev_err_probe(dev, ret, "Error setting data ready=
 interrupt\n");
94a6d5cf7caa50 drivers/iio/magnetometer/ak8975.c         Jacek Anaszewski 2=
013-05-07  638  	}
94a6d5cf7caa50 drivers/iio/magnetometer/ak8975.c         Jacek Anaszewski 2=
013-05-07  639 =20
286f74c2533ac4 drivers/iio/magnetometer/ak8975.c         Gwendal Grignou  2=
014-11-21  640  	data->raw_to_gauss[0] =3D data->def->raw_to_gauss(data->as=
a[0]);
286f74c2533ac4 drivers/iio/magnetometer/ak8975.c         Gwendal Grignou  2=
014-11-21  641  	data->raw_to_gauss[1] =3D data->def->raw_to_gauss(data->as=
a[1]);
286f74c2533ac4 drivers/iio/magnetometer/ak8975.c         Gwendal Grignou  2=
014-11-21  642  	data->raw_to_gauss[2] =3D data->def->raw_to_gauss(data->as=
a[2]);
3285aae1edd04f drivers/staging/iio/magnetometer/ak8975.c Andrew Chew      2=
010-09-08  643 =20
3285aae1edd04f drivers/staging/iio/magnetometer/ak8975.c Andrew Chew      2=
010-09-08  644  	return 0;
3285aae1edd04f drivers/staging/iio/magnetometer/ak8975.c Andrew Chew      2=
010-09-08  645  }
3285aae1edd04f drivers/staging/iio/magnetometer/ak8975.c Andrew Chew      2=
010-09-08  646 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
