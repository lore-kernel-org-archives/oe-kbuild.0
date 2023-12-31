Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D5D20F2
	for <oe-kbuild@lists.linux.dev>; Sun, 31 Dec 2023 05:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i3L60j8m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704000161; x=1735536161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4LXwdEGS5SnIt6npkJRNIWCCTuOkFJNYPNoV5+FzmUs=;
  b=i3L60j8mDOW/ZQeUZO1qpat5xJs9q/NjSmuX8QwDBnsCvKKonFHbVJ5N
   eAu9fcuEG+zh/FDeHQzvdEjNsE7PtY9NQFTNreKBv2l5T8We0HP3EpDhK
   qA2w4VC8SleSCVs5hS2Q7U+jc8sXr3KEbrLcS7xoxM0mm4ToN/GYVK/sf
   fjZZImUEh4gEI5H4Ejg56nMKhP3XqnjJ1lYGVW5XfA4E4WHNfCTtLfVoz
   CeGDIngUTSrM9uuxUU6nIOKehps5pGnskdxMWCz2dojDgYcU/HMk5dvTD
   f65okf+j+r2H857ibhcmp12U0TcNj3flEK/U12Qw9VFA/GmPeLYuJj06A
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="3562129"
X-IronPort-AV: E=Sophos;i="6.04,319,1695711600"; 
   d="scan'208";a="3562129"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2023 21:21:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="845034322"
X-IronPort-AV: E=Sophos;i="6.04,319,1695711600"; 
   d="scan'208";a="845034322"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 30 Dec 2023 21:21:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJoGC-000J8P-1h;
	Sun, 31 Dec 2023 05:21:16 +0000
Date: Sun, 31 Dec 2023 13:20:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [krzk-github:n/gpio-reset-controller-shared 18/18]
 drivers/reset/core.c:837 __reset_gpios_args_match() warn: variable
 dereferenced before check 'a2' (see line 834)
Message-ID: <202312311338.jKP1GdFw-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux n/gpio-reset-controller-shared
head:   432bf1b2293de8d4f827f6ee3e32da747ddc44a3
commit: 432bf1b2293de8d4f827f6ee3e32da747ddc44a3 [18/18] reset core WIP
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: i386-randconfig-141-20231231 (https://download.01.org/0day-ci/archive/20231231/202312311338.jKP1GdFw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312311338.jKP1GdFw-lkp@intel.com/

smatch warnings:
drivers/reset/core.c:837 __reset_gpios_args_match() warn: variable dereferenced before check 'a2' (see line 834)

vim +/a2 +837 drivers/reset/core.c

d25e4334c2900f Philipp Zabel       2017-05-31  828  
432bf1b2293de8 Krzysztof Kozlowski 2023-12-30  829  static bool __reset_gpios_args_match(const struct of_phandle_args *a1,
432bf1b2293de8 Krzysztof Kozlowski 2023-12-30  830  				     const struct of_phandle_args *a2)
2a9529168d430a Krzysztof Kozlowski 2023-12-28  831  {
2a9529168d430a Krzysztof Kozlowski 2023-12-28  832  	unsigned int i;
2a9529168d430a Krzysztof Kozlowski 2023-12-28  833  
2a9529168d430a Krzysztof Kozlowski 2023-12-28 @834  	pr_err("%s:%d AAA comparing %pOF == %pOF, r->of_args=%px\n",
2a9529168d430a Krzysztof Kozlowski 2023-12-28  835  	       __func__, __LINE__,
432bf1b2293de8 Krzysztof Kozlowski 2023-12-30  836  	       a1->np, a2->np, a2);
432bf1b2293de8 Krzysztof Kozlowski 2023-12-30 @837  	if (!a2)
2a9529168d430a Krzysztof Kozlowski 2023-12-28  838  		return false;
2a9529168d430a Krzysztof Kozlowski 2023-12-28  839  
2a9529168d430a Krzysztof Kozlowski 2023-12-28  840  	pr_err("%s:%d AAA comparing %pOF == %pOF | %u == %u\n",
2a9529168d430a Krzysztof Kozlowski 2023-12-28  841  	       __func__, __LINE__,
432bf1b2293de8 Krzysztof Kozlowski 2023-12-30  842  	       a1->np, a2->np,
432bf1b2293de8 Krzysztof Kozlowski 2023-12-30  843  	       a1->args_count, a2->args_count);
432bf1b2293de8 Krzysztof Kozlowski 2023-12-30  844  	if (a1->args_count != a2->args_count)
2a9529168d430a Krzysztof Kozlowski 2023-12-28  845  		return false;
2a9529168d430a Krzysztof Kozlowski 2023-12-28  846  
432bf1b2293de8 Krzysztof Kozlowski 2023-12-30  847  	for (i = 0; i < a1->args_count; i++) {
2a9529168d430a Krzysztof Kozlowski 2023-12-28  848  		pr_err("%s:%d AAA comparing args %pOF [%d]: %u == %u\n",
2a9529168d430a Krzysztof Kozlowski 2023-12-28  849  		       __func__, __LINE__,
432bf1b2293de8 Krzysztof Kozlowski 2023-12-30  850  		       a1->np, a1->args_count,
432bf1b2293de8 Krzysztof Kozlowski 2023-12-30  851  		       a1->args[i], a2->args[i]);
2a9529168d430a Krzysztof Kozlowski 2023-12-28  852  
432bf1b2293de8 Krzysztof Kozlowski 2023-12-30  853  		if (a1->args[i] != a2->args[i])
2a9529168d430a Krzysztof Kozlowski 2023-12-28  854  			break;
2a9529168d430a Krzysztof Kozlowski 2023-12-28  855  	}
2a9529168d430a Krzysztof Kozlowski 2023-12-28  856  
2a9529168d430a Krzysztof Kozlowski 2023-12-28  857  	pr_err("%s:%d AAA comparing %pOF | %u == %u | i=%u\n",
2a9529168d430a Krzysztof Kozlowski 2023-12-28  858  	       __func__, __LINE__,
432bf1b2293de8 Krzysztof Kozlowski 2023-12-30  859  	       a1->np,
432bf1b2293de8 Krzysztof Kozlowski 2023-12-30  860  	       a1->args_count, a2->args_count, i);
2a9529168d430a Krzysztof Kozlowski 2023-12-28  861  
2a9529168d430a Krzysztof Kozlowski 2023-12-28  862  	/* All args matched? */
432bf1b2293de8 Krzysztof Kozlowski 2023-12-30  863  	if (i == a1->args_count)
2a9529168d430a Krzysztof Kozlowski 2023-12-28  864  		return true;
2a9529168d430a Krzysztof Kozlowski 2023-12-28  865  
2a9529168d430a Krzysztof Kozlowski 2023-12-28  866  	return false;
2a9529168d430a Krzysztof Kozlowski 2023-12-28  867  }
2a9529168d430a Krzysztof Kozlowski 2023-12-28  868  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
