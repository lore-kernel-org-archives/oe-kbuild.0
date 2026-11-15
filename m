Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794770802;
	b=R9Lv+KYELTV4o/wBuW9DYgqc76llGeLZr+QzpAlWQiTKgTHjFyo2dojPuc2obrVd0Ppx
	 6Myq2muXwMyJeTyPyxKpO56aWZKYnYPcEYBdQROXiDfdHA8ZGrXJjDrlBnHkuMOGO6J4Z
	 aiypXwH/jYofKF+4y0Vy9EuunJlExu/Cc9KACEZnY45qsOPcEwFPuh9DJt/oaK7r0BwbF
	 WE2LbqmDR2jm7/ruGEprBTF/XtkuKgEwOQ6tr3RUCacmjSoon1JNHAibeHkKksxmPKd/4
	 GOmISCtur0i7bqS2KjDFVrSFwrkuQnfR1ydL8ijTGb/cD0u5DsK33WQSWCrtWaMsgpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794770802;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=UJNi1jFsuUS6zRwCcdPwCWdRZ5fpDdJvOsKiSv2uQW0=;
	b=wBKtDlbfz5IALoeItE7vbMxS/EnT2Fxm4leK9a68n7uJBhC867VplEX+Pf+1MLFHftwj
	 3SAP54+CRIrPWwZeQxQsVYMTpuwum7tZv9pV8FNzNa3CJn0laYdiEO+qEqtU9wht3xMiS
	 W6sh35YUwzSSlnxVI1GJmP6G50jTnFDHEB9OX/oR0zQ4DEnqM3pKuTqEfcCz+tPQ4c7SP
	 zm6hXziDN3+Cem3CZV7lgR4e+UpjuIExBTjRIjusGwoeDhtp2eNIro44McPFgAnHL5ucf
	 rDX9dRhCBR8EHbcUBrTvGJSbSzy28AZkWw7ysJxmyd9D1d9eeHlWbnEopInq9smZ7xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M8aas+W4;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64127606A32C
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 19:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64127606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M8aas+W4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794770800; x=1826306800;
  h=date:from:to:cc:subject:message-id;
  bh=24JJUyocrcjhPIw1dpFzkoFDQlv67Mxs6Tn0jrrpO2Y=;
  b=M8aas+W4KYmToNSyz+vMhWDVJNrM2cXJvA4OzxqWLE8wTVIJ2WFhE+ot
   7irjKQpaf5z+nOSwM+FZMGFO65abzKHRbVmxZx0v48SFYhEMHKLc/TUk5
   vhzfSRNgGXtr0UetsVUkEsSLrZSwCa1MTIR/aCgs5lWLwLhI0rCDeBSGf
   UADuk06c5iO/njCVdpvsydxorKdUsesazCfk09vl/1sBDjSoRvKW1bWmP
   SMZGVF35V0Y8TW+6Y+MBBdLK0G1+Igkgom/PYljj+i66w6fVP6b0FJYPK
   ziirFvgQxHsi586yK8sZSIQCnffhQOGF+SRpGBPaANCg2f6WSCqp+N2qk
   Q==;
X-CSE-ConnectionGUID: B3KAGdL2RiONvSjkCwb1Pw==
X-CSE-MsgGUID: 43WL00PpQPOiol+kf8EwuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3612946"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3612946"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 11:26:40 -0800
X-CSE-ConnectionGUID: KNeGuAhTR4qSOfUZYXOPtw==
X-CSE-MsgGUID: zQHmJmG3TXWtXDxkgTnM+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9692085"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 15 Nov 2026 11:26:39 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSfs4-000000002Mb-1ZSH;
	Sun, 15 Nov 2026 19:26:36 +0000
Date: Sun, 15 Nov 2026 20:26:26 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 26/7428]
 include/asm-generic/pgtable-nop4d.h:9:18: error: unknown type name 'pgd_t'
