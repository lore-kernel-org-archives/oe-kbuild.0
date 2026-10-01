Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3E72E06EF
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Oct 2026 20:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790885694; cv=none; b=DtWNK0Fs0X2WGFmEVTH6mLSrLgWINXNyTbTN1MP6ZXdxbvXaFzQW5yqn+wMC6YfwWdsJw9EilHAVDQqSwDCYbGJ7nVSbp/otvO6jjiahd/V4O5l62esPosiat2Z1Q09J9srQ+7CxzzEvzCCZr8vuu7RMwrUGDrdZ9yVpxjEvTVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790885694; c=relaxed/simple;
	bh=dMnPS86ZSmeRLrbj6AHf4PS5LcYYvHtdDyzuSfqg1n4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nDjTW9qfMaaZLSld5uNE6+HxKwvn/CPDKFlZjVksiSl2PBs4H7M4wvfJzaPeo7hhHfC6b7RFXy57dQhaxBMwCVUfoviGsKgINXF8W1ahXnbcXMpCNKVR6KZR0bQ0A288C+31YcXJPL2v70O6sc6E4dF6MOiyk9cj74I8A9AHo9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LWjjZifx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LWjjZifx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790885692; x=1822421692;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dMnPS86ZSmeRLrbj6AHf4PS5LcYYvHtdDyzuSfqg1n4=;
  b=LWjjZifx/oGRnqd0a1uKFBYRy2kF7u1xY3gm3PXq5WPBKqb/3ujVHz/l
   TKxYuXugJ0cWUFLn3rauUIwKyyQFYE1zGQUosoRKMu5qaXjgCa8nVMOkd
   XlSMb4PASpa1k0q+bhCtAzyzvIr8W8OgUFxTk0Q2QYaOAmLK2jGbnq1l5
   XsP/Hqp9tQ0arJbQXF6dKyWttdiVKScpdEqXhRS3UKEEnbwIW+mt82HHd
   it0kewJ+q3gBDB72tMQ2GXjHhFgvyVYatoxiWL/3v0MXW4JfFXBKJ9hTn
   sgK6uW/hwToOtp2QHbQ1qauGLh7APgXioG1/0E5gnOG/xkeKW77PsuD87
   Q==;
X-CSE-ConnectionGUID: UeNqS1K3SjCuOwIYujfi4A==
X-CSE-MsgGUID: EpL/oBERRF2TON2gkAPGFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="117185072"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="117185072"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 13:14:51 -0700
X-CSE-ConnectionGUID: 2zNnZPM3SB6KdCwxgWUcgA==
X-CSE-MsgGUID: u+Iu66MvSyq5tW2fo7qm5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="275280778"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 01 Oct 2026 13:14:50 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCNB1-000000000CR-0r8K;
	Thu, 01 Oct 2026 20:14:47 +0000
Date: Thu, 01 Oct 2026 22:14:16 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [chrome-os:chromeos-6.1 18/18]
 net/bluetooth/l2cap_core.c:4101:2-8: preceding lock on line 4009
Message-ID: <202610012236.X9Oudppf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-6.1
head:   e2d429338ffa976942aba4887d0b8a7e07dc0267
commit: 8629a65a48890769c47ebc9b6e57c02a80a8975e [18/18] Bluetooth: L2CAP: =
Fix slab-use-after-free in l2cap_connect()
:::::: branch date: 7 hours ago
:::::: commit date: 10 weeks ago
config: x86_64-randconfig-r2107-20261001 (https://download.01.org/0day-ci/a=
rchive/20261001/202610012236.X9Oudppf-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933=
e47d3a3451d81e72ac174dcb5aa28b59d1)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610012236.X9Oudppf-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/bluetooth/l2cap_core.c:4101:2-8: preceding lock on line 4009

vim +4101 net/bluetooth/l2cap_core.c

4e8402a3f88442 net/bluetooth/l2cap.c      Marcel Holtmann        2007-10-20=
  3987 =20
