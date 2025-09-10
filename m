Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9ED2853F2
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Sep 2025 11:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757505139; cv=none; b=mlPdcha7le80bJgh5sPocbynRSz4oPd3mlA62SY1IhWrXpA0NiimSP+W3wKjbjtSLyGCEoX4JU14cvKoiN7NKzmVTiKtkYy++htEP1/cq/8RW4K4/S1mkiiqE3GUmuD4etRE87C0uWNC3o8CFXRJrljHt+44t8BLwlvFg+OAXU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757505139; c=relaxed/simple;
	bh=5Hp/oKPkHsUuZA6Q1/6gbpTd2B7w0tSqt5NgaPd9o6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hqso42LntZ+FI7RQAZh2lKHj9jiKNIFynbCBHVUqzf/AxLlM6/iI3ALuHZ156yUlCIKRRftKQ3JcY9q8qR9rgadMT29m2T30+PEqlkw5e+ZxStOXRiM/Uk/ot9OoQUdmzduGMmLEnxSkDMxp4Bm3ehz2kHqPJUEpEdgZq6pfWfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PgpypB/Z; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PgpypB/Z"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3e2055ce973so3624900f8f.0
        for <oe-kbuild@lists.linux.dev>; Wed, 10 Sep 2025 04:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757505135; x=1758109935; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcIPCfwPAXxAXbJS6PXfX+4igHbW0m5QEjDzV/8XpOg=;
        b=PgpypB/ZfIsDbHw8hzXj5ZCqn8BYjNs0OsTjfjM99Oh3zcLQFVApZpCTgnrM+6Iyk8
         l7KgogfcKvYFXONf8WYhE4Ka+A2enndaPTEu6ZFUOwpV/k9+m8vqdoxvJdkq83Pb3SWD
         WL9NPwLK/o7dEznxtjBIAZ8XjOU05sZDQKRgxnHIZNnd1bypQCqcz9w/neNASbc1KUFs
         dVbMjY3g6ZS919BFfxlkP5BNRrqpyWdyKJpg2OECqYbUzjLxpusJAEpDGrYO+WOK2JoS
         98nWuYDhzBGdtaTPnaBqAkvBnJopCpnU7KJup8+StHyOU9z8E9KpZeHH0LTQeDqoP0Mz
         +loQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757505135; x=1758109935;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fcIPCfwPAXxAXbJS6PXfX+4igHbW0m5QEjDzV/8XpOg=;
        b=tGafLQexuYm7aZz24wFWtmAJLfK54OTYT5SJzS36QJKrtlAq5G+jd3NoWB3RI0hi8P
         dLtbAI5MZeexvCYz2Cu80pQ1KPqcC3K2w06SevwQ+KAD7/zcPxBS6wL61uleEMojFFJk
         Ls7+EdC1cLntpAng05ukxruITMM1nAaw9W18nlSMoQJKraT4Wa9dOIQIDM0qXrkCh/g3
         YAHjr08IWLBFY7GQJGpZn0butYZ4iJgUaA9a2mbuv4y4WHCU4SeXt7dYyqIIKLdzPM3X
         0xFKl31H8NWSR/rnudw6S3eq6kHwP128hhWzB08Cf6xHawdmn3Bjn9Pg78k6FwIEfcP+
         u1pQ==
X-Gm-Message-State: AOJu0Yysb9mloNdSq2nGYqI/q5ylYVz+6EbniPUM7IfkkYvn6QcWxO3E
	cc+McpCH67/bIMN1AOWhVv7wG5QJZw2Q1ZsHJjBoYgV8ZYzImhwrF9taFA4bF/VMXKbjIEIQ+h/
	k0O70
X-Gm-Gg: ASbGncsPSHJy7gjOyZIVU2IhAl4ZbmEukMHU/z8uCTOBnD9iG2scCgtzuPyfvD9QC6s
	gL9xXi+t8zAaEUDjRqlyalUk1iyArWVJ6LeXkfZVXJsByHS2ZGUs2jXyU1NQuZjV+vUOt2I9dhh
	B8jtcpZpvKi+cSPTJMelyRBPdVnzNSpTOy3wb2pnaF0K7hXxshleCCZCPFryGuYHtU7GE5ddaVl
	Vh60Rx43aCf0EBP36kfNbo5xOdJ/e0aAfPW8Is5A0P1qWhGwdFljSB8onRC/oECuh0UCwSPGnYo
	l9uIxwNZ3BFV6HjlFTBFiM3MDcbRlHAYs9LFIF/jPEvi2YXJxbumvFPAUMXuR7GqnCPz6NBGyBn
	Lb3Y/K1zpmJGu7aBCOvr0RcoVznEPG6nCSyD3Qg==
