Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C8EA35;
	Fri,  9 Dec 2022 08:12:51 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id ay8-20020a05600c1e0800b003d0808d2826so5300347wmb.1;
        Fri, 09 Dec 2022 00:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WF2y6U7mb0QNFcy6hcoIbOM2S9xAAvAEUxLp1c0uXWo=;
        b=Q2ObPXpZraitcxiOy6MXLC7KJ+VuKdnIZSAxvYgoX3WFiRh99uoJFIBzNgsafs05q8
         1wYoJ9iRnZBXqT5OCvl06LijGgVyEdNsqm+x31+lK2oqkJWGhcij0t3fllKITtKlmSxm
         PHQOEf9azbtTjTGLINp8YnX94MI8r/x5BPIp8qwJ/Cly1vp2eWQ5MXtAgFOJgD/XsI8+
         rdNzkPbTxF92CNCiiHu1+PwPzxeko370cdbt9pUD+HDCr+bnquOCbYvVwDNEHQd6XLQH
         yJinkA3HEF9SCZba7GC2ivX4s8mrFBYLMvzHosh07JnPgnPA87xB2Fk4SyH1lgW2dgsF
         9btQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WF2y6U7mb0QNFcy6hcoIbOM2S9xAAvAEUxLp1c0uXWo=;
        b=V+VEJFiYhd5VcWDaRTBl9z+A1slKBFbAQGoya/1FjAMkT9UX51GcxJ/fU5UdBvtzEy
         FtEwJMMbsgzbi3SoPgy2TmLX0zbYjyTCjXXyu7Tyc06tNTE3xJCykx1YEdKm5KAlUi8U
         c+Snhzf3iiTGK4qJcdPS0k+ShfyabCjWAE4YDOZZ3ysakwUiWL6Cy0iW75PKJLoaB3rZ
         xrbXMZhiLFpV5vRUA7q+RSfQmK/SPoDom7HAoenK8inReNUsCtRYZPLfk+FUmdW8YdTk
         et1aUnfRm4kLycfbPR9Hphv+jJZCZZlVhU0hEIsjJyTN9uwn4gLLIAESP6SYT01rQNSG
         vcsQ==
X-Gm-Message-State: ANoB5pmrJ+vVhbtOzWX2zEzUPycgrhMMlcoNhvngXFmDB5/bXvDWuj9/
	WxnDG271R8bahXExzEilI5onbPq+rsujn2pd
X-Google-Smtp-Source: AA0mqf7Fi1S01ScAg1F9FqUIW8wpbcedQFtTSGwarK/nSwpeyFGHg6z6Br9SFQwCnOXlf9ktjL/DTQ==
X-Received: by 2002:a05:600c:4f96:b0:3d1:c895:930c with SMTP id n22-20020a05600c4f9600b003d1c895930cmr3919893wmq.35.1670573569238;
        Fri, 09 Dec 2022 00:12:49 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q128-20020a1c4386000000b003c71358a42dsm9421265wma.18.2022.12.09.00.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 00:12:48 -0800 (PST)
Date: Fri, 9 Dec 2022 11:12:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Jaewan Kim <jaewan@google.com>,
	johannes@sipsolutions.net, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, kernel-team@android.com,
	adelva@google.com, Jaewan Kim <jaewan@google.com>
Subject: Re: [PATCH 2/2] mac80211_hwsim: handle RTT requests with virtio
Message-ID: <202212090854.IADKAyXy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221205171851.2811239-2-jaewan@google.com>
Message-ID: <20221209081244.iKkZ-wvo1greRWsOsF-IU30qTcX5AUfP4PLOA4oPksU@z>

Hi Jaewan,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jaewan-Kim/mac80211_hwsim-add-PMSR-capability-support/20221206-012111
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git main
patch link:    https://lore.kernel.org/r/20221205171851.2811239-2-jaewan%40google.com
patch subject: [PATCH 2/2] mac80211_hwsim: handle RTT requests with virtio
config: ia64-randconfig-m041-20221204
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/net/wireless/mac80211_hwsim.c:3239 mac80211_hwsim_send_pmsr_ftm_request_peer() warn: variable dereferenced before check 'request' (see line 3235)
drivers/net/wireless/mac80211_hwsim.c:3504 mac80211_hwsim_abort_pmsr() warn: inconsistent returns '&data->mutex'.
drivers/net/wireless/mac80211_hwsim.c:3800 hwsim_pmsr_report_nl() error: uninitialized symbol 'err'.

vim +/request +3239 drivers/net/wireless/mac80211_hwsim.c

8027b096313ab2 Jaewan Kim    2022-12-06  3230  static int mac80211_hwsim_send_pmsr_ftm_request_peer(struct sk_buff *msg,
8027b096313ab2 Jaewan Kim    2022-12-06  3231  						     struct cfg80211_pmsr_ftm_request_peer *request)
8027b096313ab2 Jaewan Kim    2022-12-06  3232  {
8027b096313ab2 Jaewan Kim    2022-12-06  3233  	void *ftm;
8027b096313ab2 Jaewan Kim    2022-12-06  3234  
8027b096313ab2 Jaewan Kim    2022-12-06 @3235  	if (!request->requested)
8027b096313ab2 Jaewan Kim    2022-12-06  3236  		return -EINVAL;
8027b096313ab2 Jaewan Kim    2022-12-06  3237  
8027b096313ab2 Jaewan Kim    2022-12-06  3238  	ftm = nla_nest_start(msg, NL80211_PMSR_TYPE_FTM);
8027b096313ab2 Jaewan Kim    2022-12-06 @3239  	if (!request)

if (!ftm) ?

8027b096313ab2 Jaewan Kim    2022-12-06  3240  		return -ENOBUFS;
8027b096313ab2 Jaewan Kim    2022-12-06  3241  
8027b096313ab2 Jaewan Kim    2022-12-06  3242  	if (nla_put_u32(msg, NL80211_PMSR_FTM_REQ_ATTR_PREAMBLE,
8027b096313ab2 Jaewan Kim    2022-12-06  3243  			request->preamble))
8027b096313ab2 Jaewan Kim    2022-12-06  3244  		return -ENOBUFS;
8027b096313ab2 Jaewan Kim    2022-12-06  3245  
8027b096313ab2 Jaewan Kim    2022-12-06  3246  	if (nla_put_u16(msg, NL80211_PMSR_FTM_REQ_ATTR_BURST_PERIOD,
8027b096313ab2 Jaewan Kim    2022-12-06  3247  			request->burst_period))
8027b096313ab2 Jaewan Kim    2022-12-06  3248  		return -ENOBUFS;
8027b096313ab2 Jaewan Kim    2022-12-06  3249  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp


