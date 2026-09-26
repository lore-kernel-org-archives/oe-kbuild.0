Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E39F2C0296
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Sep 2026 15:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790436020; cv=none; b=OAhHpFehbgIQy3nu2EmQpyJZJUUfW1fwk8AjbAfK/phaD4zQa9jYw1aQ0Dq45p3kNC/GZuFoqSA+/UeP5dZgfIgVpgVYYYxn/+CBrBvZDyft85pRWqQhEL2sqox1cWmTrO2ZdOadIDGaciyWQJQgEwqc2zZDL2gTRnCsEK3JRgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790436020; c=relaxed/simple;
	bh=GJzDzV1PkibEXYA+eIaXet4Jn48+HI4fn/J1y8ONl4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FkekZXRcZ+7LWrJqT6NtADT5W+hO4FN1rHKeeYB24jxeY9cPspN/RqYDvHdrs8FP1+VojUnQ68QTTAeIacENjuFDawqPN9ifmMO0SDt7pV9mtM+yPjrUa+w6aZXhfr4Br0lOOTcmIBaSG8J5bFoc2B41GLVuKPO5slIQFQERqVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jXHQA8vm; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jXHQA8vm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790436017; x=1821972017;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GJzDzV1PkibEXYA+eIaXet4Jn48+HI4fn/J1y8ONl4I=;
  b=jXHQA8vm4PqFHzs40jjd9TMP6v6F/laaOajZuWoJwp4tqQGArMnx3JK7
   HaTOr2y1kZaL3ELQ60Cj3KBX28gxmsLP5AUFxX/2NdRQtAW9PNDD5Jaij
   +/xrlZvxOyqg3WhUyYBX0fcaDU2gxl7x01KDKPSu6KlIq72tP01OC7104
   3isjT8KDDSy//SpwlK+lZFx8f5panSs5i/w6fG2miBLOG/gPXcKUgxecz
   1gK5naSXwCcyNspfaqanZMidgr+D4hkgzonxy9w1fAZAIXEK8mfnGC+wH
   X94nyNK0jjiCvdLJAcpN0ElLKnUe0KgE6e5TEMVjbtEzHoVlU7Dd37ZBK
   g==;
X-CSE-ConnectionGUID: 6BIMm3t5TPi+yaV4njl/Xg==
X-CSE-MsgGUID: Xc3M2ASsT7qpY0OK2nGDdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="102563513"
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="102563513"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 08:20:16 -0700
X-CSE-ConnectionGUID: Em/QtDYDS9CXFOEttCyvyg==
X-CSE-MsgGUID: FH2NU6ibQwO9Sr/nXjvLew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="304110397"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Sep 2026 08:20:16 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAUCD-00000000Ltt-1FV6;
	Sat, 26 Sep 2026 15:20:13 +0000
Date: Sat, 26 Sep 2026 23:19:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gerg-m68knommu:dt 2/22] drivers/tty/serial/mcf.c:586:25:
 sparse: sparse: unsigned value that used to be signed checked against zero?
Message-ID: <202609262305.AW66PR73-lkp@intel.com>
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
head:   eafb2e6e489faacf921ddea1e9232e555f7abca6
commit: 9bf66b595d3a0930594f37daca3e4518227bcc6e [2/22] serial: mcf: conver=
t to use proper platform resources
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: m68k-randconfig-r1305-20260926 (https://download.01.org/0day-ci/arc=
hive/20260926/202609262305.AW66PR73-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260926/202609262305.AW66PR73-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609262305.AW66PR73-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tty/serial/mcf.c:586:25: sparse: sparse: unsigned value that use=
d to be signed checked against zero?
   drivers/tty/serial/mcf.c:585:37: sparse: signed value source

vim +586 drivers/tty/serial/mcf.c

49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  570 =
=20
9671f09921d93e drivers/tty/serial/mcf.c Bill Pemberton    2012-11-19  571  =
static int mcf_probe(struct platform_device *pdev)
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  572  {
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  573  =
	struct uart_port *port;
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  574  =
	struct resource *res;
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  575 =
=20
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  576  =
	if (pdev->id >=3D MCF_MAXPORTS)
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  577  =
		return -ENODEV;
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  578  =
	port =3D &mcf_ports[pdev->id].port;
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  579 =
=20
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  580  =
	port->membase =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  581  =
	if (IS_ERR(port->membase))
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  582  =
		return PTR_ERR(port->membase);
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  583  =
	port->mapbase =3D res->start;
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  584 =
=20
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  585  =
	port->irq =3D platform_get_irq(pdev, 0);
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15 @586  =
	if (port->irq < 0)
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  587  =
		return port->irq;
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  588 =
=20
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  589  =
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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
