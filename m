Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFD51FE469
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Dec 2024 10:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733134034; cv=none; b=GGSkJjukpvyKNi7BuLGuJQ4p4dOGG2GxgobJYgF+DMFv+W2ULoIRmU+ddqnwKGSnJcn+j+hsL5hRqmAZVfmKCleaOrC19DAPQxmUEs9jn+5P1GfFM1iMvRyyyaOr8NRHtEhuIhAm+uGZGjQRZiMATp1SqsYgKEABXmAs7zpYchI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733134034; c=relaxed/simple;
	bh=o7amj8vFnvoRx1BqyvQvOvxiHq5JiyQGRzLI/K5A+Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ltHsuWJMwmmu/DA1coDsK46CICiyZvM0vtFHDfIwlvulYwx3iasJko7MmyLYy7pqvsDJNZk0ojAEpebtRxcx0FiHSP8L4NpMesBKo/xFdPU+TqwU98gn7pNcjotyJ2iH/Vx6gPuy3RkH4uAccVaMB0B6vtbzuYYhMsaVUYt86go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n0BvWaCL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0BvWaCL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733134032; x=1764670032;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=o7amj8vFnvoRx1BqyvQvOvxiHq5JiyQGRzLI/K5A+Yc=;
  b=n0BvWaCLBbGbyluGT3lL2Palilk3aXErVFfQQpTB0/R9uIUI3EQBzcsL
   PzeuuDi0ef49XEh/1l6V1sDqux6sbPneOecplTIEv5LaRbBmDl1v0m6fo
   vRs7/zzDkrH0cNVf8WeUHUxdITQuCpuvXpD4wYIAeJqBIzYtlakhuotA0
   PdTGUNwqPnNjEJOgc4QuVcCKONLsGOPXk2GFqKJ4JUdrnWorXlTs4sk/w
   jGAAis/BTTWAazsPcCGAqiOd4UslnsojaWH5D1uXZAgOC8b+jl6zRxsxf
   pVknWqbS0h4ZuMwtHNa+VR9ZL/c94Vf1t+1iJROG1b3j2HBSmJFQytbiz
   A==;
X-CSE-ConnectionGUID: IFyCSbNBRLm1s94hTWDNjg==
X-CSE-MsgGUID: 9taaIvqVSae5MUoQtfnROQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="43964821"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="43964821"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 02:07:11 -0800
X-CSE-ConnectionGUID: 1uX0GeBCRCWzkXD5/4qxYw==
X-CSE-MsgGUID: ZcXHkmVASTioJhqKMAQ11Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="93538579"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 02 Dec 2024 02:07:10 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI3Ke-0002IL-09;
	Mon, 02 Dec 2024 10:07:08 +0000
Date: Mon, 2 Dec 2024 18:06:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/tty/serial/8250/8250_fsl.c:96 fsl8250_handle_irq() warn:
 inconsistent returns 'flags'.
