Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C4B142633
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Oct 2024 17:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729703791; cv=none; b=WhGVSDjpeeUOlISARqRwtKJLviQHKeSyzwBmSaFhKquaEj9sJ9udiFZmEloFHQP3FPhIyhW5hUEgShRKUjYNzDl4eF+jLQ85Jw97KJP1S0yFW+P03IgIAV7j/zamptNRQY1AUaIqXE5rFzuvHb3F1i6EJ2PY6ckRE/yOORGkW6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729703791; c=relaxed/simple;
	bh=Uv3hkCr5Ps2yRPW2MYv7ATs5YRMkTHa0nqeF+L4acfE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=YS5p5vPwdblLcy2ql3SyQR3hSZUkNpJqOA+D4gaPiC/pQvO4rWRsAocZGABEaP5AYsQgi7IAIrHRNPaJTOKxQSUHZuB3k/mer5IiuEQg/md8dg4YxDnmkoza8zCRXXS+QIHpfxQ4+OS6hMNw91xvt5CyBIpIt4wLjqtyA9M5UlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ywb37eJL; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ywb37eJL"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43161c0068bso28845e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 23 Oct 2024 10:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729703788; x=1730308588; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OljP4PdWV2R3StPPy5+/cJKVw4Vph1NJkS5of3TSma0=;
        b=ywb37eJLunVu6y/3ieyGXTlRGiDH+XYAr3RjtL3Y1QuZVFTDW6p0fUUABozDDxN4kn
         Ron1f42VMQ3g69vq5WHfACP+s+pdkm0f2Bc1EMHKyF4dZk76OAzmX7BSZoLqnvYTQ/vD
         35GBmxNMoJaGUmaOhEqOIGBKuHyM2NtmbPvctMVTuI+W2DK79fS/Pl74KvCYAhKF4qgx
         ZORiBl27+uU+0F/krs5E2liazE6n08ANF4Jp5/y6qiC9Uel+VF3dcfWKuq/dAPI9Tr/D
         a1+J6JdnxqXE3wtZIEh3E8To88MezwMnjkvSA5K789IebT7gvmqfny7WCjnEj4ypt4hQ
         L95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729703788; x=1730308588;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OljP4PdWV2R3StPPy5+/cJKVw4Vph1NJkS5of3TSma0=;
        b=JQmDBbfdrzdOuenvj3CTnbIv/9Hsy80FrUlyLoiHWYveG88ayttcubC1gCQxkg92Eg
         ieH5wKiqak/VPRRpHrwU7bogZfeFs/JiZsaLoJynu+QyUz0Up8AvjRmUdmUZGKRhDL3x
         DzhsuYAhgpK66Xa6j07eJY6WAZ6Fyslz6XvEsflftmvl3Nd1kWCOslg079zzM2RK1Lza
         2ZPo+Mom59XLcdFSRrYpOsiHiXijo8YdjWFrkDffWjNFcWgh7ioYbdfrbqFKnMfKaYt5
         21PuAHpEZCZoRyHfHa7uWv5OJKy6aCaOAl642DUHcxydalT9eKMiL8GdIt/Nb2TY1uuv
         GRZw==
X-Gm-Message-State: AOJu0YyPyHtLXTUKfWwj30PatCuawsHctWPB6kbUPuoHVocJ9bgKwjc/
	cJhBiOq4/A3UKNjdMcwXhy3tuslnkbQGqC/ahsLMtaWTJE/QjMRNuGNneN+cyf7s9LLYpZVNrKF
	c
X-Google-Smtp-Source: AGHT+IHuawpuTA3FdkKB3grmiiT77MshEcjs2fsxx4eyqV28W03YuXYVz0wzAjnd/bp4vmWf9SSucg==
X-Received: by 2002:a5d:6102:0:b0:37d:509e:8742 with SMTP id ffacd0b85a97d-37efceee7d5mr2251003f8f.1.1729703787648;
        Wed, 23 Oct 2024 10:16:27 -0700 (PDT)
