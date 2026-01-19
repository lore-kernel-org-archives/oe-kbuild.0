Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBB321FF47
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 20:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768854740; cv=none; b=Fw+yl9c6Hpw685/NyXz7UGTtTVwQHVbg79Cedc4k1Pz4d/v8XRHoE5PB+6H3l7eEsdrdJztdQJBkoYH4wMvuSK+SLz9QqJ51td3fLn4CBhjn3GFhas3qqD2GUPWTo3UVHU2HWs/BbMD6vJf6bcVFfGa7lwq1httKJf7H42r99vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768854740; c=relaxed/simple;
	bh=IlJoB5cfhOv7zeKpLbdN3dEkBQ7d9kUUxaDYt6vNZgM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rjo6XMVIiviF/7nbZvl+QgfXRM12Puer7PvCXqisqRgyk8/kMWeJGx1wUPSsNlRWy2/VOuj4adhXYT0OM72xmbJg+r/kkmSf3D77NJN8n2+TEe0hNhomMj1WfMGzBVphoq6iDrd1rZIBRIVJd0xnl5eb3Lv/PVdiWZmVXrR8S50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JW8bBj1G; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JW8bBj1G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768854739; x=1800390739;
  h=date:from:to:cc:subject:message-id;
  bh=IlJoB5cfhOv7zeKpLbdN3dEkBQ7d9kUUxaDYt6vNZgM=;
  b=JW8bBj1GspK7VACQCRegl8ZB5u8rQr/BGUJn0LjtI4VDbleCSJ//Yxgs
   qB+EHgGyGKb4UMyBhMQLfRX95jsBqSDct+1029ngC+cE8X0dMW2gZEoXC
   jkp+ZVa/GavNdcpWmYDlI6HUk5vAlCyMqKCgIOuygaMFdoG5azsRnPuWN
   GwHxfbi+Rs45F63i3kYs77+/rcY2Rq2vRVhuW8du6seRnPpIibE82OXvY
   qvucZSBNJ+JNEGoHpxbpUyr8hfATtN+yLjPdP2FiQE6FDrhwLhBkH/hdt
   C8AHaHaXUtvMytR8gE3GWJ39W4RWzS5EwhnfPyooHQw2ObF9E7T8vPe/4
   Q==;
X-CSE-ConnectionGUID: WWw0PgbCTYmETIwGDONM5A==
X-CSE-MsgGUID: pyNLys/IQwmi2kIMXggY7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="95539196"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="95539196"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 12:32:16 -0800
X-CSE-ConnectionGUID: NEjRhQj+QhipF9Xk9cQHwA==
X-CSE-MsgGUID: 0rjAo13XQtyRs+GwgTUt5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="228877530"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jan 2026 12:32:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhvv3-00000000OHj-0M8j;
	Mon, 19 Jan 2026 20:32:13 +0000
Date: Tue, 20 Jan 2026 04:31:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:ctx-analysis/init-guards 8/42]
 drivers/tty/serial/qcom_geni_serial.c:572 qcom_geni_serial_console_write()
 error: uninitialized symbol 'flags'.
Message-ID: <202601200453.g2ThuUH4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: elver@google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git ctx-analysis/init-guards
head:   d1a893446d587e98e560450b7adf307583f6a14c
commit: b1f3063c80eab86335a76e06a8d3671640c38800 [8/42] locking/rwlock, spinlock: Support Clang's context analysis
:::::: branch date: 11 hours ago
:::::: commit date: 4 weeks ago
config: nios2-randconfig-r072-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200453.g2ThuUH4-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601200453.g2ThuUH4-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/qcom_geni_serial.c:572 qcom_geni_serial_console_write() error: uninitialized symbol 'flags'.

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.

vim +/flags +572 drivers/tty/serial/qcom_geni_serial.c

