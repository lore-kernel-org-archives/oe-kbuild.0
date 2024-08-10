Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394CA446A2
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Aug 2024 21:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723324694; cv=none; b=QfRlWEXsCAtAGnctAEwqyUmTsKyLlWr19AA2mtyCVBUZqbTofb/X27jNEC4BpFiOEW1kwpw0uA9E2n8O9YDy4AfCjD18f7lrD61BovzBItzU4Z2R+UlpSiaaSS0WobFxnWZvvUGZ01muQSMvVdijvCeGEtYExionvvtpdGBzZHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723324694; c=relaxed/simple;
	bh=/dgnm5zTIZG/QUV+WtVCzl+RTWPTeSF0mXIDBvu4F54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t+LUVuQbWDPSQg/L2xf8KpoPclp2F2RgYC7g55cpRjqzkDDgvtIa4dm8zEg+67S+kRwY7IDGle3CmA27NLByllEhqObXmJ00jaiS75uZDLUsb98eUSJjLmzJqPiVrbTHBR0/qMdvD/3OAjhqr03Vwom/wRpk3WkMh8AzVsCwa8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jl3SHfcr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jl3SHfcr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723324693; x=1754860693;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/dgnm5zTIZG/QUV+WtVCzl+RTWPTeSF0mXIDBvu4F54=;
  b=Jl3SHfcrRZpiKJZN454XbJHc4EzsxmxoQZuCHWMYqc9dtoa7DqndWLka
   0JZgGhgmzswdU9K/H7Ne0Do0OnZtte1X2EuSGAXUXTdLt88rtTcEt3GMh
   PTXu79aybBIvqgH5E9o3yFxUoiE3vK8Gz0lHqLRFN7eLMZoH/hTPNgZxP
   ctdsOhPyvh7TdSbxb7J16en119y9Vm0qowQvtiQckcPZcFhwHYRVJ2xkJ
   7b87sNvo2F7skJvYYyBTK3J/jnJiIoZirwpVUsaUICF8vvXgs0ikD3vUD
   +lxTHTqQDuZo9xml6PiStPG3PFPd7utvwp2Bm/rX9BskEheuNnmrpbUwF
   w==;
X-CSE-ConnectionGUID: JPEt4aoFRQ2ZTBb/IbGNVg==
X-CSE-MsgGUID: naqe/ZjWQaOThEEojxUrzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="21329625"
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="21329625"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 14:18:12 -0700
X-CSE-ConnectionGUID: O/y/Y2YnR+SojBgNeY8MRQ==
X-CSE-MsgGUID: JoCf30QQQU6Se9O08LI1rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="62723619"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 10 Aug 2024 14:18:10 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sctTQ-000AJ1-1C;
	Sat, 10 Aug 2024 21:18:05 +0000
Date: Sun, 11 Aug 2024 05:17:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/3] crypto: api - Do not wait for tests during
 registration
Message-ID: <202408110413.vKk2q3qN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <ZrbTfOViUr3S4V7X@gondor.apana.org.au>
References: <ZrbTfOViUr3S4V7X@gondor.apana.org.au>
TO: Herbert Xu <herbert@gondor.apana.org.au>
TO: Linus Torvalds <torvalds@linux-foundation.org>
CC: LKML <linux-kernel@vger.kernel.org>
CC: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: "Horia Geantă" <horia.geanta@nxp.com>
CC: Ard Biesheuvel <ardb@kernel.org>
CC: linux-crypto@vger.kernel.org