Received: from localhost ([41.210.147.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9c6b0sm9307877f8f.109.2024.10.23.10.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 10:16:27 -0700 (PDT)
Date: Wed, 23 Oct 2024 20:16:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dong Chenchen <dongchenchen2@huawei.com>,
	pablo@netfilter.org, kadlec@netfilter.org, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	fw@strlen.de, kuniyu@amazon.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	netfilter-devel@vger.kernel.org, netdev@vger.kernel.org,
	yuehaibing@huawei.com, Dong Chenchen <dongchenchen2@huawei.com>
Subject: Re: [PATCH net] net: netfilter: Fix use-after-free in get_info()
Message-ID: <01b2bdd1-39f4-43d1-a7e6-f8e8061175a4@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022085753.2069639-1-dongchenchen2@huawei.com>

Hi Dong,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Dong-Chenchen/net-netfilter-Fix-use-after-free-in-get_info/20241022-165936
base:   net/main
patch link:    https://lore.kernel.org/r/20241022085753.2069639-1-dongchenchen2%40huawei.com
patch subject: [PATCH net] net: netfilter: Fix use-after-free in get_info()
config: x86_64-randconfig-161-20241023 (https://download.01.org/0day-ci/archive/20241024/202410240020.Cqi2d68p-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410240020.Cqi2d68p-lkp@intel.com/

smatch warnings:
net/netfilter/x_tables.c:1280 xt_find_table_lock() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +1280 net/netfilter/x_tables.c

03d13b6868a261 Florian Westphal  2017-12-08  1234  /* Find table by name, grabs mutex & ref.  Returns ERR_PTR on error. */
76108cea065cda Jan Engelhardt    2008-10-08  1235  struct xt_table *xt_find_table_lock(struct net *net, u_int8_t af,
76108cea065cda Jan Engelhardt    2008-10-08  1236  				    const char *name)
2e4e6a17af35be Harald Welte      2006-01-12  1237  {
1d610d4d31a8ed Florian Westphal  2021-04-01  1238  	struct xt_pernet *xt_net = net_generic(net, xt_pernet_id);
fdacd57c79b79a Florian Westphal  2021-08-03  1239  	struct module *owner = NULL;
fdacd57c79b79a Florian Westphal  2021-08-03  1240  	struct xt_template *tmpl;
fdacd57c79b79a Florian Westphal  2021-08-03  1241  	struct xt_table *t;
f4f502d5a8ea29 Dong Chenchen     2024-10-22  1242  	int err = -ENOENT;
2e4e6a17af35be Harald Welte      2006-01-12  1243  
7926dbfa4bc14e Pablo Neira Ayuso 2014-07-31  1244  	mutex_lock(&xt[af].mutex);
1d610d4d31a8ed Florian Westphal  2021-04-01  1245  	list_for_each_entry(t, &xt_net->tables[af], list)
2e4e6a17af35be Harald Welte      2006-01-12  1246  		if (strcmp(t->name, name) == 0 && try_module_get(t->me))
2e4e6a17af35be Harald Welte      2006-01-12  1247  			return t;
b9e69e12739718 Florian Westphal  2016-02-25  1248  
fdacd57c79b79a Florian Westphal  2021-08-03  1249  	/* Table doesn't exist in this netns, check larval list */
fdacd57c79b79a Florian Westphal  2021-08-03  1250  	list_for_each_entry(tmpl, &xt_templates[af], list) {
fdacd57c79b79a Florian Westphal  2021-08-03  1251  		if (strcmp(tmpl->name, name))
b9e69e12739718 Florian Westphal  2016-02-25  1252  			continue;
fdacd57c79b79a Florian Westphal  2021-08-03  1253  		if (!try_module_get(tmpl->me))
03d13b6868a261 Florian Westphal  2017-12-08  1254  			goto out;
fdacd57c79b79a Florian Westphal  2021-08-03  1255  
fdacd57c79b79a Florian Westphal  2021-08-03  1256  		owner = tmpl->me;
fdacd57c79b79a Florian Westphal  2021-08-03  1257  
b9e69e12739718 Florian Westphal  2016-02-25  1258  		mutex_unlock(&xt[af].mutex);
fdacd57c79b79a Florian Westphal  2021-08-03  1259  		err = tmpl->table_init(net);
03d13b6868a261 Florian Westphal  2017-12-08  1260  		if (err < 0) {
fdacd57c79b79a Florian Westphal  2021-08-03  1261  			module_put(owner);
03d13b6868a261 Florian Westphal  2017-12-08  1262  			return ERR_PTR(err);
b9e69e12739718 Florian Westphal  2016-02-25  1263  		}
b9e69e12739718 Florian Westphal  2016-02-25  1264  
b9e69e12739718 Florian Westphal  2016-02-25  1265  		mutex_lock(&xt[af].mutex);
b9e69e12739718 Florian Westphal  2016-02-25  1266  		break;
b9e69e12739718 Florian Westphal  2016-02-25  1267  	}
b9e69e12739718 Florian Westphal  2016-02-25  1268  
f4f502d5a8ea29 Dong Chenchen     2024-10-22  1269  	if (err < 0)
f4f502d5a8ea29 Dong Chenchen     2024-10-22  1270  		goto out;
f4f502d5a8ea29 Dong Chenchen     2024-10-22  1271  
b9e69e12739718 Florian Westphal  2016-02-25  1272  	/* and once again: */
1d610d4d31a8ed Florian Westphal  2021-04-01  1273  	list_for_each_entry(t, &xt_net->tables[af], list)
b9e69e12739718 Florian Westphal  2016-02-25  1274  		if (strcmp(t->name, name) == 0)
b9e69e12739718 Florian Westphal  2016-02-25  1275  			return t;

ret it zero here, but if we fail to find the name then we should set ret =
-ENOENT;

b9e69e12739718 Florian Westphal  2016-02-25  1276  
fdacd57c79b79a Florian Westphal  2021-08-03  1277  	module_put(owner);
b9e69e12739718 Florian Westphal  2016-02-25  1278   out:
9e19bb6d7a0959 Ingo Molnar       2006-03-25  1279  	mutex_unlock(&xt[af].mutex);
f4f502d5a8ea29 Dong Chenchen     2024-10-22 @1280  	return ERR_PTR(err);
2e4e6a17af35be Harald Welte      2006-01-12  1281  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

