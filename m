Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C6E12E63
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Oct 2023 19:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iwUwSxKN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697053911; x=1728589911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GPKg/OqnjWkyJYITCDfwCSX0cCt5Ze8zm3SA3vKsGmo=;
  b=iwUwSxKNq62T7X4RvBvA6sazPg0z9gcs3eXZfuQ1d3DW3MSLNuc1iRgV
   qd/CMEornP3OZXqwE5PeijGadfuDOdkpRjSbV6Exnj6JhwTt30vPO4/6O
   gW16EGmg/lfgB8YX7QzDLoM8venp1EvUfjdej3GZD6oa8bQz/c5QvUVE1
   p7b0LVx/za7DuPIykSl4dhuxPXZCTHlJ9LHLYtEkbQWJdCQoDgKKU9YTW
   ZncpIQ37UiEvQgFzBYS3sCXcTE2ZIq6btuV/KhqEPInLyoTbHfYEMEQWD
   fwdDfKB6o0g9UP2jjN6SL9R7/BcIt9spSCy0WSe45sMoGl9RGiGXNKZtO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="6310410"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="6310410"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 12:51:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="870278528"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="870278528"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 11 Oct 2023 12:51:48 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqfFC-0002eb-1o;
	Wed, 11 Oct 2023 19:51:46 +0000
Date: Thu, 12 Oct 2023 03:51:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:x86/percpu 12/13] fs/buffer.c:1386 lookup_bh_lru() warn:
 ignoring unreachable code.
Message-ID: <202310120312.btjwLOvX-lkp@intel.com>
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
CC: x86@kernel.org
TO: Uros Bizjak <ubizjak@gmail.com>
CC: Ingo Molnar <mingo@kernel.org>
CC: Nadav Amit <namit@vmware.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/percpu
head:   e29aad08b1da7772b362537be32335c0394e65fe
commit: ca4256348660cb2162668ec3d13d1f921d05374a [12/13] x86/percpu: Use C for percpu read/write accessors
:::::: branch date: 22 hours ago
:::::: commit date: 7 days ago
config: i386-randconfig-141-20231011 (https://download.01.org/0day-ci/archive/20231012/202310120312.btjwLOvX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310120312.btjwLOvX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310120312.btjwLOvX-lkp@intel.com/

New smatch warnings:
fs/buffer.c:1386 lookup_bh_lru() warn: ignoring unreachable code.
fs/buffer.c:1386 lookup_bh_lru() warn: ignoring unreachable code.
fs/buffer.c:1386 lookup_bh_lru() warn: inconsistent indenting

Old smatch warnings:
fs/buffer.c:1390 lookup_bh_lru() warn: inconsistent indenting

vim +1386 fs/buffer.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  1363  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1364  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16  1365   * Look up the bh in this cpu's LRU.  If it's there, move it to the head.
^1da177e4c3f41 Linus Torvalds    2005-04-16  1366   */
858119e1593843 Arjan van de Ven  2006-01-14  1367  static struct buffer_head *
3991d3bd150639 Tomasz Kvarsin    2007-02-12  1368  lookup_bh_lru(struct block_device *bdev, sector_t block, unsigned size)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1369  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1370  	struct buffer_head *ret = NULL;
3991d3bd150639 Tomasz Kvarsin    2007-02-12  1371  	unsigned int i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1372  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1373  	check_irqs_on();
^1da177e4c3f41 Linus Torvalds    2005-04-16  1374  	bh_lru_lock();
8a237adf213d73 Marcelo Tosatti   2023-06-27  1375  	if (cpu_is_isolated(smp_processor_id())) {
8a237adf213d73 Marcelo Tosatti   2023-06-27  1376  		bh_lru_unlock();
8a237adf213d73 Marcelo Tosatti   2023-06-27  1377  		return NULL;
8a237adf213d73 Marcelo Tosatti   2023-06-27  1378  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1379  	for (i = 0; i < BH_LRU_SIZE; i++) {
c7b92516a9c68f Christoph Lameter 2010-12-06  1380  		struct buffer_head *bh = __this_cpu_read(bh_lrus.bhs[i]);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1381  
9470dd5d352985 Zach Brown        2014-10-13  1382  		if (bh && bh->b_blocknr == block && bh->b_bdev == bdev &&
9470dd5d352985 Zach Brown        2014-10-13  1383  		    bh->b_size == size) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1384  			if (i) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1385  				while (i) {
c7b92516a9c68f Christoph Lameter 2010-12-06 @1386  					__this_cpu_write(bh_lrus.bhs[i],
c7b92516a9c68f Christoph Lameter 2010-12-06  1387  						__this_cpu_read(bh_lrus.bhs[i - 1]));
^1da177e4c3f41 Linus Torvalds    2005-04-16  1388  					i--;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1389  				}
c7b92516a9c68f Christoph Lameter 2010-12-06  1390  				__this_cpu_write(bh_lrus.bhs[0], bh);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1391  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1392  			get_bh(bh);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1393  			ret = bh;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1394  			break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1395  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1396  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1397  	bh_lru_unlock();
^1da177e4c3f41 Linus Torvalds    2005-04-16  1398  	return ret;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1399  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  1400  

:::::: The code at line 1386 was first introduced by commit
:::::: c7b92516a9c68fa5403879225a5a19974a801ef6 fs: Use this_cpu_xx operations in buffer.c

:::::: TO: Christoph Lameter <cl@linux.com>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
