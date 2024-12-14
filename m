Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEA8CA5A
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Dec 2024 02:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734142437; cv=none; b=SHv93F7g8l82yMCVxEi4Ms0MlDCWTgXCQSRC4QqFso8sbuZQBk3OJCsqn162xltB7xl1+RaW2BiGvRX2Krbfz3mkjvlCDHMHjyBQM5uo4f0uTIaefC78DC41fQYJ8VZXUoDRRmuPHKPU6zNGAcdKj/R9CnhfM5qdgCfISRmMTNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734142437; c=relaxed/simple;
	bh=6cGq9/QQWElhsXOVcBs6+CeoT4F8pcnRkEHz2ktAMCo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hiVynk6SMqT8kNLOmTYVYf6ztlxYTAdV8y3lKryT09W2RBm82JGRes3PYmqZlErZOxbnPe0zqnv5FLWgtjXQS0+zVThe9ddjP+DzM51et4JTJ/DvtBDyIOVnSvBug4PvrBNoyTFl5SQrXIeRE8fUDeAhca/73V9tZ5L6Q+JgUvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kazrUy1j; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kazrUy1j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734142435; x=1765678435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6cGq9/QQWElhsXOVcBs6+CeoT4F8pcnRkEHz2ktAMCo=;
  b=kazrUy1jC4aHwfppTQQhT0acLq2mIOty+AHFdiPbMv/JlMFfuZOAkQiN
   hbDNY6yoFVhDY9stwl2A/vbD43FL7jjMwBDBM6+lRFHh92wWT+Du1JTDH
   hWGbFfzuogBrvfsARtjnWVxRMIuvnbpCUPv+p8WpgoZWTAEgGcqV/Gvnb
   eYpwhlQYxy+A1IxCiyMDrgKIlSL1/D1iYIoPyuAI+dPndU2BacyvWtaiI
   sZ/GcSxbbm8XkH7lLLIQYanf34kRWhI3i6FGUGsUztpZ/CIIUDrWgMl21
   jyYOki49sadKgongypgI+8MoiOQNUv+FfRUQCS5RBGkZ/8koBpAG3hjxS
   A==;
X-CSE-ConnectionGUID: ZyW73rxDT22D30A39Lad7Q==
X-CSE-MsgGUID: 3Mi6g3kkSmCectrW4j7o2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34340790"
X-IronPort-AV: E=Sophos;i="6.12,233,1728975600"; 
   d="scan'208";a="34340790"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 18:13:55 -0800
X-CSE-ConnectionGUID: ulna0WiWRLenE1HM4FOCwA==
X-CSE-MsgGUID: 2YQ1xn8YTdOmMHOxXh0Y/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97486968"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Dec 2024 18:13:53 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMHfC-000CdF-1Q;
	Sat, 14 Dec 2024 02:13:50 +0000
