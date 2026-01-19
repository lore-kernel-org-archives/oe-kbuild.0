Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB22332ED0
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 08:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768813109; cv=none; b=pfQkFIQXB8BDby2Pg8DSqADQVHbT1bGCyzlBIIVJwgkiBcikjjS2J/DyZU/csULfUjMhkLbOFKhH7Hd9v60ag5H/hsEONjleY7RmcANnCEoMgCQ5Dx3+sFAI330WBoZr+MJcOsIAJRT5NPe6dH18XBPsxp+9B59b6cOsoBHldXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768813109; c=relaxed/simple;
	bh=91rl6SRhYeXFCa53+VjFITo4//ysTLcIm0OJp+TUDKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OK3HI1/r8ls/ACBt9AtcVRkt5jc69EXvlmUyJmuFg38GYljVvmTWiRZCXdHQDbMf0PNdRN5ekgiiTO43jSuJlMs4wAYLDg0r/EloewSZLXQoDBiATuDSbA5ErSi68yWI2cspgXCanizJzNA7vlbZjc+xFUHGWEPml0NJ/HFbRPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cWfvjFMd; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cWfvjFMd"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47ee301a06aso36277655e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 00:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768813106; x=1769417906; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CFaMhEUUfmvBXCwj1KwYn/jVYVnwewK7bqIr5uEKUWE=;
        b=cWfvjFMdGGbPhDeliKTbXBH7aV84aBeMEZ6Ef8aAt9tX0ez8gzW93thOmLJcynH+wB
         rBNM3QYqFYKPu2ogyTFHesXyubpo4dQ+w/5tqDgzGED8MOckmlV4I2+rMuryeD6uDAO1
         ENySW02HQlAitMuNO98hx6wzNuvbtyG/ctzksW/nuTrPj3ZscAc6+GM9SrGbUebMYSsl
         cejtbTgvKjKxjia04cfisjcmq2dht3e5hyzBqliinjaFs7Z57mvOc9oIO3DE6E01rRL3
         h9L3dXT5vT7kQy95IlWzh6vi8mOvlnXj1nBhI+nmvVB8/7IoEzgXL/epGjyZZxwaPS/3
         VhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768813106; x=1769417906;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CFaMhEUUfmvBXCwj1KwYn/jVYVnwewK7bqIr5uEKUWE=;
        b=Bd52t2gE3Bum6Xq+PFTqucbFDs/i1GZT2ohRrR7ezWqaaI6mazkGLv0gDZKAKENAh5
         pezZcSHSDu6vnQPVHA+uCtErGFVVhEC4tl4iywnq0VCEnVhqbERSvUT+2SDOO1DCT0Fd
         rrjAP+h+N/K9p97FZxDB1PNgLSYKffXcQpu69z/K/OxaxnCmzdIcJKOslBti+Kjrmzje
         COBD8N2ZT8JTtWkSO/cQw3SZIeGcpCG6zR7K8WO06YNq9fI/Z2sx56xYcu6E0E4h9htf
         4mVw18M4Oo+pOkCrKI4+urf/35oeieOlbgY8OExzrGZ7PpXOF/yribhgE9zyv2Yqx+ie
         ONdw==
X-Forwarded-Encrypted: i=1; AJvYcCWf7zBkJ+rYVecpuz8xqdQ6sW4LusCY2rYGVzz4y/VFLnK+6m8990CPMdhM5QD85ORYma+dg165RRw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOy5rvCQn9GFuYue6wudSRlZg2fe/35Ie7P7A51BehVDIbP4E6
	HAYGDV2+U3MIOl0cIs+JxA8BQSqJGOb7bYCne+UVUFRcRy1s+Jry/WR4jVXBuaXrPfQ=
X-Gm-Gg: AY/fxX4Sp7tMImRNYPDsH77F0ZHUEdNzO1N+P3+sZHLb2/dRB/EtAj1O6rC0sUHxa/Z
	UeTrPMpCYSorGpIAx2qBXUJvgA9stoR9eS9id5Vle1vB5OOk2pYbIKjF5YyMys8QCwU6j7T/imr
	fBWjUYXaw53KcmXofrTtoexdb8AQlCIGk8+CDx3FnG6M6zhuZhymrjqk9HMG+CvNClB1x79tFpQ
	7TFqfxIlOy3zreNywCr0/tCj1XY/y3HDtOlKoVYdM79XhZD2syHUZyAoflZU//e7cNAFCa/CEz5
	bRNKdKoyXXu40BtXhI/f47mEWONy0e9MrQUhl98gRTkrtAPd4fDorOaiOkqjDzfVU6STrRAGj5F
	CTgPz3dTW4TSpEWYU7ah+AEmevZY+fnU6mHaRA7KM4k1a7/Ifxbskzefu0NUB3GbK3NCNuDx592
	0zpN8NvLdJpX7/Inbm
