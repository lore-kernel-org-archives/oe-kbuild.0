Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B60F50AC17
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Sep 2026 18:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545276; cv=none; b=Lr+ZbGdeS42YHHme9mvEybdfkUaFl1mn9eOe3OvSN6SAhQ6/zTR1J9sx/CYRut5suRffzH4QDNx6sYE5X5JU+yPUUzqJBHg18iJ+w5C0MHALnmluXomb056r9YBVYXVnGaF9fxVsabnyBVnGUqhNT3BpS1w+G+asFwO9CpNVA+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545276; c=relaxed/simple;
	bh=NuoaEe6rmxRf2IZR5nLyHqTZdf73UVVXLMUJxA3giqM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JIToVMho5VOaNawVtJZuDa40ilKRTR/AetsqFCKmFIzBVjHKUHmIA8DP8ryIvbaM44g7QlO642dR2AH3g19oJEGnF6NeAz2Y2BlWUx9y7zhsFXWoIDQkU54mqS1AQfPIrXSCouaehk+UTvMytCmpb5eGTUSQrV8kVxj2LKwQ+ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JHoPOsjU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JHoPOsjU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788545274; x=1820081274;
  h=date:from:to:cc:subject:message-id;
  bh=NuoaEe6rmxRf2IZR5nLyHqTZdf73UVVXLMUJxA3giqM=;
  b=JHoPOsjUugLOUGy8ucySv0nv2Ku4Qo8O3SumqKEIQYFlcLHTPF0Kb6V9
   u3N7ALYwopUcbDvI88T4aswWRCyNV5xFXBGLvSkSMaTCo7sE9OERorkdN
   Kn+4kPkV5Wrf5DeG+DgVjJZBpCFnZGWiew6WqcuTeMtC4RDNa+m101fm1
   GHHT6pKrFh6pmsBn8jnieB6xWoKD59O+dagsyJGq9JOwVDyz3C6S3mtiv
   hKCHO3O2Dy7VI+cWE95iY5GMShZJBk23nlbltJBcHwFHqVyNiPWCJkEaN
   palAq8zcdLrXNm9a3ZplX0qiJzF8aJ/1QbZdy7ccCjWsWgpeBDePE4K3N
   A==;
X-CSE-ConnectionGUID: aDb0LhMrSTWMG7ba5ShEkg==
X-CSE-MsgGUID: 8El6XXVgTJeYk1uYoS2V8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="99384716"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="99384716"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 11:07:54 -0700
X-CSE-ConnectionGUID: ilZ/njqoTAejsKyCAwuLcA==
X-CSE-MsgGUID: NuKcaGf/Sy+bGHvH+J9ICg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="268803313"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Sep 2026 11:07:52 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2YKL-00000000A46-26Dl;
	Fri, 04 Sep 2026 18:07:49 +0000
Date: Sat, 05 Sep 2026 02:07:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bluetooth-next:master 156/173]
 net/bluetooth/l2cap_core.c:7643 l2cap_chan_connect() error: we previously
 assumed 'chan->conn' could be null (see line 7630)
