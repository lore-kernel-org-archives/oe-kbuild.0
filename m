Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23C12040A8
	for <oe-kbuild@lists.linux.dev>; Thu,  8 May 2025 21:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746739913; cv=none; b=iL/55AS8GvSEx/m3QlwNcRYZ5HH3RhIhhRtRU9z9iMYLBE2mku8I5QAo6/saUZK5i6icWukG2+I52jJcJ/e9oOCYEt7jxmwEDoFqc4Oe2fXGsSizdIBFktZ3Kfk/JyAjZ2kdul/z3rVh36tw2NAb1No/f3wAQZ05DO6gb3De/Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746739913; c=relaxed/simple;
	bh=G3U9+/IRNpF+TRXmySKG6w3cu8Pc6tFekPaPtn/IRV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kK/XhhMlBhyp2eYrHhQZmdwxqkx3M//Leuj2BUzvU1rBSBhleyX/HcxquZpimjdYXY+14rm0v/tMZl6DZa0ry+NU199pqRouURqV7aK+NdbK43cZ+eDj9K9sEuaySoHG6D+6nHDHVwR12CRAeEr1qJ/AAxtmRJCg4Cw566tUCBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jpI+759x; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jpI+759x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746739910; x=1778275910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G3U9+/IRNpF+TRXmySKG6w3cu8Pc6tFekPaPtn/IRV0=;
  b=jpI+759xnIlnM0Mgp2ufHYXFoaMf07hnLu4KOC4T7sBGUIQ/4V+u5hkB
   YvXIqTnSin1x1auPmYtE9MTHmhMHlIXUPjXnRtnKh3h0VcHfK2GJOquCb
   ZLTgloBA8x3+01cwSCl68xTWenMt8DVSskDGZ9ysnyriDB0TO5Pez5QXa
   qslpN1IML5meV0UmY3FEONi00ES2HpU81xb/a/K+dDbxjgkNe8QnxxyBb
   It9E/SI7c6xp1oHn45UEIXGJ0bAICAf93z2ELeSP9GViOEr1iggOzv+6E
   Yr2on5PG2ehuhnve6Raj6x44AdG4HYeNmxnGVSB1sbf3/rNkqFainfevr
   Q==;
X-CSE-ConnectionGUID: E8Ff6Jl4Skae/CD0Srw/UA==
X-CSE-MsgGUID: LOwDQLIsRVCqiqg92Tgshg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="47653556"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="47653556"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 14:31:50 -0700
X-CSE-ConnectionGUID: pfxBJ153RlSe3fsmRRNPAA==
X-CSE-MsgGUID: iV1XDu0bQHGHqCWheAgn/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="173595994"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 May 2025 14:31:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD8qI-000BOD-0d;
	Thu, 08 May 2025 21:31:46 +0000
Date: Fri, 9 May 2025 05:31:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 net-next 4/7] af_unix: Move SOCK_PASS{CRED,PIDFD,SEC}
 to sk->sk_flags.
Message-ID: <202505090514.x8fe0Qot-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250508013021.79654-5-kuniyu@amazon.com>
References: <20250508013021.79654-5-kuniyu@amazon.com>
TO: Kuniyuki Iwashima <kuniyu@amazon.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Willem de Bruijn <willemb@google.com>
CC: Simon Horman <horms@kernel.org>
CC: Christian Brauner <brauner@kernel.org>
CC: Kuniyuki Iwashima <kuniyu@amazon.com>

