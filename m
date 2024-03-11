Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282EE57300
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Mar 2024 21:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710192493; cv=none; b=bF0Pq78fhKlmN73CBtol+ggmpjBXhD8oBKUJ5HWn9/cPkKihf7/HTMjWfGFMJtL5D6W5VXKPojmcy/DvjV9uPq8h5pgpD5IJdAagfyQTkvNjZwgbcNKw+B2LNfwIaL0gQ/vY+UIRljkJsGO0cylUn5B90fMbGxihWN/Nq2AqDJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710192493; c=relaxed/simple;
	bh=YhTqbQHp4J2rfG2MsgMnQIDo3XPvemTa7YocXD5fcLI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cNaRo+E70xXql7He7xpkb/Astq3DF188XntWoMFKIuLin1DQcKaQ74AyaerKp5Mn+m5bEqv0nfFyhytlUQ5miFVIzU71XXQieVIsqVQxuXZa0HgRX4aqo/kklnURrEIkdOsXkh68BT3zWkavw+FSIKcqS7sLHVyP0LRzYBxugkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yosryahmed.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JfFTX8n/; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yosryahmed.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JfFTX8n/"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-60a3bb05c9bso22473007b3.1
        for <oe-kbuild@lists.linux.dev>; Mon, 11 Mar 2024 14:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710192491; x=1710797291; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DvaKML3eKYTL2VtPZKWQXi4KZpd8PTk6YavEF0j6JPo=;
        b=JfFTX8n/Teot7RTKqCjkehym9nDCcTquqO/8kf+ZoV/a2nuLQ/h8beXQJGu8pPUcuh
         ho66i65c8dl9c3cls3uwYn2zTl4pbSYOgjqYU6uGb267KsE8BCZSiftD0br6+y8Gx9EH
         3ofgssCJe6DESajRK7iB1o9Q1x7y8CPtxv1zIFW77CNOkt58A6LAmFjn/WJklHrUwI61
         M4gJ+xSBmNHyJhZuuBQaZrIe+/4ar+RaJwYPxS+4b9pbTyqP5xYpqGDmOXxiBRlMtV5N
         Q2/kHdsX5okx4kFJWDMxN50t/+0hZ7rHruu+d0K1R5GU6DrhmAW5MJL9ygmM+JWc2Ho9
         bXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710192491; x=1710797291;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DvaKML3eKYTL2VtPZKWQXi4KZpd8PTk6YavEF0j6JPo=;
        b=IVcu9DW7YAWF5ea5yTWNFMJrpAGyqa06prfj5yFX5MHa7pQgaxZYlprq0RhISRfZSa
         VMs82YF/wgMzA7Tr0cfuQRkdeg9qMDXRvQhjzU8HTcGkYNnvat4/1QEGLBV9LzR+hCWS
         IxAmBaER1JIwzjNIQc9M6oruSfVcRIVq0v7jskVAeCJTHX3d0x7YJeIOH1qrOdALB3Uj
         eawThDhZS/I6Z2+KOzDDv4prWMRoPGrkZSJmMV3HDOGyQX4nBCaGqY4tnHKWcXxD/Hyp
         2inkoAbRZYL4MPsMrnTeEweP1ZCyAtrzSrtbDogLkXa9rMko2Zgv1I8sMW3v9N0+zL/U
         4oNA==
X-Gm-Message-State: AOJu0Yx3afiWAci22hhnGDB8OAYq8uPh5u6U0ks2H0vjOH2CVYV7x+Lf
	1lG+TdhJYT+VHk/AckVvTgOPFIOhtlJVbZvSAivZy+JSUr9TwNXHOAxMV1MXbE9uAjOLqKD9Yh1
	wlaf9UgIIyw1cvGga+A==
X-Google-Smtp-Source: AGHT+IG+MYQdwxER9uG4I9tq0d0L0sAlQzwDd3bVXqriVvbzm1SJYFoK/UCp/bqI8Dgo+pwcXu15RWMRES2+yfW8
X-Received: from yosry.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:29b4])
 (user=yosryahmed job=sendgmr) by 2002:a81:844b:0:b0:5e6:1e40:e2e3 with SMTP
 id u72-20020a81844b000000b005e61e40e2e3mr309909ywf.5.1710192491241; Mon, 11
 Mar 2024 14:28:11 -0700 (PDT)
Date: Mon, 11 Mar 2024 21:28:09 +0000
In-Reply-To: <a04f0dc9-9f57-47fe-a417-432d5545140b@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240307133916.3782068-3-yosryahmed@google.com> <a04f0dc9-9f57-47fe-a417-432d5545140b@moroto.mountain>
Message-ID: <Ze93aZrA2t4sfaBD@google.com>
Subject: Re: [RFC PATCH 2/3] x86/mm: make sure LAM is up-to-date during
 context switching
From: Yosry Ahmed <yosryahmed@google.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Mon, Mar 11, 2024 at 09:09:34AM +0300, Dan Carpenter wrote:
> Hi Yosry,
> 
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build warnings:
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/x86-mm-fix-LAM-cr3-mask-inconsistency-during-context-switch/20240307-214052
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20240307133916.3782068-3-yosryahmed%40google.com
> patch subject: [RFC PATCH 2/3] x86/mm: make sure LAM is up-to-date during context switching
> config: x86_64-randconfig-161-20240310 (https://download.01.org/0day-ci/archive/20240310/202403101713.eM4pyFpc-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202403101713.eM4pyFpc-lkp@intel.com/
> 
> smatch warnings:
> arch/x86/mm/tlb.c:655 switch_mm_irqs_off() error: uninitialized symbol 'new_asid'.

Thanks for reporting this. I think it may be a false positive, but this
code chunk will be dropped in the next version anyway.
