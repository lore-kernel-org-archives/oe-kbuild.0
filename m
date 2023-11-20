Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954251C2A5;
	Mon, 20 Nov 2023 14:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by verein.lst.de (Postfix, from userid 2407)
	id 0754E6732A; Mon, 20 Nov 2023 15:10:01 +0100 (CET)
Date: Mon, 20 Nov 2023 15:10:00 +0100
From: Christoph Hellwig <hch@lst.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Christoph Hellwig <hch@lst.de>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [hch-xfs:xfs-zoned 21/62] mm/page-writeback.c:2511
 write_cache_folios() error: uninitialized symbol 'nr'.
Message-ID: <20231120141000.GB5526@lst.de>
References: <1c4f7d84-7158-43ac-aed3-13237c63ad3a@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c4f7d84-7158-43ac-aed3-13237c63ad3a@suswa.mountain>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Nov 20, 2023 at 08:52:02AM -0500, Dan Carpenter wrote:
> tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
> head:   6ec42a9924d444c5fa6db0af13383a7009f550b6
> commit: 7fe1517b3ffc7ba7c550c79c029c4a6400140f5d [21/62] writeback: optionally submit pending data when blocking in write_cache_pages
> config: i386-randconfig-141-20231119 (https://download.01.org/0day-ci/archive/20231119/202311192253.GU1i7dEt-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20231119/202311192253.GU1i7dEt-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202311192253.GU1i7dEt-lkp@intel.com/
> 
> New smatch warnings:
> mm/page-writeback.c:2511 write_cache_folios() error: uninitialized symbol 'nr'.

Thanks, that's a good one.  Although this code probably needs some
major cleanups before it can go anywhere anyway..
