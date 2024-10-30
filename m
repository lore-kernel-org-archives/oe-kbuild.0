Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E08194AF6
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Oct 2024 02:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730256348; cv=none; b=W11wCxqJQmop6pMW0lAUE1YypUQBmUTaYPz8OnH+TDo/Ejp3mS0+8zDGsHZa9HR3y+RcAdQ1V4OA9tyOpt1Y1fuw1teHQPtn5Ajacn3/14iElw9tFd97hyS/HVNbMaEUFWm9rIpj4Mdvd9Tlfm9Wl+eovz7K8zY7fr6xLwlQ3TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730256348; c=relaxed/simple;
	bh=hmwPlXcsxDxJaV6GmwTmiE5Abw/WmR0+ZP5TsaDE0gA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yr6wpAKjnW2V+59OMHTUSyYvjnbeymYCL2I6we4LzQ93FE1lILzsCJMZ9vH5WAoTK8qJALq/neFTGksBXikhZOnfLZZ1AYHzpau/VaxSTTibZB5O1e1NYJ4yfmRoV03uk0TFfZsqu3UdUX+UutSZLkcTlKxR4obNlGkH3AL2BuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kIXxHZJR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kIXxHZJR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730256345; x=1761792345;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hmwPlXcsxDxJaV6GmwTmiE5Abw/WmR0+ZP5TsaDE0gA=;
  b=kIXxHZJRmUg3wmBFj0CU19dRD1OGhnGrl4BS/DKMkkeAmmNbCRR/kiMK
   9fv/T3ZMnruoPz+3jJnd/boM0ncwlqxDWc3qk1F76WfF7JjeqHTK3RjXy
   e91mGq0TTvQlmAbrHlcjDvRXpsgMUELGwfry2XXUItzMYdPrgMjPLVGrV
   P3woz4ed2Ygn4P5qAwIf2+n/PMVxtqXnvPW2OCfEh173+HjvEtLyXZ1F0
   Cz8uMtZ7BzIdJ782g5VCkXDfRZmImn9v4pE2RdbnuzazhOFkuubetkaNW
   HxMk2UEeceaz4jbF1Ub5ftvLRlV5u7oXyoQznhCAyo1G12q6hK/9SLwV5
   w==;
X-CSE-ConnectionGUID: /PgJ7VrWTWGj1Xe+XGCSlQ==
X-CSE-MsgGUID: zW8Dqi+FRZmCQCwAhgZ9pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47400605"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47400605"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 19:45:45 -0700
X-CSE-ConnectionGUID: QLLw7Vc1QJGsxMbHJrX24A==
X-CSE-MsgGUID: zZH4AoQTTji4IdfWAZzfpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="119648680"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Oct 2024 19:45:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5yiL-000eQq-2t;
	Wed, 30 Oct 2024 02:45:41 +0000
Date: Wed, 30 Oct 2024 10:45:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [arnd-asm-generic:master 5/20]
 drivers/tty/serial/8250/8250_port.c:1333 autoconfig_irq() warn: bitwise AND
 condition is false here
