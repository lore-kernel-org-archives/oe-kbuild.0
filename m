Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B6C17C6
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Aug 2023 06:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691216060; x=1722752060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kasqj8NyKY0vLdZq1wjGG/ETlxWWBi2IMJU5B6sqTDw=;
  b=cNrlgE0vPmMnscn5IYfIUXiMZdSJOYjV0YTCd4QeIafqO8FTEaE7cljW
   dEE3k/wE7D2l/1NccbGrBHXz6Pf4lKqoKUDhwcJ/PKLVm8HHwG40nClSy
   rgEwY09xY59ciY4dtlnQzRurOxGI/EMeAqqQStW/V7ysz8fwbGZylVQf5
   2ltafFwKK/0pakTteWKiKpiLDw3s8RKPw59KbGwau4SlmNKW9H3le725J
   n6Bzh5yaCL0EmhIla37DNaqomkH626XP3RzjNmkh3FYDLqwDtui9S3aBV
   +eQzcQuFN+gqi4PbyTEwg9of9SA/RjV+hIyCxk3zw+8pU00rZbF3z5zbq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="369191326"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; 
   d="scan'208";a="369191326"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 23:14:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="733521314"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; 
   d="scan'208";a="733521314"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 Aug 2023 23:14:17 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSAYK-0003Lr-2F;
	Sat, 05 Aug 2023 06:14:16 +0000
Date: Sat, 5 Aug 2023 14:13:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 5/5] minmax: Relax check to allow comparison between
 int and small unsigned constants.
