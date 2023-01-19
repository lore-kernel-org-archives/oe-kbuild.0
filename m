Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38C515AD
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 01:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674090388; x=1705626388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FXvBCtJIijMUpmVY1NQ1mBf9veWam5scv5QHf9AgnyI=;
  b=PUcAd6b1c2wTmCNAYPJbZy/fN9cNf+FBQuPv7w1Ft+GoA8mDwKrdxn2x
   CaXf5QZoP0Pyxko5px0iboZA1sx3i11RtXOvNfWe4b0UuJPDmHz3gVoeO
   NT/PFqWrwKYNriI+Gq3LXAISDjkmiPTwGjc4erG2pxOocqb2/pFzQRlP0
   9ODP2s3mhjY2iUvbWiy4tz7qM047RtGO/WiOE3JmpY321uMYEHTHPk5UG
   J0weIQbcgyqB+hrwJxHz+oEIwWatb7m6WtZn2I0E/+tjYqYYT8UNog0Mn
   KeMpawTKdBA5kQFS9EAW/R2Hw5o73xCgQAwu7/1PjA5jMFrlUJOGJed6B
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="308715835"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="308715835"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 17:06:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="767990292"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="767990292"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2023 17:06:24 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIJNn-0000vJ-1o;
	Thu, 19 Jan 2023 01:06:23 +0000
Date: Thu, 19 Jan 2023 09:06:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH 6/6] erofs: enable page cache sharing in fscache mode
Message-ID: <202301190850.EDJzy3Cz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "gcc: unused function warning for stub function"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230106125330.55529-7-jefflexu@linux.alibaba.com>
References: <20230106125330.55529-7-jefflexu@linux.alibaba.com>
TO: Jingbo Xu <jefflexu@linux.alibaba.com>

Hi Jingbo,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on xiang-erofs/dev-test]
[also build test WARNING on xiang-erofs/dev xiang-erofs/fixes linus/master v6.2-rc4 next-20230118]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jingbo-Xu/erofs-remove-unused-device-mapping-in-the-meta-routine/20230106-205600
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
patch link:    https://lore.kernel.org/r/20230106125330.55529-7-jefflexu%40linux.alibaba.com
patch subject: [RFC PATCH 6/6] erofs: enable page cache sharing in fscache mode
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230119/202301190850.EDJzy3Cz-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5c565bd6afacc699309e9fc20119d91501a5d3ae
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jingbo-Xu/erofs-remove-unused-device-mapping-in-the-meta-routine/20230106-205600
        git checkout 5c565bd6afacc699309e9fc20119d91501a5d3ae
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/erofs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/erofs/inode.c:244:13: warning: unused function 'erofs_can_share_page_cache' [-Wunused-function]
   static bool erofs_can_share_page_cache(struct inode *inode)
               ^
   1 warning generated.


vim +/erofs_can_share_page_cache +244 fs/erofs/inode.c

431339ba90423a0 drivers/staging/erofs/inode.c Gao Xiang 2018-07-26  243  
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06 @244  static bool erofs_can_share_page_cache(struct inode *inode)
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  245  {
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  246  	struct erofs_inode *vi = EROFS_I(inode);
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  247  
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  248  	/* enable page cache sharing only in share domain mode */
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  249  	if (!erofs_is_fscache_mode(inode->i_sb) ||
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  250  	    !EROFS_SB(inode->i_sb)->domain_id)
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  251  		return false;
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  252  
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  253  	if (vi->datalayout != EROFS_INODE_CHUNK_BASED)
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  254  		return false;
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  255  
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  256  	/* avoid crossing multi devicces/blobs */
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  257  	if (inode->i_size > 1UL << vi->chunkbits)
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  258  		return false;
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  259  
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  260  	/* avoid data leakage in mmap routine */
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  261  	if (EROFS_BLKSIZ % PAGE_SIZE)
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  262  		return false;
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  263  
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  264  	return true;
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  265  }
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  266  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