Message-ID: <202611152046.D8xhCaxp-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Hi Matthew,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   84abb955b1015477aa11a96e2f3ac1b938b77f48
commit: 2854902575ac6d6cfa97e1bf0f134b718d65b16b [26/7428] drm: Remove pagemap from ttm_tt.h header
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: openrisc-randconfig-r2107-20261115 (https://download.01.org/0day-ci/archive/20261115/202611152046.D8xhCaxp-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611152046.D8xhCaxp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611152046.D8xhCaxp-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/asm-generic/pgtable-nopud.h:7,
                    from include/asm-generic/pgtable-nopmd.h:7,
                    from arch/openrisc/include/asm/pgtable.h:24,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
>> include/asm-generic/pgtable-nop4d.h:9:18: error: unknown type name 'pgd_t'
       9 | typedef struct { pgd_t pgd; } p4d_t;
         |                  ^~~~~
   include/asm-generic/pgtable-nop4d.h:21:28: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      21 | static inline int pgd_none(pgd_t pgd)           { return 0; }
         |                            ^~~~~
         |                            p4d_t
   include/asm-generic/pgtable-nop4d.h:22:27: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      22 | static inline int pgd_bad(pgd_t pgd)            { return 0; }
         |                           ^~~~~
         |                           p4d_t
   include/asm-generic/pgtable-nop4d.h:23:31: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      23 | static inline int pgd_present(pgd_t pgd)        { return 1; }
         |                               ^~~~~
         |                               p4d_t
   include/asm-generic/pgtable-nop4d.h:24:30: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      24 | static inline void pgd_clear(pgd_t *pgd)        { }
         |                              ^~~~~
         |                              p4d_t
   include/asm-generic/pgtable-nop4d.h:35:33: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      35 | static inline p4d_t *p4d_offset(pgd_t *pgd, unsigned long address)
         |                                 ^~~~~
         |                                 p4d_t
   In file included from arch/openrisc/include/asm/fixmap.h:27,
                    from arch/openrisc/include/asm/pgtable.h:28,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   arch/openrisc/include/asm/pgtable.h: In function 'pmd_set':
>> arch/openrisc/include/asm/page.h:50:29: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:50: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)                              (pud_val((x).pud))
         |                                                  ^~~~~~~
   arch/openrisc/include/asm/pgtable.h:323:9: note: in expansion of macro 'pmd_val'
     323 |         pmd_val(*pmdp) = _KERNPG_TABLE | (unsigned long) ptep;
         |         ^~~~~~~
   arch/openrisc/include/asm/pgtable.h: In function 'pmd_page_vaddr':
>> arch/openrisc/include/asm/page.h:50:29: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   arch/openrisc/include/asm/page.h:62:43: note: in definition of macro '__va'
      62 | #define __va(x) ((void *)((unsigned long)(x) + PAGE_OFFSET))
         |                                           ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:50: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)                              (pud_val((x).pud))
         |                                                  ^~~~~~~
   arch/openrisc/include/asm/pgtable.h:331:38: note: in expansion of macro 'pmd_val'
     331 |         return ((unsigned long) __va(pmd_val(pmd) & PAGE_MASK));
         |                                      ^~~~~~~
   In file included from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   arch/openrisc/include/asm/pgtable.h:329:50: warning: parameter 'pmd' set but not used [-Wunused-but-set-parameter]
     329 | static inline unsigned long pmd_page_vaddr(pmd_t pmd)
         |                                            ~~~~~~^~~
   In file included from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/linux/pgtable.h: In function 'pmd_off':
>> include/linux/pgtable.h:167:38: error: implicit declaration of function 'p4d_offset'; did you mean 'pmd_offset'? [-Werror=implicit-function-declaration]
     167 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
         |                                      ^~~~~~~~~~
         |                                      pmd_offset
>> include/linux/pgtable.h:167:38: warning: passing argument 1 of 'pud_offset' makes pointer from integer without a cast [-Wint-conversion]
     167 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                      |
         |                                      int
   In file included from include/asm-generic/pgtable-nopmd.h:7,
                    from arch/openrisc/include/asm/pgtable.h:24,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/asm-generic/pgtable-nopud.h:42:40: note: expected 'p4d_t *' but argument is of type 'int'
      42 | static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
         |                                 ~~~~~~~^~~
   In file included from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/linux/pgtable.h: In function 'pmd_off_k':
   include/linux/pgtable.h:172:38: warning: passing argument 1 of 'pud_offset' makes pointer from integer without a cast [-Wint-conversion]
     172 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset_k(va), va), va), va);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                      |
         |                                      int
   In file included from include/asm-generic/pgtable-nopmd.h:7,
                    from arch/openrisc/include/asm/pgtable.h:24,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/asm-generic/pgtable-nopud.h:42:40: note: expected 'p4d_t *' but argument is of type 'int'
      42 | static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
         |                                 ~~~~~~~^~~
   In file included from arch/openrisc/include/asm/fixmap.h:27,
                    from arch/openrisc/include/asm/pgtable.h:28,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/linux/pgtable.h: In function 'virt_to_kpte':
