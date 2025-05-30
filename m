Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C62321884A
	for <oe-kbuild@lists.linux.dev>; Fri, 30 May 2025 23:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748646731; cv=none; b=W6zK0XLn2KWSCrWk/LCoT7z1mj4AxaCSqU1j3v/3n2TbAyRzhhYciVCzGhV/lOfS536fnk9NMi4G0aUGLv0/3gsw+PUVEXcvs4nKXy/ZGcvCHJkIdebCarq00dBifktgPHVHBlJ2j3FgMsdGMhmpMBfk7xygfMENFTe+Dmu9xHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748646731; c=relaxed/simple;
	bh=YFPKZkKbVGk7eS/UK3O3BQvZQkWWsh3112xtJ6ja97w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VAFUHubkxDUIoVQ0Xk77TNsaPfVX2beO/8TBckYh3ruQagMDKS9q+uPGRC0KQe64snClMX1W+1CzdET3rORwB+5iXas1KA+FwQbWJo4aYGqK7ZgU8oLor68aitlzT3SWaqwhOfIAoqRhERykym35nonWPn4yjEG3ki4fzcSjdhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nlt3AgZx; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nlt3AgZx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748646729; x=1780182729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YFPKZkKbVGk7eS/UK3O3BQvZQkWWsh3112xtJ6ja97w=;
  b=nlt3AgZx7l+Vg9LGPcoPdqfXOfWQSeANPLq8uN7lPNea3Ciu8UXNd3mC
   Q8CbJdOjE38duydvlGDga+dZ/UDfaa6ptoDds5tox+v09Ewu3BO2n/JvQ
   0j9jsNtH8h+n90As72xVwuQrpZ5wie3hVMtiTZsyFXWEAPledbbS3Zush
   LoCjEdkZ9iFSJL2m5x5Byuv09g46AHSem5wt+pwcckMxk18R9WRI1gD0C
   mK39b1d/h5ARY5MCyrz8dUG9+zJRxdcNy07s8N1SKlmzTgiOjokQfxnrY
   XsGNgduOv0Jm3AHLCqYLs2eAtOcmDLbwf0a7dAex1IzHFdSRTLPBDk2Qe
   Q==;
X-CSE-ConnectionGUID: DYHyvqabSQiVlixvK6Yu4Q==
X-CSE-MsgGUID: xO1uCKPmTfyheGOsoQ1baw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50666487"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="50666487"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 16:12:08 -0700
X-CSE-ConnectionGUID: p2C48rtaThWH6838lBqHgA==
X-CSE-MsgGUID: aV2w7IcUR7yEShO7SvBq7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="149151166"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 May 2025 16:12:07 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uL8tR-000Y2O-01;
	Fri, 30 May 2025 23:12:05 +0000
Date: Sat, 31 May 2025 07:11:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 05/13] writeback: modify bdi_writeback search logic to
 search across all wb ctxs
Message-ID: <202505310702.ht0DA5vz-lkp@intel.com>
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
In-Reply-To: <20250529111504.89912-6-kundan.kumar@samsung.com>
References: <20250529111504.89912-6-kundan.kumar@samsung.com>
TO: Kundan Kumar <kundan.kumar@samsung.com>
TO: jaegeuk@kernel.org
TO: chao@kernel.org
TO: viro@zeniv.linux.org.uk
TO: brauner@kernel.org
TO: jack@suse.cz
TO: miklos@szeredi.hu
TO: agruenba@redhat.com
TO: trondmy@kernel.org
TO: anna@kernel.org
TO: akpm@linux-foundation.org
TO: willy@infradead.org
TO: mcgrof@kernel.org
TO: clm@meta.com
TO: david@fromorbit.com
TO: amir73il@gmail.com
TO: axboe@kernel.dk
TO: hch@lst.de
TO: ritesh.list@gmail.com
TO: djwong@kernel.org
TO: dave@stgolabs.net
TO: p.raghav@samsung.com
TO: da.gomez@samsung.com
CC: linux-f2fs-devel@lists.sourceforge.net
CC: linux-fsdevel@vger.kernel.org
CC: gfs2@lists.linux.dev
CC: linux-nfs@vger.kernel.org
CC: linux-mm@kvack.org
CC: gost.dev@samsung.com
CC: Kundan Kumar <kundan.kumar@samsung.com>
CC: Anuj Gupta <anuj20.g@samsung.com>

