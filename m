Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E9D18E02D
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Oct 2024 10:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729592614; cv=none; b=sJBIq5f9ncvVFHEsid3L4s/2fCuZqFOm6rZYR6iLOADV7hGR4JckuOKQyNFT9zInwjbLzG9368gU7lekR05xeO01hJS//F78oIvsv8lpcYfWAlwaxqAakAnheGfJ8Ohlm1Lw7pvlizmXeESVI4BICK/ZdKBCbTUUjLoY1GmA2Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729592614; c=relaxed/simple;
	bh=+4zzqI6fRN7PebsrH31jZhFCpibxZ5bcU/BAproes+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ersdnlNojGwrcZkvN/1RG+aOpk3+4lqahaEzrB4FZagy6aeed8PffeazCdsxTR6iUO8u9ATKH4sDO2GVwixIRjiM4NOEYwx/aghc2MvV/jp0Y6okNekMnWnS9owP48qu3NkisXDbntmI+wkzetY7t7iE63bNYV5w8x3+at3iwOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V800Eez+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V800Eez+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729592613; x=1761128613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+4zzqI6fRN7PebsrH31jZhFCpibxZ5bcU/BAproes+o=;
  b=V800Eez+m4FMGNb9XVJj1mN4KEAjGkd1sAfATYnqpoLzcle6flPshqvi
   k5CbsNaBmhrueH4eZ1YjWAKouVE10CzqoPiQ8LKpuLldqZnJRN6giuIPc
   1APVUSrMZBbkc3M+bktiVUoHN2qqa7xyitWwu6Q2ndVy75BwQaLtrq5So
   IzqABdI3k0fWjPvXaJbIQ5bs47gQfdsVOUfhmmYJ/jfefU5oVp+Er4KTy
   9zUwYJN0jIsFofnF8317ScDtLFH4CPplRUOt7czL4TLzGAtsDa1plJnsF
   Th37GGANqeMPTz/+XQFM9RxtQrW7+Q6aqmGhEvJ48CoajspAGuHIdW5r/
   w==;
X-CSE-ConnectionGUID: 0c/BAsPJTQ+8XxBVOTryKg==
X-CSE-MsgGUID: mJTPgLv2Sma1WwqAmWcUnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32809929"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32809929"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 03:23:32 -0700
X-CSE-ConnectionGUID: 9Obe0A1NQr2FQJsbZE5BYQ==
X-CSE-MsgGUID: NKYTRAKyTRmThnEdDm/iOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="84418755"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Oct 2024 03:23:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3C2z-000TQo-02;
	Tue, 22 Oct 2024 10:23:29 +0000
Date: Tue, 22 Oct 2024 18:23:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/hisilicon/sec2/sec_crypto.c:2556
 sec_register_to_crypto() warn: missing error code 'ret'
Message-ID: <202410221821.ID6pEWb1-lkp@intel.com>
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
TO: Weili Qian <qianweili@huawei.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c2ee9f594da826bea183ed14f2cc029c719bf4da
commit: b42ab1c61a77832040ad42ebf9adf237360e49f7 crypto: hisilicon/qm - check function qp num before alg register
date:   1 year, 1 month ago
:::::: branch date: 11 hours ago
:::::: commit date: 1 year, 1 month ago
config: loongarch-randconfig-r071-20241022 (https://download.01.org/0day-ci/archive/20241022/202410221821.ID6pEWb1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410221821.ID6pEWb1-lkp@intel.com/

smatch warnings:
drivers/crypto/hisilicon/sec2/sec_crypto.c:2556 sec_register_to_crypto() warn: missing error code 'ret'

vim +/ret +2556 drivers/crypto/hisilicon/sec2/sec_crypto.c

921715b6b78271 Wenkai Lin 2022-09-09  2547  
921715b6b78271 Wenkai Lin 2022-09-09  2548  int sec_register_to_crypto(struct hisi_qm *qm)
921715b6b78271 Wenkai Lin 2022-09-09  2549  {
921715b6b78271 Wenkai Lin 2022-09-09  2550  	u64 alg_mask = sec_get_alg_bitmap(qm, SEC_DRV_ALG_BITMAP_HIGH, SEC_DRV_ALG_BITMAP_LOW);
b42ab1c61a7783 Weili Qian 2023-09-28  2551  	int ret = 0;
b42ab1c61a7783 Weili Qian 2023-09-28  2552  
b42ab1c61a7783 Weili Qian 2023-09-28  2553  	mutex_lock(&sec_algs_lock);
b42ab1c61a7783 Weili Qian 2023-09-28  2554  	if (sec_available_devs) {
b42ab1c61a7783 Weili Qian 2023-09-28  2555  		sec_available_devs++;
b42ab1c61a7783 Weili Qian 2023-09-28 @2556  		goto unlock;
b42ab1c61a7783 Weili Qian 2023-09-28  2557  	}
921715b6b78271 Wenkai Lin 2022-09-09  2558  
921715b6b78271 Wenkai Lin 2022-09-09  2559  	ret = sec_register_skcipher(alg_mask);
921715b6b78271 Wenkai Lin 2022-09-09  2560  	if (ret)
b42ab1c61a7783 Weili Qian 2023-09-28  2561  		goto unlock;
7b44c0eecd6ade Kai Ye     2021-05-28  2562  
921715b6b78271 Wenkai Lin 2022-09-09  2563  	ret = sec_register_aead(alg_mask);
921715b6b78271 Wenkai Lin 2022-09-09  2564  	if (ret)
b42ab1c61a7783 Weili Qian 2023-09-28  2565  		goto unreg_skcipher;
921715b6b78271 Wenkai Lin 2022-09-09  2566  
b42ab1c61a7783 Weili Qian 2023-09-28  2567  	sec_available_devs++;
b42ab1c61a7783 Weili Qian 2023-09-28  2568  	mutex_unlock(&sec_algs_lock);
b42ab1c61a7783 Weili Qian 2023-09-28  2569  
b42ab1c61a7783 Weili Qian 2023-09-28  2570  	return 0;
b42ab1c61a7783 Weili Qian 2023-09-28  2571  
b42ab1c61a7783 Weili Qian 2023-09-28  2572  unreg_skcipher:
b42ab1c61a7783 Weili Qian 2023-09-28  2573  	sec_unregister_skcipher(alg_mask, ARRAY_SIZE(sec_skciphers));
b42ab1c61a7783 Weili Qian 2023-09-28  2574  unlock:
b42ab1c61a7783 Weili Qian 2023-09-28  2575  	mutex_unlock(&sec_algs_lock);
416d82204df44e Zaibo Xu   2019-11-13  2576  	return ret;
416d82204df44e Zaibo Xu   2019-11-13  2577  }
416d82204df44e Zaibo Xu   2019-11-13  2578  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
