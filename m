Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EFAEC9
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Apr 2023 14:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681482936; x=1713018936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mvxtlRaTgBLeDUKNTeCju5EkY7OEcOFxGMEE6dvjW1w=;
  b=nID4n1zSjr5V79KG5uw06d3LLBEEfPsrdvGt+jiH0KQzvKWVAKZj3Lud
   ci6BFlZY4rOKc5oekQ0mq1JhEXcFy54N3q406B4z68xachGYHhBuiTgd/
   slzvJOy9EK2BrbP3o664tqJEaOqMYHp6e3f/Y5KQ9+GJJHcpC03flw5UV
   ABSiAk36IFKQ+EzhhAojmEBU5icBqP0435kqk2fQwTTX6sZWmHhdaEVm+
   2vc0d5uV8PmYC92B9mC1GVddvmgMCYpB47C2Mb4GwP/BNqCfOeTGPuchV
   4s1PTfek4NGoK7X03otFbLpoNQN0EixqgTjiVoGiNpNiI3YUfPyYsfdOx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="344478328"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="344478328"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 07:35:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="759122357"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="759122357"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 14 Apr 2023 07:35:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnKWT-000Zcl-35;
	Fri, 14 Apr 2023 14:35:33 +0000
Date: Fri, 14 Apr 2023 22:35:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [amir73il:fan_unmount 5/5] fs/notify/fanotify/fanotify.c:624
 fanotify_alloc_fid_event() warn: variable dereferenced before check 'hash'
 (see line 618)
Message-ID: <202304142243.TY4tlJXX-lkp@intel.com>
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
TO: Amir Goldstein <amir73il@gmail.com>

tree:   https://github.com/amir73il/linux fan_unmount
head:   efaac6f096e1da1a16d690c1c2d344b2dc2c2665
commit: 2da6209964005a9817160559de6021b13cc66860 [5/5] fanotify: add support for FAN_UNMOUNT event
:::::: branch date: 4 hours ago
:::::: commit date: 19 hours ago
config: csky-randconfig-m031-20230411 (https://download.01.org/0day-ci/archive/20230414/202304142243.TY4tlJXX-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304142243.TY4tlJXX-lkp@intel.com/

smatch warnings:
fs/notify/fanotify/fanotify.c:624 fanotify_alloc_fid_event() warn: variable dereferenced before check 'hash' (see line 618)

vim +/hash +624 fs/notify/fanotify/fanotify.c

9c61f3b560f5dd Amir Goldstein 2020-03-30  602  
9c61f3b560f5dd Amir Goldstein 2020-03-30  603  static struct fanotify_event *fanotify_alloc_fid_event(struct inode *id,
9c61f3b560f5dd Amir Goldstein 2020-03-30  604  						       __kernel_fsid_t *fsid,
2da6209964005a Amir Goldstein 2023-04-09  605  						       struct mount *mnt,
7e3e5c69439949 Amir Goldstein 2021-03-04  606  						       unsigned int *hash,
9c61f3b560f5dd Amir Goldstein 2020-03-30  607  						       gfp_t gfp)
9c61f3b560f5dd Amir Goldstein 2020-03-30  608  {
2da6209964005a Amir Goldstein 2023-04-09  609  	unsigned int fh_len = fanotify_encode_fh_len(id);
9c61f3b560f5dd Amir Goldstein 2020-03-30  610  	struct fanotify_fid_event *ffe;
9c61f3b560f5dd Amir Goldstein 2020-03-30  611  
9c61f3b560f5dd Amir Goldstein 2020-03-30  612  	ffe = kmem_cache_alloc(fanotify_fid_event_cachep, gfp);
9c61f3b560f5dd Amir Goldstein 2020-03-30  613  	if (!ffe)
9c61f3b560f5dd Amir Goldstein 2020-03-30  614  		return NULL;
9c61f3b560f5dd Amir Goldstein 2020-03-30  615  
9c61f3b560f5dd Amir Goldstein 2020-03-30  616  	ffe->fae.type = FANOTIFY_EVENT_TYPE_FID;
9c61f3b560f5dd Amir Goldstein 2020-03-30  617  	ffe->fsid = *fsid;
7e3e5c69439949 Amir Goldstein 2021-03-04 @618  	*hash ^= fanotify_hash_fsid(fsid);
2da6209964005a Amir Goldstein 2023-04-09  619  	fanotify_encode_fh(&ffe->object_fh, id, fh_len, hash, gfp);
2da6209964005a Amir Goldstein 2023-04-09  620  	/* Store mntid in fid_event with fsid and null fh */
2da6209964005a Amir Goldstein 2023-04-09  621  	if (mnt && !WARN_ON_ONCE(!fh_len)) {
2da6209964005a Amir Goldstein 2023-04-09  622  		ffe->mnt_id = mnt->mnt_id;
2da6209964005a Amir Goldstein 2023-04-09  623  		ffe->object_fh.flags = FANOTIFY_FH_FLAG_MNT_ID;
2da6209964005a Amir Goldstein 2023-04-09 @624  		if (hash)
2da6209964005a Amir Goldstein 2023-04-09  625  			*hash ^= fanotify_hash_mntid(mnt->mnt_id);
2da6209964005a Amir Goldstein 2023-04-09  626  	}
9c61f3b560f5dd Amir Goldstein 2020-03-30  627  
9c61f3b560f5dd Amir Goldstein 2020-03-30  628  	return &ffe->fae;
9c61f3b560f5dd Amir Goldstein 2020-03-30  629  }
9c61f3b560f5dd Amir Goldstein 2020-03-30  630  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
