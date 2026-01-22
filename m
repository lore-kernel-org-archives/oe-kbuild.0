Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FF8352933;
	Thu, 22 Jan 2026 09:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769075361; cv=none; b=AjRZ00eb/+HSt5bSX5Orkp50lNNY7yrHdxCAhRae4wQVTGJkrwLCI+RDRmQO1njZ34hlOzA0lqC2pg6jGPcHdyuDhOxr3mzHF5f5JL1SRXgImKQC80p3q6M8dGKUNRtU3YatunSUW0vPwjLDE38ABxgkpGnsOxDrLUAVnvIhexc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769075361; c=relaxed/simple;
	bh=dRV9tsm3tF8BwNf3UZE4OCSsbX34H1Ma1dmXtxPs/4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyASWkDPplCkyFpBhQyfuI0h+hLuUbGDHvZT0RpiJrbLVC+QeTEkG/c32YkcFAqUcb/s/iwtqc72ARf1vQtFjNCnC4EIYgBdv2ZE0j5yEm9IjyzwnI3URr9hB77GSUsPtFeVRQ0TQZkASP33tWUVvkSXm1tJZTYNJRjXqDEvbXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=adpgN6sN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="adpgN6sN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B51AAC116C6;
	Thu, 22 Jan 2026 09:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769075360;
	bh=dRV9tsm3tF8BwNf3UZE4OCSsbX34H1Ma1dmXtxPs/4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=adpgN6sNFvKPNN7MVXkTYjmvS7P8vMtwXhlHIVBZdGwJBKaAEnuGI8nZa9gurLgYV
	 +/N/KStwJKlul9n+sqTe2xlS4mIlhArYBVVXWBWk+C58cOzBMjgqJ3C85gwMAGvkeF
	 nHh0xE5eQqR0prbEAN1ChRBp0PAyeZfzAt4dV71ixCsihLoCiW2fqbW7eXb6Koq4t5
	 k3lBsl3+7qrsKwXXbFIxOoImDdSA8+lrbgh7ZhgSGS8Nx2GW+mHpkTPsb/Zn98TtYy
	 VnfMZbm515Lu9PpnuCGkS8+QzYU0FV+pomcfSist6Vl7zNsQ+smELTTlrnIB/Rt1UI
	 LvqlwwZVDYFBQ==
Date: Thu, 22 Jan 2026 11:49:13 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
	Pasha Tatashin <pasha.tatashin@soleen.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: kernel/liveupdate/kexec_handover.c:994 kho_preserve_vmalloc()
 warn: missing error code 'err'
Message-ID: <aXHymXWEXY4Bia9C@kernel.org>
References: <202601211636.IRaejjdw-lkp@intel.com>
 <20260121123922.c0bb0ef8505c70b99998c324@linux-foundation.org>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121123922.c0bb0ef8505c70b99998c324@linux-foundation.org>

On Wed, Jan 21, 2026 at 12:39:22PM -0800, Andrew Morton wrote:
> On Wed, 21 Jan 2026 11:58:20 +0300 Dan Carpenter <dan.carpenter@linaro.org> wrote:
> 
> > Hi Pasha,
> > 
> > First bad commit (maybe != root cause):
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   6c790212c588fddeb0d852f2790840753bb604b1
> > commit: 48a1b2321d763b5edeaf20bd4576d8c4b5df772b liveupdate: kho: move to kernel/liveupdate
> > config: x86_64-randconfig-r071-20260121 (https://download.01.org/0day-ci/archive/20260121/202601211636.IRaejjdw-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> > smatch version: v0.5.0-8985-g2614ff1a
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202601211636.IRaejjdw-lkp@intel.com/
> > 
> > smatch warnings:
> > kernel/liveupdate/kexec_handover.c:994 kho_preserve_vmalloc() warn: missing error code 'err'
> 
> Indeed, thanks.
> 
> 
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: kho: kho_preserve_vmalloc(): don't return 0 when ENOMEM
> Date: Wed Jan 21 12:36:17 PM PST 2026
> 
> kho_preserve_vmalloc() should return -ENOMEM when new_vmalloc_chunk()
> fails.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202601211636.IRaejjdw-lkp@intel.com/
> Cc: Alexander Graf <graf@amazon.com>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
> Cc: Pratyush Yadav <pratyush@kernel.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Thanks!

> ---
> 
>  kernel/liveupdate/kexec_handover.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> --- a/kernel/liveupdate/kexec_handover.c~a
> +++ a/kernel/liveupdate/kexec_handover.c
> @@ -1011,8 +1011,10 @@ int kho_preserve_vmalloc(void *ptr, stru
>  		chunk->phys[idx++] = phys;
>  		if (idx == ARRAY_SIZE(chunk->phys)) {
>  			chunk = new_vmalloc_chunk(chunk);
> -			if (!chunk)
> +			if (!chunk) {
> +				err = -ENOMEM;
>  				goto err_free;
> +			}
>  			idx = 0;
>  		}
>  	}
> _
> 

-- 
Sincerely yours,
Mike.
