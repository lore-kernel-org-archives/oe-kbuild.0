Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367ED107B7
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Feb 2023 11:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676373921; x=1707909921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FjFqH85B61dlF41jzmxiMRpD20VfbzK8nREGVPSOJTE=;
  b=XmCoEXFc9V7VbHRrBHEdQDWA47hxCSJscfx78SMa+RTm2SnAPUsz60eZ
   PugPUz+XyxmZVc5SQoKT8QWQKoaQ8B9I4EMNGYe3Dc4v0r2RSTQINxJex
   hgctCntfmvCGnhNB6R9TYiRmj1O+6qy7zA3WXjZEp62wosy3OCpQva3ML
   h3Lp/B9rEG1AO0Px04PSx87bIBBin9CmjLLvzmigv3u35UKnD74kbdVpD
   eDoyBWp3ZPXaGG54FoKdTzRrhY++m1CKGc8rLWEqZHBZYJ8iTI5KdxTXG
   CGN4K/BL9OyPFZlGIlzA4OoBAQCwdEh0S9ddndtLdD3ghEBFQpznDNomk
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="331136007"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="331136007"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 03:25:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="646731416"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="646731416"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 14 Feb 2023 03:25:06 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRtQn-0008Re-2P;
	Tue, 14 Feb 2023 11:25:05 +0000
Date: Tue, 14 Feb 2023 19:24:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] NFSv3: handle out-of-order write replies.
Message-ID: <202302141906.rOjVGF3o-lkp@intel.com>
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
In-Reply-To: <167633352764.1896.5445901294734308583@noble.neil.brown.name>
References: <167633352764.1896.5445901294734308583@noble.neil.brown.name>
TO: NeilBrown <neilb@suse.de>
TO: Trond Myklebust <trondmy@kernel.org>
TO: Anna Schumaker <anna@kernel.org>
CC: Jeff Layton <jlayton@kernel.org>
CC: Linux NFS Mailing List <linux-nfs@vger.kernel.org>

Hi NeilBrown,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on trondmy-nfs/linux-next]
[also build test WARNING on linus/master v6.2-rc8 next-20230214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/NFSv3-handle-out-of-order-write-replies/20230214-081351
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/167633352764.1896.5445901294734308583%40noble.neil.brown.name
patch subject: [PATCH v2] NFSv3: handle out-of-order write replies.
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230214/202302141906.rOjVGF3o-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302141906.rOjVGF3o-lkp@intel.com/

smatch warnings:
fs/nfs/inode.c:1846 nfs_ooo_merge() error: testing array offset 'cnt' after use.

vim +/cnt +1846 fs/nfs/inode.c

7b24dacf084005 Trond Myklebust 2021-04-09  1812  
6a60fcafcbaded NeilBrown       2023-02-14  1813  static void nfs_ooo_merge(struct nfs_inode *nfsi,
6a60fcafcbaded NeilBrown       2023-02-14  1814  			  u64 start, u64 end)
6a60fcafcbaded NeilBrown       2023-02-14  1815  {
6a60fcafcbaded NeilBrown       2023-02-14  1816  	int i, cnt;
6a60fcafcbaded NeilBrown       2023-02-14  1817  
6a60fcafcbaded NeilBrown       2023-02-14  1818  	if (nfsi->cache_validity & NFS_INO_DATA_INVAL_DEFER)
6a60fcafcbaded NeilBrown       2023-02-14  1819  		/* No point merging anything */
6a60fcafcbaded NeilBrown       2023-02-14  1820  		return;
6a60fcafcbaded NeilBrown       2023-02-14  1821  
6a60fcafcbaded NeilBrown       2023-02-14  1822  	if (!nfsi->ooo) {
6a60fcafcbaded NeilBrown       2023-02-14  1823  		nfsi->ooo = kmalloc(sizeof(*nfsi->ooo), GFP_ATOMIC);
6a60fcafcbaded NeilBrown       2023-02-14  1824  		if (!nfsi->ooo) {
6a60fcafcbaded NeilBrown       2023-02-14  1825  			nfsi->cache_validity |= NFS_INO_DATA_INVAL_DEFER;
6a60fcafcbaded NeilBrown       2023-02-14  1826  			return;
6a60fcafcbaded NeilBrown       2023-02-14  1827  		}
6a60fcafcbaded NeilBrown       2023-02-14  1828  		nfsi->ooo->cnt = 0;
6a60fcafcbaded NeilBrown       2023-02-14  1829  	}
6a60fcafcbaded NeilBrown       2023-02-14  1830  
6a60fcafcbaded NeilBrown       2023-02-14  1831  	/* add this range, merging if possible */
6a60fcafcbaded NeilBrown       2023-02-14  1832  	cnt = nfsi->ooo->cnt;
6a60fcafcbaded NeilBrown       2023-02-14  1833  	for (i = 0; i < cnt; i++) {
6a60fcafcbaded NeilBrown       2023-02-14  1834  		if (end == nfsi->ooo->gap[i].start)
6a60fcafcbaded NeilBrown       2023-02-14  1835  			end = nfsi->ooo->gap[i].end;
6a60fcafcbaded NeilBrown       2023-02-14  1836  		else if (start == nfsi->ooo->gap[i].end)
6a60fcafcbaded NeilBrown       2023-02-14  1837  			start = nfsi->ooo->gap[i].start;
6a60fcafcbaded NeilBrown       2023-02-14  1838  		else
6a60fcafcbaded NeilBrown       2023-02-14  1839  			continue;
6a60fcafcbaded NeilBrown       2023-02-14  1840  		/* Remove 'i' from table and loop to insert the new range */
6a60fcafcbaded NeilBrown       2023-02-14  1841  		cnt -= 1;
6a60fcafcbaded NeilBrown       2023-02-14  1842  		nfsi->ooo->gap[i] = nfsi->ooo->gap[cnt];
6a60fcafcbaded NeilBrown       2023-02-14  1843  		i = -1;
6a60fcafcbaded NeilBrown       2023-02-14  1844  	}
6a60fcafcbaded NeilBrown       2023-02-14  1845  	if (start != end) {
6a60fcafcbaded NeilBrown       2023-02-14 @1846  		if (cnt >= ARRAY_SIZE(nfsi->ooo->gap)) {
6a60fcafcbaded NeilBrown       2023-02-14  1847  			nfsi->cache_validity |= NFS_INO_DATA_INVAL_DEFER;
6a60fcafcbaded NeilBrown       2023-02-14  1848  			kfree(nfsi->ooo);
6a60fcafcbaded NeilBrown       2023-02-14  1849  			nfsi->ooo = NULL;
6a60fcafcbaded NeilBrown       2023-02-14  1850  			return;
6a60fcafcbaded NeilBrown       2023-02-14  1851  		}
6a60fcafcbaded NeilBrown       2023-02-14  1852  		nfsi->ooo->gap[cnt].start = start;
6a60fcafcbaded NeilBrown       2023-02-14  1853  		nfsi->ooo->gap[cnt].end = end;
6a60fcafcbaded NeilBrown       2023-02-14  1854  		cnt += 1;
6a60fcafcbaded NeilBrown       2023-02-14  1855  	}
6a60fcafcbaded NeilBrown       2023-02-14  1856  	nfsi->ooo->cnt = cnt;
6a60fcafcbaded NeilBrown       2023-02-14  1857  }
6a60fcafcbaded NeilBrown       2023-02-14  1858  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
