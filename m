Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CED53A2
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jun 2023 06:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94E9C433EF;
	Mon,  5 Jun 2023 06:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685947784;
	bh=sWek4UJej+pwglFrB5AmndNwRxzhGRg7HhPEFHCcGIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JXHFAZBcDv1qyZGzUx/APX4UiSy7SQohohjs5Jx2bw/PmEXNYNclxvlbs5YEY/aYu
	 dSvyz5Ru9GoCGN2pOEYCBmIEdrYR2Zv3LG48n8xoBjwo6+olm0bbzFk49dlq8ihx/m
	 kw3i9DwDnn/zUSvuDiahkJBRXDkot6JfS83AJLkPrglSb6KakCZPcZnkQ4t7Mh2dyw
	 LcQRxZrgCipq7qDWt8Hr/FwSOGFHiLjv5Gziw/NvULXuW2FFe0UlV2MGppQ276rNiP
	 UTricbAIhwx8yKQK5ZlEnpj65tOAFGVWDF/QwjUPRaCozd7LeQP+XVY0/vrgAUNUxJ
	 u8Nnzj5u/IzFQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1q642T-0006v6-OT; Mon, 05 Jun 2023 08:50:01 +0200
Date: Mon, 5 Jun 2023 08:50:01 +0200
From: Johan Hovold <johan@kernel.org>
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild@lists.linux.dev,
	Dan Carpenter <error27@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: The robot is broken (was: Re: [PATCH 1/3] USB: serial: return
 errors from break handling)
Message-ID: <ZH2FmTrOkQI8FA__@hovoldconsulting.com>
References: <202306031014.qzAY3uQ6-lkp@intel.com>
 <ZHyGd5BRjUaOdYyF@hovoldconsulting.com>
 <ZH1lAtO0nG801FrZ@rli9-mobl>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZH1lAtO0nG801FrZ@rli9-mobl>

On Mon, Jun 05, 2023 at 12:30:58PM +0800, Philip Li wrote:
> On Sun, Jun 04, 2023 at 02:41:27PM +0200, Johan Hovold wrote:

> > The robot currently appears to be broken though as this report was never
> > sent to me or the relevant mailing lists (and I just happened to see it
> > by chance).
> 
> Thanks a lot Johan for checking this. For now, the bot has 2 similar mailing lists,
> one is oe-kbuild-all@lists.linux.dev, which contains the high confidence report that
> is sent directly to author and related CC. Another one is this oe-kbuild@lists.linux.dev,
> that we will send low confidence issues here and they will only be really reported
> out after manual check. So we can reduce false positives.

Ah, thanks for the explanation and sorry about the noise.

Johan
