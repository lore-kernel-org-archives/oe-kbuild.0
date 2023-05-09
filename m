Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414B08BE3
	for <oe-kbuild@lists.linux.dev>; Tue,  9 May 2023 15:13:11 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f4271185daso21686545e9.2
        for <oe-kbuild@lists.linux.dev>; Tue, 09 May 2023 08:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683645189; x=1686237189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+dS/MzCVT7+cSf3X4fztCpdcpjrF5B5vWgwHO3Up/uk=;
        b=AyJkHmXX2AIa3rzlDbfXxmTy5HegQZlfATEypEgeL1TtpPBWb42ddzFI1Xld5Eub7o
         aXfDYDoKGTRVjpFGvu1ACxkFYOouJ2wOJBi4JXeeam7ZJLEEsWB5dttedGHH4SrnfIKf
         Wd20aMHa/iRVSjdTb1Rh6Jq1n2pGn7fk3LptepCl7SZmMBGfzjYawN1emu+0WPWs4RPe
         7LzA9B6A29WP2OS0wbdvjgEmkkS2TwdukhXnggYVIOH9qf+Sh3U5ZRLoe27P57LfAe/3
         lMNkaBNP9/OXtg/3agd+GT0u+uZdZSkU+5lmHp4btyQqIxUoSothj48vFhwKuJ4d39ex
         rA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683645189; x=1686237189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dS/MzCVT7+cSf3X4fztCpdcpjrF5B5vWgwHO3Up/uk=;
        b=Yt/tnKr+YA7E1o+aS7I+7d25h8bf4zyI6Dssa16b6I/1z0Jy3NEGxZFFBjp9bgOrpZ
         HKIwKYdcNQ6YdPZTl4OJlZJmh4CFXeO8fLnqMGQXz6FQjbi1INwV/+wHWs9G4WRETVqM
         Z5Dw2mhZkTWv22sbca/Ie0/bGHyJq4Kdy23xn626jj/TAIuxz7HPCqC2d+8+05rIPEqf
         RrTzRmSXsq09hWQMRDXVFCo8wZjhhUfEp1t11xnOS2fBxp/T5cnCe1k6xRfKFO6fDiBN
         USSslH8+WmRXuf5JuEcbXgrr7tyFEr3SHVNDfGXX5YoGZkurMeo3XilvJnhVglwTvr7S
         KXPw==
X-Gm-Message-State: AC+VfDy7PKmiUX++tXrdSIMFm5E6yIb+8ClreK/c6Z82e/mJG0lZhS+K
	7Z6u/imIoYlDIf1kDyL4gV2mYw==
X-Google-Smtp-Source: ACHHUZ7a6L/aqQZtg0//RvH1NYUh6s5mVovCZFo8Mvx1BlegXvEsamYiSroWQfG9x7SrLxLca9c8Ig==
X-Received: by 2002:a1c:4c08:0:b0:3f4:2737:a016 with SMTP id z8-20020a1c4c08000000b003f42737a016mr3801996wmf.29.1683645189377;
        Tue, 09 May 2023 08:13:09 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z17-20020a1c4c11000000b003ee20b4b2dasm19991620wmf.46.2023.05.09.08.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 08:13:06 -0700 (PDT)
Date: Tue, 9 May 2023 18:13:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: kernel/rcu/srcutree.c:1644 srcu_advance_state() warn:
 inconsistent returns '&ssp->srcu_sup->srcu_gp_mutex'.
Message-ID: <782b3fa6-576d-4c26-888e-5dc151feaaa8@kili.mountain>
References: <c0937326-1cf1-429a-9883-30d9d79b01d0@kili.mountain>
 <c33b0348-7f86-47ce-913c-f1ebc6431f93@paulmck-laptop>
 <30f2e760-e2f3-4941-be9b-b9c5624fd861@kili.mountain>
 <4bdbbcd3-6620-4320-ada5-02b71a54106c@paulmck-laptop>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bdbbcd3-6620-4320-ada5-02b71a54106c@paulmck-laptop>

On Tue, May 09, 2023 at 07:08:05AM -0700, Paul E. McKenney wrote:
> On Tue, May 09, 2023 at 08:40:33AM +0300, Dan Carpenter wrote:
> > On Sat, May 06, 2023 at 11:45:35AM -0700, Paul E. McKenney wrote:
> > > On Sat, May 06, 2023 at 10:22:04AM +0300, Dan Carpenter wrote:
> > > > aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1632  	if (rcu_seq_state(READ_ONCE(ssp->srcu_gp_seq)) == SRCU_STATE_SCAN2) {
> > > > 
> > > > We don't mutex_unlock(&ssp->srcu_sup->srcu_gp_mutex) if this if
> > > > statement is false.
> > > 
> > > Hmmm...
> > > 
> > > I could make the above line read something like the following:
> > > 
> > > 	if (!WARN_ON_ONCE(rcu_seq_state(READ_ONCE(ssp->srcu_sup->srcu_gp_seq)) != SRCU_STATE_SCAN2)) {
> > 
> > Smatch ignores WARN_ON().  WARNings are triggered all the time, so it's
> > not like a BUG() which stops the code flow.
> > 
> > > 
> > > The theory is that there are only three legal values for ->srcu_gp_seq.
> > > Because we hold ->srcu_gp_mutex, no one else can change it.   The first
> > > "if" statement either returns or sets that state to SRCU_STATE_SCAN1.
> > > The second "if" statement also either returns or sets that state to
> > > SRCU_STATE_SCAN2.  So that statement should not be false.
> > 
> > Smatch can't figure out that the statement is true.  The issue there is
> > that ssp->srcu_sup->srcu_gp_seq stores a value in the low bits and a
> > different value in the high bits.  This seems like something that might
> > be worth handling correctly at some point, but that point is in the
> > distant future...
> > 
> > Just ignore this one.
> 
> Fair enough!  Yeah, I could imagine that this would be non-trivial.
> 
> Is there a not-reached annotation that Smatch pays attention to?

Hm...  Yeah.  If you wanted you could do this.  I'm not sure it improves
the readability.  Also for some reason my private Smatch build doesn't
print a warning...  I need to investigate why that is...

regards,
dan carpenter

diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index 20d7a238d675..58e13d3c5a6a 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -1669,6 +1669,8 @@ static void srcu_advance_state(struct srcu_struct *ssp)
 		}
 		ssp->srcu_sup->srcu_n_exp_nodelay = 0;
 		srcu_gp_end(ssp);  /* Releases ->srcu_gp_mutex. */
+	} else {
+		unreachable();
 	}
 }
 
