Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9459BA3E;
	Tue,  4 Apr 2023 15:04:04 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id m6-20020a05600c3b0600b003ee6e324b19so20306161wms.1;
        Tue, 04 Apr 2023 08:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680620643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JBdBtzyHFd6lc83YrQIneyeohpNPTJ/y3GLkeIJnfvo=;
        b=gkpaUlEImekGGm0xeTEjW/sQV7ex2AWGhlLK447E4ZfuKspHi6VwBheI3NIGcQxJRm
         wD2o1vYPxVT5hXvusr8G5O11sBeKOkAay9cpQIurpmU86sryhDrBYL17lkjWCguGZrtz
         emLFUqUlZcoDLML3HklU6z19yXOsrh74oN9O6QsqbhILv5Xv+kKxWgZsxgBSnsczwJuM
         pvXfOMmpwz3WbDCw2n2qfy40UD+zc3+Rv7XfNUX6kvHOvYCqMdDdgMsSH2oZqjrxyw9w
         7cdGd4UXjjkFQDmo11zUBb6SLI0ErWduKUWK2Ac5UK/VMiVEA6P1LpLiV9h0nAmzIOD0
         7o8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680620643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBdBtzyHFd6lc83YrQIneyeohpNPTJ/y3GLkeIJnfvo=;
        b=EU9O+FsX17NFkcJtSJxthvxoKsn7jdRFENXmdS+HTTTvp2h31ZisuWHZ+jQ93LXiAl
         liIdrzmCONWuhUAz5nYXhfif2/0N5dqbztwDYOklMftiICYk7716t0xw+dc9nx/x1Idq
         MX0IrBy6fEi80AXGoRFSIu/U2UtgHhepQE16hjVXzPxfUYkCJcw+xxvCFbP8/wJ1pHhE
         9j4lN80gDz1GFA6pWitRKSsFUtnfbqYylWeoWKrZgSzquGDB35XYKTpZOU2DSsVtcNj9
         rx1SVO07PAi9+x8jHIC2R2jG3wzbxD875jB8PH6jT1X0fZ5cYo+F+PuNDOZi9Ltza/GF
         e2Yg==
X-Gm-Message-State: AAQBX9evfURL3kMck3xOheXnYpupRrUBNgSOS+fXsPETr1PXuTTUDOpY
	gwduHmqzqzCGIgIS3XYMDvc=
X-Google-Smtp-Source: AKy350bNnmlpCILUHmdUFYCLAb/iqR3do08Nj32nLRxLYpqec4RmcscQRBFttmaJwosh4wJ7chwjog==
X-Received: by 2002:a05:600c:3646:b0:3ed:9ed7:d676 with SMTP id y6-20020a05600c364600b003ed9ed7d676mr2446609wmq.13.1680620642903;
        Tue, 04 Apr 2023 08:04:02 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o5-20020a05600c510500b003ef5bb63f13sm23180970wms.10.2023.04.04.08.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 08:04:02 -0700 (PDT)
Date: Tue, 4 Apr 2023 18:03:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: Philip Li <philip.li@intel.com>
Cc: Joseph Qi <joseph.qi@linux.alibaba.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, oe-kbuild@lists.linux.dev,
	Heming Zhao via Ocfs2-devel <ocfs2-devel@oss.oracle.com>,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: fs/ocfs2/super.c:1809 ocfs2_mount_volume() warn: missing error
 code 'status'
Message-ID: <c6304335-9b5f-4082-b804-e754cf77ce0c@kili.mountain>
References: <9e1d6835-34fc-49cd-869e-d99d9b546d17@kili.mountain>
 <4154b815-3be4-53de-1bc0-ca87ecb925a4@linux.alibaba.com>
 <1e7d7076-ddd6-41b3-b824-673986c35477@kili.mountain>
 <ZCw5Ucw5CS6nXosr@rli9-mobl>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCw5Ucw5CS6nXosr@rli9-mobl>

On Tue, Apr 04, 2023 at 10:50:57PM +0800, Philip Li wrote:
> On Mon, Apr 03, 2023 at 02:20:55PM +0300, Dan Carpenter wrote:
> > Sorry, the kbuild bot is not supposed to send duplicate warnings.  I
> > don't know why it was sent again...
> 
> Sorry about this, we should ignore this commit in the bot. Now it is configured
> to avoid the false positive report.
> 

Fantastic.  Thanks, Philip!

regards,
dan carpenter

