Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44280A35
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Mar 2023 02:28:49 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-536af432ee5so330342717b3.0
        for <oe-kbuild@lists.linux.dev>; Tue, 28 Feb 2023 18:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1677637728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXY1oQ2WsIXXjJ4DmWxT7PSEH+wyquFSNk71L82ApRs=;
        b=RcF5H4kBvVfqB5A0I3tNEGPRQprdQKaQuAzsuavQlVaHm3M/SESH3b13I9mje2K4pf
         VD2+gtFthWzu33EspmSNdK4UvMtwXYAmyMSJN5sstc9tduhs+26gUpQUyJjo84vhLr3i
         TPJd9LLHAo+uCnWiitlnPkHfTYLrpg01a3s5BHWbnVuM9n6Scu/JgxmfREHT8qC9PmUr
         /mjAoBrk9d//cLeGukuCUlnE93zl2kmUXMZMytO5CW+vp/1Rh1ZU2GsbB3Vj0Vr5K6Dy
         mL7ff8du0FEs01FLkWzlJPGUufXH0fX13xxxiHxPTQvCxMRmo/aKPtCsb3aTttCO6FKb
         ltKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677637728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXY1oQ2WsIXXjJ4DmWxT7PSEH+wyquFSNk71L82ApRs=;
        b=BT93tbMEWYtLZ7vYzjayV58pkHbd6AzJGNCflb/9zYtfAIZckEdlevN6Z8PLvBOFHn
         CpaNVuFJFmbvtnFMlrIl9/HpcSThozx1tUSH61iLkHcpfVEuNgKcK05hqfwKVxgCSGUQ
         zH2cWHXbDtqQBg3trDm09pfxvTvvQSFneJfINWGaIVTtnW+Is1GOMrJa7h5gRjuVojUm
         4sz0Icd5fzy9VkmQ1ILVzZZwNwMW8TSzezqSch/RiLyKcf8idog4aM7oHNvGbd6bH7nM
         stjpd6nc5E/r+HRaHE4j5a9vsg5YmKR3m8BufLNPDVLZCaPe45Ba46wgW+XgH4/LXEhA
         Gxzg==
X-Gm-Message-State: AO0yUKVOWUYu+V81n/XZ/9g6uV6RoAdEiiWbzUo5xkuLQNSH26yRKE25
	8OwOx5OvJTI+Cmol8rvCSJDBo5z0pN2LrRl0trTpdQ==
X-Google-Smtp-Source: AK7set+h/4aN4tQrM4x93hI3rpnN6ZQ+Fnu7g9uZNflO6E6VEAIC/i2bGKklkKw0hPCZfm62bqguZXRGNAuj6gb3ZNg=
X-Received: by 2002:a81:ae23:0:b0:533:9c5b:7278 with SMTP id
 m35-20020a81ae23000000b005339c5b7278mr2930762ywh.0.1677637727951; Tue, 28 Feb
 2023 18:28:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202302281802.J93Nma7q-lkp@intel.com> <CAJuCfpHz3uECOuk6rRrV6Vn5r7+vn8HnC5cY7OZVHtGsAeE11A@mail.gmail.com>
