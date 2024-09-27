Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E56317C9AA
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Sep 2024 13:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727442047; cv=none; b=jssbY3dbUTCTq/UwKXfF6R0MneEkjfPYlhAbH/sQL0BJDsrjOTSu9EDJ+vejPxdoro208aZQI5YWM+6k4s+KPXAjFqRCl0BUSBb3Y7K2ysvQfVBGwExv+MHV2bGp0w1I4htkXAJAAEupRGvUqq6zDR9szwpjwns0XPhKnb+7AAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727442047; c=relaxed/simple;
	bh=CSiK4IiJ4vFX62SwCE043OFA39phZrmVwaXKA/MLodg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZCxwHQXxCGxG+alslfDLVjb0JCA3pA/C8KxCcz8Q65d0nlGI5ZTgDtlrQFsLG23IAWLv4tlk5HbZDdJCpOQsg27qXD6+73j3qzz1TVjxDa/ar5V1qlVXt/11YvpF0kyd2PswDT+iPeAkHEFMoHk93801p9DTG1JJAIlm/hVmmnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HhZIhfNc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HhZIhfNc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727442045; x=1758978045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CSiK4IiJ4vFX62SwCE043OFA39phZrmVwaXKA/MLodg=;
  b=HhZIhfNcwF7UPGusH2GC30mviy+v/UWalnez2UTHXE7kK1UylmzwtNNA
   /ZK+u6070OhxkbTL715lUPvOJxbhSErW06AymqTrA7hAKzWhOZetyrzHo
   i8FisIRfWm3UGIKOmuU2yrf5ZGSJ6J4yvcuQGwdSZBoh7fPMMbs0BBpf6
   l+hpADVOxz/ONmMkuPsd2IgGg5mcwdD1JphKk0c27b9D1Pc61lgjVBQ0B
   +dBcFndoZXcFkIeSw5goOgBJEOo6sJlg856bSQU5955yTVog2yzzL7gL8
   xH6baDUxa/mW2SgtBkfcG5+LMJwCJAftJ35i4CRBG19kemoNHYSp06Fhe
   Q==;
X-CSE-ConnectionGUID: 37k70scLSlSjRDLk59deQw==
X-CSE-MsgGUID: ILYS/oUmR9Wc2yuLiS1BKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="51998268"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="51998268"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 06:00:24 -0700
X-CSE-ConnectionGUID: J8+pAtZ4Q2qiORMt9K1qnA==
X-CSE-MsgGUID: ouO4lMl0SW6VDe5sDQUMkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="72607803"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Sep 2024 06:00:23 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suAa4-000M9a-2d;
	Fri, 27 Sep 2024 13:00:20 +0000
Date: Fri, 27 Sep 2024 20:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cip:linux-4.19.y-cip-rebase 576/965] drivers/usb/typec/mux.c:169
 typec_mux_match() warn: missing unwind goto?
