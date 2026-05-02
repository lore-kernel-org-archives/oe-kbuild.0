Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF253263C8F
	for <oe-kbuild@lists.linux.dev>; Sat,  2 May 2026 22:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777759784; cv=none; b=b51i+L3j2305mLkc7ounGPgHbsUSR+IYSeOQRVhqr5V7w/B9/q7Ly5QkJTw4xg0W8T8/ZtQ3FQNFend3L24czbB8jBYfJuYDBfKGVHVgDfMfgpkkjDDf2DAjXCiXJV/pOHLEk7Kge7do7h2ig95OGI9wCCroXoN4L1mVm6tWnv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777759784; c=relaxed/simple;
	bh=PmeA7ct5I0+/8r/kkzjo0dMVZK1vadliS7te8bVxo5M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K4eeO91SScAl6cNLSvPHNCrEJJbon5cOtwFxI0Sg9znGrOYOJjC29S2y75R3cs/NGEl1gY8Cvs0JVNb+SjVd8DtxNoEFN3JQpRkgb2p+ODSMjg+uiWPEzs1sL3yWktl2ozSeY2M4L/jhoV69WbbtHadD+v3GdNDWo7PW2zADVFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NFIz5b5P; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NFIz5b5P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777759783; x=1809295783;
  h=date:from:to:cc:subject:message-id;
  bh=PmeA7ct5I0+/8r/kkzjo0dMVZK1vadliS7te8bVxo5M=;
  b=NFIz5b5P3RFm5NNWXGjC9YBc19miOUOzj9rFDaSW0u6nVtLmvYRbosCx
   iawn/mKEYJm/DUZZV8IpR0lCv9R/5eQ4tMR1IwCheHIeK4yPMsenuQnZe
   qqX9OmpApHnVtzYQtH2KvlM8i8T1xSwm6K6zEadWWCdH18Yqtd8JDE/Lg
   enNTBuJaA7T3muyQKuNIC5TXVFCYTb5AMPm3jnYzISr7zt1juTXdJu13B
   ll2/qZxytsRJJAwIjSjqUDWRTkOZAhimf0dHDGtFR5IxtU+FaPOPCdJ2t
   uItC8hPE+hu65JbbTQ9VKn7zIB+OV3LNV9OfO9f0ezDn2XSvTz2F4Hlcu
   w==;
X-CSE-ConnectionGUID: yQaBEf55Q2mjfrmrz2q6Zg==
X-CSE-MsgGUID: OJfeFCg+T1WT9Rdc6tYTrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="78540711"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="78540711"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 15:09:42 -0700
X-CSE-ConnectionGUID: jYQjPO49TTiUp7wOzPTEKA==
X-CSE-MsgGUID: BrB+px5GSiKdRUppawMqRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="239487724"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 May 2026 15:09:40 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJIWn-000000001qV-3x6t;
	Sat, 02 May 2026 22:09:37 +0000
Date: Sun, 03 May 2026 06:09:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/sctp/socket.c:7036 sctp_getsockopt_peer_auth_chunks()
 warn: potential user controlled sizeof overflow '8 + num_chunks' '8 +
 0-65531,4294967292-u32max'
