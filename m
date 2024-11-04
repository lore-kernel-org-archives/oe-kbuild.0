Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CA370837;
	Mon,  4 Nov 2024 20:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730751493; cv=none; b=qNBg7nIf+YZk/AdPPLPdc1VOhQE2g//fSspWZ3G/DsRURvB2hQWvME01s1kVcmtXptj0UfFzTZdjeWZKvOqvx5bnQ1dEG6sDWEX/FFWEOP8/eB0MXFY/c6aa6fPEojQkSmYjD/9C+wa5JWxeNAWICCtMbgTWtN+IrlfgnJscR/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730751493; c=relaxed/simple;
	bh=pflxZGIfk80/m0RGcrJkM9Byb5SifgUbCWlGSC0xRiM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=NFPVlV3FLsYFx9TaLIpKDSCcJOePJesMWN4b/g8CAmKewocfRyqBfHtHNqveqwC2ettf9MZLAtGqxC8IV3ChMe2y+f1Ic+3aZIrJczXqMcR6GTYJ8mj4xzECHP0FytwQad4mBpBaqh6BROp5sbJ023eP90AlRFJyyZVAm7f6lTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OK4BDwoC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OK4BDwoC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527A4C4CECE;
	Mon,  4 Nov 2024 20:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730751491;
	bh=pflxZGIfk80/m0RGcrJkM9Byb5SifgUbCWlGSC0xRiM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=OK4BDwoCcNFfPsQlHeyrck13aWOd0AB4dkZrPIx3Dd9T6udaQChmF97UcsPEKYIov
	 4UPJ0MFbuKR7ajfn84gqL/xQCFw8WrBZ8smLsnYjBVxhiVMwLbNKFXxUtrPRMGqbNC
	 Mug1ZfcAmVu+w6wnWFVu5fXj08L5drgq/XJ2BR820hEbq5ACThyDbuSU/U9qoS9Oqd
	 1siQvXlzyPUMkpjaNNiD5DqO93+0ankSii92sjJYKVMw99Eg3PLqLd0oSBseXJbXmW
	 VzdJbL9EI0rEC2X3EE/mDgsnXrRHrAPpFDqh+67gskt1Mk2XYsa6SAb0wpPBfSgVRC
	 nHE13BfrQ3cyA==
From: Kalle Valo <kvalo@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev,  Rameshkumar Sundaram
 <quic_ramess@quicinc.com>,  lkp@intel.com,  oe-kbuild-all@lists.linux.dev,
  Jeff Johnson <jjohnson@kernel.org>,  ath12k@lists.infradead.org
Subject: Re: [ath:ath12k-mlo-qcn9274 /81]
 drivers/net/wireless/ath/ath12k/mac.c:4304 ath12k_mac_op_set_key() error:
 uninitialized symbol 'ret'.