X-Google-Smtp-Source: AGHT+IH2F4ZDOcfdo6NantUsEJt8pV0AZL+w4GIUouTg1IIKOI6p2mM+egJzAwME+fYT1f1zPKOuKA==
X-Received: by 2002:a05:6000:1a8c:b0:3e4:7f66:8ade with SMTP id ffacd0b85a97d-3e63736f0a6mr11420376f8f.6.1757505135030;
        Wed, 10 Sep 2025 04:52:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e7521ca0e9sm7040166f8f.25.2025.09.10.04.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 04:52:14 -0700 (PDT)
Date: Wed, 10 Sep 2025 14:52:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Balbir Singh <balbirs@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 398/411] mm/huge_memory.c:3069
 __split_huge_pmd_locked() error: uninitialized symbol 'write'.
Message-ID: <202509101756.jkC29gja-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20250910115211.0hxlm1x7sdzDsfTmVP3qJe3OSf50LxOYs9f3eg2DCbg@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   3a0afa6640282ff559b6f4ff432cffc3ecc2bc77
commit: 825d533acfd9573bd1b99f08a80c42fa41fbf07d [398/411] mm/huge_memory: implement device-private THP splitting
config: i386-randconfig-141-20250910 (https://download.01.org/0day-ci/archive/20250910/202509101756.jkC29gja-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509101756.jkC29gja-lkp@intel.com/

smatch warnings:
mm/huge_memory.c:3069 __split_huge_pmd_locked() error: uninitialized symbol 'write'.
mm/huge_memory.c:3078 __split_huge_pmd_locked() error: uninitialized symbol 'young'.

vim +/write +3069 mm/huge_memory.c

eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2875  static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
ba98828088ad3f Kirill A. Shutemov 2016-01-15  2876  		unsigned long haddr, bool freeze)
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2877  {
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2878  	struct mm_struct *mm = vma->vm_mm;
91b2978a348073 David Hildenbrand  2023-12-20  2879  	struct folio *folio;
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2880  	struct page *page;
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2881  	pgtable_t pgtable;
423ac9af3ceff9 Aneesh Kumar K.V   2018-01-31  2882  	pmd_t old_pmd, _pmd;
825d533acfd957 Balbir Singh       2025-09-08  2883  	bool young, write, soft_dirty, uffd_wp = false;
825d533acfd957 Balbir Singh       2025-09-08  2884  	bool anon_exclusive = false, dirty = false, present = false;
2ac015e293bbe3 Kirill A. Shutemov 2016-02-24  2885  	unsigned long addr;
c9c1ee20ee84b1 Hugh Dickins       2023-06-08  2886  	pte_t *pte;
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2887  	int i;
825d533acfd957 Balbir Singh       2025-09-08  2888  	swp_entry_t swp_entry;
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2889  
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2890  	VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2891  	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2892  	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
825d533acfd957 Balbir Singh       2025-09-08  2893  
825d533acfd957 Balbir Singh       2025-09-08  2894  	VM_WARN_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd) &&
825d533acfd957 Balbir Singh       2025-09-08  2895  			!is_pmd_device_private_entry(*pmd));
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2896  
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2897  	count_vm_event(THP_SPLIT_PMD);
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2898  
d21b9e57c74ce8 Kirill A. Shutemov 2016-07-26  2899  	if (!vma_is_anonymous(vma)) {
ec8832d007cb7b Alistair Popple    2023-07-25  2900  		old_pmd = pmdp_huge_clear_flush(vma, haddr, pmd);
953c66c2b22a30 Aneesh Kumar K.V   2016-12-12  2901  		/*
953c66c2b22a30 Aneesh Kumar K.V   2016-12-12  2902  		 * We are going to unmap this huge page. So
953c66c2b22a30 Aneesh Kumar K.V   2016-12-12  2903  		 * just go ahead and zap it
953c66c2b22a30 Aneesh Kumar K.V   2016-12-12  2904  		 */
953c66c2b22a30 Aneesh Kumar K.V   2016-12-12  2905  		if (arch_needs_pgtable_deposit())
953c66c2b22a30 Aneesh Kumar K.V   2016-12-12  2906  			zap_deposited_table(mm, pmd);
38607c62b34b46 Alistair Popple    2025-02-28  2907  		if (!vma_is_dax(vma) && vma_is_special_huge(vma))
d21b9e57c74ce8 Kirill A. Shutemov 2016-07-26  2908  			return;
99fa8a48203d62 Hugh Dickins       2021-06-15  2909  		if (unlikely(is_pmd_migration_entry(old_pmd))) {
99fa8a48203d62 Hugh Dickins       2021-06-15  2910  			swp_entry_t entry;
99fa8a48203d62 Hugh Dickins       2021-06-15  2911  
99fa8a48203d62 Hugh Dickins       2021-06-15  2912  			entry = pmd_to_swp_entry(old_pmd);
439992ff4637ad Kefeng Wang        2024-01-11  2913  			folio = pfn_swap_entry_folio(entry);
38607c62b34b46 Alistair Popple    2025-02-28  2914  		} else if (is_huge_zero_pmd(old_pmd)) {
38607c62b34b46 Alistair Popple    2025-02-28  2915  			return;
99fa8a48203d62 Hugh Dickins       2021-06-15  2916  		} else {
99fa8a48203d62 Hugh Dickins       2021-06-15  2917  			page = pmd_page(old_pmd);
a8e61d584eda0d David Hildenbrand  2023-12-20  2918  			folio = page_folio(page);
a8e61d584eda0d David Hildenbrand  2023-12-20  2919  			if (!folio_test_dirty(folio) && pmd_dirty(old_pmd))
db44c658f798ad David Hildenbrand  2024-01-22  2920  				folio_mark_dirty(folio);
a8e61d584eda0d David Hildenbrand  2023-12-20  2921  			if (!folio_test_referenced(folio) && pmd_young(old_pmd))
a8e61d584eda0d David Hildenbrand  2023-12-20  2922  				folio_set_referenced(folio);
a8e61d584eda0d David Hildenbrand  2023-12-20  2923  			folio_remove_rmap_pmd(folio, page, vma);
a8e61d584eda0d David Hildenbrand  2023-12-20  2924  			folio_put(folio);
99fa8a48203d62 Hugh Dickins       2021-06-15  2925  		}
6b27cc6c66abf0 Kefeng Wang        2024-01-11  2926  		add_mm_counter(mm, mm_counter_file(folio), -HPAGE_PMD_NR);
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2927  		return;
99fa8a48203d62 Hugh Dickins       2021-06-15  2928  	}
99fa8a48203d62 Hugh Dickins       2021-06-15  2929  
3b77e8c8cde581 Hugh Dickins       2021-06-15  2930  	if (is_huge_zero_pmd(*pmd)) {
4645b9fe84bf48 Jérôme Glisse      2017-11-15  2931  		/*
4645b9fe84bf48 Jérôme Glisse      2017-11-15  2932  		 * FIXME: Do we want to invalidate secondary mmu by calling
1af5a8109904b7 Alistair Popple    2023-07-25  2933  		 * mmu_notifier_arch_invalidate_secondary_tlbs() see comments below
1af5a8109904b7 Alistair Popple    2023-07-25  2934  		 * inside __split_huge_pmd() ?
4645b9fe84bf48 Jérôme Glisse      2017-11-15  2935  		 *
4645b9fe84bf48 Jérôme Glisse      2017-11-15  2936  		 * We are going from a zero huge page write protected to zero
4645b9fe84bf48 Jérôme Glisse      2017-11-15  2937  		 * small page also write protected so it does not seems useful
4645b9fe84bf48 Jérôme Glisse      2017-11-15  2938  		 * to invalidate secondary mmu at this time.
4645b9fe84bf48 Jérôme Glisse      2017-11-15  2939  		 */
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2940  		return __split_huge_zero_page_pmd(vma, haddr, pmd);
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2941  	}
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2942  
84c3fc4e9c563d Zi Yan             2017-09-08  2943  
825d533acfd957 Balbir Singh       2025-09-08  2944  	present = pmd_present(*pmd);
825d533acfd957 Balbir Singh       2025-09-08  2945  	if (unlikely(!present)) {
825d533acfd957 Balbir Singh       2025-09-08  2946  		swp_entry = pmd_to_swp_entry(*pmd);
3a5a8d343e1cf9 Ryan Roberts       2024-05-01  2947  		old_pmd = *pmd;
825d533acfd957 Balbir Singh       2025-09-08  2948  
825d533acfd957 Balbir Singh       2025-09-08  2949  		folio = pfn_swap_entry_folio(swp_entry);
825d533acfd957 Balbir Singh       2025-09-08  2950  		VM_WARN_ON(!is_migration_entry(swp_entry) &&
825d533acfd957 Balbir Singh       2025-09-08  2951  				!is_device_private_entry(swp_entry));
825d533acfd957 Balbir Singh       2025-09-08  2952  		page = pfn_swap_entry_to_page(swp_entry);
825d533acfd957 Balbir Singh       2025-09-08  2953  
825d533acfd957 Balbir Singh       2025-09-08  2954  		if (is_pmd_migration_entry(old_pmd)) {
825d533acfd957 Balbir Singh       2025-09-08  2955  			write = is_writable_migration_entry(swp_entry);
6c287605fd5646 David Hildenbrand  2022-05-09  2956  			if (PageAnon(page))
825d533acfd957 Balbir Singh       2025-09-08  2957  				anon_exclusive =
825d533acfd957 Balbir Singh       2025-09-08  2958  					is_readable_exclusive_migration_entry(
825d533acfd957 Balbir Singh       2025-09-08  2959  								swp_entry);
825d533acfd957 Balbir Singh       2025-09-08  2960  			young = is_migration_entry_young(swp_entry);
825d533acfd957 Balbir Singh       2025-09-08  2961  			dirty = is_migration_entry_dirty(swp_entry);
825d533acfd957 Balbir Singh       2025-09-08  2962  		} else if (is_pmd_device_private_entry(old_pmd)) {
825d533acfd957 Balbir Singh       2025-09-08  2963  			write = is_writable_device_private_entry(swp_entry);
825d533acfd957 Balbir Singh       2025-09-08  2964  			anon_exclusive = PageAnonExclusive(page);
825d533acfd957 Balbir Singh       2025-09-08  2965  			if (freeze && anon_exclusive &&
825d533acfd957 Balbir Singh       2025-09-08  2966  			    folio_try_share_anon_rmap_pmd(folio, page))
825d533acfd957 Balbir Singh       2025-09-08  2967  				freeze = false;
825d533acfd957 Balbir Singh       2025-09-08  2968  			if (!freeze) {
825d533acfd957 Balbir Singh       2025-09-08  2969  				rmap_t rmap_flags = RMAP_NONE;
825d533acfd957 Balbir Singh       2025-09-08  2970  
825d533acfd957 Balbir Singh       2025-09-08  2971  				folio_ref_add(folio, HPAGE_PMD_NR - 1);
825d533acfd957 Balbir Singh       2025-09-08  2972  				if (anon_exclusive)
825d533acfd957 Balbir Singh       2025-09-08  2973  					rmap_flags |= RMAP_EXCLUSIVE;
825d533acfd957 Balbir Singh       2025-09-08  2974  
825d533acfd957 Balbir Singh       2025-09-08  2975  				folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
825d533acfd957 Balbir Singh       2025-09-08  2976  						 vma, haddr, rmap_flags);
825d533acfd957 Balbir Singh       2025-09-08  2977  			}

young not initiazed on this path.

825d533acfd957 Balbir Singh       2025-09-08  2978  		}


