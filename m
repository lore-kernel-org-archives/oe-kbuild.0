Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727DF19A288
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Aug 2024 21:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724708211; cv=none; b=X+Z3H4DiIUwmzZj44f5pljWHiwp+t1tjzVbmudNJSJfO1nOMtVPgEHiI6m4VrZ99adkZ0K+DUTJNcMwwmvH/a3NmZzloLGo+iG7kqBDSkWSPmYcbWI4sm30fiQJQwJ8ZZ8W/nORVTzXzuCUlt2u2Q3PvmCsDs29LnzSj2cdjzYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724708211; c=relaxed/simple;
	bh=GYfQ2aJ6+j6KIn4wswZK8fwF1ipJKIXjPWzU4CXaGP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UgXdNy0IK1RInD5FDNrTGYw2ML7hTQ/RXTcmtsA055Ltlx5Zi8gvuZDRnHKhQ0SPEtYO+O3tdPUyQAaKiAZNsTlihF00ZbPp68PMD990tzgHuie3mp3nQ8xJl9ocusO0wDqh6L2WMUk2J4zSoITiwwZaZEZZkNaAVjEinvYUpCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ey2gx3xl; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ey2gx3xl"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5bec87ececeso5241103a12.0
        for <oe-kbuild@lists.linux.dev>; Mon, 26 Aug 2024 14:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724708208; x=1725313008; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mrXFFnRr4yU7Etmc4wy+t+cJrIu15SH8enM9SvrbiKQ=;
        b=Ey2gx3xlnY+i9C98fpzB+nJwVMk6jsgHMfcwAe181ZMuDwAQNoS0ubdj47p1/Injgd
         d/E/4Aui+oNpxGldXp94Hp8BBsgOWrCiuIfwQSTLzJML16o2OlLoYbd0+5URDaBUnkAv
         QALmxFGVqcgkYq8p/lWC+EJhcEhDfXW1uPoWZb2B7HnfYKrQnhSWQDPDVhTCK2+mLaoh
         EMmxEFF61m7XrLCar0G8hA5ITvQIx+DY+e71Bfv59OaPwAOwLfmJb3ohmZAAUzoYEpvH
         LJQ9NpK0V81odmQDKOT26pGLWsQaJ1ND4L3ojhEa5sip4vcJju2HyzELnjwR0EL/OewX
         EzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724708208; x=1725313008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrXFFnRr4yU7Etmc4wy+t+cJrIu15SH8enM9SvrbiKQ=;
        b=xNnMNgv5CwMrM55tI3hB4TMtFJ+a/eXbQ1KvQdYCq/gwA6AAvOfpK+wsFST41rQSMF
         7TLpqxXWQjI2Yug/GTeGzvBvD5PZm/6SqqcUMjjn27RUzd3No9QO1I07D9q8n2BCZQDg
         n0yyLWb8kKSCWyqDI+ZcabBtimevgDmYM76TEDWv4iJpTkC2XisfsK+evdD7ysBs8F+2
         iX7pH0p8w4NVDvqNEiXG2K65RTES6SlhV7RRk+AKH7I8HLjVY+O8GvamSQpSx7J2PbB0
         uRYSkrJQgRbBTTApdTmGBHpERC4tq4AWZaIk8IC9fLpNLM9Fz9seEKWlM6faup6Csd2t
         7pkg==
X-Gm-Message-State: AOJu0Yw4hyGbSrn+kZYosjx2Ok/LHrqlU4gmBp3dqsgD7kblmlSi+/wQ
	iSXGXQ7lTDz92YSmgNiWWM3p9LyBty33fVEisgQyt9Pp0iAiM/1CfeZVVk/bdAg=
X-Google-Smtp-Source: AGHT+IFDd3BFQ04/0ytE5hJOoHnNG49Q5+Iezc5rR48h02qI4ikRCEhCnfwG37487ZRj5/YBze6HTw==
X-Received: by 2002:a05:6402:84b:b0:5be:f1a7:c2cd with SMTP id 4fb4d7f45d1cf-5c0ba312cc8mr388408a12.31.1724708207427;
        Mon, 26 Aug 2024 14:36:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb48106dsm218224a12.79.2024.08.26.14.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 14:36:46 -0700 (PDT)
Date: Tue, 27 Aug 2024 00:36:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild@lists.linux.dev,
	"Martin K . Petersen" <martin.petersen@oracle.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-scsi@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Peter Wang <peter.wang@mediatek.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Avri Altman <avri.altman@wdc.com>, Bean Huo <beanhuo@micron.com>,
	Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [PATCH 1/2] scsi: ufs: core: Make ufshcd_uic_cmd_compl() easier
 to read
Message-ID: <48a483e2-6a20-493a-80d8-7292c96aadcc@stanley.mountain>
References: <2d3d17c7-c3f9-4596-aa50-3226163242eb@stanley.mountain>
 <602421aa-d546-49c2-a08f-6779d3c0f9af@acm.org>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <602421aa-d546-49c2-a08f-6779d3c0f9af@acm.org>

On Mon, Aug 26, 2024 at 11:05:47AM -0700, Bart Van Assche wrote:
> On 8/25/24 11:25 PM, Dan Carpenter wrote:
> > New smatch warnings:
> > drivers/ufs/core/ufshcd.c:5484 ufshcd_uic_cmd_compl() error: we previously assumed 'cmd' could be null (see line 5474)
> 
> This smatch warning is a false positive. There are multiple code blocks
> in this functions that are guarded by if-statements. The two code blocks
> this warning applies to are mutually exclusive. Hence, the 'cmd' check
> from one block should not be used to draw conclusions about other code
> blocks. I will consider to introduce the 'else' keyword to suppress this
> false positive.

I thought that might be the case, but I wasn't sure.

If it's a false positive, then you can just ignore it.  All old warnings are
false positives.  People can find this thread if they have questions.

regards,
dan carpenter

