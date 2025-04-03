Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEABA24EF8C
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Apr 2025 15:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743693260; cv=none; b=nSo7Ck117hs+FSHvoC7mKOwPDGoOOgRCl6wf7JAy0aVtzB6tZ9NNVSQ/GmYWLES7q4KTeThBzN0OASW7oo7TIM6//SfD3KWEcVGF4cu74RQWf9E7Trv1TFXSHWQN8Z7obVW/xsxKp1belFZct18XTiQBokm8gzRYSSOdiCAgevI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743693260; c=relaxed/simple;
	bh=Bg+dtnYpl2VdhNpsVZPf6Taz3ai8xl6l07TTWY3wZo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5vhlvaNZYF2BPbbMiBdKMfytJCTKOnX8s6TbiYpJD+1fO268F532uxacozCeEvT6lqN+jVzdXUWNtLSkqp+Jc9BEuJFhb6wiFnlBbQJ5vpwZdsxSOg45YOxaCogelwk+IQ2cIxUrJlJKHhqa/IgaKg/ib1YLhx5uUfArfFsExY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y+FRCkt0; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y+FRCkt0"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so904016f8f.3
        for <oe-kbuild@lists.linux.dev>; Thu, 03 Apr 2025 08:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743693256; x=1744298056; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zesTfvhE2YJxqZrUkOmQImcB4JZs5LCDw+hQnMIH21A=;
        b=Y+FRCkt04/mtMRhRsB/bscdRm09FTc/1qxeIM96QDjdEMciCVXEGJx3lmoBxzteKdE
         mcxTkrEVGByNwuRW2qr9RvSVvMvZw9m1Ik1SzcGoVj2UEeHeAMe+h3i4l6jYjvD9Wr8x
         U1WeJ7OE4d/FjNUyuZGXqq9vDUI9Qd4vbalxcrL5cUGA5+kosSlw3spVbfSwNIGyaU9V
         9n+TgRya5Qb2fkkXHKseu3vgZQy1Oca1EXi/sZl41gDU0mOnndeN6ni/HSnkMkfS7KKX
         OxCx4Ygq+yF0oNV2vMZ6l3AZK8Tz9CY7IL8rGl6SuEZVHQ0j79kHqqMZWI8TyT/tX837
         vKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743693256; x=1744298056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zesTfvhE2YJxqZrUkOmQImcB4JZs5LCDw+hQnMIH21A=;
        b=pCAOZtlnzszvsifoychqKccgyk6Vo41JZgRRmuLOo19pwBfVPgDk51a2a9ZeML2/z4
         kaOx1SfclGpyLzUDC7Xa6aExgKtH8L5sNFkESuhE84uEr3+1u1EySsMOaZeX8WvdficH
         QM2+RI+Hcyf0RWSsOIyiajibgwx8UIaZm+xvt6i8e6DTSEkYMU8mr0y8/CzH5QGlo8wT
         yNBoHsWHAZkU9REQraUjmdFOkORqQXzdcCi7CNnRqbWi6Pb3oxeyPlc7KDzzpKeq8K8/
         gia4scre4TQ+YI57f9gZiZD6HpxOFCDdCAyjGPUCluxjiqkm4APOQZGyuWi5eZ2LRMEI
         wDBA==
X-Forwarded-Encrypted: i=1; AJvYcCWbUp0u3/zfniSlpKcsWClWyuNKgtfmc22YwbFtqdU9yejanoChuRINV6kttZUSuBJr2ND5fu36mCc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmgOl2ZeCwgETT1iwowlXCHehYtcd9sQaQsqiPciAPAuWZUQ26
	6V4aQdv9ZEG4tbb6RIEmlolh5oyyA5oGLNK+kibXGvbWoGXKuIPLSrR/5rBWBBo=
X-Gm-Gg: ASbGncsmllRbpj4TbLris316oIu2Uy/mbRFAhUqTnGTZbljVKoPP6gFNnwbmptxn7vf
	BB025M7dEyr88xxotCOhey39bwB/UCNJkMcbDXySdg7QTmlnEOAMnOEPZ3s43P+Aej90h78RA+j
	n+8mLQ3dyG8AttDZ/dYeWur9XFEaolDnSNEa1KUebyeVvd5qykd4o/yLEgPujq+QvyJHmKoCj8L
	gZ3oaTi/a2JcH4xVlLzh+NBDGudA+azHlDDAsZTgVXaDe95Jhp5LNKvB8WFmwC0olDr5eGha/0w
	WYlgFFy7nB0oI/eT0njetWl2w2vqOkhOuWxEImeDHwdW5YoHlg==
X-Google-Smtp-Source: AGHT+IFMCCjbDEb0ODe6Sl1fKegMQn7DnIEF6seKhoqCEcHbDlk903Mu/qkvcsEO6a7wEAqglg0Faw==
X-Received: by 2002:a05:6000:290f:b0:390:f552:d291 with SMTP id ffacd0b85a97d-39c120dc53emr22332900f8f.22.1743693255931;
        Thu, 03 Apr 2025 08:14:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c301a6796sm2085299f8f.31.2025.04.03.08.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 08:14:15 -0700 (PDT)
Date: Thu, 3 Apr 2025 18:14:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>, kernel test robot <lkp@intel.com>,
	oe-kbuild@lists.linux.dev, Dan Carpenter <error27@gmail.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, x86@kernel.org
