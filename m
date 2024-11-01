Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA50114A4E9
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Nov 2024 07:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730444881; cv=none; b=X3dMcLyTgE2ncDo9wZhPSjiGbUw3G1s8p2Hj5KVgiWWL8txfx4Kx0NqbsEbobDyFjD3nxRiSAU234lcpOtwL1CwqdGrFTPMmIy0maTRWow62RsHPkfEAudIAg1nIbmQ5ciQP3U5TqWH7P1rj1Q9VNNrGct7EdQn7deSDNWDTK3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730444881; c=relaxed/simple;
	bh=JutYPB/3oXVJH99Pr39tDq9r5sOqucdhb6oQbo/MObs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=W/54Kry8pb+uDvshpt7OgRyIfYfAl188063rEMmcwqZXHQxaX3wa4FPnPxRWZEKxfW8z1PL9EP14bnOCbtpAObHwEqlpknLUl84Hxr939Q08ne+viQkwKfY8L5N2JG7tL0ZVlBRW8zJbmBGlsYpbsO9C64+NoGkQ2IAtWpLZYhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r7Bo98Dk; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r7Bo98Dk"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso18529275e9.0
        for <oe-kbuild@lists.linux.dev>; Fri, 01 Nov 2024 00:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730444878; x=1731049678; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S+Ifb642LkdinlwnAChfN9N1WVHKlmNGlParRQonuAM=;
        b=r7Bo98DkkN+NrwHqheP+CZ3ibkHVfpwszi8nK2rKl07ODqIuyuHT+/O/UyQ/POACCQ
         qdydx46ggakwHWo2cJT2V2uO2IN0TgEhutE3Iz73NJYP1hlQDWj4qObVoAQRH5ZsSPxf
         JxuvM2/orhtD3Bck7N16HoQMGsKj1AsXZCjfgC3GGMrE3M5iq3RcaFwy7h8POywMHC9b
         5yyY2O58NX+7djidfYdKK86zKzGCWgXb3FUWWg1YCe4X0odFRTPH7RMKrznsLYrMxco8
         IXB+D2sIiOmNYkCaeAJ4oasYA/z4cL3womR/17U9UxWgryTerOKhNlwTuNsUIOiE74nO
         vMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730444878; x=1731049678;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+Ifb642LkdinlwnAChfN9N1WVHKlmNGlParRQonuAM=;
        b=pGO+bZ6HJdVe3QPV9oKW7lfsQUGamtFtrfybxgL6bgruLmbwl0QwsxaPBUeG3BoE71
         0cHvcVW2GkpWIM/X7f2XAqj0g1TDSiAYBKvY5GUB5eFcqOfUGGKi8NaxIxPX9nfAZWq7
         W30Te2ckydMzGOmL2VGq0zba56GQVMZ8UBfwYAYurdXw5Nkla4oYdGyUFSZQ7JK7pSNl
         g6vBhKDFvZ26GScp1idMxnRW+ZFefAl/IuCFGdS34gtNtwhHCIaPdXb/hnKKHLLntfEZ
         RPjjgPWOmuDQXok6htdLk0lxXicJw8KCa9p1clMUtwJT+s+vMGKrdRaETrMVngjqPRm1
         YbOw==
X-Gm-Message-State: AOJu0YxUQrMAXm4tU6fGjtfNCBwuFn0Y6RQKpXYbTTtDACT2bjyEJcYl
	7MYLnWSGD+p8Jqyven5MBiHObRyHyGj5jSza4Zac0YL3AT/rIiBa4DIZJbITIzq5RskNqia9qK3
	z
X-Google-Smtp-Source: AGHT+IHZkKwuSaJjnxtpYOWRHPKIO6H6fHtNmW5nRFRDs0p02yK/SaVhAKY0QGc50Lrs/f2CtIFgBQ==
X-Received: by 2002:a05:6000:1f8c:b0:37d:2de3:bf8a with SMTP id ffacd0b85a97d-381c7a6bcb4mr2189000f8f.26.1730444877770;
        Fri, 01 Nov 2024 00:07:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bb79429asm77103985e9.1.2024.11.01.00.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 00:07:57 -0700 (PDT)
Date: Fri, 1 Nov 2024 10:07:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Florian Westphal <fw@strlen.de>,
	netfilter-devel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Florian Westphal <fw@strlen.de>
Subject: Re: [PATCH v2 nf-next 7/7] netfilter: nf_tables: must hold rcu read
 lock while iterating object type list
Message-ID: <b052e0ad-4b89-4f79-855d-5ed9766168e4@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030094053.13118-8-fw@strlen.de>

Hi Florian,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Westphal/netfilter-nf_tables-avoid-false-positive-lockdep-splat-on-rule-deletion/20241030-174657
base:   https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git main
patch link:    https://lore.kernel.org/r/20241030094053.13118-8-fw%40strlen.de
patch subject: [PATCH v2 nf-next 7/7] netfilter: nf_tables: must hold rcu read lock while iterating object type list
config: s390-randconfig-r073-20241031 (https://download.01.org/0day-ci/archive/20241101/202411010754.SLk5GvT6-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411010754.SLk5GvT6-lkp@intel.com/

New smatch warnings:
net/netfilter/nf_tables_api.c:7886 nf_tables_newobj() warn: 'type' is an error pointer or valid

vim +/type +7886 net/netfilter/nf_tables_api.c

7dab8ee3b6e7ec8 Pablo Neira Ayuso          2021-04-23  7879  		if (info->nlh->nlmsg_flags & NLM_F_REPLACE)
d62d0ba97b58031 Fernando Fernandez Mancera 2019-08-26  7880  			return -EOPNOTSUPP;
d62d0ba97b58031 Fernando Fernandez Mancera 2019-08-26  7881  
84b1a0c0140a9a9 Pablo Neira Ayuso          2024-03-05  7882  		if (!obj->ops->update)
84b1a0c0140a9a9 Pablo Neira Ayuso          2024-03-05  7883  			return 0;
84b1a0c0140a9a9 Pablo Neira Ayuso          2024-03-05  7884  
2a7dbf052c3b79b Florian Westphal           2024-10-30  7885  		type = nft_obj_type_get(net, objtype, family);
2a7dbf052c3b79b Florian Westphal           2024-10-30 @7886  		if (WARN_ON_ONCE(!type))

s/!type/IS_ERR(type)/

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

