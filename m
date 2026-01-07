Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FD92D8379
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Jan 2026 19:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767813857; cv=none; b=HiAkLxfjRsLxKPlRYPGOJ/Us0ZHoztzQBKvE6D9c2bB9Blm/TjF/0jvpRXaXxH8DOhuqGSE9dzqW05hgQ73stOi7hIdkMP7qGK8PN+fESE5FWJ15j+YpzlTzpZW7JV1m83AKwc06gua/Bpm6K9k2+/4McwNFltbh83Ly49IqVv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767813857; c=relaxed/simple;
	bh=C73kJgK+R+DOnB4An0mcv3vU4Dn0UxZEWiPRouZsctQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QdilZSRIDX4N9TMfgn2E8ZR6cTmuqSzL55EZpZHSmvLxap0KOGucsz40hBPwyyg30zJ4Vljqomgk3E/sV1q9zW6G4Tm4J4s7BMuG4LywCYXbk7Xv7h9PEeRcdUmbM5ebIuGqqvieyqmPavyfh/Ur3oBv2qLQdXZNnOHzzDdFjhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQ/5q4cP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQ/5q4cP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767813856; x=1799349856;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=C73kJgK+R+DOnB4An0mcv3vU4Dn0UxZEWiPRouZsctQ=;
  b=HQ/5q4cPW765ALx0HOD9c7RR9KDd5Xb2GuJtzfjMRJ3p0qoKAVPriq1r
   8yiajv2zYTk0uxbX7eJj++aL6S6fl5J+4d6fK7SNWOdiOaolvCJ71oRUr
   k0EnpKs1d3rCS5K0aE9SR5KbZMuAdx7KrvRnnX6bRjaoNTwD18vcH7Tt5
   FRVw1HDGOQFGzWPViZGHGxRII7fUAtw1MGUQ8QpXldY92nFaFW9bwCVuf
   Xr1sS9j+Cpk3qS0QsIqW6XIEeg+L6csF3ETS1yQd3E5kUIKeo/TOiDk+Y
   T8popXjuG+s6aNzHT+e9Cr2ucYOGz/7eRy8aKpS4ChYNL2Tohh/heTORR
   g==;
X-CSE-ConnectionGUID: 1+Pb3oFtT0WOINSuVhgjCw==
X-CSE-MsgGUID: 8j50yy5nQROsOPmt8JPYVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="73047062"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="73047062"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 11:24:15 -0800
X-CSE-ConnectionGUID: UQqcDzioR3+hHU/1YmrvBQ==
X-CSE-MsgGUID: tNvjXLQtQv2KuggEDFBn+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="202205980"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Jan 2026 11:24:14 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdZ8d-0000000046K-1ayk;
	Wed, 07 Jan 2026 19:24:11 +0000
Date: Thu, 08 Jan 2026 03:23:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:locking/core 27/40]
 drivers/tty/serial/msm_serial.c:1671 __msm_console_write() error:
 uninitialized symbol 'flags'.
