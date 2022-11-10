Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAD6364
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Nov 2022 00:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668040684; x=1699576684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RTUbOD88Vq65PtwehrJC/ka0isxDjpc9nFOIqck7rSk=;
  b=Gm4EFUEOrUuH8IpYqW8rIQWnjaI5BM+kySJmsiJ07zOY5TYQUYy9zq61
   Y4AP+JYcN5Cn+gyG1omM/RWZFagxOdVP/gN+UX1v2fhGpJE3XpT3Udm2W
   3K8jPIP+p6LdC8TRiuOZoOxWAHf69853zsJAaIUJrDSqdzYZS9d8bBOo2
   47UK4h3MsU2ROxIkIP5NIUqBSycchCID8nxDqtFbgLfI2Wz68g67S5kg5
   ISTssDTRYgKqt6pX4Eb4Ff+uN46ciDbcfxWYwZDOEva37lhoiDnbXJWNy
   02TdFNaZqFJ+T+SNeEYV3mbqe0gBTrZAaY1NK8AzM1N+l/5WEvhIHY5I7
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="291560364"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; 
   d="scan'208";a="291560364"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2022 16:38:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="614892662"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; 
   d="scan'208";a="614892662"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Nov 2022 16:38:02 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1osvZx-0002Gi-31;
	Thu, 10 Nov 2022 00:38:01 +0000
Date: Thu, 10 Nov 2022 08:37:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/maple_tree.c:1882:21: warning: Array index 'split' is used
 before limits check. [arrayIndexThenCheck]
Message-ID: <202211100828.cFzURbPf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/maple_tree.c:1882:21: warning: Array index 'split' is used before limits check. [arrayIndexThenCheck]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Matthew Wilcox (Oracle)" <willy@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f67dd6ce0723ad013395f20a3f79d8a437d3f455
commit: 54a611b605901c7d5d05b6b8f5d04a6ceb0962aa Maple Tree: add new data structure
date:   6 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 weeks ago
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 54a611b605901c7d5d05b6b8f5d04a6ceb0962aa
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   lib/maple_tree.c:332:2: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
    node = (void *)((unsigned long)node & ~MAPLE_ENODE_NULL);
    ^
   lib/maple_tree.c:337:2: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
    node = (void *)((unsigned long)node | MAPLE_ENODE_NULL);
    ^
