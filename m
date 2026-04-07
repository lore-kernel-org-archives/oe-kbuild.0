Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6B537756A
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Apr 2026 04:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534622; cv=none; b=PRi6cB+SK6qWoWLIxM5RYVoyN/49NIEdZZl2rg/4SeaXKdwY0038SM7ugLX4ljEJN57cO6Qn9W2KrMVLiWgotxXiJg1EstCYeRJdngpDhpqNCwUXD/IIfrmIpXPiQ4lzUeKFt062tYef0SXPX1wSNSEdRnOQLJmeauIKvk07/oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534622; c=relaxed/simple;
	bh=I3LYK4LAVxaOVYt1EID4pI2SKDpuDIjAoYwpH25dfI4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GnnF9wfwiZQEgraOnOcDRgXt+wtuhg5516MX7sh3J0ZZ4A2Ul0fOq5uAawrLyfDyr+p0Iq+lq+0hzq2I1UdVh169QWZHL0cdVNYKWwWoQPI1EiAeTibHefsPmLgFawLYByvAVBOW70RFNBQhOC70wy46e/vYbfzIQ2RaEM0Mvp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BboP59LM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BboP59LM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534621; x=1807070621;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=I3LYK4LAVxaOVYt1EID4pI2SKDpuDIjAoYwpH25dfI4=;
  b=BboP59LMGE1KMNyUBW/7RhF3m932HRjo3r8IriWaYZ3ihpX/y6t6YaKP
   vbfQnLoEDDEZpSaDgsTjWMXYpyuBTbQxABdYfDIT35NFqhMs9chwbPDrI
   +omIIREF2ISncfISsDvmKzK8VuHikp2azIhq1iYfShN5EaQ31TtO4T9cT
   5E9L1nca/QonjNWneqMhgHR2MaNvqJVqfQ9bwSdtTL+HAKjbSxMKT1zO5
   pyiKNCE3B+n5EQ3BaB0ML0MSZ1b/T8K7M0ddhBfhIG9dcLggEeymcejaQ
   L417+xLUWuR3XqdnV3h6TeOHsFHC9T3JiZxwSlDUCuTgKfZl/JYGbiKeF
   A==;
X-CSE-ConnectionGUID: 3BNqnLe5QcqTnp7jDMr5kQ==
X-CSE-MsgGUID: h5vnn+NSRz+6WqdKLTiUfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87114713"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87114713"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:03:38 -0700
X-CSE-ConnectionGUID: Ttj2H5VDSTWVGIy++b3kkQ==
X-CSE-MsgGUID: OHjD0pgFReSVJdL0bkWjaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="223261236"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Apr 2026 21:03:37 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xf4-0000000008j-0A2a;
	Tue, 07 Apr 2026 04:03:34 +0000
Date: Tue, 07 Apr 2026 12:03:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [gerg-m68knommu:dt 1/14] drivers/tty/serial/mcf.c:586:5-14:
 WARNING: Unsigned expression compared with zero: port -> irq < 0
Message-ID: <202604070002.C3GJzAXO-lkp@intel.com>
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
CC: linux-m68k@lists.linux-m68k.org
CC: uclinux-dev@uclinux.org
TO: Greg Ungerer <gerg@linux-m68k.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git =
dt
head:   96bd1f7e74e2461c1e906031ed49b9dcf3c28296
commit: ee23fc34d94a7395f99cffd2c9d92a7a502b408c [1/14] serial: mcf: conver=
t to use proper platform resources
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: m68k-randconfig-r052-20260406 (https://download.01.org/0day-ci/arch=
ive/20260407/202604070002.C3GJzAXO-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202604070002.C3GJzAXO-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/tty/serial/mcf.c:586:5-14: WARNING: Unsigned expression compared=
 with zero: port -> irq < 0

vim +586 drivers/tty/serial/mcf.c

49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  570 =
=20
9671f09921d93e drivers/tty/serial/mcf.c Bill Pemberton    2012-11-19  571  =
static int mcf_probe(struct platform_device *pdev)
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  572  {
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  573  =
	struct uart_port *port;
ee23fc34d94a73 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  574  =
	struct resource *res;
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  575 =
=20
ee23fc34d94a73 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  576  =
	if (pdev->id >=3D MCF_MAXPORTS)
ee23fc34d94a73 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  577  =
		return -ENODEV;
ee23fc34d94a73 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  578  =
	port =3D &mcf_ports[pdev->id].port;
ee23fc34d94a73 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  579 =
=20
ee23fc34d94a73 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  580  =
	port->membase =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
ee23fc34d94a73 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  581  =
	if (IS_ERR(port->membase))
ee23fc34d94a73 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  582  =
		return PTR_ERR(port->membase);
ee23fc34d94a73 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  583  =
	port->mapbase =3D res->start;
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  584 =
=20
ee23fc34d94a73 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  585  =
	port->irq =3D platform_get_irq(pdev, 0);
ee23fc34d94a73 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15 @586  =
	if (port->irq < 0)
ee23fc34d94a73 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  587  =
		return port->irq;
ee23fc34d94a73 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  588 =
=20
ee23fc34d94a73 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  589  =
	port->line =3D pdev->id;
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  590  =
	port->type =3D PORT_MCF;
201d8975ae5ada drivers/tty/serial/mcf.c Greg Ungerer      2015-01-08  591  =
	port->dev =3D &pdev->dev;
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  592  =
	port->iotype =3D SERIAL_IO_MEM;
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  593  =
	port->uartclk =3D MCF_BUSCLK;
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  594  =
	port->ops =3D &mcf_uart_ops;
5fda7a0e715c32 drivers/tty/serial/mcf.c Peter Hurley      2014-06-16  595  =
	port->flags =3D UPF_BOOT_AUTOCONF;
2fc0184dae7be5 drivers/tty/serial/mcf.c Ricardo Ribalda   2014-11-06  596  =
	port->rs485_config =3D mcf_config_rs485;
0139da50dc53f0 drivers/tty/serial/mcf.c Ilpo J=C3=A4rvinen     2022-07-04  =
597  	port->rs485_supported =3D mcf_rs485_supported;
4be87603b6dc9e drivers/tty/serial/mcf.c Angelo Dureghello 2020-10-02  598  =
	port->has_sysrq =3D IS_ENABLED(CONFIG_SERIAL_MCF_CONSOLE);
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  599 =
=20
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  600  =
	uart_add_one_port(&mcf_driver, port);
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  601  =
	return 0;
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  602  }
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  603 =
=20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
