Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0418330C16E
	for <oe-kbuild@lists.linux.dev>; Sat, 30 May 2026 03:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780112716; cv=none; b=Ii3DVB+CCf4hXli1nwAw6mrAkZvNUkZ+OwkFd5VsL5c2YX5lY1CU/xUVmkJAlfaAreUBo4uPLK0RXhUyEyO6dbZ3vGqhGRkeg+5qXNHlrBGD2PgKE+MpJ2aF38zvxVF3H1b0ZVMfK/KwanHjilySjx6oQtbkKMOhu4+E2Pd7S7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780112716; c=relaxed/simple;
	bh=l/HtCYV1rmPhC2ud0bvTVxv8j415IlDWNKCDv0D87rs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=r3wl+qA9WcWh3O4UHATdmp9cQBxgiNrra9iXuwNB9ok73rWCab0geNuRtcAjLIz2qLKDwJIJDMif65qyfIM5E93YdCsuXjMJhjfvLBY0+aHXTJENuJbCYzFYQ1ypk6mHdnhT6Eg/1w3+ZSUdAiyvM/S5zqbJOeChnuCia1aKxs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bB16NOuB; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bB16NOuB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780112715; x=1811648715;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=l/HtCYV1rmPhC2ud0bvTVxv8j415IlDWNKCDv0D87rs=;
  b=bB16NOuBceUfaMJzoMSnuwDVX0Lt9lqWD065Lbagzb8wVxP/4tTr0C6e
   9ie1Mjpn/3lZctRgzsTwB56B1A5xxDMOBSWmJ8JFgUtkwPJA72TNq3o+4
   ZxJzPvpAmvT8g30a6Ws6fTt9jmgtPCu2K8XTqzYubl7ZLF/PoxbisI55p
   dVVtOAhC4xUkRtL5r0oTEeAwN7X92R998v3QyEvSohZKfZaiqw0J9IwwC
   6pTxnHFRmKEJIKT9NJczwqBl27KgbeIRwbOkrm1h7VyGcscnsj++555QH
   64lTvL7O/T75kLbD2NYz4GBRbGGVmE+/991jrjiC7fZJI/O7IlftZrN6F
   g==;
X-CSE-ConnectionGUID: UfqKh6jSR8Kv0Q4AIkyvpg==
X-CSE-MsgGUID: ek+TMTjHQPWq308Vm6XaAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="91272664"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="91272664"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 20:45:14 -0700
X-CSE-ConnectionGUID: z2mAjoWvQvS7UuGhU3MaKg==
X-CSE-MsgGUID: pd7HG+2hRbiN2Tl1zaBWCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="240480974"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 May 2026 20:45:13 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTAdK-0000000085C-3YU4;
	Sat, 30 May 2026 03:45:10 +0000
Date: Sat, 30 May 2026 11:44:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gerg-m68knommu:dt 1/14] drivers/tty/serial/mcf.c:586:25:
 sparse: sparse: unsigned value that used to be signed checked against zero?
Message-ID: <202605301134.RTo8T5E6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "low confidence static check warning: drivers/t=
ty/serial/mcf.c:586:25: sparse: sparse: unsigned value that used to be sign=
ed checked against zero?"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-m68k@lists.linux-m68k.org
CC: uclinux-dev@uclinux.org
TO: Greg Ungerer <gerg@linux-m68k.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git =
dt
head:   6981b56a3efac027786c4d92f79de5fed71e8711
commit: 7a746cf61b424a0247321392b89a4e94afe78a70 [1/14] serial: mcf: conver=
t to use proper platform resources
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: m68k-randconfig-r123-20260530 (https://download.01.org/0day-ci/arch=
ive/20260530/202605301134.RTo8T5E6-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260530/202605301134.RTo8T5E6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605301134.RTo8T5E6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tty/serial/mcf.c:586:25: sparse: sparse: unsigned value that use=
d to be signed checked against zero?
   drivers/tty/serial/mcf.c:585:37: sparse: signed value source

vim +586 drivers/tty/serial/mcf.c

49aa49bfd40d718 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  570 =
=20
9671f09921d93e7 drivers/tty/serial/mcf.c Bill Pemberton    2012-11-19  571 =
 static int mcf_probe(struct platform_device *pdev)
49aa49bfd40d718 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  572 =
 {
49aa49bfd40d718 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  573 =
 	struct uart_port *port;
7a746cf61b424a0 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  574 =
 	struct resource *res;
49aa49bfd40d718 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  575 =
=20
7a746cf61b424a0 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  576 =
 	if (pdev->id >=3D MCF_MAXPORTS)
7a746cf61b424a0 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  577 =
 		return -ENODEV;
7a746cf61b424a0 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  578 =
 	port =3D &mcf_ports[pdev->id].port;
7a746cf61b424a0 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  579 =
=20
7a746cf61b424a0 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  580 =
 	port->membase =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
7a746cf61b424a0 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  581 =
 	if (IS_ERR(port->membase))
7a746cf61b424a0 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  582 =
 		return PTR_ERR(port->membase);
7a746cf61b424a0 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  583 =
 	port->mapbase =3D res->start;
49aa49bfd40d718 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  584 =
=20
7a746cf61b424a0 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  585 =
 	port->irq =3D platform_get_irq(pdev, 0);
7a746cf61b424a0 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15 @586 =
 	if (port->irq < 0)
7a746cf61b424a0 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  587 =
 		return port->irq;
7a746cf61b424a0 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  588 =
=20
7a746cf61b424a0 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  589 =
 	port->line =3D pdev->id;
49aa49bfd40d718 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  590 =
 	port->type =3D PORT_MCF;
201d8975ae5ada7 drivers/tty/serial/mcf.c Greg Ungerer      2015-01-08  591 =
 	port->dev =3D &pdev->dev;
49aa49bfd40d718 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  592 =
 	port->iotype =3D SERIAL_IO_MEM;
49aa49bfd40d718 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  593 =
 	port->uartclk =3D MCF_BUSCLK;
49aa49bfd40d718 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  594 =
 	port->ops =3D &mcf_uart_ops;
5fda7a0e715c32c drivers/tty/serial/mcf.c Peter Hurley      2014-06-16  595 =
 	port->flags =3D UPF_BOOT_AUTOCONF;
2fc0184dae7be56 drivers/tty/serial/mcf.c Ricardo Ribalda   2014-11-06  596 =
 	port->rs485_config =3D mcf_config_rs485;
0139da50dc53f0c drivers/tty/serial/mcf.c Ilpo J=C3=A4rvinen     2022-07-04 =
 597  	port->rs485_supported =3D mcf_rs485_supported;
4be87603b6dc9e4 drivers/tty/serial/mcf.c Angelo Dureghello 2020-10-02  598 =
 	port->has_sysrq =3D IS_ENABLED(CONFIG_SERIAL_MCF_CONSOLE);
49aa49bfd40d718 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  599 =
=20
49aa49bfd40d718 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  600 =
 	uart_add_one_port(&mcf_driver, port);
49aa49bfd40d718 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  601 =
 	return 0;
49aa49bfd40d718 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  602 =
 }
49aa49bfd40d718 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  603 =
=20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
