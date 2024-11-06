Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD3F1DDC3A;
	Wed,  6 Nov 2024 10:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730888503; cv=none; b=lS7HTlEd87YfhhGZueGkrMaWxEgaedipn8kwQAsKtGUcK98mWrzBUUYGmq65g5CSg/1WsgUlH6m1Hz/+gQQAWkgipueM3Zp6tO6fV7zYNGa6gvgo4xrHsMoT4zD9wYrJLVUEYMhGnXLEHVygqTHNuVisKVRqWcQ1qtYdBcSrg2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730888503; c=relaxed/simple;
	bh=Qy5eRC7Pv8lisSEI05lOrbRUphO50CEejxmo7xUMuro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Izgx+QUeC6uaXBL8QBQxtdiB08VTTLOSGpMk8GTABLvRcJVnktQd2A23viFWvS95VEFn/KaZ92P0EXH63CmM8u5dc9u+Xb0dkq6fCHQ2kkCXrx04qhF5CHkXY8w1Dbf/dZuo4gMOpTi9MjfvBfYsU+6ec4ZxFQSuhmgRHVVqjAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=JsR4fcIy; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=cKmJaEww; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=JsR4fcIy; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=cKmJaEww; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="JsR4fcIy";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="cKmJaEww";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="JsR4fcIy";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="cKmJaEww"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A75A11FD0C;
	Wed,  6 Nov 2024 10:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1730888499; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VxX7EKtuUq19NAMZLPi/9xIlOyx9n0vdXpCdRvQPo4E=;
	b=JsR4fcIyjcka8eBSv9bXtHBWZ9WMuR86+r4CloJu+kgxu1JsfDemb6u+8kDVe0In2NOyy8
	85Uk66Nptlm7VU7xHVicOV/ckHCmJHgZ1QTyJyd3vNiC9eeD3TFReau6ZfCz+gCSy0LN45
	JOKPv9l9QhfIuQv08jg9DkFUusjda70=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1730888499;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VxX7EKtuUq19NAMZLPi/9xIlOyx9n0vdXpCdRvQPo4E=;
	b=cKmJaEww25VW9VqGsdzKDbrMUyx9yqOYQ4LqvAV/rRL1w1yY2QOoKGfdCAkne9npMZks4F
	gHEhpr9omoQOQQCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1730888499; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VxX7EKtuUq19NAMZLPi/9xIlOyx9n0vdXpCdRvQPo4E=;
	b=JsR4fcIyjcka8eBSv9bXtHBWZ9WMuR86+r4CloJu+kgxu1JsfDemb6u+8kDVe0In2NOyy8
	85Uk66Nptlm7VU7xHVicOV/ckHCmJHgZ1QTyJyd3vNiC9eeD3TFReau6ZfCz+gCSy0LN45
	JOKPv9l9QhfIuQv08jg9DkFUusjda70=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1730888499;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VxX7EKtuUq19NAMZLPi/9xIlOyx9n0vdXpCdRvQPo4E=;
	b=cKmJaEww25VW9VqGsdzKDbrMUyx9yqOYQ4LqvAV/rRL1w1yY2QOoKGfdCAkne9npMZks4F
	gHEhpr9omoQOQQCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 995D4137C4;
	Wed,  6 Nov 2024 10:21:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IpYTJTNDK2cQZQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 06 Nov 2024 10:21:39 +0000
