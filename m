Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6410B30ACE6
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Apr 2026 13:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775137740; cv=pass; b=X0SG0D22ZiAFH7Ek++9CVpBn8/lvA89Ro76COHD5lJ14fFTHymUCbV5TGa7+qzHy4RCG5omzGa1CM+QSng/JqLE8Hv7cA33hBWIm71jEhW2XbIIXIJ0bMS5k3bkF1iHqgI1WZR3lM5RyUK4KN41XZwHmJjBJVACgjz3KuFfsM0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775137740; c=relaxed/simple;
	bh=l9tNbApyNKlKEGwYqWI2PPtB9POx0b+CnQVgR7HkWdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WZZfwxlByb3dVPh2Xz3X4jkxwjwuAuAe/inXWMgFsPG0k7HamkfHbnZHYlx062pm98SDHTOeWt4SjFbbZSOK1qWJ+vrNlKo5D/FFv8DuI/3ku4o1zjaShEZM1zHXfKL+8ynMDXoDe82fWJ+nEfBR+MLPi2Ti8BsAfkI56gU+W6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WwbYG5B/; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WwbYG5B/"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-127380532eeso2564591c88.1
        for <oe-kbuild@lists.linux.dev>; Thu, 02 Apr 2026 06:48:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775137737; cv=none;
        d=google.com; s=arc-20240605;
        b=T44u1Cn4plPyCn1wqZ7451PY2oFRMcSGzWKzMY435ZLhOtjN2bleo8mVE79d0DtNr9
         pJkGHxWSXpU1OyZ6fhGWpJt1ngZJ4TPKirSBZNG0mC9fFEeyw/pVb8Lt3p9FRK0DOUqK
         bWtro+FDd125IGAk+rQCPLsoO/09NxCFWJ/pLi3ESaYtPW8ZAxO8Fw9yJoqtGziO98B1
         bYDSSVrhtJIv4g9VDXbA6VrwbSm64NC2Z6g+Suyq3ljxtBsSg+EGK/8YUXOPRf/pUTdZ
         rY215S9XO4rF9n2W185K2U9n/LtfW7ThfQnj4GuN0r6BSthjXJuzTXpC6rhlznSU3fL1
         tJzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4odl4u5FIkYFl0AjuN4ex6RSgkq9844Lzudav/PrauU=;
        fh=BHMEyDuQ1WwwW5u03NtEKtuuJYw069+ZPGYcvpMH5NA=;
        b=OJnCgXCWcDtp4DcEW7Tb0GJnHnY+yDdJ619ih1X/prk5MoWxokxzL9SgQnUZGCwONJ
         ljdNwMfJj7ZVJpAqpXrITV3HLpIUXb0UFPD8T0Rr5rORBI7Z7PViC36SjwKxAxCuaaz2
         MCLFy6Z4aBDeGjY+J64pA/DkG/IKAAJ/Z0WZuKZZ16MXEjDuVciBuZU9/zW2qg/6Z+Oq
         G+cF+QbAimUCqAjSWnCi76ok+0eLxqUC/g3n0gMnMZvqskG1gapCW6L2T5QtTzrQX8LG
         BZcWWpnzXY7lpJoeQFSp071p9EyTEeNdflhhewz2Die/Si49z5ONuIG0OWNk8rmg59Zv
         hrqQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775137737; x=1775742537; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4odl4u5FIkYFl0AjuN4ex6RSgkq9844Lzudav/PrauU=;
        b=WwbYG5B/AmXNTsEgZKB+T6IokNLrLqSRKgQcX+9li3DOLKJrMVUJkRzcRs+9FnQYmI
         e32taf6Xlv2XHzbLwvGQEDLhGrKyiG1IFWVEvAvPnrLqdxQN8Pb6UyyMRTkrV5lPsMaT
         nVAibvy6s8G1auwEMMyKp64Ya1I0orsXHMNOeQZM8Ndy68HB90YorneZiDLKFQWK/KxI
         uyAy9GtbKgRyiAd/8fPcRMed1hSSp/5rFl8VtKSkOP1XYflhD/N1sPVm7gbJrrW769R0
         FDjgOe1b4F9NMlTde8xLhiphLl/drTCRFO2rT8adziwAuJpA5YyxrIIc6CK3h5QSQqMn
         H4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775137737; x=1775742537;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4odl4u5FIkYFl0AjuN4ex6RSgkq9844Lzudav/PrauU=;
        b=R2HQnlpqt28y1ZEI5VdxcGG79rUqlERBW/nCUAyRenj+qbBps1kg3Ti55ZTXwtyo3I
         7pqKRLEA8/qRNEN8mToyxSDO584x3PRpSX/y7P+GXKyM0wStr8+Xq6FHePytFiSNbZN1
         RI0c+Ztj0+kVEGkuQA9RB5y33sBNdgm1MUOZ0mmkwjdpWtZvAUUtvZbGtBAqauJeqDYq
         vOTwPlIG8pH59XRCMmzdPLXkMGl+OgkhNkZHqBfYbawVM6ZI4xP6Iw2LlbWJcxApYZcl
         b7CiNahHpmNJmmioyy8qq7JgMdJEWlFCXtkxpEY7kQ+r3Rll7ADVXIsXq+759AVNB7E3
         SF5Q==
