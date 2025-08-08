Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280B9280025
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Aug 2025 15:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754666892; cv=none; b=A0MN25qrKAinCb9P/tFasYiA6XPpQd3DpvMrMZNMBZpzDiEmLZKF1x4RrZX441GoloWhKAs6xBoDUHB8Q5/u84bX6fapqCqsgFdT62Kk+PzMQHHGesaiVPMT2kWHubQEZotzfyBG8pyWUjD3bn+3XmdtzvlnKp/GtA6oSGZHcmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754666892; c=relaxed/simple;
	bh=on3zivjN6PeiSPaQDqEgZgga/3npqM4oxWaReoECq1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C98ixkmPBry8bznoPIeldsqMzOWMKuUQ5aOBHQ1wjpGNQ3lVH/Li2/6LkNt6tSvWpBfiyBn+MAaxBkZzWrnm2dOfqVcxOX/YCH9IWXxPTWad+wFc+1ldR+Yi9FLuz7QfQAnQmoZTUsRZC+uMBrGvLaGWHfJP3GuowD/5uSu3568=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rBufGYN8; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rBufGYN8"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6154c7b3ee7so13184a12.0
        for <oe-kbuild@lists.linux.dev>; Fri, 08 Aug 2025 08:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754666888; x=1755271688; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=666g2saYRm+ELh41ubUumuqJ+q85BiZihRzqMUs5hMI=;
        b=rBufGYN85K3DhERZoC/VUEknJkqEAdkVGZQ6wgHQ7nQ+hptlwCi1K5xWIO/8vswqzO
         v/bdnvIdbh885SArq2cw2NInF2VjSD2t1Ab9LBgn6joxtqFk1xTy2BcgFvFTa6arUUgo
         9xEQXZEmodiz0s8cIWs8mvgel4W7ZJFLe/GmD49oki49W9PSy83J3icLeBD8q4jN3QJy
         ZNvkKJnG1CFujfHbxeE0R88yXFRFRUNx8o/1P6SaCEARxaCYEyFRjDdHvl0rOICgpZ/7
         1CjQkQOP406oOLZEBlr2Kg4auAsDzoiAboF34ZuPxJiWBWJ84caBg9/u7SxQcukiQ1NP
         VM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754666888; x=1755271688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=666g2saYRm+ELh41ubUumuqJ+q85BiZihRzqMUs5hMI=;
        b=P4AkVBuotlB8Rr5TbrlBAJFDWUOfKm7UaECprEJvZJiiKTJyCD4fP/4RYuM9wi+bWz
         IBnkdblByfMT0ZmEThGe/DiU/MYCKKusqCNvyIpRrRT43VIeuHT8K0A6RsKJu5OEcvjB
         y9jShZnlPua2o2iVm0f/1cvGOVYj72QCQYb/wVkXEcNrbaeFhPIabLvN4Pl5ZzcejdyA
         xqa9uA+NwYhd4TZhWvDd5hAOo3RkBaPOTJcSOnNTHwEByZJ9Y0melqKC/JrAXXzULCrw
         Slrbg5Y9aZw6UNZqGGOMOqdALGb+QyiUEDwt11qYLc/k4KRwJq6IBvyTs3oMq9Xef8yE
         YHNQ==
X-Gm-Message-State: AOJu0YxTD3Q5LQm4C2W5TwYdBtP86Nm4eBBhoZf97Cm0LagoAwFsirH/
	3SxcgunP+tIC2SfNL29LxF6b8gyq6+cOEWupMaAIC4KEBFjrC+dxAlCmP4AlF2UD4oajuK/ERt1
	3bMB466KEEaPVHxmmZYFN7hczrc6Q70c4ziKe64fd
X-Gm-Gg: ASbGncsInLrdNTcrFJiBaz6/Vg+MtR3oCChhNPjuTpVm0hXOpahPpBytH6o0fb20wI/
	1gbeRr/e4oo4Ofk5rtKsFAz6Lt7MqDG31eOgebkYdsLMIQL2xvT7DMBuy/umPYF4Y0gb2pZsBdV
	AfQmeQKI41Z+JXso5ECfVle8pc26qx5ex3W3hkxIT0/6pIHwzVtvSXpgk+gYEc3ryxUEZsla4Yj
	rvm2Aw7g9sNGpLWr7Wmj7+FAGdbCCP2C0OQQyC3YBBwO9y2u9DCQOZmKcqBUKo=
