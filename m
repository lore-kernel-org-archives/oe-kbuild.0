Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDAB3234
	for <oe-kbuild@lists.linux.dev>; Fri, 23 May 2025 08:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747989101; cv=none; b=GXrbN0Aj4lqPDjiuDcoqclIdLqecMmYWdLCn35ylOX2e7pUSEQN51x1hq7Qr0HXb7xZ1C6gETPPmsPR3LlptZjDoZEx2hQJwg7Ot9/4N/Ml34v+NIS4SADAIAPUO195dwuuijswBmfOvaMHjJE++4Rw4mlyXu/3WqAEKruQfR4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747989101; c=relaxed/simple;
	bh=MfkOezWZzrnx07aGPjd47taGfhkcKxABgtGITwH43+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r51X2JAoy8bAcR4cmAwooRp90UplUNwQ95RkBeahSlKzKLdCZQogqG0AvOwOmnufbQDPI7NFMxo4/BaqKJylXw4ByIxoM+SL7f0zxfa79vux/0bkAZGjRsP1erNBKXxaqjUXzp46pXBg9mTpMOgQ07Ma7GK0vyZs9sOu65uBfKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N+WpV7k/; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N+WpV7k/"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a36abf5df9so442480f8f.0
        for <oe-kbuild@lists.linux.dev>; Fri, 23 May 2025 01:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747989098; x=1748593898; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=le694XSYWE6RVk/YVetm5E7FCuIzvCIq7P47IsPfytE=;
        b=N+WpV7k/jTv54evllntY4jedlgSH9tQN0lLBv5HT1mGRGl3RHTB5KFkAs8vn49KwZP
         rqkZoB5y1snckO9B7jXBEllCnSpaFtstHx4nIINx9Z/UP1NUqAAd0FTg1+GA5Lt9iMxN
         7cDeW0qMf6C5+WIX4N3JSY0CFXIyFdGFLHhl9N+KWRpB8qNCcHIWD6aTdSBy79oBpruS
         i14bav6b33WKE6afYuvFsjb5jvFIne+Wj0tvtEmCm6bJpZmnW2qxNhjld6X34ZIAHCWk
         AkF3RxbVi7x0KPernbw/1zi96g2Z5kHsa58l+p+gHygFPSp26rtmXNkOUbjq5ZFnAaEU
         Uu+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747989098; x=1748593898;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=le694XSYWE6RVk/YVetm5E7FCuIzvCIq7P47IsPfytE=;
        b=oIa1RR6IHI9E+BWYB0qDdyIseLMDFpRvDIMqVQDDup5RsCZDLtrRbGRTQZdNsUTJa2
         6FQ5G0T8+JPAPT664q8juuIeyDS4iHEuwSDk3Uj1GAq9trX9S0KN5doblZI9+4LsEuuy
         rcbVLS7DgyNB7Lp+XqnFk4Jbr7LLNcN1kecnCNin4ZEfefsRzWOSxol47/X9RSINFQ14
         UXRv6Yyuxc23ZotjvIO+Cbi3mpMRVdt4l88hYm2E2SaGGvkZzGxsGWwEEYzKZLHtQ4ju
         +SOGtTaHsFbUHfpahjGWhMCqDzIFOLrKG94tp/XxWWCnK0RaEft53VHAbiZgrTcyy8gG
         AT6g==
X-Gm-Message-State: AOJu0Yzvja5dE+mfHFhZHdmT7I8bCbnhXOcK3RIqjvBMVt94r6714WFv
	u3gz51Z32Pls0ehKbxUsb/0xMGe9Lkw/DcurMHuFmtsVhHWq4HsvMKWCI/ghqsWAQbW2uEerqY+
	sWL30
X-Gm-Gg: ASbGncvgb3vs0HQg+J3/HTpab0NCMsMqc0+MgCVnQ1dQuHes5/0e8aspQOX2UAytMt+
	eNW/UWo0wQ15J5Z1fQ7nd6wNHdhoovc+0rB9r7CCYpr4QvdRsF5n5gLuX5QO6xgXef5hfPgHwon
	iSXJmszPK4VWnV1LQaaG12yUiAs4/5Zof4tpoQ+yTO/POYXvUN5kIENQSP9/eAjmDfSLeBK1Ku6
	fg9cvmPXuNm9snKRTnwD5T8YNBfda0/PZNlgzcrliLXnRphuN1fu9rigjxeWHtn5pvToNAeX44B
	6Wzq0xZIqtm2C3tQAH5FMuL3163sCOXKmx01doex55tUvepYi6PX/5IL
X-Google-Smtp-Source: AGHT+IEHiJg8FtJaRq9Kty0uh+3w1R54P+fvdmmVAyRZ2+UDfrkkVE/zSADNB2Bm3QdDJFAxAdqEvg==
X-Received: by 2002:a5d:64cd:0:b0:3a3:6d25:b8e2 with SMTP id ffacd0b85a97d-3a4c14ea5a0mr2267830f8f.6.1747989097564;
        Fri, 23 May 2025 01:31:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-447f78b0acasm129176085e9.31.2025.05.23.01.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 01:31:37 -0700 (PDT)
