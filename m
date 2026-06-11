Received: from d218-7.smtp-out.eu-west-2.amazonses.com (d218-7.smtp-out.eu-west-2.amazonses.com [23.249.218.7])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B06286419;
	Thu, 11 Jun 2026 10:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.249.218.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781173052; cv=none; b=pyQYzQQ01KJNYmItPHykp5Cs7XcjbJ10JUdWKi3ETulDRFBneDn52e5+rfRYUJ092Z/AGkZOi5+KPY6HAoKmm8FQroeKQ1Orz2FjGeQL6tgwNNDWq5gMa+3RjvbiKlJdQKKG5F4U+LWUHI1xt02ytUn4sOB1mhFnxPa2/EqIZAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781173052; c=relaxed/simple;
	bh=tBJd3a9smvQtcySn9NIc9PhT29b+XntTkiv/O3RxqXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+nhLvvGlAOvgsiVTpPRZDx1yHj/OV2JuXRHMrcimS5lwKCzYJkHy/TWwGAOHtSXna4smvXIFisDZKgh6rsdLoXvuDl45+4Lic531fGTbP3SsjZaAUAUt9dChcIo/89qyhH6InZJaobnEpXbN5EqTvV0aq0KX5lS43OcQ4cyte8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=electricworry.net; spf=pass smtp.mailfrom=mail.electricworry.net; dkim=pass (2048-bit key) header.d=electricworry.net header.i=@electricworry.net header.b=Qb3z5Qhg; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=DcXKIQIZ; arc=none smtp.client-ip=23.249.218.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=electricworry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.electricworry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=electricworry.net header.i=@electricworry.net header.b="Qb3z5Qhg";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="DcXKIQIZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=xxcsvipqs5hvfd7f74n2i5bueyncqkjk; d=electricworry.net;
	t=1781173049;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
	bh=tBJd3a9smvQtcySn9NIc9PhT29b+XntTkiv/O3RxqXE=;
	b=Qb3z5Qhg67X/kFLbCygIWg3mcpKMfPPlPjU/az6ybXP+s1Q1EPaOUWqIbLruG3js
	0l9lDLTfJfmCX5ndK5YiQpfo/Ft8xxc1/P74kgQp4XofI/5MfNfqyigmL1PPuZh3vfb
	GhU33TCApyNQMAbgGFggr4mTQRAXjbnlikOlImmDLj5fKC9RDpy+uKHj4+yuEK9Ygag
	PQyuyLmwHclBKCMn5wSlSVfq89O7CNNPTTDQITMgLBsRn/OvYKY962+C4fCv4ojIVnF
	Exiu87Bt1truPs/wNVzqBYVSQfiVvolM4rivJB+8PDfU6qi5CEWbMFL/baUD2z6sU1e
	7uD5Sjp5QA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=smjs5bczbyxi6u2ua6eveuxqal7joyry; d=amazonses.com; t=1781173049;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Feedback-ID;
	bh=tBJd3a9smvQtcySn9NIc9PhT29b+XntTkiv/O3RxqXE=;
	b=DcXKIQIZAOub/VADAw2xAZwpXQPnpvWjXVAd6eZYPNmWzQ/DcCB5NZ04px2MKePe
	W5XvAiyZJMd9E8enRsL95TpBwtIQ/ZxRDOCx7qIHH54GHB964l+lv5y2vy/UN9pKTgB
	kOrEavWgDNw+v+h9MJQwc1qovrkVGo0khYxrShpY=
Date: Thu, 11 Jun 2026 10:17:28 +0000
From: Bob McChesney <bob@electricworry.net>
To: Marco Elver <elver@google.com>
Cc: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev, 
	lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	"Harry Yoo (Oracle)" <harry@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, linux-sunxi@lists.linux.dev, 
	Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [linux-next:master 4283/12670] drivers/dma/sun6i-dma.c:792
 sun6i_dma_prep_slave_sg() error: dereferencing freed memory 'v_lli' (line
 793)
Message-ID: <010b019eb62fd604-d3a75323-b446-46a0-b164-57cc0d1a75b4-000000@eu-west-2.amazonses.com>
Mail-Followup-To: Marco Elver <elver@google.com>, 
	Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	"Harry Yoo (Oracle)" <harry@kernel.org>, Vinod Koul <vkoul@kernel.org>, linux-sunxi@lists.linux.dev, 
	Chen-Yu Tsai <wens@kernel.org>
