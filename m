Received: from e2i340.smtp2go.com (e2i340.smtp2go.com [103.2.141.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90C118C029
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Oct 2024 08:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.141.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729843328; cv=none; b=OCMdUa1yjW+m8M0borrsN6y7Ku7yUqOmRTtQdxjrClNNnW1ZbTSEylVKGfjdZhNB0DC07xmnUvboMUJxM5AaPGFbMNN6ztbo+McgXCfUWUNZnPSJK7Bs61VouTOkxM/9O1tu7ImNzA1WQsI/N2S7lZwroYs0F7/nW+p6NwVbvTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729843328; c=relaxed/simple;
	bh=eFhDUENnS8zGkZbRU4y5LCpVMnWoZuLkbJIlmtBmFSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OssAf8EgFNQdXkFCzfP2GMOMvmLmCKdCl0vpagXZb7RbTWfZvs5RkvISZ5JkLc2i8gWftBfj+2ti07JEA21PvKZ1Ymr5CNDB2CwDaEIeahqTL9kKqz+8SK2YuWtZdM/lrH2rnIJ58cP1POEgojK7b0AEh3jGKJeVOXtchLif3KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=triplefau.lt; spf=pass smtp.mailfrom=em510616.triplefau.lt; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=TSWreUYI reason="unknown key version"; dkim=pass (2048-bit key) header.d=triplefau.lt header.i=@triplefau.lt header.b=Lu1AfGRS; arc=none smtp.client-ip=103.2.141.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=triplefau.lt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em510616.triplefau.lt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="TSWreUYI";
	dkim=pass (2048-bit key) header.d=triplefau.lt header.i=@triplefau.lt header.b="Lu1AfGRS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maxzs0.a1-4.dyn; x=1729844224; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=GvO/Y+A5F9D+Z7v2M3j3RiYz27Q9b0KXTCFNKhL41cQ=; b=TSWreUYIcw2GN8RO8nDos7JnV+
	5kT9jt8N1Ss+QxtKPcKQArwjLa/Jxwelsu1hthKYQrJlOXt7g4zGkhwuC0aqCetmFW0E6/5CaOc3o
	U28XOYxMCNmNetCmX6IAjk2QLhJQas7gBQNC6Sg0w+p9svJigj+Z7VJAUtc7dgwdy+gVdpUdO6WYh
	gKZgVsiJXDVDZfrnPJhtSuHIqASHa3vopF3K4hYbZzpnPmP9Hei0brP/P2S5fCgZIosmyD4ZltVbU
	2zGjkB3g3z8UhkX1jpppU8AF96qeYh051S8L2N2drJ7RPaNb6KOJnXvUoUDdgsPT2Amm6PjPthBK7
	P3U9HWgw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1729843324; h=from : subject
 : to : message-id : date;
 bh=GvO/Y+A5F9D+Z7v2M3j3RiYz27Q9b0KXTCFNKhL41cQ=;
 b=Lu1AfGRSU+3t/j+MRR3hMWiW4bl1WgXydC7uvEAHoM+pYr1/CoxAd+E+F0THfCZ2KapC8
 OO/wFY+DGlcDmBHpvXeYCXKfIlyQQlT3hQWIr9qJTuVomc1TiVaFL0/WGdSnmBk+oOd9MNd
 P1+/kPbm+MHIiOzsfXAL28AZCVKmth3FgGwR7CaZlQbXzJTl8ukWRt1xFk7wRY9Ob2lrPN3
 7ZsFRQpDQV7a1FmFIgaMRolG9GgfQKfe2tS5TyWx5Lxh8c8P3WkrSmvXAPZnJQXvs2Q7juC
 rhg1bVQLolypoowq19jkYnLRcXqypEOqqeVdwVUe5igs6WXJ4Jnjb4VMM+rw==
Received: from [10.172.233.58] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <repk@triplefau.lt>)
 id 1t4FGg-TRjzcT-EX; Fri, 25 Oct 2024 08:01:58 +0000
Received: from [10.12.239.196] (helo=localhost) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <repk@triplefau.lt>)
 id 1t4FGg-FnQW0hQ1BVS-kG4P; Fri, 25 Oct 2024 08:01:58 +0000
Date: Fri, 25 Oct 2024 10:01:52 +0200
From: Remi Pommarel <repk@triplefau.lt>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Cedric Veilleux <veilleux.cedric@gmail.com>,
 Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
