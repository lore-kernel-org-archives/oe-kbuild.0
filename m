Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC1A8F64
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Apr 2023 20:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680381041; x=1711917041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AEJivJM9qOp980fTUyyn8UHwIjQR/dDtcsdmVu9MqkM=;
  b=Z9rpFWEAa1JnQW22VbZCPhPVczWq/P5M5KNRiEEP2ULk9ww87V+JKBmg
   NWyj7OiMRcZQGNpTls1P7oIBDZy9vEmMk/5qRPCMImEYyDtyQzMOCJpPE
   C9xFAX++8kBoQDjdpEZO5o+8qYgH/zrS7QJOyzr/K/pGu2fXlaDsud4ki
   R7rDOZH6v3x3ByrJQWQiRLRXV5DDWCW3TUQnYOya2NME3jRHFY4YwsNSn
   e+GY47h34QgYho8a7DFefXCWNblDac6yEl1OR/jHva9DrgF4OctoJEfqb
   lRFwkeiMJJWJeqrBqcChnBPmAs8PckeUC8OUxNuUT6+KPv1IIjTmjZCMT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="321337506"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="321337506"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 13:30:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="718096759"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="718096759"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 01 Apr 2023 13:30:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pihrx-000N11-2w;
	Sat, 01 Apr 2023 20:30:37 +0000
Date: Sun, 2 Apr 2023 04:30:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net/unix/sysctl_net_unix.c:47:3: warning: Argument to kfree() is the
 address of the global variable 'unix_table', which is not memory allocated
 by malloc() [clang-analyzer-unix.Malloc]