Message-ID: <202601080344.K8Oy5CtX-lkp@intel.com>
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
head:   c10d860e0baae0853773dc90a94b26adc5687380
commit: e4588c25c9d122b5847b88e18b184404b6959160 [27/40] compiler-context-a=
nalysis: Remove __cond_lock() function-like helper
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-r073-20260107 (https://download.01.org/0day-ci/=
archive/20260108/202601080344.K8Oy5CtX-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601080344.K8Oy5CtX-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/msm_serial.c:1671 __msm_console_write() error: uninitial=
ized symbol 'flags'.
drivers/tty/serial/samsung_tty.c:2288 s3c24xx_serial_console_write() error:=
 uninitialized symbol 'flags'.
lib/test_context-analysis.c:125 test_spinlock_trylock_extra() error: uninit=
ialized symbol 'flags'.

Old smatch warnings:
lib/test_context-analysis.c:101 test_raw_spinlock_trylock_extra() warn: mix=
ing irq and irqsave
include/linux/spinlock.h:543 class_raw_spinlock_try_constructor() warn: pas=
sing zero to 'ERR_PTR'
lib/test_context-analysis.c:125 test_spinlock_trylock_extra() warn: mixing =
irq and irqsave
include/linux/spinlock.h:591 class_spinlock_try_constructor() warn: passing=
 zero to 'ERR_PTR'
include/linux/mutex.h:255 class_mutex_try_constructor() warn: passing zero =
to 'ERR_PTR'
include/linux/rwsem.h:262 class_rwsem_read_try_constructor() warn: passing =
zero to 'ERR_PTR'
include/linux/rwsem.h:273 class_rwsem_write_try_constructor() warn: passing=
 zero to 'ERR_PTR'

vim +/flags +1671 drivers/tty/serial/msm_serial.c

04896a77a97b87 drivers/serial/msm_serial.c     Robert Love               20=
09-06-22  1606 =20
04896a77a97b87 drivers/serial/msm_serial.c     Robert Love               20=
09-06-22  1607  #ifdef CONFIG_SERIAL_MSM_CONSOLE
0efe7296340973 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
14-09-15  1608  static void __msm_console_write(struct uart_port *port, con=
st char *s,
0efe7296340973 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
14-09-15  1609  				unsigned int count, bool is_uartdm)
04896a77a97b87 drivers/serial/msm_serial.c     Robert Love               20=
09-06-22  1610  {
aabdbb1b7a5819 drivers/tty/serial/msm_serial.c John Ogness               20=
22-05-06  1611  	unsigned long flags;
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1612  	int i;
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1613  	int num_newlines =3D 0;
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1614  	bool replaced =3D false;
68252424a7c757 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
14-06-30  1615  	void __iomem *tf;
0e4f7f920a5c6b drivers/tty/serial/msm_serial.c Leo Yan                   20=
19-11-27  1616  	int locked =3D 1;
04896a77a97b87 drivers/serial/msm_serial.c     Robert Love               20=
09-06-22  1617 =20
0efe7296340973 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
14-09-15  1618  	if (is_uartdm)
68252424a7c757 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
14-06-30  1619  		tf =3D port->membase + UARTDM_TF;
68252424a7c757 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
14-06-30  1620  	else
fddbab7b40b34d drivers/tty/serial/msm_serial.c Ilpo J=C3=A4rvinen          =
   2022-06-24  1621  		tf =3D port->membase + MSM_UART_TF;
68252424a7c757 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
14-06-30  1622 =20
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1623  	/* Account for newlines that will get a carriage return ad=
ded */
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1624  	for (i =3D 0; i < count; i++)
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1625  		if (s[i] =3D=3D '\n')
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1626  			num_newlines++;
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1627  	count +=3D num_newlines;
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1628 =20
4e5788c0993c0c drivers/tty/serial/msm_serial.c Sebastian Andrzej Siewior 20=
24-03-01  1629  	if (oops_in_progress)
4e5788c0993c0c drivers/tty/serial/msm_serial.c Sebastian Andrzej Siewior 20=
24-03-01  1630  		locked =3D uart_port_trylock_irqsave(port, &flags);
0e4f7f920a5c6b drivers/tty/serial/msm_serial.c Leo Yan                   20=
19-11-27  1631  	else
4e5788c0993c0c drivers/tty/serial/msm_serial.c Sebastian Andrzej Siewior 20=
24-03-01  1632  		uart_port_lock_irqsave(port, &flags);
0e4f7f920a5c6b drivers/tty/serial/msm_serial.c Leo Yan                   20=
19-11-27  1633 =20
0efe7296340973 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
14-09-15  1634  	if (is_uartdm)
558abdb05fe0c7 drivers/tty/serial/msm_serial.c Ivan T. Ivanov            20=
15-09-30  1635  		msm_reset_dm_count(port, count);
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1636 =20
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1637  	i =3D 0;
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1638  	while (i < count) {
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1639  		int j;
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1640  		unsigned int num_chars;
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1641  		char buf[4] =3D { 0 };
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1642 =20
0efe7296340973 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
14-09-15  1643  		if (is_uartdm)
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1644  			num_chars =3D min(count - i, (unsigned int)sizeof(buf));
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1645  		else
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1646  			num_chars =3D 1;
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1647 =20
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1648  		for (j =3D 0; j < num_chars; j++) {
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1649  			char c =3D *s;
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1650 =20
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1651  			if (c =3D=3D '\n' && !replaced) {
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1652  				buf[j] =3D '\r';
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1653  				j++;
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1654  				replaced =3D true;
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1655  			}
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1656  			if (j < num_chars) {
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1657  				buf[j] =3D c;
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1658  				s++;
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1659  				replaced =3D false;
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1660  			}
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1661  		}
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1662 =20
fddbab7b40b34d drivers/tty/serial/msm_serial.c Ilpo J=C3=A4rvinen          =
   2022-06-24  1663  		while (!(msm_read(port, MSM_UART_SR) & MSM_UART_SR_T=
X_READY))
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1664  			cpu_relax();
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1665 =20
68252424a7c757 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
14-06-30  1666  		iowrite32_rep(tf, buf, 1);
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1667  		i +=3D num_chars;
a3957e80eb5605 drivers/tty/serial/msm_serial.c Stephen Boyd              20=
13-08-20  1668  	}
0e4f7f920a5c6b drivers/tty/serial/msm_serial.c Leo Yan                   20=
19-11-27  1669 =20
0e4f7f920a5c6b drivers/tty/serial/msm_serial.c Leo Yan                   20=
19-11-27  1670  	if (locked)
4e5788c0993c0c drivers/tty/serial/msm_serial.c Sebastian Andrzej Siewior 20=
24-03-01 @1671  		uart_port_unlock_irqrestore(port, flags);
04896a77a97b87 drivers/serial/msm_serial.c     Robert Love               20=
09-06-22  1672  }
04896a77a97b87 drivers/serial/msm_serial.c     Robert Love               20=
09-06-22  1673 =20

:::::: The code at line 1671 was first introduced by commit
:::::: 4e5788c0993c0c83c3d91c090cfb6ff70f99b427 serial: msm: Use uart_prepa=
re_sysrq_char().

:::::: TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