Hi Kuniyuki,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/af_unix-Factorise-test_bit-for-SOCK_PASSCRED-and-SOCK_PASSPIDFD/20250508-093531
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250508013021.79654-5-kuniyu%40amazon.com
patch subject: [PATCH v1 net-next 4/7] af_unix: Move SOCK_PASS{CRED,PIDFD,SEC} to sk->sk_flags.
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: riscv-randconfig-002-20250509 (https://download.01.org/0day-ci/archive/20250509/202505090514.x8fe0Qot-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090514.x8fe0Qot-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505090514.x8fe0Qot-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/socket.c:55:
   In file included from include/linux/bpf-cgroup.h:11:
>> include/net/sock.h:988:2: error: call to '__compiletime_assert_633' declared with 'error' attribute: BUILD_BUG_ON failed: BYTES_TO_BITS(sizeof(sk->sk_flags)) <= SOCK_FLAG_MAX
     988 |         BUILD_BUG_ON(BYTES_TO_BITS(sizeof(sk->sk_flags)) <= SOCK_FLAG_MAX);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:13:1: note: expanded from here
      13 | __compiletime_assert_633
         | ^
   1 error generated.
--
   In file included from net/core/sock.c:91:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:29:
   In file included from include/net/inet_sock.h:23:
>> include/net/sock.h:988:2: error: call to '__compiletime_assert_633' declared with 'error' attribute: BUILD_BUG_ON failed: BYTES_TO_BITS(sizeof(sk->sk_flags)) <= SOCK_FLAG_MAX
     988 |         BUILD_BUG_ON(BYTES_TO_BITS(sizeof(sk->sk_flags)) <= SOCK_FLAG_MAX);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:150:1: note: expanded from here
     150 | __compiletime_assert_633
         | ^
   In file included from net/core/sock.c:91:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:29:
   In file included from include/net/inet_sock.h:23:
>> include/net/sock.h:988:2: error: call to '__compiletime_assert_633' declared with 'error' attribute: BUILD_BUG_ON failed: BYTES_TO_BITS(sizeof(sk->sk_flags)) <= SOCK_FLAG_MAX
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:150:1: note: expanded from here
     150 | __compiletime_assert_633
         | ^
   In file included from net/core/sock.c:91:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:29:
   In file included from include/net/inet_sock.h:23:
>> include/net/sock.h:988:2: error: call to '__compiletime_assert_633' declared with 'error' attribute: BUILD_BUG_ON failed: BYTES_TO_BITS(sizeof(sk->sk_flags)) <= SOCK_FLAG_MAX
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:150:1: note: expanded from here
     150 | __compiletime_assert_633
         | ^
   In file included from net/core/sock.c:91:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:29:
   In file included from include/net/inet_sock.h:23:
>> include/net/sock.h:988:2: error: call to '__compiletime_assert_633' declared with 'error' attribute: BUILD_BUG_ON failed: BYTES_TO_BITS(sizeof(sk->sk_flags)) <= SOCK_FLAG_MAX
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:150:1: note: expanded from here
     150 | __compiletime_assert_633
         | ^
   In file included from net/core/sock.c:91:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:29:
   In file included from include/net/inet_sock.h:23:
>> include/net/sock.h:988:2: error: call to '__compiletime_assert_633' declared with 'error' attribute: BUILD_BUG_ON failed: BYTES_TO_BITS(sizeof(sk->sk_flags)) <= SOCK_FLAG_MAX
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:150:1: note: expanded from here
     150 | __compiletime_assert_633
         | ^
   In file included from net/core/sock.c:91:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:29:
   In file included from include/net/inet_sock.h:23:
>> include/net/sock.h:988:2: error: call to '__compiletime_assert_633' declared with 'error' attribute: BUILD_BUG_ON failed: BYTES_TO_BITS(sizeof(sk->sk_flags)) <= SOCK_FLAG_MAX
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:150:1: note: expanded from here
     150 | __compiletime_assert_633
         | ^
   In file included from net/core/sock.c:91:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:29:
   In file included from include/net/inet_sock.h:23:
>> include/net/sock.h:988:2: error: call to '__compiletime_assert_633' declared with 'error' attribute: BUILD_BUG_ON failed: BYTES_TO_BITS(sizeof(sk->sk_flags)) <= SOCK_FLAG_MAX
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:150:1: note: expanded from here
     150 | __compiletime_assert_633
         | ^
   In file included from net/core/sock.c:91:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:29:
   In file included from include/net/inet_sock.h:23:
>> include/net/sock.h:988:2: error: call to '__compiletime_assert_633' declared with 'error' attribute: BUILD_BUG_ON failed: BYTES_TO_BITS(sizeof(sk->sk_flags)) <= SOCK_FLAG_MAX
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:150:1: note: expanded from here
     150 | __compiletime_assert_633
         | ^
   In file included from net/core/sock.c:91:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:29:
   In file included from include/net/inet_sock.h:23:
>> include/net/sock.h:988:2: error: call to '__compiletime_assert_633' declared with 'error' attribute: BUILD_BUG_ON failed: BYTES_TO_BITS(sizeof(sk->sk_flags)) <= SOCK_FLAG_MAX
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:150:1: note: expanded from here
     150 | __compiletime_assert_633
         | ^
   In file included from net/core/sock.c:91:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:29:
   In file included from include/net/inet_sock.h:23:
>> include/net/sock.h:988:2: error: call to '__compiletime_assert_633' declared with 'error' attribute: BUILD_BUG_ON failed: BYTES_TO_BITS(sizeof(sk->sk_flags)) <= SOCK_FLAG_MAX
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:150:1: note: expanded from here
     150 | __compiletime_assert_633
         | ^
   In file included from net/core/sock.c:91:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:29:
   In file included from include/net/inet_sock.h:23:
>> include/net/sock.h:988:2: error: call to '__compiletime_assert_633' declared with 'error' attribute: BUILD_BUG_ON failed: BYTES_TO_BITS(sizeof(sk->sk_flags)) <= SOCK_FLAG_MAX
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:150:1: note: expanded from here
     150 | __compiletime_assert_633
         | ^
   In file included from net/core/sock.c:91:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:29:
   In file included from include/net/inet_sock.h:23:
>> include/net/sock.h:988:2: error: call to '__compiletime_assert_633' declared with 'error' attribute: BUILD_BUG_ON failed: BYTES_TO_BITS(sizeof(sk->sk_flags)) <= SOCK_FLAG_MAX
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:150:1: note: expanded from here
     150 | __compiletime_assert_633
         | ^
   In file included from net/core/sock.c:91:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:29:
   In file included from include/net/inet_sock.h:23:
>> include/net/sock.h:988:2: error: call to '__compiletime_assert_633' declared with 'error' attribute: BUILD_BUG_ON failed: BYTES_TO_BITS(sizeof(sk->sk_flags)) <= SOCK_FLAG_MAX
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:150:1: note: expanded from here
     150 | __compiletime_assert_633
         | ^
   In file included from net/core/sock.c:91:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:29:
   In file included from include/net/inet_sock.h:23:
>> include/net/sock.h:988:2: error: call to '__compiletime_assert_633' declared with 'error' attribute: BUILD_BUG_ON failed: BYTES_TO_BITS(sizeof(sk->sk_flags)) <= SOCK_FLAG_MAX
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:150:1: note: expanded from here
     150 | __compiletime_assert_633
         | ^
   In file included from net/core/sock.c:91:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:29:
   In file included from include/net/inet_sock.h:23:
>> include/net/sock.h:988:2: error: call to '__compiletime_assert_633' declared with 'error' attribute: BUILD_BUG_ON failed: BYTES_TO_BITS(sizeof(sk->sk_flags)) <= SOCK_FLAG_MAX
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:150:1: note: expanded from here
     150 | __compiletime_assert_633
         | ^
   In file included from net/core/sock.c:91:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:29:
   In file included from include/net/inet_sock.h:23:
>> include/net/sock.h:988:2: error: call to '__compiletime_assert_633' declared with 'error' attribute: BUILD_BUG_ON failed: BYTES_TO_BITS(sizeof(sk->sk_flags)) <= SOCK_FLAG_MAX
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:150:1: note: expanded from here
     150 | __compiletime_assert_633
         | ^
   In file included from net/core/sock.c:91:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:29:
   In file included from include/net/inet_sock.h:23:
>> include/net/sock.h:988:2: error: call to '__compiletime_assert_633' declared with 'error' attribute: BUILD_BUG_ON failed: BYTES_TO_BITS(sizeof(sk->sk_flags)) <= SOCK_FLAG_MAX
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:150:1: note: expanded from here
     150 | __compiletime_assert_633
         | ^
   In file included from net/core/sock.c:91:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:29:
   In file included from include/net/inet_sock.h:23:
>> include/net/sock.h:988:2: error: call to '__compiletime_assert_633' declared with 'error' attribute: BUILD_BUG_ON failed: BYTES_TO_BITS(sizeof(sk->sk_flags)) <= SOCK_FLAG_MAX
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:150:1: note: expanded from here
     150 | __compiletime_assert_633
         | ^
   In file included from net/core/sock.c:91:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:29:
   In file included from include/net/inet_sock.h:23:
>> include/net/sock.h:988:2: error: call to '__compiletime_assert_633' declared with 'error' attribute: BUILD_BUG_ON failed: BYTES_TO_BITS(sizeof(sk->sk_flags)) <= SOCK_FLAG_MAX
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:150:1: note: expanded from here
     150 | __compiletime_assert_633
         | ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
..


vim +988 include/net/sock.h

53b924b31fa53a Ralf Baechle      2005-08-23  985  
^1da177e4c3f41 Linus Torvalds    2005-04-16  986  static inline void sock_set_flag(struct sock *sk, enum sock_flags flag)
^1da177e4c3f41 Linus Torvalds    2005-04-16  987  {
47dce7fc345016 Kuniyuki Iwashima 2025-05-07 @988  	BUILD_BUG_ON(BYTES_TO_BITS(sizeof(sk->sk_flags)) <= SOCK_FLAG_MAX);
^1da177e4c3f41 Linus Torvalds    2005-04-16  989  	__set_bit(flag, &sk->sk_flags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  990  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  991  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