References: <202606110958.2CPRMnM0-lkp@intel.com>
 <CANpmjNOZ_11Ef0qYnagaDshHoYy4=cUOQBsd+0DPJyJt02pWnQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNOZ_11Ef0qYnagaDshHoYy4=cUOQBsd+0DPJyJt02pWnQ@mail.gmail.com>
Feedback-ID: ::1.eu-west-2.gfFyncE+PRqcG/qebM3Lg+wfopUKzk5aGDEiDVENH+o=:AmazonSES
X-SES-Outgoing: 2026.06.11-23.249.218.7

On Thu, Jun 11, 2026 at 11:24:09AM +0200, Marco Elver wrote:
> +cc maintainers of this driver
> 
> On Thu, 11 Jun 2026 at 10:59, Dan Carpenter <error27@gmail.com> wrote:
> > vim +/v_lli +792 drivers/dma/sun6i-dma.c
> >
> > 555859308723d8 Maxime Ripard       2014-07-17  783      dev_dbg(chan2dev(chan), "First: %pad\n", &txd->p_lli);
> > 9aa48806edb8c3 Samuel Holland      2022-04-24  784      for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
> > 9aa48806edb8c3 Samuel Holland      2022-04-24  785           p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
> > 9aa48806edb8c3 Samuel Holland      2022-04-24  786              sun6i_dma_dump_lli(vchan, v_lli, p_lli);
> > 555859308723d8 Maxime Ripard       2014-07-17  787
> > 555859308723d8 Maxime Ripard       2014-07-17  788      return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
> > 555859308723d8 Maxime Ripard       2014-07-17  789
> > 4fbd804e009ae9 Maxime Ripard       2014-07-30  790  err_lli_free:
> > 9aa48806edb8c3 Samuel Holland      2022-04-24  791      for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
> > 9aa48806edb8c3 Samuel Holland      2022-04-24 @792           p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
> >                                                                                                 ^^^^^^^^^^^^^^^^^
> > 9aa48806edb8c3 Samuel Holland      2022-04-24 @793              dma_pool_free(sdev->pool, v_lli, p_lli);
> >                                                                                           ^^^^^
> > freed and then dereferenced to get the next block.
> >
> > 4fbd804e009ae9 Maxime Ripard       2014-07-30  794      kfree(txd);
> > 555859308723d8 Maxime Ripard       2014-07-17  795      return NULL;
> > 555859308723d8 Maxime Ripard       2014-07-17  796  }
> > 555859308723d8 Maxime Ripard       2014-07-17  797
> > a90e173f3faf29 Jean-Francois Moine 2016-04-28  798  static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
> > a90e173f3faf29 Jean-Francois Moine 2016-04-28  799                                      struct dma_chan *chan,
> > a90e173f3faf29 Jean-Francois Moine 2016-04-28  800                                      dma_addr_t buf_addr,
> > a90e173f3faf29 Jean-Francois Moine 2016-04-28  801                                      size_t buf_len,
> > a90e173f3faf29 Jean-Francois Moine 2016-04-28  802                                      size_t period_len,
> > a90e173f3faf29 Jean-Francois Moine 2016-04-28  803                                      enum dma_transfer_direction dir,
> > a90e173f3faf29 Jean-Francois Moine 2016-04-28  804                                      unsigned long flags)
> > a90e173f3faf29 Jean-Francois Moine 2016-04-28  805  {
> >
> > [ snip ]
> >
> > a90e173f3faf29 Jean-Francois Moine 2016-04-28  868
> > a90e173f3faf29 Jean-Francois Moine 2016-04-28  869      return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
> > a90e173f3faf29 Jean-Francois Moine 2016-04-28  870
> > a90e173f3faf29 Jean-Francois Moine 2016-04-28  871  err_lli_free:
> > 9aa48806edb8c3 Samuel Holland      2022-04-24  872      for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
> > 9aa48806edb8c3 Samuel Holland      2022-04-24 @873           p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
> >                                                                                                 ^^^^^^^^^^^^^^^^^
> > Same.
> 
> Not sure what's going on here, but is this a latent bug in this
> driver?  It appears some recent changes made Smatch see through this
> better.

I remember seeing a proposed fix for this very issue:
https://lore.kernel.org/linux-sunxi/20260611063631.96566-1-zenghongling@kylinos.cn/
