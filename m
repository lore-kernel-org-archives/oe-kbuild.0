Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C3719AA56
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Sep 2024 13:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725542636; cv=none; b=ZS0g0c0vRuAa4qMCNJape4G5Lvx2x7HRQvwzkf4391ebqpoJtgUyqXPQMt4zpAe1BN5WE5vTcNJZjOD0vKXgQuhpsk0KZ59k6i6zQToIVc2cUAX5C5aPbFvx2mh62OeCdZwAAD+lu5yaRgU0pV029N2L8NQsdda1nJBZQ1LpmsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725542636; c=relaxed/simple;
	bh=Gw3/xyHUblpebH8nsW4dCHdabs+GDtKF2v/D04obqts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STC2mdgqV7daG7EP/MGzs5G00W4AwIvFNthpfneDckCGHftaGvD2wsgPVsI80X3PoG2M+2g/ikLb4UBp0rrPg/Ax7kpjITrmcAnWjyVO1Ve4cV4qDLMRt9GQa18vjYvSkfycDQyWZOCJ8IJIPSAPEy2YUFdaQOLihb4UUnlSLK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=kNDlrY5N; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="kNDlrY5N"
Received: from cwcc.thunk.org (pool-173-48-102-194.bstnma.fios.verizon.net [173.48.102.194])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 485DNZbS011886
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 09:23:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1725542618; bh=WqzC4Dw+vcGz5wN0LnBC3wQ0AsomGwZJ4ctU7NMix0Y=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=kNDlrY5NiL+4HMXD0qBt7pXYF+xvIxZuMQ2PtkJaVB4CJgvnlScRiKKAuvMcKafmH
	 2/4M7iQmOWYg01b7/9oHisDFLHv4QzGQaMgH4t4yD6K4drndzHjwVhHqyTMquGgFB0
	 tNzhjV14nPSwiho9iGmk2WVas1Fv7+YEfuxYEZA8KJnUA9GhzsuEwlpQuLJQZGTNpW
	 E3Rsm5NyiYWBlBsdJMzspIhuwv6bZLP8hz6JsF6JrQ8VuCREyFPUq39gdrQeLMW1kW
	 mJzKfOcqziDSEzkjpyE5ObogdvVGsIeOe2X4/WMUpaTWNz9aVK6b/WXmtWvqf8fKRT
	 +CLAm+mWdjyGQ==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 82FB815C02C6; Thu, 05 Sep 2024 09:23:35 -0400 (EDT)
Date: Thu, 5 Sep 2024 09:23:35 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Baokun Li <libaokun1@huawei.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, lkp@intel.com,
        oe-kbuild-all@lists.linux.dev, Jan Kara <jack@suse.cz>,
        oe-kbuild@lists.linux.dev, Ojaswin Mujoo <ojaswin@linux.ibm.com>,
        Yang Erkun <yangerkun@huawei.com>
Subject: Re: [linux-next:master 8348/9291] fs/ext4/extents.c:6155
 ext4_ext_clear_bb() error: double free of 'path'
Message-ID: <20240905132335.GT9627@mit.edu>
References: <0a03c332-20ff-47ef-8a33-e52b4736d05b@stanley.mountain>
 <c2711f3d-6bee-414c-952f-5c33da315a1a@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2711f3d-6bee-414c-952f-5c33da315a1a@huawei.com>

On Thu, Sep 05, 2024 at 09:30:37AM +0800, Baokun Li wrote:
> Now Ted has fixed this problem in his branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git/commit/?h=dev&id=2352e3e461926b59f01c1e39fbb0494891cff997
> 
> Ted, could you please help push the corrected commit to the next branch?

The next branch gets automatically refreshed every day (Mondays
through Friday).  In the case of the ext4 tree, it gets picked up from
the dev branch.  So it should be fixed in the upcoming fs-next and
linux-next branch.

Cheers,

					- Ted
