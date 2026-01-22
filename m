Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642813876A4;
	Thu, 22 Jan 2026 10:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769078065; cv=none; b=YbCumPlSdXwptm4lxLhtmgXd00Lc47AszX10G6FUXGnkvFyLe2/5FahEADxaaFayg0iZaq8yQkU2/C5zY6BvE+e3S6BHb5JD6YF31qsr/l85F5YlWLjJ7vbJn96vbKAxzHzEAWM7cel4NJB9059ZGTHARTy5Yoof1ZjQAA7f9WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769078065; c=relaxed/simple;
	bh=YPQM3LF72dQtnndTAbBpKIFno1mmDUBw902OFrebz4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7QV/agddp6q4Q1tLhF1bMYk3tIDHSlyiL8S8LREu0yCeqxxs+6iFQbqHYxdUaPpwR1hyiAAx+uwCU2NzE2u93UJwRlCxApHy3qCnPA9WP/lST2HBnaZcy8aBTo8EU51zbaeR+VzQYubVuinUyM7tJWTg+mAGvwz06SoBikz2kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3duCvPy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3duCvPy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E0C2C116C6;
	Thu, 22 Jan 2026 10:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769078065;
	bh=YPQM3LF72dQtnndTAbBpKIFno1mmDUBw902OFrebz4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b3duCvPyAvO968IZQKd8M/0WV2zyfL1eF+HsU7C/pPvHs1tS8d6MB838O9ofT8A0v
	 OJixysVFo4cD6VtFqQF7Nb49M14mDRRtXC2m8Bejv+h3XQlLBiZLnFimFQsxKi8O8A
	 OlKWvV7jA5fMmnUInpkV9EyMgAKE3zK61ZODAUQY+YMo8SsX82X6y2JU16vdU3LoR3
	 0H9FW3gCvLMkptcxELCewTkqGoXNSNvYv6uW+t+ygyoWB4Xh6iLbMRet5FFjiCytHf
	 7Z9wEMFuoOsqo6axe3uodR3YrdLe/UWXGrEc/LgAv3ZzvQzhPMSEnbTuTMOfUH+Yf4
	 Ch2awff0f2G9Q==
Date: Thu, 22 Jan 2026 12:34:19 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [rppt:uffd/refactor/v0.2 1/11] mm/userfaultfd.c:271
 mfill_copy_folio_locked() warn: maybe return -EFAULT instead of the bytes
 remaining?
Message-ID: <aXH9K6JF71dvBYdG@kernel.org>
References: <202601190828.nHc6Gmw1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601190828.nHc6Gmw1-lkp@intel.com>

Hi Dan,

On Mon, Jan 19, 2026 at 09:05:58AM +0300, Dan Carpenter wrote:
> Hi Mike,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git uffd/refactor/v0.2
> head:   2db3a86a6de3247449e068d998305d26481c5522
> commit: 46089d290ec3dea8bdbe9a706e3a8247f6c40490 [1/11] userfaultfd: introduce mfill_copy_folio_locked() helper
> config: x86_64-randconfig-161-20260119 (https://download.01.org/0day-ci/archive/20260119/202601190828.nHc6Gmw1-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> smatch version: v0.5.0-8985-g2614ff1a
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202601190828.nHc6Gmw1-lkp@intel.com/
> 
> smatch warnings:
> mm/userfaultfd.c:271 mfill_copy_folio_locked() warn: maybe return -EFAULT instead of the bytes remaining?

Thanks, I'll update it.

-- 
Sincerely yours,
Mike.
