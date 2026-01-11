Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8FE2AD20
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jan 2026 07:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768114879; cv=none; b=WeTlVh2RJgNJtZHBCYUEk4z9EMLrs17xl+e3jaA7wES1WLfW8+pxYIDUXp7LbRKDz5MZeUairMG3moZnKrrLC4o5EYdUw32m/eF3a03f1a0S0H99jfecjwi4qFYcpf8lHLyu42Sa2+ZEv9xkEt2BBZDu7qlbzYnEvl2Gsqk3t68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768114879; c=relaxed/simple;
	bh=ktEtuFxGDnH+OGEX/nk3tfQeuOjXHzENxl/ZmzPaqz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AbVqpDZoJwe6m00UQgVgqCJq0Wddlkl8VPI3itdvCAQr72raQuwE2Plfo16GwX15/hUBv/O07Lo46gA4kQLWu/o3G5V68kXd820xA2NpZS4HAMynU9r4IbzsmvaXG0HWD9qgkIHdBFHQ7PTY5JSRpPKDraMw7apkt28J0u2CTTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JfcdX9he; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JfcdX9he"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768114878; x=1799650878;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ktEtuFxGDnH+OGEX/nk3tfQeuOjXHzENxl/ZmzPaqz0=;
  b=JfcdX9heXxU3G4QtSzD/Sxiu8PiO9nFrgUZ2mF9ZgVdJuZ9L/14budJv
   AXYh7HGsN/r6zeBfxNglBghy4vFmuQDHcG/oZGpcRrUQhQ6SrmuiQWiln
   OiOk0hmev5O4Rv3BXNx9IK8n8Mt+67s4Nf0kqqP/m2sKEQTxp53eAocxp
   nCefAlt8QWbsJvTxGVw3Zq0/bCOT1kg+xbO1oIV8EQy0cuj99VK8EpBDO
   m1GEMncBmFBWtFMmz2++fUSsK77Rno1J/99F5yMNJ3vKuaTllHA5TinaP
   Z0SDITIzKlAfnxyRZgLH8ViAawEFHIS8RkMttfXvQ3fmd+5cJQu3fIybJ
   A==;
X-CSE-ConnectionGUID: x+15l4JwRoOo2nlQDggMXA==
X-CSE-MsgGUID: Rvb0ZkLLTpKQ3Sq59vJ14Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="69162788"
X-IronPort-AV: E=Sophos;i="6.21,218,1763452800"; 
   d="scan'208";a="69162788"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 23:01:17 -0800
X-CSE-ConnectionGUID: HDCqu4wnTSSZ3vZ7Ho8yXw==
X-CSE-MsgGUID: iJoXroECTXGfWDRd7OHpZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,218,1763452800"; 
   d="scan'208";a="241327956"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Jan 2026 23:01:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vepRp-000000009iy-1JvV;
	Sun, 11 Jan 2026 07:01:13 +0000
Date: Sun, 11 Jan 2026 15:01:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:locking/core 27/43] drivers/tty/serial/meson_uart.c:573
 meson_serial_port_write() error: uninitialized symbol 'flags'.
Message-ID: <202601111426.9u8mJ17A-lkp@intel.com>
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
commit: e4588c25c9d122b5847b88e18b184404b6959160 [27/43] compiler-context-a=
nalysis: Remove __cond_lock() function-like helper
:::::: branch date: 3 days ago
:::::: commit date: 6 days ago
config: riscv-randconfig-r071-20260111 (https://download.01.org/0day-ci/arc=
hive/20260111/202601111426.9u8mJ17A-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601111426.9u8mJ17A-lkp@intel.com/

smatch warnings:
drivers/tty/serial/meson_uart.c:573 meson_serial_port_write() error: uninit=
ialized symbol 'flags'.

vim +/flags +573 drivers/tty/serial/meson_uart.c

ff7693d079e58f Carlo Caione              2014-08-17  552 =20
736d553886a722 Andreas F=C3=A4rber            2016-03-06  553  static void =
meson_serial_port_write(struct uart_port *port, const char *s,
ff7693d079e58f Carlo Caione              2014-08-17  554  				    u_int cou=
nt)
ff7693d079e58f Carlo Caione              2014-08-17  555  {
ff7693d079e58f Carlo Caione              2014-08-17  556  	unsigned long fl=
ags;
fb793b952a330e Sebastian Andrzej Siewior 2024-03-01  557  	int locked =3D 1;
2561f068d91bbb Ben Dooks                 2015-11-18  558  	u32 val, tmp;
ff7693d079e58f Carlo Caione              2014-08-17  559 =20
fb793b952a330e Sebastian Andrzej Siewior 2024-03-01  560  	if (oops_in_prog=
ress)
fb793b952a330e Sebastian Andrzej Siewior 2024-03-01  561  		locked =3D uart=
_port_trylock_irqsave(port, &flags);
fb793b952a330e Sebastian Andrzej Siewior 2024-03-01  562  	else
fb793b952a330e Sebastian Andrzej Siewior 2024-03-01  563  		uart_port_lock_=
irqsave(port, &flags);
ff7693d079e58f Carlo Caione              2014-08-17  564 =20
41788f054920d5 Ben Dooks                 2015-11-18  565  	val =3D readl(po=
rt->membase + AML_UART_CONTROL);
2561f068d91bbb Ben Dooks                 2015-11-18  566  	tmp =3D val & ~(=
AML_UART_TX_INT_EN | AML_UART_RX_INT_EN);
2561f068d91bbb Ben Dooks                 2015-11-18  567  	writel(tmp, port=
->membase + AML_UART_CONTROL);
41788f054920d5 Ben Dooks                 2015-11-18  568 =20
ff7693d079e58f Carlo Caione              2014-08-17  569  	uart_console_wri=
te(port, s, count, meson_console_putchar);
2561f068d91bbb Ben Dooks                 2015-11-18  570  	writel(val, port=
->membase + AML_UART_CONTROL);
ff7693d079e58f Carlo Caione              2014-08-17  571 =20
ff7693d079e58f Carlo Caione              2014-08-17  572  	if (locked)
fb793b952a330e Sebastian Andrzej Siewior 2024-03-01 @573  		uart_port_unloc=
k_irqrestore(port, flags);
ff7693d079e58f Carlo Caione              2014-08-17  574  }
ff7693d079e58f Carlo Caione              2014-08-17  575 =20

:::::: The code at line 573 was first introduced by commit
:::::: fb793b952a330e6c87aec98aeb300aaa5c2ac960 serial: meson: Use uart_pre=
pare_sysrq_char().

:::::: TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
