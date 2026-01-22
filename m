Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F433815EE;
	Thu, 22 Jan 2026 18:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769107360; cv=none; b=jUN0qDovDBkVoLVm7PRepywCeBBaxWqd/bpexWWNQVa/rcHL3lKTUAS995O3kdDcyJ06PZuCAAp31Bq3gr2rbM7NhlMNkq3PTNuHtDhuC1iY6sMSHR1hJUFDaU0NAF2qb5eT/XAx82MFCm8sDvUlVTqr1AEzVGXE3N+yBrurzU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769107360; c=relaxed/simple;
	bh=b72qrfEiESRnID/ZSET/7KyALK/IAoOp3xRzxTn/cmg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=q9uBJ4Hpx+806t5pXRduOeLLhT88kQMpsY27fjW4c+6gaFdJvaMXiaQbuuAlTyEl3jgWReqOIK+c+Ud7qDfEVmFf1WGTh4lMX9ZDF6LUBT4FhqzyLt85F1322Xb2JKsr3z2gsG64fTnJ8heK3KdvhmwZ/cKxAHt9EV8Ycr6CIr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=0M0eJV+1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="0M0eJV+1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D5EC116C6;
	Thu, 22 Jan 2026 18:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1769107359;
	bh=b72qrfEiESRnID/ZSET/7KyALK/IAoOp3xRzxTn/cmg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=0M0eJV+1auAuUJWu6GmAhcw05iE+ioaUWBCvpKqre4cv3wJ/ruPqT0U4bVOOS/tqc
	 bKLJV66CX20wozAGsPSeN/NLoynZYrQd/9vymmJ3GdTf1JW3PCuLdapix4xH3cjTBt
	 Tf9rth/6MEyCnbgdArSi5qjduVaMXCvCEVb+YzHc=
Date: Thu, 22 Jan 2026 10:42:38 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>, Jason Gunthorpe
 <jgg@nvidia.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: Re: kernel/liveupdate/kexec_handover.c:994 kho_preserve_vmalloc()
 warn: missing error code 'err'
Message-Id: <20260122104238.54189a538153a0323453d61f@linux-foundation.org>
In-Reply-To: <CA+CK2bAyHHoUaT_4dTNK6AH2oyMMhs2sNhuW97hV4yRw7ie9Tg@mail.gmail.com>
References: <202601211636.IRaejjdw-lkp@intel.com>
	<20260121123922.c0bb0ef8505c70b99998c324@linux-foundation.org>
	<CA+CK2bAyHHoUaT_4dTNK6AH2oyMMhs2sNhuW97hV4yRw7ie9Tg@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Jan 2026 13:14:49 -0500 Pasha Tatashin <pasha.tatashin@soleen.com> wrote:

> > --- a/kernel/liveupdate/kexec_handover.c~a
> > +++ a/kernel/liveupdate/kexec_handover.c
> > @@ -1011,8 +1011,10 @@ int kho_preserve_vmalloc(void *ptr, stru
> >                 chunk->phys[idx++] = phys;
> >                 if (idx == ARRAY_SIZE(chunk->phys)) {
> >                         chunk = new_vmalloc_chunk(chunk);
> > -                       if (!chunk)
> > +                       if (!chunk) {
> > +                               err = -ENOMEM;
> >                                 goto err_free;
> > +                       }
> 
> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Cool.  I think I'll turn this into a 6.19 hotfix - it is a slight bug
and we don't want people to keep telling us about it.
