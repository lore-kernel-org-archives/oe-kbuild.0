Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94711C8629;
	Fri, 23 May 2025 10:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994808; cv=none; b=qMG0CJCX2dktLFxWraIKrs73QNt3e5Q+v4Dau8qpodDvN8JxEIF8Hj9hq9FYTf7LvLXtnRX2XwoKnAHDPX5gJXufa7MYEaadUXpBOMkFJMKH2opQYgYwbJHlCGMxZY2Uc9J7i6zdnXYuwXLKL99iNImVhn4oFLSc9V3VUMtM/fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994808; c=relaxed/simple;
	bh=THheXSACEUJfGXyhSOdVFZzx2Ne79IquJbtAhn/EX3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I3dJNYgUKS+IJBG3d/dLaA37A9fVhkB72on3cRMcE1midqnty3uCXV/qHVZiXiT5h8UrqlIUE7BoyYOC9HNU8K1uRCOdkn8RVh/3GStcMsBFQ3lnPtXMM/SMM3Lc5Mi7UVZtEQ0xdw4l+cbDSWu9nxP+UQUqM/A/InEusIyhc3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3079468BEB; Fri, 23 May 2025 12:06:41 +0200 (CEST)
Date: Fri, 23 May 2025 12:06:40 +0200
From: Christoph Hellwig <hch@lst.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Christoph Hellwig <hch@lst.de>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Carlos Maiolino <cem@kernel.org>,
	Hans Holmberg <hans.holmberg@wdc.com>,
	"Darrick J. Wong" <djwong@kernel.org>
Subject: Re: [linux-next:master 10746/11779] fs/xfs/xfs_mru_cache.c:451
 xfs_mru_cache_insert() error: we previously assumed 'mru' could be
 null (see line 429)
Message-ID: <20250523100640.GA23844@lst.de>
References: <202505211940.jjLX0rQI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505211940.jjLX0rQI-lkp@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, May 23, 2025 at 12:58:57PM +0300, Dan Carpenter wrote:
> 2a82b8be8a8dac David Chinner     2007-07-11  428  	ASSERT(mru && mru->lists);
> 2a82b8be8a8dac David Chinner     2007-07-11 @429  	if (!mru || !mru->lists)
> 
> mru can't be NULL but if it were
> 
> 70b95cb86513d7 Christoph Hellwig 2025-05-14  450  out_free:
> 70b95cb86513d7 Christoph Hellwig 2025-05-14 @451  	mru->free_func(mru->data, elem);
> 
> then we are toast.

Yeah.  Fortunately it is just a debug check for an invalid API.
I'd be tempted to just remove the check and only leave in the assert
for the same condition right above.

