Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48F8210FF
	for <oe-kbuild@lists.linux.dev>; Mon,  6 May 2024 06:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714977063; cv=none; b=XCT/eFa+xWKQYy5N1BxvEmibzbgBKNHNNbk+FRwIjztanIeMz4bHbi2Ir02l+Fk095gyT45Y5Gp3WAEQ4eU0/2kHBp0BtffhiWiHhxR6grohCKuKWpff1kBCNz8uJ55QxFAW2CsDkZ8Oh1+yIz4bQp27ZOejvC/UNcsMXkhTzzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714977063; c=relaxed/simple;
	bh=aX4Ct9lO20uWG5QWFqo6X/jFS/nZjKFJBkhkWnHWz+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oVEjETzpB+ThXL1AgsVbHh42jDPfAC3bCU0DsOF5N6p0KMO5hEdjN3WpcO61B7IdoWuVmpv7Y1X4aPtpct+jRxMJzHAkrOAHj9ndp8WgjXY6d+s697cXgztdq1zPRaXMTC5T063SZLQbiQeb3GNt2TkCs+/PeqqczFeSTV7/hRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aZe7yIZC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aZe7yIZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714977062; x=1746513062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aX4Ct9lO20uWG5QWFqo6X/jFS/nZjKFJBkhkWnHWz+Q=;
  b=aZe7yIZC4+pqiWAvkOkLbAReaji2iZgW6nfnqWiWH1epxKR0VwOyp6RA
   uZIaqdV4ATnseZDZl5Nz5AknMEgT09KHJ/nCSDmI95h1KuJjAgiBTHnrj
   miS/9TZWZYcJcp/4PJt+j2sBwWwwuOu1RB5aLjYppIiIeuis7U6f0spN7
   wKxYgb46oT4v9xGjc77EO91tH52HbQqIbtNI37lMIAYHdD1zn97KxBTso
   kAZP2v1h+Qw5ioV6W53+5M0t2eqi1G90bUiBZ2Rit9p7aBe7EocpdnXk+
   BPACk6RwBeARkuTXivVE88ziw/+7Lm0EWfExyj/hhOi5/XotDRnVA2mct
   Q==;
X-CSE-ConnectionGUID: p9qWDpKhQxqxRSjNTdgeBA==
X-CSE-MsgGUID: 9fC3IkyHS26ffOdbMX35yA==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="21264147"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="21264147"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 23:31:01 -0700
X-CSE-ConnectionGUID: 0gFt21sbQ1isI3sOxWG9eA==
X-CSE-MsgGUID: eJZ8vPqgQf6514DE2nsaLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="32577377"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 May 2024 23:30:58 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3rsG-0000Vr-2K;
	Mon, 06 May 2024 06:30:56 +0000
Date: Mon, 6 May 2024 14:30:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:pending-fixes 54/103]
 net/bluetooth/l2cap_core.c:4017:2-8: preceding lock on line 3926
