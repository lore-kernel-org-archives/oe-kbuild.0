Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA54C16D9D8
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Jun 2024 10:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186770; cv=none; b=HwwNdkBXUZcEpVnlFKERg4/qFmI0Uy0l1is3GyUYHxQH1UIQyI6fF8gPukWn1UFEVssrGWRSFjCYoQbPVPQ+hgsCk6Q1ib/JLukqZEPCvIGInT0yvRXUjV0BLyMPfMaVzTgB0FQ7OiBgPIBDBlcr2HrhdoYqS1LSW0ylNmU8B7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186770; c=relaxed/simple;
	bh=1A6bZen+Pwm2rwGjsZWg11Hh3DG8ekkj4TMpCIOx3uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hiOxIeV0A1qujvJziPzxheeTanXxL+rrFWn7qxduJ6MrA28Q9KOVVQvSzfGbZ/A8RHchoEyAuEWCiMpJ0HKa22KCgXItKLefoMnWMm59ttGIc+Q30W5GZeFHLBSl6O9vH/OjwQAAX3KQCqqloiXxsq2oyE0O5+0bjbD9Doq9m6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R4fAq5aQ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R4fAq5aQ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4217f2e3450so37117625e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 12 Jun 2024 03:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718186767; x=1718791567; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j7GQT4sb8fOqdwN7qErmxIxCia5GY2ESmxbkweiG4mk=;
        b=R4fAq5aQf3w6+H1PjusTwYjiJm0UDecwi+2imLg2whmoxVQkd/6B/AeRS4JJXqyYV6
         pUr8W6/ruVoqAFlH7blwc53LpfkfQIFo13QzkT513HIb/utTjVRVFCjtxPhuMFiHggMN
         G3oxIjYPFbNYmGDNAHg2NM+PUu5LDgJrhZLzEid/nqaCr/KnWZ/15u3VE1FoWhXhx82M
         YVUyS+0j4HenEMgTCWX1JV6uehSoNov3kPHWDhTix6g2ldJWmM6ZTbWjc3nZ1E7k6P9A
         ReKRC1keBRmrcxF5Iv790eACMeMhV+ONa0H24UxPbpTWru7mGrDOO60zerufHmeNemvX
         7imw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718186767; x=1718791567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7GQT4sb8fOqdwN7qErmxIxCia5GY2ESmxbkweiG4mk=;
        b=vOTo41w+WWXh4qSDFpd1EYwIsxzkZKMOzbHNi8UXKs/h9K3GwGHF0eexGNiDQBSSAB
         C4VxsUy0VO6DeWbYco4crqMWGsIEaqlzkBS+9wCfplqXvlQkXYhcSl/AVhWPaSVV1HGK
         iuiqXc4N/91Qi9NKY7j0s74SYDq0uIoUP/XC1SKtIfUI18GJe+pxvS5DTEH3RVdRuNXs
         QYFoRg4tN7X3N0T8snJYk0ItsMC1VxzN65d41wcv9Q6kqJ7fFHbpJA4ftpqz5ZJqzfsA
         SSUqUWMaL/RDaRxLdQntshV4dFEtWsQyVS2HbBezXCgBNmE11kwgPZGlbpb0R6s78b/7
         Xdpg==
X-Gm-Message-State: AOJu0YyWQWpWcmNzc9DPKUulbn4JWRKAJqUp91GsMl+QNLpDZ8gNIYXW
	RuZvluQy8TxVSYS8desnatMOOc5NGXXzrj0rdrpth1Z5ikfEerLjzw0Sj7Gjs5Q=
X-Google-Smtp-Source: AGHT+IEc+w6vERYyx26ozDlBXedCJnqiKgmj86kpCTQ5mYYcm1u2cnMPFRH40yWhGkpp8pMqt5gJLg==
X-Received: by 2002:a05:600c:4f4a:b0:421:f43d:dadd with SMTP id 5b1f17b1804b1-422867bf628mr16526785e9.33.1718186766848;
        Wed, 12 Jun 2024 03:06:06 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874e73c7sm19643925e9.42.2024.06.12.03.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 03:06:05 -0700 (PDT)
Date: Wed, 12 Jun 2024 13:06:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: oe-kbuild@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	ying.huang@intel.com, Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	John Hubbard <jhubbard@nvidia.com>, Mel Gorman <mgorman@suse.de>,
	Ryan Roberts <ryan.roberts@arm.com>, liushixin2@huawei.com
Subject: Re: [PATCH] mm: fix possible OOB in numa_rebuild_large_mapping()
Message-ID: <81da44d7-e07d-4757-9a67-87c35b62512c@moroto.mountain>
References: <100add53-aa58-44ce-a15d-8438001fb2b9@moroto.mountain>
 <c6df35cc-1331-4255-8ff5-898f6a911bec@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6df35cc-1331-4255-8ff5-898f6a911bec@huawei.com>

On Wed, Jun 12, 2024 at 10:50:02AM +0800, Kefeng Wang wrote:
> > b99a342d4f11a5 Huang Ying        2021-04-29  5364  out_map:
> > b99a342d4f11a5 Huang Ying        2021-04-29  5365  	/*
> > b99a342d4f11a5 Huang Ying        2021-04-29  5366  	 * Make it present again, depending on how arch implements
> > b99a342d4f11a5 Huang Ying        2021-04-29  5367  	 * non-accessible ptes, some can allow access by kernel mode.
> > b99a342d4f11a5 Huang Ying        2021-04-29  5368  	 */
> > d2136d749d76af Baolin Wang       2024-03-29  5369  	if (folio && folio_test_large(folio))
> > 
> > Are folio_test_large() and folio_is_zone_device() mutually exclusive?
> > If so then this is a false positive.  Just ignore the warning in that
> > case.
> > 
> 
> The folio in ZONE_DEVICE is not a large folio, so there is no issue for now,
> but will fix.
> 

If it's not an issue, then don't feel obligated to do anything.  These
are a one time email and then I treat it as addressed.  These warnings
are intended to be useful, not a burden.

regards,
dan carpenter

