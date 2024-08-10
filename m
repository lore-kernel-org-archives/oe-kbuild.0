Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA44A1366
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Aug 2024 23:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723330994; cv=none; b=dJImVquOrM+FqQ+2fcFCHLxzwTrS508MEaEWXlLINY49zRICIeP9aTbZAnYiQr70gDdY7A10dvj3AixOY/NLCTRoFAv8BCd6WMT86Qo05WA6suK0dYSAYtqGIg6hp1pS1q0fYeHP5jPQ+GHXQGrrhhOjrmfqZs2pPqXvSkJZF4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723330994; c=relaxed/simple;
	bh=IDMrOwMZO0N0gCc2MHivpKtTcp8TZxZeOuaisnc7YDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hxfWyNLY9gzOymxw4f8XKxJJ439OJ8HWZx1YnDVi7IaZwelx+matzcs195UTSaeKgegjcIMVifk5XJwk9MjejqFtz1VdiqwXVpobw3WkwkAU0q02w2fkAm7qQUu1vhtI8FjC//g4NgScCkqiRfRyZk0249Q3uN0J8PqOP/MWlCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HAHff5Cw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HAHff5Cw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723330991; x=1754866991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IDMrOwMZO0N0gCc2MHivpKtTcp8TZxZeOuaisnc7YDY=;
  b=HAHff5Cwu6paxsiOXAdcwuhQJ3BH26DDcJzOaB8rjfj6RSoeVXlH35W+
   //0eHc7d8DMq5RPo3kzmut5pmJFnozVB6DIh2l1iICVShpMARW2730h2r
   NWj7Y61a/2+xfV8rP3dgyaAx+wJmQAq76uUs+LxBGuHb5oJufkyocdbjM
   417OhUx3rTI/iUoDeS7/LFaf0KB4BZqmPATl9+FY15lp/gntB7zfnjyMw
   wGoe+oGrOryn9qJqk/QOH1ojnwPP6cZa3gp1JNVPWSMB7Tc5YXRouLXsN
   jQ3Tm5kLGHOr/zzHGKj4I/MusbDI0mHbl90QPY8N6H20riEhs2O2ZpXtG
   Q==;
X-CSE-ConnectionGUID: gK6rdmMdSWKG4DdafWOxKg==
X-CSE-MsgGUID: SC48WM9pTeeXeour+/3sFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="32868189"
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="32868189"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 16:03:10 -0700
X-CSE-ConnectionGUID: H9rlPqVjQ3qdIVoBu2fhTA==
X-CSE-MsgGUID: A2ZQntzUThCE5vnw2SyBZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="62735197"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 10 Aug 2024 16:03:08 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scv6x-000ANT-2J;
	Sat, 10 Aug 2024 23:03:02 +0000
Date: Sun, 11 Aug 2024 07:02:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH nf-next 8/8] netfilter: nf_tables: set element timeout
 update support
Message-ID: <202408110605.gf5BzXdy-lkp@intel.com>
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
In-Reply-To: <20240807142357.90493-9-pablo@netfilter.org>
References: <20240807142357.90493-9-pablo@netfilter.org>
TO: Pablo Neira Ayuso <pablo@netfilter.org>
TO: netfilter-devel@vger.kernel.org

