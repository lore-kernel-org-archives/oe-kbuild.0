Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90394136E0F
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Jun 2024 06:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718260305; cv=none; b=jya15xyP+jGcgmLgLC8E1weykrddMF6j3Tc90XDqcNyLFniUJgcOTlKUnlufJP4/nKsMO7M+d5O4HkkXWciiCus2fhnoh6u+o2T2cuBMuSJL0qMFpKq3+z3GVfC1tvM+3g5Gj1s4G5oX0rTQDe7sIl/TAq924UGji3oFL9L3FPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718260305; c=relaxed/simple;
	bh=/R6u5hUu3DiTTqicsgZVpCA2srHAnEbSq6c6qReTVi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I8lKpf+LNck7p3CqHJ8EIRLjDnEFK3NQGlKOBEGcvG+Gjo2nCOmtOCi/UTH8dwwxYQIk8+3suRMljdGSHhMWpP4XmBSocOQ4n6ANMLTyM+c5zc9vHnYKZyyJfhV1jRv/fovKBpln0M+SsV9oO5rOaN8xQonzgt2FOZrEEUXbnSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Po9q/2Q2; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Po9q/2Q2"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-360736bc465so284046f8f.1
        for <oe-kbuild@lists.linux.dev>; Wed, 12 Jun 2024 23:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718260301; x=1718865101; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pBVT7K7qk7izzrLrbCfdOYZVnSOXnzJ3MLMf5MLb8wc=;
        b=Po9q/2Q273VYCdkB5kVB5/WcCgR/vwu75piu7PJTmJzcb1acNuot0LqRobUH+fGEj2
         VUUEwDTbGmvsGa125A1BUVPV+sbxxfoSqglSKDfxPo9mgvzuCKV+RLTCF+cWzONUdSRD
         ctevK+YVbSxbmwoKWjI7eKoKVz5fGauKKQDbDgjNUfUCiz5izEJJWvNgU2jAolzKxG9Z
         5d10dNnkgOZe2hP+2BjiyAT3dsjT7nRM9LzDCdnX7qHUIdliM1ASBo4RtzoC/OK3X3u7
         uKOz4IsFBohgTcy6vmmOZqmok1TsJUO8wXpDGP1G+pIm1hNtgK1UwnWYfKotSrN3T1R6
         2b1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718260301; x=1718865101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBVT7K7qk7izzrLrbCfdOYZVnSOXnzJ3MLMf5MLb8wc=;
        b=vYJo/mZlSPEimwMIx9b9NWRTQNHfmd/302TaBVIclUqYjmLPnd/UApDR7RK5ZlYfGW
         yDxNBJ5Eging/PFd0qQoXMg5AL/xH98H2yu6zv7dO7/lm8dZaXoPe+PY2bvJMoUKJqIW
         lhBGqPzvQEUHG46TO+xRiqYZYl8h3u/hnZb3kHshD6ofCRfrR44NHjyd7ldEo7pJ8zPh
         bL9+p5n0n21SdY1GZr+wObdYACX0tMnulXeZLH6EUaDn9Y/8BKXTMzru8+UM1+m1XX7k
         ZfhkCD4HuFbSURJcAnvFSlKc7Iwj6NdzC8v3s0pQoI3cDIKZ7oUQBMeTffhcsS6iJmF3
         eY9A==
X-Gm-Message-State: AOJu0YyyEWMeXQE0KQXWIUUuysbWRchUOHaUwaXcu8KU3uM3/MjPZqu2
	aGfow93qVnx78YO7AouwQLn2ccIh9GZysTmlSo+KUUk+6Kp7sLAxstXfff7P3QMPS9ddb7Zi/LZ
	e
X-Google-Smtp-Source: AGHT+IEDuuU6pIME/KuYUu9ORb+sYmWfnj1up5yqyf8cUSFiVSRSvN55Tgn+z1flP67sSEap5yyfCg==
X-Received: by 2002:a5d:4e84:0:b0:35e:4f42:6016 with SMTP id ffacd0b85a97d-35fdf7ac9cfmr2605755f8f.30.1718260300564;
        Wed, 12 Jun 2024 23:31:40 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36075104a3dsm723210f8f.112.2024.06.12.23.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 23:31:40 -0700 (PDT)
Date: Thu, 13 Jun 2024 09:31:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild@lists.linux.dev, devel@driverdev.osuosl.org,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [driver-core:const_driver 12/12] drivers/usb/core/driver.c:80
 store_id() error: uninitialized symbol 'usb_dynid'.
Message-ID: <aa6f5023-745f-4116-8dc9-2f155bf14832@moroto.mountain>
References: <5cd22783-8150-4101-9dc5-c556d94fce22@moroto.mountain>
 <2024061328-unifier-hesitancy-48b2@gregkh>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024061328-unifier-hesitancy-48b2@gregkh>

On Thu, Jun 13, 2024 at 08:18:04AM +0200, Greg Kroah-Hartman wrote:
> On Thu, Jun 13, 2024 at 08:57:13AM +0300, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git const_driver
> > head:   be520b87ec28aa3b5c908a859501fb601bd8b322
> > commit: be520b87ec28aa3b5c908a859501fb601bd8b322 [12/12] USB: move dynamic ids out of usb driver structures
> > config: i386-randconfig-141-20240613 (https://download.01.org/0day-ci/archive/20240613/202406130740.HIr25kIC-lkp@intel.com/config)
> > compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202406130740.HIr25kIC-lkp@intel.com/
> > 
> > smatch warnings:
> > drivers/usb/core/driver.c:80 store_id() error: uninitialized symbol 'usb_dynid'.
> > 
> > vim +/usb_dynid +80 drivers/usb/core/driver.c
> > 
> > be520b87ec28aa Greg Kroah-Hartman 2024-06-11  70  static int store_id(const struct device_driver *driver, const struct usb_device_id *id)
> > be520b87ec28aa Greg Kroah-Hartman 2024-06-11  71  {
> > be520b87ec28aa Greg Kroah-Hartman 2024-06-11  72  	struct usb_dynids *u;
> > be520b87ec28aa Greg Kroah-Hartman 2024-06-11  73  	struct usb_dynid *usb_dynid;
> > be520b87ec28aa Greg Kroah-Hartman 2024-06-11  74  
> > be520b87ec28aa Greg Kroah-Hartman 2024-06-11  75  	u = usb_find_dynids(driver);
> > be520b87ec28aa Greg Kroah-Hartman 2024-06-11  76  	if (!u) {
> > be520b87ec28aa Greg Kroah-Hartman 2024-06-11  77  		/* This driver has not stored any ids yet, so make a new entry for it */
> > be520b87ec28aa Greg Kroah-Hartman 2024-06-11  78  		u = kmalloc(sizeof(*u), GFP_KERNEL);
> > be520b87ec28aa Greg Kroah-Hartman 2024-06-11  79  		if (!u) {
> > be520b87ec28aa Greg Kroah-Hartman 2024-06-11 @80  			kfree(usb_dynid);
> > 
> > Delete the kfree()
> 
> Ugh, thanks, missed that.
> 
> And you are now testing random branches in my tree, nice!  Note, I
> haven't even booted this one yet, it barely builds :)

These are zero day bot stuff.  The zero day bot is always out there
automatically slurping up any git repository it can find.  There is a
way to opt-out but I can't remember what it is...

regards,
dan carpenter

