Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D24258D
	for <oe-kbuild@lists.linux.dev>; Wed, 10 May 2023 08:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683706110; x=1715242110;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kwS1ehuljECP8Ar3xPvS8x3mkdr+oDmvFHjWFqRqC/E=;
  b=Fx2FqJpb7TJYjHES3RJ79qoj7IGXVh07oeLpNHtXy+jxgDfH6KVOYTvF
   Ome0V3RyXkaakHEdfsvit09Il6wk3oBZrBkD4jk0iLBVLH0fpgVJdkyzm
   I9cx62c3VIMEstPV52NT0559FQ9DMgnGcYqhPCfiO9s+2FvNkQSBH/lOS
   EuAoGjgd4LrefutkRAnBce6TMeqYXGOamtD5AMCg+qixY4HoXOlTtNL4N
   uSebC9Ub9N7RCfl++Gu/W9uhAD4piAXqVnVFHl9ejeLuWjCikEpze7QW5
   iYf6u0WWGRclBnRAuvrxLWdiyO9WacOvRdB8H3F6D/RuVSaHDW6sUbLfk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="329775173"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="329775173"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 01:08:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="945610371"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="945610371"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 May 2023 01:08:22 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwes1-000336-1p;
	Wed, 10 May 2023 08:08:21 +0000
Date: Wed, 10 May 2023 16:07:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/iov_iter.c:1298 want_pages_array() warn: ambiguous units merge
 'count' 'page' or 'array_size'
Message-ID: <202305101654.CPCc9h1a-lkp@intel.com>
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
:::::: branch date: 15 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230510/202305101654.CPCc9h1a-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305101654.CPCc9h1a-lkp@intel.com/

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
