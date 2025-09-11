Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111D817D2;
	Thu, 11 Sep 2025 00:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757552236; cv=none; b=sonzpdJs/Ot2QOrg4OSikT3Z++R9qdqxob100z1NAehE8tEZAY6+6HfZN1lsnrjTvizltjgjCLAUh2XyAo42cZjOVA2QRM0kaJC935wyIQqQUU3JhCLj3yaT/wakSlx3A1El9aDFbebnE/FkN1RNfT2GFbRbj1i1GiZLrLOmg0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757552236; c=relaxed/simple;
	bh=XNuE22YtovlkI6w1sRoVwNQ/wKN/+MV+al8LD8kkVlA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=sUosGO6r90twFtog/YdKJSpPVFkwBs1vpt9VDOEi9S/aoD0J/sJIhodI0IoKsmbJeVMNNSuPodwU9g3RqlevLRoEyXz9Z9MDfcR7m3HDTBwkfKf008S4oIlg+0mQvuWvR5xVtgbefuYCWy/TVpnRGUjvC358+PNMgUvwyq8453E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DpDY3dWV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DpDY3dWV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA86C4CEEB;
	Thu, 11 Sep 2025 00:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1757552235;
	bh=XNuE22YtovlkI6w1sRoVwNQ/wKN/+MV+al8LD8kkVlA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DpDY3dWVDS6Gl/kawv47cfH4Esb5/+X0WcGv8qx/Txf5F54iKfLiYVbtN06o2vgIV
	 YSOc2U5CkRYO21buBi3a5HChMP/q9ncd5X1rwAX02tnsE9sX3h+Y6lxn7Rs//6qamB
	 /sspLg2FDHGE2anhouc60jvfc0Fpd2a1GlGcPnMw=
Date: Wed, 10 Sep 2025 17:57:14 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Balbir Singh <balbirs@nvidia.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-new 398/411] mm/huge_memory.c:3069
 __split_huge_pmd_locked() error: uninitialized symbol 'write'.
Message-Id: <20250910175714.4203dba33afea5516761bb2a@linux-foundation.org>
In-Reply-To: <88f160fb-0f84-49e2-9139-1fba1a21428e@nvidia.com>
References: <202509101756.jkC29gja-lkp@intel.com>
	<88f160fb-0f84-49e2-9139-1fba1a21428e@nvidia.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 11 Sep 2025 07:54:20 +1000 Balbir Singh <balbirs@nvidia.com> wrote:

> > smatch warnings:
> > mm/huge_memory.c:3069 __split_huge_pmd_locked() error: uninitialized symbol 'write'.
> > mm/huge_memory.c:3078 __split_huge_pmd_locked() error: uninitialized symbol 'young'.
> > 
> > vim +/write +3069 mm/huge_memory.c
> > 
> 
> If the entry is not present, it is a migration or device private entry, so write is
> set, I understand that smatch is complaining about it falling through the paths.
> 
> If freeze is true for a device private migration entry, young needs to be initialized
> to false.
> 
> Andrew I can send out a patch to fix it or I can wait to gather more feedback
> and do a v6?

I think a little fixup would be good - it's nice to keep track of these
things as they pop up.

Is a v6 expected?  I'm not seeing anything yet which would necessitate
that.

