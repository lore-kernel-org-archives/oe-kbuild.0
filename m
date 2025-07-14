Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475C623AB87
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Jul 2025 21:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752527185; cv=none; b=Z9Z6vfLNXTtLlVeftgumHZeITjuWG55I2fEIjoPhog6aUwBn09xRk7eyr18yiiubUSAyZaPKIabY/yYQwvOzl06pzblDJhMT4O7/ICbLI0MisWkIVTU7OzmeHFIFjZg3t5rJtKB3JrVpN3skSzaGVg6T2Y6C62ky7x1MHA0YTio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752527185; c=relaxed/simple;
	bh=Y3L1lweMcjP98sWQTaCgV/uCDV6j+Db5D5c6sDc+uhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qako2ygksu9mdvELwNoOONf2Xpam3kv530Eh/k4ds2Z0gIWKWLecdoAkX8LeB64Sfv3s/AhNEoUL0R854Y5AfDACFQt0PLG6JkgZ1f5g8ML675TTw92fFfK08ZrTvVyM6l5o9eWXbCU+UG7DabwftCc5VCvCAPF67xDcAUo9hFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hXbI31CR; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hXbI31CR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752527183; x=1784063183;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Y3L1lweMcjP98sWQTaCgV/uCDV6j+Db5D5c6sDc+uhA=;
  b=hXbI31CRJ4XNrlU+2oVykVwJKh4jzBlntlQ3oDWlA08A0N/lPCAkxmyM
   HqlOhnX2fvPtKXfuD3gHFg7KI056sGXTR+WsoaZLHx1sinbw9qg5WOkCD
   pvJABnAWn5pQXflj+TuTJXqZ/W4s3Gh1BPXTCefX3v3axAbN1LYJliqVG
   j+xC6Wsf6N4VIjc2tzEumzFmPBAHcLfO6GvfF23tGOwhb6j2d+EF6iKOH
   i2sEIYR5bjv+eFMxd0zArpCdW3+7Ve3nQ+c4m0p11jIkC2Dq1lOReLy4j
   VXztpAUvG3MZO4oGiZAULir4maF5C81tx3kJL7fq4i9nyZliYOejZv9JM
   g==;
X-CSE-ConnectionGUID: n8mOgb/HQayYnZeht1ZxRg==
X-CSE-MsgGUID: S0hCYJyjTlmWgRu6TVx3bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="66089953"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="66089953"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 14:06:20 -0700
X-CSE-ConnectionGUID: qxyoJQf9RxmfF3I9/mOCsQ==
X-CSE-MsgGUID: rJWx8F6FRGWhR1pph33VJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="157132707"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Jul 2025 14:06:18 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubQNL-0009LX-01;
	Mon, 14 Jul 2025 21:06:15 +0000
Date: Tue, 15 Jul 2025 05:05:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/memory.c:4510 do_swap_page() error: uninitialized symbol
 'nr_pages'.
