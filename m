Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD203944B
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Feb 2023 18:05:01 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-536be69eadfso297485487b3.1
        for <oe-kbuild@lists.linux.dev>; Tue, 28 Feb 2023 10:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rpV99OKSTpIRzIpX89x9E7KBkQmTINaa7AEfKXJe4DE=;
        b=EuHDnDxAN39r4+yOuGdRF5UMA037GmTcY1WDH060nxXx4LzWSy+M3htrEsuL5FcfAz
         Rj6frPsLMdQF2246BJygq37UEUu30Bh6j8KXwoxqTeJkhOkibLzoBVk8hLxSDFroydUV
         kB061OnkFleByRyVQsg2kT7f6oVYGCMz1z9ePbHTaK7OT3eR/40qdzY9nKUbCtArHKRB
         gYOboQcc/ha0yIwiaAtYcssiaDzaqUgEVyfSBj15mv0ztWy6iGA/bRtTK0V0Z8v7f/1+
         vItc3NKAhWbIgRcLaDON1SGxs2vX7qpEAROD8bw4VcjuEpu4Cm2H+ejVd/efGQXNhSUV
         sgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpV99OKSTpIRzIpX89x9E7KBkQmTINaa7AEfKXJe4DE=;
        b=jHDnCxIoGAFT8W0RT7DDrQOWF/X6Bl3syCJG4u3WNcrUe0v/FNNtLr/KNJLb2cMmI+
         NfnDrRsyk/5PFiGXeJyRTsnrY9+oayEM/4lP7nByxUl682hkzv4ijEuHZ1C1j9SE9Ct8
         03Zo/qmsceaGclVT3dfeD42ttWpJpVfVYWagY12S4wKJRH1BvM/pnKeUZu8IhE11S4x8
         uZ4NkyY85/9WIUK9CHj+bjlBQ0D+N/sh1iEulRGEObRPFSeHhLxG2djVqhx5366dbU4v
         N8yfdIIm9NIcb2WWfQjglLkWVQy/8kbQaNnW+O2WthHq1xlaljOyTcDO+uRxDdf1UVfR
         iL7Q==
X-Gm-Message-State: AO0yUKXov114FVf0W4+lPhYSYUTCjdMRRY+guB2cM6Sj2k4Rqu19pHaN
	qFowoAYxwkBmAmh2fDWqG2dM5CCJVdpGKKCkNuYmxQ==
X-Google-Smtp-Source: AK7set+9MztI9r7zEzAu1vny2Hg5q1wq3BcKzf3IYbntzcbRXNrbfMh8bwEdnJMVwNIM6qCS4Nmr3QMhP+bkyI9Bdfg=
X-Received: by 2002:a81:ad03:0:b0:530:bbd3:798b with SMTP id
 l3-20020a81ad03000000b00530bbd3798bmr2233090ywh.0.1677607500530; Tue, 28 Feb
 2023 10:05:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202302281802.J93Nma7q-lkp@intel.com>
In-Reply-To: <202302281802.J93Nma7q-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 28 Feb 2023 10:04:49 -0800
Message-ID: <CAJuCfpHz3uECOuk6rRrV6Vn5r7+vn8HnC5cY7OZVHtGsAeE11A@mail.gmail.com>
Subject: Re: [ammarfaizi2-block:akpm/mm/mm-unstable 82/99] mm/mmap.c:516
 vma_prepare() error: we previously assumed 'vp->vma' could be null (see line 505)
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Ammar Faizi <ammarfaizi2@gnuweeb.org>, "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 28, 2023 at 6:24 AM Dan Carpenter <error27@gmail.com> wrote:
>
> tree:   https://github.com/ammarfaizi2/linux-block akpm/mm/mm-unstable
> head:   61edd3b68c3185673c9b05dfe48038692964c73b
> commit: f517f7ae341d933856cdf4d9d773027681ed5dff [82/99] mm/mmap: write-lock VMAs in vma_prepare before modifying them
> config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230228/202302281802.J93Nma7q-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Link: https://lore.kernel.org/r/202302281802.J93Nma7q-lkp@intel.com/

Thanks for reporting!

