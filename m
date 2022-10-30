Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89564612E
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Oct 2022 12:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667131765; x=1698667765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fJ8V/MgxRnQR8cDMMiUDXsZgDCx4H2f2yygchVEkOjo=;
  b=Zs24+nylJSB9OfLe5ZDtinX1vZ98FTHoPvqmUrQjyErenOQdNxK/HP5F
   7M/K9OwWdCWcV//6HJEEYjeEQuYgAkMOjzJT6XiLRebzSHptH9CehvsbL
   YKFomc+JVkxegm1uL2wzOGJcPWIVYclCCD35+Xd9eIVzo5mPQx1cmffhD
   Dtx2OLg7lsuTBBCk7ncDDRs3b3rU3N4KeOutYspmfSpa+3pE7iDckVNmc
   MCdscxpKJUe9D/DfnaI6z/6beLk4DwXISpjB8xIxjhQY/QVGwWYTSRQ3d
   muRmcpdBl6pS/gEe9aRPMixOpNplDs5w/C3KvtLS37sqhWtbDMSwqqDSV
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10515"; a="292031375"
X-IronPort-AV: E=Sophos;i="5.95,226,1661842800"; 
   d="scan'208";a="292031375"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2022 05:09:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10515"; a="696716592"
X-IronPort-AV: E=Sophos;i="5.95,226,1661842800"; 
   d="scan'208";a="696716592"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 30 Oct 2022 05:09:23 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1op77y-000C2o-2z;
	Sun, 30 Oct 2022 12:09:22 +0000
Date: Sun, 30 Oct 2022 20:09:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/ethernet/marvell/octeontx2/nic/cn10k_macsec.c:46:28:
 warning: Parameter 'secy' can be declared as pointer to const
 [constParameter]
Message-ID: <202210302058.AlFHX66S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/ethernet/marvell/octeontx2/nic/cn10k_macsec.c:46:28: warning: Parameter 'secy' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Subbaraya Sundeep <sbhatta@marvell.com>
CC: Sunil Goutham <sgoutham@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   882ad2a2a8ffa1defecdf907052f04da2737dc46
commit: c54ffc73601c0a239e55911923a6e23a2a74f143 octeontx2-pf: mcs: Introduce MACSEC hardware offloading
date:   4 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 4 weeks ago
compiler: mips64el-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout c54ffc73601c0a239e55911923a6e23a2a74f143
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/net/ethernet/marvell/octeontx2/nic/cn10k_macsec.c:288:3: warning: Consecutive return, break, continue, goto or throw statements are unnecessary. [duplicateBreak]
     goto fail;
     ^
   drivers/net/ethernet/marvell/octeontx2/nic/cn10k_macsec.c:598:3: warning: Consecutive return, break, continue, goto or throw statements are unnecessary. [duplicateBreak]
     goto fail;
     ^
>> drivers/net/ethernet/marvell/octeontx2/nic/cn10k_macsec.c:46:28: warning: Parameter 'secy' can be declared as pointer to const [constParameter]
          struct macsec_secy *secy)
                              ^
>> drivers/net/ethernet/marvell/octeontx2/nic/cn10k_macsec.c:60:29: warning: Parameter 'rx_sc' can be declared as pointer to const [constParameter]
          struct macsec_rx_sc *rx_sc)
                               ^
   drivers/net/ethernet/marvell/octeontx2/nic/cn10k_macsec.c:59:28: warning: Parameter 'secy' can be declared as pointer to const [constParameter]
          struct macsec_secy *secy,
                              ^
>> drivers/net/ethernet/marvell/octeontx2/nic/cn10k_macsec.c:51:13: warning: Uninitialized variable: txsc->sw_secy [uninitvar]
     if (txsc->sw_secy == secy)
               ^
>> drivers/net/ethernet/marvell/octeontx2/nic/cn10k_macsec.c:65:13: warning: Uninitialized variable: rxsc->sw_rxsc [uninitvar]
     if (rxsc->sw_rxsc == rx_sc && rxsc->sw_secy == secy)
               ^
