Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F585360;
	Sun, 28 May 2023 08:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2902BC433D2;
	Sun, 28 May 2023 08:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1685264275;
	bh=+Z8b5BGxmEusB3RqdWRSJeINY+2EbMtiB0r09qz52HI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r/34xDGLGn65sBIfi+1y4AXv1uYX26pIVTLcReKJ3U5z9nbymnwaMHXMaG5VvhGlA
	 khsIUFRt3AGRQACTdVjnHgb3ntaNUyanG6ZRkvZqNa0qseGYvd18QI5KIwQNcQT0b9
	 5MNObIjKwJARX5CF91LzzgCasEXZpjXQCSEkRW6I=
Date: Sun, 28 May 2023 09:57:52 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Prathu Baronia <prathubaronia2011@gmail.com>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Khadija Kamran <kamrankhadijadj@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org, error27@gmail.com, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v4 3/3] axis-fifo: cleanup space issues with fops struct
Message-ID: <2023052808-predefine-thrive-d84a@gregkh>
References: <ZHHE/H2p4Go/Igc/@redkillpc>
 <20230527115101.47569-1-prathubaronia2011@gmail.com>
 <20230527115101.47569-3-prathubaronia2011@gmail.com>
 <20230527223111.jidik3ffcsxdkenb@pengutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230527223111.jidik3ffcsxdkenb@pengutronix.de>

On Sun, May 28, 2023 at 12:31:11AM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> On Sat, May 27, 2023 at 05:21:00PM +0530, Prathu Baronia wrote:
> > Add required spaces for proper formatting of fops members for better
> > readability.
> > 
> > Signed-off-by: Prathu Baronia <prathubaronia2011@gmail.com>
> > ---
> >  drivers/staging/axis-fifo/axis-fifo.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> > index d71bdc6dd961..59e962467a3d 100644
> > --- a/drivers/staging/axis-fifo/axis-fifo.c
> > +++ b/drivers/staging/axis-fifo/axis-fifo.c
> > @@ -716,11 +716,11 @@ static int axis_fifo_close(struct inode *inod, struct file *f)
> >  }
> >  
> >  static const struct file_operations fops = {
> > -	.owner = THIS_MODULE,
> > -	.open = axis_fifo_open,
> > +	.owner   = THIS_MODULE,
> > +	.open    = axis_fifo_open,
> >  	.release = axis_fifo_close,
> > -	.read = axis_fifo_read,
> > -	.write = axis_fifo_write
> > +	.read    = axis_fifo_read,
> > +	.write   = axis_fifo_write
> 
> Note this is only subjectively better. IMHO with just a single space
> this is perfectly readable. Aligning the = might look nice, but it's
> also annoying at times. When you add another member (e.g.
> .iterate_shared) you either add a line that doesn't match all others, or
> you have to touch all other lines of that struct which (objectively?)
> hurts readability of that patch. Also for generated patches this kind of
> alignment yields extra work. (See for example
> https://lore.kernel.org/lkml/20230525205840.734432-1-u.kleine-koenig@pengutronix.de/
> which required semi-manual fixup to keep the alignment after coccinelle
> generated the patch.)
> 
> If you still think this is a good idea, I'd ask you to stick to one
> style for the whole file. e.g. axis_fifo_driver uses inconsistent
> and different indention.

I agree, there is no "requirement" that these fields are aligned at all,
so I would stick to the real fixes that are needed for this code to be
able to be moved out of staging instead.

thanks,

greg k-h
