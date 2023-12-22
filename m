Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964A4241F6
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Dec 2023 17:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IsTrOzfa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703265256; x=1734801256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5LlVBfeV42dDffvrGF4B2xemQJGft2P8IJSaGS9BkRI=;
  b=IsTrOzfazLTYFz1cFMr6AYahOwT/5rdrdtrtAA4UdO5RB+fOSO8R6FBr
   ZcgVPK5NFczP4gifH6GK7zDVKLTs3iJvoXlaqZe4HjSiMrynTmd82+R8N
   bRbDGr8kn5Fvnc+9TJ296w5stxqlMp9Mmpos+AxmKENGCTg4kFOdtgNVP
   Ga3jFecatcidbvKjd0qUam8yx/eynyWz4RHXnsm31/RLcOxUeak+UoYdY
   JNXtW7jxRRQ4gWu5QIr/g1yPH+a5Wmmw7byxB/ntkWO5qcsQkw2JVvj5L
   PafFA5udQkvIYOZoJOjlFqQhQ3tPhEL9wfnYWe8YLD2NuvyFo2dWJuJW0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="393301425"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="393301425"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 09:14:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="726831186"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="726831186"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 22 Dec 2023 09:14:13 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGj6A-0009gR-2c;
	Fri, 22 Dec 2023 17:14:10 +0000
Date: Sat, 23 Dec 2023 01:13:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 5681/10295]
 fs/smb/client/file.c:2744:(.text+0x95ae): relocation truncated to fit:
 R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
