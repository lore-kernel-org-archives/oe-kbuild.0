Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1243E12E5F
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 06:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UCLKlAlP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701758226; x=1733294226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2w2lQQo3UJwK7xdOuWsbRtsZD+HWOGrxMW55+TjQbsg=;
  b=UCLKlAlP9Yp6ZgSsmYfFhw7rMxYaU8rq0075NHr/SHQ3HNT1gr7AvuUI
   PkJ8Fm0zKLqxHFFjCyCZc0sqtFPJrOQAswfsqeZERtSVjk5hhNbFGq2i4
   3713Ge02tx2EE/F+IEfeKQVF0USSuFV/m3LtH4CGXPy6JnHYcl1jvEuT9
   7FSnZw8S3zkY7p74GAQeUSIJvBLxxvHWbooZqYz8iHwNIhQhFO88nzmI2
   lfhzuy9QVgcRsp93yjkq9fE0jE9qt17j+T3XNl35ZRUoCwGqKnBdv3XbC
   1pcjLr57IIe4o4/YGBlpbV08MowmUuqcw1uo45Hmu7nNaAf7bOyB3novc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="374035354"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="374035354"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 22:37:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="764224104"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="764224104"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 04 Dec 2023 22:37:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAP3F-0008RZ-1a;
	Tue, 05 Dec 2023 06:37:01 +0000
Date: Tue, 5 Dec 2023 14:36:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/bcachefs/move.c:33:17-31: WARNING use flexible-array member
 instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Message-ID: <202312051447.F7YFxmFt-lkp@intel.com>
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
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit
date:   6 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-104-20231204 (https://download.01.org/0day-ci/archive/20231205/202312051447.F7YFxmFt-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231205/202312051447.F7YFxmFt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312051447.F7YFxmFt-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/move.c:33:17-31: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
--
>> fs/bcachefs/fs.c:437:1-7: preceding lock on line 351
   fs/bcachefs/fs.c:1559:4-10: preceding lock on line 1549
--
>> fs/bcachefs/journal.c:806:1-7: preceding lock on line 731
>> fs/bcachefs/journal.c:806:1-7: preceding lock on line 731
   fs/bcachefs/journal.c:806:1-7: preceding lock on line 767
--
>> fs/bcachefs/fs.c:235:12-13: WARNING opportunity for min()
--
>> fs/bcachefs/journal.c:624:20-21: WARNING opportunity for min()
   fs/bcachefs/journal.c:417:12-13: WARNING opportunity for min()
--
>> fs/bcachefs/journal_io.c:256:5-8: Unneeded variable: "ret". Return "  0" on line 263
   fs/bcachefs/journal_io.c:272:5-8: Unneeded variable: "ret". Return "  0" on line 288

vim +33 fs/bcachefs/move.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  20  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  21  struct moving_io {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  22  	struct list_head	list;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  23  	struct closure		cl;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  24  	bool			read_completed;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  25  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  26  	unsigned		read_sectors;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  27  	unsigned		write_sectors;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  28  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  29  	struct bch_read_bio	rbio;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  30  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  31  	struct migrate_write	write;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  32  	/* Must be last since it is variable size */
1c6fdbd8f2465d Kent Overstreet 2017-03-16 @33  	struct bio_vec		bi_inline_vecs[0];
1c6fdbd8f2465d Kent Overstreet 2017-03-16  34  };
1c6fdbd8f2465d Kent Overstreet 2017-03-16  35  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
