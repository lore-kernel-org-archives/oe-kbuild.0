Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33151FB4;
	Mon, 16 Jan 2023 13:08:38 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id k8so12932546wrc.9;
        Mon, 16 Jan 2023 05:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bgpWNAUapJMRm26abQtvCzO7nE5jcn7/XPBKaRHCDCA=;
        b=VYYyjXDy+Yzh/3KKMh2FFaywaTMfMaWrhGFCbDcofAkDNbKEY1U/AcHM4m1TBL8qfH
         Tm4QTFHkZRvvUPtx4HucHbBsdchtFC2pEXGJJ1lgBB633pV7UjYjW1nbKfn1CM4UBna9
         AsHPDiaMWh9J/Z/I7rt61f5TRgr7lkItMzifaLl4Fjw9tkGg+RXtEzjc33QQLtaS2fTn
         VZDF/kK6HyfMxllfQp0aSLFElxUYzXz5fUAjyKo57kP3HU/TZ3gXz8UWCCUjk9g9Wss5
         qT7GF2RXlZ2MhADzlNRdV3NwUdrcKow6KFKKliIxMNZy0c6BbsG8vq6w77jdYYuHFA34
         QD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgpWNAUapJMRm26abQtvCzO7nE5jcn7/XPBKaRHCDCA=;
        b=cubr7LGYXsgj6KUWo4yFuqsX49r0Mex7yNZfbnAf4NOwT8w+bKNG2Mn4Pq/UBGG8wp
         OjaUhrb+FgFd52sqXmsYh0USry1TGTgCKbatTvyiZkmSWydES6VVpHfX2pcMcjmS7ukx
         9d1TwUpaeMmnI/TS+T83Spqu+zRtwR3vw0QULpNczO2ha9MHHWMUf3m6L/G7hV+zUVd7
         v/f6U/3iCFhOqIIhLgKGoByBI0261LohPjN7d9j4OVS9i+sS/4FwWage7aViE0X9Xv3R
         LMfIc8ceVBh3bvNQC0xejD+VqIIq/RzzVAh5MLyUNyJ++OygPYNIZC5JifrLylBF1TLJ
         5tiQ==
X-Gm-Message-State: AFqh2korMrpv5Mg/yfkVOr47F4bZEZ1TULQwddriWUTOYct7IlnnfBp1
	x/0WgAXwsROXLAAliYbNTxI=
X-Google-Smtp-Source: AMrXdXs6DqKJK054DmvtJdRU6Bwn1nL5xmlS++i0CmtXQ+GXk+OkqbLd6vDTD0JzDF+ahEO36Ag5iw==
X-Received: by 2002:adf:dcd2:0:b0:2bb:ebc4:2f5c with SMTP id x18-20020adfdcd2000000b002bbebc42f5cmr8564941wrm.43.1673874516935;
        Mon, 16 Jan 2023 05:08:36 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o17-20020a5d4091000000b0028965dc7c6bsm25975365wrp.73.2023.01.16.05.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 05:08:36 -0800 (PST)
Date: Mon, 16 Jan 2023 16:08:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: Baoquan He <bhe@redhat.com>
Cc: oe-kbuild@lists.linux.dev, linux-mm@kvack.org, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	urezki@gmail.com, lstoakes@gmail.com, stephen.s.brennan@oracle.com,
	willy@infradead.org, akpm@linux-foundation.org, hch@infradead.org
Subject: Re: [PATCH v3 3/7] mm/vmalloc.c: allow vread() to read out
 vm_map_ram areas
Message-ID: <Y8VMUUOlkwuu5xn6@kadam>
References: <20230113031921.64716-4-bhe@redhat.com>
 <202301132345.KVjvHMFq-lkp@intel.com>
 <Y8QI977QBDbuuGW5@fedora>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8QI977QBDbuuGW5@fedora>

