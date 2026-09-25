Received: from mail-wr2-f13.google.com (mail-wr2-f13.google.com [74.125.225.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF7C28850E
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Sep 2026 07:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790322166; cv=none; b=TDAQXon9memDvwXuCsv9k7rpVFGVC7Iu19pqOp4vgSx+vqTSbtL/oYMLEYFCrMYLl4VT4RF8yVvjsVCDN1rAcCCND4v/OCI7lvCC7+8rO3jN9u9awHc8hE9CGpfRQAtZVbbQBgsh7psXZEfvL1j7J7D5QJ78wSGXMj1WHNce6ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790322166; c=relaxed/simple;
	bh=4Ms1j6HDHR9POx8IQpp5n2Cvct/LATjoKlGYR8Bb2vM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2R0SG500PAY8stH/C7o8tsMsV+z30RcZ9YQbFbrBdL6kL6pGr/W1j/nStB6Zr07Mf5Q8JKjRV52IfPKN2tWSW3reMynzhD93QtAmV3FTC9TABeW0xI/6LSlvclyA1mDVnTDG3P9gXgAayVNSDXtaf5ZHa42dzVY+Lbul9efom0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jv8O1BBf; arc=none smtp.client-ip=74.125.225.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jv8O1BBf"
Received: by mail-wr2-f13.google.com with SMTP id ffacd0b85a97d-4843378fb37so300430f8f.3
        for <oe-kbuild@lists.linux.dev>; Fri, 25 Sep 2026 00:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790322164; x=1790926964; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zWr1PMB3Rc/UXhUDgKdBkp20G3Gj5KQDsYg0EGVPPQM=;
        b=Jv8O1BBft8uXSA1KffURs2DoRNVPPtujkoy6TlWUlsmWW1nKF4IyG1ZWXohaeNbQge
         ih7dMRgkisb7PwtPdhaz3oORvlRjVfQ9oniOPSDJ83fL3yBadJT7yKaOZAOvye453VGw
         MjLBKh0Ytv0A21z86jCZZHKHTw28i+X74Nbq0neYZdtavkxcgDAo1SZPnFIvYtxeoYvC
         DFVV++U3ksFOXpGDcpf5+v9BcCGyZVpPYWmLL+MX6jXsEjJPosYa7cCuuab2PibHcyVN
         qR/UHjYoelgoyxBCqE5gT0e2xCIlEdwlHoQieQlFAbAtaX68SVNcQiwZl4h7qm2OnVWb
         u0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790322164; x=1790926964;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zWr1PMB3Rc/UXhUDgKdBkp20G3Gj5KQDsYg0EGVPPQM=;
        b=0QpTyAX1VFvYOQ8ib321RbyII8yDiNPB4PflJtDH3p18qGVQE+vuWZY93E8pMAV+Tw
         px75fDTaVcnadSZjludEeYql/RXFZ+qYZxCDxhCS9NwxdaXmIB0Kg8amVvC8yhcLI1YS
         LW8R/7FtZQQwLcrkA+SeGOYndqnRoYoFBEZ/JXdiidJdMhHR0Re3gOyq3iz8Rs3Xp3Aq
         pD+xTOPnV6VCHxjMuXvJAZNeGPMSgqvrpD2q+iYchKy02G1MzTOTU2Z00bsb8YR93MHJ
         pV6ieBz7BVa9XHSu727pKQSZPCqXhi48uqA4+m9h6sIaluQACidjFy2CtuQw7lL2he2I
         MFzQ==
X-Gm-Message-State: AFuF++lJfoJGDHGGWcAzcmeBs+lrK6NdkwnyqZEDvFWCj2VlMH/xJ7SQ
	K6OSOXmn9tV7CEAflO7TGe5MZBrIizs8vgGqUgzqBuweVSntdCAdGezb
X-Gm-Gg: AYBFou1Cm+x7+6zXNqV6Sh+PrEhogz61uY2URjjTWsrUVkfnzAMCbIYcXWBRbvJ1FAS
	6HSZWbOnpIL2yNZr9KDxgbdnm5fI4BfDbp/X1InESz4jc2+g/Ftjn2lh7sS78FO5V2tmaN2XqFs
	Q8/8OzUGmzKhFGB7rvHiuGwYPPyuouI8ekGVoDBeQ7EbcnMvQiS6NLcQXS4DgRYKBAwwQDfU7GL
	oN9tN0UengXFRTwxfo574NfooEENIvceapwnBgX1FQQLUpUUvgRvK3IH6DWba0whZt+qOGW1y38
	f/K4lq2+4JsSbXmB8Tw+YG4vVXJgZTeh5i1XGqrjNnFunMGAfMitbMlF7sSTZIRiokRSpb1g03k
	6Ah/Ozi6+6agMKUNxyh6rnX/yXcdKkx7nKgJ9QNOr3kL/L/KBwoGoalrLOGPetew/ObpB4R6kDK
	Ulxp2fvYPuGghzHg5uheGJEmasj0hD3aDQXpRVO8ZwwbdYF+XZkT57ZE8OdbJBVdlIhmw=
X-Received: by 2002:a05:6000:4103:b0:488:7496:15b5 with SMTP id ffacd0b85a97d-48874961605mr5882933f8f.47.1790322163538;
        Fri, 25 Sep 2026 00:42:43 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355d96sm5487752f8f.17.2026.09.25.00.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 00:42:42 -0700 (PDT)
Date: Fri, 25 Sep 2026 10:42:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild@lists.linux.dev, kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: drivers/xen/gntdev.c:817 gntdev_get_page() warn: mask and shift
 to zero: expr='(addr & ~(~((1 << 12) - 1))) >> 12'
Message-ID: <arYl7m87hzxROT86@stanley.mountain>
References: <202609241805.VsLzGPLn-lkp@intel.com>
 <94cbe491-1b32-47ec-a9b5-bed69bc4d52c@app.fastmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94cbe491-1b32-47ec-a9b5-bed69bc4d52c@app.fastmail.com>

On Fri, Sep 25, 2026 at 08:43:54AM +0200, Arnd Bergmann wrote:
> On Thu, Sep 24, 2026, at 21:39, Dan Carpenter wrote:
> 
> >    489                          return -EFAULT;
> >    490                  break;
> >    491          case 2:
> >    492                  if (copy_from_user(&m, udata, sizeof(struct 
> > privcmd_mmapbatch_v2)))
> >    493                          return -EFAULT;
> >    494                  /* Returns per-frame error code in m.err. */
> >    495                  if (!access_ok(m.err, m.num * (sizeof(*m.err))))
> >                                               ^^^^^^^^^^^^^^^^^^^^^^^
> > These integer overflow bugs are from 2012, but I guess your patch 
> > exposed
> > the arm32 build to the zero day bot.  The bugs only affect 32bit 
> > systems.
> 
> Right, the randconfig came up with an ARMv6 Xen build, which was not
> possible before my patch. I'm sure this was reported for other configs
> before and just showed up as introduced by my patch here.
> 
> This is clearly a bug but it does look harmless to me, as it only
> results in the userspace corrupting itself when passing invalid
> data.

In ancient times, these access_ok() overflows were a much bigger deal.
Easy to solve with a size_mul(m.num, sizeof(*m.err)).

regards,
dan carpenter