>> arch/openrisc/include/asm/page.h:50:29: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:50: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)                              (pud_val((x).pud))
         |                                                  ^~~~~~~
   arch/openrisc/include/asm/pgtable.h:186:27: note: in expansion of macro 'pmd_val'
     186 | #define pmd_none(x)     (!pmd_val(x))
         |                           ^~~~~~~
   include/linux/pgtable.h:179:16: note: in expansion of macro 'pmd_none'
     179 |         return pmd_none(*pmd) ? NULL : pte_offset_kernel(pmd, vaddr);
         |                ^~~~~~~~
   include/linux/pgtable.h: In function 'pmd_same':
>> arch/openrisc/include/asm/page.h:50:29: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:50: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)                              (pud_val((x).pud))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:1369:16: note: in expansion of macro 'pmd_val'
    1369 |         return pmd_val(pmd_a) == pmd_val(pmd_b);
         |                ^~~~~~~
>> arch/openrisc/include/asm/page.h:50:29: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:50: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)                              (pud_val((x).pud))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:1369:34: note: in expansion of macro 'pmd_val'
    1369 |         return pmd_val(pmd_a) == pmd_val(pmd_b);
         |                                  ^~~~~~~
   In file included from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/linux/pgtable.h:1367:34: warning: parameter 'pmd_a' set but not used [-Wunused-but-set-parameter]
    1367 | static inline int pmd_same(pmd_t pmd_a, pmd_t pmd_b)
         |                            ~~~~~~^~~~~
   include/linux/pgtable.h:1367:47: warning: parameter 'pmd_b' set but not used [-Wunused-but-set-parameter]
    1367 | static inline int pmd_same(pmd_t pmd_a, pmd_t pmd_b)
         |                                         ~~~~~~^~~~~
   In file included from arch/openrisc/include/asm/fixmap.h:27,
                    from arch/openrisc/include/asm/pgtable.h:28,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/linux/pgtable.h: In function 'pud_same':
>> arch/openrisc/include/asm/page.h:50:29: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:1376:16: note: in expansion of macro 'pud_val'
    1376 |         return pud_val(pud_a) == pud_val(pud_b);
         |                ^~~~~~~
>> arch/openrisc/include/asm/page.h:50:29: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:1376:34: note: in expansion of macro 'pud_val'
    1376 |         return pud_val(pud_a) == pud_val(pud_b);
         |                                  ^~~~~~~
   In file included from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/linux/pgtable.h:1374:34: warning: parameter 'pud_a' set but not used [-Wunused-but-set-parameter]
    1374 | static inline int pud_same(pud_t pud_a, pud_t pud_b)
         |                            ~~~~~~^~~~~
   include/linux/pgtable.h:1374:47: warning: parameter 'pud_b' set but not used [-Wunused-but-set-parameter]
    1374 | static inline int pud_same(pud_t pud_a, pud_t pud_b)
         |                                         ~~~~~~^~~~~
   In file included from arch/openrisc/include/asm/fixmap.h:27,
                    from arch/openrisc/include/asm/pgtable.h:28,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/linux/pgtable.h: In function 'p4d_same':
>> arch/openrisc/include/asm/page.h:50:29: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:1384:16: note: in expansion of macro 'p4d_val'
    1384 |         return p4d_val(p4d_a) == p4d_val(p4d_b);
         |                ^~~~~~~
>> arch/openrisc/include/asm/page.h:50:29: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:1384:34: note: in expansion of macro 'p4d_val'
    1384 |         return p4d_val(p4d_a) == p4d_val(p4d_b);
         |                                  ^~~~~~~
   In file included from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/linux/pgtable.h:1382:34: warning: parameter 'p4d_a' set but not used [-Wunused-but-set-parameter]
    1382 | static inline int p4d_same(p4d_t p4d_a, p4d_t p4d_b)
         |                            ~~~~~~^~~~~
   include/linux/pgtable.h:1382:47: warning: parameter 'p4d_b' set but not used [-Wunused-but-set-parameter]
    1382 | static inline int p4d_same(p4d_t p4d_a, p4d_t p4d_b)
         |                                         ~~~~~~^~~~~
   include/linux/pgtable.h: In function 'pgd_none_or_clear_bad':
>> include/linux/pgtable.h:1544:13: error: implicit declaration of function 'pgd_none'; did you mean 'pud_none'? [-Werror=implicit-function-declaration]
    1544 |         if (pgd_none(*pgd))
         |             ^~~~~~~~
         |             pud_none
   In file included from include/linux/export.h:5,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:6:
