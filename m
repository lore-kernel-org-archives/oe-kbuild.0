Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8829FEC2
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Jul 2023 12:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690201564; x=1721737564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VvJcqvPhQ0Ef6fiPbojL2KqrA6Qpv5w6l5NasW8WBJI=;
  b=gKt1CNU/De+Yr6hvfhTRDdLb5vnWW7S9USfauz8ew463+n++OZcXwjy0
   XvAr+B9DHQTHuoRoC+4FOicD66NsZzza4ajxrOC0CEPWsvx+zhWDMmq+l
   SZYDlX11SmZ+JJ2VFhOC1hps7B89tQWq3BsOg5LEDEjmBlEJsE9BAT928
   i6aOOvgaSHI7dQTuf68azzX/JsEXAmDkGb+xGb0JTkuAZ6cH5kxGL/y4O
   GFU19Ag0JdvldH9n9BroMHkC66md4A0XrCRWkQagQnctHXGEtCw99vOFO
   hqpI+izE7R1ig/fEBUooyQWM9XruN3kLY2rIBJH3MyxcM7Yc6aYLaRXMa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="433668972"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="433668972"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 05:26:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="725688272"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="725688272"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 24 Jul 2023 05:26:02 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNudK-0009iu-1j;
	Mon, 24 Jul 2023 12:25:57 +0000
Date: Mon, 24 Jul 2023 20:23:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ardb:acomp-zswap-cleanup 7/21] fs/ubifs/compress.c:222 compr_init()
 error: uninitialized symbol 'ret'.
Message-ID: <202307242020.llXP1Sz6-lkp@intel.com>
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
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git acomp-zswap-cleanup
head:   d0a9c8530b6b8659bc8b126638f5d2c907cfe5ee
commit: 9bb0bd982a78fa5d1dadadad46171275df3fae80 [7/21] ubifs: Migrate to acomp compression API
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: parisc-randconfig-m031-20230723 (https://download.01.org/0day-ci/archive/20230724/202307242020.llXP1Sz6-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307242020.llXP1Sz6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307242020.llXP1Sz6-lkp@intel.com/

smatch warnings:
fs/ubifs/compress.c:222 compr_init() error: uninitialized symbol 'ret'.

vim +/ret +222 fs/ubifs/compress.c

1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  197  
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  198  /**
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  199   * compr_init - initialize a compressor.
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  200   * @compr: compressor description object
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  201   *
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  202   * This function initializes the requested compressor and returns zero in case
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  203   * of success or a negative error code in case of failure.
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  204   */
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  205  static int __init compr_init(struct ubifs_compressor *compr)
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  206  {
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  207  	if (compr->capi_name) {
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  208  		long ret;
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  209  
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  210  		compr->cc = crypto_alloc_acomp(compr->capi_name, 0,
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  211  					       CRYPTO_ALG_ASYNC);
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  212  		if (IS_ERR(compr->cc)) {
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  213  			ret = PTR_ERR(compr->cc);
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  214  		} else {
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  215  			compr->req = acomp_request_alloc(compr->cc);
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  216  			if (!compr->req) {
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  217  				crypto_free_acomp(compr->cc);
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  218  				ret = -ENOMEM;
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  219  			}
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  220  		}
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  221  
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15 @222  		if (ret) {
235c362bd0f6afc Sheng Yong       2015-03-20  223  			pr_err("UBIFS error (pid %d): cannot initialize compressor %s, error %ld",
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  224  			       current->pid, compr->name, ret);
9bb0bd982a78fa5 Ard Biesheuvel   2023-07-15  225  			return ret;
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  226  		}
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  227  	}
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  228  
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  229  	ubifs_compressors[compr->compr_type] = compr;
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  230  	return 0;
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  231  }
1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  232  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
