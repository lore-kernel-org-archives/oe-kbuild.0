Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8701F567D
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Jul 2024 02:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719975389; cv=none; b=uhGcpFPOjo2PARLCoqcS0+5+pLkCDeG/w9Yi6SbeclkrPREfNXB/+sHCCbplVOMYET+R9wC8B96uVfxvIYA4gBCBNshForVPzW2U+BKl2dfPh7oIFNM74a2ZeXqJJrhaZTgBplj742sfnYs74lOtIyaN954R+QD3vvHmbvV9E+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719975389; c=relaxed/simple;
	bh=sv1nSPqlzYhDPeLIa/iQktUIj+4wpnxT+9ewPOZ6Rw0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=BSIx59IQEhe1Or/H94SybRfWhEmZnk8+jmpemftJ3wxEukwjal2H673HMCcgFSaltz4S2I7fHXV/naQ22DQTQGaNOYR8DuBbB6HBVIW993RonnIYfaDnF2VMoHHqCS8ti0v/9pZdEBIGtw+jzleYM4VWLL7eEUXODbo27FGsqVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Scbwq0Wy; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Scbwq0Wy"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5c46e6ccd71so378250eaf.1
        for <oe-kbuild@lists.linux.dev>; Tue, 02 Jul 2024 19:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719975385; x=1720580185; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9HKNEygVrZgFGZqDaWX5LbyPqehUaocvjWEdCHipGM=;
        b=Scbwq0Wyrrbd/Z6lp2btHwraXfV2VLOoePQ8yPXslnFDgXe+c1MlcN8qb6F8jTlbVB
         /uNoMLQUpPv5hD9xsacU8ztYf66TdbD48tRjVvllKjJ6Cl0PXAlK6yGkGmqdCyCceIif
         fWxKjEet/ai2/VkNUv2xJvaHIk5gqCVrdbBvHpuKnhuLiqP5byfyLj8ULcNZyjJpNOv7
         DpWBAjWcpAy034GrzHKEsY5zM1lPX9IUFSC1t9jB/tcqXs2U+L2lUJ2dPlMXu1JX2sbL
         ni86c+d08ERaKJQjmexus1Q8gToajQ2Yhnf7eFptTEE/vjQvZ6AT1EJim4KN4iCHrWWG
         XJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719975385; x=1720580185;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q9HKNEygVrZgFGZqDaWX5LbyPqehUaocvjWEdCHipGM=;
        b=MUR8TirQYavbRV24usOSeZGmWRn5wPaZHdk31wgzuInv5419E49OFZgMTwD/snNaXn
         UAxC5lQfZPIwxHauQD9XE77ka3PmlOykUgHQhqHKBBCP47bboZEh++vf6a7OGdWxnEKV
         cXdD3CU1DwxFZMgSJGdUoSq/+PW0ZNhqOzPmBKZZQMWRiDZrPs/xjmGakNRuQyo9LvOq
         gh8nVFotuNByHku5dBSgW9ejV/OUED63UBxiYH4oWByyB/ctwpnbGKyTnWmRMCmD7Y9n
         OG3I6m2NqSxgCyz4TasbTv34Rc+I+lbKza6jb4K2VUZ0KjMb3Hc2dTpbcvnUTeqtijnl
         H7IA==
X-Gm-Message-State: AOJu0YwHaDA77ylLGhqdyxCaVsbm90/IuetJuaKDwtBGE8v0qKWh/ICl
	ZB9VAekNC5jUc9CATLrYtinvshunuNVSu0h7BbGKrr8JWdu9Ml7PrlLcEl3F1G/cHsM5BmwShl3
	e
X-Google-Smtp-Source: AGHT+IH7Qah3ZB3v+EkrCZ+7AIOj0HnClY8WSzziF1xZqg3y7dZo4UtLuOlYdn1GS3TVMvJLy3JAkg==
X-Received: by 2002:a4a:58c8:0:b0:5c3:f576:dc33 with SMTP id 006d021491bc7-5c438e025a6mr11469942eaf.2.1719975384677;
        Tue, 02 Jul 2024 19:56:24 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:a6f1:b7be:4c8c:bf62])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20a00sm1842356a34.63.2024.07.02.19.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 19:56:24 -0700 (PDT)
Date: Wed, 3 Jul 2024 04:56:22 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next v14 12/13] net: ethtool: strset: Allow querying
 phy stats by index
Message-ID: <188ab8d6-ac91-4613-a67f-231d1217b3b5@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701131801.1227740-13-maxime.chevallier@bootlin.com>