8629a65a488907 net/bluetooth/l2cap_core.c Sungwoo Kim            2026-07-15=
  3988  static void l2cap_connect(struct l2cap_conn *conn, struct l2cap_cmd=
_hdr *cmd,
4c89b6aad5b7c5 net/bluetooth/l2cap_core.c Mat Martineau          2012-10-11=
  3989  			  u8 *data, u8 rsp_code, u8 amp_id)
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds         2005-04-16=
  3990  {
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds         2005-04-16=
  3991  	struct l2cap_conn_req *req =3D (struct l2cap_conn_req *) data;
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds         2005-04-16=
  3992  	struct l2cap_conn_rsp rsp;
8629a65a488907 net/bluetooth/l2cap_core.c Sungwoo Kim            2026-07-15=
  3993  	struct l2cap_chan *chan =3D NULL, *pchan =3D NULL;
e7c29cb16c8334 net/bluetooth/l2cap.c      Marcel Holtmann        2008-09-09=
  3994  	int result, status =3D L2CAP_CS_NO_INFO;
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds         2005-04-16=
  3995 =20
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds         2005-04-16=
  3996  	u16 dcid =3D 0, scid =3D __le16_to_cpu(req->scid);
8e036fc3143646 net/bluetooth/l2cap.c      Al Viro                2007-07-29=
  3997  	__le16 psm =3D req->psm;
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds         2005-04-16=
  3998 =20
097db76cdccd81 net/bluetooth/l2cap_core.c Andrei Emeltchenko     2012-03-09=
  3999  	BT_DBG("psm 0x%2.2x scid 0x%4.4x", __le16_to_cpu(psm), scid);
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds         2005-04-16=
  4000 =20
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds         2005-04-16=
  4001  	/* Check if we have socket listening on psm */
6f59b904ae57df net/bluetooth/l2cap_core.c Marcel Holtmann        2013-10-13=
  4002  	pchan =3D l2cap_global_chan_by_psm(BT_LISTEN, psm, &conn->hcon->sr=
c,
bf20fd4ec1d39d net/bluetooth/l2cap_core.c Johan Hedberg          2013-05-14=
  4003  					 &conn->hcon->dst, ACL_LINK);
23691d75cdc69c net/bluetooth/l2cap_core.c Gustavo Padovan        2011-04-27=
  4004  	if (!pchan) {
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds         2005-04-16=
  4005  		result =3D L2CAP_CR_BAD_PSM;
8629a65a488907 net/bluetooth/l2cap_core.c Sungwoo Kim            2026-07-15=
  4006  		goto response;
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds         2005-04-16=
  4007  	}
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds         2005-04-16=
  4008 =20
3df91ea20e7443 net/bluetooth/l2cap_core.c Andrei Emeltchenko     2012-02-21=
 @4009  	mutex_lock(&conn->chan_lock);
8ffb929098a569 net/bluetooth/l2cap_core.c Gustavo Padovan        2013-10-21=
  4010  	l2cap_chan_lock(pchan);
e0f0cb56364958 net/bluetooth/l2cap.c      Gustavo Padovan        2010-11-01=
  4011 =20
e7c29cb16c8334 net/bluetooth/l2cap.c      Marcel Holtmann        2008-09-09=
  4012  	/* Check if the ACL is secure enough (if not SDP) */
dcf4adbfdc7ad1 net/bluetooth/l2cap_core.c Joe Perches            2014-03-12=
  4013  	if (psm !=3D cpu_to_le16(L2CAP_PSM_SDP) &&
c6d527bbd3d389 net/bluetooth/l2cap_core.c Fr=C3=A9d=C3=A9ric Danis         =
2025-04-09  4014  	    (!hci_conn_check_link_mode(conn->hcon) ||
15efa7d00fb304 net/bluetooth/l2cap_core.c Luiz Augusto von Dentz 2025-05-07=
  4015  	    !l2cap_check_enc_key_size(conn->hcon, pchan))) {
9f5a0d7bf079e9 net/bluetooth/l2cap_core.c Andrei Emeltchenko     2011-11-07=
  4016  		conn->disc_reason =3D HCI_ERROR_AUTH_FAILURE;
e7c29cb16c8334 net/bluetooth/l2cap.c      Marcel Holtmann        2008-09-09=
  4017  		result =3D L2CAP_CR_SEC_BLOCK;
e7c29cb16c8334 net/bluetooth/l2cap.c      Marcel Holtmann        2008-09-09=
  4018  		goto response;
e7c29cb16c8334 net/bluetooth/l2cap.c      Marcel Holtmann        2008-09-09=
  4019  	}
e7c29cb16c8334 net/bluetooth/l2cap.c      Marcel Holtmann        2008-09-09=
  4020 =20
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds         2005-04-16=
  4021  	result =3D L2CAP_CR_NO_MEM;
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds         2005-04-16=
  4022 =20
dd1a8f8a88eecb net/bluetooth/l2cap_core.c Mallikarjun Phulari    2018-10-05=
  4023  	/* Check for valid dynamic CID range (as per Erratum 3253) */
dd1a8f8a88eecb net/bluetooth/l2cap_core.c Mallikarjun Phulari    2018-10-05=
  4024  	if (scid < L2CAP_CID_DYN_START || scid > L2CAP_CID_DYN_END) {
dd1a8f8a88eecb net/bluetooth/l2cap_core.c Mallikarjun Phulari    2018-10-05=
  4025  		result =3D L2CAP_CR_INVALID_SCID;
dd1a8f8a88eecb net/bluetooth/l2cap_core.c Mallikarjun Phulari    2018-10-05=
  4026  		goto response;
dd1a8f8a88eecb net/bluetooth/l2cap_core.c Mallikarjun Phulari    2018-10-05=
  4027  	}
dd1a8f8a88eecb net/bluetooth/l2cap_core.c Mallikarjun Phulari    2018-10-05=
  4028 =20
2dfa1003ccd19b net/bluetooth/l2cap_core.c Gustavo Padovan        2012-05-27=
  4029  	/* Check if we already have channel with that dcid */
dd1a8f8a88eecb net/bluetooth/l2cap_core.c Mallikarjun Phulari    2018-10-05=
  4030  	if (__l2cap_get_chan_by_dcid(conn, scid)) {
dd1a8f8a88eecb net/bluetooth/l2cap_core.c Mallikarjun Phulari    2018-10-05=
  4031  		result =3D L2CAP_CR_SCID_IN_USE;
2dfa1003ccd19b net/bluetooth/l2cap_core.c Gustavo Padovan        2012-05-27=
  4032  		goto response;
dd1a8f8a88eecb net/bluetooth/l2cap_core.c Mallikarjun Phulari    2018-10-05=
  4033  	}
2dfa1003ccd19b net/bluetooth/l2cap_core.c Gustavo Padovan        2012-05-27=
  4034 =20
80b980279508ed net/bluetooth/l2cap_core.c Gustavo Padovan        2012-05-27=
  4035  	chan =3D pchan->ops->new_connection(pchan);
80808e431e1ef2 net/bluetooth/l2cap_core.c Gustavo Padovan        2011-05-16=
  4036  	if (!chan)
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds         2005-04-16=
  4037  		goto response;
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds         2005-04-16=
  4038 =20
330b6c1521d76d net/bluetooth/l2cap_core.c Syam Sidhardhan        2013-08-06=
  4039  	/* For certain devices (ex: HID mouse), support for authentication,
330b6c1521d76d net/bluetooth/l2cap_core.c Syam Sidhardhan        2013-08-06=
  4040  	 * pairing and bonding is optional. For such devices, inorder to a=
void
330b6c1521d76d net/bluetooth/l2cap_core.c Syam Sidhardhan        2013-08-06=
  4041  	 * the ACL alive for too long after L2CAP disconnection, reset the=
 ACL
330b6c1521d76d net/bluetooth/l2cap_core.c Syam Sidhardhan        2013-08-06=
  4042  	 * disc_timeout back to HCI_DISCONN_TIMEOUT during L2CAP connect.
330b6c1521d76d net/bluetooth/l2cap_core.c Syam Sidhardhan        2013-08-06=
  4043  	 */
330b6c1521d76d net/bluetooth/l2cap_core.c Syam Sidhardhan        2013-08-06=
  4044  	conn->hcon->disc_timeout =3D HCI_DISCONN_TIMEOUT;
330b6c1521d76d net/bluetooth/l2cap_core.c Syam Sidhardhan        2013-08-06=
  4045 =20
7eafc59e2f547f net/bluetooth/l2cap_core.c Marcel Holtmann        2013-10-13=
  4046  	bacpy(&chan->src, &conn->hcon->src);
7eafc59e2f547f net/bluetooth/l2cap_core.c Marcel Holtmann        2013-10-13=
  4047  	bacpy(&chan->dst, &conn->hcon->dst);
a250e048a7fb32 net/bluetooth/l2cap_core.c Johan Hedberg          2015-01-15=
  4048  	chan->src_type =3D bdaddr_src_type(conn->hcon);
a250e048a7fb32 net/bluetooth/l2cap_core.c Johan Hedberg          2015-01-15=
  4049  	chan->dst_type =3D bdaddr_dst_type(conn->hcon);
fe4128e0aabc3c net/bluetooth/l2cap_core.c Gustavo Padovan        2011-04-13=
  4050  	chan->psm  =3D psm;
fe4128e0aabc3c net/bluetooth/l2cap_core.c Gustavo Padovan        2011-04-13=
  4051  	chan->dcid =3D scid;
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds         2005-04-16=
  4052 =20
6be3655552ee49 net/bluetooth/l2cap_core.c Andrei Emeltchenko     2012-02-22=
  4053  	__l2cap_chan_add(conn, chan);
48454079c2d4b9 net/bluetooth/l2cap_core.c Gustavo Padovan        2011-03-25=
  4054 =20
fe4128e0aabc3c net/bluetooth/l2cap_core.c Gustavo Padovan        2011-04-13=
  4055  	dcid =3D chan->scid;
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds         2005-04-16=
  4056 =20
8d836d71e2223b net/bluetooth/l2cap_core.c Gustavo Padovan        2013-10-15=
  4057  	__set_chan_timer(chan, chan->ops->get_sndtimeo(chan));
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds         2005-04-16=
  4058 =20
fc7f8a7ed45438 net/bluetooth/l2cap_core.c Gustavo Padovan        2011-03-25=
  4059  	chan->ident =3D cmd->ident;
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14=
  4060 =20
984947dc64f82b net/bluetooth/l2cap.c      Marcel Holtmann        2009-02-06=
  4061  	if (conn->info_state & L2CAP_INFO_FEAT_MASK_REQ_DONE) {
e7cafc45258c85 net/bluetooth/l2cap_core.c Johan Hedberg          2014-07-17=
  4062  		if (l2cap_chan_check_security(chan, false)) {
bdc257830760a7 net/bluetooth/l2cap_core.c Marcel Holtmann        2013-10-14=
  4063  			if (test_bit(FLAG_DEFER_SETUP, &chan->flags)) {
f93fa2732313ca net/bluetooth/l2cap_core.c Gustavo Padovan        2013-10-21=
  4064  				l2cap_state_change(chan, BT_CONNECT2);
f66dc81f44d918 net/bluetooth/l2cap.c      Marcel Holtmann        2009-01-15=
  4065  				result =3D L2CAP_CR_PEND;
f66dc81f44d918 net/bluetooth/l2cap.c      Marcel Holtmann        2009-01-15=
  4066  				status =3D L2CAP_CS_AUTHOR_PEND;
2dc4e5105f012b net/bluetooth/l2cap_core.c Gustavo Padovan        2012-10-12=
  4067  				chan->ops->defer(chan);
1700915fef115b net/bluetooth/l2cap_core.c Mat Martineau          2012-10-23=
  4068  			} else {
1700915fef115b net/bluetooth/l2cap_core.c Mat Martineau          2012-10-23=
  4069  				/* Force pending result for AMP controllers.
1700915fef115b net/bluetooth/l2cap_core.c Mat Martineau          2012-10-23=
  4070  				 * The connection will succeed after the
1700915fef115b net/bluetooth/l2cap_core.c Mat Martineau          2012-10-23=
  4071  				 * physical link is up.
1700915fef115b net/bluetooth/l2cap_core.c Mat Martineau          2012-10-23=
  4072  				 */
6ed971ca4f6bd9 net/bluetooth/l2cap_core.c Marcel Holtmann        2013-10-05=
  4073  				if (amp_id =3D=3D AMP_ID_BREDR) {
f93fa2732313ca net/bluetooth/l2cap_core.c Gustavo Padovan        2013-10-21=
  4074  					l2cap_state_change(chan, BT_CONFIG);
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14=
  4075  					result =3D L2CAP_CR_SUCCESS;
6ed971ca4f6bd9 net/bluetooth/l2cap_core.c Marcel Holtmann        2013-10-05=
  4076  				} else {
f93fa2732313ca net/bluetooth/l2cap_core.c Gustavo Padovan        2013-10-21=
  4077  					l2cap_state_change(chan, BT_CONNECT2);
6ed971ca4f6bd9 net/bluetooth/l2cap_core.c Marcel Holtmann        2013-10-05=
  4078  					result =3D L2CAP_CR_PEND;
1700915fef115b net/bluetooth/l2cap_core.c Mat Martineau          2012-10-23=
  4079  				}
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14=
  4080  				status =3D L2CAP_CS_NO_INFO;
f66dc81f44d918 net/bluetooth/l2cap.c      Marcel Holtmann        2009-01-15=
  4081  			}
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14=
  4082  		} else {
f93fa2732313ca net/bluetooth/l2cap_core.c Gustavo Padovan        2013-10-21=
  4083  			l2cap_state_change(chan, BT_CONNECT2);
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds         2005-04-16=
  4084  			result =3D L2CAP_CR_PEND;
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds         2005-04-16=
  4085  			status =3D L2CAP_CS_AUTHEN_PEND;
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14=
  4086  		}
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14=
  4087  	} else {
f93fa2732313ca net/bluetooth/l2cap_core.c Gustavo Padovan        2013-10-21=
  4088  		l2cap_state_change(chan, BT_CONNECT2);
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14=
  4089  		result =3D L2CAP_CR_PEND;
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14=
  4090  		status =3D L2CAP_CS_NO_INFO;
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds         2005-04-16=
  4091  	}
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds         2005-04-16=
  4092 =20
^1da177e4c3f41 net/bluetooth/l2cap.c      Linus Torvalds         2005-04-16=
  4093  response:
aca3192cc60d2b net/bluetooth/l2cap.c      YOSHIFUJI Hideaki      2007-03-25=
  4094  	rsp.scid   =3D cpu_to_le16(scid);
aca3192cc60d2b net/bluetooth/l2cap.c      YOSHIFUJI Hideaki      2007-03-25=
  4095  	rsp.dcid   =3D cpu_to_le16(dcid);
aca3192cc60d2b net/bluetooth/l2cap.c      YOSHIFUJI Hideaki      2007-03-25=
  4096  	rsp.result =3D cpu_to_le16(result);
aca3192cc60d2b net/bluetooth/l2cap.c      YOSHIFUJI Hideaki      2007-03-25=
  4097  	rsp.status =3D cpu_to_le16(status);
4c89b6aad5b7c5 net/bluetooth/l2cap_core.c Mat Martineau          2012-10-11=
  4098  	l2cap_send_cmd(conn, cmd->ident, rsp_code, sizeof(rsp), &rsp);
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14=
  4099 =20
8629a65a488907 net/bluetooth/l2cap_core.c Sungwoo Kim            2026-07-15=
  4100  	if (!pchan)
8629a65a488907 net/bluetooth/l2cap_core.c Sungwoo Kim            2026-07-15=
 @4101  		return;
8629a65a488907 net/bluetooth/l2cap_core.c Sungwoo Kim            2026-07-15=
  4102 =20
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14=
  4103  	if (result =3D=3D L2CAP_CR_PEND && status =3D=3D L2CAP_CS_NO_INFO)=
 {
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14=
  4104  		struct l2cap_info_req info;
dcf4adbfdc7ad1 net/bluetooth/l2cap_core.c Joe Perches            2014-03-12=
  4105  		info.type =3D cpu_to_le16(L2CAP_IT_FEAT_MASK);
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14=
  4106 =20
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14=
  4107  		conn->info_state |=3D L2CAP_INFO_FEAT_MASK_REQ_SENT;
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14=
  4108  		conn->info_ident =3D l2cap_get_ident(conn);
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14=
  4109 =20
ba13ccd9b911e0 net/bluetooth/l2cap_core.c Marcel Holtmann        2012-03-01=
  4110  		schedule_delayed_work(&conn->info_timer, L2CAP_INFO_TIMEOUT);
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14=
  4111 =20
2d7928184c3d87 net/bluetooth/l2cap_core.c Gustavo Padovan        2012-10-06=
  4112  		l2cap_send_cmd(conn, conn->info_ident, L2CAP_INFO_REQ,
2d7928184c3d87 net/bluetooth/l2cap_core.c Gustavo Padovan        2012-10-06=
  4113  			       sizeof(info), &info);
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14=
  4114  	}
79d554a6976a29 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14=
  4115 =20
c1360a1cf35117 net/bluetooth/l2cap_core.c Gustavo Padovan        2011-06-10=
  4116  	if (chan && !test_bit(CONF_REQ_SENT, &chan->conf_state) &&
e9aeb2ddd441f0 net/bluetooth/l2cap.c      Gustavo Padovan        2010-07-08=
  4117  	    result =3D=3D L2CAP_CR_SUCCESS) {
e9aeb2ddd441f0 net/bluetooth/l2cap.c      Gustavo Padovan        2010-07-08=
  4118  		u8 buf[128];
c1360a1cf35117 net/bluetooth/l2cap_core.c Gustavo Padovan        2011-06-10=
  4119  		set_bit(CONF_REQ_SENT, &chan->conf_state);
e9aeb2ddd441f0 net/bluetooth/l2cap.c      Gustavo Padovan        2010-07-08=
  4120  		l2cap_send_cmd(conn, l2cap_get_ident(conn), L2CAP_CONF_REQ,
e860d2c904d1a9 net/bluetooth/l2cap_core.c Ben Seri               2017-09-09=
  4121  			       l2cap_build_conf_req(chan, buf, sizeof(buf)), buf);
73ffa904b78287 net/bluetooth/l2cap_core.c Gustavo Padovan        2011-03-25=
  4122  		chan->num_conf_req++;
e9aeb2ddd441f0 net/bluetooth/l2cap.c      Gustavo Padovan        2010-07-08=
  4123  	}
1700915fef115b net/bluetooth/l2cap_core.c Mat Martineau          2012-10-23=
  4124 =20
8629a65a488907 net/bluetooth/l2cap_core.c Sungwoo Kim            2026-07-15=
  4125  	l2cap_chan_unlock(pchan);
8629a65a488907 net/bluetooth/l2cap_core.c Sungwoo Kim            2026-07-15=
  4126  	mutex_unlock(&conn->chan_lock);
8629a65a488907 net/bluetooth/l2cap_core.c Sungwoo Kim            2026-07-15=
  4127  	l2cap_chan_put(pchan);
4c89b6aad5b7c5 net/bluetooth/l2cap_core.c Mat Martineau          2012-10-11=
  4128  }
e9aeb2ddd441f0 net/bluetooth/l2cap.c      Gustavo Padovan        2010-07-08=
  4129 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
