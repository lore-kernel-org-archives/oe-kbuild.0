Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDC81D31B6
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Nov 2024 12:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732193761; cv=none; b=atlxG/9CJ1crtPQ7xtBUQqBhzmNhFtwMoptWk3UKr0047GjN2T7gVpwMi3jTm1nKl5Ka+CohFoNxY+EndUeWtW4yxuWrGoTsl18PqeRBJNnC50IqdOCMbG7AoW/Eu+U117UUkQ2zPhaagurRaENQsDHd602m6tnFl3DmyeUGVSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732193761; c=relaxed/simple;
	bh=aChY3SmGRFV7DyQitvW0/HkVlK6xIiL1Oh6k03n76mI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XusbN/gjF/29ssMfVqTE9AqxLeSKbfSEGQDvaEOBRCrD9VbekzqzEHaqkcvODiUxZJHhKDGr6HKci7vtzl5hmWxw8d0GdfTUhqzKiHUK9bO0ejXZJJDc42IBUm0HGueijom/uEa7+WgNl7R5nyXOD9+Z/WEd4c4GyPZjcnyYlb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dBstEDew; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBstEDew"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732193759; x=1763729759;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aChY3SmGRFV7DyQitvW0/HkVlK6xIiL1Oh6k03n76mI=;
  b=dBstEDew1eUP/zSEveQV4DBX+kxOmLS+2D5gECFmMbRqxpLOR6wkKyPA
   QgjGwS7vxCq3tEG/18+y1Nh1uEU46aJTZpWEjmHNJSYnOow1ibrtr3CvM
   qFHw61h3XDvNa0CabAbyCMZE8cHFva7aLfOWeSUxdzXbJlgyc3/jWeuxw
   5d/gKILWcfnhu7IicELkrDoaIOARreYo/+TrTskEzBI/FByVrNLF3VP3o
   ksf1elXdayHWOLFhdlPnqEs6VHODdSi6uQUuDL7qbgrI1kxhhQO97NfkV
   R9Gi8VzCwXISucTy9a74JJwZVuOqPjBrRAELDunLD1IzTvD8lYut+yqix
   A==;
X-CSE-ConnectionGUID: 9yB2YH5vR6ucIOkWAfPXpQ==
X-CSE-MsgGUID: Zu8ES1RwSP62ljzHBQef8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32154247"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="32154247"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 04:55:59 -0800
X-CSE-ConnectionGUID: /a48JonqT9KRXRjUiBQw8w==
X-CSE-MsgGUID: uI/xU0RNSvCD03nsH1TBRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="95046752"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Nov 2024 04:55:57 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tE6ix-0002zh-09;
	Thu, 21 Nov 2024 12:55:55 +0000
Date: Thu, 21 Nov 2024 20:55:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12091/12437] drivers/i2c/busses/i2c-xiic.c:932
 xiic_recv_atomic() warn: variable dereferenced before check 'i2c->rx_msg'
 (see line 930)
Message-ID: <202411212051.BPlSgiPR-lkp@intel.com>
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
head:   decc701f41d07481893fdea942c0ac6b226e84cd
commit: 8bba86687c0b6a22f05ed4a7398c519d3796bc74 [12091/12437] i2c: xiic: Add atomic transfer support
:::::: branch date: 7 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20241121 (https://download.01.org/0day-ci/archive/20241121/202411212051.BPlSgiPR-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411212051.BPlSgiPR-lkp@intel.com/

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