c4f528795d1add8 Karthikeyan Ramasubramanian 2018-03-14  529  
c4f528795d1add8 Karthikeyan Ramasubramanian 2018-03-14  530  static void qcom_geni_serial_console_write(struct console *co, const char *s,
c4f528795d1add8 Karthikeyan Ramasubramanian 2018-03-14  531  			      unsigned int count)
c4f528795d1add8 Karthikeyan Ramasubramanian 2018-03-14  532  {
c4f528795d1add8 Karthikeyan Ramasubramanian 2018-03-14  533  	struct uart_port *uport;
c4f528795d1add8 Karthikeyan Ramasubramanian 2018-03-14  534  	struct qcom_geni_serial_port *port;
6f3c3cafb115c72 Johan Hovold                2024-09-06  535  	u32 m_irq_en, s_irq_en;
c4f528795d1add8 Karthikeyan Ramasubramanian 2018-03-14  536  	bool locked = true;
c4f528795d1add8 Karthikeyan Ramasubramanian 2018-03-14  537  	unsigned long flags;
c4f528795d1add8 Karthikeyan Ramasubramanian 2018-03-14  538  
c4f528795d1add8 Karthikeyan Ramasubramanian 2018-03-14  539  	WARN_ON(co->index < 0 || co->index >= GENI_UART_CONS_PORTS);
c4f528795d1add8 Karthikeyan Ramasubramanian 2018-03-14  540  
c3e7966c60745f8 Zong Jiang                  2025-08-12  541  	port = get_port_from_line(co->index, true, NULL);
c4f528795d1add8 Karthikeyan Ramasubramanian 2018-03-14  542  	if (IS_ERR(port))
c4f528795d1add8 Karthikeyan Ramasubramanian 2018-03-14  543  		return;
c4f528795d1add8 Karthikeyan Ramasubramanian 2018-03-14  544  
c4f528795d1add8 Karthikeyan Ramasubramanian 2018-03-14  545  	uport = &port->uport;
c4f528795d1add8 Karthikeyan Ramasubramanian 2018-03-14  546  	if (oops_in_progress)
b8ba915d960d03b Thomas Gleixner             2023-09-14  547  		locked = uart_port_trylock_irqsave(uport, &flags);
c4f528795d1add8 Karthikeyan Ramasubramanian 2018-03-14  548  	else
b8ba915d960d03b Thomas Gleixner             2023-09-14  549  		uart_port_lock_irqsave(uport, &flags);
c4f528795d1add8 Karthikeyan Ramasubramanian 2018-03-14  550  
6f3c3cafb115c72 Johan Hovold                2024-09-06  551  	m_irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
6f3c3cafb115c72 Johan Hovold                2024-09-06  552  	s_irq_en = readl(uport->membase + SE_GENI_S_IRQ_EN);
6f3c3cafb115c72 Johan Hovold                2024-09-06  553  	writel(0, uport->membase + SE_GENI_M_IRQ_EN);
6f3c3cafb115c72 Johan Hovold                2024-09-06  554  	writel(0, uport->membase + SE_GENI_S_IRQ_EN);
6f3c3cafb115c72 Johan Hovold                2024-09-06  555  
cc4a0e5754a16bb Johan Hovold                2024-09-06  556  	if (qcom_geni_serial_main_active(uport)) {
cc4a0e5754a16bb Johan Hovold                2024-09-06  557  		/* Wait for completion or drain FIFO */
cc4a0e5754a16bb Johan Hovold                2024-09-06  558  		if (!locked || port->tx_remaining == 0)
a1fee899e5bed45 Ryan Case                   2018-11-29  559  			qcom_geni_serial_poll_tx_done(uport);
cc4a0e5754a16bb Johan Hovold                2024-09-06  560  		else
cc4a0e5754a16bb Johan Hovold                2024-09-06  561  			qcom_geni_serial_drain_fifo(uport);
cc4a0e5754a16bb Johan Hovold                2024-09-06  562  
cc4a0e5754a16bb Johan Hovold                2024-09-06  563  		qcom_geni_serial_cancel_tx_cmd(uport);
c4f528795d1add8 Karthikeyan Ramasubramanian 2018-03-14  564  	}
c4f528795d1add8 Karthikeyan Ramasubramanian 2018-03-14  565  
c4f528795d1add8 Karthikeyan Ramasubramanian 2018-03-14  566  	__qcom_geni_serial_console_write(uport, s, count);
a1fee899e5bed45 Ryan Case                   2018-11-29  567  
6f3c3cafb115c72 Johan Hovold                2024-09-06  568  	writel(m_irq_en, uport->membase + SE_GENI_M_IRQ_EN);
6f3c3cafb115c72 Johan Hovold                2024-09-06  569  	writel(s_irq_en, uport->membase + SE_GENI_S_IRQ_EN);
6f3c3cafb115c72 Johan Hovold                2024-09-06  570  
cc4a0e5754a16bb Johan Hovold                2024-09-06  571  	if (locked)
b8ba915d960d03b Thomas Gleixner             2023-09-14 @572  		uart_port_unlock_irqrestore(uport, flags);
c4f528795d1add8 Karthikeyan Ramasubramanian 2018-03-14  573  }
c4f528795d1add8 Karthikeyan Ramasubramanian 2018-03-14  574  

:::::: The code at line 572 was first introduced by commit
:::::: b8ba915d960d03bd7e24eab80f0820bdd19203ec serial: qcom-geni: Use port lock wrappers

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