Message-ID: <202605030630.YdjlL4Z2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Michael Bommarito <michael.bommarito@gmail.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f1a5e78a55ebf2b05777fd5eb738038ddae609d6
commit: 0cf004ffb61cd32d140531c3a84afe975f9fc7ea sctp: fix OOB write to userspace in sctp_getsockopt_peer_auth_chunks
date:   2 weeks ago
:::::: branch date: 22 hours ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-r071-20260502 (https://download.01.org/0day-ci/archive/20260503/202605030630.YdjlL4Z2-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0cf004ffb61c ("sctp: fix OOB write to userspace in sctp_getsockopt_peer_auth_chunks")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605030630.YdjlL4Z2-lkp@intel.com/

New smatch warnings:
net/sctp/socket.c:7036 sctp_getsockopt_peer_auth_chunks() warn: potential user controlled sizeof overflow '8 + num_chunks' '8 + 0-65531,4294967292-u32max'

Old smatch warnings:
net/sctp/socket.c:7042 sctp_getsockopt_peer_auth_chunks() warn: potential user controlled sizeof overflow '8 + num_chunks' '8 + 0-65531,4294967292-u32max'
net/sctp/socket.c:7086 sctp_getsockopt_local_auth_chunks() warn: potential user controlled sizeof overflow '8 + num_chunks' '8 + 0-65531,4294967292-u32max'
net/sctp/socket.c:7092 sctp_getsockopt_local_auth_chunks() warn: potential user controlled sizeof overflow '8 + num_chunks' '8 + 0-65531,4294967292-u32max'
net/sctp/socket.c:7492 sctp_getsockopt_pr_assocstatus() warn: potential spectre issue 'asoc->abandoned_unsent' [r]
net/sctp/socket.c:7494 sctp_getsockopt_pr_assocstatus() warn: potential spectre issue 'asoc->abandoned_sent' [r]
net/sctp/socket.c:7561 sctp_getsockopt_pr_streamstatus() warn: potential spectre issue 'streamoute->abandoned_unsent' [r]
net/sctp/socket.c:7563 sctp_getsockopt_pr_streamstatus() warn: potential spectre issue 'streamoute->abandoned_sent' [r]
net/sctp/socket.c:9018 sctp_wait_for_packet() warn: missing error code 'error'

vim +7036 net/sctp/socket.c

65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7005  
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7006  static int sctp_getsockopt_peer_auth_chunks(struct sock *sk, int len,
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7007  				    char __user *optval, int __user *optlen)
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7008  {
411223c01a5116 Al Viro                 2007-10-14  7009  	struct sctp_authchunks __user *p = (void __user *)optval;
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7010  	struct sctp_authchunks val;
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7011  	struct sctp_association *asoc;
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7012  	struct sctp_chunks_param *ch;
5e739d1752aca4 Vlad Yasevich           2008-08-21  7013  	u32    num_chunks = 0;
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7014  	char __user *to;
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7015  
5e739d1752aca4 Vlad Yasevich           2008-08-21  7016  	if (len < sizeof(struct sctp_authchunks))
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7017  		return -EINVAL;
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7018  
c76f97c99ae6d2 Marcelo Ricardo Leitner 2018-01-08  7019  	if (copy_from_user(&val, optval, sizeof(val)))
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7020  		return -EFAULT;
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7021  
411223c01a5116 Al Viro                 2007-10-14  7022  	to = p->gauth_chunks;
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7023  	asoc = sctp_id2assoc(sk, val.gauth_assoc_id);
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7024  	if (!asoc)
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7025  		return -EINVAL;
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7026  
219f9ea4d3b797 Xin Long                2019-08-19  7027  	if (!asoc->peer.auth_capable)
219f9ea4d3b797 Xin Long                2019-08-19  7028  		return -EACCES;
219f9ea4d3b797 Xin Long                2019-08-19  7029  
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7030  	ch = asoc->peer.peer_chunks;
5e739d1752aca4 Vlad Yasevich           2008-08-21  7031  	if (!ch)
5e739d1752aca4 Vlad Yasevich           2008-08-21  7032  		goto num;
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7033  
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7034  	/* See if the user provided enough room for all the data */
3c918704921412 Xin Long                2017-06-30  7035  	num_chunks = ntohs(ch->param_hdr.length) - sizeof(struct sctp_paramhdr);
0cf004ffb61cd3 Michael Bommarito       2026-04-15 @7036  	if (len < sizeof(struct sctp_authchunks) + num_chunks)
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7037  		return -EINVAL;
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7038  
5e739d1752aca4 Vlad Yasevich           2008-08-21  7039  	if (copy_to_user(to, ch->chunks, num_chunks))
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7040  		return -EFAULT;
5e739d1752aca4 Vlad Yasevich           2008-08-21  7041  num:
5e739d1752aca4 Vlad Yasevich           2008-08-21  7042  	len = sizeof(struct sctp_authchunks) + num_chunks;
8d72651d86e9c7 wangweidong             2013-12-23  7043  	if (put_user(len, optlen))
8d72651d86e9c7 wangweidong             2013-12-23  7044  		return -EFAULT;
7e8616d8e7731b Vlad Yasevich           2008-02-27  7045  	if (put_user(num_chunks, &p->gauth_number_of_chunks))
7e8616d8e7731b Vlad Yasevich           2008-02-27  7046  		return -EFAULT;
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7047  	return 0;
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7048  }
65b07e5d0d09c7 Vlad Yasevich           2007-09-16  7049  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
