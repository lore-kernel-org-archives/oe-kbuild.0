Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA37BCA66
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Sep 2023 23:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695513315; x=1727049315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IHE2v794KEEXjpQhgdE/MJC5uWg5nL9Zc0C2FNFMPfk=;
  b=WSD/94nZY0Dj0dKbwliYhB6TL4afOaVKpS6QS0Lzs3NCyBGmmTfVR+Lp
   HKx3NxplQMa2ZLwlhPnpWdU2hd1OHOiK3g1c8/VbB6Bg/y8vgNYJ7KGtp
   SEHGzeiSDoEsnL3TJQPF2zoabSw3KFWjVljzLgd9wyr4RFGhwjmxAfd0O
   REv9YaLOZq/RnlVw3XXb4xJL96bpd7KOzQLblLehKEG2JfTDkV9vX6sIA
   SP+h5M50iZo3eYcev+1cMkDDuTphw0PMa1AT+E10mKUVbVn2uqCvBFLU+
   xfpoJ6ktparzK5MKoS8fuj91qNzJ8MMQtg6qTc6RdZ2p1uUW9KUgzoZyB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="380974216"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="380974216"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 16:55:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="921577014"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="921577014"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 23 Sep 2023 16:55:13 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkCSs-00030f-30;
	Sat, 23 Sep 2023 23:55:10 +0000
Date: Sun, 24 Sep 2023 07:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1536/6975] fs/bcachefs/journal.h:158:9: sparse:
 sparse: invalid access past the end of 'new' (4 8)
