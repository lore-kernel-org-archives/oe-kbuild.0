Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21551C29
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Jun 2023 07:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686815262; x=1718351262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8AmpIAXHfj0n8NQux+JMB6DtKdkWUMwZ4/Tvn4X8+r8=;
  b=PneRTCuZrThdBwZOzwUNcHsJ5Oy/xi58E48Pd4av3d00gbdicJkbemEW
   QDii4Kx7Czc2jjTvfRK7waf5vCQVteGoh85kEpWXfNQfYreD3/RbowNIR
   uig6JSNGbZ5rtolFA/iyT+IVga+IXUg/V3UqHO9dzbsFKU/37NHKDtlbY
   6Imts1qim37LnOtGQBSXD5BsQBuv0F2sWk1UZuDTpH6jf67oXeF25HuWm
   lvVtW0n8r0kHmmJ5f315+PLphzjviztTeMwPBebschzHSLiJri4BbY22A
   ZkPRRUmU4rHtZEENNMp2SKJWGDxTcqFRJ8YS8HqLirMngWd02AHCGirh5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="445210865"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="445210865"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 00:47:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="742145817"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="742145817"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 15 Jun 2023 00:47:40 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9hhD-0001cr-1U;
	Thu, 15 Jun 2023 07:47:15 +0000
Date: Thu, 15 Jun 2023 15:46:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v7 08/22] net/tcp: Add AO sign to RST packets
Message-ID: <202306151524.UEz29Wc1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: net/ipv6/tcp_ipv6.c:1136:1: sparse: sparse: unused label 'out'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230614230947.3954084-9-dima@arista.com>
References: <20230614230947.3954084-9-dima@arista.com>
TO: Dmitry Safonov <dima@arista.com>
TO: David Ahern <dsahern@kernel.org>
TO: Eric Dumazet <edumazet@google.com>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Dmitry Safonov <dima@arista.com>
CC: Andy Lutomirski <luto@amacapital.net>
CC: Ard Biesheuvel <ardb@kernel.org>
CC: Bob Gilligan <gilligan@arista.com>
CC: Dan Carpenter <error27@gmail.com>
CC: David Laight <David.Laight@aculab.com>
CC: Donald Cassidy <dcassidy@redhat.com>
CC: Eric Biggers <ebiggers@kernel.org>
CC: "Eric W. Biederman" <ebiederm@xmission.com>
CC: Francesco Ruggeri <fruggeri05@gmail.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>
CC: Ivan Delalande <colona@arista.com>
CC: Leonard Crestez <cdleonard@gmail.com>
CC: Salam Noureddine <noureddine@arista.com>

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b6dad5178ceaf23f369c3711062ce1f2afc33644]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Safonov/net-tcp-Prepare-tcp_md5sig_pool-for-TCP-AO/20230615-071334
base:   b6dad5178ceaf23f369c3711062ce1f2afc33644
patch link:    https://lore.kernel.org/r/20230614230947.3954084-9-dima%40arista.com
patch subject: [PATCH v7 08/22] net/tcp: Add AO sign to RST packets
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: i386-randconfig-s001-20230614 (https://download.01.org/0day-ci/archive/20230615/202306151524.UEz29Wc1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/2045a93527d963ceabff145d0cc7c168e1bceedd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dmitry-Safonov/net-tcp-Prepare-tcp_md5sig_pool-for-TCP-AO/20230615-071334
        git checkout 2045a93527d963ceabff145d0cc7c168e1bceedd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash net/ipv6/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306151524.UEz29Wc1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ipv6/tcp_ipv6.c:1136:1: sparse: sparse: unused label 'out'
   net/ipv6/tcp_ipv6.c:1454:25: sparse: sparse: context imbalance in 'tcp_v6_syn_recv_sock' - unexpected unlock
   net/ipv6/tcp_ipv6.c:1835:21: sparse: sparse: context imbalance in 'tcp_v6_rcv' - different lock contexts for basic block

vim +/out +1136 net/ipv6/tcp_ipv6.c

2045a93527d963c Dmitry Safonov           2023-06-15  1110  
c24b14c46bb88d8 Song Liu                 2017-10-23  1111  	if (sk) {
c24b14c46bb88d8 Song Liu                 2017-10-23  1112  		oif = sk->sk_bound_dev_if;
052e0690f1f62f7 Eric Dumazet             2019-07-10  1113  		if (sk_fullsock(sk)) {
052e0690f1f62f7 Eric Dumazet             2019-07-10  1114  			const struct ipv6_pinfo *np = tcp_inet6_sk(sk);
052e0690f1f62f7 Eric Dumazet             2019-07-10  1115  
c24b14c46bb88d8 Song Liu                 2017-10-23  1116  			trace_tcp_send_reset(sk, skb);
052e0690f1f62f7 Eric Dumazet             2019-07-10  1117  			if (np->repflow)
052e0690f1f62f7 Eric Dumazet             2019-07-10  1118  				label = ip6_flowlabel(ipv6h);
e9a5dceee56cb52 Eric Dumazet             2019-09-24  1119  			priority = sk->sk_priority;
dc6456e938e938d Antoine Tenart           2023-04-27  1120  			txhash = sk->sk_txhash;
052e0690f1f62f7 Eric Dumazet             2019-07-10  1121  		}
f6c0f5d209fa80e Eric Dumazet             2019-09-24  1122  		if (sk->sk_state == TCP_TIME_WAIT) {
50a8accf10627b3 Eric Dumazet             2019-06-05  1123  			label = cpu_to_be32(inet_twsk(sk)->tw_flowlabel);
f6c0f5d209fa80e Eric Dumazet             2019-09-24  1124  			priority = inet_twsk(sk)->tw_priority;
9258b8b1be2e1e2 Eric Dumazet             2022-09-22  1125  			txhash = inet_twsk(sk)->tw_txhash;
f6c0f5d209fa80e Eric Dumazet             2019-09-24  1126  		}
323a53c41292a0d Eric Dumazet             2019-06-05  1127  	} else {
a346abe051bd2bd Eric Dumazet             2019-07-01  1128  		if (net->ipv6.sysctl.flowlabel_reflect & FLOWLABEL_REFLECT_TCP_RESET)
323a53c41292a0d Eric Dumazet             2019-06-05  1129  			label = ip6_flowlabel(ipv6h);
c24b14c46bb88d8 Song Liu                 2017-10-23  1130  	}
c24b14c46bb88d8 Song Liu                 2017-10-23  1131  
e92dd77e6fe0a33 Wei Wang                 2020-09-08  1132  	tcp_v6_send_response(sk, skb, seq, ack_seq, 0, 0, 0, oif, key, 1,
2045a93527d963c Dmitry Safonov           2023-06-15  1133  			     ipv6_get_dsfield(ipv6h), label, priority, txhash,
2045a93527d963c Dmitry Safonov           2023-06-15  1134  			     ao_key, traffic_key, rcv_next, ao_sne);
658ddaaf6694adf Shawn Lu                 2012-01-31  1135  
3b24d854cb35383 Eric Dumazet             2016-04-01 @1136  out:
658ddaaf6694adf Shawn Lu                 2012-01-31  1137  	rcu_read_unlock();
ecc51b6d5ca04bb Arnaldo Carvalho de Melo 2005-12-12  1138  }
^1da177e4c3f415 Linus Torvalds           2005-04-16  1139  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
