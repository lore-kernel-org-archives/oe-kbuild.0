Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88B0317164
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Jul 2026 13:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783690468; cv=none; b=tKHUgA6jKsLfY52FO6HeH9nPUrkaw2GCz2x8BD3NjkFZWbYRZCJvqepv6+Gf8IbHyWTR7EAxbxxu/KjJfaZlNnabnA8cFmAtufnZAxT8Wkw0XJYFSyT4bIICNZ88g5Yqjp+JM5ROq0N+g5fs/FoALqeiNi1UeX0ZvXMzUpK5Obo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783690468; c=relaxed/simple;
	bh=whLRdePQfZ0RSwSVQ+cLi4cMvdqZ2Q+guVZWA2Z7mHU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QEcs8YMKm9EXBExTHS5q/LqJmgds4+gGd5Troq0XJSmte2HxADm5fRZNHey6nHwM3CHX4Px3YIG1ykumohMZNd6nxiDuSoxXlf3+0nPoPB3NnjII0WUAM1DHtL+77+eYFbY8LE/QRfy5HRkPI3a57PhqZinVwC9bZp7ta/WE7X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l+WH+rA7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l+WH+rA7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783690466; x=1815226466;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=whLRdePQfZ0RSwSVQ+cLi4cMvdqZ2Q+guVZWA2Z7mHU=;
  b=l+WH+rA7FYH6cEk34+rYdwryjNRqnT5BLC0/yy4s3tGFyHqXpsOFZ6oH
   bXlVqw6tX8Rlz3p9++oCoNaYd+8TXPMekYslHkcWjdFHfjw5feQ16Nm1F
   9WrPB0gggWX/M6VikcCdfRCyM5npZreuvTul2KCMYmgkmEh+EHbLEwgXX
   o4rA5gHYSvb6T0+io1lTz7TvBjqLcYRAoqrSdNoewdXS0RneUGCL2jmX+
   qzKiE1kFHZQKfsMtfrKX2pteLfQ+S0zoPh8U3dGZ3x35dXHr/WPXe8KDm
   rxzjYhRMIq8kRbGt/g8k+rAdw2xgR4cXYfh6cRQEbBJ86W1qqpNS4jd0Y
   g==;
X-CSE-ConnectionGUID: zf9GB1QwTki8z2K6vdpLpA==
X-CSE-MsgGUID: Uonfw7VpRWarxT9l0nkh0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95759847"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95759847"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 06:34:22 -0700
X-CSE-ConnectionGUID: IAvLlIIVTaK+vXFMS9XHpg==
X-CSE-MsgGUID: nG8Ttv4cQu2qoX81/E2y1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250888831"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 10 Jul 2026 06:34:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiBMw-00000000Iy7-09bg;
	Fri, 10 Jul 2026 13:34:18 +0000
Date: Fri, 10 Jul 2026 21:33:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpib/fmh_gpib/fmh_gpib.c:1476 fmh_gpib_attach_impl()
 warn: 'e_priv->fifo_base' from ioremap() not released on lines:
 1451,1457,1465.