Message-ID: <202609050119.jXZTVYKj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-bluetooth@vger.kernel.org
TO: Pauli Virtanen <pav@iki.fi>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
head:   71729d60938f46745da32f75507b1ad4bf989100
commit: 6696072ffe07205255cf83621a95a1aa2f9f6e62 [156/173] Bluetooth: L2CAP: refuse __l2cap_chan_add if chan already has conn
:::::: branch date: 3 hours ago
:::::: commit date: 2 days ago
config: parisc-randconfig-r071-20260904 (https://download.01.org/0day-ci/archive/20260905/202609050119.jXZTVYKj-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609050119.jXZTVYKj-lkp@intel.com/

smatch warnings:
net/bluetooth/l2cap_core.c:7643 l2cap_chan_connect() error: we previously assumed 'chan->conn' could be null (see line 7630)
net/bluetooth/l2cap_core.c:7643 l2cap_chan_connect() warn: address of NULL pointer 'chan->conn'

vim +7643 net/bluetooth/l2cap_core.c

da49b602f7f75c Luiz Augusto von Dentz 2020-03-25  7484  
162b49e75cf2c6 Johan Hedberg          2014-01-17  7485  int l2cap_chan_connect(struct l2cap_chan *chan, __le16 psm, u16 cid,
bf98feea5b65ce Luiz Augusto von Dentz 2024-02-07  7486  		       bdaddr_t *dst, u8 dst_type, u16 timeout)
162b49e75cf2c6 Johan Hedberg          2014-01-17  7487  {
162b49e75cf2c6 Johan Hedberg          2014-01-17  7488  	struct l2cap_conn *conn;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7489  	struct hci_conn *hcon;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7490  	struct hci_dev *hdev;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7491  	int err;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7492  
15f02b91056253 Luiz Augusto von Dentz 2020-03-02  7493  	BT_DBG("%pMR -> %pMR (type %u) psm 0x%4.4x mode 0x%2.2x", &chan->src,
15f02b91056253 Luiz Augusto von Dentz 2020-03-02  7494  	       dst, dst_type, __le16_to_cpu(psm), chan->mode);
162b49e75cf2c6 Johan Hedberg          2014-01-17  7495  
39385cb5f32747 Johan Hedberg          2016-11-12  7496  	hdev = hci_get_route(dst, &chan->src, chan->src_type);
162b49e75cf2c6 Johan Hedberg          2014-01-17  7497  	if (!hdev)
162b49e75cf2c6 Johan Hedberg          2014-01-17  7498  		return -EHOSTUNREACH;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7499  
162b49e75cf2c6 Johan Hedberg          2014-01-17  7500  	hci_dev_lock(hdev);
162b49e75cf2c6 Johan Hedberg          2014-01-17  7501  
162b49e75cf2c6 Johan Hedberg          2014-01-17  7502  	if (!is_valid_psm(__le16_to_cpu(psm), dst_type) && !cid &&
162b49e75cf2c6 Johan Hedberg          2014-01-17  7503  	    chan->chan_type != L2CAP_CHAN_RAW) {
162b49e75cf2c6 Johan Hedberg          2014-01-17  7504  		err = -EINVAL;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7505  		goto done;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7506  	}
162b49e75cf2c6 Johan Hedberg          2014-01-17  7507  
21626e6214f92a Johan Hedberg          2014-01-24  7508  	if (chan->chan_type == L2CAP_CHAN_CONN_ORIENTED && !psm) {
21626e6214f92a Johan Hedberg          2014-01-24  7509  		err = -EINVAL;
21626e6214f92a Johan Hedberg          2014-01-24  7510  		goto done;
21626e6214f92a Johan Hedberg          2014-01-24  7511  	}
21626e6214f92a Johan Hedberg          2014-01-24  7512  
21626e6214f92a Johan Hedberg          2014-01-24  7513  	if (chan->chan_type == L2CAP_CHAN_FIXED && !cid) {
162b49e75cf2c6 Johan Hedberg          2014-01-17  7514  		err = -EINVAL;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7515  		goto done;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7516  	}
162b49e75cf2c6 Johan Hedberg          2014-01-17  7517  
162b49e75cf2c6 Johan Hedberg          2014-01-17  7518  	switch (chan->mode) {
162b49e75cf2c6 Johan Hedberg          2014-01-17  7519  	case L2CAP_MODE_BASIC:
162b49e75cf2c6 Johan Hedberg          2014-01-17  7520  		break;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7521  	case L2CAP_MODE_LE_FLOWCTL:
4be5ca67d59d70 Luiz Augusto von Dentz 2020-03-02  7522  		break;
15f02b91056253 Luiz Augusto von Dentz 2020-03-02  7523  	case L2CAP_MODE_EXT_FLOWCTL:
4be5ca67d59d70 Luiz Augusto von Dentz 2020-03-02  7524  		if (!enable_ecred) {
4be5ca67d59d70 Luiz Augusto von Dentz 2020-03-02  7525  			err = -EOPNOTSUPP;
4be5ca67d59d70 Luiz Augusto von Dentz 2020-03-02  7526  			goto done;
4be5ca67d59d70 Luiz Augusto von Dentz 2020-03-02  7527  		}
162b49e75cf2c6 Johan Hedberg          2014-01-17  7528  		break;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7529  	case L2CAP_MODE_ERTM:
162b49e75cf2c6 Johan Hedberg          2014-01-17  7530  	case L2CAP_MODE_STREAMING:
162b49e75cf2c6 Johan Hedberg          2014-01-17  7531  		if (!disable_ertm)
162b49e75cf2c6 Johan Hedberg          2014-01-17  7532  			break;
19186c7b45c134 Gustavo A. R. Silva    2020-07-08  7533  		fallthrough;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7534  	default:
beb19e4c079d62 Johan Hedberg          2014-07-18  7535  		err = -EOPNOTSUPP;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7536  		goto done;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7537  	}
162b49e75cf2c6 Johan Hedberg          2014-01-17  7538  
162b49e75cf2c6 Johan Hedberg          2014-01-17  7539  	switch (chan->state) {
162b49e75cf2c6 Johan Hedberg          2014-01-17  7540  	case BT_CONNECT:
162b49e75cf2c6 Johan Hedberg          2014-01-17  7541  	case BT_CONNECT2:
162b49e75cf2c6 Johan Hedberg          2014-01-17  7542  	case BT_CONFIG:
162b49e75cf2c6 Johan Hedberg          2014-01-17  7543  		/* Already connecting */
162b49e75cf2c6 Johan Hedberg          2014-01-17  7544  		err = 0;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7545  		goto done;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7546  
162b49e75cf2c6 Johan Hedberg          2014-01-17  7547  	case BT_CONNECTED:
162b49e75cf2c6 Johan Hedberg          2014-01-17  7548  		/* Already connected */
162b49e75cf2c6 Johan Hedberg          2014-01-17  7549  		err = -EISCONN;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7550  		goto done;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7551  
162b49e75cf2c6 Johan Hedberg          2014-01-17  7552  	case BT_OPEN:
162b49e75cf2c6 Johan Hedberg          2014-01-17  7553  	case BT_BOUND:
162b49e75cf2c6 Johan Hedberg          2014-01-17  7554  		/* Can connect */
162b49e75cf2c6 Johan Hedberg          2014-01-17  7555  		break;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7556  
162b49e75cf2c6 Johan Hedberg          2014-01-17  7557  	default:
162b49e75cf2c6 Johan Hedberg          2014-01-17  7558  		err = -EBADFD;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7559  		goto done;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7560  	}
162b49e75cf2c6 Johan Hedberg          2014-01-17  7561  
162b49e75cf2c6 Johan Hedberg          2014-01-17  7562  	/* Set destination address and psm */
162b49e75cf2c6 Johan Hedberg          2014-01-17  7563  	bacpy(&chan->dst, dst);
162b49e75cf2c6 Johan Hedberg          2014-01-17  7564  	chan->dst_type = dst_type;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7565  
162b49e75cf2c6 Johan Hedberg          2014-01-17  7566  	chan->psm = psm;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7567  	chan->dcid = cid;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7568  
6f77d8c757523f Andre Guedes           2014-02-26  7569  	if (bdaddr_type_is_le(dst_type)) {
6f77d8c757523f Andre Guedes           2014-02-26  7570  		/* Convert from L2CAP channel address type to HCI address type
6f77d8c757523f Andre Guedes           2014-02-26  7571  		 */
6f77d8c757523f Andre Guedes           2014-02-26  7572  		if (dst_type == BDADDR_LE_PUBLIC)
6f77d8c757523f Andre Guedes           2014-02-26  7573  			dst_type = ADDR_LE_DEV_PUBLIC;
6f77d8c757523f Andre Guedes           2014-02-26  7574  		else
6f77d8c757523f Andre Guedes           2014-02-26  7575  			dst_type = ADDR_LE_DEV_RANDOM;
6f77d8c757523f Andre Guedes           2014-02-26  7576  
d7a5a11d7fa80b Marcel Holtmann        2015-03-13  7577  		if (hci_dev_test_flag(hdev, HCI_ADVERTISING))
d850bf086280fc Luiz Augusto von Dentz 2021-08-30  7578  			hcon = hci_connect_le(hdev, dst, dst_type, false,
bf98feea5b65ce Luiz Augusto von Dentz 2024-02-07  7579  					      chan->sec_level, timeout,
2e7ed5f5e69b6f Luiz Augusto von Dentz 2024-04-05  7580  					      HCI_ROLE_SLAVE, 0, 0);
e804d25d4a07c0 Johan Hedberg          2014-07-16  7581  		else
fa142220775683 Jakub Pawlowski        2015-08-07  7582  			hcon = hci_connect_le_scan(hdev, dst, dst_type,
bf98feea5b65ce Luiz Augusto von Dentz 2024-02-07  7583  						   chan->sec_level, timeout,
76b139965575e5 Manish Mandlik         2020-06-17  7584  						   CONN_REASON_L2CAP_CHAN);
0ad06aa6a76823 Johan Hedberg          2015-11-11  7585  
6f77d8c757523f Andre Guedes           2014-02-26  7586  	} else {
d93375a82da10c Johan Hedberg          2014-07-07  7587  		u8 auth_type = l2cap_get_auth_type(chan);
76b139965575e5 Manish Mandlik         2020-06-17  7588  		hcon = hci_connect_acl(hdev, dst, chan->sec_level, auth_type,
bf98feea5b65ce Luiz Augusto von Dentz 2024-02-07  7589  				       CONN_REASON_L2CAP_CHAN, timeout);
6f77d8c757523f Andre Guedes           2014-02-26  7590  	}
162b49e75cf2c6 Johan Hedberg          2014-01-17  7591  
162b49e75cf2c6 Johan Hedberg          2014-01-17  7592  	if (IS_ERR(hcon)) {
162b49e75cf2c6 Johan Hedberg          2014-01-17  7593  		err = PTR_ERR(hcon);
162b49e75cf2c6 Johan Hedberg          2014-01-17  7594  		goto done;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7595  	}
162b49e75cf2c6 Johan Hedberg          2014-01-17  7596  
b80de2cbb1c8c9 Pauli Virtanen         2026-08-01  7597  	lockdep_assert_held(&hcon->hdev->lock);
b80de2cbb1c8c9 Pauli Virtanen         2026-08-01  7598  
162b49e75cf2c6 Johan Hedberg          2014-01-17  7599  	conn = l2cap_conn_add(hcon);
162b49e75cf2c6 Johan Hedberg          2014-01-17  7600  	if (!conn) {
162b49e75cf2c6 Johan Hedberg          2014-01-17  7601  		hci_conn_drop(hcon);
162b49e75cf2c6 Johan Hedberg          2014-01-17  7602  		err = -ENOMEM;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7603  		goto done;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7604  	}
162b49e75cf2c6 Johan Hedberg          2014-01-17  7605  
ddaccd985bb01d Pauli Virtanen         2026-08-30  7606  	mutex_lock(&conn->lock);
ddaccd985bb01d Pauli Virtanen         2026-08-30  7607  	l2cap_chan_lock(chan);
ddaccd985bb01d Pauli Virtanen         2026-08-30  7608  
da49b602f7f75c Luiz Augusto von Dentz 2020-03-25  7609  	if (chan->mode == L2CAP_MODE_EXT_FLOWCTL) {
da49b602f7f75c Luiz Augusto von Dentz 2020-03-25  7610  		struct l2cap_chan_data data;
da49b602f7f75c Luiz Augusto von Dentz 2020-03-25  7611  
da49b602f7f75c Luiz Augusto von Dentz 2020-03-25  7612  		data.chan = chan;
da49b602f7f75c Luiz Augusto von Dentz 2020-03-25  7613  		data.pid = chan->ops->get_peer_pid(chan);
da49b602f7f75c Luiz Augusto von Dentz 2020-03-25  7614  		data.count = 1;
da49b602f7f75c Luiz Augusto von Dentz 2020-03-25  7615  
ddaccd985bb01d Pauli Virtanen         2026-08-30  7616  		__l2cap_chan_list(conn, l2cap_chan_by_pid, &data);
ddaccd985bb01d Pauli Virtanen         2026-08-30  7617  
ddaccd985bb01d Pauli Virtanen         2026-08-30  7618  		/* Leave room for non-deferred channel that ends the group. */
ddaccd985bb01d Pauli Virtanen         2026-08-30  7619  		if (test_bit(FLAG_DEFER_SETUP, &chan->flags))
ddaccd985bb01d Pauli Virtanen         2026-08-30  7620  			data.count += 1;
da49b602f7f75c Luiz Augusto von Dentz 2020-03-25  7621  
da49b602f7f75c Luiz Augusto von Dentz 2020-03-25  7622  		/* Check if there isn't too many channels being connected */
da49b602f7f75c Luiz Augusto von Dentz 2020-03-25  7623  		if (data.count > L2CAP_ECRED_CONN_SCID_MAX) {
da49b602f7f75c Luiz Augusto von Dentz 2020-03-25  7624  			hci_conn_drop(hcon);
da49b602f7f75c Luiz Augusto von Dentz 2020-03-25  7625  			err = -EPROTO;
ddaccd985bb01d Pauli Virtanen         2026-08-30  7626  			goto chan_unlock;
da49b602f7f75c Luiz Augusto von Dentz 2020-03-25  7627  		}
da49b602f7f75c Luiz Augusto von Dentz 2020-03-25  7628  	}
da49b602f7f75c Luiz Augusto von Dentz 2020-03-25  7629  
6696072ffe0720 Pauli Virtanen         2026-09-02 @7630  	if ((cid && __l2cap_get_chan_by_dcid(conn, cid)) || chan->conn ||
6696072ffe0720 Pauli Virtanen         2026-09-02  7631  	    test_bit(FLAG_DEL, &chan->flags)) {
162b49e75cf2c6 Johan Hedberg          2014-01-17  7632  		hci_conn_drop(hcon);
162b49e75cf2c6 Johan Hedberg          2014-01-17  7633  		err = -EBUSY;
02e246aee868e9 Johan Hedberg          2014-10-02  7634  		goto chan_unlock;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7635  	}
162b49e75cf2c6 Johan Hedberg          2014-01-17  7636  
162b49e75cf2c6 Johan Hedberg          2014-01-17  7637  	/* Update source addr of the socket */
162b49e75cf2c6 Johan Hedberg          2014-01-17  7638  	bacpy(&chan->src, &hcon->src);
a250e048a7fb32 Johan Hedberg          2015-01-15  7639  	chan->src_type = bdaddr_src_type(hcon);
162b49e75cf2c6 Johan Hedberg          2014-01-17  7640  
02e246aee868e9 Johan Hedberg          2014-10-02  7641  	__l2cap_chan_add(conn, chan);
162b49e75cf2c6 Johan Hedberg          2014-01-17  7642  
886931f0c7e6fb Pauli Virtanen         2026-08-29 @7643  	lockdep_assert_held(&chan->conn->lock);
886931f0c7e6fb Pauli Virtanen         2026-08-29  7644  
162b49e75cf2c6 Johan Hedberg          2014-01-17  7645  	/* l2cap_chan_add takes its own ref so we can drop this one */
162b49e75cf2c6 Johan Hedberg          2014-01-17  7646  	hci_conn_drop(hcon);
162b49e75cf2c6 Johan Hedberg          2014-01-17  7647  
162b49e75cf2c6 Johan Hedberg          2014-01-17  7648  	l2cap_state_change(chan, BT_CONNECT);
162b49e75cf2c6 Johan Hedberg          2014-01-17  7649  	__set_chan_timer(chan, chan->ops->get_sndtimeo(chan));
162b49e75cf2c6 Johan Hedberg          2014-01-17  7650  
61202e4de92d9b Johan Hedberg          2014-01-28  7651  	/* Release chan->sport so that it can be reused by other
61202e4de92d9b Johan Hedberg          2014-01-28  7652  	 * sockets (as it's only used for listening sockets).
61202e4de92d9b Johan Hedberg          2014-01-28  7653  	 */
61202e4de92d9b Johan Hedberg          2014-01-28  7654  	write_lock(&chan_list_lock);
61202e4de92d9b Johan Hedberg          2014-01-28  7655  	chan->sport = 0;
61202e4de92d9b Johan Hedberg          2014-01-28  7656  	write_unlock(&chan_list_lock);
61202e4de92d9b Johan Hedberg          2014-01-28  7657  
162b49e75cf2c6 Johan Hedberg          2014-01-17  7658  	if (hcon->state == BT_CONNECTED) {
162b49e75cf2c6 Johan Hedberg          2014-01-17  7659  		if (chan->chan_type != L2CAP_CHAN_CONN_ORIENTED) {
162b49e75cf2c6 Johan Hedberg          2014-01-17  7660  			__clear_chan_timer(chan);
e7cafc45258c85 Johan Hedberg          2014-07-17  7661  			if (l2cap_chan_check_security(chan, true))
162b49e75cf2c6 Johan Hedberg          2014-01-17  7662  				l2cap_state_change(chan, BT_CONNECTED);
162b49e75cf2c6 Johan Hedberg          2014-01-17  7663  		} else
162b49e75cf2c6 Johan Hedberg          2014-01-17  7664  			l2cap_do_start(chan);
162b49e75cf2c6 Johan Hedberg          2014-01-17  7665  	}
162b49e75cf2c6 Johan Hedberg          2014-01-17  7666  
162b49e75cf2c6 Johan Hedberg          2014-01-17  7667  	err = 0;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7668  
02e246aee868e9 Johan Hedberg          2014-10-02  7669  chan_unlock:
162b49e75cf2c6 Johan Hedberg          2014-01-17  7670  	l2cap_chan_unlock(chan);
ab4eedb790cae4 Luiz Augusto von Dentz 2025-02-06  7671  	mutex_unlock(&conn->lock);
02e246aee868e9 Johan Hedberg          2014-10-02  7672  done:
162b49e75cf2c6 Johan Hedberg          2014-01-17  7673  	hci_dev_unlock(hdev);
162b49e75cf2c6 Johan Hedberg          2014-01-17  7674  	hci_dev_put(hdev);
162b49e75cf2c6 Johan Hedberg          2014-01-17  7675  	return err;
162b49e75cf2c6 Johan Hedberg          2014-01-17  7676  }
6b8d4a6a03144c Jukka Rissanen         2014-06-18  7677  EXPORT_SYMBOL_GPL(l2cap_chan_connect);
162b49e75cf2c6 Johan Hedberg          2014-01-17  7678  

:::::: The code at line 7643 was first introduced by commit
:::::: 886931f0c7e6fb6b3f596fe2397eb3a309da2755 Bluetooth: L2CAP: add annotations for l2cap_chan list locking

:::::: TO: Pauli Virtanen <pav@iki.fi>
:::::: CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