Message-ID: <202312230101.JruNQ1SW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "csky general problem: relocation truncated to fit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: a9540e35624d1475f47dbf6353eed8b99936d36e [5681/10295] smb: do not test the return value of folio_start_writeback()
:::::: branch date: 12 hours ago
:::::: commit date: 12 days ago
config: csky-randconfig-r023-20220124 (https://download.01.org/0day-ci/archive/20231223/202312230101.JruNQ1SW-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231223/202312230101.JruNQ1SW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312230101.JruNQ1SW-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/smb/client/file.o: in function `cifs_write_back_from_locked_folio':
>> fs/smb/client/file.c:2744:(.text+0x95ae): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/smb/client/file.c:2749:(.text+0x95ea): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/smb/client/file.c:2750:(.text+0x95fc): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/smb/client/file.c:2750:(.text+0x9606): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/smb/client/file.c:2752:(.text+0x9616): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/smb/client/file.c:591:(.text+0x964c): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/smb/client/file.c:2844:(.text+0x9656): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/smb/client/file.c:2851:(.text+0x967e): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/smb/client/file.o: in function `cifs_write_back_from_locked_folio':
>> include/linux/pagemap.h:231:(.text+0x968c): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   include/linux/pagemap.h:235:(.text+0x96a4): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/smb/client/file.o: in function `cifs_write_back_from_locked_folio':
   fs/smb/client/file.c:2763:(.text+0x96d6): additional relocation overflows omitted from the output


vim +2744 fs/smb/client/file.c

bff9018d3a52c4 fs/cifs/file.c       Christoph Hellwig       2022-11-16  2721  
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2722  /*
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2723   * Write back the locked page and any subsequent non-locked dirty pages.
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2724   */
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2725  static ssize_t cifs_write_back_from_locked_folio(struct address_space *mapping,
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2726  						 struct writeback_control *wbc,
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2727  						 struct folio *folio,
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2728  						 loff_t start, loff_t end)
7e48ff82026d99 fs/cifs/file.c       Pavel Shilovsky         2014-06-19  2729  {
c7d38dbe7d3851 fs/cifs/file.c       Pavel Shilovsky         2019-01-25  2730  	struct inode *inode = mapping->host;
cb7e9eabb2b584 fs/cifs/file.c       Pavel Shilovsky         2014-06-05  2731  	struct TCP_Server_Info *server;
7e48ff82026d99 fs/cifs/file.c       Pavel Shilovsky         2014-06-19  2732  	struct cifs_writedata *wdata;
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2733  	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2734  	struct cifs_credits credits_on_stack;
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2735  	struct cifs_credits *credits = &credits_on_stack;
c7d38dbe7d3851 fs/cifs/file.c       Pavel Shilovsky         2019-01-25  2736  	struct cifsFileInfo *cfile = NULL;
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2737  	unsigned int xid, wsize, len;
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2738  	loff_t i_size = i_size_read(inode);
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2739  	size_t max_len;
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2740  	long count = wbc->nr_to_write;
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2741  	int rc;
7e48ff82026d99 fs/cifs/file.c       Pavel Shilovsky         2014-06-19  2742  
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2743  	/* The folio should be locked, dirty and not undergoing writeback. */
a9540e35624d14 fs/smb/client/file.c Matthew Wilcox (Oracle  2023-11-08 @2744) 	folio_start_writeback(folio);
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2745  
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2746  	count -= folio_nr_pages(folio);
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2747  	len = folio_size(folio);
7e48ff82026d99 fs/cifs/file.c       Pavel Shilovsky         2014-06-19  2748  
0cb012d1a0a9ea fs/cifs/file.c       Steve French            2018-10-11  2749  	xid = get_xid();
352d96f3acc6e0 fs/cifs/file.c       Aurelien Aptel          2020-05-31  2750  	server = cifs_pick_channel(cifs_sb_master_tcon(cifs_sb)->ses);
352d96f3acc6e0 fs/cifs/file.c       Aurelien Aptel          2020-05-31  2751  
86f740f2aed5ea fs/cifs/file.c       Aurelien Aptel          2020-02-21  2752  	rc = cifs_get_writable_file(CIFS_I(inode), FIND_WR_ANY, &cfile);
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2753  	if (rc) {
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2754  		cifs_dbg(VFS, "No writable handle in writepages rc=%d\n", rc);
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2755  		goto err_xid;
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2756  	}
c7d38dbe7d3851 fs/cifs/file.c       Pavel Shilovsky         2019-01-25  2757  
522aa3b5753225 fs/cifs/file.c       Ronnie Sahlberg         2020-12-14  2758  	rc = server->ops->wait_mtu_credits(server, cifs_sb->ctx->wsize,
335b7b62ffb69d fs/cifs/file.c       Pavel Shilovsky         2019-01-16  2759  					   &wsize, credits);
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2760  	if (rc != 0)
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2761  		goto err_close;
7e48ff82026d99 fs/cifs/file.c       Pavel Shilovsky         2014-06-19  2762  
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2763  	wdata = cifs_writedata_alloc(cifs_writev_complete);
7e48ff82026d99 fs/cifs/file.c       Pavel Shilovsky         2014-06-19  2764  	if (!wdata) {
7e48ff82026d99 fs/cifs/file.c       Pavel Shilovsky         2014-06-19  2765  		rc = -ENOMEM;
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2766  		goto err_uncredit;
37c0eb4677f733 fs/cifs/file.c       Steve French            2005-10-05  2767  	}
c3d17b63e5eafc fs/cifs/file.c       Jeff Layton             2011-05-19  2768  
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2769  	wdata->sync_mode = wbc->sync_mode;
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2770  	wdata->offset = folio_pos(folio);
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2771  	wdata->pid = cfile->pid;
335b7b62ffb69d fs/cifs/file.c       Pavel Shilovsky         2019-01-16  2772  	wdata->credits = credits_on_stack;
c7d38dbe7d3851 fs/cifs/file.c       Pavel Shilovsky         2019-01-25  2773  	wdata->cfile = cfile;
352d96f3acc6e0 fs/cifs/file.c       Aurelien Aptel          2020-05-31  2774  	wdata->server = server;
c7d38dbe7d3851 fs/cifs/file.c       Pavel Shilovsky         2019-01-25  2775  	cfile = NULL;
cb7e9eabb2b584 fs/cifs/file.c       Pavel Shilovsky         2014-06-05  2776  
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2777  	/* Find all consecutive lockable dirty pages, stopping when we find a
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2778  	 * page that is not immediately lockable, is not dirty or is missing,
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2779  	 * or we reach the end of the range.
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2780  	 */
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2781  	if (start < i_size) {
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2782  		/* Trim the write to the EOF; the extra data is ignored.  Also
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2783  		 * put an upper limit on the size of a single storedata op.
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2784  		 */
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2785  		max_len = wsize;
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2786  		max_len = min_t(unsigned long long, max_len, end - start + 1);
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2787  		max_len = min_t(unsigned long long, max_len, i_size - start);
941b853d779de3 fs/cifs/file.c       Jeff Layton             2011-01-11  2788  
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2789  		if (len < max_len) {
d08089f649a0cf fs/cifs/file.c       David Howells           2022-01-24  2790  			int max_pages = INT_MAX;
258f0603beb869 fs/cifs/file.c       Pavel Shilovsky         2019-01-28  2791  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
