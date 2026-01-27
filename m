Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C172877D4
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 20:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769546912; cv=none; b=t+Ve32IblGBMTe91Dnfp8ELUzkmLaAthUBwd2k3HLsMV0RSlKvbG6SYcnT6sZIxD0m5oaDPw7ozkh3veid+edmCQnsqJuVCO01d7a1OBaQj/F68R3w9FDbcHGHJGkIs6DIpJyxtx+qz8OOoRCDU04Z+Bf4I+ZEno0sBS373y9eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769546912; c=relaxed/simple;
	bh=VrpG/5fjPAJmxCRHqaT/bh3KQR0TfOmqRHxxtWMxe40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VgDTFkFAjiG7Xs/PVbsVehpiLej184RzYNsPsvyVQyRopzZu9ZQjr1WgszE5lJ8yMgEsAjAFNU9L6kIEHzjrhQZt3PY/EOzlsPWJb2raIDRViw211PbKahVHuKH6vpD09YXLmCVXvQ/iSGlmeFdlGa0xohY3YtJR/H5/LMZuJTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1yoyQ3V7; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1yoyQ3V7"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a76b39587aso3115ad.0
        for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 12:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769546911; x=1770151711; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxQ/jJ5+RCHFOsLeGzry/OBxfQLFoCbuarfI17mm5NU=;
        b=1yoyQ3V7pT2sdsa/54REeUPrK8k7VfAXZyfb86bAJV1x1K03j9f2Wc7a4a/2Kk2oe9
         NI7l+36Fcmg8TUJJmmX1P7uSZj8t/M/LJF1L0Z7aBBtQ83NOYJh/phe7w7kRc0FDuqvU
         tL12QOwIcVN1xxmIt28179NbgKEiQV8nvWXpofog6wJubuhvL9iajVRM9TBd4Ta+R1Wx
         42gAmkLdtAUBu1ZxNagbADy5Jf4P0Qm4HKutyrhAY29gV+buIN94tqo4lXmXj6lqePcA
         Un7Lfw93/39ex9FwhC7uadrGWjE6BcW/BRbqdxE2mjz8aLHWNvnSfDZCizZir8lvF0v6
         bQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769546911; x=1770151711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZxQ/jJ5+RCHFOsLeGzry/OBxfQLFoCbuarfI17mm5NU=;
        b=cDSKDpEhu0RCzisPMy36cEWc4pmbpzyQdZ84y6PvehGoHLTSLpx17YZViRHG/9iSKA
         wct01fu5+FH5WBOB8/iQI6kIADBNWZ+es3IkVpYkjKb/WhlStVecow4XNTdCOE9yj/WZ
         VQPMOcVO24O6tihndC8ZtSF9k8aXlcMquNJ3XsSsKrRAJi2OQVtfXVBG7QCcHKmElodQ
         2e4vF/0VKpaUr2nH7NX9FLSssVI1+zC4+awmzrJQDGktCkJ/1Zjo++I2jlSjMK9t5Umr
         wHRllsV2vdcxQMCaUlSM2HGgLsXOjAT5MHzIDXdbhDcC2NfVNxGvOYSI7EoDzO0Sx9SF
         72yg==
X-Forwarded-Encrypted: i=1; AJvYcCUQeXOUW9Trccsmt0OcqAdX7keZ2X5Fb6Qkz3AQu86RnTxbKe/0Q5zhoxh0QCSEcLhITrRw0T+XPrw=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywg5g7EOY5wT8fXVgK0LDliwUfZG6AkXK1+tw+Zb8Y8s6xmwKO5
	F2CqpslNvAih8rSfntvUOSpyBT+IbEDB1HFAlkGvN8v0b2FXe786ZgfBgfLY9TwLhw==
