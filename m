Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2739314263
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Jul 2023 10:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690282515; x=1721818515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/S22/FaexcNkNmBdooTf+jY82k6zZ6nIIisy33BINLU=;
  b=n/HKHC/e5dP59WBABE7iaS4IIZ8sndohf1TpEdXCsKVb+q0F8tbLJTuy
   wb5JloyKunS/d0FYAvgZZXpVhacZPkvVAg64EpEZNah8TFBXezX+9e7iM
   vYOn1MGQ6sKOc9a1ynSpgTbveLcpiFjYy/2aM6Gsc4ubNSgRpfJztZ1wT
   2Kn6a2BtwW4s88od+lGwxBgW7Y+YnlmhxsBVEZnER9yRF0KH+dvZ/peJx
   wDPciz1yZgLpms94diPrq5NNKtVcFzaXhbN6yFErgdfPr7D49F3CYfMLr
   NISM3TCDR3+NgDm4Y9DNwfZePyhnVeYxDeEOsmQ837+qfsyAzGCh6wS86
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="352585388"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="352585388"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 03:54:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="972625634"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="972625634"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 25 Jul 2023 03:54:54 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOFgr-000AZE-3C;
	Tue, 25 Jul 2023 10:54:53 +0000
Date: Tue, 25 Jul 2023 18:54:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] wifi: mac80211: avoid buffer overflow by adding clear
 data of VHT Tx power envelope
Message-ID: <202307251807.z04UOfqH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230721055851.20525-1-quic_wgong@quicinc.com>
References: <20230721055851.20525-1-quic_wgong@quicinc.com>
TO: Wen Gong <quic_wgong@quicinc.com>
TO: johannes@sipsolutions.net
TO: ath12k@lists.infradead.org
CC: linux-wireless@vger.kernel.org
CC: quic_wgong@quicinc.com

Hi Wen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b21fe5be53eb873c02e7479372726c8aeed171e3]