Message-ID: <202304020409.gEAfDAd4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: net/unix/sysctl_net_unix.c:47:3: warning: Argument to kfree() is the address of the global variable 'unix_table', which is not memory allocated by malloc() [clang-analyzer-unix.Malloc]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kuniyuki Iwashima <kuniyu@amazon.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   93e2b01740863cf2f4a58887ac1384e6324b50a2
commit: 849d5aa3a1d833d0b3a18c2d5b816e23003cfe55 af_unix: Do not call kmemdup() for init_net's sysctl table.
date:   9 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-c007-20230327 (https://download.01.org/0day-ci/archive/20230402/202304020409.gEAfDAd4-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=849d5aa3a1d833d0b3a18c2d5b816e23003cfe55
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 849d5aa3a1d833d0b3a18c2d5b816e23003cfe55
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304020409.gEAfDAd4-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                            ^
   net/ipv4/tcp_output.c:3597:24: note: Passing null pointer value via 2nd parameter 'tp'
           tcp_options_write(th, NULL, &opts);
                                 ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   net/ipv4/tcp_output.c:3597:2: note: Calling 'tcp_options_write'
           tcp_options_write(th, NULL, &opts);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_output.c:616:6: note: Assuming the condition is true
           if (unlikely(OPTION_MD5 & options)) {
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   net/ipv4/tcp_output.c:616:2: note: Taking false branch
           if (unlikely(OPTION_MD5 & options)) {
           ^
   net/ipv4/tcp_output.c:624:6: note: Assuming field 'mss' is 0
           if (unlikely(opts->mss)) {
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   net/ipv4/tcp_output.c:624:2: note: Taking false branch
           if (unlikely(opts->mss)) {
           ^
   net/ipv4/tcp_output.c:630:6: note: Assuming the condition is true
           if (likely(OPTION_TS & options)) {
               ^
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^~~~
   net/ipv4/tcp_output.c:630:2: note: Taking false branch
           if (likely(OPTION_TS & options)) {
           ^
   net/ipv4/tcp_output.c:647:6: note: Assuming the condition is true
           if (unlikely(OPTION_SACK_ADVERTISE & options)) {
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   net/ipv4/tcp_output.c:647:2: note: Taking false branch
           if (unlikely(OPTION_SACK_ADVERTISE & options)) {
           ^
   net/ipv4/tcp_output.c:654:6: note: Assuming the condition is true
           if (unlikely(OPTION_WSCALE & options)) {
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   net/ipv4/tcp_output.c:654:2: note: Taking false branch
           if (unlikely(OPTION_WSCALE & options)) {
           ^
   net/ipv4/tcp_output.c:661:6: note: Assuming field 'num_sack_blocks' is not equal to 0
           if (unlikely(opts->num_sack_blocks)) {
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   net/ipv4/tcp_output.c:661:2: note: Taking true branch
           if (unlikely(opts->num_sack_blocks)) {
           ^
   net/ipv4/tcp_output.c:662:31: note: Dereference of null pointer
                   struct tcp_sack_block *sp = tp->rx_opt.dsack ?
                                               ^~~~~~~~~~~~~~~~
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   net/unix/af_unix.c:1098:2: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(addr->name->sun_path + 1, "%05x", ordernum);
           ^~~~~~~
   net/unix/af_unix.c:1098:2: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           sprintf(addr->name->sun_path + 1, "%05x", ordernum);
           ^~~~~~~
   net/unix/af_unix.c:1678:3: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err = 0;
                   ^     ~
   net/unix/af_unix.c:1678:3: note: Value stored to 'err' is never read
                   err = 0;
                   ^     ~
   net/unix/af_unix.c:2677:3: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err = -EOPNOTSUPP;
                   ^     ~~~~~~~~~~~
   net/unix/af_unix.c:2677:3: note: Value stored to 'err' is never read
                   err = -EOPNOTSUPP;
                   ^     ~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
>> net/unix/sysctl_net_unix.c:47:3: warning: Argument to kfree() is the address of the global variable 'unix_table', which is not memory allocated by malloc() [clang-analyzer-unix.Malloc]
                   kfree(table);
                   ^     ~~~~~
   net/unix/sysctl_net_unix.c:29:6: note: Assuming the condition is true
           if (net_eq(net, &init_net)) {
               ^~~~~~~~~~~~~~~~~~~~~~
   net/unix/sysctl_net_unix.c:29:2: note: Taking true branch
           if (net_eq(net, &init_net)) {
           ^
   net/unix/sysctl_net_unix.c:40:6: note: Assuming field 'ctl' is equal to NULL
           if (net->unx.ctl == NULL)
               ^~~~~~~~~~~~~~~~~~~~
   net/unix/sysctl_net_unix.c:40:2: note: Taking true branch
           if (net->unx.ctl == NULL)
           ^
   net/unix/sysctl_net_unix.c:41:3: note: Control jumps to line 46
                   goto err_reg;
                   ^
   net/unix/sysctl_net_unix.c:46:6: note: Assuming the condition is true
           if (net_eq(net, &init_net))
               ^~~~~~~~~~~~~~~~~~~~~~
   net/unix/sysctl_net_unix.c:46:2: note: Taking true branch
           if (net_eq(net, &init_net))
           ^
   net/unix/sysctl_net_unix.c:47:3: note: Argument to kfree() is the address of the global variable 'unix_table', which is not memory allocated by malloc()
                   kfree(table);
                   ^     ~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   net/ipv4/tcp_ipv4.c:2915:3: warning: 2nd function call argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   unlock_sock_fast(sk, slow);
                   ^                    ~~~~
   net/ipv4/tcp_ipv4.c:2883:2: note: 'slow' declared without an initial value
           bool slow;
           ^~~~~~~~~
   net/ipv4/tcp_ipv4.c:2887:6: note: Assuming 'v' is not equal to SEQ_START_TOKEN
           if (v == SEQ_START_TOKEN)
               ^~~~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_ipv4.c:2887:2: note: Taking false branch
           if (v == SEQ_START_TOKEN)
           ^
   net/ipv4/tcp_ipv4.c:2890:6: note: Assuming the condition is false
           if (sk_fullsock(sk))
               ^~~~~~~~~~~~~~~
   net/ipv4/tcp_ipv4.c:2890:2: note: Taking false branch
           if (sk_fullsock(sk))
           ^
   net/ipv4/tcp_ipv4.c:2893:2: note: Taking false branch
           if (unlikely(sk_unhashed(sk))) {
           ^
   net/ipv4/tcp_ipv4.c:2898:6: note: Assuming field 'skc_state' is equal to TCP_TIME_WAIT
           if (sk->sk_state == TCP_TIME_WAIT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_ipv4.c:2898:2: note: Taking true branch
           if (sk->sk_state == TCP_TIME_WAIT) {
           ^
   net/ipv4/tcp_ipv4.c:2914:6: note: Assuming the condition is true
           if (sk_fullsock(sk))
               ^~~~~~~~~~~~~~~
   net/ipv4/tcp_ipv4.c:2914:2: note: Taking true branch
           if (sk_fullsock(sk))
           ^
   net/ipv4/tcp_ipv4.c:2915:3: note: 2nd function call argument is an uninitialized value
                   unlock_sock_fast(sk, slow);
                   ^                    ~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   net/ipv4/tcp_cong.c:159:9: warning: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret = strncpy(buffer, ca->name,
                         ^~~~~~~
   net/ipv4/tcp_cong.c:159:9: note: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11
                   ret = strncpy(buffer, ca->name,
                         ^~~~~~~
   net/ipv4/tcp_cong.c:276:11: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   offs += snprintf(buf + offs, maxlen - offs,
                           ^~~~~~~~
   net/ipv4/tcp_cong.c:276:11: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   offs += snprintf(buf + offs, maxlen - offs,
                           ^~~~~~~~
   net/ipv4/tcp_cong.c:293:2: warning: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(name, ca->name, TCP_CA_NAME_MAX);
           ^~~~~~~
   net/ipv4/tcp_cong.c:293:2: note: Call to function 'strncpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(name, ca->name, TCP_CA_NAME_MAX);
           ^~~~~~~
   net/ipv4/tcp_cong.c:308:11: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   offs += snprintf(buf + offs, maxlen - offs,
                           ^~~~~~~~
   net/ipv4/tcp_cong.c:308:11: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   offs += snprintf(buf + offs, maxlen - offs,
                           ^~~~~~~~
   net/ipv4/tcp_cong.c:430:32: warning: Division by zero [clang-analyzer-core.DivideZero]
                   u32 delta = tp->snd_cwnd_cnt / w;

vim +/unix_table +47 net/unix/sysctl_net_unix.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  24  
2c8c1e7297e19b Alexey Dobriyan   2010-01-17  25  int __net_init unix_sysctl_register(struct net *net)
^1da177e4c3f41 Linus Torvalds    2005-04-16  26  {
1597fbc0faf88c Pavel Emelyanov   2007-12-01  27  	struct ctl_table *table;
1597fbc0faf88c Pavel Emelyanov   2007-12-01  28  
849d5aa3a1d833 Kuniyuki Iwashima 2022-06-27  29  	if (net_eq(net, &init_net)) {
849d5aa3a1d833 Kuniyuki Iwashima 2022-06-27  30  		table = unix_table;
849d5aa3a1d833 Kuniyuki Iwashima 2022-06-27  31  	} else {
1597fbc0faf88c Pavel Emelyanov   2007-12-01  32  		table = kmemdup(unix_table, sizeof(unix_table), GFP_KERNEL);
849d5aa3a1d833 Kuniyuki Iwashima 2022-06-27  33  		if (!table)
1597fbc0faf88c Pavel Emelyanov   2007-12-01  34  			goto err_alloc;
1597fbc0faf88c Pavel Emelyanov   2007-12-01  35  
a0a53c8ba95451 Denis V. Lunev    2007-12-11  36  		table[0].data = &net->unx.sysctl_max_dgram_qlen;
849d5aa3a1d833 Kuniyuki Iwashima 2022-06-27  37  	}
849d5aa3a1d833 Kuniyuki Iwashima 2022-06-27  38  
ec8f23ce0f4005 Eric W. Biederman 2012-04-19  39  	net->unx.ctl = register_net_sysctl(net, "net/unix", table);
a0a53c8ba95451 Denis V. Lunev    2007-12-11  40  	if (net->unx.ctl == NULL)
1597fbc0faf88c Pavel Emelyanov   2007-12-01  41  		goto err_reg;
1597fbc0faf88c Pavel Emelyanov   2007-12-01  42  
1597fbc0faf88c Pavel Emelyanov   2007-12-01  43  	return 0;
1597fbc0faf88c Pavel Emelyanov   2007-12-01  44  
1597fbc0faf88c Pavel Emelyanov   2007-12-01  45  err_reg:
849d5aa3a1d833 Kuniyuki Iwashima 2022-06-27  46  	if (net_eq(net, &init_net))
1597fbc0faf88c Pavel Emelyanov   2007-12-01 @47  		kfree(table);
1597fbc0faf88c Pavel Emelyanov   2007-12-01  48  err_alloc:
1597fbc0faf88c Pavel Emelyanov   2007-12-01  49  	return -ENOMEM;
^1da177e4c3f41 Linus Torvalds    2005-04-16  50  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  51  

:::::: The code at line 47 was first introduced by commit
:::::: 1597fbc0faf88c42edb3fe42e92e53b83c3f120e [UNIX]: Make the unix sysctl tables per-namespace

:::::: TO: Pavel Emelyanov <xemul@openvz.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
