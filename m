Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFB038F250
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 12:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307066; cv=none; b=BfmGSRoWFlov5qLpfyjo54jymtzD8GlDNXQbXfPC0ZS1Pig3twu5Z049TgtpHl9FC3Ee33nv51J3XQ04Ng5OTngvzew0jUr+Ei3VJYb3hEkydFeEAaJ26rLnR+Dfxz4qS9P8guE3rL7TQ37FZUjPezQzUjermVMYP9wb2jyOYOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307066; c=relaxed/simple;
	bh=NA+lT+rCvc4E8PozMoKtxOdXTSYE3m4kLe1roFs0jEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JoiIhzu8vbMsLDrYElKodVGRAH+jjNqUe+h8BrRTclbIN6mX9SMrXA4HCwJtWvEMJcYk/nuYrbNBFYFg6nQpL+N/yur2yc+HKWjXWm8X7osm58ioll6uJ1n1eXUmfGpTL2rnkxuxLQgA7tWdSPBCKaetbvwBp/05SP+++kpZLg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=VdgyNy8M; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=hSt4CMZN; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=MwX0zJhU; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=7OBoEB0T; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="VdgyNy8M";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="hSt4CMZN";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="MwX0zJhU";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="7OBoEB0T"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 93FCC33684;
	Tue, 13 Jan 2026 12:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768307061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4VIREq6KcfFEqYToZSs1rcoXYYB9B9DenDKR0lGfaUg=;
	b=VdgyNy8M1/cM9/fXaeF9wajTIaQ/Xp/iUbQylO3k9E0wO529LCOKyPOPId63l/2cDlI/ZI
	ZweKn//WYVVC2NwsfBzh+7Em6cnohBxIK4TH4x4yzRu/Jo1q6JMnW8EORiTCcTyBTId6FD
	YSUPvGB9fSdd8ymeF32tJXRy7Bf/l+4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768307061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4VIREq6KcfFEqYToZSs1rcoXYYB9B9DenDKR0lGfaUg=;
	b=hSt4CMZNkuG2lUSWPL4AKxbM2Z+KtR5t99rvk3EGsNk9SHH0ufAlxo8z7T8Db9FmOs/FuT
	HubkgGphNGa+s1Dg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=MwX0zJhU;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=7OBoEB0T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768307060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4VIREq6KcfFEqYToZSs1rcoXYYB9B9DenDKR0lGfaUg=;
	b=MwX0zJhU6VREU5zdOR5cKxeGFkB8zi5R09otc0ZT7h9sc7jG1bD2RT8l0ncMREESNL/TxH
	B0+ucA7tilGghbTP2NSeLAhWhPLFWr9RoTW6Po2ZWRc0h4CmpGfIj/g/CB5kPz6Rd0/Nt/
	IIjdnfWmI30YD5Td/uIDAp1T3Xw+LY8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768307060;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4VIREq6KcfFEqYToZSs1rcoXYYB9B9DenDKR0lGfaUg=;
	b=7OBoEB0TZYVGqebUmFP+wmOAV43mhWtkMLsJjKrdSGi2XJt/HRjTZXGyZiG+resWyua0t7
	o6dibttJahzzPxBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7FC973EA63;
	Tue, 13 Jan 2026 12:24:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id O58sH3Q5ZmlYUAAAD6G6ig
	(envelope-from <jack@suse.cz>); Tue, 13 Jan 2026 12:24:20 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 4307AA08CF; Tue, 13 Jan 2026 13:24:20 +0100 (CET)
Date: Tue, 13 Jan 2026 13:24:20 +0100
From: Jan Kara <jack@suse.cz>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Roman Gushchin <roman.gushchin@linux.dev>, 
	lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List <linux-mm@kvack.org>, 
	Dev Jain <dev.jain@arm.com>, Jan Kara <jack@suse.cz>
Subject: Re: mm/filemap.c:3307 do_sync_mmap_readahead() warn: assigning (-12)
 to unsigned variable 'ra->order'
Message-ID: <s47y6ysj4c2z5c5axtxbeset4divigctg4s3p7gbgmvfkoizeu@malcpodvrm46>
References: <202601131311.g3lyUAks-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601131311.g3lyUAks-lkp@intel.com>
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[10];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.cz:dkim,suse.com:email,linaro.org:email,01.org:url,intel.com:email]
X-Spam-Flag: NO
X-Spam-Score: -4.01
X-Rspamd-Queue-Id: 93FCC33684
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

On Tue 13-01-26 14:12:28, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   b71e635feefc852405b14620a7fc58c4c80c0f73
> commit: 9f1edf1aedac1b287355f63f768ba4275de72dca mm: readahead: make thp readahead conditional to mmap_miss logic
> config: x86_64-randconfig-161-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131311.g3lyUAks-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> smatch version: v0.5.0-8985-g2614ff1a
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202601131311.g3lyUAks-lkp@intel.com/
> 
> smatch warnings:
> mm/filemap.c:3307 do_sync_mmap_readahead() warn: assigning (-12) to unsigned variable 'ra->order'
...
> 9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3306  		ra->async_size = HPAGE_PMD_NR;
> 9f1edf1aedac1b2 Roman Gushchin          2025-10-06 @3307  		ra->order = HPAGE_PMD_ORDER;
> 
> HPAGE_PMD_SHIFT is zero in this config?
> ra->order is a u16.

What's the config exactly? I suppose CONFIG_TRANSPARENT_HUGEPAGE is
disabled in this case, isn't it? In that case force_thp_readahead will
never be true and thus the branch with the assignment can never be reached
AFAICT...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
