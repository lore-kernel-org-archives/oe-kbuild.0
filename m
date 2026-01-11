Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41934125A0
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jan 2026 05:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768107888; cv=none; b=XYrQAm8Zv7+nzzZlvZSsXYItjVRIgSPLsXobV/F6duDivYoPAhMycisimalEpG3ybFiwtuxkoYQoQMm2VNJtjD71kIjCgf51rtys+T1X2mU2Nv2H/TdFdEwxB7z6S355YNSC/yp5tuXdp2x9WMxPhDz8Kcu/MNWyGFVNs8xJtK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768107888; c=relaxed/simple;
	bh=wAtWggNLVI858TfCSViR6FwjWBI6h/DMUK81CsEX8bY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=os5IgJ8pCzSI0ZGsoR7XKzG7vB9FXtJCZSZZ0PfOrBblg2cnVHZNsQtfuBOWEyCSH3KuYSOT72cyLneUG9Gz8MvC3CysNzIAc+Guu8iDCuTK0zFnHcnF9eyvaZMOrAkq1TJSrbMyvOK2tpCKdDosMhsuiN0is2x+QX5OW9Pq4YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gQoHNio5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gQoHNio5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768107886; x=1799643886;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wAtWggNLVI858TfCSViR6FwjWBI6h/DMUK81CsEX8bY=;
  b=gQoHNio56B9nR33BTwoc2ONfGAY86KlPwhnmviOy9aJ6x3jiycrf2hMy
   +ZDrq93RXYlY3ROCWAeKIwXF2kRxmTJx4h+Y9VMAm0zrUgI2yim1lG19l
   ctmeDYPAjbwAug/Q7nn1M5bD4aso4795LNrcw5V6VEJyy1YVIXylZraoI
   fcwPHCbDiBWcEYJV+9p8AMzYdNphziEyJ4OuRTq15fJIVZxekh2JkCmAU
   A+3EJm04W67b2hwooPObqgYgoumsPeeMmnKSZUoxgNo/jSvXyZGLtQpef
   Hk6q1fBKgr4XNhMUVK+I/sLEWi9BUq9eONP0EPu43fV7nAFtiDrjqC8Fj
   g==;
X-CSE-ConnectionGUID: FyucaJvnQVu5VJn1Uyp/MA==
X-CSE-MsgGUID: LW1q4JNPRxmb1n5zk8OXDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="69325837"
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="69325837"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 21:04:46 -0800
X-CSE-ConnectionGUID: xisfxVD7QvSJV3A2qLobOw==
X-CSE-MsgGUID: o0qnfHNmSUSu3+1x9LZuaw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jan 2026 21:04:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vend4-000000009ci-2RKb;
	Sun, 11 Jan 2026 05:04:42 +0000
Date: Sun, 11 Jan 2026 13:04:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:locking/core 11/43] drivers/tty/serial/mvebu-uart.c:759
 mvebu_uart_console_write() error: uninitialized symbol 'flags'.
