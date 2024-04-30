Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501BC12CD90
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Apr 2024 11:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714475293; cv=none; b=cRo9NMOrvYx760UaGtLhknjkUOdcU5LW2GOo1tUUWpYkT0A99geT8IahJHiv4pYGLulfKwxfHIDXVInTaN+4iLRzT4FtjUxXb5ne/3ST/HF2o1pDOc0oPXJTtkSmveEiTl+/2pgfjgRY/vtyLJc/MJ+ZztBWk7Z4CWYXJBZjajU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714475293; c=relaxed/simple;
	bh=wESdq211asekhD+eOOklxIrPcvjthYKLfk6mE8/JL5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ee+74ldxaTquZKgxNsl4Ozz0OUgGK8wo6R6rW4S/whrpq6x+11DS3VDpcbLV8kJUCTrLTBmlyX+sfXj+sN9Vg+H1mfCORtgv4jJmBxmvxsVdvOTYFPVqjayEDJbUfXhCcJwZ2QCgIyVFi7tbR/usYA9cvDDOYEQkJl1sGaY8wSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TZZlQhpv; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TZZlQhpv"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5723edf0ae5so5907925a12.0
        for <oe-kbuild@lists.linux.dev>; Tue, 30 Apr 2024 04:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714475290; x=1715080090; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fCMqw7nCSvY2cVfV712Gd21YvJ5nyvK6rdErCKyrofU=;
        b=TZZlQhpv5JJAUdZGMmo6R7WHk3yMqPer6wng6r+ykFhJ4u6kzCtSzn5XwoO8b3YaNf
         c2SVv2WKn5OxRDaLObYiTjjlxja49cO+05+oWUNOo8KwIM1dNHFrSgSuizjv+TU3Afjf
         5XJh3I9/WO6n5t7zgCHnuQlqfFdI18S7sCo9lcusSiaxPOq5VpjFfVCToRQX70VX4db6
         NbZtZuJfROWwXqmb2Q1Nnz77+bgv5CM+t1BJSzYIhQos0y06eVQ7+LBqwxpmiPtWo9lX
         raCfmg5piVTc2pXBuZAi92Geflzv/dSJuWwiIyQMFZEcQKUKqr5pOT50LuxkwCuo8N4g
         z3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714475290; x=1715080090;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fCMqw7nCSvY2cVfV712Gd21YvJ5nyvK6rdErCKyrofU=;
        b=N7p26KfVzjrdrgzsLGuiSc09WSAfq1i092prUTWHnRpIJX+EqDMIVEVx8AcvR6Su5y
         8bsif1vqTWrEyeVjNaru4cCYmkG46RYBAucUR13lN+bem50mRM/1qIXZa8gzJePpoUHe
         iZAhp7D0B+B5XYo/w6Jft29hTbi2KG9cHWM0uiKV+oP/oyYpl/+oJYDfAGraMloDPDpD
         6vbJKj1tYhLAZpdwriFeMqw5y2/mrjF70U70LSt/7twPvG8Hr5qJqwpx2Hw3J3ZGOcdV
         bC7BgDr0M5tJhhJIPbAyTozcGH1z7Lu4/jT+FECEDGrBFXXIaVedrh6e6E0yOqdcaNfh
         ph0Q==
X-Gm-Message-State: AOJu0Yzburfw+5kyjLIT5iQTwMaXf/Td40pNRdDp6/7Xskf048gdYij6
	Y5Y5sFiwx//gk+YjRkmClf7hWTkyt9sKmrieTq2Px/dSYfIbTYXrZlA9tDdEwUE=
X-Google-Smtp-Source: AGHT+IEW0hxbwsW1u6SttzpRpyX7Q6sCxkQ9mD8o2epmv7KvexUu0H2je1I6KIVYMzQvfcruQOGxIg==
X-Received: by 2002:a17:906:b305:b0:a55:5b50:847f with SMTP id n5-20020a170906b30500b00a555b50847fmr6396590ejz.22.1714475290463;
        Tue, 30 Apr 2024 04:08:10 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id gr13-20020a170906e2cd00b00a4e696e613esm9750095ejb.153.2024.04.30.04.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 04:08:10 -0700 (PDT)
Date: Tue, 30 Apr 2024 14:08:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 1128/2532] drivers/pwm/core.c:1530 pwm_put()
 warn: variable dereferenced before check 'pwm' (see line 1528)
Message-ID: <7ab56969-2524-4458-9881-8b63fc80cca8@moroto.mountain>
References: <086d46a0-70a2-41cf-94e5-5cd2377a0937@moroto.mountain>
 <ylioua4xvt7cbbhk6vnqmywbtj5zuk6lonxjyfaggrb7urvayz@pqglnven76ai>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ylioua4xvt7cbbhk6vnqmywbtj5zuk6lonxjyfaggrb7urvayz@pqglnven76ai>

On Tue, Apr 02, 2024 at 05:11:22PM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> > 8138d2ddbcca2a Thierry Reding   2012-03-26  1526  void pwm_put(struct pwm_device *pwm)
> > 8138d2ddbcca2a Thierry Reding   2012-03-26  1527  {
> > d60bc299573248 Uwe Kleine-König 2024-03-17 @1528  	struct pwm_chip *chip = pwm->chip;
> >                                                                                 ^^^^^^^^^^
> > Dereference
> > 
> > d60bc299573248 Uwe Kleine-König 2024-03-17  1529  
> > 8138d2ddbcca2a Thierry Reding   2012-03-26 @1530  	if (!pwm)
> >                                                             ^^^^
> > Too late.
> > 
> > 8138d2ddbcca2a Thierry Reding   2012-03-26  1531  		return;
> > 8138d2ddbcca2a Thierry Reding   2012-03-26  1532  
> > 8138d2ddbcca2a Thierry Reding   2012-03-26  1533  	mutex_lock(&pwm_lock);
> 
> This is already addressed in fbf632f9dc55.
> 

Apparently we never merged that commit, though...  It's not in
linux-next.

regards,
dan carpenter