Hi Kundan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on akpm-mm/mm-everything jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev linus/master v6.15]
[cannot apply to next-20250530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kundan-Kumar/writeback-add-infra-for-parallel-writeback/20250529-193523
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20250529111504.89912-6-kundan.kumar%40samsung.com
patch subject: [PATCH 05/13] writeback: modify bdi_writeback search logic to search across all wb ctxs
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250530 (https://download.01.org/0day-ci/archive/20250531/202505310702.ht0DA5vz-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505310702.ht0DA5vz-lkp@intel.com/

smatch warnings:
fs/fs-writeback.c:1123 cgroup_writeback_by_id() error: uninitialized symbol 'wb'.

vim +/wb +1123 fs/fs-writeback.c

db125360409fc3 Tejun Heo    2015-05-22  1077  
d62241c7a406f0 Tejun Heo    2019-08-26  1078  /**
d62241c7a406f0 Tejun Heo    2019-08-26  1079   * cgroup_writeback_by_id - initiate cgroup writeback from bdi and memcg IDs
d62241c7a406f0 Tejun Heo    2019-08-26  1080   * @bdi_id: target bdi id
d62241c7a406f0 Tejun Heo    2019-08-26  1081   * @memcg_id: target memcg css id
d62241c7a406f0 Tejun Heo    2019-08-26  1082   * @reason: reason why some writeback work initiated
d62241c7a406f0 Tejun Heo    2019-08-26  1083   * @done: target wb_completion
d62241c7a406f0 Tejun Heo    2019-08-26  1084   *
d62241c7a406f0 Tejun Heo    2019-08-26  1085   * Initiate flush of the bdi_writeback identified by @bdi_id and @memcg_id
d62241c7a406f0 Tejun Heo    2019-08-26  1086   * with the specified parameters.
d62241c7a406f0 Tejun Heo    2019-08-26  1087   */
7490a2d248145d Shakeel Butt 2021-09-02  1088  int cgroup_writeback_by_id(u64 bdi_id, int memcg_id,
d62241c7a406f0 Tejun Heo    2019-08-26  1089  			   enum wb_reason reason, struct wb_completion *done)
d62241c7a406f0 Tejun Heo    2019-08-26  1090  {
d62241c7a406f0 Tejun Heo    2019-08-26  1091  	struct backing_dev_info *bdi;
d62241c7a406f0 Tejun Heo    2019-08-26  1092  	struct cgroup_subsys_state *memcg_css;
d62241c7a406f0 Tejun Heo    2019-08-26  1093  	struct bdi_writeback *wb;
d7f05e7d7de030 Kundan Kumar 2025-05-29  1094  	struct bdi_writeback_ctx *bdi_wb_ctx;
d62241c7a406f0 Tejun Heo    2019-08-26  1095  	struct wb_writeback_work *work;
7490a2d248145d Shakeel Butt 2021-09-02  1096  	unsigned long dirty;
d62241c7a406f0 Tejun Heo    2019-08-26  1097  	int ret;
d62241c7a406f0 Tejun Heo    2019-08-26  1098  
d62241c7a406f0 Tejun Heo    2019-08-26  1099  	/* lookup bdi and memcg */
d62241c7a406f0 Tejun Heo    2019-08-26  1100  	bdi = bdi_get_by_id(bdi_id);
d62241c7a406f0 Tejun Heo    2019-08-26  1101  	if (!bdi)
d62241c7a406f0 Tejun Heo    2019-08-26  1102  		return -ENOENT;
d62241c7a406f0 Tejun Heo    2019-08-26  1103  
d62241c7a406f0 Tejun Heo    2019-08-26  1104  	rcu_read_lock();
d62241c7a406f0 Tejun Heo    2019-08-26  1105  	memcg_css = css_from_id(memcg_id, &memory_cgrp_subsys);
d62241c7a406f0 Tejun Heo    2019-08-26  1106  	if (memcg_css && !css_tryget(memcg_css))
d62241c7a406f0 Tejun Heo    2019-08-26  1107  		memcg_css = NULL;
d62241c7a406f0 Tejun Heo    2019-08-26  1108  	rcu_read_unlock();
d62241c7a406f0 Tejun Heo    2019-08-26  1109  	if (!memcg_css) {
d62241c7a406f0 Tejun Heo    2019-08-26  1110  		ret = -ENOENT;
d62241c7a406f0 Tejun Heo    2019-08-26  1111  		goto out_bdi_put;
d62241c7a406f0 Tejun Heo    2019-08-26  1112  	}
d62241c7a406f0 Tejun Heo    2019-08-26  1113  
d62241c7a406f0 Tejun Heo    2019-08-26  1114  	/*
d62241c7a406f0 Tejun Heo    2019-08-26  1115  	 * And find the associated wb.  If the wb isn't there already
d62241c7a406f0 Tejun Heo    2019-08-26  1116  	 * there's nothing to flush, don't create one.
d62241c7a406f0 Tejun Heo    2019-08-26  1117  	 */
d7f05e7d7de030 Kundan Kumar 2025-05-29  1118  	for_each_bdi_wb_ctx(bdi, bdi_wb_ctx) {
d7f05e7d7de030 Kundan Kumar 2025-05-29  1119  		wb = wb_get_lookup(bdi_wb_ctx, memcg_css);
d7f05e7d7de030 Kundan Kumar 2025-05-29  1120  		if (wb)
d7f05e7d7de030 Kundan Kumar 2025-05-29  1121  			break;
d7f05e7d7de030 Kundan Kumar 2025-05-29  1122  	}
d62241c7a406f0 Tejun Heo    2019-08-26 @1123  	if (!wb) {
d62241c7a406f0 Tejun Heo    2019-08-26  1124  		ret = -ENOENT;
d62241c7a406f0 Tejun Heo    2019-08-26  1125  		goto out_css_put;
d62241c7a406f0 Tejun Heo    2019-08-26  1126  	}
d62241c7a406f0 Tejun Heo    2019-08-26  1127  
d62241c7a406f0 Tejun Heo    2019-08-26  1128  	/*
7490a2d248145d Shakeel Butt 2021-09-02  1129  	 * The caller is attempting to write out most of
d62241c7a406f0 Tejun Heo    2019-08-26  1130  	 * the currently dirty pages.  Let's take the current dirty page
d62241c7a406f0 Tejun Heo    2019-08-26  1131  	 * count and inflate it by 25% which should be large enough to
d62241c7a406f0 Tejun Heo    2019-08-26  1132  	 * flush out most dirty pages while avoiding getting livelocked by
d62241c7a406f0 Tejun Heo    2019-08-26  1133  	 * concurrent dirtiers.
7490a2d248145d Shakeel Butt 2021-09-02  1134  	 *
7490a2d248145d Shakeel Butt 2021-09-02  1135  	 * BTW the memcg stats are flushed periodically and this is best-effort
7490a2d248145d Shakeel Butt 2021-09-02  1136  	 * estimation, so some potential error is ok.
d62241c7a406f0 Tejun Heo    2019-08-26  1137  	 */
7490a2d248145d Shakeel Butt 2021-09-02  1138  	dirty = memcg_page_state(mem_cgroup_from_css(memcg_css), NR_FILE_DIRTY);
7490a2d248145d Shakeel Butt 2021-09-02  1139  	dirty = dirty * 10 / 8;
d62241c7a406f0 Tejun Heo    2019-08-26  1140  
d62241c7a406f0 Tejun Heo    2019-08-26  1141  	/* issue the writeback work */
d62241c7a406f0 Tejun Heo    2019-08-26  1142  	work = kzalloc(sizeof(*work), GFP_NOWAIT | __GFP_NOWARN);
d62241c7a406f0 Tejun Heo    2019-08-26  1143  	if (work) {
7490a2d248145d Shakeel Butt 2021-09-02  1144  		work->nr_pages = dirty;
d62241c7a406f0 Tejun Heo    2019-08-26  1145  		work->sync_mode = WB_SYNC_NONE;
d62241c7a406f0 Tejun Heo    2019-08-26  1146  		work->range_cyclic = 1;
d62241c7a406f0 Tejun Heo    2019-08-26  1147  		work->reason = reason;
d62241c7a406f0 Tejun Heo    2019-08-26  1148  		work->done = done;
d62241c7a406f0 Tejun Heo    2019-08-26  1149  		work->auto_free = 1;
d62241c7a406f0 Tejun Heo    2019-08-26  1150  		wb_queue_work(wb, work);
d62241c7a406f0 Tejun Heo    2019-08-26  1151  		ret = 0;
d62241c7a406f0 Tejun Heo    2019-08-26  1152  	} else {
d62241c7a406f0 Tejun Heo    2019-08-26  1153  		ret = -ENOMEM;
d62241c7a406f0 Tejun Heo    2019-08-26  1154  	}
d62241c7a406f0 Tejun Heo    2019-08-26  1155  
d62241c7a406f0 Tejun Heo    2019-08-26  1156  	wb_put(wb);
d62241c7a406f0 Tejun Heo    2019-08-26  1157  out_css_put:
d62241c7a406f0 Tejun Heo    2019-08-26  1158  	css_put(memcg_css);
d62241c7a406f0 Tejun Heo    2019-08-26  1159  out_bdi_put:
d62241c7a406f0 Tejun Heo    2019-08-26  1160  	bdi_put(bdi);
d62241c7a406f0 Tejun Heo    2019-08-26  1161  	return ret;
d62241c7a406f0 Tejun Heo    2019-08-26  1162  }
d62241c7a406f0 Tejun Heo    2019-08-26  1163  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
