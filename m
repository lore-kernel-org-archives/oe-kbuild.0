Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BEB1BEE3
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Aug 2023 23:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691190717; x=1722726717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=07p2d2HrxgCMMp0szU2w3eTtgkPRme9HJlM9/niNLkA=;
  b=CSpyI85CRFNoZ2kaZ3W8tBos8hR3clEuqjrPM6dZkXp/HbzABIWBpGtA
   QIO0oGUi2rl7YI1XPRStPFWwmPBHqr4xHwG6UlxWXAwElqrpXqiFleMVB
   wJuGkPA4V35gXW6HcCmxwzMIuSVot+9qKtIG2XWuS0XVcho3Tj5pC8D6n
   7O0gSwIN5wzn6et+hLHQM2Ooxe2afOXb8B5ZdAy29oHVU1prPmYJOQTBX
   zil3QA5jK0C2Pjt9Yjg5/XYmWWh2Qiq88cOoB3mW2fgrxvT8laMriyLK9
   DOinebQLxTknn5G++OltPie6kD9dps96dtTQ8y/Bf1LusBOkAxKIVdLvq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="369162135"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="369162135"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 16:11:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="765306209"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="765306209"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 Aug 2023 16:11:55 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS3xa-0003B1-1E;
	Fri, 04 Aug 2023 23:11:54 +0000
Date: Sat, 5 Aug 2023 07:11:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 5/5] minmax: Relax check to allow comparison between
 int and small unsigned constants.
Message-ID: <202308050640.uLl9ePSK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: net/ceph/messenger.c:790:9: sparse: sparse: too long token expansion"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <b6a49ed73aba427ca8bb433763fa94e9@AcuMS.aculab.com>
References: <b6a49ed73aba427ca8bb433763fa94e9@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
TO: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
TO: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
TO: "'Christoph Hellwig'" <hch@infradead.org>
TO: "'Jason A. Donenfeld'" <Jason@zx2c4.com>
TO: "'Linus Torvalds'" <torvalds@linux-foundation.org>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.5-rc4 next-20230804]
[cannot apply to next-20230804 akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Add-min_unsigned-a-b-and-max_unsigned-a-b/20230804-190414
base:   linus/master
patch link:    https://lore.kernel.org/r/b6a49ed73aba427ca8bb433763fa94e9%40AcuMS.aculab.com
patch subject: [PATCH v3 5/5] minmax: Relax check to allow comparison between int and small unsigned constants.
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: um-randconfig-r091-20230730 (https://download.01.org/0day-ci/archive/20230805/202308050640.uLl9ePSK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050640.uLl9ePSK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308050640.uLl9ePSK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ceph/messenger.c:790:9: sparse: sparse: too long token expansion
>> net/ceph/messenger.c:790:9: sparse: sparse: too long token expansion
   net/ceph/messenger.c:797:29: sparse: sparse: too long token expansion
   net/ceph/messenger.c:797:29: sparse: sparse: too long token expansion
   net/ceph/messenger.c:812:9: sparse: sparse: too long token expansion
   net/ceph/messenger.c:812:9: sparse: sparse: too long token expansion
   net/ceph/messenger.c:823:9: sparse: sparse: too long token expansion
   net/ceph/messenger.c:823:9: sparse: sparse: too long token expansion
--
>> net/ipv6/proc.c:186:28: sparse: sparse: too long token expansion
   net/ipv6/proc.c:190:57: sparse: sparse: too long token expansion
   net/ipv6/proc.c:206:20: sparse: sparse: too long token expansion
   net/ipv6/proc.c:209:41: sparse: sparse: too long token expansion

vim +790 net/ceph/messenger.c

df6ad1f97342eb Alex Elder   2012-06-11  779  
b9e281c2b38804 Ilya Dryomov 2018-01-20  780  static void ceph_msg_data_bvecs_cursor_init(struct ceph_msg_data_cursor *cursor,
b9e281c2b38804 Ilya Dryomov 2018-01-20  781  					size_t length)
b9e281c2b38804 Ilya Dryomov 2018-01-20  782  {
b9e281c2b38804 Ilya Dryomov 2018-01-20  783  	struct ceph_msg_data *data = cursor->data;
b9e281c2b38804 Ilya Dryomov 2018-01-20  784  	struct bio_vec *bvecs = data->bvec_pos.bvecs;
b9e281c2b38804 Ilya Dryomov 2018-01-20  785  
b9e281c2b38804 Ilya Dryomov 2018-01-20  786  	cursor->resid = min_t(size_t, length, data->bvec_pos.iter.bi_size);
b9e281c2b38804 Ilya Dryomov 2018-01-20  787  	cursor->bvec_iter = data->bvec_pos.iter;
b9e281c2b38804 Ilya Dryomov 2018-01-20  788  	cursor->bvec_iter.bi_size = cursor->resid;
b9e281c2b38804 Ilya Dryomov 2018-01-20  789  
b9e281c2b38804 Ilya Dryomov 2018-01-20 @790  	BUG_ON(cursor->resid < bvec_iter_len(bvecs, cursor->bvec_iter));
b9e281c2b38804 Ilya Dryomov 2018-01-20  791  }
b9e281c2b38804 Ilya Dryomov 2018-01-20  792  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
