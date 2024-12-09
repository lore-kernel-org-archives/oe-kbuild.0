Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7608221505F
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 09:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733735319; cv=none; b=eU+w5RPX6vk1h2+dyzfrXKiuK//Lg4jQd/Lfp5MnW91xTEjm4/ojcT0J2kmLWmOIvlfI2gyEJ147Hm07E7KIyxF6UL2JmzL6MbfRcoKaSEqOJC2TG55cnRRbTrLQMm4z0apq7yp0GY1jo6SyrLhg5mFA+iT5h2TmbtJQX29aJPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733735319; c=relaxed/simple;
	bh=RGRaiSPrJ4Fjoa4wWn+D2mUhO0ZTQN9y2c6gK5ph/fM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3zaYJM4nik66WRQwfHPkJd3S9HcHpo2pB5D6t8z2z6vjZGduRzu4rXi8OCd6Ux78Z6aLj3F19UBFYC2FiydmYHo+zH0wy7VOP/MJpPgUEZgYYNiH6JdQRogvK6Lr18kaneApEBNTxt8dGjXEN3gAb+1yQa7g7k3gJ5BtMHB/Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GAwWSu8e; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GAwWSu8e"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434aa222d96so44226055e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 09 Dec 2024 01:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733735315; x=1734340115; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsJTx3PH9goQcoDcessIJUZiUDgu6MKdF7cPS5GqSak=;
        b=GAwWSu8emM6WwS2oIXdqL05EBTTaWHeaR9wGlry3kXlwueUavAHdnb3OwyKcVSdYHC
         uhg+VyKNfDAqeujRWyJFCHhxn+2uzFkBL2KeLG107V0LJ7fnPN1LZo7F2udvufq31/Tj
         +nykqQikdU4uNxBx+xKplF3g7VzVWzr23iIVpK45wlC9u24RYKjRAwSr7nvFm1abIDVJ
         W4IjGe++YxTimQlXr5K+g4jcDyWlknmFHlSpRy1TbdT3UkJRqziAADXTqg7k8Qm6/HMv
         ofzddx71oeqf5Z148bTUzIeLfGmSZmYZWl5DCN9x4TyVt+hc909Vb41fDDboMTatnK9K
         BeEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733735315; x=1734340115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsJTx3PH9goQcoDcessIJUZiUDgu6MKdF7cPS5GqSak=;
        b=Gg/CDJ0vXt9r9Dxx5A7R//ye4QklPF9nw79F423OQNvrfGfyOKY/PHVjnkOCY69zVT
         lm7ElX7b5jMW6cIc3R/kIwkP9Z4E9hWZgQCq1iaqetINKk6jGunRDWOKq435zcoKsLdO
         BT7WtSCofelgqJLAkxOHbzt3zH8NoYFdB8TFHUZeNgZBKYCjssHFgYnwlVaY7kuV+4fT
         XeyIEOcFo3eUQlqgQBm2qMGDb/H14AXZZ0tZp4iFeIf1FHDMwD52hZXctWZW4ohqcyO8
         XF3umskyy3eKz46AUQWFvCiYpD6yo3mf820IHMfK+QJBJ3j1ufIVQDnBBs44QZALgY+Z
         FeYg==
X-Gm-Message-State: AOJu0YzbpFxDTEy2wnQHgIlDzT6giSvGNxyoVIHVcDkslM+x9dTgDn3A
	hWQvMQPJJVDMFp5/pxZNpTC4UBPeFOjXspFs3EENFWGu/GUplcSJecE+4dK7acyLlfNIgbAFDCj
	v
X-Gm-Gg: ASbGncuK7PljBorFZgc5XotLPMp1iVY8A4VJpMcr7WTEEcjdFcnxu9Ha2u4Nrm+xy7F
	d1taXOpYbBfa85StNbU8vtDFm4pEH7eUjVuD/VwM4TJlm52GJHgdubZjFDrQfI9jCwS82w7bFIf
	rgLq1Hio/etk5uAaLCQAi8DBa0ogSt+kzS40ndWa5ZgWS6w90DzuasfvWimQaqZnvnc6YBj93WT
	i56mg4o2jtGgdzujzSJwEiuLJSq2q7gTW0rkQslnjSrfLDwlIaPm70=
X-Google-Smtp-Source: AGHT+IHwHqNdsCzlg9RIis7WzBaAxcQt1cpiTsM/IaFi643v+MgHZjlMz6/EDDZGZNLcoK/eGnRCDg==
X-Received: by 2002:a05:600c:1f91:b0:434:a26c:8291 with SMTP id 5b1f17b1804b1-434dded8240mr96456195e9.24.1733735315514;
        Mon, 09 Dec 2024 01:08:35 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861ecf4087sm12827984f8f.5.2024.12.09.01.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 01:08:34 -0800 (PST)
Date: Mon, 9 Dec 2024 12:08:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dave Penkler <dpenkler@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: drivers/staging/gpib/common/gpib_os.c:871 ibioctl() warn:
 inconsistent returns '&board->big_gpib_mutex'.
Message-ID: <d19c29ac-a084-4feb-a272-5ae6361732db@stanley.mountain>
References: <869e62e1-cdcb-47b3-8092-2d5c203ecf1a@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <869e62e1-cdcb-47b3-8092-2d5c203ecf1a@stanley.mountain>

On Mon, Dec 09, 2024 at 09:50:15AM +0300, Dan Carpenter wrote:
> 9dde4559e93955 Dave Penkler 2024-09-18  757  	switch (cmd) {
> 9dde4559e93955 Dave Penkler 2024-09-18  758  	case IBEVENT:
> 9dde4559e93955 Dave Penkler 2024-09-18  759  		retval = event_ioctl(board, arg);
> 9dde4559e93955 Dave Penkler 2024-09-18  760  		goto done;
> 9dde4559e93955 Dave Penkler 2024-09-18  761  	case IBCLOSEDEV:
> 9dde4559e93955 Dave Penkler 2024-09-18  762  		retval = close_dev_ioctl(filep, board, arg);
> 9dde4559e93955 Dave Penkler 2024-09-18  763  		goto done;
> 9dde4559e93955 Dave Penkler 2024-09-18  764  	case IBOPENDEV:
> 9dde4559e93955 Dave Penkler 2024-09-18  765  		retval = open_dev_ioctl(filep, board, arg);
> 9dde4559e93955 Dave Penkler 2024-09-18  766  		goto done;
> 9dde4559e93955 Dave Penkler 2024-09-18  767  	case IBSPOLL_BYTES:
> 9dde4559e93955 Dave Penkler 2024-09-18  768  		retval = status_bytes_ioctl(board, arg);
> 9dde4559e93955 Dave Penkler 2024-09-18  769  		goto done;
> 9dde4559e93955 Dave Penkler 2024-09-18  770  	case IBWAIT:
> 9dde4559e93955 Dave Penkler 2024-09-18  771  		retval = wait_ioctl(file_priv, board, arg);
> 9dde4559e93955 Dave Penkler 2024-09-18  772  		if (retval == -ERESTARTSYS)
> 9dde4559e93955 Dave Penkler 2024-09-18  773  			return retval;
> 
> mutex_unlock(&board->big_gpib_mutex) before returning.
> 

Sorry, this is a false positive.  The kbuild-bot can't use cross function
analysis because it doesn't scale.  But if you had cross function analysis
enabled then it wouldn't have printed this false positive.

regards,
dan carpenter

