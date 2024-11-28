Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7301386BF
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Nov 2024 05:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732772354; cv=none; b=i7A1uZDc16N8YBDrF2sdlDs7tZ1OgvEH8ncz6xZeiyqchdRzh9ljH1YF4XcYgdZlmzehAYdAtfyZCtwJPMCBktAzouIdG8AkJjcgf98zi9e6u2GKYsS3RDinFTdlXdCXtFKGX2py3K9TIrEX6Lc9g53MLHgQwUp58HzJT7cYsQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732772354; c=relaxed/simple;
	bh=3EN+GgjI8KKZra6/JlRfjOpjG/USW8lzMq9JkxjU4+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DmELGGcLN9FYP/fjZFTw08bxGjFmp27O9+P+m2+3akJ8eAFXI7PDW3yhiSUwl/SJ3ay9fMizunDnAKQDcf3dueYDE+gFg+lUF8AVp5WOWq1vJ2oWjKbtP62s8rSHOgpotwQLJdS9on8bSIi+BHfTCBcNbs47eBAPiwj/JrVuywA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BiKbL73J; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BiKbL73J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732772352; x=1764308352;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3EN+GgjI8KKZra6/JlRfjOpjG/USW8lzMq9JkxjU4+c=;
  b=BiKbL73J9liFRiXz5GdA4TxqbclKNHfqXcAYhGmO8721fGdzjyD5wmHW
   GkREBf+UrNxQOBqT2DLe75xRvBpRYtJ6Gi1eXlyzTmtxWVYa5XALphNeO
   IJUTwbemg+/OnRJGr2vgvsHf5LCBPcLqprTXZC2uet0W9E20mdIgXWPmI
   TmRahAWSOqA2uhnfWm8RCoTXzhHBYr515lYshm2p32hIC1IaTAzhUY/z+
   AT/Gp+Gbvm/FHxnqZbjC0yyz7lJT6e/MSjjAZcgNjBgOar3d2Aymycx/B
   /sybi0tfI/6mnC+mkYnKBFNzLcMWUa9pupCpgSB3oMqs71KgmHueOp4ja
   A==;
X-CSE-ConnectionGUID: irVlG8oKQ46Mk9sY2jf+4A==
X-CSE-MsgGUID: SKLyNJmVRCGjC+2kfQqt6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="33045259"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="33045259"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 21:39:12 -0800
X-CSE-ConnectionGUID: +30JS8OnQGOOSoti5bnPgg==
X-CSE-MsgGUID: Fr5TcyrkQMK5swYN3ezcgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="97222908"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Nov 2024 21:39:10 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGXF6-00096p-0Q;
	Thu, 28 Nov 2024 05:39:08 +0000
Date: Thu, 28 Nov 2024 13:38:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11908/12916] drivers/i2c/busses/i2c-xiic.c:932
 xiic_recv_atomic() warn: variable dereferenced before check 'i2c->rx_msg'
 (see line 930)
Message-ID: <202411281318.Ami4hwE8-lkp@intel.com>
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
TO: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
CC: Andi Shyti <andi.shyti@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6f3d2b5299b0a8bcb8a9405a8d3fceb24f79c4f0
commit: 8bba86687c0b6a22f05ed4a7398c519d3796bc74 [11908/12916] i2c: xiic: Add atomic transfer support
:::::: branch date: 26 hours ago
:::::: commit date: 8 days ago
config: i386-randconfig-141-20241121 (https://download.01.org/0day-ci/archive/20241128/202411281318.Ami4hwE8-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411281318.Ami4hwE8-lkp@intel.com/

smatch warnings:
drivers/i2c/busses/i2c-xiic.c:932 xiic_recv_atomic() warn: variable dereferenced before check 'i2c->rx_msg' (see line 930)

vim +932 drivers/i2c/busses/i2c-xiic.c

e1d5b6598cdc33 Richard Röjfors      2010-02-11  927  
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  928  static void xiic_recv_atomic(struct xiic_i2c *i2c)
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  929  {
8bba86687c0b6a Manikanta Guntupalli 2024-10-11 @930  	while (xiic_rx_space(i2c)) {
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  931  		if (xiic_getreg32(i2c, XIIC_IISR_OFFSET) & XIIC_INTR_RX_FULL_MASK) {
8bba86687c0b6a Manikanta Guntupalli 2024-10-11 @932  			if (!i2c->rx_msg) {
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  933  				xiic_clear_rx_fifo(i2c);
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  934  				break;
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  935  			}
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  936  			xiic_read_rx(i2c);
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  937  
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  938  			/* Clear Rx full and Tx error interrupts. */
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  939  			xiic_irq_clr_en(i2c, XIIC_INTR_RX_FULL_MASK |
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  940  					XIIC_INTR_TX_ERROR_MASK);
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  941  		}
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  942  		if (xiic_error_check(i2c))
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  943  			return;
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  944  	}
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  945  
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  946  	i2c->rx_msg = NULL;
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  947  	xiic_irq_clr_en(i2c, XIIC_INTR_TX_ERROR_MASK);
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  948  
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  949  	/* send next message if this wasn't the last. */
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  950  	if (i2c->nmsgs > 1) {
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  951  		i2c->nmsgs--;
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  952  		i2c->tx_msg++;
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  953  		__xiic_start_xfer(i2c);
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  954  	}
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  955  }
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  956  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
