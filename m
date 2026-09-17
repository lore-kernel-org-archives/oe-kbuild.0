Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69A3495AE1
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Sep 2026 22:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685330; cv=none; b=YBaYRv8y3tF9ZLGWICvwvEutHeKzg91APFR7MJI51xAoq6T4KTDUElVCcm+PseQ9y5PduSYOiuJSL/R4M4FY7DwlCpnjkZI/Dn+JLKroYRBAIXzbEUWgUnnxaOcPBgeaXKeQRaB7BttDHsFFCfJff4cgIRBEjJ8tHPcokR/Y5lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685330; c=relaxed/simple;
	bh=zbt/OT8DdwADuM5l8Be+sDZNagytpac6T4lkcO+k6x8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DnU86HtyB9RZ/dm3S/IG2Qzt2CQqhhETX2lYOxxfJHASNv7X2BliqSU7pkojuGCarBAzGIuiHM48tr9XN5flO5CSnYSx2rkNWYUKr7XtLKghBWvENr8CDGxr8v1wsVuiqjJux0Vr0JNC1okWHgg4tWsBduivhpKbf8ox5eh6vYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iSq3ZNEv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iSq3ZNEv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789685327; x=1821221327;
  h=date:from:to:cc:subject:message-id;
  bh=zbt/OT8DdwADuM5l8Be+sDZNagytpac6T4lkcO+k6x8=;
  b=iSq3ZNEvnlE8gVyzeMVQi66upfgsHhZ8Lp+Fhh3uV71o9fmvMQrOWmlM
   o6xAUwNPBr3+3lCb2x6L9jP1goEltTx1s8ogmJwhrHnikWejh4nV9JFei
   zDeQOd4sfohA+Zjk8EWOjIU22QBwSrfX4nVBvQCpWjU+ZWW0bqpAhAafn
   HgvK5vidWXHj8fR00NWKimkIEqao7akEBJlylv3lE91X51M+cuGwOnCFz
   Wc9hiqDxol+Otn/l82zi96IJW52xRTHNC7SzhIb+/u3XMGQmtjXEbW0AP
   ZHj+Xv/fNq6nX//gdPYaD+ntSY8IDfNk2+L6LoIUxaA8cfVQVDdlm16Ka
   A==;
X-CSE-ConnectionGUID: uIrPXMJdQwSTo9SpynvdhQ==
X-CSE-MsgGUID: b9jjDQwCRQSTOXRjrdHxnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90288832"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90288832"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 15:48:46 -0700
X-CSE-ConnectionGUID: ICKLK0fHQZ+3ktRFhW3gUA==
X-CSE-MsgGUID: 8WJc1Uv9Su6faHlCXmWARg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270361878"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 17 Sep 2026 15:48:44 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7KuH-000000000ni-0lJb;
	Thu, 17 Sep 2026 22:48:41 +0000
Date: Fri, 18 Sep 2026 00:48:02 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: net/xfrm/xfrm_input.c:839:2-10: WARNING: NULL check before
 (net)dev_{put, hold} functions is not needed.
