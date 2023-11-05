Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361FDBA34
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Nov 2023 22:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="buuahA0I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699222412; x=1730758412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=clAsF6jHrThBCwwK6Lujz55vDJjbhK7L8nYDQAiB47k=;
  b=buuahA0IZ0NsmDk3/1rVUQZdFvfUlRx86sP/1rGVhZHTPA/MpBACQN+l
   CGhLL+EIdnjHRXdGR2pw6DCENGH4N8sjjob4KGF39jpqlDRSUsiK3Vt5b
   GC5Th4l/OyRapgm0CMVIBt9m6MvjFbehaILm52PjzQyM6O9pHZYnq09wv
   ckt26UKZwWWWcCLN+G1RB6lE61XNVupz8Zv4GKDtZa5bV2S42I34C8nD6
   tjsjINFFQYB+iIi9dh9PFW33E0Kn4GY/KdKx4Cs+1MGGs9Vj2vNTNGtcf
   KCVWQbPiGz9xcFV7Xatsk4ezr5KFjnEEzpc28nf4dMcYiy3P6Y+UBQlnW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="2088653"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="2088653"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 14:13:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="712031844"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="712031844"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 05 Nov 2023 14:13:30 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzlN1-0005pg-2s;
	Sun, 05 Nov 2023 22:13:27 +0000
Date: Mon, 6 Nov 2023 06:13:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/bcachefs/journal_io.c:132 journal_entry_add() warn: missing error
 code 'ret'
Message-ID: <202311060657.SHKpBx9C-lkp@intel.com>
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
head:   77fa2fbe87fc605c4bfa87dff87be9bfded0e9a3
commit: 17fe3b6452f62c0ee353f3b4f0107685cfd6847d bcachefs: Improve journal_entry_add()
date:   2 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231106/202311060657.SHKpBx9C-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311060657.SHKpBx9C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311060657.SHKpBx9C-lkp@intel.com/

smatch warnings:
fs/bcachefs/journal_io.c:132 journal_entry_add() warn: missing error code 'ret'

