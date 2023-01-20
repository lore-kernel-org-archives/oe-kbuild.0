Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0B8198
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Jan 2023 03:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674184058; x=1705720058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NGqbHVwN92V+tqTMbzpW1v0rOu4BEdKxzbM5jnPCTe8=;
  b=CiE6cOTyRq41sLT6PoHlfmisGmUuLJuzlDMjf6u2tgbE4tOYj0jwKjlZ
   OtgVgbkiaKzTFPkq64Rq97wsvJZ8xDdG8tBbjBYOErVj3IceK8+SMRa+a
   o4MeTTF/pklHWmNE9awl6sDa7ATkWHymYWeIJXQ83o9AFVkNlrtXFVQJO
   arSuo96ovj85sd9Q7HJoZ01FrFED69hIkKbp7J+vJPkmIhZZ1X+Ct28z3
   DBQHOznD7B9ETSK02UNun8SkczttiR2+TNZJDAIPd+Dv8ppxgdJcRhrmw
   8DB/fZDwxpntINb/2+4QkbuG2s520iJU3xwAr16QNoyvBTBEXi3tI8+yZ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="325532774"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="325532774"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 19:07:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="749216969"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="749216969"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Jan 2023 19:07:36 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIhke-00027W-0x;
	Fri, 20 Jan 2023 03:07:36 +0000
Date: Fri, 20 Jan 2023 11:07:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/netfilter/nf_tables_api.c:9669 nft_verdict_init() warn: passing
 a valid pointer to 'PTR_ERR'
