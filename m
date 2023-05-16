Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AB0261CA
	for <oe-kbuild@lists.linux.dev>; Tue, 16 May 2023 12:22:01 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-30789a4c537so7695196f8f.0
        for <oe-kbuild@lists.linux.dev>; Tue, 16 May 2023 05:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684239719; x=1686831719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kaW49O1ytPRy66dRdEZM0z64J57sMS3S4iCiE71TQcY=;
        b=C6LEqLe+Y+pUqdgOQwkmXAjJeeGcqCJnKw2lZ4E9sWDY4lP3niPAofngO6fHGzljfs
         4rEUqmSWuzxX2Y/0Qg4Jr9UGBtpPWjZOLPAPLk4Xzv0Kpdh1pW2y2CP8HGfqvkn0XAMo
         r1BYYIJX7pVhNFA5+j5th9jxctQEEXKRBlgnpkyIhVNrP43OIVBK9Ml+PxjMCVgsSraE
         PQXkXDAPS6bfqnUFBtzniWdaaEEbw4/FjbzqTeqtFsgL2bg7FsX4gVfPmLZYn5lT/7ey
         LqFXEjn/PsaMFiVyLNGVJJeeEkvL5m2Dhi3Sx4VElPUrHcr99EHK7Y0CNBUWm5cpscrw
         7x+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684239719; x=1686831719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kaW49O1ytPRy66dRdEZM0z64J57sMS3S4iCiE71TQcY=;
        b=biqGYQjBUyUcuRPxj4LRyEUN0xPxxkAEwJ3zeNqQ4KMlj3Oq7lJ5EzSkgPqOjVnCFn
         6MX4oOIp38ck104qBPFFsmSY/2SxuN7FJhw+3NFmrn+Hq97jZUeNZykO4C3E7xcEdivy
         JniALPlgS4bvAqcU5EIETrFBQTD5pIAahdy7cZK5pWzSyJ5GnAEwSg+cK9meEJgZyvAt
         Ya5kRwIOrRyh90eYW1nB71EoRqYR0FeTYVsPgeyatyHokGz62AkhhuzRWXeWqkogabLG
         tWDGMa6oJR2stzClL1XrVgFV0G6O8jtHeA/bAI4cu8OZ5VILGzF0joDQsYrwZ5rFmHOL
         dNbw==
X-Gm-Message-State: AC+VfDybFBrJNmXdz4OD/ft6FQJj7QJPW7SyoSAJUShINhfmcBC3HcwP
	ahfQUD3wZrpA9IftRLwXo0TZAg==
X-Google-Smtp-Source: ACHHUZ4vUarAOtyBr1xsb+6qWsnr0CKzd8c0AEwqAmrStrVoVtpxRwmfUVwA5tMQQI5qCSn2VSFcfQ==
X-Received: by 2002:a5d:4ac5:0:b0:309:5dc:4c30 with SMTP id y5-20020a5d4ac5000000b0030905dc4c30mr7650012wrs.62.1684239719629;
        Tue, 16 May 2023 05:21:59 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 16-20020a05600c229000b003f41bb52834sm2109940wmf.38.2023.05.16.05.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 05:21:58 -0700 (PDT)
Date: Tue, 16 May 2023 15:21:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: kernel/rcu/srcutree.c:1644 srcu_advance_state() warn:
 inconsistent returns '&ssp->srcu_sup->srcu_gp_mutex'.
Message-ID: <0e191d4f-43ad-476a-92e0-d038715b25ca@kili.mountain>
References: <c0937326-1cf1-429a-9883-30d9d79b01d0@kili.mountain>
 <c33b0348-7f86-47ce-913c-f1ebc6431f93@paulmck-laptop>
 <30f2e760-e2f3-4941-be9b-b9c5624fd861@kili.mountain>
 <4bdbbcd3-6620-4320-ada5-02b71a54106c@paulmck-laptop>
 <782b3fa6-576d-4c26-888e-5dc151feaaa8@kili.mountain>
 <2ef061eb-e82d-4c16-a333-e499095a7162@paulmck-laptop>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ef061eb-e82d-4c16-a333-e499095a7162@paulmck-laptop>

On Tue, May 16, 2023 at 05:17:57AM -0700, Paul E. McKenney wrote:
> On Tue, May 09, 2023 at 06:13:02PM +0300, Dan Carpenter wrote:
> > On Tue, May 09, 2023 at 07:08:05AM -0700, Paul E. McKenney wrote:
> > > On Tue, May 09, 2023 at 08:40:33AM +0300, Dan Carpenter wrote:
> > > > On Sat, May 06, 2023 at 11:45:35AM -0700, Paul E. McKenney wrote:
> > > > > On Sat, May 06, 2023 at 10:22:04AM +0300, Dan Carpenter wrote:
> > > > > > aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1632  	if (rcu_seq_state(READ_ONCE(ssp->srcu_gp_seq)) == SRCU_STATE_SCAN2) {
> > > > > > 
> > > > > > We don't mutex_unlock(&ssp->srcu_sup->srcu_gp_mutex) if this if
> > > > > > statement is false.
> > > > > 
> > > > > Hmmm...
> > > > > 
> > > > > I could make the above line read something like the following:
> > > > > 
> > > > > 	if (!WARN_ON_ONCE(rcu_seq_state(READ_ONCE(ssp->srcu_sup->srcu_gp_seq)) != SRCU_STATE_SCAN2)) {
> > > > 
> > > > Smatch ignores WARN_ON().  WARNings are triggered all the time, so it's
> > > > not like a BUG() which stops the code flow.
> > > > 
> > > > > 
> > > > > The theory is that there are only three legal values for ->srcu_gp_seq.
> > > > > Because we hold ->srcu_gp_mutex, no one else can change it.   The first
> > > > > "if" statement either returns or sets that state to SRCU_STATE_SCAN1.
> > > > > The second "if" statement also either returns or sets that state to
> > > > > SRCU_STATE_SCAN2.  So that statement should not be false.
> > > > 
> > > > Smatch can't figure out that the statement is true.  The issue there is
> > > > that ssp->srcu_sup->srcu_gp_seq stores a value in the low bits and a
> > > > different value in the high bits.  This seems like something that might
> > > > be worth handling correctly at some point, but that point is in the
> > > > distant future...
> > > > 
> > > > Just ignore this one.
> > > 
> > > Fair enough!  Yeah, I could imagine that this would be non-trivial.
> > > 
> > > Is there a not-reached annotation that Smatch pays attention to?
> > 
> > Hm...  Yeah.  If you wanted you could do this.  I'm not sure it improves
> > the readability.  Also for some reason my private Smatch build doesn't
> > print a warning...  I need to investigate why that is...
> 
> There does seem to be a fair number of instances of unreachable() in
> the kernel, so why not?
> 
> May I add your Signed-off-by?

Sure.  I probably does make it more readable to some people as well.
(It's a very narrow band of people who it helps).

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

