Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20BE194;
	Mon,  5 Jun 2023 07:09:09 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 77DCE68AA6; Mon,  5 Jun 2023 09:09:05 +0200 (CEST)
Date: Mon, 5 Jun 2023 09:09:05 +0200
From: Christoph Hellwig <hch@lst.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Christoph Hellwig <hch@lst.de>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-btrfs@vger.kernel.org, David Sterba <dsterba@suse.com>,
	Qu Wenruo <wqu@suse.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: Re: [linux-next:master 6080/6849] fs/btrfs/volumes.c:6412
 btrfs_map_block() error: we previously assumed 'mirror_num_ret'
 could be null (see line 6250)
Message-ID: <20230605070905.GC15651@lst.de>
References: <14e5f928-5395-4cc4-90ff-8223ef857320@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14e5f928-5395-4cc4-90ff-8223ef857320@kadam.mountain>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Jun 02, 2023 at 05:04:37PM +0300, Dan Carpenter wrote:
> Hi Christoph,
> 
> This is just a rename function so the warning is older but I didn't
> send this email before.

Yeah.  The old version is my fault as well :)

It is not a bug as all callers that set smap pass in the mirror_num_ret
as well, but it definitively isn't very maintainable code.  I see what
I can do.

