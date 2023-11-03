Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEED1549C
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Nov 2023 20:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F/KJgnb5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699044418; x=1730580418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ah3o10+WHUHZ8zVM0YJu4gJGyB+lZytS4ArpJmJY79E=;
  b=F/KJgnb5LkVwaKv85rX2iguZSe9rQj7xF+cYzYlVWNBF/okS5LPFQ46e
   rS0EmdEWH3rEezuvnZjpSH0l3bmaSxAL9A3epvbu7cDp4FgQHS8snTZWK
   hSbhNnVUWFLeFZrDNTamy9e43jxGRLJ/kpKY/Y1l3mNcpaKx4WP1fkZf9
   t0KiCcaZYtm+wdvlvVGpRHotoAfK1usbY0jhAacHRHxnd988ikKGf9yzV
   11ssXI2ugJxQQiXn5sPBHDHreC8+90o+icySjcdxxHXrpK41zO2p0w7SZ
   mjCQDzYwZleN3Ss625jCA95CJJ7JOdjiUiWUuS/+LFHwNcY0DBy4GsEMb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="475253840"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="475253840"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 13:46:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="790866245"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="790866245"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Nov 2023 13:46:55 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz149-0002vU-1r;
	Fri, 03 Nov 2023 20:46:53 +0000
Date: Sat, 4 Nov 2023 04:46:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/bcachefs/compress.c:34 __bounce_alloc() warn: possible memory
 leak of 'b'
Message-ID: <202311040441.HuERUoCH-lkp@intel.com>
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
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f6f76a6a29f36d2f3e4510d0bde5046672f6924
commit: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit
date:   12 days ago
:::::: branch date: 14 hours ago
:::::: commit date: 12 days ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231104/202311040441.HuERUoCH-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231104/202311040441.HuERUoCH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311040441.HuERUoCH-lkp@intel.com/

smatch warnings:
fs/bcachefs/compress.c:34 __bounce_alloc() warn: possible memory leak of 'b'

vim +/b +34 fs/bcachefs/compress.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  25  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  26  static struct bbuf __bounce_alloc(struct bch_fs *c, unsigned size, int rw)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  27  {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  28  	void *b;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  29  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  30  	BUG_ON(size > c->sb.encoded_extent_max << 9);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  31  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  32  	b = kmalloc(size, GFP_NOIO|__GFP_NOWARN);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  33  	if (b)
1c6fdbd8f2465d Kent Overstreet 2017-03-16 @34  		return (struct bbuf) { .b = b, .type = BB_KMALLOC, .rw = rw };
1c6fdbd8f2465d Kent Overstreet 2017-03-16  35  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  36  	b = mempool_alloc(&c->compression_bounce[rw], GFP_NOWAIT);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  37  	b = b ? page_address(b) : NULL;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  38  	if (b)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  39  		return (struct bbuf) { .b = b, .type = BB_MEMPOOL, .rw = rw };
1c6fdbd8f2465d Kent Overstreet 2017-03-16  40  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  41  	b = vmalloc(size);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  42  	if (b)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  43  		return (struct bbuf) { .b = b, .type = BB_VMALLOC, .rw = rw };
1c6fdbd8f2465d Kent Overstreet 2017-03-16  44  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  45  	b = mempool_alloc(&c->compression_bounce[rw], GFP_NOIO);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  46  	b = b ? page_address(b) : NULL;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  47  	if (b)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  48  		return (struct bbuf) { .b = b, .type = BB_MEMPOOL, .rw = rw };
1c6fdbd8f2465d Kent Overstreet 2017-03-16  49  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  50  	BUG();
1c6fdbd8f2465d Kent Overstreet 2017-03-16  51  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  52  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