Message-ID: <202601111257.32j78rbe-lkp@intel.com>
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
CC: x86@kernel.org
TO: Marco Elver <elver@google.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking=
/core
head:   a45026cef17d1080c985adf28234d6c8475ad66f
commit: f16a802d402d735a55731f8c94952b3bbb5ddfe8 [11/43] locking/rwlock, sp=
inlock: Support Clang's context analysis
:::::: branch date: 3 days ago
:::::: commit date: 6 days ago
config: m68k-randconfig-r072-20260111 (https://download.01.org/0day-ci/arch=
ive/20260111/202601111257.32j78rbe-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601111257.32j78rbe-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/mvebu-uart.c:759 mvebu_uart_console_write() error: unini=
tialized symbol 'flags'.
drivers/tty/serial/rda-uart.c:607 rda_uart_port_write() error: uninitialize=
d symbol 'flags'.
drivers/tty/serial/omap-serial.c:1244 serial_omap_console_write() error: un=
initialized symbol 'flags'.

Old smatch warnings:
drivers/tty/serial/mvebu-uart.c:983 mvebu_uart_probe() warn: 'mvuart->clk' =
from clk_prepare_enable() not released on lines: 956,967,973.

vim +/flags +759 drivers/tty/serial/mvebu-uart.c

30530791a7a032 Wilson Ding     2016-02-16  726 =20
30530791a7a032 Wilson Ding     2016-02-16  727  static void mvebu_uart_cons=
ole_write(struct console *co, const char *s,
30530791a7a032 Wilson Ding     2016-02-16  728  				     unsigned int count)
30530791a7a032 Wilson Ding     2016-02-16  729  {
30530791a7a032 Wilson Ding     2016-02-16  730  	struct uart_port *port =3D =
&mvebu_uart_ports[co->index];
30530791a7a032 Wilson Ding     2016-02-16  731  	unsigned long flags;
5218d76958644a Miquel Raynal   2017-10-13  732  	unsigned int ier, intr, ct=
l;
30530791a7a032 Wilson Ding     2016-02-16  733  	int locked =3D 1;
30530791a7a032 Wilson Ding     2016-02-16  734 =20
30530791a7a032 Wilson Ding     2016-02-16  735  	if (oops_in_progress)
f9b7652c32ebf5 Thomas Gleixner 2023-09-14  736  		locked =3D uart_port_tryl=
ock_irqsave(port, &flags);
30530791a7a032 Wilson Ding     2016-02-16  737  	else
f9b7652c32ebf5 Thomas Gleixner 2023-09-14  738  		uart_port_lock_irqsave(po=
rt, &flags);
30530791a7a032 Wilson Ding     2016-02-16  739 =20
5218d76958644a Miquel Raynal   2017-10-13  740  	ier =3D readl(port->membas=
e + UART_CTRL(port)) & CTRL_BRK_INT;
5218d76958644a Miquel Raynal   2017-10-13  741  	intr =3D readl(port->memba=
se + UART_INTR(port)) &
5218d76958644a Miquel Raynal   2017-10-13  742  		(CTRL_RX_RDY_INT(port) | =
CTRL_TX_RDY_INT(port));
5218d76958644a Miquel Raynal   2017-10-13  743  	writel(0, port->membase + =
UART_CTRL(port));
5218d76958644a Miquel Raynal   2017-10-13  744  	writel(0, port->membase + =
UART_INTR(port));
30530791a7a032 Wilson Ding     2016-02-16  745 =20
30530791a7a032 Wilson Ding     2016-02-16  746  	uart_console_write(port, s=
, count, mvebu_uart_console_putchar);
30530791a7a032 Wilson Ding     2016-02-16  747 =20
54ca955b5a4024 Pali Roh=C3=A1r      2020-12-23  748  	wait_for_xmite(port);
30530791a7a032 Wilson Ding     2016-02-16  749 =20
30530791a7a032 Wilson Ding     2016-02-16  750  	if (ier)
5218d76958644a Miquel Raynal   2017-10-13  751  		writel(ier, port->membase=
 + UART_CTRL(port));
5218d76958644a Miquel Raynal   2017-10-13  752 =20
5218d76958644a Miquel Raynal   2017-10-13  753  	if (intr) {
5218d76958644a Miquel Raynal   2017-10-13  754  		ctl =3D intr | readl(port=
->membase + UART_INTR(port));
5218d76958644a Miquel Raynal   2017-10-13  755  		writel(ctl, port->membase=
 + UART_INTR(port));
5218d76958644a Miquel Raynal   2017-10-13  756  	}
30530791a7a032 Wilson Ding     2016-02-16  757 =20
30530791a7a032 Wilson Ding     2016-02-16  758  	if (locked)
f9b7652c32ebf5 Thomas Gleixner 2023-09-14 @759  		uart_port_unlock_irqresto=
re(port, flags);
30530791a7a032 Wilson Ding     2016-02-16  760  }
30530791a7a032 Wilson Ding     2016-02-16  761 =20

:::::: The code at line 759 was first introduced by commit
:::::: f9b7652c32ebf5d0e2842333fa8ca9ba115ad424 serial: mvebu-uart: Use por=
t lock wrappers

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