Message-ID: <202607102136.8Zg3WLfZ-lkp@intel.com>
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
TO: Dave Penkler <dpenkler@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a635d6748234582ea287c5ffeae28b9b23f91c7e
commit: e6ab504633e4c06e35377ecf3c8cbc304de79858 staging: gpib: Destage gpib
date:   8 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 8 months ago
config: alpha-randconfig-r071-20260710 (https://download.01.org/0day-ci/arc=
hive/20260710/202607102136.8Zg3WLfZ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: e6ab504633e4 ("staging: gpib: Destage gpib")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607102136.8Zg3WLfZ-lkp@intel.com/

New smatch warnings:
drivers/gpib/fmh_gpib/fmh_gpib.c:1476 fmh_gpib_attach_impl() warn: 'e_priv-=
>fifo_base' from ioremap() not released on lines: 1451,1457,1465.
drivers/gpib/fmh_gpib/fmh_gpib.c:1476 fmh_gpib_attach_impl() warn: 'irq' fr=
om request_irq() not released on lines: 1465.
drivers/gpib/fmh_gpib/fmh_gpib.c:1476 fmh_gpib_attach_impl() warn: 'nec_pri=
v->mmiobase' from ioremap() not released on lines: 1430,1436,1451,1457,1465.
drivers/gpib/fmh_gpib/fmh_gpib.c:1476 fmh_gpib_attach_impl() warn: 'res->st=
art' from __request_region() not released on lines: 1430,1436,1451,1457,146=
5.

Old smatch warnings:
internal error: arch/alpha/include/asm/io_trivial.h:70 SQL error #2: near "=
and": syntax error
internal error: arch/alpha/include/asm/io_trivial.h:70 SQL: 'select * from =
return_states where  and type =3D 1044 and parameter =3D -1 and key =3D '$'=
 limit 1;'
drivers/gpib/fmh_gpib/fmh_gpib.c:1476 fmh_gpib_attach_impl() warn: 'res->st=
art' from __request_region() not released on lines: 1451,1457,1465.

vim +1476 drivers/gpib/fmh_gpib/fmh_gpib.c

8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1376 =20
c3c7a472d6f72b drivers/staging/gpib/fmh_gpib/fmh_gpib.c Michael Rubin 2025-=
04-08  1377  static int fmh_gpib_attach_impl(struct gpib_board *board, cons=
t struct gpib_board_config *config,
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1378  				unsigned int handshake_mode, int acquire_dma)
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1379  {
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1380  	struct fmh_priv *e_priv;
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1381  	struct nec7210_priv *nec_priv;
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1382  	int retval;
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1383  	int irq;
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1384  	struct resource *res;
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1385  	struct platform_device *pdev;
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1386 =20
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1387  	board->dev =3D driver_find_device(&fmh_gpib_platform_driver.d=
river,
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1388  					NULL, (const void *)config, &fmh_gpib_device_match);
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1389  	if (!board->dev)	{
acdf4581545b83 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2025-=
02-14  1390  		dev_err(board->gpib_dev, "No matching fmh_gpib_core device w=
as found, attach failed.");
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1391  		return -ENODEV;
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1392  	}
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1393  	// currently only used to mark the device as already attached
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1394  	dev_set_drvdata(board->dev, board);
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1395  	pdev =3D to_platform_device(board->dev);
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1396 =20
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1397  	retval =3D fmh_gpib_generic_attach(board);
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1398  	if (retval)
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1399  		return retval;
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1400 =20
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1401  	e_priv =3D board->private_data;
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1402  	nec_priv =3D &e_priv->nec7210_priv;
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1403 =20
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1404  	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "g=
pib_control_status");
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1405  	if (!res) {
acdf4581545b83 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2025-=
02-14  1406  		dev_err(board->dev, "Unable to locate mmio resource\n");
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1407  		return -ENODEV;
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1408  	}
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1409 =20
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1410  	if (request_mem_region(res->start,
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1411  			       resource_size(res),
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1412  			       pdev->name) =3D=3D NULL) {
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1413  		dev_err(board->dev, "cannot claim registers\n");
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1414  		return -ENXIO;
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1415  	}
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1416  	e_priv->gpib_iomem_res =3D res;
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1417 =20
baf8855c916007 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Arnd Bergmann 2024-=
12-13  1418  	nec_priv->mmiobase =3D ioremap(e_priv->gpib_iomem_res->start,
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1419  				     resource_size(e_priv->gpib_iomem_res));
baf8855c916007 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Arnd Bergmann 2024-=
12-13  1420  	if (!nec_priv->mmiobase) {
acdf4581545b83 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2025-=
02-14  1421  		dev_err(board->dev, "Could not map I/O memory\n");
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1422  		return -ENOMEM;
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1423  	}
acdf4581545b83 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2025-=
02-14  1424  	dev_dbg(board->dev, "iobase %pr remapped to %p\n",
baf8855c916007 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Arnd Bergmann 2024-=
12-13  1425  		e_priv->gpib_iomem_res, nec_priv->mmiobase);
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1426 =20
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1427  	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "d=
ma_fifos");
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1428  	if (!res) {
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1429  		dev_err(board->dev, "Unable to locate mmio resource for gpib=
 dma port\n");
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1430  		return -ENODEV;
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1431  	}
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1432  	if (request_mem_region(res->start,
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1433  			       resource_size(res),
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1434  			       pdev->name) =3D=3D NULL) {
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1435  		dev_err(board->dev, "cannot claim registers\n");
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1436  		return -ENXIO;
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1437  	}
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1438  	e_priv->dma_port_res =3D res;
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1439  	e_priv->fifo_base =3D ioremap(e_priv->dma_port_res->start,
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1440  				    resource_size(e_priv->dma_port_res));
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1441  	if (!e_priv->fifo_base) {
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1442  		dev_err(board->dev, "Could not map I/O memory for fifos\n");
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1443  		return -ENOMEM;
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1444  	}
acdf4581545b83 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2025-=
02-14  1445  	dev_dbg(board->dev, "dma fifos 0x%lx remapped to %p, length=
=3D%ld\n",
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1446  		(unsigned long)e_priv->dma_port_res->start, e_priv->fifo_bas=
e,
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1447  		(unsigned long)resource_size(e_priv->dma_port_res));
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1448 =20
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1449  	irq =3D platform_get_irq(pdev, 0);
1269b01cdf3fd3 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Chen Ni       2025-=
04-07  1450  	if (irq < 0)
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1451  		return -EBUSY;
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1452  	retval =3D request_irq(irq, fmh_gpib_interrupt, IRQF_SHARED, =
pdev->name, board);
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1453  	if (retval) {
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1454  		dev_err(board->dev,
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1455  			"cannot register interrupt handler err=3D%d\n",
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1456  			retval);
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1457  		return retval;
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1458  	}
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1459  	e_priv->irq =3D irq;
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1460 =20
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1461  	if (acquire_dma) {
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1462  		e_priv->dma_channel =3D dma_request_slave_channel(board->dev=
, "rxtx");
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1463  		if (!e_priv->dma_channel) {
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1464  			dev_err(board->dev, "failed to acquire dma channel \"rxtx\"=
.\n");
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1465  			return -EIO;
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1466  		}
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1467  	}
6008c89dbdfc86 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Paul Retourn=C3=A9 =
2025-04-11  1468  	/*
6008c89dbdfc86 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Paul Retourn=C3=A9 =
2025-04-11  1469  	 * in the future we might want to know the half-fifo size
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1470  	 * (dma_burst_length) even when not using dma, so go ahead an
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1471  	 * initialize it unconditionally.
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1472  	 */
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1473  	e_priv->dma_burst_length =3D fifos_read(e_priv, FIFO_MAX_BURS=
T_LENGTH_REG) &
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1474  		fifo_max_burst_length_mask;
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1475 =20
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18 @1476  	return fmh_gpib_init(e_priv, board, handshake_mode);
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1477  }
8e4841a0888c74 drivers/staging/gpib/fmh_gpib/fmh_gpib.c Dave Penkler  2024-=
09-18  1478 =20

:::::: The code at line 1476 was first introduced by commit
:::::: 8e4841a0888c74bdcb6ba115d6405206f0c2e8b4 staging: gpib: Add Frank Mo=
ri Hess FPGA PCI GPIB driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