Message-ID: <202308051343.jPxNEkVB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/bio.h:194:9: sparse: sparse: too long token expansion"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <b6a49ed73aba427ca8bb433763fa94e9@AcuMS.aculab.com>
References: <b6a49ed73aba427ca8bb433763fa94e9@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
TO: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
TO: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
TO: "'Christoph Hellwig'" <hch@infradead.org>
TO: "'Jason A. Donenfeld'" <Jason@zx2c4.com>
TO: "'Linus Torvalds'" <torvalds@linux-foundation.org>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on crng-random/master v6.5-rc4 next-20230804]
[cannot apply to next-20230804 akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Add-min_unsigned-a-b-and-max_unsigned-a-b/20230804-190414
base:   linus/master
patch link:    https://lore.kernel.org/r/b6a49ed73aba427ca8bb433763fa94e9%40AcuMS.aculab.com
patch subject: [PATCH v3 5/5] minmax: Relax check to allow comparison between int and small unsigned constants.
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: s390-randconfig-r072-20230730 (https://download.01.org/0day-ci/archive/20230805/202308051343.jPxNEkVB-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308051343.jPxNEkVB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308051343.jPxNEkVB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   block/blk-ioc.c: note: in included file:
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/blk-ioc.c: note: in included file (through block/blk-crypto-internal.h, block/blk.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/blk-flush.c: note: in included file:
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/blk-flush.c: note: in included file (through block/blk-crypto-internal.h, block/blk.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/blk-map.c: note: in included file:
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/blk-map.c: note: in included file (through block/blk-crypto-internal.h, block/blk.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/blk-settings.c: note: in included file:
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/blk-settings.c: note: in included file (through block/blk-crypto-internal.h, block/blk.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/fops.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/fops.c: note: in included file (through block/blk-crypto-internal.h, block/blk.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/blk-sysfs.c: note: in included file:
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/blk-sysfs.c: note: in included file (through include/linux/blktrace_api.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/bdev.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/bdev.c: note: in included file (through include/linux/blk-integrity.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/elevator.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/elevator.c: note: in included file (through include/linux/blktrace_api.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/blk-core.c: note: in included file:
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/blk-core.c: note: in included file (through include/linux/blk-integrity.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/blk-timeout.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/blk-timeout.c: note: in included file (through block/blk-crypto-internal.h, block/blk.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/blk-lib.c: note: in included file:
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/blk-lib.c: note: in included file (through block/blk-crypto-internal.h, block/blk.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/bio.c: note: in included file:
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/bio.c: note: in included file (through include/linux/blktrace_api.h, include/trace/events/block.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> block/bio.c:614:9: sparse: sparse: too long token expansion
>> block/bio.c:614:9: sparse: sparse: too long token expansion
   block/bio.c:642:9: sparse: sparse: too long token expansion
   block/bio.c:642:9: sparse: sparse: too long token expansion
   block/bio.c:1410:41: sparse: sparse: too long token expansion
   block/bio.c:1410:41: sparse: sparse: too long token expansion
   block/bio.c:1411:41: sparse: sparse: too long token expansion
   block/bio.c:1411:41: sparse: sparse: too long token expansion
--
   block/blk-stat.c: note: in included file (through include/linux/blkdev.h, block/blk-stat.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/blk-stat.c: note: in included file (through block/blk-mq.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/blk-mq-sysfs.c: note: in included file:
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/blk-mq-sysfs.c: note: in included file (through block/blk-crypto-internal.h, block/blk.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/blk-merge.c: note: in included file:
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/blk-merge.c: note: in included file (through include/linux/blk-integrity.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/blk-mq-tag.c: note: in included file (through include/linux/blkdev.h, include/linux/blk-crypto.h, block/blk.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/blk-mq-tag.c: note: in included file (through block/blk-crypto-internal.h, block/blk.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/blk-mq-cpumap.c: note: in included file (through include/linux/blkdev.h, include/linux/blk-crypto.h, block/blk.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/blk-mq-cpumap.c: note: in included file (through block/blk-crypto-internal.h, block/blk.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/blk-mq-sched.c: note: in included file (through include/linux/blkdev.h, include/linux/blk-mq.h, include/linux/blktrace_api.h, ...):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/blk-mq-sched.c: note: in included file (through include/linux/blktrace_api.h, include/trace/events/block.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/genhd.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/genhd.c: note: in included file (through include/linux/blktrace_api.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/ioprio.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   block/ioctl.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/ioctl.c: note: in included file (through include/linux/blktrace_api.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/blk-rq-qos.c: note: in included file (through include/linux/blkdev.h, block/blk-rq-qos.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/blk-rq-qos.c: note: in included file (through block/blk-rq-qos.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/disk-events.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/disk-events.c: note: in included file (through block/blk-crypto-internal.h, block/blk.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/blk-ia-ranges.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/blk-ia-ranges.c: note: in included file (through block/blk-crypto-internal.h, block/blk.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/early-lookup.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   block/blk-mq.c: note: in included file:
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/blk-mq.c: note: in included file (through include/linux/blk-integrity.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/bio-integrity.c: note: in included file (through include/linux/blkdev.h, include/linux/blk-mq.h, include/linux/blk-integrity.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/bio-integrity.c: note: in included file (through include/linux/blk-integrity.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> block/bio-integrity.c:167:9: sparse: sparse: too long token expansion
>> block/bio-integrity.c:167:9: sparse: sparse: too long token expansion
--
   block/blk-integrity.c: note: in included file (through include/linux/blkdev.h, include/linux/blk-mq.h, include/linux/blk-integrity.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/blk-integrity.c: note: in included file (through include/linux/blk-integrity.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> block/blk-integrity.c:35:9: sparse: sparse: too long token expansion
>> block/blk-integrity.c:35:9: sparse: sparse: too long token expansion
   block/blk-integrity.c:77:9: sparse: sparse: too long token expansion
   block/blk-integrity.c:77:9: sparse: sparse: too long token expansion
--
   block/mq-deadline.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/mq-deadline.c: note: in included file (through include/linux/blktrace_api.h, include/trace/events/block.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/kyber-iosched.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/kyber-iosched.c: note: in included file (through include/linux/blktrace_api.h, include/trace/events/block.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/t10-pi.c: note: in included file (through include/linux/blkdev.h, include/linux/blk-mq.h, include/linux/t10-pi.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/t10-pi.c: note: in included file (through include/linux/t10-pi.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> block/t10-pi.c:151:17: sparse: sparse: too long token expansion
>> block/t10-pi.c:151:17: sparse: sparse: too long token expansion
   block/t10-pi.c:197:17: sparse: sparse: too long token expansion
   block/t10-pi.c:197:17: sparse: sparse: too long token expansion
   block/t10-pi.c:390:17: sparse: sparse: too long token expansion
   block/t10-pi.c:390:17: sparse: sparse: too long token expansion
   block/t10-pi.c:425:17: sparse: sparse: too long token expansion
   block/t10-pi.c:425:17: sparse: sparse: too long token expansion
--
   block/blk-mq-virtio.c: note: in included file (through include/linux/blkdev.h, include/linux/blk-mq.h, block/blk-mq.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/blk-mq-virtio.c: note: in included file (through block/blk-mq.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/blk-mq-debugfs-zoned.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   block/blk-zoned.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/blk-zoned.c: note: in included file:
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/blk-mq-debugfs.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/blk-mq-debugfs.c: note: in included file (through block/blk-crypto-internal.h, block/blk.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/sed-opal.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   kernel/exit.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   kernel/exit.c:455:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/exit.c:455:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/exit.c:455:23: sparse:    struct task_struct *
   kernel/exit.c:479:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/exit.c:479:9: sparse:    struct list_head *
   kernel/exit.c:479:9: sparse:    struct list_head [noderef] __rcu *
   kernel/exit.c:1533:59: sparse: sparse: incompatible types in comparison expression (different base types):
   kernel/exit.c:1533:59: sparse:    void *
   kernel/exit.c:1533:59: sparse:    struct task_struct [noderef] __rcu *
--
>> kernel/pid.c:651:19: sparse: sparse: too long token expansion
>> kernel/pid.c:651:19: sparse: sparse: too long token expansion
   kernel/pid.c:379:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/pid.c:379:9: sparse:    struct pid [noderef] __rcu *
   kernel/pid.c:379:9: sparse:    struct pid *
   kernel/pid.c:380:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/pid.c:380:9: sparse:    struct pid [noderef] __rcu *
   kernel/pid.c:380:9: sparse:    struct pid *
   kernel/pid.c:442:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/pid.c:442:23: sparse:    struct pid [noderef] __rcu *
   kernel/pid.c:442:23: sparse:    struct pid *
   kernel/pid.c:500:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/pid.c:500:24: sparse:    struct pid [noderef] __rcu *
   kernel/pid.c:500:24: sparse:    struct pid *
   kernel/pid.c: note: in included file (through include/linux/pid.h, include/linux/sched.h, include/linux/mm.h):
   include/linux/rculist.h:552:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rculist.h:552:9: sparse:    struct hlist_node [noderef] __rcu *
   include/linux/rculist.h:552:9: sparse:    struct hlist_node *
   include/linux/rculist.h:553:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rculist.h:553:9: sparse:    struct hlist_node [noderef] __rcu *
   include/linux/rculist.h:553:9: sparse:    struct hlist_node *
--
   mm/page_io.c: note: in included file:
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   mm/swap_state.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   mm/swapfile.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   mm/page-writeback.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   mm/readahead.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
>> mm/page_alloc.c:800:9: sparse: sparse: too long token expansion
--
   mm/vmscan.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   mm/backing-dev.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   mm/show_mem.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   mm/highmem.c: note: in included file:
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   drivers/mtd/mtdsuper.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   drivers/mtd/mtd_blkdevs.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   drivers/mtd/mtd_blkdevs.c: note: in included file:
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> drivers/mtd/mtd_blkdevs.c:76:17: sparse: sparse: too long token expansion
>> drivers/mtd/mtd_blkdevs.c:76:17: sparse: sparse: too long token expansion
   drivers/mtd/mtd_blkdevs.c:83:17: sparse: sparse: too long token expansion
   drivers/mtd/mtd_blkdevs.c:83:17: sparse: sparse: too long token expansion
--
   drivers/mtd/nftlcore.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   drivers/mtd/mtdswap.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/tree-mod-log.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h, fs/btrfs/tree-mod-log.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/fs.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/messages.c: note: in included file (through include/linux/blkdev.h, fs/btrfs/fs.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/extent-io-tree.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/acl.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/bio.c: note: in included file:
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> fs/btrfs/bio.c:308:37: sparse: sparse: too long token expansion
>> fs/btrfs/bio.c:308:37: sparse: sparse: too long token expansion
--
   fs/btrfs/tests/extent-buffer-tests.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/tests/../ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/tests/free-space-tests.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/tests/../ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/zoned.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/tests/btrfs-tests.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/tests/../ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/tests/inode-tests.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/tests/../ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/tests/extent-io-tests.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/tests/../ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/tests/qgroup-tests.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/tests/../ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/tests/free-space-tree-tests.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/tests/../ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/tests/extent-map-tests.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/tests/../ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/free-space-tree.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/super.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/print-tree.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/root-tree.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/dir-item.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/ctree.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   fs/btrfs/ctree.c:260:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/btrfs/ctree.c:260:22: sparse:    struct extent_buffer [noderef] __rcu *
   fs/btrfs/ctree.c:260:22: sparse:    struct extent_buffer *
   fs/btrfs/ctree.c:599:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/btrfs/ctree.c:599:17: sparse:    struct extent_buffer [noderef] __rcu *
   fs/btrfs/ctree.c:599:17: sparse:    struct extent_buffer *
   fs/btrfs/ctree.c:1066:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/btrfs/ctree.c:1066:17: sparse:    struct extent_buffer [noderef] __rcu *
   fs/btrfs/ctree.c:1066:17: sparse:    struct extent_buffer *
   fs/btrfs/ctree.c:2983:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/btrfs/ctree.c:2983:9: sparse:    struct extent_buffer [noderef] __rcu *
   fs/btrfs/ctree.c:2983:9: sparse:    struct extent_buffer *
--
   fs/btrfs/extent-tree.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/inode-item.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/file-item.c: note: in included file:
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> fs/btrfs/file-item.c:754:9: sparse: sparse: too long token expansion
>> fs/btrfs/file-item.c:754:9: sparse: sparse: too long token expansion
   fs/btrfs/file-item.c:1187:24: sparse: sparse: too long token expansion
   fs/btrfs/file-item.c:1187:24: sparse: sparse: too long token expansion
   fs/btrfs/file-item.c:1212:23: sparse: sparse: too long token expansion
   fs/btrfs/file-item.c:1212:23: sparse: sparse: too long token expansion
--
   fs/btrfs/transaction.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/defrag.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/disk-io.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/file.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/extent_map.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/sysfs.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/accessors.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/xattr.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/ordered-data.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/async-thread.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/inode.c: note: in included file:
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/orphan.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/locking.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/export.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/extent_io.c: note: in included file:
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/ioctl.c: note: in included file:
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/lzo.c: note: in included file:
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/zlib.c: note: in included file:
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/zstd.c: note: in included file:
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/compression.c: note: in included file:
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> fs/btrfs/compression.c:1025:24: sparse: sparse: too long token expansion
>> fs/btrfs/compression.c:1025:24: sparse: sparse: too long token expansion
--
   fs/btrfs/delayed-ref.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/volumes.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/free-space-cache.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/relocation.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/ulist.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/delayed-inode.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/tree-log.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/dev-replace.c: note: in included file:
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/scrub.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/backref.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/uuid-tree.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/props.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h, fs/btrfs/props.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/tree-checker.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/qgroup.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/block-rsv.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/raid56.c: note: in included file:
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> fs/btrfs/raid56.c:1118:9: sparse: sparse: too long token expansion
>> fs/btrfs/raid56.c:1118:9: sparse: sparse: too long token expansion
--
   fs/btrfs/delalloc-space.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/space-info.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/send.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/discard.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/reflink.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/subpage.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   fs/btrfs/block-group.c: note: in included file (through include/linux/blkdev.h, include/linux/iomap.h, fs/btrfs/ctree.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
--
   block/partitions/core.c: note: in included file (through include/linux/blkdev.h, block/partitions/check.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/partitions/core.c: note: in included file (through block/partitions/../blk-crypto-internal.h, block/partitions/../blk.h, block/partitions/check.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/partitions/amiga.c: note: in included file (through include/linux/blkdev.h, block/partitions/check.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/partitions/amiga.c: note: in included file (through block/partitions/../blk-crypto-internal.h, block/partitions/../blk.h, block/partitions/check.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/partitions/atari.c: note: in included file (through include/linux/blkdev.h, block/partitions/check.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/partitions/atari.c: note: in included file (through block/partitions/../blk-crypto-internal.h, block/partitions/../blk.h, block/partitions/check.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/partitions/aix.c: note: in included file (through include/linux/blkdev.h, block/partitions/check.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/partitions/aix.c: note: in included file (through block/partitions/../blk-crypto-internal.h, block/partitions/../blk.h, block/partitions/check.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/partitions/cmdline.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/partitions/cmdline.c: note: in included file (through block/partitions/../blk-crypto-internal.h, block/partitions/../blk.h, block/partitions/check.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/partitions/sgi.c: note: in included file (through include/linux/blkdev.h, block/partitions/check.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/partitions/sgi.c: note: in included file (through block/partitions/../blk-crypto-internal.h, block/partitions/../blk.h, block/partitions/check.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/partitions/osf.c: note: in included file (through include/linux/blkdev.h, block/partitions/check.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/partitions/osf.c: note: in included file (through block/partitions/../blk-crypto-internal.h, block/partitions/../blk.h, block/partitions/check.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/partitions/karma.c: note: in included file (through include/linux/blkdev.h, block/partitions/check.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/partitions/karma.c: note: in included file (through block/partitions/../blk-crypto-internal.h, block/partitions/../blk.h, block/partitions/check.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   block/partitions/sysv68.c: note: in included file (through include/linux/blkdev.h, block/partitions/check.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   block/partitions/sysv68.c: note: in included file (through block/partitions/../blk-crypto-internal.h, block/partitions/../blk.h, block/partitions/check.h):
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
>> include/linux/blk-mq.h:1051:16: sparse: sparse: too long token expansion
--
   kernel/sched/core.c: note: in included file (through include/linux/blkdev.h):
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
>> include/linux/bio.h:194:9: sparse: sparse: too long token expansion
   kernel/sched/core.c:7128:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7128:17: sparse:    struct task_struct *
   kernel/sched/core.c:7128:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7344:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7344:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7344:22: sparse:    struct task_struct *
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2111:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2273:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct *
   kernel/sched/core.c:2178:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2178:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2178:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2111:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2273:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2273:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2111:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2273:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2111:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2273:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2111:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2273:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2111:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2273:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2111:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2273:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct *

vim +194 include/linux/bio.h

^1da177e4c3f41 Linus Torvalds     2005-04-16  173  
f45958756fef55 Shaohua Li         2017-03-24  174  static inline unsigned bio_segments(struct bio *bio)
458b76ed2f9517 Kent Overstreet    2013-09-24  175  {
458b76ed2f9517 Kent Overstreet    2013-09-24  176  	unsigned segs = 0;
458b76ed2f9517 Kent Overstreet    2013-09-24  177  	struct bio_vec bv;
458b76ed2f9517 Kent Overstreet    2013-09-24  178  	struct bvec_iter iter;
458b76ed2f9517 Kent Overstreet    2013-09-24  179  
8423ae3d7a3cfe Kent Overstreet    2014-02-10  180  	/*
a6f0788ec2881a Chaitanya Kulkarni 2016-11-30  181  	 * We special case discard/write same/write zeroes, because they
a6f0788ec2881a Chaitanya Kulkarni 2016-11-30  182  	 * interpret bi_size differently:
8423ae3d7a3cfe Kent Overstreet    2014-02-10  183  	 */
8423ae3d7a3cfe Kent Overstreet    2014-02-10  184  
a6f0788ec2881a Chaitanya Kulkarni 2016-11-30  185  	switch (bio_op(bio)) {
a6f0788ec2881a Chaitanya Kulkarni 2016-11-30  186  	case REQ_OP_DISCARD:
a6f0788ec2881a Chaitanya Kulkarni 2016-11-30  187  	case REQ_OP_SECURE_ERASE:
a6f0788ec2881a Chaitanya Kulkarni 2016-11-30  188  	case REQ_OP_WRITE_ZEROES:
f9d03f96b98800 Christoph Hellwig  2016-12-08  189  		return 0;
a6f0788ec2881a Chaitanya Kulkarni 2016-11-30  190  	default:
a6f0788ec2881a Chaitanya Kulkarni 2016-11-30  191  		break;
a6f0788ec2881a Chaitanya Kulkarni 2016-11-30  192  	}
8423ae3d7a3cfe Kent Overstreet    2014-02-10  193  
f45958756fef55 Shaohua Li         2017-03-24 @194  	bio_for_each_segment(bv, bio, iter)
458b76ed2f9517 Kent Overstreet    2013-09-24  195  		segs++;
458b76ed2f9517 Kent Overstreet    2013-09-24  196  
458b76ed2f9517 Kent Overstreet    2013-09-24  197  	return segs;
458b76ed2f9517 Kent Overstreet    2013-09-24  198  }
458b76ed2f9517 Kent Overstreet    2013-09-24  199  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
