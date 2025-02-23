Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD382AF11
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Feb 2025 03:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740281570; cv=none; b=hdG9T42blvMxHZgWot6XUoITSNLttGGYdmYMSmTsp6VbQBK2F6PBBTXtOmYsIKEHnK+Dlux+v3PPP0o/E2Y5Fq3YjzpcezjH/9JwNDZWU8qv4l24Qg1+gMvXuFNFy9nukt2tjice+ND+osd8agLIp62YQSlZgkKmXuXL6UI9TJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740281570; c=relaxed/simple;
	bh=KWMfdwvBAw9kweoQTiaWBya86gPNLfe7y3iu6EPQpxo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k/Nkt2Ff2uHib50OE9kSl+79Q4XBfElbwVA66inn8It+7Q9ZlpHDDW91301no9CfmKeKnLx83OF0h/EwYgCBV5Fo/RUVJRqmviDbbmdDjVPkaXHkyeT/oAx9tC6iF7Qnob9A751wjcOGAkIymXR3n2OQOQsHutqp7nu80Rht1Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TZPho7sY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TZPho7sY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740281568; x=1771817568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KWMfdwvBAw9kweoQTiaWBya86gPNLfe7y3iu6EPQpxo=;
  b=TZPho7sY+9lJj/smCGu6CUIiYKrRXp6uc9mUKkutFELj+mpw2DFUOdt6
   7oWndhS1+CZpI1yQSRcdA7ZsZ7UQg0mkMk6ik3sWi11e9bnPl388jKdJa
   5dNrdkJC1aBcxOcigR+g/eis/R1jTWQx0rytY+tlKKZjCpsM8LQJAZMwW
   3pZDkgX5Cr6JNKt2sm//S/GDpkeEAYeZfFH0wj7gZXm6RvXxX1RfRRCOV
   V0awdECcu2AzSUrTEHFyUS0wLE5lAtWk+fxiPOVFemz9CdszaNMvi7Pjv
   PST64Mto/cpJJQLfRmD6fTRt+zHflo5i8Yne/lq9kobBTfLpvCF9aKIAP
   g==;
X-CSE-ConnectionGUID: pq5cAaNpQge98Y4Lg7uafw==
X-CSE-MsgGUID: FSf1/DLESTq4SXYomdSDFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41271350"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41271350"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 19:32:46 -0800
X-CSE-ConnectionGUID: FCR8wBWoRcShBy/TYfCk2Q==
X-CSE-MsgGUID: sBKodVBER128Ckwen/iiBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="146581359"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Feb 2025 19:32:44 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tm2jR-00076Z-2t;
	Sun, 23 Feb 2025 03:32:41 +0000
Date: Sun, 23 Feb 2025 11:32:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3] Bluetooth: hci_core: Enable buffer flow control for
 SCO/eSCO
Message-ID: <202502231103.loPGnZml-lkp@intel.com>
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
In-Reply-To: <20250221204916.2217628-1-luiz.dentz@gmail.com>
References: <20250221204916.2217628-1-luiz.dentz@gmail.com>
TO: Luiz Augusto von Dentz <luiz.dentz@gmail.com>

