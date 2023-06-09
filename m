Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DEF408C9
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Jun 2023 20:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686343247; x=1717879247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VoLuUExh+CwpuyaLbX+BuFuYn9Gko55/bo9v4sVX6BE=;
  b=Lud2G422QEcmYU3v+/dES+UFo54cTPiCPllqzqoHOHVtEUGXnQRHF8hw
   OVSSl7PX5A+13hU2MvZW78Bhs9AxhG5NhYfogxlz54HyZ523woxkErEyM
   EfZqifDPPPon1ypOx/m6XJjcrIK/kfpP9Dd+QSFDikhjQyi8jN7P29CPo
   AsVLBSlse59GaREcX7CElvCvV18B1tqg8d9T6mdwND/caAEfyNYyoS53K
   60/JQMxrtqehW5W13IvjOziX1oqf21TnfKAfxSyafypu7oylbzjB3HdMA
   cIXRoYeq2+coEOUUsBldqE0zo4Ec0nAm0hIlarRT7WfEZ2GNp28Au1ZrS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="356577399"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="356577399"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 13:40:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="780438484"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="780438484"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Jun 2023 13:40:45 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7iua-0009No-2o;
	Fri, 09 Jun 2023 20:40:44 +0000
Date: Sat, 10 Jun 2023 04:39:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [chrome-os:chromeos-5.10 38/43] include/trace/events/cros_net.h:87
 trace_raw_output_cros_inet_sendmsg_exit() error: format specifier '%z-'
 invalid
