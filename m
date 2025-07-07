Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3429194C96
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Jul 2025 21:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751923654; cv=none; b=jD8gH0G7AvucodXUVeJKaymLejbZTg4Bq8DfJcCXWma7SnsI0GYplCxCRV7p9/+wCIV2oi61u5FSVdAQGFKOam/te/Ouiw4S4weLnPZIIG46it2waer2zu8wzGsGjazVml64SoVU7/KnCVkfvMdyfs8CPuAZuuIF9K6wzoleoPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751923654; c=relaxed/simple;
	bh=bQW8o2NVYjRG5Hqp2YXb0C247XoxOf2SVCvfiMkcCcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ttf7qKrQYkUm9wERuexblN4E9JzC75/SPo3JolLILQMJWPi5xBjpbTnYu+mj4BsX2qcLvV9pb6JGOsUtsBDa6OTrqMoHhflBQENv0Lq5de190+xAywUPXlBZxWUNbMmevZ0m+9HI+2mvY/S++kgCXlMTl9hZ57q+FDR0YdomBis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hX3ymzUT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hX3ymzUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751923653; x=1783459653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bQW8o2NVYjRG5Hqp2YXb0C247XoxOf2SVCvfiMkcCcI=;
  b=hX3ymzUT7kJc1UlCXIcrHF1efgabhUb2/La+8E1RxRbOswtkSQbee2W3
   vc1od6+Dl+PNfCoHsK+kd9lHlj7rGT35C4a/tnw/TrFpKPiG6Aj/KssMM
   gp0xu8n0rWrZTePiiP5PfujeQGQf9PL7vOiT4gCa9sxn6yUwGZMXpPS9S
   iYfc2DwUzmyGoP7aSBjGsX/jqorugwIrAc65M9EIKy8MIrd9rq6zifSGD
   FKZdVN3GwuiA5Qo/4bpTZ3C3g/juniOCSOexqF3nd+/iPRHrG7roQjwaH
   enuF2fUyPORbakqCpq73ba2H9kZ9mbfRf8Jga5txw8nBk1oXj9neA/RP5
   g==;
X-CSE-ConnectionGUID: Cqu25fzJRYOvoO+K3lQ+tA==
X-CSE-MsgGUID: D5Z3mefzTLCE9cc/CIWTHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="57922565"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="57922565"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 14:27:33 -0700
X-CSE-ConnectionGUID: +WnYyGiiRjKkBPWa2jq6rQ==
X-CSE-MsgGUID: MCtPUegjTHW4f4wUrOntvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="186350256"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Jul 2025 14:27:31 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYtN2-0000l5-2L;
	Mon, 07 Jul 2025 21:27:28 +0000
Date: Tue, 8 Jul 2025 05:27:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 5/7] net: mctp: Allow limiting binds to a peer
 address
Message-ID: <202507080554.pDP37MtV-lkp@intel.com>
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
In-Reply-To: <20250703-mctp-bind-v1-5-bb7e97c24613@codeconstruct.com.au>
References: <20250703-mctp-bind-v1-5-bb7e97c24613@codeconstruct.com.au>
TO: Matt Johnston <matt@codeconstruct.com.au>
TO: Jeremy Kerr <jk@codeconstruct.com.au>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Simon Horman <horms@kernel.org>
CC: Matt Johnston <matt@codeconstruct.com.au>

Hi Matt,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8b98f34ce1d8c520403362cb785231f9898eb3ff]