X-Gm-Message-State: AOJu0Yzyrk6bccE2YjLObkNkR2gUvqt6IQfq1LpY8K/3x7h+9BLneFcI
	MmO1IPzeDmeZcRL8A37Qi1DLPfl3EWf8NQRNB9Ne43Yo4T05WTRjtz/56z9UPNosB2K2JXzjGen
	a11iSjplLjPnYAoAswWrTtzmr7E2sLwJnYRQ1SpIi
X-Gm-Gg: ATEYQzw19+zEMonQ5hZ8r9nB7PHFDcY8XVD+gr4MN1t4nOojhQR7zTmIgc3v4ovERxg
	OCHSGE2YvAD8AxtR++rM7fCVZF/S5DmJMeLbK1wengZUgrQx3ymf8mzVqixzdmSsv6qE9vKKIcP
	MATShNiK8UVVvBtA+/cu9HnX+VCVCxw+ZFeYK5TWemXiTxm/p9TW0vn0b7GKKgdCvpshTMnDI5C
	QbUZEhlGFR6NjvlOiI8ai2ZB5jyw0PIlWFWwaofvyz3vv9BOAkvnqmijzGDZo1otJkuVkGCwxls
	2Wm1kYrqstZTpe0xZDU5A8mZ5bBy+rkcsG0kZCg=
X-Received: by 2002:a05:7022:4582:b0:11d:c86c:652e with SMTP id
 a92af1059eb24-12be64206a6mr4246421c88.5.1775137736932; Thu, 02 Apr 2026
 06:48:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331111240.153913-1-elver@google.com> <202604020400.jEq32K95-lkp@intel.com>
In-Reply-To: <202604020400.jEq32K95-lkp@intel.com>
From: Marco Elver <elver@google.com>
Date: Thu, 2 Apr 2026 15:48:20 +0200
X-Gm-Features: AQROBzBTzNfYUXOsbmlfPQCs1PnLUVzNWPXPqQybMa2GKboY40C31FthWXXrJZ4
Message-ID: <CANpmjNOsM1e8jMvRKtEizMmZgPCCZ9YqpuZKad61Zg7PAGW7RA@mail.gmail.com>
Subject: Re: [PATCH v1] slab: support for compiler-assisted type-based slab
 cache partitioning
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux-foundation.org>, Harry Yoo <harry.yoo@oracle.com>, 
	Hao Li <hao.li@linux.dev>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Apr 2026 at 15:33, Dan Carpenter <error27@gmail.com> wrote:
>
> Hi Marco,
>
> kernel test robot noticed the following build warnings:
>
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Elver/slab-support-for-compiler-assisted-type-based-slab-cache-partitioning/20260401-035608
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20260331111240.153913-1-elver%40google.com
> patch subject: [PATCH v1] slab: support for compiler-assisted type-based slab cache partitioning
> config: um-randconfig-r072-20260401
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> smatch: v0.5.0-9004-gb810ac53
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202604020400.jEq32K95-lkp@intel.com/
>
> New smatch warnings:
> drivers/misc/lkdtm/heap.c:118 lkdtm_READ_AFTER_FREE() warn: potential pointer math issue ('base' is a 32 bit pointer)
> drivers/misc/lkdtm/heap.c:169 lkdtm_KFENCE_READ_AFTER_FREE() warn: potential pointer math issue ('base' is a 32 bit pointer)

How is this related to the patch I sent? Did the <linux/slab.h> change
force rechecking of all these files and it found latent issues?

