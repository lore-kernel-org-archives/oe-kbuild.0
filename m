Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179EC18A93F
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Mar 2025 04:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742013635; cv=none; b=LEshj4MGZWvLbG1S3JL3mSi4Gxrq9NFjgO2Ulq753Sd+mK3oGVUVwOUKpYqWULqfeDo3y2xYEpR3ChLywXFqy5x4I7FcUySHl2ylL8/zlga30ggl0iC58ZyjtL4hzxtjr52M37V+1Xpzmtp8heqwZtiLgKeFGMBjxi66McF8ppU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742013635; c=relaxed/simple;
	bh=odM5bl/DyAyYQ1l4bVVNTuhvjATlxTsTpdUZ1Us5mK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ducna6zT8/y5PMh3g3iaT4j0hwjWWXr02kb2uTmz38Im23sjjIoZbYHGe2a8FnevzIqqzyjETQP2XhpoyzX/8HnHryxK5tpP5Js/+LIV0iPtBHXgwdW4PsMMlyK4j0U4YbW4NJN62rsK3K7bW7CVKbn5JblVRUY9Pj/vX04EuaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Db759mST; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Db759mST"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742013633; x=1773549633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=odM5bl/DyAyYQ1l4bVVNTuhvjATlxTsTpdUZ1Us5mK4=;
  b=Db759mSTUk61FO0OopRqEgNDP/YNNZsdqwMVxuwxe3iZos2XHAOzDAAk
   kquBEOgimd265YgfW7zfpkpdhX3SPFbkTZZZAonzK9I/4VwHK1LNsbHKa
   wuWjvcA7P8ZD1regTJIfNvvBynNETwLfrjuRcSEwIeA9qCXSKGoGsR6K8
   IT45CSteEEfGvKRbHhlbcJWwPz6s8P1j5nTFgcSHbiqb615aIYDyExwqE
   SYaTBaM4FkxPy9fZe/srqeDMjyWPrFaMC8GOAh3bQk7jnTCXbi4nd77Hs
   rIiD+YmKd7hw9YaRnOVR44zpF+SEjiMKGkrTqakEgCw/IC3kIeTGjmZrM
   w==;
X-CSE-ConnectionGUID: OR7vs40OSwmjnhawdoKo/g==
X-CSE-MsgGUID: DYK8B4suR1yKofRF3dV2tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="42348353"
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="42348353"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 21:40:33 -0700
X-CSE-ConnectionGUID: 4dLr7vCpTVOuIiGs+rAaKQ==
X-CSE-MsgGUID: v6Mre/gCQ5aXTDos0t4SMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="126527191"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 14 Mar 2025 21:40:31 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttJK0-000B4G-2a;
	Sat, 15 Mar 2025 04:40:28 +0000
Date: Sat, 15 Mar 2025 12:39:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/core/netdev-genl.c:778 netdev_nl_bind_rx_doit() warn: passing
 positive error code '(-95)' to 'PTR_ERR'