On Sun, Jan 15, 2023 at 10:08:55PM +0800, Baoquan He wrote:
> > f181234a5a21fd0 Chen Wandun             2021-09-02  3650  	if ((unsigned long)addr + count <= va->va_start)
> > f181234a5a21fd0 Chen Wandun             2021-09-02  3651  		goto finished;
> > f181234a5a21fd0 Chen Wandun             2021-09-02  3652  
> > f608788cd2d6cae Serapheim Dimitropoulos 2021-04-29  3653  	list_for_each_entry_from(va, &vmap_area_list, list) {
> > e81ce85f960c2e2 Joonsoo Kim             2013-04-29  3654  		if (!count)
> > e81ce85f960c2e2 Joonsoo Kim             2013-04-29  3655  			break;
> > e81ce85f960c2e2 Joonsoo Kim             2013-04-29  3656  
> > 129dbdf298d7383 Baoquan He              2023-01-13  3657  		vm = va->vm;
> > 129dbdf298d7383 Baoquan He              2023-01-13  3658  		flags = va->flags & VMAP_FLAGS_MASK;
> > 129dbdf298d7383 Baoquan He              2023-01-13  3659  
> > 129dbdf298d7383 Baoquan He              2023-01-13  3660  		if (!vm && !flags)
> >                                                                             ^^^
> > vm can be NULL if a flag in VMAP_FLAGS_MASK is set.
> > 
> > e81ce85f960c2e2 Joonsoo Kim             2013-04-29  3661  			continue;
> 
> Right, after the 'continue;' line, only two cases could happen when it
> comes here. (vm != null) or (vm->flags & VMAP_RAM) is true.
>

You're saying VMAP_RAM, but strictly speaking the code is checking
VMAP_FLAGS_MASK and not VMAP_RAM.

+#define VMAP_RAM               0x1 /* indicates vm_map_ram area*/
+#define VMAP_BLOCK             0x2 /* mark out the vmap_block sub-type*/
+#define VMAP_FLAGS_MASK                0x3

If we assume that vm is NULL, VMAP_BLOCK is set and VMAP_RAM is clear
then it would lead to a NULL dereference.  There might be reasons why
that combination is impossible outside the function but we can't tell
from the information we have here.

Which is fine, outside information is a common reason for false
positives with this check.  But I was just concerned about the mix of
VMAP_FLAGS_MASK and VMAP_RAM.

regards,
dan carpenter

 
> > e81ce85f960c2e2 Joonsoo Kim             2013-04-29  3662  
> > 129dbdf298d7383 Baoquan He              2023-01-13  3663  		vaddr = (char *) va->va_start;
> > 129dbdf298d7383 Baoquan He              2023-01-13 @3664  		size = vm ? get_vm_area_size(vm) : va_size(va);
> >                                                                                ^^
> > 
> > 129dbdf298d7383 Baoquan He              2023-01-13  3665  
> > 129dbdf298d7383 Baoquan He              2023-01-13  3666  		if (addr >= vaddr + size)
> > ^1da177e4c3f415 Linus Torvalds          2005-04-16  3667  			continue;
> > ^1da177e4c3f415 Linus Torvalds          2005-04-16  3668  		while (addr < vaddr) {
> > ^1da177e4c3f415 Linus Torvalds          2005-04-16  3669  			if (count == 0)
> > ^1da177e4c3f415 Linus Torvalds          2005-04-16  3670  				goto finished;
> > ^1da177e4c3f415 Linus Torvalds          2005-04-16  3671  			*buf = '\0';
> > ^1da177e4c3f415 Linus Torvalds          2005-04-16  3672  			buf++;
> > ^1da177e4c3f415 Linus Torvalds          2005-04-16  3673  			addr++;
> > ^1da177e4c3f415 Linus Torvalds          2005-04-16  3674  			count--;
> > ^1da177e4c3f415 Linus Torvalds          2005-04-16  3675  		}
> > 129dbdf298d7383 Baoquan He              2023-01-13  3676  		n = vaddr + size - addr;
> > d0107eb07320b5d KAMEZAWA Hiroyuki       2009-09-21  3677  		if (n > count)
> > d0107eb07320b5d KAMEZAWA Hiroyuki       2009-09-21  3678  			n = count;
> > 129dbdf298d7383 Baoquan He              2023-01-13  3679  
> > 129dbdf298d7383 Baoquan He              2023-01-13  3680  		if (flags & VMAP_RAM)
> > 
> > assume VMAP_RAM is not set
> 
> OK, then vm is not null.
> > 
> > 129dbdf298d7383 Baoquan He              2023-01-13  3681  			vmap_ram_vread(buf, addr, n, flags);
> > 129dbdf298d7383 Baoquan He              2023-01-13 @3682  		else if (!(vm->flags & VM_IOREMAP))
> >                                                                                    ^^^^^^^^^
> > Unchecked dereference.  Should this be "flags" instead of "vm->flags"?
> 
> Thus, here, in 'else if', vm is not null. And in this 'else if', we are
> intending to check vm->flags. I don't see issue or risk here. Please
> help check if I miss anything.
> 
> Thanks
> Baoquan
> 

