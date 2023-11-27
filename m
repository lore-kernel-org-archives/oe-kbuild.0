Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0F912E58;
	Mon, 27 Nov 2023 09:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by verein.lst.de (Postfix, from userid 2407)
	id CA72667373; Mon, 27 Nov 2023 10:27:03 +0100 (CET)
Date: Mon, 27 Nov 2023 10:27:03 +0100
From: Christoph Hellwig <hch@lst.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Christoph Hellwig <hch@lst.de>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [hch-xfs:xfs-zoned 36/65] fs/iomap/buffered-io.c:2127
 iomap_rewrite_range() error: uninitialized symbol 'folio_end'.
Message-ID: <20231127092703.GA3403@lst.de>
References: <536a4c9b-cff8-45f3-bf2e-e2de378dec98@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <536a4c9b-cff8-45f3-bf2e-e2de378dec98@suswa.mountain>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thanks!

I'll incorporate this into the next version.
