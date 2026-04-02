Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62023DEFF5
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Apr 2026 17:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775149544; cv=none; b=dKwkXcaio5tQNZ46Xl4QTEfBqOnjDD0sjha8r/YDW/wdaQ+bIv/i7hV/3A0/Wj8/1XE+2AYT9MUVz55ZpP40/1cnJ3Y5M7OXfZBP5kETf8/GQWPqoTIO8OCu70JqGos0vyt9BSCWttlHxKTfuSO/FCuKfdfAJ3QDoUmqJRqWKkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775149544; c=relaxed/simple;
	bh=Zo8OAngOh0P8c1OR78bqc8BgST7jOqfQbaCLKvgsal8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGy8kNffJl4PfBXRoarvXvrHPwNjpgDp/mlmqNBwiQTpq5vM9RoKIHLgmfTwFIsmB3WFUtAUHC6LvnPSq2L4ObCwX9ZYHpfpKrD/tE0X4UwkU50OTWreAqQsnKW2bIpQKk4g2DG4c8k5w6p5ZeLwlIx6ia7vZAL9MaAFEam9KJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ui8m/ob6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ui8m/ob6"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so11710065e9.1
        for <oe-kbuild@lists.linux.dev>; Thu, 02 Apr 2026 10:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775149534; x=1775754334; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IJ96XmrvwmNmdc1Ry2/PJXAWh8krLD6ljIYp6nVbJmg=;
        b=Ui8m/ob6JHdMEpe2Vz+C1/cgFylHV3gKsP9Cl77+NOk0HUAVenbuMTqvHTDPCNdXaL
         3YxdGEkd94d22JHG01w3IivNHwJFdQOJGkJrBGXA6mIl6Pp98YFVj0SCzqqJCOqAkbnk
         QqKLGTVhDQEXUfkutd5qwV37LcTcQ0RsD/LeQxb3z9IPotiO0FftgmjUMU9BVstGgQr2
         1lUSWkNDQ4IgQbk/N47WTHraMxNKm+8jjWe3sqNowfIuT+1O8bc/T/whuHH2dIHXOy2V
         NTjahu15+hdPbd+sVgje5cye00KZ1L8jXEXV5b7xaIFdXNfrotVdhn5Uf3uFH3QpOJrk
         jukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775149534; x=1775754334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJ96XmrvwmNmdc1Ry2/PJXAWh8krLD6ljIYp6nVbJmg=;
        b=Dh9SPe1rGfgkx5Ah5OwG7ekEX69qnaX3BTJvUTCkii09fOywW6pU3M3MyKWvdQJYi/
         vusHD3Mf8CV3JgOHZtObY4DjyFyf7P9C5irbr8OB64YV86D2zADhdf3YXZ4VZoyiV5YN
         mkMr00lZ8EcsDSkkMug6eRMyYHWRdIdCXw/Vl6le8vVJqh3hBANJI9I/lfwTkZ6OrvEK
         uiVJz2gSOjv+t+Gd+M1rH5Aa0kP0sAK+NVcRXprUEImwyF4tarE8ZLnB50pUeQvbonLc
         wKEYsq/q0JoQq03uLR3KNta2vsOXhhCu004xK5CKTfSenIm7zCBEeKvK7G1qJUK/eujr
         OXvA==
X-Gm-Message-State: AOJu0Yxedrr2dQiQ3RvuXRLY4iOSiJV05TQDyMyRTMPQTi44LpGzDUX5
	3DcVA++VytgsoGjwldMsIZkWnoNGxhwpDZ28af84mjIyws4Me0mPQUdu
X-Gm-Gg: ATEYQzzilu4J77o11hJ4aDOyJf0uctnRhqdwHLYNNSv34QW7EqNErvRfD/1IfEcqAhz
	qFyC1iMVHCDSDswn1qF9pu/6bfD6uNNqifet2isiJ7BoaTb2BIMI82OmCqurzv0WPM8CCm5OJne
	OAbKQh6LjgVm21zlz9cTpHj6nBLTnPF3A5/kFYLlb/kc7cbpV1SHMdRX25TTocjfNXgXmHuTBYc
	nEcaeqMFM6KPOfA3xZ++xYaSuX/EnHkQ5HjBwuziuhzaX5ZjYp9kNMRwA6w3UB8MnBbOQTXKHWj
	+jGl262lx1c4smjHErsT/1qtJOt043P/PdNz0ajD0BbmUds7L/8ucNNcN+tL/OTytB3wm8+eThN
	P8A1aViNYtLulD9gMCPoigRM0iASs0eBRkOD4rXxOr8vsBc3tl8jP/5FrqtPPCvMYj6VtP8UdGe
	VYi5cR3csaKGqYEm2FRU0=
X-Received: by 2002:a05:600c:3b0a:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-4888e09ba82mr46503895e9.10.1775149534150;
        Thu, 02 Apr 2026 10:05:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a63esm265992305e9.3.2026.04.02.10.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 10:05:33 -0700 (PDT)
Date: Thu, 2 Apr 2026 20:05:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: Marco Elver <elver@google.com>
Cc: oe-kbuild@lists.linux.dev, Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux-foundation.org>,
	Harry Yoo <harry.yoo@oracle.com>, Hao Li <hao.li@linux.dev>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: Re: [PATCH v1] slab: support for compiler-assisted type-based slab
 cache partitioning
Message-ID: <ac6h2jF-KJ5pm1WM@stanley.mountain>
References: <20260331111240.153913-1-elver@google.com>
 <202604020400.jEq32K95-lkp@intel.com>
 <CANpmjNOsM1e8jMvRKtEizMmZgPCCZ9YqpuZKad61Zg7PAGW7RA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNOsM1e8jMvRKtEizMmZgPCCZ9YqpuZKad61Zg7PAGW7RA@mail.gmail.com>

On Thu, Apr 02, 2026 at 03:48:20PM +0200, Marco Elver wrote:
> On Thu, 2 Apr 2026 at 15:33, Dan Carpenter <error27@gmail.com> wrote:
> >
> > Hi Marco,
> >
> > kernel test robot noticed the following build warnings:
> >
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Elver/slab-support-for-compiler-assisted-type-based-slab-cache-partitioning/20260401-035608
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> > patch link:    https://lore.kernel.org/r/20260331111240.153913-1-elver%40google.com
> > patch subject: [PATCH v1] slab: support for compiler-assisted type-based slab cache partitioning
> > config: um-randconfig-r072-20260401
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > smatch: v0.5.0-9004-gb810ac53
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Closes: https://lore.kernel.org/r/202604020400.jEq32K95-lkp@intel.com/
> >
> > New smatch warnings:
> > drivers/misc/lkdtm/heap.c:118 lkdtm_READ_AFTER_FREE() warn: potential pointer math issue ('base' is a 32 bit pointer)
> > drivers/misc/lkdtm/heap.c:169 lkdtm_KFENCE_READ_AFTER_FREE() warn: potential pointer math issue ('base' is a 32 bit pointer)
> 
> How is this related to the patch I sent? Did the <linux/slab.h> change
> force rechecking of all these files and it found latent issues?
> 

Oh, crud.  It turns out that for this check Smatch allows
integer_array[sizeof()]so long as we know that the index is within
bounds.  What happened is that your patch renamed the kmalloc()
function so Smatch stopped knowing the size of the buffer.

For these zero day bot warnings, the emails are automatically generated
so I don't have any context outside what's in the email.  I saw that
Kees wrote the code, but I figured maybe you forwarded it or something.
Sorry about that.

regards,
dan carpenter

