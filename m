Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E931E8826
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 01:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782956056; cv=none; b=ForFMfPAFJ4Ys3pfwPqJS8xihq5ZOt5jEN3xg4QhgcS/SpjEhUMuTf3rWDGHtgamfucq2OLScoaS36RnGwgZE2oSjctJStSFLazKu+dQ3tYizj8Fe70rQ+6+IArGJFmw0az84/P4PAf0StENb9PhpTTqmM7+RTYbAGkL54mXg2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782956056; c=relaxed/simple;
	bh=ExjAqfP2EJrbHBByDETp9nJHISOGTHxAz1hcbNJfg+Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rOe1QD3hqzTBxtMX+K9BhYcv67gPv9vM7KHyjPeok84gCxNWnDf4Qio3poy9J+NAldwQ2eHbbzHwDLzgNxD+a5i5U1+/MYpbGtC23lGCEN/tXXErujqVevl5Izhq3NHDkbGqqA2YPIN08i1DlorNeXO7L7tOo0+kLGhkYk5cvqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=geloHbuz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="geloHbuz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782956054; x=1814492054;
  h=date:from:to:cc:subject:message-id;
  bh=ExjAqfP2EJrbHBByDETp9nJHISOGTHxAz1hcbNJfg+Y=;
  b=geloHbuzzygJMQrw8VyvxOYW6Z2N1HEt+fI5Kwv26NOujGDKgGnTIaFi
   DHq/4iufdO5FHmPx3BVXOLmUJmOXUK/mxPcgL7rpiH1seos9LBezd4Tgu
   Rf7T1+wy38q89LJyH62IKYXxTO14JDJgEdhnWDo8zSghDF57Y3c2qB7ME
   IG4YZauSaZwyqe9d6bSShKDv2uPJY69TuTZYGwYiVCwg8gaqWu8eT+xf7
   cT4F4BASdrxe94BcJN+wP033PDGkB3ZimKn4OaCZOd+uUbmX1XkorTtii
   J3ziGgIEV7t/ESAtOMgFqyI1Ge8gsGB9BjWDaL4OWSIHBvZZLQqKOiMFC
   Q==;
X-CSE-ConnectionGUID: Ba6I4IlkRqiz9ntBjv3W+w==
X-CSE-MsgGUID: NXlQePliQEKesf7u4BP5tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83729917"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="83729917"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 18:34:13 -0700
X-CSE-ConnectionGUID: FBEiO/pXS6q+1sU6oGPZkA==
X-CSE-MsgGUID: RFVVvX//TaWLog1AGVbqpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="254650193"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Jul 2026 18:34:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf6Jd-000000009pj-1srR;
	Thu, 02 Jul 2026 01:34:09 +0000
Date: Thu, 02 Jul 2026 09:33:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-kiwi-5.10 247/247]
 net/bluetooth/smp.c:1634 smp_user_confirm_reply() warn: variable dereferenced
 before check 'conn' (see line 1632)
Message-ID: <202607020919.fES7SHDV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   ab3bdc1a04cd01ca15ee632e70155b708dfc406b
commit: e219c3110a160e5801ab1eb276cfed21d686017f [247/247] Bluetooth: SMP: Convert BT_ERR/BT_DBG to bt_dev_err/bt_dev_dbg
:::::: branch date: 5 hours ago
:::::: commit date: 2 years, 6 months ago
config: x86_64-randconfig-161-20260701 (https://download.01.org/0day-ci/archive/20260702/202607020919.fES7SHDV-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607020919.fES7SHDV-lkp@intel.com/

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
e219c3110a160e Luiz Augusto von Dentz 2021-03-15 @1632  	bt_dev_dbg(conn->hcon->hdev, "");
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
e219c3110a160e Luiz Augusto von Dentz 2021-03-15  1658  		bt_dev_dbg(conn->hcon->hdev, "PassKey: %d", value);
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
