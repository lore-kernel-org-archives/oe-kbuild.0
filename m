Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE53953AB
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Sep 2023 21:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694985107; x=1726521107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RW4ZDhMsrO1WDP0uLISYoQjg3F7fN3bqai2G/4vYIWk=;
  b=n/IxpkqO0LfIfGOZYIyW7+9ChqHADuVr7YxtG+svSvllSwaUGPsNcgol
   sv/BMqG2MK0yt6d2pFuh7VItEBLn8k9N442LVn0wd3nIoc/3b9Xoqon/9
   nwPPfgNdWF36n+cYq9/ct4lU5NxLJ2OVS19RnfL30u5CaIMPC0SWC3Syf
   6o+LoFSArNt37GxNQGdbgZ8fHb6FrXSykRdxKj8BohG1SAyXa6NoVOXWL
   WisNgLGR/6+6AZa4DWQscLsDBY5aph+3jpobjybq1mcl5DVVz7n7PuGye
   M0JzhK9z5a0FNqpoFvs0yllPp42oK60pObc38n6zzQr38uNEAOlmbwWRN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="376847826"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="376847826"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2023 14:11:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="919244488"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="919244488"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Sep 2023 14:11:45 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhz3P-0005TX-0z;
	Sun, 17 Sep 2023 21:11:43 +0000
Date: Mon, 18 Sep 2023 05:11:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ext4/page-io.c:121 ext4_finish_bio() error: 'folio' dereferencing
 possible ERR_PTR()
Message-ID: <202309180556.14SA5mG0-lkp@intel.com>
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
TO: Matthew Wilcox <willy@infradead.org>
CC: "Theodore Ts'o" <tytso@mit.edu>
CC: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0b0d403eabbe135d8dbb40ad5e41018947d336c
commit: bb64c08bff6a6edbd85786c92a2cb980ed99b29f ext4: Convert ext4_finish_bio() to use folios
date:   5 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-161-20230913 (https://download.01.org/0day-ci/archive/20230918/202309180556.14SA5mG0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230918/202309180556.14SA5mG0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309180556.14SA5mG0-lkp@intel.com/

New smatch warnings:
fs/ext4/page-io.c:121 ext4_finish_bio() error: 'folio' dereferencing possible ERR_PTR()

Old smatch warnings:
fs/ext4/page-io.c:123 ext4_finish_bio() error: 'folio' dereferencing possible ERR_PTR()

vim +/folio +121 fs/ext4/page-io.c

b0857d309faefa Jan Kara          2013-06-04   99  
b0857d309faefa Jan Kara          2013-06-04  100  static void ext4_finish_bio(struct bio *bio)
b0857d309faefa Jan Kara          2013-06-04  101  {
bb64c08bff6a6e Matthew Wilcox    2023-03-24  102  	struct folio_iter fi;
b0857d309faefa Jan Kara          2013-06-04  103  
bb64c08bff6a6e Matthew Wilcox    2023-03-24  104  	bio_for_each_folio_all(fi, bio) {
bb64c08bff6a6e Matthew Wilcox    2023-03-24  105  		struct folio *folio = fi.folio;
bb64c08bff6a6e Matthew Wilcox    2023-03-24  106  		struct folio *io_folio = NULL;
b0857d309faefa Jan Kara          2013-06-04  107  		struct buffer_head *bh, *head;
bb64c08bff6a6e Matthew Wilcox    2023-03-24  108  		size_t bio_start = fi.offset;
bb64c08bff6a6e Matthew Wilcox    2023-03-24  109  		size_t bio_end = bio_start + fi.length;
b0857d309faefa Jan Kara          2013-06-04  110  		unsigned under_io = 0;
b0857d309faefa Jan Kara          2013-06-04  111  		unsigned long flags;
b0857d309faefa Jan Kara          2013-06-04  112  
bb64c08bff6a6e Matthew Wilcox    2023-03-24  113  		if (fscrypt_is_bounce_folio(folio)) {
bb64c08bff6a6e Matthew Wilcox    2023-03-24  114  			io_folio = folio;
bb64c08bff6a6e Matthew Wilcox    2023-03-24  115  			folio = fscrypt_pagecache_folio(folio);
2058f83a728adf Michael Halcrow   2015-04-12  116  		}
2058f83a728adf Michael Halcrow   2015-04-12  117  
4e4cbee93d5613 Christoph Hellwig 2017-06-03  118  		if (bio->bi_status) {
bb64c08bff6a6e Matthew Wilcox    2023-03-24  119  			int err = blk_status_to_errno(bio->bi_status);
bb64c08bff6a6e Matthew Wilcox    2023-03-24  120  			folio_set_error(folio);
bb64c08bff6a6e Matthew Wilcox    2023-03-24 @121  			mapping_set_error(folio->mapping, err);
b0857d309faefa Jan Kara          2013-06-04  122  		}
bb64c08bff6a6e Matthew Wilcox    2023-03-24  123  		bh = head = folio_buffers(folio);
b0857d309faefa Jan Kara          2013-06-04  124  		/*
bb64c08bff6a6e Matthew Wilcox    2023-03-24  125  		 * We check all buffers in the folio under b_uptodate_lock
b0857d309faefa Jan Kara          2013-06-04  126  		 * to avoid races with other end io clearing async_write flags
b0857d309faefa Jan Kara          2013-06-04  127  		 */
f1e67e355c2aaf Thomas Gleixner   2019-11-18  128  		spin_lock_irqsave(&head->b_uptodate_lock, flags);
b0857d309faefa Jan Kara          2013-06-04  129  		do {
b0857d309faefa Jan Kara          2013-06-04  130  			if (bh_offset(bh) < bio_start ||
b0857d309faefa Jan Kara          2013-06-04  131  			    bh_offset(bh) + bh->b_size > bio_end) {
b0857d309faefa Jan Kara          2013-06-04  132  				if (buffer_async_write(bh))
b0857d309faefa Jan Kara          2013-06-04  133  					under_io++;
b0857d309faefa Jan Kara          2013-06-04  134  				continue;
b0857d309faefa Jan Kara          2013-06-04  135  			}
b0857d309faefa Jan Kara          2013-06-04  136  			clear_buffer_async_write(bh);
a2b0b205d125f2 Ye Bin            2022-03-21  137  			if (bio->bi_status) {
a2b0b205d125f2 Ye Bin            2022-03-21  138  				set_buffer_write_io_error(bh);
b0857d309faefa Jan Kara          2013-06-04  139  				buffer_io_error(bh);
a2b0b205d125f2 Ye Bin            2022-03-21  140  			}
b0857d309faefa Jan Kara          2013-06-04  141  		} while ((bh = bh->b_this_page) != head);
f1e67e355c2aaf Thomas Gleixner   2019-11-18  142  		spin_unlock_irqrestore(&head->b_uptodate_lock, flags);
2058f83a728adf Michael Halcrow   2015-04-12  143  		if (!under_io) {
bb64c08bff6a6e Matthew Wilcox    2023-03-24  144  			fscrypt_free_bounce_page(&io_folio->page);
bb64c08bff6a6e Matthew Wilcox    2023-03-24  145  			folio_end_writeback(folio);
b0857d309faefa Jan Kara          2013-06-04  146  		}
b0857d309faefa Jan Kara          2013-06-04  147  	}
2058f83a728adf Michael Halcrow   2015-04-12  148  }
b0857d309faefa Jan Kara          2013-06-04  149  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