Hi Pablo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on netfilter-nf/main]
[also build test WARNING on linus/master v6.11-rc2 next-20240809]
[cannot apply to nf-next/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pablo-Neira-Ayuso/netfilter-nf_tables-elements-with-timeout-less-than-HZ-10-never-expire/20240807-222806
base:   https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git main
patch link:    https://lore.kernel.org/r/20240807142357.90493-9-pablo%40netfilter.org
patch subject: [PATCH nf-next 8/8] netfilter: nf_tables: set element timeout update support
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20240810 (https://download.01.org/0day-ci/archive/20240811/202408110605.gf5BzXdy-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408110605.gf5BzXdy-lkp@intel.com/

smatch warnings:
net/netfilter/nf_tables_api.c:7201 nft_add_set_elem() warn: missing error code 'err'

vim +/err +7201 net/netfilter/nf_tables_api.c

88cccd908d5139 Pablo Neira Ayuso    2022-08-12  6849  
60319eb1ca351a Pablo Neira Ayuso    2014-04-04  6850  static int nft_add_set_elem(struct nft_ctx *ctx, struct nft_set *set,
c016c7e45ddfa5 Pablo Neira Ayuso    2016-08-24  6851  			    const struct nlattr *attr, u32 nlmsg_flags)
20a69341f2d00c Patrick McHardy      2013-10-11  6852  {
8cfd9b0f8515e7 Pablo Neira Ayuso    2020-12-07  6853  	struct nft_expr *expr_array[NFT_SET_EXPR_MAX] = {};
20a69341f2d00c Patrick McHardy      2013-10-11  6854  	struct nlattr *nla[NFTA_SET_ELEM_MAX + 1];
8aeff920dcc9b3 Pablo Neira Ayuso    2016-11-28  6855  	u8 genmask = nft_genmask_next(ctx->net);
664899e85c1312 Pablo Neira Ayuso    2021-02-08  6856  	u32 flags = 0, size = 0, num_exprs = 0;
fe2811ebeb97a7 Patrick McHardy      2015-03-25  6857  	struct nft_set_ext_tmpl tmpl;
c016c7e45ddfa5 Pablo Neira Ayuso    2016-08-24  6858  	struct nft_set_ext *ext, *ext2;
20a69341f2d00c Patrick McHardy      2013-10-11  6859  	struct nft_set_elem elem;
20a69341f2d00c Patrick McHardy      2013-10-11  6860  	struct nft_set_binding *binding;
078996fcd657e6 Pablo Neira Ayuso    2023-10-18  6861  	struct nft_elem_priv *elem_priv;
8aeff920dcc9b3 Pablo Neira Ayuso    2016-11-28  6862  	struct nft_object *obj = NULL;
68e942e88add0a Patrick McHardy      2015-04-05  6863  	struct nft_userdata *udata;
20a1452c35425b Pablo Neira Ayuso    2020-01-22  6864  	struct nft_data_desc desc;
20a69341f2d00c Patrick McHardy      2013-10-11  6865  	enum nft_registers dreg;
60319eb1ca351a Pablo Neira Ayuso    2014-04-04  6866  	struct nft_trans *trans;
af016fdf193dc4 Pablo Neira Ayuso    2024-08-07  6867  	bool update = false;
79ebb5bb4e38a5 Laura Garcia Liebana 2019-06-18  6868  	u64 expiration;
078996fcd657e6 Pablo Neira Ayuso    2023-10-18  6869  	u64 timeout;
8cfd9b0f8515e7 Pablo Neira Ayuso    2020-12-07  6870  	int err, i;
68e942e88add0a Patrick McHardy      2015-04-05  6871  	u8 ulen;
20a69341f2d00c Patrick McHardy      2013-10-11  6872  
8cb081746c031f Johannes Berg        2019-04-26  6873  	err = nla_parse_nested_deprecated(nla, NFTA_SET_ELEM_MAX, attr,
fceb6435e85298 Johannes Berg        2017-04-12  6874  					  nft_set_elem_policy, NULL);
20a69341f2d00c Patrick McHardy      2013-10-11  6875  	if (err < 0)
20a69341f2d00c Patrick McHardy      2013-10-11  6876  		return err;
20a69341f2d00c Patrick McHardy      2013-10-11  6877  
fe2811ebeb97a7 Patrick McHardy      2015-03-25  6878  	nft_set_ext_prepare(&tmpl);
fe2811ebeb97a7 Patrick McHardy      2015-03-25  6879  
0e9091d6862f60 Pablo Neira Ayuso    2016-04-12  6880  	err = nft_setelem_parse_flags(set, nla[NFTA_SET_ELEM_FLAGS], &flags);
0e9091d6862f60 Pablo Neira Ayuso    2016-04-12  6881  	if (err < 0)
0e9091d6862f60 Pablo Neira Ayuso    2016-04-12  6882  		return err;
aaa31047a6d25d Pablo Neira Ayuso    2021-04-27  6883  
d4eb7e39929a3b Pablo Neira Ayuso    2023-04-17  6884  	if (((flags & NFT_SET_ELEM_CATCHALL) && nla[NFTA_SET_ELEM_KEY]) ||
d4eb7e39929a3b Pablo Neira Ayuso    2023-04-17  6885  	    (!(flags & NFT_SET_ELEM_CATCHALL) && !nla[NFTA_SET_ELEM_KEY]))
aaa31047a6d25d Pablo Neira Ayuso    2021-04-27  6886  		return -EINVAL;
aaa31047a6d25d Pablo Neira Ayuso    2021-04-27  6887  
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  6888  	if (flags != 0) {
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  6889  		err = nft_set_ext_add(&tmpl, NFT_SET_EXT_FLAGS);
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  6890  		if (err < 0)
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  6891  			return err;
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  6892  	}
20a69341f2d00c Patrick McHardy      2013-10-11  6893  
20a69341f2d00c Patrick McHardy      2013-10-11  6894  	if (set->flags & NFT_SET_MAP) {
20a69341f2d00c Patrick McHardy      2013-10-11  6895  		if (nla[NFTA_SET_ELEM_DATA] == NULL &&
fe2811ebeb97a7 Patrick McHardy      2015-03-25  6896  		    !(flags & NFT_SET_ELEM_INTERVAL_END))
20a69341f2d00c Patrick McHardy      2013-10-11  6897  			return -EINVAL;
20a69341f2d00c Patrick McHardy      2013-10-11  6898  	} else {
20a69341f2d00c Patrick McHardy      2013-10-11  6899  		if (nla[NFTA_SET_ELEM_DATA] != NULL)
20a69341f2d00c Patrick McHardy      2013-10-11  6900  			return -EINVAL;
20a69341f2d00c Patrick McHardy      2013-10-11  6901  	}
20a69341f2d00c Patrick McHardy      2013-10-11  6902  
5a2f3dc31811e9 Pablo Neira Ayuso    2022-08-12  6903  	if (set->flags & NFT_SET_OBJECT) {
5a2f3dc31811e9 Pablo Neira Ayuso    2022-08-12  6904  		if (!nla[NFTA_SET_ELEM_OBJREF] &&
5a2f3dc31811e9 Pablo Neira Ayuso    2022-08-12  6905  		    !(flags & NFT_SET_ELEM_INTERVAL_END))
5a2f3dc31811e9 Pablo Neira Ayuso    2022-08-12  6906  			return -EINVAL;
5a2f3dc31811e9 Pablo Neira Ayuso    2022-08-12  6907  	} else {
5a2f3dc31811e9 Pablo Neira Ayuso    2022-08-12  6908  		if (nla[NFTA_SET_ELEM_OBJREF])
5a2f3dc31811e9 Pablo Neira Ayuso    2022-08-12  6909  			return -EINVAL;
5a2f3dc31811e9 Pablo Neira Ayuso    2022-08-12  6910  	}
5a2f3dc31811e9 Pablo Neira Ayuso    2022-08-12  6911  
88cccd908d5139 Pablo Neira Ayuso    2022-08-12  6912  	if (!nft_setelem_valid_key_end(set, nla, flags))
88cccd908d5139 Pablo Neira Ayuso    2022-08-12  6913  		return -EINVAL;
88cccd908d5139 Pablo Neira Ayuso    2022-08-12  6914  
bffc124b6fe37d Pablo Neira Ayuso    2019-12-06  6915  	if ((flags & NFT_SET_ELEM_INTERVAL_END) &&
bffc124b6fe37d Pablo Neira Ayuso    2019-12-06  6916  	     (nla[NFTA_SET_ELEM_DATA] ||
bffc124b6fe37d Pablo Neira Ayuso    2019-12-06  6917  	      nla[NFTA_SET_ELEM_OBJREF] ||
bffc124b6fe37d Pablo Neira Ayuso    2019-12-06  6918  	      nla[NFTA_SET_ELEM_TIMEOUT] ||
bffc124b6fe37d Pablo Neira Ayuso    2019-12-06  6919  	      nla[NFTA_SET_ELEM_EXPIRATION] ||
bffc124b6fe37d Pablo Neira Ayuso    2019-12-06  6920  	      nla[NFTA_SET_ELEM_USERDATA] ||
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  6921  	      nla[NFTA_SET_ELEM_EXPR] ||
4963674c2e71fc Pablo Neira Ayuso    2022-08-09  6922  	      nla[NFTA_SET_ELEM_KEY_END] ||
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  6923  	      nla[NFTA_SET_ELEM_EXPRESSIONS]))
bffc124b6fe37d Pablo Neira Ayuso    2019-12-06  6924  		return -EINVAL;
bffc124b6fe37d Pablo Neira Ayuso    2019-12-06  6925  
c3e1b005ed1cc0 Patrick McHardy      2015-03-26  6926  	timeout = 0;
c3e1b005ed1cc0 Patrick McHardy      2015-03-26  6927  	if (nla[NFTA_SET_ELEM_TIMEOUT] != NULL) {
c3e1b005ed1cc0 Patrick McHardy      2015-03-26  6928  		if (!(set->flags & NFT_SET_TIMEOUT))
c3e1b005ed1cc0 Patrick McHardy      2015-03-26  6929  			return -EINVAL;
b6b5da9db51ef5 Pablo Neira Ayuso    2024-08-07  6930  
8e1102d5a1596d Florian Westphal     2018-04-16  6931  		err = nf_msecs_to_jiffies64(nla[NFTA_SET_ELEM_TIMEOUT],
b6b5da9db51ef5 Pablo Neira Ayuso    2024-08-07  6932  					    &timeout, true);
8e1102d5a1596d Florian Westphal     2018-04-16  6933  		if (err)
8e1102d5a1596d Florian Westphal     2018-04-16  6934  			return err;
33c7aba0b4ffd6 Pablo Neira Ayuso    2022-11-14  6935  	} else if (set->flags & NFT_SET_TIMEOUT &&
33c7aba0b4ffd6 Pablo Neira Ayuso    2022-11-14  6936  		   !(flags & NFT_SET_ELEM_INTERVAL_END)) {
5a03c6c3878828 Pablo Neira Ayuso    2024-08-07  6937  		timeout = set->timeout;
b6b5da9db51ef5 Pablo Neira Ayuso    2024-08-07  6938  		if (timeout == 0)
b6b5da9db51ef5 Pablo Neira Ayuso    2024-08-07  6939  			timeout = NFT_NEVER_EXPIRES;
c3e1b005ed1cc0 Patrick McHardy      2015-03-26  6940  	}
c3e1b005ed1cc0 Patrick McHardy      2015-03-26  6941  
79ebb5bb4e38a5 Laura Garcia Liebana 2019-06-18  6942  	expiration = 0;
79ebb5bb4e38a5 Laura Garcia Liebana 2019-06-18  6943  	if (nla[NFTA_SET_ELEM_EXPIRATION] != NULL) {
79ebb5bb4e38a5 Laura Garcia Liebana 2019-06-18  6944  		if (!(set->flags & NFT_SET_TIMEOUT))
79ebb5bb4e38a5 Laura Garcia Liebana 2019-06-18  6945  			return -EINVAL;
b6b5da9db51ef5 Pablo Neira Ayuso    2024-08-07  6946  		if (timeout == 0 || timeout == NFT_NEVER_EXPIRES)
69dd9b35eb5f81 Pablo Neira Ayuso    2024-08-07  6947  			return -EOPNOTSUPP;
69dd9b35eb5f81 Pablo Neira Ayuso    2024-08-07  6948  
79ebb5bb4e38a5 Laura Garcia Liebana 2019-06-18  6949  		err = nf_msecs_to_jiffies64(nla[NFTA_SET_ELEM_EXPIRATION],
b6b5da9db51ef5 Pablo Neira Ayuso    2024-08-07  6950  					    &expiration, false);
79ebb5bb4e38a5 Laura Garcia Liebana 2019-06-18  6951  		if (err)
79ebb5bb4e38a5 Laura Garcia Liebana 2019-06-18  6952  			return err;
79ebb5bb4e38a5 Laura Garcia Liebana 2019-06-18  6953  	}
79ebb5bb4e38a5 Laura Garcia Liebana 2019-06-18  6954  
8cfd9b0f8515e7 Pablo Neira Ayuso    2020-12-07  6955  	if (nla[NFTA_SET_ELEM_EXPR]) {
8cfd9b0f8515e7 Pablo Neira Ayuso    2020-12-07  6956  		struct nft_expr *expr;
8cfd9b0f8515e7 Pablo Neira Ayuso    2020-12-07  6957  
664899e85c1312 Pablo Neira Ayuso    2021-02-08  6958  		if (set->num_exprs && set->num_exprs != 1)
8cfd9b0f8515e7 Pablo Neira Ayuso    2020-12-07  6959  			return -EOPNOTSUPP;
8cfd9b0f8515e7 Pablo Neira Ayuso    2020-12-07  6960  
4094445229760d Pablo Neira Ayuso    2020-03-11  6961  		expr = nft_set_elem_expr_alloc(ctx, set,
4094445229760d Pablo Neira Ayuso    2020-03-11  6962  					       nla[NFTA_SET_ELEM_EXPR]);
4094445229760d Pablo Neira Ayuso    2020-03-11  6963  		if (IS_ERR(expr))
4094445229760d Pablo Neira Ayuso    2020-03-11  6964  			return PTR_ERR(expr);
65038428b2c6c5 Pablo Neira Ayuso    2020-03-17  6965  
8cfd9b0f8515e7 Pablo Neira Ayuso    2020-12-07  6966  		expr_array[0] = expr;
664899e85c1312 Pablo Neira Ayuso    2021-02-08  6967  		num_exprs = 1;
8cfd9b0f8515e7 Pablo Neira Ayuso    2020-12-07  6968  
664899e85c1312 Pablo Neira Ayuso    2021-02-08  6969  		if (set->num_exprs && set->exprs[0]->ops != expr->ops) {
65038428b2c6c5 Pablo Neira Ayuso    2020-03-17  6970  			err = -EOPNOTSUPP;
65038428b2c6c5 Pablo Neira Ayuso    2020-03-17  6971  			goto err_set_elem_expr;
8cfd9b0f8515e7 Pablo Neira Ayuso    2020-12-07  6972  		}
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  6973  	} else if (nla[NFTA_SET_ELEM_EXPRESSIONS]) {
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  6974  		struct nft_expr *expr;
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  6975  		struct nlattr *tmp;
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  6976  		int left;
65038428b2c6c5 Pablo Neira Ayuso    2020-03-17  6977  
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  6978  		i = 0;
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  6979  		nla_for_each_nested(tmp, nla[NFTA_SET_ELEM_EXPRESSIONS], left) {
664899e85c1312 Pablo Neira Ayuso    2021-02-08  6980  			if (i == NFT_SET_EXPR_MAX ||
664899e85c1312 Pablo Neira Ayuso    2021-02-08  6981  			    (set->num_exprs && set->num_exprs == i)) {
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  6982  				err = -E2BIG;
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  6983  				goto err_set_elem_expr;
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  6984  			}
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  6985  			if (nla_type(tmp) != NFTA_LIST_ELEM) {
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  6986  				err = -EINVAL;
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  6987  				goto err_set_elem_expr;
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  6988  			}
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  6989  			expr = nft_set_elem_expr_alloc(ctx, set, tmp);
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  6990  			if (IS_ERR(expr)) {
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  6991  				err = PTR_ERR(expr);
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  6992  				goto err_set_elem_expr;
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  6993  			}
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  6994  			expr_array[i] = expr;
664899e85c1312 Pablo Neira Ayuso    2021-02-08  6995  			num_exprs++;
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  6996  
664899e85c1312 Pablo Neira Ayuso    2021-02-08  6997  			if (set->num_exprs && expr->ops != set->exprs[i]->ops) {
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  6998  				err = -EOPNOTSUPP;
65038428b2c6c5 Pablo Neira Ayuso    2020-03-17  6999  				goto err_set_elem_expr;
4094445229760d Pablo Neira Ayuso    2020-03-11  7000  			}
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  7001  			i++;
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  7002  		}
664899e85c1312 Pablo Neira Ayuso    2021-02-08  7003  		if (set->num_exprs && set->num_exprs != i) {
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  7004  			err = -EOPNOTSUPP;
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  7005  			goto err_set_elem_expr;
48b0ae046ee96e Pablo Neira Ayuso    2020-12-07  7006  		}
33c7aba0b4ffd6 Pablo Neira Ayuso    2022-11-14  7007  	} else if (set->num_exprs > 0 &&
33c7aba0b4ffd6 Pablo Neira Ayuso    2022-11-14  7008  		   !(flags & NFT_SET_ELEM_INTERVAL_END)) {
8cfd9b0f8515e7 Pablo Neira Ayuso    2020-12-07  7009  		err = nft_set_elem_expr_clone(ctx, set, expr_array);
65038428b2c6c5 Pablo Neira Ayuso    2020-03-17  7010  		if (err < 0)
8cfd9b0f8515e7 Pablo Neira Ayuso    2020-12-07  7011  			goto err_set_elem_expr_clone;
664899e85c1312 Pablo Neira Ayuso    2021-02-08  7012  
664899e85c1312 Pablo Neira Ayuso    2021-02-08  7013  		num_exprs = set->num_exprs;
4094445229760d Pablo Neira Ayuso    2020-03-11  7014  	}
4094445229760d Pablo Neira Ayuso    2020-03-11  7015  
aaa31047a6d25d Pablo Neira Ayuso    2021-04-27  7016  	if (nla[NFTA_SET_ELEM_KEY]) {
20a1452c35425b Pablo Neira Ayuso    2020-01-22  7017  		err = nft_setelem_parse_key(ctx, set, &elem.key.val,
d0a11fc3dc4ab4 Patrick McHardy      2015-04-11  7018  					    nla[NFTA_SET_ELEM_KEY]);
20a69341f2d00c Patrick McHardy      2013-10-11  7019  		if (err < 0)
4094445229760d Pablo Neira Ayuso    2020-03-11  7020  			goto err_set_elem_expr;
20a69341f2d00c Patrick McHardy      2013-10-11  7021  
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  7022  		err = nft_set_ext_add_length(&tmpl, NFT_SET_EXT_KEY, set->klen);
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  7023  		if (err < 0)
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  7024  			goto err_parse_key;
aaa31047a6d25d Pablo Neira Ayuso    2021-04-27  7025  	}
7b225d0b5c6dda Pablo Neira Ayuso    2020-01-22  7026  
7b225d0b5c6dda Pablo Neira Ayuso    2020-01-22  7027  	if (nla[NFTA_SET_ELEM_KEY_END]) {
7b225d0b5c6dda Pablo Neira Ayuso    2020-01-22  7028  		err = nft_setelem_parse_key(ctx, set, &elem.key_end.val,
7b225d0b5c6dda Pablo Neira Ayuso    2020-01-22  7029  					    nla[NFTA_SET_ELEM_KEY_END]);
7b225d0b5c6dda Pablo Neira Ayuso    2020-01-22  7030  		if (err < 0)
7b225d0b5c6dda Pablo Neira Ayuso    2020-01-22  7031  			goto err_parse_key;
7b225d0b5c6dda Pablo Neira Ayuso    2020-01-22  7032  
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  7033  		err = nft_set_ext_add_length(&tmpl, NFT_SET_EXT_KEY_END, set->klen);
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  7034  		if (err < 0)
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  7035  			goto err_parse_key_end;
7b225d0b5c6dda Pablo Neira Ayuso    2020-01-22  7036  	}
7b225d0b5c6dda Pablo Neira Ayuso    2020-01-22  7037  
c3e1b005ed1cc0 Patrick McHardy      2015-03-26  7038  	if (timeout > 0) {
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  7039  		err = nft_set_ext_add(&tmpl, NFT_SET_EXT_TIMEOUT);
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  7040  		if (err < 0)
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  7041  			goto err_parse_key_end;
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  7042  	}
fe2811ebeb97a7 Patrick McHardy      2015-03-25  7043  
664899e85c1312 Pablo Neira Ayuso    2021-02-08  7044  	if (num_exprs) {
664899e85c1312 Pablo Neira Ayuso    2021-02-08  7045  		for (i = 0; i < num_exprs; i++)
563125a73ac30d Pablo Neira Ayuso    2020-12-09  7046  			size += expr_array[i]->ops->size;
563125a73ac30d Pablo Neira Ayuso    2020-12-09  7047  
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  7048  		err = nft_set_ext_add_length(&tmpl, NFT_SET_EXT_EXPRESSIONS,
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  7049  					     sizeof(struct nft_set_elem_expr) + size);
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  7050  		if (err < 0)
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  7051  			goto err_parse_key_end;
563125a73ac30d Pablo Neira Ayuso    2020-12-09  7052  	}
4094445229760d Pablo Neira Ayuso    2020-03-11  7053  
8aeff920dcc9b3 Pablo Neira Ayuso    2016-11-28  7054  	if (nla[NFTA_SET_ELEM_OBJREF] != NULL) {
4d44175aa5bb5f Florian Westphal     2019-01-08  7055  		obj = nft_obj_lookup(ctx->net, ctx->table,
4d44175aa5bb5f Florian Westphal     2019-01-08  7056  				     nla[NFTA_SET_ELEM_OBJREF],
8aeff920dcc9b3 Pablo Neira Ayuso    2016-11-28  7057  				     set->objtype, genmask);
8aeff920dcc9b3 Pablo Neira Ayuso    2016-11-28  7058  		if (IS_ERR(obj)) {
8aeff920dcc9b3 Pablo Neira Ayuso    2016-11-28  7059  			err = PTR_ERR(obj);
1689f25924ada8 Pablo Neira Ayuso    2023-06-28  7060  			obj = NULL;
7b225d0b5c6dda Pablo Neira Ayuso    2020-01-22  7061  			goto err_parse_key_end;
8aeff920dcc9b3 Pablo Neira Ayuso    2016-11-28  7062  		}
1689f25924ada8 Pablo Neira Ayuso    2023-06-28  7063  
1689f25924ada8 Pablo Neira Ayuso    2023-06-28  7064  		if (!nft_use_inc(&obj->use)) {
1689f25924ada8 Pablo Neira Ayuso    2023-06-28  7065  			err = -EMFILE;
1689f25924ada8 Pablo Neira Ayuso    2023-06-28  7066  			obj = NULL;
1689f25924ada8 Pablo Neira Ayuso    2023-06-28  7067  			goto err_parse_key_end;
1689f25924ada8 Pablo Neira Ayuso    2023-06-28  7068  		}
1689f25924ada8 Pablo Neira Ayuso    2023-06-28  7069  
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  7070  		err = nft_set_ext_add(&tmpl, NFT_SET_EXT_OBJREF);
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  7071  		if (err < 0)
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  7072  			goto err_parse_key_end;
8aeff920dcc9b3 Pablo Neira Ayuso    2016-11-28  7073  	}
8aeff920dcc9b3 Pablo Neira Ayuso    2016-11-28  7074  
20a69341f2d00c Patrick McHardy      2013-10-11  7075  	if (nla[NFTA_SET_ELEM_DATA] != NULL) {
fdb9c405e35bdc Pablo Neira Ayuso    2020-04-24  7076  		err = nft_setelem_parse_data(ctx, set, &desc, &elem.data.val,
d0a11fc3dc4ab4 Patrick McHardy      2015-04-11  7077  					     nla[NFTA_SET_ELEM_DATA]);
20a69341f2d00c Patrick McHardy      2013-10-11  7078  		if (err < 0)
7b225d0b5c6dda Pablo Neira Ayuso    2020-01-22  7079  			goto err_parse_key_end;
20a69341f2d00c Patrick McHardy      2013-10-11  7080  
20a69341f2d00c Patrick McHardy      2013-10-11  7081  		dreg = nft_type_to_reg(set->dtype);
20a69341f2d00c Patrick McHardy      2013-10-11  7082  		list_for_each_entry(binding, &set->bindings, list) {
20a69341f2d00c Patrick McHardy      2013-10-11  7083  			struct nft_ctx bind_ctx = {
58c78e104d937c Liping Zhang         2016-11-06  7084  				.net	= ctx->net,
36596dadf54a92 Pablo Neira Ayuso    2018-01-09  7085  				.family	= ctx->family,
20a69341f2d00c Patrick McHardy      2013-10-11  7086  				.table	= ctx->table,
7c95f6d866d861 Pablo Neira Ayuso    2014-04-04  7087  				.chain	= (struct nft_chain *)binding->chain,
20a69341f2d00c Patrick McHardy      2013-10-11  7088  			};
20a69341f2d00c Patrick McHardy      2013-10-11  7089  
11113e190bf0ad Patrick McHardy      2015-04-05  7090  			if (!(binding->flags & NFT_SET_MAP))
11113e190bf0ad Patrick McHardy      2015-04-05  7091  				continue;
11113e190bf0ad Patrick McHardy      2015-04-05  7092  
1ec10212f9bc62 Patrick McHardy      2015-04-11  7093  			err = nft_validate_register_store(&bind_ctx, dreg,
fdb9c405e35bdc Pablo Neira Ayuso    2020-04-24  7094  							  &elem.data.val,
20a1452c35425b Pablo Neira Ayuso    2020-01-22  7095  							  desc.type, desc.len);
20a69341f2d00c Patrick McHardy      2013-10-11  7096  			if (err < 0)
7b225d0b5c6dda Pablo Neira Ayuso    2020-01-22  7097  				goto err_parse_data;
a654de8fdc1815 Pablo Neira Ayuso    2018-05-30  7098  
20a1452c35425b Pablo Neira Ayuso    2020-01-22  7099  			if (desc.type == NFT_DATA_VERDICT &&
fdb9c405e35bdc Pablo Neira Ayuso    2020-04-24  7100  			    (elem.data.val.verdict.code == NFT_GOTO ||
fdb9c405e35bdc Pablo Neira Ayuso    2020-04-24  7101  			     elem.data.val.verdict.code == NFT_JUMP))
00c320f9b75560 Florian Westphal     2023-04-13  7102  				nft_validate_state_update(ctx->table,
a654de8fdc1815 Pablo Neira Ayuso    2018-05-30  7103  							  NFT_VALIDATE_NEED);
20a69341f2d00c Patrick McHardy      2013-10-11  7104  		}
fe2811ebeb97a7 Patrick McHardy      2015-03-25  7105  
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  7106  		err = nft_set_ext_add_length(&tmpl, NFT_SET_EXT_DATA, desc.len);
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  7107  		if (err < 0)
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  7108  			goto err_parse_data;
20a69341f2d00c Patrick McHardy      2013-10-11  7109  	}
20a69341f2d00c Patrick McHardy      2013-10-11  7110  
68e942e88add0a Patrick McHardy      2015-04-05  7111  	/* The full maximum length of userdata can exceed the maximum
68e942e88add0a Patrick McHardy      2015-04-05  7112  	 * offset value (U8_MAX) for following extensions, therefor it
68e942e88add0a Patrick McHardy      2015-04-05  7113  	 * must be the last extension added.
68e942e88add0a Patrick McHardy      2015-04-05  7114  	 */
68e942e88add0a Patrick McHardy      2015-04-05  7115  	ulen = 0;
68e942e88add0a Patrick McHardy      2015-04-05  7116  	if (nla[NFTA_SET_ELEM_USERDATA] != NULL) {
68e942e88add0a Patrick McHardy      2015-04-05  7117  		ulen = nla_len(nla[NFTA_SET_ELEM_USERDATA]);
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  7118  		if (ulen > 0) {
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  7119  			err = nft_set_ext_add_length(&tmpl, NFT_SET_EXT_USERDATA,
68e942e88add0a Patrick McHardy      2015-04-05  7120  						     ulen);
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  7121  			if (err < 0)
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  7122  				goto err_parse_data;
c39ba4de6b0a84 Pablo Neira Ayuso    2022-07-05  7123  		}
68e942e88add0a Patrick McHardy      2015-04-05  7124  	}
68e942e88add0a Patrick McHardy      2015-04-05  7125  
7b225d0b5c6dda Pablo Neira Ayuso    2020-01-22  7126  	elem.priv = nft_set_elem_init(set, &tmpl, elem.key.val.data,
fdb9c405e35bdc Pablo Neira Ayuso    2020-04-24  7127  				      elem.key_end.val.data, elem.data.val.data,
33758c891479ea Vasily Averin        2022-03-24  7128  				      timeout, expiration, GFP_KERNEL_ACCOUNT);
34aae2c2fb1e3d Pablo Neira Ayuso    2022-08-09  7129  	if (IS_ERR(elem.priv)) {
34aae2c2fb1e3d Pablo Neira Ayuso    2022-08-09  7130  		err = PTR_ERR(elem.priv);
7b225d0b5c6dda Pablo Neira Ayuso    2020-01-22  7131  		goto err_parse_data;
34aae2c2fb1e3d Pablo Neira Ayuso    2022-08-09  7132  	}
fe2811ebeb97a7 Patrick McHardy      2015-03-25  7133  
fe2811ebeb97a7 Patrick McHardy      2015-03-25  7134  	ext = nft_set_elem_ext(set, elem.priv);
fe2811ebeb97a7 Patrick McHardy      2015-03-25  7135  	if (flags)
fe2811ebeb97a7 Patrick McHardy      2015-03-25  7136  		*nft_set_ext_flags(ext) = flags;
34aae2c2fb1e3d Pablo Neira Ayuso    2022-08-09  7137  
1689f25924ada8 Pablo Neira Ayuso    2023-06-28  7138  	if (obj)
d6b478666ffa6d Pablo Neira Ayuso    2023-06-16  7139  		*nft_set_ext_obj(ext) = obj;
1689f25924ada8 Pablo Neira Ayuso    2023-06-28  7140  
68e942e88add0a Patrick McHardy      2015-04-05  7141  	if (ulen > 0) {
34aae2c2fb1e3d Pablo Neira Ayuso    2022-08-09  7142  		if (nft_set_ext_check(&tmpl, NFT_SET_EXT_USERDATA, ulen) < 0) {
34aae2c2fb1e3d Pablo Neira Ayuso    2022-08-09  7143  			err = -EINVAL;
d6b478666ffa6d Pablo Neira Ayuso    2023-06-16  7144  			goto err_elem_free;
34aae2c2fb1e3d Pablo Neira Ayuso    2022-08-09  7145  		}
68e942e88add0a Patrick McHardy      2015-04-05  7146  		udata = nft_set_ext_userdata(ext);
68e942e88add0a Patrick McHardy      2015-04-05  7147  		udata->len = ulen - 1;
68e942e88add0a Patrick McHardy      2015-04-05  7148  		nla_memcpy(&udata->data, nla[NFTA_SET_ELEM_USERDATA], ulen);
68e942e88add0a Patrick McHardy      2015-04-05  7149  	}
34aae2c2fb1e3d Pablo Neira Ayuso    2022-08-09  7150  	err = nft_set_elem_expr_setup(ctx, &tmpl, ext, expr_array, num_exprs);
4d8f9065830e52 Pablo Neira Ayuso    2021-04-10  7151  	if (err < 0)
34aae2c2fb1e3d Pablo Neira Ayuso    2022-08-09  7152  		goto err_elem_free;
fe2811ebeb97a7 Patrick McHardy      2015-03-25  7153  
60319eb1ca351a Pablo Neira Ayuso    2014-04-04  7154  	trans = nft_trans_elem_alloc(ctx, NFT_MSG_NEWSETELEM, set);
4d8f9065830e52 Pablo Neira Ayuso    2021-04-10  7155  	if (trans == NULL) {
4d8f9065830e52 Pablo Neira Ayuso    2021-04-10  7156  		err = -ENOMEM;
34aae2c2fb1e3d Pablo Neira Ayuso    2022-08-09  7157  		goto err_elem_free;
4d8f9065830e52 Pablo Neira Ayuso    2021-04-10  7158  	}
60319eb1ca351a Pablo Neira Ayuso    2014-04-04  7159  
a2dd0233cbc4d8 Pablo Neira Ayuso    2023-08-09  7160  	ext->genmask = nft_genmask_cur(ctx->net);
aaa31047a6d25d Pablo Neira Ayuso    2021-04-27  7161  
078996fcd657e6 Pablo Neira Ayuso    2023-10-18  7162  	err = nft_setelem_insert(ctx->net, set, &elem, &elem_priv, flags);
c016c7e45ddfa5 Pablo Neira Ayuso    2016-08-24  7163  	if (err) {
c016c7e45ddfa5 Pablo Neira Ayuso    2016-08-24  7164  		if (err == -EEXIST) {
078996fcd657e6 Pablo Neira Ayuso    2023-10-18  7165  			ext2 = nft_set_elem_ext(set, elem_priv);
9744a6fcefcb4d Pablo Neira Ayuso    2017-05-01  7166  			if (nft_set_ext_exists(ext, NFT_SET_EXT_DATA) ^
9744a6fcefcb4d Pablo Neira Ayuso    2017-05-01  7167  			    nft_set_ext_exists(ext2, NFT_SET_EXT_DATA) ||
9744a6fcefcb4d Pablo Neira Ayuso    2017-05-01  7168  			    nft_set_ext_exists(ext, NFT_SET_EXT_OBJREF) ^
77a92189ecfd06 Pablo Neira Ayuso    2020-08-02  7169  			    nft_set_ext_exists(ext2, NFT_SET_EXT_OBJREF))
7b225d0b5c6dda Pablo Neira Ayuso    2020-01-22  7170  				goto err_element_clash;
8aeff920dcc9b3 Pablo Neira Ayuso    2016-11-28  7171  			if ((nft_set_ext_exists(ext, NFT_SET_EXT_DATA) &&
c016c7e45ddfa5 Pablo Neira Ayuso    2016-08-24  7172  			     nft_set_ext_exists(ext2, NFT_SET_EXT_DATA) &&
c016c7e45ddfa5 Pablo Neira Ayuso    2016-08-24  7173  			     memcmp(nft_set_ext_data(ext),
8aeff920dcc9b3 Pablo Neira Ayuso    2016-11-28  7174  				    nft_set_ext_data(ext2), set->dlen) != 0) ||
8aeff920dcc9b3 Pablo Neira Ayuso    2016-11-28  7175  			    (nft_set_ext_exists(ext, NFT_SET_EXT_OBJREF) &&
8aeff920dcc9b3 Pablo Neira Ayuso    2016-11-28  7176  			     nft_set_ext_exists(ext2, NFT_SET_EXT_OBJREF) &&
8aeff920dcc9b3 Pablo Neira Ayuso    2016-11-28  7177  			     *nft_set_ext_obj(ext) != *nft_set_ext_obj(ext2)))
77a92189ecfd06 Pablo Neira Ayuso    2020-08-02  7178  				goto err_element_clash;
af016fdf193dc4 Pablo Neira Ayuso    2024-08-07  7179  			else if (!(nlmsg_flags & NLM_F_EXCL)) {
c016c7e45ddfa5 Pablo Neira Ayuso    2016-08-24  7180  				err = 0;
af016fdf193dc4 Pablo Neira Ayuso    2024-08-07  7181  				if (timeout) {
af016fdf193dc4 Pablo Neira Ayuso    2024-08-07  7182  					nft_trans_elem_timeout(trans) = timeout;
af016fdf193dc4 Pablo Neira Ayuso    2024-08-07  7183  					if (expiration == 0)
af016fdf193dc4 Pablo Neira Ayuso    2024-08-07  7184  						expiration = timeout;
af016fdf193dc4 Pablo Neira Ayuso    2024-08-07  7185  
af016fdf193dc4 Pablo Neira Ayuso    2024-08-07  7186  					update = true;
af016fdf193dc4 Pablo Neira Ayuso    2024-08-07  7187  				}
af016fdf193dc4 Pablo Neira Ayuso    2024-08-07  7188  				if (expiration) {
af016fdf193dc4 Pablo Neira Ayuso    2024-08-07  7189  					nft_trans_elem_expiration(trans) = expiration;
af016fdf193dc4 Pablo Neira Ayuso    2024-08-07  7190  					update = true;
af016fdf193dc4 Pablo Neira Ayuso    2024-08-07  7191  				}
af016fdf193dc4 Pablo Neira Ayuso    2024-08-07  7192  
af016fdf193dc4 Pablo Neira Ayuso    2024-08-07  7193  				if (update) {
af016fdf193dc4 Pablo Neira Ayuso    2024-08-07  7194  					if (WARN_ON_ONCE(!nft_set_ext_exists(ext2, NFT_SET_EXT_TIMEOUT))) {
af016fdf193dc4 Pablo Neira Ayuso    2024-08-07  7195  						err = -EINVAL;
af016fdf193dc4 Pablo Neira Ayuso    2024-08-07  7196  						goto err_element_clash;
af016fdf193dc4 Pablo Neira Ayuso    2024-08-07  7197  					}
af016fdf193dc4 Pablo Neira Ayuso    2024-08-07  7198  					nft_trans_elem_priv(trans) = elem_priv;
af016fdf193dc4 Pablo Neira Ayuso    2024-08-07  7199  					nft_trans_elem_update(trans) = true;
af016fdf193dc4 Pablo Neira Ayuso    2024-08-07  7200  					nft_trans_commit_list_add_tail(ctx->net, trans);
af016fdf193dc4 Pablo Neira Ayuso    2024-08-07 @7201  					goto err_elem_free;
af016fdf193dc4 Pablo Neira Ayuso    2024-08-07  7202  				}
af016fdf193dc4 Pablo Neira Ayuso    2024-08-07  7203  			}
8c2d45b2b65ca1 Pablo Neira Ayuso    2020-03-22  7204  		} else if (err == -ENOTEMPTY) {
8c2d45b2b65ca1 Pablo Neira Ayuso    2020-03-22  7205  			/* ENOTEMPTY reports overlapping between this element
8c2d45b2b65ca1 Pablo Neira Ayuso    2020-03-22  7206  			 * and an existing one.
8c2d45b2b65ca1 Pablo Neira Ayuso    2020-03-22  7207  			 */
8c2d45b2b65ca1 Pablo Neira Ayuso    2020-03-22  7208  			err = -EEXIST;
c016c7e45ddfa5 Pablo Neira Ayuso    2016-08-24  7209  		}
7b225d0b5c6dda Pablo Neira Ayuso    2020-01-22  7210  		goto err_element_clash;
c016c7e45ddfa5 Pablo Neira Ayuso    2016-08-24  7211  	}
20a69341f2d00c Patrick McHardy      2013-10-11  7212  
d4b7f29eb85c93 Florian Westphal     2023-05-11  7213  	if (!(flags & NFT_SET_ELEM_CATCHALL)) {
d4b7f29eb85c93 Florian Westphal     2023-05-11  7214  		unsigned int max = set->size ? set->size + set->ndeact : UINT_MAX;
d4b7f29eb85c93 Florian Westphal     2023-05-11  7215  
d4b7f29eb85c93 Florian Westphal     2023-05-11  7216  		if (!atomic_add_unless(&set->nelems, 1, max)) {
35d0ac9070ef61 Pablo Neira Ayuso    2017-01-24  7217  			err = -ENFILE;
7b225d0b5c6dda Pablo Neira Ayuso    2020-01-22  7218  			goto err_set_full;
35d0ac9070ef61 Pablo Neira Ayuso    2017-01-24  7219  		}
d4b7f29eb85c93 Florian Westphal     2023-05-11  7220  	}
35d0ac9070ef61 Pablo Neira Ayuso    2017-01-24  7221  
0e1ea651c9717d Pablo Neira Ayuso    2023-10-16  7222  	nft_trans_elem_priv(trans) = elem.priv;
0854db2aaef3fc Florian Westphal     2021-04-01  7223  	nft_trans_commit_list_add_tail(ctx->net, trans);
20a69341f2d00c Patrick McHardy      2013-10-11  7224  	return 0;
20a69341f2d00c Patrick McHardy      2013-10-11  7225  
7b225d0b5c6dda Pablo Neira Ayuso    2020-01-22  7226  err_set_full:
0e1ea651c9717d Pablo Neira Ayuso    2023-10-16  7227  	nft_setelem_remove(ctx->net, set, elem.priv);
7b225d0b5c6dda Pablo Neira Ayuso    2020-01-22  7228  err_element_clash:
60319eb1ca351a Pablo Neira Ayuso    2014-04-04  7229  	kfree(trans);
34aae2c2fb1e3d Pablo Neira Ayuso    2022-08-09  7230  err_elem_free:
b389139f12f287 Pablo Neira Ayuso    2023-06-26  7231  	nf_tables_set_elem_destroy(ctx, set, elem.priv);
7b225d0b5c6dda Pablo Neira Ayuso    2020-01-22  7232  err_parse_data:
20a69341f2d00c Patrick McHardy      2013-10-11  7233  	if (nla[NFTA_SET_ELEM_DATA] != NULL)
fdb9c405e35bdc Pablo Neira Ayuso    2020-04-24  7234  		nft_data_release(&elem.data.val, desc.type);
7b225d0b5c6dda Pablo Neira Ayuso    2020-01-22  7235  err_parse_key_end:
1689f25924ada8 Pablo Neira Ayuso    2023-06-28  7236  	if (obj)
1689f25924ada8 Pablo Neira Ayuso    2023-06-28  7237  		nft_use_dec_restore(&obj->use);
1689f25924ada8 Pablo Neira Ayuso    2023-06-28  7238  
7b225d0b5c6dda Pablo Neira Ayuso    2020-01-22  7239  	nft_data_release(&elem.key_end.val, NFT_DATA_VALUE);
7b225d0b5c6dda Pablo Neira Ayuso    2020-01-22  7240  err_parse_key:
20a1452c35425b Pablo Neira Ayuso    2020-01-22  7241  	nft_data_release(&elem.key.val, NFT_DATA_VALUE);
4094445229760d Pablo Neira Ayuso    2020-03-11  7242  err_set_elem_expr:
664899e85c1312 Pablo Neira Ayuso    2021-02-08  7243  	for (i = 0; i < num_exprs && expr_array[i]; i++)
8cfd9b0f8515e7 Pablo Neira Ayuso    2020-12-07  7244  		nft_expr_destroy(ctx, expr_array[i]);
8cfd9b0f8515e7 Pablo Neira Ayuso    2020-12-07  7245  err_set_elem_expr_clone:
20a69341f2d00c Patrick McHardy      2013-10-11  7246  	return err;
20a69341f2d00c Patrick McHardy      2013-10-11  7247  }
20a69341f2d00c Patrick McHardy      2013-10-11  7248  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