Message-ID: <202306100445.Su6p2kzR-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   858795dfe8f2279e3095555cf8c435b720c001b8
commit: 30d36a555edcb0b9cb2ac4f86e3557591d2feebe [38/43] CHROMIUM: add cros_net tp for inet send,rcv,accept
:::::: branch date: 9 hours ago
:::::: commit date: 17 hours ago
config: x86_64-randconfig-m001-20230608 (https://download.01.org/0day-ci/archive/20230610/202306100445.Su6p2kzR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306100445.Su6p2kzR-lkp@intel.com/

smatch warnings:
include/trace/events/cros_net.h:87 trace_raw_output_cros_inet_sendmsg_exit() error: format specifier '%z-' invalid
include/trace/events/cros_net.h:160 trace_raw_output_cros_inet_sendpage_exit() error: format specifier '%z
include/trace/events/cros_net.h:196 trace_raw_output_cros_inet_recvmsg_exit() error: format specifier '%z-' invalid

vim +87 include/trace/events/cros_net.h

30d36a555edcb0 Jason Ling 2023-06-02   85  
30d36a555edcb0 Jason Ling 2023-06-02   86  
30d36a555edcb0 Jason Ling 2023-06-02  @87  TRACE_EVENT_CONDITION(cros_inet_sendmsg_exit,
30d36a555edcb0 Jason Ling 2023-06-02   88  	/* The tracepoint signature matches the signature of inet_sendmsg with
30d36a555edcb0 Jason Ling 2023-06-02   89  	 * addition of the return value. This is done to match the expected
30d36a555edcb0 Jason Ling 2023-06-02   90  	 * signature of an fexit bpf program.
30d36a555edcb0 Jason Ling 2023-06-02   91  	 * This is done so that a BPF application can use the same
30d36a555edcb0 Jason Ling 2023-06-02   92  	 * handler for kernels that don't support fexit for ARM64 and those
30d36a555edcb0 Jason Ling 2023-06-02   93  	 * that do.
30d36a555edcb0 Jason Ling 2023-06-02   94  	 */
30d36a555edcb0 Jason Ling 2023-06-02   95  	TP_PROTO(struct socket *sock, struct msghdr *msg, size_t size, int rv),
30d36a555edcb0 Jason Ling 2023-06-02   96  	TP_ARGS(sock, msg, size, rv),
30d36a555edcb0 Jason Ling 2023-06-02   97  	TP_CONDITION(sock && sock->sk),
30d36a555edcb0 Jason Ling 2023-06-02   98  	TP_STRUCT__entry(
30d36a555edcb0 Jason Ling 2023-06-02   99  		__field(size_t, bytes_sent)
30d36a555edcb0 Jason Ling 2023-06-02  100  		__field(__u32, saddr4)
30d36a555edcb0 Jason Ling 2023-06-02  101  		__field(__u32, daddr4)
30d36a555edcb0 Jason Ling 2023-06-02  102  		__field(__u16, sport)
30d36a555edcb0 Jason Ling 2023-06-02  103  		__field(__u16, dport)
30d36a555edcb0 Jason Ling 2023-06-02  104  		__field(__u8, protocol)
30d36a555edcb0 Jason Ling 2023-06-02  105  	),
30d36a555edcb0 Jason Ling 2023-06-02  106  	TP_fast_assign(
30d36a555edcb0 Jason Ling 2023-06-02  107  		struct sock *sk = sock->sk;
30d36a555edcb0 Jason Ling 2023-06-02  108  
30d36a555edcb0 Jason Ling 2023-06-02  109  		CROS_NET_FILL_ADDR_PORT(sk, __entry);
30d36a555edcb0 Jason Ling 2023-06-02  110  		__entry->bytes_sent = rv;
30d36a555edcb0 Jason Ling 2023-06-02  111  	),
30d36a555edcb0 Jason Ling 2023-06-02  112  	TP_printk(
30d36a555edcb0 Jason Ling 2023-06-02  113  		"informational_only_will_be_removed:%pi4:%d-%pi4:%d-%z-prot:%d",
30d36a555edcb0 Jason Ling 2023-06-02  114  		&__entry->saddr4,
30d36a555edcb0 Jason Ling 2023-06-02  115  		__entry->sport,
30d36a555edcb0 Jason Ling 2023-06-02  116  		&__entry->daddr4,
30d36a555edcb0 Jason Ling 2023-06-02  117  		__entry->dport,
30d36a555edcb0 Jason Ling 2023-06-02  118  		__entry->bytes_sent,
30d36a555edcb0 Jason Ling 2023-06-02  119  		__entry->protocol
30d36a555edcb0 Jason Ling 2023-06-02  120  		)
30d36a555edcb0 Jason Ling 2023-06-02  121  );
30d36a555edcb0 Jason Ling 2023-06-02  122  
30d36a555edcb0 Jason Ling 2023-06-02  123  TRACE_EVENT_CONDITION(cros_inet_stream_connect_exit,
30d36a555edcb0 Jason Ling 2023-06-02  124  	/* The tracepoint signature matches the signature of inet_stream_connect
30d36a555edcb0 Jason Ling 2023-06-02  125  	 * with the addition of the return value. This is done to match the
30d36a555edcb0 Jason Ling 2023-06-02  126  	 * expected signature of an fexit bpf program.
30d36a555edcb0 Jason Ling 2023-06-02  127  	 * This is done so that a BPF application can use the same
30d36a555edcb0 Jason Ling 2023-06-02  128  	 * handler for kernels that don't support fexit for ARM64 and those
30d36a555edcb0 Jason Ling 2023-06-02  129  	 * that do.
30d36a555edcb0 Jason Ling 2023-06-02  130  	 */
30d36a555edcb0 Jason Ling 2023-06-02  131  	TP_PROTO(struct socket *sock, struct sockaddr *uaddr, int addr_len, int flags,
30d36a555edcb0 Jason Ling 2023-06-02  132  		int is_sendmsg,  int rv),
30d36a555edcb0 Jason Ling 2023-06-02  133  	TP_ARGS(sock, uaddr, addr_len, flags, is_sendmsg, rv),
30d36a555edcb0 Jason Ling 2023-06-02  134  	TP_CONDITION(sock && sock->sk),
30d36a555edcb0 Jason Ling 2023-06-02  135  	TP_STRUCT__entry(
30d36a555edcb0 Jason Ling 2023-06-02  136  		__field(int, is_sendmsg)
30d36a555edcb0 Jason Ling 2023-06-02  137  		__field(__u32, saddr4)
30d36a555edcb0 Jason Ling 2023-06-02  138  		__field(__u32, daddr4)
30d36a555edcb0 Jason Ling 2023-06-02  139  		__field(__u16, sport)
30d36a555edcb0 Jason Ling 2023-06-02  140  		__field(__u16, dport)
30d36a555edcb0 Jason Ling 2023-06-02  141  		__field(__u8, protocol)
30d36a555edcb0 Jason Ling 2023-06-02  142  	),
30d36a555edcb0 Jason Ling 2023-06-02  143  	TP_fast_assign(
30d36a555edcb0 Jason Ling 2023-06-02  144  		struct sock *sk = sock->sk;
30d36a555edcb0 Jason Ling 2023-06-02  145  
30d36a555edcb0 Jason Ling 2023-06-02  146  		CROS_NET_FILL_ADDR_PORT(sk, __entry);
30d36a555edcb0 Jason Ling 2023-06-02  147  		__entry->is_sendmsg = is_sendmsg;
30d36a555edcb0 Jason Ling 2023-06-02  148  	),
30d36a555edcb0 Jason Ling 2023-06-02  149  	TP_printk(
30d36a555edcb0 Jason Ling 2023-06-02  150  		"informational_only_will_be_removed:%pi4:%d-%pi4:%d-prot:%d-issendmsg:%d",
30d36a555edcb0 Jason Ling 2023-06-02  151  		&__entry->saddr4,
30d36a555edcb0 Jason Ling 2023-06-02  152  		__entry->sport,
30d36a555edcb0 Jason Ling 2023-06-02  153  		&__entry->daddr4,
30d36a555edcb0 Jason Ling 2023-06-02  154  		__entry->dport,
30d36a555edcb0 Jason Ling 2023-06-02  155  		__entry->protocol,
30d36a555edcb0 Jason Ling 2023-06-02  156  		__entry->is_sendmsg
30d36a555edcb0 Jason Ling 2023-06-02  157  		)
30d36a555edcb0 Jason Ling 2023-06-02  158  );
30d36a555edcb0 Jason Ling 2023-06-02  159  
30d36a555edcb0 Jason Ling 2023-06-02 @160  TRACE_EVENT_CONDITION(cros_inet_sendpage_exit,
30d36a555edcb0 Jason Ling 2023-06-02  161  	/* The tracepoint signature matches the signature of inet_sendpage with
30d36a555edcb0 Jason Ling 2023-06-02  162  	 * addition of the return value. This is done to match the expected
30d36a555edcb0 Jason Ling 2023-06-02  163  	 * signature of an fexit bpf program.
30d36a555edcb0 Jason Ling 2023-06-02  164  	 * This is done so that a BPF application can use the same
30d36a555edcb0 Jason Ling 2023-06-02  165  	 * handler for kernels that don't support fexit for ARM64 and those
30d36a555edcb0 Jason Ling 2023-06-02  166  	 * that do.
30d36a555edcb0 Jason Ling 2023-06-02  167  	 */
30d36a555edcb0 Jason Ling 2023-06-02  168  	TP_PROTO(struct socket *sock, struct page *page, int offset, size_t size,
30d36a555edcb0 Jason Ling 2023-06-02  169  		int flags, int rv),
30d36a555edcb0 Jason Ling 2023-06-02  170  	TP_ARGS(sock, page, offset, size, flags, rv),
30d36a555edcb0 Jason Ling 2023-06-02  171  	TP_CONDITION(sock && sock->sk),
30d36a555edcb0 Jason Ling 2023-06-02  172  	TP_STRUCT__entry(
30d36a555edcb0 Jason Ling 2023-06-02  173  		__field(size_t, bytes_sent)
30d36a555edcb0 Jason Ling 2023-06-02  174  		__field(__u32, saddr4)
30d36a555edcb0 Jason Ling 2023-06-02  175  		__field(__u32, daddr4)
30d36a555edcb0 Jason Ling 2023-06-02  176  		__field(__u16, sport)
30d36a555edcb0 Jason Ling 2023-06-02  177  		__field(__u16, dport)
30d36a555edcb0 Jason Ling 2023-06-02  178  		__field(__u8, protocol)
30d36a555edcb0 Jason Ling 2023-06-02  179  	),
30d36a555edcb0 Jason Ling 2023-06-02  180  	TP_fast_assign(
30d36a555edcb0 Jason Ling 2023-06-02  181  		struct sock *sk = sock->sk;
30d36a555edcb0 Jason Ling 2023-06-02  182  
30d36a555edcb0 Jason Ling 2023-06-02  183  		CROS_NET_FILL_ADDR_PORT(sk, __entry);
30d36a555edcb0 Jason Ling 2023-06-02  184  		__entry->bytes_sent = rv;
30d36a555edcb0 Jason Ling 2023-06-02  185  	),
30d36a555edcb0 Jason Ling 2023-06-02  186  	TP_printk(
30d36a555edcb0 Jason Ling 2023-06-02  187  		"informational_only_will_be_removed:%pi4:%d-%pi4:%d-%z",
30d36a555edcb0 Jason Ling 2023-06-02  188  		&__entry->saddr4,
30d36a555edcb0 Jason Ling 2023-06-02  189  		__entry->sport,
30d36a555edcb0 Jason Ling 2023-06-02  190  		&__entry->daddr4,
30d36a555edcb0 Jason Ling 2023-06-02  191  		__entry->dport,
30d36a555edcb0 Jason Ling 2023-06-02  192  		__entry->bytes_sent
30d36a555edcb0 Jason Ling 2023-06-02  193  		)
30d36a555edcb0 Jason Ling 2023-06-02  194  );
30d36a555edcb0 Jason Ling 2023-06-02  195  
30d36a555edcb0 Jason Ling 2023-06-02 @196  TRACE_EVENT_CONDITION(cros_inet_recvmsg_exit,
30d36a555edcb0 Jason Ling 2023-06-02  197  	/* The tracepoint signature matches the signature of inet_recvmsg with
30d36a555edcb0 Jason Ling 2023-06-02  198  	 * addition of the return value. This is done to match the expected
30d36a555edcb0 Jason Ling 2023-06-02  199  	 * signature of an fexit bpf program.
30d36a555edcb0 Jason Ling 2023-06-02  200  	 * This is done so that a BPF application can use the same
30d36a555edcb0 Jason Ling 2023-06-02  201  	 * handler for kernels that don't support fexit for ARM64 and those
30d36a555edcb0 Jason Ling 2023-06-02  202  	 * that do.
30d36a555edcb0 Jason Ling 2023-06-02  203  	 */
30d36a555edcb0 Jason Ling 2023-06-02  204  	TP_PROTO(struct socket *sock, struct msghdr *msg, size_t size, int flags, int rv),
30d36a555edcb0 Jason Ling 2023-06-02  205  	TP_ARGS(sock, msg, size, flags, rv),
30d36a555edcb0 Jason Ling 2023-06-02  206  	TP_CONDITION(sock && sock->sk),
30d36a555edcb0 Jason Ling 2023-06-02  207  	TP_STRUCT__entry(
30d36a555edcb0 Jason Ling 2023-06-02  208  		__field(size_t, bytes_sent)
30d36a555edcb0 Jason Ling 2023-06-02  209  		__field(__u32, saddr4)
30d36a555edcb0 Jason Ling 2023-06-02  210  		__field(__u32, daddr4)
30d36a555edcb0 Jason Ling 2023-06-02  211  		__field(__u16, sport)
30d36a555edcb0 Jason Ling 2023-06-02  212  		__field(__u16, dport)
30d36a555edcb0 Jason Ling 2023-06-02  213  		__field(__u8, protocol)
30d36a555edcb0 Jason Ling 2023-06-02  214  	),
30d36a555edcb0 Jason Ling 2023-06-02  215  	TP_fast_assign(
30d36a555edcb0 Jason Ling 2023-06-02  216  		struct sock *sk = sock->sk;
30d36a555edcb0 Jason Ling 2023-06-02  217  
30d36a555edcb0 Jason Ling 2023-06-02  218  		CROS_NET_FILL_ADDR_PORT(sk, __entry);
30d36a555edcb0 Jason Ling 2023-06-02  219  		__entry->bytes_sent = rv;
30d36a555edcb0 Jason Ling 2023-06-02  220  	),
30d36a555edcb0 Jason Ling 2023-06-02  221  	TP_printk(
30d36a555edcb0 Jason Ling 2023-06-02  222  		"informational_only_will_be_removed:%pi4:%d-%pi4:%d-%z-prot:%d",
30d36a555edcb0 Jason Ling 2023-06-02  223  		&__entry->saddr4,
30d36a555edcb0 Jason Ling 2023-06-02  224  		__entry->sport,
30d36a555edcb0 Jason Ling 2023-06-02  225  		&__entry->daddr4,
30d36a555edcb0 Jason Ling 2023-06-02  226  		__entry->dport,
30d36a555edcb0 Jason Ling 2023-06-02  227  		__entry->bytes_sent,
30d36a555edcb0 Jason Ling 2023-06-02  228  		__entry->protocol
30d36a555edcb0 Jason Ling 2023-06-02  229  		)
30d36a555edcb0 Jason Ling 2023-06-02  230  );
30d36a555edcb0 Jason Ling 2023-06-02  231  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
