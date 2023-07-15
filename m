Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA89C291D
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Jul 2023 20:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689451572; x=1720987572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1YNYKKVjP7MOhkt8tiLL4e7lkplT8ZQXNPcSyUgy2Yw=;
  b=Pz29DvzZJl05ARrf4PSj1rCrkm+86eKlpgmZVFQQxC7/ri6TPwNBsSlk
   D0jv1pc//JZG/4azYyWCKyUewZXsryNKkSqR3ZOxVxvZ7VvW6QNBIsN4t
   6cibGHzMaFAdJQ1opGHwyoIat2MBhjktUG9N0f6Jzv9/UQIRQ35QH2Mi/
   QWa/TBn3u450JTYXo0sCyvro7bCBwYqBOLJZlOw6a6QV5w0nsdjL5LyEe
   e3HW9Xt48jk2pi1SY/GqbqqyKKIV1oCZSa8XHVzjrs42xsytkPmvMXVgF
   cS66PCUjV6c+5wMLN3hQYHuB+u/cY3I/jIYueDhhUVWuTRHCBU+5SfPw8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="368338590"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="368338590"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 13:06:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="836409918"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="836409918"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2023 13:06:06 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKlWn-0008LX-0A;
	Sat, 15 Jul 2023 20:06:05 +0000
Date: Sun, 16 Jul 2023 04:05:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3] bcache: Separate bch_moving_gc() from bch_btree_gc()
Message-ID: <202307160359.0vHG3r40-lkp@intel.com>
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
In-Reply-To: <20230629114740.311-1-mingzhe.zou@easystack.cn>
References: <20230629114740.311-1-mingzhe.zou@easystack.cn>
TO: Mingzhe Zou <mingzhe.zou@easystack.cn>
TO: colyli@suse.de
TO: linux-bcache@vger.kernel.org
CC: bcache@lists.ewheeler.net
CC: zoumingzhe@qq.com

Hi Mingzhe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.5-rc1 next-20230714]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mingzhe-Zou/bcache-Separate-bch_moving_gc-from-bch_btree_gc/20230629-194834
base:   linus/master
patch link:    https://lore.kernel.org/r/20230629114740.311-1-mingzhe.zou%40easystack.cn
patch subject: [PATCH v3] bcache: Separate bch_moving_gc() from bch_btree_gc()
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-m001-20230710 (https://download.01.org/0day-ci/archive/20230716/202307160359.0vHG3r40-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307160359.0vHG3r40-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307160359.0vHG3r40-lkp@intel.com/

New smatch warnings:
drivers/md/bcache/btree.c:1887 moving_gc_should_run() error: uninitialized symbol 'used_sectors'.

Old smatch warnings:
drivers/md/bcache/btree.c:1535 btree_gc_rewrite_node() error: 'n' dereferencing possible ERR_PTR()
drivers/md/bcache/btree.c:1551 btree_gc_rewrite_node() error: 'n' dereferencing possible ERR_PTR()

vim +/used_sectors +1887 drivers/md/bcache/btree.c

4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1855  
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1856  static bool moving_gc_should_run(struct cache_set *c)
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1857  {
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1858  	struct bucket *b;
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1859  	struct cache *ca = c->cache;
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1860  	size_t moving_gc_threshold = ca->sb.bucket_size >> 2, frag_percent;
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1861  	unsigned long used_buckets = 0, frag_buckets = 0, move_buckets = 0;
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1862  	unsigned long dirty_sectors = 0, frag_sectors, used_sectors;
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1863  
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1864  	if (c->gc_stats.in_use > bch_cutoff_writeback_sync)
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1865  		return true;
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1866  
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1867  	mutex_lock(&c->bucket_lock);
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1868  	for_each_bucket(b, ca) {
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1869  		if (GC_MARK(b) != GC_MARK_DIRTY)
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1870  			continue;
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1871  
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1872  		used_buckets++;
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1873  
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1874  		used_sectors = GC_SECTORS_USED(b);
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1875  		dirty_sectors += used_sectors;
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1876  
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1877  		if (used_sectors < ca->sb.bucket_size)
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1878  			frag_buckets++;
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1879  
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1880  		if (used_sectors <= moving_gc_threshold)
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1881  			move_buckets++;
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1882  	}
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1883  	mutex_unlock(&c->bucket_lock);
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1884  
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1885  	c->fragment_nbuckets = frag_buckets;
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1886  
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29 @1887  	if (used_sectors < c->nbuckets * bch_cutoff_writeback / 100)
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1888  		return false;
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1889  
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1890  	if (move_buckets > ca->heap.size)
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1891  		return true;
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1892  
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1893  	frag_sectors = used_buckets * ca->sb.bucket_size - dirty_sectors;
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1894  	frag_percent = div_u64(frag_sectors * 100, ca->sb.bucket_size * c->nbuckets);
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1895  
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1896  	if (frag_percent >= COPY_GC_PERCENT)
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1897  		return true;
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1898  
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1899  	if (used_sectors > c->nbuckets * bch_cutoff_writeback_sync / 100)
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1900  		return true;
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1901  
4b0cf76f1e36e7 Mingzhe Zou     2023-06-29  1902  	return false;
cafe563591446c Kent Overstreet 2013-03-23  1903  }
cafe563591446c Kent Overstreet 2013-03-23  1904  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