Message-ID: <202309240726.Qp8fscGl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/bcachefs/journal.h:158:9: sparse: sparse: invalid access past the end of 'new' (4 8)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   940fcc189c51032dd0282cbee4497542c982ac59
commit: e0750d9473522d076b33ee257a21e27a5dd75031 [1536/6975] bcachefs: Initial commit
:::::: branch date: 3 days ago
:::::: commit date: 12 days ago
config: i386-randconfig-062-20230924 (https://download.01.org/0day-ci/archive/20230924/202309240726.Qp8fscGl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309240726.Qp8fscGl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309240726.Qp8fscGl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/journal.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:1022:42: sparse: sparse: array of flexible structures
   fs/bcachefs/journal.c: note: in included file:
>> fs/bcachefs/journal.h:158:9: sparse: sparse: invalid access past the end of 'new' (4 8)
>> fs/bcachefs/journal.h:152:43: sparse: sparse: invalid access past the end of 's' (4 8)
>> fs/bcachefs/journal.h:237:58: sparse: sparse: invalid access past the end of '<noident>' (4 8)
>> fs/bcachefs/journal.h:152:43: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.c:150:9: sparse: sparse: context imbalance in 'journal_buf_switch' - unexpected unlock
   fs/bcachefs/journal.c:271:13: sparse: sparse: context imbalance in 'journal_flush_write' - wrong count at exit
>> fs/bcachefs/journal.h:158:9: sparse: sparse: invalid access past the end of 'new' (4 8)
>> fs/bcachefs/journal.h:158:9: sparse: sparse: invalid access past the end of 'new' (4 8)
   fs/bcachefs/journal.c:329:35: sparse: sparse: context imbalance in '__journal_res_get' - different lock contexts for basic block
   fs/bcachefs/journal.c:509:6: sparse: sparse: context imbalance in 'bch2_journal_flush_seq_async' - different lock contexts for basic block
   fs/bcachefs/journal.c:570:12: sparse: sparse: context imbalance in 'journal_seq_flushed' - different lock contexts for basic block
>> fs/bcachefs/journal.h:158:9: sparse: sparse: invalid access past the end of 'new' (4 8)
>> fs/bcachefs/journal.h:237:58: sparse: sparse: invalid access past the end of '<noident>' (4 8)
>> fs/bcachefs/journal.h:152:43: sparse: sparse: invalid access past the end of 's' (4 8)
>> fs/bcachefs/journal.h:158:9: sparse: sparse: invalid access past the end of 'new' (4 8)
>> fs/bcachefs/journal.h:237:58: sparse: sparse: invalid access past the end of '<noident>' (4 8)
>> fs/bcachefs/journal.h:152:43: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.c:797:17: sparse: sparse: context imbalance in '__bch2_set_nr_journal_buckets' - different lock contexts for basic block
>> fs/bcachefs/journal.h:152:43: sparse: sparse: invalid access past the end of 's' (4 8)
--
   fs/bcachefs/rebalance.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:1022:42: sparse: sparse: array of flexible structures
   fs/bcachefs/rebalance.c: note: in included file (through fs/bcachefs/super.h, fs/bcachefs/buckets.h):
   fs/bcachefs/extents.h:287:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:287:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:287:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:301:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:301:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:301:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:287:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:287:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:287:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:301:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:301:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:301:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:287:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:287:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:287:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:301:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:301:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:301:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:287:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:287:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:287:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:301:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:301:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:301:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/rebalance.c: note: in included file (through arch/x86/include/asm/atomic.h, include/linux/atomic.h, include/linux/cpumask.h, ...):
>> arch/x86/include/asm/atomic64_32.h:85:34: sparse: sparse: cast truncates bits from constant value (7fffffffffffffff becomes ffffffff)
--
   fs/bcachefs/btree_update_leaf.c: note: in included file (through fs/bcachefs/btree_update.h):
>> fs/bcachefs/journal.h:158:9: sparse: sparse: invalid access past the end of 'new' (4 8)
>> fs/bcachefs/journal.h:237:58: sparse: sparse: invalid access past the end of '<noident>' (4 8)
>> fs/bcachefs/journal.h:152:43: sparse: sparse: invalid access past the end of 's' (4 8)

vim +/new +158 fs/bcachefs/journal.h

e0750d9473522d Kent Overstreet 2017-03-16  149  
e0750d9473522d Kent Overstreet 2017-03-16  150  static inline int journal_state_count(union journal_res_state s, int idx)
e0750d9473522d Kent Overstreet 2017-03-16  151  {
e0750d9473522d Kent Overstreet 2017-03-16 @152  	return idx == 0 ? s.buf0_count : s.buf1_count;
e0750d9473522d Kent Overstreet 2017-03-16  153  }
e0750d9473522d Kent Overstreet 2017-03-16  154  
e0750d9473522d Kent Overstreet 2017-03-16  155  static inline void journal_state_inc(union journal_res_state *s)
e0750d9473522d Kent Overstreet 2017-03-16  156  {
e0750d9473522d Kent Overstreet 2017-03-16  157  	s->buf0_count += s->idx == 0;
e0750d9473522d Kent Overstreet 2017-03-16 @158  	s->buf1_count += s->idx == 1;
e0750d9473522d Kent Overstreet 2017-03-16  159  }
e0750d9473522d Kent Overstreet 2017-03-16  160  
e0750d9473522d Kent Overstreet 2017-03-16  161  static inline void bch2_journal_set_has_inode(struct journal *j,
e0750d9473522d Kent Overstreet 2017-03-16  162  					      struct journal_res *res,
e0750d9473522d Kent Overstreet 2017-03-16  163  					      u64 inum)
e0750d9473522d Kent Overstreet 2017-03-16  164  {
e0750d9473522d Kent Overstreet 2017-03-16  165  	struct journal_buf *buf = &j->buf[res->idx];
e0750d9473522d Kent Overstreet 2017-03-16  166  	unsigned long bit = hash_64(inum, ilog2(sizeof(buf->has_inode) * 8));
e0750d9473522d Kent Overstreet 2017-03-16  167  
e0750d9473522d Kent Overstreet 2017-03-16  168  	/* avoid atomic op if possible */
e0750d9473522d Kent Overstreet 2017-03-16  169  	if (unlikely(!test_bit(bit, buf->has_inode)))
e0750d9473522d Kent Overstreet 2017-03-16  170  		set_bit(bit, buf->has_inode);
e0750d9473522d Kent Overstreet 2017-03-16  171  }
e0750d9473522d Kent Overstreet 2017-03-16  172  
e0750d9473522d Kent Overstreet 2017-03-16  173  /*
e0750d9473522d Kent Overstreet 2017-03-16  174   * Amount of space that will be taken up by some keys in the journal (i.e.
e0750d9473522d Kent Overstreet 2017-03-16  175   * including the jset header)
e0750d9473522d Kent Overstreet 2017-03-16  176   */
e0750d9473522d Kent Overstreet 2017-03-16  177  static inline unsigned jset_u64s(unsigned u64s)
e0750d9473522d Kent Overstreet 2017-03-16  178  {
e0750d9473522d Kent Overstreet 2017-03-16  179  	return u64s + sizeof(struct jset_entry) / sizeof(u64);
e0750d9473522d Kent Overstreet 2017-03-16  180  }
e0750d9473522d Kent Overstreet 2017-03-16  181  
e0750d9473522d Kent Overstreet 2017-03-16  182  static inline struct jset_entry *
e0750d9473522d Kent Overstreet 2017-03-16  183  bch2_journal_add_entry_noreservation(struct journal_buf *buf, size_t u64s)
e0750d9473522d Kent Overstreet 2017-03-16  184  {
e0750d9473522d Kent Overstreet 2017-03-16  185  	struct jset *jset = buf->data;
e0750d9473522d Kent Overstreet 2017-03-16  186  	struct jset_entry *entry = vstruct_idx(jset, le32_to_cpu(jset->u64s));
e0750d9473522d Kent Overstreet 2017-03-16  187  
e0750d9473522d Kent Overstreet 2017-03-16  188  	memset(entry, 0, sizeof(*entry));
e0750d9473522d Kent Overstreet 2017-03-16  189  	entry->u64s = cpu_to_le16(u64s);
e0750d9473522d Kent Overstreet 2017-03-16  190  
e0750d9473522d Kent Overstreet 2017-03-16  191  	le32_add_cpu(&jset->u64s, jset_u64s(u64s));
e0750d9473522d Kent Overstreet 2017-03-16  192  
e0750d9473522d Kent Overstreet 2017-03-16  193  	return entry;
e0750d9473522d Kent Overstreet 2017-03-16  194  }
e0750d9473522d Kent Overstreet 2017-03-16  195  
e0750d9473522d Kent Overstreet 2017-03-16  196  static inline void bch2_journal_add_entry(struct journal *j, struct journal_res *res,
e0750d9473522d Kent Overstreet 2017-03-16  197  					  unsigned type, enum btree_id id,
e0750d9473522d Kent Overstreet 2017-03-16  198  					  unsigned level,
e0750d9473522d Kent Overstreet 2017-03-16  199  					  const void *data, unsigned u64s)
e0750d9473522d Kent Overstreet 2017-03-16  200  {
e0750d9473522d Kent Overstreet 2017-03-16  201  	struct journal_buf *buf = &j->buf[res->idx];
e0750d9473522d Kent Overstreet 2017-03-16  202  	struct jset_entry *entry = vstruct_idx(buf->data, res->offset);
e0750d9473522d Kent Overstreet 2017-03-16  203  	unsigned actual = jset_u64s(u64s);
e0750d9473522d Kent Overstreet 2017-03-16  204  
e0750d9473522d Kent Overstreet 2017-03-16  205  	EBUG_ON(!res->ref);
e0750d9473522d Kent Overstreet 2017-03-16  206  	EBUG_ON(actual > res->u64s);
e0750d9473522d Kent Overstreet 2017-03-16  207  
e0750d9473522d Kent Overstreet 2017-03-16  208  	res->offset	+= actual;
e0750d9473522d Kent Overstreet 2017-03-16  209  	res->u64s	-= actual;
e0750d9473522d Kent Overstreet 2017-03-16  210  
e0750d9473522d Kent Overstreet 2017-03-16  211  	entry->u64s	= cpu_to_le16(u64s);
e0750d9473522d Kent Overstreet 2017-03-16  212  	entry->btree_id = id;
e0750d9473522d Kent Overstreet 2017-03-16  213  	entry->level	= level;
e0750d9473522d Kent Overstreet 2017-03-16  214  	entry->type	= type;
e0750d9473522d Kent Overstreet 2017-03-16  215  	entry->pad[0]	= 0;
e0750d9473522d Kent Overstreet 2017-03-16  216  	entry->pad[1]	= 0;
e0750d9473522d Kent Overstreet 2017-03-16  217  	entry->pad[2]	= 0;
e0750d9473522d Kent Overstreet 2017-03-16  218  	memcpy_u64s(entry->_data, data, u64s);
e0750d9473522d Kent Overstreet 2017-03-16  219  }
e0750d9473522d Kent Overstreet 2017-03-16  220  
e0750d9473522d Kent Overstreet 2017-03-16  221  static inline void bch2_journal_add_keys(struct journal *j, struct journal_res *res,
e0750d9473522d Kent Overstreet 2017-03-16  222  					enum btree_id id, const struct bkey_i *k)
e0750d9473522d Kent Overstreet 2017-03-16  223  {
e0750d9473522d Kent Overstreet 2017-03-16  224  	bch2_journal_add_entry(j, res, BCH_JSET_ENTRY_btree_keys,
e0750d9473522d Kent Overstreet 2017-03-16  225  			       id, 0, k, k->k.u64s);
e0750d9473522d Kent Overstreet 2017-03-16  226  }
e0750d9473522d Kent Overstreet 2017-03-16  227  
e0750d9473522d Kent Overstreet 2017-03-16  228  void bch2_journal_buf_put_slowpath(struct journal *, bool);
e0750d9473522d Kent Overstreet 2017-03-16  229  
e0750d9473522d Kent Overstreet 2017-03-16  230  static inline void bch2_journal_buf_put(struct journal *j, unsigned idx,
e0750d9473522d Kent Overstreet 2017-03-16  231  				       bool need_write_just_set)
e0750d9473522d Kent Overstreet 2017-03-16  232  {
e0750d9473522d Kent Overstreet 2017-03-16  233  	union journal_res_state s;
e0750d9473522d Kent Overstreet 2017-03-16  234  
e0750d9473522d Kent Overstreet 2017-03-16  235  	s.v = atomic64_sub_return(((union journal_res_state) {
e0750d9473522d Kent Overstreet 2017-03-16  236  				    .buf0_count = idx == 0,
e0750d9473522d Kent Overstreet 2017-03-16 @237  				    .buf1_count = idx == 1,
e0750d9473522d Kent Overstreet 2017-03-16  238  				    }).v, &j->reservations.counter);
e0750d9473522d Kent Overstreet 2017-03-16  239  
e0750d9473522d Kent Overstreet 2017-03-16  240  	EBUG_ON(s.idx != idx && !s.prev_buf_unwritten);
e0750d9473522d Kent Overstreet 2017-03-16  241  
e0750d9473522d Kent Overstreet 2017-03-16  242  	/*
e0750d9473522d Kent Overstreet 2017-03-16  243  	 * Do not initiate a journal write if the journal is in an error state
e0750d9473522d Kent Overstreet 2017-03-16  244  	 * (previous journal entry write may have failed)
e0750d9473522d Kent Overstreet 2017-03-16  245  	 */
e0750d9473522d Kent Overstreet 2017-03-16  246  	if (s.idx != idx &&
e0750d9473522d Kent Overstreet 2017-03-16  247  	    !journal_state_count(s, idx) &&
e0750d9473522d Kent Overstreet 2017-03-16  248  	    s.cur_entry_offset != JOURNAL_ENTRY_ERROR_VAL)
e0750d9473522d Kent Overstreet 2017-03-16  249  		bch2_journal_buf_put_slowpath(j, need_write_just_set);
e0750d9473522d Kent Overstreet 2017-03-16  250  }
e0750d9473522d Kent Overstreet 2017-03-16  251  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