>
> smatch warnings:
> mm/mmap.c:516 vma_prepare() error: we previously assumed 'vp->vma' could be null (see line 505)
>
> vim +516 mm/mmap.c
>
> 440703e082b9c7 Liam R. Howlett    2023-01-20  503  static inline void vma_prepare(struct vma_prepare *vp)
> 440703e082b9c7 Liam R. Howlett    2023-01-20  504  {
> f517f7ae341d93 Suren Baghdasaryan 2023-02-27 @505       if (vp->vma)
>
> Check presumes that vp->vma can be NULL.  On my other system (with
> yesterday's linux-next code) vp->vma can never be NULL.

I think the check here is not needed since vp->vma should always be
non-NULL. I'll double-check and will remove it if that is confirmed.
Thanks,
Suren.

>
> f517f7ae341d93 Suren Baghdasaryan 2023-02-27  506               vma_start_write(vp->vma);
> f517f7ae341d93 Suren Baghdasaryan 2023-02-27  507       if (vp->adj_next)
> f517f7ae341d93 Suren Baghdasaryan 2023-02-27  508               vma_start_write(vp->adj_next);
> f517f7ae341d93 Suren Baghdasaryan 2023-02-27  509       /* vp->insert is always a newly created VMA, no need for locking */
> f517f7ae341d93 Suren Baghdasaryan 2023-02-27  510       if (vp->remove)
> f517f7ae341d93 Suren Baghdasaryan 2023-02-27  511               vma_start_write(vp->remove);
> f517f7ae341d93 Suren Baghdasaryan 2023-02-27  512       if (vp->remove2)
> f517f7ae341d93 Suren Baghdasaryan 2023-02-27  513               vma_start_write(vp->remove2);
> f517f7ae341d93 Suren Baghdasaryan 2023-02-27  514
> 440703e082b9c7 Liam R. Howlett    2023-01-20  515       if (vp->file) {
> 440703e082b9c7 Liam R. Howlett    2023-01-20 @516               uprobe_munmap(vp->vma, vp->vma->vm_start, vp->vma->vm_end);
>                                                                                        ^^^^^^^
> Uncheck dereference.
>
> 440703e082b9c7 Liam R. Howlett    2023-01-20  517
> 440703e082b9c7 Liam R. Howlett    2023-01-20  518               if (vp->adj_next)
> 440703e082b9c7 Liam R. Howlett    2023-01-20  519                       uprobe_munmap(vp->adj_next, vp->adj_next->vm_start,
> 440703e082b9c7 Liam R. Howlett    2023-01-20  520                                     vp->adj_next->vm_end);
> 440703e082b9c7 Liam R. Howlett    2023-01-20  521
> 440703e082b9c7 Liam R. Howlett    2023-01-20  522               i_mmap_lock_write(vp->mapping);
> 440703e082b9c7 Liam R. Howlett    2023-01-20  523               if (vp->insert && vp->insert->vm_file) {
> 440703e082b9c7 Liam R. Howlett    2023-01-20  524                       /*
> 440703e082b9c7 Liam R. Howlett    2023-01-20  525                        * Put into interval tree now, so instantiated pages
> 440703e082b9c7 Liam R. Howlett    2023-01-20  526                        * are visible to arm/parisc __flush_dcache_page
> 440703e082b9c7 Liam R. Howlett    2023-01-20  527                        * throughout; but we cannot insert into address
> 440703e082b9c7 Liam R. Howlett    2023-01-20  528                        * space until vma start or end is updated.
> 440703e082b9c7 Liam R. Howlett    2023-01-20  529                        */
> 440703e082b9c7 Liam R. Howlett    2023-01-20  530                       __vma_link_file(vp->insert,
> 440703e082b9c7 Liam R. Howlett    2023-01-20  531                                       vp->insert->vm_file->f_mapping);
> 440703e082b9c7 Liam R. Howlett    2023-01-20  532               }
> 440703e082b9c7 Liam R. Howlett    2023-01-20  533       }
> 440703e082b9c7 Liam R. Howlett    2023-01-20  534
> 440703e082b9c7 Liam R. Howlett    2023-01-20  535       if (vp->anon_vma) {
> 440703e082b9c7 Liam R. Howlett    2023-01-20  536               anon_vma_lock_write(vp->anon_vma);
> 440703e082b9c7 Liam R. Howlett    2023-01-20  537               anon_vma_interval_tree_pre_update_vma(vp->vma);
>
> More unchecked dereferences.
>
> 440703e082b9c7 Liam R. Howlett    2023-01-20  538               if (vp->adj_next)
> 440703e082b9c7 Liam R. Howlett    2023-01-20  539                       anon_vma_interval_tree_pre_update_vma(vp->adj_next);
> 440703e082b9c7 Liam R. Howlett    2023-01-20  540       }
> 440703e082b9c7 Liam R. Howlett    2023-01-20  541
> 440703e082b9c7 Liam R. Howlett    2023-01-20  542       if (vp->file) {
> 440703e082b9c7 Liam R. Howlett    2023-01-20  543               flush_dcache_mmap_lock(vp->mapping);
> 440703e082b9c7 Liam R. Howlett    2023-01-20  544               vma_interval_tree_remove(vp->vma, &vp->mapping->i_mmap);
> 440703e082b9c7 Liam R. Howlett    2023-01-20  545               if (vp->adj_next)
> 440703e082b9c7 Liam R. Howlett    2023-01-20  546                       vma_interval_tree_remove(vp->adj_next,
> 440703e082b9c7 Liam R. Howlett    2023-01-20  547                                                &vp->mapping->i_mmap);
> 440703e082b9c7 Liam R. Howlett    2023-01-20  548       }
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
>
