Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3FD2036EF
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Oct 2024 08:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730189555; cv=none; b=sBy7BnzwjU+QiWqP3bvwvs3oLz1YCcXJ4E9POtqaeH/j+qc24ngbsYtIzdxgu7E0g8fDBfP5werB9HxYRNG3wW9OPdrDZSGWjGTEGVO0aVnr+c3c5Wo5ba9ikR+iiZlP/8zROIK85x66KKBt6gtI17ZTyffw3byBEFrXBC+rxI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730189555; c=relaxed/simple;
	bh=L61YEgx/lo9JZKB73OERoCqdxQb3RDZR5YshtpqNrdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptDRFmYxu96XbV9KiiaX36mUPPNOgnrnfbscJOwg8O71TWN7xs5E439b1gt5upvqn3vOdL14Eu25+KUMCxt4Y+my1Lb8NKvGlkc+mAJYK06Ia0KE2LkSQBo5YyIiT84RlfIvxKJfuLZ6Gx3Dtk3f/d8QwlA7AFagBelk9b8e7W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UwcQpT2Q; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UwcQpT2Q"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c903f5bd0eso10121801a12.3
        for <oe-kbuild@lists.linux.dev>; Tue, 29 Oct 2024 01:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730189551; x=1730794351; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HakSva0I9pwaUyWDMav2cQ/m5Vq/WsZqCAl3dC4haeg=;
        b=UwcQpT2QPRnzHUIu6Byh2b+bw4SAxFQDUNYuLEgjYFssfxljwSmofPXDUdOj6g1eHX
         319lckttr8neceIFocC76r8QiPApbEBqJuIUO9w9GPuiw4ZK8A30Kk75ngWUZ15R3lq1
         2e5ZbEOCalyoQzXoB6dLM/R9L/wpfxsQT2uZN8ZDsgNciD0LVtPvmW0Qcw0IZg2VNpn2
         c0d14AyPYbiQ28C32+TtHmmeqXQwxSxnMoDokN+R6uHAfZrEkdPfBglhV3CIdaCdJSp+
         RqVCaechTiesR2ObHooPCEmH4KW1qyRykaimR8WqR1Cjk2MS5BNzTE6tXuScJHZCXcqQ
         bofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730189551; x=1730794351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HakSva0I9pwaUyWDMav2cQ/m5Vq/WsZqCAl3dC4haeg=;
        b=dJH2dOcXzE94ZO2FsYvmfT6W4gHb7+mF7vMncDIu2+cSg3HEQRPDFBhpiEJNBrxjWA
         /sAdkAfiJdz8GlVEB+Kzuji9L2G1oIAFl25xoOAinwj0gdR61iv5NCJzooq1Y1CynTPy
         B5uZMIfoFLzUSRNtnU+Tr3E45wedFmXwUXwSU1ZkOWj3hmkKPWVmMSae+z14lTzCXxO4
         x7eE9BL8t3N6WwKVbR5a50iW8v/uIOHnPgj0zSxBgMRKw1AQTpeDkTOm4aXONAbPsGKE
         1J1xhcva4579g9cCXZOCu/q/NjXoAXY2S5LWoaxCWDFyEyU8yhs5QsEW/hZaKDqPandJ
         XuYA==
X-Forwarded-Encrypted: i=1; AJvYcCUkIgsDeddVHSKH28slg4R0ouLyngKR002SHBTuRuY7ESNX/t0A504eAzDZkW0juf2H+kk61jtojsc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+ZtLVuMb2tUsO3bAdkZ+v3LuJmJDb6qM1RSKP4SnLVh6gavSY
	kBGrvJj+UPTOCCAm1NxLvcc85lLq7bsRq5HHQq/fOeRn1JAmxTjerOuy1M4ez1A=
X-Google-Smtp-Source: AGHT+IHEeefsSzqeEql5jjfjKyH3oJc+6dvCePlapfnGvC0uikLE2N/GI77Z8Uwy47h2ONHKBhgQiA==
X-Received: by 2002:a17:907:980f:b0:a9a:46f5:d6d7 with SMTP id a640c23a62f3a-a9de5c92bcbmr1203699066b.5.1730189551541;
        Tue, 29 Oct 2024 01:12:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3a08906dsm441345266b.209.2024.10.29.01.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 01:12:31 -0700 (PDT)
Date: Tue, 29 Oct 2024 11:12:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philip Li <philip.li@intel.com>
Cc: Matthew Sakai <msakai@redhat.com>, oe-kbuild@lists.linux.dev,
	Mike Snitzer <snitzer@kernel.org>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: drivers/md/dm-vdo/data-vio.c:976 vdo_launch_bio() warn:
 inconsistent returns '&pool->lock'.
Message-ID: <ba8d1a6f-1b4a-4ce2-a426-ce8de23f20b6@stanley.mountain>
References: <717e8949-55c4-4461-8951-3e582e9b77ef@stanley.mountain>
 <f074f848-5a26-473b-ae98-1932e9a8cbd1@redhat.com>
 <ZyBQa45RTWXiXJke@rli9-mobl>
 <ZyCLo51ZyjxX7eQK@rli9-mobl>
 <13937d22-46ac-480a-8956-f89a0fd295ac@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13937d22-46ac-480a-8956-f89a0fd295ac@stanley.mountain>

On Tue, Oct 29, 2024 at 11:07:07AM +0300, Dan Carpenter wrote:
> On Tue, Oct 29, 2024 at 03:15:47PM +0800, Philip Li wrote:
> > On Tue, Oct 29, 2024 at 11:03:07AM +0800, Philip Li wrote:
> > > On Mon, Oct 28, 2024 at 07:00:40PM -0400, Matthew Sakai wrote:
> > > > This should be addressed upstream by commit
> > > > 872564c501b72ae0c84af51084753e8652e4a84b ("dm vdo data-vio: silence sparse
> > > > warnings about locking context imbalances")
> > > > 
> > > > That commit is from February. Would it be possible for these checks to use a
> > > > more up-to-date version of the code before warning us about things that have
> > > > already been addressed?
> > > 
> > > Sorry about this Matt, the bot side will check why this happens and fix
> > > the issue asap to avoid meaningless report.
> > 
> > Hi Matt and Dan, would you mind do a further check of this, per the re-test,
> > smatch warns as below on v6.12-rc3
> > 
> > 	drivers/md/dm-vdo/data-vio.c:982 vdo_launch_bio() warn: inconsistent returns '&pool->lock'.
> > 	  Locked on  : 972,977
> > 	  Unlocked on: 982
> > 
> > The corresponding code of drivers/md/dm-vdo/data-vio.c is below
> > 
> 
> Ah.  Right.
> 
> The cross function DB doesn't scale well enough for the zero day bot to use so
> it didn't detect the fix.  If we had the cross function DB then that silences
> the warning.
> 
> 1) I re-wrote the locking check so it detected this bug where before it didn't.
> 2) The kbuild bot was using the new check on old code because Matthew Sakai
>    did a branch based on 8 month old code.

That's not it, is it...  The branch was based on the latest code, and the
kbuild-bot bisected it back to 8 months ago and it happened to be right.

Anyway, it's a rare coincidence.

regards,
dan carpenter

