Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7B23C17;
	Sun, 14 Sep 2025 17:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757869889; cv=none; b=fZjjx5goRastpMle/8LgKC6LoJ0/fWQ6ZRbIGfPR1FkLuNlcxmB2zjlnkWGxnnHgzS9kFDdfKB2A2QBizoJ65O2sihA2FByza7bCLxQ9DEq8Gj1/QxCqBXg3ArMOz0LSUcL3oS1emXZuLtRoJK5Adl/8kx1bgjxijvUNk0Ojt1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757869889; c=relaxed/simple;
	bh=R4nleOWQBXrjcJ6F7XMM9V/RLFsCm0xX6V58+VVKxMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CWF1EEVL4CLJ622M8QtbMV+C4BGPsTNqdqed+OIuIft1QCc3s2wzPnRl2vrTBZH9MS9JqBRCETUYBDQ8v//ETpXam8ZaO/wuDDlfT+Ivn5Vu53bubG17dQjTgMM5CihEW03W0l7lmtPhX01+N5qakYyjV3/DJhO0NaW1NScjugk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDKtHEkE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDKtHEkE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69CFC4CEF0;
	Sun, 14 Sep 2025 17:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757869889;
	bh=R4nleOWQBXrjcJ6F7XMM9V/RLFsCm0xX6V58+VVKxMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JDKtHEkEtnr9+b9Lb52g0Hxyv6CHW92/xbi9EOAlCApQSopD5+J4OXSmtCW8I9FZh
	 TtKNG+MBmYzHaqqiT0Bu5p6atFifChhQgaN86JJCro1ZZ1PJOkvdSyJpQ0Hz57yD5u
	 RV19IGJbsAp6L9jwFqiwwEzQOnB+VojRzy+GUAL1QaJNJJCIlzVJpJZywIf4a+WGBk
	 vGEc2dxdli8inEjtHA0qwgOGGgz1QgqAEhryMCggJ8xwyop0DrQyygjKqjv17ZIh9J
	 qRTVgqV+aMICViJGhKSZuaeTAk+l94ZC/cZCcAIc2c7OgQ7eYnjfwOq0/vPdJCc8dc
	 y/x9boi7Ybr5A==
Date: Sun, 14 Sep 2025 20:11:25 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Denis Aleksandrov <daleksan@redhat.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: [linux-next:master 7959/8263] drivers/char/tpm/tpm_ppi.c:349
 tpm_show_ppi_tcg_operations() warn: inconsistent returns 'global
 &tpm_ppi_lock'.
Message-ID: <aMb3PQQsEn3UFW-G@kernel.org>
References: <202509120229.YpG1CcD3-lkp@intel.com>
 <CAG+gbFc=hxHSGxh5fFBSfs7GB1Z2aS-b0MkmyQaCP-o9P7Xw8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG+gbFc=hxHSGxh5fFBSfs7GB1Z2aS-b0MkmyQaCP-o9P7Xw8g@mail.gmail.com>

On Thu, Sep 11, 2025 at 03:21:49PM -0400, Denis Aleksandrov wrote:
> On Thu, Sep 11, 2025 at 2:56 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   8f21d9da46702c4d6951ba60ca8a05f42870fe8f
> > commit: 18aada46edf7f79dba1ab89a100d0fc350d4a5c8 [7959/8263] tpm: Prevent local DOS via tpm/tpm0/ppi/*operations
> > config: x86_64-randconfig-161-20250911 (https://download.01.org/0day-ci/archive/20250912/202509120229.YpG1CcD3-lkp@intel.com/config)
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202509120229.YpG1CcD3-lkp@intel.com/
> 
> Jarkko, would you like me to send a separate patch or a v5?

If you don't mind, sorry I missed this. Throw me v5 and I will replace
the current patch.

BR, Jarkko
