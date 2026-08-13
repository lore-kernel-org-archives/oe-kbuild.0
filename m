Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49620322DB7
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Aug 2026 19:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786650917; cv=none; b=FS65phjj0NHVkERi3Azqpo2Kze+SmJSymb9NmLL3N/8L6tmQMNLRKdIniNV6UYLWaEA74XfQQrwuWA0UmiQSaumTGvbt1ufi8RxTniYDUBfrAYo4v8nEkU/kcv3z0EC5Y/C4EhP4Y44zEij55zWUEhxD1/u3/VDfig+h3d3oets=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786650917; c=relaxed/simple;
	bh=jHATSHkDvE+3Cb2HQXJw7xy/RJUrZUD9Vnfpugwb6ZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BES/8VNaCj/0y5qS1DcKJe4vivihsKVOpjZ0nASqFnwf4MMlZ20iRtTpKXDfQ8gZGzJpjZ4Y+k8KtN8urjng05JEjd/3fIuyiXcHxenFm8CdfDiH5fjfLbPrqbIwlhw8ZP8YvM8UOERHs+hHj/ZZ7rmTrXn7iL0fnV88oK5n09c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f4ZChbvQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f4ZChbvQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786650916; x=1818186916;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jHATSHkDvE+3Cb2HQXJw7xy/RJUrZUD9Vnfpugwb6ZI=;
  b=f4ZChbvQu3wvKE9D/oTIeuCU7/5sHWmSP5Psbf3Ly85OibTxLA4BuVTG
   +f2POSPjNntn3PSTTjE6axtwueWyqa9TAv0h6Nvjo0jz1wmUn3lcSPzvJ
   2N/mjyWWtmLEZAMGbHVntdPjJgqlK20OCQXuO11lgY6u04NWBi+xufK5I
   NsSmUSHrnzQZ+iVE+95frTA3C6UfI91gp7RY6BBBgYIkV/elCEHWm/pPQ
   9sXaV7xuGFyfyR5MIUikKuMy+IWw22nqxazkrz8uF54XbmZHe3ZkYMqyC
   MvBxWx7NdJ2p/xDM+I/UpxZZyMe8XKC4Quoci94nAVTl/b6rm3dB0Kgh4
   w==;
X-CSE-ConnectionGUID: vXrJv5X4RESnVyL3thXQyw==
X-CSE-MsgGUID: rTS4XHrZTo263uapWGst4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87095876"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="87095876"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 12:55:15 -0700
X-CSE-ConnectionGUID: EJNda+gvRxeCA0jfn4bU2A==
X-CSE-MsgGUID: O5FahzJQQdS0SO90OXd92Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="302277008"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Aug 2026 12:55:14 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wubWB-00000000WQu-3Gm1;
	Thu, 13 Aug 2026 19:55:11 +0000
Date: Fri, 14 Aug 2026 03:54:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gerg-m68knommu:dt 2/22] drivers/tty/serial/mcf.c:586:25:
 sparse: sparse: unsigned value that used to be signed checked against zero?
Message-ID: <202608140358.D3HT9v2t-lkp@intel.com>
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
head:   76a231d031905d3bbc982b9a3d92619ce917e306
commit: 191a962ceb628c9ba07bb6d5687820afaa2823fb [2/22] serial: mcf: conver=
t to use proper platform resources
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: m68k-randconfig-r122-20260813 (https://download.01.org/0day-ci/arch=
ive/20260814/202608140358.D3HT9v2t-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260814/202608140358.D3HT9v2t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608140358.D3HT9v2t-lkp@intel.com/

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
191a962ceb628c drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  574  =
	struct resource *res;
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  575 =
=20
191a962ceb628c drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  576  =
	if (pdev->id >=3D MCF_MAXPORTS)
191a962ceb628c drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  577  =
		return -ENODEV;
191a962ceb628c drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  578  =
	port =3D &mcf_ports[pdev->id].port;
191a962ceb628c drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  579 =
=20
191a962ceb628c drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  580  =
	port->membase =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
191a962ceb628c drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  581  =
	if (IS_ERR(port->membase))
191a962ceb628c drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  582  =
		return PTR_ERR(port->membase);
191a962ceb628c drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  583  =
	port->mapbase =3D res->start;
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  584 =
=20
191a962ceb628c drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  585  =
	port->irq =3D platform_get_irq(pdev, 0);
191a962ceb628c drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15 @586  =
	if (port->irq < 0)
191a962ceb628c drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  587  =
		return port->irq;
191a962ceb628c drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  588 =
=20
191a962ceb628c drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  589  =
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
