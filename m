Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B2D32938C
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Jan 2026 19:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767813965; cv=none; b=NFBLdC6qYaE716hQmfrzAG/w3Bi/daCAV3dFD27PqYOK80qJ3n+wKc8oWUHOJafpl881/QMeud4Yc/dabgt5dm77Nnx8eC0iWEX4Jw145AxMOCqUf8e/aTHbEeppVSLApywA2s5rrDITZjnmphHTVG2ASy4qhllEDU2gB9A721c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767813965; c=relaxed/simple;
	bh=bzwePzuGkydAtgqL82OSMgytLQq3cNghf8x8gqvOVzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGtHtFEsjokZSRaNBKL5YT7CBim2iL6C891M2ySBnHzHwGEVtlK7vtIYSASWZTsLo6wezN19IwAdhplw9aUam6w82dxXKinNpn/UPEf6MU0qw43q2lkmWHb8bS91bjbq2i+XuH7JVvsGz0BKQBfxHwx86xC8HZ0UItO1RJloQd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SeNTrtFC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SeNTrtFC"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43260a5a096so1659880f8f.0
        for <oe-kbuild@lists.linux.dev>; Wed, 07 Jan 2026 11:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767813960; x=1768418760; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9etsUorNiOZ8l/OXX3tw4FbgqU4S6IaRaXYJxAwLmm4=;
        b=SeNTrtFCt/BlqswuEkOMhj5TyTdsebYCHaKTNp/xS3b+dSSiNzU9W5K3s9qiT7jBU4
         Bf2QjX/XNgnqariuhiGuK90fTVz/ROf8rRSO8p+xhC7wrkXKY3tzjqPhAlT/yI+UedkX
         zs2IzF5Di8UDUNcnICgNw8B1lcT7TajoP0+4XLOO3MtfLZcU+H5eD6pO1/eOSrvCjiHH
         ++e64kRdzLrsBXSmJ0IMKCiuT2WAo/xEz8pWUxy3JDSnr+7XS+yFlkazyOYvXcFAUhmJ
         y8KKq71XJbHZyJPwfAWogs9SUUWbX6VyqMy09oh8VaOnnjKAm1j63THF34xy7ek1m56R
         ODTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767813960; x=1768418760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9etsUorNiOZ8l/OXX3tw4FbgqU4S6IaRaXYJxAwLmm4=;
        b=btMaFxd75It3Z4LUrCBgYwohwcnRDry/VWIfCBQXvPu5bVs4d61Fqg0zXoyhyVBse4
         7rkvGi+CRAa11ZN4ija6B/lF44cAE2/LkgKsEtrkybLmHpqhmgrx/ybvgn46kn0qp+RE
         MY1w9C+lTTlsoi8qbG0VIqL6agnuhr8CX0Gsgn4aoIB4wVRZ9VX3gjstQbNz3fjVj7gJ
         woFoZ5RoORz0EAwdPVOVnW7EaU8sUGEokV8iGvRMm87PH9LdiFhunbrfZI68faESwyHA
         E4IBEXeWHhPxfdDkX1jVzGYRqOFBAXLtWPpdeMMplMzrOVS/5ZIb+WbMnLId6XGZBT91
         OZ2w==
X-Forwarded-Encrypted: i=1; AJvYcCVOd3rjbLJz2E/nW6Kr9x+aNughXTPFylZIQSpK28AWDTKi0VMrYyDyaQoiAuY/j0rGZMQQCkI2XkE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyH21M/j4eg3XphsP29vG9ZzcdW8/Jsy1oStYWcS50Zv6ngnCH7
	Wu+5hU/zGv9kUhshYYKNQFQsUx9hWoI6zXBC/KmBcLdoRladaS3lzJPwD6Stv4khfc8=
X-Gm-Gg: AY/fxX6R+FE3P/8NDdtknHkfOIVW6zItW5V+cDKaxuTClkzgGATPdgMBoTqj+xZMtlH
	HLE7DqyWAXuW5M+5nfonpOm/AwIPpbyw/ArQUQ7LeDZs+tc1ivrjLNTwBbb1Kk962lRphOi57xp
	G+Ks+2vwjaatZtEz6OhPTw3RWeRwzHAEpZd+Y/eDvtv8F9IyRXbsUiW7gk8iQpDK1vHYgQL04V9
	ajn2KXFFN+LAH5RS6Z45qT5B4C/Zo/8dAVYNajkeqeKMZJx1H5fUqKZtx/2t7Wvz+9sNXosEsqz
	1IKjN6Il4Qfl/d31W+mx1i+bzMHG+Cw3Mbz8DLaH/iThuSj2BHPYxjAiyqujE1C93yE5n/1YnhN
	uVvU9Qu4QsAhcYclhOyVRhjWvm/QHI5RcofXyPXVdlNrBCjo/P49Fx8VbZFuUHQgAA17xOyQ+XQ
	aP4X6NzOT27JJtTHPb
X-Google-Smtp-Source: AGHT+IFXTNEyUjdBD0MDU5MIQJ3Epy5W6zBCk9xEmL0+6Qn+D2NlAB3rLyv39j4W+wGpGQZAEarjpQ==
X-Received: by 2002:a05:6000:2886:b0:42f:b581:c69a with SMTP id ffacd0b85a97d-432c378a894mr5264865f8f.5.1767813960134;
        Wed, 07 Jan 2026 11:26:00 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edd51sm11970261f8f.29.2026.01.07.11.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 11:25:59 -0800 (PST)
Date: Wed, 7 Jan 2026 22:25:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kairui Song <ryncsn@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild@lists.linux.dev,
	Dan Carpenter <error27@gmail.com>
Subject: Re: mm/vmscan.c:784 __remove_mapping() error: uninitialized symbol
 'ci'.
Message-ID: <aV6zRKzGocxwhyce@stanley.mountain>
References: <202601010353.E7g5cCo8-lkp@intel.com>
 <aV6UzKs_f_q0IPH7@KASONG-MC4>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV6UzKs_f_q0IPH7@KASONG-MC4>

On Thu, Jan 08, 2026 at 01:17:15AM +0800, Kairui Song wrote:
> > be7c07d60e13ac Matthew Wilcox (Oracle  2021-12-23  779) 	if (folio_test_swapcache(folio)) {
> > 3d2c9087688777 David Hildenbrand       2023-08-21  780  		swp_entry_t swap = folio->swap;
> > ac35a490237446 Yu Zhao                 2022-09-18  781  
> > aae466b0052e18 Joonsoo Kim             2020-08-11  782  		if (reclaimed && !mapping_exiting(mapping))
> > 8927f6473e56e3 Matthew Wilcox (Oracle  2021-12-23  783) 			shadow = workingset_eviction(folio, target_memcg);
> > 8578e0c00dcf0c Kairui Song             2025-09-17 @784  		__swap_cache_del_folio(ci, folio, swap, shadow);
> 
> Seems a false positive to me, folio_test_swapcache is true here, and the folio is locked, so it must be true above too where ci is set.
> 
> I'll check if some cleanup can be done, maybe silent the bot.
> 

You're reading email with lei.  The way these emails normally work
is that I read through it and only forward the useful emails.  In
this case, I saw it was a false positive.

Unfortunately, we're in a pause while Linaro raises funds to continue
this project so we might start sending unfiltered emails for a bit...
There are a number of other Smatch related things that I normally do
when we can raise funds again.

https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/

regards,
dan carpenter

