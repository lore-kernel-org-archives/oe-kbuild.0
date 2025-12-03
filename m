Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E1520468E
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Dec 2025 13:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764767340; cv=none; b=sAZ5yuUfMPLEqHqlf7tX+5G8mtrBTm5vRlJCgym34GkBDFIex0llgv8WGnOkEniJ++DJryr4iHFriNP2REYP0Nq6/ejywiIeZVQnKZhW9eW6nKpijxNaVBq1kznbq19Hjr8EOiRjtMwX/vj98qFOW5bR+vPwQMWFn5JYaKlBiuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764767340; c=relaxed/simple;
	bh=73F4wVh5wZ9ZfLtgeFApDwkAfT8PK4Peea2Mdylz3Q8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=XfZkZfx5NMTdMgGwiP/hM/pnte93LHjliVvaWOTdW3ADy/HmT0a1yW89zGzypQZP3OnTkhhtNJkYUWLnOTrzE7JCYCMSvBgnhkdExaO+FlZIwRi9a/UB/3niWD/SeSEkOe61BbX0LJuFcpvof918c+Ek/9Ac/7QhDIqKgHzZY54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=pLtw1EMv; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=sNPl1CUV; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="pLtw1EMv";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="sNPl1CUV"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1764766732;
	bh=73F4wVh5wZ9ZfLtgeFApDwkAfT8PK4Peea2Mdylz3Q8=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
	b=pLtw1EMvqNwuM/nrmfYkD2cv3uN7qJdQzbZh24+OjDCGeRt9nFL4Y8WzxgOznErkr
	 dR5+z26AwmZl2YVRoBP7bVdhwBecf8ubpu6RsTrjI8NuyCvGi4Yuec8vRNjZl4xWTl
	 jh3tQW7vDWygnceAaalTNAl3tgdbJUWo/E4qb+XSsm3zvRCao4dJ1T4KgWf6akovU/
	 9caFjKDB0nw3TvVYgwhNrf767Jq57F6JWAA+OADtj4cclUzlAAlIIV2iuS9yuBS/AF
	 wZ9ZXpsQpqVQHy/XS7W5i05a/6eWqpZgQsgq6IFYV1K8FDdI7pwWuVuC2akrjSMKrE
	 lHaUYihexAolaK+uI7uI9ZG+hwrvoO5jj69i8+sWkIFwO88cpMbAtu2V23USBNXmBg
	 wopcZ2G63oA0APixswG7rqKcuTJUxQuB4oAPc/bz8aFbFDvKzdXY6jqFo46M4OWGWh
	 16ppRXsiz0ohvclQiZ6e70ntjoMteooeYm7SUJPV+Vv7ig2kmEEzX5qqnbKQ1aXaWa
	 TDipxGlGjajATUBZ9JqQX8vIQ4+/2V6Lxyi+CUP6XzsBW0Nhy/+JeTuX5201nIZaDc
	 QsnEk3pX8R4GomsecKLk+n+dyxHDiA1qYbjHA5dzr3tFuwPqJghtzGio2CjSGrPNNw
	 fnIjJ0bVOSLpNzsRXanusoBM=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 9E2D21E60EA; Wed,  3 Dec 2025 20:58:52 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1764766730;
	bh=73F4wVh5wZ9ZfLtgeFApDwkAfT8PK4Peea2Mdylz3Q8=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
	b=sNPl1CUVZrJ2s3sqA5/ZFmNlxllacCxZaynEPgRwIUgOnHhk/UKjS80alifDt566+
	 YcpbjXNCgPubSoGbZNXjivy3ZX2wcb3TihgI9yTzGpRmHjFew8NfT5ImO8iP/1zSmU
	 /mrEWSqHzsXPXPd95wEjy2mWwxWKN14xz0DMCQmaZW6J6DLaQOpbaNVtcd0pMckIgU
	 rj7x9At5b/Hhl54k1ACJstct1tS/pWawEO8qw7woO2KCu2UU7na8VYZFsaxKZJqGNH
	 dEQeMjHR3G+++t6e3HoVryRqVnBMW4kM2k+XlH4GoYNmWHMXkvO1Gh39BOhcRMJH/Z
	 RVN9Zrqukuf1H62yDpj/5/csq8H/MlA7PSSsLNhk6s/hejPGgBEuxd0FPwpKeR0NqN
	 s50kNleIJOCKU6e3wzM2bTF5fWefOObH/DKH35t6vYG3IZYQvJFl2CkVMP34p+/1Y1
	 ox/NoSw5MuHbwTxlJhfDJbFfr71kLdFve2C2230xOsUjDyQTQ9GMJ12LyUaq+r8Kyg
	 ILJ0+CC9KTS2eRIndbpfC8qCqK7pC0Afr/ODasnLUMWfKHUu+FHisIdhUmD13oUQBw
	 rMfVkPx4d6hgtaAWP5gVODmVWbGOnoNoBfBMe6VbgWrCRFfuLB+hkw0oMi/iXvVjN1
	 +PLpu0L2pDgB1oAGnAp+CIHo=
