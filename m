Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F39B372ED6
	for <oe-kbuild@lists.linux.dev>; Sat,  9 May 2026 13:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778333845; cv=none; b=uWFOqgtp1r6qee1+5zyykBhX46btyWx7CNQUmIK3Sb4rBIo9WEXQ3Jkh/nS1nC1OFpNUxwhTc1sY2ZaHB7JUkHEeWlcgRaCIynVixDf3PHwMe1U5NoJRjc6tBKiBJKP/PPm4M0DQ4KYwVJgX2rrhxJiqze6S7XtTNImCKuGNY78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778333845; c=relaxed/simple;
	bh=OX92iFowgg0FF+w6+u2F9KbtP/NGPO0PE4kr+VGE/cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZ/DeotPttFZT4BtTCtxjCnqO8DlvEWgk47at9CsuzIfF0bP12hA5v3iLR0Sd9Mj+Uf4h8vf18C1fGQT1MQM7Leh43fHQjgYJj+nScd92yKsuEQQuJrakLuvEoeLDRcs5QEjS95eHgnL4edBMXcvIsPRyhKrZpR5YCW3ejs6+/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p3QbfDZb; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p3QbfDZb"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8eae9229110so388595385a.1
        for <oe-kbuild@lists.linux.dev>; Sat, 09 May 2026 06:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778333843; x=1778938643; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XVhGQd+1Hu3FoYgscNuPJ/UD58WW9Gt9dwsArDghjfQ=;
        b=p3QbfDZb+SdBPyenvyJDNo+bj6cJBbkAMUV9Tf6Rk9EGZrQfJdBEPQuBKiejJM6Xx2
         DeFigQgUvU3YJqrkbWnzxFyUIh4e4XIjNlQ4OKyAF9JBdqkH6v+PP58s8IA3kJOSLYKF
         bNAnEtyB0FoJtdIJWp6q7g+HJ4oAQp2ovBTWWf/R/Sq2MpgTPGy7RQkYyOu+19lmxTPT
         LVTBqNoxtOLl5PnspRCxNH5QRINBCMR84D818njtoRklkVkmFhpGnlq7wMnGHdHMq9My
         je11xCThFGcVG5TUfwOeCY58io0IWtoeNGtS8/Qnahvqr3OZHQ2laWuT2YGAVdVSGw06
         bS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778333843; x=1778938643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVhGQd+1Hu3FoYgscNuPJ/UD58WW9Gt9dwsArDghjfQ=;
        b=ciz+8bA1nKPANgGgJnR+Zn8HS5x3UqmdNQWlo4Uc0tUNxdOl7WnwgHmPI34bDjT42l
         qLy9Q59U4Z4D/3CfeLN+6mtpPzsmBOaP4f5ZQOVtehGmWkE196H1S9GpbApd2WJqvFFs
         Pyt42Bc6nlTHaALxrGHyy0sPZrlDi7yXPT1yS3KkElrpr+Wnh5XGqNoUIEZH33qj9F0M
         c49kkQXqxeuhLVjoD2aYOzt8fNvZB/ZFWwlY2EYAemMwhIJB+CkDq02RcxLOBdlFgvqG
         54dU62Spp2qaOa2C46mjSXs5x0gdADRsbDbJL2qRt/rSm2PErA0+9E7Y2hrfBSnVaPF/
         1JMw==
X-Gm-Message-State: AOJu0Yw2IECWK5HmluER/ccLc62VvVcCCArFbkl/MY5x6v+dRCNPCA8g
	wnyhk9FLSWw74uhDK2md1AZ3oJGJKv3ZKuSzrJOEDgUkxdgSqXkAiF1eR8SJmPpI
X-Gm-Gg: Acq92OHI/kt+TwXer6vOXd2OWZ9pFbOYSLTg8LbCU/OeOKsIh2B3qvw01kbTDONVUr6
	4CoiwbY9Jqmut/YwL9b5tNRWlnJY7ecBYjYJA4orYBligDXYxXYkaomo3mrodqcDrVqgPU2AwDi
	UGt7cjLQFoYsib4eXdQmjHNM2JZVS6WIZWZ93ELWDCjoINuYIQRnNx5dyahaHLz0ZVIhRwjth8u
	8IluKbAEhZQCY9ot3veB+d7p61u0qnppP6d+3XvPkwUPMoLcEFV6kBnTfhIxKA7dK9ee76yalLl
	hxBfbohJGmLeaZsEGgCkoVxtft6pOI6uOlary5paOwBB9BvfS0hKcOtLdeP7WjYJbHfEDV5Rn2D
	8VHdmmvLNQOgMN4zHE7YWyzqRcr2NH0pBwiQIgZ3rbwVLI90DThecIxHcmDhkRgW1g+Isq5OYWr
	anHoo49LGaq3c4pxHjeW40TjwVGslM
X-Received: by 2002:a05:620a:7017:b0:8cd:b44d:b1c0 with SMTP id af79cd13be357-904d70c350amr2457032185a.53.1778333843510;
        Sat, 09 May 2026 06:37:23 -0700 (PDT)
Received: from localhost ([185.141.119.51])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b87c415fsm538354985a.28.2026.05.09.06.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 06:37:22 -0700 (PDT)
Date: Sat, 9 May 2026 16:37:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 4172/4394] drivers/block/loop.c:413
 lo_rw_aio() error: we previously assumed 'file' could be null (see line 400)
Message-ID: <af84jZRI5Z6-sMdG@stanley.mountain>
References: <202605092030.FAH71Jou-lkp@intel.com>
 <89472180-8c8e-4fd8-87bc-7122d93e6c2c@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89472180-8c8e-4fd8-87bc-7122d93e6c2c@I-love.SAKURA.ne.jp>

On Sat, May 09, 2026 at 10:32:06PM +0900, Tetsuo Handa wrote:
> On 2026/05/09 22:19, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
> > commit: 1a83d226268cfb9ea546febe6515f39584df8fd2 [4172/4394] loop: check refcount in __loop_clr_fd() and lo_rw_aio()
> > config: m68k-randconfig-r073-20260509 (https://download.01.org/0day-ci/archive/20260509/202605092030.FAH71Jou-lkp@intel.com/config)
> > compiler: m68k-linux-gcc (GCC) 12.5.0
> > smatch: v0.5.0-9065-ge9cc34fd
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Closes: https://lore.kernel.org/r/202605092030.FAH71Jou-lkp@intel.com/
> > 
> > New smatch warnings:
> > drivers/block/loop.c:413 lo_rw_aio() error: we previously assumed 'file' could be null (see line 400)
> 
> Thanks, but this is intentional in order to get reported
> at https://syzkaller.appspot.com/bug?extid=cd8a9a308e879a4e2c28
> after printing debug information.

With these zero day bots, I just have access to the email which you see,
not the commit itself.  Maybe one idea is we add a comment when we're
adding linux-next only debug code?

On the other hand, reviewing and sending these emails is very fast and
costs me no time at all so I don't mind either way.

regards,
dan carpenter

