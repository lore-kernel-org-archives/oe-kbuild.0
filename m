Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B4D16CD1E;
	Mon,  1 Jul 2024 16:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719852988; cv=none; b=e1BLKePVwQDPwSd4FlRjhU1YB6pAFDrC1Eo/W0zAhzoOJbLlh9hc6nEs1DHr+sZoz3KfsfWYTQ9qxUK51RhsVvdgIe63GhUk3DYTIICPIpqjJ5ae6DPRXQ6zrBi2OGIppviGUzX8Rw3L8MAUx3wTYzuTzJWAuXu/Tfs9TKOonvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719852988; c=relaxed/simple;
	bh=uS1Gv6G69bryQm7N1m7UUlMz6ptJs17wpGLeTCdTStk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZomKiQ5ACLyHIg5fzKj7jjC+QtyTE8/vc8fm3icUTWXXcVIDjRgs+rQfOpQPlbLaMsEm1gmcWQoIWb0zrIzu7AJHF51C8kIcGx/Oob5SWdczwm6E9AMRodv2NINJqH26myj9v2pWhFOb5kFFKEQipd2nQQNIWdnKHH/fEbNPMWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I8fkwRNe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I8fkwRNe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2723C116B1;
	Mon,  1 Jul 2024 16:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719852988;
	bh=uS1Gv6G69bryQm7N1m7UUlMz6ptJs17wpGLeTCdTStk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I8fkwRNe4t3fyrtUpUVBmMqmY0Zn/dJyvE5cJJC+/hqtc5U9Wsyfp6VKpPAILeeYE
	 fdaIWC1Fy5HlRti4Qtp/XpquUXTcn/d21XGCq/nY+VqXtKJ/Tm2Phjx/tWqo8aM1n2
	 thpamNjpV+eHSjWr6HtWR38LQ9KsFMSS5uX2EShTbokUL1EQViih45yIuaaXfXgyN0
	 jxVZw4b2yrXE7hTEVdOdIw4s8z3YC2lSvD5yfqxYipHLPbRHv6e+sXY5zK7hl1JQH5
	 IZVdYjSWSUI4q+gudddk+3414NRuYACiKqeRqH3mvVCMU2NIO2tHohYvmamrdW0Wm3
	 12+lN1UaIkyIg==
From: SeongJae Park <sj@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: SeongJae Park <sj@kernel.org>,
	oe-kbuild@lists.linux.dev,
	Honggyu Kim <honggyu.kim@sk.com>,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hyeongtak Ji <hyeongtak.ji@sk.com>
Subject: Re: [linux-next:master 6602/7397] mm/damon/paddr.c:360 __damon_pa_migrate_folio_list() error: uninitialized symbol 'nr_succeeded'.
Date: Mon,  1 Jul 2024 09:56:25 -0700
Message-Id: <20240701165625.47754-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <1d0db7b1-74eb-4582-be17-e7dbce3e36bb@suswa.mountain>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 1 Jul 2024 17:41:50 +0200 Dan Carpenter <dan.carpenter@linaro.org> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   62c97045b8f720c2eac807a5f38e26c9ed512371
> commit: 5311c0a2eee34fd8f4e17382a5f653b95a940ca5 [6602/7397] mm/damon/paddr: introduce DAMOS_MIGRATE_COLD action for demotion
> config: um-randconfig-r071-20240623 (https://download.01.org/0day-ci/archive/20240625/202406251102.GE07hqfQ-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202406251102.GE07hqfQ-lkp@intel.com/
> 
> smatch warnings:
> mm/damon/paddr.c:360 __damon_pa_migrate_folio_list() error: uninitialized symbol 'nr_succeeded'.

Thank you for this kind report, Dan.  I just sent a fix:
https://lore.kernel.org/20240701165332.47495-1-sj@kernel.org


Thanks,
SJ

[...]
