Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F90245C14
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Apr 2025 14:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743864755; cv=none; b=FJ2Ue+EHjUw2zjqG3ZmRiIUX9y21mHd+BoojI5JVhiWZnKcedEiCXZt80iJXhUeJpVUfPFkhWEtDTuEx9huVK5te55UYDh9CeEmt8ylp7kSiy9Tyc6b0ywLGpE6cE7SgBDTNiDUFUb8q02apkyZfahpyWdrEPhpaCsgEUuhmw4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743864755; c=relaxed/simple;
	bh=mP7C340ATEECOoN4+LP5hgPqJNjDfBb3UVb/6nIHoVc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KNwBbxHck9H2o8TFwN4rTM2noT9UITEI4YyNTg526+pB/vs+3+JZBWLKT7DaOWdbdwGcMG4RkcQ6ywmdtlOKUPK86CpfW6qPGgpT3HzkpvvnkdEnTAQFeZIOAiCvOpFaew0o73MUmWe0bPTNJHDzY6jOtsU1IT5MP56snBcYljg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hwYSDpmY; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hwYSDpmY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743864752; x=1775400752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mP7C340ATEECOoN4+LP5hgPqJNjDfBb3UVb/6nIHoVc=;
  b=hwYSDpmYWP7lS0M4WSIa5VtiB9NOa2K5ndilo4JthnuIoCXH1gdnhrht
   0iIEJU2hvTae2CnB3Wbtua3Lt6Urpr6iUYifXeoEDYIm2K72w9IKmL317
   fz6FMJMfBSRdeErydLPZDavBgOsQzUycNCmTRROrklGH1tZaZUhCRlUhE
   VRHya1Q8Pbs8L1whPsrv2RJjnp0WaOvZ8p+M8wg50uKrSFjgxOF2DBN2V
   MQ4KQiGBYpMqTzn38h/wIn0YaMexhLnYRk5R2tpkvST2kN1kGtL5sKz6H
   Q+1YLCfEZzkwrhPy1Y/MafRr9z67szlzFJ5scXlnCyXT4m52j6QjCEHm0
   g==;
X-CSE-ConnectionGUID: QwO1B8mvTrK/zlUhYS8y2A==
X-CSE-MsgGUID: 2Cx/OJNDTUOasXa1X491Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="45385977"
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="45385977"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 07:52:31 -0700
X-CSE-ConnectionGUID: Q0iO2VaASgWTeWmbCQAuhA==
X-CSE-MsgGUID: roF8M1IISY+NDAuRYxOR/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="132525416"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Apr 2025 07:52:29 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u14sk-000267-2W;
	Sat, 05 Apr 2025 14:52:26 +0000
Date: Sat, 5 Apr 2025 22:52:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12 18/18] mm/compaction.c:
 trace/hooks/mm.h is included more than once.
Message-ID: <202504052200.MTR1ZHpT-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   2419132b8c991ece73c5a50f6f5c3eacab6077ef
commit: 1333f31c555a3aa379fb2c0e521cd24665117cd1 [18/18] ANDROID: mm: vh for compaction begin/end
:::::: branch date: 16 hours ago
:::::: commit date: 12 days ago
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504052200.MTR1ZHpT-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> mm/compaction.c: trace/hooks/mm.h is included more than once.

