Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A883D60
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Mar 2023 23:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678059655; x=1709595655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=if+3kFxWpSzNEGA9JWj5QR44idyxZYTUfMmAwmTCpkI=;
  b=PgyFMA4ale69ggC/+g56CQMmoXfAHRa6q+vF8VHiETN0i3/IJsWUokxV
   vPIlSnVGgkxM9zfqEKR2npp+2oQmevrHeBHYgQU7HoNjGk8t0HvrLnc3g
   YaaL6QjkemV0wSSSb4vppRNiJOanqnNE8oLx3KsWg5ZE6oIHc9l2ZDwfx
   aY2HTVo++1lot4s548EL+B3GmL67tDuKuFgvWcNQwQWxYipWz0y8+IboK
   cPeMh1VvDOikNZ+Zw3fz+bp1cwpJG12vWh8cB0693yOvYpkhXdttv7NzN
   DmluXICqvWGkmoeMoCL/rup9KQzR/yfgWQMuvVFnv/HoomGE5ewGniFc0
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="315094202"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="315094202"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 15:40:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="669257422"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="669257422"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 05 Mar 2023 15:40:52 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYxyF-0003B0-1h;
	Sun, 05 Mar 2023 23:40:51 +0000
Date: Mon, 6 Mar 2023 07:39:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:auto-update-v2 4/14] drivers/mailbox/mailbox-mpfs.c:155:9:
 warning: Unused variable: status [unusedVariable]
Message-ID: <202303060721.OGn23rg6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/mailbox/mailbox-mpfs.c:155:9: warning: Unused variable: status [unusedVariable]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git auto-update-v2
head:   4765222a84e88ed3bf89a7dcabdd520e60018f5b
commit: 7246ae2be2c223d9e8ff78a45b08f72218716f75 [4/14] mailbox: mpfs: check the service status in .tx_done
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 7246ae2be2c223d9e8ff78a45b08f72218716f75
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303060721.OGn23rg6-lkp@intel.com/


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/mailbox/mailbox-mpfs.c:155:9: warning: Unused variable: status [unusedVariable]
    u32 i, status;
           ^

vim +155 drivers/mailbox/mailbox-mpfs.c

83d7b1560810e0 Conor Dooley 2021-06-24  149  
83d7b1560810e0 Conor Dooley 2021-06-24  150  static void mpfs_mbox_rx_data(struct mbox_chan *chan)
83d7b1560810e0 Conor Dooley 2021-06-24  151  {
83d7b1560810e0 Conor Dooley 2021-06-24  152  	struct mpfs_mbox *mbox = (struct mpfs_mbox *)chan->con_priv;
83d7b1560810e0 Conor Dooley 2021-06-24  153  	struct mpfs_mss_response *response = mbox->response;
83d7b1560810e0 Conor Dooley 2021-06-24  154  	u16 num_words = ALIGN((response->resp_size), (4)) / 4U;
ab47d0bfdf88fa Conor Dooley 2022-11-23 @155  	u32 i, status;
83d7b1560810e0 Conor Dooley 2021-06-24  156  
83d7b1560810e0 Conor Dooley 2021-06-24  157  	if (!response->resp_msg) {
83d7b1560810e0 Conor Dooley 2021-06-24  158  		dev_err(mbox->dev, "failed to assign memory for response %d\n", -ENOMEM);
83d7b1560810e0 Conor Dooley 2021-06-24  159  		return;
83d7b1560810e0 Conor Dooley 2021-06-24  160  	}
83d7b1560810e0 Conor Dooley 2021-06-24  161  
ab47d0bfdf88fa Conor Dooley 2022-11-23  162  	/*
ab47d0bfdf88fa Conor Dooley 2022-11-23  163  	 * We should *never* get an interrupt while the controller is
ab47d0bfdf88fa Conor Dooley 2022-11-23  164  	 * still in the busy state. If we do, something has gone badly
ab47d0bfdf88fa Conor Dooley 2022-11-23  165  	 * wrong & the content of the mailbox would not be valid.
ab47d0bfdf88fa Conor Dooley 2022-11-23  166  	 */
ab47d0bfdf88fa Conor Dooley 2022-11-23  167  	if (mpfs_mbox_busy(mbox)) {
ab47d0bfdf88fa Conor Dooley 2022-11-23  168  		dev_err(mbox->dev, "got an interrupt but system controller is busy\n");
ab47d0bfdf88fa Conor Dooley 2022-11-23  169  		response->resp_status = 0xDEAD;
ab47d0bfdf88fa Conor Dooley 2022-11-23  170  		return;
ab47d0bfdf88fa Conor Dooley 2022-11-23  171  	}
ab47d0bfdf88fa Conor Dooley 2022-11-23  172  
83d7b1560810e0 Conor Dooley 2021-06-24  173  	for (i = 0; i < num_words; i++) {
83d7b1560810e0 Conor Dooley 2021-06-24  174  		response->resp_msg[i] =
2e10289d1f304f Conor Dooley 2022-08-24  175  			readl_relaxed(mbox->mbox_base
83d7b1560810e0 Conor Dooley 2021-06-24  176  				      + mbox->resp_offset + i * 0x4);
83d7b1560810e0 Conor Dooley 2021-06-24  177  	}
83d7b1560810e0 Conor Dooley 2021-06-24  178  
83d7b1560810e0 Conor Dooley 2021-06-24  179  	mbox_chan_received_data(chan, response);
83d7b1560810e0 Conor Dooley 2021-06-24  180  }
83d7b1560810e0 Conor Dooley 2021-06-24  181  

:::::: The code at line 155 was first introduced by commit
:::::: ab47d0bfdf88faac0eb02749e5bfaa306e004300 mailbox: mpfs: read the system controller's status

:::::: TO: Conor Dooley <conor.dooley@microchip.com>
:::::: CC: Jassi Brar <jaswinder.singh@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