X-Google-Smtp-Source: AGHT+IErBTQ/Da8wNvVwk/qQCNuNOP/CslQQSRurwTkWKNB7PUFiCIKHvJdLSyJFybEVIG60S87k9khSbommyMb39RQ=
X-Received: by 2002:a50:9312:0:b0:617:d18e:d639 with SMTP id
 4fb4d7f45d1cf-617e4aa0efdmr74371a12.7.1754666888024; Fri, 08 Aug 2025
 08:28:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250807103902.2242717-1-lokeshgidra@google.com> <66de1a4d-b98b-4b37-9050-4a4ae69e2af7@suswa.mountain>
In-Reply-To: <66de1a4d-b98b-4b37-9050-4a4ae69e2af7@suswa.mountain>
From: Lokesh Gidra <lokeshgidra@google.com>
Date: Fri, 8 Aug 2025 08:27:55 -0700
X-Gm-Features: Ac12FXxP0eKunO2VDMXtxogJ9MllBAtEGphHtwAwy_D91RclNJalcTeljOSEfvg
Message-ID: <CA+EESO7iKvWRdJdEVs4v=PFPot_Ktc0N1HGPs07UufJqPOHS2A@mail.gmail.com>
Subject: Re: [PATCH v3] userfaultfd: opportunistic TLB-flush batching for
 present pages in MOVE
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 7, 2025 at 11:18=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Hi Lokesh,
>
> kernel test robot noticed the following build warnings:
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Lokesh-Gidra/userf=
aultfd-opportunistic-TLB-flush-batching-for-present-pages-in-MOVE/20250807-=
184025
> base:   6e64f4580381e32c06ee146ca807c555b8f73e24
> patch link:    https://lore.kernel.org/r/20250807103902.2242717-1-lokeshg=
idra%40google.com
> patch subject: [PATCH v3] userfaultfd: opportunistic TLB-flush batching f=
or present pages in MOVE
> config: openrisc-randconfig-r071-20250808 (https://download.01.org/0day-c=
i/archive/20250808/202508080639.Cf7SyRwQ-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 10.5.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202508080639.Cf7SyRwQ-lkp@intel.com/
>
Thanks Dan. I will fix the warning in the next version of the patch.

> smatch warnings:
> mm/userfaultfd.c:1959 move_pages() error: uninitialized symbol 'step_size=
'.
>
> vim +/step_size +1959 mm/userfaultfd.c
>
> 867a43a34ff8a38 Lokesh Gidra            2024-02-15  1802  ssize_t move_pa=
ges(struct userfaultfd_ctx *ctx, unsigned long dst_start,
> 867a43a34ff8a38 Lokesh Gidra            2024-02-15  1803                 =
  unsigned long src_start, unsigned long len, __u64 mode)
> adef440691bab82 Andrea Arcangeli        2023-12-06  1804  {
> 867a43a34ff8a38 Lokesh Gidra            2024-02-15  1805        struct mm=
_struct *mm =3D ctx->mm;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1806        struct vm=
_area_struct *src_vma, *dst_vma;
> 3abf06e0c484867 Lokesh Gidra            2025-08-07  1807        unsigned =
long src_addr, dst_addr, src_end;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1808        pmd_t *sr=
c_pmd, *dst_pmd;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1809        long err =
=3D -EINVAL;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1810        ssize_t m=
oved =3D 0;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1811
> adef440691bab82 Andrea Arcangeli        2023-12-06  1812        /* Saniti=
ze the command parameters. */
> 31defc3b01d907e Tal Zussman             2025-06-19  1813        VM_WARN_O=
N_ONCE(src_start & ~PAGE_MASK);
> 31defc3b01d907e Tal Zussman             2025-06-19  1814        VM_WARN_O=
N_ONCE(dst_start & ~PAGE_MASK);
> 31defc3b01d907e Tal Zussman             2025-06-19  1815        VM_WARN_O=
N_ONCE(len & ~PAGE_MASK);
> adef440691bab82 Andrea Arcangeli        2023-12-06  1816
> adef440691bab82 Andrea Arcangeli        2023-12-06  1817        /* Does t=
he address range wrap, or is the span zero-sized? */
> 31defc3b01d907e Tal Zussman             2025-06-19  1818        VM_WARN_O=
N_ONCE(src_start + len < src_start);
> 31defc3b01d907e Tal Zussman             2025-06-19  1819        VM_WARN_O=
N_ONCE(dst_start + len < dst_start);
> adef440691bab82 Andrea Arcangeli        2023-12-06  1820
> 867a43a34ff8a38 Lokesh Gidra            2024-02-15  1821        err =3D u=
ffd_move_lock(mm, dst_start, src_start, &dst_vma, &src_vma);
> 867a43a34ff8a38 Lokesh Gidra            2024-02-15  1822        if (err)
> 867a43a34ff8a38 Lokesh Gidra            2024-02-15  1823                g=
oto out;
> 867a43a34ff8a38 Lokesh Gidra            2024-02-15  1824
> 867a43a34ff8a38 Lokesh Gidra            2024-02-15  1825        /* Re-che=
ck after taking map_changing_lock */
> 867a43a34ff8a38 Lokesh Gidra            2024-02-15  1826        err =3D -=
EAGAIN;
> 867a43a34ff8a38 Lokesh Gidra            2024-02-15  1827        down_read=
(&ctx->map_changing_lock);
> 867a43a34ff8a38 Lokesh Gidra            2024-02-15  1828        if (likel=
y(atomic_read(&ctx->mmap_changing)))
> 867a43a34ff8a38 Lokesh Gidra            2024-02-15  1829                g=
oto out_unlock;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1830        /*
> adef440691bab82 Andrea Arcangeli        2023-12-06  1831         * Make s=
ure the vma is not shared, that the src and dst remap
> adef440691bab82 Andrea Arcangeli        2023-12-06  1832         * ranges=
 are both valid and fully within a single existing
> adef440691bab82 Andrea Arcangeli        2023-12-06  1833         * vma.
> adef440691bab82 Andrea Arcangeli        2023-12-06  1834         */
> 867a43a34ff8a38 Lokesh Gidra            2024-02-15  1835        err =3D -=
EINVAL;
> 867a43a34ff8a38 Lokesh Gidra            2024-02-15  1836        if (src_v=
ma->vm_flags & VM_SHARED)
> 867a43a34ff8a38 Lokesh Gidra            2024-02-15  1837                g=
oto out_unlock;
> 867a43a34ff8a38 Lokesh Gidra            2024-02-15  1838        if (src_s=
tart + len > src_vma->vm_end)
> 867a43a34ff8a38 Lokesh Gidra            2024-02-15  1839                g=
oto out_unlock;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1840
> 867a43a34ff8a38 Lokesh Gidra            2024-02-15  1841        if (dst_v=
ma->vm_flags & VM_SHARED)
> 867a43a34ff8a38 Lokesh Gidra            2024-02-15  1842                g=
oto out_unlock;
> 867a43a34ff8a38 Lokesh Gidra            2024-02-15  1843        if (dst_s=
tart + len > dst_vma->vm_end)
> 867a43a34ff8a38 Lokesh Gidra            2024-02-15  1844                g=
oto out_unlock;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1845
> adef440691bab82 Andrea Arcangeli        2023-12-06  1846        err =3D v=
alidate_move_areas(ctx, src_vma, dst_vma);
> adef440691bab82 Andrea Arcangeli        2023-12-06  1847        if (err)
> 867a43a34ff8a38 Lokesh Gidra            2024-02-15  1848                g=
oto out_unlock;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1849
> 3abf06e0c484867 Lokesh Gidra            2025-08-07  1850        for (src_=
addr =3D src_start, dst_addr =3D dst_start, src_end =3D src_start + len;
> 3abf06e0c484867 Lokesh Gidra            2025-08-07  1851             src_=
addr < src_end;) {
> adef440691bab82 Andrea Arcangeli        2023-12-06  1852                s=
pinlock_t *ptl;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1853                p=
md_t dst_pmdval;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1854                u=
nsigned long step_size;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1855
> adef440691bab82 Andrea Arcangeli        2023-12-06  1856                /=
*
> adef440691bab82 Andrea Arcangeli        2023-12-06  1857                 =
* Below works because anonymous area would not have a
> adef440691bab82 Andrea Arcangeli        2023-12-06  1858                 =
* transparent huge PUD. If file-backed support is added,
> adef440691bab82 Andrea Arcangeli        2023-12-06  1859                 =
* that case would need to be handled here.
> adef440691bab82 Andrea Arcangeli        2023-12-06  1860                 =
*/
> adef440691bab82 Andrea Arcangeli        2023-12-06  1861                s=
rc_pmd =3D mm_find_pmd(mm, src_addr);
> adef440691bab82 Andrea Arcangeli        2023-12-06  1862                i=
f (unlikely(!src_pmd)) {
> adef440691bab82 Andrea Arcangeli        2023-12-06  1863                 =
       if (!(mode & UFFDIO_MOVE_MODE_ALLOW_SRC_HOLES)) {
> adef440691bab82 Andrea Arcangeli        2023-12-06  1864                 =
               err =3D -ENOENT;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1865                 =
               break;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1866                 =
       }
> adef440691bab82 Andrea Arcangeli        2023-12-06  1867                 =
       src_pmd =3D mm_alloc_pmd(mm, src_addr);
> adef440691bab82 Andrea Arcangeli        2023-12-06  1868                 =
       if (unlikely(!src_pmd)) {
> adef440691bab82 Andrea Arcangeli        2023-12-06  1869                 =
               err =3D -ENOMEM;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1870                 =
               break;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1871                 =
       }
> adef440691bab82 Andrea Arcangeli        2023-12-06  1872                }
> adef440691bab82 Andrea Arcangeli        2023-12-06  1873                d=
st_pmd =3D mm_alloc_pmd(mm, dst_addr);
> adef440691bab82 Andrea Arcangeli        2023-12-06  1874                i=
f (unlikely(!dst_pmd)) {
> adef440691bab82 Andrea Arcangeli        2023-12-06  1875                 =
       err =3D -ENOMEM;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1876                 =
       break;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1877                }
> adef440691bab82 Andrea Arcangeli        2023-12-06  1878
> adef440691bab82 Andrea Arcangeli        2023-12-06  1879                d=
st_pmdval =3D pmdp_get_lockless(dst_pmd);
> adef440691bab82 Andrea Arcangeli        2023-12-06  1880                /=
*
> adef440691bab82 Andrea Arcangeli        2023-12-06  1881                 =
* If the dst_pmd is mapped as THP don't override it and just
> adef440691bab82 Andrea Arcangeli        2023-12-06  1882                 =
* be strict. If dst_pmd changes into TPH after this check, the
> adef440691bab82 Andrea Arcangeli        2023-12-06  1883                 =
* move_pages_huge_pmd() will detect the change and retry
> adef440691bab82 Andrea Arcangeli        2023-12-06  1884                 =
* while move_pages_pte() will detect the change and fail.
> adef440691bab82 Andrea Arcangeli        2023-12-06  1885                 =
*/
> adef440691bab82 Andrea Arcangeli        2023-12-06  1886                i=
f (unlikely(pmd_trans_huge(dst_pmdval))) {
> adef440691bab82 Andrea Arcangeli        2023-12-06  1887                 =
       err =3D -EEXIST;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1888                 =
       break;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1889                }
> adef440691bab82 Andrea Arcangeli        2023-12-06  1890
> adef440691bab82 Andrea Arcangeli        2023-12-06  1891                p=
tl =3D pmd_trans_huge_lock(src_pmd, src_vma);
> adef440691bab82 Andrea Arcangeli        2023-12-06  1892                i=
f (ptl) {
> adef440691bab82 Andrea Arcangeli        2023-12-06  1893                 =
       /* Check if we can move the pmd without splitting it. */
> adef440691bab82 Andrea Arcangeli        2023-12-06  1894                 =
       if (move_splits_huge_pmd(dst_addr, src_addr, src_start + len) ||
> adef440691bab82 Andrea Arcangeli        2023-12-06  1895                 =
           !pmd_none(dst_pmdval)) {
> e06d03d5590ae1c Matthew Wilcox (Oracle  2024-03-26  1896)                =
               struct folio *folio =3D pmd_folio(*src_pmd);
> adef440691bab82 Andrea Arcangeli        2023-12-06  1897
> 5beaee54a324ba1 Matthew Wilcox (Oracle  2024-03-26  1898)                =
               if (!folio || (!is_huge_zero_folio(folio) &&
> eb1521dad8f391d Suren Baghdasaryan      2024-01-31  1899                 =
                              !PageAnonExclusive(&folio->page))) {
> adef440691bab82 Andrea Arcangeli        2023-12-06  1900                 =
                       spin_unlock(ptl);
> adef440691bab82 Andrea Arcangeli        2023-12-06  1901                 =
                       err =3D -EBUSY;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1902                 =
                       break;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1903                 =
               }
> adef440691bab82 Andrea Arcangeli        2023-12-06  1904
> adef440691bab82 Andrea Arcangeli        2023-12-06  1905                 =
               spin_unlock(ptl);
> adef440691bab82 Andrea Arcangeli        2023-12-06  1906                 =
               split_huge_pmd(src_vma, src_pmd, src_addr);
> adef440691bab82 Andrea Arcangeli        2023-12-06  1907                 =
               /* The folio will be split by move_pages_pte() */
> adef440691bab82 Andrea Arcangeli        2023-12-06  1908                 =
               continue;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1909                 =
       }
> adef440691bab82 Andrea Arcangeli        2023-12-06  1910
> adef440691bab82 Andrea Arcangeli        2023-12-06  1911                 =
       err =3D move_pages_huge_pmd(mm, dst_pmd, src_pmd,
> adef440691bab82 Andrea Arcangeli        2023-12-06  1912                 =
                                 dst_pmdval, dst_vma, src_vma,
> adef440691bab82 Andrea Arcangeli        2023-12-06  1913                 =
                                 dst_addr, src_addr);
> adef440691bab82 Andrea Arcangeli        2023-12-06  1914                 =
       step_size =3D HPAGE_PMD_SIZE;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1915                }=
 else {
> 3abf06e0c484867 Lokesh Gidra            2025-08-07  1916                 =
       long ret;
> 3abf06e0c484867 Lokesh Gidra            2025-08-07  1917
> adef440691bab82 Andrea Arcangeli        2023-12-06  1918                 =
       if (pmd_none(*src_pmd)) {
> adef440691bab82 Andrea Arcangeli        2023-12-06  1919                 =
               if (!(mode & UFFDIO_MOVE_MODE_ALLOW_SRC_HOLES)) {
> adef440691bab82 Andrea Arcangeli        2023-12-06  1920                 =
                       err =3D -ENOENT;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1921                 =
                       break;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1922                 =
               }
> adef440691bab82 Andrea Arcangeli        2023-12-06  1923                 =
               if (unlikely(__pte_alloc(mm, src_pmd))) {
> adef440691bab82 Andrea Arcangeli        2023-12-06  1924                 =
                       err =3D -ENOMEM;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1925                 =
                       break;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1926                 =
               }
> adef440691bab82 Andrea Arcangeli        2023-12-06  1927                 =
       }
> adef440691bab82 Andrea Arcangeli        2023-12-06  1928
> adef440691bab82 Andrea Arcangeli        2023-12-06  1929                 =
       if (unlikely(pte_alloc(mm, dst_pmd))) {
> adef440691bab82 Andrea Arcangeli        2023-12-06  1930                 =
               err =3D -ENOMEM;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1931                 =
               break;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1932                 =
       }
> adef440691bab82 Andrea Arcangeli        2023-12-06  1933
> 3abf06e0c484867 Lokesh Gidra            2025-08-07  1934                 =
       ret =3D move_pages_ptes(mm, dst_pmd, src_pmd,
> 3abf06e0c484867 Lokesh Gidra            2025-08-07  1935                 =
                             dst_vma, src_vma, dst_addr,
> 3abf06e0c484867 Lokesh Gidra            2025-08-07  1936                 =
                             src_addr, src_end - src_addr, mode);
> 3abf06e0c484867 Lokesh Gidra            2025-08-07  1937                 =
       if (ret > 0)
> 3abf06e0c484867 Lokesh Gidra            2025-08-07  1938                 =
               step_size =3D ret;
> 3abf06e0c484867 Lokesh Gidra            2025-08-07  1939                 =
       else
> 3abf06e0c484867 Lokesh Gidra            2025-08-07  1940                 =
               err =3D ret;
>
> Imagine "ret =3D=3D 0".
>
> adef440691bab82 Andrea Arcangeli        2023-12-06  1941                }
> adef440691bab82 Andrea Arcangeli        2023-12-06  1942
> adef440691bab82 Andrea Arcangeli        2023-12-06  1943                c=
ond_resched();
> adef440691bab82 Andrea Arcangeli        2023-12-06  1944
> adef440691bab82 Andrea Arcangeli        2023-12-06  1945                i=
f (fatal_signal_pending(current)) {
> adef440691bab82 Andrea Arcangeli        2023-12-06  1946                 =
       /* Do not override an error */
> adef440691bab82 Andrea Arcangeli        2023-12-06  1947                 =
       if (!err || err =3D=3D -EAGAIN)
> adef440691bab82 Andrea Arcangeli        2023-12-06  1948                 =
               err =3D -EINTR;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1949                 =
       break;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1950                }
> adef440691bab82 Andrea Arcangeli        2023-12-06  1951
> adef440691bab82 Andrea Arcangeli        2023-12-06  1952                i=
f (err) {
>
> err is zero so we don't break here.
>
> adef440691bab82 Andrea Arcangeli        2023-12-06  1953                 =
       if (err =3D=3D -EAGAIN)
> adef440691bab82 Andrea Arcangeli        2023-12-06  1954                 =
               continue;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1955                 =
       break;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1956                }
> adef440691bab82 Andrea Arcangeli        2023-12-06  1957
> adef440691bab82 Andrea Arcangeli        2023-12-06  1958                /=
* Proceed to the next page */
> adef440691bab82 Andrea Arcangeli        2023-12-06 @1959                d=
st_addr +=3D step_size;
>                                                                          =
           ^^^^^^^^^
> Uninitialized or from the previous iteration.
>
> adef440691bab82 Andrea Arcangeli        2023-12-06  1960                s=
rc_addr +=3D step_size;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1961                m=
oved +=3D step_size;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1962        }
> adef440691bab82 Andrea Arcangeli        2023-12-06  1963
> 867a43a34ff8a38 Lokesh Gidra            2024-02-15  1964  out_unlock:
> 867a43a34ff8a38 Lokesh Gidra            2024-02-15  1965        up_read(&=
ctx->map_changing_lock);
> 867a43a34ff8a38 Lokesh Gidra            2024-02-15  1966        uffd_move=
_unlock(dst_vma, src_vma);
> adef440691bab82 Andrea Arcangeli        2023-12-06  1967  out:
> 31defc3b01d907e Tal Zussman             2025-06-19  1968        VM_WARN_O=
N_ONCE(moved < 0);
> 31defc3b01d907e Tal Zussman             2025-06-19  1969        VM_WARN_O=
N_ONCE(err > 0);
> 31defc3b01d907e Tal Zussman             2025-06-19  1970        VM_WARN_O=
N_ONCE(!moved && !err);
> adef440691bab82 Andrea Arcangeli        2023-12-06  1971        return mo=
ved ? moved : err;
> adef440691bab82 Andrea Arcangeli        2023-12-06  1972  }
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
