Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5861C29
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Feb 2023 10:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675418814; x=1706954814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dfZRg/E2Y4+DQ0lpPT15TSKrb0iqkOgNHNRsX5cxCKI=;
  b=icpy663LjFotClis/qvMyDItUDiDCEk5586dBSqvM2q2A3nH+MBC15KU
   9gMi9VhFl1yPR4NMe5F8AZymsCDtdmqtudBfWo/ajRo06nxtyqINqW2oh
   60P45Di0cvJBLlZ4W3p8LiterIhWIcLmgwZnv/OBwoSd6KJHSoTsu9mmC
   yW7ONna066FH6WjOVevMZsIuPaLEH3aZkrSV5ODXDTJdOIpzRLuHZoTo3
   XWkwsRd7NcUzvqt5gsks0el2sZZRQlbTqCoznMycMImx7J0xgwboJlA2m
   rQYFvPzz7xHMaG0DRbeZdmzsMaoOY3C5JdLniljpmI4JZ9oeStlMFYos0
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="308351416"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="308351416"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 02:06:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="696119553"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="696119553"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Feb 2023 02:06:52 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNsy4-0000Nl-05;
	Fri, 03 Feb 2023 10:06:52 +0000
Date: Fri, 3 Feb 2023 18:06:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/ncsi/ncsi-rsp.c:471 ncsi_rsp_handler_sma() warn: potential
 spectre issue 'ncf->addrs' [r]
Message-ID: <202302031757.Iw0AcvtL-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   66a87fff1a87c260452f5a57123891ca5258c449
commit: 54d9469bc515dc5fcbc20eecbe19cea868b70d68 fortify: Add run-time WARN for cross-field memcpy()
date:   5 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 5 months ago
config: mips-randconfig-m031-20230202 (https://download.01.org/0day-ci/archive/20230203/202302031757.Iw0AcvtL-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
net/ncsi/ncsi-rsp.c:471 ncsi_rsp_handler_sma() warn: potential spectre issue 'ncf->addrs' [r]

Old smatch warnings:
net/ncsi/ncsi-rsp.c:373 ncsi_rsp_handler_svf() warn: potential spectre issue 'ncf->vids' [w]

vim +471 net/ncsi/ncsi-rsp.c

138635cc27c973 Gavin Shan           2016-07-19  434  
138635cc27c973 Gavin Shan           2016-07-19  435  static int ncsi_rsp_handler_sma(struct ncsi_request *nr)
138635cc27c973 Gavin Shan           2016-07-19  436  {
138635cc27c973 Gavin Shan           2016-07-19  437  	struct ncsi_cmd_sma_pkt *cmd;
138635cc27c973 Gavin Shan           2016-07-19  438  	struct ncsi_rsp_pkt *rsp;
138635cc27c973 Gavin Shan           2016-07-19  439  	struct ncsi_dev_priv *ndp = nr->ndp;
138635cc27c973 Gavin Shan           2016-07-19  440  	struct ncsi_channel *nc;
062b3e1b6d4f2a Samuel Mendoza-Jonas 2018-04-17  441  	struct ncsi_channel_mac_filter *ncf;
062b3e1b6d4f2a Samuel Mendoza-Jonas 2018-04-17  442  	unsigned long flags;
138635cc27c973 Gavin Shan           2016-07-19  443  	void *bitmap;
062b3e1b6d4f2a Samuel Mendoza-Jonas 2018-04-17  444  	bool enabled;
062b3e1b6d4f2a Samuel Mendoza-Jonas 2018-04-17  445  	int index;
062b3e1b6d4f2a Samuel Mendoza-Jonas 2018-04-17  446  
138635cc27c973 Gavin Shan           2016-07-19  447  
138635cc27c973 Gavin Shan           2016-07-19  448  	/* Find the package and channel */
138635cc27c973 Gavin Shan           2016-07-19  449  	rsp = (struct ncsi_rsp_pkt *)skb_network_header(nr->rsp);
138635cc27c973 Gavin Shan           2016-07-19  450  	ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
138635cc27c973 Gavin Shan           2016-07-19  451  				      NULL, &nc);
138635cc27c973 Gavin Shan           2016-07-19  452  	if (!nc)
138635cc27c973 Gavin Shan           2016-07-19  453  		return -ENODEV;
138635cc27c973 Gavin Shan           2016-07-19  454  
138635cc27c973 Gavin Shan           2016-07-19  455  	/* According to NCSI spec 1.01, the mixed filter table
138635cc27c973 Gavin Shan           2016-07-19  456  	 * isn't supported yet.
138635cc27c973 Gavin Shan           2016-07-19  457  	 */
138635cc27c973 Gavin Shan           2016-07-19  458  	cmd = (struct ncsi_cmd_sma_pkt *)skb_network_header(nr->cmd);
062b3e1b6d4f2a Samuel Mendoza-Jonas 2018-04-17  459  	enabled = cmd->at_e & 0x1;
062b3e1b6d4f2a Samuel Mendoza-Jonas 2018-04-17  460  	ncf = &nc->mac_filter;
062b3e1b6d4f2a Samuel Mendoza-Jonas 2018-04-17  461  	bitmap = &ncf->bitmap;
138635cc27c973 Gavin Shan           2016-07-19  462  
990a9d4975c974 Dan Carpenter        2018-05-17  463  	if (cmd->index == 0 ||
990a9d4975c974 Dan Carpenter        2018-05-17  464  	    cmd->index > ncf->n_uc + ncf->n_mc + ncf->n_mixed)
138635cc27c973 Gavin Shan           2016-07-19  465  		return -ERANGE;
138635cc27c973 Gavin Shan           2016-07-19  466  
062b3e1b6d4f2a Samuel Mendoza-Jonas 2018-04-17  467  	index = (cmd->index - 1) * ETH_ALEN;
062b3e1b6d4f2a Samuel Mendoza-Jonas 2018-04-17  468  	spin_lock_irqsave(&nc->lock, flags);
062b3e1b6d4f2a Samuel Mendoza-Jonas 2018-04-17  469  	if (enabled) {
062b3e1b6d4f2a Samuel Mendoza-Jonas 2018-04-17  470  		set_bit(cmd->index - 1, bitmap);
062b3e1b6d4f2a Samuel Mendoza-Jonas 2018-04-17 @471  		memcpy(&ncf->addrs[index], cmd->mac, ETH_ALEN);
138635cc27c973 Gavin Shan           2016-07-19  472  	} else {
062b3e1b6d4f2a Samuel Mendoza-Jonas 2018-04-17  473  		clear_bit(cmd->index - 1, bitmap);
49b0aa1b658570 Miaohe Lin           2020-07-23  474  		eth_zero_addr(&ncf->addrs[index]);
138635cc27c973 Gavin Shan           2016-07-19  475  	}
062b3e1b6d4f2a Samuel Mendoza-Jonas 2018-04-17  476  	spin_unlock_irqrestore(&nc->lock, flags);
138635cc27c973 Gavin Shan           2016-07-19  477  
138635cc27c973 Gavin Shan           2016-07-19  478  	return 0;
138635cc27c973 Gavin Shan           2016-07-19  479  }
138635cc27c973 Gavin Shan           2016-07-19  480  

:::::: The code at line 471 was first introduced by commit
:::::: 062b3e1b6d4f2a33c1d0fd7ae9b4550da5cf7e4b net/ncsi: Refactor MAC, VLAN filters

:::::: TO: Samuel Mendoza-Jonas <sam@mendozajonas.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
