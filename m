Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93126201278;
	Thu, 15 Oct 2026 09:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057749; cv=none; b=Q8gugYBf1VJZEZaxo5Fy5j1MlKvockqIbsZ0QA6ADODmjEKip3MXBQyXlgjFaIEp6+qBpVVAR4vjReKAI16LoGLSV9wg3L+u0s9xW77h5TopTVZisQF9ELM5IhbmVeUys6+tsT5lDn6PNs3blVd8LtbGCtqIVxnl22ybkpK0aXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057749; c=relaxed/simple;
	bh=Q0owlFRqrPU/WZLdQp89aA+KboqIlWnS4Y+of9v95lk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kCZy5iMR+iibqqzFAvw3Hsvb2iJd8uyYD6dl7xEhZTvh37VkJaZhbJBBwZ9NuwOwG2LWG2AfZTK7qj0cP94EZUQzXP6csevzaX6VkvoE3dMfpTXtSJIQEY34nCgMCWO0aSTPWS3Ft4pdnaEK4ZaBCUcpKVLoE1UiHm+36RX+vWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=km0kQvt3; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="km0kQvt3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=zAEnMHXSGbODnoHINQmdECLQl9knKinv4Jxofdnbb10=;
	t=1792057745; x=1793267345; b=km0kQvt3rPy73i70BbUWeSSIisQc5yjF92iP7K/YsKvKPZo
	2S0SGi2dH8oyf36z2oHhrQcunasVCFC9jLAuY6YvYiEYIjwUu2kJoL0WWKQUnakzs5FQQG4aC2wjd
	KKXCtWrPwHFqk3xrUaJXCsEjsfRE20PNHhNs3RpzHpdU46e0NjULQeFmBLDnL6WWMDyxALOEAmVFP
	KE/DN0CTo74pZ/F2/RQiJHoZTWAsjrM8u3GqSZR1VBymSJJWNjIvfsPBVoI2xAcnoPjRs/vk1WrMx
	VNM8xDEcBGk/FD8As1hAfB/fiKZNtxICImj/wzrAtS/4eqmvHpXvQ3qmBcZSrr+w==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xHI56-00000003OQo-0Aca;
	Thu, 15 Oct 2026 11:49:00 +0200
Message-ID: <1aa920b5ece0378fcab80fc56b68bc6bf41ffee5.camel@sipsolutions.net>
Subject: Re: [ath:ath-next 6/34] net/wireless/nl80211.c:20114
 nl80211_pre_doit() error: 'wdev' dereferencing possible ERR_PTR()
From: Johannes Berg <johannes@sipsolutions.net>
To: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Jeff Johnson
	 <jjohnson@kernel.org>, ath12k@lists.infradead.org
Date: Thu, 15 Oct 2026 11:48:59 +0200
In-Reply-To: <202610140243.w1Zrwq4k-lkp@intel.com>
References: <202610140243.w1Zrwq4k-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Thu, 2026-10-15 at 12:40 +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-n=
ext
> head:   cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
> commit: 13c20e8be3278e54f4758941998a3ee746644d8d [6/34] wifi: nl80211: pr=
epare for unlocked wdev-only ops
> config: sparc-randconfig-r2200-20261013 (https://download.01.org/0day-ci/=
archive/20261014/202610140243.w1Zrwq4k-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 14.3.0
> smatch: v0.5.0-9187-g5189e3fb
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <error27@gmail.com>
> > Closes: https://lore.kernel.org/r/202610140243.w1Zrwq4k-lkp@intel.com/
>=20
> New smatch warnings:
> net/wireless/nl80211.c:20114 nl80211_pre_doit() error: 'wdev' dereferenci=
ng possible ERR_PTR()

It's a bit needlessly worried, because:

> 13c20e8be3278e Johannes Berg        2026-10-09  19979  	wdev_ref =3D nl80=
211_need_wdev_ref(internal_flags);

This is

static bool nl80211_need_wdev_ref(u32 internal_flags)
{
        return !(internal_flags & NL80211_FLAG_NEED_RTNL) &&
               internal_flags & NL80211_FLAG_NO_WIPHY_MTX;
}


so NL80211_FLAG_NO_WIPHY_MTX must be set

> 8e3d9039d280c6 Johannes Berg        2026-10-06  20029  	if (rdev && !(int=
ernal_flags & NL80211_FLAG_NO_WIPHY_MTX)) {
> 8e3d9039d280c6 Johannes Berg        2026-10-06  20030  		if (need_rtnl) {
> 8e3d9039d280c6 Johannes Berg        2026-10-06  20031  			wiphy_lock(&rde=
v->wiphy);
> 8e3d9039d280c6 Johannes Berg        2026-10-06  20032  		} else {
> 8e3d9039d280c6 Johannes Berg        2026-10-06  20033  			/* without rtnl=
, things may have changed since lookup */
> 8e3d9039d280c6 Johannes Berg        2026-10-06  20034  			wdev =3D nl8021=
1_lock_and_recheck(rdev, netns, wdev_id);
> 8e3d9039d280c6 Johannes Berg        2026-10-06  20035  			if (IS_ERR(wdev=
)) {
> 8e3d9039d280c6 Johannes Berg        2026-10-06  20036  				err =3D PTR_ER=
R(wdev);
> 8e3d9039d280c6 Johannes Berg        2026-10-06  20037  				goto out;
>=20
> Smatch is worried about this goto.

while we can only get to that goto when it's not set.

I guess we can still set wdev to NULL here to avoid the dependency and
potential future bugs.

johannes