References: <7e7afd00-ad84-4744-8d94-416bab7e7dd9@stanley.mountain>
Date: Mon, 04 Nov 2024 22:18:07 +0200
In-Reply-To: <7e7afd00-ad84-4744-8d94-416bab7e7dd9@stanley.mountain> (Dan
	Carpenter's message of "Wed, 9 Oct 2024 14:09:53 +0300")
Message-ID: <87a5ee7ny8.fsf@kernel.org>
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
> commit: 573de29145bf929c428f9e2dc55ad3f5f3da8453 [/81] wifi: ath12k: modify ath12k_mac_op_set_key for MLO
> config: csky-randconfig-r072-20241008
> (https://download.01.org/0day-ci/archive/20241009/202410090311.SK1SO5GL-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 14.1.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202410090311.SK1SO5GL-lkp@intel.com/
>
> New smatch warnings:
> drivers/net/wireless/ath/ath12k/mac.c:4304 ath12k_mac_op_set_key() error: uninitialized symbol 'ret'.
>
> vim +/ret +4304 drivers/net/wireless/ath/ath12k/mac.c
>
> b5068bc9180d06 Sriram R 2024-04-09 4222 static int
> ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
> b5068bc9180d06 Sriram R 2024-04-09 4223 struct ieee80211_vif *vif,
> struct ieee80211_sta *sta,
> b5068bc9180d06 Sriram R             2024-04-09  4224  				 struct ieee80211_key_conf *key)
> b5068bc9180d06 Sriram R             2024-04-09  4225  {
> 18333c4baa4d72 Sriram R             2024-01-27  4226  	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
> 18333c4baa4d72 Sriram R             2024-01-27  4227  	struct ath12k_link_vif *arvif;
> 611aacdb3540ff Sriram R             2024-04-14  4228  	struct ath12k_link_sta *arsta = NULL;
> b5068bc9180d06 Sriram R             2024-04-09  4229  	struct ath12k_vif_cache *cache;
> 611aacdb3540ff Sriram R             2024-04-14  4230  	struct ath12k_sta *ahsta;
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4231  	unsigned long links;
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4232  	u8 link_id;
> b5068bc9180d06 Sriram R             2024-04-09  4233  	int ret;
> b5068bc9180d06 Sriram R             2024-04-09  4234  
> d4243fd891671d Kalle Valo           2024-09-25  4235  	lockdep_assert_wiphy(hw->wiphy);
> d4243fd891671d Kalle Valo           2024-09-25  4236  
> b5068bc9180d06 Sriram R             2024-04-09  4237  	/* BIP needs to be done in software */
> b5068bc9180d06 Sriram R             2024-04-09  4238  	if (key->cipher == WLAN_CIPHER_SUITE_AES_CMAC ||
> b5068bc9180d06 Sriram R             2024-04-09  4239  	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_128 ||
> b5068bc9180d06 Sriram R             2024-04-09  4240  	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_256 ||
> 18333c4baa4d72 Sriram R             2024-01-27  4241  	    key->cipher == WLAN_CIPHER_SUITE_BIP_CMAC_256) {
> b5068bc9180d06 Sriram R             2024-04-09  4242  		return 1;
> 18333c4baa4d72 Sriram R             2024-01-27  4243  	}
> b5068bc9180d06 Sriram R             2024-04-09  4244  
> b5068bc9180d06 Sriram R             2024-04-09  4245  	if (key->keyidx > WMI_MAX_KEY_INDEX)
> b5068bc9180d06 Sriram R             2024-04-09  4246  		return -ENOSPC;
> b5068bc9180d06 Sriram R             2024-04-09  4247  
> b5068bc9180d06 Sriram R             2024-04-09  4248  	if (sta) {
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4249  		ahsta = ath12k_sta_to_ahsta(sta);
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4250 /* For an ML STA
> Pairwise key is same for all associated link Stations,
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4251 * hence do set key
> for all link STAs which are active.
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4252  		 */
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4253  		if (sta->mlo) {
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4254  			links = ahsta->links_map;
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4255
> for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4256 arvif =
> wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4257 arsta =
> wiphy_dereference(hw->wiphy, ahsta->link[link_id]);
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4258  
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4259  				if (WARN_ON(!arvif || !arsta))
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4260 /* arvif and arsta
> are expected to be valid when
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4261  					 * STA is present.
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4262  					 */
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4263  					continue;
>
> Is it possible that there are no set bits or that we always hit this continue?

Actually I'm not fully sure if links_map can be zero but I would not
assume so.

> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4264  
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4265 ret =
> ath12k_mac_set_key(arvif->ar, cmd, arvif,
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4266 arsta, key);
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4267  				if (ret)
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4268  					break;
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4269  			}
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4270  		} else {
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4271  			arsta = &ahsta->deflink;
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4272  			arvif = arsta->arvif;
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4273  			if (WARN_ON(!arvif)) {
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4274  				ret = -EINVAL;
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4275  				goto out;
> b5068bc9180d06 Sriram R             2024-04-09  4276  			}
> b5068bc9180d06 Sriram R             2024-04-09  4277  
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4278 ret =
> ath12k_mac_set_key(arvif->ar, cmd, arvif, arsta, key);
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4279  		}
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4280  	} else {
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4281 if (key->link_id
>>= 0 && key->link_id < IEEE80211_MLD_MAX_NUM_LINKS) {
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4282  			link_id = key->link_id;
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4283 arvif =
> wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4284  		} else {
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4285  			link_id = 0;
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4286  			arvif = &ahvif->deflink;
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4287  		}
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4288  
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4289  		if (!arvif || !arvif->is_created) {
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4290 cache =
> ath12k_ahvif_get_link_cache(ahvif, link_id);
> b5068bc9180d06 Sriram R             2024-04-09  4291  			if (!cache)
> b5068bc9180d06 Sriram R             2024-04-09  4292  				return -ENOSPC;
> 18333c4baa4d72 Sriram R             2024-01-27  4293  
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4294 ret =
> ath12k_mac_update_key_cache(cache, cmd, sta, key);
> 18333c4baa4d72 Sriram R             2024-01-27  4295  
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4296  			return ret;
> b5068bc9180d06 Sriram R             2024-04-09  4297  		}
> b5068bc9180d06 Sriram R             2024-04-09  4298  
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4299 ret =
> ath12k_mac_set_key(arvif->ar, cmd, arvif, NULL, key);
> 611aacdb3540ff Sriram R             2024-04-14  4300  	}
> 611aacdb3540ff Sriram R             2024-04-14  4301  
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4302  out:
> 18333c4baa4d72 Sriram R             2024-01-27  4303  
> d889913205cf7e Kalle Valo           2022-11-28 @4304  	return ret;
>
> If so then ret is uninitialized

Thanks for the report, I fixed it like this in ath12k-mlo branch (not
yet submitted for review):

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=ath12k-mlo&id=1ed8ae547f604b6c6176aeadd98bd192c9031066

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
