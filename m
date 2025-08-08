Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41B82222C0
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Aug 2025 06:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754633920; cv=none; b=X60IxIc5LZrHbDevjOcsxr45oobuXDBvG+lM+nLdBoyjKj73D5RC8VScussWGzVY/Pg7cbAows7ZkdwKDC2VyQRfHc/1Foppy1KxTLPcPN4eEUpq4D+eSXMhNJHmwS2a2yhX9fI8ovAgw98ImT9MOOMgKRsL8H12Y7J9BnRkxqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754633920; c=relaxed/simple;
	bh=5jyhpgt+BDxkaxZZBWU0KD1x+ZIQgHTRC0xAKTuRQOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=lKfYxb1YMUHUSylpJkBxbfEj7ZHYsrawVj6CAJrFVh7H+oU6HDSwO9bkQzFsD8hXc1ojMLe/8A4H8u8/16rRyhq7HiNnlDfjgey8uzLhBbNvttleVohGa5aFgcZQ6IoJDRRhJTNdZIt6alR5Wqz4l6x4N0xGfvjzPJzWaqmva2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gClibKVq; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gClibKVq"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b786421e36so863773f8f.3
        for <oe-kbuild@lists.linux.dev>; Thu, 07 Aug 2025 23:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754633916; x=1755238716; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P7RIsXB68e0SHO66jn538SbRetR4ixeEsGHY8vTLjIc=;
        b=gClibKVqqpk57miG+uQaU7WjXazEEjuXr5GUFIxmsJOMFjpnKKHCqDlh+EsHYL2L4A
         A73UtRu90Z64Sl86q2nD80adV6VeYGjp4YkcHOginoneVDxWZZnNkOd1ahuguYUU3IrX
         WLxObl+Ssx0clKbVIDVIJiBz2lxC6tubznja6UmdnJm3XeBef+q5A3BoYAUNSDvJRcau
         ome7l1Y2LAjpPxP6pDW7Hy4xroZsNZzaT85CY5Zc1V6V7DHdLV/Xb/fxdgNnXjdPKEun
         TyK+CgK448Utu7fk2kyBG0LrHdhLQ7vAcxwtqjQ7C1ow/l1+m+EMXCfVjL6bgCGRV1Ih
         UBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754633916; x=1755238716;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7RIsXB68e0SHO66jn538SbRetR4ixeEsGHY8vTLjIc=;
        b=Q6Z/h0qti2XrGoabli4cCLDH3wXLzhIX2l0+0AVBRBIxrwR0boEgl7Bqw5R9k4bVO6
         x03b0Nv0/Q90qy+3c93crDqhfdPQifCX4AAATUj4fM3QZyJmJwoh55rpzFDPILVPGLuO
         LbeNOCX2/pKyXj4lGBEb5IrLdufKnN538hNzp6zKnYjF6vWHv7kTUSxUtPW3EB2XTsbF
         SzsQipb9bpkTEwijY2HaO9lIjPYVmbBzeF1oQtqQtrMFKJh/WnROAGktF2SF0bjdvRgN
         eH6fi7dH8GilSDFTOtK53W4r1D8oW6qsyiHlUQ/ZeIa8ZVih5XbamG7r6vWUwFeKcuQX
         BL4A==
X-Gm-Message-State: AOJu0Yybuj9ZOK14YQE5myM/XU4SPYNzqgCUkYxMEfPq9w75/3VgHW6f
	v7ZzY9X4HEd6zZvL3ALkc7xONKFnlDd8A+OvAX1WyH73QQ+rSncE1gVevg53kJwZbrtLOAmXxBe
	X51W+
