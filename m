Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C73FF9E1
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Dec 2023 16:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IpctFhfn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702312542; x=1733848542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/2gN2Tm/tYoK9t95S3jm0c8vdY0vCK7D1tuqU+qtLt0=;
  b=IpctFhfnFboBSWhMtXC+gBzCdLN2L+R4s+kynqbq7+TW79aNEPcKAgSw
   ZYQuJLOGBve2jFuvFXherVRB/lLV4DuYOO8zlmFhYcwgwCGIJaM4Spk+g
   RW1/eEcpUSDc3z/dPckPfoZl62CrMbVHuCaxZFoN5m94y9QYIhzXtREES
   CndIfO4ikFmJh4A+/MEh93ulYQkWiaTMq0xv1zR2AgKdfW3znjtOWL/BI
   iiER8p7BYDnDw2c+IAb630mOGi5SvOJ0e9KZ2KVgAx1ZbDoBi2ABLAKxF
   TAMcDDn7dM7HyzByrsqABe74YjzNRjvPct7hqqXTKMVrhGaEbGJ0c+6Q6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="425797976"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="425797976"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 08:35:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="776742307"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="776742307"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 11 Dec 2023 08:35:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCjFq-000IF8-0T;
	Mon, 11 Dec 2023 16:35:38 +0000
Date: Tue, 12 Dec 2023 00:35:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: arch/riscv/kernel/module.c:727:10-18: ERROR: reference preceded by
 free on line 726
