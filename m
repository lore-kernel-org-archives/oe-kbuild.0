Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF1F1117;
	Sat, 17 Jun 2023 14:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BECADC433C0;
	Sat, 17 Jun 2023 14:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1687010405;
	bh=16Q1fD+TC/tzkSSYLPM02Yk89NzHUHa9D6kkl8csDrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=No5rAoGBJIngpvTCaZ3eLJ0HW9pu6h8shBaF9MU8rgT4lQJs1dlr/HRVBU/32RpL5
	 Jx1Yhj3eF7VAFUWfjP71KZ7LpSlroem6xUyGyZBKwKiuc8kIfbcofxPd88FNJ0QT5B
	 K0u11APfWf3P2sMG14HB7qU1KDM8mie+lMGsfpRQ=
Date: Sat, 17 Jun 2023 16:00:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Prathu Baronia <prathubaronia2011@gmail.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Khadija Kamran <kamrankhadijadj@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org, error27@gmail.com, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v5 1/2] axis-fifo: use devm_kasprintf() for allocating
 formatted strings
Message-ID: <2023061750-blog-curse-c1a3@gregkh>
References: <ZIiTL5bzMUgs3L5K@redkillpc>
 <20230616152602.33232-1-prathubaronia2011@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616152602.33232-1-prathubaronia2011@gmail.com>

On Fri, Jun 16, 2023 at 08:55:59PM +0530, Prathu Baronia wrote:
> In various places, string buffers of a fixed size are allocated, and
> filled using snprintf() with the same fixed size, which is error-prone.
> 
> Replace this by calling devm_kasprintf() instead, which always uses the
> appropriate size. Allocate the device name with a unique identifier
> instead of a kernel address.

You are doing two different things here, one is changing the allocation
way, and the other is the name.  If one of those things turns out to
break something, we have to revert this whole thing.

So please make this two different changes, one to change to use
devm_kasprintf() and the second to change the naming scheme, ESPECIALLY
as you do not mention the name change in the subject line.  And that's
going to be a user-visible change, so you need to make that VERY
obvious.

thanks,

greg k-h
