Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93521EB46
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Sep 2024 09:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726996369; cv=none; b=oX3Awbkejg5KBUG/imTYGkZO+8X5PsYFfA/zaNWCfrcjWyIC3hzlwogemYbkdFk13cnYUu0UizhuGisJKwz2tqiG8zn319xlaAo/Do6f/ee4jj6q1bzK5aQADibzgWs94xD0BwBloEnWOQdZQpnOljQ5sxPhHPxK4zVvwKE9ow4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726996369; c=relaxed/simple;
	bh=jkExdofxBL325EtKXPa6wvy/fSrMYl1/rheL2xyXBCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F54f9yzo8OAseickHZXUcn1VeEQgB3ExknRrFw0K33kMadvuAShn4igPHIgrlOOP2ayhuHYw4Z4cP70XyDrpZIYjWctpTMKS2y27hoUYsD/HdKckIX7uvRZ594Y8gAYVDa/nbA6njuTFc88WVTUX6UPg6ev67w7+iHSykk94kZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fTjWvz2J; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fTjWvz2J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726996367; x=1758532367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jkExdofxBL325EtKXPa6wvy/fSrMYl1/rheL2xyXBCQ=;
  b=fTjWvz2JpCzMlTooG9iqsBgdkDDThAjVxzO65TcZfGTsg6AFDzAW83qT
   CIqno/NbQF9cUKzDnwxsZJXz4pHNpXFz7TPNWFqZdXG1qxu27Wo6zVp5b
   YBoxepQiG+T8JB5p8AtwU2+MmgBKCh+Mf7Rqc0+zPWVCorqwyTXHmfXux
   37+zAjI5kYkAfuUK9PshVch48GjETHN1LHzc6II0kblPX6VozqntSI515
   T5/R9d1ipeeE75db9z+zkGWbTXXv8jaScSX81qKlO09F0mh+9sIW0+LTS
   5ItMNGsCwIvkU2FNCNExGRyAtTdQaxb2/jVVu5wSKadfYL1uWH6JjQBTv
   w==;
X-CSE-ConnectionGUID: +bPp0V4LR0CoAtozR5ziZQ==
X-CSE-MsgGUID: lz6L5OBtTjSS1QnX2FH1vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="43425448"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="43425448"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 02:12:46 -0700
X-CSE-ConnectionGUID: OXXEk2osQv2HxmfHZYznVQ==
X-CSE-MsgGUID: pVy5WnkZS7ae88VangCHaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="75531259"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Sep 2024 02:12:45 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssIe2-000GAM-2D;
	Sun, 22 Sep 2024 09:12:42 +0000
Date: Sun, 22 Sep 2024 17:12:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 26341/30000] net/bluetooth/smp.c:1634
 smp_user_confirm_reply() warn: variable dereferenced before check 'conn'
 (see line 1632)
