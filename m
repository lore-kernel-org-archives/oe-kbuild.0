Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0262025B085
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Aug 2026 16:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786208027; cv=none; b=t8zD9C2o9nUEGQl8wGbGf/BYWOhodGhXaEmjONDliKufvtHaB68wabtqhMaEoNxGNrNgBEiht+VZpA0APeF0qFo5jZuUCVtJvyWV1ibxkt7S5AelqlJGwObqhvvR3oTCOm4mIaxvq+nZMEqfHBHBT/+V7OyF7Qy2fjVyMKi2xyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786208027; c=relaxed/simple;
	bh=WmDmJR0VnyplokIdizzfEy32fDQYzVgKm/deoVqzUnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QG7lOKHWcFtn7n6TzdiF+fWEjXi8xuo8fYb50v6hcl3jfCxVgAJmfbafzafVDaPp4cRf3EP1MdZi+zzt0SJ3eVhUusaJI+d1LwGmpZquUVl0NLk58zPYvZCLRDeCFtwfBqjC3/sa8ZfKE/ivRgYMIICGjsx3h/uTkMop92rzAF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbzR3qBC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbzR3qBC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786208020; x=1817744020;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WmDmJR0VnyplokIdizzfEy32fDQYzVgKm/deoVqzUnY=;
  b=FbzR3qBC+diedRbGDtyYNA3PfcFWvo0KhTCljxwCAkyftSqmJSgsLdld
   h8qzYTk/I/Vou4RJ5k3SQH1pQxR2agl20M6RNKTXqDmQRbsdjDK3WVoPo
   V31YeCRvX8Nl0GDmcDPKFiJx2MvUEuKGJ7rfdxHSxmgMJwMc2n0NFRzB0
   6Tq66KMU6tZQAafor56X23bT7lpaYxKfXopL9BJzPNdPspkEoHD4FEiic
   Kmts3brMIsHUARZcsHlDxnLDaNfa2gsEPG2mOh+7+Oj+aY9Yte3OilYmP
   a3jS+DMzp3hbDj0NIX+ErOujvtQYhqTrd1J096nItgHHeP1J5Pbi3yKBC
   Q==;
X-CSE-ConnectionGUID: h3iOx31CRZ27H/rqHxrz7A==
X-CSE-MsgGUID: NuoatxZPQ5+rAsuWCbHFEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="97138097"
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="97138097"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 09:53:39 -0700
X-CSE-ConnectionGUID: 8lZCSjG/RaKXXLl5kRO73A==
X-CSE-MsgGUID: h48xa6Q8TuO0/znnpDANKg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Aug 2026 09:53:38 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wskIh-00000000KRR-22bI;
	Sat, 08 Aug 2026 16:53:35 +0000
Date: Sun, 9 Aug 2026 00:53:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1] clk: devres: fix cleanup in
 devm_clk_get_optional_enabled_with_rate()
Message-ID: <202608090025.dwxdfqFr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260801111637.304590-1-work@onurozkan.dev>
References: <20260801111637.304590-1-work@onurozkan.dev>
TO: "Onur Özkan" <work@onurozkan.dev>
TO: linux-clk@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: mturquette@baylibre.com
CC: sboyd@kernel.org
CC: bmasney@redhat.com
CC: daniel.almeida@collabora.com
CC: "Onur Özkan" <work@onurozkan.dev>

Hi Onur,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linux-review/Daniel-Almeida/rust-clk-use-the-type-state-pattern/20260706-224926]

