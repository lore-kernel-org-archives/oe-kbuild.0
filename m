Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E3114F124
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Sep 2024 08:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727168233; cv=none; b=qKEX5lo2OAWxo46pcZwSmViWIe2cZaA6q16NTitnk77sW5H9EWT5KBq9BJehHX8Bp6TpVFfKTQadMfN0hLWXes3d4X7coKNc8jFfBRj4QoIk5eGxRRZdhl6lLho7Qa6z4ZZJoSUHZZtupo15tlCJhMwIaeheVWJ+m6NZg/ab5fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727168233; c=relaxed/simple;
	bh=wEK6PwwFxavndrJztqKiWESV70w+QPDdNj6swXAPjKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ldB5H58WTzOP67en8TV4ilxhhWGnZHwBZyOa7tmnYjhrBC3UIdfjnO+Qita3aniEJ8rBpvw/xgIbj12RK28EZpM2lAohEw81RhJIBK6oyXjFs0i6LXhYxD0okyHLm37+iyvfZalHbYNlaVkJRJfRVE1VA38qP55wEE/a8+BEJes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESspYmzI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESspYmzI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727168231; x=1758704231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wEK6PwwFxavndrJztqKiWESV70w+QPDdNj6swXAPjKg=;
  b=ESspYmzI012saY04jrzm1zEc+DRL9eZnUgYdEWJd26TUn5OE1G/SUBIz
   ElGptnXPbpIuhrs7AbTUzx7hyHWA5CtBeR8L8DAp4ODS5f1KKttM6nsWI
   LbPq5D/ugo9zDuBk4HmrMqo49gfGk0eQusuGOeEjjuIPFQuhOrdgwV6bM
   X5FDHrQLwuVk9pdlLLcSYoIe9HQpO2zUjPnYDD7DYusSZprcVRTLSk2El
   USuUqxcwbJATAu29PsQCKObHBR8G3riS+hwG1sgqjEUWCsDqJFvZTkZm9
   Drl7AKYsbw2on85gHDoelij3eoZiYFs+rNF1zaWlmYJAc1VeB6vd6y/LF
   w==;
X-CSE-ConnectionGUID: 3p9XU5mISA6odp8qAdikKQ==
X-CSE-MsgGUID: Dpbi90r6TZWzxyDxm8NSHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="48681192"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="48681192"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 01:57:11 -0700
X-CSE-ConnectionGUID: kTvrGbxdQsyuHtfK3eWD4g==
X-CSE-MsgGUID: BmZagUt+Rq2Zc+Hl9lhF5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="108802273"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Sep 2024 01:57:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st1M3-000I8x-0p;
	Tue, 24 Sep 2024 08:57:07 +0000
Date: Tue, 24 Sep 2024 16:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] memfd: fuse_mnt: remove unused macro
Message-ID: <202409241613.KyXs9fiF-lkp@intel.com>
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
In-Reply-To: <20240903044455.11268-1-bajing@cmss.chinamobile.com>
References: <20240903044455.11268-1-bajing@cmss.chinamobile.com>
TO: Ba Jing <bajing@cmss.chinamobile.com>
TO: shuah@kernel.org
CC: bajing@cmss.chinamobile.com
CC: linux-kselftest@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Ba,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shuah-kselftest/next]
[also build test WARNING on shuah-kselftest/fixes linus/master v6.11 next-20240924]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ba-Jing/memfd-fuse_mnt-remove-unused-macro/20240923-161950
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20240903044455.11268-1-bajing%40cmss.chinamobile.com
patch subject: [PATCH] memfd: fuse_mnt: remove unused macro
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409241613.KyXs9fiF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409241613.KyXs9fiF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fuse_mnt.c:101:10: error: 'struct fuse_operations_compat2' has no member named 'readdir'
     101 |         .readdir        = memfd_readdir,
         |          ^~~~~~~
>> fuse_mnt.c:101:27: warning: initialization of 'int (*)(const char *, char *, size_t)' {aka 'int (*)(const char *, char *, long unsigned int)'} from incompatible pointer type 'int (*)(const char *, void *, int (*)(void *, const char *, const struct stat *, off_t), off_t,  struct fuse_file_info *)' {aka 'int (*)(const char *, void *, int (*)(void *, const char *, const struct stat *, long int), long int,  struct fuse_file_info *)'} [-Wincompatible-pointer-types]
     101 |         .readdir        = memfd_readdir,
         |                           ^~~~~~~~~~~~~
   fuse_mnt.c:101:27: note: (near initialization for 'memfd_ops.readlink')
>> fuse_mnt.c:102:27: warning: initialization of 'int (*)(const char *, int)' from incompatible pointer type 'int (*)(const char *, struct fuse_file_info *)' [-Wincompatible-pointer-types]
     102 |         .open           = memfd_open,
         |                           ^~~~~~~~~~
   fuse_mnt.c:102:27: note: (near initialization for 'memfd_ops.open')
>> fuse_mnt.c:103:27: warning: initialization of 'int (*)(const char *, char *, size_t,  off_t)' {aka 'int (*)(const char *, char *, long unsigned int,  long int)'} from incompatible pointer type 'int (*)(const char *, char *, size_t,  off_t,  struct fuse_file_info *)' {aka 'int (*)(const char *, char *, long unsigned int,  long int,  struct fuse_file_info *)'} [-Wincompatible-pointer-types]
     103 |         .read           = memfd_read,
         |                           ^~~~~~~~~~
   fuse_mnt.c:103:27: note: (near initialization for 'memfd_ops.read')
   In file included from /usr/include/fuse.h:9,
                    from fuse_mnt.c:15:
   fuse_mnt.c: In function 'main':
   fuse_mnt.c:108:16: error: too many arguments to function 'fuse_main_compat2'
     108 |         return fuse_main(argc, argv, &memfd_ops, NULL);
         |                ^~~~~~~~~
   In file included from /usr/include/fuse/fuse.h:1012:
   /usr/include/fuse/fuse_compat.h:151:5: note: declared here
     151 | int fuse_main_compat2(int argc, char *argv[],
         |     ^~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
