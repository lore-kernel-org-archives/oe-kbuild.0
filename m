Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D32A3D74;
	Tue, 28 Feb 2023 14:24:27 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id cy6so40749532edb.5;
        Tue, 28 Feb 2023 06:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hlBi5awhCP+gPf2l9TBqOitrum6hLos29GmQuuua0y4=;
        b=QDTuqN8jQtLj7eXjOQvRvymlcpQCPFZnoFc+FvqSxJhPBt+IOVLf15r8t+NryZAPdE
         tBdM7B+6cQori5/oFKo/1ZP3ax+WrcMY9XGsvaiBtCLriqsOZMv6jRqeE0kQZNQsCNMq
         ZDXqJh/9OyHjmxvQke3tz9EftAF29MWM5NLx2FE9Ag7XEyUcW8GnIcpNxuPMawJJtZgB
         cRquCfyEYa6d1FM/FdSSc64um1P3M0mvlutKmo/a6f3NIQfdUyG7R4IDtsp+bTpZRZFt
         b58Jk6b+yKxKTOBSUSUK3hp2kwJ7Kq7wslceW882ezAjsiDT10KnFYOoky1wl7YE5s5Y
         bZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hlBi5awhCP+gPf2l9TBqOitrum6hLos29GmQuuua0y4=;
        b=wHSoDPu5/f4IihEQNn1kQaa3/ayqMsnFV3sTsq8DEpUOUM8Rjxfud3YGYpwUJjROXd
         RxCLtW4O0QQIeM1eCvHQkjRs8XahZuUqL23k2giNRnNFKjk8GSZCQbyaFw1VHgBk2Bhy
         Cp/+92Ts3ZIiJwg+b3iUN/+eNpUBSi0XIn6yevny/B+c5M0D6/hzeFXHwPNUppiyMSes
         XHYrQkr6nmchv2lSx6cQbUCSJj66MzTrWvtCqX4Rm58fROnep8nCcgzkDPg9NTc4C7eV
         QdkrCwmN3c/nJHuzvvKptbMcYcZlT1BLNk3pWE6tTHzhcjHjRVOgiYIEkPRuycr5QEm5
         AAjQ==
X-Gm-Message-State: AO0yUKVn7iZRKpIaWUE6cediIZuiZ4hrmRxv9TJmX9fWFxt4FoqRb1Mr
	yAf22hdKaLwS4aWoHU4nTy8kxhLjYmQ=
X-Google-Smtp-Source: AK7set+oyXFS60VGC3QQYJGcFF7II1bH1tG77O89utRLWZE9PGBZhepGqowGtnrIVK39Zr8o8f+qwQ==
X-Received: by 2002:a17:907:2163:b0:8b2:7534:265e with SMTP id rl3-20020a170907216300b008b27534265emr2664161ejb.58.1677594265103;
        Tue, 28 Feb 2023 06:24:25 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d15-20020a170906544f00b008f89953b761sm4482402ejp.3.2023.02.28.06.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 06:24:24 -0800 (PST)
Date: Tue, 28 Feb 2023 17:24:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Suren Baghdasaryan <surenb@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [ammarfaizi2-block:akpm/mm/mm-unstable 82/99] mm/mmap.c:516
 vma_prepare() error: we previously assumed 'vp->vma' could be null (see line
 505)
Message-ID: <202302281802.J93Nma7q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230228142420.-q65rhMh4PGLxDgfaIrz1dNOtIJ6HoatiAbFm3L13ZU@z>

tree:   https://github.com/ammarfaizi2/linux-block akpm/mm/mm-unstable
head:   61edd3b68c3185673c9b05dfe48038692964c73b
commit: f517f7ae341d933856cdf4d9d773027681ed5dff [82/99] mm/mmap: write-lock VMAs in vma_prepare before modifying them
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230228/202302281802.J93Nma7q-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302281802.J93Nma7q-lkp@intel.com/

smatch warnings:
mm/mmap.c:516 vma_prepare() error: we previously assumed 'vp->vma' could be null (see line 505)

vim +516 mm/mmap.c