Message-ID: <202410301044.4DoDIy4o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arch@vger.kernel.org
TO: Niklas Schnelle <schnelle@linux.ibm.com>
CC: Arnd Bergmann <arnd@arndb.de>
CC: "Maciej W. Rozycki" <macro@orcam.me.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
head:   c0dc92144ba181cf7ba366a87909bbaa93d5b713
commit: 7c7e6c8924e7bf98db4e5b2edb202842003c00c2 [5/20] tty: serial: handle HAS_IOPORT dependencies
:::::: branch date: 10 hours ago
:::::: commit date: 29 hours ago
config: csky-randconfig-r072-20241030 (https://download.01.org/0day-ci/archive/20241030/202410301044.4DoDIy4o-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410301044.4DoDIy4o-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/8250/8250_port.c:1333 autoconfig_irq() warn: bitwise AND condition is false here
drivers/tty/serial/8250/8250_port.c:2375 serial8250_do_startup() warn: bitwise AND condition is false here
drivers/tty/serial/8250/8250_port.c:2502 serial8250_do_shutdown() warn: bitwise AND condition is false here

Old smatch warnings:
drivers/tty/serial/8250/8250_port.c:1352 autoconfig_irq() warn: bitwise AND condition is false here
drivers/tty/serial/8250/8250_port.c:1376 autoconfig_irq() warn: bitwise AND condition is false here
drivers/tty/serial/8250/8250_port.c:2457 serial8250_do_startup() warn: bitwise AND condition is false here

vim +1333 drivers/tty/serial/8250/8250_port.c

b6830f6df8914f Peter Hurley    2015-06-27  1323  
b6830f6df8914f Peter Hurley    2015-06-27  1324  static void autoconfig_irq(struct uart_8250_port *up)
b6830f6df8914f Peter Hurley    2015-06-27  1325  {
b6830f6df8914f Peter Hurley    2015-06-27  1326  	struct uart_port *port = &up->port;
b6830f6df8914f Peter Hurley    2015-06-27  1327  	unsigned char save_mcr, save_ier;
b6830f6df8914f Peter Hurley    2015-06-27  1328  	unsigned char save_ICP = 0;
b6830f6df8914f Peter Hurley    2015-06-27  1329  	unsigned int ICP = 0;
b6830f6df8914f Peter Hurley    2015-06-27  1330  	unsigned long irqs;
b6830f6df8914f Peter Hurley    2015-06-27  1331  	int irq;
b6830f6df8914f Peter Hurley    2015-06-27  1332  
b6830f6df8914f Peter Hurley    2015-06-27 @1333  	if (port->flags & UPF_FOURPORT) {
b6830f6df8914f Peter Hurley    2015-06-27  1334  		ICP = (port->iobase & 0xfe0) | 0x1f;
b6830f6df8914f Peter Hurley    2015-06-27  1335  		save_ICP = inb_p(ICP);
b6830f6df8914f Peter Hurley    2015-06-27  1336  		outb_p(0x80, ICP);
b6830f6df8914f Peter Hurley    2015-06-27  1337  		inb_p(ICP);
b6830f6df8914f Peter Hurley    2015-06-27  1338  	}
b6830f6df8914f Peter Hurley    2015-06-27  1339  
b6830f6df8914f Peter Hurley    2015-06-27  1340  	/* forget possible initially masked and pending IRQ */
b6830f6df8914f Peter Hurley    2015-06-27  1341  	probe_irq_off(probe_irq_on());
36fd95b17e9c1c Yegor Yefremov  2016-05-31  1342  	save_mcr = serial8250_in_MCR(up);
d0b309a5d3f464 John Ogness     2023-05-25  1343  	/* Synchronize UART_IER access against the console. */
e8f87d3c335702 Thomas Gleixner 2023-09-14  1344  	uart_port_lock_irq(port);
b6830f6df8914f Peter Hurley    2015-06-27  1345  	save_ier = serial_in(up, UART_IER);
e8f87d3c335702 Thomas Gleixner 2023-09-14  1346  	uart_port_unlock_irq(port);
36fd95b17e9c1c Yegor Yefremov  2016-05-31  1347  	serial8250_out_MCR(up, UART_MCR_OUT1 | UART_MCR_OUT2);
b6830f6df8914f Peter Hurley    2015-06-27  1348  
b6830f6df8914f Peter Hurley    2015-06-27  1349  	irqs = probe_irq_on();
36fd95b17e9c1c Yegor Yefremov  2016-05-31  1350  	serial8250_out_MCR(up, 0);
b6830f6df8914f Peter Hurley    2015-06-27  1351  	udelay(10);
b6830f6df8914f Peter Hurley    2015-06-27  1352  	if (port->flags & UPF_FOURPORT) {
36fd95b17e9c1c Yegor Yefremov  2016-05-31  1353  		serial8250_out_MCR(up, UART_MCR_DTR | UART_MCR_RTS);
b6830f6df8914f Peter Hurley    2015-06-27  1354  	} else {
36fd95b17e9c1c Yegor Yefremov  2016-05-31  1355  		serial8250_out_MCR(up,
b6830f6df8914f Peter Hurley    2015-06-27  1356  			UART_MCR_DTR | UART_MCR_RTS | UART_MCR_OUT2);
b6830f6df8914f Peter Hurley    2015-06-27  1357  	}
d0b309a5d3f464 John Ogness     2023-05-25  1358  	/* Synchronize UART_IER access against the console. */
e8f87d3c335702 Thomas Gleixner 2023-09-14  1359  	uart_port_lock_irq(port);
ef460db2a7c1df Ilpo Järvinen   2022-11-25  1360  	serial_out(up, UART_IER, UART_IER_ALL_INTR);
e8f87d3c335702 Thomas Gleixner 2023-09-14  1361  	uart_port_unlock_irq(port);
b6830f6df8914f Peter Hurley    2015-06-27  1362  	serial_in(up, UART_LSR);
b6830f6df8914f Peter Hurley    2015-06-27  1363  	serial_in(up, UART_RX);
b6830f6df8914f Peter Hurley    2015-06-27  1364  	serial_in(up, UART_IIR);
b6830f6df8914f Peter Hurley    2015-06-27  1365  	serial_in(up, UART_MSR);
b6830f6df8914f Peter Hurley    2015-06-27  1366  	serial_out(up, UART_TX, 0xFF);
b6830f6df8914f Peter Hurley    2015-06-27  1367  	udelay(20);
b6830f6df8914f Peter Hurley    2015-06-27  1368  	irq = probe_irq_off(irqs);
b6830f6df8914f Peter Hurley    2015-06-27  1369  
36fd95b17e9c1c Yegor Yefremov  2016-05-31  1370  	serial8250_out_MCR(up, save_mcr);
d0b309a5d3f464 John Ogness     2023-05-25  1371  	/* Synchronize UART_IER access against the console. */
e8f87d3c335702 Thomas Gleixner 2023-09-14  1372  	uart_port_lock_irq(port);
b6830f6df8914f Peter Hurley    2015-06-27  1373  	serial_out(up, UART_IER, save_ier);
e8f87d3c335702 Thomas Gleixner 2023-09-14  1374  	uart_port_unlock_irq(port);
b6830f6df8914f Peter Hurley    2015-06-27  1375  
b6830f6df8914f Peter Hurley    2015-06-27  1376  	if (port->flags & UPF_FOURPORT)
b6830f6df8914f Peter Hurley    2015-06-27  1377  		outb_p(save_ICP, ICP);
b6830f6df8914f Peter Hurley    2015-06-27  1378  
b6830f6df8914f Peter Hurley    2015-06-27  1379  	port->irq = (irq > 0) ? irq : 0;
b6830f6df8914f Peter Hurley    2015-06-27  1380  }
b6830f6df8914f Peter Hurley    2015-06-27  1381  

:::::: The code at line 1333 was first introduced by commit
:::::: b6830f6df8914faae9561bb245860c21af9b9e9b serial: 8250: Split base port operations from universal driver

:::::: TO: Peter Hurley <peter@hurleysoftware.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
