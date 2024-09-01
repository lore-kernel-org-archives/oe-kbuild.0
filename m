Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186871CF92;
	Sun,  1 Sep 2024 19:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725220707; cv=none; b=MForFDyb2QE2XXfyo74hPRoafwsvbwAYOccXtfFbNrUfhTvmRcvm8JcUC0F79aHX1nIQEDt0pXlkH0luNiTOyEeafrc0F3ZG4qM0KaanysmTCAoZyjC17yhJJ+Y/34WLbX7XHHKD2biu/2Ql/mdeNMORKLElZ0D7J0SuDrimxw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725220707; c=relaxed/simple;
	bh=I0mVbizakmeO18b6QDk8h73oGRiUojASkE3ssssgsr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YmMeKTjoGWHTAmE2nQUcTzmeAyplS12NSJ0zauxL5YeRTsoQo1g+RbunFFnPYb0S6P1NWXCAwEVMUNieBvIXOX6eM3em9kfNJbjPKKCyJnVH/VQeEkpfFEJ+msyYCDyVZGhoPGw2+vPy3rJFM01UwoP4t4SH5RUVRwuCB/YIl4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Nt5QSbOl; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=mqGxklyV; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Nt5QSbOl; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=mqGxklyV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Nt5QSbOl";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="mqGxklyV";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Nt5QSbOl";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="mqGxklyV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1033C21AE7;
	Sun,  1 Sep 2024 19:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1725220703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8mg2UY/y0elNaXZa6B0qwz2vFSKAuwCzWO0KeLEkP1g=;
	b=Nt5QSbOl5B5KgNACTXP3j/IbZ0NRxHjF9hh8d7ycI3iWXIpyQ6PpiDHro1QEcKjMfLVvZL
	ia0XubcreP5Rlse+OyIthJ3BcjCL8SM+fkpmnkcox6A2dpegi2i9sobg7An6r3w86qka33
	0vBK3poNwmihqC/x92iXX6wJXbR/MlA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1725220703;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8mg2UY/y0elNaXZa6B0qwz2vFSKAuwCzWO0KeLEkP1g=;
	b=mqGxklyV1YsjddU4jvmfkOLOBC9GZjJhhrL+s8TyyQQ7O41mRl6cDq9r21kOYWDMnsTII+
	RI2Tz5RwQEBkozBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=Nt5QSbOl;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=mqGxklyV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1725220703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8mg2UY/y0elNaXZa6B0qwz2vFSKAuwCzWO0KeLEkP1g=;
	b=Nt5QSbOl5B5KgNACTXP3j/IbZ0NRxHjF9hh8d7ycI3iWXIpyQ6PpiDHro1QEcKjMfLVvZL
	ia0XubcreP5Rlse+OyIthJ3BcjCL8SM+fkpmnkcox6A2dpegi2i9sobg7An6r3w86qka33
	0vBK3poNwmihqC/x92iXX6wJXbR/MlA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1725220703;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8mg2UY/y0elNaXZa6B0qwz2vFSKAuwCzWO0KeLEkP1g=;
	b=mqGxklyV1YsjddU4jvmfkOLOBC9GZjJhhrL+s8TyyQQ7O41mRl6cDq9r21kOYWDMnsTII+
	RI2Tz5RwQEBkozBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F37651373A;
	Sun,  1 Sep 2024 19:58:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xCPGOl7H1GYWegAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Sun, 01 Sep 2024 19:58:22 +0000
Message-ID: <ae06ed85-d27b-4076-87cf-dcf0dbb3133a@suse.cz>
Date: Sun, 1 Sep 2024 21:58:22 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [vbabka:slub-percpu-sheaves-v1r1 13/13] mm/slub.c:5070
 free_to_pcs() error: we previously assumed 'pcs' could be null (see line
 5069)
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <54fbc08a-43f9-4193-bf6e-f070900346fb@stanley.mountain>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 EP+ylKVEKb0Q2A==
In-Reply-To: <54fbc08a-43f9-4193-bf6e-f070900346fb@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1033C21AE7
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.cz:dkim,suse.cz:mid];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On 8/31/24 16:36, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-percpu-sheaves-v1r1
> head:   000f7cce0fe19452a5ecbc350b16d7d8ac68d8ba
> commit: 000f7cce0fe19452a5ecbc350b16d7d8ac68d8ba [13/13] mm, slub: cheaper locking for percpu sheaves
> config: parisc-randconfig-r071-20240831 (https://download.01.org/0day-ci/archive/20240831/202408312123.B5VrU0tZ-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 14.1.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202408312123.B5VrU0tZ-lkp@intel.com/
> 
> smatch warnings:
> mm/slub.c:5070 free_to_pcs() error: we previously assumed 'pcs' could be null (see line 5069)

Thanks, fixed up in slub-percpu-sheaves-v1r3

> vim +/pcs +5070 mm/slub.c
> 
> 9488f19d44934d Vlastimil Babka   2023-11-15  5060  		if (!empty) {
> 000f7cce0fe194 Vlastimil Babka   2024-08-28  5061  			if (sheaf_flush_main(s))
> 9488f19d44934d Vlastimil Babka   2023-11-15  5062  				goto restart;
> 000f7cce0fe194 Vlastimil Babka   2024-08-28  5063  			else
> 000f7cce0fe194 Vlastimil Babka   2024-08-28  5064  				return false;
> 9488f19d44934d Vlastimil Babka   2023-11-15  5065  		}
> 9488f19d44934d Vlastimil Babka   2023-11-15  5066  
> 9488f19d44934d Vlastimil Babka   2023-11-15  5067  got_empty:
> 000f7cce0fe194 Vlastimil Babka   2024-08-28  5068  		pcs = cpu_sheaves_trylock(s->cpu_sheaves);
> 000f7cce0fe194 Vlastimil Babka   2024-08-28 @5069  		if (!pcs) {
>                                                                      ^^^
> 
> 000f7cce0fe194 Vlastimil Babka   2024-08-28 @5070  			barn_put_empty_sheaf(pcs->barn, empty, true);
>                                                                                              ^^^^^^^^^
> 
> 000f7cce0fe194 Vlastimil Babka   2024-08-28  5071  			return false;
> 000f7cce0fe194 Vlastimil Babka   2024-08-28  5072  		}
> 9488f19d44934d Vlastimil Babka   2023-11-15  5073  
> 9488f19d44934d Vlastimil Babka   2023-11-15  5074  		/*
> 9488f19d44934d Vlastimil Babka   2023-11-15  5075  		 * if we put any sheaf to barn here, it's because we raced or
> 9488f19d44934d Vlastimil Babka   2023-11-15  5076  		 * have been migrated to a different cpu, which should be rare
> 9488f19d44934d Vlastimil Babka   2023-11-15  5077  		 * enough so just ignore the barn's limits to simplify
> 9488f19d44934d Vlastimil Babka   2023-11-15  5078  		 */
> 9488f19d44934d Vlastimil Babka   2023-11-15  5079  		if (unlikely(pcs->main->size < s->sheaf_capacity)) {
> 

