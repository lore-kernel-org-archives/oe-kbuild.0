Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BB47C;
	Wed, 15 Feb 2023 11:30:43 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so1288679wmb.5;
        Wed, 15 Feb 2023 03:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=noXA1ZRKuYwxPkOV4mCPjnivm386CJPKW3QZZbA16U4=;
        b=MjL/Y7V/3KpE4VFgrlDLaPrk9eDx9djlSyoU5MEP394IBWZi7XNawxPpVadrtAR8Ji
         BLgUSSJGbv+6png0cxhU/NZH3QEuqqVQZaJbkx1qs5CvFQjqjOj/Y5spRdqcuZoJO7sS
         t7Td0VjgpQFFWS5d/oSaZNZCKsSTF4wCk1DeeNz3D/vbwoSo+nuAxptlGrskexvVUGTS
         q2h02giZGnwF/lW+0ontjBUtfWWqKRi6fYzqrOgnNvs9CZSlh2qRIEoUGOK+weyRy5z3
         XfzKnCyz1SGHYcRcnDnu10kQ8jnhGVtvyZ4IUlp3ZKK2W8fTj/cJAHQkJLGUUYEwOTOH
         I88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=noXA1ZRKuYwxPkOV4mCPjnivm386CJPKW3QZZbA16U4=;
        b=wu1G4At4xGOn0FDoV5UjyhbstyvLkXBfWAQ0ujWQSFKDdT6k0CjgHeHFOqGOrhHQc0
         TvfHSeBBHCA43bx7HzKZiLoKlJB7ATRy8LCG1ISurx8giQr9ol70MmJsKt4j5wvyUc8b
         /A/+JKf+qYyitmvoKcTp1rJLTiadSQzlvCGtR3zyjvr0JgA6of8seB9/FhlPq7lbE+EK
         XUAnywfgau5onKi56r07ZWPaI1WIjmpMYClyvDmlA+wvH28h4R+z1igXmgjz6coP5Lzy
         Z9iHPb+2z01ndrXh78tkxCrfnf4RAYkQs7x3O4IYO67E3ZZtUzvO+h6oi4gc3WltYtuB
         znZQ==
X-Gm-Message-State: AO0yUKXd+WYTYCE+1+LkwaBW0V2rHfJd6OHq5DHMbfb0GLiyOFbLssRK
	dmxDjNQ70SSckAdPnkaERtI=
X-Google-Smtp-Source: AK7set9GztXUj10sbjxaTg6na9gEi5sdjKx0P2Fl3WRgIjG0AojKvfyziwG0euPIJQtCcM8gHDnfYg==
X-Received: by 2002:a05:600c:997:b0:3df:e1cc:94ff with SMTP id w23-20020a05600c099700b003dfe1cc94ffmr1706878wmp.28.1676460641872;
        Wed, 15 Feb 2023 03:30:41 -0800 (PST)
Received: from [192.168.1.50] ([79.119.240.25])
        by smtp.gmail.com with ESMTPSA id c16-20020a05600c0ad000b003e1f9b633fcsm1817632wmr.16.2023.02.15.03.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 03:30:40 -0800 (PST)
Message-ID: <63e56fe2-d312-4f8a-c9e9-abafada1aa1f@gmail.com>
Date: Wed, 15 Feb 2023 13:30:05 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [linux-next:master 681/12724]
 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188e.c:1678
 rtl8188e_handle_ra_tx_report2() warn: ignoring unreachable code.
To: Ping-Ke Shih <pkshih@realtek.com>, Dan Carpenter <error27@gmail.com>,
 "oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>
Cc: "lkp@intel.com" <lkp@intel.com>,
 "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
 Kalle Valo <kvalo@kernel.org>
References: <202302142135.LCqUTVGY-lkp@intel.com>
 <89d92b2ebc784c71a26810abb42a2dc7@realtek.com>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <89d92b2ebc784c71a26810abb42a2dc7@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/02/2023 02:51, Ping-Ke Shih wrote:
