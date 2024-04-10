Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2993E497
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Apr 2024 22:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712789694; cv=none; b=hpGFskRzwSaNiVH0qgLsC7S4im/o1HBDnWemHUN+Mo//m/YGqz2pqi5sp7IM9+5vqjs/h8IWwBSRQbB3sD3R2eCAtkREZ5pRL3AxyPF+nkXV8GZYPmE9gdCpsRoxF5QPS1HXPX12MWkJwUxsZEdJCv8SAdZ4Ktu1U/WTp4VOxH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712789694; c=relaxed/simple;
	bh=oyq3d7dyCHWh8FYGg4NApPPZcXVrdLlN8PWa11oLi6I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GwlBjkLfC1A334qJthZWyDpxoXd+hHcW8sl9ai3EcyXNcgXGRToTepwYScX/0exnD1dyWlXuizLYzXhRpi/fqz2Hu6do5SN3Ig9nQAhADjEEyxqN0SzcPSHvZQ2oKH/mPbJ753CvHqxMVRrX1s6kiq3yyp9w6GuTR3uFxiGYn1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QSw2LMeV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QSw2LMeV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712789693; x=1744325693;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oyq3d7dyCHWh8FYGg4NApPPZcXVrdLlN8PWa11oLi6I=;
  b=QSw2LMeVWkzlo4FILjIUs9EW5a2s8YAnECRquyKZwRhqZxmvmkdPVPMR
   Vf2Ug6u+lKRvL8RlfdHXMxNEsU6Ol3LdsKOEFD7uG9jvJPgWcYJxM4meZ
   0q/GY9sLotte07co46KCJ31S0JvVdfTFWKs58S/xdMcdjRjdGxoxj8hUs
   rXd/dNcyg3sKuM9o1IvnQLHZALdwICLjG9ExZBxaDqjbTPhun3F6L9Um7
   bOKDs86cy8tn3aGfutWk2VsLAmXjMB92qKLb8SPGHWhfjhYUNZUcMZFv9
   nvQZb30gwUqXbKY5jCIWMK+33vfaTtZnYYB6pzhoruHnOc+5Xehe2X6sH
   g==;
X-CSE-ConnectionGUID: hoqfR2XiRnK3raiyvgEpig==
X-CSE-MsgGUID: xoZz4lGxQRWv/DZ9Twlgnw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8309812"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="8309812"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 15:54:52 -0700
X-CSE-ConnectionGUID: FtXbmL1MRnGbrCER2z1/oA==
X-CSE-MsgGUID: pUG1+JZ6THOeMQ4c8ZMiGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="25372868"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Apr 2024 15:54:50 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rugq7-0007uw-2h;
	Wed, 10 Apr 2024 22:54:47 +0000
Date: Thu, 11 Apr 2024 06:53:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jirislaby:devel 33/40] drivers/tty/mxser.c:513 mxser_set_baud()
 error: uninitialized symbol 'baud'.