Message-ID: <202409221743.6Lz7Tnxc-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: sanglipeng <sanglipeng1@jd.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   108b9a92793f61e1abf94d341c676515421e57a2
commit: bd705301e9438cf06d431bc1594ecfbbe6b21841 [26341/30000] Bluetooth: SMP: Convert BT_ERR/BT_DBG to bt_dev_err/bt_dev_dbg
:::::: branch date: 24 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-161-20240922 (https://download.01.org/0day-ci/archive/20240922/202409221743.6Lz7Tnxc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409221743.6Lz7Tnxc-lkp@intel.com/

smatch warnings:
net/bluetooth/smp.c:1634 smp_user_confirm_reply() warn: variable dereferenced before check 'conn' (see line 1632)

vim +/conn +1634 net/bluetooth/smp.c

760b018b6cf08e Johan Hedberg          2014-06-06  1623  
2b64d153a0cc9d Brian Gix              2011-12-21  1624  int smp_user_confirm_reply(struct hci_conn *hcon, u16 mgmt_op, __le32 passkey)
2b64d153a0cc9d Brian Gix              2011-12-21  1625  {
b10e8017bd9d02 Johan Hedberg          2014-06-27  1626  	struct l2cap_conn *conn = hcon->l2cap_data;
5d88cc73dded31 Johan Hedberg          2014-08-08  1627  	struct l2cap_chan *chan;
2b64d153a0cc9d Brian Gix              2011-12-21  1628  	struct smp_chan *smp;
2b64d153a0cc9d Brian Gix              2011-12-21  1629  	u32 value;
fc75cc8684d21d Johan Hedberg          2014-09-05  1630  	int err;
2b64d153a0cc9d Brian Gix              2011-12-21  1631  
bd705301e9438c Luiz Augusto von Dentz 2021-03-15 @1632  	bt_dev_dbg(conn->hcon->hdev, "");
2b64d153a0cc9d Brian Gix              2011-12-21  1633  
fc75cc8684d21d Johan Hedberg          2014-09-05 @1634  	if (!conn)
2b64d153a0cc9d Brian Gix              2011-12-21  1635  		return -ENOTCONN;
2b64d153a0cc9d Brian Gix              2011-12-21  1636  
5d88cc73dded31 Johan Hedberg          2014-08-08  1637  	chan = conn->smp;
5d88cc73dded31 Johan Hedberg          2014-08-08  1638  	if (!chan)
5d88cc73dded31 Johan Hedberg          2014-08-08  1639  		return -ENOTCONN;
5d88cc73dded31 Johan Hedberg          2014-08-08  1640  
fc75cc8684d21d Johan Hedberg          2014-09-05  1641  	l2cap_chan_lock(chan);
fc75cc8684d21d Johan Hedberg          2014-09-05  1642  	if (!chan->data) {
fc75cc8684d21d Johan Hedberg          2014-09-05  1643  		err = -ENOTCONN;
fc75cc8684d21d Johan Hedberg          2014-09-05  1644  		goto unlock;
fc75cc8684d21d Johan Hedberg          2014-09-05  1645  	}
fc75cc8684d21d Johan Hedberg          2014-09-05  1646  
5d88cc73dded31 Johan Hedberg          2014-08-08  1647  	smp = chan->data;
2b64d153a0cc9d Brian Gix              2011-12-21  1648  
760b018b6cf08e Johan Hedberg          2014-06-06  1649  	if (test_bit(SMP_FLAG_SC, &smp->flags)) {
760b018b6cf08e Johan Hedberg          2014-06-06  1650  		err = sc_user_reply(smp, mgmt_op, passkey);
760b018b6cf08e Johan Hedberg          2014-06-06  1651  		goto unlock;
760b018b6cf08e Johan Hedberg          2014-06-06  1652  	}
760b018b6cf08e Johan Hedberg          2014-06-06  1653  
2b64d153a0cc9d Brian Gix              2011-12-21  1654  	switch (mgmt_op) {
2b64d153a0cc9d Brian Gix              2011-12-21  1655  	case MGMT_OP_USER_PASSKEY_REPLY:
2b64d153a0cc9d Brian Gix              2011-12-21  1656  		value = le32_to_cpu(passkey);
943a732ab6440f Johan Hedberg          2014-03-18  1657  		memset(smp->tk, 0, sizeof(smp->tk));
bd705301e9438c Luiz Augusto von Dentz 2021-03-15  1658  		bt_dev_dbg(conn->hcon->hdev, "PassKey: %d", value);
943a732ab6440f Johan Hedberg          2014-03-18  1659  		put_unaligned_le32(value, smp->tk);
19186c7b45c134 Gustavo A. R. Silva    2020-07-08  1660  		fallthrough;
2b64d153a0cc9d Brian Gix              2011-12-21  1661  	case MGMT_OP_USER_CONFIRM_REPLY:
4a74d65868f10d Johan Hedberg          2014-05-20  1662  		set_bit(SMP_FLAG_TK_VALID, &smp->flags);
2b64d153a0cc9d Brian Gix              2011-12-21  1663  		break;
2b64d153a0cc9d Brian Gix              2011-12-21  1664  	case MGMT_OP_USER_PASSKEY_NEG_REPLY:
2b64d153a0cc9d Brian Gix              2011-12-21  1665  	case MGMT_OP_USER_CONFIRM_NEG_REPLY:
84794e119a22f6 Johan Hedberg          2013-11-06  1666  		smp_failure(conn, SMP_PASSKEY_ENTRY_FAILED);
fc75cc8684d21d Johan Hedberg          2014-09-05  1667  		err = 0;
fc75cc8684d21d Johan Hedberg          2014-09-05  1668  		goto unlock;
2b64d153a0cc9d Brian Gix              2011-12-21  1669  	default:
84794e119a22f6 Johan Hedberg          2013-11-06  1670  		smp_failure(conn, SMP_PASSKEY_ENTRY_FAILED);
fc75cc8684d21d Johan Hedberg          2014-09-05  1671  		err = -EOPNOTSUPP;
fc75cc8684d21d Johan Hedberg          2014-09-05  1672  		goto unlock;
2b64d153a0cc9d Brian Gix              2011-12-21  1673  	}
2b64d153a0cc9d Brian Gix              2011-12-21  1674  
fc75cc8684d21d Johan Hedberg          2014-09-05  1675  	err = 0;
fc75cc8684d21d Johan Hedberg          2014-09-05  1676  
2b64d153a0cc9d Brian Gix              2011-12-21  1677  	/* If it is our turn to send Pairing Confirm, do so now */
1cc6114402f864 Johan Hedberg          2014-05-20  1678  	if (test_bit(SMP_FLAG_CFM_PENDING, &smp->flags)) {
1cc6114402f864 Johan Hedberg          2014-05-20  1679  		u8 rsp = smp_confirm(smp);
1cc6114402f864 Johan Hedberg          2014-05-20  1680  		if (rsp)
1cc6114402f864 Johan Hedberg          2014-05-20  1681  			smp_failure(conn, rsp);
1cc6114402f864 Johan Hedberg          2014-05-20  1682  	}
2b64d153a0cc9d Brian Gix              2011-12-21  1683  
fc75cc8684d21d Johan Hedberg          2014-09-05  1684  unlock:
fc75cc8684d21d Johan Hedberg          2014-09-05  1685  	l2cap_chan_unlock(chan);
fc75cc8684d21d Johan Hedberg          2014-09-05  1686  	return err;
2b64d153a0cc9d Brian Gix              2011-12-21  1687  }
2b64d153a0cc9d Brian Gix              2011-12-21  1688  

:::::: The code at line 1634 was first introduced by commit
:::::: fc75cc8684d21d3649b28c4c37d4ce3f000759e4 Bluetooth: Fix locking of the SMP context

:::::: TO: Johan Hedberg <johan.hedberg@intel.com>
:::::: CC: Marcel Holtmann <marcel@holtmann.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
