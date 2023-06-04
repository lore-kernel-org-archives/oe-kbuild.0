Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BCB33F2
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Jun 2023 12:41:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B16C433EF;
	Sun,  4 Jun 2023 12:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685882473;
	bh=0OYicLRoszo64H3XAFAzz5t3OTR4dF4uBXXnlT3N2Po=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eWw/KSMoJNszu7qVBKeglSv/J39kbZZrEqliDhYY/DXECRNXXijZf9SoAHwwlPgRD
	 6i9PDNJrvmJcWCHkK9RAq7hlAZrgPFLs2Ydf2JdtuZeF2W/PDiNCNFWPevTX5mgjfo
	 bsNio/HaesbnskpfYG+SPRGvcn1MPZi2nYiOWSh+2bWLNAGtV/AXJyo3n0EbLbD0NJ
	 8GTPko89TM1Yz8fXjtiuOqnzUZfwG7ygDsy+OA+MlG4vsKt+gFIIoKv1u8BK88Tc7D
	 eoD5lOQSPgt+9HN2zcXolGPnYyMFtp/3mHkpwIMpFyMIHiD/UqewSjIXkMruhw4tOl
	 f6MNFwOncb75g==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1q5n31-0001Fs-Eb; Sun, 04 Jun 2023 14:41:28 +0200
Date: Sun, 4 Jun 2023 14:41:27 +0200
From: Johan Hovold <johan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild@lists.linux.dev, Dan Carpenter <error27@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: The robot is broken (was: Re: [PATCH 1/3] USB: serial: return errors
 from break handling)
Message-ID: <ZHyGd5BRjUaOdYyF@hovoldconsulting.com>
References: <202306031014.qzAY3uQ6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306031014.qzAY3uQ6-lkp@intel.com>

On Sat, Jun 03, 2023 at 10:40:42AM +0800, kernel test robot wrote:
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> In-Reply-To: <20230602124642.19076-2-johan@kernel.org>
> References: <20230602124642.19076-2-johan@kernel.org>
> TO: Johan Hovold <johan@kernel.org>
> TO: Johan Hovold <johan@kernel.org>
> CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
> CC: linux-usb@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> CC: Corey Minyard <minyard@acm.org>
> 
> Hi Johan,
> 
> kernel test robot noticed the following build warnings:

> New smatch warnings:
> drivers/usb/serial/io_edgeport.c:1601 edge_break() error: uninitialized symbol 'status'.

Thanks for the report. Now fixed up in v2:

	https://lore.kernel.org/lkml/20230604123505.4661-1-johan@kernel.org

The robot currently appears to be broken though as this report was never
sent to me or the relevant mailing lists (and I just happened to see it
by chance).

Looks like there's a stray newline in the output of your scripts which
causes the mail headers above to be included in the body instead.

Johan