Message-ID: <202609180028.HEIQ1Cxv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
CC: Steffen Klassert <steffen.klassert@secunet.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5a051f6b840d48f159166ef073d3021989bfb50
commit: d2f5082f9e84653fa1a9e8aebaaff23e688f5e19 xfrm: add missing rcu_read_lock(), skb_dst_force() and dev_hold() for xfrm_trans_reinject()
date:   4 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
config: arm64-randconfig-r2106-20260917 (https://download.01.org/0day-ci/archive/20260918/202609180028.HEIQ1Cxv-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project efb463832233ca8ce9b8972c568ee008603e348e)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d2f5082f9e84 ("xfrm: add missing rcu_read_lock(), skb_dst_force() and dev_hold() for xfrm_trans_reinject()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609180028.HEIQ1Cxv-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/xfrm/xfrm_input.c:839:2-10: WARNING: NULL check before (net)dev_{put, hold} functions is not needed.
   net/xfrm/xfrm_input.c:810:3-10: WARNING: NULL check before (net)dev_{put, hold} functions is not needed.

vim +839 net/xfrm/xfrm_input.c

acf568ee859f09 Herbert Xu       2017-12-15  816  
7b3801927e52f8 Sabrina Dubroca  2019-11-25  817  int xfrm_trans_queue_net(struct net *net, struct sk_buff *skb,
acf568ee859f09 Herbert Xu       2017-12-15  818  			 int (*finish)(struct net *, struct sock *,
acf568ee859f09 Herbert Xu       2017-12-15  819  				       struct sk_buff *))
acf568ee859f09 Herbert Xu       2017-12-15  820  {
acf568ee859f09 Herbert Xu       2017-12-15  821  	struct xfrm_trans_tasklet *trans;
c16f74dc1d75d0 Zhengchuan Liang 2026-05-22  822  	struct net *hold_net;
acf568ee859f09 Herbert Xu       2017-12-15  823  
acf568ee859f09 Herbert Xu       2017-12-15  824  	trans = this_cpu_ptr(&xfrm_trans_tasklet);
acf568ee859f09 Herbert Xu       2017-12-15  825  
edbc666cdcbf4a Eric Dumazet     2024-03-06  826  	if (skb_queue_len(&trans->queue) >= READ_ONCE(net_hotdata.max_backlog))
acf568ee859f09 Herbert Xu       2017-12-15  827  		return -ENOBUFS;
acf568ee859f09 Herbert Xu       2017-12-15  828  
d2f5082f9e8465 Eric Dumazet     2026-08-07  829  	if (skb_dst(skb) && !skb_dst_force(skb))
d2f5082f9e8465 Eric Dumazet     2026-08-07  830  		return -EHOSTUNREACH;
d2f5082f9e8465 Eric Dumazet     2026-08-07  831  
7b3801927e52f8 Sabrina Dubroca  2019-11-25  832  	BUILD_BUG_ON(sizeof(struct xfrm_trans_cb) > sizeof(skb->cb));
7b3801927e52f8 Sabrina Dubroca  2019-11-25  833  
c16f74dc1d75d0 Zhengchuan Liang 2026-05-22  834  	hold_net = maybe_get_net(net);
c16f74dc1d75d0 Zhengchuan Liang 2026-05-22  835  	if (!hold_net)
c16f74dc1d75d0 Zhengchuan Liang 2026-05-22  836  		return -ENODEV;
c16f74dc1d75d0 Zhengchuan Liang 2026-05-22  837  
d2f5082f9e8465 Eric Dumazet     2026-08-07  838  	if (skb->dev)
d2f5082f9e8465 Eric Dumazet     2026-08-07 @839  		dev_hold(skb->dev);
d2f5082f9e8465 Eric Dumazet     2026-08-07  840  
acf568ee859f09 Herbert Xu       2017-12-15  841  	XFRM_TRANS_SKB_CB(skb)->finish = finish;
c16f74dc1d75d0 Zhengchuan Liang 2026-05-22  842  	XFRM_TRANS_SKB_CB(skb)->net = hold_net;
4f4920669d21e1 Liu Jian         2022-09-24  843  	spin_lock_bh(&trans->queue_lock);
d16b46e4fd8bc6 Herbert Xu       2018-01-04  844  	__skb_queue_tail(&trans->queue, skb);
4f4920669d21e1 Liu Jian         2022-09-24  845  	spin_unlock_bh(&trans->queue_lock);
4f4920669d21e1 Liu Jian         2022-09-24  846  	schedule_work(&trans->work);
acf568ee859f09 Herbert Xu       2017-12-15  847  	return 0;
acf568ee859f09 Herbert Xu       2017-12-15  848  }
7b3801927e52f8 Sabrina Dubroca  2019-11-25  849  EXPORT_SYMBOL(xfrm_trans_queue_net);
7b3801927e52f8 Sabrina Dubroca  2019-11-25  850  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
