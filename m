Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5277023A2;
	Fri, 23 Dec 2022 16:42:34 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id DA0C068AA6; Fri, 23 Dec 2022 17:42:29 +0100 (CET)
Date: Fri, 23 Dec 2022 17:42:29 +0100
From: Christoph Hellwig <hch@lst.de>
To: Dan Carpenter <error27@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, oe-kbuild@lists.linux.dev,
	Sagi Grimberg <sagi@grimberg.me>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: drivers/nvme/host/auth.c:950 nvme_auth_init_ctrl() warn:
 missing error code? 'ret'
Message-ID: <20221223164229.GA31884@lst.de>
References: <202212222333.vrYfUBqM-lkp@intel.com> <20221223154754.GA30339@lst.de> <Y6XVnWCNx6cB7Itw@kadam>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6XVnWCNx6cB7Itw@kadam>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Dec 23, 2022 at 07:21:49PM +0300, Dan Carpenter wrote:
> > -	if (!ctrl->opts->dhchap_secret && !ctrl->opts->dhchap_ctrl_secret)
> > +	if (!ctrl->host_key && !ctrl->ctrl_key)
> >  		return ret;
> 
> ret is uninitialized now.

Yes.  Should be a 'return 0'.

We really need to turn the maybe uninitialized warnings back on.
