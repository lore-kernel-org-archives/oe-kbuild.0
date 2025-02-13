Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE5C35949;
	Thu, 13 Feb 2025 04:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739420346; cv=none; b=EYX/t5rOHQeiLSMxXCPvRr0AZVgXaZXZAmdM+oXN09HYlMf8NR0DXm/rX9VZXwxGbJCfUZHrRNssLoS2LrmWUJqHLsRJT1M1RerqfpEwk1ZwyyEQOos2ztVhOJtUn+hgirCHrpIVFC5AGVJF30e7u7V3Fhdd3foqz4q2NyS0QIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739420346; c=relaxed/simple;
	bh=5VqZn3t6WQmzTK2YQiR4KQVSSeZpfLJ8VNyRXShrZMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LkyHwBuPn4jiurp4iCrUAqLbsMJAfm/RIb3MmHtrwiGKS9K+edWgpMi1uB4BJWwVk9ypnIMndvrSfdg5WbH38jJ/rdIncXN+pQdZHmgzEM6rdO0KD1bDHw9deUQNQe2glIkF5RASUIGcRhbq0y2F92g9dWhl2p13xYltUvp9uLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id C333967373; Thu, 13 Feb 2025 05:18:53 +0100 (CET)
Date: Thu, 13 Feb 2025 05:18:53 +0100
From: Christoph Hellwig <hch@lst.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Christoph Hellwig <hch@lst.de>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [hch-xfs:xfs-freecounters 2/5] fs/xfs/xfs_super.c:1100
 xfs_init_percpu_counters() error: buffer overflow 'mp->m_free' 2 <=
 u32max
Message-ID: <20250213041853.GB17046@lst.de>
References: <2ecbbcd0-b5da-474f-b1f7-f32060352c92@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ecbbcd0-b5da-474f-b1f7-f32060352c92@stanley.mountain>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Feb 12, 2025 at 11:12:19AM +0300, Dan Carpenter wrote:
> In GCC enums are unsigned int where possible.

Thanks!  I'l lswitch to a plain int for the iterator again.  Would
be so nice if the compiler could warn about such things.

