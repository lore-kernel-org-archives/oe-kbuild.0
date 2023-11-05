Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8696A15ACE
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Nov 2023 17:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MtytBIQn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699205301; x=1730741301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qoncaNqDFeTme6LDtFIopvuUDYAKH5zjROlr7KXZvts=;
  b=MtytBIQnrmRJQ4R7SgK/hvVSanwm7qVRA3L/zqWIkliflQekIL+aElGn
   OrtQkHPHrs0bTpql3Z6vKY77Ymp9NSNVzXeiCw4RhG5EUwWOXKjQNHPiD
   uX/co0z4aRnxG8wOH5CmLCe4so+TL0g92KLGzyQS/j0Khu59WLnuHkRu9
   7dr73R8BCZuumNR7cy+SsAnsP/lC4u+m2oIQwprJyrrPzsIBiAgJCZjJt
   5mbxfkEhjDJIu/K9BNa/l8hdxSLVlwspmEd8CjsuofRynmcRdfFFyTVq7
   35wsZqZ05K/WdIXV0Kex3R4IfdLl4LLivli7d0kki2bN6p0KtUCCMnUy5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="392029087"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="392029087"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 09:28:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="738591948"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="738591948"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 05 Nov 2023 09:28:19 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzgv3-0005fJ-2a;
	Sun, 05 Nov 2023 17:28:17 +0000
Date: Mon, 6 Nov 2023 01:28:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/target/iscsi/cxgbit/cxgbit_target.c:1441
 cxgbit_lro_skb_merge() warn: potential spectre issue 'ssi->frags' [r]