Message-ID: <3d9c0c67-222b-42a3-8c12-3e9b51097d4b@suse.cz>
Date: Wed, 6 Nov 2024 11:21:39 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [vbabka:b4/slub-percpu-sheaves 8/9] mm/slub.c:4932
 kmem_cache_prefill_sheaf() warn: returning freed memory 'sheaf'
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <6b4bd53f-92c0-4cac-9b7c-90cd544609c4@suswa.mountain>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 xsFNBFZdmxYBEADsw/SiUSjB0dM+vSh95UkgcHjzEVBlby/Fg+g42O7LAEkCYXi/vvq31JTB
 KxRWDHX0R2tgpFDXHnzZcQywawu8eSq0LxzxFNYMvtB7sV1pxYwej2qx9B75qW2plBs+7+YB
 87tMFA+u+L4Z5xAzIimfLD5EKC56kJ1CsXlM8S/LHcmdD9Ctkn3trYDNnat0eoAcfPIP2OZ+
 9oe9IF/R28zmh0ifLXyJQQz5ofdj4bPf8ecEW0rhcqHfTD8k4yK0xxt3xW+6Exqp9n9bydiy
 tcSAw/TahjW6yrA+6JhSBv1v2tIm+itQc073zjSX8OFL51qQVzRFr7H2UQG33lw2QrvHRXqD
 Ot7ViKam7v0Ho9wEWiQOOZlHItOOXFphWb2yq3nzrKe45oWoSgkxKb97MVsQ+q2SYjJRBBH4
 8qKhphADYxkIP6yut/eaj9ImvRUZZRi0DTc8xfnvHGTjKbJzC2xpFcY0DQbZzuwsIZ8OPJCc
 LM4S7mT25NE5kUTG/TKQCk922vRdGVMoLA7dIQrgXnRXtyT61sg8PG4wcfOnuWf8577aXP1x
 6mzw3/jh3F+oSBHb/GcLC7mvWreJifUL2gEdssGfXhGWBo6zLS3qhgtwjay0Jl+kza1lo+Cv
 BB2T79D4WGdDuVa4eOrQ02TxqGN7G0Biz5ZLRSFzQSQwLn8fbwARAQABzSBWbGFzdGltaWwg
 QmFia2EgPHZiYWJrYUBzdXNlLmN6PsLBlAQTAQoAPgIbAwULCQgHAwUVCgkICwUWAgMBAAIe
 AQIXgBYhBKlA1DSZLC6OmRA9UCJPp+fMgqZkBQJkBREIBQkRadznAAoJECJPp+fMgqZkNxIQ
 ALZRqwdUGzqL2aeSavbum/VF/+td+nZfuH0xeWiO2w8mG0+nPd5j9ujYeHcUP1edE7uQrjOC
 Gs9sm8+W1xYnbClMJTsXiAV88D2btFUdU1mCXURAL9wWZ8Jsmz5ZH2V6AUszvNezsS/VIT87
 AmTtj31TLDGwdxaZTSYLwAOOOtyqafOEq+gJB30RxTRE3h3G1zpO7OM9K6ysLdAlwAGYWgJJ
 V4JqGsQ/lyEtxxFpUCjb5Pztp7cQxhlkil0oBYHkudiG8j1U3DG8iC6rnB4yJaLphKx57NuQ
 PIY0Bccg+r9gIQ4XeSK2PQhdXdy3UWBr913ZQ9AI2usid3s5vabo4iBvpJNFLgUmxFnr73SJ
 KsRh/2OBsg1XXF/wRQGBO9vRuJUAbnaIVcmGOUogdBVS9Sun/Sy4GNA++KtFZK95U7J417/J
 Hub2xV6Ehc7UGW6fIvIQmzJ3zaTEfuriU1P8ayfddrAgZb25JnOW7L1zdYL8rXiezOyYZ8Fm
 ZyXjzWdO0RpxcUEp6GsJr11Bc4F3aae9OZtwtLL/jxc7y6pUugB00PodgnQ6CMcfR/HjXlae
 h2VS3zl9+tQWHu6s1R58t5BuMS2FNA58wU/IazImc/ZQA+slDBfhRDGYlExjg19UXWe/gMcl
 De3P1kxYPgZdGE2eZpRLIbt+rYnqQKy8UxlszsBNBFsZNTUBCACfQfpSsWJZyi+SHoRdVyX5
 J6rI7okc4+b571a7RXD5UhS9dlVRVVAtrU9ANSLqPTQKGVxHrqD39XSw8hxK61pw8p90pg4G
 /N3iuWEvyt+t0SxDDkClnGsDyRhlUyEWYFEoBrrCizbmahOUwqkJbNMfzj5Y7n7OIJOxNRkB
 IBOjPdF26dMP69BwePQao1M8Acrrex9sAHYjQGyVmReRjVEtv9iG4DoTsnIR3amKVk6si4Ea
 X/mrapJqSCcBUVYUFH8M7bsm4CSxier5ofy8jTEa/CfvkqpKThTMCQPNZKY7hke5qEq1CBk2
 wxhX48ZrJEFf1v3NuV3OimgsF2odzieNABEBAAHCwXwEGAEKACYCGwwWIQSpQNQ0mSwujpkQ
 PVAiT6fnzIKmZAUCZAUSmwUJDK5EZgAKCRAiT6fnzIKmZOJGEACOKABgo9wJXsbWhGWYO7mD
 8R8mUyJHqbvaz+yTLnvRwfe/VwafFfDMx5GYVYzMY9TWpA8psFTKTUIIQmx2scYsRBUwm5VI
 EurRWKqENcDRjyo+ol59j0FViYysjQQeobXBDDE31t5SBg++veI6tXfpco/UiKEsDswL1WAr
 tEAZaruo7254TyH+gydURl2wJuzo/aZ7Y7PpqaODbYv727Dvm5eX64HCyyAH0s6sOCyGF5/p
 eIhrOn24oBf67KtdAN3H9JoFNUVTYJc1VJU3R1JtVdgwEdr+NEciEfYl0O19VpLE/PZxP4wX
 PWnhf5WjdoNI1Xec+RcJ5p/pSel0jnvBX8L2cmniYnmI883NhtGZsEWj++wyKiS4NranDFlA
 HdDM3b4lUth1pTtABKQ1YuTvehj7EfoWD3bv9kuGZGPrAeFNiHPdOT7DaXKeHpW9homgtBxj
 8aX/UkSvEGJKUEbFL9cVa5tzyialGkSiZJNkWgeHe+jEcfRT6pJZOJidSCdzvJpbdJmm+eED
 w9XOLH1IIWh7RURU7G1iOfEfmImFeC3cbbS73LQEFGe1urxvIH5K/7vX+FkNcr9ujwWuPE9b
 1C2o4i/yZPLXIVy387EjA6GZMqvQUFuSTs/GeBcv0NjIQi8867H3uLjz+mQy63fAitsDwLmR
 EP+ylKVEKb0Q2A==
