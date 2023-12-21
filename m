Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEE3AD53
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Dec 2023 05:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eOeYiUIv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703136072; x=1734672072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3+sEUeg3kGtGVerZQI7pEr2J2OrW6mcUcSUmdQIeu18=;
  b=eOeYiUIvK45/c39JjQSt0LMV+dYeqKdwFqbwMLQ7R6bqamkWCP43RXVw
   Rlx8Rz1irdpZ3kjISuFUiBY167lLO35mzfMw68AsqXBN8rZwxRAW1oZPl
   w+5l1DHtAMW7C5hJJ4Aq/wq3dLip3uGCfbx8rsoOFKTrcRCLxP5O1Nnjj
   7A9W4KYg8/dGXbqwN5Cd+Dyx+m0jrnNqmNGMhIIPoOV6iSmcmNlV/ZKAk
   qRyatGg+vl0O5PreJ5s0vru3Cw+GZml0NS5ZHCHKc0y96re5qDeEvPJnB
   wPSJPJLt38BSXZhVIHCMgqMyGXVB2Orp2RY9YM+83NzJ1BuOjL0/JOUeH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="2772097"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="2772097"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 21:21:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="867197287"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="867197287"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Dec 2023 21:21:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGBS2-0007vd-0Q;
	Thu, 21 Dec 2023 05:19:35 +0000
Date: Thu, 21 Dec 2023 13:17:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:pending-fixes 115/268] net/core/stream.c:82:13-14:
 WARNING opportunity for min()
Message-ID: <202312211334.x6n43AiZ-lkp@intel.com>
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
TO: Shigeru Yoshida <syoshida@redhat.com>
CC: Kuniyuki Iwashima <kuniyu@amazon.com>
CC: Eric Dumazet <edumazet@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   c6eb02b33bd24f8f4a60947b539db4871ef914cd
commit: cac23b7d7627915d967ce25436d7aae26e88ed06 [115/268] net: Return error from sk_stream_wait_connect() if sk_wait_event() fails
:::::: branch date: 7 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-102-20231221 (https://download.01.org/0day-ci/archive/20231221/202312211334.x6n43AiZ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312211334.x6n43AiZ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/core/stream.c:82:13-14: WARNING opportunity for min()

vim +82 net/core/stream.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  48  
^1da177e4c3f41 Linus Torvalds   2005-04-16  49  /**
^1da177e4c3f41 Linus Torvalds   2005-04-16  50   * sk_stream_wait_connect - Wait for a socket to get into the connected state
4dc3b16ba18c0f Pavel Pisa       2005-05-01  51   * @sk: sock to wait on
4dc3b16ba18c0f Pavel Pisa       2005-05-01  52   * @timeo_p: for how long to wait
^1da177e4c3f41 Linus Torvalds   2005-04-16  53   *
^1da177e4c3f41 Linus Torvalds   2005-04-16  54   * Must be called with the socket locked.
^1da177e4c3f41 Linus Torvalds   2005-04-16  55   */
^1da177e4c3f41 Linus Torvalds   2005-04-16  56  int sk_stream_wait_connect(struct sock *sk, long *timeo_p)
^1da177e4c3f41 Linus Torvalds   2005-04-16  57  {
d9dc8b0f8b4ec8 WANG Cong        2016-11-11  58  	DEFINE_WAIT_FUNC(wait, woken_wake_function);
^1da177e4c3f41 Linus Torvalds   2005-04-16  59  	struct task_struct *tsk = current;
6151b31c9616d7 Herbert Xu       2005-11-04  60  	int done;
^1da177e4c3f41 Linus Torvalds   2005-04-16  61  
6151b31c9616d7 Herbert Xu       2005-11-04  62  	do {
c1cbe4b7ad0bc4 Benjamin LaHaise 2005-12-13  63  		int err = sock_error(sk);
c1cbe4b7ad0bc4 Benjamin LaHaise 2005-12-13  64  		if (err)
c1cbe4b7ad0bc4 Benjamin LaHaise 2005-12-13  65  			return err;
^1da177e4c3f41 Linus Torvalds   2005-04-16  66  		if ((1 << sk->sk_state) & ~(TCPF_SYN_SENT | TCPF_SYN_RECV))
^1da177e4c3f41 Linus Torvalds   2005-04-16  67  			return -EPIPE;
^1da177e4c3f41 Linus Torvalds   2005-04-16  68  		if (!*timeo_p)
^1da177e4c3f41 Linus Torvalds   2005-04-16  69  			return -EAGAIN;
^1da177e4c3f41 Linus Torvalds   2005-04-16  70  		if (signal_pending(tsk))
^1da177e4c3f41 Linus Torvalds   2005-04-16  71  			return sock_intr_errno(*timeo_p);
^1da177e4c3f41 Linus Torvalds   2005-04-16  72  
d9dc8b0f8b4ec8 WANG Cong        2016-11-11  73  		add_wait_queue(sk_sleep(sk), &wait);
^1da177e4c3f41 Linus Torvalds   2005-04-16  74  		sk->sk_write_pending++;
6151b31c9616d7 Herbert Xu       2005-11-04  75  		done = sk_wait_event(sk, timeo_p,
d0ac89f6f9879f Eric Dumazet     2023-05-09  76  				     !READ_ONCE(sk->sk_err) &&
d0ac89f6f9879f Eric Dumazet     2023-05-09  77  				     !((1 << READ_ONCE(sk->sk_state)) &
d9dc8b0f8b4ec8 WANG Cong        2016-11-11  78  				       ~(TCPF_ESTABLISHED | TCPF_CLOSE_WAIT)), &wait);
d9dc8b0f8b4ec8 WANG Cong        2016-11-11  79  		remove_wait_queue(sk_sleep(sk), &wait);
^1da177e4c3f41 Linus Torvalds   2005-04-16  80  		sk->sk_write_pending--;
6151b31c9616d7 Herbert Xu       2005-11-04  81  	} while (!done);
cac23b7d762791 Shigeru Yoshida  2023-12-14 @82  	return done < 0 ? done : 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  83  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  84  EXPORT_SYMBOL(sk_stream_wait_connect);
^1da177e4c3f41 Linus Torvalds   2005-04-16  85  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
