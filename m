Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847FE31A86;
	Wed, 18 Oct 2023 15:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DDurZJ/t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3CE7C433C8;
	Wed, 18 Oct 2023 15:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1697644370;
	bh=b8LsAR2QdX3IC2gaSa678S7SamLDd+g6f++6ZqtXOmU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DDurZJ/tH9/Dcq2NUUAnR7bwtgDl5thIrctfw+s4q4F7B9z+LCEL9V4leztRfz6Oy
	 QN+ti9o7Lk4il2Xp2hnzjsN60DUZJkyYwxwhGWgCcp/J6tv9XrZpdoii3QHMM6q8IS
	 FBIF1WP+glbZTrUhUIkqwPEPvI4kpzhkxsSOShA4=
Date: Wed, 18 Oct 2023 08:52:48 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Baoquan He <bhe@redhat.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Philip Li
 <philip.li@intel.com>, oe-kbuild@lists.linux.dev, Lorenzo Stoakes
 <lstoakes@gmail.com>, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: mm/vmalloc.c:3689 vread_iter() error: we previously assumed
 'vm' could be null (see line 3667)
Message-Id: <20231018085248.6f3f36101cbdfe0990c8b467@linux-foundation.org>
In-Reply-To: <ZS/2k6DIMd0tZRgK@MiWiFi-R3L-srv>
References: <f82be227-bfde-439a-b339-1b4ee370d59a@kadam.mountain>
	<ZS+dSd9Z6/2wU0Eg@MiWiFi-R3L-srv>
	<89caf59a-d3b9-409d-b1ae-9e370cb9ee7d@kadam.mountain>
	<ZS/LrhcxcMOgiiX5@MiWiFi-R3L-srv>
	<ZS/TVMT9ed7OdyNy@rli9-mobl>
	<ZS/2k6DIMd0tZRgK@MiWiFi-R3L-srv>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Oct 2023 23:15:31 +0800 Baoquan He <bhe@redhat.com> wrote:

> From: Baoquan He <bhe@redhat.com>
> Date: Wed, 18 Oct 2023 22:50:14 +0800
> Subject: [PATCH] mm/vmalloc: fix the unchecked dereference warning in vread_iter()
> Content-type: text/plain
> 
> LKP reported smatch warning as below:
> 
> ===================
> smatch warnings:
> mm/vmalloc.c:3689 vread_iter() error: we previously assumed 'vm' could be null (see line 3667)
> ......
> 06c8994626d1b7  @3667 size = vm ? get_vm_area_size(vm) : va_size(va);
> ......
> 06c8994626d1b7  @3689 else if (!(vm->flags & VM_IOREMAP))
>                                  ^^^^^^^^^
> Unchecked dereference
> =====================
> 
> So add checking on whether 'vm' is not null when dereferencing it in
> vread_iter(). This mutes smatch complaint.
> 
> ...
>
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3813,7 +3813,7 @@ long vread_iter(struct iov_iter *iter, const char *addr, size_t count)
>  
>  		if (flags & VMAP_RAM)
>  			copied = vmap_ram_vread_iter(iter, addr, n, flags);
> -		else if (!(vm->flags & VM_IOREMAP))
> +		else if (!(vm && (vm->flags & VM_IOREMAP)))
>  			copied = aligned_vread_iter(iter, addr, n);
>  		else /* IOREMAP area is treated as memory hole */
>  			copied = zero_iter(iter, n);

So is this not a real runtime bug?  We're only doing this to suppress a
smatch warning?

If so, can we please include a description of *why* this wasn't a bug? 
What conditions ensure that vm!=NULL at this point?
