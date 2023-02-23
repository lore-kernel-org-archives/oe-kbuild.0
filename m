Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A519F2F2A
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Feb 2023 18:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677175215; x=1708711215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BztgNGlVjXiNzvBFFD2JjRk7/1dfE05g9aeRKFNd4Ic=;
  b=Mw4l/6W2UN913Uh6nrsJHcHGIcF0d5qnj5kn0sM1o2ZwDYKihJ7cm48d
   YNLb9F8C1wSea52ZISEHjdN84eSrWfJm3RYpcoMnhXB4/eW10tzrAN57r
   rhZoWi4SZlytUFcx0vYyoeIJ8Qit+DoLH2TNW/lc7yRUggaQj5zdbxjSu
   uUh4tpmm35iz/sQLhQUiVyLg/5c3u9rE2OY3TsKp6/xRuCKtKWvozNtbR
   4y5GNhvZ0uEDpOyEZDzItSqUOViuTCIBFA+u9SttiL9Fm5Sb8YVwV0vI5
   fKp96MtdtmoDoBWxBJJD29iZmthTqse0ukE1N5Oxfs9eLVMTg/tNWKyQR
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="333285401"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="333285401"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 10:00:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="741357210"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="741357210"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 23 Feb 2023 10:00:13 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVFt7-0001bZ-0F;
	Thu, 23 Feb 2023 18:00:13 +0000
Date: Fri, 24 Feb 2023 01:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/bpf/queue_stack_maps.c:59 queue_stack_map_alloc_check() warn:
 impossible condition '(attr->value_size > (1 << (17 + 16 - 1))) => (0-u32max
 > 4294967296)'
Message-ID: <202302240127.ZC0QMtT3-lkp@intel.com>
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
TO: Hyeonggon Yoo <42.hyeyoo@gmail.com>
CC: Vlastimil Babka <vbabka@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a5c95ca18a98d742d0a4a04063c32556b5b66378
commit: d6a71648dbc0ca5520cba16a8fdce8d37ae74218 mm/slab: kmalloc: pass requests larger than order-1 page to page allocator
date:   6 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 6 months ago
config: ia64-randconfig-m041-20230222 (https://download.01.org/0day-ci/archive/20230224/202302240127.ZC0QMtT3-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302240127.ZC0QMtT3-lkp@intel.com/

New smatch warnings:
kernel/bpf/queue_stack_maps.c:59 queue_stack_map_alloc_check() warn: impossible condition '(attr->value_size > (1 << (17 + 16 - 1))) => (0-u32max > 4294967296)'
drivers/tty/vt/vt.c:1144 vc_allocate() warn: impossible condition '(vc->vc_screenbuf_size > (1 << (17 + 16 - 1))) => (0-u32max > 4294967296)'
drivers/tty/vt/vt.c:1242 vc_do_resize() warn: impossible condition '(new_screen_size > (1 << (17 + 16 - 1))) => (0-u32max > 4294967296)'

Old smatch warnings:
drivers/tty/vt/vt.c:1844 cursor_report() warn: format string contains unusual character '\x1b'
drivers/tty/vt/vt.c:1870 mouse_report() warn: format string contains unusual character '\x1b'

vim +59 kernel/bpf/queue_stack_maps.c

f1a2e44a3aeccb Mauricio Vasquez B 2018-10-18  45  
f1a2e44a3aeccb Mauricio Vasquez B 2018-10-18  46  /* Called from syscall */
f1a2e44a3aeccb Mauricio Vasquez B 2018-10-18  47  static int queue_stack_map_alloc_check(union bpf_attr *attr)
f1a2e44a3aeccb Mauricio Vasquez B 2018-10-18  48  {
2c78ee898d8f10 Alexei Starovoitov 2020-05-13  49  	if (!bpf_capable())
813961de3ee647 Alexei Starovoitov 2018-11-22  50  		return -EPERM;
813961de3ee647 Alexei Starovoitov 2018-11-22  51  
f1a2e44a3aeccb Mauricio Vasquez B 2018-10-18  52  	/* check sanity of attributes */
f1a2e44a3aeccb Mauricio Vasquez B 2018-10-18  53  	if (attr->max_entries == 0 || attr->key_size != 0 ||
813961de3ee647 Alexei Starovoitov 2018-11-22  54  	    attr->value_size == 0 ||
591fe9888d7809 Daniel Borkmann    2019-04-09  55  	    attr->map_flags & ~QUEUE_STACK_CREATE_FLAG_MASK ||
591fe9888d7809 Daniel Borkmann    2019-04-09  56  	    !bpf_map_flags_access_ok(attr->map_flags))
f1a2e44a3aeccb Mauricio Vasquez B 2018-10-18  57  		return -EINVAL;
f1a2e44a3aeccb Mauricio Vasquez B 2018-10-18  58  
f1a2e44a3aeccb Mauricio Vasquez B 2018-10-18 @59  	if (attr->value_size > KMALLOC_MAX_SIZE)
f1a2e44a3aeccb Mauricio Vasquez B 2018-10-18  60  		/* if value_size is bigger, the user space won't be able to
f1a2e44a3aeccb Mauricio Vasquez B 2018-10-18  61  		 * access the elements.
f1a2e44a3aeccb Mauricio Vasquez B 2018-10-18  62  		 */
f1a2e44a3aeccb Mauricio Vasquez B 2018-10-18  63  		return -E2BIG;
f1a2e44a3aeccb Mauricio Vasquez B 2018-10-18  64  
f1a2e44a3aeccb Mauricio Vasquez B 2018-10-18  65  	return 0;
f1a2e44a3aeccb Mauricio Vasquez B 2018-10-18  66  }
f1a2e44a3aeccb Mauricio Vasquez B 2018-10-18  67  

:::::: The code at line 59 was first introduced by commit
:::::: f1a2e44a3aeccb3ff18d3ccc0b0203e70b95bd92 bpf: add queue and stack maps

:::::: TO: Mauricio Vasquez B <mauricio.vasquez@polito.it>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