Hi Maxime,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/net-phy-Introduce-ethernet-link-topology-representation/20240701-223116
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240701131801.1227740-13-maxime.chevallier%40bootlin.com
patch subject: [PATCH net-next v14 12/13] net: ethtool: strset: Allow querying phy stats by index
config: i386-randconfig-141-20240703 (https://download.01.org/0day-ci/archive/20240703/202407030529.aOYGI0u2-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202407030529.aOYGI0u2-lkp@intel.com/

smatch warnings:
net/ethtool/strset.c:295 strset_prepare_data() warn: variable dereferenced before check 'info' (see line 283)

vim +/info +295 net/ethtool/strset.c

71921690f9745fe Michal Kubecek    2019-12-27  276  static int strset_prepare_data(const struct ethnl_req_info *req_base,
71921690f9745fe Michal Kubecek    2019-12-27  277  			       struct ethnl_reply_data *reply_base,
f946270d05c2604 Jakub Kicinski    2023-08-14  278  			       const struct genl_info *info)
71921690f9745fe Michal Kubecek    2019-12-27  279  {
71921690f9745fe Michal Kubecek    2019-12-27  280  	const struct strset_req_info *req_info = STRSET_REQINFO(req_base);
71921690f9745fe Michal Kubecek    2019-12-27  281  	struct strset_reply_data *data = STRSET_REPDATA(reply_base);
71921690f9745fe Michal Kubecek    2019-12-27  282  	struct net_device *dev = reply_base->dev;
a0400b1b08fea15 Maxime Chevallier 2024-07-01 @283  	struct nlattr **tb = info->attrs;

Unchecked dereference

a0400b1b08fea15 Maxime Chevallier 2024-07-01  284  	struct phy_device *phydev;
71921690f9745fe Michal Kubecek    2019-12-27  285  	unsigned int i;
71921690f9745fe Michal Kubecek    2019-12-27  286  	int ret;
71921690f9745fe Michal Kubecek    2019-12-27  287  
71921690f9745fe Michal Kubecek    2019-12-27  288  	BUILD_BUG_ON(ARRAY_SIZE(info_template) != ETH_SS_COUNT);
71921690f9745fe Michal Kubecek    2019-12-27  289  	memcpy(&data->sets, &info_template, sizeof(data->sets));
71921690f9745fe Michal Kubecek    2019-12-27  290  
71921690f9745fe Michal Kubecek    2019-12-27  291  	if (!dev) {
71921690f9745fe Michal Kubecek    2019-12-27  292  		for (i = 0; i < ETH_SS_COUNT; i++) {
71921690f9745fe Michal Kubecek    2019-12-27  293  			if ((req_info->req_ids & (1U << i)) &&
71921690f9745fe Michal Kubecek    2019-12-27  294  			    data->sets[i].per_dev) {
71921690f9745fe Michal Kubecek    2019-12-27 @295  				if (info)
                                                                                ^^^^^^^^
Check for NULL.  Hopefully it can be deleted?

71921690f9745fe Michal Kubecek    2019-12-27  296  					GENL_SET_ERR_MSG(info, "requested per device strings without dev");
71921690f9745fe Michal Kubecek    2019-12-27  297  				return -EINVAL;
71921690f9745fe Michal Kubecek    2019-12-27  298  			}
71921690f9745fe Michal Kubecek    2019-12-27  299  		}
ac9c41d5a053e71 Dan Carpenter     2020-01-08  300  		return 0;
71921690f9745fe Michal Kubecek    2019-12-27  301  	}
71921690f9745fe Michal Kubecek    2019-12-27  302  
a0400b1b08fea15 Maxime Chevallier 2024-07-01  303  	phydev = ethnl_req_get_phydev(req_base, tb[ETHTOOL_A_HEADER_FLAGS],
a0400b1b08fea15 Maxime Chevallier 2024-07-01  304  				      info->extack);
                                                                                      ^^^^^^^^^^^^
Unchecked dereference

a0400b1b08fea15 Maxime Chevallier 2024-07-01  305  
a0400b1b08fea15 Maxime Chevallier 2024-07-01  306  	/* phydev can be NULL, check for errors only */
a0400b1b08fea15 Maxime Chevallier 2024-07-01  307  	if (IS_ERR(phydev))
a0400b1b08fea15 Maxime Chevallier 2024-07-01  308  		return PTR_ERR(phydev);
a0400b1b08fea15 Maxime Chevallier 2024-07-01  309  
71921690f9745fe Michal Kubecek    2019-12-27  310  	ret = ethnl_ops_begin(dev);
71921690f9745fe Michal Kubecek    2019-12-27  311  	if (ret < 0)
71921690f9745fe Michal Kubecek    2019-12-27  312  		goto err_strset;
71921690f9745fe Michal Kubecek    2019-12-27  313  	for (i = 0; i < ETH_SS_COUNT; i++) {
71921690f9745fe Michal Kubecek    2019-12-27  314  		if (!strset_include(req_info, data, i) ||
71921690f9745fe Michal Kubecek    2019-12-27  315  		    !data->sets[i].per_dev)
71921690f9745fe Michal Kubecek    2019-12-27  316  			continue;
71921690f9745fe Michal Kubecek    2019-12-27  317  
a0400b1b08fea15 Maxime Chevallier 2024-07-01  318  		ret = strset_prepare_set(&data->sets[i], dev, phydev, i,
71921690f9745fe Michal Kubecek    2019-12-27  319  					 req_info->counts_only);
71921690f9745fe Michal Kubecek    2019-12-27  320  		if (ret < 0)
71921690f9745fe Michal Kubecek    2019-12-27  321  			goto err_ops;
71921690f9745fe Michal Kubecek    2019-12-27  322  	}
71921690f9745fe Michal Kubecek    2019-12-27  323  	ethnl_ops_complete(dev);
71921690f9745fe Michal Kubecek    2019-12-27  324  
71921690f9745fe Michal Kubecek    2019-12-27  325  	return 0;
71921690f9745fe Michal Kubecek    2019-12-27  326  err_ops:
71921690f9745fe Michal Kubecek    2019-12-27  327  	ethnl_ops_complete(dev);
71921690f9745fe Michal Kubecek    2019-12-27  328  err_strset:
71921690f9745fe Michal Kubecek    2019-12-27  329  	strset_cleanup_data(reply_base);
71921690f9745fe Michal Kubecek    2019-12-27  330  	return ret;
71921690f9745fe Michal Kubecek    2019-12-27  331  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

