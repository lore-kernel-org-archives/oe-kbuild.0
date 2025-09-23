Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445582E92BC
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Sep 2025 08:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758616049; cv=none; b=V/WgvMVFhbBKZ/pRM32u2MY50TrtQMgJojMt/t0NRQE56c5emRn++15wx4JYnncbHQtUZY4QYx7azdPOiOlsXKJx3KGHGRMb0sV5G/Hdeq5MM03EZ0KKUNfIODxgvUVPqajEXa3kvJzTDPkUB2TXIXxEAPPYgoN3rum/xjxRHsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758616049; c=relaxed/simple;
	bh=de1TjmpmNLVfaIbCUlTyBLSbs0/RC0xFOPfYXv0tq2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBEx5qRfyGuDlJXregVwWa9xwNHO+0VrlJb6+gShoh28jcGC/lQuLC87GuQI3g07eCUokeHKxkZxO3LsjmAqINg06LRxLvNNhdHz41X/7oPS3hl2hZgc5yBJsAM/frl5trTwpZqu3pADRPc0pGAo91HlqyYghKtURtQDGHSaQf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=crsYf67L; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="crsYf67L"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45dd513f4ecso38611155e9.3
        for <oe-kbuild@lists.linux.dev>; Tue, 23 Sep 2025 01:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758616046; x=1759220846; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gpGYqVi5hf1kqSDhOzouIOkYFhp9lAGx8gTYX7wSjXI=;
        b=crsYf67LckTogakknj/9QqY0SDClp7MgkT/INjOCMcBSyToLjdLRWiTSBl58JSlBNT
         GXS9A6+be4Rkgt8YLVEOoTiEt6A6tfaMKpGBfP93xUzTP2RbKiUYseHd7MER1xsflEcU
         2vX3sxzSou/Oib5S1vjIhVeIWNMuPVbhEQ2C4g9lT3CYaI18xPDKJmRWeug6mu8iThRY
         6aD+0JdMT3MtCG5tw0mvyP7/fOFLG+kX5dgtCQFXFQsrKTZ5OAMhxzsvv3uagshSUBcS
         h3qzC4gH2w63W2Ac/YOONBzjSnPB3cwqjPilQ4yfTDADlSey7435vINlz1d4RJdHKN0e
         V6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758616046; x=1759220846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpGYqVi5hf1kqSDhOzouIOkYFhp9lAGx8gTYX7wSjXI=;
        b=pkwG+fNiui9nIL5nWMzu+6eNjtHcpTyywJJcQwNppJAMGOsb9B2MAYm1uQsnAYvJ/Q
         E8p9xpjD1qIPTYwJRK31Wj3iT3F8Z4fmY4gtzgPGHr03c+2ix39iCjPW9zEsAJJXUsiG
         O72BOWKZM6YouCwJ94X1qoe4QznRT0g3ZYdTWdPufmtGbNFi229WLaEeuc7O7UE10IfZ
         4483Ev9dC+OvjwtZi8wjXwxO1wiyGLo+6gVgU05OyO5uTuCniaAGaSKRUwtOh/4bOiLe
         AuvyLK6aKnigIN5xretOPIcJ0pZSPlz5HOHpIOZ3a+ZbTk/1fHhR1uUPJEhxhiRo9H5Q
         m55Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4s/Sizl6QCoAEbbVneyGvveunG0MbX9hvyZHcasRvODUzibEAo11aTFPONW45ZZUaqCb6qfR7uV0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVXQxmA9XRBb0pMSq0Xb0wqsnrZslErsBWocL4ygE7qGS3CveB
	R+I2YM2JWUJEzXLhcl3gRoOH4w4cUcE8PZJ32I8yt3rTM4alruj8Bc3ln/Xnn9YHG7k=
X-Gm-Gg: ASbGnctUM5yLlxXFhEp7WhcnjFXudNK2GHcujH40U/L5Zji9XptWZ4luGzmJiWrzxom
	9bSS7UR5qzzhcFc6ZmSBQYZZINJGHZmxDMWvTptjFkim14iEfQFV7DDmyfeE91IeCJIu5VzAAUD
	Hiak1FM47rWpCBANlVicso+o5/AR3fSBxbZeYghhh+Otf4kqrte/PigTrKLwuOBUfc2oCgX5dPR
	eM2q8RnrcFFNyFDcejrMjrdr8YpHZyxZuZ8ieqBNN53yuCE4k96t7bYkgcHlJcwzJQMKrD5uSwI
	3e6ALXv3k0PSeM993IMY2oCwTpq1rnlq37hfBqz1NxuimLBKG/M197YnF/v0+vRDjWo1YpDL4BD
	4PtXjLrvg2CYtPafs/YLLttg6ssYPQj4vnCWLRwc=
X-Google-Smtp-Source: AGHT+IGWAo9jrh5BzHBdYB7EPethaAYsyhu+UjZUGORfpar6nubw1VsXbHY/5Rg9h0dxbvNaHHjFbg==
X-Received: by 2002:a05:600c:198c:b0:45f:28c9:c4aa with SMTP id 5b1f17b1804b1-46e1d97fb07mr17761725e9.9.1758616045492;
        Tue, 23 Sep 2025 01:27:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-464f5a286edsm261270095e9.16.2025.09.23.01.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 01:27:25 -0700 (PDT)
Date: Tue, 23 Sep 2025 11:27:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: Will Deacon <will@kernel.org>, oe-kbuild@lists.linux.dev, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [arm64:for-next/perf 5/28] drivers/perf/dwc_pcie_pmu.c:418
 dwc_pcie_pmu_validate_group() error: uninitialized symbol 'time_event'.
Message-ID: <aNJZ6SqYvBfjZlrZ@stanley.mountain>
References: <202509231223.gZsX6Eio-lkp@intel.com>
 <a2bb5fb1-f94e-cdea-6db5-86d78d2a53eb@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2bb5fb1-f94e-cdea-6db5-86d78d2a53eb@os.amperecomputing.com>

On Tue, Sep 23, 2025 at 12:55:01AM -0700, Ilkka Koskinen wrote:
> 
> 
> Hi Will,
> 
> That's cleary a bug and I don't know how I missed it.

Because we disabled uninitialized variable warnings for GCC and because
everyone has CONFIG_INIT_STACK_ALL_ZERO set so it wouldn't show up in
testing either.

regards,
dan carpenter