Message-ID: <202301201047.RxSpWL5a-lkp@intel.com>
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
TO: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
CC: Pablo Neira Ayuso <pablo@netfilter.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d368967cb1039b5c4cccb62b5a4b9468c50cd143
commit: 95f466d22364a33d183509629d0879885b4f547e netfilter: nf_tables: do not allow CHAIN_ID to refer to another table
date:   5 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 months ago
config: csky-randconfig-m041-20230119 (https://download.01.org/0day-ci/archive/20230120/202301201047.RxSpWL5a-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
net/netfilter/nf_tables_api.c:9669 nft_verdict_init() warn: passing a valid pointer to 'PTR_ERR'

Old smatch warnings:
net/netfilter/nf_tables_api.c:2526 nf_tables_newchain() warn: passing a valid pointer to 'PTR_ERR'
net/netfilter/nf_tables_api.c:3425 nf_tables_newrule() warn: passing a valid pointer to 'PTR_ERR'
net/netfilter/nf_tables_api.c:3436 nf_tables_newrule() warn: passing a valid pointer to 'PTR_ERR'
net/netfilter/nf_tables_api.c:3461 nf_tables_newrule() warn: passing a valid pointer to 'PTR_ERR'
net/netfilter/nf_tables_api.c:4242 nf_tables_getset() warn: passing a valid pointer to 'PTR_ERR'
net/netfilter/nf_tables_api.c:4468 nf_tables_newset() warn: passing a valid pointer to 'PTR_ERR'
net/netfilter/nf_tables_api.c:4670 nf_tables_delset() warn: passing a valid pointer to 'PTR_ERR'
net/netfilter/nf_tables_api.c:5363 nf_tables_getsetelem() warn: passing a valid pointer to 'PTR_ERR'
net/netfilter/nf_tables_api.c:6514 nf_tables_delsetelem() warn: passing a valid pointer to 'PTR_ERR'
net/netfilter/nf_tables_api.c:6843 nf_tables_newobj() warn: passing a valid pointer to 'PTR_ERR'
net/netfilter/nf_tables_api.c:7612 nf_tables_newflowtable() warn: passing a valid pointer to 'PTR_ERR'
net/netfilter/nf_tables_api.c:7646 nf_tables_newflowtable() warn: passing a valid pointer to 'PTR_ERR'
net/netfilter/nf_tables_api.c:7800 nf_tables_delflowtable() warn: passing a valid pointer to 'PTR_ERR'
net/netfilter/nf_tables_api.c:7994 nf_tables_getflowtable() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +9669 net/netfilter/nf_tables_api.c

20a69341f2d00c Patrick McHardy               2013-10-11  9626  
20a69341f2d00c Patrick McHardy               2013-10-11  9627  static int nft_verdict_init(const struct nft_ctx *ctx, struct nft_data *data,
20a69341f2d00c Patrick McHardy               2013-10-11  9628  			    struct nft_data_desc *desc, const struct nlattr *nla)
20a69341f2d00c Patrick McHardy               2013-10-11  9629  {
664b0f8cd8c66d Pablo Neira Ayuso             2016-06-12  9630  	u8 genmask = nft_genmask_next(ctx->net);
20a69341f2d00c Patrick McHardy               2013-10-11  9631  	struct nlattr *tb[NFTA_VERDICT_MAX + 1];
20a69341f2d00c Patrick McHardy               2013-10-11  9632  	struct nft_chain *chain;
20a69341f2d00c Patrick McHardy               2013-10-11  9633  	int err;
20a69341f2d00c Patrick McHardy               2013-10-11  9634  
8cb081746c031f Johannes Berg                 2019-04-26  9635  	err = nla_parse_nested_deprecated(tb, NFTA_VERDICT_MAX, nla,
8cb081746c031f Johannes Berg                 2019-04-26  9636  					  nft_verdict_policy, NULL);
20a69341f2d00c Patrick McHardy               2013-10-11  9637  	if (err < 0)
20a69341f2d00c Patrick McHardy               2013-10-11  9638  		return err;
20a69341f2d00c Patrick McHardy               2013-10-11  9639  
20a69341f2d00c Patrick McHardy               2013-10-11  9640  	if (!tb[NFTA_VERDICT_CODE])
20a69341f2d00c Patrick McHardy               2013-10-11  9641  		return -EINVAL;
1ca2e1702c050a Patrick McHardy               2015-04-11  9642  	data->verdict.code = ntohl(nla_get_be32(tb[NFTA_VERDICT_CODE]));
20a69341f2d00c Patrick McHardy               2013-10-11  9643  
1ca2e1702c050a Patrick McHardy               2015-04-11  9644  	switch (data->verdict.code) {
e0abdadcc6e113 Patrick McHardy               2014-02-18  9645  	default:
1ca2e1702c050a Patrick McHardy               2015-04-11  9646  		switch (data->verdict.code & NF_VERDICT_MASK) {
20a69341f2d00c Patrick McHardy               2013-10-11  9647  		case NF_ACCEPT:
20a69341f2d00c Patrick McHardy               2013-10-11  9648  		case NF_DROP:
20a69341f2d00c Patrick McHardy               2013-10-11  9649  		case NF_QUEUE:
e0abdadcc6e113 Patrick McHardy               2014-02-18  9650  			break;
e0abdadcc6e113 Patrick McHardy               2014-02-18  9651  		default:
e0abdadcc6e113 Patrick McHardy               2014-02-18  9652  			return -EINVAL;
e0abdadcc6e113 Patrick McHardy               2014-02-18  9653  		}
954d82979b2f9d Gustavo A. R. Silva           2020-07-08  9654  		fallthrough;
20a69341f2d00c Patrick McHardy               2013-10-11  9655  	case NFT_CONTINUE:
20a69341f2d00c Patrick McHardy               2013-10-11  9656  	case NFT_BREAK:
20a69341f2d00c Patrick McHardy               2013-10-11  9657  	case NFT_RETURN:
20a69341f2d00c Patrick McHardy               2013-10-11  9658  		break;
20a69341f2d00c Patrick McHardy               2013-10-11  9659  	case NFT_JUMP:
20a69341f2d00c Patrick McHardy               2013-10-11  9660  	case NFT_GOTO:
51d70f181ff4e2 Pablo Neira Ayuso             2020-06-30  9661  		if (tb[NFTA_VERDICT_CHAIN]) {
f102d66b335a41 Florian Westphal              2018-07-11  9662  			chain = nft_chain_lookup(ctx->net, ctx->table,
51d70f181ff4e2 Pablo Neira Ayuso             2020-06-30  9663  						 tb[NFTA_VERDICT_CHAIN],
51d70f181ff4e2 Pablo Neira Ayuso             2020-06-30  9664  						 genmask);
51d70f181ff4e2 Pablo Neira Ayuso             2020-06-30  9665  		} else if (tb[NFTA_VERDICT_CHAIN_ID]) {
95f466d22364a3 Thadeu Lima de Souza Cascardo 2022-08-09  9666  			chain = nft_chain_lookup_byid(ctx->net, ctx->table,
51d70f181ff4e2 Pablo Neira Ayuso             2020-06-30  9667  						      tb[NFTA_VERDICT_CHAIN_ID]);
51d70f181ff4e2 Pablo Neira Ayuso             2020-06-30  9668  			if (IS_ERR(chain))
51d70f181ff4e2 Pablo Neira Ayuso             2020-06-30 @9669  				return PTR_ERR(chain);
51d70f181ff4e2 Pablo Neira Ayuso             2020-06-30  9670  		} else {
51d70f181ff4e2 Pablo Neira Ayuso             2020-06-30  9671  			return -EINVAL;
51d70f181ff4e2 Pablo Neira Ayuso             2020-06-30  9672  		}
51d70f181ff4e2 Pablo Neira Ayuso             2020-06-30  9673  
20a69341f2d00c Patrick McHardy               2013-10-11  9674  		if (IS_ERR(chain))
20a69341f2d00c Patrick McHardy               2013-10-11  9675  			return PTR_ERR(chain);
f323d9546927a0 Pablo Neira Ayuso             2017-03-20  9676  		if (nft_is_base_chain(chain))
20a69341f2d00c Patrick McHardy               2013-10-11  9677  			return -EOPNOTSUPP;
96518518cc417b Patrick McHardy               2013-10-14  9678  
96518518cc417b Patrick McHardy               2013-10-14  9679  		chain->use++;
1ca2e1702c050a Patrick McHardy               2015-04-11  9680  		data->verdict.chain = chain;
96518518cc417b Patrick McHardy               2013-10-14  9681  		break;
96518518cc417b Patrick McHardy               2013-10-14  9682  	}
96518518cc417b Patrick McHardy               2013-10-14  9683  
4c4ed0748f82e2 Florian Westphal              2015-04-14  9684  	desc->len = sizeof(data->verdict);
96518518cc417b Patrick McHardy               2013-10-14  9685  	desc->type = NFT_DATA_VERDICT;
96518518cc417b Patrick McHardy               2013-10-14  9686  	return 0;
96518518cc417b Patrick McHardy               2013-10-14  9687  }
96518518cc417b Patrick McHardy               2013-10-14  9688  

:::::: The code at line 9669 was first introduced by commit
:::::: 51d70f181ff4e2c996ddf256af1efecd7d5864e5 netfilter: nf_tables: add NFTA_VERDICT_CHAIN_ID attribute

:::::: TO: Pablo Neira Ayuso <pablo@netfilter.org>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
