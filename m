Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D20C35891
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Oct 2023 12:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L7fxtSMZ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40839652b97so8380425e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 18 Oct 2023 05:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697632906; x=1698237706; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y2szp5Fj2QNRIcOpX8Z4G3ZR7ob5z2gCp3MstY40MSc=;
        b=L7fxtSMZaY9+xDzjV1NChEUlEUqZk65FYJA1g5kqOOwXOBAHzJAOR2iLlCiyl5O4/H
         z8j/rcTG5dr60smNWgw/49+IbQdAkUGdqtwebSCSyzSkT8qL/ao4Mdn08E8ejAPvnBCy
         T5TjmK+XNgUL3NyWPIAYjSnntaofvqMy6e76MGnkoBkOLP5l0GYoFVYEzz3RvfducNBZ
         J/G6QazhhNHWNwxb8KbykVS4DAO7JCXN9itUb9VYTJdwG0ow2VCChLMaDz80Cwfwa3QI
         S67NY9QWZYPuPCbJpijrh1vLvZn0CMn3y0KdgcHz2DE9tmpL66bYPsLxeO8ju6O5NrHa
         gOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697632906; x=1698237706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2szp5Fj2QNRIcOpX8Z4G3ZR7ob5z2gCp3MstY40MSc=;
        b=ea9ELJpeJjenW5+5+N8wCv1mFhjbER9DGT6j0BiuELAgXt6ZCw24LTiCq43iJMTSJN
         q9I6Q4siz7vTJXTTTfFC25RrWijeqx6wfgXmuxe0KWL5z63mQOVvLHzuRaZl/DD1813x
         b+Ous2vYdrf58gpX4wi8K+pA157vIbyhbLvUHpaPmyU9Mj65Q90V60FTBZ/Thu2+Xk6e
         9qzSoSuzDIRLIonbA9q1AdNzG/YkQDveta5dkTheplho+jI6qVhvBE/FtTLVEAWHcQ82
         plhLb3D5klv6h4+shLGnyR3i/4/Kljt4gJ600F+seAJeYeWi6m9KiiD7ZOQqUufTA6i/
         ygqQ==
X-Gm-Message-State: AOJu0YwNCKwhmFhUcBMG6kNDecH6czYaJ5LAnZ75lXABKdY6j494jKKB
	CLFQoJcXhLMyE9iReWHwN+JDpQ==
X-Google-Smtp-Source: AGHT+IHVq7toTQ4FhZEP+oO0P/ugSMWW94HHAgHGncmDP/rvLPBKxwBz6iwjK+XdxTS3kwkRb+QkEw==
X-Received: by 2002:a05:600c:35c7:b0:408:3eaa:aea6 with SMTP id r7-20020a05600c35c700b004083eaaaea6mr941551wmq.7.1697632905686;
        Wed, 18 Oct 2023 05:41:45 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id fc8-20020a05600c524800b0040535648639sm1604397wmb.36.2023.10.18.05.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 05:41:45 -0700 (PDT)
Date: Wed, 18 Oct 2023 15:41:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [char-misc:char-misc-testing 21/23] drivers/parport/share.c:486
 parport_register_port() warn: '&tmp->full_list' not removed from list
Message-ID: <fd867076-881f-4fde-9d17-4da3e7e661d2@kadam.mountain>
References: <2171426a-1784-41e9-8614-2d3a7a602831@kadam.mountain>
 <ZS/R/H9JujiaJ0x2@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZS/R/H9JujiaJ0x2@smile.fi.intel.com>

On Wed, Oct 18, 2023 at 03:39:24PM +0300, Andy Shevchenko wrote:
> > Old smatch warnings:
> > drivers/parport/share.c:826 parport_register_dev_model() warn: possible memory leak of 'par_dev'
> 
> Means this was already be in the code?

Yep.  It's not related to your patch but when people are working on a
file we like to push them to look at other stuff.  :P

regards,
dan carpenter