Date: Fri, 23 May 2025 11:31:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Baochen Qiang <quic_bqiang@quicinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	ath12k@lists.infradead.org,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Subject: [ath:pending-deferred 25/61]
 drivers/net/wireless/ath/ath12k/mac.c:10069 ath12k_mac_fill_reg_tpc_info()
 error: uninitialized symbol 'eirp_power'.
Message-ID: <202505180927.tbNWr3vE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250523083134.LE9MojGeFjfVMJn59zsOy61_KSLtYYFMH-En-Z4b7RA@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending-deferred
head:   52c1e49f8c69a630f3dbe7dd79c52979cdad19d2
commit: aeda163bb0c7b9fc58bdd6ae90c0eef4f4050b7b [25/61] wifi: ath12k: fill parameters for vdev set TPC power WMI command
config: x86_64-randconfig-161-20250518 (https://download.01.org/0day-ci/archive/20250518/202505180927.tbNWr3vE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505180927.tbNWr3vE-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:10069 ath12k_mac_fill_reg_tpc_info() error: uninitialized symbol 'eirp_power'.

vim +/eirp_power +10069 drivers/net/wireless/ath/ath12k/mac.c

aeda163bb0c7b9 Baochen Qiang 2025-04-18   9902  void ath12k_mac_fill_reg_tpc_info(struct ath12k *ar,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9903  				  struct ath12k_link_vif *arvif,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9904  				  struct ieee80211_chanctx_conf *ctx)
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9905  {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9906  	struct ath12k_base *ab = ar->ab;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9907  	struct ath12k_reg_tpc_power_info *reg_tpc_info = &arvif->reg_tpc_info;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9908  	struct ieee80211_bss_conf *bss_conf = ath12k_mac_get_link_bss_conf(arvif);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9909  	struct ieee80211_channel *chan, *temp_chan;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9910  	u8 pwr_lvl_idx, num_pwr_levels, pwr_reduction;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9911  	bool is_psd_power = false, is_tpe_present = false;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9912  	s8 max_tx_power[ATH12K_NUM_PWR_LEVELS],
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9913  		psd_power, tx_power, eirp_power;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9914  	u16 start_freq, center_freq;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9915  
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9916  	chan = ctx->def.chan;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9917  	start_freq = ath12k_mac_get_6ghz_start_frequency(&ctx->def);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9918  	pwr_reduction = bss_conf->pwr_reduction;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9919  
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9920  	if (arvif->reg_tpc_info.num_pwr_levels) {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9921  		is_tpe_present = true;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9922  		num_pwr_levels = arvif->reg_tpc_info.num_pwr_levels;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9923  	} else {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9924  		num_pwr_levels = ath12k_mac_get_num_pwr_levels(&ctx->def);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9925  	}
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9926  
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9927  	for (pwr_lvl_idx = 0; pwr_lvl_idx < num_pwr_levels; pwr_lvl_idx++) {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9928  		/* STA received TPE IE*/
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9929  		if (is_tpe_present) {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9930  			/* local power is PSD power*/
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9931  			if (chan->flags & IEEE80211_CHAN_PSD) {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9932  				/* Connecting AP is psd power */
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9933  				if (reg_tpc_info->is_psd_power) {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9934  					is_psd_power = true;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9935  					ath12k_mac_get_psd_channel(ar, 20,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9936  								   &start_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9937  								   &center_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9938  								   pwr_lvl_idx,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9939  								   &temp_chan,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9940  								   &tx_power);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9941  					psd_power = temp_chan->psd;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9942  					eirp_power = tx_power;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9943  					max_tx_power[pwr_lvl_idx] =
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9944  						min_t(s8,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9945  						      psd_power,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9946  						      reg_tpc_info->tpe[pwr_lvl_idx]);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9947  				/* Connecting AP is not psd power */
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9948  				} else {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9949  					ath12k_mac_get_eirp_power(ar,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9950  								  &start_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9951  								  &center_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9952  								  pwr_lvl_idx,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9953  								  &temp_chan,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9954  								  &ctx->def,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9955  								  &tx_power);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9956  					psd_power = temp_chan->psd;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9957  					/* convert psd power to EIRP power based
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9958  					 * on channel width
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9959  					 */
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9960  					tx_power =
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9961  						min_t(s8, tx_power,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9962  						      psd_power + 13 + pwr_lvl_idx * 3);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9963  					max_tx_power[pwr_lvl_idx] =
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9964  						min_t(s8,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9965  						      tx_power,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9966  						      reg_tpc_info->tpe[pwr_lvl_idx]);

eirp_power is not set on this else path.

aeda163bb0c7b9 Baochen Qiang 2025-04-18   9967  				}
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9968  			/* local power is not PSD power */
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9969  			} else {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9970  				/* Connecting AP is psd power */
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9971  				if (reg_tpc_info->is_psd_power) {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9972  					is_psd_power = true;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9973  					ath12k_mac_get_psd_channel(ar, 20,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9974  								   &start_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9975  								   &center_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9976  								   pwr_lvl_idx,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9977  								   &temp_chan,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9978  								   &tx_power);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9979  					eirp_power = tx_power;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9980  					max_tx_power[pwr_lvl_idx] =
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9981  						reg_tpc_info->tpe[pwr_lvl_idx];
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9982  				/* Connecting AP is not psd power */
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9983  				} else {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9984  					ath12k_mac_get_eirp_power(ar,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9985  								  &start_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9986  								  &center_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9987  								  pwr_lvl_idx,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9988  								  &temp_chan,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9989  								  &ctx->def,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9990  								  &tx_power);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9991  					max_tx_power[pwr_lvl_idx] =
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9992  						min_t(s8,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9993  						      tx_power,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9994  						      reg_tpc_info->tpe[pwr_lvl_idx]);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9995  				}
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9996  			}
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9997  		/* STA not received TPE IE */
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9998  		} else {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9999  			/* local power is PSD power*/
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10000  			if (chan->flags & IEEE80211_CHAN_PSD) {
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10001  				is_psd_power = true;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10002  				ath12k_mac_get_psd_channel(ar, 20,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10003  							   &start_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10004  							   &center_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10005  							   pwr_lvl_idx,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10006  							   &temp_chan,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10007  							   &tx_power);
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10008  				psd_power = temp_chan->psd;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10009  				eirp_power = tx_power;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10010  				max_tx_power[pwr_lvl_idx] = psd_power;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10011  			} else {
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10012  				ath12k_mac_get_eirp_power(ar,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10013  							  &start_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10014  							  &center_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10015  							  pwr_lvl_idx,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10016  							  &temp_chan,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10017  							  &ctx->def,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10018  							  &tx_power);
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10019  				max_tx_power[pwr_lvl_idx] = tx_power;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10020  			}
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10021  		}
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10022  
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10023  		if (is_psd_power) {
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10024  			/* If AP local power constraint is present */
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10025  			if (pwr_reduction)
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10026  				eirp_power = eirp_power - pwr_reduction;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10027  
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10028  			/* If firmware updated max tx power is non zero, then take
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10029  			 * the min of firmware updated ap tx power
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10030  			 * and max power derived from above mentioned parameters.
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10031  			 */
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10032  			ath12k_dbg(ab, ATH12K_DBG_MAC,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10033  				   "eirp power : %d firmware report power : %d\n",
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10034  				   eirp_power, ar->max_allowed_tx_power);
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10035  			/* Firmware reports lower max_allowed_tx_power during vdev
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10036  			 * start response. In case of 6 GHz, firmware is not aware
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10037  			 * of EIRP power unless driver sets EIRP power through WMI
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10038  			 * TPC command. So radio which does not support idle power
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10039  			 * save can set maximum calculated EIRP power directly to
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10040  			 * firmware through TPC command without min comparison with
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10041  			 * vdev start response's max_allowed_tx_power.
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10042  			 */
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10043  			if (ar->max_allowed_tx_power && ab->hw_params->idle_ps)
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10044  				eirp_power = min_t(s8,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10045  						   eirp_power,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10046  						   ar->max_allowed_tx_power);
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10047  		} else {
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10048  			/* If AP local power constraint is present */
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10049  			if (pwr_reduction)
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10050  				max_tx_power[pwr_lvl_idx] =
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10051  					max_tx_power[pwr_lvl_idx] - pwr_reduction;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10052  			/* If firmware updated max tx power is non zero, then take
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10053  			 * the min of firmware updated ap tx power
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10054  			 * and max power derived from above mentioned parameters.
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10055  			 */
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10056  			if (ar->max_allowed_tx_power && ab->hw_params->idle_ps)
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10057  				max_tx_power[pwr_lvl_idx] =
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10058  					min_t(s8,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10059  					      max_tx_power[pwr_lvl_idx],
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10060  					      ar->max_allowed_tx_power);
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10061  		}
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10062  		reg_tpc_info->chan_power_info[pwr_lvl_idx].chan_cfreq = center_freq;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10063  		reg_tpc_info->chan_power_info[pwr_lvl_idx].tx_power =
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10064  			max_tx_power[pwr_lvl_idx];
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10065  	}
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10066  
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10067  	reg_tpc_info->num_pwr_levels = num_pwr_levels;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10068  	reg_tpc_info->is_psd_power = is_psd_power;
aeda163bb0c7b9 Baochen Qiang 2025-04-18 @10069  	reg_tpc_info->eirp_power = eirp_power;
                                                                                   ^^^^^^^^^^
warning.

aeda163bb0c7b9 Baochen Qiang 2025-04-18  10070  	reg_tpc_info->ap_power_type =
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10071  		ath12k_reg_ap_pwr_convert(bss_conf->power_type);
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10072  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