X-Received: by 2002:a05:600c:6206:b0:47a:9560:5944 with SMTP id 5b1f17b1804b1-4801eb14c40mr124909725e9.34.1768813105634;
        Mon, 19 Jan 2026 00:58:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e9ac373sm81081375e9.1.2026.01.19.00.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:58:25 -0800 (PST)
Date: Mon, 19 Jan 2026 11:58:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: yaxing guo <guoyaxing@bosc.ac.cn>
Cc: Haiyue Wang <haiyuewa@163.com>, Greg KH <gregkh@linuxfoundation.org>,
	oe-kbuild@lists.linux.dev, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4] uio: Add SVA support for PCI devices via
 uio_pci_generic_sva.c
Message-ID: <aW3yLhHwoRrBiQmw@stanley.mountain>
References: <20251223045409.15700-1-guoyaxing@bosc.ac.cn>
 <2026011643-coastline-playtime-0ac5@gregkh>
 <2026011603-dorsal-unblessed-cdb2@gregkh>
 <5483bb2f-04a7-468c-923f-0a62b94fc0e6@bosc.ac.cn>
 <aW3Znz51bTVj3oxJ@stanley.mountain>
 <7b7b6ae1-be56-45a0-b43c-8a66f054584d@bosc.ac.cn>
 <b0a45763-1cd2-4638-80a9-bd88fee9d729@163.com>
 <7f8ddc11-0de7-401e-9a05-4d05579f8787@bosc.ac.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f8ddc11-0de7-401e-9a05-4d05579f8787@bosc.ac.cn>

On Mon, Jan 19, 2026 at 04:38:01PM +0800, yaxing guo wrote:
> 
> 
> 在 2026/1/19 16:23, Haiyue Wang 写道:
> > 
> > 
> > On 1/19/2026 4:00 PM, yaxing guo wrote:
> > > 
> > > 
> > > 在 2026/1/19 15:13, Dan Carpenter 写道:
> > > > On Mon, Jan 19, 2026 at 02:16:21PM +0800, yaxing guo wrote:
> > > > > 
> > > > > 
> > > > > 在 2026/1/16 23:16, Greg KH 写道:
> > > > > > 
> > > > > > Wait, I already took this a while ago, why was this resent?
> > > > > > 
> > > > > After the v3 patch submission, I received error reports from
> > > > > Dan Carpenter
> > > > > dan.carpenter@linaro.org and the kernel test robot lkp@intel.com (see:
> > > > > https://lore.kernel.org/r/202511280815.WV9iCJZb-lkp@intel.com/).
> > > > > In response, I’ve submitted a new version (v4) of the same patch, which
> > > > > primarily addresses the issues highlighted in that report
> > > > > (as described in
> > > > > the "changes in v4" section of the cover letter).
> > > > > If there’s anything improper in this process—such as
> > > > > resubmitting instead of
> > > > > replying with fixes or other procedural concerns—please let
> > > > > me know, and
> > > > > I’ll be happy to correct it accordingly.
> > > > 
> > > > Since it's already merged then you will need to send the fixes
> > > > as a separate
> > > > patch based on Greg's latest devel tree.  Send two patches, one
> > > > that fixes
> > > > that && vs || bugs and one that fixes the devm_ double free. 
> > > > Add Reported-by
> > > > tags and the Fixes tags.
> > > > 
> > > > regards,
> > > > dan carpenter
> > > 
> > > Hi Dan,
> > > I noticed that on January 10, 2026, Haiyue submitted a fix for the
> > > issue that && vs || bugs:
> > >   https://lore.kernel.org/all/20260109175448.34309-1-haiyuewa@163.com/
> > > Please go ahead and use his patch, and then I will fixed the devm_
> > > double free.
> > > 
> > > Hi Haiyue,
> > > I actually fixed this same issue in v4 of my patch series (dated
> > > December 23, 2025)(https://lore.kernel.org/all/
> > > aW3Znz51bTVj3oxJ@stanley.mountain/), which addressed the bug
> > > reported by
> > 
> > I just checked the linux-next, found no fix about '&&', without
> > searching deeply. :)
> Yes, what I meant is that I was about to submit a separate patch to fix the
> && vs || bug, but I happened to notice your commit from January 10th.
> Therefore, I decided not to send a duplicate patch and will defer to yours
> instead.
> However, would it be possible to add the following Reported-by tags to your
> patch?
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reported-by: kernel test robot <lkp@intel.com>
> 

Once it's merged then it's too late to add tags.  Presumably Haiyue Wang
found the bug a different way without seeing the report.  It's not a big
deal.

regards,
dan carpenter

