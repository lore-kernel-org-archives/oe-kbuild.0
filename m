Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE0AC2F7
	for <oe-kbuild@lists.linux.dev>; Mon, 15 May 2023 12:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684153217; x=1715689217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6lSAQDlOG8yg3Qs4DlS6knonoeGLQRUwCrOyOm3nmeo=;
  b=N1L+O6KXzHqQ+eyR7aKkMd3xkCMRoxuG6ZgcIikDLk8lXD9DKT3DJ8P+
   nCxhafXslHAmSHHlz6kwpj3VnpSdZrkCZ1l0vSy1mixOldlRXBGY4O3fl
   H8+XKyxHUHTGNKXgVt/CUtpIb9R8pezfCbEjd3csXPF/Pj33bHW6XTphE
   wP6WAzZNaqHjvPmpQ2ADDbT4ipd6jaPWDEdFTWDXpq3qJSd3/ieUxtcxl
   g38UipGf3XsMA8Xr/EQ7/QSfo/piOp0wDsahN1vAZP9Ocz4+HB+STbzsJ
   VTK9uvF+yYAc44TWTmv+6e4eRbaVE2bCKJW5hIiLa/TXj3m+2VdHGnpIg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="350023558"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; 
   d="scan'208";a="350023558"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 05:20:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="678424246"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; 
   d="scan'208";a="678424246"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 15 May 2023 05:20:15 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pyXBW-0006LK-1t;
	Mon, 15 May 2023 12:20:14 +0000
Date: Mon, 15 May 2023 20:20:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/nfc/st21nfca/se.c:343 st21nfca_connectivity_event_received()
 warn: possible spectre second half.  'params_len'