Date: Sat, 14 Dec 2024 10:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: net/bluetooth/l2cap_core.c:4017:2-8: preceding lock on line 3926
Message-ID: <202412141026.LvaCBNUY-lkp@intel.com>
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
TO: Sungwoo Kim <iam@sung-woo.kim>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4800575d8c0b2f354ab05ab1c4749e45e213bf73
commit: 4d7b41c0e43995b0e992b9f8903109275744b658 Bluetooth: L2CAP: Fix slab-use-after-free in l2cap_connect()
date:   7 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 months ago
config: m68k-randconfig-r052-20241214 (https://download.01.org/0day-ci/archive/20241214/202412141026.LvaCBNUY-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412141026.LvaCBNUY-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/bluetooth/l2cap_core.c:4017:2-8: preceding lock on line 3926

vim +4017 net/bluetooth/l2cap_core.c

4e8402a3f884427 net/bluetooth/l2cap.c      Marcel Holtmann     2007-10-20  3904  
4d7b41c0e43995b net/bluetooth/l2cap_core.c Sungwoo Kim         2024-04-30  3905  static void l2cap_connect(struct l2cap_conn *conn, struct l2cap_cmd_hdr *cmd,
4c89b6aad5b7c5c net/bluetooth/l2cap_core.c Mat Martineau       2012-10-11  3906  			  u8 *data, u8 rsp_code, u8 amp_id)
^1da177e4c3f415 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3907  {
^1da177e4c3f415 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3908  	struct l2cap_conn_req *req = (struct l2cap_conn_req *) data;
^1da177e4c3f415 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3909  	struct l2cap_conn_rsp rsp;
4d7b41c0e43995b net/bluetooth/l2cap_core.c Sungwoo Kim         2024-04-30  3910  	struct l2cap_chan *chan = NULL, *pchan = NULL;
e7c29cb16c83344 net/bluetooth/l2cap.c      Marcel Holtmann     2008-09-09  3911  	int result, status = L2CAP_CS_NO_INFO;
^1da177e4c3f415 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3912  
^1da177e4c3f415 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3913  	u16 dcid = 0, scid = __le16_to_cpu(req->scid);
8e036fc3143646d net/bluetooth/l2cap.c      Al Viro             2007-07-29  3914  	__le16 psm = req->psm;
^1da177e4c3f415 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3915  
097db76cdccd810 net/bluetooth/l2cap_core.c Andrei Emeltchenko  2012-03-09  3916  	BT_DBG("psm 0x%2.2x scid 0x%4.4x", __le16_to_cpu(psm), scid);
^1da177e4c3f415 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3917  
^1da177e4c3f415 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3918  	/* Check if we have socket listening on psm */
6f59b904ae57df9 net/bluetooth/l2cap_core.c Marcel Holtmann     2013-10-13  3919  	pchan = l2cap_global_chan_by_psm(BT_LISTEN, psm, &conn->hcon->src,
bf20fd4ec1d39df net/bluetooth/l2cap_core.c Johan Hedberg       2013-05-14  3920  					 &conn->hcon->dst, ACL_LINK);
23691d75cdc69c3 net/bluetooth/l2cap_core.c Gustavo Padovan     2011-04-27  3921  	if (!pchan) {
^1da177e4c3f415 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3922  		result = L2CAP_CR_BAD_PSM;
4d7b41c0e43995b net/bluetooth/l2cap_core.c Sungwoo Kim         2024-04-30  3923  		goto response;
^1da177e4c3f415 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3924  	}
^1da177e4c3f415 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3925  
3df91ea20e74434 net/bluetooth/l2cap_core.c Andrei Emeltchenko  2012-02-21 @3926  	mutex_lock(&conn->chan_lock);
8ffb929098a5693 net/bluetooth/l2cap_core.c Gustavo Padovan     2013-10-21  3927  	l2cap_chan_lock(pchan);
e0f0cb563649582 net/bluetooth/l2cap.c      Gustavo Padovan     2010-11-01  3928  
e7c29cb16c83344 net/bluetooth/l2cap.c      Marcel Holtmann     2008-09-09  3929  	/* Check if the ACL is secure enough (if not SDP) */
dcf4adbfdc7ad14 net/bluetooth/l2cap_core.c Joe Perches         2014-03-12  3930  	if (psm != cpu_to_le16(L2CAP_PSM_SDP) &&
e7c29cb16c83344 net/bluetooth/l2cap.c      Marcel Holtmann     2008-09-09  3931  	    !hci_conn_check_link_mode(conn->hcon)) {
9f5a0d7bf079e9e net/bluetooth/l2cap_core.c Andrei Emeltchenko  2011-11-07  3932  		conn->disc_reason = HCI_ERROR_AUTH_FAILURE;
e7c29cb16c83344 net/bluetooth/l2cap.c      Marcel Holtmann     2008-09-09  3933  		result = L2CAP_CR_SEC_BLOCK;
e7c29cb16c83344 net/bluetooth/l2cap.c      Marcel Holtmann     2008-09-09  3934  		goto response;
e7c29cb16c83344 net/bluetooth/l2cap.c      Marcel Holtmann     2008-09-09  3935  	}
e7c29cb16c83344 net/bluetooth/l2cap.c      Marcel Holtmann     2008-09-09  3936  
^1da177e4c3f415 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3937  	result = L2CAP_CR_NO_MEM;
^1da177e4c3f415 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3938  
dd1a8f8a88eecbc net/bluetooth/l2cap_core.c Mallikarjun Phulari 2018-10-05  3939  	/* Check for valid dynamic CID range (as per Erratum 3253) */
dd1a8f8a88eecbc net/bluetooth/l2cap_core.c Mallikarjun Phulari 2018-10-05  3940  	if (scid < L2CAP_CID_DYN_START || scid > L2CAP_CID_DYN_END) {
dd1a8f8a88eecbc net/bluetooth/l2cap_core.c Mallikarjun Phulari 2018-10-05  3941  		result = L2CAP_CR_INVALID_SCID;
dd1a8f8a88eecbc net/bluetooth/l2cap_core.c Mallikarjun Phulari 2018-10-05  3942  		goto response;
dd1a8f8a88eecbc net/bluetooth/l2cap_core.c Mallikarjun Phulari 2018-10-05  3943  	}
dd1a8f8a88eecbc net/bluetooth/l2cap_core.c Mallikarjun Phulari 2018-10-05  3944  
2dfa1003ccd19b4 net/bluetooth/l2cap_core.c Gustavo Padovan     2012-05-27  3945  	/* Check if we already have channel with that dcid */
dd1a8f8a88eecbc net/bluetooth/l2cap_core.c Mallikarjun Phulari 2018-10-05  3946  	if (__l2cap_get_chan_by_dcid(conn, scid)) {
dd1a8f8a88eecbc net/bluetooth/l2cap_core.c Mallikarjun Phulari 2018-10-05  3947  		result = L2CAP_CR_SCID_IN_USE;
2dfa1003ccd19b4 net/bluetooth/l2cap_core.c Gustavo Padovan     2012-05-27  3948  		goto response;
dd1a8f8a88eecbc net/bluetooth/l2cap_core.c Mallikarjun Phulari 2018-10-05  3949  	}
2dfa1003ccd19b4 net/bluetooth/l2cap_core.c Gustavo Padovan     2012-05-27  3950  
80b980279508edd net/bluetooth/l2cap_core.c Gustavo Padovan     2012-05-27  3951  	chan = pchan->ops->new_connection(pchan);
80808e431e1ef25 net/bluetooth/l2cap_core.c Gustavo Padovan     2011-05-16  3952  	if (!chan)
^1da177e4c3f415 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3953  		goto response;
^1da177e4c3f415 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3954  
330b6c1521d76d8 net/bluetooth/l2cap_core.c Syam Sidhardhan     2013-08-06  3955  	/* For certain devices (ex: HID mouse), support for authentication,
330b6c1521d76d8 net/bluetooth/l2cap_core.c Syam Sidhardhan     2013-08-06  3956  	 * pairing and bonding is optional. For such devices, inorder to avoid
330b6c1521d76d8 net/bluetooth/l2cap_core.c Syam Sidhardhan     2013-08-06  3957  	 * the ACL alive for too long after L2CAP disconnection, reset the ACL
330b6c1521d76d8 net/bluetooth/l2cap_core.c Syam Sidhardhan     2013-08-06  3958  	 * disc_timeout back to HCI_DISCONN_TIMEOUT during L2CAP connect.
330b6c1521d76d8 net/bluetooth/l2cap_core.c Syam Sidhardhan     2013-08-06  3959  	 */
330b6c1521d76d8 net/bluetooth/l2cap_core.c Syam Sidhardhan     2013-08-06  3960  	conn->hcon->disc_timeout = HCI_DISCONN_TIMEOUT;
330b6c1521d76d8 net/bluetooth/l2cap_core.c Syam Sidhardhan     2013-08-06  3961  
7eafc59e2f547fc net/bluetooth/l2cap_core.c Marcel Holtmann     2013-10-13  3962  	bacpy(&chan->src, &conn->hcon->src);
7eafc59e2f547fc net/bluetooth/l2cap_core.c Marcel Holtmann     2013-10-13  3963  	bacpy(&chan->dst, &conn->hcon->dst);
a250e048a7fb32c net/bluetooth/l2cap_core.c Johan Hedberg       2015-01-15  3964  	chan->src_type = bdaddr_src_type(conn->hcon);
a250e048a7fb32c net/bluetooth/l2cap_core.c Johan Hedberg       2015-01-15  3965  	chan->dst_type = bdaddr_dst_type(conn->hcon);
fe4128e0aabc3c7 net/bluetooth/l2cap_core.c Gustavo Padovan     2011-04-13  3966  	chan->psm  = psm;
fe4128e0aabc3c7 net/bluetooth/l2cap_core.c Gustavo Padovan     2011-04-13  3967  	chan->dcid = scid;
^1da177e4c3f415 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3968  
6be3655552ee49a net/bluetooth/l2cap_core.c Andrei Emeltchenko  2012-02-22  3969  	__l2cap_chan_add(conn, chan);
48454079c2d4b9e net/bluetooth/l2cap_core.c Gustavo Padovan     2011-03-25  3970  
fe4128e0aabc3c7 net/bluetooth/l2cap_core.c Gustavo Padovan     2011-04-13  3971  	dcid = chan->scid;
^1da177e4c3f415 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3972  
8d836d71e2223b8 net/bluetooth/l2cap_core.c Gustavo Padovan     2013-10-15  3973  	__set_chan_timer(chan, chan->ops->get_sndtimeo(chan));
^1da177e4c3f415 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  3974  
fc7f8a7ed454385 net/bluetooth/l2cap_core.c Gustavo Padovan     2011-03-25  3975  	chan->ident = cmd->ident;
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  3976  
984947dc64f82bc net/bluetooth/l2cap.c      Marcel Holtmann     2009-02-06  3977  	if (conn->info_state & L2CAP_INFO_FEAT_MASK_REQ_DONE) {
e7cafc45258c852 net/bluetooth/l2cap_core.c Johan Hedberg       2014-07-17  3978  		if (l2cap_chan_check_security(chan, false)) {
bdc257830760a78 net/bluetooth/l2cap_core.c Marcel Holtmann     2013-10-14  3979  			if (test_bit(FLAG_DEFER_SETUP, &chan->flags)) {
f93fa2732313ca3 net/bluetooth/l2cap_core.c Gustavo Padovan     2013-10-21  3980  				l2cap_state_change(chan, BT_CONNECT2);
f66dc81f44d918e net/bluetooth/l2cap.c      Marcel Holtmann     2009-01-15  3981  				result = L2CAP_CR_PEND;
f66dc81f44d918e net/bluetooth/l2cap.c      Marcel Holtmann     2009-01-15  3982  				status = L2CAP_CS_AUTHOR_PEND;
2dc4e5105f012bd net/bluetooth/l2cap_core.c Gustavo Padovan     2012-10-12  3983  				chan->ops->defer(chan);
1700915fef115b1 net/bluetooth/l2cap_core.c Mat Martineau       2012-10-23  3984  			} else {
1700915fef115b1 net/bluetooth/l2cap_core.c Mat Martineau       2012-10-23  3985  				/* Force pending result for AMP controllers.
1700915fef115b1 net/bluetooth/l2cap_core.c Mat Martineau       2012-10-23  3986  				 * The connection will succeed after the
1700915fef115b1 net/bluetooth/l2cap_core.c Mat Martineau       2012-10-23  3987  				 * physical link is up.
1700915fef115b1 net/bluetooth/l2cap_core.c Mat Martineau       2012-10-23  3988  				 */
6ed971ca4f6bd96 net/bluetooth/l2cap_core.c Marcel Holtmann     2013-10-05  3989  				if (amp_id == AMP_ID_BREDR) {
f93fa2732313ca3 net/bluetooth/l2cap_core.c Gustavo Padovan     2013-10-21  3990  					l2cap_state_change(chan, BT_CONFIG);
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  3991  					result = L2CAP_CR_SUCCESS;
6ed971ca4f6bd96 net/bluetooth/l2cap_core.c Marcel Holtmann     2013-10-05  3992  				} else {
f93fa2732313ca3 net/bluetooth/l2cap_core.c Gustavo Padovan     2013-10-21  3993  					l2cap_state_change(chan, BT_CONNECT2);
6ed971ca4f6bd96 net/bluetooth/l2cap_core.c Marcel Holtmann     2013-10-05  3994  					result = L2CAP_CR_PEND;
1700915fef115b1 net/bluetooth/l2cap_core.c Mat Martineau       2012-10-23  3995  				}
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  3996  				status = L2CAP_CS_NO_INFO;
f66dc81f44d918e net/bluetooth/l2cap.c      Marcel Holtmann     2009-01-15  3997  			}
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  3998  		} else {
f93fa2732313ca3 net/bluetooth/l2cap_core.c Gustavo Padovan     2013-10-21  3999  			l2cap_state_change(chan, BT_CONNECT2);
^1da177e4c3f415 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  4000  			result = L2CAP_CR_PEND;
^1da177e4c3f415 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  4001  			status = L2CAP_CS_AUTHEN_PEND;
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4002  		}
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4003  	} else {
f93fa2732313ca3 net/bluetooth/l2cap_core.c Gustavo Padovan     2013-10-21  4004  		l2cap_state_change(chan, BT_CONNECT2);
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4005  		result = L2CAP_CR_PEND;
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4006  		status = L2CAP_CS_NO_INFO;
^1da177e4c3f415 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  4007  	}
^1da177e4c3f415 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  4008  
^1da177e4c3f415 net/bluetooth/l2cap.c      Linus Torvalds      2005-04-16  4009  response:
aca3192cc60d2bf net/bluetooth/l2cap.c      YOSHIFUJI Hideaki   2007-03-25  4010  	rsp.scid   = cpu_to_le16(scid);
aca3192cc60d2bf net/bluetooth/l2cap.c      YOSHIFUJI Hideaki   2007-03-25  4011  	rsp.dcid   = cpu_to_le16(dcid);
aca3192cc60d2bf net/bluetooth/l2cap.c      YOSHIFUJI Hideaki   2007-03-25  4012  	rsp.result = cpu_to_le16(result);
aca3192cc60d2bf net/bluetooth/l2cap.c      YOSHIFUJI Hideaki   2007-03-25  4013  	rsp.status = cpu_to_le16(status);
4c89b6aad5b7c5c net/bluetooth/l2cap_core.c Mat Martineau       2012-10-11  4014  	l2cap_send_cmd(conn, cmd->ident, rsp_code, sizeof(rsp), &rsp);
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4015  
4d7b41c0e43995b net/bluetooth/l2cap_core.c Sungwoo Kim         2024-04-30  4016  	if (!pchan)
4d7b41c0e43995b net/bluetooth/l2cap_core.c Sungwoo Kim         2024-04-30 @4017  		return;
4d7b41c0e43995b net/bluetooth/l2cap_core.c Sungwoo Kim         2024-04-30  4018  
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4019  	if (result == L2CAP_CR_PEND && status == L2CAP_CS_NO_INFO) {
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4020  		struct l2cap_info_req info;
dcf4adbfdc7ad14 net/bluetooth/l2cap_core.c Joe Perches         2014-03-12  4021  		info.type = cpu_to_le16(L2CAP_IT_FEAT_MASK);
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4022  
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4023  		conn->info_state |= L2CAP_INFO_FEAT_MASK_REQ_SENT;
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4024  		conn->info_ident = l2cap_get_ident(conn);
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4025  
ba13ccd9b911e04 net/bluetooth/l2cap_core.c Marcel Holtmann     2012-03-01  4026  		schedule_delayed_work(&conn->info_timer, L2CAP_INFO_TIMEOUT);
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4027  
2d7928184c3d872 net/bluetooth/l2cap_core.c Gustavo Padovan     2012-10-06  4028  		l2cap_send_cmd(conn, conn->info_ident, L2CAP_INFO_REQ,
2d7928184c3d872 net/bluetooth/l2cap_core.c Gustavo Padovan     2012-10-06  4029  			       sizeof(info), &info);
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4030  	}
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann     2008-07-14  4031  
c1360a1cf35117d net/bluetooth/l2cap_core.c Gustavo Padovan     2011-06-10  4032  	if (chan && !test_bit(CONF_REQ_SENT, &chan->conf_state) &&
e9aeb2ddd441f0c net/bluetooth/l2cap.c      Gustavo Padovan     2010-07-08  4033  	    result == L2CAP_CR_SUCCESS) {
e9aeb2ddd441f0c net/bluetooth/l2cap.c      Gustavo Padovan     2010-07-08  4034  		u8 buf[128];
c1360a1cf35117d net/bluetooth/l2cap_core.c Gustavo Padovan     2011-06-10  4035  		set_bit(CONF_REQ_SENT, &chan->conf_state);
e9aeb2ddd441f0c net/bluetooth/l2cap.c      Gustavo Padovan     2010-07-08  4036  		l2cap_send_cmd(conn, l2cap_get_ident(conn), L2CAP_CONF_REQ,
e860d2c904d1a9f net/bluetooth/l2cap_core.c Ben Seri            2017-09-09  4037  			       l2cap_build_conf_req(chan, buf, sizeof(buf)), buf);
73ffa904b78287f net/bluetooth/l2cap_core.c Gustavo Padovan     2011-03-25  4038  		chan->num_conf_req++;
e9aeb2ddd441f0c net/bluetooth/l2cap.c      Gustavo Padovan     2010-07-08  4039  	}
1700915fef115b1 net/bluetooth/l2cap_core.c Mat Martineau       2012-10-23  4040  
4d7b41c0e43995b net/bluetooth/l2cap_core.c Sungwoo Kim         2024-04-30  4041  	l2cap_chan_unlock(pchan);
4d7b41c0e43995b net/bluetooth/l2cap_core.c Sungwoo Kim         2024-04-30  4042  	mutex_unlock(&conn->chan_lock);
4d7b41c0e43995b net/bluetooth/l2cap_core.c Sungwoo Kim         2024-04-30  4043  	l2cap_chan_put(pchan);
4c89b6aad5b7c5c net/bluetooth/l2cap_core.c Mat Martineau       2012-10-11  4044  }
e9aeb2ddd441f0c net/bluetooth/l2cap.c      Gustavo Padovan     2010-07-08  4045  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
