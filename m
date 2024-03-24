Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D6C7F9
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Mar 2024 09:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711274076; cv=none; b=rklcl0oXgx9WudVVK65QiAUuIW0WlmlNBw0qZXD29PltmnOuIZBBMTWLpa7/00pyWKiEedDQzTiJr7ifNwNr1ZDww1gn49L0+zGAOgm9zlQblTqdRrxtl9nb4FM/tr/tgBaxiuG3MeZASafdOBl7+KYakawqWlAb+IMwwhtRctc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711274076; c=relaxed/simple;
	bh=i++UcjvJ8lX/Vr/9KKAMmCnrGpyCDR+xvszITBifVlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I8+Xj2ARgEuwBh6VooNyS8uVSVnkNa10gSh1M8CW7lYtUyZK0o+2w1IJ0aY596bVE7jaiI+pQi9105x53NaVgfsxHgXEmTKIcs4B1VoJGsSruB+GKhvSsE9xWT2+h7axvCiJcn3kYHXB3tITcXC8vBkABLdVjpMBkbM5buiohZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UhK15FfR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UhK15FfR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711274073; x=1742810073;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=i++UcjvJ8lX/Vr/9KKAMmCnrGpyCDR+xvszITBifVlQ=;
  b=UhK15FfRdvMYt9bzqX4B30qpicoLbnfABJOL31mxXREjBYQvkKBTz7Rr
   MsmMfpRi7TvlqxxHOqMluxSkB8EZ4OMdPH3olOvBfNiCWI6iclOo8teEf
   wbxkjSmCkHW9ujAxX/AVUO8LyebMuoTV195nE/A6cJ8JK6zilR61PVhb1
   ynTLHGloHN5dJjJd4V2Vtb96GORBG3+OW3+CF+qrKw9CFf/coudjs0HT7
   OjhR0n6tpiCxIg3MsztaG1GzgnuT6y+KnxIOtJJjdtNrCduz6NICAdTiU
   9EDSnnL6LTOIkldzormeWj/e3mGEtmK5RPqbJ6bEZlPQCsZwjS8f6cKZh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="9233420"
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="9233420"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 02:54:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="52788160"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Mar 2024 02:54:31 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roKYe-000Lkz-2A;
	Sun, 24 Mar 2024 09:54:28 +0000
Date: Sun, 24 Mar 2024 17:53:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/tty/serial/amba-pl011.c:1110 pl011_dma_startup() warn:
 Please consider using kzalloc instead of kmalloc
