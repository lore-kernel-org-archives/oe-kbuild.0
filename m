Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C122419C
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Mar 2023 10:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678012286; x=1709548286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c//rI7yMde1jCATg4S9700j/uWdoCjwHFYsUjAr/06Q=;
  b=nHmNcJuMEM0EBbpD3F5f/wnY/DMfx3ntcrgoFNAjyfiDEulCad8rIxy8
   Xv43QWVVC7ju0xJBXCGE7/QdYPCWCQ5m2rlOGpHQbc2wgVwqXbWfWXNrA
   gyF1Gz1hgQPFqbtOlSeTcxFaeFIt4N0WnBba2zyji0aOKb7U/TWam2Avz
   NucMbSkDaTwd22li99soY1lfFOngAAe40cinhx99zUrWqZ1tLo7pNyFaO
   cMpjbwP3ka/bZbTWAcTfZn+ymtSdtqP6gPJyito6UJPmzECWeU0yBc/rG
   cvtnF/+s8Jy/aiDjZsGLlwDD9W3EZ1zmreG/beYdE5E9WSnVlnbCxbrJX
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="315021487"
X-IronPort-AV: E=Sophos;i="5.98,235,1673942400"; 
   d="scan'208";a="315021487"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 02:31:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="921586192"
X-IronPort-AV: E=Sophos;i="5.98,235,1673942400"; 
   d="scan'208";a="921586192"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 05 Mar 2023 02:31:22 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYleD-0002fq-0x;
	Sun, 05 Mar 2023 10:31:21 +0000
Date: Sun, 5 Mar 2023 18:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jirislaby:devel 39/49] drivers/tty/serial/serial_core.c:3374
 uart_try_toggle_sysrq() warn: impossible condition '(++port->sysrq_seq <
 sysrq_toggle_seq_len) => (0-255 < 0)'
Message-ID: <202303051852.p2Z4hUJC-lkp@intel.com>
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
TO: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   2685d89e23c016db32c529bfb3c18e74ad80d3b8
commit: 0bb4ec444fa314c2019d5853a3869ec43a3a66fd [39/49] serial: make strlen of sysrq_toggle_seq[] a global constant
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230305/202303051852.p2Z4hUJC-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303051852.p2Z4hUJC-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/serial_core.c:3374 uart_try_toggle_sysrq() warn: impossible condition '(++port->sysrq_seq < sysrq_toggle_seq_len) => (0-255 < 0)'

Old smatch warnings:
drivers/tty/serial/serial_core.c:328 uart_shutdown() error: uninitialized symbol 'flags'.
drivers/tty/serial/serial_core.c:2925 iomem_base_show() warn: argument 3 to %lX specifier is cast from pointer

vim +3374 drivers/tty/serial/serial_core.c

68af43173d3fce Dmitry Safonov    2020-03-02  3351  
68af43173d3fce Dmitry Safonov    2020-03-02  3352  /**
68af43173d3fce Dmitry Safonov    2020-03-02  3353   * uart_try_toggle_sysrq - Enables SysRq from serial line
68af43173d3fce Dmitry Safonov    2020-03-02  3354   * @port: uart_port structure where char(s) after BREAK met
68af43173d3fce Dmitry Safonov    2020-03-02  3355   * @ch: new character in the sequence after received BREAK
68af43173d3fce Dmitry Safonov    2020-03-02  3356   *
68af43173d3fce Dmitry Safonov    2020-03-02  3357   * Enables magic SysRq when the required sequence is met on port
68af43173d3fce Dmitry Safonov    2020-03-02  3358   * (see CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE).
68af43173d3fce Dmitry Safonov    2020-03-02  3359   *
987233b342b950 Jiri Slaby        2022-07-28  3360   * Returns: %false if @ch is out of enabling sequence and should be
987233b342b950 Jiri Slaby        2022-07-28  3361   * handled some other way, %true if @ch was consumed.
68af43173d3fce Dmitry Safonov    2020-03-02  3362   */
b88d6816c63937 Jiri Slaby (SUSE  2022-11-23  3363) bool uart_try_toggle_sysrq(struct uart_port *port, u8 ch)
68af43173d3fce Dmitry Safonov    2020-03-02  3364  {
2ce5eace42b859 Andy Shevchenko   2020-03-10  3365  	if (!sysrq_toggle_seq_len)
68af43173d3fce Dmitry Safonov    2020-03-02  3366  		return false;
68af43173d3fce Dmitry Safonov    2020-03-02  3367  
68af43173d3fce Dmitry Safonov    2020-03-02  3368  	BUILD_BUG_ON(ARRAY_SIZE(sysrq_toggle_seq) >= U8_MAX);
68af43173d3fce Dmitry Safonov    2020-03-02  3369  	if (sysrq_toggle_seq[port->sysrq_seq] != ch) {
68af43173d3fce Dmitry Safonov    2020-03-02  3370  		port->sysrq_seq = 0;
68af43173d3fce Dmitry Safonov    2020-03-02  3371  		return false;
68af43173d3fce Dmitry Safonov    2020-03-02  3372  	}
68af43173d3fce Dmitry Safonov    2020-03-02  3373  
2ce5eace42b859 Andy Shevchenko   2020-03-10 @3374  	if (++port->sysrq_seq < sysrq_toggle_seq_len) {
68af43173d3fce Dmitry Safonov    2020-03-02  3375  		port->sysrq = jiffies + SYSRQ_TIMEOUT;
68af43173d3fce Dmitry Safonov    2020-03-02  3376  		return true;
68af43173d3fce Dmitry Safonov    2020-03-02  3377  	}
68af43173d3fce Dmitry Safonov    2020-03-02  3378  
68af43173d3fce Dmitry Safonov    2020-03-02  3379  	schedule_work(&sysrq_enable_work);
68af43173d3fce Dmitry Safonov    2020-03-02  3380  
68af43173d3fce Dmitry Safonov    2020-03-02  3381  	port->sysrq = 0;
68af43173d3fce Dmitry Safonov    2020-03-02  3382  	return true;
68af43173d3fce Dmitry Safonov    2020-03-02  3383  }
08d5470308ac35 Johan Hovold      2020-06-10  3384  EXPORT_SYMBOL_GPL(uart_try_toggle_sysrq);
68af43173d3fce Dmitry Safonov    2020-03-02  3385  #endif
68af43173d3fce Dmitry Safonov    2020-03-02  3386  

:::::: The code at line 3374 was first introduced by commit
:::::: 2ce5eace42b859cabef898877b38a0429f931370 serial: core: Use string length for SysRq magic sequence

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
