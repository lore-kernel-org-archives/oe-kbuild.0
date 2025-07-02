Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602321E0DD8
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Jul 2025 16:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751472720; cv=none; b=s8q/pwIXuc4gxpS7wfSsP1JVIVbQYju+gFkdXWv0PTQbf/h5L9TNh2uwxIxy8Bm+sjyN0JS4xDWk/rYMixEPFveKn+6eq/RJXLx2f/vSmPI6BI9OkfY3+cqhtyzyUnlpoMytOBFCico+LmolkmRa6D3AzmWSB/sGLUeVybZyJ9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751472720; c=relaxed/simple;
	bh=ku/1O1AIFsAJJ6qmmvnq+B5DRjf3j0x7VN0LkoGzkUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvkReZj9f64354BRmLeddQi9iPhL7zio+hYgthu6nWiRNcdWtehgnVcPEXJnXv8B/x0nMrux90G8ucYbWyJZPufbGKexITKBzNGV0boEYnx1gIuozd8wXpeqfVvYn5uiq+zKWKsVCW339/BAoKMWnKCDU83/2/jkyZfbzt6ZiHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E2/ElB2I; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E2/ElB2I"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2efbbf5a754so3160283fac.0
        for <oe-kbuild@lists.linux.dev>; Wed, 02 Jul 2025 09:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751472717; x=1752077517; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xLl0djX76uDh2KqOF+EzMvL6PoM9gvUJ0/VwerVvcuU=;
        b=E2/ElB2Iro3FPU7pvd01z+NBzqF8+JThtj8pQnvw9R68wGl0WJAgdYp5OKyd5S2LaW
         RZvHi2pSYeJTnGDIfXdkPiFVCwXwY8mZ/QHsXRE8fWixON8lVo4VRRZESHqdCrhzKVHJ
         tFILpJiODGOG0YgTK0UtBKvXBbT9e46X2WBh5Kv37Asvbgoh2jt8/7azXBRuHUJeyACz
         tAnJCznO68DrIJDVrb8r5k49I0vw0IJFgjDo989YkMYyFxFPyxmH7apJ3ol1sx8XjLA9
         +W4cYfenqC8pRTcz9NnkRmdOo6f3s+qZSJ/tr8O+zAsTb7OKRtV8/OtqirbOMIYDFSvA
         +LoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751472717; x=1752077517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLl0djX76uDh2KqOF+EzMvL6PoM9gvUJ0/VwerVvcuU=;
        b=Mrhd7MbpWAxL5r5HerOghv0U71n9llPvZPGc5i5amYxThXR34GbNikHWnv+SE3W9b4
         OFYkIZyCDz6v/GQwSRsNaoxeaeqVQ/wAzXcy1Xcj3v6RxqIrlyeq5g0o7KzVNChD9I+8
         LSKBtO83vQ1aEfoNbnIblt4oxszzx1gFocwmfeP0jDnfwrcXtvCsSh0Z86RBXvRRpVOR
         0gwgNKYMBxzPYyTb6b1geAELWPPmVHkhaXvrnj3KKiJY3yUCbIesfhjR9zYsZuwzyFPy
         3b5vaSwSFH6bJeVmU+h4HctNXvw5JinEq4T6K+MKh3wYgRL0g34Q3+WaC4aj14F+1jBU
         1E4g==
X-Forwarded-Encrypted: i=1; AJvYcCWHzp9QeclExFrrzJ1LjVYT93x2UxEkPB9K8ALTKz6hPx4o8j3MTv0DwOZU9FXvBEJifOJliHuTOac=@lists.linux.dev
X-Gm-Message-State: AOJu0YyAqWLD1eBk1bkmfF/X+swk49bf80tpGydZdYuk9lilQu4qRWwe
	zPw6t5FvDotMowjUU5UogqsRcER5T+1tsE7HG1I6XRkMV1xmj2HVbG9b2lP8gdbbx28=
X-Gm-Gg: ASbGncvxqyzs5G9TeNWam/WhubpV1KkS6krmwOteVGJdFd/406naWjCGQdhznpR16QX
	3VDWmqodm/VSwDX1EagWHMxHNAG2Y7zLTfMyUG2gViFUFzXcQTkvj6aMVG3SjzwkwDD5KDcxPOy
	xpV2+3sZYgbyqKnSG8Xg2lb3jkJCV++UnIuLCLFhhFtbQlG8TYhP8H7fo3V6jq/Bz2ViNYKev+f
	Nzc3/zd0dcez0QEI5bRHZNaRUiQGmnRo0ecGNZOuN4bcKdVTFS+PkQ8QCGz6Aae/6vlejBSlSEs
	LMiuBRe4sJkoKeJ+c/jEBtJ8QNcQe0MhUvinAD9gAzPsaRfVFSimwHAXWC13vzG7MP3L8A==
X-Google-Smtp-Source: AGHT+IEUcyyYplg3dAlsN64/ClYT7sGu4SJixmVO5+dP9Ynt+31d1VKg5vFlMLwsobsP4aHj0c1LwQ==
X-Received: by 2002:a05:6870:e8c9:b0:2ea:8f12:5762 with SMTP id 586e51a60fabf-2f5a8d27ce5mr2546491fac.7.1751472717371;
        Wed, 02 Jul 2025 09:11:57 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:7056:ddb5:3445:864f])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd4ef7024sm3926135fac.13.2025.07.02.09.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 09:11:56 -0700 (PDT)
Date: Wed, 2 Jul 2025 19:11:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: lizhe.67@bytedance.com
Cc: alex.williamson@redhat.com, david@redhat.com, jgg@ziepe.ca,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, oe-kbuild@lists.linux.dev,
	peterx@redhat.com
