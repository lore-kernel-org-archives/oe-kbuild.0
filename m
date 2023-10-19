Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367B22104
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Oct 2023 05:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o1QpQrPQ"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-507962561adso9258391e87.0
        for <oe-kbuild@lists.linux.dev>; Wed, 18 Oct 2023 22:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697694063; x=1698298863; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j7kAytioghDE6xyX4BghBa8cMFVr3L8tOR2ZoNefZ9k=;
        b=o1QpQrPQwsHpjUsfYPWL9jjCG5EAMqX8MEzjalyvBAdITYB6IOfpzem6vzWy5Gl/Dl
         G3iD2h8vxxHmOz88vobQ86Y86H1s6kB40LhcCa7AM7SZwQGh0cc9KTWM9Df+DVzACXeV
         l2KzJpVCgD2OP0YgOu7ysG3ST30XshOO1ayHdCKr0yWVwzF02yOfxAiD6Z6WAQygKwOy
         jznmLwIsn5q6RMx/n6/6x2Bof+TIpsFm4cGdh0vJ5cp6+U+cWUh2n1sK42yqaD46eiTX
         ilUC2oHsmKb944AR8817Pd2MqMQjrzrY9nbxo21kMa6hgIHjddryC6X4rX+qdi/mUoYa
         I+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697694063; x=1698298863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7kAytioghDE6xyX4BghBa8cMFVr3L8tOR2ZoNefZ9k=;
        b=JTeSwfQ6GrX21vwrR/GVYB4nS97j9xMalJO1ntIK2XtTGxcpLW8Y3D/JvdJaY0kd8G
         awhAoHPZ+MJdGLV+fgZvbghuYBzqsipV9U13+XFEIAy8asAtdhSbvYHohjvGZeFihaOc
         F+CC8CKkzPtzo527A6P33ZyqT5pIkiQm2ZaW+eoCd2po3Yqwt27Ga/7CDtTK7juVRiZV
         EhN3leE9nu+xxndYfA6t5WPYQfIU6yqi/FGFgQXE56rmsibULCRNhxiOGSC9MmITwRfi
         LErgFNmTvUiVHiZz7Q17skEWEQYSP/BRmqAnC2Rb/Mgke0ukgQWI2BtucBOriwSlQWj2
         UkSw==
X-Gm-Message-State: AOJu0YxHS7RCBLTB7TKiDapAdZu3zFFAhW7cX1LBNovWLjbSUcIE2/lC
	id9DD4uCkxZTpp9Y47OqnXMlRg==
X-Google-Smtp-Source: AGHT+IG5EtVlCxnFhKx6/IWeIkVIlcJyQiopIMW7380LSHeSu/QzSQA6+QwuSQOi3ZAsfzcZcIDbKg==
X-Received: by 2002:a19:5011:0:b0:503:388f:30a3 with SMTP id e17-20020a195011000000b00503388f30a3mr677846lfb.26.1697694063124;
        Wed, 18 Oct 2023 22:41:03 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i6-20020adfe486000000b0032415213a6fsm3580699wrm.87.2023.10.18.22.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 22:41:02 -0700 (PDT)
Date: Thu, 19 Oct 2023 08:40:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Baoquan He <bhe@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Philip Li <philip.li@intel.com>, oe-kbuild@lists.linux.dev,
	Lorenzo Stoakes <lstoakes@gmail.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: mm/vmalloc.c:3689 vread_iter() error: we previously assumed 'vm'
 could be null (see line 3667)
Message-ID: <0eddb8b4-47a1-4d94-ae44-707addae77c8@kadam.mountain>
References: <f82be227-bfde-439a-b339-1b4ee370d59a@kadam.mountain>
 <ZS+dSd9Z6/2wU0Eg@MiWiFi-R3L-srv>
 <89caf59a-d3b9-409d-b1ae-9e370cb9ee7d@kadam.mountain>
 <ZS/LrhcxcMOgiiX5@MiWiFi-R3L-srv>
 <ZS/TVMT9ed7OdyNy@rli9-mobl>
 <ZS/2k6DIMd0tZRgK@MiWiFi-R3L-srv>
 <20231018085248.6f3f36101cbdfe0990c8b467@linux-foundation.org>
 <ZTCURc8ZQE+KrTvS@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTCURc8ZQE+KrTvS@MiWiFi-R3L-srv>