Message-ID: <202311060100.l7mud1S5-lkp@intel.com>
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
head:   1c41041124bd14dd6610da256a3da4e5b74ce6b1
commit: 54d9469bc515dc5fcbc20eecbe19cea868b70d68 fortify: Add run-time WARN for cross-field memcpy()
date:   1 year, 2 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 1 year, 2 months ago
config: i386-randconfig-141-20231026 (https://download.01.org/0day-ci/archive/20231106/202311060100.l7mud1S5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311060100.l7mud1S5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311060100.l7mud1S5-lkp@intel.com/

smatch warnings:
drivers/target/iscsi/cxgbit/cxgbit_target.c:1441 cxgbit_lro_skb_merge() warn: potential spectre issue 'ssi->frags' [r]

vim +1441 drivers/target/iscsi/cxgbit/cxgbit_target.c

9730ffcb8957e1 Varun Prakash           2016-04-20  1422  
9730ffcb8957e1 Varun Prakash           2016-04-20  1423  static void
9730ffcb8957e1 Varun Prakash           2016-04-20  1424  cxgbit_lro_skb_merge(struct cxgbit_sock *csk, struct sk_buff *skb, u8 pdu_idx)
9730ffcb8957e1 Varun Prakash           2016-04-20  1425  {
9730ffcb8957e1 Varun Prakash           2016-04-20  1426  	struct sk_buff *hskb = csk->lro_hskb;
9730ffcb8957e1 Varun Prakash           2016-04-20  1427  	struct cxgbit_lro_pdu_cb *hpdu_cb = cxgbit_skb_lro_pdu_cb(hskb, 0);
9730ffcb8957e1 Varun Prakash           2016-04-20  1428  	struct cxgbit_lro_pdu_cb *pdu_cb = cxgbit_skb_lro_pdu_cb(skb, pdu_idx);
9730ffcb8957e1 Varun Prakash           2016-04-20  1429  	struct skb_shared_info *hssi = skb_shinfo(hskb);
9730ffcb8957e1 Varun Prakash           2016-04-20  1430  	struct skb_shared_info *ssi = skb_shinfo(skb);
9730ffcb8957e1 Varun Prakash           2016-04-20  1431  	unsigned int len = 0;
9730ffcb8957e1 Varun Prakash           2016-04-20  1432  
9730ffcb8957e1 Varun Prakash           2016-04-20  1433  	if (pdu_cb->flags & PDUCBF_RX_HDR) {
79e57cfe00f40d Varun Prakash           2017-01-13  1434  		u8 hfrag_idx = hssi->nr_frags;
79e57cfe00f40d Varun Prakash           2017-01-13  1435  
79e57cfe00f40d Varun Prakash           2017-01-13  1436  		hpdu_cb->flags |= pdu_cb->flags;
9730ffcb8957e1 Varun Prakash           2016-04-20  1437  		hpdu_cb->seq = pdu_cb->seq;
9730ffcb8957e1 Varun Prakash           2016-04-20  1438  		hpdu_cb->hdr = pdu_cb->hdr;
9730ffcb8957e1 Varun Prakash           2016-04-20  1439  		hpdu_cb->hlen = pdu_cb->hlen;
9730ffcb8957e1 Varun Prakash           2016-04-20  1440  
79e57cfe00f40d Varun Prakash           2017-01-13 @1441  		memcpy(&hssi->frags[hfrag_idx], &ssi->frags[pdu_cb->hfrag_idx],
9730ffcb8957e1 Varun Prakash           2016-04-20  1442  		       sizeof(skb_frag_t));
9730ffcb8957e1 Varun Prakash           2016-04-20  1443  
79e57cfe00f40d Varun Prakash           2017-01-13  1444  		get_page(skb_frag_page(&hssi->frags[hfrag_idx]));
79e57cfe00f40d Varun Prakash           2017-01-13  1445  		hssi->nr_frags++;
79e57cfe00f40d Varun Prakash           2017-01-13  1446  		hpdu_cb->frags++;
79e57cfe00f40d Varun Prakash           2017-01-13  1447  		hpdu_cb->hfrag_idx = hfrag_idx;
9730ffcb8957e1 Varun Prakash           2016-04-20  1448  
92493a2f8a8d5a Matthew Wilcox (Oracle  2019-07-24  1449) 		len = skb_frag_size(&hssi->frags[hfrag_idx]);
79e57cfe00f40d Varun Prakash           2017-01-13  1450  		hskb->len += len;
79e57cfe00f40d Varun Prakash           2017-01-13  1451  		hskb->data_len += len;
79e57cfe00f40d Varun Prakash           2017-01-13  1452  		hskb->truesize += len;
9730ffcb8957e1 Varun Prakash           2016-04-20  1453  	}
9730ffcb8957e1 Varun Prakash           2016-04-20  1454  
9730ffcb8957e1 Varun Prakash           2016-04-20  1455  	if (pdu_cb->flags & PDUCBF_RX_DATA) {
79e57cfe00f40d Varun Prakash           2017-01-13  1456  		u8 dfrag_idx = hssi->nr_frags, i;
9730ffcb8957e1 Varun Prakash           2016-04-20  1457  
9730ffcb8957e1 Varun Prakash           2016-04-20  1458  		hpdu_cb->flags |= pdu_cb->flags;
79e57cfe00f40d Varun Prakash           2017-01-13  1459  		hpdu_cb->dfrag_idx = dfrag_idx;
9730ffcb8957e1 Varun Prakash           2016-04-20  1460  
9730ffcb8957e1 Varun Prakash           2016-04-20  1461  		len = 0;
79e57cfe00f40d Varun Prakash           2017-01-13  1462  		for (i = 0; i < pdu_cb->nr_dfrags; dfrag_idx++, i++) {
79e57cfe00f40d Varun Prakash           2017-01-13  1463  			memcpy(&hssi->frags[dfrag_idx],
9730ffcb8957e1 Varun Prakash           2016-04-20  1464  			       &ssi->frags[pdu_cb->dfrag_idx + i],
9730ffcb8957e1 Varun Prakash           2016-04-20  1465  			       sizeof(skb_frag_t));
9730ffcb8957e1 Varun Prakash           2016-04-20  1466  
79e57cfe00f40d Varun Prakash           2017-01-13  1467  			get_page(skb_frag_page(&hssi->frags[dfrag_idx]));
9730ffcb8957e1 Varun Prakash           2016-04-20  1468  
d7840976e39156 Matthew Wilcox (Oracle  2019-07-22  1469) 			len += skb_frag_size(&hssi->frags[dfrag_idx]);
9730ffcb8957e1 Varun Prakash           2016-04-20  1470  
9730ffcb8957e1 Varun Prakash           2016-04-20  1471  			hssi->nr_frags++;
9730ffcb8957e1 Varun Prakash           2016-04-20  1472  			hpdu_cb->frags++;
9730ffcb8957e1 Varun Prakash           2016-04-20  1473  		}
9730ffcb8957e1 Varun Prakash           2016-04-20  1474  
9730ffcb8957e1 Varun Prakash           2016-04-20  1475  		hpdu_cb->dlen = pdu_cb->dlen;
9730ffcb8957e1 Varun Prakash           2016-04-20  1476  		hpdu_cb->doffset = hpdu_cb->hlen;
9730ffcb8957e1 Varun Prakash           2016-04-20  1477  		hpdu_cb->nr_dfrags = pdu_cb->nr_dfrags;
9730ffcb8957e1 Varun Prakash           2016-04-20  1478  		hskb->len += len;
9730ffcb8957e1 Varun Prakash           2016-04-20  1479  		hskb->data_len += len;
9730ffcb8957e1 Varun Prakash           2016-04-20  1480  		hskb->truesize += len;
9730ffcb8957e1 Varun Prakash           2016-04-20  1481  	}
9730ffcb8957e1 Varun Prakash           2016-04-20  1482  
9730ffcb8957e1 Varun Prakash           2016-04-20  1483  	if (pdu_cb->flags & PDUCBF_RX_STATUS) {
9730ffcb8957e1 Varun Prakash           2016-04-20  1484  		hpdu_cb->flags |= pdu_cb->flags;
9730ffcb8957e1 Varun Prakash           2016-04-20  1485  
9730ffcb8957e1 Varun Prakash           2016-04-20  1486  		if (hpdu_cb->flags & PDUCBF_RX_DATA)
9730ffcb8957e1 Varun Prakash           2016-04-20  1487  			hpdu_cb->flags &= ~PDUCBF_RX_DATA_DDPD;
9730ffcb8957e1 Varun Prakash           2016-04-20  1488  
9730ffcb8957e1 Varun Prakash           2016-04-20  1489  		hpdu_cb->ddigest = pdu_cb->ddigest;
9730ffcb8957e1 Varun Prakash           2016-04-20  1490  		hpdu_cb->pdulen = pdu_cb->pdulen;
9730ffcb8957e1 Varun Prakash           2016-04-20  1491  	}
9730ffcb8957e1 Varun Prakash           2016-04-20  1492  }
9730ffcb8957e1 Varun Prakash           2016-04-20  1493  

:::::: The code at line 1441 was first introduced by commit
:::::: 79e57cfe00f40d509e2d007a5662db26cdbc74db target/cxgbit: add T6 iSCSI DDP completion feature

:::::: TO: Varun Prakash <varun@chelsio.com>
:::::: CC: Nicholas Bellinger <nab@linux-iscsi.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