url:    https://github.com/intel-lab-lkp/linux/commits/Wen-Gong/wifi-mac80211-avoid-buffer-overflow-by-adding-clear-data-of-VHT-Tx-power-envelope/20230721-140122
base:   b21fe5be53eb873c02e7479372726c8aeed171e3
patch link:    https://lore.kernel.org/r/20230721055851.20525-1-quic_wgong%40quicinc.com
patch subject: [PATCH] wifi: mac80211: avoid buffer overflow by adding clear data of VHT Tx power envelope
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-m021-20230723 (https://download.01.org/0day-ci/archive/20230725/202307251807.z04UOfqH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307251807.z04UOfqH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307251807.z04UOfqH-lkp@intel.com/

New smatch warnings:
net/mac80211/mlme.c:4818 ieee80211_prep_channel() error: we previously assumed 'link' could be null (see line 4792)
net/mac80211/mlme.c:4890 ieee80211_prep_channel() warn: variable dereferenced before check 'link' (see line 4818)

Old smatch warnings:
net/mac80211/mlme.c:7073 ieee80211_setup_assoc_link() warn: variable dereferenced before check 'elem' (see line 7071)

vim +/link +4818 net/mac80211/mlme.c

78ac51f81532c1e net/mac80211/mlme.c          Sara Sharon       2019-01-16  4687  
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4688  static int ieee80211_prep_channel(struct ieee80211_sub_if_data *sdata,
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4689  				  struct ieee80211_link_data *link,
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4690  				  struct cfg80211_bss *cbss,
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4691  				  ieee80211_conn_flags_t *conn_flags)
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4692  {
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4693  	struct ieee80211_local *local = sdata->local;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4694  	const struct ieee80211_ht_cap *ht_cap = NULL;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4695  	const struct ieee80211_ht_operation *ht_oper = NULL;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4696  	const struct ieee80211_vht_operation *vht_oper = NULL;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4697  	const struct ieee80211_he_operation *he_oper = NULL;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4698  	const struct ieee80211_eht_operation *eht_oper = NULL;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4699  	const struct ieee80211_s1g_oper_ie *s1g_oper = NULL;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4700  	struct ieee80211_supported_band *sband;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4701  	struct cfg80211_chan_def chandef;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4702  	bool is_6ghz = cbss->channel->band == NL80211_BAND_6GHZ;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4703  	bool is_5ghz = cbss->channel->band == NL80211_BAND_5GHZ;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4704  	struct ieee80211_bss *bss = (void *)cbss->priv;
ea5cba269fb1fe2 net/mac80211/mlme.c          Johannes Berg     2022-08-16  4705  	struct ieee80211_elems_parse_params parse_params = {
ea5cba269fb1fe2 net/mac80211/mlme.c          Johannes Berg     2022-08-16  4706  		.bss = cbss,
ea5cba269fb1fe2 net/mac80211/mlme.c          Johannes Berg     2022-08-16  4707  		.link_id = -1,
ea5cba269fb1fe2 net/mac80211/mlme.c          Johannes Berg     2022-08-16  4708  		.from_ap = true,
ea5cba269fb1fe2 net/mac80211/mlme.c          Johannes Berg     2022-08-16  4709  	};
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4710  	struct ieee802_11_elems *elems;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4711  	const struct cfg80211_bss_ies *ies;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4712  	int ret;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4713  	u32 i;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4714  	bool have_80mhz;
4df17235d03fd79 net/mac80211/mlme.c          Wen Gong          2023-07-21  4715  	u8 j = 0;
1128958dc22cbfa net/mac80211/mlme.c          Johannes Berg     2013-02-07  4716  
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4717  	rcu_read_lock();
bee7f58699a406a net/mac80211/mlme.c          Johannes Berg     2013-02-07  4718  
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4719  	ies = rcu_dereference(cbss->ies);
ea5cba269fb1fe2 net/mac80211/mlme.c          Johannes Berg     2022-08-16  4720  	parse_params.start = ies->data;
ea5cba269fb1fe2 net/mac80211/mlme.c          Johannes Berg     2022-08-16  4721  	parse_params.len = ies->len;
ea5cba269fb1fe2 net/mac80211/mlme.c          Johannes Berg     2022-08-16  4722  	elems = ieee802_11_parse_elems_full(&parse_params);
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4723  	if (!elems) {
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4724  		rcu_read_unlock();
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4725  		return -ENOMEM;
bee7f58699a406a net/mac80211/mlme.c          Johannes Berg     2013-02-07  4726  	}
bee7f58699a406a net/mac80211/mlme.c          Johannes Berg     2013-02-07  4727  
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4728  	sband = local->hw.wiphy->bands[cbss->channel->band];
f0706e828e96d0f net/mac80211/ieee80211_sta.c Jiri Benc         2007-05-05  4729  
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4730  	*conn_flags &= ~(IEEE80211_CONN_DISABLE_40MHZ |
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4731  			 IEEE80211_CONN_DISABLE_80P80MHZ |
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4732  			 IEEE80211_CONN_DISABLE_160MHZ);
5394af4d86ae51b net/mac80211/mlme.c          Jouni Malinen     2009-01-08  4733  
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4734  	/* disable HT/VHT/HE if we don't support them */
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4735  	if (!sband->ht_cap.ht_supported && !is_6ghz) {
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4736  		mlme_dbg(sdata, "HT not supported, disabling HT/VHT/HE/EHT\n");
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4737  		*conn_flags |= IEEE80211_CONN_DISABLE_HT;
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4738  		*conn_flags |= IEEE80211_CONN_DISABLE_VHT;
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4739  		*conn_flags |= IEEE80211_CONN_DISABLE_HE;
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4740  		*conn_flags |= IEEE80211_CONN_DISABLE_EHT;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4741  	}
ddf4ac53fb8a12a net/mac80211/mlme.c          Johannes Berg     2008-10-22  4742  
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4743  	if (!sband->vht_cap.vht_supported && is_5ghz) {
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4744  		mlme_dbg(sdata, "VHT not supported, disabling VHT/HE/EHT\n");
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4745  		*conn_flags |= IEEE80211_CONN_DISABLE_VHT;
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4746  		*conn_flags |= IEEE80211_CONN_DISABLE_HE;
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4747  		*conn_flags |= IEEE80211_CONN_DISABLE_EHT;
c8987876e9bf9b7 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4748  	}
c8987876e9bf9b7 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4749  
1ec7291e247055f net/mac80211/mlme.c          Johannes Berg     2023-06-04  4750  	if (!ieee80211_get_he_iftype_cap_vif(sband, &sdata->vif)) {
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4751  		mlme_dbg(sdata, "HE not supported, disabling HE and EHT\n");
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4752  		*conn_flags |= IEEE80211_CONN_DISABLE_HE;
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4753  		*conn_flags |= IEEE80211_CONN_DISABLE_EHT;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4754  	}
1ff4e8f2dec8b14 net/mac80211/mlme.c          Felix Fietkau     2020-09-08  4755  
1ec7291e247055f net/mac80211/mlme.c          Johannes Berg     2023-06-04  4756  	if (!ieee80211_get_eht_iftype_cap_vif(sband, &sdata->vif)) {
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4757  		mlme_dbg(sdata, "EHT not supported, disabling EHT\n");
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4758  		*conn_flags |= IEEE80211_CONN_DISABLE_EHT;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4759  	}
ddf4ac53fb8a12a net/mac80211/mlme.c          Johannes Berg     2008-10-22  4760  
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4761  	if (!(*conn_flags & IEEE80211_CONN_DISABLE_HT) && !is_6ghz) {
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4762  		ht_oper = elems->ht_operation;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4763  		ht_cap = elems->ht_cap_elem;
f2176d7240e4f45 net/mac80211/mlme.c          Juuso Oikarinen   2010-09-28  4764  
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4765  		if (!ht_cap) {
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4766  			*conn_flags |= IEEE80211_CONN_DISABLE_HT;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4767  			ht_oper = NULL;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4768  		}
2ed77ea69205139 net/mac80211/mlme.c          Johannes Berg     2015-10-22  4769  	}
f0706e828e96d0f net/mac80211/ieee80211_sta.c Jiri Benc         2007-05-05  4770  
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4771  	if (!(*conn_flags & IEEE80211_CONN_DISABLE_VHT) && !is_6ghz) {
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4772  		vht_oper = elems->vht_operation;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4773  		if (vht_oper && !ht_oper) {
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4774  			vht_oper = NULL;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4775  			sdata_info(sdata,
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4776  				   "AP advertised VHT without HT, disabling HT/VHT/HE\n");
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4777  			*conn_flags |= IEEE80211_CONN_DISABLE_HT;
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4778  			*conn_flags |= IEEE80211_CONN_DISABLE_VHT;
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4779  			*conn_flags |= IEEE80211_CONN_DISABLE_HE;
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4780  			*conn_flags |= IEEE80211_CONN_DISABLE_EHT;
e38a017bf080d47 net/mac80211/mlme.c          Avraham Stern     2017-04-26  4781  		}
e38a017bf080d47 net/mac80211/mlme.c          Avraham Stern     2017-04-26  4782  
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4783  		if (!elems->vht_cap_elem) {
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4784  			*conn_flags |= IEEE80211_CONN_DISABLE_VHT;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4785  			vht_oper = NULL;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4786  		}
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4787  	}
a607268a0d5532d net/mac80211/ieee80211_sta.c Bruno Randolf     2008-02-18  4788  
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4789  	if (!(*conn_flags & IEEE80211_CONN_DISABLE_HE)) {
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4790  		he_oper = elems->he_operation;
d524215f6cad245 net/mac80211/mlme.c          Felix Fietkau     2010-01-08  4791  
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12 @4792  		if (link && is_6ghz) {
4df17235d03fd79 net/mac80211/mlme.c          Wen Gong          2023-07-21  4793  			struct ieee80211_bss_conf *bss_conf = link->conf;;
a607268a0d5532d net/mac80211/ieee80211_sta.c Bruno Randolf     2008-02-18  4794  
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4795  			if (elems->pwr_constr_elem)
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4796  				bss_conf->pwr_reduction = *elems->pwr_constr_elem;
66e67e418908442 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4797  
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4798  			BUILD_BUG_ON(ARRAY_SIZE(bss_conf->tx_pwr_env) !=
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4799  				     ARRAY_SIZE(elems->tx_pwr_env));
66e67e418908442 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4800  
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4801  			for (i = 0; i < elems->tx_pwr_env_num; i++) {
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4802  				if (elems->tx_pwr_env_len[i] >
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4803  				    sizeof(bss_conf->tx_pwr_env[j]))
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4804  					continue;
1d00ce807efaa0e net/mac80211/mlme.c          Thomas Pedersen   2020-09-21  4805  
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4806  				memcpy(&bss_conf->tx_pwr_env[j], elems->tx_pwr_env[i],
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4807  				       elems->tx_pwr_env_len[i]);
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4808  				j++;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4809  			}
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4810  		}
66e67e418908442 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4811  
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4812  		if (!ieee80211_verify_peer_he_mcs_support(sdata, ies, he_oper) ||
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4813  		    !ieee80211_verify_sta_he_mcs_support(sdata, sband, he_oper))
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4814  			*conn_flags |= IEEE80211_CONN_DISABLE_HE |
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4815  				       IEEE80211_CONN_DISABLE_EHT;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4816  	}
1d00ce807efaa0e net/mac80211/mlme.c          Thomas Pedersen   2020-09-21  4817  
4df17235d03fd79 net/mac80211/mlme.c          Wen Gong          2023-07-21 @4818  	link->conf->tx_pwr_env_num = j;
4df17235d03fd79 net/mac80211/mlme.c          Wen Gong          2023-07-21  4819  
66e67e418908442 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4820  	/*
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4821  	 * EHT requires HE to be supported as well. Specifically for 6 GHz
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4822  	 * channels, the operation channel information can only be deduced from
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4823  	 * both the 6 GHz operation information (from the HE operation IE) and
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4824  	 * EHT operation.
66e67e418908442 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4825  	 */
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4826  	if (!(*conn_flags &
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4827  			(IEEE80211_CONN_DISABLE_HE |
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4828  			 IEEE80211_CONN_DISABLE_EHT)) &&
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4829  	    he_oper) {
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4830  		const struct cfg80211_bss_ies *cbss_ies;
ce2bb3b66273d7d net/mac80211/mlme.c          Emmanuel Grumbach 2023-05-04  4831  		const struct element *eht_ml_elem;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4832  		const u8 *eht_oper_ie;
66e67e418908442 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4833  
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4834  		cbss_ies = rcu_dereference(cbss->ies);
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4835  		eht_oper_ie = cfg80211_find_ext_ie(WLAN_EID_EXT_EHT_OPERATION,
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4836  						   cbss_ies->data, cbss_ies->len);
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4837  		if (eht_oper_ie && eht_oper_ie[1] >=
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4838  		    1 + sizeof(struct ieee80211_eht_operation))
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4839  			eht_oper = (void *)(eht_oper_ie + 3);
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4840  		else
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4841  			eht_oper = NULL;
ce2bb3b66273d7d net/mac80211/mlme.c          Emmanuel Grumbach 2023-05-04  4842  
ce2bb3b66273d7d net/mac80211/mlme.c          Emmanuel Grumbach 2023-05-04  4843  		eht_ml_elem = cfg80211_find_ext_elem(WLAN_EID_EXT_EHT_MULTI_LINK,
ce2bb3b66273d7d net/mac80211/mlme.c          Emmanuel Grumbach 2023-05-04  4844  						     cbss_ies->data, cbss_ies->len);
ce2bb3b66273d7d net/mac80211/mlme.c          Emmanuel Grumbach 2023-05-04  4845  
ce2bb3b66273d7d net/mac80211/mlme.c          Emmanuel Grumbach 2023-05-04  4846  		/* data + 1 / datalen - 1 since it's an extended element */
ce2bb3b66273d7d net/mac80211/mlme.c          Emmanuel Grumbach 2023-05-04  4847  		if (eht_ml_elem &&
ce2bb3b66273d7d net/mac80211/mlme.c          Emmanuel Grumbach 2023-05-04  4848  		    ieee80211_mle_size_ok(eht_ml_elem->data + 1,
29c6e2dc3d12a18 net/mac80211/mlme.c          Emmanuel Grumbach 2023-06-04  4849  					  eht_ml_elem->datalen - 1)) {
ce2bb3b66273d7d net/mac80211/mlme.c          Emmanuel Grumbach 2023-05-04  4850  			sdata->vif.cfg.eml_cap =
ce2bb3b66273d7d net/mac80211/mlme.c          Emmanuel Grumbach 2023-05-04  4851  				ieee80211_mle_get_eml_cap(eht_ml_elem->data + 1);
29c6e2dc3d12a18 net/mac80211/mlme.c          Emmanuel Grumbach 2023-06-04  4852  			sdata->vif.cfg.eml_med_sync_delay =
29c6e2dc3d12a18 net/mac80211/mlme.c          Emmanuel Grumbach 2023-06-04  4853  				ieee80211_mle_get_eml_med_sync_delay(eht_ml_elem->data + 1);
29c6e2dc3d12a18 net/mac80211/mlme.c          Emmanuel Grumbach 2023-06-04  4854  		}
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4855  	}
66e67e418908442 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4856  
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4857  	/* Allow VHT if at least one channel on the sband supports 80 MHz */
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4858  	have_80mhz = false;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4859  	for (i = 0; i < sband->n_channels; i++) {
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4860  		if (sband->channels[i].flags & (IEEE80211_CHAN_DISABLED |
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4861  						IEEE80211_CHAN_NO_80MHZ))
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4862  			continue;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4863  
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4864  		have_80mhz = true;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4865  		break;
1d00ce807efaa0e net/mac80211/mlme.c          Thomas Pedersen   2020-09-21  4866  	}
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4867  
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4868  	if (!have_80mhz) {
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4869  		sdata_info(sdata, "80 MHz not supported, disabling VHT\n");
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4870  		*conn_flags |= IEEE80211_CONN_DISABLE_VHT;
1ad22fb5bb53ce6 net/mac80211/mlme.c          Tosoni            2018-03-14  4871  	}
1ad22fb5bb53ce6 net/mac80211/mlme.c          Tosoni            2018-03-14  4872  
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4873  	if (sband->band == NL80211_BAND_S1GHZ) {
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4874  		s1g_oper = elems->s1g_oper;
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4875  		if (!s1g_oper)
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4876  			sdata_info(sdata,
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4877  				   "AP missing S1G operation element?\n");
1ad22fb5bb53ce6 net/mac80211/mlme.c          Tosoni            2018-03-14  4878  	}
1ad22fb5bb53ce6 net/mac80211/mlme.c          Tosoni            2018-03-14  4879  
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4880  	*conn_flags |=
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4881  		ieee80211_determine_chantype(sdata, link, *conn_flags,
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4882  					     sband,
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4883  					     cbss->channel,
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4884  					     bss->vht_cap_info,
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4885  					     ht_oper, vht_oper,
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4886  					     he_oper, eht_oper,
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4887  					     s1g_oper,
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4888  					     &chandef, false);
78ac51f81532c1e net/mac80211/mlme.c          Sara Sharon       2019-01-16  4889  
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12 @4890  	if (link)
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4891  		link->needed_rx_chains =
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4892  			min(ieee80211_max_rx_chains(link, cbss),
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4893  			    local->rx_chains);
78ac51f81532c1e net/mac80211/mlme.c          Sara Sharon       2019-01-16  4894  
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4895  	rcu_read_unlock();
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4896  	/* the element data was RCU protected so no longer valid anyway */
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4897  	kfree(elems);
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4898  	elems = NULL;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4899  
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4900  	if (*conn_flags & IEEE80211_CONN_DISABLE_HE && is_6ghz) {
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4901  		sdata_info(sdata, "Rejecting non-HE 6/7 GHz connection");
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4902  		return -EINVAL;
1ad22fb5bb53ce6 net/mac80211/mlme.c          Tosoni            2018-03-14  4903  	}
1ad22fb5bb53ce6 net/mac80211/mlme.c          Tosoni            2018-03-14  4904  
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4905  	if (!link)
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4906  		return 0;
2c3c5f8c0cfa8e8 net/mac80211/mlme.c          Andrew Zaborowski 2017-02-10  4907  
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4908  	/* will change later if needed */
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4909  	link->smps_mode = IEEE80211_SMPS_OFF;
92778180f7fca7f net/mac80211/mlme.c          Jouni Malinen     2009-05-14  4910  
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4911  	mutex_lock(&local->mtx);
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4912  	/*
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4913  	 * If this fails (possibly due to channel context sharing
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4914  	 * on incompatible channels, e.g. 80+80 and 160 sharing the
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4915  	 * same control channel) try to use a smaller bandwidth.
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4916  	 */
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4917  	ret = ieee80211_link_use_channel(link, &chandef,
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4918  					 IEEE80211_CHANCTX_SHARED);
b291ba11181d46d net/mac80211/mlme.c          Johannes Berg     2009-07-10  4919  
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4920  	/* don't downgrade for 5 and 10 MHz channels, though. */
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4921  	if (chandef.width == NL80211_CHAN_WIDTH_5 ||
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4922  	    chandef.width == NL80211_CHAN_WIDTH_10)
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4923  		goto out;
d91f36db5166101 net/mac80211/mlme.c          Johannes Berg     2009-04-16  4924  
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4925  	while (ret && chandef.width != NL80211_CHAN_WIDTH_20_NOHT) {
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4926  		*conn_flags |=
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4927  			ieee80211_chandef_downgrade(&chandef);
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4928  		ret = ieee80211_link_use_channel(link, &chandef,
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4929  						 IEEE80211_CHANCTX_SHARED);
70b12f2612a6b35 net/mac80211/mlme.c          Ronald Wahl       2012-03-19  4930  	}
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4931   out:
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4932  	mutex_unlock(&local->mtx);
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4933  	return ret;
a97b77b90decf27 net/mac80211/mlme.c          Vivek Natarajan   2008-12-23  4934  }
7a5158ef8da70fd net/mac80211/mlme.c          Johannes Berg     2008-10-08  4935  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
