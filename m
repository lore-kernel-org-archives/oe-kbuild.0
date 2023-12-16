Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCACD13FEE
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Dec 2023 04:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YgJkaEFN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702702450; x=1734238450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d8P+esNjsHyhbPIqnJlMaxFapypqwWo/gYmfcKaRrbM=;
  b=YgJkaEFNLTB8jvsMtMecFm2DMfcs+UovmRoKrseOT3PEOIF8zTksL54I
   XZFRKbhnoUumxc2YnrusOi1xmzX5kJA2rbN9ndOaqLUciRQ6+CJacfsv1
   YeOBMQC3DHa0+LHmzL+JRzyJGUuIlHTcFSPofoWjE7owln7ovbWIR3OD/
   ksbTR5wtltrZierof3X26KKiEEsTDMMDrr9ZXM/Gwm4I6/Tk8NBo6zgQC
   glyAaCxwlk5rrBxVyU46ZCQfaUERovv/8266IDNuySI+1cM3fOXr3TJ5o
   uNJPZpufuyX34V4Y9wCa8jxoNUExfCuLkNtV0JBAGlom2qpGpq1GEhqqW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="2534581"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="2534581"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 20:54:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="898355542"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="898355542"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Dec 2023 20:54:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEMgc-0001Ae-1Y;
	Sat, 16 Dec 2023 04:54:03 +0000
Date: Sat, 16 Dec 2023 12:53:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1 tty-next 4/4] 8250: microchip: pci1xxxx: Add Burst
 mode transmission support in uart driver for reading from FIFO
Message-ID: <202312161205.f6EpLZln-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231215151123.41812-5-rengarajan.s@microchip.com>
References: <20231215151123.41812-5-rengarajan.s@microchip.com>
TO: Rengarajan S <rengarajan.s@microchip.com>
TO: kumaravel.thiagarajan@microchip.com
TO: tharunkumar.pasumarthi@microchip.com
TO: gregkh@linuxfoundation.org
TO: jirislaby@kernel.org
TO: keescook@chromium.org
TO: gustavoars@kernel.org
TO: linux-serial@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-hardening@vger.kernel.org
CC: unglinuxdriver@microchip.com

