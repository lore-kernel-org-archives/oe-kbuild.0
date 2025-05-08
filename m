Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243EA1519BF;
	Thu,  8 May 2025 00:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746664499; cv=none; b=KyEO9WpParNXJnAeBr6ysHEp5e+VM6NoiQym+bcHsyqOxxsVjOONEBJz9qe/JDurciDiEhoV9BYiJ7/dfMUEtO2WNr/3087dAwXraZ8f9Gdq2+1T1x4Xb7+Hsb+ifVssP7jS0CaEOTWJmULXMn3il1zzRPj+g4jmwiu8z5PNDwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746664499; c=relaxed/simple;
	bh=JlSoo1vEYf4Hg8zkm14YryrN6OYMiqeNqRlyThVNjP8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=QJ8qkyxyCuYeTRpXjpBFeaj5JEwnmRBhIybpZe9E+lM3TYCkPSTNX03jdsuFRqO5GV/e1igEDaann/X4O1JEJxvShnSsf8X4kkOmBw2MIOFMclIQSk4FfyokldKFqGK45tvi4pqoLfmV1utv/xnTzQ4/U0f21d6m569Qym4QjRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=mjyHxqXB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="mjyHxqXB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E1CC4CEE2;
	Thu,  8 May 2025 00:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746664498;
	bh=JlSoo1vEYf4Hg8zkm14YryrN6OYMiqeNqRlyThVNjP8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mjyHxqXBTuL/C33GIeEKXv9J+4fm0TfyMtimPLBVg2RohCxzJRquEGeDJY9Lp1zVc
	 nwMQBzXTIgs7z9wUQtt8X7WUIjDWQYSCwqLLkVSbCbrqFuuWd8JQp8BUp4JAQq3TBd
	 cP1m3iJd7zDuCwy1LtJ+Ku9wkEiPvj0qgvucCFDc=
Date: Wed, 7 May 2025 17:34:57 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Shivank Garg <shivankg@amd.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [linux-next:master 7893/8235] fs/jfs/jfs_metapage.c:245
 __metapage_migrate_folio() error: we previously assumed 'mp' could be null
 (see line 235)
Message-Id: <20250507173457.d2c6eb2b92a10fbd4185cf1f@linux-foundation.org>
In-Reply-To: <21037c25-b85c-48fa-bdac-27cb3be2ccdb@amd.com>
References: <202505071850.XaOkcCkX-lkp@intel.com>
	<21037c25-b85c-48fa-bdac-27cb3be2ccdb@amd.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 7 May 2025 17:19:52 +0530 Shivank Garg <shivankg@amd.com> wrote:

> This is a false positive.
> 
> In metapage_migrate_folio(), it checks if (!src->private) and only calls
> __metapage_migrate_folio() if src->private is non-NULL
> 
> static int metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
> 				  struct folio *src, enum migrate_mode mode)
> {
> ...
> 	if (!src->private)
> 		return filemap_migrate_folio(mapping, dst, src, mode);
> ...
> ...
> 	return __metapage_migrate_folio(mapping, dst, src, mode);
> }
> 
> Then __metapage_migrate_folio() calls mp = folio_to_mp(src, 0), which returns src->private.
> Which should not be NULL as previously checked.
> 
> I think we can skip the mp != NULL check from 
> > 39ed4d1a0e03ce Shivank Garg  2025-04-30 @235  	if (mp && metapage_locked(mp))
> It seem redundant here.

Yes.  Right now the code simply looks wrong:

	mp = folio_to_mp(src, 0);
	if (mp && metapage_locked(mp))
		return -EAGAIN;

	...

	page_offset = mp->data - folio_address(src);

any reader of this will be worried.  A code comment (at least) would
save them concern and time.  Reworking the code to eliminate doubt
would be better.