Hi Luiz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on bluetooth/master linus/master v6.14-rc3 next-20250221]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Augusto-von-Dentz/Bluetooth-hci_core-Enable-buffer-flow-control-for-SCO-eSCO/20250222-045019
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20250221204916.2217628-1-luiz.dentz%40gmail.com
patch subject: [PATCH v3] Bluetooth: hci_core: Enable buffer flow control for SCO/eSCO
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: i386-randconfig-141-20250223 (https://download.01.org/0day-ci/archive/20250223/202502231103.loPGnZml-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502231103.loPGnZml-lkp@intel.com/

New smatch warnings:
net/bluetooth/hci_core.c:3583 hci_sched_sco() error: uninitialized symbol 'conn'.
net/bluetooth/hci_core.c:3583 hci_sched_sco() error: we previously assumed 'conn' could be null (see line 3562)
net/bluetooth/hci_core.c:3621 hci_sched_esco() error: uninitialized symbol 'conn'.
net/bluetooth/hci_core.c:3621 hci_sched_esco() error: we previously assumed 'conn' could be null (see line 3599)

Old smatch warnings:
net/bluetooth/hci_core.c:2595 hci_register_dev() warn: 'hdev->rfkill' is an error pointer or valid

vim +/conn +3583 net/bluetooth/hci_core.c

^1da177e4c3f415 Linus Torvalds         2005-04-16  3549  
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3550  /* Schedule SCO */
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3551  static void hci_sched_sco(struct hci_dev *hdev)
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3552  {
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3553  	struct hci_conn *conn;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3554  	struct sk_buff *skb;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3555  	int quote;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3556  
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3557  	BT_DBG("%s", hdev->name);
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3558  
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3559  	if (!hci_conn_num(hdev, SCO_LINK))
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3560  		return;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3561  
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23 @3562  	while (hdev->sco_cnt && (conn = hci_low_sent(hdev, SCO_LINK, &quote))) {
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3563  		while (quote-- && (skb = skb_dequeue(&conn->data_q))) {
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3564  			BT_DBG("skb %p len %d", skb, skb->len);
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3565  			hci_send_frame(hdev, skb);
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3566  
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3567  			hdev->sco_cnt--;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3568  			conn->sent++;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3569  			if (conn->sent == ~0)
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3570  				conn->sent = 0;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3571  		}
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3572  	}
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3573  
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3574  	/* Restore sco_cnt if flow control has not been enabled as
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3575  	 * HCI_EV_NUM_COMP_PKTS won't be generated.
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3576  	 */
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3577  	if (!hci_dev_test_flag(hdev, HCI_SCO_FLOWCTL)) {
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3578  		hdev->sco_cnt = hdev->sco_pkts;
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3579  
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3580  		/* As flow control is disabled force tx_work to run if there are
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3581  		 * still packets left in the queue.
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3582  		 */
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21 @3583  		if (!skb_queue_empty(&conn->data_q))
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3584  			queue_work(hdev->workqueue, &hdev->tx_work);
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3585  	}
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3586  }
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3587  
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3588  static void hci_sched_esco(struct hci_dev *hdev)
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3589  {
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3590  	struct hci_conn *conn;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3591  	struct sk_buff *skb;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3592  	int quote;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3593  
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3594  	BT_DBG("%s", hdev->name);
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3595  
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3596  	if (!hci_conn_num(hdev, ESCO_LINK))
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3597  		return;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3598  
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23 @3599  	while (hdev->sco_cnt && (conn = hci_low_sent(hdev, ESCO_LINK,
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3600  						     &quote))) {
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3601  		while (quote-- && (skb = skb_dequeue(&conn->data_q))) {
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3602  			BT_DBG("skb %p len %d", skb, skb->len);
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3603  			hci_send_frame(hdev, skb);
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3604  
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3605  			hdev->sco_cnt--;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3606  			conn->sent++;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3607  			if (conn->sent == ~0)
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3608  				conn->sent = 0;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3609  		}
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3610  	}
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3611  
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3612  	/* Restore sco_cnt if flow control has not been enabled as
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3613  	 * HCI_EV_NUM_COMP_PKTS won't be generated.
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3614  	 */
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3615  	if (!hci_dev_test_flag(hdev, HCI_SCO_FLOWCTL)) {
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3616  		hdev->sco_cnt = hdev->sco_pkts;
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3617  
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3618  		/* As flow control is disabled force tx_work to run if there are
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3619  		 * still packets left in the queue.
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3620  		 */
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21 @3621  		if (!skb_queue_empty(&conn->data_q))
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3622  			queue_work(hdev->workqueue, &hdev->tx_work);
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3623  	}
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3624  }
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3625  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