url:    https://github.com/intel-lab-lkp/linux/commits/Matt-Johnston/net-mctp-Prevent-duplicate-binds/20250703-171427
base:   8b98f34ce1d8c520403362cb785231f9898eb3ff
patch link:    https://lore.kernel.org/r/20250703-mctp-bind-v1-5-bb7e97c24613%40codeconstruct.com.au
patch subject: [PATCH net-next 5/7] net: mctp: Allow limiting binds to a peer address
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-r072-20250708 (https://download.01.org/0day-ci/archive/20250708/202507080554.pDP37MtV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507080554.pDP37MtV-lkp@intel.com/

smatch warnings:
net/mctp/af_mctp.c:122 mctp_bind() warn: inconsistent returns 'sk'.

vim +/sk +122 net/mctp/af_mctp.c

e9ea574ec1c27e5 Eugene Syromiatnikov 2021-11-03   51  
8f601a1e4f8c84f Jeremy Kerr          2021-07-29   52  static int mctp_bind(struct socket *sock, struct sockaddr *addr, int addrlen)
8f601a1e4f8c84f Jeremy Kerr          2021-07-29   53  {
833ef3b91de692e Jeremy Kerr          2021-07-29   54  	struct sock *sk = sock->sk;
833ef3b91de692e Jeremy Kerr          2021-07-29   55  	struct mctp_sock *msk = container_of(sk, struct mctp_sock, sk);
848674f9a3c762e Matt Johnston        2025-07-03   56  	struct net *net = sock_net(&msk->sk);
833ef3b91de692e Jeremy Kerr          2021-07-29   57  	struct sockaddr_mctp *smctp;
833ef3b91de692e Jeremy Kerr          2021-07-29   58  	int rc;
833ef3b91de692e Jeremy Kerr          2021-07-29   59  
833ef3b91de692e Jeremy Kerr          2021-07-29   60  	if (addrlen < sizeof(*smctp))
833ef3b91de692e Jeremy Kerr          2021-07-29   61  		return -EINVAL;
833ef3b91de692e Jeremy Kerr          2021-07-29   62  
833ef3b91de692e Jeremy Kerr          2021-07-29   63  	if (addr->sa_family != AF_MCTP)
833ef3b91de692e Jeremy Kerr          2021-07-29   64  		return -EAFNOSUPPORT;
833ef3b91de692e Jeremy Kerr          2021-07-29   65  
833ef3b91de692e Jeremy Kerr          2021-07-29   66  	if (!capable(CAP_NET_BIND_SERVICE))
833ef3b91de692e Jeremy Kerr          2021-07-29   67  		return -EACCES;
833ef3b91de692e Jeremy Kerr          2021-07-29   68  
833ef3b91de692e Jeremy Kerr          2021-07-29   69  	/* it's a valid sockaddr for MCTP, cast and do protocol checks */
833ef3b91de692e Jeremy Kerr          2021-07-29   70  	smctp = (struct sockaddr_mctp *)addr;
833ef3b91de692e Jeremy Kerr          2021-07-29   71  
1e4b50f06d970d8 Eugene Syromiatnikov 2021-11-03   72  	if (!mctp_sockaddr_is_ok(smctp))
1e4b50f06d970d8 Eugene Syromiatnikov 2021-11-03   73  		return -EINVAL;
1e4b50f06d970d8 Eugene Syromiatnikov 2021-11-03   74  
833ef3b91de692e Jeremy Kerr          2021-07-29   75  	lock_sock(sk);
833ef3b91de692e Jeremy Kerr          2021-07-29   76  
833ef3b91de692e Jeremy Kerr          2021-07-29   77  	if (sk_hashed(sk)) {
833ef3b91de692e Jeremy Kerr          2021-07-29   78  		rc = -EADDRINUSE;
833ef3b91de692e Jeremy Kerr          2021-07-29   79  		goto out_release;
833ef3b91de692e Jeremy Kerr          2021-07-29   80  	}
848674f9a3c762e Matt Johnston        2025-07-03   81  
d58bad174be0c4b Matt Johnston        2025-07-03   82  	msk->bind_local_addr = smctp->smctp_addr.s_addr;
848674f9a3c762e Matt Johnston        2025-07-03   83  
848674f9a3c762e Matt Johnston        2025-07-03   84  	/* MCTP_NET_ANY with a specific EID is resolved to the default net
848674f9a3c762e Matt Johnston        2025-07-03   85  	 * at bind() time.
848674f9a3c762e Matt Johnston        2025-07-03   86  	 * For bind_addr=MCTP_ADDR_ANY it is handled specially at route lookup time.
848674f9a3c762e Matt Johnston        2025-07-03   87  	 */
848674f9a3c762e Matt Johnston        2025-07-03   88  	if (smctp->smctp_network == MCTP_NET_ANY &&
d58bad174be0c4b Matt Johnston        2025-07-03   89  	    msk->bind_local_addr != MCTP_ADDR_ANY) {
848674f9a3c762e Matt Johnston        2025-07-03   90  		msk->bind_net = mctp_default_net(net);
848674f9a3c762e Matt Johnston        2025-07-03   91  	} else {
848674f9a3c762e Matt Johnston        2025-07-03   92  		msk->bind_net = smctp->smctp_network;
848674f9a3c762e Matt Johnston        2025-07-03   93  	}
848674f9a3c762e Matt Johnston        2025-07-03   94  
d58bad174be0c4b Matt Johnston        2025-07-03   95  	/* ignore the IC bit */
d58bad174be0c4b Matt Johnston        2025-07-03   96  	smctp->smctp_type &= 0x7f;
d58bad174be0c4b Matt Johnston        2025-07-03   97  
d58bad174be0c4b Matt Johnston        2025-07-03   98  	if (msk->bind_peer_set) {
d58bad174be0c4b Matt Johnston        2025-07-03   99  		if (msk->bind_type != smctp->smctp_type) {
d58bad174be0c4b Matt Johnston        2025-07-03  100  			/* Prior connect() had a different type */
d58bad174be0c4b Matt Johnston        2025-07-03  101  			return -EINVAL;
d58bad174be0c4b Matt Johnston        2025-07-03  102  		}
d58bad174be0c4b Matt Johnston        2025-07-03  103  
d58bad174be0c4b Matt Johnston        2025-07-03  104  		if (msk->bind_net == MCTP_NET_ANY) {
d58bad174be0c4b Matt Johnston        2025-07-03  105  			/* Restrict to the network passed to connect() */
d58bad174be0c4b Matt Johnston        2025-07-03  106  			msk->bind_net = msk->bind_peer_net;
d58bad174be0c4b Matt Johnston        2025-07-03  107  		}
d58bad174be0c4b Matt Johnston        2025-07-03  108  
d58bad174be0c4b Matt Johnston        2025-07-03  109  		if (msk->bind_net != msk->bind_peer_net) {
d58bad174be0c4b Matt Johnston        2025-07-03  110  			/* connect() had a different net to bind() */
d58bad174be0c4b Matt Johnston        2025-07-03  111  			return -EINVAL;
d58bad174be0c4b Matt Johnston        2025-07-03  112  		}
d58bad174be0c4b Matt Johnston        2025-07-03  113  	} else {
d58bad174be0c4b Matt Johnston        2025-07-03  114  		msk->bind_type = smctp->smctp_type;
d58bad174be0c4b Matt Johnston        2025-07-03  115  	}
833ef3b91de692e Jeremy Kerr          2021-07-29  116  
833ef3b91de692e Jeremy Kerr          2021-07-29  117  	rc = sk->sk_prot->hash(sk);
833ef3b91de692e Jeremy Kerr          2021-07-29  118  
833ef3b91de692e Jeremy Kerr          2021-07-29  119  out_release:
833ef3b91de692e Jeremy Kerr          2021-07-29  120  	release_sock(sk);
833ef3b91de692e Jeremy Kerr          2021-07-29  121  
833ef3b91de692e Jeremy Kerr          2021-07-29 @122  	return rc;
8f601a1e4f8c84f Jeremy Kerr          2021-07-29  123  }
8f601a1e4f8c84f Jeremy Kerr          2021-07-29  124  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
