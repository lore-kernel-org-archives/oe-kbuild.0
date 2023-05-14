Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E761101
	for <oe-kbuild@lists.linux.dev>; Sun, 14 May 2023 04:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684039823; x=1715575823;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7uRXw/DRDUh/zBzpPxQJKfSxTLd2OpIJ7jKubUE8sdA=;
  b=CMnHdUwxz3AWETcWh+F3u0x+dwqoOc22YwX/jcvZ80Bo9/rzDge7tV7E
   H5hnsBenrEdJkAToGChSmkQFMcNR6GV8uZCZMdpECwSJhd9IXNVyo57J0
   sYpMnYi7W8VP/4em3KmFqeDEr8znBmer8CLXa0ByATryJ1FRCncxZAp5d
   QBiErBS/qUw2BiRVWCqSIHhIj7jWTnL8Xb4s62OxGzRfXjshq5jm42WIF
   NZnXi5RkyxGHm8qq29Jo1xhx7KQ5CZZlk9GCPHcrZMZAdXAv5fLE7vtM5
   Bcbf1zaK+J4uF9S7JobY/ROqwAc6qnqhIhZ4eP7sRq7tXkVLb5RW/nxxY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="335538712"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="335538712"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 21:50:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="1030502278"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="1030502278"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 May 2023 21:50:21 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1py3ga-0005pl-27;
	Sun, 14 May 2023 04:50:20 +0000
Date: Sun, 14 May 2023 12:49:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tty:tty-testing 1/15] drivers/tty/serial/fsl_lpuart.c:1308
 lpuart_timer_func() error: uninitialized symbol 'flags'.
Message-ID: <202305141248.6QFTcwEs-lkp@intel.com>
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
CC: linux-serial@vger.kernel.org
TO: Shenwei Wang <shenwei.wang@nxp.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
head:   d5b3d02d0b107345f2a6ecb5b06f98356f5c97ab
commit: cf9aa72d2f91defea23fe29b9e8e941bb2486d5c [1/15] tty: serial: fsl_lpuart: optimize the timer based EOP logic
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: csky-randconfig-m031-20230514 (https://download.01.org/0day-ci/archive/20230514/202305141248.6QFTcwEs-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305141248.6QFTcwEs-lkp@intel.com/

smatch warnings:
drivers/tty/serial/fsl_lpuart.c:1308 lpuart_timer_func() error: uninitialized symbol 'flags'.

vim +/flags +1308 drivers/tty/serial/fsl_lpuart.c

5887ad43ee02a0 Bhuvanchandra DV 2016-07-19  1278  
cf9aa72d2f91de Shenwei Wang     2023-05-10  1279  /*
cf9aa72d2f91de Shenwei Wang     2023-05-10  1280   * Timer function to simulate the hardware EOP (End Of Package) event.
cf9aa72d2f91de Shenwei Wang     2023-05-10  1281   * The timer callback is to check for new RX data and copy to TTY buffer.
cf9aa72d2f91de Shenwei Wang     2023-05-10  1282   * If no new data are received since last interval, the EOP condition is
cf9aa72d2f91de Shenwei Wang     2023-05-10  1283   * met, complete the DMA transfer by copying the data. Otherwise, just
cf9aa72d2f91de Shenwei Wang     2023-05-10  1284   * restart timer.
cf9aa72d2f91de Shenwei Wang     2023-05-10  1285   */
e99e88a9d2b067 Kees Cook        2017-10-16  1286  static void lpuart_timer_func(struct timer_list *t)
5887ad43ee02a0 Bhuvanchandra DV 2016-07-19  1287  {
e99e88a9d2b067 Kees Cook        2017-10-16  1288  	struct lpuart_port *sport = from_timer(sport, t, lpuart_timer);
cf9aa72d2f91de Shenwei Wang     2023-05-10  1289  	struct dma_chan *chan = sport->dma_rx_chan;
cf9aa72d2f91de Shenwei Wang     2023-05-10  1290  	struct circ_buf *ring = &sport->rx_ring;
cf9aa72d2f91de Shenwei Wang     2023-05-10  1291  	struct dma_tx_state state;
cf9aa72d2f91de Shenwei Wang     2023-05-10  1292  	unsigned long flags;
cf9aa72d2f91de Shenwei Wang     2023-05-10  1293  	int count;
cf9aa72d2f91de Shenwei Wang     2023-05-10  1294  
cf9aa72d2f91de Shenwei Wang     2023-05-10  1295  	dmaengine_tx_status(chan, sport->dma_rx_cookie, &state);
cf9aa72d2f91de Shenwei Wang     2023-05-10  1296  	ring->head = sport->rx_sgl.length - state.residue;
cf9aa72d2f91de Shenwei Wang     2023-05-10  1297  	count = CIRC_CNT(ring->head, ring->tail, sport->rx_sgl.length);
5887ad43ee02a0 Bhuvanchandra DV 2016-07-19  1298  
cf9aa72d2f91de Shenwei Wang     2023-05-10  1299  	/* Check if new data received before copying */
cf9aa72d2f91de Shenwei Wang     2023-05-10  1300  	if ((count != 0) && (sport->last_residue == state.residue))
5887ad43ee02a0 Bhuvanchandra DV 2016-07-19  1301  		lpuart_copy_rx_to_tty(sport);
cf9aa72d2f91de Shenwei Wang     2023-05-10  1302  	else
cf9aa72d2f91de Shenwei Wang     2023-05-10  1303  		mod_timer(&sport->lpuart_timer,
cf9aa72d2f91de Shenwei Wang     2023-05-10  1304  			  jiffies + sport->dma_rx_timeout);
cf9aa72d2f91de Shenwei Wang     2023-05-10  1305  
cf9aa72d2f91de Shenwei Wang     2023-05-10  1306  	if (spin_trylock_irqsave(&sport->port.lock, flags)) {
cf9aa72d2f91de Shenwei Wang     2023-05-10  1307  		sport->last_residue = state.residue;
cf9aa72d2f91de Shenwei Wang     2023-05-10 @1308  		spin_unlock_irqrestore(&sport->port.lock, flags);
cf9aa72d2f91de Shenwei Wang     2023-05-10  1309  	}
5887ad43ee02a0 Bhuvanchandra DV 2016-07-19  1310  }
5887ad43ee02a0 Bhuvanchandra DV 2016-07-19  1311  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