Message-ID: <202412021726.AnX78KqO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>
CC: John Ogness <john.ogness@linutronix.de>

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e70140ba0d2b1a30467d4af6bcfe761327b9ec95
commit: 448d65172f2b964ac10d1d9a33043e5607d2f70a serial: 8250_fsl: Use port lock wrappers
date:   1 year, 2 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 1 year, 2 months ago
config: hexagon-randconfig-r071-20241118 (https://download.01.org/0day-ci/archive/20241202/202412021726.AnX78KqO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412021726.AnX78KqO-lkp@intel.com/

smatch warnings:
drivers/tty/serial/8250/8250_fsl.c:96 fsl8250_handle_irq() warn: inconsistent returns 'flags'.

vim +/flags +96 drivers/tty/serial/8250/8250_fsl.c

11361610b00500 drivers/tty/serial/8250/8250_fsl.c kuldip dwivedi   2020-09-03  25  
9deaa53ac7fa37 drivers/tty/serial/8250_fsl.c      Paul Gortmaker   2011-12-04  26  int fsl8250_handle_irq(struct uart_port *port)
9deaa53ac7fa37 drivers/tty/serial/8250_fsl.c      Paul Gortmaker   2011-12-04  27  {
853a9ae29e978d drivers/tty/serial/8250/8250_fsl.c Johan Hovold     2021-07-14  28  	unsigned long flags;
f8ba5680a56be6 drivers/tty/serial/8250/8250_fsl.c Ilpo Järvinen    2022-06-24  29  	u16 lsr, orig_lsr;
9deaa53ac7fa37 drivers/tty/serial/8250_fsl.c      Paul Gortmaker   2011-12-04  30  	unsigned int iir;
b1261c86fe238c drivers/tty/serial/8250/8250_fsl.c Andy Shevchenko  2014-07-14  31  	struct uart_8250_port *up = up_to_u8250p(port);
9deaa53ac7fa37 drivers/tty/serial/8250_fsl.c      Paul Gortmaker   2011-12-04  32  
448d65172f2b96 drivers/tty/serial/8250/8250_fsl.c Thomas Gleixner  2023-09-14  33  	uart_port_lock_irqsave(&up->port, &flags);
9deaa53ac7fa37 drivers/tty/serial/8250_fsl.c      Paul Gortmaker   2011-12-04  34  
9deaa53ac7fa37 drivers/tty/serial/8250_fsl.c      Paul Gortmaker   2011-12-04  35  	iir = port->serial_in(port, UART_IIR);
9deaa53ac7fa37 drivers/tty/serial/8250_fsl.c      Paul Gortmaker   2011-12-04  36  	if (iir & UART_IIR_NO_INT) {
448d65172f2b96 drivers/tty/serial/8250/8250_fsl.c Thomas Gleixner  2023-09-14  37  		uart_port_unlock_irqrestore(&up->port, flags);
9deaa53ac7fa37 drivers/tty/serial/8250_fsl.c      Paul Gortmaker   2011-12-04  38  		return 0;
9deaa53ac7fa37 drivers/tty/serial/8250_fsl.c      Paul Gortmaker   2011-12-04  39  	}
9deaa53ac7fa37 drivers/tty/serial/8250_fsl.c      Paul Gortmaker   2011-12-04  40  
d2d4bd217ccd47 drivers/tty/serial/8250/8250_fsl.c Uwe Kleine-König 2023-05-24  41  	/*
d2d4bd217ccd47 drivers/tty/serial/8250/8250_fsl.c Uwe Kleine-König 2023-05-24  42  	 * For a single break the hardware reports LSR.BI for each character
d2d4bd217ccd47 drivers/tty/serial/8250/8250_fsl.c Uwe Kleine-König 2023-05-24  43  	 * time. This is described in the MPC8313E chip errata as "General17".
d2d4bd217ccd47 drivers/tty/serial/8250/8250_fsl.c Uwe Kleine-König 2023-05-24  44  	 * A typical break has a duration of 0.3s, with a 115200n8 configuration
d2d4bd217ccd47 drivers/tty/serial/8250/8250_fsl.c Uwe Kleine-König 2023-05-24  45  	 * that (theoretically) corresponds to ~3500 interrupts in these 0.3s.
d2d4bd217ccd47 drivers/tty/serial/8250/8250_fsl.c Uwe Kleine-König 2023-05-24  46  	 * In practise it's less (around 500) because of hardware
d2d4bd217ccd47 drivers/tty/serial/8250/8250_fsl.c Uwe Kleine-König 2023-05-24  47  	 * and software latencies. The workaround recommended by the vendor is
d2d4bd217ccd47 drivers/tty/serial/8250/8250_fsl.c Uwe Kleine-König 2023-05-24  48  	 * to read the RX register (to clear LSR.DR and thus prevent a FIFO
d2d4bd217ccd47 drivers/tty/serial/8250/8250_fsl.c Uwe Kleine-König 2023-05-24  49  	 * aging interrupt). To prevent the irq from retriggering LSR must not be
d2d4bd217ccd47 drivers/tty/serial/8250/8250_fsl.c Uwe Kleine-König 2023-05-24  50  	 * read. (This would clear LSR.BI, hardware would reassert the BI event
d2d4bd217ccd47 drivers/tty/serial/8250/8250_fsl.c Uwe Kleine-König 2023-05-24  51  	 * immediately and interrupt the CPU again. The hardware clears LSR.BI
d2d4bd217ccd47 drivers/tty/serial/8250/8250_fsl.c Uwe Kleine-König 2023-05-24  52  	 * when the next valid char is read.)
d2d4bd217ccd47 drivers/tty/serial/8250/8250_fsl.c Uwe Kleine-König 2023-05-24  53  	 */
9deaa53ac7fa37 drivers/tty/serial/8250_fsl.c      Paul Gortmaker   2011-12-04  54  	if (unlikely(up->lsr_saved_flags & UART_LSR_BI)) {
9deaa53ac7fa37 drivers/tty/serial/8250_fsl.c      Paul Gortmaker   2011-12-04  55  		up->lsr_saved_flags &= ~UART_LSR_BI;
9deaa53ac7fa37 drivers/tty/serial/8250_fsl.c      Paul Gortmaker   2011-12-04  56  		port->serial_in(port, UART_RX);
448d65172f2b96 drivers/tty/serial/8250/8250_fsl.c Thomas Gleixner  2023-09-14  57  		uart_port_unlock_irqrestore(&up->port, flags);
9deaa53ac7fa37 drivers/tty/serial/8250_fsl.c      Paul Gortmaker   2011-12-04  58  		return 1;
9deaa53ac7fa37 drivers/tty/serial/8250_fsl.c      Paul Gortmaker   2011-12-04  59  	}
9deaa53ac7fa37 drivers/tty/serial/8250_fsl.c      Paul Gortmaker   2011-12-04  60  
9deaa53ac7fa37 drivers/tty/serial/8250_fsl.c      Paul Gortmaker   2011-12-04  61  	lsr = orig_lsr = up->port.serial_in(&up->port, UART_LSR);
9deaa53ac7fa37 drivers/tty/serial/8250_fsl.c      Paul Gortmaker   2011-12-04  62  
6d7f677a2afa1c drivers/tty/serial/8250/8250_fsl.c Darwin Dingel    2018-12-10  63  	/* Process incoming characters first */
6d7f677a2afa1c drivers/tty/serial/8250/8250_fsl.c Darwin Dingel    2018-12-10  64  	if ((lsr & (UART_LSR_DR | UART_LSR_BI)) &&
6d7f677a2afa1c drivers/tty/serial/8250/8250_fsl.c Darwin Dingel    2018-12-10  65  	    (up->ier & (UART_IER_RLSI | UART_IER_RDI))) {
9deaa53ac7fa37 drivers/tty/serial/8250_fsl.c      Paul Gortmaker   2011-12-04  66  		lsr = serial8250_rx_chars(up, lsr);
6d7f677a2afa1c drivers/tty/serial/8250/8250_fsl.c Darwin Dingel    2018-12-10  67  	}
6d7f677a2afa1c drivers/tty/serial/8250/8250_fsl.c Darwin Dingel    2018-12-10  68  
6d7f677a2afa1c drivers/tty/serial/8250/8250_fsl.c Darwin Dingel    2018-12-10  69  	/* Stop processing interrupts on input overrun */
6d7f677a2afa1c drivers/tty/serial/8250/8250_fsl.c Darwin Dingel    2018-12-10  70  	if ((orig_lsr & UART_LSR_OE) && (up->overrun_backoff_time_ms > 0)) {
6d7f677a2afa1c drivers/tty/serial/8250/8250_fsl.c Darwin Dingel    2018-12-10  71  		unsigned long delay;
6d7f677a2afa1c drivers/tty/serial/8250/8250_fsl.c Darwin Dingel    2018-12-10  72  
6d7f677a2afa1c drivers/tty/serial/8250/8250_fsl.c Darwin Dingel    2018-12-10  73  		up->ier = port->serial_in(port, UART_IER);
6d7f677a2afa1c drivers/tty/serial/8250/8250_fsl.c Darwin Dingel    2018-12-10  74  		if (up->ier & (UART_IER_RLSI | UART_IER_RDI)) {
6d7f677a2afa1c drivers/tty/serial/8250/8250_fsl.c Darwin Dingel    2018-12-10  75  			port->ops->stop_rx(port);
6d7f677a2afa1c drivers/tty/serial/8250/8250_fsl.c Darwin Dingel    2018-12-10  76  		} else {
6d7f677a2afa1c drivers/tty/serial/8250/8250_fsl.c Darwin Dingel    2018-12-10  77  			/* Keep restarting the timer until
6d7f677a2afa1c drivers/tty/serial/8250/8250_fsl.c Darwin Dingel    2018-12-10  78  			 * the input overrun subsides.
6d7f677a2afa1c drivers/tty/serial/8250/8250_fsl.c Darwin Dingel    2018-12-10  79  			 */
6d7f677a2afa1c drivers/tty/serial/8250/8250_fsl.c Darwin Dingel    2018-12-10  80  			cancel_delayed_work(&up->overrun_backoff);
6d7f677a2afa1c drivers/tty/serial/8250/8250_fsl.c Darwin Dingel    2018-12-10  81  		}
6d7f677a2afa1c drivers/tty/serial/8250/8250_fsl.c Darwin Dingel    2018-12-10  82  
6d7f677a2afa1c drivers/tty/serial/8250/8250_fsl.c Darwin Dingel    2018-12-10  83  		delay = msecs_to_jiffies(up->overrun_backoff_time_ms);
6d7f677a2afa1c drivers/tty/serial/8250/8250_fsl.c Darwin Dingel    2018-12-10  84  		schedule_delayed_work(&up->overrun_backoff, delay);
6d7f677a2afa1c drivers/tty/serial/8250/8250_fsl.c Darwin Dingel    2018-12-10  85  	}
9deaa53ac7fa37 drivers/tty/serial/8250_fsl.c      Paul Gortmaker   2011-12-04  86  
9deaa53ac7fa37 drivers/tty/serial/8250_fsl.c      Paul Gortmaker   2011-12-04  87  	serial8250_modem_status(up);
9deaa53ac7fa37 drivers/tty/serial/8250_fsl.c      Paul Gortmaker   2011-12-04  88  
409cc4541ade01 drivers/tty/serial/8250/8250_fsl.c Andrij Abyzov    2020-09-28  89  	if ((lsr & UART_LSR_THRE) && (up->ier & UART_IER_THRI))
9deaa53ac7fa37 drivers/tty/serial/8250_fsl.c      Paul Gortmaker   2011-12-04  90  		serial8250_tx_chars(up);
9deaa53ac7fa37 drivers/tty/serial/8250_fsl.c      Paul Gortmaker   2011-12-04  91  
9d3aaceb73acad drivers/tty/serial/8250/8250_fsl.c Uwe Kleine-König 2022-07-04  92  	up->lsr_saved_flags |= orig_lsr & UART_LSR_BI;
75f4e830fa9c47 drivers/tty/serial/8250/8250_fsl.c Johan Hovold     2021-04-16  93  
853a9ae29e978d drivers/tty/serial/8250/8250_fsl.c Johan Hovold     2021-07-14  94  	uart_unlock_and_check_sysrq_irqrestore(&up->port, flags);
75f4e830fa9c47 drivers/tty/serial/8250/8250_fsl.c Johan Hovold     2021-04-16  95  
9deaa53ac7fa37 drivers/tty/serial/8250_fsl.c      Paul Gortmaker   2011-12-04 @96  	return 1;
9deaa53ac7fa37 drivers/tty/serial/8250_fsl.c      Paul Gortmaker   2011-12-04  97  }
bd63acf9e9a6b4 drivers/tty/serial/8250/8250_fsl.c Arnd Bergmann    2015-11-16  98  EXPORT_SYMBOL_GPL(fsl8250_handle_irq);
11361610b00500 drivers/tty/serial/8250/8250_fsl.c kuldip dwivedi   2020-09-03  99  

:::::: The code at line 96 was first introduced by commit
:::::: 9deaa53ac7fa373623123aa4f18828dd62292b1a serial: add irq handler for Freescale 16550 errata.

:::::: TO: Paul Gortmaker <paul.gortmaker@windriver.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
