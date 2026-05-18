Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB9437BE6D
	for <oe-kbuild@lists.linux.dev>; Mon, 18 May 2026 05:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779081291; cv=none; b=bF8zj889/gJMsnIQKd9HQCqFTTlK8Cb0bAwdWm8lVzG0RNguSAVPb6dqoLcgcrHqTfReAn1nYqpk7nfnc7+WHCdUSZJ5l+psPirDLrVKdLZ5LLgV7p1qmX8J5beGbnB/E3RmJH/RfQGslqHH+kTuQOVlRJIicR9MFf+YKph/0bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779081291; c=relaxed/simple;
	bh=q+Ye1t5MieuYxH22YzdFlQI/46Lvk1vTTDVqN5sfU6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJC0DZJCtadgsIchdRg++L8iG5XBX4aj35nHCwezo4O4HKPe/Zbe3zKB9jlg6qqIMMlluMV0wwW2SGXMMOz95ZlSFUV92E339PM7ZCS5Kf+g/AuFF9vV9UDRYKjHTJvQIw7Ew0tRUTzJw/cWTmTKROfOhaXcSkaOF+SqV9GsBVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRu591CI; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRu591CI"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-448528f4e69so962344f8f.3
        for <oe-kbuild@lists.linux.dev>; Sun, 17 May 2026 22:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779081288; x=1779686088; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H++yyYpAtfeJ9r0MHoxydujiVZmkWKLBHrn4zymlxUQ=;
        b=TRu591CIiJtgt7aDusuhHHDiLrpLOCTtn9xO/6d97u+irQ04iT0GG//4N28mT9lnxu
         GKfm9X9hfB9nXnu0QigXr3kBDDTDB2vfs9RC9uW/oas9UMI+NXmnwfyuFfBy9ymDxeJG
         ni6pAe84Q/MZlLoQcwbpSJPJLAETcYJtBsQMuFWrpemxfvCnUChgHT6jVagDoZS5lhVg
         nyoShysc9POYJt5edQ8KGalhtjKT+g99Qs/lyMgmGO8Uz56E0dEp5s4/SLjaLSCKnB3r
         ea9D0cVJVEaufmVKE3Zdw/Wp90DyT6KZBREMesGqEyMnWqgryMsPNTVghViTDZTSEOF5
         qblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779081288; x=1779686088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H++yyYpAtfeJ9r0MHoxydujiVZmkWKLBHrn4zymlxUQ=;
        b=c92aTKvTVqI8XBKolNrAyedo6DM0k0Bj5CkD/gXmiIodGV87KEDDUuLQuXNXrrZZyy
         Xhu645JJeO43Dy0yjM0hegReSTwDkscangKZKjABc0KaDTvWUrSGOaQB4cucWggkzi8G
         V9O5hblqe2UduYahGdRpJ1hHCm/DEwGDq9zCVdsK947JvpsEFt2znF97r7FAN4F7Lf1A
         +U8DDjuqJiUvJ+8936LHYQ2oP+Xah5eeUsmUNZwUSbEfUzry4Kf0arH9tcJ/IgU3cxnh
         Cve3bogOZ5e8641j1PLebyTU6Js9qFKBZOpF/9/M+udtPnPw230xHWnxHb64zNX0pcA7
         Oj+g==
X-Gm-Message-State: AOJu0Yx7PJk3BmCtscttzB6faAy6URoonyaHUp/sk2hTXLgexAn5a2mJ
	LP7jqOKSZAYyHBbRaF5DznCcM1Ong1JbBLINBIruFh+AIsu73crgM9ndzSR+bA==
X-Gm-Gg: Acq92OFMp1SrfsvE9en8YHIzCj6ktWl28gAUFoh+TLmV+hQEh1ORLj8HrHGj/FV+8N6
	FPLBzZ3BbQue4nJOwHZ7WCG7hUyqc1pop7y8sDsgrpbctCio2hMBSNj78U/59BBTo0ekYCrpfoW
	vwgqMOtxywMZFMn/td59nyip3vW1Fv5YDTwg28y0bHR5otp/599NeDM//UH9FuJHjnlQTg8JM04
	rfH8jOL656aOjcojHL45bKCqoWnfn+fI7cZS68wRtce8jU0BHp0FJkfg+YGaVSQ0VyljqjAZBwp
	/7/dzlyY/Gom56PeNy5ZZJX5I+UCi7pFpQA+MiMnirtj2u69ubBg5PfuAfpnk87JGUML1OcnwCS
	1VNIUN3847ej21hxrcwlWMJL+ENO+Eb2T4//B5nZ2eh3RhHNjjCBbbyWOAixodoY4h3s5b4t+mw
	WHXGHB9Ub59X4AsAf6ttM=
X-Received: by 2002:a05:6000:25c6:b0:454:a12c:6cdb with SMTP id ffacd0b85a97d-45e5c57d4bcmr20956905f8f.2.1779081288513;
        Sun, 17 May 2026 22:14:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767cb9sm33188911f8f.2.2026.05.17.22.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 22:14:47 -0700 (PDT)
