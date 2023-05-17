Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A73847E
	for <oe-kbuild@lists.linux.dev>; Wed, 17 May 2023 09:06:04 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3078d1c8828so435273f8f.3
        for <oe-kbuild@lists.linux.dev>; Wed, 17 May 2023 02:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684314361; x=1686906361;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TO7Ha/SYWThUcSyTZ/rq4qCarcDVUSJia5UkdPMEkFA=;
        b=KRJOu8Hru55u84VXz5/TdJrdbBlOxW+OUXJejy4zXIK73sPOMra97yn4o9CAXzDA/J
         6oFXAAe7dN4tTnzje6cWT3YA05OhN6Sjkcf2vjCxzzOWj9SKujvD4hKAIsUMZwF29Ft4
         V1slpxBL/NWGNCaQHZf/2iBmWgdyhst6n1LwuAw9icJB9mKFj7H11V81+ggH9cwvNfyD
         RZ1+JemzRJhHzzx/cZmoN2xwWcIp+VVZzCijZ0PLj+Z68RfTWhCpjm2S/oVTCdQgPaF5
         lPTdSiwvAtJ7ezIeU83CwYBtO+Z2WrquZL497Yg7Chb2D+4FkN0fJspa2DO/OHnhOBof
         pB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684314361; x=1686906361;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TO7Ha/SYWThUcSyTZ/rq4qCarcDVUSJia5UkdPMEkFA=;
        b=TqLdHg5lH4ww6HU+52HXX7OsgUw41HTJgFFeQeuBQxCmkglKL2fOEit/cVycKdnEcs
         c19jxOnea3TtnNpeUlg4cHp7g7cV9oii6GmYdljPJ6pCCcfC+bXixBT0v1jpSkCr+wkd
         xfjgwNq624p3KF4EEDBlkpYqu/U/kQsc0j4UBuRsBbL0iKjxB3VZQFWS0rv4oel9REt3
         1Sr4SyVh+wcHhlJAHLcxfkLQjmxkyPZecdViWDkMvqYGlI/jUs/CEGzYMTQUmkL9KJuU
         R72DEeYbfCl+Saj4BtuOvr+dguRxTK79DAbZA/9Ca/gG+mM2gQLHzMCXUoOmdq+De2NW
         rgyQ==
X-Gm-Message-State: AC+VfDzB8nEzat6CAg1hAYkQfvlYRdMYn1RhVOLfgUQBHBtpHWtu3JxD
	xqnvX2S2XjsLAfvAOYG1bK+7YKqR9BdMdEmpC7o=
X-Google-Smtp-Source: ACHHUZ4ZadSF9tHDymkDyFVUwv2Bv4zWZTABYqMiJt9JSrx35nETyN8G58u2hlutBx1QTOPyg/TzAg==
X-Received: by 2002:adf:da45:0:b0:309:3698:8011 with SMTP id r5-20020adfda45000000b0030936988011mr46195wrl.57.1684314361469;
        Wed, 17 May 2023 02:06:01 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q2-20020adff942000000b003062ad45243sm2127009wrr.14.2023.05.17.02.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 02:05:59 -0700 (PDT)
Date: Wed, 17 May 2023 12:05:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Florian Westphal <fw@strlen.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH nf-next] netfilter: nf_tables: disable delset and
 delsetelem on anonymous sets
Message-ID: <e5cd0f8a-8da1-42fe-8c67-ff5152023f83@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230516132414.16245-1-fw@strlen.de>

Hi Florian,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Westphal/netfilter-nf_tables-disable-delset-and-delsetelem-on-anonymous-sets/20230516-224334
base:   linus/master
patch link:    https://lore.kernel.org/r/20230516132414.16245-1-fw%40strlen.de
patch subject: [PATCH nf-next] netfilter: nf_tables: disable delset and delsetelem on anonymous sets
config: i386-randconfig-m021-20230515
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305171633.B6fxa0S8-lkp@intel.com/

New smatch warnings:
net/netfilter/nf_tables_api.c:5001 nf_tables_delset() error: 'set' dereferencing possible ERR_PTR()

vim +/set +5001 net/netfilter/nf_tables_api.c