Subject: Re: [PATCH v2 2/2] wifi: ath10k: Flush only requested txq in
 ath10k_flush()
Message-ID: <ZxtQcCZlQOfqkTEa@pilgrim>
References: <0f55986ebe34f2b5aa4ccbcb0bed445324099fbd.1729586267.git.repk@triplefau.lt>
 <60d579e2-5eb7-4239-9a23-95fa4b32f351@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60d579e2-5eb7-4239-9a23-95fa4b32f351@stanley.mountain>
X-Smtpcorp-Track: KDyBNsnGo2Lp.T3-pHz3vdZxv.8WBlnwmCs3k
Feedback-ID: 510616m:510616apGKSTK:510616sqkavGCBqD
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

Hi,

On Fri, Oct 25, 2024 at 10:44:09AM +0300, Dan Carpenter wrote:
> Hi Remi,
> 
> kernel test robot noticed the following build warnings:
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Remi-Pommarel/wifi-ath10k-Implement-ieee80211-flush_sta-callback/20241022-172038
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
> patch link:    https://lore.kernel.org/r/0f55986ebe34f2b5aa4ccbcb0bed445324099fbd.1729586267.git.repk%40triplefau.lt
> patch subject: [PATCH v2 2/2] wifi: ath10k: Flush only requested txq in ath10k_flush()
> config: parisc-randconfig-r071-20241024 (https://download.01.org/0day-ci/archive/20241025/202410251152.A5axJliR-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 14.1.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202410251152.A5axJliR-lkp@intel.com/
> 
> New smatch warnings:
> drivers/net/wireless/ath/ath10k/mac.c:8076 _ath10k_mac_wait_tx_complete() error: uninitialized symbol 'empty'.
> 
> vim +/empty +8076 drivers/net/wireless/ath/ath10k/mac.c
> 
> c4f7022f0ef0aa Remi Pommarel     2024-10-22  8062  static void _ath10k_mac_wait_tx_complete(struct ath10k *ar,
> c4f7022f0ef0aa Remi Pommarel     2024-10-22  8063  					 unsigned long queues)
> 5e3dd157d7e70f Kalle Valo        2013-06-12  8064  {
> affd321733eebc Michal Kazior     2013-07-16  8065  	bool skip;
> d4298a3a8c92a1 Nicholas Mc Guire 2015-06-15  8066  	long time_left;
> c4f7022f0ef0aa Remi Pommarel     2024-10-22  8067  	unsigned int q;
> 5e3dd157d7e70f Kalle Valo        2013-06-12  8068  
> 5e3dd157d7e70f Kalle Valo        2013-06-12  8069  	/* mac80211 doesn't care if we really xmit queued frames or not
> d6dfe25c8bb200 Marcin Rokicki    2017-02-20  8070  	 * we'll collect those frames either way if we stop/delete vdevs
> d6dfe25c8bb200 Marcin Rokicki    2017-02-20  8071  	 */
> 548db54cc1890b Michal Kazior     2013-07-05  8072  
> affd321733eebc Michal Kazior     2013-07-16  8073  	if (ar->state == ATH10K_STATE_WEDGED)
> 828853ac58265c Wen Gong          2018-08-28  8074  		return;
> affd321733eebc Michal Kazior     2013-07-16  8075  
> d4298a3a8c92a1 Nicholas Mc Guire 2015-06-15 @8076  	time_left = wait_event_timeout(ar->htt.empty_tx_wq, ({
> 5e3dd157d7e70f Kalle Valo        2013-06-12  8077  			bool empty;
> affd321733eebc Michal Kazior     2013-07-16  8078  
> edb8236df4d042 Michal Kazior     2013-07-05  8079  			spin_lock_bh(&ar->htt.tx_lock);
> c4f7022f0ef0aa Remi Pommarel     2024-10-22  8080  			for_each_set_bit(q, &queues, ar->hw->queues) {
> 
> Smatch is concerned that there might not be any set bits.  (You know that the
> compiler is automatically going to ininitialize empty to false so it costs
> nothing to initialize it to false explicitly and silence this warning).

Actually I think empty should be true here, if there is no queue to
wait for being drained then no need to wait at all. Will send a v3
with that fixed.

Thanks for the report and the analysis.

-- 
Remi