Message-ID: <202409272010.RJVqF8In-lkp@intel.com>
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
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rebase
head:   43848671a69f7ed12a877f0249e0e1b1a1628066
commit: 61703341348288c799c78660d36d1ddabad29ccc [576/965] usb: typec: mux: Fix unsigned comparison with less than zero
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20240927 (https://download.01.org/0day-ci/archive/20240927/202409272010.RJVqF8In-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409272010.RJVqF8In-lkp@intel.com/

smatch warnings:
drivers/usb/typec/mux.c:169 typec_mux_match() warn: missing unwind goto?

vim +169 drivers/usb/typec/mux.c

bdecb33af34f79 Heikki Krogerus 2018-03-20  124  
bdecb33af34f79 Heikki Krogerus 2018-03-20  125  static void *typec_mux_match(struct device_connection *con, int ep, void *data)
bdecb33af34f79 Heikki Krogerus 2018-03-20  126  {
4c4129e8af94c1 Heikki Krogerus 2020-02-21  127  	const struct typec_altmode_desc *desc = data;
bdecb33af34f79 Heikki Krogerus 2018-03-20  128  	struct typec_mux *mux;
61703341348288 YueHaibing      2020-02-21  129  	int nval;
4c4129e8af94c1 Heikki Krogerus 2020-02-21  130  	bool match;
4c4129e8af94c1 Heikki Krogerus 2020-02-21  131  	u16 *val;
4c4129e8af94c1 Heikki Krogerus 2020-02-21  132  	int i;
bdecb33af34f79 Heikki Krogerus 2018-03-20  133  
4c4129e8af94c1 Heikki Krogerus 2020-02-21  134  	if (!con->fwnode) {
bdecb33af34f79 Heikki Krogerus 2018-03-20  135  		list_for_each_entry(mux, &mux_list, entry)
bdecb33af34f79 Heikki Krogerus 2018-03-20  136  			if (!strcmp(con->endpoint[ep], dev_name(mux->dev)))
bdecb33af34f79 Heikki Krogerus 2018-03-20  137  				return mux;
4c4129e8af94c1 Heikki Krogerus 2020-02-21  138  		return ERR_PTR(-EPROBE_DEFER);
4c4129e8af94c1 Heikki Krogerus 2020-02-21  139  	}
bdecb33af34f79 Heikki Krogerus 2018-03-20  140  
bdecb33af34f79 Heikki Krogerus 2018-03-20  141  	/*
4c4129e8af94c1 Heikki Krogerus 2020-02-21  142  	 * Check has the identifier already been "consumed". If it
4c4129e8af94c1 Heikki Krogerus 2020-02-21  143  	 * has, no need to do any extra connection identification.
bdecb33af34f79 Heikki Krogerus 2018-03-20  144  	 */
4c4129e8af94c1 Heikki Krogerus 2020-02-21  145  	match = !con->id;
4c4129e8af94c1 Heikki Krogerus 2020-02-21  146  	if (match)
4c4129e8af94c1 Heikki Krogerus 2020-02-21  147  		goto find_mux;
4c4129e8af94c1 Heikki Krogerus 2020-02-21  148  
4c4129e8af94c1 Heikki Krogerus 2020-02-21  149  	/* Accessory Mode muxes */
4c4129e8af94c1 Heikki Krogerus 2020-02-21  150  	if (!desc) {
4c4129e8af94c1 Heikki Krogerus 2020-02-21  151  		match = fwnode_property_present(con->fwnode, "accessory");
4c4129e8af94c1 Heikki Krogerus 2020-02-21  152  		if (match)
4c4129e8af94c1 Heikki Krogerus 2020-02-21  153  			goto find_mux;
4c4129e8af94c1 Heikki Krogerus 2020-02-21  154  		return NULL;
4c4129e8af94c1 Heikki Krogerus 2020-02-21  155  	}
4c4129e8af94c1 Heikki Krogerus 2020-02-21  156  
4c4129e8af94c1 Heikki Krogerus 2020-02-21  157  	/* Alternate Mode muxes */
4c4129e8af94c1 Heikki Krogerus 2020-02-21  158  	nval = fwnode_property_read_u16_array(con->fwnode, "svid", NULL, 0);
4c4129e8af94c1 Heikki Krogerus 2020-02-21  159  	if (nval <= 0)
4c4129e8af94c1 Heikki Krogerus 2020-02-21  160  		return NULL;
4c4129e8af94c1 Heikki Krogerus 2020-02-21  161  
4c4129e8af94c1 Heikki Krogerus 2020-02-21  162  	val = kcalloc(nval, sizeof(*val), GFP_KERNEL);
4c4129e8af94c1 Heikki Krogerus 2020-02-21  163  	if (!val)
4c4129e8af94c1 Heikki Krogerus 2020-02-21  164  		return ERR_PTR(-ENOMEM);
4c4129e8af94c1 Heikki Krogerus 2020-02-21  165  
4c4129e8af94c1 Heikki Krogerus 2020-02-21  166  	nval = fwnode_property_read_u16_array(con->fwnode, "svid", val, nval);
4c4129e8af94c1 Heikki Krogerus 2020-02-21  167  	if (nval < 0) {
4c4129e8af94c1 Heikki Krogerus 2020-02-21  168  		kfree(val);
4c4129e8af94c1 Heikki Krogerus 2020-02-21 @169  		return ERR_PTR(nval);
4c4129e8af94c1 Heikki Krogerus 2020-02-21  170  	}
4c4129e8af94c1 Heikki Krogerus 2020-02-21  171  
4c4129e8af94c1 Heikki Krogerus 2020-02-21  172  	for (i = 0; i < nval; i++) {
4c4129e8af94c1 Heikki Krogerus 2020-02-21  173  		match = val[i] == desc->svid;
4c4129e8af94c1 Heikki Krogerus 2020-02-21  174  		if (match) {
4c4129e8af94c1 Heikki Krogerus 2020-02-21  175  			kfree(val);
4c4129e8af94c1 Heikki Krogerus 2020-02-21  176  			goto find_mux;
4c4129e8af94c1 Heikki Krogerus 2020-02-21  177  		}
4c4129e8af94c1 Heikki Krogerus 2020-02-21  178  	}
4c4129e8af94c1 Heikki Krogerus 2020-02-21  179  	kfree(val);
4c4129e8af94c1 Heikki Krogerus 2020-02-21  180  	return NULL;
4c4129e8af94c1 Heikki Krogerus 2020-02-21  181  
4c4129e8af94c1 Heikki Krogerus 2020-02-21  182  find_mux:
4c4129e8af94c1 Heikki Krogerus 2020-02-21  183  	list_for_each_entry(mux, &mux_list, entry)
4c4129e8af94c1 Heikki Krogerus 2020-02-21  184  		if (dev_fwnode(mux->dev) == con->fwnode)
4c4129e8af94c1 Heikki Krogerus 2020-02-21  185  			return mux;
4c4129e8af94c1 Heikki Krogerus 2020-02-21  186  
4c4129e8af94c1 Heikki Krogerus 2020-02-21  187  	return match ? ERR_PTR(-EPROBE_DEFER) : NULL;
bdecb33af34f79 Heikki Krogerus 2018-03-20  188  }
bdecb33af34f79 Heikki Krogerus 2018-03-20  189  

:::::: The code at line 169 was first introduced by commit
:::::: 4c4129e8af94c11836bd48f475df6fa319c9fada usb: typec: mux: Find the muxes by also matching against the device node

:::::: TO: Heikki Krogerus <heikki.krogerus@linux.intel.com>
:::::: CC: Pavel Machek <pavel@ucw.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
