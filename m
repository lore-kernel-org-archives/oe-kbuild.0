Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C5C43E9FB
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Sep 2026 07:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789543745; cv=none; b=VOJYhdW6DlG2pWM9rx0Kns6WexBIIB9tIUr9ojh8BVM1toJxaKgmt2/+FgfGktNTswOgI/s3uRcjxVBgZU/acIT4AnuefDBuY5eiH5+UeTv8g7Sw8NpAJYzOCl5pxHEF8KcsB3npBTlQ9auC5JtFS0nJ+yLOTk04kkmitNaf+qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789543745; c=relaxed/simple;
	bh=iPVJZ8OJeMTaEFbP6QI75SwsN2C94m1W7fEQA06fAN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=u3C5FS1D/xMjwUMH+7pX286E6SDk/qA5YfHxRu/0d0kLB9Vlp1bD86ov5Gqz5HqkpvpEagUGKpzuy/9AgqPnyLABSLgBkP2p6s8fIOQOYfuKewtQDia3pYWq6BazH6IrfuM/Nq226P7g9ULRjbsccdWb/GgnTzakPqxw1v+GkWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SSFGJyAm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SSFGJyAm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789543736; x=1821079736;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iPVJZ8OJeMTaEFbP6QI75SwsN2C94m1W7fEQA06fAN0=;
  b=SSFGJyAmA1XhY4KTWAhERLU3LxSZOwpNuiH1hHUmMbWmqGRvh7m7hk6b
   7/m1eyfu7JuyKxgROI78DWypsGrVq0TrA7skU3wmCLTIoV7+yf6uVj1lQ
   TebiXr8VPF5s31hGUwWtj7EYkKxYy6yf25xK2qhnpxuDOWAC9lwzJKIst
   ma6aTYecWOnjRlEnwfUgq9bNhfNTizv+pNO8G3IypTiyKj3KtvlwpnsDi
   EwD+dR1htlHCkA1xVWyEuURCQjldy+umYqiSwP7ghU+US20o53Ffmv4bc
   DO1DpTfhGciiGkurrYRRX4UjOGrHC86faQU3p4eRS4/JiD9IBOaWM1o1Y
   A==;
X-CSE-ConnectionGUID: F1sEi8FJQO2fLvyYg0mHVA==
X-CSE-MsgGUID: P+TppBK6TYKPBz65+Y/yJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100578570"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100578570"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 00:28:46 -0700
X-CSE-ConnectionGUID: T1mSwXD4TdWUqwQNK6r8gA==
X-CSE-MsgGUID: k3NOFDTiQC6z3svSk2DweA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="268980449"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 16 Sep 2026 00:28:45 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6k4Q-0000000003j-3pe6;
	Wed, 16 Sep 2026 07:28:42 +0000
Date: Wed, 16 Sep 2026 09:28:17 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/tty/serial/owl-uart.c:719 owl_uart_probe() warn:
 'owl_port->clk' from clk_prepare_enable() not released on lines: 719.
