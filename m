Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDCF7C;
	Wed, 15 Feb 2023 04:12:49 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso556026wms.4;
        Tue, 14 Feb 2023 20:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PyXirVtNQDTW8coftfi7uUlyrTr4r0w94bU1aJjiq6w=;
        b=WgEuojF60NupakpneE0PUCBmSHO0c5JBhV7uZsBhc1qBSLc+9ZzWRVglmvm9jaq8M9
         nSCKc2Klvg+gw+J9pkvLW7HCzLayJOObMnokctIhUDJkm6WghZlz4K746sDuion9geVt
         c7bGVSlZ1R7+GJQivvSyxtsA9avS+WtIaAesrhjQcaCuUSRuWyL0U6z+SD3zcO7yXay6
         c4x4RsHx0byVmry/NdwS8CFvD/9Gp0M6+qheo5PD1vYrsrYtT0aKPPdvCs17mu0ihwBw
         jcun08MoVZ0lHUViQv21KvOV27tXg+ZmEQj6G+aAx22ES5ZeI1RKesathZ+C10B+n6O/
         xgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PyXirVtNQDTW8coftfi7uUlyrTr4r0w94bU1aJjiq6w=;
        b=gb4Ek6ET4FIh8GPZMD7kMGJnE6La35mnzkfW1cFMRO6BrPmwr8Bd9UY66h0uwOT7Bb
         iJAhi9lx0RqR0SzSmAbzC8uh7dWJBzWvR9PmtKuTCx6BtOs9ArMRWV4Pxwl/LkJVqBI8
         8zbiOTdvU/Dch8ZHMafN1sHfgwaKEY71nx0h9igjo+O2VrzY45XH8e5y3/DkviYYuSJQ
         FPTPmHMxT3r5z1AgMg6urIKR87DLRTPQTiTpWhcB9SgLK+75UuuZGLRgE16DLg2viqad
         Vu8Xu9AyYtBkIAtOtBGLTk0SI00/54HQgDxmAohG7MJ0eVt908eCTUBntRK7HswNZwih
         cMXQ==
X-Gm-Message-State: AO0yUKUsJQQrvQb70TAzqEdWz2DV4GhZ8CwC6J674uSWr3XjH39kWkTI
	uo07mpdQ9Oakgh3xRhv4FRM=
X-Google-Smtp-Source: AK7set+x+XoVVOk/2VThCqLqAly3sIVvGru6XWN3zTamiT0Bwayby7YfxXX5Iw6ER4bb4fizto1dhQ==
X-Received: by 2002:a05:600c:448a:b0:3e0:15c:3573 with SMTP id e10-20020a05600c448a00b003e0015c3573mr893870wmo.35.1676434368095;
        Tue, 14 Feb 2023 20:12:48 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p3-20020a1c5443000000b003e203681b26sm320233wmi.29.2023.02.14.20.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 20:12:47 -0800 (PST)
Date: Wed, 15 Feb 2023 07:12:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	"lkp@intel.com" <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	Kalle Valo <kvalo@kernel.org>
Subject: Re: [linux-next:master 681/12724]
 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188e.c:1678
 rtl8188e_handle_ra_tx_report2() warn: ignoring unreachable code.
Message-ID: <Y+xbvM/58yEHYVXE@kadam>
References: <202302142135.LCqUTVGY-lkp@intel.com>
 <89d92b2ebc784c71a26810abb42a2dc7@realtek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89d92b2ebc784c71a26810abb42a2dc7@realtek.com>

On Wed, Feb 15, 2023 at 12:51:42AM +0000, Ping-Ke Shih wrote:
> 
> 
> > -----Original Message-----
> > From: Dan Carpenter <error27@gmail.com>
> > Sent: Tuesday, February 14, 2023 9:25 PM
> > To: oe-kbuild@lists.linux.dev; Bitterblue Smith <rtl8821cerfe2@gmail.com>
> > Cc: lkp@intel.com; oe-kbuild-all@lists.linux.dev; Kalle Valo <kvalo@kernel.org>; Ping-Ke Shih
> > <pkshih@realtek.com>
> > Subject: [linux-next:master 681/12724] drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188e.c:1678
> > rtl8188e_handle_ra_tx_report2() warn: ignoring unreachable code.
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   3ebb0ac55efaf1d0fb1b106f852c114e5021f7eb
> > commit: 8b9754b28f0f231736667e1751f1fc6f18c80ad4 [681/12724] wifi: rtl8xxxu: Add rate control code for
> > RTL8188EU
> > config: x86_64-randconfig-m001-20230213
> > (https://download.01.org/0day-ci/archive/20230214/202302142135.LCqUTVGY-lkp@intel.com/config)
> > compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Link: https://lore.kernel.org/r/202302142135.LCqUTVGY-lkp@intel.com/
> > 
> > smatch warnings:
> > drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188e.c:1678 rtl8188e_handle_ra_tx_report2() warn:
> > ignoring unreachable code.
> > 
> > vim +1678 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188e.c
> > 
> > 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1662  void rtl8188e_handle_ra_tx_report2(struct
> > rtl8xxxu_priv *priv, struct sk_buff *skb)
> > 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1663  {
> > 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1664        u32 *_rx_desc = (u32 *)(skb->data - sizeof(struct
> > rtl8xxxu_rxdesc16));
> > 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1665        struct rtl8xxxu_rxdesc16 *rx_desc = (struct
> > rtl8xxxu_rxdesc16 *)_rx_desc;
> > 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1666        struct device *dev = &priv->udev->dev;
> > 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1667        struct rtl8xxxu_ra_info *ra = &priv->ra_info;
> > 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1668        u32 tx_rpt_len = rx_desc->pktlen & 0x3ff;
> > 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1669        u32 items = tx_rpt_len / TX_RPT2_ITEM_SIZE;
> > 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1670        u64 macid_valid = ((u64)_rx_desc[5] << 32) |
> > _rx_desc[4];
> > 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1671        u32 macid;
> > 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1672        u8 *rpt = skb->data;
> > 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1673        bool valid;
> > 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1674        u16 min_rpt_time = 0x927c;
> > 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1675
> > 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1676        dev_dbg(dev, "%s: len: %d items: %d\n", __func__,
> > tx_rpt_len, items);
> 
> I think an alternative way is to add a statement to replace the comment of
> the end of loop. Like
> 
> if (!priv->vif ||
>     priv->vif->type == NL80211_IFTYPE_STATION)
> 	items = 1;
> 
> or
> 
> if (priv->vif &&
>     priv->vif->type == NL80211_IFTYPE_STATION)
> 	items = 1;
> 
> Then, we can remove 'break;' of LN1725.
> When this driver is going to support AP mode, this logic is still expected.
> 
> How about you, Bitterblue?
> 

That seems like a good option to me.

regards,
dan carpenter

