Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793583987;
	b=U0//Puf6kwY/S9iQhBoYBmB/1XuGGLE+y4jmX0zWaKkjAsyPz2X8wv2JOliiPAN1vI9/
	 EXHxoQwtqu0+zRP6ytYpjdSJHT3lREcG4bJEk5xeoMNR1I0pC9Cq0aOguxuNbRJUvxmiS
	 +VyI/PhTPNR1Wnt72Axz7pX8wDVC1k0RQeIgIQbKT63+GuUsdDfG4hLLScWDTDWPgbUKx
	 /it1jok586ghW8fG8HqyNyvxgHZC5XgQqiLgxbVlGnjvQWn9TmL3UGpvR62CRcmPKwQA8
	 /pXwtvvitI4HjD53ZuNerUPxgBG/atmlc9RHRCXaBvLs9BiTD0LoFqA/wh8sTL+oRDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793583987;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=+KJYCLYixkeepNNgGX5u+7YArOLjVcQhi+Os08YdX80=;
	b=nWt0WeksD0HqgFOW4JZ2hexHqPz0KelFcoJvINzwFy1Lie74phAqgyO/pLodWbPI/kmw
	 wlpQTZC4zcprIlMGfqZCv7LWCDCXqKY5hQbIFc+q6LS/q3J7pGiGaxoxDErp4TPX7LCAi
	 ATWq/C2x4FAb3X+iOayRZYn+7Y3YYRcCB4s5qsTKP0lEPX9Tjnmu4uP5dqLjVqzg3jTAa
	 VzNiP/4bMrjEhjD9eaYCJ4yghY+1CrRstmUfUCbiI5qHvm3jbcQBedZ2W/0dXoQfrFOjp
	 34kReg7QKaSww1yTgBouYuI3wLh1H6y/gYfvZvPNZYe6ubNUvWHkYKYG0+LIOX1XDTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=es4Dng+6;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE75B606A334
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Nov 2026 01:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE75B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=es4Dng+6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793583986; x=1825119986;
  h=date:from:to:cc:subject:message-id;
  bh=5UUre/PzlZ+Sbz0ylbh7TG3sm2ium8H0NlIZinbi2IM=;
  b=es4Dng+6X/E0kPSno3WxKwzlBHMTXCGZYfUy/o8aMK6mlDfgrGc+t6Zz
   oRA9fMORuZFJytg6A+0edMjrAwIkhJf7GW/6Lwd3rG4nVMim5wgIrI8oj
   SiHrPWmjiGFNoW/Pg/h7POl37FgRkmI47fmlCMCCMkuL2y/o9nXA5PFhr
   sai3Vvyycg/bOv2bbGEK4qZmFmhIGVgzxRjw+SAo+bxKonV3pTbZ+UBpY
   Nuri4ZZxPMewqTa9vbst0hg40+Kn0p6iZ0QvR9a6DA9cfV7KVi4NxYZPZ
   0YJ15eYvyVFog1PHcVFt2dsH9ioY6nEMUBp9wYhEfJO/MgdY2ahQfSIth
   A==;
X-CSE-ConnectionGUID: KJ1EHKBnQCmdk8ogJ1rQuw==
X-CSE-MsgGUID: q4V8RzuxTWymwKfTME+DoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2179398"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2179398"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 17:46:24 -0800
X-CSE-ConnectionGUID: 4Ql06MdjSuOyJVE2qFRz/g==
X-CSE-MsgGUID: +r6DICEuQNmR8HyDK1U4Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="5918513"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 01 Nov 2026 17:46:22 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNh7s-000000008Dd-2D2T;
	Mon, 02 Nov 2026 01:46:20 +0000
Date: Mon, 02 Nov 2026 02:45:26 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: net/xfrm/xfrm_input.c:839:2-10: WARNING: NULL check before
 (net)dev_{put, hold} functions is not needed.
