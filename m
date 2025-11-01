Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2B6244668
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Nov 2025 17:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762017041; cv=none; b=Ld6zrtAM+AUGXNX6N46O5V6roj+omCCaozeDYURsD2VBFDvlfsBLOkDEFN8lsqxpJoB3SKzQMGSKfuHFOqe2UDF3l0WG8JIVsIx9Ty19g8tdt1kQ8KF17T6R+8L+JbTx2UWxCa1yc7pxsks2CbkOFfRxMtHLSNe3gsPWYg6ystQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762017041; c=relaxed/simple;
	bh=ZU+B8diip8WEbhgeqZgVBl0jAv+RKTsNJeccgokeMwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KHNGTaZqzR040Vg3oCDvPyH6+sW7HsD/nzWWnXiT/j9Hj0GcncVBGI9iY071ofvU1ycRZlq9SHDiChYZKgxmfFc3gSoQFxSzhk5CRQb2Luk/Xj3+5wf23UIwChXq/Ln3PwNGolgEurAQbl9Kpc0GXQF93dxSyi9eNFl3tLbsp1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hFZpDGWC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hFZpDGWC"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4770e7062b5so22929205e9.2
        for <oe-kbuild@lists.linux.dev>; Sat, 01 Nov 2025 10:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762017038; x=1762621838; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uq74eKvJ0jeposcEtzO5+GUodFFYwYCHHX7U8DBS+Cg=;
        b=hFZpDGWCowl4kGGSTXKs0ygJTBQEnUkhdNC2LeN9p1Xk0G1g5sfWnSXEyU/RzBx/iq
         cIfDVbK/3nz7hKjqwqRMVmqWwbRXhqJtyzaj2cCZb0xVZUMvbcw7ltOUH0mr1gKeCTca
         KMzIftgsBDdDybDrcl4t4CGDzu2Kx6y28mKVWnBvUBtPdN3mmPFjun8jMBo20s+KbNLx
         SfoTwXvvFYPXqsc7DPKE0aAU5HM/OMGbNsib6cFBtOjeNYBQizCvyOI8z0uePF+LMHo+
         NYcLj14To/bV61Ayog+hJ7LAL/qtn0VqOfajo2A93IUAyTBSVtGEABQN4EwUbZVPZyF5
         0JLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762017038; x=1762621838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uq74eKvJ0jeposcEtzO5+GUodFFYwYCHHX7U8DBS+Cg=;
        b=enGiLcX0jP5ghbZsx3gWrRhEX4uVA7oKpFSjn6buWkWRwU3A3+DosTAl3mIKwgyqY/
         MdhAIgl9kxiJobZjtAhCYamnUSzZ2G+eHiRwcRvLqYlDzSLBnIucr+lBUujGsJzkPoay
         qH5q4DOB+0B0v19htBfr3Zl9d8bYtuiAGO4ftivK1by6x8NPKLbPe34YaZz+wraR4mWp
         WYbWKT2g4ZImc6ryunx7mwaEDLQmu4LqG9RpWB8E+j+eWvOnQMlt9DtOW/1XjJi41RxR
         id2mScQ42oiQsq7GsNmqGnaGdjGI4BnOqLexAJV/v2X7Mn0eoznkgLiKzAgk92Ntu2r1
         X60w==
X-Gm-Message-State: AOJu0YyOGHXuGqXRpmUF+eP/7xbv7ObdHu19ieMDEBI+4MokRJfKFjT3
	hq+CuNKfZweNDlPstA0DreQmbFeb2Q9J1c9UBJinid7x70Xa0qNcs/kzarPKh/d2Fu4=
X-Gm-Gg: ASbGncsrp9+qMGIL2pZvNTyPT9G50c1ppaDz64rtG5GDoOy0HW9Zzim0JpC+SOFXEC3
	ENtz1iTylwZmEbPXgc9IiLazaBwiQKM1G/Uku3n0tTX8PwxqRpYWAUFTFQNaQxrdtz5b+0LDzab
	gNSngKDDbCvy8ijph833CMp3otQKmF3OpPahoJ/fU43Xi0w5Zm+xPLWyagWpYoPRYtgllE1Tz+u
	+Dw/ASQ06U/iIsUqgj/D/hhvGlAmkYaA8zEtgpoqoh0ExLprNjqTW2eIpgVE7zb7DAsG5RusA72
	/rHurCE3GFiJFTWhrPrIb+GcUuRk5FMyouR3Cpli/Q42M4f5aTauJDdU+1RCI8zn5aslQLICJNw
	f07kttVrb+7gAyBUJfoYR3UHLPXElVLf58jWEcfEoP9MAeZ8xD2Nb1iX5Ss5wfhroJkA0H0d+Dq
	ALzWVokwUajP0MORV/