vim +70 mm/compaction.c

    67	
    68	#include <trace/hooks/vmscan.h>
    69	#include <trace/hooks/compaction.h>
  > 70	#include <trace/hooks/mm.h>
    71	
    72	#define block_start_pfn(pfn, order)	round_down(pfn, 1UL << (order))
    73	#define block_end_pfn(pfn, order)	ALIGN((pfn) + 1, 1UL << (order))
    74	
    75	/*
    76	 * Page order with-respect-to which proactive compaction
    77	 * calculates external fragmentation, which is used as
    78	 * the "fragmentation score" of a node/zone.
    79	 */
    80	#if defined CONFIG_TRANSPARENT_HUGEPAGE
    81	#define COMPACTION_HPAGE_ORDER	HPAGE_PMD_ORDER
    82	#elif defined CONFIG_HUGETLBFS
    83	#define COMPACTION_HPAGE_ORDER	HUGETLB_PAGE_ORDER
    84	#else
    85	#define COMPACTION_HPAGE_ORDER	(PMD_SHIFT - PAGE_SHIFT)
    86	#endif
    87	
    88	static struct page *mark_allocated_noprof(struct page *page, unsigned int order, gfp_t gfp_flags)
    89	{
    90		post_alloc_hook(page, order, __GFP_MOVABLE);
    91		return page;
    92	}
    93	#define mark_allocated(...)	alloc_hooks(mark_allocated_noprof(__VA_ARGS__))
    94	
    95	static unsigned long release_free_list(struct list_head *freepages)
    96	{
    97		int order;
    98		unsigned long high_pfn = 0;
    99	
   100		for (order = 0; order < NR_PAGE_ORDERS; order++) {
   101			struct page *page, *next;
   102	
   103			list_for_each_entry_safe(page, next, &freepages[order], lru) {
   104				unsigned long pfn = page_to_pfn(page);
   105	
   106				list_del(&page->lru);
   107				/*
   108				 * Convert free pages into post allocation pages, so
   109				 * that we can free them via __free_page.
   110				 */
   111				mark_allocated(page, order, __GFP_MOVABLE);
   112				__free_pages(page, order);
   113				if (pfn > high_pfn)
   114					high_pfn = pfn;
   115			}
   116		}
   117		return high_pfn;
   118	}
   119	
   120	#ifdef CONFIG_COMPACTION
   121	bool PageMovable(struct page *page)
   122	{
   123		const struct movable_operations *mops;
   124	
   125		VM_BUG_ON_PAGE(!PageLocked(page), page);
   126		if (!__PageMovable(page))
   127			return false;
   128	
   129		mops = page_movable_ops(page);
   130		if (mops)
   131			return true;
   132	
   133		return false;
   134	}
   135	
   136	void __SetPageMovable(struct page *page, const struct movable_operations *mops)
   137	{
   138		VM_BUG_ON_PAGE(!PageLocked(page), page);
   139		VM_BUG_ON_PAGE((unsigned long)mops & PAGE_MAPPING_MOVABLE, page);
   140		page->mapping = (void *)((unsigned long)mops | PAGE_MAPPING_MOVABLE);
   141	}
   142	EXPORT_SYMBOL(__SetPageMovable);
   143	
   144	void __ClearPageMovable(struct page *page)
   145	{
   146		VM_BUG_ON_PAGE(!PageMovable(page), page);
   147		/*
   148		 * This page still has the type of a movable page, but it's
   149		 * actually not movable any more.
   150		 */
   151		page->mapping = (void *)PAGE_MAPPING_MOVABLE;
   152	}
   153	EXPORT_SYMBOL(__ClearPageMovable);
   154	
   155	/* Do not skip compaction more than 64 times */
   156	#define COMPACT_MAX_DEFER_SHIFT 6
   157	
   158	/*
   159	 * Compaction is deferred when compaction fails to result in a page
   160	 * allocation success. 1 << compact_defer_shift, compactions are skipped up
   161	 * to a limit of 1 << COMPACT_MAX_DEFER_SHIFT
   162	 */
   163	static void defer_compaction(struct zone *zone, int order)
   164	{
   165		zone->compact_considered = 0;
   166		zone->compact_defer_shift++;
   167	
   168		if (order < zone->compact_order_failed)
   169			zone->compact_order_failed = order;
   170	
   171		if (zone->compact_defer_shift > COMPACT_MAX_DEFER_SHIFT)
   172			zone->compact_defer_shift = COMPACT_MAX_DEFER_SHIFT;
   173	
   174		trace_mm_compaction_defer_compaction(zone, order);
   175	}
   176	
   177	/* Returns true if compaction should be skipped this time */
   178	static bool compaction_deferred(struct zone *zone, int order)
   179	{
   180		unsigned long defer_limit = 1UL << zone->compact_defer_shift;
   181	
   182		if (order < zone->compact_order_failed)
   183			return false;
   184	
   185		/* Avoid possible overflow */
   186		if (++zone->compact_considered >= defer_limit) {
   187			zone->compact_considered = defer_limit;
   188			return false;
   189		}
   190	
   191		trace_mm_compaction_deferred(zone, order);
   192	
   193		return true;
   194	}
   195	
   196	/*
   197	 * Update defer tracking counters after successful compaction of given order,
   198	 * which means an allocation either succeeded (alloc_success == true) or is
   199	 * expected to succeed.
   200	 */
   201	void compaction_defer_reset(struct zone *zone, int order,
   202			bool alloc_success)
   203	{
   204		if (alloc_success) {
   205			zone->compact_considered = 0;
   206			zone->compact_defer_shift = 0;
   207		}
   208		if (order >= zone->compact_order_failed)
   209			zone->compact_order_failed = order + 1;
   210	
   211		trace_mm_compaction_defer_reset(zone, order);
   212	}
   213	
   214	/* Returns true if restarting compaction after many failures */
   215	static bool compaction_restarting(struct zone *zone, int order)
   216	{
   217		if (order < zone->compact_order_failed)
   218			return false;
   219	
   220		return zone->compact_defer_shift == COMPACT_MAX_DEFER_SHIFT &&
   221			zone->compact_considered >= 1UL << zone->compact_defer_shift;
   222	}
   223	
   224	/* Returns true if the pageblock should be scanned for pages to isolate. */
   225	static inline bool isolation_suitable(struct compact_control *cc,
   226						struct page *page)
   227	{
   228		if (cc->ignore_skip_hint)
   229			return true;
   230	
   231		return !get_pageblock_skip(page);
   232	}
   233	
   234	static void reset_cached_positions(struct zone *zone)
   235	{
   236		zone->compact_cached_migrate_pfn[0] = zone->zone_start_pfn;
   237		zone->compact_cached_migrate_pfn[1] = zone->zone_start_pfn;
   238		zone->compact_cached_free_pfn =
   239					pageblock_start_pfn(zone_end_pfn(zone) - 1);
   240	}
   241	
   242	#ifdef CONFIG_SPARSEMEM
   243	/*
   244	 * If the PFN falls into an offline section, return the start PFN of the
   245	 * next online section. If the PFN falls into an online section or if
   246	 * there is no next online section, return 0.
   247	 */
   248	static unsigned long skip_offline_sections(unsigned long start_pfn)
   249	{
   250		unsigned long start_nr = pfn_to_section_nr(start_pfn);
   251	
   252		if (online_section_nr(start_nr))
   253			return 0;
   254	
   255		while (++start_nr <= __highest_present_section_nr) {
   256			if (online_section_nr(start_nr))
   257				return section_nr_to_pfn(start_nr);
   258		}
   259	
   260		return 0;
   261	}
   262	
   263	/*
   264	 * If the PFN falls into an offline section, return the end PFN of the
   265	 * next online section in reverse. If the PFN falls into an online section
   266	 * or if there is no next online section in reverse, return 0.
   267	 */
   268	static unsigned long skip_offline_sections_reverse(unsigned long start_pfn)
   269	{
   270		unsigned long start_nr = pfn_to_section_nr(start_pfn);
   271	
   272		if (!start_nr || online_section_nr(start_nr))
   273			return 0;
   274	
   275		while (start_nr-- > 0) {
   276			if (online_section_nr(start_nr))
   277				return section_nr_to_pfn(start_nr) + PAGES_PER_SECTION;
   278		}
   279	
   280		return 0;
   281	}
   282	#else
   283	static unsigned long skip_offline_sections(unsigned long start_pfn)
   284	{
   285		return 0;
   286	}
   287	
   288	static unsigned long skip_offline_sections_reverse(unsigned long start_pfn)
   289	{
   290		return 0;
   291	}
   292	#endif
   293	
   294	/*
   295	 * Compound pages of >= pageblock_order should consistently be skipped until
   296	 * released. It is always pointless to compact pages of such order (if they are
   297	 * migratable), and the pageblocks they occupy cannot contain any free pages.
   298	 */
   299	static bool pageblock_skip_persistent(struct page *page)
   300	{
   301		if (!PageCompound(page))
   302			return false;
   303	
   304		page = compound_head(page);
   305	
   306		if (compound_order(page) >= pageblock_order)
   307			return true;
   308	
   309		return false;
   310	}
   311	
   312	static bool
   313	__reset_isolation_pfn(struct zone *zone, unsigned long pfn, bool check_source,
   314								bool check_target)
   315	{
   316		struct page *page = pfn_to_online_page(pfn);
   317		struct page *block_page;
   318		struct page *end_page;
   319		unsigned long block_pfn;
   320	
   321		if (!page)
   322			return false;
   323		if (zone != page_zone(page))
   324			return false;
   325		if (pageblock_skip_persistent(page))
   326			return false;
   327	
   328		/*
   329		 * If skip is already cleared do no further checking once the
   330		 * restart points have been set.
   331		 */
   332		if (check_source && check_target && !get_pageblock_skip(page))
   333			return true;
   334	
   335		/*
   336		 * If clearing skip for the target scanner, do not select a
   337		 * non-movable pageblock as the starting point.
   338		 */
   339		if (!check_source && check_target &&
   340		    get_pageblock_migratetype(page) != MIGRATE_MOVABLE)
   341			return false;
   342	
   343		/* Ensure the start of the pageblock or zone is online and valid */
   344		block_pfn = pageblock_start_pfn(pfn);
   345		block_pfn = max(block_pfn, zone->zone_start_pfn);
   346		block_page = pfn_to_online_page(block_pfn);
   347		if (block_page) {
   348			page = block_page;
   349			pfn = block_pfn;
   350		}
   351	
   352		/* Ensure the end of the pageblock or zone is online and valid */
   353		block_pfn = pageblock_end_pfn(pfn) - 1;
   354		block_pfn = min(block_pfn, zone_end_pfn(zone) - 1);
   355		end_page = pfn_to_online_page(block_pfn);
   356		if (!end_page)
   357			return false;
   358	
   359		/*
   360		 * Only clear the hint if a sample indicates there is either a
   361		 * free page or an LRU page in the block. One or other condition
   362		 * is necessary for the block to be a migration source/target.
   363		 */
   364		do {
   365			if (check_source && PageLRU(page)) {
   366				clear_pageblock_skip(page);
   367				return true;
   368			}
   369	
   370			if (check_target && PageBuddy(page)) {
   371				clear_pageblock_skip(page);
   372				return true;
   373			}
   374	
   375			page += (1 << PAGE_ALLOC_COSTLY_ORDER);
   376		} while (page <= end_page);
   377	
   378		return false;
   379	}
   380	
   381	/*
   382	 * This function is called to clear all cached information on pageblocks that
   383	 * should be skipped for page isolation when the migrate and free page scanner
   384	 * meet.
   385	 */
   386	static void __reset_isolation_suitable(struct zone *zone)
   387	{
   388		unsigned long migrate_pfn = zone->zone_start_pfn;
   389		unsigned long free_pfn = zone_end_pfn(zone) - 1;
   390		unsigned long reset_migrate = free_pfn;
   391		unsigned long reset_free = migrate_pfn;
   392		bool source_set = false;
   393		bool free_set = false;
   394	
   395		/* Only flush if a full compaction finished recently */
   396		if (!zone->compact_blockskip_flush)
   397			return;
   398	
   399		zone->compact_blockskip_flush = false;
   400	
   401		/*
   402		 * Walk the zone and update pageblock skip information. Source looks
   403		 * for PageLRU while target looks for PageBuddy. When the scanner
   404		 * is found, both PageBuddy and PageLRU are checked as the pageblock
   405		 * is suitable as both source and target.
   406		 */
   407		for (; migrate_pfn < free_pfn; migrate_pfn += pageblock_nr_pages,
   408						free_pfn -= pageblock_nr_pages) {
   409			cond_resched();
   410	
   411			/* Update the migrate PFN */
   412			if (__reset_isolation_pfn(zone, migrate_pfn, true, source_set) &&
   413			    migrate_pfn < reset_migrate) {
   414				source_set = true;
   415				reset_migrate = migrate_pfn;
   416				zone->compact_init_migrate_pfn = reset_migrate;
   417				zone->compact_cached_migrate_pfn[0] = reset_migrate;
   418				zone->compact_cached_migrate_pfn[1] = reset_migrate;
   419			}
   420	
   421			/* Update the free PFN */
   422			if (__reset_isolation_pfn(zone, free_pfn, free_set, true) &&
   423			    free_pfn > reset_free) {
   424				free_set = true;
   425				reset_free = free_pfn;
   426				zone->compact_init_free_pfn = reset_free;
   427				zone->compact_cached_free_pfn = reset_free;
   428			}
   429		}
   430	
   431		/* Leave no distance if no suitable block was reset */
   432		if (reset_migrate >= reset_free) {
   433			zone->compact_cached_migrate_pfn[0] = migrate_pfn;
   434			zone->compact_cached_migrate_pfn[1] = migrate_pfn;
   435			zone->compact_cached_free_pfn = free_pfn;
   436		}
   437	}
   438	
   439	void reset_isolation_suitable(pg_data_t *pgdat)
   440	{
   441		int zoneid;
   442	
   443		for (zoneid = 0; zoneid < MAX_NR_ZONES; zoneid++) {
   444			struct zone *zone = &pgdat->node_zones[zoneid];
   445			if (!populated_zone(zone))
   446				continue;
   447	
   448			__reset_isolation_suitable(zone);
   449		}
   450	}
   451	
   452	/*
   453	 * Sets the pageblock skip bit if it was clear. Note that this is a hint as
   454	 * locks are not required for read/writers. Returns true if it was already set.
   455	 */
   456	static bool test_and_set_skip(struct compact_control *cc, struct page *page)
   457	{
   458		bool skip;
   459	
   460		/* Do not update if skip hint is being ignored */
   461		if (cc->ignore_skip_hint)
   462			return false;
   463	
   464		skip = get_pageblock_skip(page);
   465		if (!skip && !cc->no_set_skip_hint)
   466			set_pageblock_skip(page);
   467	
   468		return skip;
   469	}
   470	
   471	static void update_cached_migrate(struct compact_control *cc, unsigned long pfn)
   472	{
   473		struct zone *zone = cc->zone;
   474	
   475		/* Set for isolation rather than compaction */
   476		if (cc->no_set_skip_hint)
   477			return;
   478	
   479		pfn = pageblock_end_pfn(pfn);
   480	
   481		/* Update where async and sync compaction should restart */
   482		if (pfn > zone->compact_cached_migrate_pfn[0])
   483			zone->compact_cached_migrate_pfn[0] = pfn;
   484		if (cc->mode != MIGRATE_ASYNC &&
   485		    pfn > zone->compact_cached_migrate_pfn[1])
   486			zone->compact_cached_migrate_pfn[1] = pfn;
   487	}
   488	
   489	/*
   490	 * If no pages were isolated then mark this pageblock to be skipped in the
   491	 * future. The information is later cleared by __reset_isolation_suitable().
   492	 */
   493	static void update_pageblock_skip(struct compact_control *cc,
   494				struct page *page, unsigned long pfn)
   495	{
   496		struct zone *zone = cc->zone;
   497	
   498		if (cc->no_set_skip_hint)
   499			return;
   500	
   501		set_pageblock_skip(page);
   502	
   503		if (pfn < zone->compact_cached_free_pfn)
   504			zone->compact_cached_free_pfn = pfn;
   505	}
   506	#else
   507	static inline bool isolation_suitable(struct compact_control *cc,
   508						struct page *page)
   509	{
   510		return true;
   511	}
   512	
   513	static inline bool pageblock_skip_persistent(struct page *page)
   514	{
   515		return false;
   516	}
   517	
   518	static inline void update_pageblock_skip(struct compact_control *cc,
   519				struct page *page, unsigned long pfn)
   520	{
   521	}
   522	
   523	static void update_cached_migrate(struct compact_control *cc, unsigned long pfn)
   524	{
   525	}
   526	
   527	static bool test_and_set_skip(struct compact_control *cc, struct page *page)
   528	{
   529		return false;
   530	}
   531	#endif /* CONFIG_COMPACTION */
   532	
   533	/*
   534	 * Compaction requires the taking of some coarse locks that are potentially
   535	 * very heavily contended. For async compaction, trylock and record if the
   536	 * lock is contended. The lock will still be acquired but compaction will
   537	 * abort when the current block is finished regardless of success rate.
   538	 * Sync compaction acquires the lock.
   539	 *
   540	 * Always returns true which makes it easier to track lock state in callers.
   541	 */
   542	static bool compact_lock_irqsave(spinlock_t *lock, unsigned long *flags,
   543							struct compact_control *cc)
   544		__acquires(lock)
   545	{
   546		/* Track if the lock is contended in async mode */
   547		if (cc->mode == MIGRATE_ASYNC && !cc->contended) {
   548			if (spin_trylock_irqsave(lock, *flags))
   549				return true;
   550	
   551			cc->contended = true;
   552		}
   553	
   554		spin_lock_irqsave(lock, *flags);
   555		return true;
   556	}
   557	
   558	/*
   559	 * Compaction requires the taking of some coarse locks that are potentially
   560	 * very heavily contended. The lock should be periodically unlocked to avoid
   561	 * having disabled IRQs for a long time, even when there is nobody waiting on
   562	 * the lock. It might also be that allowing the IRQs will result in
   563	 * need_resched() becoming true. If scheduling is needed, compaction schedules.
   564	 * Either compaction type will also abort if a fatal signal is pending.
   565	 * In either case if the lock was locked, it is dropped and not regained.
   566	 *
   567	 * Returns true if compaction should abort due to fatal signal pending.
   568	 * Returns false when compaction can continue.
   569	 */
   570	static bool compact_unlock_should_abort(spinlock_t *lock,
   571			unsigned long flags, bool *locked, struct compact_control *cc)
   572	{
   573		if (*locked) {
   574			spin_unlock_irqrestore(lock, flags);
   575			*locked = false;
   576		}
   577	
   578		if (fatal_signal_pending(current)) {
   579			cc->contended = true;
   580			return true;
   581		}
   582	
   583		cond_resched();
   584	
   585		return false;
   586	}
   587	
   588	/*
   589	 * Isolate free pages onto a private freelist. If @strict is true, will abort
   590	 * returning 0 on any invalid PFNs or non-free pages inside of the pageblock
   591	 * (even though it may still end up isolating some pages).
   592	 */
   593	static unsigned long isolate_freepages_block(struct compact_control *cc,
   594					unsigned long *start_pfn,
   595					unsigned long end_pfn,
   596					struct list_head *freelist,
   597					unsigned int stride,
   598					bool strict)
   599	{
   600		int nr_scanned = 0, total_isolated = 0;
   601		struct page *page;
   602		unsigned long flags = 0;
   603		bool locked = false;
   604		unsigned long blockpfn = *start_pfn;
   605		unsigned int order;
   606	
   607		/* Strict mode is for isolation, speed is secondary */
   608		if (strict)
   609			stride = 1;
   610	
   611		page = pfn_to_page(blockpfn);
   612	
   613		/* Isolate free pages. */
   614		for (; blockpfn < end_pfn; blockpfn += stride, page += stride) {
   615			int isolated;
   616	
   617			/*
   618			 * Periodically drop the lock (if held) regardless of its
   619			 * contention, to give chance to IRQs. Abort if fatal signal
   620			 * pending.
   621			 */
   622			if (!(blockpfn % COMPACT_CLUSTER_MAX)
   623			    && compact_unlock_should_abort(&cc->zone->lock, flags,
   624									&locked, cc))
   625				break;
   626	
   627			nr_scanned++;
   628	
   629			/*
   630			 * For compound pages such as THP and hugetlbfs, we can save
   631			 * potentially a lot of iterations if we skip them at once.
   632			 * The check is racy, but we can consider only valid values
   633			 * and the only danger is skipping too much.
   634			 */
   635			if (PageCompound(page)) {
   636				const unsigned int order = compound_order(page);
   637	
   638				if ((order <= MAX_PAGE_ORDER) &&
   639				    (blockpfn + (1UL << order) <= end_pfn)) {
   640					blockpfn += (1UL << order) - 1;
   641					page += (1UL << order) - 1;
   642					nr_scanned += (1UL << order) - 1;
   643				}
   644	
   645				goto isolate_fail;
   646			}
   647	
   648			if (!PageBuddy(page))
   649				goto isolate_fail;
   650	
   651			/* If we already hold the lock, we can skip some rechecking. */
   652			if (!locked) {
   653				locked = compact_lock_irqsave(&cc->zone->lock,
   654									&flags, cc);
   655	
   656				/* Recheck this is a buddy page under lock */
   657				if (!PageBuddy(page))
   658					goto isolate_fail;
   659			}
   660	
   661			/* Found a free page, will break it into order-0 pages */
   662			order = buddy_order(page);
   663			isolated = __isolate_free_page(page, order);
   664			if (!isolated)
   665				break;
   666			set_page_private(page, order);
   667	
   668			nr_scanned += isolated - 1;
   669			total_isolated += isolated;
   670			cc->nr_freepages += isolated;
   671			list_add_tail(&page->lru, &freelist[order]);
   672	
   673			if (!strict && cc->nr_migratepages <= cc->nr_freepages) {
   674				blockpfn += isolated;
   675				break;
   676			}
   677			/* Advance to the end of split page */
   678			blockpfn += isolated - 1;
   679			page += isolated - 1;
   680			continue;
   681	
   682	isolate_fail:
   683			if (strict)
   684				break;
   685	
   686		}
   687	
   688		if (locked)
   689			spin_unlock_irqrestore(&cc->zone->lock, flags);
   690	
   691		/*
   692		 * Be careful to not go outside of the pageblock.
   693		 */
   694		if (unlikely(blockpfn > end_pfn))
   695			blockpfn = end_pfn;
   696	
   697		trace_mm_compaction_isolate_freepages(*start_pfn, blockpfn,
   698						nr_scanned, total_isolated);
   699	
   700		/* Record how far we have got within the block */
   701		*start_pfn = blockpfn;
   702	
   703		/*
   704		 * If strict isolation is requested by CMA then check that all the
   705		 * pages requested were isolated. If there were any failures, 0 is
   706		 * returned and CMA will fail.
   707		 */
   708		if (strict && blockpfn < end_pfn)
   709			total_isolated = 0;
   710	
   711		cc->total_free_scanned += nr_scanned;
   712		if (total_isolated)
   713			count_compact_events(COMPACTISOLATED, total_isolated);
   714		return total_isolated;
   715	}
   716	
   717	/**
   718	 * isolate_freepages_range() - isolate free pages.
   719	 * @cc:        Compaction control structure.
   720	 * @start_pfn: The first PFN to start isolating.
   721	 * @end_pfn:   The one-past-last PFN.
   722	 *
   723	 * Non-free pages, invalid PFNs, or zone boundaries within the
   724	 * [start_pfn, end_pfn) range are considered errors, cause function to
   725	 * undo its actions and return zero. cc->freepages[] are empty.
   726	 *
   727	 * Otherwise, function returns one-past-the-last PFN of isolated page
   728	 * (which may be greater then end_pfn if end fell in a middle of
   729	 * a free page). cc->freepages[] contain free pages isolated.
   730	 */
   731	unsigned long
   732	isolate_freepages_range(struct compact_control *cc,
   733				unsigned long start_pfn, unsigned long end_pfn)
   734	{
   735		unsigned long isolated, pfn, block_start_pfn, block_end_pfn;
   736		int order;
   737	
   738		for (order = 0; order < NR_PAGE_ORDERS; order++)
   739			INIT_LIST_HEAD(&cc->freepages[order]);
   740	
   741		pfn = start_pfn;
   742		block_start_pfn = pageblock_start_pfn(pfn);
   743		if (block_start_pfn < cc->zone->zone_start_pfn)
   744			block_start_pfn = cc->zone->zone_start_pfn;
   745		block_end_pfn = pageblock_end_pfn(pfn);
   746	
   747		for (; pfn < end_pfn; pfn += isolated,
   748					block_start_pfn = block_end_pfn,
   749					block_end_pfn += pageblock_nr_pages) {
   750			/* Protect pfn from changing by isolate_freepages_block */
   751			unsigned long isolate_start_pfn = pfn;
   752	
   753			/*
   754			 * pfn could pass the block_end_pfn if isolated freepage
   755			 * is more than pageblock order. In this case, we adjust
   756			 * scanning range to right one.
   757			 */
   758			if (pfn >= block_end_pfn) {
   759				block_start_pfn = pageblock_start_pfn(pfn);
   760				block_end_pfn = pageblock_end_pfn(pfn);
   761			}
   762	
   763			block_end_pfn = min(block_end_pfn, end_pfn);
   764	
   765			if (!pageblock_pfn_to_page(block_start_pfn,
   766						block_end_pfn, cc->zone))
   767				break;
   768	
   769			isolated = isolate_freepages_block(cc, &isolate_start_pfn,
   770						block_end_pfn, cc->freepages, 0, true);
   771	
   772			/*
   773			 * In strict mode, isolate_freepages_block() returns 0 if
   774			 * there are any holes in the block (ie. invalid PFNs or
   775			 * non-free pages).
   776			 */
   777			if (!isolated)
   778				break;
   779	
   780			/*
   781			 * If we managed to isolate pages, it is always (1 << n) *
   782			 * pageblock_nr_pages for some non-negative n.  (Max order
   783			 * page may span two pageblocks).
   784			 */
   785		}
   786	
   787		if (pfn < end_pfn) {
   788			/* Loop terminated early, cleanup. */
   789			release_free_list(cc->freepages);
   790			return 0;
   791		}
   792	
   793		/* We don't use freelists for anything. */
   794		return pfn;
   795	}
   796	
   797	/* Similar to reclaim, but different enough that they don't share logic */
   798	static bool too_many_isolated(struct compact_control *cc)
   799	{
   800		pg_data_t *pgdat = cc->zone->zone_pgdat;
   801		bool too_many;
   802	
   803		unsigned long active, inactive, isolated;
   804	
   805		inactive = node_page_state(pgdat, NR_INACTIVE_FILE) +
   806				node_page_state(pgdat, NR_INACTIVE_ANON);
   807		active = node_page_state(pgdat, NR_ACTIVE_FILE) +
   808				node_page_state(pgdat, NR_ACTIVE_ANON);
   809		isolated = node_page_state(pgdat, NR_ISOLATED_FILE) +
   810				node_page_state(pgdat, NR_ISOLATED_ANON);
   811	
   812		/*
   813		 * Allow GFP_NOFS to isolate past the limit set for regular
   814		 * compaction runs. This prevents an ABBA deadlock when other
   815		 * compactors have already isolated to the limit, but are
   816		 * blocked on filesystem locks held by the GFP_NOFS thread.
   817		 */
   818		if (cc->gfp_mask & __GFP_FS) {
   819			inactive >>= 3;
   820			active >>= 3;
   821		}
   822	
   823		too_many = isolated > (inactive + active) / 2;
   824		if (!too_many)
   825			wake_throttle_isolated(pgdat);
   826	
   827		return too_many;
   828	}
   829	
   830	/**
   831	 * skip_isolation_on_order() - determine when to skip folio isolation based on
   832	 *			       folio order and compaction target order
   833	 * @order:		to-be-isolated folio order
   834	 * @target_order:	compaction target order
   835	 *
   836	 * This avoids unnecessary folio isolations during compaction.
   837	 */
   838	static bool skip_isolation_on_order(int order, int target_order)
   839	{
   840		/*
   841		 * Unless we are performing global compaction (i.e.,
   842		 * is_via_compact_memory), skip any folios that are larger than the
   843		 * target order: we wouldn't be here if we'd have a free folio with
   844		 * the desired target_order, so migrating this folio would likely fail
   845		 * later.
   846		 */
   847		if (!is_via_compact_memory(target_order) && order >= target_order)
   848			return true;
   849		/*
   850		 * We limit memory compaction to pageblocks and won't try
   851		 * creating free blocks of memory that are larger than that.
   852		 */
   853		return order >= pageblock_order;
   854	}
   855	
   856	/**
   857	 * isolate_migratepages_block() - isolate all migrate-able pages within
   858	 *				  a single pageblock
   859	 * @cc:		Compaction control structure.
   860	 * @low_pfn:	The first PFN to isolate
   861	 * @end_pfn:	The one-past-the-last PFN to isolate, within same pageblock
   862	 * @mode:	Isolation mode to be used.
   863	 *
   864	 * Isolate all pages that can be migrated from the range specified by
   865	 * [low_pfn, end_pfn). The range is expected to be within same pageblock.
   866	 * Returns errno, like -EAGAIN or -EINTR in case e.g signal pending or congestion,
   867	 * -ENOMEM in case we could not allocate a page, or 0.
   868	 * cc->migrate_pfn will contain the next pfn to scan.
   869	 *
   870	 * The pages are isolated on cc->migratepages list (not required to be empty),
   871	 * and cc->nr_migratepages is updated accordingly.
   872	 */
   873	static int
   874	isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
   875				unsigned long end_pfn, isolate_mode_t mode)
   876	{
   877		pg_data_t *pgdat = cc->zone->zone_pgdat;
   878		unsigned long nr_scanned = 0, nr_isolated = 0;
   879		struct lruvec *lruvec;
   880		unsigned long flags = 0;
   881		struct lruvec *locked = NULL;
   882		struct folio *folio = NULL;
   883		struct page *page = NULL, *valid_page = NULL;
   884		struct address_space *mapping;
   885		unsigned long start_pfn = low_pfn;
   886		bool skip_on_failure = false;
   887		unsigned long next_skip_pfn = 0;
   888		bool skip_updated = false;
   889		int ret = 0;
   890	
   891		cc->migrate_pfn = low_pfn;
   892	
   893		/*
   894		 * Ensure that there are not too many pages isolated from the LRU
   895		 * list by either parallel reclaimers or compaction. If there are,
   896		 * delay for some time until fewer pages are isolated
   897		 */
   898		while (unlikely(too_many_isolated(cc))) {
   899			/* stop isolation if there are still pages not migrated */
   900			if (cc->nr_migratepages)
   901				return -EAGAIN;
   902	
   903			/* async migration should just abort */
   904			if (cc->mode == MIGRATE_ASYNC)
   905				return -EAGAIN;
   906	
   907			reclaim_throttle(pgdat, VMSCAN_THROTTLE_ISOLATED);
   908	
   909			if (fatal_signal_pending(current))
   910				return -EINTR;
   911		}
   912	
   913		cond_resched();
   914	
   915		if (cc->direct_compaction && (cc->mode == MIGRATE_ASYNC)) {
   916			skip_on_failure = true;
   917			next_skip_pfn = block_end_pfn(low_pfn, cc->order);
   918		}
   919	
   920		/* Time to isolate some pages for migration */
   921		for (; low_pfn < end_pfn; low_pfn++) {
   922			bool is_dirty, is_unevictable;
   923	
   924			if (skip_on_failure && low_pfn >= next_skip_pfn) {
   925				/*
   926				 * We have isolated all migration candidates in the
   927				 * previous order-aligned block, and did not skip it due
   928				 * to failure. We should migrate the pages now and
   929				 * hopefully succeed compaction.
   930				 */
   931				if (nr_isolated)
   932					break;
   933	
   934				/*
   935				 * We failed to isolate in the previous order-aligned
   936				 * block. Set the new boundary to the end of the
   937				 * current block. Note we can't simply increase
   938				 * next_skip_pfn by 1 << order, as low_pfn might have
   939				 * been incremented by a higher number due to skipping
   940				 * a compound or a high-order buddy page in the
   941				 * previous loop iteration.
   942				 */
   943				next_skip_pfn = block_end_pfn(low_pfn, cc->order);
   944			}
   945	
   946			/*
   947			 * Periodically drop the lock (if held) regardless of its
   948			 * contention, to give chance to IRQs. Abort completely if
   949			 * a fatal signal is pending.
   950			 */
   951			if (!(low_pfn % COMPACT_CLUSTER_MAX)) {
   952				if (locked) {
   953					unlock_page_lruvec_irqrestore(locked, flags);
   954					locked = NULL;
   955				}
   956	
   957				if (fatal_signal_pending(current)) {
   958					cc->contended = true;
   959					ret = -EINTR;
   960	
   961					goto fatal_pending;
   962				}
   963	
   964				cond_resched();
   965			}
   966	
   967			nr_scanned++;
   968	
   969			page = pfn_to_page(low_pfn);
   970	
   971			/*
   972			 * Check if the pageblock has already been marked skipped.
   973			 * Only the first PFN is checked as the caller isolates
   974			 * COMPACT_CLUSTER_MAX at a time so the second call must
   975			 * not falsely conclude that the block should be skipped.
   976			 */
   977			if (!valid_page && (pageblock_aligned(low_pfn) ||
   978					    low_pfn == cc->zone->zone_start_pfn)) {
   979				if (!isolation_suitable(cc, page)) {
   980					low_pfn = end_pfn;
   981					folio = NULL;
   982					goto isolate_abort;
   983				}
   984				valid_page = page;
   985			}
   986	
   987			if (PageHuge(page)) {
   988				/*
   989				 * skip hugetlbfs if we are not compacting for pages
   990				 * bigger than its order. THPs and other compound pages
   991				 * are handled below.
   992				 */
   993				if (!cc->alloc_contig) {
   994					const unsigned int order = compound_order(page);
   995	
   996					if (order <= MAX_PAGE_ORDER) {
   997						low_pfn += (1UL << order) - 1;
   998						nr_scanned += (1UL << order) - 1;
   999					}
  1000					goto isolate_fail;
  1001				}
  1002				/* for alloc_contig case */
  1003				if (locked) {
  1004					unlock_page_lruvec_irqrestore(locked, flags);
  1005					locked = NULL;
  1006				}
  1007	
  1008				ret = isolate_or_dissolve_huge_page(page, &cc->migratepages);
  1009	
  1010				/*
  1011				 * Fail isolation in case isolate_or_dissolve_huge_page()
  1012				 * reports an error. In case of -ENOMEM, abort right away.
  1013				 */
  1014				if (ret < 0) {
  1015					 /* Do not report -EBUSY down the chain */
  1016					if (ret == -EBUSY)
  1017						ret = 0;
  1018					low_pfn += compound_nr(page) - 1;
  1019					nr_scanned += compound_nr(page) - 1;
  1020					goto isolate_fail;
  1021				}
  1022	
  1023				if (PageHuge(page)) {
  1024					/*
  1025					 * Hugepage was successfully isolated and placed
  1026					 * on the cc->migratepages list.
  1027					 */
  1028					folio = page_folio(page);
  1029					low_pfn += folio_nr_pages(folio) - 1;
  1030					goto isolate_success_no_list;
  1031				}
  1032	
  1033				/*
  1034				 * Ok, the hugepage was dissolved. Now these pages are
  1035				 * Buddy and cannot be re-allocated because they are
  1036				 * isolated. Fall-through as the check below handles
  1037				 * Buddy pages.
  1038				 */
  1039			}
  1040	
  1041			/*
  1042			 * Skip if free. We read page order here without zone lock
  1043			 * which is generally unsafe, but the race window is small and
  1044			 * the worst thing that can happen is that we skip some
  1045			 * potential isolation targets.
  1046			 */
  1047			if (PageBuddy(page)) {
  1048				unsigned long freepage_order = buddy_order_unsafe(page);
  1049	
  1050				/*
  1051				 * Without lock, we cannot be sure that what we got is
  1052				 * a valid page order. Consider only values in the
  1053				 * valid order range to prevent low_pfn overflow.
  1054				 */
  1055				if (freepage_order > 0 && freepage_order <= MAX_PAGE_ORDER) {
  1056					low_pfn += (1UL << freepage_order) - 1;
  1057					nr_scanned += (1UL << freepage_order) - 1;
  1058				}
  1059				continue;
  1060			}
  1061	
  1062			/*
  1063			 * Regardless of being on LRU, compound pages such as THP
  1064			 * (hugetlbfs is handled above) are not to be compacted unless
  1065			 * we are attempting an allocation larger than the compound
  1066			 * page size. We can potentially save a lot of iterations if we
  1067			 * skip them at once. The check is racy, but we can consider
  1068			 * only valid values and the only danger is skipping too much.
  1069			 */
  1070			if (PageCompound(page) && !cc->alloc_contig) {
  1071				const unsigned int order = compound_order(page);
  1072	
  1073				/* Skip based on page order and compaction target order. */
  1074				if (skip_isolation_on_order(order, cc->order)) {
  1075					if (order <= MAX_PAGE_ORDER) {
  1076						low_pfn += (1UL << order) - 1;
  1077						nr_scanned += (1UL << order) - 1;
  1078					}
  1079					goto isolate_fail;
  1080				}
  1081			}
  1082	
  1083			/*
  1084			 * Check may be lockless but that's ok as we recheck later.
  1085			 * It's possible to migrate LRU and non-lru movable pages.
  1086			 * Skip any other type of page
  1087			 */
  1088			if (!PageLRU(page)) {
  1089				/*
  1090				 * __PageMovable can return false positive so we need
  1091				 * to verify it under page_lock.
  1092				 */
  1093				if (unlikely(__PageMovable(page)) &&
  1094						!PageIsolated(page)) {
  1095					if (locked) {
  1096						unlock_page_lruvec_irqrestore(locked, flags);
  1097						locked = NULL;
  1098					}
  1099	
  1100					if (isolate_movable_page(page, mode)) {
  1101						folio = page_folio(page);
  1102						goto isolate_success;
  1103					}
  1104				}
  1105	
  1106				goto isolate_fail;
  1107			}
  1108	
  1109			/*
  1110			 * Be careful not to clear PageLRU until after we're
  1111			 * sure the page is not being freed elsewhere -- the
  1112			 * page release code relies on it.
  1113			 */
  1114			folio = folio_get_nontail_page(page);
  1115			if (unlikely(!folio))
  1116				goto isolate_fail;
  1117	
  1118			/*
  1119			 * Migration will fail if an anonymous page is pinned in memory,
  1120			 * so avoid taking lru_lock and isolating it unnecessarily in an
  1121			 * admittedly racy check.
  1122			 */
  1123			mapping = folio_mapping(folio);
  1124			if (!mapping && (folio_ref_count(folio) - 1) > folio_mapcount(folio))
  1125				goto isolate_fail_put;
  1126	
  1127			/*
  1128			 * Only allow to migrate anonymous pages in GFP_NOFS context
  1129			 * because those do not depend on fs locks.
  1130			 */
  1131			if (!(cc->gfp_mask & __GFP_FS) && mapping)
  1132				goto isolate_fail_put;
  1133	
  1134			/* Only take pages on LRU: a check now makes later tests safe */
  1135			if (!folio_test_lru(folio))
  1136				goto isolate_fail_put;
  1137	
  1138			is_unevictable = folio_test_unevictable(folio);
  1139	
  1140			/* Compaction might skip unevictable pages but CMA takes them */
  1141			if (!(mode & ISOLATE_UNEVICTABLE) && is_unevictable)
  1142				goto isolate_fail_put;
  1143	
  1144			/*
  1145			 * To minimise LRU disruption, the caller can indicate with
  1146			 * ISOLATE_ASYNC_MIGRATE that it only wants to isolate pages
  1147			 * it will be able to migrate without blocking - clean pages
  1148			 * for the most part.  PageWriteback would require blocking.
  1149			 */
  1150			if ((mode & ISOLATE_ASYNC_MIGRATE) && folio_test_writeback(folio))
  1151				goto isolate_fail_put;
  1152	
  1153			is_dirty = folio_test_dirty(folio);
  1154	
  1155			if (((mode & ISOLATE_ASYNC_MIGRATE) && is_dirty) ||
  1156			    (mapping && is_unevictable)) {
  1157				bool migrate_dirty = true;
  1158				bool is_inaccessible;
  1159	
  1160				/*
  1161				 * Only folios without mappings or that have
  1162				 * a ->migrate_folio callback are possible to migrate
  1163				 * without blocking.
  1164				 *
  1165				 * Folios from inaccessible mappings are not migratable.
  1166				 *
  1167				 * However, we can be racing with truncation, which can
  1168				 * free the mapping that we need to check. Truncation
  1169				 * holds the folio lock until after the folio is removed
  1170				 * from the page so holding it ourselves is sufficient.
  1171				 *
  1172				 * To avoid locking the folio just to check inaccessible,
  1173				 * assume every inaccessible folio is also unevictable,
  1174				 * which is a cheaper test.  If our assumption goes
  1175				 * wrong, it's not a correctness bug, just potentially
  1176				 * wasted cycles.
  1177				 */
  1178				if (!folio_trylock(folio))
  1179					goto isolate_fail_put;
  1180	
  1181				mapping = folio_mapping(folio);
  1182				if ((mode & ISOLATE_ASYNC_MIGRATE) && is_dirty) {
  1183					migrate_dirty = !mapping ||
  1184							mapping->a_ops->migrate_folio;
  1185				}
  1186				is_inaccessible = mapping && mapping_inaccessible(mapping);
  1187				folio_unlock(folio);
  1188				if (!migrate_dirty || is_inaccessible)
  1189					goto isolate_fail_put;
  1190			}
  1191	
  1192			/* Try isolate the folio */
  1193			if (!folio_test_clear_lru(folio))
  1194				goto isolate_fail_put;
  1195	
  1196			lruvec = folio_lruvec(folio);
  1197	
  1198			/* If we already hold the lock, we can skip some rechecking */
  1199			if (lruvec != locked) {
  1200				if (locked)
  1201					unlock_page_lruvec_irqrestore(locked, flags);
  1202	
  1203				compact_lock_irqsave(&lruvec->lru_lock, &flags, cc);
  1204				locked = lruvec;
  1205	
  1206				lruvec_memcg_debug(lruvec, folio);
  1207	
  1208				/*
  1209				 * Try get exclusive access under lock. If marked for
  1210				 * skip, the scan is aborted unless the current context
  1211				 * is a rescan to reach the end of the pageblock.
  1212				 */
  1213				if (!skip_updated && valid_page) {
  1214					skip_updated = true;
  1215					if (test_and_set_skip(cc, valid_page) &&
  1216					    !cc->finish_pageblock) {
  1217						low_pfn = end_pfn;
  1218						goto isolate_abort;
  1219					}
  1220				}
  1221	
  1222				/*
  1223				 * Check LRU folio order under the lock
  1224				 */
  1225				if (unlikely(skip_isolation_on_order(folio_order(folio),
  1226								     cc->order) &&
  1227					     !cc->alloc_contig)) {
  1228					low_pfn += folio_nr_pages(folio) - 1;
  1229					nr_scanned += folio_nr_pages(folio) - 1;
  1230					folio_set_lru(folio);
  1231					goto isolate_fail_put;
  1232				}
  1233			}
  1234	
  1235			/* The folio is taken off the LRU */
  1236			if (folio_test_large(folio))
  1237				low_pfn += folio_nr_pages(folio) - 1;
  1238	
  1239			/* Successfully isolated */
  1240			lruvec_del_folio(lruvec, folio);
  1241			node_stat_mod_folio(folio,
  1242					NR_ISOLATED_ANON + folio_is_file_lru(folio),
  1243					folio_nr_pages(folio));
  1244	
  1245	isolate_success:
  1246			list_add(&folio->lru, &cc->migratepages);
  1247	isolate_success_no_list:
  1248			cc->nr_migratepages += folio_nr_pages(folio);
  1249			nr_isolated += folio_nr_pages(folio);
  1250			nr_scanned += folio_nr_pages(folio) - 1;
  1251	
  1252			/*
  1253			 * Avoid isolating too much unless this block is being
  1254			 * fully scanned (e.g. dirty/writeback pages, parallel allocation)
  1255			 * or a lock is contended. For contention, isolate quickly to
  1256			 * potentially remove one source of contention.
  1257			 */
  1258			if (cc->nr_migratepages >= COMPACT_CLUSTER_MAX &&
  1259			    !cc->finish_pageblock && !cc->contended) {
  1260				++low_pfn;
  1261				break;
  1262			}
  1263	
  1264			continue;
  1265	
  1266	isolate_fail_put:
  1267			/* Avoid potential deadlock in freeing page under lru_lock */
  1268			if (locked) {
  1269				unlock_page_lruvec_irqrestore(locked, flags);
  1270				locked = NULL;
  1271			}
  1272			folio_put(folio);
  1273	
  1274	isolate_fail:
  1275			if (!skip_on_failure && ret != -ENOMEM)
  1276				continue;
  1277	
  1278			/*
  1279			 * We have isolated some pages, but then failed. Release them
  1280			 * instead of migrating, as we cannot form the cc->order buddy
  1281			 * page anyway.
  1282			 */
  1283			if (nr_isolated) {
  1284				if (locked) {
  1285					unlock_page_lruvec_irqrestore(locked, flags);
  1286					locked = NULL;
  1287				}
  1288				putback_movable_pages(&cc->migratepages);
  1289				cc->nr_migratepages = 0;
  1290				nr_isolated = 0;
  1291			}
  1292	
  1293			if (low_pfn < next_skip_pfn) {
  1294				low_pfn = next_skip_pfn - 1;
  1295				/*
  1296				 * The check near the loop beginning would have updated
  1297				 * next_skip_pfn too, but this is a bit simpler.
  1298				 */
  1299				next_skip_pfn += 1UL << cc->order;
  1300			}
  1301	
  1302			if (ret == -ENOMEM)
  1303				break;
  1304		}
  1305	
  1306		/*
  1307		 * The PageBuddy() check could have potentially brought us outside
  1308		 * the range to be scanned.
  1309		 */
  1310		if (unlikely(low_pfn > end_pfn))
  1311			low_pfn = end_pfn;
  1312	
  1313		folio = NULL;
  1314	
  1315	isolate_abort:
  1316		if (locked)
  1317			unlock_page_lruvec_irqrestore(locked, flags);
  1318		if (folio) {
  1319			folio_set_lru(folio);
  1320			folio_put(folio);
  1321		}
  1322	
  1323		/*
  1324		 * Update the cached scanner pfn once the pageblock has been scanned.
  1325		 * Pages will either be migrated in which case there is no point
  1326		 * scanning in the near future or migration failed in which case the
  1327		 * failure reason may persist. The block is marked for skipping if
  1328		 * there were no pages isolated in the block or if the block is
  1329		 * rescanned twice in a row.
  1330		 */
  1331		if (low_pfn == end_pfn && (!nr_isolated || cc->finish_pageblock)) {
  1332			if (!cc->no_set_skip_hint && valid_page && !skip_updated)
  1333				set_pageblock_skip(valid_page);
  1334			update_cached_migrate(cc, low_pfn);
  1335		}
  1336	
  1337		trace_mm_compaction_isolate_migratepages(start_pfn, low_pfn,
  1338							nr_scanned, nr_isolated);
  1339	
  1340	fatal_pending:
  1341		cc->total_migrate_scanned += nr_scanned;
  1342		if (nr_isolated)
  1343			count_compact_events(COMPACTISOLATED, nr_isolated);
  1344	
  1345		cc->migrate_pfn = low_pfn;
  1346	
  1347		return ret;
  1348	}
  1349	
  1350	/**
  1351	 * isolate_migratepages_range() - isolate migrate-able pages in a PFN range
  1352	 * @cc:        Compaction control structure.
  1353	 * @start_pfn: The first PFN to start isolating.
  1354	 * @end_pfn:   The one-past-last PFN.
  1355	 *
  1356	 * Returns -EAGAIN when contented, -EINTR in case of a signal pending, -ENOMEM
  1357	 * in case we could not allocate a page, or 0.
  1358	 */
  1359	int
  1360	isolate_migratepages_range(struct compact_control *cc, unsigned long start_pfn,
  1361								unsigned long end_pfn)
  1362	{
  1363		unsigned long pfn, block_start_pfn, block_end_pfn;
  1364		int ret = 0;
  1365	
  1366		/* Scan block by block. First and last block may be incomplete */
  1367		pfn = start_pfn;
  1368		block_start_pfn = pageblock_start_pfn(pfn);
  1369		if (block_start_pfn < cc->zone->zone_start_pfn)
  1370			block_start_pfn = cc->zone->zone_start_pfn;
  1371		block_end_pfn = pageblock_end_pfn(pfn);
  1372	
  1373		for (; pfn < end_pfn; pfn = block_end_pfn,
  1374					block_start_pfn = block_end_pfn,
  1375					block_end_pfn += pageblock_nr_pages) {
  1376	
  1377			block_end_pfn = min(block_end_pfn, end_pfn);
  1378	
  1379			if (!pageblock_pfn_to_page(block_start_pfn,
  1380						block_end_pfn, cc->zone))
  1381				continue;
  1382	
  1383			ret = isolate_migratepages_block(cc, pfn, block_end_pfn,
  1384							 ISOLATE_UNEVICTABLE);
  1385	
  1386			if (ret)
  1387				break;
  1388	
  1389			if (cc->nr_migratepages >= COMPACT_CLUSTER_MAX)
  1390				break;
  1391		}
  1392	
  1393		return ret;
  1394	}
  1395	
  1396	#endif /* CONFIG_COMPACTION || CONFIG_CMA */
> 1397	#include <trace/hooks/mm.h>
  1398	#ifdef CONFIG_COMPACTION
  1399	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
