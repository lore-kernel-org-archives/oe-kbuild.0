Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780D031E11C
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Jan 2026 23:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768000740; cv=none; b=qU5Q4tFQnNqst4oDL0AW3pTwx15RL0KHL8Vsd93afV/uyZeJxEXtqzwt+F+b1OJ/rxlrqqMxAXcUST1aahlOw7xHX9g/mQLsRnSJreZeUADSVViJlgGmHNbT2W9vdLRrKQja/ZUgHkmLgmcvQdamua8XL5TXeXSi2eUdXFGkVL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768000740; c=relaxed/simple;
	bh=BxWd2yrZvOTOukqHWQsXMH/uqUgBTSQN5bnH++N6Ypw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LB8wUrjMa7oi0da/f+nSY4R83e8cKdGsgvEo2eUOd0iF3OLscKA1ZPPaiqzTFDUwFbuMmUIpwTKTnDa9/m1jsnl8vwDr050uiC3fd42rOH47ko7KPaeSYnOUrFxbC+ZNFYmN2mNs5U3ImWJdH04m3oUPFKy7UO4Sm24UR0M3SM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TAUR+0/l; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TAUR+0/l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768000739; x=1799536739;
  h=date:from:to:cc:subject:message-id;
  bh=BxWd2yrZvOTOukqHWQsXMH/uqUgBTSQN5bnH++N6Ypw=;
  b=TAUR+0/ldqtAuxBOSAl8pfVUuEQNzeqOoXQ264IGd7txeixkEZESiY0G
   GG3y+GmUQ433pPSSeP9brRttWZCLHsAHgt9NTSgSPBh4MXCXU/NlLWZww
   g/Jrrk/H8AfX0XOAe6ZjdlBCCPdUvLNCvLOXAITt+PDpnznRGFtNbro9r
   u1kZ2CQxfOyLDHGHf4US2OPVobgXszaj47gXg0QGRxuUa83peB9sZ4iHQ
   42K/9M609QMS3BAB4ssQrYklRB9yL5vLq/ko63uVeupC61CK2IVGD4mHh
   A2hybNiTKskIxuL+hRWnKTSxBpXIjqNwfXa+XryoY/hCGKKPkwIluQr4H
   w==;
X-CSE-ConnectionGUID: Jzv67q9dQVucEFw3WB2W5w==
X-CSE-MsgGUID: GJill6SNSJewebIzdJ4PUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="86802478"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="86802478"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 15:18:58 -0800
X-CSE-ConnectionGUID: UNon+SIZTr+GYsf8MmDZYw==
X-CSE-MsgGUID: gudaXA/dR2uS47pLSHxM9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="203591818"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Jan 2026 15:18:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veLks-000000007pm-0uj0;
	Fri, 09 Jan 2026 23:18:54 +0000
Date: Sat, 10 Jan 2026 07:18:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:locking/core 27/43]
 drivers/net/ethernet/neterion/s2io.c:3053 tx_intr_handler() error: calling
 'spin_unlock_irqrestore()' with bogus flags