Message-ID: <202611020238.dcei9ng8-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
CC: Steffen Klassert <steffen.klassert@secunet.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
commit: d2f5082f9e84653fa1a9e8aebaaff23e688f5e19 xfrm: add missing rcu_read_lock(), skb_dst_force() and dev_hold() for xfrm_trans_reinject()
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: mips-randconfig-r2106-20261101 (https://download.01.org/0day-ci/archive/20261102/202611020238.dcei9ng8-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8f6b51ca8bab1d49006ddaa042bc7e4e7306975d)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d2f5082f9e84 ("xfrm: add missing rcu_read_lock(), skb_dst_force() and dev_hold() for xfrm_trans_reinject()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611020238.dcei9ng8-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/xfrm/xfrm_input.c:839:2-10: WARNING: NULL check before (net)dev_{put, hold} functions is not needed.
   net/xfrm/xfrm_input.c:810:3-10: WARNING: NULL check before (net)dev_{put, hold} functions is not needed.

vim +839 net/xfrm/xfrm_input.c

acf568ee859f098 Herbert Xu       2017-12-15  816  
7b3801927e52f86 Sabrina Dubroca  2019-11-25  817  int xfrm_trans_queue_net(struct net *net, struct sk_buff *skb,
acf568ee859f098 Herbert Xu       2017-12-15  818  			 int (*finish)(struct net *, struct sock *,
acf568ee859f098 Herbert Xu       2017-12-15  819  				       struct sk_buff *))
acf568ee859f098 Herbert Xu       2017-12-15  820  {
acf568ee859f098 Herbert Xu       2017-12-15  821  	struct xfrm_trans_tasklet *trans;
c16f74dc1d75d0e Zhengchuan Liang 2026-05-22  822  	struct net *hold_net;
acf568ee859f098 Herbert Xu       2017-12-15  823  
acf568ee859f098 Herbert Xu       2017-12-15  824  	trans = this_cpu_ptr(&xfrm_trans_tasklet);
acf568ee859f098 Herbert Xu       2017-12-15  825  
edbc666cdcbf4a8 Eric Dumazet     2024-03-06  826  	if (skb_queue_len(&trans->queue) >= READ_ONCE(net_hotdata.max_backlog))
acf568ee859f098 Herbert Xu       2017-12-15  827  		return -ENOBUFS;
acf568ee859f098 Herbert Xu       2017-12-15  828  
d2f5082f9e84653 Eric Dumazet     2026-08-07  829  	if (skb_dst(skb) && !skb_dst_force(skb))
d2f5082f9e84653 Eric Dumazet     2026-08-07  830  		return -EHOSTUNREACH;
d2f5082f9e84653 Eric Dumazet     2026-08-07  831  
7b3801927e52f86 Sabrina Dubroca  2019-11-25  832  	BUILD_BUG_ON(sizeof(struct xfrm_trans_cb) > sizeof(skb->cb));
7b3801927e52f86 Sabrina Dubroca  2019-11-25  833  
c16f74dc1d75d0e Zhengchuan Liang 2026-05-22  834  	hold_net = maybe_get_net(net);
c16f74dc1d75d0e Zhengchuan Liang 2026-05-22  835  	if (!hold_net)
c16f74dc1d75d0e Zhengchuan Liang 2026-05-22  836  		return -ENODEV;
c16f74dc1d75d0e Zhengchuan Liang 2026-05-22  837  
d2f5082f9e84653 Eric Dumazet     2026-08-07  838  	if (skb->dev)
d2f5082f9e84653 Eric Dumazet     2026-08-07 @839  		dev_hold(skb->dev);
d2f5082f9e84653 Eric Dumazet     2026-08-07  840  
acf568ee859f098 Herbert Xu       2017-12-15  841  	XFRM_TRANS_SKB_CB(skb)->finish = finish;
c16f74dc1d75d0e Zhengchuan Liang 2026-05-22  842  	XFRM_TRANS_SKB_CB(skb)->net = hold_net;
4f4920669d21e10 Liu Jian         2022-09-24  843  	spin_lock_bh(&trans->queue_lock);
d16b46e4fd8bc60 Herbert Xu       2018-01-04  844  	__skb_queue_tail(&trans->queue, skb);
4f4920669d21e10 Liu Jian         2022-09-24  845  	spin_unlock_bh(&trans->queue_lock);
4f4920669d21e10 Liu Jian         2022-09-24  846  	schedule_work(&trans->work);
acf568ee859f098 Herbert Xu       2017-12-15  847  	return 0;
acf568ee859f098 Herbert Xu       2017-12-15  848  }
7b3801927e52f86 Sabrina Dubroca  2019-11-25  849  EXPORT_SYMBOL(xfrm_trans_queue_net);
7b3801927e52f86 Sabrina Dubroca  2019-11-25  850  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