Hi Herbert,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linux/master linus/master v6.11-rc2 next-20240809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herbert-Xu/crypto-api-Do-not-wait-for-tests-during-registration/20240810-160343
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/ZrbTfOViUr3S4V7X%40gondor.apana.org.au
patch subject: [PATCH 2/3] crypto: api - Do not wait for tests during registration
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: x86_64-randconfig-161-20240811 (https://download.01.org/0day-ci/archive/20240811/202408110413.vKk2q3qN-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408110413.vKk2q3qN-lkp@intel.com/

smatch warnings:
crypto/algapi.c:396 crypto_alg_tested() error: uninitialized symbol 'test'.

vim +/test +396 crypto/algapi.c

73d3864a4823ab Herbert Xu     2008-08-03  349  
73d3864a4823ab Herbert Xu     2008-08-03  350  void crypto_alg_tested(const char *name, int err)
73d3864a4823ab Herbert Xu     2008-08-03  351  {
73d3864a4823ab Herbert Xu     2008-08-03  352  	struct crypto_larval *test;
73d3864a4823ab Herbert Xu     2008-08-03  353  	struct crypto_alg *alg;
73d3864a4823ab Herbert Xu     2008-08-03  354  	struct crypto_alg *q;
73d3864a4823ab Herbert Xu     2008-08-03  355  	LIST_HEAD(list);
73d3864a4823ab Herbert Xu     2008-08-03  356  
73d3864a4823ab Herbert Xu     2008-08-03  357  	down_write(&crypto_alg_sem);
73d3864a4823ab Herbert Xu     2008-08-03  358  	list_for_each_entry(q, &crypto_alg_list, cra_list) {
b8e15992b420d0 Herbert Xu     2009-01-28  359  		if (crypto_is_moribund(q) || !crypto_is_larval(q))
73d3864a4823ab Herbert Xu     2008-08-03  360  			continue;
73d3864a4823ab Herbert Xu     2008-08-03  361  
73d3864a4823ab Herbert Xu     2008-08-03  362  		test = (struct crypto_larval *)q;
73d3864a4823ab Herbert Xu     2008-08-03  363  
73d3864a4823ab Herbert Xu     2008-08-03  364  		if (!strcmp(q->cra_driver_name, name))
73d3864a4823ab Herbert Xu     2008-08-03  365  			goto found;
73d3864a4823ab Herbert Xu     2008-08-03  366  	}
73d3864a4823ab Herbert Xu     2008-08-03  367  
c72358571aaadf Karim Eshapa   2017-05-13  368  	pr_err("alg: Unexpected test result for %s: %d\n", name, err);
73d3864a4823ab Herbert Xu     2008-08-03  369  	goto unlock;
73d3864a4823ab Herbert Xu     2008-08-03  370  
73d3864a4823ab Herbert Xu     2008-08-03  371  found:
b8e15992b420d0 Herbert Xu     2009-01-28  372  	q->cra_flags |= CRYPTO_ALG_DEAD;
73d3864a4823ab Herbert Xu     2008-08-03  373  	alg = test->adult;
d6097b8d5d55f2 Nicolai Stange 2022-02-21  374  
d6097b8d5d55f2 Nicolai Stange 2022-02-21  375  	if (list_empty(&alg->cra_list))
73d3864a4823ab Herbert Xu     2008-08-03  376  		goto complete;
73d3864a4823ab Herbert Xu     2008-08-03  377  
d6097b8d5d55f2 Nicolai Stange 2022-02-21  378  	if (err == -ECANCELED)
d6097b8d5d55f2 Nicolai Stange 2022-02-21  379  		alg->cra_flags |= CRYPTO_ALG_FIPS_INTERNAL;
d6097b8d5d55f2 Nicolai Stange 2022-02-21  380  	else if (err)
73d3864a4823ab Herbert Xu     2008-08-03  381  		goto complete;
d6097b8d5d55f2 Nicolai Stange 2022-02-21  382  	else
d6097b8d5d55f2 Nicolai Stange 2022-02-21  383  		alg->cra_flags &= ~CRYPTO_ALG_FIPS_INTERNAL;
73d3864a4823ab Herbert Xu     2008-08-03  384  
73d3864a4823ab Herbert Xu     2008-08-03  385  	alg->cra_flags |= CRYPTO_ALG_TESTED;
73d3864a4823ab Herbert Xu     2008-08-03  386  
103961609b0935 Herbert Xu     2024-08-10  387  	crypto_alg_finish_registration(alg, &list);
cce9e06d100df1 Herbert Xu     2006-08-21  388  
73d3864a4823ab Herbert Xu     2008-08-03  389  complete:
862e4618d9321e Herbert Xu     2024-08-10  390  	list_del_init(&test->alg.cra_list);
73d3864a4823ab Herbert Xu     2008-08-03  391  	complete_all(&test->completion);
2825982d9d66eb Herbert Xu     2006-08-06  392  
73d3864a4823ab Herbert Xu     2008-08-03  393  unlock:
73d3864a4823ab Herbert Xu     2008-08-03  394  	up_write(&crypto_alg_sem);
2825982d9d66eb Herbert Xu     2006-08-06  395  
862e4618d9321e Herbert Xu     2024-08-10 @396  	crypto_alg_put(&test->alg);
73d3864a4823ab Herbert Xu     2008-08-03  397  	crypto_remove_final(&list);
cce9e06d100df1 Herbert Xu     2006-08-21  398  }
73d3864a4823ab Herbert Xu     2008-08-03  399  EXPORT_SYMBOL_GPL(crypto_alg_tested);
4cc7720cd16527 Herbert Xu     2006-08-06  400  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