> vim +118 drivers/misc/lkdtm/heap.c
>
> 73f62e60d80c2d drivers/misc/lkdtm/heap.c Kees Cook    2022-03-03   92  static void lkdtm_READ_AFTER_FREE(void)
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26   93  {
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26   94   int *base, *val, saw;
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26   95   size_t len = 1024;
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26   96   /*
> e12145cf1c3a80 drivers/misc/lkdtm/heap.c Kees Cook    2020-06-25   97    * The slub allocator will use the either the first word or
> e12145cf1c3a80 drivers/misc/lkdtm/heap.c Kees Cook    2020-06-25   98    * the middle of the allocation to store the free pointer,
> e12145cf1c3a80 drivers/misc/lkdtm/heap.c Kees Cook    2020-06-25   99    * depending on configurations. Store in the second word to
> e12145cf1c3a80 drivers/misc/lkdtm/heap.c Kees Cook    2020-06-25  100    * avoid running into the freelist.
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  101    */
> e12145cf1c3a80 drivers/misc/lkdtm/heap.c Kees Cook    2020-06-25  102   size_t offset = sizeof(*base);
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  103
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  104   base = kmalloc(len, GFP_KERNEL);
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  105   if (!base) {
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  106           pr_info("Unable to allocate base memory.\n");
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  107           return;
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  108   }
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  109
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  110   val = kmalloc(len, GFP_KERNEL);
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  111   if (!val) {
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  112           pr_info("Unable to allocate val memory.\n");
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  113           kfree(base);
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  114           return;
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  115   }
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  116
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  117   *val = 0x12345678;
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26 @118   base[offset] = *val;
>
> This doesn't really matter, but the comment says we are writing to the
> second word.  The base[] array holds 256 integers, so:
>
>         base[sizeof(int)] = *val;
>
> would be the third word, right?  A word is unsigned long, right?  All
> of a sudden I am unsure.  :P

???

So this is clearly a minor defect in this existing code (comment wrong
or code might want to match what the comment said), but "slab: support
for compiler-assisted type-based slab cache partitioning" didn't touch
that.

> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  119   pr_info("Value in memory before free: %x\n", base[offset]);
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  120
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  121   kfree(base);
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  122
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  123   pr_info("Attempting bad read from freed memory\n");
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  124   saw = base[offset];
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  125   if (saw != *val) {
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  126           /* Good! Poisoning happened, so declare a win. */
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  127           pr_info("Memory correctly poisoned (%x)\n", saw);
> 5b777131bd8005 drivers/misc/lkdtm/heap.c Kees Cook    2021-06-23  128   } else {
> 5b777131bd8005 drivers/misc/lkdtm/heap.c Kees Cook    2021-06-23  129           pr_err("FAIL: Memory was not poisoned!\n");
> 5b777131bd8005 drivers/misc/lkdtm/heap.c Kees Cook    2021-06-23  130           pr_expected_config_param(CONFIG_INIT_ON_FREE_DEFAULT_ON, "init_on_free");
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  131   }
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  132
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  133   kfree(val);
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  134  }
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  135
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  136  static void lkdtm_KFENCE_READ_AFTER_FREE(void)
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  137  {
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  138   int *base, val, saw;
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  139   unsigned long timeout, resched_after;
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  140   size_t len = 1024;
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  141   /*
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  142    * The slub allocator will use the either the first word or
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  143    * the middle of the allocation to store the free pointer,
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  144    * depending on configurations. Store in the second word to
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  145    * avoid running into the freelist.
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  146    */
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  147   size_t offset = sizeof(*base);
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  148
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  149   /*
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  150    * 100x the sample interval should be more than enough to ensure we get
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  151    * a KFENCE allocation eventually.
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  152    */
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  153   timeout = jiffies + msecs_to_jiffies(100 * kfence_sample_interval);
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  154   /*
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  155    * Especially for non-preemption kernels, ensure the allocation-gate
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  156    * timer can catch up: after @resched_after, every failed allocation
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  157    * attempt yields, to ensure the allocation-gate timer is scheduled.
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  158    */
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  159   resched_after = jiffies + msecs_to_jiffies(kfence_sample_interval);
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  160   do {
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  161           base = kmalloc(len, GFP_KERNEL);
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  162           if (!base) {
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  163                   pr_err("FAIL: Unable to allocate kfence memory!\n");
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  164                   return;
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  165           }
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  166
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  167           if (is_kfence_address(base)) {
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  168                   val = 0x12345678;
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29 @169                   base[offset] = val;
>                                                                                         ^^^^^^^^^^^^^^^^^^
> Same here.

Unrelated to "slab: support for compiler-assisted type-based slab
cache partitioning".