X-Google-Smtp-Source: AGHT+IGv0uSR0v1hhSAx2GYRMsDrrYeSeRA7g62Ym9r2SphEpFPHMIVpJ6YWfLDNq7gaovk4mD9ryQ==
X-Received: by 2002:a05:600d:4393:b0:46e:32a5:bd8d with SMTP id 5b1f17b1804b1-477331db3ccmr40988945e9.3.1762017033060;
        Sat, 01 Nov 2025 10:10:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4773c2e677csm58418305e9.3.2025.11.01.10.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 10:10:32 -0700 (PDT)
Date: Sat, 1 Nov 2025 20:10:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Avri Altman <avri.altman@sandisk.com>
Subject: Re: [bvanassche:ufs-lrbp-as-priv-data 27/28]
 drivers/ufs/core/ufshcd.c:7594 ufshcd_advanced_rpmb_req_handler() warn:
 inconsistent returns '&hba->clk_scaling_lock'.
Message-ID: <aQY_BE1SlUh8jxkq@stanley.mountain>
References: <202510311328.Is1wMfkq-lkp@intel.com>
 <5dd16de9-4594-4b42-b912-d56c3ce6868e@acm.org>
 <aQT5iXgmRCzaa_xZ@stanley.mountain>
 <fd51be38-8000-48e8-a5a0-0289904d4756@acm.org>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd51be38-8000-48e8-a5a0-0289904d4756@acm.org>

On Fri, Oct 31, 2025 at 11:23:39AM -0700, Bart Van Assche wrote:
> On 10/31/25 11:01 AM, Dan Carpenter wrote:
> > These are from the zero day bot so how they are generated is mysterious.
> > The zero day bot thought the patch was 3 days old.  I think someone did
> > a merge or something.
> > 
> > I re-ran it on that branch and there were three warnings.  The "literal
> > zero" is a style issue thing so I haven't published that check.
> > 
> > drivers/ufs/core/ufshcd.c:2955 __ufshcd_setup_cmd() warn: variable dereferenced before check 'cmd' (see line 2950)
> > 
> > drivers/ufs/core/ufshcd.c:6849 ufshcd_err_handler() warn: inconsistent returns '&hba->host_sem'.
> >    Locked on  : 6696
> >    Unlocked on: 6688,6849
> > 
> > drivers/ufs/core/ufshcd.c:9035 ufshcd_device_init() info: returning a literal zero is cleaner
> 
> Hi Dan,
> 
> The inconsistent returns issue for hba->host_sem has been fixed on Martin
> Petersen's fixes branch but unfortunately that fix is not yet
> present on his for-next branch.
> 
> I plan to include a fix for the "variable dereferenced before check
> 'cmd'" complaint.
> 
> Is it expected that I don't see the above reports if I run smatch
> myself? This is what I see if I run smatch (commit 2fb2b9093c5d
> ("sleep_info: The synchronize_srcu() sleeps")):
> 

Yes.  The dereference happens inside a function so you need to have built
the cross function database to see that one.

It's not hard, but it takes a while.  smatch_scripts/build_kernel_data.sh
You might need to rebuild it twice to see the warning...

https://staticthinking.wordpress.com/2023/05/02/the-cross-function-db/

> $ make drivers/ufs/ C=2 CHECK="smatch -p=__kernel__"
>   CHECK   scripts/mod/empty.c
>   CALL    scripts/checksyscalls.sh
>   CHECK   drivers/ufs/core/ufshcd.c
> drivers/ufs/core/ufshcd.c:1536 ufshcd_clk_scaling_suspend_work() warn:
> ignoring unreachable code.

This isn't supposed to show up.  It's seems to not be parsing scoped
guard correctly...  I can't reproduce it.  I think I'm on the same kernel
and Smatch release that you are on but I still can't reproduce it.  It's
not something I have seen from the kbuild-bot either.

regards,
dan carpenter


