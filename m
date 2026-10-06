Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A998A3AB476
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Oct 2026 22:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791327109; cv=none; b=LwMJFzX6w2TSmc2+ulljFHcPwbUNoBqcMgNWLcMP5nSrb/oZR8Vz0JGDZZH24f2JOdTrz2ExbPc61rJHN4qQ9MajdzLeMNF4Zo4MsXia7QAYol6zGjFHIoD2FVRfrL68U7ireyA1r+63mPIe0X3c8Zkpg4nGaPLe/0mbAyJ7iCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791327109; c=relaxed/simple;
	bh=1Ad9h/dsUR1DcPmTz4Axf09rxc9ZA6NxHuIYbe4FNBs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Go1YfIf5cD/QUnfLa8PrdEGpsVomAXJ9I4gfLW+p6niuJcMAoaIlO75xjk/1mn3Te+ejy5K6N3wfBspfj7wW8tBPawoxnMEaCMaGZAVMbYDX8z3rTbKncVh55z02OHHF9sPI/jjPppxOSu9E/CSmYSS1lL3PmKLfWuXSi/TjZWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kfkvPS5P; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kfkvPS5P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791327108; x=1822863108;
  h=date:from:to:cc:subject:message-id;
  bh=1Ad9h/dsUR1DcPmTz4Axf09rxc9ZA6NxHuIYbe4FNBs=;
  b=kfkvPS5PxIymKEdVEogdCkecV7DuxZ56Vl44Zs3lSAPEW9BecYPbnt9q
   LZTq+dJz6ffN1MFjCBstClWiWbkZgJ60QM8w8X9wgaSNJls3DGCWaxkcq
   hxodWVNdEBm1uLRn62TyQwiE7zDKIIF6XQ3laG91EJIuPyVq38oDb1721
   X1Fh/biC5tMmjOdm+eGFGYuMlgb92kmSuynXUvBAiCHVc1bZopNvbuTxq
   jqrtd7RRrX9fTaiLsDoEvzSzoxbk2cwMlOsUnmpxhtD6dzYpjNrwjNjGT
   fM6Gi3jbSH8wXt7ttJoKb6xw+li7QXYO4ANCMOTFO/CSEPZIAByup39Qd
   g==;
X-CSE-ConnectionGUID: VIE84xdbTtuV2kgN7DVpGg==
X-CSE-MsgGUID: Y71v8xZHQuGjb9C6K4PtTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="81486"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="81486"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 15:51:47 -0700
X-CSE-ConnectionGUID: tdDoSAArSY+VdrS8HD9rbw==
X-CSE-MsgGUID: vG7opMG/SZOf9aS19Cx6fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="276818402"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 06 Oct 2026 15:51:46 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEE0e-000000001zF-0KCS;
	Tue, 06 Oct 2026 22:51:44 +0000
Date: Wed, 07 Oct 2026 00:50:56 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [dhowells-fs:rxrpc-fixes 4/15] net/rxrpc/sendmsg.c:816:2-12:
 second lock on line 816
