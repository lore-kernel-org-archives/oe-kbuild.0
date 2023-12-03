Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BE01FA0
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 06:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fAGWj+cp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585177; x=1733121177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mB33wYHtojr/DkQvGNM9fCdkShrxjdSPd605vIJNrg8=;
  b=fAGWj+cpLHvA7hdjdN4kq1RpoGcTNhsfy0IZad8I8Nxp/sy4HNgfIWPN
   26nvkzAnqX9zG3MqehDYT3XibTbr7aAkqYtB3wGuw4RYbv6RkNk6lfoyF
   ojzk0A6MA/QouyKOc8+uZjHLe2ln4n/Ph07QdmSAlF4riHmMx2ZMZzKPy
   2cS65ocJ/ipfIf835AMsUk7ymVgFoPrEUOa4RqmltWDVzfgwMIgeAgILJ
   CANXMG/iaYL/sF21E16cA03UIpWnncaHy/wSAdAJInRwRojHSVrCDevQe
   Z4JYGst2Axfy37FsRT7n1827IdKXR9JYuaDceFFc0CyjXIfcdMRIqUdYP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="6906524"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="6906524"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:32:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="770191184"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="770191184"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 02 Dec 2023 22:32:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g20-0006M8-2s;
	Sun, 03 Dec 2023 06:32:44 +0000
