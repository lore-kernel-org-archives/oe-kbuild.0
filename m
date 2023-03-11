Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D01C7B
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Mar 2023 07:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678518345; x=1710054345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+32dAxJHCOZQILTCpqqJGuBD8EqgLL4ZwWomm8S0+mw=;
  b=Fh0IBITBBEps6owrf+Eilm0JQiOlzaTjiEZBE9Z3fhV0Cs89t3wbhXAf
   tJIGZUOfK0ohAh6pmsX5I9bQBdK7K9DUpJUeHLsKjNLWUXEG96VlQGobp
   bp/ZVD+877yXy9YGUakz5YXJR7xoRWIK0VgrwAPLsH1tFAl6OhMpNoIQQ
   KEEJujTix7F3eQlyhxl7WnbkE3ymt/4w4Vq9SgmKCdFpDqVkBXDc0SOPZ
   WHwdYS2T+OBbxzIxVnVseiMug/umZzSUNCCJ2xJMvWzvPT6fkDh23PWOV
   dhTMfv8WeZzziqZKXx6lRVBeNhMgA0roihotiPprloomxaZSljGPKY2y3
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="320733424"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="320733424"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 23:05:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="710548889"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="710548889"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 10 Mar 2023 23:05:43 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1patIV-0004Pt-0K;
	Sat, 11 Mar 2023 07:05:43 +0000
Date: Sat, 11 Mar 2023 15:04:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/nfc/st-nci/se.c:357 st_nci_hci_connectivity_event_received()
 warn: possible spectre second half.  'params_len'