440703e082b9c7 Liam R. Howlett    2023-01-20  503  static inline void vma_prepare(struct vma_prepare *vp)
440703e082b9c7 Liam R. Howlett    2023-01-20  504  {
f517f7ae341d93 Suren Baghdasaryan 2023-02-27 @505  	if (vp->vma)

Check presumes that vp->vma can be NULL.  On my other system (with
yesterday's linux-next code) vp->vma can never be NULL.

f517f7ae341d93 Suren Baghdasaryan 2023-02-27  506  		vma_start_write(vp->vma);
f517f7ae341d93 Suren Baghdasaryan 2023-02-27  507  	if (vp->adj_next)
f517f7ae341d93 Suren Baghdasaryan 2023-02-27  508  		vma_start_write(vp->adj_next);
f517f7ae341d93 Suren Baghdasaryan 2023-02-27  509  	/* vp->insert is always a newly created VMA, no need for locking */
f517f7ae341d93 Suren Baghdasaryan 2023-02-27  510  	if (vp->remove)
f517f7ae341d93 Suren Baghdasaryan 2023-02-27  511  		vma_start_write(vp->remove);
f517f7ae341d93 Suren Baghdasaryan 2023-02-27  512  	if (vp->remove2)
f517f7ae341d93 Suren Baghdasaryan 2023-02-27  513  		vma_start_write(vp->remove2);
f517f7ae341d93 Suren Baghdasaryan 2023-02-27  514  
440703e082b9c7 Liam R. Howlett    2023-01-20  515  	if (vp->file) {
440703e082b9c7 Liam R. Howlett    2023-01-20 @516  		uprobe_munmap(vp->vma, vp->vma->vm_start, vp->vma->vm_end);
                                                                                       ^^^^^^^
Uncheck dereference.

440703e082b9c7 Liam R. Howlett    2023-01-20  517  
440703e082b9c7 Liam R. Howlett    2023-01-20  518  		if (vp->adj_next)
440703e082b9c7 Liam R. Howlett    2023-01-20  519  			uprobe_munmap(vp->adj_next, vp->adj_next->vm_start,
440703e082b9c7 Liam R. Howlett    2023-01-20  520  				      vp->adj_next->vm_end);
440703e082b9c7 Liam R. Howlett    2023-01-20  521  
440703e082b9c7 Liam R. Howlett    2023-01-20  522  		i_mmap_lock_write(vp->mapping);
440703e082b9c7 Liam R. Howlett    2023-01-20  523  		if (vp->insert && vp->insert->vm_file) {
440703e082b9c7 Liam R. Howlett    2023-01-20  524  			/*
440703e082b9c7 Liam R. Howlett    2023-01-20  525  			 * Put into interval tree now, so instantiated pages
440703e082b9c7 Liam R. Howlett    2023-01-20  526  			 * are visible to arm/parisc __flush_dcache_page
440703e082b9c7 Liam R. Howlett    2023-01-20  527  			 * throughout; but we cannot insert into address
440703e082b9c7 Liam R. Howlett    2023-01-20  528  			 * space until vma start or end is updated.
440703e082b9c7 Liam R. Howlett    2023-01-20  529  			 */
440703e082b9c7 Liam R. Howlett    2023-01-20  530  			__vma_link_file(vp->insert,
440703e082b9c7 Liam R. Howlett    2023-01-20  531  					vp->insert->vm_file->f_mapping);
440703e082b9c7 Liam R. Howlett    2023-01-20  532  		}
440703e082b9c7 Liam R. Howlett    2023-01-20  533  	}
440703e082b9c7 Liam R. Howlett    2023-01-20  534  
440703e082b9c7 Liam R. Howlett    2023-01-20  535  	if (vp->anon_vma) {
440703e082b9c7 Liam R. Howlett    2023-01-20  536  		anon_vma_lock_write(vp->anon_vma);
440703e082b9c7 Liam R. Howlett    2023-01-20  537  		anon_vma_interval_tree_pre_update_vma(vp->vma);

More unchecked dereferences.

440703e082b9c7 Liam R. Howlett    2023-01-20  538  		if (vp->adj_next)
440703e082b9c7 Liam R. Howlett    2023-01-20  539  			anon_vma_interval_tree_pre_update_vma(vp->adj_next);
440703e082b9c7 Liam R. Howlett    2023-01-20  540  	}
440703e082b9c7 Liam R. Howlett    2023-01-20  541  
440703e082b9c7 Liam R. Howlett    2023-01-20  542  	if (vp->file) {
440703e082b9c7 Liam R. Howlett    2023-01-20  543  		flush_dcache_mmap_lock(vp->mapping);
440703e082b9c7 Liam R. Howlett    2023-01-20  544  		vma_interval_tree_remove(vp->vma, &vp->mapping->i_mmap);
440703e082b9c7 Liam R. Howlett    2023-01-20  545  		if (vp->adj_next)
440703e082b9c7 Liam R. Howlett    2023-01-20  546  			vma_interval_tree_remove(vp->adj_next,
440703e082b9c7 Liam R. Howlett    2023-01-20  547  						 &vp->mapping->i_mmap);
440703e082b9c7 Liam R. Howlett    2023-01-20  548  	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