Received: from [IPV6:2001:8003:8824:9e00::bec] (unknown [IPv6:2001:8003:8824:9e00::bec])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 8D40C1E5DAD;
	Wed,  3 Dec 2025 20:58:50 +0800 (AWST)
Message-ID: <86d2ea1f-810b-45a1-9ce0-ef571f6da0b9@davidgow.net>
Date: Wed, 3 Dec 2025 20:58:48 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: error[E0560]: struct `kunit_suite` has no field named
 `suite_init`
To: kernel test robot <lkp@intel.com>, oe-kbuild@lists.linux.dev,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
References: <202512031957.BoFx2PMx-lkp@intel.com>
Content-Language: fr
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Gomez <da.gomez@samsung.com>, kunit-dev@googlegroups.com
From: David Gow <david@davidgow.net>
In-Reply-To: <202512031957.BoFx2PMx-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

Le 03/12/2025 à 7:45 PM, kernel test robot a écrit :
> ::::::
> :::::: Manual check reason: "arm-randconfig-r121-20251201 results in various rust failures"
> ::::::
> 
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> CC: linux-kernel@vger.kernel.org
> TO: "Thomas Weißschuh" <thomas.weissschuh@linutronix.de>
> CC: Daniel Gomez <da.gomez@samsung.com>
> 
> Hi Thomas,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   3f9f0252130e7dd60d41be0802bf58f6471c691d
> commit: 818783c804bc051f7faf0ac226b5597f8259c6f8 module: make structure definitions always visible
> date:   4 months ago
> :::::: branch date: 9 hours ago
> :::::: commit date: 4 months ago
> config: arm-randconfig-r121-20251201 (https://download.01.org/0day-ci/archive/20251203/202512031957.BoFx2PMx-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031957.BoFx2PMx-lkp@intel.com/reproduce)
> 

The current best theory for the cause of these errors (which, alas, I've 
still not been able to reproduce locally) is the following bindgen bug:
https://github.com/rust-lang/rust-bindgen/issues/3264

bindgen 0.72.1 has been released to fix this issue:
https://github.com/rust-lang/rust-bindgen/releases/tag/v0.72.1

It looks like all of the test robot failures are from builds using both 
clang 22 and bindgen 0.72.0, which would meet the criteria for that bug. 
Is there any chance you could upgrade the bindgen version used and see 
if that makes the issues go away?

> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/r/202512031957.BoFx2PMx-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> error[E0560]: struct `kunit_suite` has no field named `suite_init`
>     --> rust/kernel/kunit.rs:291:21
>     |
>     291  |                     suite_init: None,
>     |                     ^^^^^^^^^^ `kunit_suite` does not have this field
>     |
>     ::: rust/kernel/alloc/kvec.rs:1244:1
>     |
>     1244 | #[macros::kunit_tests(rust_kvec_kunit)]
>     | --------------------------------------- in this procedural macro expansion
>     |
>     = note: all struct fields are already assigned
>     = note: this error originates in the macro `::kernel::kunit_unsafe_test_suite` which comes from the expansion of the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
> --
>>> error[E0560]: struct `kunit_suite` has no field named `suite_exit`
>     --> rust/kernel/kunit.rs:292:21
>     |
>     292  |                     suite_exit: None,
>     |                     ^^^^^^^^^^ `kunit_suite` does not have this field
>     |
>     ::: rust/kernel/alloc/kvec.rs:1244:1
>     |
>     1244 | #[macros::kunit_tests(rust_kvec_kunit)]
>     | --------------------------------------- in this procedural macro expansion
>     |
>     = note: all struct fields are already assigned
>     = note: this error originates in the macro `::kernel::kunit_unsafe_test_suite` which comes from the expansion of the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
> --

(...)

Cheers,
-- David

