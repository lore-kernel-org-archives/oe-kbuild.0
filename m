Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567F14430
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Jan 2023 15:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672672963; x=1704208963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q4kVJNsnJouHTkfFixwKMVMDdOOB0eVjk4rMzutY7gw=;
  b=OHlQMnb9nmps8+2aSt0EEfyWpdNHYHqhnDQV0uJ4cerK2g12IclpH+VT
   IkLEs3BvMYh4Ya63B1+iZJnvs2N6AtASVRSlFSnhWNkSQehv0GeHuYjCn
   FxJQkUYFR7Pi5DUhzHlKXMo6/ZzpsNNMbFC6M4Gdsk/HyjxCCyP1MMrpW
   tDb1u6u33CnY+d4C+lYdi0tIt0+OgwYy7v6g62ZPslR/LLxILAhwakmZ6
   eaRIGq8eqqJr14NOPd71xxdSj3JLSzIEEhPg4i82tS7QSIXUjoHvSzsFa
   gKiubnVDmkzlg/i4EJlktcqguKraQbPLGtvwlLa9Ym2dEzfjZu+fb3eNY
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="320212717"
X-IronPort-AV: E=Sophos;i="5.96,294,1665471600"; 
   d="scan'208";a="320212717"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2023 07:22:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="778586827"
X-IronPort-AV: E=Sophos;i="5.96,294,1665471600"; 
   d="scan'208";a="778586827"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Jan 2023 07:22:41 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pCMe8-000REv-2U;
	Mon, 02 Jan 2023 15:22:40 +0000
Date: Mon, 2 Jan 2023 23:22:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/110-smc 3/21]
 drivers/platform/apple/smc_rtkit.c:227:16: warning: Uninitialized variable:
 key_info [uninitvar]
Message-ID: <202301022313.7woPkk3Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/platform/apple/smc_rtkit.c:227:16: warning: Uninitialized variable: key_info [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/110-smc
head:   6eb70e021ccaae0408e5a746b65848b811c23caa
commit: 56123d7503438bf3c69f8b3493602e543f465429 [3/21] platform/apple: Add new Apple Mac SMC driver
:::::: branch date: 8 days ago
:::::: commit date: 3 weeks ago
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 56123d7503438bf3c69f8b3493602e543f465429
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/platform/apple/smc_rtkit.c:227:16: warning: Uninitialized variable: key_info [uninitvar]
     info->size = key_info[0];
                  ^

vim +227 drivers/platform/apple/smc_rtkit.c

56123d7503438b Hector Martin 2022-02-04  218  
56123d7503438b Hector Martin 2022-02-04  219  static int apple_smc_rtkit_get_key_info(void *cookie, smc_key key, struct apple_smc_key_info *info)
56123d7503438b Hector Martin 2022-02-04  220  {
56123d7503438b Hector Martin 2022-02-04  221  	struct apple_smc_rtkit *smc = cookie;
56123d7503438b Hector Martin 2022-02-04  222  	u8 key_info[6];
56123d7503438b Hector Martin 2022-02-04  223  	int ret;
56123d7503438b Hector Martin 2022-02-04  224  
56123d7503438b Hector Martin 2022-02-04  225  	ret = apple_smc_cmd(smc, SMC_MSG_GET_KEY_INFO, key, 0, 0, NULL);
56123d7503438b Hector Martin 2022-02-04  226  	if (ret >= 0 && info) {
56123d7503438b Hector Martin 2022-02-04 @227  		info->size = key_info[0];
56123d7503438b Hector Martin 2022-02-04  228  		info->type_code = get_unaligned_be32(&key_info[1]);
56123d7503438b Hector Martin 2022-02-04  229  		info->flags = key_info[5];
56123d7503438b Hector Martin 2022-02-04  230  	}
56123d7503438b Hector Martin 2022-02-04  231  	return ret;
56123d7503438b Hector Martin 2022-02-04  232  }
56123d7503438b Hector Martin 2022-02-04  233  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