Subject: Re: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in
 copy_page_range()
Message-ID: <94c35e89-f915-4122-b1a0-436893201373@stanley.mountain>
References: <g5vxcrmdjjsvrjeo5k6uzwypctv2mvbteoommwwpv6sfjpbcyd@lackqksyahfs>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <g5vxcrmdjjsvrjeo5k6uzwypctv2mvbteoommwwpv6sfjpbcyd@lackqksyahfs>

Sorry, I've been having trouble with my email recently...  I replied
earlier but my email got eaten on the way out.

What happened here is that the zero day bot emails go to me first and
then I review them or forward them depending on if they're a real
issue or not.

Here it's a false postive because it's set and used if the
(src_vma->vm_flags & VM_PFNMAP) flag is set.  Smatch doesn't parse
this correctly.  I've been meaning to fix this in Smatch for a
while.

But these days more and more people are using lei and b4 to get their
email so they see the unreviewed Smatch warnings.

regards,
dan carpenter

On Wed, Apr 02, 2025 at 12:37:24PM +0100, Lorenzo Stoakes wrote:
> Bcc:
> Subject: Re: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in
>  copy_page_range()
> Message-ID: <0f94adaf-37a4-4d38-b952-01c2dc474a2c@lucifer.local>
> Reply-To:
> In-Reply-To: <b21bcd61-faf0-4ad8-b644-99794794594f@redhat.com>
> 
> Actually let me +cc a few more so this isn't lost further :P
> 
> On Wed, Apr 02, 2025 at 01:32:52PM +0200, David Hildenbrand wrote:
> > On 02.04.25 13:19, Lorenzo Stoakes wrote:
> > > On Thu, Mar 27, 2025 at 09:59:02AM +0800, kernel test robot wrote:
> > > > BCC: lkp@intel.com
> > > > CC: oe-kbuild-all@lists.linux.dev
> > > > In-Reply-To: <20250325191951.471185-1-david@redhat.com>
> > > > References: <20250325191951.471185-1-david@redhat.com>
> > > > TO: David Hildenbrand <david@redhat.com>
> > > >
> > > > Hi David,
> > > >
> > > > kernel test robot noticed the following build warnings:
> > > >
> > > > [auto build test WARNING on 38fec10eb60d687e30c8c6b5420d86e8149f7557]
> > > >
> > > > url:    https://github.com/intel-lab-lkp/linux/commits/David-Hildenbrand/x86-mm-pat-Fix-VM_PAT-handling-when-fork-fails-in-copy_page_range/20250326-032200
> > > > base:   38fec10eb60d687e30c8c6b5420d86e8149f7557
> > > > patch link:    https://lore.kernel.org/r/20250325191951.471185-1-david%40redhat.com
> > > > patch subject: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in copy_page_range()
> > > > :::::: branch date: 31 hours ago
> > > > :::::: commit date: 31 hours ago
> > > > config: hexagon-randconfig-r073-20250327 (https://download.01.org/0day-ci/archive/20250327/202503270941.IFILyNCX-lkp@intel.com/config)
> > > > compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Reported-by: Dan Carpenter <error27@gmail.com>
> > > > | Closes: https://lore.kernel.org/r/202503270941.IFILyNCX-lkp@intel.com/
> > > >
> > > > smatch warnings:
> > > > mm/memory.c:1428 copy_page_range() error: uninitialized symbol 'pfn'.
> >
> > Huh,
> >
> > how did the original report not make it into my inbox ? :/
> 
> Yeah it's odd... maybe broken script?
> 
> >
> > Thanks for replying Lorenzo!
> 
> NP!
> 
> >
> > >
> > > I have a feeling this is because if ndef __HAVE_PFNMAP_TRACKING you just
> > > don't touch pfn at all, but also I see in the new track_pfn_copy() there
> > > are code paths where pfn doesn't get set, but you still pass the
> > > uninitialised pfn to untrack_pfn_copy()...
> >
> > If track_pfn_copy() returns 0 and VM_PAT applies, the pfn is set. Otherwise
> > (returns an error), we immediately return from copy_page_range().
> >
> > So once we reach untrack_pfn_copy() ... the PFN was set.
> >
> > In case of !__HAVE_PFNMAP_TRACKING the pfn is not set and not used.
> >
> > >
> > > I mean it could also be in the case of !(src_vma->vm_flags & VM_PAT) (but &
> > > VM_PFNMAP), where we return 0 but still pass pfn to untrack_pfn_copy()...
> >
> > I assume that's what it is complaining about, and it doesn't figure out that
> > the parameter is unused.
> >
> > So likely it's best to just initialize pfn to 0.
> >
> > >
> > > This is all super icky, we probably want to actually have track_pfn_copy()
> > > indicate whether we want to later untrack, not only if there's an error.
> >
> > Sounds overly-complicated. But having a pfn != 0 might work.
> >
> > > > Will comment accordingly on patch, but I mean I don't like the idea of
> > us
> > > just initialising the pfn here, because... what to?... :)
> >
> 
> Sure, I mean for all of above let's have the debate on the main patch I guess so
> it's in one place...
> 
> > Stared at that code for too long (and I reached a point where the PAT stuff
> > absolutely annoys me).
> 
> But, also lol. Can. Relate.
> 
> >
> > Thanks!
> >
> > --
> > Cheers,
> >
> > David / dhildenb
> >
> 
> Cheers, Lorenzo