Date: Mon, 18 May 2026 08:14:45 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
Cc: "oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>,
	lkp <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"Berg, Johannes" <johannes.berg@intel.com>
Subject: Re: [iwlwifi-next:next 13/93]
 drivers/net/wireless/intel/iwlwifi/mld/tx.c:571 iwl_mld_fill_tx_cmd() warn:
 variable dereferenced before check 'mld_sta' (see line 565)
Message-ID: <agqgRaXY5OSEDzSh@stanley.mountain>
References: <202605171045.6jPun4QF-lkp@intel.com>
 <DS0PR11MB788062B175A1E6833DA8EC31A3032@DS0PR11MB7880.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS0PR11MB788062B175A1E6833DA8EC31A3032@DS0PR11MB7880.namprd11.prod.outlook.com>

On Mon, May 18, 2026 at 05:11:00AM +0000, Korenblit, Miriam Rachel wrote:
> 
> 
> > -----Original Message-----
> > From: Dan Carpenter <error27@gmail.com>
> > Sent: Monday, May 18, 2026 8:03 AM
> > To: oe-kbuild@lists.linux.dev; Korenblit, Miriam Rachel
> > <miriam.rachel.korenblit@intel.com>
> > Cc: lkp <lkp@intel.com>; oe-kbuild-all@lists.linux.dev; Berg, Johannes
> > <johannes.berg@intel.com>
> > Subject: [iwlwifi-next:next 13/93] drivers/net/wireless/intel/iwlwifi/mld/tx.c:571
> > iwl_mld_fill_tx_cmd() warn: variable dereferenced before check 'mld_sta' (see
> > line 565)
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git
> > next
> > head:   ce2b645bb3099ef4d96759335271e25875202ce9
> > commit: d751c944055aedf33a6cab9b1cadaab65d7bc8dd [13/93] wifi: iwlwifi:
> > mld: use host rate for NAN management frames
> > config: i386-randconfig-141-20260517 (https://download.01.org/0day-
> > ci/archive/20260517/202605171045.6jPun4QF-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project
> > 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > smatch: v0.5.0-9185-gbcc58b9c
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of the
> > same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Closes: https://lore.kernel.org/r/202605171045.6jPun4QF-lkp@intel.com/
> > 
> > smatch warnings:
> > drivers/net/wireless/intel/iwlwifi/mld/tx.c:571 iwl_mld_fill_tx_cmd() warn:
> > variable dereferenced before check 'mld_sta' (see line 565)
> > 
> > vim +/mld_sta +571 drivers/net/wireless/intel/iwlwifi/mld/tx.c
> > 
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  538  static void
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  539  iwl_mld_fill_tx_cmd(struct
> > iwl_mld *mld, struct sk_buff *skb,
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  540  		    struct
> > iwl_device_tx_cmd *dev_tx_cmd,
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  541  		    struct
> > ieee80211_sta *sta)
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  542  {
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  543  	struct
> > ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  544  	struct ieee80211_hdr
> > *hdr = (void *)skb->data;
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  545  	struct iwl_mld_sta
> > *mld_sta = sta ? iwl_mld_sta_from_mac80211(sta) :
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  546
> > 		    NULL;
> > 1c97c73cdab0afc Miri Korenblit 2025-05-11  547  	struct iwl_tx_cmd
> > *tx_cmd;
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  548  	bool amsdu =
> > ieee80211_is_data_qos(hdr->frame_control) &&
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  549
> > (*ieee80211_get_qos_ctl(hdr) &
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  550
> > IEEE80211_QOS_CTL_A_MSDU_PRESENT);
> > dabc88cb3b78c0d Johannes Berg  2025-05-05  551  	__le32 rate_n_flags =
> > 0;
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  552  	u16 flags = 0;
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  553
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  554  	dev_tx_cmd->hdr.cmd
> > = TX_CMD;
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  555
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  556  	if (!info-
> > >control.hw_key)
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  557  		flags |=
> > IWL_TX_FLAGS_ENCRYPT_DIS;
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  558
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  559  	/* For data and mgmt
> > packets rate info comes from the fw.
> > d751c944055aedf Miri Korenblit 2026-05-10  560  	 * Only set
> > rate/antenna for:
> > d751c944055aedf Miri Korenblit 2026-05-10  561  	 * - injected frames
> > with fixed rate,
> > d751c944055aedf Miri Korenblit 2026-05-10  562  	 * - when no sta is
> > given.
> > d751c944055aedf Miri Korenblit 2026-05-10  563  	 * - frames that are
> > sent to an NMI sta, which is only used for management.
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  564  	 */
> > d751c944055aedf Miri Korenblit 2026-05-10 @565  	if (unlikely(!sta ||
> > mld_sta->vif->type == NL80211_IFTYPE_NAN ||
> >                                                                              ^^^^^^^^^^^^^^^^^^ Dereference
> 
> 
> This is not a real issue because (sta != NULL) -> (mld_sta != NULL)
> 

You could delete the other NULL check then.  The checker just wants
it to be consistent.

regards,
dan carpenter