X-Gm-Gg: ASbGnctUr1QOESjRj3WwWBAPdRPa9kCRDanxlXJSkUS6RQu72c/D9XOq21rVV9Rh2Xu
	eudzDAuf3/SDte9/3c6mdx5yRD+5V/0Ade59MnWXDe4UMKXR3Hixo4pjlfmIm/u9/qMjJudHp/p
	JQsIWdSuqvZXTl4mvC+uEPbZdao/T2qUmAOczJv2QK69rYLzRi+I2kiJE411zyySTP0z2EO0w/f
	6XaKuCWi/WPnCnk3wi9Oy3haK9QoIUlqEfy3n8wd3xl6kPEewMzqbUYhTCbc15FbjBJjCzO+fdj
	H0pl5iJKLMSsFiV3g7QmpycY0Lw+7pcjsG3gtbaptYXqNNx5OKUsZd2VAdNPWXeRoszVlMW2G1Y
	ZQ48+U9BcAejIkimDIarIf5iAuOo=
X-Google-Smtp-Source: AGHT+IEDLRIQ9owcf9ThKRXWFI12UhGQS8vV/ePq5BRuHjymZcYzzH9Mcmd5jexSCMSdAkCMzo1UcA==
X-Received: by 2002:a05:6000:2dc2:b0:3a4:d9fa:f1ed with SMTP id ffacd0b85a97d-3b900b2d7a2mr1371816f8f.13.1754633915858;
        Thu, 07 Aug 2025 23:18:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e79ef4c8sm109017825e9.6.2025.08.07.23.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 23:18:35 -0700 (PDT)
Date: Fri, 8 Aug 2025 09:18:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Lokesh Gidra <lokeshgidra@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] userfaultfd: opportunistic TLB-flush batching for
 present pages in MOVE
Message-ID: <66de1a4d-b98b-4b37-9050-4a4ae69e2af7@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807103902.2242717-1-lokeshgidra@google.com>

