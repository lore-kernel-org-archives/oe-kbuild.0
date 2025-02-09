Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4F61B87F5;
	Sun,  9 Feb 2025 11:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739100251; cv=none; b=Jex9veRjmcwrX3HlSJcql6N1UahpJU9Hb6EjgdT3E8OoXYycM1d7+zW5pX9UZ4cX+mKefXPlyRwnxRDX8aMYeQ02zo8pOdU+qQ2zwc0TkZvZojNC9BPcHutGLi2K+Jt+Lt45nwK1zhdVh33RtKNIwN1YhwvyhLvWcJVQmqVbJS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739100251; c=relaxed/simple;
	bh=UHNdqv0EXE0B/ru7G2d2D0XYFCeH4J/1fbALQ/ig2Ec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fATaIdqYJ4wPlcFrurGjyVjnv3SsDH1tZtBClEuXzrSQ9XTh6m9PJpc9nocPcsxtJIzvyOSWmUl0lHk7WD8yNK0fdGIQ1R9hx2+WOyyJi5kOglkpcZKo2Od8WilxbvtuC+ka04SLx924r14hPKFOlturmTztZdDVK7gMKzCY94w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6YWPxyC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6YWPxyC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 154CAC4CEDD;
	Sun,  9 Feb 2025 11:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739100249;
	bh=UHNdqv0EXE0B/ru7G2d2D0XYFCeH4J/1fbALQ/ig2Ec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F6YWPxyCnM7miYEPEEkHDbNDwVh93wBpe/sMG5CI4YxHlyGagwtuoSqunI0IAmwi9
	 iEk2Kies4Esytn/Ysq9xsX1z7H8bOx6eNBnBlwfYMmEUgRG99i6fF3vvS53EMdjmNB
	 NPNJ6leRYPLOR8ZVevG/9Nr5+okhcBA6QC1afzgAT3/pOwVhjbLdoOcuvrGxRe9rYY
	 hhQVIXWQaAn4yXKYgYkOERjBQxNsiBHbNQ9XGeEjNf8741LvRGZHujcNwt3KD1NBLM
	 tXGiXXxdQylYcTDz6RD9SVD9OrI4LvcuPbG7//aU970yKSoL/YCs8/fL1A842ipgk3
	 lYKTpEb9xYWNQ==
Date: Sun, 9 Feb 2025 13:24:03 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Maher Sanalla <msanalla@nvidia.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [leon-rdma:rdma-next 76/77]
 drivers/infiniband/core/uverbs_cmd.c:1492 create_qp() error: 'pd'
 dereferencing possible ERR_PTR()
Message-ID: <20250209112403.GC17863@unreal>
References: <1ae70453-f983-4e0d-9707-02e041da0789@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ae70453-f983-4e0d-9707-02e041da0789@stanley.mountain>

On Fri, Feb 07, 2025 at 10:48:48AM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
> head:   98119a2a0f09ec10bf3a35026f43a0e5732be742
> commit: 84633f80b89acfaa55e09c273f27843a2277143e [76/77] RDMA/uverbs: Propagate errors from rdma_lookup_get_uobject()
> config: i386-randconfig-141-20250207 (https://download.01.org/0day-ci/archive/20250207/202502070936.x78bftbK-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202502070936.x78bftbK-lkp@intel.com/
> 
> smatch warnings:
> drivers/infiniband/core/uverbs_cmd.c:1492 create_qp() error: 'pd' dereferencing possible ERR_PTR()
> drivers/infiniband/core/uverbs_cmd.c:1494 create_qp() error: 'scq' dereferencing possible ERR_PTR()
> drivers/infiniband/core/uverbs_cmd.c:1497 create_qp() error: 'rcq' dereferencing possible ERR_PTR()
> drivers/infiniband/core/uverbs_cmd.c:1500 create_qp() error: 'srq' dereferencing possible ERR_PTR()
> drivers/infiniband/core/uverbs_cmd.c:1503 create_qp() error: 'ind_tbl' dereferencing possible ERR_PTR()

<...>

Thanks, fixed and squashed locally.
