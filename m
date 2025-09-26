Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECCB242D9A
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Sep 2025 16:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758904873; cv=none; b=a7QXUXJbvEMX+ceKDfZZKTyM18ztRajTUT4M4OI4O+ilaPWTR6LuPWU3SPLyrev79okXRIyV612Acjb1JUA6i7xYx6pwqtG5zEp5mOHZfwvGrZWzztsnWHicBdachhHtmOfexVZYgTuTPL7rv9gpKcoJMlkx8vCFml0SoMUDNtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758904873; c=relaxed/simple;
	bh=aVQU6Uf390VwLwgOyoJaPwfqW7aHy5b1UHicJhjquUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hUg4/El7RvjKFRd2xsW6ELft2KyhSSUX9K5waEISKrAo/9wi3zJXGV1WR94SNjQQo7NymAfEl2FsOmi7o+afzcoa8B/mWBrHs9GxjwwtyUuYUGCY8EhLnHeHrlfG2vGfUtggKjPWtlyAbGJHNMY7V0EZpY6/HjSlwMJ2uSDYLqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fe7wcSLw; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fe7wcSLw"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b2e173b8364so395471766b.1
        for <oe-kbuild@lists.linux.dev>; Fri, 26 Sep 2025 09:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758904870; x=1759509670; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhK/I355tEzWCZLpIKaGMRHfbyhnGIybWqmQS9Bgtnk=;
        b=Fe7wcSLwSRBdQzifF/+lfU6xWvab+phYXZg51STbwXp8jmlhmkGOebSIvbJ8I9TxLw
         GLshtTXM6mgoIYG08WNT2UbNWaaXPn1PzeUTgwAIF5kfhMh4E8geGK64I7NQ9XBpdwGM
         sahgGQr7E06WKZLXo4fwWVn0rmHmnPLydYRFANgtzf/scwdJufWTGdRrT7R2pNzsbE3C
         KtMz/c0C1r+wdcmONEqh66VvdEsvQK5E1JAsMWh+0DlWYwBfID7q7NDXcpCC2ID5/xdj
         3xjl07h3tJH1YuMkA5gZDMGRMqi8El6kx92HDEmqHjmAhCjlRAFIvC54SO921CP000lg
         UjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758904870; x=1759509670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhK/I355tEzWCZLpIKaGMRHfbyhnGIybWqmQS9Bgtnk=;
        b=RF9StTYna4W7n17wKPaXTwPxOd38TYZRJxX+x4nwxh8ujryfYrxURja3b6zg5g9cPE
         gybcNpR3LuZKgO00Ejvab18/HaV6PA+FPr8j6zihIlvbmbeqEU3E7/fxymqFBmJ+I+lb
         3z7sTAkbvdF7lTfGpSp81LXncRpTUSzNBacJA9tmSndfrZ5NWQaTs2RvvYHNeSXyEtZf
         a85Vz4Rs/UUwZu6H/Njqcw+HmP2IdRRhH+AZlbwVAf7qU8rgM1uBMGQiqJIlKZBl6cBU
         514NdCoe/WzvnQR1Ysno4HEb+oh8pF4Qf7hPj0bvT/SCg2d0x2E44Eq4Z2uRbTAAwGXO
         lxJw==
X-Gm-Message-State: AOJu0YyB5Q3288fL/Tt3471KahpTHx3WYw05jfpeHVinbKdSgwxE0ktt
	B88vtj5nk4yET8Dg8+ivoW42VALEesFCaO3HgTR3isTLfpgj2AmumxO2BtrBegOXkrQcEhBo0oF
	To99j7avV+kS+CYPXsEXHB9olOFbtxoc=
X-Gm-Gg: ASbGncsYlaKMsLIkipwiT9/G8RL7AXv/sWRAf2/fXceaZQb70StK1o2XfA76RpY4pK3
	mqpBxDqy+drlm01/YbD2Ovi1TURtKdErU4wkfT+j10XUOJUybkeN4Ccg0d00Jk+9RlCDG364xyq
	Ixk7Bg4WXEFBLVuWCUwse+GfSC+XEA2EfKw9ym43w/2saosQyKN07VwqmAlv62WQCEpBjy95Pl7
	E+eed81wMX9qhtKqqdycZOjXa+C1wVVVTTFrJ//5oKoQDYge4Ovrzw=
X-Google-Smtp-Source: AGHT+IGiAgB3Cp3l/+LWlbB0J5SQqcA//CNAV4YTQyXTFqA9cx49Yh6QtYgAgO3MbSqw95Dgnu0URBo7YFe9FVeY/8Q=
X-Received: by 2002:a17:907:86a9:b0:b3a:1300:e8e4 with SMTP id
 a640c23a62f3a-b3a13102ed4mr8997966b.12.1758904870081; Fri, 26 Sep 2025
 09:41:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250924204409.1706524-2-joshua.hahnjy@gmail.com> <202509260132.awvdNKqF-lkp@intel.com>
In-Reply-To: <202509260132.awvdNKqF-lkp@intel.com>
From: Joshua Hahn <joshua.hahnjy@gmail.com>
Date: Fri, 26 Sep 2025 12:40:58 -0400
X-Gm-Features: AS18NWAvPCxQoYx4Q1NMydC8ffwXDXCS1U2zPQc-T1l-6SyQtlRE3k2R9alT660
Message-ID: <CAN+CAwNBg+3RwAsBxOEMk6aK+tb2O45wfnJxBdxRPSBi+vHEUg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] mm/page_alloc/vmstat: Simplify refresh_cpu_vm_stats
 change detection
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Chris Mason <chris.mason@fusionio.com>, 
	Kiryl Shutsemau <kirill@shutemov.name>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Brendan Jackman <jackmanb@google.com>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Zi Yan <ziy@nvidia.com>, linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Fri, Sep 26, 2025 at 11:34=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> Hi Joshua,
>
> kernel test robot noticed the following build warnings:
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Joshua-Hahn/mm-pag=
e_alloc-vmstat-Simplify-refresh_cpu_vm_stats-change-detection/20250925-0445=
32
> base:   097a6c336d0080725c626fda118ecfec448acd0f
> patch link:    https://lore.kernel.org/r/20250924204409.1706524-2-joshua.=
hahnjy%40gmail.com
> patch subject: [PATCH v2 1/4] mm/page_alloc/vmstat: Simplify refresh_cpu_=
vm_stats change detection
> config: mips-randconfig-r073-20250925 (https://download.01.org/0day-ci/ar=
chive/20250926/202509260132.awvdNKqF-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project c=
afc064fc7a96b3979a023ddae1da2b499d6c954)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202509260132.awvdNKqF-lkp@intel.com/
>
> smatch warnings:
> mm/page_alloc.c:2591 decay_pcp_high() error: uninitialized symbol 'todo'.
>
> vim +/todo +2591 mm/page_alloc.c
>
> 06fb80866d37b0 Joshua Hahn    2025-09-24  2564  bool decay_pcp_high(struc=
t zone *zone, struct per_cpu_pages *pcp)
> 51a755c56dc05a Ying Huang     2023-10-16  2565  {
> 51a755c56dc05a Ying Huang     2023-10-16  2566          int high_min, to_=
drain, batch;
> 06fb80866d37b0 Joshua Hahn    2025-09-24  2567          bool todo;
>
> needs to be initialized to false.

Thank you for the catch, I think Christoph also pointed out the same
thing earlier.
I'll be sure to fix this up in the next version! Have a great day!
Joshua