Hi Rengarajan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus linus/master v6.7-rc5 next-20231215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rengarajan-S/8250-microchip-pci1xxxx-Rearranging-the-structure-declarations/20231215-234606
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20231215151123.41812-5-rengarajan.s%40microchip.com
patch subject: [PATCH v1 tty-next 4/4] 8250: microchip: pci1xxxx: Add Burst mode transmission support in uart driver for reading from FIFO
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: i386-randconfig-141-20231216 (https://download.01.org/0day-ci/archive/20231216/202312161205.f6EpLZln-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312161205.f6EpLZln-lkp@intel.com/

smatch warnings:
drivers/tty/serial/8250/8250_pci1xxxx.c:395 pci1xxxx_process_write_data() warn: should this be 'valid_burst_count == -1'

vim +395 drivers/tty/serial/8250/8250_pci1xxxx.c

eea197a6b11b8b Rengarajan S 2023-12-15  350  
eeaa9176002041 Rengarajan S 2023-12-15  351  static void pci1xxxx_process_write_data(struct uart_port *port,
eeaa9176002041 Rengarajan S 2023-12-15  352  					struct circ_buf *xmit,
eeaa9176002041 Rengarajan S 2023-12-15  353  					int *data_empty_count,
eeaa9176002041 Rengarajan S 2023-12-15  354  					u32 *valid_byte_count)
eeaa9176002041 Rengarajan S 2023-12-15  355  {
eeaa9176002041 Rengarajan S 2023-12-15  356  	u32 valid_burst_count = *valid_byte_count / UART_BURST_SIZE;
eeaa9176002041 Rengarajan S 2023-12-15  357  
eeaa9176002041 Rengarajan S 2023-12-15  358  	/*
eeaa9176002041 Rengarajan S 2023-12-15  359  	 * Each transaction transfers data in DWORDs. If there are less than
eeaa9176002041 Rengarajan S 2023-12-15  360  	 * four remaining valid_byte_count to transfer or if the circular
eeaa9176002041 Rengarajan S 2023-12-15  361  	 * buffer has insufficient space for a DWORD, the data is transferred
eeaa9176002041 Rengarajan S 2023-12-15  362  	 * one byte at a time.
eeaa9176002041 Rengarajan S 2023-12-15  363  	 */
eeaa9176002041 Rengarajan S 2023-12-15  364  	while (valid_burst_count--) {
eeaa9176002041 Rengarajan S 2023-12-15  365  		if (*data_empty_count - UART_BURST_SIZE < 0)
eeaa9176002041 Rengarajan S 2023-12-15  366  			break;
eeaa9176002041 Rengarajan S 2023-12-15  367  		if (xmit->tail > (UART_XMIT_SIZE - UART_BURST_SIZE))
eeaa9176002041 Rengarajan S 2023-12-15  368  			break;
eeaa9176002041 Rengarajan S 2023-12-15  369  		writel(*(unsigned int *)&xmit->buf[xmit->tail],
eeaa9176002041 Rengarajan S 2023-12-15  370  		       port->membase + UART_TX_BURST_FIFO);
eeaa9176002041 Rengarajan S 2023-12-15  371  		*valid_byte_count -= UART_BURST_SIZE;
eeaa9176002041 Rengarajan S 2023-12-15  372  		*data_empty_count -= UART_BURST_SIZE;
eeaa9176002041 Rengarajan S 2023-12-15  373  		xmit->tail = (xmit->tail + UART_BURST_SIZE) &
eeaa9176002041 Rengarajan S 2023-12-15  374  			     (UART_XMIT_SIZE - 1);
eeaa9176002041 Rengarajan S 2023-12-15  375  	}
eeaa9176002041 Rengarajan S 2023-12-15  376  
eeaa9176002041 Rengarajan S 2023-12-15  377  	while (*valid_byte_count--) {
eeaa9176002041 Rengarajan S 2023-12-15  378  		if (*data_empty_count - UART_BYTE_SIZE < 0)
eeaa9176002041 Rengarajan S 2023-12-15  379  			break;
eeaa9176002041 Rengarajan S 2023-12-15  380  		writeb(xmit->buf[xmit->tail], port->membase +
eeaa9176002041 Rengarajan S 2023-12-15  381  		       UART_TX_BYTE_FIFO);
eeaa9176002041 Rengarajan S 2023-12-15  382  		*data_empty_count -= UART_BYTE_SIZE;
eeaa9176002041 Rengarajan S 2023-12-15  383  
eeaa9176002041 Rengarajan S 2023-12-15  384  		/*
eeaa9176002041 Rengarajan S 2023-12-15  385  		 * When the tail of the circular buffer is reached, the next
eeaa9176002041 Rengarajan S 2023-12-15  386  		 * byte is transferred to the beginning of the buffer.
eeaa9176002041 Rengarajan S 2023-12-15  387  		 */
eeaa9176002041 Rengarajan S 2023-12-15  388  		xmit->tail = (xmit->tail + UART_BYTE_SIZE) &
eeaa9176002041 Rengarajan S 2023-12-15  389  			     (UART_XMIT_SIZE - 1);
eeaa9176002041 Rengarajan S 2023-12-15  390  
eeaa9176002041 Rengarajan S 2023-12-15  391  		/*
eeaa9176002041 Rengarajan S 2023-12-15  392  		 * If there are any pending burst count, data is handled by
eeaa9176002041 Rengarajan S 2023-12-15  393  		 * transmitting DWORDs at a time.
eeaa9176002041 Rengarajan S 2023-12-15  394  		 */
eeaa9176002041 Rengarajan S 2023-12-15 @395  		if (valid_burst_count && (xmit->tail <
eeaa9176002041 Rengarajan S 2023-12-15  396  		   (UART_XMIT_SIZE - UART_BURST_SIZE)))
eeaa9176002041 Rengarajan S 2023-12-15  397  			break;
eeaa9176002041 Rengarajan S 2023-12-15  398  	}
eeaa9176002041 Rengarajan S 2023-12-15  399  }
eeaa9176002041 Rengarajan S 2023-12-15  400  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