Message-ID: <202305152005.GyEKevc7-lkp@intel.com>
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
CC: Guenter Roeck <groeck@chromium.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6
commit: f2e19b36593caed4c977c2f55aeba7408aeb2132 nfc: st21nfca: fix incorrect sizing calculations in EVT_TRANSACTION
date:   11 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-m001-20230515 (https://download.01.org/0day-ci/archive/20230515/202305152005.GyEKevc7-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305152005.GyEKevc7-lkp@intel.com/

New smatch warnings:
drivers/nfc/st21nfca/se.c:343 st21nfca_connectivity_event_received() warn: possible spectre second half.  'params_len'

Old smatch warnings:
drivers/nfc/st21nfca/se.c:337 st21nfca_connectivity_event_received() warn: potential spectre issue 'skb->data' [r]

vim +/params_len +343 drivers/nfc/st21nfca/se.c

2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01-27  291  
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01-27  292  /*
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01-27  293   * Returns:
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01-27  294   * <= 0: driver handled the event, skb consumed
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01-27  295   *    1: driver does not handle the event, please do standard processing
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01-27  296   */
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01-27  297  int st21nfca_connectivity_event_received(struct nfc_hci_dev *hdev, u8 host,
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01-27  298  				u8 event, struct sk_buff *skb)
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01-27  299  {
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01-27  300  	int r = 0;
26fc6c7f02cb26 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-02-01  301  	struct device *dev = &hdev->ndev->dev;
26fc6c7f02cb26 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-02-01  302  	struct nfc_evt_transaction *transaction;
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  303  	u32 aid_len;
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  304  	u8 params_len;
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01-27  305  
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01-27  306  	pr_debug("connectivity gate event: %x\n", event);
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01-27  307  
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01-27  308  	switch (event) {
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01-27  309  	case ST21NFCA_EVT_CONNECTIVITY:
72c54c42b29439 drivers/nfc/st21nfca/se.c          Christophe Ricard 2015-12-23  310  		r = nfc_se_connectivity(hdev->ndev, host);
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01-27  311  	break;
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01-27  312  	case ST21NFCA_EVT_TRANSACTION:
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  313  		/* According to specification etsi 102 622
9dbe776338e7f9 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-03-31  314  		 * 11.2.2.4 EVT_TRANSACTION Table 52
9dbe776338e7f9 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-03-31  315  		 * Description	Tag	Length
9dbe776338e7f9 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-03-31  316  		 * AID		81	5 to 16
9dbe776338e7f9 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-03-31  317  		 * PARAMETERS	82	0 to 255
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  318  		 *
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  319  		 * The key differences are aid storage length is variably sized
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  320  		 * in the packet, but fixed in nfc_evt_transaction, and that the aid_len
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  321  		 * is u8 in the packet, but u32 in the structure, and the tags in
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  322  		 * the packet are not included in nfc_evt_transaction.
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  323  		 *
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  324  		 * size in bytes: 1          1       5-16 1             1           0-255
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  325  		 * offset:        0          1       2    aid_len + 2   aid_len + 3 aid_len + 4
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  326  		 * member name:   aid_tag(M) aid_len aid  params_tag(M) params_len  params
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  327  		 * example:       0x81       5-16    X    0x82 0-255    X
9dbe776338e7f9 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-03-31  328  		 */
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  329  		if (skb->len < 2 || skb->data[0] != NFC_EVT_TRANSACTION_AID_TAG)
26fc6c7f02cb26 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-02-01  330  			return -EPROTO;
26fc6c7f02cb26 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-02-01  331  
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  332  		aid_len = skb->data[1];
4fbcc1a4cb20fe drivers/nfc/st21nfca/se.c          Jordy Zomer       2022-01-11  333  
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  334  		if (skb->len < aid_len + 4 || aid_len > sizeof(transaction->aid))
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  335  			return -EPROTO;
4fbcc1a4cb20fe drivers/nfc/st21nfca/se.c          Jordy Zomer       2022-01-11  336  
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  337  		params_len = skb->data[aid_len + 3];
26fc6c7f02cb26 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-02-01  338  
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  339  		/* Verify PARAMETERS tag is (82), and final check that there is enough
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  340  		 * space in the packet to read everything.
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  341  		 */
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  342  		if ((skb->data[aid_len + 2] != NFC_EVT_TRANSACTION_PARAMS_TAG) ||
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06 @343  		    (skb->len < aid_len + 4 + params_len))
26fc6c7f02cb26 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-02-01  344  			return -EPROTO;
26fc6c7f02cb26 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-02-01  345  
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  346  		transaction = devm_kzalloc(dev, sizeof(*transaction) + params_len, GFP_KERNEL);
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  347  		if (!transaction)
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  348  			return -ENOMEM;
4fbcc1a4cb20fe drivers/nfc/st21nfca/se.c          Jordy Zomer       2022-01-11  349  
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  350  		transaction->aid_len = aid_len;
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  351  		transaction->params_len = params_len;
4fbcc1a4cb20fe drivers/nfc/st21nfca/se.c          Jordy Zomer       2022-01-11  352  
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  353  		memcpy(transaction->aid, &skb->data[2], aid_len);
f2e19b36593cae drivers/nfc/st21nfca/se.c          Martin Faltesek   2022-06-06  354  		memcpy(transaction->params, &skb->data[aid_len + 4], params_len);
26fc6c7f02cb26 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-02-01  355  
26fc6c7f02cb26 drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-02-01  356  		r = nfc_se_transaction(hdev->ndev, host, transaction);
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01-27  357  	break;
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01-27  358  	default:
a9e062d0599f49 drivers/nfc/st21nfca/se.c          Christophe Ricard 2015-10-25  359  		nfc_err(&hdev->ndev->dev, "Unexpected event on connectivity gate\n");
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01-27  360  		return 1;
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01-27  361  	}
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01-27  362  	kfree_skb(skb);
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01-27  363  	return r;
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01-27  364  }
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01-27  365  EXPORT_SYMBOL(st21nfca_connectivity_event_received);
2130fb97fecf9a drivers/nfc/st21nfca/st21nfca_se.c Christophe Ricard 2015-01-27  366  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
