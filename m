Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E511D23BD1B
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Jul 2026 00:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785458510; cv=none; b=FC55cZRFLXCY5sLOnWqaJvEwvkSEEkKn1iUaM3uSob6Rv17uHr6An/yMBFUblWMM6MwFl87AgY5k4KgIDmYY3Q6ileQLgyli+Qr/mLF8pGnLgpy/8CtMoGpbfldf6QRZlnI3xK/OS/rvipuMPmHqtidQqQsVKOEh8CNFVUYqck8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785458510; c=relaxed/simple;
	bh=dnTmmIbuyx9iLYze1gbPz5QQzoyW30Wh2wzF+kKHtSQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ccZauXUfRlO8aYzGAJXo+8OJGUNwTZXKoqxMbG9+lkBivsyijyJi11LCAf51KNVmpd4wF45tBQl9S15IeNHqdXWsF8lh6TVXa4BPybBNAAnplfXISWVDzH462Yu70Wn2x+Ej3hflpXZ/0AMIRi2zfKb3UIepcf8kQX2BH5ZgoAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kYNvGjVG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kYNvGjVG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785458508; x=1816994508;
  h=date:from:to:cc:subject:message-id;
  bh=dnTmmIbuyx9iLYze1gbPz5QQzoyW30Wh2wzF+kKHtSQ=;
  b=kYNvGjVG98le+cGe3OpJG0CXB8noY/AiLN+UBjOqeP0gZiUS1NtAGUG9
   z9/v1VwtkWImS4P/IVCirA98i7zLbpTPWRJEPlloFalhxpkKoWpPjJgeI
   wIW5I7afeZCgApOjakqy//BaydyJzD7Rz5E/44vnxOuYhQ7yDGq0sMEzr
   15KEky+56MG7tixg531e5Y/oGKGqj3gKGjpRE4N3KrRhBgSKhVDylhD4N
   ucCQ7hVj+nrfP/VGU2wXqrQB71snYKbvLh08igj0p+sVTe8/bCF8Gfkt/
   6xvoBGeU5rRg8TQuPZp0f9h9nZHf3tM9uVLj3KIJi/DdFf0Sn0SlnRzYl
   A==;
X-CSE-ConnectionGUID: v7SHNEPOQxyugtusxd9+qA==
X-CSE-MsgGUID: 98gG4RUnTD+OKvvNFF3Dfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86277408"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="86277408"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 17:41:48 -0700
X-CSE-ConnectionGUID: BktEyu+7Qe6vVJi5yA9bLg==
X-CSE-MsgGUID: YUeV/7UKQWmSfARu+rhhcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="257769766"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 30 Jul 2026 17:41:47 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpbJo-00000000hl0-49wC;
	Fri, 31 Jul 2026 00:41:44 +0000
Date: Fri, 31 Jul 2026 08:41:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/tty/serial/qcom_geni_serial.c:921:13: warning:
 'qcom_geni_serial_poll_rx_fifo_locked' defined but not used
Message-ID: <202607310805.sBlErav8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Bjorn-Andersson/serial-qcom-geni-Convert-console-to-nbcon/20260730-163336, commit: d6aed29e528f1999fdc9ff58387885e7eb0f5858"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Bjorn Andersson <andersson@kernel.org>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Bjorn-Andersson/serial-qcom-geni-Convert-console-to-nbcon/20260730-163336
head:   d6aed29e528f1999fdc9ff58387885e7eb0f5858
commit: d6aed29e528f1999fdc9ff58387885e7eb0f5858 serial: qcom-geni: Keep FIFO RX active during console TX
date:   16 hours ago
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: arm64-randconfig-003-20260731 (https://download.01.org/0day-ci/archive/20260731/202607310805.sBlErav8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607310805.sBlErav8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607310805.sBlErav8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/qcom_geni_serial.c:921:13: warning: 'qcom_geni_serial_poll_rx_fifo_locked' defined but not used [-Wunused-function]
     921 | static void qcom_geni_serial_poll_rx_fifo_locked(struct uart_port *uport)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/qcom_geni_serial_poll_rx_fifo_locked +921 drivers/tty/serial/qcom_geni_serial.c

c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  919  
d6aed29e528f19 Bjorn Andersson             2026-07-29  920  /* Caller holds the UART port lock. */
d6aed29e528f19 Bjorn Andersson             2026-07-29 @921  static void qcom_geni_serial_poll_rx_fifo_locked(struct uart_port *uport)
d6aed29e528f19 Bjorn Andersson             2026-07-29  922  {
d6aed29e528f19 Bjorn Andersson             2026-07-29  923  	struct qcom_geni_serial_port *port = to_dev_port(uport);
d6aed29e528f19 Bjorn Andersson             2026-07-29  924  	struct tty_port *tport = &uport->state->port;
d6aed29e528f19 Bjorn Andersson             2026-07-29  925  	u32 s_irq_status;
d6aed29e528f19 Bjorn Andersson             2026-07-29  926  	bool drop_rx = false;
d6aed29e528f19 Bjorn Andersson             2026-07-29  927  
d6aed29e528f19 Bjorn Andersson             2026-07-29  928  	s_irq_status = readl(uport->membase + SE_GENI_S_IRQ_STATUS);
d6aed29e528f19 Bjorn Andersson             2026-07-29  929  	writel(s_irq_status, uport->membase + SE_GENI_S_IRQ_CLEAR);
d6aed29e528f19 Bjorn Andersson             2026-07-29  930  
d6aed29e528f19 Bjorn Andersson             2026-07-29  931  	if (s_irq_status & S_RX_FIFO_WR_ERR_EN) {
d6aed29e528f19 Bjorn Andersson             2026-07-29  932  		uport->icount.overrun++;
d6aed29e528f19 Bjorn Andersson             2026-07-29  933  		tty_insert_flip_char(tport, 0, TTY_OVERRUN);
d6aed29e528f19 Bjorn Andersson             2026-07-29  934  	}
d6aed29e528f19 Bjorn Andersson             2026-07-29  935  
d6aed29e528f19 Bjorn Andersson             2026-07-29  936  	if (s_irq_status & (S_GP_IRQ_0_EN | S_GP_IRQ_1_EN)) {
d6aed29e528f19 Bjorn Andersson             2026-07-29  937  		if (s_irq_status & S_GP_IRQ_0_EN)
d6aed29e528f19 Bjorn Andersson             2026-07-29  938  			uport->icount.parity++;
d6aed29e528f19 Bjorn Andersson             2026-07-29  939  		drop_rx = true;
d6aed29e528f19 Bjorn Andersson             2026-07-29  940  	} else if (s_irq_status & (S_GP_IRQ_2_EN | S_GP_IRQ_3_EN)) {
d6aed29e528f19 Bjorn Andersson             2026-07-29  941  		uport->icount.brk++;
d6aed29e528f19 Bjorn Andersson             2026-07-29  942  		port->brk = true;
d6aed29e528f19 Bjorn Andersson             2026-07-29  943  	}
d6aed29e528f19 Bjorn Andersson             2026-07-29  944  
d6aed29e528f19 Bjorn Andersson             2026-07-29  945  	qcom_geni_serial_handle_rx_fifo(uport, drop_rx);
d6aed29e528f19 Bjorn Andersson             2026-07-29  946  }
d6aed29e528f19 Bjorn Andersson             2026-07-29  947  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