url:    https://github.com/intel-lab-lkp/linux/commits/Onur-zkan/clk-devres-fix-cleanup-in-devm_clk_get_optional_enabled_with_rate/20260805-211528
base:   https://github.com/intel-lab-lkp/linux Daniel-Almeida/rust-clk-use-the-type-state-pattern/20260706-224926
patch link:    https://lore.kernel.org/r/20260801111637.304590-1-work%40onurozkan.dev
patch subject: [PATCH v1] clk: devres: fix cleanup in devm_clk_get_optional_enabled_with_rate()
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: parisc-randconfig-r071-20260808 (https://download.01.org/0day-ci/archive/20260809/202608090025.dwxdfqFr-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608090025.dwxdfqFr-lkp@intel.com/

smatch warnings:
drivers/clk/clk-devres.c:134 devm_clk_get_optional_enabled_with_rate() warn: 'clk' from clk_prepare_enable() not released on lines: 134.

vim +/clk +134 drivers/clk/clk-devres.c

1c34a54a924f326 Onur Özkan          2026-08-01  106  
9934a1bd45b2b03 Bartosz Golaszewski 2024-08-05  107  struct clk *devm_clk_get_optional_enabled_with_rate(struct device *dev,
9934a1bd45b2b03 Bartosz Golaszewski 2024-08-05  108  						    const char *id,
9934a1bd45b2b03 Bartosz Golaszewski 2024-08-05  109  						    unsigned long rate)
9934a1bd45b2b03 Bartosz Golaszewski 2024-08-05  110  {
9934a1bd45b2b03 Bartosz Golaszewski 2024-08-05  111  	struct clk *clk;
9934a1bd45b2b03 Bartosz Golaszewski 2024-08-05  112  	int ret;
9934a1bd45b2b03 Bartosz Golaszewski 2024-08-05  113  
1c34a54a924f326 Onur Özkan          2026-08-01  114  	clk = devm_clk_get_optional(dev, id);
9934a1bd45b2b03 Bartosz Golaszewski 2024-08-05  115  	if (IS_ERR(clk))
9934a1bd45b2b03 Bartosz Golaszewski 2024-08-05  116  		return ERR_CAST(clk);
9934a1bd45b2b03 Bartosz Golaszewski 2024-08-05  117  
9934a1bd45b2b03 Bartosz Golaszewski 2024-08-05  118  	ret = clk_set_rate(clk, rate);
9934a1bd45b2b03 Bartosz Golaszewski 2024-08-05  119  	if (ret)
9934a1bd45b2b03 Bartosz Golaszewski 2024-08-05  120  		goto out_put_clk;
9934a1bd45b2b03 Bartosz Golaszewski 2024-08-05  121  
9934a1bd45b2b03 Bartosz Golaszewski 2024-08-05  122  	ret = clk_prepare_enable(clk);
9934a1bd45b2b03 Bartosz Golaszewski 2024-08-05  123  	if (ret)
9934a1bd45b2b03 Bartosz Golaszewski 2024-08-05  124  		goto out_put_clk;
9934a1bd45b2b03 Bartosz Golaszewski 2024-08-05  125  
1c34a54a924f326 Onur Özkan          2026-08-01  126  	ret = devm_add_action_or_reset(dev, devm_clk_disable_unprepare, clk);
1c34a54a924f326 Onur Özkan          2026-08-01  127  	if (ret)
1c34a54a924f326 Onur Özkan          2026-08-01  128  		goto out_put_clk;
1c34a54a924f326 Onur Özkan          2026-08-01  129  
9934a1bd45b2b03 Bartosz Golaszewski 2024-08-05  130  	return clk;
9934a1bd45b2b03 Bartosz Golaszewski 2024-08-05  131  
9934a1bd45b2b03 Bartosz Golaszewski 2024-08-05  132  out_put_clk:
9934a1bd45b2b03 Bartosz Golaszewski 2024-08-05  133  	devm_clk_put(dev, clk);
9934a1bd45b2b03 Bartosz Golaszewski 2024-08-05 @134  	return ERR_PTR(ret);
9934a1bd45b2b03 Bartosz Golaszewski 2024-08-05  135  }
9934a1bd45b2b03 Bartosz Golaszewski 2024-08-05  136  EXPORT_SYMBOL_GPL(devm_clk_get_optional_enabled_with_rate);
9934a1bd45b2b03 Bartosz Golaszewski 2024-08-05  137  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