Message-ID: <202303111538.sOHpm97N-lkp@intel.com>
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
TO: Martin Faltesek <mfaltesek@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Guenter Roeck <groeck@google.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ef5f68cc1f829b492b19cd4df5af4454aa816b93
commit: 0254f31a7df3bb3b90c2d9dd2d4052f7b95eb287 nfc: st-nci: fix incorrect sizing calculations in EVT_TRANSACTION
date:   4 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 4 months ago
config: ia64-randconfig-m041-20230308 (https://download.01.org/0day-ci/archive/20230311/202303111538.sOHpm97N-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303111538.sOHpm97N-lkp@intel.com/

New smatch warnings:
drivers/nfc/st-nci/se.c:357 st_nci_hci_connectivity_event_received() warn: possible spectre second half.  'params_len'

Old smatch warnings:
drivers/nfc/st-nci/se.c:351 st_nci_hci_connectivity_event_received() warn: potential spectre issue 'skb->data' [r]

vim +/params_len +357 drivers/nfc/st-nci/se.c

8ae01f7967718a drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  302  
8ae01f7967718a drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  303  /*
8ae01f7967718a drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  304   * Returns:
8ae01f7967718a drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  305   * <= 0: driver handled the event, skb consumed
8ae01f7967718a drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  306   *    1: driver does not handle the event, please do standard processing
8ae01f7967718a drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  307   */
ed06aeefdac348 drivers/nfc/st-nci/st-nci_se.c     Christophe Ricard 2015-06-09  308  static int st_nci_hci_connectivity_event_received(struct nci_dev *ndev,
8ae01f7967718a drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  309  						u8 host, u8 event,
8ae01f7967718a drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  310  						struct sk_buff *skb)
8ae01f7967718a drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  311  {
8ae01f7967718a drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  312  	int r = 0;
5d1ceb7f5e56ae drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  313  	struct device *dev = &ndev->nfc_dev->dev;
5d1ceb7f5e56ae drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  314  	struct nfc_evt_transaction *transaction;
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  315  	u32 aid_len;
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  316  	u8 params_len;
8ae01f7967718a drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  317  
8ae01f7967718a drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  318  	pr_debug("connectivity gate event: %x\n", event);
8ae01f7967718a drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  319  
8ae01f7967718a drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  320  	switch (event) {
ed06aeefdac348 drivers/nfc/st-nci/st-nci_se.c     Christophe Ricard 2015-06-09  321  	case ST_NCI_EVT_CONNECTIVITY:
25960c2176112f drivers/nfc/st-nci/se.c            Christophe Ricard 2015-12-23  322  		r = nfc_se_connectivity(ndev->nfc_dev, host);
8ae01f7967718a drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  323  	break;
ed06aeefdac348 drivers/nfc/st-nci/st-nci_se.c     Christophe Ricard 2015-06-09  324  	case ST_NCI_EVT_TRANSACTION:
1dab57f0ed753d drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-03-31  325  		/* According to specification etsi 102 622
1dab57f0ed753d drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-03-31  326  		 * 11.2.2.4 EVT_TRANSACTION Table 52
1dab57f0ed753d drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-03-31  327  		 * Description  Tag     Length
1dab57f0ed753d drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-03-31  328  		 * AID          81      5 to 16
1dab57f0ed753d drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-03-31  329  		 * PARAMETERS   82      0 to 255
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  330  		 *
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  331  		 * The key differences are aid storage length is variably sized
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  332  		 * in the packet, but fixed in nfc_evt_transaction, and that
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  333  		 * the aid_len is u8 in the packet, but u32 in the structure,
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  334  		 * and the tags in the packet are not included in
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  335  		 * nfc_evt_transaction.
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  336  		 *
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  337  		 * size(b):  1          1       5-16 1             1           0-255
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  338  		 * offset:   0          1       2    aid_len + 2   aid_len + 3 aid_len + 4
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  339  		 * mem name: aid_tag(M) aid_len aid  params_tag(M) params_len  params
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  340  		 * example:  0x81       5-16    X    0x82          0-255       X
1dab57f0ed753d drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-03-31  341  		 */
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  342  		if (skb->len < 2 || skb->data[0] != NFC_EVT_TRANSACTION_AID_TAG)
5d1ceb7f5e56ae drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  343  			return -EPROTO;
5d1ceb7f5e56ae drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  344  
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  345  		aid_len = skb->data[1];
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  346  
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  347  		if (skb->len < aid_len + 4 ||
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  348  		    aid_len > sizeof(transaction->aid))
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  349  			return -EPROTO;
5d1ceb7f5e56ae drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  350  
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  351  		params_len = skb->data[aid_len + 3];
5d1ceb7f5e56ae drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  352  
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  353  		/* Verify PARAMETERS tag is (82), and final check that there is
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  354  		 * enough space in the packet to read everything.
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  355  		 */
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  356  		if (skb->data[aid_len + 2] != NFC_EVT_TRANSACTION_PARAMS_TAG ||
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21 @357  		    skb->len < aid_len + 4 + params_len)
5d1ceb7f5e56ae drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  358  			return -EPROTO;
5d1ceb7f5e56ae drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  359  
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  360  		transaction = devm_kzalloc(dev, sizeof(*transaction) +
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  361  					   params_len, GFP_KERNEL);
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  362  		if (!transaction)
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  363  			return -ENOMEM;
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  364  
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  365  		transaction->aid_len = aid_len;
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  366  		transaction->params_len = params_len;
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  367  
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  368  		memcpy(transaction->aid, &skb->data[2], aid_len);
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  369  		memcpy(transaction->params, &skb->data[aid_len + 4],
0254f31a7df3bb drivers/nfc/st-nci/se.c            Martin Faltesek   2022-11-21  370  		       params_len);
5d1ceb7f5e56ae drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  371  
5d1ceb7f5e56ae drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  372  		r = nfc_se_transaction(ndev->nfc_dev, host, transaction);
05db6e94fe7f63 drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-03-31  373  		break;
8ae01f7967718a drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  374  	default:
2b5dbe089f619f drivers/nfc/st-nci/se.c            Christophe Ricard 2015-10-25  375  		nfc_err(&ndev->nfc_dev->dev, "Unexpected event on connectivity gate\n");
8ae01f7967718a drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  376  		return 1;
8ae01f7967718a drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  377  	}
8ae01f7967718a drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  378  	kfree_skb(skb);
8ae01f7967718a drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  379  	return r;
8ae01f7967718a drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  380  }
8ae01f7967718a drivers/nfc/st21nfcb/st21nfcb_se.c Christophe Ricard 2015-02-01  381  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