Message-ID: <202403241705.ciJcrrdh-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Kees Cook <keescook@chromium.org>
CC: Pasha Tatashin <pasha.tatashin@soleen.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   70293240c5ce675a67bfc48f419b093023b862b3
commit: 772dd0342727cc3c3b676b5d97c99708e75730a2 mm: enumerate all gfp flags
date:   3 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-r071-20240324 (https://download.01.org/0day-ci/archive/20240324/202403241705.ciJcrrdh-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403241705.ciJcrrdh-lkp@intel.com/

smatch warnings:
drivers/tty/serial/amba-pl011.c:1110 pl011_dma_startup() warn: Please consider using kzalloc instead of kmalloc

vim +1110 drivers/tty/serial/amba-pl011.c

cb06ff102e2d79 drivers/tty/serial/amba-pl011.c Chanho Min          2013-03-27  1099  
68b65f7305e54b drivers/serial/amba-pl011.c     Russell King        2010-12-22  1100  static void pl011_dma_startup(struct uart_amba_port *uap)
68b65f7305e54b drivers/serial/amba-pl011.c     Russell King        2010-12-22  1101  {
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1102  	int ret;
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1103  
1c9be31015747b drivers/tty/serial/amba-pl011.c Jorge Ramirez-Ortiz 2015-03-06  1104  	if (!uap->dma_probed)
1c9be31015747b drivers/tty/serial/amba-pl011.c Jorge Ramirez-Ortiz 2015-03-06  1105  		pl011_dma_probe(uap);
1c9be31015747b drivers/tty/serial/amba-pl011.c Jorge Ramirez-Ortiz 2015-03-06  1106  
68b65f7305e54b drivers/serial/amba-pl011.c     Russell King        2010-12-22  1107  	if (!uap->dmatx.chan)
68b65f7305e54b drivers/serial/amba-pl011.c     Russell King        2010-12-22  1108  		return;
68b65f7305e54b drivers/serial/amba-pl011.c     Russell King        2010-12-22  1109  
4c0be45b18a3bd drivers/tty/serial/amba-pl011.c Andrew Jackson      2014-11-07 @1110  	uap->dmatx.buf = kmalloc(PL011_DMA_BUFFER_SIZE, GFP_KERNEL | __GFP_DMA);
68b65f7305e54b drivers/serial/amba-pl011.c     Russell King        2010-12-22  1111  	if (!uap->dmatx.buf) {
68b65f7305e54b drivers/serial/amba-pl011.c     Russell King        2010-12-22  1112  		uap->port.fifosize = uap->fifosize;
68b65f7305e54b drivers/serial/amba-pl011.c     Russell King        2010-12-22  1113  		return;
68b65f7305e54b drivers/serial/amba-pl011.c     Russell King        2010-12-22  1114  	}
68b65f7305e54b drivers/serial/amba-pl011.c     Russell King        2010-12-22  1115  
58ac1b37997990 drivers/tty/serial/amba-pl011.c Arnd Bergmann       2023-11-22  1116  	uap->dmatx.len = PL011_DMA_BUFFER_SIZE;
68b65f7305e54b drivers/serial/amba-pl011.c     Russell King        2010-12-22  1117  
68b65f7305e54b drivers/serial/amba-pl011.c     Russell King        2010-12-22  1118  	/* The DMA buffer is now the FIFO the TTY subsystem can use */
68b65f7305e54b drivers/serial/amba-pl011.c     Russell King        2010-12-22  1119  	uap->port.fifosize = PL011_DMA_BUFFER_SIZE;
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1120  	uap->using_tx_dma = true;
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1121  
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1122  	if (!uap->dmarx.chan)
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1123  		goto skip_rx;
68b65f7305e54b drivers/serial/amba-pl011.c     Russell King        2010-12-22  1124  
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1125  	/* Allocate and map DMA RX buffers */
58ac1b37997990 drivers/tty/serial/amba-pl011.c Arnd Bergmann       2023-11-22  1126  	ret = pl011_dmabuf_init(uap->dmarx.chan, &uap->dmarx.dbuf_a,
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1127  				DMA_FROM_DEVICE);
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1128  	if (ret) {
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1129  		dev_err(uap->port.dev, "failed to init DMA %s: %d\n",
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1130  			"RX buffer A", ret);
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1131  		goto skip_rx;
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1132  	}
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1133  
58ac1b37997990 drivers/tty/serial/amba-pl011.c Arnd Bergmann       2023-11-22  1134  	ret = pl011_dmabuf_init(uap->dmarx.chan, &uap->dmarx.dbuf_b,
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1135  				DMA_FROM_DEVICE);
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1136  	if (ret) {
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1137  		dev_err(uap->port.dev, "failed to init DMA %s: %d\n",
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1138  			"RX buffer B", ret);
58ac1b37997990 drivers/tty/serial/amba-pl011.c Arnd Bergmann       2023-11-22  1139  		pl011_dmabuf_free(uap->dmarx.chan, &uap->dmarx.dbuf_a,
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1140  				  DMA_FROM_DEVICE);
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1141  		goto skip_rx;
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1142  	}
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1143  
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1144  	uap->using_rx_dma = true;
68b65f7305e54b drivers/serial/amba-pl011.c     Russell King        2010-12-22  1145  
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1146  skip_rx:
68b65f7305e54b drivers/serial/amba-pl011.c     Russell King        2010-12-22  1147  	/* Turn on DMA error (RX/TX will be enabled on demand) */
68b65f7305e54b drivers/serial/amba-pl011.c     Russell King        2010-12-22  1148  	uap->dmacr |= UART011_DMAONERR;
9f25bc510e960c drivers/tty/serial/amba-pl011.c Russell King        2015-11-03  1149  	pl011_write(uap->dmacr, uap, REG_DMACR);
38d624361b2a82 drivers/serial/amba-pl011.c     Russell King        2010-12-22  1150  
38d624361b2a82 drivers/serial/amba-pl011.c     Russell King        2010-12-22  1151  	/*
38d624361b2a82 drivers/serial/amba-pl011.c     Russell King        2010-12-22  1152  	 * ST Micro variants has some specific dma burst threshold
38d624361b2a82 drivers/serial/amba-pl011.c     Russell King        2010-12-22  1153  	 * compensation. Set this to 16 bytes, so burst will only
38d624361b2a82 drivers/serial/amba-pl011.c     Russell King        2010-12-22  1154  	 * be issued above/below 16 bytes.
38d624361b2a82 drivers/serial/amba-pl011.c     Russell King        2010-12-22  1155  	 */
38d624361b2a82 drivers/serial/amba-pl011.c     Russell King        2010-12-22  1156  	if (uap->vendor->dma_threshold)
7583633921d54f drivers/tty/serial/amba-pl011.c Russell King        2015-11-03  1157  		pl011_write(ST_UART011_DMAWM_RX_16 | ST_UART011_DMAWM_TX_16,
9f25bc510e960c drivers/tty/serial/amba-pl011.c Russell King        2015-11-03  1158  			    uap, REG_ST_DMAWM);
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1159  
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1160  	if (uap->using_rx_dma) {
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1161  		if (pl011_dma_rx_trigger_dma(uap))
fd64ff0966d394 drivers/tty/serial/amba-pl011.c Théo Lebrun         2023-12-07  1162  			dev_dbg(uap->port.dev,
fd64ff0966d394 drivers/tty/serial/amba-pl011.c Théo Lebrun         2023-12-07  1163  				"could not trigger initial RX DMA job, fall back to interrupt mode\n");
cb06ff102e2d79 drivers/tty/serial/amba-pl011.c Chanho Min          2013-03-27  1164  		if (uap->dmarx.poll_rate) {
f7f730968264c1 drivers/tty/serial/amba-pl011.c Kees Cook           2017-10-16  1165  			timer_setup(&uap->dmarx.timer, pl011_dma_rx_poll, 0);
cb06ff102e2d79 drivers/tty/serial/amba-pl011.c Chanho Min          2013-03-27  1166  			mod_timer(&uap->dmarx.timer,
d93ebe0fcfbd29 drivers/tty/serial/amba-pl011.c Théo Lebrun         2023-12-07  1167  				  jiffies + msecs_to_jiffies(uap->dmarx.poll_rate));
cb06ff102e2d79 drivers/tty/serial/amba-pl011.c Chanho Min          2013-03-27  1168  			uap->dmarx.last_residue = PL011_DMA_BUFFER_SIZE;
cb06ff102e2d79 drivers/tty/serial/amba-pl011.c Chanho Min          2013-03-27  1169  			uap->dmarx.last_jiffies = jiffies;
cb06ff102e2d79 drivers/tty/serial/amba-pl011.c Chanho Min          2013-03-27  1170  		}
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij       2011-02-24  1171  	}
68b65f7305e54b drivers/serial/amba-pl011.c     Russell King        2010-12-22  1172  }
68b65f7305e54b drivers/serial/amba-pl011.c     Russell King        2010-12-22  1173  

:::::: The code at line 1110 was first introduced by commit
:::::: 4c0be45b18a3bd5c215589c4b320648e35024f6e serial: pl011: Allocate TX DMA buffer from DMA capable memory

:::::: TO: Andrew Jackson <Andrew.Jackson@arm.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
