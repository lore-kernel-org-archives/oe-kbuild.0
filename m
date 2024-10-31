Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0591946BC
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Oct 2024 23:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730417519; cv=none; b=kxHKds1Bvu8GXnX1xUWcIwFfAfxTcP7Z7N9imyQXrDsQkaquu90ecDqrojbd2U9a+7N5w/tQEiwpiKDltvl3TjnYVyvtX/GZRt1wpKJN9cCzlGxbAXQH36r8A4egoA8Kt0j8jsmYV3UAQCUVVBDx/m9V4zgPjp3vbYDpOk7Eymw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730417519; c=relaxed/simple;
	bh=fynFVLnPRzoJmCPm/lP3wr8H2A8wZbUVi955Q+kf3/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=loBedWGNrty93y0GLqIU3Q1oQ6ROe12tftJTNg/52T6p3cNP2xwkTqCQnjZDNuahSuFmcey/rKWKelvV70P2yAVaVzrZeCh/J8rHuFJoaiw9lc4Izp5cM5SvCygjHgZVCr/GvegRf+mxEvQJlZIv5rHV676mnsB9FzcsvQESqWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i2bxqIlN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i2bxqIlN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730417512; x=1761953512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fynFVLnPRzoJmCPm/lP3wr8H2A8wZbUVi955Q+kf3/A=;
  b=i2bxqIlNxHtwC+Vcyf55FtCj6s4Fl8mkzW9IW+vT9Zt6/jt2eZitWxTJ
   VXZClZWaJAiwvN8Mk5/P24Fh/oRs9hcfolp2NKHriPgDDAkGc3Spe4UhM
   N7JD1Ah/e/UMFbVMeA2guxleZ/vzy6j3lu7/ohFSJerbKiHPppi8IVDHf
   rVK6AMUAtif6gD6Mbu4MpDQ9/HfZExC2VQtWkuW9KhEzXEgd8YclHPGB4
   MalfODHEbWNTSa7n6BUoR0bs5/iCJp8RS/yw5fZlVWXhUDwpcu6mfZ55W
   RTk8fOMxG238wLGs+zRDEUGSrX4XUPy/bS7PvcfVKvy1BHsWK+CW3F6/P
   Q==;
X-CSE-ConnectionGUID: 5cSrswDgQQOf2KkoDgXjYg==
X-CSE-MsgGUID: Ke4UAKU0QdCC/U4kNZt5kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="29603299"
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="29603299"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 16:31:52 -0700
X-CSE-ConnectionGUID: g7rijA1CSNuWbyVaoOomzw==
X-CSE-MsgGUID: +CCHeYajSZiFb5HW4ss5nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="113574684"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Oct 2024 16:31:51 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6edo-000gpO-1M;
	Thu, 31 Oct 2024 23:31:48 +0000
Date: Fri, 1 Nov 2024 07:31:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 nf-next 7/7] netfilter: nf_tables: must hold rcu read
 lock while iterating object type list
Message-ID: <202411010754.SLk5GvT6-lkp@intel.com>
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
In-Reply-To: <20241030094053.13118-8-fw@strlen.de>
References: <20241030094053.13118-8-fw@strlen.de>
TO: Florian Westphal <fw@strlen.de>
TO: netfilter-devel@vger.kernel.org
CC: Florian Westphal <fw@strlen.de>