Message-ID: <202610070052.rAcnihPV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git rxrpc-fixes
head:   451b2bc96cf33e3f1ecb90e2d6a282c088421c67
commit: e9d7d8a7356af5d7fbdf71e98533e791cc796604 [4/15] rxrpc: Fix lack of short-send handling in rxrpc_kernel_send_data()
:::::: branch date: 9 hours ago
:::::: commit date: 13 hours ago
config: i386-randconfig-r2104-20261006 (https://download.01.org/0day-ci/archive/20261007/202610070052.rAcnihPV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610070052.rAcnihPV-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/rxrpc/sendmsg.c:816:2-12: second lock on line 816

vim +816 net/rxrpc/sendmsg.c

df423a4af125f5b David Howells 2016-09-02  790  
df423a4af125f5b David Howells 2016-09-02  791  /**
df423a4af125f5b David Howells 2016-09-02  792   * rxrpc_kernel_send_data - Allow a kernel service to send data on a call
df423a4af125f5b David Howells 2016-09-02  793   * @sock: The socket the call is on
df423a4af125f5b David Howells 2016-09-02  794   * @call: The call to send data through
df423a4af125f5b David Howells 2016-09-02  795   * @msg: The data to send
e833251ad813168 David Howells 2017-08-29  796   * @notify_end_tx: Notification that the last packet is queued.
df423a4af125f5b David Howells 2016-09-02  797   *
df423a4af125f5b David Howells 2016-09-02  798   * Allow a kernel service to send data on a call.  The call must be in an state
df423a4af125f5b David Howells 2016-09-02  799   * appropriate to sending data.  No control data should be supplied in @msg,
df423a4af125f5b David Howells 2016-09-02  800   * nor should an address be supplied.  MSG_MORE should be flagged if there's
df423a4af125f5b David Howells 2016-09-02  801   * more data to come, otherwise this data will end the transmission phase.
28a79fc9b03e4ed David Howells 2025-04-11  802   *
28a79fc9b03e4ed David Howells 2025-04-11  803   * Return: %0 if successful and a negative error code otherwise.
df423a4af125f5b David Howells 2016-09-02  804   */
df423a4af125f5b David Howells 2016-09-02  805  int rxrpc_kernel_send_data(struct socket *sock, struct rxrpc_call *call,
e9d7d8a7356af5d David Howells 2026-09-10  806  			   struct msghdr *msg, rxrpc_notify_end_tx_t notify_end_tx)
df423a4af125f5b David Howells 2016-09-02  807  {
df423a4af125f5b David Howells 2016-09-02  808  	int ret;
df423a4af125f5b David Howells 2016-09-02  809  
2d689424b618453 David Howells 2022-11-11  810  	_enter("{%d},", call->debug_id);
df423a4af125f5b David Howells 2016-09-02  811  
df423a4af125f5b David Howells 2016-09-02  812  	ASSERTCMP(msg->msg_name, ==, NULL);
df423a4af125f5b David Howells 2016-09-02  813  	ASSERTCMP(msg->msg_control, ==, NULL);
df423a4af125f5b David Howells 2016-09-02  814  
e9d7d8a7356af5d David Howells 2026-09-10  815  	for (;;) {
540b1c48c37ac0a David Howells 2017-02-27 @816  		mutex_lock(&call->user_mutex);
df423a4af125f5b David Howells 2016-09-02  817  
e9d7d8a7356af5d David Howells 2026-09-10  818  		ret = rxrpc_send_data(rxrpc_sk(sock->sk), call, msg,
e9d7d8a7356af5d David Howells 2026-09-10  819  				      msg_data_left(msg), notify_end_tx);
2d689424b618453 David Howells 2022-11-11  820  		if (ret == -ESHUTDOWN)
bd2db2d231b4a9d David Howells 2017-08-29  821  			ret = call->error;
e9d7d8a7356af5d David Howells 2026-09-10  822  		if (ret < 0)
e9d7d8a7356af5d David Howells 2026-09-10  823  			break;
e9d7d8a7356af5d David Howells 2026-09-10  824  		if (msg_data_left(msg) == 0) {
e9d7d8a7356af5d David Howells 2026-09-10  825  			ret = 0;
e9d7d8a7356af5d David Howells 2026-09-10  826  			break;
e9d7d8a7356af5d David Howells 2026-09-10  827  		}
e9d7d8a7356af5d David Howells 2026-09-10  828  		if (ret == 0) {
e9d7d8a7356af5d David Howells 2026-09-10  829  			ret = -EIO;
e9d7d8a7356af5d David Howells 2026-09-10  830  			break;
e9d7d8a7356af5d David Howells 2026-09-10  831  		}
e9d7d8a7356af5d David Howells 2026-09-10  832  	}
e9d7d8a7356af5d David Howells 2026-09-10  833  
df423a4af125f5b David Howells 2016-09-02  834  	_leave(" = %d", ret);
df423a4af125f5b David Howells 2016-09-02  835  	return ret;
df423a4af125f5b David Howells 2016-09-02  836  }
df423a4af125f5b David Howells 2016-09-02  837  EXPORT_SYMBOL(rxrpc_kernel_send_data);
df423a4af125f5b David Howells 2016-09-02  838  

:::::: The code at line 816 was first introduced by commit
:::::: 540b1c48c37ac0ad66212004db21e1ff7e2d78be rxrpc: Fix deadlock between call creation and sendmsg/recvmsg

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