Message-ID: <202404110644.9Hya2zB1-lkp@intel.com>
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
TO: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   a56ff0cb0fd0fd59f4a9a12091951ae80f866abb
commit: fb7c4d96c47896d2d8db670f34bb961a66ea869a [33/40] mxser: use timeout from uart_port
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20240411 (https://download.01.org/0day-ci/archive/20240411/202404110644.9Hya2zB1-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404110644.9Hya2zB1-lkp@intel.com/

smatch warnings:
drivers/tty/mxser.c:513 mxser_set_baud() error: uninitialized symbol 'baud'.

vim +/baud +513 drivers/tty/mxser.c

5d951fb458f847 drivers/char/mxser.c Alan Cox          2009-01-02  489  
ded0799af88cdc drivers/tty/mxser.c  Jiri Slaby        2021-12-01  490  static int mxser_set_baud(struct mxser_port *info, struct ktermios *termios)
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  491  {
2a92b0c951630a drivers/tty/mxser.c  Jiri Slaby (SUSE  2023-04-24  492) 	struct uart_port *uport = &info->uport;
104583b504da8a drivers/tty/mxser.c  Jiri Slaby        2017-09-12  493  	unsigned int quot = 0, baud;
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  494  	unsigned char cval;
ded0799af88cdc drivers/tty/mxser.c  Jiri Slaby        2021-12-01  495  	speed_t newspd = tty_termios_baud_rate(termios);
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  496  
928f946426905d drivers/tty/mxser.c  Jiri Slaby        2021-06-18  497  	if (newspd > info->board->max_baud)
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  498  		return -1;
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  499  
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  500  	if (newspd == 134) {
a6970c39c311f3 drivers/tty/mxser.c  Jiri Slaby        2021-06-18  501  		quot = 2 * MXSER_BAUD_BASE / 269;
ded0799af88cdc drivers/tty/mxser.c  Jiri Slaby        2021-12-01  502  		tty_termios_encode_baud_rate(termios, 134, 134);
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  503  	} else if (newspd) {
a6970c39c311f3 drivers/tty/mxser.c  Jiri Slaby        2021-06-18  504  		quot = MXSER_BAUD_BASE / newspd;
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  505  		if (quot == 0)
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  506  			quot = 1;
a6970c39c311f3 drivers/tty/mxser.c  Jiri Slaby        2021-06-18  507  		baud = MXSER_BAUD_BASE / quot;
ded0799af88cdc drivers/tty/mxser.c  Jiri Slaby        2021-12-01  508  		tty_termios_encode_baud_rate(termios, baud, baud);
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  509  	} else {
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  510  		quot = 0;
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  511  	}
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  512  
fb7c4d96c47896 drivers/tty/mxser.c  Jiri Slaby (SUSE  2022-11-15 @513) 	uart_update_timeout(uport, termios->c_cflag, baud);
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  514  
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  515  	if (quot) {
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  516  		info->MCR |= UART_MCR_DTR;
2a92b0c951630a drivers/tty/mxser.c  Jiri Slaby (SUSE  2023-04-24  517) 		outb(info->MCR, uport->iobase + UART_MCR);
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  518  	} else {
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  519  		info->MCR &= ~UART_MCR_DTR;
2a92b0c951630a drivers/tty/mxser.c  Jiri Slaby (SUSE  2023-04-24  520) 		outb(info->MCR, uport->iobase + UART_MCR);
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  521  		return 0;
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  522  	}
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  523  
2a92b0c951630a drivers/tty/mxser.c  Jiri Slaby (SUSE  2023-04-24  524) 	cval = inb(uport->iobase + UART_LCR);
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  525  
2a92b0c951630a drivers/tty/mxser.c  Jiri Slaby (SUSE  2023-04-24  526) 	outb(cval | UART_LCR_DLAB, uport->iobase + UART_LCR);	/* set DLAB */
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  527  
2a92b0c951630a drivers/tty/mxser.c  Jiri Slaby (SUSE  2023-04-24  528) 	outb(quot & 0xff, uport->iobase + UART_DLL);	/* LS of divisor */
2a92b0c951630a drivers/tty/mxser.c  Jiri Slaby (SUSE  2023-04-24  529) 	outb(quot >> 8, uport->iobase + UART_DLM);	/* MS of divisor */
2a92b0c951630a drivers/tty/mxser.c  Jiri Slaby (SUSE  2023-04-24  530) 	outb(cval, uport->iobase + UART_LCR);	/* reset DLAB */
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  531  
ded0799af88cdc drivers/tty/mxser.c  Jiri Slaby        2021-12-01  532  	if ((termios->c_cflag & CBAUD) == BOTHER) {
a6970c39c311f3 drivers/tty/mxser.c  Jiri Slaby        2021-06-18  533  		quot = MXSER_BAUD_BASE % newspd;
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  534  		quot *= 8;
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  535  		if (quot % newspd > newspd / 2) {
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  536  			quot /= newspd;
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  537  			quot++;
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  538  		} else
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  539  			quot /= newspd;
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  540  
2a92b0c951630a drivers/tty/mxser.c  Jiri Slaby (SUSE  2023-04-24  541) 		mxser_set_must_enum_value(uport->iobase, quot);
69648d7bda8636 drivers/tty/mxser.c  Ilpo Järvinen     2022-05-13  542  	} else {
2a92b0c951630a drivers/tty/mxser.c  Jiri Slaby (SUSE  2023-04-24  543) 		mxser_set_must_enum_value(uport->iobase, 0);
69648d7bda8636 drivers/tty/mxser.c  Ilpo Järvinen     2022-05-13  544  	}
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  545  
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  546  	return 0;
1c45607ad3eb73 drivers/char/mxser.c Jiri Slaby        2008-02-07  547  }
^1da177e4c3f41 drivers/char/mxser.c Linus Torvalds    2005-04-16  548  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
