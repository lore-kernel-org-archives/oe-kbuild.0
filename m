Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89D217D7
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Apr 2023 07:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682838442; x=1714374442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eTmSN5WyIhqbVyQq5CupgM98AL0CBFgdI3Mt2enst80=;
  b=AzqRQuxI1iPWogpMPgirqv4GpyRc/lYtTXnjdRHPWA0EWWIKWG+7/6BI
   Yar/C6xPyzjatv06VVC8hkHlIPJdkYAXSQRCSqmPaCBVUubbE2nbjTzFs
   /+RV6J45+eoylORMT4fDtziFGZ3kPN9EfgP4YMuaMm5XukpKMryCH+Cj/
   3FAi1FiIDifxsf8tWLHf0jQVzxPFCoCOksk8jblONQQYlQQs4j/FvsFwq
   QHfpfcm2f265x6tha9+eQ5P0vsOo/jgbxeo6E0fK0xFhv88to3QQOwAaO
   nhS5qbcV7f+5uy2qJIXKMpSkg57u9qVJWnb5t1wdfo2jfhdDYVg8KPcVv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="434309071"
X-IronPort-AV: E=Sophos;i="5.99,238,1677571200"; 
   d="scan'208";a="434309071"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 00:07:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="1025229540"
X-IronPort-AV: E=Sophos;i="5.99,238,1677571200"; 
   d="scan'208";a="1025229540"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 Apr 2023 00:07:21 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pt19U-0001XX-2B;
	Sun, 30 Apr 2023 07:07:20 +0000
Date: Sun, 30 Apr 2023 15:06:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [isilence:io_uring/get-buf-op 10/11] drivers/char/mem.c:
 linux/splice.h is included more than once.
Message-ID: <202304301515.q49XegJ6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Pavel Begunkov <asml.silence@gmail.com>

tree:   https://github.com/isilence/linux io_uring/get-buf-op
head:   d4d86a65af9ecafa81981e7b1ba804eaac7de023
commit: adf5ce0124b4b76a4ff143a16f598124e7116bad [10/11] TEST: mem: testing ->get_buf impl for /dev/null
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304301515.q49XegJ6-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/char/mem.c: linux/splice.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
