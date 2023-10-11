Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E6730F88
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Oct 2023 16:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BTXvJPXt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697041546; x=1728577546;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YeO6YmkyNntLtszzNcI2QO5l4kmyjBr4Al0DfrBJp8A=;
  b=BTXvJPXt2SMgVFqu88Wtxgcac8Rz8fObXFtr2J/c10NmP40xbReWp/yd
   sby7qlZgrQKwic409NVBlffz3bUe1GhyC5fi4wVRzwKa/n4Igwq6L6Uwf
   gUI3AO9vEEuN/9pGwOpNsXT9PClFUQWqB2aRCglY5XgcuzVLwV1cggwK7
   5u+4Faco89Xnb3htT68IHOYm1MmM0eHg3IHXUYMcwkDXLT22nmGhAaVVM
   7cT7LyA3nLbHgiL3qzYSVXB1LqYRaj1T8uxxdSh8wAHaGhX5bWgT4n33x
   jLBI4u9DDGsbaIgaNsQMtI1GlMMecZlWRNZMo0zbT2QFALqKnyJBeHsbO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="375053381"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="375053381"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 09:25:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="1085290912"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="1085290912"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 11 Oct 2023 09:25:44 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqc1m-0002Qr-0G;
	Wed, 11 Oct 2023 16:25:42 +0000
Date: Thu, 12 Oct 2023 00:24:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 10943/11428] net/bluetooth/hci_event.c:3276
 hci_conn_request_evt() warn: variable dereferenced before check 'hdev' (see
 line 3266)
