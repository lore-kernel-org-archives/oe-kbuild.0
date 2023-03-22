Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5F52566
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Mar 2023 12:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679488181; x=1711024181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OX2YRFQSvNCQ73iDQsis53iLHXkZa/Ldqy78+992ncw=;
  b=nLQ5bGkTZueoYMTfYzwO6zX+SeWUIajM1iW1PYG6VQfyd67eR/nXRDXP
   82s0T9w/2YAXS0X78W8Yp+UjvhB+sF2rGWICUlgoIRzV4DdrfpLfSOuPZ
   LJKlUEfoA21SXDVHNt1abImRM1+So4ZXKYJLYcxRTabOR9CVG3Kv9gBB9
   CCJ4scD7mzJ1f82paVZBr7sHffbz+2GaOPDrhqq8t30RygYIRV8z1trvK
   nHURQ2QEKGleg0ZyoFfY3Pd+QlkL7HAmGFeV0Vo4BdFKAG4sScI7EoO6a
   Ou32Zy44CYVqia4Uq922FpyJawNB9t3Dx69TrHWnrGTVkxjV7tomihV7a
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="425485990"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="425485990"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 05:29:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="805793051"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="805793051"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 Mar 2023 05:29:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pexay-000DJ0-30;
	Wed, 22 Mar 2023 12:29:36 +0000
Date: Wed, 22 Mar 2023 20:29:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5] NFSv3: handle out-of-order write replies.
Message-ID: <202303222016.Fc6hb6N9-lkp@intel.com>
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
In-Reply-To: <167943762461.8008.3152357340238024342@noble.neil.brown.name>
References: <167943762461.8008.3152357340238024342@noble.neil.brown.name>
TO: NeilBrown <neilb@suse.de>
TO: "trond.myklebust@hammerspace.com" <trond.myklebust@hammerspace.com>
TO: Anna Schumaker <anna@kernel.org>
CC: Linux NFS Mailing List <linux-nfs@vger.kernel.org>

Hi NeilBrown,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on trondmy-nfs/linux-next]
[also build test WARNING on linus/master v6.3-rc3 next-20230322]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/NFSv3-handle-out-of-order-write-replies/20230322-062808
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/167943762461.8008.3152357340238024342%40noble.neil.brown.name
patch subject: [PATCH v5] NFSv3: handle out-of-order write replies.
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230322/202303222016.Fc6hb6N9-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303222016.Fc6hb6N9-lkp@intel.com/

smatch warnings:
fs/nfs/inode.c:1854 nfs_ooo_merge() error: testing array offset 'cnt' after use.

vim +/cnt +1854 fs/nfs/inode.c

7b24dacf084005 Trond Myklebust 2021-04-09  1820  
4bd0ae11044aa9 NeilBrown       2023-03-22  1821  static void nfs_ooo_merge(struct nfs_inode *nfsi,
4bd0ae11044aa9 NeilBrown       2023-03-22  1822  			  u64 start, u64 end)
4bd0ae11044aa9 NeilBrown       2023-03-22  1823  {
4bd0ae11044aa9 NeilBrown       2023-03-22  1824  	int i, cnt;
4bd0ae11044aa9 NeilBrown       2023-03-22  1825  
4bd0ae11044aa9 NeilBrown       2023-03-22  1826  	if (nfsi->cache_validity & NFS_INO_DATA_INVAL_DEFER)
4bd0ae11044aa9 NeilBrown       2023-03-22  1827  		/* No point merging anything */
4bd0ae11044aa9 NeilBrown       2023-03-22  1828  		return;
4bd0ae11044aa9 NeilBrown       2023-03-22  1829  
4bd0ae11044aa9 NeilBrown       2023-03-22  1830  	if (!nfsi->ooo) {
4bd0ae11044aa9 NeilBrown       2023-03-22  1831  		nfsi->ooo = kmalloc(sizeof(*nfsi->ooo), GFP_ATOMIC);
4bd0ae11044aa9 NeilBrown       2023-03-22  1832  		if (!nfsi->ooo) {
4bd0ae11044aa9 NeilBrown       2023-03-22  1833  			nfsi->cache_validity |= NFS_INO_DATA_INVAL_DEFER;
4bd0ae11044aa9 NeilBrown       2023-03-22  1834  			return;
4bd0ae11044aa9 NeilBrown       2023-03-22  1835  		}
4bd0ae11044aa9 NeilBrown       2023-03-22  1836  		nfsi->ooo->cnt = 0;
4bd0ae11044aa9 NeilBrown       2023-03-22  1837  	}
4bd0ae11044aa9 NeilBrown       2023-03-22  1838  
4bd0ae11044aa9 NeilBrown       2023-03-22  1839  	/* add this range, merging if possible */
4bd0ae11044aa9 NeilBrown       2023-03-22  1840  	cnt = nfsi->ooo->cnt;
4bd0ae11044aa9 NeilBrown       2023-03-22  1841  	for (i = 0; i < cnt; i++) {
4bd0ae11044aa9 NeilBrown       2023-03-22  1842  		if (end == nfsi->ooo->gap[i].start)
4bd0ae11044aa9 NeilBrown       2023-03-22  1843  			end = nfsi->ooo->gap[i].end;
4bd0ae11044aa9 NeilBrown       2023-03-22  1844  		else if (start == nfsi->ooo->gap[i].end)
4bd0ae11044aa9 NeilBrown       2023-03-22  1845  			start = nfsi->ooo->gap[i].start;
4bd0ae11044aa9 NeilBrown       2023-03-22  1846  		else
4bd0ae11044aa9 NeilBrown       2023-03-22  1847  			continue;
4bd0ae11044aa9 NeilBrown       2023-03-22  1848  		/* Remove 'i' from table and loop to insert the new range */
4bd0ae11044aa9 NeilBrown       2023-03-22  1849  		cnt -= 1;
4bd0ae11044aa9 NeilBrown       2023-03-22  1850  		nfsi->ooo->gap[i] = nfsi->ooo->gap[cnt];
4bd0ae11044aa9 NeilBrown       2023-03-22  1851  		i = -1;
4bd0ae11044aa9 NeilBrown       2023-03-22  1852  	}
4bd0ae11044aa9 NeilBrown       2023-03-22  1853  	if (start != end) {
4bd0ae11044aa9 NeilBrown       2023-03-22 @1854  		if (cnt >= ARRAY_SIZE(nfsi->ooo->gap)) {
4bd0ae11044aa9 NeilBrown       2023-03-22  1855  			nfsi->cache_validity |= NFS_INO_DATA_INVAL_DEFER;
4bd0ae11044aa9 NeilBrown       2023-03-22  1856  			kfree(nfsi->ooo);
4bd0ae11044aa9 NeilBrown       2023-03-22  1857  			nfsi->ooo = NULL;
4bd0ae11044aa9 NeilBrown       2023-03-22  1858  			return;
4bd0ae11044aa9 NeilBrown       2023-03-22  1859  		}
4bd0ae11044aa9 NeilBrown       2023-03-22  1860  		nfsi->ooo->gap[cnt].start = start;
4bd0ae11044aa9 NeilBrown       2023-03-22  1861  		nfsi->ooo->gap[cnt].end = end;
4bd0ae11044aa9 NeilBrown       2023-03-22  1862  		cnt += 1;
4bd0ae11044aa9 NeilBrown       2023-03-22  1863  	}
4bd0ae11044aa9 NeilBrown       2023-03-22  1864  	nfsi->ooo->cnt = cnt;
4bd0ae11044aa9 NeilBrown       2023-03-22  1865  }
4bd0ae11044aa9 NeilBrown       2023-03-22  1866  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
