Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35A636E498
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Aug 2026 18:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786644530; cv=none; b=O6bbty3UUqrfoasHfFnVPdHYsB4A4bur834RNqs/w3FPxGuIVutw0frlLN/f3FSFw45oGAMC0qMOxSTuBFgXf+bKda+rxt831QfO/5Dai8j6S1JjQ20wyF/DhfDNzs0eHLHZMn/Uqdc+hRy2eybgUAj1QqH6zQsuoo1LT+WKv2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786644530; c=relaxed/simple;
	bh=mH2EZH3JDBCddJ+V0G9rtSFzeHbH9TurM0o4fuZjUmM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cpOg+3D5tLYybIlbkOc0vplsr+mD+aZlqrNWAlu7A251yS3HlBsUUgrlgyuGQXXu9KHhCm6duRlbpAimsiaKPKZJv5cfR5HjvLqno/MQXNEpYtvMEHlPdPzGf64oTJmPRhbMVyxtvB3tDHuhcC64Z/ObBswGU8RX8dIm8RKuh7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RWu4xFyc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RWu4xFyc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786644527; x=1818180527;
  h=date:from:to:cc:subject:message-id;
  bh=mH2EZH3JDBCddJ+V0G9rtSFzeHbH9TurM0o4fuZjUmM=;
  b=RWu4xFycBzLINGLLwcfRb1dt3XVSWmaOuWAjB9FZyIozlOquTkip2RrU
   awOZO9/rqnsSUJcN+fqOfPW7biBsCM1CyI1fxXWlH2d1ZtmPVBvgGOFs1
   vfGnnsYAvIbsFA1XxEiX0Rh6u61gKo2HbdrgxHHwynSUyJ7HdRcqhir4K
   mJAdcJ1+MF4ZT6A+jr2K4584aWc/t5RIlhhKMUlvn3qa9QMaKEZpUJqCt
   8UH8vK8aDSip0V0oLL+pnE4+P+u0SKk3Zp72pfY85wkwxxIzV6T6dgKsU
   5xttCVtIqP1+ym3483ED/pKkDdgJSKULftRwtb9P43IhFxt1fVP8xijQ7
   Q==;
X-CSE-ConnectionGUID: SaAbJJCrQ1agxVDjhc8cJA==
X-CSE-MsgGUID: oCLSWpwaQ/CphUFIPR6BsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87087468"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="87087468"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 11:08:46 -0700
X-CSE-ConnectionGUID: R1EnoG5LShWq8I4YpuVh0Q==
X-CSE-MsgGUID: Zc6CeXXgS4azeqhDTUhe8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="302257081"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Aug 2026 11:08:45 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuZr9-00000000W8M-0rwg;
	Thu, 13 Aug 2026 18:08:43 +0000
Date: Fri, 14 Aug 2026 02:08:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/sctp/socket.c:7036 sctp_getsockopt_peer_auth_chunks()
 warn: potential user controlled sizeof overflow '8 + num_chunks' '8 +
 0-65531,4294967292-u32max'
Message-ID: <202608140244.f2Omwf4y-lkp@intel.com>
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
head:   3d6d817622b0a9721e3cc404df3469171582be13
commit: 0cf004ffb61cd32d140531c3a84afe975f9fc7ea sctp: fix OOB write to userspace in sctp_getsockopt_peer_auth_chunks
date:   4 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 4 months ago
config: m68k-randconfig-r071-20260813 (https://download.01.org/0day-ci/archive/20260814/202608140244.f2Omwf4y-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0cf004ffb61c ("sctp: fix OOB write to userspace in sctp_getsockopt_peer_auth_chunks")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608140244.f2Omwf4y-lkp@intel.com/

New smatch warnings:
net/sctp/socket.c:7036 sctp_getsockopt_peer_auth_chunks() warn: potential user controlled sizeof overflow '8 + num_chunks' '8 + 0-65531,4294967292-u32max'

Old smatch warnings:
net/sctp/socket.c:7042 sctp_getsockopt_peer_auth_chunks() warn: potential user controlled sizeof overflow '8 + num_chunks' '8 + 0-65531,4294967292-u32max'
net/sctp/socket.c:7086 sctp_getsockopt_local_auth_chunks() warn: potential user controlled sizeof overflow '8 + num_chunks' '8 + 0-65531,4294967292-u32max'
net/sctp/socket.c:7092 sctp_getsockopt_local_auth_chunks() warn: potential user controlled sizeof overflow '8 + num_chunks' '8 + 0-65531,4294967292-u32max'
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
