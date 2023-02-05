Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8087B
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Feb 2023 00:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675556343; x=1707092343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pnE0FtrvBzdI3wMoL1gua0rcjvd7fvjdEV6cbPtBdfs=;
  b=dTiaFUxg0vWKaaFuz7PC4LMvqEuzRoGJqr8/ANBgz0h8OEcSlsPFIwzG
   Ks+JdBVy2bR4RCqbpo83gxdoMGHiHTX4ZubzrG77Ujg2jpa4STrYOdDxt
   Y7NWLruCVf0lO4L+MbdL8e+WOygX1MxZGQFkVX+A0vW2iOGdPJjN0a2oo
   4YtopBrdHn6wDDFKVic6j7k5dpT23miCg6gCv/+Cp89yGq4EMsUe7DERj
   E9Kb6zCx83zsI3yaMQ3KA1rl5kbRX76/8slfiLNFcUCwC6Uv7VE9N72Ic
   xAcRs6XFv+AalYiJk5esJexS/jjpTX9FDKnTj/n5QH9UKweqlkhXQH1OY
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="327637092"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="327637092"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 16:19:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="616084044"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="616084044"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 04 Feb 2023 16:19:01 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOSkG-0001as-1p;
	Sun, 05 Feb 2023 00:19:00 +0000
Date: Sun, 5 Feb 2023 08:18:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/notify/fanotify/fanotify.h:231:9: warning: use of NULL where
 non-null expected [CWE-476]
Message-ID: <202302050832.EA16aoMW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem: fs/notify/fanotify/fanotify.h:231:9: warning: use of NULL where non-null expected [CWE-476] [-Wanalyzer-null-argument]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Amir Goldstein <amir73il@gmail.com>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   95078069c1e70d1b3b141132d18d0c563acedd0c
commit: 14362a2541797cf9df0e86fb12dcd7950baf566e fsnotify: introduce mark type iterator
date:   9 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20230202 (https://download.01.org/0day-ci/archive/20230205/202302050832.EA16aoMW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=14362a2541797cf9df0e86fb12dcd7950baf566e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 14362a2541797cf9df0e86fb12dcd7950baf566e
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error'  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error' 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   In file included from fs/notify/fanotify/fanotify.c:19:
   fs/notify/fanotify/fanotify.h: In function 'fanotify_info_copy_name2':
>> fs/notify/fanotify/fanotify.h:231:9: warning: use of NULL where non-null expected [CWE-476] [-Wanalyzer-null-argument]
     231 |         strcpy(fanotify_info_name2(info), name->name);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'fanotify_alloc_name_event': event 1
       |
       |fs/notify/fanotify/fanotify.c:598:31:
       |  598 | static struct fanotify_event *fanotify_alloc_name_event(struct inode *dir,
       |      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                               |
       |      |                               (1) entry to 'fanotify_alloc_name_event'
       |
     'fanotify_alloc_name_event': events 2-5
       |
       |  609 |         struct inode *dir2 = moved ? d_inode(moved->d_parent) : NULL;
       |      |                                              ~~~~~~~~~~~~~~~   
       |      |                                                   |
       |      |                                                   (3) ...to here
       |......
       |  615 |         unsigned long name2_len = name2 ? name2->len : 0;
       |      |                                   ~~~~~~~~~~~~~~~~~~~~~~       
       |      |                                                      |
       |      |                                                      (4) following 'true' branch...
       |      |                                                      (5) ...to here
       |
     'fanotify_alloc_name_event': events 6-13
       |
       |include/linux/slab.h:569:12:
       |  336 |         if (likely((flags & KMALLOC_NOT_NORMAL_BITS) == 0))
       |      |            ~
       |      |            |
       |      |            (12) following 'true' branch...
       |......
       |  370 |         if (!size)
       |      |            ~
       |      |            |
       |      |            (10) following 'false' branch (when 'size != 0')...
       |......
       |  373 |         if (size <= KMALLOC_MIN_SIZE)
       |      |         ~~  
       |      |         |
       |      |         (11) ...to here
       |......
       |  569 |         if (__builtin_constant_p(size)) {
       |      |            ^
       |      |            |
       |      |            (6) following 'true' branch...
       |  570 | #ifndef CONFIG_SLOB
       |  571 |                 unsigned int index;
       |      |                 ~~~~~~~~
       |      |                 |
       |      |                 (7) ...to here
       |  572 | #endif
       |  573 |                 if (size > KMALLOC_MAX_CACHE_SIZE)
       |      |                    ~
       |      |                    |
       |      |                    (8) following 'false' branch (when 'size <= 8192')...
       |......
       |  576 |                 index = kmalloc_index(size);
       |      |                 ~~~~~
       |      |                 |
       |      |                 (9) ...to here
       |......
       |  582 |                                 kmalloc_caches[kmalloc_type(flags)][index],
       |      |                                                ~~~~~~~~~~~~~~~~~~~
       |      |                                                |
       |      |                                                (13) ...to here
       |
     'fanotify_alloc_name_event': event 14
       |
       |fs/notify/fanotify/fanotify.c:627:12:
       |  627 |         if (!fne)
       |      |            ^
       |      |            |
       |      |            (14) following 'false' branch...
       |
     'fanotify_alloc_name_event': event 15
       |
       |include/linux/slab.h:412:26:
       |  412 | #define kmalloc_index(s) __kmalloc_index(s, true)
       |      |                          ^~~~~~~~~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (15) ...to here
   include/linux/slab.h:576:25: note: in expansion of macro 'kmalloc_index'
       |  576 |                 index = kmalloc_index(size);
       |      |                         ^~~~~~~~~~~~~
       |
     'fanotify_alloc_name_event': events 16-18
       |
       |fs/notify/fanotify/fanotify.c:654:12:
       |  654 |         if (name2_len) {
       |      |            ^
       |      |            |
       |      |            (16) following 'true' branch...
       |  655 |                 fanotify_info_copy_name2(info, name2);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (17) ...to here
       |      |                 (18) calling 'fanotify_info_copy_name2' from 'fanotify_alloc_name_event'
       |
       +--> 'fanotify_info_copy_name2': events 19-22
              |

vim +231 fs/notify/fanotify/fanotify.h

f454fa610a69b93 Amir Goldstein 2020-07-16  223  
3cf984e950c1c3f Amir Goldstein 2021-11-29  224  static inline void fanotify_info_copy_name2(struct fanotify_info *info,
3cf984e950c1c3f Amir Goldstein 2021-11-29  225  					    const struct qstr *name)
3cf984e950c1c3f Amir Goldstein 2021-11-29  226  {
3cf984e950c1c3f Amir Goldstein 2021-11-29  227  	if (WARN_ON_ONCE(name->len > NAME_MAX))
3cf984e950c1c3f Amir Goldstein 2021-11-29  228  		return;
3cf984e950c1c3f Amir Goldstein 2021-11-29  229  
3cf984e950c1c3f Amir Goldstein 2021-11-29  230  	info->name2_len = name->len;
3cf984e950c1c3f Amir Goldstein 2021-11-29 @231  	strcpy(fanotify_info_name2(info), name->name);
3cf984e950c1c3f Amir Goldstein 2021-11-29  232  }
3cf984e950c1c3f Amir Goldstein 2021-11-29  233  

:::::: The code at line 231 was first introduced by commit
:::::: 3cf984e950c1c3f41d407ed31db33beb996be132 fanotify: support secondary dir fh and name in fanotify_info

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Jan Kara <jack@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