Message-ID: <202310120031.J3PSRP8D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Arnd Bergmann <arnd@arndb.de>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2933a1156742d8c47550493a77af8e2d81cf3c84
commit: b8ba8e65e84b99d58e278900b4261ef17a20eb27 [10943/11428] Bluetooth: avoid memcmp() out of bounds warning
:::::: branch date: 10 hours ago
:::::: commit date: 22 hours ago
config: i386-randconfig-141-20231011 (https://download.01.org/0day-ci/archive/20231012/202310120031.J3PSRP8D-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310120031.J3PSRP8D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310120031.J3PSRP8D-lkp@intel.com/

smatch warnings:
net/bluetooth/hci_event.c:3276 hci_conn_request_evt() warn: variable dereferenced before check 'hdev' (see line 3266)

vim +/hdev +3276 net/bluetooth/hci_event.c

70c464256310e1 Johan Hedberg          2014-07-09  3261  
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  3262  static void hci_conn_request_evt(struct hci_dev *hdev, void *data,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  3263  				 struct sk_buff *skb)
^1da177e4c3f41 Linus Torvalds         2005-04-16  3264  {
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  3265  	struct hci_ev_conn_request *ev = data;
a9de9248064bfc Marcel Holtmann        2007-10-20 @3266  	int mask = hdev->link_mode;
70c464256310e1 Johan Hedberg          2014-07-09  3267  	struct inquiry_entry *ie;
70c464256310e1 Johan Hedberg          2014-07-09  3268  	struct hci_conn *conn;
20714bfef84d3e Frédéric Dalleau       2012-11-21  3269  	__u8 flags = 0;
^1da177e4c3f41 Linus Torvalds         2005-04-16  3270  
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  3271  	bt_dev_dbg(hdev, "bdaddr %pMR type 0x%x", &ev->bdaddr, ev->link_type);
^1da177e4c3f41 Linus Torvalds         2005-04-16  3272  
d70e44fef8621a Lee, Chun-Yi           2023-10-01  3273  	/* Reject incoming connection from device with same BD ADDR against
d70e44fef8621a Lee, Chun-Yi           2023-10-01  3274  	 * CVE-2020-26555
d70e44fef8621a Lee, Chun-Yi           2023-10-01  3275  	 */
b8ba8e65e84b99 Arnd Bergmann          2023-10-09 @3276  	if (hdev && !bacmp(&hdev->bdaddr, &ev->bdaddr)) {
d70e44fef8621a Lee, Chun-Yi           2023-10-01  3277  		bt_dev_dbg(hdev, "Reject connection with same BD_ADDR %pMR\n",
d70e44fef8621a Lee, Chun-Yi           2023-10-01  3278  			   &ev->bdaddr);
d70e44fef8621a Lee, Chun-Yi           2023-10-01  3279  		hci_reject_conn(hdev, &ev->bdaddr);
d70e44fef8621a Lee, Chun-Yi           2023-10-01  3280  		return;
d70e44fef8621a Lee, Chun-Yi           2023-10-01  3281  	}
d70e44fef8621a Lee, Chun-Yi           2023-10-01  3282  
20714bfef84d3e Frédéric Dalleau       2012-11-21  3283  	mask |= hci_proto_connect_ind(hdev, &ev->bdaddr, ev->link_type,
20714bfef84d3e Frédéric Dalleau       2012-11-21  3284  				      &flags);
^1da177e4c3f41 Linus Torvalds         2005-04-16  3285  
70c464256310e1 Johan Hedberg          2014-07-09  3286  	if (!(mask & HCI_LM_ACCEPT)) {
70c464256310e1 Johan Hedberg          2014-07-09  3287  		hci_reject_conn(hdev, &ev->bdaddr);
70c464256310e1 Johan Hedberg          2014-07-09  3288  		return;
70c464256310e1 Johan Hedberg          2014-07-09  3289  	}
70c464256310e1 Johan Hedberg          2014-07-09  3290  
fb048cae51bacd Niels Dossche          2022-04-05  3291  	hci_dev_lock(hdev);
fb048cae51bacd Niels Dossche          2022-04-05  3292  
3d4f9c00492b4e Archie Pusaka          2021-06-04  3293  	if (hci_bdaddr_list_lookup(&hdev->reject_list, &ev->bdaddr,
dcc36c16c2f1c9 Johan Hedberg          2014-07-09  3294  				   BDADDR_BREDR)) {
70c464256310e1 Johan Hedberg          2014-07-09  3295  		hci_reject_conn(hdev, &ev->bdaddr);
fb048cae51bacd Niels Dossche          2022-04-05  3296  		goto unlock;
70c464256310e1 Johan Hedberg          2014-07-09  3297  	}
46c4c941a41726 Johan Hedberg          2014-07-16  3298  
3d4f9c00492b4e Archie Pusaka          2021-06-04  3299  	/* Require HCI_CONNECTABLE or an accept list entry to accept the
6a8fc95c87110a Johan Hedberg          2014-12-24  3300  	 * connection. These features are only touched through mgmt so
6a8fc95c87110a Johan Hedberg          2014-12-24  3301  	 * only do the checks if HCI_MGMT is set.
6a8fc95c87110a Johan Hedberg          2014-12-24  3302  	 */
d7a5a11d7fa80b Marcel Holtmann        2015-03-13  3303  	if (hci_dev_test_flag(hdev, HCI_MGMT) &&
d7a5a11d7fa80b Marcel Holtmann        2015-03-13  3304  	    !hci_dev_test_flag(hdev, HCI_CONNECTABLE) &&
3d4f9c00492b4e Archie Pusaka          2021-06-04  3305  	    !hci_bdaddr_list_lookup_with_flags(&hdev->accept_list, &ev->bdaddr,
a55bd29d522729 Johan Hedberg          2014-07-09  3306  					       BDADDR_BREDR)) {
a55bd29d522729 Johan Hedberg          2014-07-09  3307  		hci_reject_conn(hdev, &ev->bdaddr);
fb048cae51bacd Niels Dossche          2022-04-05  3308  		goto unlock;
a55bd29d522729 Johan Hedberg          2014-07-09  3309  	}
70c464256310e1 Johan Hedberg          2014-07-09  3310  
a9de9248064bfc Marcel Holtmann        2007-10-20  3311  	/* Connection accepted */
^1da177e4c3f41 Linus Torvalds         2005-04-16  3312  
cc11b9c14da4ca Andrei Emeltchenko     2010-11-22  3313  	ie = hci_inquiry_cache_lookup(hdev, &ev->bdaddr);
cc11b9c14da4ca Andrei Emeltchenko     2010-11-22  3314  	if (ie)
c7bdd5026d28d1 Marcel Holtmann        2008-07-14  3315  		memcpy(ie->data.dev_class, ev->dev_class, 3);
c7bdd5026d28d1 Marcel Holtmann        2008-07-14  3316  
8fc9ced3988247 Gustavo Padovan        2012-05-23  3317  	conn = hci_conn_hash_lookup_ba(hdev, ev->link_type,
8fc9ced3988247 Gustavo Padovan        2012-05-23  3318  			&ev->bdaddr);
a9de9248064bfc Marcel Holtmann        2007-10-20  3319  	if (!conn) {
a5c4e309b9f23b Johan Hedberg          2014-07-16  3320  		conn = hci_conn_add(hdev, ev->link_type, &ev->bdaddr,
a5c4e309b9f23b Johan Hedberg          2014-07-16  3321  				    HCI_ROLE_SLAVE);
cc11b9c14da4ca Andrei Emeltchenko     2010-11-22  3322  		if (!conn) {
2064ee332e4c1b Marcel Holtmann        2017-10-30  3323  			bt_dev_err(hdev, "no memory for new connection");
fb048cae51bacd Niels Dossche          2022-04-05  3324  			goto unlock;
^1da177e4c3f41 Linus Torvalds         2005-04-16  3325  		}
^1da177e4c3f41 Linus Torvalds         2005-04-16  3326  	}
b6a0dc822497e1 Marcel Holtmann        2007-10-20  3327  
a9de9248064bfc Marcel Holtmann        2007-10-20  3328  	memcpy(conn->dev_class, ev->dev_class, 3);
b6a0dc822497e1 Marcel Holtmann        2007-10-20  3329  
a9de9248064bfc Marcel Holtmann        2007-10-20  3330  	hci_dev_unlock(hdev);
^1da177e4c3f41 Linus Torvalds         2005-04-16  3331  
20714bfef84d3e Frédéric Dalleau       2012-11-21  3332  	if (ev->link_type == ACL_LINK ||
20714bfef84d3e Frédéric Dalleau       2012-11-21  3333  	    (!(flags & HCI_PROTO_DEFER) && !lmp_esco_capable(hdev))) {
b6a0dc822497e1 Marcel Holtmann        2007-10-20  3334  		struct hci_cp_accept_conn_req cp;
20714bfef84d3e Frédéric Dalleau       2012-11-21  3335  		conn->state = BT_CONNECT;
b6a0dc822497e1 Marcel Holtmann        2007-10-20  3336  
a9de9248064bfc Marcel Holtmann        2007-10-20  3337  		bacpy(&cp.bdaddr, &ev->bdaddr);
^1da177e4c3f41 Linus Torvalds         2005-04-16  3338  
a9de9248064bfc Marcel Holtmann        2007-10-20  3339  		if (lmp_rswitch_capable(hdev) && (mask & HCI_LM_MASTER))
74be523ce6bed0 Archie Pusaka          2021-06-04  3340  			cp.role = 0x00; /* Become central */
^1da177e4c3f41 Linus Torvalds         2005-04-16  3341  		else
74be523ce6bed0 Archie Pusaka          2021-06-04  3342  			cp.role = 0x01; /* Remain peripheral */
^1da177e4c3f41 Linus Torvalds         2005-04-16  3343  
70c464256310e1 Johan Hedberg          2014-07-09  3344  		hci_send_cmd(hdev, HCI_OP_ACCEPT_CONN_REQ, sizeof(cp), &cp);
20714bfef84d3e Frédéric Dalleau       2012-11-21  3345  	} else if (!(flags & HCI_PROTO_DEFER)) {
b6a0dc822497e1 Marcel Holtmann        2007-10-20  3346  		struct hci_cp_accept_sync_conn_req cp;
20714bfef84d3e Frédéric Dalleau       2012-11-21  3347  		conn->state = BT_CONNECT;
b6a0dc822497e1 Marcel Holtmann        2007-10-20  3348  
b6a0dc822497e1 Marcel Holtmann        2007-10-20  3349  		bacpy(&cp.bdaddr, &ev->bdaddr);
a8746417e864da Marcel Holtmann        2008-07-14  3350  		cp.pkt_type = cpu_to_le16(conn->pkt_type);
b6a0dc822497e1 Marcel Holtmann        2007-10-20  3351  
dcf4adbfdc7ad1 Joe Perches            2014-03-12  3352  		cp.tx_bandwidth   = cpu_to_le32(0x00001f40);
dcf4adbfdc7ad1 Joe Perches            2014-03-12  3353  		cp.rx_bandwidth   = cpu_to_le32(0x00001f40);
dcf4adbfdc7ad1 Joe Perches            2014-03-12  3354  		cp.max_latency    = cpu_to_le16(0xffff);
b6a0dc822497e1 Marcel Holtmann        2007-10-20  3355  		cp.content_format = cpu_to_le16(hdev->voice_setting);
b6a0dc822497e1 Marcel Holtmann        2007-10-20  3356  		cp.retrans_effort = 0xff;
b6a0dc822497e1 Marcel Holtmann        2007-10-20  3357  
70c464256310e1 Johan Hedberg          2014-07-09  3358  		hci_send_cmd(hdev, HCI_OP_ACCEPT_SYNC_CONN_REQ, sizeof(cp),
70c464256310e1 Johan Hedberg          2014-07-09  3359  			     &cp);
20714bfef84d3e Frédéric Dalleau       2012-11-21  3360  	} else {
20714bfef84d3e Frédéric Dalleau       2012-11-21  3361  		conn->state = BT_CONNECT2;
539c496d88f7f9 Johan Hedberg          2015-02-18  3362  		hci_connect_cfm(conn, 0);
b6a0dc822497e1 Marcel Holtmann        2007-10-20  3363  	}
fb048cae51bacd Niels Dossche          2022-04-05  3364  
fb048cae51bacd Niels Dossche          2022-04-05  3365  	return;
fb048cae51bacd Niels Dossche          2022-04-05  3366  unlock:
fb048cae51bacd Niels Dossche          2022-04-05  3367  	hci_dev_unlock(hdev);
^1da177e4c3f41 Linus Torvalds         2005-04-16  3368  }
^1da177e4c3f41 Linus Torvalds         2005-04-16  3369  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