Date: Sun, 3 Dec 2023 14:31:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net/core/filter.c:4244:9: sparse: sparse: switch with no cases
Message-ID: <202312030820.Ku2lwbDI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: net/core/filter.c:4244:9: sparse: sparse: switch with no cases"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: David Ahern <dsahern@gmail.com>
CC: Daniel Borkmann <daniel@iogearbox.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
commit: 87f5fc7e48dd3175b30dd03b41564e1a8e136323 bpf: Provide helper to do forwarding lookups in kernel FIB table
date:   6 years ago
:::::: branch date: 25 hours ago
:::::: commit date: 6 years ago
config: openrisc-randconfig-r131-20231102 (https://download.01.org/0day-ci/archive/20231203/202312030820.Ku2lwbDI-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312030820.Ku2lwbDI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312030820.Ku2lwbDI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/core/filter.c:4244:9: sparse: sparse: switch with no cases
   net/core/filter.c:4275:9: sparse: sparse: switch with no cases
   net/core/filter.c:406:33: sparse: sparse: subtraction of functions? Share your drugs
   net/core/filter.c:409:33: sparse: sparse: subtraction of functions? Share your drugs
   net/core/filter.c:412:33: sparse: sparse: subtraction of functions? Share your drugs
   net/core/filter.c:415:33: sparse: sparse: subtraction of functions? Share your drugs
   net/core/filter.c:418:33: sparse: sparse: subtraction of functions? Share your drugs
   net/core/filter.c:481:27: sparse: sparse: subtraction of functions? Share your drugs
   net/core/filter.c:484:27: sparse: sparse: subtraction of functions? Share your drugs
   net/core/filter.c:487:27: sparse: sparse: subtraction of functions? Share your drugs
   net/core/filter.c:1368:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sock_filter const *filter @@     got struct sock_filter [noderef] <asn:1> *filter @@
   net/core/filter.c:1368:39: sparse:     expected struct sock_filter const *filter
   net/core/filter.c:1368:39: sparse:     got struct sock_filter [noderef] <asn:1> *filter
   net/core/filter.c:1470:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sock_filter const *filter @@     got struct sock_filter [noderef] <asn:1> *filter @@
   net/core/filter.c:1470:39: sparse:     expected struct sock_filter const *filter
   net/core/filter.c:1470:39: sparse:     got struct sock_filter [noderef] <asn:1> *filter
   net/core/filter.c:4840:27: sparse: sparse: subtraction of functions? Share your drugs
   net/core/filter.c:4843:27: sparse: sparse: subtraction of functions? Share your drugs
   net/core/filter.c:4846:27: sparse: sparse: subtraction of functions? Share your drugs
   net/core/filter.c:6129:31: sparse: sparse: symbol 'sk_filter_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:6136:27: sparse: sparse: symbol 'sk_filter_prog_ops' was not declared. Should it be static?
   net/core/filter.c:6140:31: sparse: sparse: symbol 'tc_cls_act_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:6148:27: sparse: sparse: symbol 'tc_cls_act_prog_ops' was not declared. Should it be static?
   net/core/filter.c:6152:31: sparse: sparse: symbol 'xdp_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:6162:31: sparse: sparse: symbol 'cg_skb_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:6168:27: sparse: sparse: symbol 'cg_skb_prog_ops' was not declared. Should it be static?
   net/core/filter.c:6172:31: sparse: sparse: symbol 'lwt_inout_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:6182:31: sparse: sparse: symbol 'lwt_xmit_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:6189:27: sparse: sparse: symbol 'lwt_xmit_prog_ops' was not declared. Should it be static?
   net/core/filter.c:6193:31: sparse: sparse: symbol 'cg_sock_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:6199:27: sparse: sparse: symbol 'cg_sock_prog_ops' was not declared. Should it be static?
   net/core/filter.c:6202:31: sparse: sparse: symbol 'cg_sock_addr_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:6208:27: sparse: sparse: symbol 'cg_sock_addr_prog_ops' was not declared. Should it be static?
   net/core/filter.c:6211:31: sparse: sparse: symbol 'sock_ops_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:6217:27: sparse: sparse: symbol 'sock_ops_prog_ops' was not declared. Should it be static?
   net/core/filter.c:6220:31: sparse: sparse: symbol 'sk_skb_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:6227:27: sparse: sparse: symbol 'sk_skb_prog_ops' was not declared. Should it be static?
   net/core/filter.c:6230:31: sparse: sparse: symbol 'sk_msg_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:6236:27: sparse: sparse: symbol 'sk_msg_prog_ops' was not declared. Should it be static?
   net/core/filter.c:206:32: sparse: sparse: cast to restricted __be16
   net/core/filter.c:206:32: sparse: sparse: cast to restricted __be16
   net/core/filter.c:233:32: sparse: sparse: cast to restricted __be32
   net/core/filter.c:233:32: sparse: sparse: cast to restricted __be32
   net/core/filter.c:1772:43: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __wsum [usertype] diff @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1772:43: sparse:     expected restricted __wsum [usertype] diff
   net/core/filter.c:1772:43: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1775:36: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be16 [usertype] old @@     got unsigned long long [usertype] from @@
   net/core/filter.c:1775:36: sparse:     expected restricted __be16 [usertype] old
   net/core/filter.c:1775:36: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:1775:42: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be16 [usertype] new @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1775:42: sparse:     expected restricted __be16 [usertype] new
   net/core/filter.c:1775:42: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1778:36: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be32 [usertype] from @@     got unsigned long long [usertype] from @@
   net/core/filter.c:1778:36: sparse:     expected restricted __be32 [usertype] from
   net/core/filter.c:1778:36: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:1778:42: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be32 [usertype] to @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1778:42: sparse:     expected restricted __be32 [usertype] to
   net/core/filter.c:1778:42: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1823:59: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] diff @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1823:59: sparse:     expected restricted __wsum [usertype] diff
   net/core/filter.c:1823:59: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1826:52: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be16 [usertype] from @@     got unsigned long long [usertype] from @@
   net/core/filter.c:1826:52: sparse:     expected restricted __be16 [usertype] from
   net/core/filter.c:1826:52: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:1826:58: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __be16 [usertype] to @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1826:58: sparse:     expected restricted __be16 [usertype] to
   net/core/filter.c:1826:58: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1829:52: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be32 [usertype] from @@     got unsigned long long [usertype] from @@
   net/core/filter.c:1829:52: sparse:     expected restricted __be32 [usertype] from
   net/core/filter.c:1829:52: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:1829:58: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __be32 [usertype] to @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1829:58: sparse:     expected restricted __be32 [usertype] to
   net/core/filter.c:1829:58: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1875:28: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned long long @@     got restricted __wsum @@
   net/core/filter.c:1875:28: sparse:     expected unsigned long long
   net/core/filter.c:1875:28: sparse:     got restricted __wsum
   net/core/filter.c:1897:35: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned long long @@     got restricted __wsum [usertype] csum @@
   net/core/filter.c:1897:35: sparse:     expected unsigned long long
   net/core/filter.c:1897:35: sparse:     got restricted __wsum [usertype] csum
   net/core/filter.c:3601:49: sparse: sparse: cast truncates bits from constant value (ffffffffff becomes ff)
   net/core/filter.c: note: in included file (through include/net/checksum.h, include/linux/skbuff.h, include/linux/netlink.h, ...):
   include/linux/uaccess.h:134:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *to @@     got void [noderef] <asn:1> *to @@
   include/linux/uaccess.h:134:38: sparse:     expected void *to
   include/linux/uaccess.h:134:38: sparse:     got void [noderef] <asn:1> *to
   include/linux/uaccess.h:134:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *from @@     got void const *from @@
   include/linux/uaccess.h:134:42: sparse:     expected void const [noderef] <asn:1> *from
   include/linux/uaccess.h:134:42: sparse:     got void const *from
   net/core/filter.c: note: in included file (through include/linux/uaccess.h, include/net/checksum.h, include/linux/skbuff.h, ...):
   arch/openrisc/include/asm/uaccess.h:247:55: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got void const [noderef] <asn:1> *from @@
   arch/openrisc/include/asm/uaccess.h:247:55: sparse:     expected void const *from
   arch/openrisc/include/asm/uaccess.h:247:55: sparse:     got void const [noderef] <asn:1> *from
   net/core/filter.c: In function 'bpf_base_func_proto':
   net/core/filter.c:4319:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
    4319 |                 if (capable(CAP_SYS_ADMIN))
         |                    ^
   net/core/filter.c:4321:9: note: here
    4321 |         default:
         |         ^~~~~~~

