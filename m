Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182001DE2A9;
	Mon,  4 Nov 2024 20:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730751579; cv=none; b=nXifGgH1sc7x00iQVfTshH6umHWkOmWtLULOK/rlemZ+bz036sKgoMZbDmN6+K+0XCqIHf9W+hURuqxa+Y5xuNfW05E4APoStIp8A5Nw9MUCHJ1SdPDxPUUtlAJcF775OdoQC+nKILY+RURCOo2kjcGcRYjS1ozLA3f+KEeMGa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730751579; c=relaxed/simple;
	bh=t+81eTbXcftmLidkjGEqYw6lTVf3GM8d0pl0hGy7AD4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=b/UvJAs8wIyOc2UaboWkOpUQ749wewsupcEEyhi66lT9HrelFn6g/wUXC8Dnua+bxsZeaAz5lPd93is0ejtN9MwUoASyBZ21OxlKSV3YoR3nJFyH6fFOj2AoQvJU50dDgah0hzk2hTo5fDFpWovlqv6BK8dfWECQRcZXMUypbfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GKT1NOdZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GKT1NOdZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5FDDC4CED0;
	Mon,  4 Nov 2024 20:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730751578;
	bh=t+81eTbXcftmLidkjGEqYw6lTVf3GM8d0pl0hGy7AD4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=GKT1NOdZudd9ZNLX0aNtcbGIoxGo+/2XUQsJHMqOWhyMJ8Z3TvcA+0w9Ldd1wVszQ
	 ULCTeCpkdpJ23cgtrKjW36Cge5jj/5Itv04WIWEhUIU/qTlgrfZh2bdda1kr5NhArc
	 B+OfwwcJDuVC3YLWndi0YwGgcSvazZxeWuKDerImOnkquxHw3sd31RU5u5Xtvt1tqR
	 jGZPRXqNs5Wt8EAQJgYzrqSfLh0R4VZZMgAOAj+BUJ63smlaUDrc4swhZ4f9+ngjit
	 uc07gz4CnvKJrvYoliONagCEr1Rp9qpigRtvTY5tPS2ZwgWhyC5UJyXLzYlQf5bFJG
	 req8yuCDckiFw==
From: Kalle Valo <kvalo@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev,  Sriram R <quic_srirrama@quicinc.com>,
  lkp@intel.com,  oe-kbuild-all@lists.linux.dev,  Jeff Johnson
 <jjohnson@kernel.org>,  ath12k@lists.infradead.org,  Rameshkumar Sundaram
 <quic_ramess@quicinc.com>
Subject: Re: [ath:ath12k-mlo-qcn9274 64/81]
 drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf()
 error: buffer overflow 'vif->link_conf' 15 <= 15
References: <207e7634-4390-47ac-bc62-c888f9dc34b4@stanley.mountain>
Date: Mon, 04 Nov 2024 22:19:34 +0200
In-Reply-To: <207e7634-4390-47ac-bc62-c888f9dc34b4@stanley.mountain> (Dan
	Carpenter's message of "Wed, 9 Oct 2024 14:14:29 +0300")
Message-ID: <875xp27nvt.fsf@kernel.org>
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
> commit: 8e3d460d4c16e52a70ebfa7e1dd0bd20bf739888 [64/81] wifi: ath12k:
> Use mac80211 vif's link conf instead of bss_conf
> config: csky-randconfig-r072-20241008
> (https://download.01.org/0day-ci/archive/20241009/202410090633.yjfmlMkr-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 14.1.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202410090633.yjfmlMkr-lkp@intel.com/
>
> New smatch warnings:
> drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf()
> error: buffer overflow 'vif->link_conf' 15 <= 15
> drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf()
> error: buffer overflow 'vif->link_conf' 15 <= 15
> drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf()
> error: buffer overflow 'vif->link_conf' 15 <= 15
> drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf()
> error: buffer overflow 'vif->link_conf' 15 <= 15
> drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf()
> error: buffer overflow 'vif->link_conf' 15 <= 15
>
> vim +517 drivers/net/wireless/ath/ath12k/mac.c
>
> 8e3d460d4c16e5 Sriram R 2024-08-16 507 struct ieee80211_bss_conf
> *ath12k_get_link_bss_conf(struct ath12k_link_vif *arvif)
> 8e3d460d4c16e5 Sriram R   2024-08-16  508  {
> 8e3d460d4c16e5 Sriram R   2024-08-16  509  	struct ieee80211_vif *vif = arvif->ahvif->vif;
> 8e3d460d4c16e5 Sriram R   2024-08-16  510  	struct ieee80211_bss_conf *link_conf;
> 8e3d460d4c16e5 Sriram R 2024-08-16 511 /* ieee80211_vif->link_conf[]s
> are rcu objects which requires rcu_read_lock()
> 8e3d460d4c16e5 Sriram R   2024-08-16  512  	 * to be held for safe access.
> 8e3d460d4c16e5 Sriram R   2024-08-16  513  	 */
> 8e3d460d4c16e5 Sriram R   2024-08-16  514  	if (arvif->link_id > IEEE80211_MLD_MAX_NUM_LINKS)
>
> Seems like this is an off by one.

Yup, fixed version of the patch (not yet submitted for review):

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=ath12k-mlo&id=51a7ce0fc98b4fc70200cc113ec77a8159c40ca4

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
