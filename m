Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E330D3AA1BB
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Feb 2026 14:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770129901; cv=none; b=CN+3Bp87feoKlQvWlgP+ZQhE1tyj3D2BsXAG3+9oB4kUPOBGipCreKwWNuaI9gCgTItArMGyP88ACCbpjBHjJADYodgfwiAvcqwTegoCqwnRLV3wzYbr7caH82NJopdGvV+UBJLCTJMbk+MBlsKLCLYISCKDXwhB6IiPqWenURc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770129901; c=relaxed/simple;
	bh=rgrNsEhFZmqqZxIfpCwbCJV/Khr2lLXP6RzrKt4aUwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBz8dWz4rG7Qxo6uUusn2ykllgRMI76K9BhbcKKXVtDHxmyG0bO4ALbbITc1ViFMWopFUUz+S8k5b8NmKQOk7T9y6D94bQ2nOm1Wvf+cHkjfriRuabZztv+4V07MUm9wZXHX8U8I9xmZMzzIZAsqJE4y3rkPZQ7T/wSaZK4NwhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aMRgju3Q; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aMRgju3Q"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso44139505e9.1
        for <oe-kbuild@lists.linux.dev>; Tue, 03 Feb 2026 06:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770129898; x=1770734698; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hs7V6SWbek2ZeyeUQeiTszpmbvycBMvjXv7GzQyLNVk=;
        b=aMRgju3QYvfvwH9Yqs0gTep+sV/fbZFUmwDmqnsQvCUWC7GQweZ9qBNLTWebGiN0l0
         Hf5eGp1D4jJMywcj+OxjUSeia8R1zhEBl0Hq8ASY1CSBrq1/twMQB96KS3TPNI6x1YKc
         To6g4iyO2MjBZ89g8BrMDDO4OqcSTJ+EzkO2DrmU6OIoOvE1UOPMjwO8F9BPEVwur19W
         fCpXu485ek4JUl2LTFtsxwLbwxJP0G3jvO4dpueTMCLfeiAbu2mvvnQP3kFwXUw4WDkZ
         lk57nlE+fbTFUj2VDsPCJ9vpIM2zaHEotZheBmOtID3kp2zyQ7bY2L1uhtXpeM5p+IbT
         2FnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770129898; x=1770734698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hs7V6SWbek2ZeyeUQeiTszpmbvycBMvjXv7GzQyLNVk=;
        b=Dz7lbiYheornvA4dAenagRTuOGy9ICdd6NjA8eHxKMdr78z+MRKHhPQ6egjTCTwOg2
         57toNzV/I+gsHxqOw9uM+MA024+61eGDdnSHDx5nrRw9w3vab3iZu6Ajsx7l9RdbkUQW
         QJ3EBOChPvjwwuQZyCIlwRLuQOirgKM8+FXeF8Vhhvw/EXzGFgCdeHRt7bOl+noeDPLy
         jZNUvt/agV1wmKHAMSG3gGYWWsuOAN6HsfW6nUmt5pakYcqSd9gR1+rMH/MocFocpxJ6
         PEuIan6kY+wsrxvr5ecL58FYi3YbNOHSGcoQvPGQkOd97zSt7zEiZN0NJeaj1Jkeexf7
         3D3Q==
X-Gm-Message-State: AOJu0Yw2+LRTDBE9ASCMoRx4lgK3Um+QQrBbqXpwuyEWLnw2Y461o8Fe
	WESSaRhKm65tJBq3EwKs99NBhaJr8zH9pEhAa6QIYjvXbJYSfde3vjF4B15OhfYX9WG9JE6VV+4
	gHGksUug=
X-Gm-Gg: AZuq6aKNiFBPVAQvNLJjF0ivqhxshfv/g+Zf+O3oSUu7TEJkSeUYPFBdzb86ZiSYSj2
	kmAvdSBpFvISrrIypjLUdDbzQ4kcjBHcdeViOdv6pZxI15Q5yFlFTgkVBTAN4KNDbZvGFxESwnd
	slMfaWpeWB5sET3YhQb6WGZh4jiOzxITPs9vbBOglwJZfd+kN1ouaaZI78cvLBxYH4zBCLyAX1P
	HbtLSF9dMo+3KA9wOWkt4heIJ4y5ivYEH9eP7tSvGPQS/n+lSJ86ACV/rOy2e33Uh5kIcaD+ZL7
	1UGSsf2RY2AFKAAgmbo9zqCL9TdKA6m+zvn2AbgukineTKErwVALrJfys0j+knT1SUpjZCH7VHM
	GpIvAC0LY9GsRU/NIbHb0FM2a8gaJQ44lycClDjb2seRQTvj4Ldo4hzWIpoRgR7p+zPGwR0HjAe
	YLCUzE3jATXRPMyCjh
X-Received: by 2002:a05:600c:818f:b0:480:49ce:42cc with SMTP id 5b1f17b1804b1-482db45f4b7mr193577785e9.9.1770129898159;
        Tue, 03 Feb 2026 06:44:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e04ed4d2sm121274235e9.7.2026.02.03.06.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 06:44:57 -0800 (PST)
Date: Tue, 3 Feb 2026 17:44:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Balbir Singh <balbirs@nvidia.com>
Cc: oe-kbuild@lists.linux.dev, Alistair Popple <apopple@nvidia.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: lib/test_hmm.c:932 dmirror_migrate_to_system() error:
 uninitialized symbol 'ret'.
Message-ID: <aYIJ5qttFNmL_Roq@stanley.mountain>
References: <202601152125.McLpiKxS-lkp@intel.com>
 <ba7dea85-4bd4-42f7-be04-c23afff5b34b@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba7dea85-4bd4-42f7-be04-c23afff5b34b@nvidia.com>

On Tue, Feb 03, 2026 at 09:34:40PM +1100, Balbir Singh wrote:
> > 4c2e0f764eb4444 Alex Sierra     2022-07-15  928  out:
> > 4c2e0f764eb4444 Alex Sierra     2022-07-15  929  	mmap_read_unlock(mm);
> > 4c2e0f764eb4444 Alex Sierra     2022-07-15  930  	mmput(mm);
> > 4c2e0f764eb4444 Alex Sierra     2022-07-15  931  
> > 4c2e0f764eb4444 Alex Sierra     2022-07-15 @932  	return ret;
> > 4c2e0f764eb4444 Alex Sierra     2022-07-15  933  }
> > 
> 
> The code looks older than the current top of master? The smatch warning is still valid though. I was wondering
> did smatch get new heuristics to catch this?

Sorry, I can't explain what happened here.  I had seen the warning before
years ago and not reported it.  :(  I don't know why the zero-day bot is
only complaining now though, or why it blames that specific commit.

regards,
dan carpenter