Hi Lokesh,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Lokesh-Gidra/userfaultfd-opportunistic-TLB-flush-batching-for-present-pages-in-MOVE/20250807-184025
base:   6e64f4580381e32c06ee146ca807c555b8f73e24
patch link:    https://lore.kernel.org/r/20250807103902.2242717-1-lokeshgidra%40google.com
patch subject: [PATCH v3] userfaultfd: opportunistic TLB-flush batching for present pages in MOVE
config: openrisc-randconfig-r071-20250808 (https://download.01.org/0day-ci/archive/20250808/202508080639.Cf7SyRwQ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508080639.Cf7SyRwQ-lkp@intel.com/

smatch warnings:
mm/userfaultfd.c:1959 move_pages() error: uninitialized symbol 'step_size'.

vim +/step_size +1959 mm/userfaultfd.c

867a43a34ff8a38 Lokesh Gidra            2024-02-15  1802  ssize_t move_pages(struct userfaultfd_ctx *ctx, unsigned long dst_start,
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1803  		   unsigned long src_start, unsigned long len, __u64 mode)
adef440691bab82 Andrea Arcangeli        2023-12-06  1804  {
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1805  	struct mm_struct *mm = ctx->mm;
adef440691bab82 Andrea Arcangeli        2023-12-06  1806  	struct vm_area_struct *src_vma, *dst_vma;
3abf06e0c484867 Lokesh Gidra            2025-08-07  1807  	unsigned long src_addr, dst_addr, src_end;
adef440691bab82 Andrea Arcangeli        2023-12-06  1808  	pmd_t *src_pmd, *dst_pmd;
adef440691bab82 Andrea Arcangeli        2023-12-06  1809  	long err = -EINVAL;
adef440691bab82 Andrea Arcangeli        2023-12-06  1810  	ssize_t moved = 0;
adef440691bab82 Andrea Arcangeli        2023-12-06  1811  
adef440691bab82 Andrea Arcangeli        2023-12-06  1812  	/* Sanitize the command parameters. */
31defc3b01d907e Tal Zussman             2025-06-19  1813  	VM_WARN_ON_ONCE(src_start & ~PAGE_MASK);
31defc3b01d907e Tal Zussman             2025-06-19  1814  	VM_WARN_ON_ONCE(dst_start & ~PAGE_MASK);
31defc3b01d907e Tal Zussman             2025-06-19  1815  	VM_WARN_ON_ONCE(len & ~PAGE_MASK);
adef440691bab82 Andrea Arcangeli        2023-12-06  1816  
adef440691bab82 Andrea Arcangeli        2023-12-06  1817  	/* Does the address range wrap, or is the span zero-sized? */
31defc3b01d907e Tal Zussman             2025-06-19  1818  	VM_WARN_ON_ONCE(src_start + len < src_start);
31defc3b01d907e Tal Zussman             2025-06-19  1819  	VM_WARN_ON_ONCE(dst_start + len < dst_start);
adef440691bab82 Andrea Arcangeli        2023-12-06  1820  
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1821  	err = uffd_move_lock(mm, dst_start, src_start, &dst_vma, &src_vma);
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1822  	if (err)
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1823  		goto out;
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1824  
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1825  	/* Re-check after taking map_changing_lock */
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1826  	err = -EAGAIN;
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1827  	down_read(&ctx->map_changing_lock);
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1828  	if (likely(atomic_read(&ctx->mmap_changing)))
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1829  		goto out_unlock;
adef440691bab82 Andrea Arcangeli        2023-12-06  1830  	/*
adef440691bab82 Andrea Arcangeli        2023-12-06  1831  	 * Make sure the vma is not shared, that the src and dst remap
adef440691bab82 Andrea Arcangeli        2023-12-06  1832  	 * ranges are both valid and fully within a single existing
adef440691bab82 Andrea Arcangeli        2023-12-06  1833  	 * vma.
adef440691bab82 Andrea Arcangeli        2023-12-06  1834  	 */
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1835  	err = -EINVAL;
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1836  	if (src_vma->vm_flags & VM_SHARED)
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1837  		goto out_unlock;
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1838  	if (src_start + len > src_vma->vm_end)
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1839  		goto out_unlock;
adef440691bab82 Andrea Arcangeli        2023-12-06  1840  
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1841  	if (dst_vma->vm_flags & VM_SHARED)
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1842  		goto out_unlock;
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1843  	if (dst_start + len > dst_vma->vm_end)
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1844  		goto out_unlock;
adef440691bab82 Andrea Arcangeli        2023-12-06  1845  
adef440691bab82 Andrea Arcangeli        2023-12-06  1846  	err = validate_move_areas(ctx, src_vma, dst_vma);
adef440691bab82 Andrea Arcangeli        2023-12-06  1847  	if (err)
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1848  		goto out_unlock;
adef440691bab82 Andrea Arcangeli        2023-12-06  1849  
3abf06e0c484867 Lokesh Gidra            2025-08-07  1850  	for (src_addr = src_start, dst_addr = dst_start, src_end = src_start + len;
3abf06e0c484867 Lokesh Gidra            2025-08-07  1851  	     src_addr < src_end;) {
adef440691bab82 Andrea Arcangeli        2023-12-06  1852  		spinlock_t *ptl;
adef440691bab82 Andrea Arcangeli        2023-12-06  1853  		pmd_t dst_pmdval;
adef440691bab82 Andrea Arcangeli        2023-12-06  1854  		unsigned long step_size;
adef440691bab82 Andrea Arcangeli        2023-12-06  1855  
adef440691bab82 Andrea Arcangeli        2023-12-06  1856  		/*
adef440691bab82 Andrea Arcangeli        2023-12-06  1857  		 * Below works because anonymous area would not have a
adef440691bab82 Andrea Arcangeli        2023-12-06  1858  		 * transparent huge PUD. If file-backed support is added,
adef440691bab82 Andrea Arcangeli        2023-12-06  1859  		 * that case would need to be handled here.
adef440691bab82 Andrea Arcangeli        2023-12-06  1860  		 */
adef440691bab82 Andrea Arcangeli        2023-12-06  1861  		src_pmd = mm_find_pmd(mm, src_addr);
adef440691bab82 Andrea Arcangeli        2023-12-06  1862  		if (unlikely(!src_pmd)) {
adef440691bab82 Andrea Arcangeli        2023-12-06  1863  			if (!(mode & UFFDIO_MOVE_MODE_ALLOW_SRC_HOLES)) {
adef440691bab82 Andrea Arcangeli        2023-12-06  1864  				err = -ENOENT;
adef440691bab82 Andrea Arcangeli        2023-12-06  1865  				break;
adef440691bab82 Andrea Arcangeli        2023-12-06  1866  			}
adef440691bab82 Andrea Arcangeli        2023-12-06  1867  			src_pmd = mm_alloc_pmd(mm, src_addr);
adef440691bab82 Andrea Arcangeli        2023-12-06  1868  			if (unlikely(!src_pmd)) {
adef440691bab82 Andrea Arcangeli        2023-12-06  1869  				err = -ENOMEM;
adef440691bab82 Andrea Arcangeli        2023-12-06  1870  				break;
adef440691bab82 Andrea Arcangeli        2023-12-06  1871  			}
adef440691bab82 Andrea Arcangeli        2023-12-06  1872  		}
adef440691bab82 Andrea Arcangeli        2023-12-06  1873  		dst_pmd = mm_alloc_pmd(mm, dst_addr);
adef440691bab82 Andrea Arcangeli        2023-12-06  1874  		if (unlikely(!dst_pmd)) {
adef440691bab82 Andrea Arcangeli        2023-12-06  1875  			err = -ENOMEM;
adef440691bab82 Andrea Arcangeli        2023-12-06  1876  			break;
adef440691bab82 Andrea Arcangeli        2023-12-06  1877  		}
adef440691bab82 Andrea Arcangeli        2023-12-06  1878  
adef440691bab82 Andrea Arcangeli        2023-12-06  1879  		dst_pmdval = pmdp_get_lockless(dst_pmd);
adef440691bab82 Andrea Arcangeli        2023-12-06  1880  		/*
adef440691bab82 Andrea Arcangeli        2023-12-06  1881  		 * If the dst_pmd is mapped as THP don't override it and just
adef440691bab82 Andrea Arcangeli        2023-12-06  1882  		 * be strict. If dst_pmd changes into TPH after this check, the
adef440691bab82 Andrea Arcangeli        2023-12-06  1883  		 * move_pages_huge_pmd() will detect the change and retry
adef440691bab82 Andrea Arcangeli        2023-12-06  1884  		 * while move_pages_pte() will detect the change and fail.
adef440691bab82 Andrea Arcangeli        2023-12-06  1885  		 */
adef440691bab82 Andrea Arcangeli        2023-12-06  1886  		if (unlikely(pmd_trans_huge(dst_pmdval))) {
adef440691bab82 Andrea Arcangeli        2023-12-06  1887  			err = -EEXIST;
adef440691bab82 Andrea Arcangeli        2023-12-06  1888  			break;
adef440691bab82 Andrea Arcangeli        2023-12-06  1889  		}
adef440691bab82 Andrea Arcangeli        2023-12-06  1890  
adef440691bab82 Andrea Arcangeli        2023-12-06  1891  		ptl = pmd_trans_huge_lock(src_pmd, src_vma);
adef440691bab82 Andrea Arcangeli        2023-12-06  1892  		if (ptl) {
adef440691bab82 Andrea Arcangeli        2023-12-06  1893  			/* Check if we can move the pmd without splitting it. */
adef440691bab82 Andrea Arcangeli        2023-12-06  1894  			if (move_splits_huge_pmd(dst_addr, src_addr, src_start + len) ||
adef440691bab82 Andrea Arcangeli        2023-12-06  1895  			    !pmd_none(dst_pmdval)) {
e06d03d5590ae1c Matthew Wilcox (Oracle  2024-03-26  1896) 				struct folio *folio = pmd_folio(*src_pmd);
adef440691bab82 Andrea Arcangeli        2023-12-06  1897  
5beaee54a324ba1 Matthew Wilcox (Oracle  2024-03-26  1898) 				if (!folio || (!is_huge_zero_folio(folio) &&
eb1521dad8f391d Suren Baghdasaryan      2024-01-31  1899  					       !PageAnonExclusive(&folio->page))) {
adef440691bab82 Andrea Arcangeli        2023-12-06  1900  					spin_unlock(ptl);
adef440691bab82 Andrea Arcangeli        2023-12-06  1901  					err = -EBUSY;
adef440691bab82 Andrea Arcangeli        2023-12-06  1902  					break;
adef440691bab82 Andrea Arcangeli        2023-12-06  1903  				}
adef440691bab82 Andrea Arcangeli        2023-12-06  1904  
adef440691bab82 Andrea Arcangeli        2023-12-06  1905  				spin_unlock(ptl);
adef440691bab82 Andrea Arcangeli        2023-12-06  1906  				split_huge_pmd(src_vma, src_pmd, src_addr);
adef440691bab82 Andrea Arcangeli        2023-12-06  1907  				/* The folio will be split by move_pages_pte() */
adef440691bab82 Andrea Arcangeli        2023-12-06  1908  				continue;
adef440691bab82 Andrea Arcangeli        2023-12-06  1909  			}
adef440691bab82 Andrea Arcangeli        2023-12-06  1910  
adef440691bab82 Andrea Arcangeli        2023-12-06  1911  			err = move_pages_huge_pmd(mm, dst_pmd, src_pmd,
adef440691bab82 Andrea Arcangeli        2023-12-06  1912  						  dst_pmdval, dst_vma, src_vma,
adef440691bab82 Andrea Arcangeli        2023-12-06  1913  						  dst_addr, src_addr);
adef440691bab82 Andrea Arcangeli        2023-12-06  1914  			step_size = HPAGE_PMD_SIZE;
adef440691bab82 Andrea Arcangeli        2023-12-06  1915  		} else {
3abf06e0c484867 Lokesh Gidra            2025-08-07  1916  			long ret;
3abf06e0c484867 Lokesh Gidra            2025-08-07  1917  
adef440691bab82 Andrea Arcangeli        2023-12-06  1918  			if (pmd_none(*src_pmd)) {
adef440691bab82 Andrea Arcangeli        2023-12-06  1919  				if (!(mode & UFFDIO_MOVE_MODE_ALLOW_SRC_HOLES)) {
adef440691bab82 Andrea Arcangeli        2023-12-06  1920  					err = -ENOENT;
adef440691bab82 Andrea Arcangeli        2023-12-06  1921  					break;
adef440691bab82 Andrea Arcangeli        2023-12-06  1922  				}
adef440691bab82 Andrea Arcangeli        2023-12-06  1923  				if (unlikely(__pte_alloc(mm, src_pmd))) {
adef440691bab82 Andrea Arcangeli        2023-12-06  1924  					err = -ENOMEM;
adef440691bab82 Andrea Arcangeli        2023-12-06  1925  					break;
adef440691bab82 Andrea Arcangeli        2023-12-06  1926  				}
adef440691bab82 Andrea Arcangeli        2023-12-06  1927  			}
adef440691bab82 Andrea Arcangeli        2023-12-06  1928  
adef440691bab82 Andrea Arcangeli        2023-12-06  1929  			if (unlikely(pte_alloc(mm, dst_pmd))) {
adef440691bab82 Andrea Arcangeli        2023-12-06  1930  				err = -ENOMEM;
adef440691bab82 Andrea Arcangeli        2023-12-06  1931  				break;
adef440691bab82 Andrea Arcangeli        2023-12-06  1932  			}
adef440691bab82 Andrea Arcangeli        2023-12-06  1933  
3abf06e0c484867 Lokesh Gidra            2025-08-07  1934  			ret = move_pages_ptes(mm, dst_pmd, src_pmd,
3abf06e0c484867 Lokesh Gidra            2025-08-07  1935  					      dst_vma, src_vma, dst_addr,
3abf06e0c484867 Lokesh Gidra            2025-08-07  1936  					      src_addr, src_end - src_addr, mode);
3abf06e0c484867 Lokesh Gidra            2025-08-07  1937  			if (ret > 0)
3abf06e0c484867 Lokesh Gidra            2025-08-07  1938  				step_size = ret;
3abf06e0c484867 Lokesh Gidra            2025-08-07  1939  			else
3abf06e0c484867 Lokesh Gidra            2025-08-07  1940  				err = ret;

Imagine "ret == 0".

adef440691bab82 Andrea Arcangeli        2023-12-06  1941  		}
adef440691bab82 Andrea Arcangeli        2023-12-06  1942  
adef440691bab82 Andrea Arcangeli        2023-12-06  1943  		cond_resched();
adef440691bab82 Andrea Arcangeli        2023-12-06  1944  
adef440691bab82 Andrea Arcangeli        2023-12-06  1945  		if (fatal_signal_pending(current)) {
adef440691bab82 Andrea Arcangeli        2023-12-06  1946  			/* Do not override an error */
adef440691bab82 Andrea Arcangeli        2023-12-06  1947  			if (!err || err == -EAGAIN)
adef440691bab82 Andrea Arcangeli        2023-12-06  1948  				err = -EINTR;
adef440691bab82 Andrea Arcangeli        2023-12-06  1949  			break;
adef440691bab82 Andrea Arcangeli        2023-12-06  1950  		}
adef440691bab82 Andrea Arcangeli        2023-12-06  1951  
adef440691bab82 Andrea Arcangeli        2023-12-06  1952  		if (err) {

err is zero so we don't break here.

adef440691bab82 Andrea Arcangeli        2023-12-06  1953  			if (err == -EAGAIN)
adef440691bab82 Andrea Arcangeli        2023-12-06  1954  				continue;
adef440691bab82 Andrea Arcangeli        2023-12-06  1955  			break;
adef440691bab82 Andrea Arcangeli        2023-12-06  1956  		}
adef440691bab82 Andrea Arcangeli        2023-12-06  1957  
adef440691bab82 Andrea Arcangeli        2023-12-06  1958  		/* Proceed to the next page */
adef440691bab82 Andrea Arcangeli        2023-12-06 @1959  		dst_addr += step_size;
                                                                                    ^^^^^^^^^
Uninitialized or from the previous iteration.

adef440691bab82 Andrea Arcangeli        2023-12-06  1960  		src_addr += step_size;
adef440691bab82 Andrea Arcangeli        2023-12-06  1961  		moved += step_size;
adef440691bab82 Andrea Arcangeli        2023-12-06  1962  	}
adef440691bab82 Andrea Arcangeli        2023-12-06  1963  
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1964  out_unlock:
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1965  	up_read(&ctx->map_changing_lock);
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1966  	uffd_move_unlock(dst_vma, src_vma);
adef440691bab82 Andrea Arcangeli        2023-12-06  1967  out:
31defc3b01d907e Tal Zussman             2025-06-19  1968  	VM_WARN_ON_ONCE(moved < 0);
31defc3b01d907e Tal Zussman             2025-06-19  1969  	VM_WARN_ON_ONCE(err > 0);
31defc3b01d907e Tal Zussman             2025-06-19  1970  	VM_WARN_ON_ONCE(!moved && !err);
adef440691bab82 Andrea Arcangeli        2023-12-06  1971  	return moved ? moved : err;
adef440691bab82 Andrea Arcangeli        2023-12-06  1972  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

