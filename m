Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8202076AA
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Oct 2024 19:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730231376; cv=none; b=FBfv3A2wJmenQ0THVGTTnu4e3HR4ji162wc6MZATmoC+hzREStYygdFaFX/vSSCZ3J5Ut0o87ajVAKVeQ18XW/zt9QPHHc1dyELVehYzeAFjnuYX2SREnu9/XFE+31nCaBAPqA11byb6bKITXr6NSJDKWsXr9qSUjBCS0eU6CQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730231376; c=relaxed/simple;
	bh=vhTJf7t7/X5EyRXlSrvjdYvaWcYE0wDuIRV2ChOwtlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kpiNnxhZYqdiobJn2BTHoQfMRi/eHqwT2uK60o79gNyhjkAqpKgECDaYbVKCcTDTcrNYKuQgf5pXaJY6iWVTrMyCcRsVfM+3UTpFf80CrEWCJD18M7aClYkb6za5pL8Zvme7Y/3qKrQ0vFKVv+pqE0Hh+qnnbwuOmcV7pHA3fuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BWf3Puse; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BWf3Puse"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso820565366b.3
        for <oe-kbuild@lists.linux.dev>; Tue, 29 Oct 2024 12:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730231372; x=1730836172; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6O2h4B66uPtz7k2AhjB1yCKpOLR6rksUesCzlHXhZIc=;
        b=BWf3Puseh3RIg6RAaWMicEn8fQ1BDddYeF4ZjdhEMQ4/K4RSL3L6yVXWddCEfki/yP
         j4upaEZBTb3tKXIRkSN1BWFGKfC2n/9UaVhvu69Nw6oeBa0RZQywjbvQf/3d/c4myj52
         JJoLsyZNGDPbeiAgySAs2Yvu+y2XKgNUGClD9EhKiLAxEQQZwLzpdCHQ2p0nZwLhMdpv
         gc1uT2yjj1ZVuqdV0r60BjH7WyqThS+Iu0dgoqTjNBdnIsfmFkM/W5VmiQCSM+FCE1Ro
         sQEajp2KU7gUlOndRxvDGhCOvfA022N/fYFVhZnCV8oM7vTDLZjr13EDBEYRDwGXDJZa
         XO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730231372; x=1730836172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6O2h4B66uPtz7k2AhjB1yCKpOLR6rksUesCzlHXhZIc=;
        b=pXq5C8z72rAMdabNP5eJTZwFjJsZmzFq9XNyCe2WAPlWIA7NPNmeJLuPtOhPsHO1BR
         JOeW8OfiXTKIE5tFzjtErvJSVpZvPnCBLcKedjP5+vdNRqmFzbQNhmWyXghNK7Be0Rso
         hEPjeBSHRgZjRlf44HrbM0f2RpAq42KeIMzN1XsZsnhP0NA/vDchmrSoIDGbgb/sVBBo
         aGIX4iOsiiVq7eEAanb5OxRq5dFJfCGgKfAbNtXWYvs+J7XEgbNVcAihfIaP8K5vKGXv
         N8+9XE5bjC4J8gn4/kZKfHWWX0j2CrZtY9KjZ4QWQpuiU25G640sORUjkM1y3eqHVtsj
         3EgA==
X-Forwarded-Encrypted: i=1; AJvYcCVWPY5A7AAj9ALbpnkb0uWlCxUrpUv3kRngb5FOoCPJ6HBH3YF9s3v4pDxaHLjcb2g8wxchBWxm+mk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkX1zM+t/5aIbr67LJq8Ru28eQ4Ym+BLzQqrLqOGNPlOOOfh45
	gC6DnfYFe1m4K8bqugBmGNq2N0BoFpNrhv9MSi3WD+6uDKLtsZ21cebNmkjxEO0=
X-Google-Smtp-Source: AGHT+IEhcXXo9FaHfKPLm3VPezuDMVGoVPplP0GLW0T2t0EhbH/TJfxjJ3K5kbPv611l00iKJ7kASA==
X-Received: by 2002:a17:907:9608:b0:a99:a9b6:2eb6 with SMTP id a640c23a62f3a-a9de5a4b829mr1265190566b.0.1730231372302;
        Tue, 29 Oct 2024 12:49:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb62c392bsm4207800a12.50.2024.10.29.12.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:49:31 -0700 (PDT)
Date: Tue, 29 Oct 2024 22:49:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Sakai <msakai@redhat.com>
Cc: Philip Li <philip.li@intel.com>, oe-kbuild@lists.linux.dev,
	Mike Snitzer <snitzer@kernel.org>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: drivers/md/dm-vdo/data-vio.c:976 vdo_launch_bio() warn:
 inconsistent returns '&pool->lock'.
Message-ID: <a048daa6-ab57-4d06-a7d6-df119e2845c0@stanley.mountain>
References: <717e8949-55c4-4461-8951-3e582e9b77ef@stanley.mountain>
 <f074f848-5a26-473b-ae98-1932e9a8cbd1@redhat.com>
 <ZyBQa45RTWXiXJke@rli9-mobl>
 <ZyCLo51ZyjxX7eQK@rli9-mobl>
 <13937d22-46ac-480a-8956-f89a0fd295ac@stanley.mountain>
 <68866f17-f327-4df8-ae17-dfcc50362d4a@stanley.mountain>
 <1c0beb9b-6b90-4c92-a4f3-f228dc0aa527@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c0beb9b-6b90-4c92-a4f3-f228dc0aa527@redhat.com>

On Tue, Oct 29, 2024 at 01:03:35PM -0400, Matthew Sakai wrote:
> Okay. Just to restate, what I took away from this thread is
> 1) The current code provokes a warning.
> 2) When bisecting, the bot found a (different) warning from the patch
> introducing this code, and so the mail points out that warning instead of
> the warning in newer code.

Not a different warning.  It's same warning.  It's just that the code in the
original commit was buggy and Smatch kept on warning about it even when it was
fixed.

> 3) The warning is showing up now because new checking allows the bot to
> notice problems it didn't notice before.
> 
> The commit I cited fixed warning from sparse, but I don't think we looked at
> smatch. This particular code does not have a locking problem, but the way
> it's spelled makes it difficult for static tools to understand that there is
> not a problem. I'll take a look and see if there's anything further I can do
> address the actual current warning.

Don't invest a lot of time into this.  I'm re-working the locking check really
heavily right now.  I know how to silence this warning when the cross function
DB is enabled.  It's just that I'm trying to decide the best way to do it.

regards,
dan carpenter