>> lib/maple_tree.c:1882:21: warning: Array index 'split' is used before limits check. [arrayIndexThenCheck]
     while (((bn->pivot[split] - min) < slot_count - 1) &&
                       ^
>> lib/maple_tree.c:4336:23: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
     if (!!wr_mas->entry ^ !!wr_mas->content)
                         ^
>> lib/maple_tree.c:4285:15: warning: The if condition is the same as the previous if condition [duplicateCondition]
     if (new_end < node_pivots)
                 ^
   lib/maple_tree.c:4282:15: note: First condition
     if (new_end < node_pivots)
                 ^
   lib/maple_tree.c:4285:15: note: Second condition
     if (new_end < node_pivots)
                 ^
>> lib/maple_tree.c:2437:8: warning: Redundant initialization for 'r_tmp'. The initialized value is overwritten before it is read. [redundantInitialization]
    r_tmp = *mast->orig_r;
          ^
   lib/maple_tree.c:2431:24: note: r_tmp is initialized
    struct ma_state r_tmp = *mast->orig_r;
                          ^
   lib/maple_tree.c:2437:8: note: r_tmp is overwritten
    r_tmp = *mast->orig_r;
          ^
>> lib/maple_tree.c:2438:8: warning: Redundant initialization for 'l_tmp'. The initialized value is overwritten before it is read. [redundantInitialization]
    l_tmp = *mast->orig_l;
          ^
   lib/maple_tree.c:2432:24: note: l_tmp is initialized
    struct ma_state l_tmp = *mast->orig_l;
                          ^
   lib/maple_tree.c:2438:8: note: l_tmp is overwritten
    l_tmp = *mast->orig_l;
          ^
>> lib/maple_tree.c:2333:22: warning: Found suspicious operator ',', result is not used. [constStatement]
    void __rcu **l_slots, **r_slots;
                        ^
   lib/maple_tree.c:3171:22: warning: Found suspicious operator ',', result is not used. [constStatement]
    void __rcu **l_slots, **slots;
                        ^
>> lib/maple_tree.c:700:59: warning: Parameter 'pivots' can be declared as pointer to const [constParameter]
   mas_safe_pivot(const struct ma_state *mas, unsigned long *pivots,
                                                             ^
   lib/maple_tree.c:718:51: warning: Parameter 'pivots' can be declared as pointer to const [constParameter]
   mas_safe_min(struct ma_state *mas, unsigned long *pivots, unsigned char offset)
                                                     ^
   lib/maple_tree.c:1396:21: warning: Parameter 'pivots' can be declared as pointer to const [constParameter]
        unsigned long *pivots,
                       ^
>> lib/maple_tree.c:1534:52: warning: Parameter 'gaps' can be declared as pointer to const [constParameter]
   ma_max_gap(struct maple_node *node, unsigned long *gaps, enum maple_type mt,
                                                      ^
   lib/maple_tree.c:1965:43: warning: Parameter 'pivots' can be declared as pointer to const [constParameter]
     struct maple_node *node, unsigned long *pivots,
                                             ^
>> lib/maple_tree.c:2044:55: warning: Parameter 'mas' can be declared as pointer to const [constParameter]
   static inline void mas_descend_adopt(struct ma_state *mas)
                                                         ^
>> lib/maple_tree.c:3219:11: warning: Size of pointer 'pivs' used instead of size of its data. [pointerSize]
      memset(pivs + tmp, 0,
             ^

vim +/split +1882 lib/maple_tree.c

54a611b605901c Liam R. Howlett 2022-09-06  1827  
54a611b605901c Liam R. Howlett 2022-09-06  1828  /*
54a611b605901c Liam R. Howlett 2022-09-06  1829   * mab_calc_split() - Calculate the split location and if there needs to be two
54a611b605901c Liam R. Howlett 2022-09-06  1830   * splits.
54a611b605901c Liam R. Howlett 2022-09-06  1831   * @bn: The maple_big_node with the data
54a611b605901c Liam R. Howlett 2022-09-06  1832   * @mid_split: The second split, if required.  0 otherwise.
54a611b605901c Liam R. Howlett 2022-09-06  1833   *
54a611b605901c Liam R. Howlett 2022-09-06  1834   * Return: The first split location.  The middle split is set in @mid_split.
54a611b605901c Liam R. Howlett 2022-09-06  1835   */
54a611b605901c Liam R. Howlett 2022-09-06  1836  static inline int mab_calc_split(struct ma_state *mas,
54a611b605901c Liam R. Howlett 2022-09-06  1837  	 struct maple_big_node *bn, unsigned char *mid_split, unsigned long min)
54a611b605901c Liam R. Howlett 2022-09-06  1838  {
54a611b605901c Liam R. Howlett 2022-09-06  1839  	unsigned char b_end = bn->b_end;
54a611b605901c Liam R. Howlett 2022-09-06  1840  	int split = b_end / 2; /* Assume equal split. */
54a611b605901c Liam R. Howlett 2022-09-06  1841  	unsigned char slot_min, slot_count = mt_slots[bn->type];
54a611b605901c Liam R. Howlett 2022-09-06  1842  
54a611b605901c Liam R. Howlett 2022-09-06  1843  	/*
54a611b605901c Liam R. Howlett 2022-09-06  1844  	 * To support gap tracking, all NULL entries are kept together and a node cannot
54a611b605901c Liam R. Howlett 2022-09-06  1845  	 * end on a NULL entry, with the exception of the left-most leaf.  The
54a611b605901c Liam R. Howlett 2022-09-06  1846  	 * limitation means that the split of a node must be checked for this condition
54a611b605901c Liam R. Howlett 2022-09-06  1847  	 * and be able to put more data in one direction or the other.
54a611b605901c Liam R. Howlett 2022-09-06  1848  	 */
54a611b605901c Liam R. Howlett 2022-09-06  1849  	if (unlikely((mas->mas_flags & MA_STATE_BULK))) {
54a611b605901c Liam R. Howlett 2022-09-06  1850  		*mid_split = 0;
54a611b605901c Liam R. Howlett 2022-09-06  1851  		split = b_end - mt_min_slots[bn->type];
54a611b605901c Liam R. Howlett 2022-09-06  1852  
54a611b605901c Liam R. Howlett 2022-09-06  1853  		if (!ma_is_leaf(bn->type))
54a611b605901c Liam R. Howlett 2022-09-06  1854  			return split;
54a611b605901c Liam R. Howlett 2022-09-06  1855  
54a611b605901c Liam R. Howlett 2022-09-06  1856  		mas->mas_flags |= MA_STATE_REBALANCE;
54a611b605901c Liam R. Howlett 2022-09-06  1857  		if (!bn->slot[split])
54a611b605901c Liam R. Howlett 2022-09-06  1858  			split--;
54a611b605901c Liam R. Howlett 2022-09-06  1859  		return split;
54a611b605901c Liam R. Howlett 2022-09-06  1860  	}
54a611b605901c Liam R. Howlett 2022-09-06  1861  
54a611b605901c Liam R. Howlett 2022-09-06  1862  	/*
54a611b605901c Liam R. Howlett 2022-09-06  1863  	 * Although extremely rare, it is possible to enter what is known as the 3-way
54a611b605901c Liam R. Howlett 2022-09-06  1864  	 * split scenario.  The 3-way split comes about by means of a store of a range
54a611b605901c Liam R. Howlett 2022-09-06  1865  	 * that overwrites the end and beginning of two full nodes.  The result is a set
54a611b605901c Liam R. Howlett 2022-09-06  1866  	 * of entries that cannot be stored in 2 nodes.  Sometimes, these two nodes can
54a611b605901c Liam R. Howlett 2022-09-06  1867  	 * also be located in different parent nodes which are also full.  This can
54a611b605901c Liam R. Howlett 2022-09-06  1868  	 * carry upwards all the way to the root in the worst case.
54a611b605901c Liam R. Howlett 2022-09-06  1869  	 */
54a611b605901c Liam R. Howlett 2022-09-06  1870  	if (unlikely(mab_middle_node(bn, split, slot_count))) {
54a611b605901c Liam R. Howlett 2022-09-06  1871  		split = b_end / 3;
54a611b605901c Liam R. Howlett 2022-09-06  1872  		*mid_split = split * 2;
54a611b605901c Liam R. Howlett 2022-09-06  1873  	} else {
54a611b605901c Liam R. Howlett 2022-09-06  1874  		slot_min = mt_min_slots[bn->type];
54a611b605901c Liam R. Howlett 2022-09-06  1875  
54a611b605901c Liam R. Howlett 2022-09-06  1876  		*mid_split = 0;
54a611b605901c Liam R. Howlett 2022-09-06  1877  		/*
54a611b605901c Liam R. Howlett 2022-09-06  1878  		 * Avoid having a range less than the slot count unless it
54a611b605901c Liam R. Howlett 2022-09-06  1879  		 * causes one node to be deficient.
54a611b605901c Liam R. Howlett 2022-09-06  1880  		 * NOTE: mt_min_slots is 1 based, b_end and split are zero.
54a611b605901c Liam R. Howlett 2022-09-06  1881  		 */
54a611b605901c Liam R. Howlett 2022-09-06 @1882  		while (((bn->pivot[split] - min) < slot_count - 1) &&
54a611b605901c Liam R. Howlett 2022-09-06  1883  		       (split < slot_count - 1) && (b_end - split > slot_min))
54a611b605901c Liam R. Howlett 2022-09-06  1884  			split++;
54a611b605901c Liam R. Howlett 2022-09-06  1885  	}
54a611b605901c Liam R. Howlett 2022-09-06  1886  
54a611b605901c Liam R. Howlett 2022-09-06  1887  	/* Avoid ending a node on a NULL entry */
54a611b605901c Liam R. Howlett 2022-09-06  1888  	split = mab_no_null_split(bn, split, slot_count);
54a611b605901c Liam R. Howlett 2022-09-06  1889  	if (!(*mid_split))
54a611b605901c Liam R. Howlett 2022-09-06  1890  		return split;
54a611b605901c Liam R. Howlett 2022-09-06  1891  
54a611b605901c Liam R. Howlett 2022-09-06  1892  	*mid_split = mab_no_null_split(bn, *mid_split, slot_count);
54a611b605901c Liam R. Howlett 2022-09-06  1893  
54a611b605901c Liam R. Howlett 2022-09-06  1894  	return split;
54a611b605901c Liam R. Howlett 2022-09-06  1895  }
54a611b605901c Liam R. Howlett 2022-09-06  1896  
54a611b605901c Liam R. Howlett 2022-09-06  1897  /*
54a611b605901c Liam R. Howlett 2022-09-06  1898   * mas_mab_cp() - Copy data from a maple state inclusively to a maple_big_node
54a611b605901c Liam R. Howlett 2022-09-06  1899   * and set @b_node->b_end to the next free slot.
54a611b605901c Liam R. Howlett 2022-09-06  1900   * @mas: The maple state
54a611b605901c Liam R. Howlett 2022-09-06  1901   * @mas_start: The starting slot to copy
54a611b605901c Liam R. Howlett 2022-09-06  1902   * @mas_end: The end slot to copy (inclusively)
54a611b605901c Liam R. Howlett 2022-09-06  1903   * @b_node: The maple_big_node to place the data
54a611b605901c Liam R. Howlett 2022-09-06  1904   * @mab_start: The starting location in maple_big_node to store the data.
54a611b605901c Liam R. Howlett 2022-09-06  1905   */
54a611b605901c Liam R. Howlett 2022-09-06  1906  static inline void mas_mab_cp(struct ma_state *mas, unsigned char mas_start,
54a611b605901c Liam R. Howlett 2022-09-06  1907  			unsigned char mas_end, struct maple_big_node *b_node,
54a611b605901c Liam R. Howlett 2022-09-06  1908  			unsigned char mab_start)
54a611b605901c Liam R. Howlett 2022-09-06  1909  {
54a611b605901c Liam R. Howlett 2022-09-06  1910  	enum maple_type mt;
54a611b605901c Liam R. Howlett 2022-09-06  1911  	struct maple_node *node;
54a611b605901c Liam R. Howlett 2022-09-06  1912  	void __rcu **slots;
54a611b605901c Liam R. Howlett 2022-09-06  1913  	unsigned long *pivots, *gaps;
54a611b605901c Liam R. Howlett 2022-09-06  1914  	int i = mas_start, j = mab_start;
54a611b605901c Liam R. Howlett 2022-09-06  1915  	unsigned char piv_end;
54a611b605901c Liam R. Howlett 2022-09-06  1916  
54a611b605901c Liam R. Howlett 2022-09-06  1917  	node = mas_mn(mas);
54a611b605901c Liam R. Howlett 2022-09-06  1918  	mt = mte_node_type(mas->node);
54a611b605901c Liam R. Howlett 2022-09-06  1919  	pivots = ma_pivots(node, mt);
54a611b605901c Liam R. Howlett 2022-09-06  1920  	if (!i) {
54a611b605901c Liam R. Howlett 2022-09-06  1921  		b_node->pivot[j] = pivots[i++];
54a611b605901c Liam R. Howlett 2022-09-06  1922  		if (unlikely(i > mas_end))
54a611b605901c Liam R. Howlett 2022-09-06  1923  			goto complete;
54a611b605901c Liam R. Howlett 2022-09-06  1924  		j++;
54a611b605901c Liam R. Howlett 2022-09-06  1925  	}
54a611b605901c Liam R. Howlett 2022-09-06  1926  
54a611b605901c Liam R. Howlett 2022-09-06  1927  	piv_end = min(mas_end, mt_pivots[mt]);
54a611b605901c Liam R. Howlett 2022-09-06  1928  	for (; i < piv_end; i++, j++) {
54a611b605901c Liam R. Howlett 2022-09-06  1929  		b_node->pivot[j] = pivots[i];
54a611b605901c Liam R. Howlett 2022-09-06  1930  		if (unlikely(!b_node->pivot[j]))
54a611b605901c Liam R. Howlett 2022-09-06  1931  			break;
54a611b605901c Liam R. Howlett 2022-09-06  1932  
54a611b605901c Liam R. Howlett 2022-09-06  1933  		if (unlikely(mas->max == b_node->pivot[j]))
54a611b605901c Liam R. Howlett 2022-09-06  1934  			goto complete;
54a611b605901c Liam R. Howlett 2022-09-06  1935  	}
54a611b605901c Liam R. Howlett 2022-09-06  1936  
54a611b605901c Liam R. Howlett 2022-09-06  1937  	if (likely(i <= mas_end))
54a611b605901c Liam R. Howlett 2022-09-06  1938  		b_node->pivot[j] = mas_safe_pivot(mas, pivots, i, mt);
54a611b605901c Liam R. Howlett 2022-09-06  1939  
54a611b605901c Liam R. Howlett 2022-09-06  1940  complete:
54a611b605901c Liam R. Howlett 2022-09-06  1941  	b_node->b_end = ++j;
54a611b605901c Liam R. Howlett 2022-09-06  1942  	j -= mab_start;
54a611b605901c Liam R. Howlett 2022-09-06  1943  	slots = ma_slots(node, mt);
54a611b605901c Liam R. Howlett 2022-09-06  1944  	memcpy(b_node->slot + mab_start, slots + mas_start, sizeof(void *) * j);
54a611b605901c Liam R. Howlett 2022-09-06  1945  	if (!ma_is_leaf(mt) && mt_is_alloc(mas->tree)) {
54a611b605901c Liam R. Howlett 2022-09-06  1946  		gaps = ma_gaps(node, mt);
54a611b605901c Liam R. Howlett 2022-09-06  1947  		memcpy(b_node->gap + mab_start, gaps + mas_start,
54a611b605901c Liam R. Howlett 2022-09-06  1948  		       sizeof(unsigned long) * j);
54a611b605901c Liam R. Howlett 2022-09-06  1949  	}
54a611b605901c Liam R. Howlett 2022-09-06  1950  }
54a611b605901c Liam R. Howlett 2022-09-06  1951  
54a611b605901c Liam R. Howlett 2022-09-06  1952  /*
54a611b605901c Liam R. Howlett 2022-09-06  1953   * mas_leaf_set_meta() - Set the metadata of a leaf if possible.
54a611b605901c Liam R. Howlett 2022-09-06  1954   * @mas: The maple state
54a611b605901c Liam R. Howlett 2022-09-06  1955   * @node: The maple node
54a611b605901c Liam R. Howlett 2022-09-06  1956   * @pivots: pointer to the maple node pivots
54a611b605901c Liam R. Howlett 2022-09-06  1957   * @mt: The maple type
54a611b605901c Liam R. Howlett 2022-09-06  1958   * @end: The assumed end
54a611b605901c Liam R. Howlett 2022-09-06  1959   *
54a611b605901c Liam R. Howlett 2022-09-06  1960   * Note, end may be incremented within this function but not modified at the
54a611b605901c Liam R. Howlett 2022-09-06  1961   * source.  This is fine since the metadata is the last thing to be stored in a
54a611b605901c Liam R. Howlett 2022-09-06  1962   * node during a write.
54a611b605901c Liam R. Howlett 2022-09-06  1963   */
54a611b605901c Liam R. Howlett 2022-09-06  1964  static inline void mas_leaf_set_meta(struct ma_state *mas,
54a611b605901c Liam R. Howlett 2022-09-06  1965  		struct maple_node *node, unsigned long *pivots,
54a611b605901c Liam R. Howlett 2022-09-06  1966  		enum maple_type mt, unsigned char end)
54a611b605901c Liam R. Howlett 2022-09-06  1967  {
54a611b605901c Liam R. Howlett 2022-09-06  1968  	/* There is no room for metadata already */
54a611b605901c Liam R. Howlett 2022-09-06  1969  	if (mt_pivots[mt] <= end)
54a611b605901c Liam R. Howlett 2022-09-06  1970  		return;
54a611b605901c Liam R. Howlett 2022-09-06  1971  
54a611b605901c Liam R. Howlett 2022-09-06  1972  	if (pivots[end] && pivots[end] < mas->max)
54a611b605901c Liam R. Howlett 2022-09-06  1973  		end++;
54a611b605901c Liam R. Howlett 2022-09-06  1974  
54a611b605901c Liam R. Howlett 2022-09-06  1975  	if (end < mt_slots[mt] - 1)
54a611b605901c Liam R. Howlett 2022-09-06  1976  		ma_set_meta(node, mt, 0, end);
54a611b605901c Liam R. Howlett 2022-09-06  1977  }
54a611b605901c Liam R. Howlett 2022-09-06  1978  
54a611b605901c Liam R. Howlett 2022-09-06  1979  /*
54a611b605901c Liam R. Howlett 2022-09-06  1980   * mab_mas_cp() - Copy data from maple_big_node to a maple encoded node.
54a611b605901c Liam R. Howlett 2022-09-06  1981   * @b_node: the maple_big_node that has the data
54a611b605901c Liam R. Howlett 2022-09-06  1982   * @mab_start: the start location in @b_node.
54a611b605901c Liam R. Howlett 2022-09-06  1983   * @mab_end: The end location in @b_node (inclusively)
54a611b605901c Liam R. Howlett 2022-09-06  1984   * @mas: The maple state with the maple encoded node.
54a611b605901c Liam R. Howlett 2022-09-06  1985   */
54a611b605901c Liam R. Howlett 2022-09-06  1986  static inline void mab_mas_cp(struct maple_big_node *b_node,
54a611b605901c Liam R. Howlett 2022-09-06  1987  			      unsigned char mab_start, unsigned char mab_end,
54a611b605901c Liam R. Howlett 2022-09-06  1988  			      struct ma_state *mas, bool new_max)
54a611b605901c Liam R. Howlett 2022-09-06  1989  {
54a611b605901c Liam R. Howlett 2022-09-06  1990  	int i, j = 0;
54a611b605901c Liam R. Howlett 2022-09-06  1991  	enum maple_type mt = mte_node_type(mas->node);
54a611b605901c Liam R. Howlett 2022-09-06  1992  	struct maple_node *node = mte_to_node(mas->node);
54a611b605901c Liam R. Howlett 2022-09-06  1993  	void __rcu **slots = ma_slots(node, mt);
54a611b605901c Liam R. Howlett 2022-09-06  1994  	unsigned long *pivots = ma_pivots(node, mt);
54a611b605901c Liam R. Howlett 2022-09-06  1995  	unsigned long *gaps = NULL;
54a611b605901c Liam R. Howlett 2022-09-06  1996  	unsigned char end;
54a611b605901c Liam R. Howlett 2022-09-06  1997  
54a611b605901c Liam R. Howlett 2022-09-06  1998  	if (mab_end - mab_start > mt_pivots[mt])
54a611b605901c Liam R. Howlett 2022-09-06  1999  		mab_end--;
54a611b605901c Liam R. Howlett 2022-09-06  2000  
54a611b605901c Liam R. Howlett 2022-09-06  2001  	if (!pivots[mt_pivots[mt] - 1])
54a611b605901c Liam R. Howlett 2022-09-06  2002  		slots[mt_pivots[mt]] = NULL;
54a611b605901c Liam R. Howlett 2022-09-06  2003  
54a611b605901c Liam R. Howlett 2022-09-06  2004  	i = mab_start;
54a611b605901c Liam R. Howlett 2022-09-06  2005  	do {
54a611b605901c Liam R. Howlett 2022-09-06  2006  		pivots[j++] = b_node->pivot[i++];
54a611b605901c Liam R. Howlett 2022-09-06  2007  	} while (i <= mab_end && likely(b_node->pivot[i]));
54a611b605901c Liam R. Howlett 2022-09-06  2008  
54a611b605901c Liam R. Howlett 2022-09-06  2009  	memcpy(slots, b_node->slot + mab_start,
54a611b605901c Liam R. Howlett 2022-09-06  2010  	       sizeof(void *) * (i - mab_start));
54a611b605901c Liam R. Howlett 2022-09-06  2011  
54a611b605901c Liam R. Howlett 2022-09-06  2012  	if (new_max)
54a611b605901c Liam R. Howlett 2022-09-06  2013  		mas->max = b_node->pivot[i - 1];
54a611b605901c Liam R. Howlett 2022-09-06  2014  
54a611b605901c Liam R. Howlett 2022-09-06  2015  	end = j - 1;
54a611b605901c Liam R. Howlett 2022-09-06  2016  	if (likely(!ma_is_leaf(mt) && mt_is_alloc(mas->tree))) {
54a611b605901c Liam R. Howlett 2022-09-06  2017  		unsigned long max_gap = 0;
54a611b605901c Liam R. Howlett 2022-09-06  2018  		unsigned char offset = 15;
54a611b605901c Liam R. Howlett 2022-09-06  2019  
54a611b605901c Liam R. Howlett 2022-09-06  2020  		gaps = ma_gaps(node, mt);
54a611b605901c Liam R. Howlett 2022-09-06  2021  		do {
54a611b605901c Liam R. Howlett 2022-09-06  2022  			gaps[--j] = b_node->gap[--i];
54a611b605901c Liam R. Howlett 2022-09-06  2023  			if (gaps[j] > max_gap) {
54a611b605901c Liam R. Howlett 2022-09-06  2024  				offset = j;
54a611b605901c Liam R. Howlett 2022-09-06  2025  				max_gap = gaps[j];
54a611b605901c Liam R. Howlett 2022-09-06  2026  			}
54a611b605901c Liam R. Howlett 2022-09-06  2027  		} while (j);
54a611b605901c Liam R. Howlett 2022-09-06  2028  
54a611b605901c Liam R. Howlett 2022-09-06  2029  		ma_set_meta(node, mt, offset, end);
54a611b605901c Liam R. Howlett 2022-09-06  2030  	} else {
54a611b605901c Liam R. Howlett 2022-09-06  2031  		mas_leaf_set_meta(mas, node, pivots, mt, end);
54a611b605901c Liam R. Howlett 2022-09-06  2032  	}
54a611b605901c Liam R. Howlett 2022-09-06  2033  }
54a611b605901c Liam R. Howlett 2022-09-06  2034  
54a611b605901c Liam R. Howlett 2022-09-06  2035  /*
54a611b605901c Liam R. Howlett 2022-09-06  2036   * mas_descend_adopt() - Descend through a sub-tree and adopt children.
54a611b605901c Liam R. Howlett 2022-09-06  2037   * @mas: the maple state with the maple encoded node of the sub-tree.
54a611b605901c Liam R. Howlett 2022-09-06  2038   *
54a611b605901c Liam R. Howlett 2022-09-06  2039   * Descend through a sub-tree and adopt children who do not have the correct
54a611b605901c Liam R. Howlett 2022-09-06  2040   * parents set.  Follow the parents which have the correct parents as they are
54a611b605901c Liam R. Howlett 2022-09-06  2041   * the new entries which need to be followed to find other incorrectly set
54a611b605901c Liam R. Howlett 2022-09-06  2042   * parents.
54a611b605901c Liam R. Howlett 2022-09-06  2043   */
54a611b605901c Liam R. Howlett 2022-09-06 @2044  static inline void mas_descend_adopt(struct ma_state *mas)
54a611b605901c Liam R. Howlett 2022-09-06  2045  {
54a611b605901c Liam R. Howlett 2022-09-06  2046  	struct ma_state list[3], next[3];
54a611b605901c Liam R. Howlett 2022-09-06  2047  	int i, n;
54a611b605901c Liam R. Howlett 2022-09-06  2048  
54a611b605901c Liam R. Howlett 2022-09-06  2049  	/*
54a611b605901c Liam R. Howlett 2022-09-06  2050  	 * At each level there may be up to 3 correct parent pointers which indicates
54a611b605901c Liam R. Howlett 2022-09-06  2051  	 * the new nodes which need to be walked to find any new nodes at a lower level.
54a611b605901c Liam R. Howlett 2022-09-06  2052  	 */
54a611b605901c Liam R. Howlett 2022-09-06  2053  
54a611b605901c Liam R. Howlett 2022-09-06  2054  	for (i = 0; i < 3; i++) {
54a611b605901c Liam R. Howlett 2022-09-06  2055  		list[i] = *mas;
54a611b605901c Liam R. Howlett 2022-09-06  2056  		list[i].offset = 0;
54a611b605901c Liam R. Howlett 2022-09-06  2057  		next[i].offset = 0;
54a611b605901c Liam R. Howlett 2022-09-06  2058  	}
54a611b605901c Liam R. Howlett 2022-09-06  2059  	next[0] = *mas;
54a611b605901c Liam R. Howlett 2022-09-06  2060  
54a611b605901c Liam R. Howlett 2022-09-06  2061  	while (!mte_is_leaf(list[0].node)) {
54a611b605901c Liam R. Howlett 2022-09-06  2062  		n = 0;
54a611b605901c Liam R. Howlett 2022-09-06  2063  		for (i = 0; i < 3; i++) {
54a611b605901c Liam R. Howlett 2022-09-06  2064  			if (mas_is_none(&list[i]))
54a611b605901c Liam R. Howlett 2022-09-06  2065  				continue;
54a611b605901c Liam R. Howlett 2022-09-06  2066  
54a611b605901c Liam R. Howlett 2022-09-06  2067  			if (i && list[i-1].node == list[i].node)
54a611b605901c Liam R. Howlett 2022-09-06  2068  				continue;
54a611b605901c Liam R. Howlett 2022-09-06  2069  
54a611b605901c Liam R. Howlett 2022-09-06  2070  			while ((n < 3) && (mas_new_child(&list[i], &next[n])))
54a611b605901c Liam R. Howlett 2022-09-06  2071  				n++;
54a611b605901c Liam R. Howlett 2022-09-06  2072  
54a611b605901c Liam R. Howlett 2022-09-06  2073  			mas_adopt_children(&list[i], list[i].node);
54a611b605901c Liam R. Howlett 2022-09-06  2074  		}
54a611b605901c Liam R. Howlett 2022-09-06  2075  
54a611b605901c Liam R. Howlett 2022-09-06  2076  		while (n < 3)
54a611b605901c Liam R. Howlett 2022-09-06  2077  			next[n++].node = MAS_NONE;
54a611b605901c Liam R. Howlett 2022-09-06  2078  
54a611b605901c Liam R. Howlett 2022-09-06  2079  		/* descend by setting the list to the children */
54a611b605901c Liam R. Howlett 2022-09-06  2080  		for (i = 0; i < 3; i++)
54a611b605901c Liam R. Howlett 2022-09-06  2081  			list[i] = next[i];
54a611b605901c Liam R. Howlett 2022-09-06  2082  	}
54a611b605901c Liam R. Howlett 2022-09-06  2083  }
54a611b605901c Liam R. Howlett 2022-09-06  2084  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