vim +4244 net/core/filter.c

87f5fc7e48dd31 David Ahern 2018-05-09  4237  
87f5fc7e48dd31 David Ahern 2018-05-09  4238  BPF_CALL_4(bpf_xdp_fib_lookup, struct xdp_buff *, ctx,
87f5fc7e48dd31 David Ahern 2018-05-09  4239  	   struct bpf_fib_lookup *, params, int, plen, u32, flags)
87f5fc7e48dd31 David Ahern 2018-05-09  4240  {
87f5fc7e48dd31 David Ahern 2018-05-09  4241  	if (plen < sizeof(*params))
87f5fc7e48dd31 David Ahern 2018-05-09  4242  		return -EINVAL;
87f5fc7e48dd31 David Ahern 2018-05-09  4243  
87f5fc7e48dd31 David Ahern 2018-05-09 @4244  	switch (params->family) {
87f5fc7e48dd31 David Ahern 2018-05-09  4245  #if IS_ENABLED(CONFIG_INET)
87f5fc7e48dd31 David Ahern 2018-05-09  4246  	case AF_INET:
87f5fc7e48dd31 David Ahern 2018-05-09  4247  		return bpf_ipv4_fib_lookup(dev_net(ctx->rxq->dev), params,
87f5fc7e48dd31 David Ahern 2018-05-09  4248  					   flags);
87f5fc7e48dd31 David Ahern 2018-05-09  4249  #endif
87f5fc7e48dd31 David Ahern 2018-05-09  4250  #if IS_ENABLED(CONFIG_IPV6)
87f5fc7e48dd31 David Ahern 2018-05-09  4251  	case AF_INET6:
87f5fc7e48dd31 David Ahern 2018-05-09  4252  		return bpf_ipv6_fib_lookup(dev_net(ctx->rxq->dev), params,
87f5fc7e48dd31 David Ahern 2018-05-09  4253  					   flags);
87f5fc7e48dd31 David Ahern 2018-05-09  4254  #endif
87f5fc7e48dd31 David Ahern 2018-05-09  4255  	}
87f5fc7e48dd31 David Ahern 2018-05-09  4256  	return 0;
87f5fc7e48dd31 David Ahern 2018-05-09  4257  }
87f5fc7e48dd31 David Ahern 2018-05-09  4258  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
