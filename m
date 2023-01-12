Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011A923A6;
	Thu, 12 Jan 2023 10:39:29 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id co23so17643275wrb.4;
        Thu, 12 Jan 2023 02:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YvBwP1qbXfM5TVcGJWo5ITp6jvleo8ktx94SYZAvis8=;
        b=N9glnxZMgEeAnvqdwrVe5kzV1VnBU4wBsN+g36s+Qvs2w7Cz40rzC4i8nV4XiLWeIq
         pbpyEIvmSfUH/7mGBZzGgZ496HpPUHXd8pNlQRQGYnM5sYWJXsZVcT5pfMSOObVFjaAy
         4u3zuXT/pQEFxW/xGyGgOwdECRdV8yyqLzV/nFtlmBSIjz+KeOENzV72gIeSvW/DTC4Q
         eXhG1pO7RqXzCuwiZFfIpWI7oLMpPjJXJupKGEGcCagq+Pv0vrw78Fdx3yLBpFpzwp7q
         m185GGoTCdYgG2uu8d4e7ad47qqqFbVbAygdRi1bGrnKmWGKDGhsnZxLrV429jd8fu5i
         +IXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvBwP1qbXfM5TVcGJWo5ITp6jvleo8ktx94SYZAvis8=;
        b=fekFcYr1YMJ8fwOzoUWXYX6v0FV7S3YUhOZ8XXrd5N3CODoFPe4iIh8KAUyYH++2Ga
         OWW1wZ4Ch8fNeIhQxyYY08IB2uVrhvQuDBGq1QPeTZTzuqNunv3REjFqNgM2HyRzN1tr
         F38Yu0SqgkJhXynfJPPewWFVVXxI9ING8fMcsVzXrFx/RwvgZo/0+69hfAibl/UAJXPg
         OqASvdaQ6UNtyOmbBR4YPzZqwp+H469R5oQCY9Aa/KlO6h+r0dYcNAospteqmiNHpa45
         s9vp4m1+BPTY2cWDtbFGQxJ2QQFS4HP75qMCpdGlpwn+A8gaCP9EnhMqk2I3AOy+7bG8
         aveA==
X-Gm-Message-State: AFqh2kqSqNTKquUSQe7CYQO1O6TF06JpnwyqBzkKwGqYxMlpD9eGhN8Y
	ya977+eugKFlASAr/++iV2wfFBGQXB8=
X-Google-Smtp-Source: AMrXdXvPp2WlOXlQVnUF4f06GdQWuiHOx4RsyPyhMj0YWfYDmC4TVIXgSU3WGKlkWbx2GRPnbaT9Vg==
X-Received: by 2002:a05:6000:705:b0:273:7d1b:7337 with SMTP id bs5-20020a056000070500b002737d1b7337mr44770304wrb.7.1673519968188;
        Thu, 12 Jan 2023 02:39:28 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q14-20020adff94e000000b002b065272da2sm15837766wrr.13.2023.01.12.02.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 02:39:27 -0800 (PST)
Date: Thu, 12 Jan 2023 13:39:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [mnyman-xhci:feature_interrupters 4/4]
 drivers/usb/host/xhci-mem.c:1872 xhci_remove_secondary_interrupter() error:
 we previously assumed 'ir' could be null (see line 1866)
Message-ID: <Y7/jVgvtV7fwctPJ@kadam>
References: <202301120409.BgsBqbgf-lkp@intel.com>
 <1c8f94a1-0c0e-ee52-0552-6a61e4769b57@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c8f94a1-0c0e-ee52-0552-6a61e4769b57@linux.intel.com>

On Thu, Jan 12, 2023 at 12:26:44PM +0200, Mathias Nyman wrote:
> On 12.1.2023 6.31, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git feature_interrupters
> > head:   8cbab306777ebb0805f5201b6add5ee53eb6659e
> > commit: 8cbab306777ebb0805f5201b6add5ee53eb6659e [4/4] xhci: add support to allocate several interrupters
> > config: nios2-randconfig-m031-20230111
> > compiler: nios2-linux-gcc (GCC) 12.1.0
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > 
> > smatch warnings:
> > drivers/usb/host/xhci-mem.c:1872 xhci_remove_secondary_interrupter() error: we previously assumed 'ir' could be null (see line 1866)
> > 
> > vim +/ir +1872 drivers/usb/host/xhci-mem.c
> > 
> > 8cbab306777ebb Mathias Nyman 2023-01-09  1861  void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrupter *ir)
> > 8cbab306777ebb Mathias Nyman 2023-01-09  1862  {
> > 8cbab306777ebb Mathias Nyman 2023-01-09  1863  	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
> > 8cbab306777ebb Mathias Nyman 2023-01-09  1864  	unsigned int intr_num;
> > 8cbab306777ebb Mathias Nyman 2023-01-09  1865
> > 8cbab306777ebb Mathias Nyman 2023-01-09 @1866  	if (!ir || !ir->intr_num || ir->intr_num > xhci->max_interrupters)
> >                                                      ^^^    ^^^^^^^^^^^^^    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > Why is zero invalid?  I would have expected this to be >= instead of
> > > .  Is this a base 1 array?  Ideally these checks are impossible and
> > could be removed.
> 
> Yes, should be >=, thanks for pointing that out.
> 
> Interrupter zero is special. It's the mandatory primary interrupter that must always be
> preset when host is running. So this code is not allowed to remove the primary interrupter.
> Secondary interrupters can be added and removed on the fly.
> 
> I should add a comment about this in the code.

But also if it's invalid, then the code should return instead of just
printing a warning.

regards,
dan carpenter

