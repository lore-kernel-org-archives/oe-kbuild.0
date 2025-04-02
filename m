Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F1D175D48;
	Wed,  2 Apr 2025 19:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743620512; cv=none; b=S1xO3qvylT2jJxdIB5smBGyNdk8y3D2XT0iedUSuWJGQZHbm/xspPI9uJY3CfFo8rTUUT8gR4XkxPf7xLoKGxtPnJ68D8oFprggvDt+SIYyXjtA1AlpQFRPeDe8SzfoXoTuBRmF/pjP17NLECxxOUPgXBHow8lFMX5GFuZpzYpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743620512; c=relaxed/simple;
	bh=Ad0D4Nmq48N9Axx7h3Uu2peBfyDSSXV8vifzJ8bY5E8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFpavIRzFSt9cSm0YB24nLJeydoTynyPoM4y284ClyMkyiORXZ6siidCmejoDqAg/+OdpudWo/eALlPu3YwqUo26/8fkChBjpFDuVKeYEGO55yAGlaYASimLz7IohwbWacIgbpHuR98pzGWsSZ7m5+jWvihSkbXgUpp2ZPxL7KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MusOZlmK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MusOZlmK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EEF9C4CEDD;
	Wed,  2 Apr 2025 19:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743620512;
	bh=Ad0D4Nmq48N9Axx7h3Uu2peBfyDSSXV8vifzJ8bY5E8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=MusOZlmKjvjatndrDiJQdmQ5itYaD62uDimyiklO+ngZ/7t2xozh+8PpYGRTBYjoM
	 T7w499vcqJaqS+yOink/mUltFG8sOuRhCVRVeuYkgUyF/QS8hqwim8lEeYJ4MTPNVW
	 cWumy9w3UH+KYWipWTlutgSHwrnMwUZeqz6lHWMRBK5ibQHjPmlWNwLIOe9wMOy5QV
	 8/OmbreuFE3Yv9IPLLSRcOioQi/HNmitD87TYaFhjmR5Bw+ajvw8pfJ+VspEl/amLl
	 YZZLR5uftwiadjepH69VQZqrOXlXEunFB5JMxODhwBLTDq3yuOqTTicvbF7PKrfrLE
	 ibsvJ6V0qbB+w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id E3D53CE079A; Wed,  2 Apr 2025 12:01:51 -0700 (PDT)
Date: Wed, 2 Apr 2025 12:01:51 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev.2025.03.25a 45/45] lib/ratelimit.c:45
 ___ratelimit() warn: 'burst' unsigned <= 0
Message-ID: <26b2c948-2c1f-48b5-8136-fa96a39c854e@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <922c17a3-d075-47f8-9af1-f14e0bbf6da2@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <922c17a3-d075-47f8-9af1-f14e0bbf6da2@stanley.mountain>

On Wed, Apr 02, 2025 at 11:33:36AM +0300, Dan Carpenter wrote:
> tree:   https://github.com/paulmckrcu/linux dev.2025.03.25a
> head:   cedfad9ced72fc8c873e11a4c6a089a415489166
> commit: cedfad9ced72fc8c873e11a4c6a089a415489166 [45/45] ratelimit: Reduce ratelimit's false-positive misses
> config: x86_64-randconfig-161-20250402 (https://download.01.org/0day-ci/archive/20250402/202504020656.TgN4JCta-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202504020656.TgN4JCta-lkp@intel.com/
> 
> New smatch warnings:
> lib/ratelimit.c:45 ___ratelimit() warn: 'burst' unsigned <= 0
> lib/ratelimit.c:45 ___ratelimit() warn: 'interval' unsigned <= 0

Good catch, those two should just be "int".  I am folding the fix in
with attributions, thank you!

							Thanx, Paul

> vim +/burst +45 lib/ratelimit.c
> 
> 5c828713358cb9 Christian Borntraeger 2009-10-23  27  int ___ratelimit(struct ratelimit_state *rs, const char *func)
> 5f97a5a8799b8d Dave Young            2008-04-29  28  {
> cedfad9ced72fc Paul E. McKenney      2025-03-31  29  	unsigned long begin;
> cedfad9ced72fc Paul E. McKenney      2025-03-31  30  	unsigned long burst = READ_ONCE(rs->burst);
>                                                         ^^^^^^^^^^^^^^^^^^^
> 
> cedfad9ced72fc Paul E. McKenney      2025-03-31  31  	int delta = 0;
> 4d9c377c81d377 Alexey Dobriyan       2008-07-28  32  	unsigned long flags;
> cedfad9ced72fc Paul E. McKenney      2025-03-31  33  	bool gotlock = false;
> cedfad9ced72fc Paul E. McKenney      2025-03-31  34  	bool initialized;
> cedfad9ced72fc Paul E. McKenney      2025-03-31  35  	unsigned long interval = READ_ONCE(rs->interval);
> cedfad9ced72fc Paul E. McKenney      2025-03-31  36  	unsigned long j;
> cedfad9ced72fc Paul E. McKenney      2025-03-31  37  	int n_left;
> 5f97a5a8799b8d Dave Young            2008-04-29  38  
> edaac8e3167501 Ingo Molnar           2009-09-22  39  	/*
> cedfad9ced72fc Paul E. McKenney      2025-03-31  40  	 * If the burst or interval settings mark this ratelimit_state
> cedfad9ced72fc Paul E. McKenney      2025-03-31  41  	 * structure as disabled, then clear the RATELIMIT_INITIALIZED bit
> cedfad9ced72fc Paul E. McKenney      2025-03-31  42  	 * in ->flags to force resetting of the ratelimiting interval when
> cedfad9ced72fc Paul E. McKenney      2025-03-31  43  	 * this ratelimit_state structure is next re-enabled.
> edaac8e3167501 Ingo Molnar           2009-09-22  44  	 */
> cedfad9ced72fc Paul E. McKenney      2025-03-31 @45  	if (burst <= 0 || interval <= 0) {
>                                                             ^^^^^^^^^^^^^^^^^^^^^^^^^^
> unsigned can't be less than zero.
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