On Thu, Oct 19, 2023 at 10:28:21AM +0800, Baoquan He wrote:
> On 10/18/23 at 08:52am, Andrew Morton wrote:
> > On Wed, 18 Oct 2023 23:15:31 +0800 Baoquan He <bhe@redhat.com> wrote:
> > 
> > > From: Baoquan He <bhe@redhat.com>
> > > Date: Wed, 18 Oct 2023 22:50:14 +0800
> > > Subject: [PATCH] mm/vmalloc: fix the unchecked dereference warning in vread_iter()
> > > Content-type: text/plain
> > > 
> > > LKP reported smatch warning as below:
> > > 
> > > ===================
> > > smatch warnings:
> > > mm/vmalloc.c:3689 vread_iter() error: we previously assumed 'vm' could be null (see line 3667)
> > > ......
> > > 06c8994626d1b7  @3667 size = vm ? get_vm_area_size(vm) : va_size(va);
> > > ......
> > > 06c8994626d1b7  @3689 else if (!(vm->flags & VM_IOREMAP))
> > >                                  ^^^^^^^^^
> > > Unchecked dereference
> > > =====================
> > > 
> > > So add checking on whether 'vm' is not null when dereferencing it in
> > > vread_iter(). This mutes smatch complaint.
> > > 
> > > ...
> > >
> > > --- a/mm/vmalloc.c
> > > +++ b/mm/vmalloc.c
> > > @@ -3813,7 +3813,7 @@ long vread_iter(struct iov_iter *iter, const char *addr, size_t count)
> > >  
> > >  		if (flags & VMAP_RAM)
> > >  			copied = vmap_ram_vread_iter(iter, addr, n, flags);
> > > -		else if (!(vm->flags & VM_IOREMAP))
> > > +		else if (!(vm && (vm->flags & VM_IOREMAP)))
> > >  			copied = aligned_vread_iter(iter, addr, n);
> > >  		else /* IOREMAP area is treated as memory hole */
> > >  			copied = zero_iter(iter, n);
> > 
> > So is this not a real runtime bug?  We're only doing this to suppress a
> > smatch warning?
> > 
> > If so, can we please include a description of *why* this wasn't a bug? 
> > What conditions ensure that vm!=NULL at this point?
> 
> I think this is not a real runtime bug. The only chance it can hapen is
> when (flags == VMAP_BLOCK) is true. That has been warned and could never
> happen. I updated patch log and paste v2 here. 
> 
>                 /*
>                  * VMAP_BLOCK indicates a sub-type of vm_map_ram area, need
>                  * be set together with VMAP_RAM.
>                  */
>                 WARN_ON(flags == VMAP_BLOCK);
>  
>                 if (!vm && !flags)
>                         continue;
> 
> 

Thanks.  If you want you could just ignore the warning.  It's a one time
warning so we won't send the mail again and if people have questions
about it, they can just look it up on lore.

The truth is when I was reviewing this code the first time I got mixed
up between flags and vm->flags so that's part of why I reported it.

Smatch ignores the WARN_ON().  Historically WARN_ON() has been useless
for indicating whether something can happen or not.  These days,
WARN_ON() is treated as a syzkaller bug so we prefer pr_warn() if
something can actually happen.  We still see a lot of WARN_ON()s
happening in real life so I'm not eager to make Smatch treat them like a
BUG_ON().

Also, sadly, even if we changed the WARN_ON() to a BUG_ON() it still
wouldn't silence the warning because Smatch is not quite clever enough
to parse that.

regards,
dan carpenter


