Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB9C1D9341;
	Thu,  7 Nov 2024 08:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730968543; cv=none; b=BN2Lm8hCqwT35bfmY/NztYUfl/VciWibNOnTZEME6jaasUyhE1+1/rYV3kDPPZTvxVi/syqkkxz1PsAlpA+Lf/uXdHDLViY6GkkPOfUIZU992Ok6hw701nv5dJ6cdd+5+iWYumaJq7ySEBTQ89kmkTOXJhVAP+hl4K5iwlMuaug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730968543; c=relaxed/simple;
	bh=Uw93HyK64ZovQ311cOU86bViVxKk8dIHhK32cxz9GfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JInSarlMS9Zo8MaI6SQ6hZyhbzV5T7qpInHpqJ06TK/a0GGo+T4g5QkW/0yu12x1Acq5WhetaTNdZY28c/dbGLHvrqLdHWQt/0544j1XQ/3Tg6Q14ofloJvYX2YW408CdV7pibZg2s22eR1McT6Z9SzhDcgmwEpSYWlH1qn8Bvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8A90668AA6; Thu,  7 Nov 2024 09:35:37 +0100 (CET)
Date: Thu, 7 Nov 2024 09:35:37 +0100
From: Christoph Hellwig <hch@lst.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Christoph Hellwig <hch@lst.de>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [hch-xfs:xfs-zoned 64/68] fs/xfs/xfs_rtalloc.c:1487
 xfs_growfs_rt() warn: inconsistent returns '&mp->m_growlock'.
Message-ID: <20241107083537.GB9071@lst.de>
References: <016a880c-2b78-417c-8cbe-482bd7732c8f@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <016a880c-2b78-417c-8cbe-482bd7732c8f@suswa.mountain>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Nov 05, 2024 at 07:16:39PM +0300, Dan Carpenter wrote:
> New smatch warnings:
> fs/xfs/xfs_rtalloc.c:1487 xfs_growfs_rt() warn: inconsistent returns '&mp->m_growlock'.

Thanks, this looks legit, I'll fix it up.