Message-ID: <202609160937.OilPQS0m-lkp@intel.com>
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
TO: Marco Elver <elver@google.com>
CC: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
CC: "Harry Yoo (Oracle)" <harry@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
commit: 0fc1bd38a19c108395d8338fb034f90c2d3fbe55 slab: improve KMALLOC_PART=
ITION_RANDOM randomness
date:   4 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 4 months ago
config: arc-randconfig-r073-20260915 (https://download.01.org/0day-ci/archi=
ve/20260916/202609160937.OilPQS0m-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 0fc1bd38a19c ("slab: improve KMALLOC_PARTITION_RANDOM randomness")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609160937.OilPQS0m-lkp@intel.com/

smatch warnings:
drivers/tty/serial/owl-uart.c:719 owl_uart_probe() warn: 'owl_port->clk' fr=
om clk_prepare_enable() not released on lines: 719.

vim +719 drivers/tty/serial/owl-uart.c

fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  643 =20
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  644  static int owl_uart_p=
robe(struct platform_device *pdev)
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  645  {
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  646  	const struct of_devi=
ce_id *match;
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  647  	const struct owl_uar=
t_info *info =3D NULL;
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  648  	struct resource *res=
_mem;
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  649  	struct owl_uart_port=
 *owl_port;
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  650  	int ret, irq;
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  651 =20
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  652  	if (pdev->dev.of_nod=
e) {
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  653  		pdev->id =3D of_ali=
as_get_id(pdev->dev.of_node, "serial");
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  654  		match =3D of_match_=
node(owl_uart_dt_matches, pdev->dev.of_node);
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  655  		if (match)
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  656  			info =3D match->da=
ta;
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  657  	}
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  658 =20
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  659  	if (pdev->id < 0 || =
pdev->id >=3D OWL_UART_PORT_NUM) {
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  660  		dev_err(&pdev->dev,=
 "id %d out of range\n", pdev->id);
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  661  		return -EINVAL;
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  662  	}
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  663 =20
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  664  	res_mem =3D platform=
_get_resource(pdev, IORESOURCE_MEM, 0);
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  665  	if (!res_mem) {
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  666  		dev_err(&pdev->dev,=
 "could not get mem\n");
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  667  		return -ENODEV;
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  668  	}
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  669 =20
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  670  	irq =3D platform_get=
_irq(pdev, 0);
1df217868178bd Stephen Boyd     2019-07-30  671  	if (irq < 0)
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  672  		return irq;
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  673 =20
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  674  	if (owl_uart_ports[p=
dev->id]) {
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  675  		dev_err(&pdev->dev,=
 "port %d already allocated\n", pdev->id);
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  676  		return -EBUSY;
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  677  	}
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  678 =20
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  679  	owl_port =3D devm_kz=
alloc(&pdev->dev, sizeof(*owl_port), GFP_KERNEL);
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  680  	if (!owl_port)
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  681  		return -ENOMEM;
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  682 =20
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  683  	owl_port->clk =3D de=
vm_clk_get(&pdev->dev, NULL);
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  684  	if (IS_ERR(owl_port-=
>clk)) {
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  685  		dev_err(&pdev->dev,=
 "could not get clk\n");
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  686  		return PTR_ERR(owl_=
port->clk);
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  687  	}
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  688 =20
abf42d2f333b21 Amit Singh Tomar 2020-04-17  689  	ret =3D clk_prepare_enabl=
e(owl_port->clk);
abf42d2f333b21 Amit Singh Tomar 2020-04-17  690  	if (ret) {
abf42d2f333b21 Amit Singh Tomar 2020-04-17  691  		dev_err(&pdev->dev, "cou=
ld not enable clk\n");
abf42d2f333b21 Amit Singh Tomar 2020-04-17  692  		return ret;
abf42d2f333b21 Amit Singh Tomar 2020-04-17  693  	}
abf42d2f333b21 Amit Singh Tomar 2020-04-17  694 =20
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  695  	owl_port->port.dev =
=3D &pdev->dev;
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  696  	owl_port->port.line =
=3D pdev->id;
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  697  	owl_port->port.type =
=3D PORT_OWL;
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  698  	owl_port->port.iotyp=
e =3D UPIO_MEM;
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  699  	owl_port->port.mapba=
se =3D res_mem->start;
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  700  	owl_port->port.irq =
=3D irq;
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  701  	owl_port->port.uartc=
lk =3D clk_get_rate(owl_port->clk);
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  702  	if (owl_port->port.u=
artclk =3D=3D 0) {
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  703  		dev_err(&pdev->dev,=
 "clock rate is zero\n");
bcea0f547ec1a2 Miaoqian Lin     2022-03-07  704  		clk_disable_unprepare(ow=
l_port->clk);
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  705  		return -EINVAL;
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  706  	}
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  707  	owl_port->port.flags=
 =3D UPF_BOOT_AUTOCONF | UPF_IOREMAP | UPF_LOW_LATENCY;
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  708  	owl_port->port.x_cha=
r =3D 0;
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  709  	owl_port->port.fifos=
ize =3D (info) ? info->tx_fifosize : 16;
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  710  	owl_port->port.ops =
=3D &owl_uart_ops;
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  711 =20
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  712  	owl_uart_ports[pdev-=
>id] =3D owl_port;
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  713  	platform_set_drvdata=
(pdev, owl_port);
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  714 =20
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  715  	ret =3D uart_add_one=
_port(&owl_uart_driver, &owl_port->port);
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  716  	if (ret)
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  717  		owl_uart_ports[pdev=
->id] =3D NULL;
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  718 =20
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09 @719  	return ret;
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  720  }
fc60a8b675bd94 Andreas F=C3=A4rber   2017-07-09  721 =20

:::::: The code at line 719 was first introduced by commit
:::::: fc60a8b675bd9499c71716d21c238eed5092ddfc tty: serial: owl: Implement=
 console driver

:::::: TO: Andreas F=C3=A4rber <afaerber@suse.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
