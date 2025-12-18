Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6C62F1FFA
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 08:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766045463; cv=none; b=nDYQ5pybfYb3FNf3iK5KbrpMXVS8MVtpb2wMMOnaGblj/7IpA2SldvRjhKXzCFxwkisDUeToyTXDvBSTNWB8OLw9CgfGKsyhzYFWiQPwOtzdyWsITQpxhDQJiC3raLVc+NT3F3E+ANRrv0gbOh9iaUlFEO4nt8/Jg1wqCLTSBKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766045463; c=relaxed/simple;
	bh=uiVn+PFW6BDRwA6pNPwXEhvpVvHeUkiEqBZQkJcZb9o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EliIYCVz5jbPJ48ihqiOCaxFOhgzxifpRcKJzXiomMYV/HZKy5VSMeNYWbXhWJzf9ZXqqzwvAiqwUUVEyGAyviIbOTbLr9hZ/w8IEGq2ewG/0OwTrIYz7uM2RHufn0stB6Aiu92ZHXGh06Pmv2H/UWZwvpV0Gw34oQAi1rhyEBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mw2YQSL7; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mw2YQSL7"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-43102ac1da8so224607f8f.2
        for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 00:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766045458; x=1766650258; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lMR4ru/kjMK2+W8gXNHMkf+DOJfulikDiV7jP3bza+g=;
        b=Mw2YQSL7HxG9/k7CBlKLMStw1hOkiPO3Hr1I1c28mfTcMurImd3z/2J9e5hcF5dXcB
         5wsDef8Kjt1XG7+judkbo4KxceEj0HJNs/eUGsJcgm0HUsUvxdXZbVLpPuXJ2pgeKh6z
         Aevi4Yf+h0KQsLA85xg9Ho7eKGEkh6HWF/adl+HQjJmsJfP0OibfYwQNnWB/ylY7qwnx
         yP+PIudU6XwZzojyK6ikrkbODjP89a80T7GNBJkHmga0kBedWWxVpvySbABOLpaLCBsF
         +20iErWrw3U5Z5P2OlNOGl6xsVIVudDsewi+crcT4Lj5/zeXAlnvCk9AwLBnccXbAMsB
         5pmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045458; x=1766650258;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lMR4ru/kjMK2+W8gXNHMkf+DOJfulikDiV7jP3bza+g=;
        b=oN+mGIfPJtClR2HnYZgOSZuWOlO79aecvF84DM9SNDlv3j6scdwAT61uTfy79iJDWD
         582QJw6WWhjGzi9PQta8fhI+CsaC5vO9fCaEnmB82UtQnZv8V+NWaAFJZPnnuHXzQtqv
         EuO5gzFqAXEifPKFufGjDa+Aay1vy5TE0kg+fO3jAO/tYQs8M0vAbGaGHg9ZWk09M/AR
         XQyMGhGJoUR3qfCPyldaJZ18QHjpgHCiKuRiNbl6gdlkZqaXXw+sR804DibpR+7b3RO2
         1z69nnTHh90Da5cpPgMm7p22XBWnXs8UPozGttZpXUC1H8RJxCq4/4OqbgorQro/PG3e
         KcMg==
X-Gm-Message-State: AOJu0Yzm64Sp0xaBakHC4xM0OMMwTAjFCN3jXtJ9uea7bwONdqZVg+r6
	LJS6dwJmBmDe1XShlWucjFSxQ2USTdq2zcSaPLuYOyICNicM55nAh1/q8Sc0kKyFhG2P1hOamQ/
	dbQx5vf3FP6wLEYBXIQ==
X-Google-Smtp-Source: AGHT+IGx+neHgD8/NWVc2BOJoOLqIncjiW6qyu9IlOCRErxi0s4CHpJulltKfG/fv8DGitKvrf9HtVpcsb8LpJA=
X-Received: from wrbey10.prod.google.com ([2002:a05:6000:24ca:b0:430:f9bd:2c6a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2012:b0:430:ff81:296c with SMTP id ffacd0b85a97d-430ff812d35mr10959601f8f.34.1766045458352;
 Thu, 18 Dec 2025 00:10:58 -0800 (PST)
Date: Thu, 18 Dec 2025 08:10:57 +0000
In-Reply-To: <202512181203.IOv6IChH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202512181203.IOv6IChH-lkp@intel.com>
Message-ID: <aUO3ES90gStGvjxn@google.com>
Subject: Re: drivers/android/binder/rust_binderfs.c:134 binderfs_binder_device_create()
 error: Calling ida_alloc_max() with a 'max' argument which is a power of 2.
 -1 missing?
From: Alice Ryhl <aliceryhl@google.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Matt Gilbride <mattgilbride@google.com>
Content-Type: text/plain; charset="utf-8"

On Thu, Dec 18, 2025 at 10:17:52AM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
> commit: eafedbc7c050c44744fbdf80bdf3315e860b7513 rust_binder: add Rust Binder driver
> config: loongarch-randconfig-r071-20251218 (https://download.01.org/0day-ci/archive/20251218/202512181203.IOv6IChH-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202512181203.IOv6IChH-lkp@intel.com/
> 
> smatch warnings:
> drivers/android/binder/rust_binderfs.c:134 binderfs_binder_device_create() error: Calling ida_alloc_max() with a 'max' argument which is a power of 2. -1 missing?
> drivers/android/binder/rust_binderfs.c:418 binderfs_binder_ctl_create() error: Calling ida_alloc_max() with a 'max' argument which is a power of 2. -1 missing?
> 
> vim +/max +134 drivers/android/binder/rust_binderfs.c
> 
> eafedbc7c050c4 Alice Ryhl 2025-09-19  130  
> eafedbc7c050c4 Alice Ryhl 2025-09-19  131  	/* Reserve new minor number for the new device. */
> eafedbc7c050c4 Alice Ryhl 2025-09-19  132  	mutex_lock(&binderfs_minors_mutex);
> eafedbc7c050c4 Alice Ryhl 2025-09-19  133  	if (++info->device_count <= info->mount_opts.max)
> eafedbc7c050c4 Alice Ryhl 2025-09-19 @134  		minor = ida_alloc_max(&binderfs_minors,
> eafedbc7c050c4 Alice Ryhl 2025-09-19  135  				      use_reserve ? BINDERFS_MAX_MINOR :
> eafedbc7c050c4 Alice Ryhl 2025-09-19  136  						    BINDERFS_MAX_MINOR_CAPPED,
> 
> ida_alloc_max() takes the maximum valid id not the count.  These should
> be BINDERFS_MAX_MINOR - 1, BINDERFS_MAX_MINOR_CAPPED - 1.

Hmm, this is reported for rust_binderfs.c, but looks like binderfs.c has
the same code. That means the bug has been there for a long time.

Alice