Message-ID: <202507150438.oRheOdNy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Chuanhua Han <hanchuanhua@oppo.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Barry Song <v-songbaohua@oppo.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   347e9f5043c89695b01e66b3ed111755afcf1911
commit: 242d12c98174584a18965cfab95778893872d650 mm: support large folios swap-in for sync io devices
date:   10 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-141-20250714 (https://download.01.org/0day-ci/archive/20250715/202507150438.oRheOdNy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507150438.oRheOdNy-lkp@intel.com/

smatch warnings:
mm/memory.c:4510 do_swap_page() error: uninitialized symbol 'nr_pages'.

vim +/nr_pages +4510 mm/memory.c

242d12c9817458 Chuanhua Han            2024-09-09  4179  
^1da177e4c3f41 Linus Torvalds          2005-04-16  4180  /*
c1e8d7c6a7a682 Michel Lespinasse       2020-06-08  4181   * We enter with non-exclusive mmap_lock (to exclude vma changes,
8f4e2101fd7df9 Hugh Dickins            2005-10-29  4182   * but allow concurrent faults), and pte mapped but not yet locked.
9a95f3cf7b33d6 Paul Cassella           2014-08-06  4183   * We return with pte unmapped and unlocked.
9a95f3cf7b33d6 Paul Cassella           2014-08-06  4184   *
c1e8d7c6a7a682 Michel Lespinasse       2020-06-08  4185   * We return with the mmap_lock locked or unlocked in the same cases
9a95f3cf7b33d6 Paul Cassella           2014-08-06  4186   * as does filemap_fault().
^1da177e4c3f41 Linus Torvalds          2005-04-16  4187   */
2b7403035459c7 Souptick Joarder        2018-08-23  4188  vm_fault_t do_swap_page(struct vm_fault *vmf)
^1da177e4c3f41 Linus Torvalds          2005-04-16  4189  {
82b0f8c39a3869 Jan Kara                2016-12-14  4190  	struct vm_area_struct *vma = vmf->vma;
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4191) 	struct folio *swapcache, *folio = NULL;
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4192) 	struct page *page;
2799e77529c2a2 Miaohe Lin              2021-06-28  4193  	struct swap_info_struct *si = NULL;
14f9135d547060 David Hildenbrand       2022-05-09  4194  	rmap_t rmap_flags = RMAP_NONE;
13ddaf26be324a Kairui Song             2024-02-07  4195  	bool need_clear_cache = false;
1493a1913e34b0 David Hildenbrand       2022-05-09  4196  	bool exclusive = false;
65500d234e74fc Hugh Dickins            2005-10-29  4197  	swp_entry_t entry;
^1da177e4c3f41 Linus Torvalds          2005-04-16  4198  	pte_t pte;
2b7403035459c7 Souptick Joarder        2018-08-23  4199  	vm_fault_t ret = 0;
aae466b0052e18 Joonsoo Kim             2020-08-11  4200  	void *shadow = NULL;
508758960b8d89 Chuanhua Han            2024-05-29  4201  	int nr_pages;
508758960b8d89 Chuanhua Han            2024-05-29  4202  	unsigned long page_idx;
508758960b8d89 Chuanhua Han            2024-05-29  4203  	unsigned long address;
508758960b8d89 Chuanhua Han            2024-05-29  4204  	pte_t *ptep;
^1da177e4c3f41 Linus Torvalds          2005-04-16  4205  
2ca99358671ad3 Peter Xu                2021-11-05  4206  	if (!pte_unmap_same(vmf))
8f4e2101fd7df9 Hugh Dickins            2005-10-29  4207  		goto out;
65500d234e74fc Hugh Dickins            2005-10-29  4208  
2994302bc8a171 Jan Kara                2016-12-14  4209  	entry = pte_to_swp_entry(vmf->orig_pte);
d1737fdbec7f90 Andi Kleen              2009-09-16  4210  	if (unlikely(non_swap_entry(entry))) {
0697212a411c1d Christoph Lameter       2006-06-23  4211  		if (is_migration_entry(entry)) {
82b0f8c39a3869 Jan Kara                2016-12-14  4212  			migration_entry_wait(vma->vm_mm, vmf->pmd,
82b0f8c39a3869 Jan Kara                2016-12-14  4213  					     vmf->address);
b756a3b5e7ead8 Alistair Popple         2021-06-30  4214  		} else if (is_device_exclusive_entry(entry)) {
b756a3b5e7ead8 Alistair Popple         2021-06-30  4215  			vmf->page = pfn_swap_entry_to_page(entry);
b756a3b5e7ead8 Alistair Popple         2021-06-30  4216  			ret = remove_device_exclusive_entry(vmf);
5042db43cc26f5 Jérôme Glisse           2017-09-08  4217  		} else if (is_device_private_entry(entry)) {
1235ccd05b6dd6 Suren Baghdasaryan      2023-06-30  4218  			if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
1235ccd05b6dd6 Suren Baghdasaryan      2023-06-30  4219  				/*
1235ccd05b6dd6 Suren Baghdasaryan      2023-06-30  4220  				 * migrate_to_ram is not yet ready to operate
1235ccd05b6dd6 Suren Baghdasaryan      2023-06-30  4221  				 * under VMA lock.
1235ccd05b6dd6 Suren Baghdasaryan      2023-06-30  4222  				 */
1235ccd05b6dd6 Suren Baghdasaryan      2023-06-30  4223  				vma_end_read(vma);
1235ccd05b6dd6 Suren Baghdasaryan      2023-06-30  4224  				ret = VM_FAULT_RETRY;
1235ccd05b6dd6 Suren Baghdasaryan      2023-06-30  4225  				goto out;
1235ccd05b6dd6 Suren Baghdasaryan      2023-06-30  4226  			}
1235ccd05b6dd6 Suren Baghdasaryan      2023-06-30  4227  
af5cdaf82238fb Alistair Popple         2021-06-30  4228  			vmf->page = pfn_swap_entry_to_page(entry);
16ce101db85db6 Alistair Popple         2022-09-28  4229  			vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
16ce101db85db6 Alistair Popple         2022-09-28  4230  					vmf->address, &vmf->ptl);
3db82b9374ca92 Hugh Dickins            2023-06-08  4231  			if (unlikely(!vmf->pte ||
c33c794828f212 Ryan Roberts            2023-06-12  4232  				     !pte_same(ptep_get(vmf->pte),
c33c794828f212 Ryan Roberts            2023-06-12  4233  							vmf->orig_pte)))
3b65f437d9e8dd Ryan Roberts            2023-06-02  4234  				goto unlock;
16ce101db85db6 Alistair Popple         2022-09-28  4235  
16ce101db85db6 Alistair Popple         2022-09-28  4236  			/*
16ce101db85db6 Alistair Popple         2022-09-28  4237  			 * Get a page reference while we know the page can't be
16ce101db85db6 Alistair Popple         2022-09-28  4238  			 * freed.
16ce101db85db6 Alistair Popple         2022-09-28  4239  			 */
16ce101db85db6 Alistair Popple         2022-09-28  4240  			get_page(vmf->page);
16ce101db85db6 Alistair Popple         2022-09-28  4241  			pte_unmap_unlock(vmf->pte, vmf->ptl);
4a955bed882e73 Alistair Popple         2022-11-14  4242  			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
16ce101db85db6 Alistair Popple         2022-09-28  4243  			put_page(vmf->page);
d1737fdbec7f90 Andi Kleen              2009-09-16  4244  		} else if (is_hwpoison_entry(entry)) {
d1737fdbec7f90 Andi Kleen              2009-09-16  4245  			ret = VM_FAULT_HWPOISON;
5c041f5d1f23d3 Peter Xu                2022-05-12  4246  		} else if (is_pte_marker_entry(entry)) {
5c041f5d1f23d3 Peter Xu                2022-05-12  4247  			ret = handle_pte_marker(vmf);
d1737fdbec7f90 Andi Kleen              2009-09-16  4248  		} else {
2994302bc8a171 Jan Kara                2016-12-14  4249  			print_bad_pte(vma, vmf->address, vmf->orig_pte, NULL);
d99be1a8ecf377 Hugh Dickins            2009-12-14  4250  			ret = VM_FAULT_SIGBUS;
d1737fdbec7f90 Andi Kleen              2009-09-16  4251  		}
0697212a411c1d Christoph Lameter       2006-06-23  4252  		goto out;
0697212a411c1d Christoph Lameter       2006-06-23  4253  	}
0bcac06f27d752 Minchan Kim             2017-11-15  4254  
2799e77529c2a2 Miaohe Lin              2021-06-28  4255  	/* Prevent swapoff from happening to us. */
2799e77529c2a2 Miaohe Lin              2021-06-28  4256  	si = get_swap_device(entry);
2799e77529c2a2 Miaohe Lin              2021-06-28  4257  	if (unlikely(!si))
2799e77529c2a2 Miaohe Lin              2021-06-28  4258  		goto out;
0bcac06f27d752 Minchan Kim             2017-11-15  4259  
5a423081b2465d Matthew Wilcox (Oracle  2022-09-02  4260) 	folio = swap_cache_get_folio(entry, vma, vmf->address);
5a423081b2465d Matthew Wilcox (Oracle  2022-09-02  4261) 	if (folio)
5a423081b2465d Matthew Wilcox (Oracle  2022-09-02  4262) 		page = folio_file_page(folio, swp_offset(entry));
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4263) 	swapcache = folio;
f80207727aaca3 Minchan Kim             2018-01-18  4264  
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4265) 	if (!folio) {
a449bf58e45abf Qian Cai                2020-08-14  4266  		if (data_race(si->flags & SWP_SYNCHRONOUS_IO) &&
eb085574a7526c Huang Ying              2019-07-11  4267  		    __swap_count(entry) == 1) {
0bcac06f27d752 Minchan Kim             2017-11-15  4268  			/* skip swapcache */
242d12c9817458 Chuanhua Han            2024-09-09  4269  			folio = alloc_swap_folio(vmf);
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4270) 			if (folio) {
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4271) 				__folio_set_locked(folio);
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4272) 				__folio_set_swapbacked(folio);
4c6355b25e8bb8 Johannes Weiner         2020-06-03  4273  
242d12c9817458 Chuanhua Han            2024-09-09  4274  				nr_pages = folio_nr_pages(folio);
242d12c9817458 Chuanhua Han            2024-09-09  4275  				if (folio_test_large(folio))
242d12c9817458 Chuanhua Han            2024-09-09  4276  					entry.val = ALIGN_DOWN(entry.val, nr_pages);
242d12c9817458 Chuanhua Han            2024-09-09  4277  				/*
242d12c9817458 Chuanhua Han            2024-09-09  4278  				 * Prevent parallel swapin from proceeding with
242d12c9817458 Chuanhua Han            2024-09-09  4279  				 * the cache flag. Otherwise, another thread
242d12c9817458 Chuanhua Han            2024-09-09  4280  				 * may finish swapin first, free the entry, and
242d12c9817458 Chuanhua Han            2024-09-09  4281  				 * swapout reusing the same entry. It's
242d12c9817458 Chuanhua Han            2024-09-09  4282  				 * undetectable as pte_same() returns true due
242d12c9817458 Chuanhua Han            2024-09-09  4283  				 * to entry reuse.
242d12c9817458 Chuanhua Han            2024-09-09  4284  				 */
242d12c9817458 Chuanhua Han            2024-09-09  4285  				if (swapcache_prepare(entry, nr_pages)) {
242d12c9817458 Chuanhua Han            2024-09-09  4286  					/*
242d12c9817458 Chuanhua Han            2024-09-09  4287  					 * Relax a bit to prevent rapid
242d12c9817458 Chuanhua Han            2024-09-09  4288  					 * repeated page faults.
242d12c9817458 Chuanhua Han            2024-09-09  4289  					 */
242d12c9817458 Chuanhua Han            2024-09-09  4290  					schedule_timeout_uninterruptible(1);
4c6355b25e8bb8 Johannes Weiner         2020-06-03  4291  					goto out_page;
545b1b077ca6b3 Michal Hocko            2020-06-25  4292  				}
242d12c9817458 Chuanhua Han            2024-09-09  4293  				need_clear_cache = true;
242d12c9817458 Chuanhua Han            2024-09-09  4294  
242d12c9817458 Chuanhua Han            2024-09-09  4295  				mem_cgroup_swapin_uncharge_swap(entry, nr_pages);
4c6355b25e8bb8 Johannes Weiner         2020-06-03  4296  
aae466b0052e18 Joonsoo Kim             2020-08-11  4297  				shadow = get_shadow_from_swap_cache(entry);
aae466b0052e18 Joonsoo Kim             2020-08-11  4298  				if (shadow)
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4299) 					workingset_refault(folio, shadow);
0076f029cb2906 Joonsoo Kim             2020-06-25  4300  
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4301) 				folio_add_lru(folio);
0add0c77a9bd0c Shakeel Butt            2021-04-29  4302  
c9bdf768dd9319 Matthew Wilcox (Oracle  2023-12-13  4303) 				/* To provide entry to swap_read_folio() */
3d2c9087688777 David Hildenbrand       2023-08-21  4304  				folio->swap = entry;
b2d1f38b524121 Yosry Ahmed             2024-06-07  4305  				swap_read_folio(folio, NULL);
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4306) 				folio->private = NULL;
0bcac06f27d752 Minchan Kim             2017-11-15  4307  			}
aa8d22a11da933 Minchan Kim             2017-11-15  4308  		} else {
94dc8bffd8b7fe Matthew Wilcox (Oracle  2024-08-07  4309) 			folio = swapin_readahead(entry, GFP_HIGHUSER_MOVABLE,
e9e9b7ecee4a13 Minchan Kim             2018-04-05  4310  						vmf);
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4311) 			swapcache = folio;
0bcac06f27d752 Minchan Kim             2017-11-15  4312  		}
0bcac06f27d752 Minchan Kim             2017-11-15  4313  
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4314) 		if (!folio) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  4315  			/*
8f4e2101fd7df9 Hugh Dickins            2005-10-29  4316  			 * Back out if somebody else faulted in this pte
8f4e2101fd7df9 Hugh Dickins            2005-10-29  4317  			 * while we released the pte lock.
^1da177e4c3f41 Linus Torvalds          2005-04-16  4318  			 */
82b0f8c39a3869 Jan Kara                2016-12-14  4319  			vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
82b0f8c39a3869 Jan Kara                2016-12-14  4320  					vmf->address, &vmf->ptl);
c33c794828f212 Ryan Roberts            2023-06-12  4321  			if (likely(vmf->pte &&
c33c794828f212 Ryan Roberts            2023-06-12  4322  				   pte_same(ptep_get(vmf->pte), vmf->orig_pte)))
^1da177e4c3f41 Linus Torvalds          2005-04-16  4323  				ret = VM_FAULT_OOM;
65500d234e74fc Hugh Dickins            2005-10-29  4324  			goto unlock;
^1da177e4c3f41 Linus Torvalds          2005-04-16  4325  		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  4326  
^1da177e4c3f41 Linus Torvalds          2005-04-16  4327  		/* Had to read the page from swap area: Major fault */
^1da177e4c3f41 Linus Torvalds          2005-04-16  4328  		ret = VM_FAULT_MAJOR;
f8891e5e1f93a1 Christoph Lameter       2006-06-30  4329  		count_vm_event(PGMAJFAULT);
2262185c5b287f Roman Gushchin          2017-07-06  4330  		count_memcg_event_mm(vma->vm_mm, PGMAJFAULT);
94dc8bffd8b7fe Matthew Wilcox (Oracle  2024-08-07  4331) 		page = folio_file_page(folio, swp_offset(entry));
d1737fdbec7f90 Andi Kleen              2009-09-16  4332  	} else if (PageHWPoison(page)) {
71f72525dfaaec Wu Fengguang            2009-12-16  4333  		/*
71f72525dfaaec Wu Fengguang            2009-12-16  4334  		 * hwpoisoned dirty swapcache pages are kept for killing
71f72525dfaaec Wu Fengguang            2009-12-16  4335  		 * owner processes (which may be unknown at hwpoison time)
71f72525dfaaec Wu Fengguang            2009-12-16  4336  		 */
d1737fdbec7f90 Andi Kleen              2009-09-16  4337  		ret = VM_FAULT_HWPOISON;
4779cb31c0ee3b Andi Kleen              2009-10-14  4338  		goto out_release;
^1da177e4c3f41 Linus Torvalds          2005-04-16  4339  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  4340  
fdc724d6aa44ef Suren Baghdasaryan      2023-06-30  4341  	ret |= folio_lock_or_retry(folio, vmf);
fdc724d6aa44ef Suren Baghdasaryan      2023-06-30  4342  	if (ret & VM_FAULT_RETRY)
d065bd810b6deb Michel Lespinasse       2010-10-26  4343  		goto out_release;
073e587ec2cc37 KAMEZAWA Hiroyuki       2008-10-18  4344  
84d60fdd3733fb David Hildenbrand       2022-03-24  4345  	if (swapcache) {
4969c1192d15af Andrea Arcangeli        2010-09-09  4346  		/*
3b344157c0c15b Matthew Wilcox (Oracle  2022-09-02  4347) 		 * Make sure folio_free_swap() or swapoff did not release the
84d60fdd3733fb David Hildenbrand       2022-03-24  4348  		 * swapcache from under us.  The page pin, and pte_same test
84d60fdd3733fb David Hildenbrand       2022-03-24  4349  		 * below, are not enough to exclude that.  Even if it is still
84d60fdd3733fb David Hildenbrand       2022-03-24  4350  		 * swapcache, we need to check that the page's swap has not
84d60fdd3733fb David Hildenbrand       2022-03-24  4351  		 * changed.
4969c1192d15af Andrea Arcangeli        2010-09-09  4352  		 */
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4353) 		if (unlikely(!folio_test_swapcache(folio) ||
cfeed8ffe55b37 David Hildenbrand       2023-08-21  4354  			     page_swap_entry(page).val != entry.val))
4969c1192d15af Andrea Arcangeli        2010-09-09  4355  			goto out_page;
4969c1192d15af Andrea Arcangeli        2010-09-09  4356  
84d60fdd3733fb David Hildenbrand       2022-03-24  4357  		/*
84d60fdd3733fb David Hildenbrand       2022-03-24  4358  		 * KSM sometimes has to copy on read faults, for example, if
84d60fdd3733fb David Hildenbrand       2022-03-24  4359  		 * page->index of !PageKSM() pages would be nonlinear inside the
84d60fdd3733fb David Hildenbrand       2022-03-24  4360  		 * anon VMA -- PageKSM() is lost on actual swapout.
84d60fdd3733fb David Hildenbrand       2022-03-24  4361  		 */
96db66d9c8f3c1 Matthew Wilcox (Oracle  2023-12-11  4362) 		folio = ksm_might_need_to_copy(folio, vma, vmf->address);
96db66d9c8f3c1 Matthew Wilcox (Oracle  2023-12-11  4363) 		if (unlikely(!folio)) {
5ad6468801d28c Hugh Dickins            2009-12-14  4364  			ret = VM_FAULT_OOM;
96db66d9c8f3c1 Matthew Wilcox (Oracle  2023-12-11  4365) 			folio = swapcache;
4969c1192d15af Andrea Arcangeli        2010-09-09  4366  			goto out_page;
96db66d9c8f3c1 Matthew Wilcox (Oracle  2023-12-11  4367) 		} else if (unlikely(folio == ERR_PTR(-EHWPOISON))) {
6b970599e807ea Kefeng Wang             2022-12-09  4368  			ret = VM_FAULT_HWPOISON;
96db66d9c8f3c1 Matthew Wilcox (Oracle  2023-12-11  4369) 			folio = swapcache;
6b970599e807ea Kefeng Wang             2022-12-09  4370  			goto out_page;
4969c1192d15af Andrea Arcangeli        2010-09-09  4371  		}
96db66d9c8f3c1 Matthew Wilcox (Oracle  2023-12-11  4372) 		if (folio != swapcache)
96db66d9c8f3c1 Matthew Wilcox (Oracle  2023-12-11  4373) 			page = folio_page(folio, 0);
c145e0b47c77eb David Hildenbrand       2022-03-24  4374  
c145e0b47c77eb David Hildenbrand       2022-03-24  4375  		/*
c145e0b47c77eb David Hildenbrand       2022-03-24  4376  		 * If we want to map a page that's in the swapcache writable, we
c145e0b47c77eb David Hildenbrand       2022-03-24  4377  		 * have to detect via the refcount if we're really the exclusive
c145e0b47c77eb David Hildenbrand       2022-03-24  4378  		 * owner. Try removing the extra reference from the local LRU
1fec6890bf2247 Matthew Wilcox (Oracle  2023-06-21  4379) 		 * caches if required.
c145e0b47c77eb David Hildenbrand       2022-03-24  4380  		 */
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4381) 		if ((vmf->flags & FAULT_FLAG_WRITE) && folio == swapcache &&
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4382) 		    !folio_test_ksm(folio) && !folio_test_lru(folio))
c145e0b47c77eb David Hildenbrand       2022-03-24  4383  			lru_add_drain();
84d60fdd3733fb David Hildenbrand       2022-03-24  4384  	}
5ad6468801d28c Hugh Dickins            2009-12-14  4385  
4231f8425833b1 Kefeng Wang             2023-03-02  4386  	folio_throttle_swaprate(folio, GFP_KERNEL);
8a9f3ccd24741b Balbir Singh            2008-02-07  4387  
^1da177e4c3f41 Linus Torvalds          2005-04-16  4388  	/*
8f4e2101fd7df9 Hugh Dickins            2005-10-29  4389  	 * Back out if somebody else already faulted in this pte.
^1da177e4c3f41 Linus Torvalds          2005-04-16  4390  	 */
82b0f8c39a3869 Jan Kara                2016-12-14  4391  	vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, vmf->address,
82b0f8c39a3869 Jan Kara                2016-12-14  4392  			&vmf->ptl);
c33c794828f212 Ryan Roberts            2023-06-12  4393  	if (unlikely(!vmf->pte || !pte_same(ptep_get(vmf->pte), vmf->orig_pte)))
b81074800b98ac Kirill Korotaev         2005-05-16  4394  		goto out_nomap;
b81074800b98ac Kirill Korotaev         2005-05-16  4395  
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4396) 	if (unlikely(!folio_test_uptodate(folio))) {
b81074800b98ac Kirill Korotaev         2005-05-16  4397  		ret = VM_FAULT_SIGBUS;
b81074800b98ac Kirill Korotaev         2005-05-16  4398  		goto out_nomap;
^1da177e4c3f41 Linus Torvalds          2005-04-16  4399  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  4400  
242d12c9817458 Chuanhua Han            2024-09-09  4401  	/* allocated large folios for SWP_SYNCHRONOUS_IO */
242d12c9817458 Chuanhua Han            2024-09-09  4402  	if (folio_test_large(folio) && !folio_test_swapcache(folio)) {
242d12c9817458 Chuanhua Han            2024-09-09  4403  		unsigned long nr = folio_nr_pages(folio);
242d12c9817458 Chuanhua Han            2024-09-09  4404  		unsigned long folio_start = ALIGN_DOWN(vmf->address, nr * PAGE_SIZE);
242d12c9817458 Chuanhua Han            2024-09-09  4405  		unsigned long idx = (vmf->address - folio_start) / PAGE_SIZE;
242d12c9817458 Chuanhua Han            2024-09-09  4406  		pte_t *folio_ptep = vmf->pte - idx;
242d12c9817458 Chuanhua Han            2024-09-09  4407  		pte_t folio_pte = ptep_get(folio_ptep);
242d12c9817458 Chuanhua Han            2024-09-09  4408  
242d12c9817458 Chuanhua Han            2024-09-09  4409  		if (!pte_same(folio_pte, pte_move_swp_offset(vmf->orig_pte, -idx)) ||
242d12c9817458 Chuanhua Han            2024-09-09  4410  		    swap_pte_batch(folio_ptep, nr, folio_pte) != nr)
242d12c9817458 Chuanhua Han            2024-09-09  4411  			goto out_nomap;
242d12c9817458 Chuanhua Han            2024-09-09  4412  
242d12c9817458 Chuanhua Han            2024-09-09  4413  		page_idx = idx;
242d12c9817458 Chuanhua Han            2024-09-09  4414  		address = folio_start;
242d12c9817458 Chuanhua Han            2024-09-09  4415  		ptep = folio_ptep;
242d12c9817458 Chuanhua Han            2024-09-09  4416  		goto check_folio;
242d12c9817458 Chuanhua Han            2024-09-09  4417  	}
242d12c9817458 Chuanhua Han            2024-09-09  4418  
508758960b8d89 Chuanhua Han            2024-05-29  4419  	nr_pages = 1;
508758960b8d89 Chuanhua Han            2024-05-29  4420  	page_idx = 0;
508758960b8d89 Chuanhua Han            2024-05-29  4421  	address = vmf->address;
508758960b8d89 Chuanhua Han            2024-05-29  4422  	ptep = vmf->pte;
508758960b8d89 Chuanhua Han            2024-05-29  4423  	if (folio_test_large(folio) && folio_test_swapcache(folio)) {
508758960b8d89 Chuanhua Han            2024-05-29  4424  		int nr = folio_nr_pages(folio);
508758960b8d89 Chuanhua Han            2024-05-29  4425  		unsigned long idx = folio_page_idx(folio, page);
508758960b8d89 Chuanhua Han            2024-05-29  4426  		unsigned long folio_start = address - idx * PAGE_SIZE;
508758960b8d89 Chuanhua Han            2024-05-29  4427  		unsigned long folio_end = folio_start + nr * PAGE_SIZE;
508758960b8d89 Chuanhua Han            2024-05-29  4428  		pte_t *folio_ptep;
508758960b8d89 Chuanhua Han            2024-05-29  4429  		pte_t folio_pte;
508758960b8d89 Chuanhua Han            2024-05-29  4430  
508758960b8d89 Chuanhua Han            2024-05-29  4431  		if (unlikely(folio_start < max(address & PMD_MASK, vma->vm_start)))
508758960b8d89 Chuanhua Han            2024-05-29  4432  			goto check_folio;
508758960b8d89 Chuanhua Han            2024-05-29  4433  		if (unlikely(folio_end > pmd_addr_end(address, vma->vm_end)))
508758960b8d89 Chuanhua Han            2024-05-29  4434  			goto check_folio;
508758960b8d89 Chuanhua Han            2024-05-29  4435  
508758960b8d89 Chuanhua Han            2024-05-29  4436  		folio_ptep = vmf->pte - idx;
508758960b8d89 Chuanhua Han            2024-05-29  4437  		folio_pte = ptep_get(folio_ptep);
508758960b8d89 Chuanhua Han            2024-05-29  4438  		if (!pte_same(folio_pte, pte_move_swp_offset(vmf->orig_pte, -idx)) ||
508758960b8d89 Chuanhua Han            2024-05-29  4439  		    swap_pte_batch(folio_ptep, nr, folio_pte) != nr)
508758960b8d89 Chuanhua Han            2024-05-29  4440  			goto check_folio;
508758960b8d89 Chuanhua Han            2024-05-29  4441  
508758960b8d89 Chuanhua Han            2024-05-29  4442  		page_idx = idx;
508758960b8d89 Chuanhua Han            2024-05-29  4443  		address = folio_start;
508758960b8d89 Chuanhua Han            2024-05-29  4444  		ptep = folio_ptep;
508758960b8d89 Chuanhua Han            2024-05-29  4445  		nr_pages = nr;
508758960b8d89 Chuanhua Han            2024-05-29  4446  		entry = folio->swap;
508758960b8d89 Chuanhua Han            2024-05-29  4447  		page = &folio->page;
508758960b8d89 Chuanhua Han            2024-05-29  4448  	}
508758960b8d89 Chuanhua Han            2024-05-29  4449  
508758960b8d89 Chuanhua Han            2024-05-29  4450  check_folio:
78fbe906cc900b David Hildenbrand       2022-05-09  4451  	/*
78fbe906cc900b David Hildenbrand       2022-05-09  4452  	 * PG_anon_exclusive reuses PG_mappedtodisk for anon pages. A swap pte
78fbe906cc900b David Hildenbrand       2022-05-09  4453  	 * must never point at an anonymous page in the swapcache that is
78fbe906cc900b David Hildenbrand       2022-05-09  4454  	 * PG_anon_exclusive. Sanity check that this holds and especially, that
78fbe906cc900b David Hildenbrand       2022-05-09  4455  	 * no filesystem set PG_mappedtodisk on a page in the swapcache. Sanity
78fbe906cc900b David Hildenbrand       2022-05-09  4456  	 * check after taking the PT lock and making sure that nobody
78fbe906cc900b David Hildenbrand       2022-05-09  4457  	 * concurrently faulted in this page and set PG_anon_exclusive.
78fbe906cc900b David Hildenbrand       2022-05-09  4458  	 */
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4459) 	BUG_ON(!folio_test_anon(folio) && folio_test_mappedtodisk(folio));
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4460) 	BUG_ON(folio_test_anon(folio) && PageAnonExclusive(page));
78fbe906cc900b David Hildenbrand       2022-05-09  4461  
1493a1913e34b0 David Hildenbrand       2022-05-09  4462  	/*
1493a1913e34b0 David Hildenbrand       2022-05-09  4463  	 * Check under PT lock (to protect against concurrent fork() sharing
1493a1913e34b0 David Hildenbrand       2022-05-09  4464  	 * the swap entry concurrently) for certainly exclusive pages.
1493a1913e34b0 David Hildenbrand       2022-05-09  4465  	 */
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4466) 	if (!folio_test_ksm(folio)) {
1493a1913e34b0 David Hildenbrand       2022-05-09  4467  		exclusive = pte_swp_exclusive(vmf->orig_pte);
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4468) 		if (folio != swapcache) {
1493a1913e34b0 David Hildenbrand       2022-05-09  4469  			/*
1493a1913e34b0 David Hildenbrand       2022-05-09  4470  			 * We have a fresh page that is not exposed to the
1493a1913e34b0 David Hildenbrand       2022-05-09  4471  			 * swapcache -> certainly exclusive.
1493a1913e34b0 David Hildenbrand       2022-05-09  4472  			 */
1493a1913e34b0 David Hildenbrand       2022-05-09  4473  			exclusive = true;
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4474) 		} else if (exclusive && folio_test_writeback(folio) &&
eacde32757c756 Miaohe Lin              2022-05-19  4475  			  data_race(si->flags & SWP_STABLE_WRITES)) {
1493a1913e34b0 David Hildenbrand       2022-05-09  4476  			/*
1493a1913e34b0 David Hildenbrand       2022-05-09  4477  			 * This is tricky: not all swap backends support
1493a1913e34b0 David Hildenbrand       2022-05-09  4478  			 * concurrent page modifications while under writeback.
1493a1913e34b0 David Hildenbrand       2022-05-09  4479  			 *
1493a1913e34b0 David Hildenbrand       2022-05-09  4480  			 * So if we stumble over such a page in the swapcache
1493a1913e34b0 David Hildenbrand       2022-05-09  4481  			 * we must not set the page exclusive, otherwise we can
1493a1913e34b0 David Hildenbrand       2022-05-09  4482  			 * map it writable without further checks and modify it
1493a1913e34b0 David Hildenbrand       2022-05-09  4483  			 * while still under writeback.
1493a1913e34b0 David Hildenbrand       2022-05-09  4484  			 *
1493a1913e34b0 David Hildenbrand       2022-05-09  4485  			 * For these problematic swap backends, simply drop the
1493a1913e34b0 David Hildenbrand       2022-05-09  4486  			 * exclusive marker: this is perfectly fine as we start
1493a1913e34b0 David Hildenbrand       2022-05-09  4487  			 * writeback only if we fully unmapped the page and
1493a1913e34b0 David Hildenbrand       2022-05-09  4488  			 * there are no unexpected references on the page after
1493a1913e34b0 David Hildenbrand       2022-05-09  4489  			 * unmapping succeeded. After fully unmapped, no
1493a1913e34b0 David Hildenbrand       2022-05-09  4490  			 * further GUP references (FOLL_GET and FOLL_PIN) can
1493a1913e34b0 David Hildenbrand       2022-05-09  4491  			 * appear, so dropping the exclusive marker and mapping
1493a1913e34b0 David Hildenbrand       2022-05-09  4492  			 * it only R/O is fine.
1493a1913e34b0 David Hildenbrand       2022-05-09  4493  			 */
1493a1913e34b0 David Hildenbrand       2022-05-09  4494  			exclusive = false;
1493a1913e34b0 David Hildenbrand       2022-05-09  4495  		}
1493a1913e34b0 David Hildenbrand       2022-05-09  4496  	}
1493a1913e34b0 David Hildenbrand       2022-05-09  4497  
6dca4ac6fc91fd Peter Collingbourne     2023-05-22  4498  	/*
6dca4ac6fc91fd Peter Collingbourne     2023-05-22  4499  	 * Some architectures may have to restore extra metadata to the page
6dca4ac6fc91fd Peter Collingbourne     2023-05-22  4500  	 * when reading from swap. This metadata may be indexed by swap entry
6dca4ac6fc91fd Peter Collingbourne     2023-05-22  4501  	 * so this must be called before swap_free().
6dca4ac6fc91fd Peter Collingbourne     2023-05-22  4502  	 */
f238b8c33c6738 Barry Song              2024-03-23  4503  	arch_swap_restore(folio_swap(entry, folio), folio);
6dca4ac6fc91fd Peter Collingbourne     2023-05-22  4504  
8c7c6e34a1256a KAMEZAWA Hiroyuki       2009-01-07  4505  	/*
c145e0b47c77eb David Hildenbrand       2022-03-24  4506  	 * Remove the swap entry and conditionally try to free up the swapcache.
c145e0b47c77eb David Hildenbrand       2022-03-24  4507  	 * We're already holding a reference on the page but haven't mapped it
c145e0b47c77eb David Hildenbrand       2022-03-24  4508  	 * yet.
8c7c6e34a1256a KAMEZAWA Hiroyuki       2009-01-07  4509  	 */
508758960b8d89 Chuanhua Han            2024-05-29 @4510  	swap_free_nr(entry, nr_pages);
a160e5377b55bc Matthew Wilcox (Oracle  2022-09-02  4511) 	if (should_try_to_free_swap(folio, vma, vmf->flags))
a160e5377b55bc Matthew Wilcox (Oracle  2022-09-02  4512) 		folio_free_swap(folio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  4513  
508758960b8d89 Chuanhua Han            2024-05-29  4514  	add_mm_counter(vma->vm_mm, MM_ANONPAGES, nr_pages);
508758960b8d89 Chuanhua Han            2024-05-29  4515  	add_mm_counter(vma->vm_mm, MM_SWAPENTS, -nr_pages);
^1da177e4c3f41 Linus Torvalds          2005-04-16  4516  	pte = mk_pte(page, vma->vm_page_prot);
c18160dba5ff63 Barry Song              2024-06-02  4517  	if (pte_swp_soft_dirty(vmf->orig_pte))
c18160dba5ff63 Barry Song              2024-06-02  4518  		pte = pte_mksoft_dirty(pte);
c18160dba5ff63 Barry Song              2024-06-02  4519  	if (pte_swp_uffd_wp(vmf->orig_pte))
c18160dba5ff63 Barry Song              2024-06-02  4520  		pte = pte_mkuffd_wp(pte);
c145e0b47c77eb David Hildenbrand       2022-03-24  4521  
c145e0b47c77eb David Hildenbrand       2022-03-24  4522  	/*
1493a1913e34b0 David Hildenbrand       2022-05-09  4523  	 * Same logic as in do_wp_page(); however, optimize for pages that are
1493a1913e34b0 David Hildenbrand       2022-05-09  4524  	 * certainly not shared either because we just allocated them without
1493a1913e34b0 David Hildenbrand       2022-05-09  4525  	 * exposing them to the swapcache or because the swap entry indicates
1493a1913e34b0 David Hildenbrand       2022-05-09  4526  	 * exclusivity.
c145e0b47c77eb David Hildenbrand       2022-03-24  4527  	 */
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4528) 	if (!folio_test_ksm(folio) &&
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4529) 	    (exclusive || folio_ref_count(folio) == 1)) {
c18160dba5ff63 Barry Song              2024-06-02  4530  		if ((vma->vm_flags & VM_WRITE) && !userfaultfd_pte_wp(vma, pte) &&
20dfa5b7adc5a1 Barry Song              2024-06-08  4531  		    !pte_needs_soft_dirty_wp(vma, pte)) {
c18160dba5ff63 Barry Song              2024-06-02  4532  			pte = pte_mkwrite(pte, vma);
6c287605fd5646 David Hildenbrand       2022-05-09  4533  			if (vmf->flags & FAULT_FLAG_WRITE) {
c18160dba5ff63 Barry Song              2024-06-02  4534  				pte = pte_mkdirty(pte);
82b0f8c39a3869 Jan Kara                2016-12-14  4535  				vmf->flags &= ~FAULT_FLAG_WRITE;
6c287605fd5646 David Hildenbrand       2022-05-09  4536  			}
c18160dba5ff63 Barry Song              2024-06-02  4537  		}
14f9135d547060 David Hildenbrand       2022-05-09  4538  		rmap_flags |= RMAP_EXCLUSIVE;
^1da177e4c3f41 Linus Torvalds          2005-04-16  4539  	}
508758960b8d89 Chuanhua Han            2024-05-29  4540  	folio_ref_add(folio, nr_pages - 1);
508758960b8d89 Chuanhua Han            2024-05-29  4541  	flush_icache_pages(vma, page, nr_pages);
508758960b8d89 Chuanhua Han            2024-05-29  4542  	vmf->orig_pte = pte_advance_pfn(pte, page_idx);
0bcac06f27d752 Minchan Kim             2017-11-15  4543  
0bcac06f27d752 Minchan Kim             2017-11-15  4544  	/* ksm created a completely new copy */
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4545) 	if (unlikely(folio != swapcache && swapcache)) {
15bde4abab734c Barry Song              2024-06-18  4546  		folio_add_new_anon_rmap(folio, vma, address, RMAP_EXCLUSIVE);
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4547) 		folio_add_lru_vma(folio, vma);
9ae2feacedde16 Barry Song              2024-06-18  4548  	} else if (!folio_test_anon(folio)) {
9ae2feacedde16 Barry Song              2024-06-18  4549  		/*
242d12c9817458 Chuanhua Han            2024-09-09  4550  		 * We currently only expect small !anon folios which are either
242d12c9817458 Chuanhua Han            2024-09-09  4551  		 * fully exclusive or fully shared, or new allocated large
242d12c9817458 Chuanhua Han            2024-09-09  4552  		 * folios which are fully exclusive. If we ever get large
242d12c9817458 Chuanhua Han            2024-09-09  4553  		 * folios within swapcache here, we have to be careful.
9ae2feacedde16 Barry Song              2024-06-18  4554  		 */
242d12c9817458 Chuanhua Han            2024-09-09  4555  		VM_WARN_ON_ONCE(folio_test_large(folio) && folio_test_swapcache(folio));
9ae2feacedde16 Barry Song              2024-06-18  4556  		VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
9ae2feacedde16 Barry Song              2024-06-18  4557  		folio_add_new_anon_rmap(folio, vma, address, rmap_flags);
0bcac06f27d752 Minchan Kim             2017-11-15  4558  	} else {
508758960b8d89 Chuanhua Han            2024-05-29  4559  		folio_add_anon_rmap_ptes(folio, page, nr_pages, vma, address,
b832a354d787bf David Hildenbrand       2023-12-20  4560  					rmap_flags);
00501b531c4723 Johannes Weiner         2014-08-08  4561  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  4562  
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4563) 	VM_BUG_ON(!folio_test_anon(folio) ||
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4564) 			(pte_write(pte) && !PageAnonExclusive(page)));
508758960b8d89 Chuanhua Han            2024-05-29  4565  	set_ptes(vma->vm_mm, address, ptep, pte, nr_pages);
508758960b8d89 Chuanhua Han            2024-05-29  4566  	arch_do_swap_page_nr(vma->vm_mm, vma, address,
508758960b8d89 Chuanhua Han            2024-05-29  4567  			pte, pte, nr_pages);
1eba86c096e35e Pasha Tatashin          2022-01-14  4568  
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4569) 	folio_unlock(folio);
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4570) 	if (folio != swapcache && swapcache) {
4969c1192d15af Andrea Arcangeli        2010-09-09  4571  		/*
4969c1192d15af Andrea Arcangeli        2010-09-09  4572  		 * Hold the lock to avoid the swap entry to be reused
4969c1192d15af Andrea Arcangeli        2010-09-09  4573  		 * until we take the PT lock for the pte_same() check
4969c1192d15af Andrea Arcangeli        2010-09-09  4574  		 * (to avoid false positives from pte_same). For
4969c1192d15af Andrea Arcangeli        2010-09-09  4575  		 * further safety release the lock after the swap_free
4969c1192d15af Andrea Arcangeli        2010-09-09  4576  		 * so that the swap count won't change under a
4969c1192d15af Andrea Arcangeli        2010-09-09  4577  		 * parallel locked swapcache.
4969c1192d15af Andrea Arcangeli        2010-09-09  4578  		 */
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4579) 		folio_unlock(swapcache);
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4580) 		folio_put(swapcache);
4969c1192d15af Andrea Arcangeli        2010-09-09  4581  	}
c475a8ab625d56 Hugh Dickins            2005-06-21  4582  
82b0f8c39a3869 Jan Kara                2016-12-14  4583  	if (vmf->flags & FAULT_FLAG_WRITE) {
2994302bc8a171 Jan Kara                2016-12-14  4584  		ret |= do_wp_page(vmf);
61469f1d51777f Hugh Dickins            2008-03-04  4585  		if (ret & VM_FAULT_ERROR)
61469f1d51777f Hugh Dickins            2008-03-04  4586  			ret &= VM_FAULT_ERROR;
^1da177e4c3f41 Linus Torvalds          2005-04-16  4587  		goto out;
^1da177e4c3f41 Linus Torvalds          2005-04-16  4588  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  4589  
^1da177e4c3f41 Linus Torvalds          2005-04-16  4590  	/* No need to invalidate - it was non-present before */
508758960b8d89 Chuanhua Han            2024-05-29  4591  	update_mmu_cache_range(vmf, vma, address, ptep, nr_pages);
65500d234e74fc Hugh Dickins            2005-10-29  4592  unlock:
3db82b9374ca92 Hugh Dickins            2023-06-08  4593  	if (vmf->pte)
82b0f8c39a3869 Jan Kara                2016-12-14  4594  		pte_unmap_unlock(vmf->pte, vmf->ptl);
^1da177e4c3f41 Linus Torvalds          2005-04-16  4595  out:
13ddaf26be324a Kairui Song             2024-02-07  4596  	/* Clear the swap cache pin for direct swapin after PTL unlock */
13ddaf26be324a Kairui Song             2024-02-07  4597  	if (need_clear_cache)
242d12c9817458 Chuanhua Han            2024-09-09  4598  		swapcache_clear(si, entry, nr_pages);
2799e77529c2a2 Miaohe Lin              2021-06-28  4599  	if (si)
2799e77529c2a2 Miaohe Lin              2021-06-28  4600  		put_swap_device(si);
^1da177e4c3f41 Linus Torvalds          2005-04-16  4601  	return ret;
b81074800b98ac Kirill Korotaev         2005-05-16  4602  out_nomap:
3db82b9374ca92 Hugh Dickins            2023-06-08  4603  	if (vmf->pte)
82b0f8c39a3869 Jan Kara                2016-12-14  4604  		pte_unmap_unlock(vmf->pte, vmf->ptl);
bc43f75cd98158 Johannes Weiner         2009-04-30  4605  out_page:
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4606) 	folio_unlock(folio);
4779cb31c0ee3b Andi Kleen              2009-10-14  4607  out_release:
63ad4add382305 Matthew Wilcox (Oracle  2022-09-02  4608) 	folio_put(folio);
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4609) 	if (folio != swapcache && swapcache) {
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4610) 		folio_unlock(swapcache);
d4f9565ae598bd Matthew Wilcox (Oracle  2022-09-02  4611) 		folio_put(swapcache);
4969c1192d15af Andrea Arcangeli        2010-09-09  4612  	}
13ddaf26be324a Kairui Song             2024-02-07  4613  	if (need_clear_cache)
242d12c9817458 Chuanhua Han            2024-09-09  4614  		swapcache_clear(si, entry, nr_pages);
2799e77529c2a2 Miaohe Lin              2021-06-28  4615  	if (si)
2799e77529c2a2 Miaohe Lin              2021-06-28  4616  		put_swap_device(si);
65500d234e74fc Hugh Dickins            2005-10-29  4617  	return ret;
^1da177e4c3f41 Linus Torvalds          2005-04-16  4618  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  4619  

:::::: The code at line 4510 was first introduced by commit
:::::: 508758960b8d89fa464abce2f9897973c8e8d4f0 mm: swap: entirely map large folios found in swapcache

:::::: TO: Chuanhua Han <hanchuanhua@oppo.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