vim +/ret +132 fs/bcachefs/journal_io.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16   71  
1c6fdbd8f2465d Kent Overstreet 2017-03-16   72  /*
1c6fdbd8f2465d Kent Overstreet 2017-03-16   73   * Given a journal entry we just read, add it to the list of journal entries to
1c6fdbd8f2465d Kent Overstreet 2017-03-16   74   * be replayed:
1c6fdbd8f2465d Kent Overstreet 2017-03-16   75   */
1c6fdbd8f2465d Kent Overstreet 2017-03-16   76  static int journal_entry_add(struct bch_fs *c, struct bch_dev *ca,
72b7d6332b0a76 Kent Overstreet 2022-02-19   77  			     struct journal_ptr entry_ptr,
17fe3b6452f62c Kent Overstreet 2022-10-14   78  			     struct journal_list *jlist, struct jset *j)
1c6fdbd8f2465d Kent Overstreet 2017-03-16   79  {
ce6201c456571d Kent Overstreet 2022-03-21   80  	struct genradix_iter iter;
ce6201c456571d Kent Overstreet 2022-03-21   81  	struct journal_replay **_i, *i, *dup;
72b7d6332b0a76 Kent Overstreet 2022-02-19   82  	struct journal_ptr *ptr;
1c6fdbd8f2465d Kent Overstreet 2017-03-16   83  	size_t bytes = vstruct_bytes(j);
ec7ccbde6baa50 Kent Overstreet 2022-04-10   84  	u64 last_seq = !JSET_NO_FLUSH(j) ? le64_to_cpu(j->last_seq) : 0;
e4c3f386b62d8f Kent Overstreet 2021-01-26   85  	int ret = JOURNAL_ENTRY_ADD_OK;
1c6fdbd8f2465d Kent Overstreet 2017-03-16   86  
ec7ccbde6baa50 Kent Overstreet 2022-04-10   87  	/* Is this entry older than the range we need? */
ec7ccbde6baa50 Kent Overstreet 2022-04-10   88  	if (!c->opts.read_entire_journal &&
ec7ccbde6baa50 Kent Overstreet 2022-04-10   89  	    le64_to_cpu(j->seq) < jlist->last_seq)
ec7ccbde6baa50 Kent Overstreet 2022-04-10   90  		return JOURNAL_ENTRY_ADD_OUT_OF_RANGE;
ec7ccbde6baa50 Kent Overstreet 2022-04-10   91  
ce6201c456571d Kent Overstreet 2022-03-21   92  	/*
ec7ccbde6baa50 Kent Overstreet 2022-04-10   93  	 * genradixes are indexed by a ulong, not a u64, so we can't index them
ec7ccbde6baa50 Kent Overstreet 2022-04-10   94  	 * by sequence number directly: Assume instead that they will all fall
ec7ccbde6baa50 Kent Overstreet 2022-04-10   95  	 * within the range of +-2billion of the filrst one we find.
ce6201c456571d Kent Overstreet 2022-03-21   96  	 */
ce6201c456571d Kent Overstreet 2022-03-21   97  	if (!c->journal_entries_base_seq)
ce6201c456571d Kent Overstreet 2022-03-21   98  		c->journal_entries_base_seq = max_t(s64, 1, le64_to_cpu(j->seq) - S32_MAX);
ce6201c456571d Kent Overstreet 2022-03-21   99  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  100  	/* Drop entries we don't need anymore */
ec7ccbde6baa50 Kent Overstreet 2022-04-10  101  	if (last_seq > jlist->last_seq && !c->opts.read_entire_journal) {
ec7ccbde6baa50 Kent Overstreet 2022-04-10  102  		genradix_for_each_from(&c->journal_entries, iter, _i,
ec7ccbde6baa50 Kent Overstreet 2022-04-10  103  				       journal_entry_radix_idx(c, jlist->last_seq)) {
ce6201c456571d Kent Overstreet 2022-03-21  104  			i = *_i;
ce6201c456571d Kent Overstreet 2022-03-21  105  
ec7ccbde6baa50 Kent Overstreet 2022-04-10  106  			if (!i || i->ignore)
ce6201c456571d Kent Overstreet 2022-03-21  107  				continue;
ce6201c456571d Kent Overstreet 2022-03-21  108  
ec7ccbde6baa50 Kent Overstreet 2022-04-10  109  			if (le64_to_cpu(i->j.seq) >= last_seq)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  110  				break;
adbcada43fa791 Kent Overstreet 2020-11-14  111  			journal_replay_free(c, i);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  112  		}
7fffc85baf1fa1 Kent Overstreet 2020-06-13  113  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  114  
ec7ccbde6baa50 Kent Overstreet 2022-04-10  115  	jlist->last_seq = max(jlist->last_seq, last_seq);
ec7ccbde6baa50 Kent Overstreet 2022-04-10  116  
ec7ccbde6baa50 Kent Overstreet 2022-04-10  117  	_i = genradix_ptr_alloc(&c->journal_entries,
ec7ccbde6baa50 Kent Overstreet 2022-04-10  118  				journal_entry_radix_idx(c, le64_to_cpu(j->seq)),
ec7ccbde6baa50 Kent Overstreet 2022-04-10  119  				GFP_KERNEL);
ec7ccbde6baa50 Kent Overstreet 2022-04-10  120  	if (!_i)
ec7ccbde6baa50 Kent Overstreet 2022-04-10  121  		return -ENOMEM;
e4c3f386b62d8f Kent Overstreet 2021-01-26  122  
ca73852a134153 Kent Overstreet 2020-08-24  123  	/*
ca73852a134153 Kent Overstreet 2020-08-24  124  	 * Duplicate journal entries? If so we want the one that didn't have a
ca73852a134153 Kent Overstreet 2020-08-24  125  	 * checksum error:
ca73852a134153 Kent Overstreet 2020-08-24  126  	 */
ec7ccbde6baa50 Kent Overstreet 2022-04-10  127  	dup = *_i;
e4c3f386b62d8f Kent Overstreet 2021-01-26  128  	if (dup) {
17fe3b6452f62c Kent Overstreet 2022-10-14  129  		if (bytes == vstruct_bytes(&dup->j) &&
17fe3b6452f62c Kent Overstreet 2022-10-14  130  		    !memcmp(j, &dup->j, bytes)) {
e4c3f386b62d8f Kent Overstreet 2021-01-26  131  			i = dup;
ca73852a134153 Kent Overstreet 2020-08-24 @132  			goto found;
17fe3b6452f62c Kent Overstreet 2022-10-14  133  		}
17fe3b6452f62c Kent Overstreet 2022-10-14  134  
17fe3b6452f62c Kent Overstreet 2022-10-14  135  		if (!entry_ptr.csum_good) {
e4c3f386b62d8f Kent Overstreet 2021-01-26  136  			i = dup;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  137  			goto found;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  138  		}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  139  
17fe3b6452f62c Kent Overstreet 2022-10-14  140  		if (!dup->csum_good)
17fe3b6452f62c Kent Overstreet 2022-10-14  141  			goto replace;
17fe3b6452f62c Kent Overstreet 2022-10-14  142  
17fe3b6452f62c Kent Overstreet 2022-10-14  143  		fsck_err(c, "found duplicate but non identical journal entries (seq %llu)",
17fe3b6452f62c Kent Overstreet 2022-10-14  144  			 le64_to_cpu(j->seq));
17fe3b6452f62c Kent Overstreet 2022-10-14  145  		i = dup;
17fe3b6452f62c Kent Overstreet 2022-10-14  146  		goto found;
17fe3b6452f62c Kent Overstreet 2022-10-14  147  	}
17fe3b6452f62c Kent Overstreet 2022-10-14  148  replace:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  149  	i = kvpmalloc(offsetof(struct journal_replay, j) + bytes, GFP_KERNEL);
ec7ccbde6baa50 Kent Overstreet 2022-04-10  150  	if (!i)
ec7ccbde6baa50 Kent Overstreet 2022-04-10  151  		return -ENOMEM;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  152  
e4c3f386b62d8f Kent Overstreet 2021-01-26  153  	i->nr_ptrs	= 0;
17fe3b6452f62c Kent Overstreet 2022-10-14  154  	i->csum_good	= entry_ptr.csum_good;
adbcada43fa791 Kent Overstreet 2020-11-14  155  	i->ignore	= false;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  156  	unsafe_memcpy(&i->j, j, bytes, "embedded variable length struct");
17fe3b6452f62c Kent Overstreet 2022-10-14  157  	i->ptrs[i->nr_ptrs++] = entry_ptr;
e4c3f386b62d8f Kent Overstreet 2021-01-26  158  
e4c3f386b62d8f Kent Overstreet 2021-01-26  159  	if (dup) {
17fe3b6452f62c Kent Overstreet 2022-10-14  160  		if (dup->nr_ptrs >= ARRAY_SIZE(dup->ptrs)) {
17fe3b6452f62c Kent Overstreet 2022-10-14  161  			bch_err(c, "found too many copies of journal entry %llu",
17fe3b6452f62c Kent Overstreet 2022-10-14  162  				le64_to_cpu(i->j.seq));
17fe3b6452f62c Kent Overstreet 2022-10-14  163  			dup->nr_ptrs = ARRAY_SIZE(dup->ptrs) - 1;
ce6201c456571d Kent Overstreet 2022-03-21  164  		}
ce6201c456571d Kent Overstreet 2022-03-21  165  
17fe3b6452f62c Kent Overstreet 2022-10-14  166  		/* The first ptr should represent the jset we kept: */
17fe3b6452f62c Kent Overstreet 2022-10-14  167  		memcpy(i->ptrs + i->nr_ptrs,
17fe3b6452f62c Kent Overstreet 2022-10-14  168  		       dup->ptrs,
17fe3b6452f62c Kent Overstreet 2022-10-14  169  		       sizeof(dup->ptrs[0]) * dup->nr_ptrs);
17fe3b6452f62c Kent Overstreet 2022-10-14  170  		i->nr_ptrs += dup->nr_ptrs;
17fe3b6452f62c Kent Overstreet 2022-10-14  171  		__journal_replay_free(c, dup);
17fe3b6452f62c Kent Overstreet 2022-10-14  172  	}
e4c3f386b62d8f Kent Overstreet 2021-01-26  173  
ce6201c456571d Kent Overstreet 2022-03-21  174  	*_i = i;
17fe3b6452f62c Kent Overstreet 2022-10-14  175  	return 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  176  found:
e4c3f386b62d8f Kent Overstreet 2021-01-26  177  	for (ptr = i->ptrs; ptr < i->ptrs + i->nr_ptrs; ptr++) {
e4c3f386b62d8f Kent Overstreet 2021-01-26  178  		if (ptr->dev == ca->dev_idx) {
e4c3f386b62d8f Kent Overstreet 2021-01-26  179  			bch_err(c, "duplicate journal entry %llu on same device",
e4c3f386b62d8f Kent Overstreet 2021-01-26  180  				le64_to_cpu(i->j.seq));
e4c3f386b62d8f Kent Overstreet 2021-01-26  181  			goto out;
e4c3f386b62d8f Kent Overstreet 2021-01-26  182  		}
e4c3f386b62d8f Kent Overstreet 2021-01-26  183  	}
e4c3f386b62d8f Kent Overstreet 2021-01-26  184  
e4c3f386b62d8f Kent Overstreet 2021-01-26  185  	if (i->nr_ptrs >= ARRAY_SIZE(i->ptrs)) {
e4c3f386b62d8f Kent Overstreet 2021-01-26  186  		bch_err(c, "found too many copies of journal entry %llu",
e4c3f386b62d8f Kent Overstreet 2021-01-26  187  			le64_to_cpu(i->j.seq));
e4c3f386b62d8f Kent Overstreet 2021-01-26  188  		goto out;
e4c3f386b62d8f Kent Overstreet 2021-01-26  189  	}
e4c3f386b62d8f Kent Overstreet 2021-01-26  190  
e4c3f386b62d8f Kent Overstreet 2021-01-26  191  	i->ptrs[i->nr_ptrs++] = entry_ptr;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  192  out:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  193  fsck_err:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  194  	return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  195  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  196  

:::::: The code at line 132 was first introduced by commit
:::::: ca73852a1341534e2bf00cfbdc853bb3b1095af8 bcachefs: Improvements to the journal read error paths

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
