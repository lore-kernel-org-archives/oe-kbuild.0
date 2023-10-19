Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136B020313
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Oct 2023 12:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PMRcU6AH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697720157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bedN9QfTANJGNML2vYFMLodX6ICVGSptHlSOlZaBF4c=;
	b=PMRcU6AHSW7MOaaV6L8H5gZuGgFjy3MmZYEFma8cwbCX1R0f5/4V3Q70LrvWFNwg68Cg++
	arxmnMVKNcs614fy4KR+9VJt1J6xupcVCDCjIxxHvqGUPHU8s0+wyYGxx1s9vgEILNvImk
	nFgeeGjswHQ+GZZCojbWm0gwiaY9gzc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-2BE9P6GuMxSTIDTMyZSV4g-1; Thu, 19 Oct 2023 08:55:54 -0400
X-MC-Unique: 2BE9P6GuMxSTIDTMyZSV4g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A4A782DFB8;
	Thu, 19 Oct 2023 12:55:54 +0000 (UTC)
Received: from localhost (unknown [10.72.112.51])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76CA91C060AE;
	Thu, 19 Oct 2023 12:55:53 +0000 (UTC)
Date: Thu, 19 Oct 2023 20:55:50 +0800
From: Baoquan He <bhe@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Philip Li <philip.li@intel.com>, oe-kbuild@lists.linux.dev,
	Lorenzo Stoakes <lstoakes@gmail.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: mm/vmalloc.c:3689 vread_iter() error: we previously assumed 'vm'
 could be null (see line 3667)
Message-ID: <ZTEnVpCYjV0yyIgn@MiWiFi-R3L-srv>
References: <f82be227-bfde-439a-b339-1b4ee370d59a@kadam.mountain>
 <ZS+dSd9Z6/2wU0Eg@MiWiFi-R3L-srv>
 <89caf59a-d3b9-409d-b1ae-9e370cb9ee7d@kadam.mountain>
 <ZS/LrhcxcMOgiiX5@MiWiFi-R3L-srv>
 <ZS/TVMT9ed7OdyNy@rli9-mobl>
 <ZS/2k6DIMd0tZRgK@MiWiFi-R3L-srv>
 <20231018085248.6f3f36101cbdfe0990c8b467@linux-foundation.org>
 <ZTCURc8ZQE+KrTvS@MiWiFi-R3L-srv>
 <0eddb8b4-47a1-4d94-ae44-707addae77c8@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0eddb8b4-47a1-4d94-ae44-707addae77c8@kadam.mountain>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

On 10/19/23 at 08:40am, Dan Carpenter wrote:
> On Thu, Oct 19, 2023 at 10:28:21AM +0800, Baoquan He wrote:
> > On 10/18/23 at 08:52am, Andrew Morton wrote:
> > > On Wed, 18 Oct 2023 23:15:31 +0800 Baoquan He <bhe@redhat.com> wrote:
> > > 
> > > > From: Baoquan He <bhe@redhat.com>
> > > > Date: Wed, 18 Oct 2023 22:50:14 +0800
> > > > Subject: [PATCH] mm/vmalloc: fix the unchecked dereference warning in vread_iter()
> > > > Content-type: text/plain
> > > > 
> > > > LKP reported smatch warning as below:
> > > > 
> > > > ===================
> > > > smatch warnings:
> > > > mm/vmalloc.c:3689 vread_iter() error: we previously assumed 'vm' could be null (see line 3667)
> > > > ......
> > > > 06c8994626d1b7  @3667 size = vm ? get_vm_area_size(vm) : va_size(va);
> > > > ......
> > > > 06c8994626d1b7  @3689 else if (!(vm->flags & VM_IOREMAP))
> > > >                                  ^^^^^^^^^
> > > > Unchecked dereference
> > > > =====================
> > > > 
> > > > So add checking on whether 'vm' is not null when dereferencing it in
> > > > vread_iter(). This mutes smatch complaint.
> > > > 
> > > > ...
> > > >
> > > > --- a/mm/vmalloc.c
> > > > +++ b/mm/vmalloc.c
> > > > @@ -3813,7 +3813,7 @@ long vread_iter(struct iov_iter *iter, const char *addr, size_t count)
> > > >  
> > > >  		if (flags & VMAP_RAM)
> > > >  			copied = vmap_ram_vread_iter(iter, addr, n, flags);
> > > > -		else if (!(vm->flags & VM_IOREMAP))
> > > > +		else if (!(vm && (vm->flags & VM_IOREMAP)))
> > > >  			copied = aligned_vread_iter(iter, addr, n);
> > > >  		else /* IOREMAP area is treated as memory hole */
> > > >  			copied = zero_iter(iter, n);
> > > 
> > > So is this not a real runtime bug?  We're only doing this to suppress a
> > > smatch warning?
> > > 
> > > If so, can we please include a description of *why* this wasn't a bug? 
> > > What conditions ensure that vm!=NULL at this point?
> > 
> > I think this is not a real runtime bug. The only chance it can hapen is
> > when (flags == VMAP_BLOCK) is true. That has been warned and could never
> > happen. I updated patch log and paste v2 here. 
> > 
> >                 /*
> >                  * VMAP_BLOCK indicates a sub-type of vm_map_ram area, need
> >                  * be set together with VMAP_RAM.
> >                  */
> >                 WARN_ON(flags == VMAP_BLOCK);
> >  
> >                 if (!vm && !flags)
> >                         continue;
> > 
> > 
> 
> Thanks.  If you want you could just ignore the warning.  It's a one time
> warning so we won't send the mail again and if people have questions
> about it, they can just look it up on lore.
> 
> The truth is when I was reviewing this code the first time I got mixed
> up between flags and vm->flags so that's part of why I reported it.
> 
> Smatch ignores the WARN_ON().  Historically WARN_ON() has been useless
> for indicating whether something can happen or not.  These days,
> WARN_ON() is treated as a syzkaller bug so we prefer pr_warn() if
> something can actually happen.  We still see a lot of WARN_ON()s
> happening in real life so I'm not eager to make Smatch treat them like a
> BUG_ON().
> 
> Also, sadly, even if we changed the WARN_ON() to a BUG_ON() it still
> wouldn't silence the warning because Smatch is not quite clever enough
> to parse that.

Thanks for your sharing, Dan.

My understanding was that our current code alwasys have va->flags with
VMAP_RAM when it's set. So the case va->flags == VMAP_BLOCK won't
happen. I now understand your worry that it possibly happens. People
could change that in the futuer with buggy code or intented action while
not noticing that. I may not get your suggestion clearly, wonder if you
are suggesting this could be a realtime bug and need be stated in patch
log clearly.

Thanks
Baoquan