There isn't an else so young and write aren't initialized.

825d533acfd957 Balbir Singh       2025-09-08  2979  
2e83ee1d8694a6 Peter Xu           2018-12-21  2980  		soft_dirty = pmd_swp_soft_dirty(old_pmd);
f45ec5ff16a75f Peter Xu           2020-04-06  2981  		uffd_wp = pmd_swp_uffd_wp(old_pmd);
2e83ee1d8694a6 Peter Xu           2018-12-21  2982  	} else {
3a5a8d343e1cf9 Ryan Roberts       2024-05-01  2983  		/*
3a5a8d343e1cf9 Ryan Roberts       2024-05-01  2984  		 * Up to this point the pmd is present and huge and userland has
3a5a8d343e1cf9 Ryan Roberts       2024-05-01  2985  		 * the whole access to the hugepage during the split (which
3a5a8d343e1cf9 Ryan Roberts       2024-05-01  2986  		 * happens in place). If we overwrite the pmd with the not-huge
3a5a8d343e1cf9 Ryan Roberts       2024-05-01  2987  		 * version pointing to the pte here (which of course we could if
3a5a8d343e1cf9 Ryan Roberts       2024-05-01  2988  		 * all CPUs were bug free), userland could trigger a small page
3a5a8d343e1cf9 Ryan Roberts       2024-05-01  2989  		 * size TLB miss on the small sized TLB while the hugepage TLB
3a5a8d343e1cf9 Ryan Roberts       2024-05-01  2990  		 * entry is still established in the huge TLB. Some CPU doesn't
3a5a8d343e1cf9 Ryan Roberts       2024-05-01  2991  		 * like that. See
3a5a8d343e1cf9 Ryan Roberts       2024-05-01  2992  		 * http://support.amd.com/TechDocs/41322_10h_Rev_Gd.pdf, Erratum
3a5a8d343e1cf9 Ryan Roberts       2024-05-01  2993  		 * 383 on page 105. Intel should be safe but is also warns that
3a5a8d343e1cf9 Ryan Roberts       2024-05-01  2994  		 * it's only safe if the permission and cache attributes of the
3a5a8d343e1cf9 Ryan Roberts       2024-05-01  2995  		 * two entries loaded in the two TLB is identical (which should
3a5a8d343e1cf9 Ryan Roberts       2024-05-01  2996  		 * be the case here). But it is generally safer to never allow
3a5a8d343e1cf9 Ryan Roberts       2024-05-01  2997  		 * small and huge TLB entries for the same virtual address to be
3a5a8d343e1cf9 Ryan Roberts       2024-05-01  2998  		 * loaded simultaneously. So instead of doing "pmd_populate();
3a5a8d343e1cf9 Ryan Roberts       2024-05-01  2999  		 * flush_pmd_tlb_range();" we first mark the current pmd
3a5a8d343e1cf9 Ryan Roberts       2024-05-01  3000  		 * notpresent (atomically because here the pmd_trans_huge must
3a5a8d343e1cf9 Ryan Roberts       2024-05-01  3001  		 * remain set at all times on the pmd until the split is
3a5a8d343e1cf9 Ryan Roberts       2024-05-01  3002  		 * complete for this pmd), then we flush the SMP TLB and finally
3a5a8d343e1cf9 Ryan Roberts       2024-05-01  3003  		 * we write the non-huge version of the pmd entry with
3a5a8d343e1cf9 Ryan Roberts       2024-05-01  3004  		 * pmd_populate.
3a5a8d343e1cf9 Ryan Roberts       2024-05-01  3005  		 */
3a5a8d343e1cf9 Ryan Roberts       2024-05-01  3006  		old_pmd = pmdp_invalidate(vma, haddr, pmd);
423ac9af3ceff9 Aneesh Kumar K.V   2018-01-31  3007  		page = pmd_page(old_pmd);
91b2978a348073 David Hildenbrand  2023-12-20  3008  		folio = page_folio(page);
0ccf7f168e17bb Peter Xu           2022-08-11  3009  		if (pmd_dirty(old_pmd)) {
0ccf7f168e17bb Peter Xu           2022-08-11  3010  			dirty = true;
91b2978a348073 David Hildenbrand  2023-12-20  3011  			folio_set_dirty(folio);
0ccf7f168e17bb Peter Xu           2022-08-11  3012  		}
423ac9af3ceff9 Aneesh Kumar K.V   2018-01-31  3013  		write = pmd_write(old_pmd);
423ac9af3ceff9 Aneesh Kumar K.V   2018-01-31  3014  		young = pmd_young(old_pmd);
423ac9af3ceff9 Aneesh Kumar K.V   2018-01-31  3015  		soft_dirty = pmd_soft_dirty(old_pmd);
292924b2602474 Peter Xu           2020-04-06  3016  		uffd_wp = pmd_uffd_wp(old_pmd);
6c287605fd5646 David Hildenbrand  2022-05-09  3017  
91b2978a348073 David Hildenbrand  2023-12-20  3018  		VM_WARN_ON_FOLIO(!folio_ref_count(folio), folio);
91b2978a348073 David Hildenbrand  2023-12-20  3019  		VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
6c287605fd5646 David Hildenbrand  2022-05-09  3020  
6c287605fd5646 David Hildenbrand  2022-05-09  3021  		/*
6c287605fd5646 David Hildenbrand  2022-05-09  3022  		 * Without "freeze", we'll simply split the PMD, propagating the
6c287605fd5646 David Hildenbrand  2022-05-09  3023  		 * PageAnonExclusive() flag for each PTE by setting it for
6c287605fd5646 David Hildenbrand  2022-05-09  3024  		 * each subpage -- no need to (temporarily) clear.
6c287605fd5646 David Hildenbrand  2022-05-09  3025  		 *
6c287605fd5646 David Hildenbrand  2022-05-09  3026  		 * With "freeze" we want to replace mapped pages by
6c287605fd5646 David Hildenbrand  2022-05-09  3027  		 * migration entries right away. This is only possible if we
6c287605fd5646 David Hildenbrand  2022-05-09  3028  		 * managed to clear PageAnonExclusive() -- see
6c287605fd5646 David Hildenbrand  2022-05-09  3029  		 * set_pmd_migration_entry().
6c287605fd5646 David Hildenbrand  2022-05-09  3030  		 *
6c287605fd5646 David Hildenbrand  2022-05-09  3031  		 * In case we cannot clear PageAnonExclusive(), split the PMD
6c287605fd5646 David Hildenbrand  2022-05-09  3032  		 * only and let try_to_migrate_one() fail later.
088b8aa537c2c7 David Hildenbrand  2022-09-01  3033  		 *
e3b4b1374f87c7 David Hildenbrand  2023-12-20  3034  		 * See folio_try_share_anon_rmap_pmd(): invalidate PMD first.
6c287605fd5646 David Hildenbrand  2022-05-09  3035  		 */
91b2978a348073 David Hildenbrand  2023-12-20  3036  		anon_exclusive = PageAnonExclusive(page);
e3b4b1374f87c7 David Hildenbrand  2023-12-20  3037  		if (freeze && anon_exclusive &&
e3b4b1374f87c7 David Hildenbrand  2023-12-20  3038  		    folio_try_share_anon_rmap_pmd(folio, page))
6c287605fd5646 David Hildenbrand  2022-05-09  3039  			freeze = false;
91b2978a348073 David Hildenbrand  2023-12-20  3040  		if (!freeze) {
91b2978a348073 David Hildenbrand  2023-12-20  3041  			rmap_t rmap_flags = RMAP_NONE;
91b2978a348073 David Hildenbrand  2023-12-20  3042  
91b2978a348073 David Hildenbrand  2023-12-20  3043  			folio_ref_add(folio, HPAGE_PMD_NR - 1);
91b2978a348073 David Hildenbrand  2023-12-20  3044  			if (anon_exclusive)
91b2978a348073 David Hildenbrand  2023-12-20  3045  				rmap_flags |= RMAP_EXCLUSIVE;
91b2978a348073 David Hildenbrand  2023-12-20  3046  			folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
91b2978a348073 David Hildenbrand  2023-12-20  3047  						 vma, haddr, rmap_flags);
91b2978a348073 David Hildenbrand  2023-12-20  3048  		}
9d84604b845c38 Hugh Dickins       2022-03-22  3049  	}
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  3050  
423ac9af3ceff9 Aneesh Kumar K.V   2018-01-31  3051  	/*
423ac9af3ceff9 Aneesh Kumar K.V   2018-01-31  3052  	 * Withdraw the table only after we mark the pmd entry invalid.
423ac9af3ceff9 Aneesh Kumar K.V   2018-01-31  3053  	 * This's critical for some architectures (Power).
423ac9af3ceff9 Aneesh Kumar K.V   2018-01-31  3054  	 */
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  3055  	pgtable = pgtable_trans_huge_withdraw(mm, pmd);
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  3056  	pmd_populate(mm, &_pmd, pgtable);
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  3057  
c9c1ee20ee84b1 Hugh Dickins       2023-06-08  3058  	pte = pte_offset_map(&_pmd, haddr);
c9c1ee20ee84b1 Hugh Dickins       2023-06-08  3059  	VM_BUG_ON(!pte);
2bdba9868a4ffc Ryan Roberts       2024-02-15  3060  
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  3061  	/*
2bdba9868a4ffc Ryan Roberts       2024-02-15  3062  	 * Note that NUMA hinting access restrictions are not transferred to
2bdba9868a4ffc Ryan Roberts       2024-02-15  3063  	 * avoid any possibility of altering permissions across VMAs.
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  3064  	 */
825d533acfd957 Balbir Singh       2025-09-08  3065  	if (freeze || !present) {
2bdba9868a4ffc Ryan Roberts       2024-02-15  3066  		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
2bdba9868a4ffc Ryan Roberts       2024-02-15  3067  			pte_t entry;
825d533acfd957 Balbir Singh       2025-09-08  3068  			if (freeze || is_migration_entry(swp_entry)) {
4dd845b5a3e57a Alistair Popple    2021-06-30 @3069  				if (write)

Eventually we use write when it's uninitialized.

4dd845b5a3e57a Alistair Popple    2021-06-30  3070  					swp_entry = make_writable_migration_entry(
4dd845b5a3e57a Alistair Popple    2021-06-30  3071  								page_to_pfn(page + i));
6c287605fd5646 David Hildenbrand  2022-05-09  3072  				else if (anon_exclusive)
6c287605fd5646 David Hildenbrand  2022-05-09  3073  					swp_entry = make_readable_exclusive_migration_entry(
6c287605fd5646 David Hildenbrand  2022-05-09  3074  								page_to_pfn(page + i));
4dd845b5a3e57a Alistair Popple    2021-06-30  3075  				else
4dd845b5a3e57a Alistair Popple    2021-06-30  3076  					swp_entry = make_readable_migration_entry(
4dd845b5a3e57a Alistair Popple    2021-06-30  3077  								page_to_pfn(page + i));
2e3468778dbe3e Peter Xu           2022-08-11 @3078  				if (young)

young used here.

2e3468778dbe3e Peter Xu           2022-08-11  3079  					swp_entry = make_migration_entry_young(swp_entry);
2e3468778dbe3e Peter Xu           2022-08-11  3080  				if (dirty)
2e3468778dbe3e Peter Xu           2022-08-11  3081  					swp_entry = make_migration_entry_dirty(swp_entry);
ba98828088ad3f Kirill A. Shutemov 2016-01-15  3082  				entry = swp_entry_to_pte(swp_entry);
804dd150468cfd Andrea Arcangeli   2016-08-25  3083  				if (soft_dirty)
804dd150468cfd Andrea Arcangeli   2016-08-25  3084  					entry = pte_swp_mksoft_dirty(entry);
f45ec5ff16a75f Peter Xu           2020-04-06  3085  				if (uffd_wp)
f45ec5ff16a75f Peter Xu           2020-04-06  3086  					entry = pte_swp_mkuffd_wp(entry);
825d533acfd957 Balbir Singh       2025-09-08  3087  			} else {
825d533acfd957 Balbir Singh       2025-09-08  3088  				/*
825d533acfd957 Balbir Singh       2025-09-08  3089  				 * anon_exclusive was already propagated to the relevant
825d533acfd957 Balbir Singh       2025-09-08  3090  				 * pages corresponding to the pte entries when freeze
825d533acfd957 Balbir Singh       2025-09-08  3091  				 * is false.
825d533acfd957 Balbir Singh       2025-09-08  3092  				 */
825d533acfd957 Balbir Singh       2025-09-08  3093  				if (write)
825d533acfd957 Balbir Singh       2025-09-08  3094  					swp_entry = make_writable_device_private_entry(
825d533acfd957 Balbir Singh       2025-09-08  3095  								page_to_pfn(page + i));
825d533acfd957 Balbir Singh       2025-09-08  3096  				else
825d533acfd957 Balbir Singh       2025-09-08  3097  					swp_entry = make_readable_device_private_entry(
825d533acfd957 Balbir Singh       2025-09-08  3098  								page_to_pfn(page + i));
825d533acfd957 Balbir Singh       2025-09-08  3099  				/*
825d533acfd957 Balbir Singh       2025-09-08  3100  				 * Young and dirty bits are not progated via swp_entry
825d533acfd957 Balbir Singh       2025-09-08  3101  				 */
825d533acfd957 Balbir Singh       2025-09-08  3102  				entry = swp_entry_to_pte(swp_entry);
825d533acfd957 Balbir Singh       2025-09-08  3103  				if (soft_dirty)
825d533acfd957 Balbir Singh       2025-09-08  3104  					entry = pte_swp_mksoft_dirty(entry);
825d533acfd957 Balbir Singh       2025-09-08  3105  				if (uffd_wp)
825d533acfd957 Balbir Singh       2025-09-08  3106  					entry = pte_swp_mkuffd_wp(entry);
825d533acfd957 Balbir Singh       2025-09-08  3107  			}
2bdba9868a4ffc Ryan Roberts       2024-02-15  3108  			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
2bdba9868a4ffc Ryan Roberts       2024-02-15  3109  			set_pte_at(mm, addr, pte + i, entry);
2bdba9868a4ffc Ryan Roberts       2024-02-15  3110  		}
ba98828088ad3f Kirill A. Shutemov 2016-01-15  3111  	} else {
2bdba9868a4ffc Ryan Roberts       2024-02-15  3112  		pte_t entry;
2bdba9868a4ffc Ryan Roberts       2024-02-15  3113  
2bdba9868a4ffc Ryan Roberts       2024-02-15  3114  		entry = mk_pte(page, READ_ONCE(vma->vm_page_prot));
1462c52e9f2b99 David Hildenbrand  2023-04-11  3115  		if (write)
161e393c0f6359 Rick Edgecombe     2023-06-12  3116  			entry = pte_mkwrite(entry, vma);
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  3117  		if (!young)
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  3118  			entry = pte_mkold(entry);
e833bc50340502 Peter Xu           2022-11-25  3119  		/* NOTE: this may set soft-dirty too on some archs */
e833bc50340502 Peter Xu           2022-11-25  3120  		if (dirty)
e833bc50340502 Peter Xu           2022-11-25  3121  			entry = pte_mkdirty(entry);
804dd150468cfd Andrea Arcangeli   2016-08-25  3122  		if (soft_dirty)
804dd150468cfd Andrea Arcangeli   2016-08-25  3123  			entry = pte_mksoft_dirty(entry);
292924b2602474 Peter Xu           2020-04-06  3124  		if (uffd_wp)
292924b2602474 Peter Xu           2020-04-06  3125  			entry = pte_mkuffd_wp(entry);
2bdba9868a4ffc Ryan Roberts       2024-02-15  3126  
2bdba9868a4ffc Ryan Roberts       2024-02-15  3127  		for (i = 0; i < HPAGE_PMD_NR; i++)
2bdba9868a4ffc Ryan Roberts       2024-02-15  3128  			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
2bdba9868a4ffc Ryan Roberts       2024-02-15  3129  
2bdba9868a4ffc Ryan Roberts       2024-02-15  3130  		set_ptes(mm, haddr, pte, entry, HPAGE_PMD_NR);
ba98828088ad3f Kirill A. Shutemov 2016-01-15  3131  	}
2bdba9868a4ffc Ryan Roberts       2024-02-15  3132  	pte_unmap(pte);
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  3133  
825d533acfd957 Balbir Singh       2025-09-08  3134  	if (!is_pmd_migration_entry(*pmd))
a8e61d584eda0d David Hildenbrand  2023-12-20  3135  		folio_remove_rmap_pmd(folio, page, vma);
96d82deb743ab4 Hugh Dickins       2022-11-22  3136  	if (freeze)
96d82deb743ab4 Hugh Dickins       2022-11-22  3137  		put_page(page);
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  3138  
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  3139  	smp_wmb(); /* make pte visible before pmd */
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  3140  	pmd_populate(mm, pmd, pgtable);
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  3141  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