In-Reply-To: <6b4bd53f-92c0-4cac-9b7c-90cd544609c4@suswa.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:mid,intel.com:email]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On 11/6/24 11:08, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git b4/slub-percpu-sheaves
> head:   c2ef14761b7d660275c07a6f6c53db215045bcfc
> commit: 7b79b3645d1e8aa28c52bcf891b8d3d59eb2bf1e [8/9] mm, slub: sheaf prefilling
> config: i386-randconfig-141-20241106 (https://download.01.org/0day-ci/archive/20241106/202411061426.Ztzp9ABZ-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202411061426.Ztzp9ABZ-lkp@intel.com/
> 
> smatch warnings:
> mm/slub.c:4932 kmem_cache_prefill_sheaf() warn: returning freed memory 'sheaf'
> 
> vim +/sheaf +4932 mm/slub.c
> 
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4900  struct slab_sheaf *
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4901  kmem_cache_prefill_sheaf(struct kmem_cache *s, gfp_t gfp, unsigned int count)
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4902  {
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4903  	struct slub_percpu_sheaves *pcs;
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4904  	struct slab_sheaf *sheaf = NULL;
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4905  
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4906  	//TODO: handle via oversize sheaf
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4907  	if (count > s->sheaf_capacity)
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4908  		return NULL;
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4909  
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4910  	pcs = cpu_sheaves_lock(s->cpu_sheaves);
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4911  
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4912  	if (pcs->spare && pcs->spare->size > 0) {
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4913  		sheaf = pcs->spare;
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4914  		pcs->spare = NULL;
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4915  	}
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4916  
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4917  	if (!sheaf)
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4918  		sheaf = barn_get_full_or_empty_sheaf(pcs->barn);
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4919  
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4920  	cpu_sheaves_unlock(s->cpu_sheaves);
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4921  
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4922  	if (!sheaf)
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4923  		sheaf = alloc_empty_sheaf(s, gfp);
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4924  
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4925  	if (sheaf && sheaf->size < count) {
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4926  		if (refill_sheaf(s, sheaf, gfp)) {
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4927  			sheaf_flush(s, sheaf);
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4928  			free_empty_sheaf(s, sheaf);
> 
> sheaf = NULL?

Yep, thanks a lot.

> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4929  		}
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4930  	}
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4931  
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05 @4932  	return sheaf;
> 7b79b3645d1e8a Vlastimil Babka   2024-11-05  4933  }
> 