>> include/linux/pgtable.h:1546:22: error: implicit declaration of function 'pgd_bad'; did you mean 'pud_bad'? [-Werror=implicit-function-declaration]
    1546 |         if (unlikely(pgd_bad(*pgd))) {
         |                      ^~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   In file included from arch/openrisc/include/asm/fixmap.h:27,
                    from arch/openrisc/include/asm/pgtable.h:28,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/linux/pgtable.h: In function 'pmd_none_or_clear_bad':
>> arch/openrisc/include/asm/page.h:50:29: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:50: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)                              (pud_val((x).pud))
         |                                                  ^~~~~~~
   arch/openrisc/include/asm/pgtable.h:186:27: note: in expansion of macro 'pmd_val'
     186 | #define pmd_none(x)     (!pmd_val(x))
         |                           ^~~~~~~
   include/linux/pgtable.h:1577:13: note: in expansion of macro 'pmd_none'
    1577 |         if (pmd_none(*pmd))
         |             ^~~~~~~~
   In file included from include/linux/export.h:5,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:6:
>> arch/openrisc/include/asm/page.h:50:29: error: request for member 'pgd' in something not a structure or union
      50 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:50: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)                              (pud_val((x).pud))
         |                                                  ^~~~~~~
   arch/openrisc/include/asm/pgtable.h:187:27: note: in expansion of macro 'pmd_val'
     187 | #define pmd_bad(x)      ((pmd_val(x) & (~PAGE_MASK)) != _KERNPG_TABLE)
         |                           ^~~~~~~
   include/linux/pgtable.h:1579:22: note: in expansion of macro 'pmd_bad'
    1579 |         if (unlikely(pmd_bad(*pmd))) {
         |                      ^~~~~~~
   In file included from arch/openrisc/include/asm/pgalloc.h:20,
                    from arch/openrisc/include/asm/io.h:18,
                    from include/linux/io.h:12,
                    from include/linux/iosys-map.h:10,
                    from include/drm/ttm/ttm_resource.h:31,
                    from include/drm/ttm/ttm_device.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h:9,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:10:
   include/linux/mm.h: In function 'p4d_alloc':
>> include/linux/mm.h:3639:22: warning: pointer/integer type mismatch in conditional expression
    3639 |                 NULL : p4d_offset(pgd, address);
         |                      ^
   In file included from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   arch/openrisc/include/asm/pgalloc.h: In function 'pmd_populate':
>> arch/openrisc/include/asm/page.h:54:25: error: incompatible types when initializing type 'int' using type 'pgd_t'
      54 | #define __pgd(x)        ((pgd_t) { (x) })
         |                         ^
   arch/openrisc/include/asm/pgalloc.h:34:9: note: in expansion of macro 'set_pmd'
      34 |         set_pmd(pmd, __pmd(_KERNPG_TABLE +
         |         ^~~~~~~
   include/asm-generic/pgtable-nop4d.h:41:60: note: in expansion of macro '__pgd'
      41 | #define __p4d(x)                                ((p4d_t) { __pgd(x) })
         |                                                            ^~~~~
   include/asm-generic/pgtable-nopud.h:49:60: note: in expansion of macro '__p4d'
      49 | #define __pud(x)                                ((pud_t) { __p4d(x) })
         |                                                            ^~~~~
   include/asm-generic/pgtable-nopmd.h:53:60: note: in expansion of macro '__pud'
      53 | #define __pmd(x)                                ((pmd_t) { __pud(x) } )
         |                                                            ^~~~~
   arch/openrisc/include/asm/pgalloc.h:34:22: note: in expansion of macro '__pmd'
      34 |         set_pmd(pmd, __pmd(_KERNPG_TABLE +
         |                      ^~~~~
   cc1: some warnings being treated as errors


vim +/pgd_t +9 include/asm-generic/pgtable-nop4d.h

048456dcf2c56a Kiryl Shutsemau 2017-03-09   8  
048456dcf2c56a Kiryl Shutsemau 2017-03-09  @9  typedef struct { pgd_t pgd; } p4d_t;
048456dcf2c56a Kiryl Shutsemau 2017-03-09  10  

:::::: The code at line 9 was first introduced by commit
:::::: 048456dcf2c56ad6f6248e2899dda92fb6a613f6 asm-generic: introduce <asm-generic/pgtable-nop4d.h>

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