Message-ID: <202405061441.ZOD4UFaj-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Sungwoo Kim <iam@sung-woo.kim>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   a185dbfbbbbdc7182a72f909bd8de736a3793de9
commit: 4d7b41c0e43995b0e992b9f8903109275744b658 [54/103] Bluetooth: L2CAP: Fix slab-use-after-free in l2cap_connect()
:::::: branch date: 8 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-102-20240506 (https://download.01.org/0day-ci/archive/20240506/202405061441.ZOD4UFaj-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202405061441.ZOD4UFaj-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/bluetooth/l2cap_core.c:4017:2-8: preceding lock on line 3926

vim +4017 net/bluetooth/l2cap_core.c

4e8402a3f88442 net/bluetooth/l2cap.c      Marcel Holtmann     2007-10-20  3904  
4d7b41c0e43995 net/bluetooth/l2cap_core.c Sungwoo Kim         2024-04-30  3905  static void l2cap_connect(struct l2cap_conn *conn, struct l2cap_cmd_hdr *cmd,
4c89b6aad5b7c5 net/bluetooth/l2cap_core.c Mat Martineau       2012-10-11  3906  			  u8 *data, u8 rsp_code, u8 amp_id)
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3907  {
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3908  	struct l2cap_conn_req *req = (struct l2cap_conn_req *) data;
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3909  	struct l2cap_conn_rsp rsp;
4d7b41c0e43995 net/bluetooth/l2cap_core.c Sungwoo Kim         2024-04-30  3910  	struct l2cap_chan *chan = NULL, *pchan = NULL;
e7c29cb16c8334 net/bluetooth/l2cap.c      Marcel Holtmann     2008-09-09  3911  	int result, status = L2CAP_CS_NO_INFO;
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3912  
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3913  	u16 dcid = 0, scid = __le16_to_cpu(req->scid);
8e036fc3143646 net/bluetooth/l2cap.c      Al Viro             2007-07-29  3914  	__le16 psm = req->psm;
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3915  
097db76cdccd81 net/bluetooth/l2cap_core.c Andrei Emeltchenko  2012-03-09  3916  	BT_DBG("psm 0x%2.2x scid 0x%4.4x", __le16_to_cpu(psm), scid);
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3917  
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3918  	/* Check if we have socket listening on psm */
6f59b904ae57df net/bluetooth/l2cap_core.c Marcel Holtmann     2013-10-13  3919  	pchan = l2cap_global_chan_by_psm(BT_LISTEN, psm, &conn->hcon->src,
bf20fd4ec1d39d net/bluetooth/l2cap_core.c Johan Hedberg       2013-05-14  3920  					 &conn->hcon->dst, ACL_LINK);
23691d75cdc69c net/bluetooth/l2cap_core.c Gustavo Padovan     2011-04-27  3921  	if (!pchan) {
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3922  		result = L2CAP_CR_BAD_PSM;
4d7b41c0e43995 net/bluetooth/l2cap_core.c Sungwoo Kim         2024-04-30  3923  		goto response;
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3924  	}
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3925  
3df91ea20e7443 net/bluetooth/l2cap_core.c Andrei Emeltchenko  2012-02-21 @3926  	mutex_lock(&conn->chan_lock);
8ffb929098a569 net/bluetooth/l2cap_core.c Gustavo Padovan     2013-10-21  3927  	l2cap_chan_lock(pchan);
e0f0cb56364958 net/bluetooth/l2cap.c      Gustavo Padovan     2010-11-01  3928  
e7c29cb16c8334 net/bluetooth/l2cap.c      Marcel Holtmann     2008-09-09  3929  	/* Check if the ACL is secure enough (if not SDP) */
dcf4adbfdc7ad1 net/bluetooth/l2cap_core.c Joe Perches         2014-03-12  3930  	if (psm != cpu_to_le16(L2CAP_PSM_SDP) &&
e7c29cb16c8334 net/bluetooth/l2cap.c      Marcel Holtmann     2008-09-09  3931  	    !hci_conn_check_link_mode(conn->hcon)) {
9f5a0d7bf079e9 net/bluetooth/l2cap_core.c Andrei Emeltchenko  2011-11-07  3932  		conn->disc_reason = HCI_ERROR_AUTH_FAILURE;
e7c29cb16c8334 net/bluetooth/l2cap.c      Marcel Holtmann     2008-09-09  3933  		result = L2CAP_CR_SEC_BLOCK;
e7c29cb16c8334 net/bluetooth/l2cap.c      Marcel Holtmann     2008-09-09  3934  		goto response;
e7c29cb16c8334 net/bluetooth/l2cap.c      Marcel Holtmann     2008-09-09  3935  	}
e7c29cb16c8334 net/bluetooth/l2cap.c      Marcel Holtmann     2008-09-09  3936  
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3937  	result = L2CAP_CR_NO_MEM;
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3938  
dd1a8f8a88eecb net/bluetooth/l2cap_core.c Mallikarjun Phulari 2018-10-05  3939  	/* Check for valid dynamic CID range (as per Erratum 3253) */
dd1a8f8a88eecb net/bluetooth/l2cap_core.c Mallikarjun Phulari 2018-10-05  3940  	if (scid < L2CAP_CID_DYN_START || scid > L2CAP_CID_DYN_END) {
dd1a8f8a88eecb net/bluetooth/l2cap_core.c Mallikarjun Phulari 2018-10-05  3941  		result = L2CAP_CR_INVALID_SCID;
dd1a8f8a88eecb net/bluetooth/l2cap_core.c Mallikarjun Phulari 2018-10-05  3942  		goto response;
dd1a8f8a88eecb net/bluetooth/l2cap_core.c Mallikarjun Phulari 2018-10-05  3943  	}
dd1a8f8a88eecb net/bluetooth/l2cap_core.c Mallikarjun Phulari 2018-10-05  3944  
2dfa1003ccd19b net/bluetooth/l2cap_core.c Gustavo Padovan     2012-05-27  3945  	/* Check if we already have channel with that dcid */
dd1a8f8a88eecb net/bluetooth/l2cap_core.c Mallikarjun Phulari 2018-10-05  3946  	if (__l2cap_get_chan_by_dcid(conn, scid)) {
dd1a8f8a88eecb net/bluetooth/l2cap_core.c Mallikarjun Phulari 2018-10-05  3947  		result = L2CAP_CR_SCID_IN_USE;
2dfa1003ccd19b net/bluetooth/l2cap_core.c Gustavo Padovan     2012-05-27  3948  		goto response;
dd1a8f8a88eecb net/bluetooth/l2cap_core.c Mallikarjun Phulari 2018-10-05  3949  	}
2dfa1003ccd19b net/bluetooth/l2cap_core.c Gustavo Padovan     2012-05-27  3950  
80b980279508ed net/bluetooth/l2cap_core.c Gustavo Padovan     2012-05-27  3951  	chan = pchan->ops->new_connection(pchan);
80808e431e1ef2 net/bluetooth/l2cap_core.c Gustavo Padovan     2011-05-16  3952  	if (!chan)
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3953  		goto response;
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3954  
330b6c1521d76d net/bluetooth/l2cap_core.c Syam Sidhardhan     2013-08-06  3955  	/* For certain devices (ex: HID mouse), support for authentication,
330b6c1521d76d net/bluetooth/l2cap_core.c Syam Sidhardhan     2013-08-06  3956  	 * pairing and bonding is optional. For such devices, inorder to avoid
330b6c1521d76d net/bluetooth/l2cap_core.c Syam Sidhardhan     2013-08-06  3957  	 * the ACL alive for too long after L2CAP disconnection, reset the ACL
330b6c1521d76d net/bluetooth/l2cap_core.c Syam Sidhardhan     2013-08-06  3958  	 * disc_timeout back to HCI_DISCONN_TIMEOUT during L2CAP connect.
330b6c1521d76d net/bluetooth/l2cap_core.c Syam Sidhardhan     2013-08-06  3959  	 */
330b6c1521d76d net/bluetooth/l2cap_core.c Syam Sidhardhan     2013-08-06  3960  	conn->hcon->disc_timeout = HCI_DISCONN_TIMEOUT;
330b6c1521d76d net/bluetooth/l2cap_core.c Syam Sidhardhan     2013-08-06  3961  
7eafc59e2f547f net/bluetooth/l2cap_core.c Marcel Holtmann     2013-10-13  3962  	bacpy(&chan->src, &conn->hcon->src);
7eafc59e2f547f net/bluetooth/l2cap_core.c Marcel Holtmann     2013-10-13  3963  	bacpy(&chan->dst, &conn->hcon->dst);
a250e048a7fb32 net/bluetooth/l2cap_core.c Johan Hedberg       2015-01-15  3964  	chan->src_type = bdaddr_src_type(conn->hcon);
a250e048a7fb32 net/bluetooth/l2cap_core.c Johan Hedberg       2015-01-15  3965  	chan->dst_type = bdaddr_dst_type(conn->hcon);
fe4128e0aabc3c net/bluetooth/l2cap_core.c Gustavo Padovan     2011-04-13  3966  	chan->psm  = psm;
fe4128e0aabc3c net/bluetooth/l2cap_core.c Gustavo Padovan     2011-04-13  3967  	chan->dcid = scid;
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3968  
6be3655552ee49 net/bluetooth/l2cap_core.c Andrei Emeltchenko  2012-02-22  3969  	__l2cap_chan_add(conn, chan);
48454079c2d4b9 net/bluetooth/l2cap_core.c Gustavo Padovan     2011-03-25  3970  
fe4128e0aabc3c net/bluetooth/l2cap_core.c Gustavo Padovan     2011-04-13  3971  	dcid = chan->scid;
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3972  
8d836d71e2223b net/bluetooth/l2cap_core.c Gustavo Padovan     2013-10-15  3973  	__set_chan_timer(chan, chan->ops->get_sndtimeo(chan));
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3974  
fc7f8a7ed45438 net/bluetooth/l2cap_core.c Gustavo Padovan     2011-03-25  3975  	chan->ident = cmd->ident;
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  3976  
984947dc64f82b net/bluetooth/l2cap.c      Marcel Holtmann     2009-02-06  3977  	if (conn->info_state & L2CAP_INFO_FEAT_MASK_REQ_DONE) {
e7cafc45258c85 net/bluetooth/l2cap_core.c Johan Hedberg       2014-07-17  3978  		if (l2cap_chan_check_security(chan, false)) {
bdc257830760a7 net/bluetooth/l2cap_core.c Marcel Holtmann     2013-10-14  3979  			if (test_bit(FLAG_DEFER_SETUP, &chan->flags)) {
f93fa2732313ca net/bluetooth/l2cap_core.c Gustavo Padovan     2013-10-21  3980  				l2cap_state_change(chan, BT_CONNECT2);
f66dc81f44d918 net/bluetooth/l2cap.c      Marcel Holtmann     2009-01-15  3981  				result = L2CAP_CR_PEND;
f66dc81f44d918 net/bluetooth/l2cap.c      Marcel Holtmann     2009-01-15  3982  				status = L2CAP_CS_AUTHOR_PEND;
2dc4e5105f012b net/bluetooth/l2cap_core.c Gustavo Padovan     2012-10-12  3983  				chan->ops->defer(chan);
1700915fef115b net/bluetooth/l2cap_core.c Mat Martineau       2012-10-23  3984  			} else {
1700915fef115b net/bluetooth/l2cap_core.c Mat Martineau       2012-10-23  3985  				/* Force pending result for AMP controllers.
1700915fef115b net/bluetooth/l2cap_core.c Mat Martineau       2012-10-23  3986  				 * The connection will succeed after the
1700915fef115b net/bluetooth/l2cap_core.c Mat Martineau       2012-10-23  3987  				 * physical link is up.
1700915fef115b net/bluetooth/l2cap_core.c Mat Martineau       2012-10-23  3988  				 */
6ed971ca4f6bd9 net/bluetooth/l2cap_core.c Marcel Holtmann     2013-10-05  3989  				if (amp_id == AMP_ID_BREDR) {
f93fa2732313ca net/bluetooth/l2cap_core.c Gustavo Padovan     2013-10-21  3990  					l2cap_state_change(chan, BT_CONFIG);
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  3991  					result = L2CAP_CR_SUCCESS;
6ed971ca4f6bd9 net/bluetooth/l2cap_core.c Marcel Holtmann     2013-10-05  3992  				} else {
f93fa2732313ca net/bluetooth/l2cap_core.c Gustavo Padovan     2013-10-21  3993  					l2cap_state_change(chan, BT_CONNECT2);
6ed971ca4f6bd9 net/bluetooth/l2cap_core.c Marcel Holtmann     2013-10-05  3994  					result = L2CAP_CR_PEND;
1700915fef115b net/bluetooth/l2cap_core.c Mat Martineau       2012-10-23  3995  				}
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  3996  				status = L2CAP_CS_NO_INFO;
f66dc81f44d918 net/bluetooth/l2cap.c      Marcel Holtmann     2009-01-15  3997  			}
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  3998  		} else {
f93fa2732313ca net/bluetooth/l2cap_core.c Gustavo Padovan     2013-10-21  3999  			l2cap_state_change(chan, BT_CONNECT2);
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  4000  			result = L2CAP_CR_PEND;
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  4001  			status = L2CAP_CS_AUTHEN_PEND;
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4002  		}
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4003  	} else {
f93fa2732313ca net/bluetooth/l2cap_core.c Gustavo Padovan     2013-10-21  4004  		l2cap_state_change(chan, BT_CONNECT2);
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4005  		result = L2CAP_CR_PEND;
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4006  		status = L2CAP_CS_NO_INFO;
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  4007  	}
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  4008  
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  4009  response:
aca3192cc60d2b net/bluetooth/l2cap.c      YOSHIFUJI Hideaki   2007-03-25  4010  	rsp.scid   = cpu_to_le16(scid);
aca3192cc60d2b net/bluetooth/l2cap.c      YOSHIFUJI Hideaki   2007-03-25  4011  	rsp.dcid   = cpu_to_le16(dcid);
aca3192cc60d2b net/bluetooth/l2cap.c      YOSHIFUJI Hideaki   2007-03-25  4012  	rsp.result = cpu_to_le16(result);
aca3192cc60d2b net/bluetooth/l2cap.c      YOSHIFUJI Hideaki   2007-03-25  4013  	rsp.status = cpu_to_le16(status);
4c89b6aad5b7c5 net/bluetooth/l2cap_core.c Mat Martineau       2012-10-11  4014  	l2cap_send_cmd(conn, cmd->ident, rsp_code, sizeof(rsp), &rsp);
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4015  
4d7b41c0e43995 net/bluetooth/l2cap_core.c Sungwoo Kim         2024-04-30  4016  	if (!pchan)
4d7b41c0e43995 net/bluetooth/l2cap_core.c Sungwoo Kim         2024-04-30 @4017  		return;
4d7b41c0e43995 net/bluetooth/l2cap_core.c Sungwoo Kim         2024-04-30  4018  
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4019  	if (result == L2CAP_CR_PEND && status == L2CAP_CS_NO_INFO) {
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4020  		struct l2cap_info_req info;
dcf4adbfdc7ad1 net/bluetooth/l2cap_core.c Joe Perches         2014-03-12  4021  		info.type = cpu_to_le16(L2CAP_IT_FEAT_MASK);
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4022  
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4023  		conn->info_state |= L2CAP_INFO_FEAT_MASK_REQ_SENT;
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4024  		conn->info_ident = l2cap_get_ident(conn);
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4025  
ba13ccd9b911e0 net/bluetooth/l2cap_core.c Marcel Holtmann     2012-03-01  4026  		schedule_delayed_work(&conn->info_timer, L2CAP_INFO_TIMEOUT);
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4027  
2d7928184c3d87 net/bluetooth/l2cap_core.c Gustavo Padovan     2012-10-06  4028  		l2cap_send_cmd(conn, conn->info_ident, L2CAP_INFO_REQ,
2d7928184c3d87 net/bluetooth/l2cap_core.c Gustavo Padovan     2012-10-06  4029  			       sizeof(info), &info);
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4030  	}
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4031  
c1360a1cf35117 net/bluetooth/l2cap_core.c Gustavo Padovan     2011-06-10  4032  	if (chan && !test_bit(CONF_REQ_SENT, &chan->conf_state) &&
e9aeb2ddd441f0 net/bluetooth/l2cap.c      Gustavo Padovan     2010-07-08  4033  	    result == L2CAP_CR_SUCCESS) {
e9aeb2ddd441f0 net/bluetooth/l2cap.c      Gustavo Padovan     2010-07-08  4034  		u8 buf[128];
c1360a1cf35117 net/bluetooth/l2cap_core.c Gustavo Padovan     2011-06-10  4035  		set_bit(CONF_REQ_SENT, &chan->conf_state);
e9aeb2ddd441f0 net/bluetooth/l2cap.c      Gustavo Padovan     2010-07-08  4036  		l2cap_send_cmd(conn, l2cap_get_ident(conn), L2CAP_CONF_REQ,
e860d2c904d1a9 net/bluetooth/l2cap_core.c Ben Seri            2017-09-09  4037  			       l2cap_build_conf_req(chan, buf, sizeof(buf)), buf);
73ffa904b78287 net/bluetooth/l2cap_core.c Gustavo Padovan     2011-03-25  4038  		chan->num_conf_req++;
e9aeb2ddd441f0 net/bluetooth/l2cap.c      Gustavo Padovan     2010-07-08  4039  	}
1700915fef115b net/bluetooth/l2cap_core.c Mat Martineau       2012-10-23  4040  
4d7b41c0e43995 net/bluetooth/l2cap_core.c Sungwoo Kim         2024-04-30  4041  	l2cap_chan_unlock(pchan);
4d7b41c0e43995 net/bluetooth/l2cap_core.c Sungwoo Kim         2024-04-30  4042  	mutex_unlock(&conn->chan_lock);
4d7b41c0e43995 net/bluetooth/l2cap_core.c Sungwoo Kim         2024-04-30  4043  	l2cap_chan_put(pchan);
4c89b6aad5b7c5 net/bluetooth/l2cap_core.c Mat Martineau       2012-10-11  4044  }
e9aeb2ddd441f0 net/bluetooth/l2cap.c      Gustavo Padovan     2010-07-08  4045  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
