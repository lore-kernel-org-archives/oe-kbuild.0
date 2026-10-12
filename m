Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C566F4A0926
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Oct 2026 16:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791823244; cv=none; b=G55xAXXMYpWiCfrD0Hf3CT2BAwWPxenNnbXzRKvb7IpNPgHNqX2j9DpG6Rht2Xvc/X2s65+NPJAGwR2a/DPvQW1lLZvBNq9Uu/6HkpsN69GNB+OuC0wIWdOtXDLk6DrAR9JVsfFS7Qc+CmcU1dG2sYBksbewrKjilRo9NI3QiJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791823244; c=relaxed/simple;
	bh=S11Unzw1a23SkfZBxotKvhfrXpG6csuHJ43MOaf0hDk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nHdOJFxuNjVCLhnudmz5kI97JJLoVuVYWKUEyH5VNIkYis+79yaLW9HSgOlX2/EhZgd5p2QHWP67VQjx/cQpfzXoWzEZurV4iTA1jAWv2ep1lY30F9yz5fnZbB5G1l+z2jC/OPYalerMcUrhIOPMT147J/7MdDqf5jayp7wVRB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KwxbSTgF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KwxbSTgF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791823243; x=1823359243;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=S11Unzw1a23SkfZBxotKvhfrXpG6csuHJ43MOaf0hDk=;
  b=KwxbSTgFzsaajFuhs9IyjQJhxIjrb6LzQcQmNfPqX3J0qiqMMZRHxTHO
   1i8OTuEtz+4gE7CcM1+b5pDAqFwbguLWPusfXSowA17EKyvpdO2Mhmsrd
   am6m6nbtYOe9APPJiKIrggfcHwKNkB/pozOXurwdEPycs5EyNQ2lid/FX
   +mik9ZRrKZ0IY5GvLaI7Pp6trbdKa5L18ab1MU8GXxXUmd4twePmFW9Eh
   hNVkxyFYgbXc7c6vLsvb7p3NhIqOJR5ygocpRWu60rZbVV8NGoFKZLblZ
   hACMz69ebILKi9pZpve7fwCIXbjjg4jY1mCDvurBO83TpOkDdhe6B8AVA
   Q==;
X-CSE-ConnectionGUID: LWTuQWPVQPSk6uPIzwexGQ==
X-CSE-MsgGUID: pb60c7ZmRHqBNnV6wzAyWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="409791"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="409791"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 09:40:42 -0700
X-CSE-ConnectionGUID: Or0mVwhHQS+QE379YvBL9A==
X-CSE-MsgGUID: AmWHKtxKQsqDaStIwIFneA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1004551"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 12 Oct 2026 09:40:42 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGJ4o-00000000A7n-3iyf;
	Mon, 12 Oct 2026 16:40:38 +0000
Date: Mon, 12 Oct 2026 18:39:40 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [gerg-m68knommu:armnommu 3/3] drivers/mtd/maps/pismo.c:243
 pismo_probe() error: we previously assumed 'pdata' could be null (see line
 226)
Message-ID: <202610121829.Uh5Yrm1s-lkp@intel.com>
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
CC: linux-m68k@lists.linux-m68k.org
CC: uclinux-dev@uclinux.org
TO: Greg Ungerer <gerg@uclinux.org>

Hi Greg,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git =
armnommu
head:   dd5d1340f9d2226762be6e009f9dcc3d8639d1a2
commit: dd5d1340f9d2226762be6e009f9dcc3d8639d1a2 [3/3] ARM: versatile: supp=
ort configuring versatile machine for no-MMU
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arm-randconfig-r2201-20261012 (https://download.01.org/0day-ci/arch=
ive/20261012/202610121829.Uh5Yrm1s-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610121829.Uh5Yrm1s-lkp@intel.com/

smatch warnings:
drivers/mtd/maps/pismo.c:243 pismo_probe() error: we previously assumed 'pd=
ata' could be null (see line 226)

vim +/pdata +243 drivers/mtd/maps/pismo.c

f6a8c60960bbea Russell King - ARM Linux 2009-11-29  208 =20
0b79d5d1e5982b Uwe Kleine-K=C3=B6nig         2023-02-26  209  static int pi=
smo_probe(struct i2c_client *client)
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  210  {
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  211  	struct pismo_pdat=
a *pdata =3D client->dev.platform_data;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  212  	struct pismo_eepr=
om eeprom;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  213  	struct pismo_data=
 *pismo;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  214  	int ret, i;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  215 =20
752031210ca145 Wolfram Sang             2019-07-22  216  	if (!i2c_check_fu=
nctionality(client->adapter, I2C_FUNC_I2C)) {
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  217  		dev_err(&client-=
>dev, "functionality mismatch\n");
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  218  		return -EIO;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  219  	}
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  220 =20
bf4afc53b77aea Linus Torvalds           2026-02-21  221  	pismo =3D kzalloc=
_obj(*pismo);
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  222  	if (!pismo)
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  223  		return -ENOMEM;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  224 =20
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  225  	pismo->client =3D =
client;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29 @226  	if (pdata) {
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  227  		pismo->vpp =3D p=
data->set_vpp;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  228  		pismo->vpp_data =
=3D pdata->vpp_data;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  229  	}
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  230  	i2c_set_clientdat=
a(client, pismo);
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  231 =20
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  232  	ret =3D pismo_eep=
rom_read(client, &eeprom, 0, sizeof(eeprom));
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  233  	if (ret < 0) {
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  234  		dev_err(&client-=
>dev, "error reading EEPROM: %d\n", ret);
395b228858778d Wolfram Sang             2010-03-20  235  		goto exit_free;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  236  	}
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  237 =20
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  238  	dev_info(&client-=
>dev, "%.15s board found\n", eeprom.board);
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  239 =20
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  240  	for (i =3D 0; i <=
 ARRAY_SIZE(eeprom.cs); i++)
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  241  		if (eeprom.cs[i]=
.type !=3D 0xff)
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  242  			pismo_add_one(p=
ismo, i, &eeprom.cs[i],
f6a8c60960bbea Russell King - ARM Linux 2009-11-29 @243  				      pdata->c=
s_addrs[i]);
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  244 =20
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  245  	return 0;
395b228858778d Wolfram Sang             2010-03-20  246 =20
395b228858778d Wolfram Sang             2010-03-20  247   exit_free:
395b228858778d Wolfram Sang             2010-03-20  248  	kfree(pismo);
395b228858778d Wolfram Sang             2010-03-20  249  	return ret;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  250  }
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  251 =20

:::::: The code at line 243 was first introduced by commit
:::::: f6a8c60960bbea378142d1fa1b3d111555ee41c7 mtd: Really add ARM pismo s=
upport

:::::: TO: Russell King - ARM Linux <linux@arm.linux.org.uk>
:::::: CC: David Woodhouse <David.Woodhouse@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