7dab8ee3b6e7ec Pablo Neira Ayuso          2021-04-23  4971  static int nf_tables_delset(struct sk_buff *skb, const struct nfnl_info *info,
7dab8ee3b6e7ec Pablo Neira Ayuso          2021-04-23  4972  			    const struct nlattr * const nla[])
20a69341f2d00c Patrick McHardy            2013-10-11  4973  {
7dab8ee3b6e7ec Pablo Neira Ayuso          2021-04-23  4974  	struct netlink_ext_ack *extack = info->extack;
7dab8ee3b6e7ec Pablo Neira Ayuso          2021-04-23  4975  	u8 genmask = nft_genmask_next(info->net);
670866512f971d Pablo Neira Ayuso          2021-05-31  4976  	u8 family = info->nfmsg->nfgen_family;
7dab8ee3b6e7ec Pablo Neira Ayuso          2021-04-23  4977  	struct net *net = info->net;
36dd1bcc07e529 Pablo Neira Ayuso          2018-03-28  4978  	const struct nlattr *attr;
670866512f971d Pablo Neira Ayuso          2021-05-31  4979  	struct nft_table *table;
20a69341f2d00c Patrick McHardy            2013-10-11  4980  	struct nft_set *set;
20a69341f2d00c Patrick McHardy            2013-10-11  4981  	struct nft_ctx ctx;
20a69341f2d00c Patrick McHardy            2013-10-11  4982  
ef4b65e53cc77e Pablo Neira Ayuso          2021-05-31  4983  	if (info->nfmsg->nfgen_family == NFPROTO_UNSPEC)
ec2c9935688fbd Patrick McHardy            2014-02-05  4984  		return -EAFNOSUPPORT;
20a69341f2d00c Patrick McHardy            2013-10-11  4985  
670866512f971d Pablo Neira Ayuso          2021-05-31  4986  	table = nft_table_lookup(net, nla[NFTA_SET_TABLE], family,
6001a930ce0378 Pablo Neira Ayuso          2021-02-15  4987  				 genmask, NETLINK_CB(skb).portid);
670866512f971d Pablo Neira Ayuso          2021-05-31  4988  	if (IS_ERR(table)) {
670866512f971d Pablo Neira Ayuso          2021-05-31  4989  		NL_SET_BAD_ATTR(extack, nla[NFTA_SET_TABLE]);
670866512f971d Pablo Neira Ayuso          2021-05-31  4990  		return PTR_ERR(table);
670866512f971d Pablo Neira Ayuso          2021-05-31  4991  	}
20a69341f2d00c Patrick McHardy            2013-10-11  4992  
36dd1bcc07e529 Pablo Neira Ayuso          2018-03-28  4993  	if (nla[NFTA_SET_HANDLE]) {
36dd1bcc07e529 Pablo Neira Ayuso          2018-03-28  4994  		attr = nla[NFTA_SET_HANDLE];
670866512f971d Pablo Neira Ayuso          2021-05-31  4995  		set = nft_set_lookup_byhandle(table, attr, genmask);
36dd1bcc07e529 Pablo Neira Ayuso          2018-03-28  4996  	} else {
36dd1bcc07e529 Pablo Neira Ayuso          2018-03-28  4997  		attr = nla[NFTA_SET_NAME];
670866512f971d Pablo Neira Ayuso          2021-05-31  4998  		set = nft_set_lookup(table, attr, genmask);
36dd1bcc07e529 Pablo Neira Ayuso          2018-03-28  4999  	}
a8278400809dd9 Pablo Neira Ayuso          2017-09-03  5000  
3743fd7cff321a Florian Westphal           2023-05-16 @5001  	if (set->flags & NFT_SET_ANONYMOUS) {
                                                                    ^^^^^^^^^^
Dereferenced.

3743fd7cff321a Florian Westphal           2023-05-16  5002  		NL_SET_BAD_ATTR(extack, attr);
3743fd7cff321a Florian Westphal           2023-05-16  5003  		return -EBUSY;
3743fd7cff321a Florian Westphal           2023-05-16  5004  	}
3743fd7cff321a Florian Westphal           2023-05-16  5005  
36dd1bcc07e529 Pablo Neira Ayuso          2018-03-28  5006  	if (IS_ERR(set)) {
                                                                    ^^^^^^^^^^^
Checked too late.

f80a612dd77c45 Fernando Fernandez Mancera 2023-01-02  5007  		if (PTR_ERR(set) == -ENOENT &&
f80a612dd77c45 Fernando Fernandez Mancera 2023-01-02  5008  		    NFNL_MSG_TYPE(info->nlh->nlmsg_type) == NFT_MSG_DESTROYSET)
f80a612dd77c45 Fernando Fernandez Mancera 2023-01-02  5009  			return 0;
f80a612dd77c45 Fernando Fernandez Mancera 2023-01-02  5010  
36dd1bcc07e529 Pablo Neira Ayuso          2018-03-28  5011  		NL_SET_BAD_ATTR(extack, attr);
36dd1bcc07e529 Pablo Neira Ayuso          2018-03-28  5012  		return PTR_ERR(set);
36dd1bcc07e529 Pablo Neira Ayuso          2018-03-28  5013  	}
273fe3f1006ea5 Pablo Neira Ayuso          2019-03-08  5014  	if (set->use ||
7dab8ee3b6e7ec Pablo Neira Ayuso          2021-04-23  5015  	    (info->nlh->nlmsg_flags & NLM_F_NONREC &&
7dab8ee3b6e7ec Pablo Neira Ayuso          2021-04-23  5016  	     atomic_read(&set->nelems) > 0)) {
36dd1bcc07e529 Pablo Neira Ayuso          2018-03-28  5017  		NL_SET_BAD_ATTR(extack, attr);
20a69341f2d00c Patrick McHardy            2013-10-11  5018  		return -EBUSY;
36dd1bcc07e529 Pablo Neira Ayuso          2018-03-28  5019  	}
20a69341f2d00c Patrick McHardy            2013-10-11  5020  
670866512f971d Pablo Neira Ayuso          2021-05-31  5021  	nft_ctx_init(&ctx, net, skb, info->nlh, family, table, NULL, nla);
670866512f971d Pablo Neira Ayuso          2021-05-31  5022  
ee01d542563426 Arturo Borrero             2014-09-02  5023  	return nft_delset(&ctx, set);
20a69341f2d00c Patrick McHardy            2013-10-11  5024  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

