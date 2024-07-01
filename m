Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A832716E87A
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Jul 2024 17:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719854476; cv=none; b=O0qaGGub1oBefG10+O0uk8ii+T2pKI2jTffM1z/d/Z4EpK8gkQDzIdkxC8Whs0HKWKuYbdeHhJpe6Z4dlMUOqjITIub82Oir3qft/jvvtHu3bBOR7pzazJBf13y0q6Xbc0I0isKqeEb99e2rWoHMx4ktRjt1t8e8Ok88WaF5Pzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719854476; c=relaxed/simple;
	bh=2db8yd7ZmB4PkZ97gBIlqYdgj7dhAA+Hn74l1Q48830=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DlGi65nav84PIofH0IhuNB29j8frd6nf5+l3vQ21VuFQslVG2WaV4BQCi84Je0nGvJrV1F3djDoHJom2IoZfZ7XbXE1jKR52umjxcdwMRidyfFyd2x03KH/psQhT/e84E+yiiv2aQBOSwX1veQPyWe6px4Pwz8N7v5v4oluBmfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x2Df76lj; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x2Df76lj"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5c40f0e679aso1642848eaf.3
        for <oe-kbuild@lists.linux.dev>; Mon, 01 Jul 2024 10:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719854474; x=1720459274; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GPVXeJ5DYcFloeYojNfMLNVswRnJcE7H7Uw6QNFB/I0=;
        b=x2Df76ljGUr0TlFxLP8UXrE2acGHZT0aFqm93JePemKKBrOGhYaiZm+ew9775raHv6
         ruZmY41tta9LzXZYH68QyxmoxuPT0riOah1jdq8TvTiZ1DDRQVxxArm9fPT6X22DuWcI
         Q+T2QpJx5qEw3zlYibtSmqzCTUgnrf4e8ZeFOMDS8fFFa8V5BZSuaAMjBBrLc8A5mMam
         Mvwf4MqUw+KgS95U3B9D8Jl7GubHu4ARt/F7jK/wCLoCzavr/EKZQNO+txDH5FHjPt7Y
         2pbmlg/3h4+ogrgIorf83A0g2GohsOQbUT4PJ7cuFUFJM9124eMx/1eV6vzATUfyRbis
         VVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719854474; x=1720459274;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GPVXeJ5DYcFloeYojNfMLNVswRnJcE7H7Uw6QNFB/I0=;
        b=hwWQmaOlBI8Su1+Pm9knO6WCIf5uxFRqgVxGp5jyu4EBNqMLPyqHKMJsYkwiHtya3d
         Z7rFEZAlJh96Qvfw5XjRi87OQvgIgDuosRbO4lrZzT1ARdb9jbm/GWe91+NiDNvCzxVs
         6g7qRT4kxYMs9BpcBMsUIfrfUvYF8kE4JbYYweKgo64dJdx6oRsuKrJfhDHJSjxS/lAm
         mfvoMETDkVMfSpKcpSVeZzQXX/Yfuh9laexXcVrc4fMB87IGa+L4JS/5JqbTzs0bSZRd
         gxhZ9EwzvssGUwKH1IfaZtuqjZX6Jah5Zljh5nR/s25St4JJPMkPC8Kb0g1yA2427ugK
         Ts3A==
X-Gm-Message-State: AOJu0YxGl9togIMVg2/5EGLpZ+iAvmXH+KuK4LTqiBUtfdipuVQNsmSR
	JYltwZKoprvJuI708FoG9qJxiC51pbXbRVDjEiPtMK4Ujv1SaP3FV+U4gkctYzM=
X-Google-Smtp-Source: AGHT+IHpYUORixfVl3egEmgrQkmHfsdZGqyJwVM31Fk9x/zI0GWrjDGsgUln18NNDD5jlZMloEzvCw==
X-Received: by 2002:a4a:ae46:0:b0:5c4:e8d:58be with SMTP id 006d021491bc7-5c438e2ca87mr5443908eaf.3.1719854473750;
        Mon, 01 Jul 2024 10:21:13 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:e8c6:2364:637f:c70e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c4201326cbsm1085848eaf.18.2024.07.01.10.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 10:21:13 -0700 (PDT)
Date: Mon, 1 Jul 2024 19:21:11 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: oe-kbuild@lists.linux.dev,
	Ronald =?iso-8859-1?Q?Tschal=E4r?= <ronald@innovation.ch>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: drivers/input/keyboard/applespi.c:1833 applespi_drain_writes()
 warn: mixing irqsave and irq
Message-ID: <b157bed2-2ada-4086-bb67-ae4e6762bd72@suswa.mountain>
References: <3e789ab9-ebfc-40a2-b90d-b8b55e0cfaac@suswa.mountain>
 <ZoLj2LL0NzdS1gZL@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZoLj2LL0NzdS1gZL@google.com>

On Mon, Jul 01, 2024 at 10:14:00AM -0700, Dmitry Torokhov wrote:
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1826  static void applespi_drain_writes(struct applespi_data *applespi)
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1827  {
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1828  	unsigned long flags;
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1829  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1830  	spin_lock_irqsave(&applespi->cmd_msg_lock, flags);
> > 
> > _irqsave() sort of implies that potentially the caller has disabled IRQs,
> > otherwise we would use spin_lock_irq() if we knew they hadn't disabled
> > IRQs.
> > 
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1831  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1832  	applespi->drain = true;
> > 038b1a05eae666 Ronald Tschalär 2019-07-15 @1833  	wait_event_lock_irq(applespi->drain_complete, !applespi->write_active,
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1834  			    applespi->cmd_msg_lock);
> > 
> > This will renable IRQs briefly and then disable them again.
> > 
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1835  
> > 038b1a05eae666 Ronald Tschalär 2019-07-15  1836  	spin_unlock_irqrestore(&applespi->cmd_msg_lock, flags);
> > 
> > This will set them back to how they were at the start of the function.
> > 
> > The issue is that if the caller really wanted IRQs disabled, then it's
> > not necessarilly a good idea to enable them at all in the
> > wait_event_lock_irq() macro.  I suspect that in real life no callers
> > disable IRQs so it's not an issue.  But anyway, that's what the warning
> > is about.
> 
> applespi_drain_writes() and applespi_drain_reads() are only called from
> the process context with interrupts enabled, so it looks like we should
> simply change spin_lock_irqsave() to spin_lock_irq().
> 
> I am taking patches ;)

Sure.  I can send that.

regards,
dan carpenter

