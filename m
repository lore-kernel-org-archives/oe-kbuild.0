Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA4E1CC154
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Oct 2024 17:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729703274; cv=none; b=UmklcvZOqC/uYYSwGxwnLeoRKr7I7Ozruszu5/7xulnDL/+kIq18CFXhrnAw7bWc7akLBjEL7IG3v4jLg2PRphScrN2YaFkbt+msvdPIkqFeBfCgWAj/vI5MuNisovF2uxGHaVL0LsBLa0TzHFLZthk28sw/ltLM+f12CdIPro0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729703274; c=relaxed/simple;
	bh=3ie3tOC4gOEqgMo+kx7AMj4JGUH2QFBDvtJWtHN+/R4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WiyCBJxBgplqbmr0G/7v96HtMa+u4XkONqpXVltYf0U3tJ+mPtky/VOwe9YRDygrERmZrDG+bI7gJsH4sJjafR+IDrum5o/3Xxjm2KgExycdeuKuoexx2M0ffIoShv7ZLFIQkjTtV0jg793o0nyOLFa3FzzTZZcFvPPLMpSmf1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VgW4jHI2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VgW4jHI2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729703273; x=1761239273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ie3tOC4gOEqgMo+kx7AMj4JGUH2QFBDvtJWtHN+/R4=;
  b=VgW4jHI2SP5LSYetUqtXaTPPLF+7yY+1dPrse1JrGYB8gkzNG5hmbs8y
   ve6/aDQ213i0chqgJMG/pdUXu00vlYRhFgRKL9ESmpZ0hPACnHLWjzTVd
   LgzjN6GfbchaeLYayXpi6rqyiojNQkc7J9FOUP9LIpwtndrOPfwSvZCmj
   n6y8jd/RCH17YN9SwgpL7NlKwq/Vkxbjr2tQp4R8ZXi0DrMICe7oSkgx2
   7y/+j6HFNB5IjuoSaGRKlV/31FG3js8LmIFaFA0g79RNU1LIk9iYveOH5
   +hneNp1oiHGqZk7tUD2SEZ5pYbttoSeHt6ckTiqieEzjIQhB2H33SCB6K
   A==;
X-CSE-ConnectionGUID: KvOfn8cyRQCl32UmkWR4iQ==
X-CSE-MsgGUID: QCXTTmt3RGS1qbt9a8ndhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29465825"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29465825"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 10:07:52 -0700
X-CSE-ConnectionGUID: igGSoQBKSl2XI8CM252eNg==
X-CSE-MsgGUID: /mpX/ITiS3aPg5W+s4m8LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="80313144"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Oct 2024 10:07:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3epo-000VCC-0i;
	Wed, 23 Oct 2024 17:07:48 +0000
Date: Thu, 24 Oct 2024 01:07:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net] net: netfilter: Fix use-after-free in get_info()
Message-ID: <202410240020.Cqi2d68p-lkp@intel.com>
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
In-Reply-To: <20241022085753.2069639-1-dongchenchen2@huawei.com>
References: <20241022085753.2069639-1-dongchenchen2@huawei.com>
TO: Dong Chenchen <dongchenchen2@huawei.com>
TO: pablo@netfilter.org
TO: kadlec@netfilter.org
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: fw@strlen.de
TO: kuniyu@amazon.com
CC: netfilter-devel@vger.kernel.org
CC: netdev@vger.kernel.org
CC: yuehaibing@huawei.com
CC: Dong Chenchen <dongchenchen2@huawei.com>

Hi Dong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Dong-Chenchen/net-netfilter-Fix-use-after-free-in-get_info/20241022-165936
base:   net/main
patch link:    https://lore.kernel.org/r/20241022085753.2069639-1-dongchenchen2%40huawei.com
patch subject: [PATCH net] net: netfilter: Fix use-after-free in get_info()
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: x86_64-randconfig-161-20241023 (https://download.01.org/0day-ci/archive/20241024/202410240020.Cqi2d68p-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410240020.Cqi2d68p-lkp@intel.com/

smatch warnings:
net/netfilter/x_tables.c:1280 xt_find_table_lock() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +1280 net/netfilter/x_tables.c

1ef4d6d1af2d0c Florian Westphal  2021-04-21  1233  
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
b9e69e12739718 Florian Westphal  2016-02-25  1276  
fdacd57c79b79a Florian Westphal  2021-08-03  1277  	module_put(owner);
b9e69e12739718 Florian Westphal  2016-02-25  1278   out:
9e19bb6d7a0959 Ingo Molnar       2006-03-25  1279  	mutex_unlock(&xt[af].mutex);
f4f502d5a8ea29 Dong Chenchen     2024-10-22 @1280  	return ERR_PTR(err);
2e4e6a17af35be Harald Welte      2006-01-12  1281  }
2e4e6a17af35be Harald Welte      2006-01-12  1282  EXPORT_SYMBOL_GPL(xt_find_table_lock);
2e4e6a17af35be Harald Welte      2006-01-12  1283  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
