Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634226ABB
	for <oe-kbuild@lists.linux.dev>; Wed, 10 May 2023 13:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683724293; x=1715260293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nm+OpUiWT0jFA1dy4XIGocbPllm8/2i48b7cI8aKZ1w=;
  b=kJnEK7Sz/959328NoKePbj+aeTTqidNU8jVKeoNG1BZC+LB70LSbxTvW
   yzPlD+uRvqGOS7Rwc4RBA5hNUjwyazYlOtegLDYz4ErNGKu2W1RR3np+F
   JwgLlS84kHcrcDRxuwig16ExrKOIAYIFFQpaqVFKVwfdihSTyu71/BKJ6
   OjwGHQiiicl74p40r3bXq8bk17OYFZ6ns5QVgJQYoJn1uXfOcZX5jjOPC
   t1wdf7MKwQH7rmrYyQKoIvTji2mDdefEpDWUOlDS1reIAMQ5PGZYu2um2
   BMiNITciqsfvdKIOhJqbP/veEnad0bZSHzNS2UBnDUPKGTU/rfZETddtz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="378307230"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="378307230"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 06:11:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="811130915"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="811130915"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 May 2023 06:11:31 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwjbP-0003J9-0k;
	Wed, 10 May 2023 13:11:31 +0000
Date: Wed, 10 May 2023 21:11:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/iov_iter.c:1298 want_pages_array() warn: ambiguous units merge
 'count' 'page' or 'array_size'
Message-ID: <202305102104.SULT79lZ-lkp@intel.com>
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
TO: Al Viro <viro@zeniv.linux.org.uk>
CC: Jeff Layton <jlayton@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   16a8829130ca22666ac6236178a6233208d425c3
commit: 3cf42da327f26eb4461864dd64812345b37f4fd9 iov_iter: saner helper for page array allocation
date:   9 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230510/202305102104.SULT79lZ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305102104.SULT79lZ-lkp@intel.com/

smatch warnings:
lib/iov_iter.c:1298 want_pages_array() warn: ambiguous units merge 'count' 'page' or 'array_size'
lib/iov_iter.c:1298 want_pages_array() warn: ambiguous units merge 'count' 'array_size' or 'page'

vim +1298 lib/iov_iter.c

357f435d8a0d32 Al Viro 2016-04-08  1286  
3cf42da327f26e Al Viro 2022-06-17  1287  static int want_pages_array(struct page ***res, size_t size,
3cf42da327f26e Al Viro 2022-06-17  1288  			    size_t start, unsigned int maxpages)
acbdeb8320b0a4 Al Viro 2022-06-17  1289  {
3cf42da327f26e Al Viro 2022-06-17  1290  	unsigned int count = DIV_ROUND_UP(size + start, PAGE_SIZE);
3cf42da327f26e Al Viro 2022-06-17  1291  
3cf42da327f26e Al Viro 2022-06-17  1292  	if (count > maxpages)
3cf42da327f26e Al Viro 2022-06-17  1293  		count = maxpages;
3cf42da327f26e Al Viro 2022-06-17  1294  	WARN_ON(!count);	// caller should've prevented that
3cf42da327f26e Al Viro 2022-06-17  1295  	if (!*res) {
3cf42da327f26e Al Viro 2022-06-17  1296  		*res = kvmalloc_array(count, sizeof(struct page *), GFP_KERNEL);
3cf42da327f26e Al Viro 2022-06-17  1297  		if (!*res)
3cf42da327f26e Al Viro 2022-06-17 @1298  			return 0;
3cf42da327f26e Al Viro 2022-06-17  1299  	}
3cf42da327f26e Al Viro 2022-06-17  1300  	return count;
acbdeb8320b0a4 Al Viro 2022-06-17  1301  }
acbdeb8320b0a4 Al Viro 2022-06-17  1302  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
