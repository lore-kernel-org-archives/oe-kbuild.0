Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35815A41
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Sep 2023 03:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694575879; x=1726111879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3qQyJurh1qpwze1ghPy0YpvH6YWrTk1skwjohXe0Rmc=;
  b=HIKZPxoxgjGHEtRLpYlKNUjMUG5MR10rPiYEYCrtzfapv8oyTfoTNFJq
   6sH6H2tcggFCohhjA0m4+pch/uZYU/jGG6ZTTuIEP6o1O5/IQTNWs2Z3t
   u2dHDLYycyHkKVXX9UwJnbAqsOZUQKbm8IqyaJezFmJwEbY9MM6fab/qH
   FvoS9Oz7EdrJvN2blysfrmj08mxJK2ke795IP/YuYwYV9w6rAfOkXMJcq
   oMqy7s8yMaD1Ie6bFqNGDSqv9jXEVUvX4mR0O0ecNTKR0Ek99XeHO7oVt
   borXYCYQxyojChknACodJUFFmN4y/cEK0HgVpXr0inx2weFBF4XJi3+mz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="444993377"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="444993377"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 20:31:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="1074790687"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="1074790687"
Received: from lkp-server02.sh.intel.com (HELO e6439d5ea182) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 12 Sep 2023 20:31:04 -0700
Received: from kbuild by e6439d5ea182 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgGag-00001n-2z;
	Wed, 13 Sep 2023 03:30:58 +0000
Date: Wed, 13 Sep 2023 11:30:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net] net: prevent address overwrite in connect() and
 sendmsg()
Message-ID: <202309131155.MonA0VTS-lkp@intel.com>
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
In-Reply-To: <20230912013332.2048422-1-jrife@google.com>
References: <20230912013332.2048422-1-jrife@google.com>
TO: Jordan Rife <jrife@google.com>
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: netdev@vger.kernel.org
CC: dborkman@kernel.org
CC: Jordan Rife <jrife@google.com>

Hi Jordan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jordan-Rife/net-prevent-address-overwrite-in-connect-and-sendmsg/20230912-093550
base:   net/main
patch link:    https://lore.kernel.org/r/20230912013332.2048422-1-jrife%40google.com
patch subject: [PATCH net] net: prevent address overwrite in connect() and sendmsg()
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: x86_64-randconfig-161-20230912 (https://download.01.org/0day-ci/archive/20230913/202309131155.MonA0VTS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230913/202309131155.MonA0VTS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309131155.MonA0VTS-lkp@intel.com/

smatch warnings:
net/ipv4/af_inet.c:584 inet_dgram_connect() warn: variable dereferenced before check 'uaddr' (see line 580)

vim +/uaddr +584 net/ipv4/af_inet.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  565  
^1da177e4c3f41 Linus Torvalds    2005-04-16  566  int inet_dgram_connect(struct socket *sock, struct sockaddr *uaddr,
^1da177e4c3f41 Linus Torvalds    2005-04-16  567  		       int addr_len, int flags)
^1da177e4c3f41 Linus Torvalds    2005-04-16  568  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  569  	struct sock *sk = sock->sk;
364f997b5cfe1d Kuniyuki Iwashima 2022-10-06  570  	const struct proto *prot;
6113a07e1ad512 Jordan Rife       2023-09-11  571  	struct sockaddr_storage addr;
d74bad4e74ee37 Andrey Ignatov    2018-03-30  572  	int err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  573  
6503d96168f891 Changli Gao       2010-03-31  574  	if (addr_len < sizeof(uaddr->sa_family))
6503d96168f891 Changli Gao       2010-03-31  575  		return -EINVAL;
364f997b5cfe1d Kuniyuki Iwashima 2022-10-06  576  
364f997b5cfe1d Kuniyuki Iwashima 2022-10-06  577  	/* IPV6_ADDRFORM can change sk->sk_prot under us. */
364f997b5cfe1d Kuniyuki Iwashima 2022-10-06  578  	prot = READ_ONCE(sk->sk_prot);
364f997b5cfe1d Kuniyuki Iwashima 2022-10-06  579  
^1da177e4c3f41 Linus Torvalds    2005-04-16 @580  	if (uaddr->sa_family == AF_UNSPEC)
364f997b5cfe1d Kuniyuki Iwashima 2022-10-06  581  		return prot->disconnect(sk, flags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  582  
d74bad4e74ee37 Andrey Ignatov    2018-03-30  583  	if (BPF_CGROUP_PRE_CONNECT_ENABLED(sk)) {
6113a07e1ad512 Jordan Rife       2023-09-11 @584  		if (uaddr && addr_len <= sizeof(addr)) {
6113a07e1ad512 Jordan Rife       2023-09-11  585  			/* pre_connect can rewrite uaddr, so make a copy to
6113a07e1ad512 Jordan Rife       2023-09-11  586  			 * insulate the caller.
6113a07e1ad512 Jordan Rife       2023-09-11  587  			 */
6113a07e1ad512 Jordan Rife       2023-09-11  588  			memcpy(&addr, uaddr, addr_len);
6113a07e1ad512 Jordan Rife       2023-09-11  589  			uaddr = (struct sockaddr *)&addr;
6113a07e1ad512 Jordan Rife       2023-09-11  590  		}
6113a07e1ad512 Jordan Rife       2023-09-11  591  
364f997b5cfe1d Kuniyuki Iwashima 2022-10-06  592  		err = prot->pre_connect(sk, uaddr, addr_len);
d74bad4e74ee37 Andrey Ignatov    2018-03-30  593  		if (err)
d74bad4e74ee37 Andrey Ignatov    2018-03-30  594  			return err;
d74bad4e74ee37 Andrey Ignatov    2018-03-30  595  	}
d74bad4e74ee37 Andrey Ignatov    2018-03-30  596  
dcd01eeac14486 Eric Dumazet      2021-06-09  597  	if (data_race(!inet_sk(sk)->inet_num) && inet_autobind(sk))
^1da177e4c3f41 Linus Torvalds    2005-04-16  598  		return -EAGAIN;
364f997b5cfe1d Kuniyuki Iwashima 2022-10-06  599  	return prot->connect(sk, uaddr, addr_len);
^1da177e4c3f41 Linus Torvalds    2005-04-16  600  }
3d1427f8700273 Eric Dumazet      2009-08-28  601  EXPORT_SYMBOL(inet_dgram_connect);
^1da177e4c3f41 Linus Torvalds    2005-04-16  602  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