Subject: Re: [PATCH 3/4] vfio/type1: introduce a new member has_rsvd for
 struct vfio_dma
Message-ID: <24446bf8-3255-4622-a53c-33690c07fb17@suswa.mountain>
References: <c209cfd6-05b1-4491-91ce-c672414d718c@suswa.mountain>
 <20250702034720.53574-1-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702034720.53574-1-lizhe.67@bytedance.com>

On Wed, Jul 02, 2025 at 11:47:20AM +0800, lizhe.67@bytedance.com wrote:
> On Tue, 1 Jul 2025 18:13:48 +0300, dan.carpenter@linaro.org wrote:
> 
> > New smatch warnings:
> > drivers/vfio/vfio_iommu_type1.c:788 vfio_pin_pages_remote() error: uninitialized symbol 'rsvd'.
> > 
> > Old smatch warnings:
> > drivers/vfio/vfio_iommu_type1.c:2376 vfio_iommu_type1_attach_group() warn: '&group->next' not removed from list
> > 
> > vim +/rsvd +788 drivers/vfio/vfio_iommu_type1.c
> > 
> > 8f0d5bb95f763c Kirti Wankhede  2016-11-17  684  static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
> > 0635559233434a Alex Williamson 2025-02-18  685  				  unsigned long npage, unsigned long *pfn_base,
> > 4b6c33b3229678 Daniel Jordan   2021-02-19  686  				  unsigned long limit, struct vfio_batch *batch)
> > 73fa0d10d077d9 Alex Williamson 2012-07-31  687  {
> > 4d83de6da265cd Daniel Jordan   2021-02-19  688  	unsigned long pfn;
> > 4d83de6da265cd Daniel Jordan   2021-02-19  689  	struct mm_struct *mm = current->mm;
> > 6c38c055cc4c0a Alex Williamson 2016-12-30  690  	long ret, pinned = 0, lock_acct = 0;
> > 89c29def6b0101 Alex Williamson 2018-06-02  691  	bool rsvd;
> > a54eb55045ae9b Kirti Wankhede  2016-11-17  692  	dma_addr_t iova = vaddr - dma->vaddr + dma->iova;
> > 166fd7d94afdac Alex Williamson 2013-06-21  693  
> > 6c38c055cc4c0a Alex Williamson 2016-12-30  694  	/* This code path is only user initiated */
> > 4d83de6da265cd Daniel Jordan   2021-02-19  695  	if (!mm)
> > 166fd7d94afdac Alex Williamson 2013-06-21  696  		return -ENODEV;
> > 73fa0d10d077d9 Alex Williamson 2012-07-31  697  
> > 4d83de6da265cd Daniel Jordan   2021-02-19  698  	if (batch->size) {
> > 4d83de6da265cd Daniel Jordan   2021-02-19  699  		/* Leftover pages in batch from an earlier call. */
> > 4d83de6da265cd Daniel Jordan   2021-02-19  700  		*pfn_base = page_to_pfn(batch->pages[batch->offset]);
> > 4d83de6da265cd Daniel Jordan   2021-02-19  701  		pfn = *pfn_base;
> > 89c29def6b0101 Alex Williamson 2018-06-02  702  		rsvd = is_invalid_reserved_pfn(*pfn_base);
> 
> When batch->size is not zero, we initialize rsvd here.
> 
> > 4d83de6da265cd Daniel Jordan   2021-02-19  703  	} else {
> > 4d83de6da265cd Daniel Jordan   2021-02-19  704  		*pfn_base = 0;
> 
> When the value of batch->size is zero, we set the value of *pfn_base
> to zero and do not initialize rsvd for the time being.
> 
> > 5c6c2b21ecc9ad Alex Williamson 2013-06-21  705  	}
> > 5c6c2b21ecc9ad Alex Williamson 2013-06-21  706  
> > eb996eec783c1e Alex Williamson 2025-02-18  707  	if (unlikely(disable_hugepages))
> > eb996eec783c1e Alex Williamson 2025-02-18  708  		npage = 1;
> > eb996eec783c1e Alex Williamson 2025-02-18  709  
> > 4d83de6da265cd Daniel Jordan   2021-02-19  710  	while (npage) {
> > 4d83de6da265cd Daniel Jordan   2021-02-19  711  		if (!batch->size) {
> > 4d83de6da265cd Daniel Jordan   2021-02-19  712  			/* Empty batch, so refill it. */
> > eb996eec783c1e Alex Williamson 2025-02-18  713  			ret = vaddr_get_pfns(mm, vaddr, npage, dma->prot,
> > eb996eec783c1e Alex Williamson 2025-02-18  714  					     &pfn, batch);
> > be16c1fd99f41a Daniel Jordan   2021-02-19  715  			if (ret < 0)
> > 4d83de6da265cd Daniel Jordan   2021-02-19  716  				goto unpin_out;
> > 166fd7d94afdac Alex Williamson 2013-06-21  717  
> > 4d83de6da265cd Daniel Jordan   2021-02-19  718  			if (!*pfn_base) {
> > 4d83de6da265cd Daniel Jordan   2021-02-19  719  				*pfn_base = pfn;
> > 4d83de6da265cd Daniel Jordan   2021-02-19  720  				rsvd = is_invalid_reserved_pfn(*pfn_base);
> 
> Therefore, for the first loop, when batch->size is zero, *pfn_base must
> be zero, which will then lead to the initialization of rsvd.
> 

Yeah.  :/

I don't know why this warning was printed honestly.  Smatch is supposed
to figure that kind of thing out correctly.  It isn't printed on my
system.  I've tried deleting the cross function DB (which shouldn't
matter) and I'm using the published version of Smatch but I can't get it
to print.  Ah well.  My bad.  Thanks for taking a look.

regards,
dan carpenter

