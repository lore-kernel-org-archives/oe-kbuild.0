Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A00D531;
	Sat, 15 Mar 2025 09:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742030426; cv=none; b=rZxo52CFQwvfp9ZBZ1iPACcj6/qIPQPvYPs0B6PQRhNrTy6nw0df5bR7L4FH3PO1+cwT565wBStP3ZSEf0mjcSiCQq2KPLLKEMxNP5gt4mP6NVQfwbU1psivxtugoY05PYvhyqHco9ekGD8pCJ2r03JgMMf4yIwHRNz7ozlY7Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742030426; c=relaxed/simple;
	bh=/ouDXSB+FLg/DyuIiojXGnrS6MEUgv4W01OnX6y9fiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J32sujmLtQBrjkEBkiPFhlcdSl3v7+SbHWnbf08XoxOLUVm5e5tpJ6v5gTK3XG8/N3/VjxMtPlUW3KtkP6vOaT3lrDA3S0SszdsTdYk+C22TSEtW0A4WkIumXw4bO4Usp/l6HYBq5KS92UeTLLFF/yN+4Ha6J1x+Ko530MxQpPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzLu0Mgv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzLu0Mgv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415F2C4CEE5;
	Sat, 15 Mar 2025 09:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742030426;
	bh=/ouDXSB+FLg/DyuIiojXGnrS6MEUgv4W01OnX6y9fiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lzLu0MgvxtfIBetn/mw3V2wgfLCq6lnNcYQRCaz0UbS47QmUQg2Grz9MCrJGpmSlO
	 9V9pKWunAj9L2fSRa5eqmjAxBvW96j4YYVx/6Km3q4O/pR7vRXkpS8GchGmWkJZGsk
	 JgybWYF3hM93dUnpjmN6L+5jI9VNU2lL/mjmB79GKJWXqYwJ+bL+vwu5BxyjrdKn8g
	 p770j5tq8vUaJ8RoaregqzMAPgDw9CERfyuCa3lHqCcpUEVOASGVzb6YB9GfLqJ9Qs
	 kCNUM/SuAYkL0Av83rcDGXA9WYGVLw/5YVyPNYbLtkRO0rNAfrclinBM4HGaUnWxTW
	 /IFuwo166IS5A==
Date: Sat, 15 Mar 2025 10:20:20 +0100
From: Christian Brauner <brauner@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, Christian Brauner <christianvanbrauner@gmail.com>
Subject: Re: [brauner-github:work.idmapped.squash 9/10]
 fs/mnt_idmapping.c:384 alloc_mnt_idmap() error: 'idmap' dereferencing
 possible ERR_PTR()
Message-ID: <20250315-neuplanung-gondel-4604efe8a8cc@brauner>
References: <74e7922d-d803-4b67-9411-dc5aa7f5e2f1@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <74e7922d-d803-4b67-9411-dc5aa7f5e2f1@stanley.mountain>

On Sat, Mar 15, 2025 at 12:03:57PM +0300, Dan Carpenter wrote:
> tree:   https://github.com/brauner/linux.git work.idmapped.squash
> head:   97968d12e00d95bcc960a4fbd00fdb3ceb7e0c29
> commit: 27ead64a2c3d23b290e9cbff36f10b9fe9fe71f8 [9/10] mnt: add VFS {g,u}id squashing
> config: openrisc-randconfig-r071-20250314 (https://download.01.org/0day-ci/archive/20250315/202503150052.sDyHku8X-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 14.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202503150052.sDyHku8X-lkp@intel.com/
> 
> smatch warnings:
> fs/mnt_idmapping.c:384 alloc_mnt_idmap() error: 'idmap' dereferencing possible ERR_PTR()

Thanks! This is an experimental branch.
