Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECD634C9A3
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Feb 2026 16:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772210975; cv=none; b=IA15dzh5IrVM84QKOykIdenXz+gLnsiYAxoFBRnCe5r0eCOPdQVV+XVg07PS4mAcp9gpyDC0q3I9Iv7Q7QKhwIFi/umr+qzCDZyh/xeugNkBY78E6mppBeNCV4ZgHBtgMkTD0zEvsVpFfCk50T7Lu6ZhbOoN2BSiusBZUT6Vi+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772210975; c=relaxed/simple;
	bh=nB8ACLDa/maVuyIonK23zA1TMYBPWmnsl35nExKZrIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWZd+8GY74pcJeFi2/PMjcXzrwUF9y3nMdVdFJ5nStzG7qFa6MTRFWR7Hbz+61tLutjVSLjdQxAEZY4MigQoUwUeQY6qcbs5Uxm5inwJYZXPfcoW3pCGKpvEMZwfNAGNdee2yW5TxecfZicm5cpwciDfyCpWw6lxkXprFR9Ie68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XTqs5B9X; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XTqs5B9X"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43767807cf3so1530894f8f.1
        for <oe-kbuild@lists.linux.dev>; Fri, 27 Feb 2026 08:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772210962; x=1772815762; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A/LFLpePUhhqI6yxDTeIBKOmLDg2carPPgsWLX2flrE=;
        b=XTqs5B9XxSwnK7ycBxs9oMB1FJVCxm0jYl3iPBHmSUo1XZp/yH4mvtWQL6NIgujw3A
         DCGHjt5nMRE8kyn4x917EWtzUfLxkhHndnLfZvSobZsmsrb+Hu0dLW9hxrIhMNosoIU6
         uPanuBbdp+h/rONzivmpswcvNwDQwbP3KKgQ244cD9xbeOSFkp9idVenI+UTkKK1c5XN
         vfPLwxRNNNMqU4Vj5aRCbZuOSAzQtrCFl9JNTP3Rw7Y4ddSBzOfAJ71Yow18SdRzDOTS
         L3GpBxU5Z+fFAGOlULY0tkPgW0G9HyBiHOiVYEjrF9SbhpOwYjkO9DJVydgOfFHji8Sk
         tIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772210962; x=1772815762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/LFLpePUhhqI6yxDTeIBKOmLDg2carPPgsWLX2flrE=;
        b=VpJKnQpBxxl18giWNBQAbC2029b2fncgFSdGGlS5XqE+GDJ3kUyBMid1J4EWi0IH9U
         ktHletoJJarWWMDB/DjxUvGueeQ1PYzJEFhQ081Z/Efd0hLBO931sHJdnFnrNLjQevMV
         AiMnvDCJS214q9YvBTozlo3BoFi0WWIq/dczlItxslEzdW8YY8iHM3NLyNKnG1nt3zWa
         fwugArJjRDBgUhoTYVOhpXRlbbz9r7fIcV8siJZPPzTOGnRXiU8/+px9CgzMjCxf5eyO
         MxnK3692ZTzBoNWMj+okMKL673yxlSdkxdVroDbaqjP5nCe+4sSdN2VOJYaRQYLIw4+/
         DgPw==
X-Gm-Message-State: AOJu0YzauwD+nzVIYNJhpDL/G+/i53Qoe63IGr6vVFcd8weB11koPvcd
	S3rj2rzt/4mxUcQ+U5eVif4+SwD9tdsK4EdJkeaumrqXjuP01jSaPVoi+VQv/d/BrTI=
X-Gm-Gg: ATEYQzyt3sY2ZD2agk1XGLP9Qx9thNmU2D/qQCTYqtL+gk9k7nRoGxZtbBh/7JZ+g9l
	HntxQdG0MDGm2xG7k1z9cOIhL3KSaf1QIvaHwdcLuUnG7Eed+8w46uRBC3WcSH+epT1BvW2ryED
	agdNxP9z/L1DqjW3pdoIHULmh8MB+HCftUuLc9JjAIxGIk5aP05kEPxZR62S9E35H6yvdyl2ExJ
	DyyKt7dXxgRnFY9Uc8vfn6AIWnFxjqERI/GZgn8MzGK2Ham/10C8pObyrg8swxEq2xsjCqzsls4
	wwry+Z/5DPImooC2xnENKVYocO0vVb/TmSRUn6LtjajJVROiAZnNfYgtw1PX5g0Ld1j207rR1g7
	id+Hvy9QwEqSVZHlVIPNxvYRplWLxA6+mmsDvl9ijEegkjJtd+CB/PkR+c5qHZ3Doap4oMRV5fe
	38QftjkG4z5uRv2yGQaUo3vTVJVhLt
X-Received: by 2002:a05:6000:1a8b:b0:436:34e8:e661 with SMTP id ffacd0b85a97d-4399de279aemr5867410f8f.31.1772210962058;
        Fri, 27 Feb 2026 08:49:22 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60f8e5sm8838998f8f.4.2026.02.27.08.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 08:49:21 -0800 (PST)
Date: Fri, 27 Feb 2026 19:49:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [linusw-pinctrl:devel 16/22]
 drivers/pinctrl/pinctrl-cy8c95x0.c:1325 cy8c95x0_irq_setup() warn: passing
 positive error code '1' to 'dev_err_probe'
Message-ID: <aaHLDnSHe--dR_63@stanley.mountain>
References: <202602271847.vVWkqLBD-lkp@intel.com>
 <aaGzzsLMeW2DTjiE@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaGzzsLMeW2DTjiE@ashevche-desk.local>

On Fri, Feb 27, 2026 at 05:10:06PM +0200, Andy Shevchenko wrote:
> On Fri, Feb 27, 2026 at 02:40:45PM +0300, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
> > head:   a901e8705f89f3616fad3bb6aeddba33be86b08a
> > commit: 014884732095b982412d13d3220c3fe8483b9b3e [16/22] pinctrl: cy8c95x0: Unify messages with help of dev_err_probe()
> 
> False positive. This commit didn't change the previous behaviour. Perhaps
> smatch complained earlier?

Smatch only detected it when we changed to dev_err_probe().  We could
make a check to detect the bug in the original code I suppose.  Let
me add it as a todo.

KTODO: create static checker rule about positive returns from probe()

Description:  The cy8c95x0_irq_setup() is called from cy8c95x0_probe()
and probe() should only return zero or negative error codes.  Make a
list of positive returns.  Then check if this is a probe() function and
we're returning a positive.  Ask on the smatch@vger.kernel.org mailing
list if you want help writing this check.

regards,
dan carpenter

