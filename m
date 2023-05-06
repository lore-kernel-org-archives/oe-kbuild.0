Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD7B7C
	for <oe-kbuild@lists.linux.dev>; Sat,  6 May 2023 08:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683362708; x=1714898708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3uqs4XvIY/Jipo0szFSq6ZWRz79nBCRmGD73pFdYvGE=;
  b=T7/Bq6f8/X/zCSPuLoKirXExZJOwq0Gjv/HwovOjKWU/bYF7wChyuS9h
   6CeuWyrWRavjaSHEtOao9V4fqP2XLkH18shAvdV3EEwtHkr7PK6yG0wFq
   NVQPniROUW4eLc1SLkXV5+6GC80FxXl8NxrLAikYjWdwJK6dmxwycMQR7
   6+P1X4Dix7xu5spyYMkDxqcSoIloCgvsW7VVpOMFHwVeBBPfcviPrwo9Y
   AhrQ9SFrv/Ke27l6EdcLWRxYKFSQZAGr+E8RzpZDK8g8f5susAuS8Jw7o
   wn9klOdG7YhKQl3xy0bIcBxHc6KO/tGqgK39fxU6muHFRZbYA4/TekZLu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="333793004"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="333793004"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 01:45:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="872198393"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="872198393"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 May 2023 01:45:06 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvDXO-00004j-0G;
	Sat, 06 May 2023 08:45:06 +0000
Date: Sat, 6 May 2023 16:44:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/nfs/inode.c:1854 nfs_ooo_merge() error: testing array offset
 'cnt' after use.
Message-ID: <202305061623.JNCCAx1G-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: NeilBrown <neilb@suse.de>
CC: Anna Schumaker <Anna.Schumaker@Netapp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2e1e1337881b0e9844d687982aa54b31b1269b11
commit: 3db63daabe210af32a09533fe7d8d47c711a103c NFSv3: handle out-of-order write replies.
date:   4 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-m001-20230501 (https://download.01.org/0day-ci/archive/20230506/202305061623.JNCCAx1G-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305061623.JNCCAx1G-lkp@intel.com/

smatch warnings:
fs/nfs/inode.c:1854 nfs_ooo_merge() error: testing array offset 'cnt' after use.

vim +/cnt +1854 fs/nfs/inode.c

7b24dacf084005 Trond Myklebust 2021-04-09  1820  
3db63daabe210a NeilBrown       2023-03-22  1821  static void nfs_ooo_merge(struct nfs_inode *nfsi,
3db63daabe210a NeilBrown       2023-03-22  1822  			  u64 start, u64 end)
3db63daabe210a NeilBrown       2023-03-22  1823  {
3db63daabe210a NeilBrown       2023-03-22  1824  	int i, cnt;
3db63daabe210a NeilBrown       2023-03-22  1825  
3db63daabe210a NeilBrown       2023-03-22  1826  	if (nfsi->cache_validity & NFS_INO_DATA_INVAL_DEFER)
3db63daabe210a NeilBrown       2023-03-22  1827  		/* No point merging anything */
3db63daabe210a NeilBrown       2023-03-22  1828  		return;
3db63daabe210a NeilBrown       2023-03-22  1829  
3db63daabe210a NeilBrown       2023-03-22  1830  	if (!nfsi->ooo) {
3db63daabe210a NeilBrown       2023-03-22  1831  		nfsi->ooo = kmalloc(sizeof(*nfsi->ooo), GFP_ATOMIC);
3db63daabe210a NeilBrown       2023-03-22  1832  		if (!nfsi->ooo) {
3db63daabe210a NeilBrown       2023-03-22  1833  			nfsi->cache_validity |= NFS_INO_DATA_INVAL_DEFER;
3db63daabe210a NeilBrown       2023-03-22  1834  			return;
3db63daabe210a NeilBrown       2023-03-22  1835  		}
3db63daabe210a NeilBrown       2023-03-22  1836  		nfsi->ooo->cnt = 0;
3db63daabe210a NeilBrown       2023-03-22  1837  	}
3db63daabe210a NeilBrown       2023-03-22  1838  
3db63daabe210a NeilBrown       2023-03-22  1839  	/* add this range, merging if possible */
3db63daabe210a NeilBrown       2023-03-22  1840  	cnt = nfsi->ooo->cnt;
3db63daabe210a NeilBrown       2023-03-22  1841  	for (i = 0; i < cnt; i++) {
3db63daabe210a NeilBrown       2023-03-22  1842  		if (end == nfsi->ooo->gap[i].start)
3db63daabe210a NeilBrown       2023-03-22  1843  			end = nfsi->ooo->gap[i].end;
3db63daabe210a NeilBrown       2023-03-22  1844  		else if (start == nfsi->ooo->gap[i].end)
3db63daabe210a NeilBrown       2023-03-22  1845  			start = nfsi->ooo->gap[i].start;
3db63daabe210a NeilBrown       2023-03-22  1846  		else
3db63daabe210a NeilBrown       2023-03-22  1847  			continue;
3db63daabe210a NeilBrown       2023-03-22  1848  		/* Remove 'i' from table and loop to insert the new range */
3db63daabe210a NeilBrown       2023-03-22  1849  		cnt -= 1;
3db63daabe210a NeilBrown       2023-03-22  1850  		nfsi->ooo->gap[i] = nfsi->ooo->gap[cnt];
3db63daabe210a NeilBrown       2023-03-22  1851  		i = -1;
3db63daabe210a NeilBrown       2023-03-22  1852  	}
3db63daabe210a NeilBrown       2023-03-22  1853  	if (start != end) {
3db63daabe210a NeilBrown       2023-03-22 @1854  		if (cnt >= ARRAY_SIZE(nfsi->ooo->gap)) {
3db63daabe210a NeilBrown       2023-03-22  1855  			nfsi->cache_validity |= NFS_INO_DATA_INVAL_DEFER;
3db63daabe210a NeilBrown       2023-03-22  1856  			kfree(nfsi->ooo);
3db63daabe210a NeilBrown       2023-03-22  1857  			nfsi->ooo = NULL;
3db63daabe210a NeilBrown       2023-03-22  1858  			return;
3db63daabe210a NeilBrown       2023-03-22  1859  		}
3db63daabe210a NeilBrown       2023-03-22  1860  		nfsi->ooo->gap[cnt].start = start;
3db63daabe210a NeilBrown       2023-03-22  1861  		nfsi->ooo->gap[cnt].end = end;
3db63daabe210a NeilBrown       2023-03-22  1862  		cnt += 1;
3db63daabe210a NeilBrown       2023-03-22  1863  	}
3db63daabe210a NeilBrown       2023-03-22  1864  	nfsi->ooo->cnt = cnt;
3db63daabe210a NeilBrown       2023-03-22  1865  }
3db63daabe210a NeilBrown       2023-03-22  1866  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
