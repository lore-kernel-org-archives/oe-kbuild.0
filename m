Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773816F06A;
	Mon, 18 Aug 2025 07:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755501503; cv=none; b=jcNRV1orMqzhyXeNLaUyS+B7B2fFLjTnApuMSX4McH+9vzWxyPNMJRunBhB/s1RlG0TMAaMLWVyfzt06iWFfjeIMUZoGZI6ytwkC5vFtmFe/orJ32gtRXisBfkGJfdF8KuU9WoYJz7VbD7Oq5l5t0VQbW30rgQhHuFn4krp3GEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755501503; c=relaxed/simple;
	bh=uo2LGecio2XKjFgaUIDp7078bi32dqNSjRneM4auLQA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qNaIsOpYWkaVAIsg+rgSlygthiUhgI1HWLZvAo1eJlyGVsTAvGFwFvRcSXg+3qri1mYj7kPM73QtiwfX480eV+eEI2ZLsMAYXKEGpueIXZQZaFGtLJyHwl77wvrTydGKdASGZxZq8V9Ob6ET1E2YC92BwfNpCKuX5TJtNAkFMbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FqEbJsdr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FqEbJsdr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755501502; x=1787037502;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=uo2LGecio2XKjFgaUIDp7078bi32dqNSjRneM4auLQA=;
  b=FqEbJsdr8tOHM2Id8F0iyNBmlniz8jA6hTxsmkQLWBfWgNG0wy6NQkv1
   HPm9lNXwXZp7ALZHrlxYbVV7xKJB6s6et7BBFeiS1DRqoDU0TGsTKAene
   DVjlE41kKpN07GsNLu9m7Tqtzdpx/B691iPTn8NE1BFoZLzHgTwFmPve2
   BMVIEyRHjpJz9CRPLKHTrCiU6YdV9gZfJw82G8Qyri2FTl/auo3NoCjN/
   V+dwR59KO8bHKHAwXlYhh67fC7kbNnlz9Yhfu04wTqQKg4vppMfsrC3xh
   /W+Gui/j27GMHOIvfe3RVWExH22Hz4GADiKRQ/bt+SkIZckBk27OYn7NE
   Q==;
X-CSE-ConnectionGUID: I9+kY6kqRjS3cG8DRIqr/Q==
X-CSE-MsgGUID: kP5xkOyATQq+oH2Vy1RVbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57791794"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57791794"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 00:18:20 -0700
X-CSE-ConnectionGUID: 9csczV9rQ2ixQDNLSEfxPw==
X-CSE-MsgGUID: kZhFGBqcQJiMKhJnvXveng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="204670544"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.188])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 00:18:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Gustavo Sousa
 <gustavo.sousa@intel.com>
Subject: Re: [drm-i915:for-linux-next 11/18]
 drivers/gpu/drm/i915/i915_switcheroo.c:21 i915_switcheroo_set_state()
 warn: variable dereferenced before check 'i915' (see line 18)
In-Reply-To: <202508160035.hmzuKiww-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <202508160035.hmzuKiww-lkp@intel.com>
Date: Mon, 18 Aug 2025 10:18:14 +0300
Message-ID: <6be63b523eafadf77d38d8319a011951c283bf9e@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 15 Aug 2025, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> tree:   https://gitlab.freedesktop.org/drm/i915/kernel for-linux-next
> head:   63e0b17ae79a4365e874d7e2ff3816db2e6d55b5
> commit: d2e184f8e16ab85876ddcc0779358fbfe5162414 [11/18] drm/i915/switcheroo: pass display to HAS_DISPLAY()
> config: i386-randconfig-141-20250815 (https://download.01.org/0day-ci/archive/20250816/202508160035.hmzuKiww-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202508160035.hmzuKiww-lkp@intel.com/

Side note, this triplet of tags leads to checkpatch warning:

WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately
followed by Closes: with a URL to the report

> smatch warnings:
> drivers/gpu/drm/i915/i915_switcheroo.c:21 i915_switcheroo_set_state() warn: variable dereferenced before check 'i915' (see line 18)
> drivers/gpu/drm/i915/i915_switcheroo.c:55 i915_switcheroo_can_switch() warn: variable dereferenced before check 'i915' (see line 48)

Thanks for the report, fix at [1].

BR,
Jani.


[1] https://lore.kernel.org/r/20250818071605.2541523-1-jani.nikula@intel.com


-- 
Jani Nikula, Intel