Message-ID: <202503151238.ubX6vt85-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Mina Almasry <almasrymina@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Willem de Bruijn <willemb@google.com>
CC: Kaiyuan Zhang <kaiyuanz@google.com>
CC: Pavel Begunkov <asml.silence@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a29967be967eebf049e89edb14c4edf9991bc929
commit: 170aafe35cb98e0f3fbacb446ea86389fbce22ea netdev: support binding dma-buf to netdevice
date:   6 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 months ago
config: i386-randconfig-141-20250315 (https://download.01.org/0day-ci/archive/20250315/202503151238.ubX6vt85-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503151238.ubX6vt85-lkp@intel.com/

New smatch warnings:
net/core/netdev-genl.c:778 netdev_nl_bind_rx_doit() warn: passing positive error code '(-95)' to 'PTR_ERR'

Old smatch warnings:
net/core/netdev-genl.c:47 netdev_nl_dev_fill() warn: inconsistent indenting

vim +778 net/core/netdev-genl.c

ab63a2387cb906d Jakub Kicinski 2024-03-06  726  
3efd7ab46d0aebc Mina Almasry   2024-09-10  727  int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
3efd7ab46d0aebc Mina Almasry   2024-09-10  728  {
170aafe35cb98e0 Mina Almasry   2024-09-10  729  	struct nlattr *tb[ARRAY_SIZE(netdev_queue_id_nl_policy)];
170aafe35cb98e0 Mina Almasry   2024-09-10  730  	struct net_devmem_dmabuf_binding *binding;
170aafe35cb98e0 Mina Almasry   2024-09-10  731  	struct list_head *sock_binding_list;
170aafe35cb98e0 Mina Almasry   2024-09-10  732  	u32 ifindex, dmabuf_fd, rxq_idx;
170aafe35cb98e0 Mina Almasry   2024-09-10  733  	struct net_device *netdev;
170aafe35cb98e0 Mina Almasry   2024-09-10  734  	struct sk_buff *rsp;
170aafe35cb98e0 Mina Almasry   2024-09-10  735  	struct nlattr *attr;
170aafe35cb98e0 Mina Almasry   2024-09-10  736  	int rem, err = 0;
170aafe35cb98e0 Mina Almasry   2024-09-10  737  	void *hdr;
170aafe35cb98e0 Mina Almasry   2024-09-10  738  
170aafe35cb98e0 Mina Almasry   2024-09-10  739  	if (GENL_REQ_ATTR_CHECK(info, NETDEV_A_DEV_IFINDEX) ||
170aafe35cb98e0 Mina Almasry   2024-09-10  740  	    GENL_REQ_ATTR_CHECK(info, NETDEV_A_DMABUF_FD) ||
170aafe35cb98e0 Mina Almasry   2024-09-10  741  	    GENL_REQ_ATTR_CHECK(info, NETDEV_A_DMABUF_QUEUES))
170aafe35cb98e0 Mina Almasry   2024-09-10  742  		return -EINVAL;
170aafe35cb98e0 Mina Almasry   2024-09-10  743  
170aafe35cb98e0 Mina Almasry   2024-09-10  744  	ifindex = nla_get_u32(info->attrs[NETDEV_A_DEV_IFINDEX]);
170aafe35cb98e0 Mina Almasry   2024-09-10  745  	dmabuf_fd = nla_get_u32(info->attrs[NETDEV_A_DMABUF_FD]);
170aafe35cb98e0 Mina Almasry   2024-09-10  746  
170aafe35cb98e0 Mina Almasry   2024-09-10  747  	sock_binding_list = genl_sk_priv_get(&netdev_nl_family,
170aafe35cb98e0 Mina Almasry   2024-09-10  748  					     NETLINK_CB(skb).sk);
170aafe35cb98e0 Mina Almasry   2024-09-10  749  	if (IS_ERR(sock_binding_list))
170aafe35cb98e0 Mina Almasry   2024-09-10  750  		return PTR_ERR(sock_binding_list);
170aafe35cb98e0 Mina Almasry   2024-09-10  751  
170aafe35cb98e0 Mina Almasry   2024-09-10  752  	rsp = genlmsg_new(GENLMSG_DEFAULT_SIZE, GFP_KERNEL);
170aafe35cb98e0 Mina Almasry   2024-09-10  753  	if (!rsp)
170aafe35cb98e0 Mina Almasry   2024-09-10  754  		return -ENOMEM;
170aafe35cb98e0 Mina Almasry   2024-09-10  755  
170aafe35cb98e0 Mina Almasry   2024-09-10  756  	hdr = genlmsg_iput(rsp, info);
170aafe35cb98e0 Mina Almasry   2024-09-10  757  	if (!hdr) {
170aafe35cb98e0 Mina Almasry   2024-09-10  758  		err = -EMSGSIZE;
170aafe35cb98e0 Mina Almasry   2024-09-10  759  		goto err_genlmsg_free;
170aafe35cb98e0 Mina Almasry   2024-09-10  760  	}
170aafe35cb98e0 Mina Almasry   2024-09-10  761  
170aafe35cb98e0 Mina Almasry   2024-09-10  762  	rtnl_lock();
170aafe35cb98e0 Mina Almasry   2024-09-10  763  
170aafe35cb98e0 Mina Almasry   2024-09-10  764  	netdev = __dev_get_by_index(genl_info_net(info), ifindex);
170aafe35cb98e0 Mina Almasry   2024-09-10  765  	if (!netdev || !netif_device_present(netdev)) {
170aafe35cb98e0 Mina Almasry   2024-09-10  766  		err = -ENODEV;
170aafe35cb98e0 Mina Almasry   2024-09-10  767  		goto err_unlock;
170aafe35cb98e0 Mina Almasry   2024-09-10  768  	}
170aafe35cb98e0 Mina Almasry   2024-09-10  769  
170aafe35cb98e0 Mina Almasry   2024-09-10  770  	if (dev_xdp_prog_count(netdev)) {
170aafe35cb98e0 Mina Almasry   2024-09-10  771  		NL_SET_ERR_MSG(info->extack, "unable to bind dmabuf to device with XDP program attached");
170aafe35cb98e0 Mina Almasry   2024-09-10  772  		err = -EEXIST;
170aafe35cb98e0 Mina Almasry   2024-09-10  773  		goto err_unlock;
170aafe35cb98e0 Mina Almasry   2024-09-10  774  	}
170aafe35cb98e0 Mina Almasry   2024-09-10  775  
170aafe35cb98e0 Mina Almasry   2024-09-10  776  	binding = net_devmem_bind_dmabuf(netdev, dmabuf_fd, info->extack);
170aafe35cb98e0 Mina Almasry   2024-09-10  777  	if (IS_ERR(binding)) {
170aafe35cb98e0 Mina Almasry   2024-09-10 @778  		err = PTR_ERR(binding);
170aafe35cb98e0 Mina Almasry   2024-09-10  779  		goto err_unlock;
170aafe35cb98e0 Mina Almasry   2024-09-10  780  	}
170aafe35cb98e0 Mina Almasry   2024-09-10  781  
170aafe35cb98e0 Mina Almasry   2024-09-10  782  	nla_for_each_attr_type(attr, NETDEV_A_DMABUF_QUEUES,
170aafe35cb98e0 Mina Almasry   2024-09-10  783  			       genlmsg_data(info->genlhdr),
170aafe35cb98e0 Mina Almasry   2024-09-10  784  			       genlmsg_len(info->genlhdr), rem) {
170aafe35cb98e0 Mina Almasry   2024-09-10  785  		err = nla_parse_nested(
170aafe35cb98e0 Mina Almasry   2024-09-10  786  			tb, ARRAY_SIZE(netdev_queue_id_nl_policy) - 1, attr,
170aafe35cb98e0 Mina Almasry   2024-09-10  787  			netdev_queue_id_nl_policy, info->extack);
170aafe35cb98e0 Mina Almasry   2024-09-10  788  		if (err < 0)
170aafe35cb98e0 Mina Almasry   2024-09-10  789  			goto err_unbind;
170aafe35cb98e0 Mina Almasry   2024-09-10  790  
170aafe35cb98e0 Mina Almasry   2024-09-10  791  		if (NL_REQ_ATTR_CHECK(info->extack, attr, tb, NETDEV_A_QUEUE_ID) ||
170aafe35cb98e0 Mina Almasry   2024-09-10  792  		    NL_REQ_ATTR_CHECK(info->extack, attr, tb, NETDEV_A_QUEUE_TYPE)) {
170aafe35cb98e0 Mina Almasry   2024-09-10  793  			err = -EINVAL;
170aafe35cb98e0 Mina Almasry   2024-09-10  794  			goto err_unbind;
170aafe35cb98e0 Mina Almasry   2024-09-10  795  		}
170aafe35cb98e0 Mina Almasry   2024-09-10  796  
170aafe35cb98e0 Mina Almasry   2024-09-10  797  		if (nla_get_u32(tb[NETDEV_A_QUEUE_TYPE]) != NETDEV_QUEUE_TYPE_RX) {
170aafe35cb98e0 Mina Almasry   2024-09-10  798  			NL_SET_BAD_ATTR(info->extack, tb[NETDEV_A_QUEUE_TYPE]);
170aafe35cb98e0 Mina Almasry   2024-09-10  799  			err = -EINVAL;
170aafe35cb98e0 Mina Almasry   2024-09-10  800  			goto err_unbind;
170aafe35cb98e0 Mina Almasry   2024-09-10  801  		}
170aafe35cb98e0 Mina Almasry   2024-09-10  802  
170aafe35cb98e0 Mina Almasry   2024-09-10  803  		rxq_idx = nla_get_u32(tb[NETDEV_A_QUEUE_ID]);
170aafe35cb98e0 Mina Almasry   2024-09-10  804  
170aafe35cb98e0 Mina Almasry   2024-09-10  805  		err = net_devmem_bind_dmabuf_to_queue(netdev, rxq_idx, binding,
170aafe35cb98e0 Mina Almasry   2024-09-10  806  						      info->extack);
170aafe35cb98e0 Mina Almasry   2024-09-10  807  		if (err)
170aafe35cb98e0 Mina Almasry   2024-09-10  808  			goto err_unbind;
170aafe35cb98e0 Mina Almasry   2024-09-10  809  	}
170aafe35cb98e0 Mina Almasry   2024-09-10  810  
170aafe35cb98e0 Mina Almasry   2024-09-10  811  	list_add(&binding->list, sock_binding_list);
170aafe35cb98e0 Mina Almasry   2024-09-10  812  
170aafe35cb98e0 Mina Almasry   2024-09-10  813  	nla_put_u32(rsp, NETDEV_A_DMABUF_ID, binding->id);
170aafe35cb98e0 Mina Almasry   2024-09-10  814  	genlmsg_end(rsp, hdr);
170aafe35cb98e0 Mina Almasry   2024-09-10  815  
170aafe35cb98e0 Mina Almasry   2024-09-10  816  	err = genlmsg_reply(rsp, info);
170aafe35cb98e0 Mina Almasry   2024-09-10  817  	if (err)
170aafe35cb98e0 Mina Almasry   2024-09-10  818  		goto err_unbind;
170aafe35cb98e0 Mina Almasry   2024-09-10  819  
170aafe35cb98e0 Mina Almasry   2024-09-10  820  	rtnl_unlock();
170aafe35cb98e0 Mina Almasry   2024-09-10  821  
3efd7ab46d0aebc Mina Almasry   2024-09-10  822  	return 0;
170aafe35cb98e0 Mina Almasry   2024-09-10  823  
170aafe35cb98e0 Mina Almasry   2024-09-10  824  err_unbind:
170aafe35cb98e0 Mina Almasry   2024-09-10  825  	net_devmem_unbind_dmabuf(binding);
170aafe35cb98e0 Mina Almasry   2024-09-10  826  err_unlock:
170aafe35cb98e0 Mina Almasry   2024-09-10  827  	rtnl_unlock();
170aafe35cb98e0 Mina Almasry   2024-09-10  828  err_genlmsg_free:
170aafe35cb98e0 Mina Almasry   2024-09-10  829  	nlmsg_free(rsp);
170aafe35cb98e0 Mina Almasry   2024-09-10  830  	return err;
170aafe35cb98e0 Mina Almasry   2024-09-10  831  }
170aafe35cb98e0 Mina Almasry   2024-09-10  832  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
