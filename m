Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38E01E3DC4;
	Mon,  4 Nov 2024 20:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730751670; cv=none; b=ZS0WKbf5WhTW+rU3XTHQtIdRXqeL6gqUxmapWJrz8EePaf4i3OBRKuOjPEX3gGUNIqdfkDmp+F03rQvRqb0HNXsVxYdsrXOk/q2yAmIOvEaF8Y68dXTVdUbqnoSgR6rHwn7fW+sirAZhFVBcFYtVKPG7YTiPtmCiXH6PKGfq10I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730751670; c=relaxed/simple;
	bh=wHPYPok304nfjlgeLG33lDiyI9NNxI3M4LCUZVxfMWU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=CXWkw9GfQKqR/vKxPrfn75Wp7Ht7CnNE00tvcVR1myG3uB5Ax/ybm7HuCYPaec9r6re7/8KS7lX0ZMCRGoH+mWJWvIbTQUvnCNaO7ybmAYFF4s8FXwxs2PW/hgUvaXwGS1JPl+unuVow07y/L4KiINBsbJ3J8vyLz6NjhvyPaHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fm1Tf503; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fm1Tf503"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B616C4CECE;
	Mon,  4 Nov 2024 20:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730751670;
	bh=wHPYPok304nfjlgeLG33lDiyI9NNxI3M4LCUZVxfMWU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=fm1Tf503RH7s32mchBl5TKcZvTg/X1AaIcf1qU85GSABFRCksOkYm4wB3xCBXoPcc
	 FU6mLNLlhqJQ+o4XjRRZdgRX8+OCizWWzsGRmLskfIiz1eU7mbYNiSdX6JO3BbIjEt
	 tg3Y298Pp6siesu2jptOknaJjMIsylmwHsNW/Gyul2ucJb+kqwihLEGSvkELE6vimg
	 TzhLDT7Fj9C8yX+f8yqwyUwZORe7TcmH/zJ99PRZQ0qlnBpChkcOQSv/cGBCcEL1EM
	 00nfn2FIkYxbLq/QCUyEfaxG7pYkHcCJnrhjllS6c1ad20ujZR5ysNxAv10ko0eT65
	 Fce0kp4DDrLKQ==
From: Kalle Valo <kvalo@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev,  Sriram R <quic_srirrama@quicinc.com>,
  lkp@intel.com,  oe-kbuild-all@lists.linux.dev,  Jeff Johnson
 <jjohnson@kernel.org>,  ath12k@lists.infradead.org,  Rameshkumar Sundaram
 <quic_ramess@quicinc.com>
Subject: Re: [ath:ath12k-mlo-qcn9274 65/81]
 drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error:
 buffer overflow 'sta->link' 15 <= 15
References: <8f50a85a-b09a-421b-ab02-55b4f3b6aa18@stanley.mountain>
Date: Mon, 04 Nov 2024 22:21:06 +0200
In-Reply-To: <8f50a85a-b09a-421b-ab02-55b4f3b6aa18@stanley.mountain> (Dan
	Carpenter's message of "Wed, 9 Oct 2024 14:16:36 +0300")
Message-ID: <871pzq7nt9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Dan Carpenter <dan.carpenter@linaro.org> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo-qcn9274
> head:   7435d14d41d5d479a5e6a8a2cd4efdac9d928823
> commit: d50d85ea8574956b273faf4cb2493a98c6548b04 [65/81] wifi: ath12k:
> Use mac80211 sta's link_sta instead of deflink
> config: csky-randconfig-r072-20241008
> (https://download.01.org/0day-ci/archive/20241009/202410091157.eMoYClhc-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 14.1.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202410091157.eMoYClhc-lkp@intel.com/
>
> New smatch warnings:
> drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15
> drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15
> drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15
> drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15
> drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15
>
> vim +534 drivers/net/wireless/ath/ath12k/mac.c
>
> d50d85ea857495 Sriram R 2024-08-16  522  static struct
> d50d85ea857495 Sriram R 2024-08-16  523  ieee80211_link_sta *ath12k_get_link_sta(struct ath12k_link_sta *arsta)
> d50d85ea857495 Sriram R 2024-08-16  524  {
> d50d85ea857495 Sriram R 2024-08-16  525  	struct ath12k_sta *ahsta = arsta->ahsta;
> d50d85ea857495 Sriram R 2024-08-16  526  	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(ahsta);
> d50d85ea857495 Sriram R 2024-08-16  527  	struct ieee80211_link_sta *link_sta;
> d50d85ea857495 Sriram R 2024-08-16 528 /* ieee80211_sta->link[]'s are
> rcu objects which requires rcu_read_lock()
> d50d85ea857495 Sriram R 2024-08-16  529  	 * to be held for safe access.
> d50d85ea857495 Sriram R 2024-08-16  530  	 */
> d50d85ea857495 Sriram R 2024-08-16  531  	if (arsta->link_id > IEEE80211_MLD_MAX_NUM_LINKS)
>
> Was >= intended?

Yes, fixed version here:

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=ath12k-mlo&id=722120a853986de95db37e92ecbf731deffe86fa

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
