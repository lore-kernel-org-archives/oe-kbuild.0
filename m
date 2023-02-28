Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0BE9459
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Feb 2023 19:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677613132; x=1709149132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/U3LbuPov+dNWInaRofRjUOX+52VXnK174vZGyWr3P8=;
  b=WPXkEq8tUnUAxlajODXkDJ3MG55HWCbVD6FDhWw3GfZR6wWLeHDovSkG
   gKJclNXqOProgxZCajjJv758a2x/M3st7LS1JggxH7fRsOLmuAYVE9sah
   Jphe6IZMfGA0ZsrebmD0x7DHNPqzip3d3otKRjdTjwOKJo0LfWHDEGc72
   DOQXc8UWapuSneSJw0t2wYG+XoB4RPxXSUx19xhsGs0UCeXavq1MdPy+0
   5/EAtNceFbMsDfrlRjQUkkQcjLRknOCU1feZwA2KEq4tBEBgEV7fM8Arw
   H3PvsbpiS9CjaYmxyS5J9WN1/Zv8d2h8tTjvezdl+ulNecIUrNxUIp9fG
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="322487861"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; 
   d="scan'208";a="322487861"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 11:38:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="1003348988"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; 
   d="scan'208";a="1003348988"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Feb 2023 11:38:50 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pX5oH-0005bf-2J;
	Tue, 28 Feb 2023 19:38:49 +0000
Date: Wed, 1 Mar 2023 03:38:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/target/iscsi/cxgbit/cxgbit_target.c:1441
 cxgbit_lro_skb_merge() warn: potential spectre issue 'ssi->frags' [r]
Message-ID: <202303010331.AqRvJJHI-lkp@intel.com>
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
head:   e492250d5252635b6c97d52eddf2792ec26f1ec1
commit: 54d9469bc515dc5fcbc20eecbe19cea868b70d68 fortify: Add run-time WARN for cross-field memcpy()
date:   6 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-m001-20230227 (https://download.01.org/0day-ci/archive/20230301/202303010331.AqRvJJHI-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303010331.AqRvJJHI-lkp@intel.com/

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
https://github.com/intel/lkp-tests