X-Gm-Gg: AZuq6aJsp6913lZ5Q771O0c0j7qLEuZsD9iWp4keMfgfc8RDCUFoaU3VlPwNhS7vgJl
	1Ao4F/J0IYRqOt5AsaDGG66pKR1Ir4B3iJ7CrmayoA/5B9vSQbgM0FzV0um5+iqEVkX9356LBH/
	Qa6s90bMmPF5GR9ZYmrV4zykYR12rKgAfMOwNDsHsyckrJqoW4TJOBk0i/BqJ6yCZG/KGftGopa
	f+xWZo4Wq7tGWMcjjL5KKNhOqdy1Wnx2aLd/YiXdrguqMmJj5uK7V19mpjWs/O0PrDwsa4Nv5jB
	3nliGQTt568gdSw6cKFp2GoLMOKKWcFMWMqVgy0tguGmdDBCWoVmiyQl9/Zun3jX4BwSfG79rHM
	JhH//CjQuBQfTlNTIJNnMFTEE6jFDFz22+/zCIlXcv5fCjtFouzMPK/zL78UPI1j9+omwjQeg4C
	MaZQIRSrQWj4G1R5i2CsTy0YhoMGj/O+LxCoOHk5Cdp5PeJ/rxecE=
X-Received: by 2002:a17:902:fc4c:b0:2a7:516d:18e2 with SMTP id d9443c01a7336-2a8708e53c0mr3360475ad.9.1769546910204;
        Tue, 27 Jan 2026 12:48:30 -0800 (PST)
Received: from google.com (28.117.125.34.bc.googleusercontent.com. [34.125.117.28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3e04sm2043315ad.46.2026.01.27.12.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 12:48:29 -0800 (PST)
Date: Tue, 27 Jan 2026 20:48:25 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	oe-kbuild@lists.linux.dev, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Matt Gilbride <mattgilbride@google.com>
Subject: Re: drivers/android/binder/rust_binderfs.c:134
 binderfs_binder_device_create() error: Calling ida_alloc_max() with a 'max'
 argument which is a power of 2. -1 missing?
Message-ID: <aXkkmSB06Blnk3kf@google.com>
References: <202512181203.IOv6IChH-lkp@intel.com>
 <aUO3ES90gStGvjxn@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUO3ES90gStGvjxn@google.com>

On Thu, Dec 18, 2025 at 08:10:57AM +0000, Alice Ryhl wrote:
> On Thu, Dec 18, 2025 at 10:17:52AM +0300, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
> > commit: eafedbc7c050c44744fbdf80bdf3315e860b7513 rust_binder: add Rust Binder driver
> > config: loongarch-randconfig-r071-20251218 (https://download.01.org/0day-ci/archive/20251218/202512181203.IOv6IChH-lkp@intel.com/config)
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
> > rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202512181203.IOv6IChH-lkp@intel.com/
> > 
> > smatch warnings:
> > drivers/android/binder/rust_binderfs.c:134 binderfs_binder_device_create() error: Calling ida_alloc_max() with a 'max' argument which is a power of 2. -1 missing?
> > drivers/android/binder/rust_binderfs.c:418 binderfs_binder_ctl_create() error: Calling ida_alloc_max() with a 'max' argument which is a power of 2. -1 missing?
> > 
> > vim +/max +134 drivers/android/binder/rust_binderfs.c
> > 
> > eafedbc7c050c4 Alice Ryhl 2025-09-19  130  
> > eafedbc7c050c4 Alice Ryhl 2025-09-19  131  	/* Reserve new minor number for the new device. */
> > eafedbc7c050c4 Alice Ryhl 2025-09-19  132  	mutex_lock(&binderfs_minors_mutex);
> > eafedbc7c050c4 Alice Ryhl 2025-09-19  133  	if (++info->device_count <= info->mount_opts.max)
> > eafedbc7c050c4 Alice Ryhl 2025-09-19 @134  		minor = ida_alloc_max(&binderfs_minors,
> > eafedbc7c050c4 Alice Ryhl 2025-09-19  135  				      use_reserve ? BINDERFS_MAX_MINOR :
> > eafedbc7c050c4 Alice Ryhl 2025-09-19  136  						    BINDERFS_MAX_MINOR_CAPPED,
> > 
> > ida_alloc_max() takes the maximum valid id not the count.  These should
> > be BINDERFS_MAX_MINOR - 1, BINDERFS_MAX_MINOR_CAPPED - 1.
> 
> Hmm, this is reported for rust_binderfs.c, but looks like binderfs.c has
> the same code. That means the bug has been there for a long time.

Yeah, this issue is also in C. Although it seems far fetch to reach that
number of binder devices (1 << 20). This still needs to be fixed though
as (1 << 20) overflows the max value for minor and I don't know what
happens then. I'll send out a patch.

--
Carlos Llamas