>> drivers/net/ethernet/marvell/octeontx2/nic/cn10k_macsec.c:1012:34: warning: Uninitialized variable: rxsc->hw_sc_id [uninitvar]
     cn10k_mcs_sc_stats(pfvf, rxsc->hw_sc_id, &sc_rsp, MCS_RX, true);
                                    ^
   drivers/net/ethernet/marvell/octeontx2/nic/cn10k_macsec.c:997:58: note: Assuming condition is false
    if (secy->validate_frames == txsc->last_validate_frames &&
                                                            ^
   drivers/net/ethernet/marvell/octeontx2/nic/cn10k_macsec.c:1012:34: note: Uninitialized variable: rxsc->hw_sc_id
     cn10k_mcs_sc_stats(pfvf, rxsc->hw_sc_id, &sc_rsp, MCS_RX, true);
                                    ^

vim +/secy +46 drivers/net/ethernet/marvell/octeontx2/nic/cn10k_macsec.c

c54ffc73601c0a Subbaraya Sundeep 2022-10-01  44  
c54ffc73601c0a Subbaraya Sundeep 2022-10-01  45  static struct cn10k_mcs_txsc *cn10k_mcs_get_txsc(struct cn10k_mcs_cfg *cfg,
c54ffc73601c0a Subbaraya Sundeep 2022-10-01 @46  						 struct macsec_secy *secy)
c54ffc73601c0a Subbaraya Sundeep 2022-10-01  47  {
c54ffc73601c0a Subbaraya Sundeep 2022-10-01  48  	struct cn10k_mcs_txsc *txsc;
c54ffc73601c0a Subbaraya Sundeep 2022-10-01  49  
c54ffc73601c0a Subbaraya Sundeep 2022-10-01  50  	list_for_each_entry(txsc, &cfg->txsc_list, entry) {
c54ffc73601c0a Subbaraya Sundeep 2022-10-01 @51  		if (txsc->sw_secy == secy)
c54ffc73601c0a Subbaraya Sundeep 2022-10-01  52  			return txsc;
c54ffc73601c0a Subbaraya Sundeep 2022-10-01  53  	}
c54ffc73601c0a Subbaraya Sundeep 2022-10-01  54  
c54ffc73601c0a Subbaraya Sundeep 2022-10-01  55  	return NULL;
c54ffc73601c0a Subbaraya Sundeep 2022-10-01  56  }
c54ffc73601c0a Subbaraya Sundeep 2022-10-01  57  
c54ffc73601c0a Subbaraya Sundeep 2022-10-01  58  static struct cn10k_mcs_rxsc *cn10k_mcs_get_rxsc(struct cn10k_mcs_cfg *cfg,
c54ffc73601c0a Subbaraya Sundeep 2022-10-01  59  						 struct macsec_secy *secy,
c54ffc73601c0a Subbaraya Sundeep 2022-10-01 @60  						 struct macsec_rx_sc *rx_sc)
c54ffc73601c0a Subbaraya Sundeep 2022-10-01  61  {
c54ffc73601c0a Subbaraya Sundeep 2022-10-01  62  	struct cn10k_mcs_rxsc *rxsc;
c54ffc73601c0a Subbaraya Sundeep 2022-10-01  63  
c54ffc73601c0a Subbaraya Sundeep 2022-10-01  64  	list_for_each_entry(rxsc, &cfg->rxsc_list, entry) {
c54ffc73601c0a Subbaraya Sundeep 2022-10-01 @65  		if (rxsc->sw_rxsc == rx_sc && rxsc->sw_secy == secy)
c54ffc73601c0a Subbaraya Sundeep 2022-10-01  66  			return rxsc;
c54ffc73601c0a Subbaraya Sundeep 2022-10-01  67  	}
c54ffc73601c0a Subbaraya Sundeep 2022-10-01  68  
c54ffc73601c0a Subbaraya Sundeep 2022-10-01  69  	return NULL;
c54ffc73601c0a Subbaraya Sundeep 2022-10-01  70  }
c54ffc73601c0a Subbaraya Sundeep 2022-10-01  71  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