Message-ID: <202601100736.TW1axJ8N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Marco Elver <elver@google.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
head:   a45026cef17d1080c985adf28234d6c8475ad66f
commit: e4588c25c9d122b5847b88e18b184404b6959160 [27/43] compiler-context-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-r071-20260109 (https://download.01.org/0day-ci/archive/20260110/202601100736.TW1axJ8N-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601100736.TW1axJ8N-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/neterion/s2io.c:3053 tx_intr_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags

Old smatch warnings:
drivers/net/ethernet/neterion/s2io.c:3073 tx_intr_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/neterion/s2io.c:6799 set_rxd_buffer_pointer() warn: missing unwind goto?

vim +3053 drivers/net/ethernet/neterion/s2io.c

20346722ec4742 drivers/net/s2io.c                   Koushik                         2005-08-03  2984  
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  2985  /**
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  2986   *  tx_intr_handler - Transmit interrupt handler
d0ea5cbdc286de drivers/net/ethernet/neterion/s2io.c Jesse Brandeburg                2020-09-25  2987   *  @fifo_data : fifo data pointer
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  2988   *  Description:
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  2989   *  If an interrupt was raised to indicate DMA complete of the
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  2990   *  Tx packet, this function is called. It identifies the last TxD
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  2991   *  whose buffer was freed and frees all skbs whose data have already
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  2992   *  DMA'ed into the NICs internal memory.
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  2993   *  Return Value:
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  2994   *  NONE
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  2995   */
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  2996  
1ee6dd770b2302 drivers/net/s2io.c                   Ralf Baechle                    2007-01-31  2997  static void tx_intr_handler(struct fifo_info *fifo_data)
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  2998  {
1ee6dd770b2302 drivers/net/s2io.c                   Ralf Baechle                    2007-01-31  2999  	struct s2io_nic *nic = fifo_data->nic;
1ee6dd770b2302 drivers/net/s2io.c                   Ralf Baechle                    2007-01-31  3000  	struct tx_curr_get_info get_info, put_info;
3a3d5756ac552e drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  3001  	struct sk_buff *skb = NULL;
1ee6dd770b2302 drivers/net/s2io.c                   Ralf Baechle                    2007-01-31  3002  	struct TxD *txdlp;
3a3d5756ac552e drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  3003  	int pkt_cnt = 0;
2fda096d188dda drivers/net/s2io.c                   Surjit Reang                    2008-01-24  3004  	unsigned long flags = 0;
f9046eb3f64db7 drivers/net/s2io.c                   Olaf Hering                     2007-06-19  3005  	u8 err_mask;
ffb5df6ce776a0 drivers/net/s2io.c                   Joe Perches                     2009-08-24  3006  	struct stat_block *stats = nic->mac_control.stats_info;
ffb5df6ce776a0 drivers/net/s2io.c                   Joe Perches                     2009-08-24  3007  	struct swStat *swstats = &stats->sw_stat;
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  3008  
2fda096d188dda drivers/net/s2io.c                   Surjit Reang                    2008-01-24  3009  	if (!spin_trylock_irqsave(&fifo_data->tx_lock, flags))
2fda096d188dda drivers/net/s2io.c                   Surjit Reang                    2008-01-24  3010  		return;
2fda096d188dda drivers/net/s2io.c                   Surjit Reang                    2008-01-24  3011  
20346722ec4742 drivers/net/s2io.c                   Koushik                         2005-08-03  3012  	get_info = fifo_data->tx_curr_get_info;
1ee6dd770b2302 drivers/net/s2io.c                   Ralf Baechle                    2007-01-31  3013  	memcpy(&put_info, &fifo_data->tx_curr_put_info, sizeof(put_info));
43d620c82985b1 drivers/net/s2io.c                   Joe Perches                     2011-06-16  3014  	txdlp = fifo_data->list_info[get_info.offset].list_virt_addr;
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  3015  	while ((!(txdlp->Control_1 & TXD_LIST_OWN_XENA)) &&
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  3016  	       (get_info.offset != put_info.offset) &&
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  3017  	       (txdlp->Host_Control)) {
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  3018  		/* Check for TxD errors */
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  3019  		if (txdlp->Control_1 & TXD_T_CODE) {
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  3020  			unsigned long long err;
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  3021  			err = txdlp->Control_1 & TXD_T_CODE;
bd1034f035f367 drivers/net/s2io.c                   Ananda Raju                     2006-04-21  3022  			if (err & 0x1) {
ffb5df6ce776a0 drivers/net/s2io.c                   Joe Perches                     2009-08-24  3023  				swstats->parity_err_cnt++;
bd1034f035f367 drivers/net/s2io.c                   Ananda Raju                     2006-04-21  3024  			}
491976b2bce07f drivers/net/s2io.c                   Sreenivasa Honnur               2007-05-10  3025  
491976b2bce07f drivers/net/s2io.c                   Sreenivasa Honnur               2007-05-10  3026  			/* update t_code statistics */
f9046eb3f64db7 drivers/net/s2io.c                   Olaf Hering                     2007-06-19  3027  			err_mask = err >> 48;
f9046eb3f64db7 drivers/net/s2io.c                   Olaf Hering                     2007-06-19  3028  			switch (err_mask) {
491976b2bce07f drivers/net/s2io.c                   Sreenivasa Honnur               2007-05-10  3029  			case 2:
ffb5df6ce776a0 drivers/net/s2io.c                   Joe Perches                     2009-08-24  3030  				swstats->tx_buf_abort_cnt++;
491976b2bce07f drivers/net/s2io.c                   Sreenivasa Honnur               2007-05-10  3031  				break;
491976b2bce07f drivers/net/s2io.c                   Sreenivasa Honnur               2007-05-10  3032  
491976b2bce07f drivers/net/s2io.c                   Sreenivasa Honnur               2007-05-10  3033  			case 3:
ffb5df6ce776a0 drivers/net/s2io.c                   Joe Perches                     2009-08-24  3034  				swstats->tx_desc_abort_cnt++;
491976b2bce07f drivers/net/s2io.c                   Sreenivasa Honnur               2007-05-10  3035  				break;
491976b2bce07f drivers/net/s2io.c                   Sreenivasa Honnur               2007-05-10  3036  
491976b2bce07f drivers/net/s2io.c                   Sreenivasa Honnur               2007-05-10  3037  			case 7:
ffb5df6ce776a0 drivers/net/s2io.c                   Joe Perches                     2009-08-24  3038  				swstats->tx_parity_err_cnt++;
491976b2bce07f drivers/net/s2io.c                   Sreenivasa Honnur               2007-05-10  3039  				break;
491976b2bce07f drivers/net/s2io.c                   Sreenivasa Honnur               2007-05-10  3040  
491976b2bce07f drivers/net/s2io.c                   Sreenivasa Honnur               2007-05-10  3041  			case 10:
ffb5df6ce776a0 drivers/net/s2io.c                   Joe Perches                     2009-08-24  3042  				swstats->tx_link_loss_cnt++;
491976b2bce07f drivers/net/s2io.c                   Sreenivasa Honnur               2007-05-10  3043  				break;
491976b2bce07f drivers/net/s2io.c                   Sreenivasa Honnur               2007-05-10  3044  
491976b2bce07f drivers/net/s2io.c                   Sreenivasa Honnur               2007-05-10  3045  			case 15:
ffb5df6ce776a0 drivers/net/s2io.c                   Joe Perches                     2009-08-24  3046  				swstats->tx_list_proc_err_cnt++;
491976b2bce07f drivers/net/s2io.c                   Sreenivasa Honnur               2007-05-10  3047  				break;
776bd20fa25fd8 drivers/net/s2io.c                   ravinandan.arakali@neterion.com 2005-09-06  3048  			}
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  3049  		}
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  3050  
fed5eccdcf5427 drivers/net/s2io.c                   Ananda Raju                     2005-11-14  3051  		skb = s2io_txdl_getskb(fifo_data, txdlp, get_info.offset);
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  3052  		if (skb == NULL) {
2fda096d188dda drivers/net/s2io.c                   Surjit Reang                    2008-01-24 @3053  			spin_unlock_irqrestore(&fifo_data->tx_lock, flags);
9e39f7c5b311a3 drivers/net/s2io.c                   Joe Perches                     2009-08-25  3054  			DBG_PRINT(ERR_DBG, "%s: NULL skb in Tx Free Intr\n",
9e39f7c5b311a3 drivers/net/s2io.c                   Joe Perches                     2009-08-25  3055  				  __func__);
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  3056  			return;
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  3057  		}
3a3d5756ac552e drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  3058  		pkt_cnt++;
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  3059  
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  3060  		/* Updating the statistics block */
ffb5df6ce776a0 drivers/net/s2io.c                   Joe Perches                     2009-08-24  3061  		swstats->mem_freed += skb->truesize;
46befd3249d72f drivers/net/ethernet/neterion/s2io.c Yang Wei                        2019-02-12  3062  		dev_consume_skb_irq(skb);
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  3063  
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  3064  		get_info.offset++;
863c11a91e4507 drivers/net/s2io.c                   Ananda Raju                     2006-04-21  3065  		if (get_info.offset == get_info.fifo_len + 1)
863c11a91e4507 drivers/net/s2io.c                   Ananda Raju                     2006-04-21  3066  			get_info.offset = 0;
43d620c82985b1 drivers/net/s2io.c                   Joe Perches                     2011-06-16  3067  		txdlp = fifo_data->list_info[get_info.offset].list_virt_addr;
d44570e4067aa8 drivers/net/s2io.c                   Joe Perches                     2009-08-24  3068  		fifo_data->tx_curr_get_info.offset = get_info.offset;
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  3069  	}
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  3070  
3a3d5756ac552e drivers/net/s2io.c                   Sreenivasa Honnur               2008-02-20  3071  	s2io_wake_tx_queue(fifo_data, pkt_cnt, nic->config.multiq);
2fda096d188dda drivers/net/s2io.c                   Surjit Reang                    2008-01-24  3072  
2fda096d188dda drivers/net/s2io.c                   Surjit Reang                    2008-01-24  3073  	spin_unlock_irqrestore(&fifo_data->tx_lock, flags);
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  3074  }
^1da177e4c3f41 drivers/net/s2io.c                   Linus Torvalds                  2005-04-16  3075  

:::::: The code at line 3053 was first introduced by commit
:::::: 2fda096d188ddae51a0fe8cd5b13cf9c84b03c1e S2io: Fixes to enable multiple transmit fifo support

:::::: TO: Surjit Reang <surjit.reang@neterion.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
