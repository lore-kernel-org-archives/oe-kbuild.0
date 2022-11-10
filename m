Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D29320FA;
	Thu, 10 Nov 2022 14:06:23 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id bk15so2376384wrb.13;
        Thu, 10 Nov 2022 06:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FG7CKiEpXdcRfvde0ML9G1im9GN9mW6nWlxvacnKi0Q=;
        b=ICqx4uLyILSvetwtTnyNaaffG6b4eVt/YzSHtkyzgBWchlPmD5FO/ifuIYl8gr0sIh
         0TrIm4hK9Q225FoykzkRaP6hLocNv6sW8fauCGNgsY5BbMw/n9NMU3fV9EvcUwY6Gca2
         7N7FaN7htkQxKplR7UZ/ylabegxk0F+sjDM1j2P/wPjWIi9R9/oqySptO3twU3ODuGl5
         du7KPPNfeiQXR/08ccLI0nL44Y76neMdauRlnC4940kuLK/VQwhu5RShZqyhHm07zTN0
         UaKxR1u2lzQotavvuD9r6rE5SKHwFcS416akkM7qZO4OlFVuO2ln4ionzs/r7UZyU7Y5
         1pfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FG7CKiEpXdcRfvde0ML9G1im9GN9mW6nWlxvacnKi0Q=;
        b=C1VhbmG1gEDpj3DYVhYUoa4DLJWrxqn7JlPjTZRfxlhOL3HtlCMHk2G868qSFJqQby
         gg5NdUi6R7WRBmI1t1JBO3RHolcmt2hB7rN+NCWJkUf5Zr2jgPGmiBDU9V+wWsXd8/Nb
         thvkmuJI44Rha75BJfcKLFR/lp8njNpZnXWI4Ek556yjmATRxmr7K2ElXL44jh/kSxmZ
         mbleKG0Lv2Sm86QqgqDEL5GMSVKYDRUk6mOIoEAk//RfxVegQcYOoocaEty9Vbe7k3U9
         qKeOWJV8RLNC3+LfaQDV9VAmKvnEMEwuQH/0LrGZQTumMmC4V/h0ZZCrVVTegFu6nQOg
         odUw==
X-Gm-Message-State: ACrzQf0wzf1NyHhXW5oq2k+2SQH+owvNFMpoboJPcxo5MlOeY5xPwf5j
	NlJdvPNsbsoqbFssIRFyn74=
X-Google-Smtp-Source: AMsMyM7VrayV4oKDNFXwuxEWi6mw24PIFSuoxPewRux3cihVJaJS9v28dbjL0rRSh2jX8gwV/kuyew==
X-Received: by 2002:a5d:604c:0:b0:236:6deb:6d31 with SMTP id j12-20020a5d604c000000b002366deb6d31mr40929472wrt.282.1668089181518;
        Thu, 10 Nov 2022 06:06:21 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h8-20020a05600c314800b003b3365b38f9sm5908706wmo.10.2022.11.10.06.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 06:06:20 -0800 (PST)
Date: Thu, 10 Nov 2022 17:06:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [sailus-media-tree:master 17/47]
 drivers/media/i2c/st-vgxy61.c:891 vgxy61_apply_gpiox_strobe_mode() warn:
 impossible condition '(reg < 0) => (0-u16max < 0)'
Message-ID: <Y20FWdCTPiKWOdNd@kadam>
References: <202211091255.jCcREh11-lkp@intel.com>
 <fcb1fc9c-df59-aefd-93f7-9acd2df44f91@foss.st.com>
 <Y2z4n8b+tEtzNR/4@kadam>
 <Y20ErxBkDVVGzYim@kadam>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y20ErxBkDVVGzYim@kadam>

On Thu, Nov 10, 2022 at 05:03:27PM +0300, Dan Carpenter wrote:
> On Thu, Nov 10, 2022 at 04:11:59PM +0300, Dan Carpenter wrote:
> > On Thu, Nov 10, 2022 at 12:43:30PM +0100, Benjamin MUGNIER wrote:
> > > After running smatch on my tree I couldn't reproduce this warning:
> > >   warn: pm_runtime_get_sync() also returns 1 on success
> > > I'm using the latest smatch cloned from github. Do you append some
> > > options to kchecker to get this output ?
> > 
> > TL;DR: Thanks for the report!  I will fix it later this week.
> >
> 
> [ snip ]
> 
> > It creates a fake environment to test what !ret means
> > for uninitialized variables.  The check_pm_runtime_get_sync.c check sees
> > the "!ret" condition and says, "Nope.  That's supposed to be "ret < 0"".
> > 
> > Smatch shouldn't be printing warnings from inside the fake environment.
> 
> Nope.  That's not it...  It already has code to not print from a fake
> environment (unless you're in debug mode).  It's a mystery how the
> kbuild bot triggered this warning.
> 
> :(

Ah...  Seeing your patch helped me figure it out.  The kbuild bot does
not have the cross function db built so when it sees:

	vgxy61_write_reg(sensor, VGXY61_REG_ROI0_START_V, crop->top, &ret);

Then it doesn't see that "ret" is modified.  On my system I have the
DB so I don't see the warning.

regards,
dan carpenter