In-Reply-To: <CAJuCfpHz3uECOuk6rRrV6Vn5r7+vn8HnC5cY7OZVHtGsAeE11A@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 28 Feb 2023 18:28:36 -0800
Message-ID: <CAJuCfpHZS8_QNDoNLO2Ti2ZY26h7E8RrBtiKZ2zhY2cEvXQ1kw@mail.gmail.com>
Subject: Re: [ammarfaizi2-block:akpm/mm/mm-unstable 82/99] mm/mmap.c:516
 vma_prepare() error: we previously assumed 'vp->vma' could be null (see line 505)
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Ammar Faizi <ammarfaizi2@gnuweeb.org>, "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2023 at 10:04=E2=80=AFAM Suren Baghdasaryan <surenb@google.=
com> wrote:
>
> On Tue, Feb 28, 2023 at 6:24 AM Dan Carpenter <error27@gmail.com> wrote:
> >
> > tree:   https://github.com/ammarfaizi2/linux-block akpm/mm/mm-unstable
> > head:   61edd3b68c3185673c9b05dfe48038692964c73b
> > commit: f517f7ae341d933856cdf4d9d773027681ed5dff [82/99] mm/mmap: write=
-lock VMAs in vma_prepare before modifying them
> > config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/2=
0230228/202302281802.J93Nma7q-lkp@intel.com/config)
> > compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Link: https://lore.kernel.org/r/202302281802.J93Nma7q-lkp@intel.com/
>
> Thanks for reporting!
>
> >
> > smatch warnings:
> > mm/mmap.c:516 vma_prepare() error: we previously assumed 'vp->vma' coul=
d be null (see line 505)
> >
> > vim +516 mm/mmap.c
> >
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  503  static inline void v=
ma_prepare(struct vma_prepare *vp)
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  504  {
> > f517f7ae341d93 Suren Baghdasaryan 2023-02-27 @505       if (vp->vma)
> >
> > Check presumes that vp->vma can be NULL.  On my other system (with
> > yesterday's linux-next code) vp->vma can never be NULL.
>
> I think the check here is not needed since vp->vma should always be
> non-NULL. I'll double-check and will remove it if that is confirmed.

Fix is posted at
https://lore.kernel.org/all/20230301022720.1380780-1-surenb@google.com/

> Thanks,
> Suren.
>
> >
> > f517f7ae341d93 Suren Baghdasaryan 2023-02-27  506               vma_sta=
rt_write(vp->vma);
> > f517f7ae341d93 Suren Baghdasaryan 2023-02-27  507       if (vp->adj_nex=
t)
> > f517f7ae341d93 Suren Baghdasaryan 2023-02-27  508               vma_sta=
rt_write(vp->adj_next);
> > f517f7ae341d93 Suren Baghdasaryan 2023-02-27  509       /* vp->insert i=
s always a newly created VMA, no need for locking */
> > f517f7ae341d93 Suren Baghdasaryan 2023-02-27  510       if (vp->remove)
> > f517f7ae341d93 Suren Baghdasaryan 2023-02-27  511               vma_sta=
rt_write(vp->remove);
> > f517f7ae341d93 Suren Baghdasaryan 2023-02-27  512       if (vp->remove2=
)
> > f517f7ae341d93 Suren Baghdasaryan 2023-02-27  513               vma_sta=
rt_write(vp->remove2);
> > f517f7ae341d93 Suren Baghdasaryan 2023-02-27  514
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  515       if (vp->file) {
> > 440703e082b9c7 Liam R. Howlett    2023-01-20 @516               uprobe_=
munmap(vp->vma, vp->vma->vm_start, vp->vma->vm_end);
> >                                                                        =
                ^^^^^^^
> > Uncheck dereference.
> >
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  517
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  518               if (vp-=
>adj_next)
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  519                      =
 uprobe_munmap(vp->adj_next, vp->adj_next->vm_start,
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  520                      =
               vp->adj_next->vm_end);
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  521
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  522               i_mmap_=
lock_write(vp->mapping);
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  523               if (vp-=
>insert && vp->insert->vm_file) {
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  524                      =
 /*
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  525                      =
  * Put into interval tree now, so instantiated pages
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  526                      =
  * are visible to arm/parisc __flush_dcache_page
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  527                      =
  * throughout; but we cannot insert into address
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  528                      =
  * space until vma start or end is updated.
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  529                      =
  */
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  530                      =
 __vma_link_file(vp->insert,
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  531                      =
                 vp->insert->vm_file->f_mapping);
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  532               }
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  533       }
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  534
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  535       if (vp->anon_vm=
a) {
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  536               anon_vm=
a_lock_write(vp->anon_vma);
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  537               anon_vm=
a_interval_tree_pre_update_vma(vp->vma);
> >
> > More unchecked dereferences.
> >
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  538               if (vp-=
>adj_next)
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  539                      =
 anon_vma_interval_tree_pre_update_vma(vp->adj_next);
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  540       }
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  541
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  542       if (vp->file) {
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  543               flush_d=
cache_mmap_lock(vp->mapping);
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  544               vma_int=
erval_tree_remove(vp->vma, &vp->mapping->i_mmap);
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  545               if (vp-=
>adj_next)
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  546                      =
 vma_interval_tree_remove(vp->adj_next,
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  547                      =
                          &vp->mapping->i_mmap);
> > 440703e082b9c7 Liam R. Howlett    2023-01-20  548       }
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests
> >
