Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC351C08
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Jan 2023 13:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673011340; x=1704547340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=86RcxwkOnoOew9FJ57dpcQGbSaiJSkWNR3YEIwZ+LsE=;
  b=JaCFSfKiVltKdvWK/Wqrs1bf9XC+Ufh7ucxlhkp5+KAtfWSxn7zcE8id
   u/X+jyuXeT9ic4rvshx5TLrm+JhkTZKkA+FwYiuCNR2AzOcFng99yWrgh
   f1/9hIxNwNDoe0Qrn9eCV8eQYhWQyBL7JNVu6KqZUwHy2bur9WTFLdjm8
   ktZBp3K0m4sMamc1FOv6LcpGFz/UK9MPf7Qb8CSZx6rP5kNtPh+pPsGiV
   3EcWXe/Pz7GbLBtEhmR3KEijI5MtiZ5JL9LrfHKkrCHEg6HzdaRpPH60h
   KFPBEYoXxpuPbo9gyTJuGkmCTwgHQ764fHnMQsGIwZ/fwJc3TW2y+08WR
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="320179480"
X-IronPort-AV: E=Sophos;i="5.96,305,1665471600"; 
   d="scan'208";a="320179480"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2023 05:22:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="798279084"
X-IronPort-AV: E=Sophos;i="5.96,305,1665471600"; 
   d="scan'208";a="798279084"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 06 Jan 2023 05:22:14 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pDmfl-0003Qa-1x;
	Fri, 06 Jan 2023 13:22:13 +0000
Date: Fri, 6 Jan 2023 21:21:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/ethernet/renesas/rswitch.c:177:72: warning: Parameter
 'dis' can be declared as pointer to const [constParameter]
Message-ID: <202301062127.HPfzJb78-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/ethernet/renesas/rswitch.c:177:72: warning: Parameter 'dis' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1f5abbd77e2c1787e74b7c2caffac97def78ba52
commit: 3590918b5d07aa5e4702f753c375adb4868d3abd net: ethernet: renesas: Add support for "Ethernet Switch"
date:   9 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 9 weeks ago
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 3590918b5d07aa5e4702f753c375adb4868d3abd
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/ethernet/renesas/rswitch.c:177:72: warning: Parameter 'dis' can be declared as pointer to const [constParameter]
   static bool rswitch_is_any_data_irq(struct rswitch_private *priv, u32 *dis, bool tx)
                                                                          ^
   drivers/net/ethernet/renesas/rswitch.c:790:72: warning: Parameter 'dis' can be declared as pointer to const [constParameter]
   static irqreturn_t rswitch_data_irq(struct rswitch_private *priv, u32 *dis)
                                                                          ^

vim +/dis +177 drivers/net/ethernet/renesas/rswitch.c

3590918b5d07aa Yoshihiro Shimoda 2022-10-31  176  
3590918b5d07aa Yoshihiro Shimoda 2022-10-31 @177  static bool rswitch_is_any_data_irq(struct rswitch_private *priv, u32 *dis, bool tx)
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  178  {
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  179  	u32 *mask = tx ? priv->gwca.tx_irq_bits : priv->gwca.rx_irq_bits;
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  180  	int i;
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  181  
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  182  	for (i = 0; i < RSWITCH_NUM_IRQ_REGS; i++) {
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  183  		if (dis[i] & mask[i])
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  184  			return true;
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  185  	}
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  186  
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  187  	return false;
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  188  }
3590918b5d07aa Yoshihiro Shimoda 2022-10-31  189  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