> 
> 
>> -----Original Message-----
>> From: Dan Carpenter <error27@gmail.com>
>> Sent: Tuesday, February 14, 2023 9:25 PM
>> To: oe-kbuild@lists.linux.dev; Bitterblue Smith <rtl8821cerfe2@gmail.com>
>> Cc: lkp@intel.com; oe-kbuild-all@lists.linux.dev; Kalle Valo <kvalo@kernel.org>; Ping-Ke Shih
>> <pkshih@realtek.com>
>> Subject: [linux-next:master 681/12724] drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188e.c:1678
>> rtl8188e_handle_ra_tx_report2() warn: ignoring unreachable code.
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   3ebb0ac55efaf1d0fb1b106f852c114e5021f7eb
>> commit: 8b9754b28f0f231736667e1751f1fc6f18c80ad4 [681/12724] wifi: rtl8xxxu: Add rate control code for
>> RTL8188EU
>> config: x86_64-randconfig-m001-20230213
>> (https://download.01.org/0day-ci/archive/20230214/202302142135.LCqUTVGY-lkp@intel.com/config)
>> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
>>
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Reported-by: Dan Carpenter <error27@gmail.com>
>> | Link: https://lore.kernel.org/r/202302142135.LCqUTVGY-lkp@intel.com/
>>
>> smatch warnings:
>> drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188e.c:1678 rtl8188e_handle_ra_tx_report2() warn:
>> ignoring unreachable code.
>>
>> vim +1678 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188e.c
>>
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1662  void rtl8188e_handle_ra_tx_report2(struct
>> rtl8xxxu_priv *priv, struct sk_buff *skb)
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1663  {
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1664        u32 *_rx_desc = (u32 *)(skb->data - sizeof(struct
>> rtl8xxxu_rxdesc16));
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1665        struct rtl8xxxu_rxdesc16 *rx_desc = (struct
>> rtl8xxxu_rxdesc16 *)_rx_desc;
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1666        struct device *dev = &priv->udev->dev;
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1667        struct rtl8xxxu_ra_info *ra = &priv->ra_info;
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1668        u32 tx_rpt_len = rx_desc->pktlen & 0x3ff;
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1669        u32 items = tx_rpt_len / TX_RPT2_ITEM_SIZE;
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1670        u64 macid_valid = ((u64)_rx_desc[5] << 32) |
>> _rx_desc[4];
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1671        u32 macid;
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1672        u8 *rpt = skb->data;
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1673        bool valid;
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1674        u16 min_rpt_time = 0x927c;
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1675
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1676        dev_dbg(dev, "%s: len: %d items: %d\n", __func__,
>> tx_rpt_len, items);
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
> Ping-Ke

That sounds good to me.

> 
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1677
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17 @1678        for (macid = 0; macid < items; macid++) {
>>                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> This loop doesn't loop.  I see the comment at the end which explains
>> why we have the dead code.  I only review these checker warnings two
>> times and this is my second review so, personally, I don't care if you
>> leave it or not.  But probably other people will review this static
>> checker warning as well so you might want to just delete the loop.
>>
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1679                valid = false;
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1680
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1681                if (macid < 64)
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1682                        valid = macid_valid & BIT(macid);
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1683
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1684                if (valid) {
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1685                        ra->retry[0] =
>> le16_to_cpu(*(__le16 *)rpt);
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1686                        ra->retry[1] = rpt[2];
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1687                        ra->retry[2] = rpt[3];
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1688                        ra->retry[3] = rpt[4];
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1689                        ra->retry[4] = rpt[5];
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1690                        ra->drop = rpt[6];
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1691                        ra->total = ra->retry[0] +
>> ra->retry[1] + ra->retry[2] +
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1692                                    ra->retry[3] +
>> ra->retry[4] + ra->drop;
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1693
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1694                        if (ra->total > 0) {
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1695                                if (ra->ra_stage < 5)
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1696
>> rtl8188e_rate_decision(ra);
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1697                                else if (ra->ra_stage ==
>> 5)
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1698
>> rtl8188e_power_training_try_state(ra);
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1699                                else /* ra->ra_stage ==
>> 6 */
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1700
>> rtl8188e_power_training_decision(ra);
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1701
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1702                                if (ra->ra_stage <= 5)
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1703                                        ra->ra_stage++;
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1704                                else
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1705                                        ra->ra_stage =
>> 0;
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1706                        }
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1707                } else if (macid == 0) {
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1708                        dev_warn(dev, "%s: TX report item
>> 0 not valid\n", __func__);
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1709                }
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1710
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1711                dev_dbg(dev, "%s:  valid: %d retry: %d %d
>> %d %d %d drop: %d\n",
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1712                        __func__, valid,
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1713                        ra->retry[0], ra->retry[1],
>> ra->retry[2],
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1714                        ra->retry[3], ra->retry[4],
>> ra->drop);
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1715
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1716                if (min_rpt_time > ra->rpt_time)
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1717                        min_rpt_time = ra->rpt_time;
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1718
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1719                rpt += TX_RPT2_ITEM_SIZE;
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1720
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1721                /*
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1722                 * We only use macid 0, so only the first
>> item is relevant.
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1723                 * AP mode will use more of them if it's
>> ever implemented.
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1724                 */
>>
>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1725                break;
>>                                                                 ^^^^^
>>
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1726        }
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1727
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1728        if (min_rpt_time != ra->pre_min_rpt_time) {
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1729                rtl8xxxu_write16(priv,
>> REG_TX_REPORT_TIME, min_rpt_time);
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1730                ra->pre_min_rpt_time = min_rpt_time;
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1731        }
>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1732  }
>>
>> --
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests
>>
>>
>> ------Please consider the environment before printing this e-mail.

