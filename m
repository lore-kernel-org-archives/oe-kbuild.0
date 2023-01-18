Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792E47B
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jan 2023 02:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674008247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PP8025B7vYjGqOUOci8HcWNNJvoXEzim4g39pJBVbi4=;
	b=LC+sUflLUodZAKjSrR81l6wB3705QXIaYBL6K0wW1p96BWDyYcDoh8+K/3tgmwZl2bq3Xm
	6+N91tQ/9tOzYis1B8TMELHjizYyBEkASs+dXHnV0TF8Hk31VB+RSonyDl7kKbcIpKEJRs
	BzxHpHCMxt0KOdYRKU6zu4dgHKP1bb0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-g9rajeCaO32cmZEiYBLGwQ-1; Tue, 17 Jan 2023 21:17:23 -0500
X-MC-Unique: g9rajeCaO32cmZEiYBLGwQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 403931871D97;
	Wed, 18 Jan 2023 02:17:23 +0000 (UTC)
Received: from localhost (ovpn-13-29.pek2.redhat.com [10.72.13.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F504C159BB;
	Wed, 18 Jan 2023 02:17:22 +0000 (UTC)
Date: Wed, 18 Jan 2023 10:17:19 +0800
From: Baoquan He <bhe@redhat.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, linux-mm@kvack.org, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	urezki@gmail.com, lstoakes@gmail.com, stephen.s.brennan@oracle.com,
	willy@infradead.org, akpm@linux-foundation.org, hch@infradead.org
Subject: Re: [PATCH v3 3/7] mm/vmalloc.c: allow vread() to read out
 vm_map_ram areas
Message-ID: <Y8dWrydYsYAbnMwT@fedora>
References: <20230113031921.64716-4-bhe@redhat.com>
 <202301132345.KVjvHMFq-lkp@intel.com>
 <Y8QI977QBDbuuGW5@fedora>
 <Y8VMUUOlkwuu5xn6@kadam>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8VMUUOlkwuu5xn6@kadam>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8

On 01/16/23 at 04:08pm, Dan Carpenter wrote:
> On Sun, Jan 15, 2023 at 10:08:55PM +0800, Baoquan He wrote:
> > > f181234a5a21fd0 Chen Wandun             2021-09-02  3650  	if ((unsigned long)addr + count <= va->va_start)
> > > f181234a5a21fd0 Chen Wandun             2021-09-02  3651  		goto finished;
> > > f181234a5a21fd0 Chen Wandun             2021-09-02  3652  
> > > f608788cd2d6cae Serapheim Dimitropoulos 2021-04-29  3653  	list_for_each_entry_from(va, &vmap_area_list, list) {
> > > e81ce85f960c2e2 Joonsoo Kim             2013-04-29  3654  		if (!count)
> > > e81ce85f960c2e2 Joonsoo Kim             2013-04-29  3655  			break;
> > > e81ce85f960c2e2 Joonsoo Kim             2013-04-29  3656  
> > > 129dbdf298d7383 Baoquan He              2023-01-13  3657  		vm = va->vm;
> > > 129dbdf298d7383 Baoquan He              2023-01-13  3658  		flags = va->flags & VMAP_FLAGS_MASK;
> > > 129dbdf298d7383 Baoquan He              2023-01-13  3659  
> > > 129dbdf298d7383 Baoquan He              2023-01-13  3660  		if (!vm && !flags)
> > >                                                                             ^^^
> > > vm can be NULL if a flag in VMAP_FLAGS_MASK is set.
> > > 
> > > e81ce85f960c2e2 Joonsoo Kim             2013-04-29  3661  			continue;
> > 
> > Right, after the 'continue;' line, only two cases could happen when it
> > comes here. (vm != null) or (vm->flags & VMAP_RAM) is true.
> >
> 
> You're saying VMAP_RAM, but strictly speaking the code is checking
> VMAP_FLAGS_MASK and not VMAP_RAM.
> 
> +#define VMAP_RAM               0x1 /* indicates vm_map_ram area*/
> +#define VMAP_BLOCK             0x2 /* mark out the vmap_block sub-type*/
> +#define VMAP_FLAGS_MASK                0x3
> 
> If we assume that vm is NULL, VMAP_BLOCK is set and VMAP_RAM is clear
> then it would lead to a NULL dereference.  There might be reasons why
> that combination is impossible outside the function but we can't tell
> from the information we have here.

VMAP_BLOCK has no chance to be set alone. It has to be set together with
VMAP_RAM if needed.

> 
> Which is fine, outside information is a common reason for false
> positives with this check.  But I was just concerned about the mix of
> VMAP_FLAGS_MASK and VMAP_RAM.

Thanks, I see your point now, will consider how to improve it.

