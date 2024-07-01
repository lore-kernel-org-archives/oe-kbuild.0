Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E00126F1E
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Jul 2024 15:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719849268; cv=none; b=eZHqvEnH5KXlEE73eWps3TxQRhtRgReJeToQk0ydVRgD80DdBHxmt+u6oKqCDd8MssHtqG2YpioImjzlDHBH2ySbk4snouDYdVVU35lktX0jNqoWy9ZmSlOiaZawB/ZTq8dc22mooay3LyQAVw7Z78J8QEua2tntVE3fNNqbGcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719849268; c=relaxed/simple;
	bh=JNdJrXWtWcZkPHjamD5v8fTHqAwrFBBTQ484HlJQPhY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BlBZ0LokSVUKQl7+LuwVoCJwp8WhmA/ZuJBMGPEAnG+/YvbTkZscRs7SxFEYWcnRKqMAGR1Z2mv7uCz9f7nA9aSWJs90EvywRIRoQVM8RDBCOrKOh7P5oPqvZ1cn4XOpluzhnRur4ZoXCzloFBa9DVYAwl78fm6VWRvs1eewAwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QpYUT4nL; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QpYUT4nL"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-701ef03185fso1817324a34.0
        for <oe-kbuild@lists.linux.dev>; Mon, 01 Jul 2024 08:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719849265; x=1720454065; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=inKe0gpccZBgzMijx9pxHCKKEV+WntLBxDDl6NG8580=;
        b=QpYUT4nLw61/nBh9UlRsmZIFJO8V7OR1mbFxr7kpj5G9EHrWrwkXNBHrre+9cPzbB+
         QRVpXqJbYnSUyTKe3nq9Qz7sNaiHhfIixedq4L2diDFoku6y2GPaqRFzB39oT/hOvHD9
         Tz0qOeMWy0jqudA0P6k7xWzFxsiydIUUH23MxZD2C+yKsLxkkCVw9T/cmvEpVYA4Cd5k
         Ppp2vYj64PKKhtjDdtsi+W9wrJT7t33jr3s/m6FTq8G8zRW3IRo6onpTIN/i7Pz++rAW
         UMKDN3icsh4KGAcqL1A3zmZ/hiUzd2modCTD35nPMfV25XwRGG5okmGin2uGhyZCIf31
         LI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719849265; x=1720454065;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=inKe0gpccZBgzMijx9pxHCKKEV+WntLBxDDl6NG8580=;
        b=wHMf3cvEDpHu810mJaQxQoRm4D302tDAztBGDkPkC4RGk5E/H8p2B9rIcdYCVrAdtr
         0ypzgc9fpJSpb26x3Wbv4/Vmmo7JexS6XY73T7f0gzbIM/iYGznM0uKQ7IEGUT5FqEq6
         liTWsV7/keo95qhbtkdokFJHJjKFU+dcJ70EHTrXjzbM06O5NeIc36zz1ADL052lfHJW
         tqxprRw0Qx6bqCRVG3XsaqiHVbO2mDcTlCyqmOZT7BspBCtg8eKgC7ELJdK3JUNEyMkG
         HF/ByLz/vZ1pOB3nrM7oqJV2zD9FfV0iFIBvmVUOa9VcNJR0C9j3+UcZdol7ah1tEQ9z
         YLDg==
X-Gm-Message-State: AOJu0YxE66frB5ByTSWmaegwH1LmSfECMKntO3ubGXjS7sYbPfKt9MsK
	T4mBdCeUlaEho1uo4Tb9BqZfDNX1qg3s5jgFNOrX4sBuFGNlDN4X1N1vY3G6VR4EuER/Gyc+zt3
	P
X-Google-Smtp-Source: AGHT+IH/5NacSQigA3BVXrUsBYR+sgs0GU45+bLwXIZoiraKUNm9btupAKR1PoLq0slAixB/ETs5mQ==
X-Received: by 2002:a05:6870:ec9f:b0:254:8bb9:d0bf with SMTP id 586e51a60fabf-25db3428fbcmr5907324fac.32.1719849265682;
        Mon, 01 Jul 2024 08:54:25 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:e8c6:2364:637f:c70e])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25d8deb56f9sm1806844fac.0.2024.07.01.08.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 08:54:24 -0700 (PDT)
Date: Mon, 1 Jul 2024 17:54:23 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>
Subject: [robh:for-kernelci 14/21] drivers/irqchip/irq-msi-lib.c:133
 msi_lib_irq_domain_select() warn: variable dereferenced before check 'ops'
 (see line 130)
Message-ID: <86549955-085a-4c36-ae52-f7138cc0b49d@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   0abda6ec2f639084d6dd4a568683e0b1b70f604d
commit: 3bb490967f4f337c9c1724b5442a1e09fde1d195 [14/21] irqchip/imx-mu-msi: Switch to MSI parent
config: powerpc-randconfig-r081-20240629
compiler: powerpc-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406291820.O1SulCwh-lkp@intel.com/

smatch warnings:
drivers/irqchip/irq-msi-lib.c:133 msi_lib_irq_domain_select() warn: variable dereferenced before check 'ops' (see line 130)

vim +/ops +133 drivers/irqchip/irq-msi-lib.c

b8577a042dce35 Thomas Gleixner 2024-06-14  120  int msi_lib_irq_domain_select(struct irq_domain *d, struct irq_fwspec *fwspec,
b8577a042dce35 Thomas Gleixner 2024-06-14  121  			      enum irq_domain_bus_token bus_token)
b8577a042dce35 Thomas Gleixner 2024-06-14  122  {
b8577a042dce35 Thomas Gleixner 2024-06-14  123  	const struct msi_parent_ops *ops = d->msi_parent_ops;
b8577a042dce35 Thomas Gleixner 2024-06-14  124  	u32 busmask = BIT(bus_token);
b8577a042dce35 Thomas Gleixner 2024-06-14  125  
b8577a042dce35 Thomas Gleixner 2024-06-14  126  	if (fwspec->fwnode != d->fwnode || fwspec->param_count != 0)
b8577a042dce35 Thomas Gleixner 2024-06-14  127  		return 0;
b8577a042dce35 Thomas Gleixner 2024-06-14  128  
b8577a042dce35 Thomas Gleixner 2024-06-14  129  	/* Handle pure domain searches */
b8577a042dce35 Thomas Gleixner 2024-06-14 @130  	if (bus_token == ops->bus_select_token)
                                                                         ^^^^^
Dereference

b8577a042dce35 Thomas Gleixner 2024-06-14  131  		return 1;
b8577a042dce35 Thomas Gleixner 2024-06-14  132  
b8577a042dce35 Thomas Gleixner 2024-06-14 @133  	return ops && !!(ops->bus_select_mask & busmask);
                                                               ^^^
Check is too late.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