Message-ID: <202312120044.wTI1Uyaa-lkp@intel.com>
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
TO: Charlie Jenkins <charlie@rivosinc.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a39b6ac3781d46ba18193c9dbb2110f31e9bffe9
commit: d8792a5734b0f3e58b898c2e2f910bfac48e9ee3 riscv: Safely remove entries from relocation list
date:   7 days ago
:::::: branch date: 18 hours ago
:::::: commit date: 7 days ago
config: riscv-randconfig-r053-20231211 (https://download.01.org/0day-ci/archive/20231212/202312120044.wTI1Uyaa-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231212/202312120044.wTI1Uyaa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312120044.wTI1Uyaa-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/module.c:727:10-18: ERROR: reference preceded by free on line 726
--
>> arch/riscv/kernel/module.c:763:11-17: ERROR: application of sizeof to pointer
--
>> arch/riscv/kernel/module.c:792:5-19: WARNING: Unsigned expression compared with zero: hashtable_bits     <     0

vim +727 arch/riscv/kernel/module.c

8fd6c5142395a1 Charlie Jenkins      2023-11-01  654  
d8792a5734b0f3 Charlie Jenkins      2023-11-27  655  static int add_relocation_to_accumulate(struct module *me, int type,
d8792a5734b0f3 Charlie Jenkins      2023-11-27  656  					void *location,
d8792a5734b0f3 Charlie Jenkins      2023-11-27  657  					unsigned int hashtable_bits, Elf_Addr v,
d8792a5734b0f3 Charlie Jenkins      2023-11-27  658  					struct hlist_head *relocation_hashtable,
d8792a5734b0f3 Charlie Jenkins      2023-11-27  659  					struct list_head *used_buckets_list)
8fd6c5142395a1 Charlie Jenkins      2023-11-01  660  {
8fd6c5142395a1 Charlie Jenkins      2023-11-01  661  	struct relocation_entry *entry;
8fd6c5142395a1 Charlie Jenkins      2023-11-01  662  	struct relocation_head *rel_head;
8fd6c5142395a1 Charlie Jenkins      2023-11-01  663  	struct hlist_head *current_head;
8fd6c5142395a1 Charlie Jenkins      2023-11-01  664  	struct used_bucket *bucket;
8fd6c5142395a1 Charlie Jenkins      2023-11-01  665  	unsigned long hash;
8fd6c5142395a1 Charlie Jenkins      2023-11-01  666  
8fd6c5142395a1 Charlie Jenkins      2023-11-01  667  	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
d8792a5734b0f3 Charlie Jenkins      2023-11-27  668  
d8792a5734b0f3 Charlie Jenkins      2023-11-27  669  	if (!entry)
d8792a5734b0f3 Charlie Jenkins      2023-11-27  670  		return -ENOMEM;
d8792a5734b0f3 Charlie Jenkins      2023-11-27  671  
8fd6c5142395a1 Charlie Jenkins      2023-11-01  672  	INIT_LIST_HEAD(&entry->head);
8fd6c5142395a1 Charlie Jenkins      2023-11-01  673  	entry->type = type;
8fd6c5142395a1 Charlie Jenkins      2023-11-01  674  	entry->value = v;
8fd6c5142395a1 Charlie Jenkins      2023-11-01  675  
8fd6c5142395a1 Charlie Jenkins      2023-11-01  676  	hash = hash_min((uintptr_t)location, hashtable_bits);
8fd6c5142395a1 Charlie Jenkins      2023-11-01  677  
8fd6c5142395a1 Charlie Jenkins      2023-11-01  678  	current_head = &relocation_hashtable[hash];
8fd6c5142395a1 Charlie Jenkins      2023-11-01  679  
d8792a5734b0f3 Charlie Jenkins      2023-11-27  680  	/*
d8792a5734b0f3 Charlie Jenkins      2023-11-27  681  	 * Search for the relocation_head for the relocations that happen at the
d8792a5734b0f3 Charlie Jenkins      2023-11-27  682  	 * provided location
d8792a5734b0f3 Charlie Jenkins      2023-11-27  683  	 */
8fd6c5142395a1 Charlie Jenkins      2023-11-01  684  	bool found = false;
8fd6c5142395a1 Charlie Jenkins      2023-11-01  685  	struct relocation_head *rel_head_iter;
8fd6c5142395a1 Charlie Jenkins      2023-11-01  686  
8fd6c5142395a1 Charlie Jenkins      2023-11-01  687  	hlist_for_each_entry(rel_head_iter, current_head, node) {
8fd6c5142395a1 Charlie Jenkins      2023-11-01  688  		if (rel_head_iter->location == location) {
8fd6c5142395a1 Charlie Jenkins      2023-11-01  689  			found = true;
8fd6c5142395a1 Charlie Jenkins      2023-11-01  690  			rel_head = rel_head_iter;
8fd6c5142395a1 Charlie Jenkins      2023-11-01  691  			break;
8fd6c5142395a1 Charlie Jenkins      2023-11-01  692  		}
8fd6c5142395a1 Charlie Jenkins      2023-11-01  693  	}
8fd6c5142395a1 Charlie Jenkins      2023-11-01  694  
d8792a5734b0f3 Charlie Jenkins      2023-11-27  695  	/*
d8792a5734b0f3 Charlie Jenkins      2023-11-27  696  	 * If there has not yet been any relocations at the provided location,
d8792a5734b0f3 Charlie Jenkins      2023-11-27  697  	 * create a relocation_head for that location and populate it with this
d8792a5734b0f3 Charlie Jenkins      2023-11-27  698  	 * relocation_entry.
d8792a5734b0f3 Charlie Jenkins      2023-11-27  699  	 */
8fd6c5142395a1 Charlie Jenkins      2023-11-01  700  	if (!found) {
8fd6c5142395a1 Charlie Jenkins      2023-11-01  701  		rel_head = kmalloc(sizeof(*rel_head), GFP_KERNEL);
d8792a5734b0f3 Charlie Jenkins      2023-11-27  702  
d8792a5734b0f3 Charlie Jenkins      2023-11-27  703  		if (!rel_head) {
d8792a5734b0f3 Charlie Jenkins      2023-11-27  704  			kfree(entry);
d8792a5734b0f3 Charlie Jenkins      2023-11-27  705  			return -ENOMEM;
d8792a5734b0f3 Charlie Jenkins      2023-11-27  706  		}
d8792a5734b0f3 Charlie Jenkins      2023-11-27  707  
8fd6c5142395a1 Charlie Jenkins      2023-11-01  708  		rel_head->rel_entry =
8fd6c5142395a1 Charlie Jenkins      2023-11-01  709  			kmalloc(sizeof(struct list_head), GFP_KERNEL);
d8792a5734b0f3 Charlie Jenkins      2023-11-27  710  
d8792a5734b0f3 Charlie Jenkins      2023-11-27  711  		if (!rel_head->rel_entry) {
d8792a5734b0f3 Charlie Jenkins      2023-11-27  712  			kfree(entry);
d8792a5734b0f3 Charlie Jenkins      2023-11-27  713  			kfree(rel_head);
d8792a5734b0f3 Charlie Jenkins      2023-11-27  714  			return -ENOMEM;
d8792a5734b0f3 Charlie Jenkins      2023-11-27  715  		}
d8792a5734b0f3 Charlie Jenkins      2023-11-27  716  
8fd6c5142395a1 Charlie Jenkins      2023-11-01  717  		INIT_LIST_HEAD(rel_head->rel_entry);
8fd6c5142395a1 Charlie Jenkins      2023-11-01  718  		rel_head->location = location;
8fd6c5142395a1 Charlie Jenkins      2023-11-01  719  		INIT_HLIST_NODE(&rel_head->node);
8fd6c5142395a1 Charlie Jenkins      2023-11-01  720  		if (!current_head->first) {
8fd6c5142395a1 Charlie Jenkins      2023-11-01  721  			bucket =
8fd6c5142395a1 Charlie Jenkins      2023-11-01  722  				kmalloc(sizeof(struct used_bucket), GFP_KERNEL);
d8792a5734b0f3 Charlie Jenkins      2023-11-27  723  
d8792a5734b0f3 Charlie Jenkins      2023-11-27  724  			if (!bucket) {
d8792a5734b0f3 Charlie Jenkins      2023-11-27  725  				kfree(entry);
d8792a5734b0f3 Charlie Jenkins      2023-11-27 @726  				kfree(rel_head);
d8792a5734b0f3 Charlie Jenkins      2023-11-27 @727  				kfree(rel_head->rel_entry);
d8792a5734b0f3 Charlie Jenkins      2023-11-27  728  				return -ENOMEM;
d8792a5734b0f3 Charlie Jenkins      2023-11-27  729  			}
d8792a5734b0f3 Charlie Jenkins      2023-11-27  730  
8fd6c5142395a1 Charlie Jenkins      2023-11-01  731  			INIT_LIST_HEAD(&bucket->head);
8fd6c5142395a1 Charlie Jenkins      2023-11-01  732  			bucket->bucket = current_head;
d8792a5734b0f3 Charlie Jenkins      2023-11-27  733  			list_add(&bucket->head, used_buckets_list);
8fd6c5142395a1 Charlie Jenkins      2023-11-01  734  		}
8fd6c5142395a1 Charlie Jenkins      2023-11-01  735  		hlist_add_head(&rel_head->node, current_head);
8fd6c5142395a1 Charlie Jenkins      2023-11-01  736  	}
8fd6c5142395a1 Charlie Jenkins      2023-11-01  737  
8fd6c5142395a1 Charlie Jenkins      2023-11-01  738  	/* Add relocation to head of discovered rel_head */
8fd6c5142395a1 Charlie Jenkins      2023-11-01  739  	list_add_tail(&entry->head, rel_head->rel_entry);
8fd6c5142395a1 Charlie Jenkins      2023-11-01  740  
8fd6c5142395a1 Charlie Jenkins      2023-11-01  741  	return 0;
8fd6c5142395a1 Charlie Jenkins      2023-11-01  742  }
8fd6c5142395a1 Charlie Jenkins      2023-11-01  743  
d8792a5734b0f3 Charlie Jenkins      2023-11-27  744  static unsigned int
d8792a5734b0f3 Charlie Jenkins      2023-11-27  745  initialize_relocation_hashtable(unsigned int num_relocations,
d8792a5734b0f3 Charlie Jenkins      2023-11-27  746  				struct hlist_head **relocation_hashtable)
8fd6c5142395a1 Charlie Jenkins      2023-11-01  747  {
8fd6c5142395a1 Charlie Jenkins      2023-11-01  748  	/* Can safely assume that bits is not greater than sizeof(long) */
8fd6c5142395a1 Charlie Jenkins      2023-11-01  749  	unsigned long hashtable_size = roundup_pow_of_two(num_relocations);
8fd6c5142395a1 Charlie Jenkins      2023-11-01  750  	unsigned int hashtable_bits = ilog2(hashtable_size);
8fd6c5142395a1 Charlie Jenkins      2023-11-01  751  
8fd6c5142395a1 Charlie Jenkins      2023-11-01  752  	/*
8fd6c5142395a1 Charlie Jenkins      2023-11-01  753  	 * Double size of hashtable if num_relocations * 1.25 is greater than
8fd6c5142395a1 Charlie Jenkins      2023-11-01  754  	 * hashtable_size.
8fd6c5142395a1 Charlie Jenkins      2023-11-01  755  	 */
8fd6c5142395a1 Charlie Jenkins      2023-11-01  756  	int should_double_size = ((num_relocations + (num_relocations >> 2)) > (hashtable_size));
8fd6c5142395a1 Charlie Jenkins      2023-11-01  757  
8fd6c5142395a1 Charlie Jenkins      2023-11-01  758  	hashtable_bits += should_double_size;
8fd6c5142395a1 Charlie Jenkins      2023-11-01  759  
8fd6c5142395a1 Charlie Jenkins      2023-11-01  760  	hashtable_size <<= should_double_size;
8fd6c5142395a1 Charlie Jenkins      2023-11-01  761  
d8792a5734b0f3 Charlie Jenkins      2023-11-27  762  	*relocation_hashtable = kmalloc_array(hashtable_size,
8fd6c5142395a1 Charlie Jenkins      2023-11-01 @763  					      sizeof(*relocation_hashtable),
8fd6c5142395a1 Charlie Jenkins      2023-11-01  764  					      GFP_KERNEL);
d8792a5734b0f3 Charlie Jenkins      2023-11-27  765  	if (!*relocation_hashtable)
d8792a5734b0f3 Charlie Jenkins      2023-11-27  766  		return -ENOMEM;
8fd6c5142395a1 Charlie Jenkins      2023-11-01  767  
d8792a5734b0f3 Charlie Jenkins      2023-11-27  768  	__hash_init(*relocation_hashtable, hashtable_size);
8fd6c5142395a1 Charlie Jenkins      2023-11-01  769  
8fd6c5142395a1 Charlie Jenkins      2023-11-01  770  	return hashtable_bits;
8fd6c5142395a1 Charlie Jenkins      2023-11-01  771  }
8fd6c5142395a1 Charlie Jenkins      2023-11-01  772  
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  773  int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  774  		       unsigned int symindex, unsigned int relsec,
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  775  		       struct module *me)
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  776  {
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  777  	Elf_Rela *rel = (void *) sechdrs[relsec].sh_addr;
8cbe0accc4a6ba Emil Renner Berthing 2023-11-01  778  	int (*handler)(struct module *me, void *location, Elf_Addr v);
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  779  	Elf_Sym *sym;
8cbe0accc4a6ba Emil Renner Berthing 2023-11-01  780  	void *location;
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  781  	unsigned int i, type;
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  782  	Elf_Addr v;
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  783  	int res;
8fd6c5142395a1 Charlie Jenkins      2023-11-01  784  	unsigned int num_relocations = sechdrs[relsec].sh_size / sizeof(*rel);
d8792a5734b0f3 Charlie Jenkins      2023-11-27  785  	struct hlist_head *relocation_hashtable;
d8792a5734b0f3 Charlie Jenkins      2023-11-27  786  	struct list_head used_buckets_list;
d8792a5734b0f3 Charlie Jenkins      2023-11-27  787  	unsigned int hashtable_bits;
d8792a5734b0f3 Charlie Jenkins      2023-11-27  788  
d8792a5734b0f3 Charlie Jenkins      2023-11-27  789  	hashtable_bits = initialize_relocation_hashtable(num_relocations,
d8792a5734b0f3 Charlie Jenkins      2023-11-27  790  							 &relocation_hashtable);
d8792a5734b0f3 Charlie Jenkins      2023-11-27  791  
d8792a5734b0f3 Charlie Jenkins      2023-11-27 @792  	if (hashtable_bits < 0)
d8792a5734b0f3 Charlie Jenkins      2023-11-27  793  		return hashtable_bits;
d8792a5734b0f3 Charlie Jenkins      2023-11-27  794  
d8792a5734b0f3 Charlie Jenkins      2023-11-27  795  	INIT_LIST_HEAD(&used_buckets_list);
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  796  
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  797  	pr_debug("Applying relocate section %u to %u\n", relsec,
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  798  	       sechdrs[relsec].sh_info);
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  799  
8fd6c5142395a1 Charlie Jenkins      2023-11-01  800  	for (i = 0; i < num_relocations; i++) {
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  801  		/* This is where to make the change */
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  802  		location = (void *)sechdrs[sechdrs[relsec].sh_info].sh_addr
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  803  			+ rel[i].r_offset;
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  804  		/* This is the symbol it is referring to */
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  805  		sym = (Elf_Sym *)sechdrs[symindex].sh_addr
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  806  			+ ELF_RISCV_R_SYM(rel[i].r_info);
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  807  		if (IS_ERR_VALUE(sym->st_value)) {
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  808  			/* Ignore unresolved weak symbol */
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  809  			if (ELF_ST_BIND(sym->st_info) == STB_WEAK)
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  810  				continue;
04ce8d3f40cd2d Kefeng Wang          2019-10-18  811  			pr_warn("%s: Unknown symbol %s\n",
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  812  				me->name, strtab + sym->st_name);
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  813  			return -ENOENT;
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  814  		}
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  815  
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  816  		type = ELF_RISCV_R_TYPE(rel[i].r_info);
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  817  
8fd6c5142395a1 Charlie Jenkins      2023-11-01  818  		if (type < ARRAY_SIZE(reloc_handlers))
8fd6c5142395a1 Charlie Jenkins      2023-11-01  819  			handler = reloc_handlers[type].reloc_handler;
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  820  		else
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  821  			handler = NULL;
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  822  
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  823  		if (!handler) {
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  824  			pr_err("%s: Unknown relocation type %u\n",
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  825  			       me->name, type);
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  826  			return -EINVAL;
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  827  		}
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  828  
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  829  		v = sym->st_value + rel[i].r_addend;
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  830  
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  831  		if (type == R_RISCV_PCREL_LO12_I || type == R_RISCV_PCREL_LO12_S) {
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  832  			unsigned int j;
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  833  
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  834  			for (j = 0; j < sechdrs[relsec].sh_size / sizeof(*rel); j++) {
7df85002178e70 Zong Li              2018-06-25  835  				unsigned long hi20_loc =
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  836  					sechdrs[sechdrs[relsec].sh_info].sh_addr
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  837  					+ rel[j].r_offset;
da975dd4818cf4 Zong Li              2018-03-15  838  				u32 hi20_type = ELF_RISCV_R_TYPE(rel[j].r_info);
da975dd4818cf4 Zong Li              2018-03-15  839  
da975dd4818cf4 Zong Li              2018-03-15  840  				/* Find the corresponding HI20 relocation entry */
da975dd4818cf4 Zong Li              2018-03-15  841  				if (hi20_loc == sym->st_value
da975dd4818cf4 Zong Li              2018-03-15  842  				    && (hi20_type == R_RISCV_PCREL_HI20
da975dd4818cf4 Zong Li              2018-03-15  843  					|| hi20_type == R_RISCV_GOT_HI20)) {
da975dd4818cf4 Zong Li              2018-03-15  844  					s32 hi20, lo12;
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  845  					Elf_Sym *hi20_sym =
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  846  						(Elf_Sym *)sechdrs[symindex].sh_addr
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  847  						+ ELF_RISCV_R_SYM(rel[j].r_info);
7df85002178e70 Zong Li              2018-06-25  848  					unsigned long hi20_sym_val =
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  849  						hi20_sym->st_value
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  850  						+ rel[j].r_addend;
da975dd4818cf4 Zong Li              2018-03-15  851  
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  852  					/* Calculate lo12 */
7df85002178e70 Zong Li              2018-06-25  853  					size_t offset = hi20_sym_val - hi20_loc;
da975dd4818cf4 Zong Li              2018-03-15  854  					if (IS_ENABLED(CONFIG_MODULE_SECTIONS)
da975dd4818cf4 Zong Li              2018-03-15  855  					    && hi20_type == R_RISCV_GOT_HI20) {
da975dd4818cf4 Zong Li              2018-03-15  856  						offset = module_emit_got_entry(
da975dd4818cf4 Zong Li              2018-03-15  857  							 me, hi20_sym_val);
da975dd4818cf4 Zong Li              2018-03-15  858  						offset = offset - hi20_loc;
da975dd4818cf4 Zong Li              2018-03-15  859  					}
da975dd4818cf4 Zong Li              2018-03-15  860  					hi20 = (offset + 0x800) & 0xfffff000;
da975dd4818cf4 Zong Li              2018-03-15  861  					lo12 = offset - hi20;
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  862  					v = lo12;
da975dd4818cf4 Zong Li              2018-03-15  863  
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  864  					break;
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  865  				}
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  866  			}
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  867  			if (j == sechdrs[relsec].sh_size / sizeof(*rel)) {
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  868  				pr_err(
da975dd4818cf4 Zong Li              2018-03-15  869  				  "%s: Can not find HI20 relocation information\n",
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  870  				  me->name);
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  871  				return -EINVAL;
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  872  			}
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  873  		}
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  874  
8fd6c5142395a1 Charlie Jenkins      2023-11-01  875  		if (reloc_handlers[type].accumulate_handler)
d8792a5734b0f3 Charlie Jenkins      2023-11-27  876  			res = add_relocation_to_accumulate(me, type, location,
d8792a5734b0f3 Charlie Jenkins      2023-11-27  877  							   hashtable_bits, v,
d8792a5734b0f3 Charlie Jenkins      2023-11-27  878  							   relocation_hashtable,
d8792a5734b0f3 Charlie Jenkins      2023-11-27  879  							   &used_buckets_list);
8fd6c5142395a1 Charlie Jenkins      2023-11-01  880  		else
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  881  			res = handler(me, location, v);
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  882  		if (res)
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  883  			return res;
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  884  	}
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  885  
d8792a5734b0f3 Charlie Jenkins      2023-11-27  886  	process_accumulated_relocations(me, &relocation_hashtable,
d8792a5734b0f3 Charlie Jenkins      2023-11-27  887  					&used_buckets_list);
8fd6c5142395a1 Charlie Jenkins      2023-11-01  888  
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  889  	return 0;
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  890  }
0cff8bff7af886 Vincent Chen         2020-02-21  891  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
