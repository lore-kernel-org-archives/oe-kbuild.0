Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EC58F5C
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Jun 2023 08:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686212930; x=1717748930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OQL8Vd2sPxwb4ej9LfyniGGrtHwosxOF3l2Y2M/FvDo=;
  b=Z9akmw9j8eyfEkItPvYqFDuHNujhGgvfPWwOLEJlHPTiBKq7bWylTrIS
   fI/6Ul5fAqMtuC2Subx/6BNT3GaiNZffVHn2m+0YE6D1Rs2C79EFRpVEj
   +esWdtTm3NfnxFhkmLGxZlTZv+0i1st2YvMcb5jDpRzHbrpt6tcX1c6Z8
   Q9VX2GEVI4o+pYjijjTo6todQCoacKLZGdWEndftOa/LthtY93rWowXwr
   XzB70amdMONH4QKYh+ZymN1Q6ejkWy5Xfz++58yeHpnhau4ab33L1x4mx
   vTyMUEj3mAwuJ8NLGcjDQIAjpl9gFg71wMp5oxw/xVu2cWiy5C4pYjOJL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="443616301"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="443616301"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 01:28:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="713031691"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="713031691"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 Jun 2023 01:28:48 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7B0i-0007aM-0b;
	Thu, 08 Jun 2023 08:28:48 +0000
Date: Thu, 8 Jun 2023 16:28:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [amir73il:mnt_idmap_prot 29/29] fs/mnt_idmapping.c:25:18: sparse:
    struct fsnotify_mark_connector [noderef] __rcu *[usertype] *extern
 [addressable] [toplevel] mnt_idmap_fsnotify_conn_p( ... )
Message-ID: <202306081623.fIjYDlRf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/mnt_idmapping.c:25:18: sparse:    struct fsnotify_mark_connector [noderef] __rcu *[usertype] *extern [addressable] [toplevel] mnt_idmap_fsnotify_conn_p( ... )"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Amir Goldstein <amir73il@gmail.com>

tree:   https://github.com/amir73il/linux mnt_idmap_prot
head:   8e70eb8a651b98677105e34ded526227e7afb4a8
commit: 8e70eb8a651b98677105e34ded526227e7afb4a8 [29/29] fs: add support for "protected" attribute on a mount
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: sparc-randconfig-s053-20230607 (https://download.01.org/0day-ci/archive/20230608/202306081623.fIjYDlRf-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/amir73il/linux/commit/8e70eb8a651b98677105e34ded526227e7afb4a8
        git remote add amir73il https://github.com/amir73il/linux
        git fetch --no-tags amir73il mnt_idmap_prot
        git checkout 8e70eb8a651b98677105e34ded526227e7afb4a8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306081623.fIjYDlRf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/mnt_idmapping.c:25:18: sparse: sparse: symbol 'mnt_idmap_fsnotify_conn_p' redeclared with different type (different address spaces):
>> fs/mnt_idmapping.c:25:18: sparse:    struct fsnotify_mark_connector [noderef] __rcu *[usertype] *extern [addressable] [toplevel] mnt_idmap_fsnotify_conn_p( ... )
   fs/mnt_idmapping.c: note: in included file:
   fs/internal.h:269:32: sparse: note: previously declared as:
>> fs/internal.h:269:32: sparse:    struct fsnotify_mark_connector **extern [addressable] [toplevel] mnt_idmap_fsnotify_conn_p( ... )
--
   fs/notify/fsnotify.c:390:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/notify/fsnotify.c:390:16: sparse:    struct fsnotify_mark_connector [noderef] __rcu *
   fs/notify/fsnotify.c:390:16: sparse:    struct fsnotify_mark_connector *
   fs/notify/fsnotify.c:392:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/notify/fsnotify.c:392:24: sparse:    struct hlist_node [noderef] __rcu *
   fs/notify/fsnotify.c:392:24: sparse:    struct hlist_node *
   fs/notify/fsnotify.c:402:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/notify/fsnotify.c:402:24: sparse:    struct hlist_node [noderef] __rcu *
   fs/notify/fsnotify.c:402:24: sparse:    struct hlist_node *
>> fs/notify/fsnotify.c:517:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct fsnotify_mark_connector [noderef] __rcu *[usertype] *idmap_marks @@     got struct fsnotify_mark_connector ** @@
   fs/notify/fsnotify.c:517:37: sparse:     expected struct fsnotify_mark_connector [noderef] __rcu *[usertype] *idmap_marks
   fs/notify/fsnotify.c:517:37: sparse:     got struct fsnotify_mark_connector **
   fs/notify/fsnotify.c:580:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct fsnotify_mark_connector **connp @@     got struct fsnotify_mark_connector [noderef] __rcu ** @@
   fs/notify/fsnotify.c:580:38: sparse:     expected struct fsnotify_mark_connector **connp
   fs/notify/fsnotify.c:580:38: sparse:     got struct fsnotify_mark_connector [noderef] __rcu **
>> fs/notify/fsnotify.c:583:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct fsnotify_mark_connector **connp @@     got struct fsnotify_mark_connector [noderef] __rcu *[usertype] *idmap_marks @@
   fs/notify/fsnotify.c:583:45: sparse:     expected struct fsnotify_mark_connector **connp
   fs/notify/fsnotify.c:583:45: sparse:     got struct fsnotify_mark_connector [noderef] __rcu *[usertype] *idmap_marks
   fs/notify/fsnotify.c:587:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct fsnotify_mark_connector **connp @@     got struct fsnotify_mark_connector [noderef] __rcu ** @@
   fs/notify/fsnotify.c:587:46: sparse:     expected struct fsnotify_mark_connector **connp
   fs/notify/fsnotify.c:587:46: sparse:     got struct fsnotify_mark_connector [noderef] __rcu **
   fs/notify/fsnotify.c:591:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct fsnotify_mark_connector **connp @@     got struct fsnotify_mark_connector [noderef] __rcu ** @@
   fs/notify/fsnotify.c:591:46: sparse:     expected struct fsnotify_mark_connector **connp
   fs/notify/fsnotify.c:591:46: sparse:     got struct fsnotify_mark_connector [noderef] __rcu **
   fs/notify/fsnotify.c:595:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct fsnotify_mark_connector **connp @@     got struct fsnotify_mark_connector [noderef] __rcu ** @@
   fs/notify/fsnotify.c:595:46: sparse:     expected struct fsnotify_mark_connector **connp
   fs/notify/fsnotify.c:595:46: sparse:     got struct fsnotify_mark_connector [noderef] __rcu **

vim +25 fs/mnt_idmapping.c

8e70eb8a651b98 Amir Goldstein 2023-06-06  24  
8e70eb8a651b98 Amir Goldstein 2023-06-06 @25  fsnotify_connp_t *mnt_idmap_fsnotify_conn_p(struct mnt_idmap *idmap)
8e70eb8a651b98 Amir Goldstein 2023-06-06  26  {
8e70eb8a651b98 Amir Goldstein 2023-06-06  27  	return &idmap->fsnotify_marks;
8e70eb8a651b98 Amir Goldstein 2023-06-06  28  }
8e70eb8a651b98 Amir Goldstein 2023-06-06  29  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