Hi Florian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on netfilter-nf/main]
[also build test WARNING on linus/master v6.12-rc5 next-20241031]
[cannot apply to nf-next/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Westphal/netfilter-nf_tables-avoid-false-positive-lockdep-splat-on-rule-deletion/20241030-174657
base:   https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git main
patch link:    https://lore.kernel.org/r/20241030094053.13118-8-fw%40strlen.de
patch subject: [PATCH v2 nf-next 7/7] netfilter: nf_tables: must hold rcu read lock while iterating object type list
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: s390-randconfig-r073-20241031 (https://download.01.org/0day-ci/archive/20241101/202411010754.SLk5GvT6-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411010754.SLk5GvT6-lkp@intel.com/

New smatch warnings:
net/netfilter/nf_tables_api.c:7886 nf_tables_newobj() warn: 'type' is an error pointer or valid

Old smatch warnings:
net/netfilter/nf_tables_api.c:7208 nft_add_set_elem() warn: missing error code 'err'

vim +/type +7886 net/netfilter/nf_tables_api.c

d62d0ba97b58031 Fernando Fernandez Mancera 2019-08-26  7839  
7dab8ee3b6e7ec8 Pablo Neira Ayuso          2021-04-23  7840  static int nf_tables_newobj(struct sk_buff *skb, const struct nfnl_info *info,
7dab8ee3b6e7ec8 Pablo Neira Ayuso          2021-04-23  7841  			    const struct nlattr * const nla[])
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7842  {
7dab8ee3b6e7ec8 Pablo Neira Ayuso          2021-04-23  7843  	struct netlink_ext_ack *extack = info->extack;
7dab8ee3b6e7ec8 Pablo Neira Ayuso          2021-04-23  7844  	u8 genmask = nft_genmask_next(info->net);
ef4b65e53cc77e2 Pablo Neira Ayuso          2021-05-31  7845  	u8 family = info->nfmsg->nfgen_family;
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7846  	const struct nft_object_type *type;
7dab8ee3b6e7ec8 Pablo Neira Ayuso          2021-04-23  7847  	struct net *net = info->net;
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7848  	struct nft_table *table;
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7849  	struct nft_object *obj;
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7850  	struct nft_ctx ctx;
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7851  	u32 objtype;
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7852  	int err;
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7853  
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7854  	if (!nla[NFTA_OBJ_TYPE] ||
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7855  	    !nla[NFTA_OBJ_NAME] ||
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7856  	    !nla[NFTA_OBJ_DATA])
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7857  		return -EINVAL;
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7858  
6001a930ce0378b Pablo Neira Ayuso          2021-02-15  7859  	table = nft_table_lookup(net, nla[NFTA_OBJ_TABLE], family, genmask,
6001a930ce0378b Pablo Neira Ayuso          2021-02-15  7860  				 NETLINK_CB(skb).portid);
36dd1bcc07e5294 Pablo Neira Ayuso          2018-03-28  7861  	if (IS_ERR(table)) {
36dd1bcc07e5294 Pablo Neira Ayuso          2018-03-28  7862  		NL_SET_BAD_ATTR(extack, nla[NFTA_OBJ_TABLE]);
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7863  		return PTR_ERR(table);
36dd1bcc07e5294 Pablo Neira Ayuso          2018-03-28  7864  	}
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7865  
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7866  	objtype = ntohl(nla_get_be32(nla[NFTA_OBJ_TYPE]));
4d44175aa5bb5f6 Florian Westphal           2019-01-08  7867  	obj = nft_obj_lookup(net, table, nla[NFTA_OBJ_NAME], objtype, genmask);
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7868  	if (IS_ERR(obj)) {
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7869  		err = PTR_ERR(obj);
36dd1bcc07e5294 Pablo Neira Ayuso          2018-03-28  7870  		if (err != -ENOENT) {
36dd1bcc07e5294 Pablo Neira Ayuso          2018-03-28  7871  			NL_SET_BAD_ATTR(extack, nla[NFTA_OBJ_NAME]);
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7872  			return err;
36dd1bcc07e5294 Pablo Neira Ayuso          2018-03-28  7873  		}
1a28ad74ebd8f9d Gao Feng                   2017-01-16  7874  	} else {
7dab8ee3b6e7ec8 Pablo Neira Ayuso          2021-04-23  7875  		if (info->nlh->nlmsg_flags & NLM_F_EXCL) {
36dd1bcc07e5294 Pablo Neira Ayuso          2018-03-28  7876  			NL_SET_BAD_ATTR(extack, nla[NFTA_OBJ_NAME]);
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7877  			return -EEXIST;
36dd1bcc07e5294 Pablo Neira Ayuso          2018-03-28  7878  		}
7dab8ee3b6e7ec8 Pablo Neira Ayuso          2021-04-23  7879  		if (info->nlh->nlmsg_flags & NLM_F_REPLACE)
d62d0ba97b58031 Fernando Fernandez Mancera 2019-08-26  7880  			return -EOPNOTSUPP;
d62d0ba97b58031 Fernando Fernandez Mancera 2019-08-26  7881  
84b1a0c0140a9a9 Pablo Neira Ayuso          2024-03-05  7882  		if (!obj->ops->update)
84b1a0c0140a9a9 Pablo Neira Ayuso          2024-03-05  7883  			return 0;
84b1a0c0140a9a9 Pablo Neira Ayuso          2024-03-05  7884  
2a7dbf052c3b79b Florian Westphal           2024-10-30  7885  		type = nft_obj_type_get(net, objtype, family);
2a7dbf052c3b79b Florian Westphal           2024-10-30 @7886  		if (WARN_ON_ONCE(!type))
2a7dbf052c3b79b Florian Westphal           2024-10-30  7887  			return -ENOENT;
2a7dbf052c3b79b Florian Westphal           2024-10-30  7888  
7dab8ee3b6e7ec8 Pablo Neira Ayuso          2021-04-23  7889  		nft_ctx_init(&ctx, net, skb, info->nlh, family, table, NULL, nla);
d62d0ba97b58031 Fernando Fernandez Mancera 2019-08-26  7890  
2a7dbf052c3b79b Florian Westphal           2024-10-30  7891  		/* type->owner reference is put when transaction object is released. */
d62d0ba97b58031 Fernando Fernandez Mancera 2019-08-26  7892  		return nf_tables_updobj(&ctx, type, nla[NFTA_OBJ_DATA], obj);
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7893  	}
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7894  
7dab8ee3b6e7ec8 Pablo Neira Ayuso          2021-04-23  7895  	nft_ctx_init(&ctx, net, skb, info->nlh, family, table, NULL, nla);
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7896  
1689f25924ada8f Pablo Neira Ayuso          2023-06-28  7897  	if (!nft_use_inc(&table->use))
1689f25924ada8f Pablo Neira Ayuso          2023-06-28  7898  		return -EMFILE;
1689f25924ada8f Pablo Neira Ayuso          2023-06-28  7899  
776d451648443f9 Pablo Neira Ayuso          2024-01-23  7900  	type = nft_obj_type_get(net, objtype, family);
1689f25924ada8f Pablo Neira Ayuso          2023-06-28  7901  	if (IS_ERR(type)) {
1689f25924ada8f Pablo Neira Ayuso          2023-06-28  7902  		err = PTR_ERR(type);
1689f25924ada8f Pablo Neira Ayuso          2023-06-28  7903  		goto err_type;
1689f25924ada8f Pablo Neira Ayuso          2023-06-28  7904  	}
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7905  
84fba05511c8e0e Florian Westphal           2017-03-08  7906  	obj = nft_obj_init(&ctx, type, nla[NFTA_OBJ_DATA]);
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7907  	if (IS_ERR(obj)) {
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7908  		err = PTR_ERR(obj);
b131c96496b369c Jose M. Guisado Gomez      2020-09-08  7909  		goto err_init;
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7910  	}
d152159b8911884 Florian Westphal           2019-01-08  7911  	obj->key.table = table;
3ecbfd65f50e5ff Harsha Sharma              2017-12-27  7912  	obj->handle = nf_tables_alloc_handle(table);
3ecbfd65f50e5ff Harsha Sharma              2017-12-27  7913  
33758c891479ea1 Vasily Averin              2022-03-24  7914  	obj->key.name = nla_strdup(nla[NFTA_OBJ_NAME], GFP_KERNEL_ACCOUNT);
d152159b8911884 Florian Westphal           2019-01-08  7915  	if (!obj->key.name) {
615095752100748 Phil Sutter                2017-07-27  7916  		err = -ENOMEM;
b131c96496b369c Jose M. Guisado Gomez      2020-09-08  7917  		goto err_strdup;
b131c96496b369c Jose M. Guisado Gomez      2020-09-08  7918  	}
b131c96496b369c Jose M. Guisado Gomez      2020-09-08  7919  
b131c96496b369c Jose M. Guisado Gomez      2020-09-08  7920  	if (nla[NFTA_OBJ_USERDATA]) {
af0acf22aea359e Chen Aotian                2023-04-06  7921  		obj->udata = nla_memdup(nla[NFTA_OBJ_USERDATA], GFP_KERNEL_ACCOUNT);
b131c96496b369c Jose M. Guisado Gomez      2020-09-08  7922  		if (obj->udata == NULL)
b131c96496b369c Jose M. Guisado Gomez      2020-09-08  7923  			goto err_userdata;
b131c96496b369c Jose M. Guisado Gomez      2020-09-08  7924  
85db827a57a9311 Jose M. Guisado Gomez      2020-09-28  7925  		obj->udlen = nla_len(nla[NFTA_OBJ_USERDATA]);
615095752100748 Phil Sutter                2017-07-27  7926  	}
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7927  
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7928  	err = nft_trans_obj_add(&ctx, NFT_MSG_NEWOBJ, obj);
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7929  	if (err < 0)
b131c96496b369c Jose M. Guisado Gomez      2020-09-08  7930  		goto err_trans;
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7931  
4d44175aa5bb5f6 Florian Westphal           2019-01-08  7932  	err = rhltable_insert(&nft_objname_ht, &obj->rhlhead,
4d44175aa5bb5f6 Florian Westphal           2019-01-08  7933  			      nft_objname_ht_params);
4d44175aa5bb5f6 Florian Westphal           2019-01-08  7934  	if (err < 0)
b131c96496b369c Jose M. Guisado Gomez      2020-09-08  7935  		goto err_obj_ht;
4d44175aa5bb5f6 Florian Westphal           2019-01-08  7936  
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7937  	list_add_tail_rcu(&obj->list, &table->objects);
1689f25924ada8f Pablo Neira Ayuso          2023-06-28  7938  
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7939  	return 0;
b131c96496b369c Jose M. Guisado Gomez      2020-09-08  7940  err_obj_ht:
4d44175aa5bb5f6 Florian Westphal           2019-01-08  7941  	/* queued in transaction log */
4d44175aa5bb5f6 Florian Westphal           2019-01-08  7942  	INIT_LIST_HEAD(&obj->list);
4d44175aa5bb5f6 Florian Westphal           2019-01-08  7943  	return err;
b131c96496b369c Jose M. Guisado Gomez      2020-09-08  7944  err_trans:
b131c96496b369c Jose M. Guisado Gomez      2020-09-08  7945  	kfree(obj->udata);
85dfd816fabfc16 Pablo Neira Ayuso          2021-05-05  7946  err_userdata:
85dfd816fabfc16 Pablo Neira Ayuso          2021-05-05  7947  	kfree(obj->key.name);
b131c96496b369c Jose M. Guisado Gomez      2020-09-08  7948  err_strdup:
dfc46034b54af3a Pablo M. Bermudo Garay     2017-08-23  7949  	if (obj->ops->destroy)
00bfb3205e62970 Pablo Neira Ayuso          2018-06-02  7950  		obj->ops->destroy(&ctx, obj);
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7951  	kfree(obj);
b131c96496b369c Jose M. Guisado Gomez      2020-09-08  7952  err_init:
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7953  	module_put(type->owner);
1689f25924ada8f Pablo Neira Ayuso          2023-06-28  7954  err_type:
1689f25924ada8f Pablo Neira Ayuso          2023-06-28  7955  	nft_use_dec_restore(&table->use);
1689f25924ada8f Pablo Neira Ayuso          2023-06-28  7956  
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7957  	return err;
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7958  }
e50092404c1bc7a Pablo Neira Ayuso          2016-11-28  7959  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
