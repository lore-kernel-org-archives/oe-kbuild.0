Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA39B5663;
	Thu, 16 Feb 2023 14:11:56 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id fi26so3268879edb.7;
        Thu, 16 Feb 2023 06:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Hgez5R9pelPYJ7wOY/sirkIDqnd20XrLMzTEkX0svA=;
        b=AXdO8D7A7qb1AzkA81ZCHncG8Zoj9wZLf6r/S0HStFI1zeRR6mqQCGKRsMcvJSHB1r
         t/rfg/3RQ0040XhOq25TBIe1I9P46vNQPI5/Hcz0o2dNVApYHFRKf3/SP47Io+SLYtmr
         Eo0QZ3Jj4saJvKdUQvjRC+p+oyViw23yWo3nWaSI4+A0i8Wi4GrnnaWjOtjPAI0lUpB5
         G1BzxjbJNSYxaqYcFKgWabI6Le2QW7NAeJiO32WFBW3n6sPwtKRQqv3m1vcFpM8omYTC
         2pCjfjpebf+EULUzW/gni1X/dRGLKw2ek0lRZaJSCn3dzuK+NOAW60ujP6f0cDT4raLE
         uyYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Hgez5R9pelPYJ7wOY/sirkIDqnd20XrLMzTEkX0svA=;
        b=bFBH4tcNb9Zw/VTwKqSszch1XuUoXTC/ZQsFQCNu2Or3mzOQ2BcRp+ZX9mamYDMb7i
         8I+DCcOksp0SsjBnXMVVId6nwg3+pRCvE3wrUkqytTqCihFqU05Dlyb+xZ0Kv5ytIlmm
         ON2TpurvHxFWsno3vcg9ErAWsetxXvYjNJxgKsgLZspYpCw5W7KvykSamFUsF0CcbFT2
         aR4yKFwwQNuBzTCVTFRhYA53ju5uosQVY/eTRIMZngK7q9HfjSUvQtHPQ+ztr6zk2J0m
         n2E5GHlrxmeJ1fCd4RjU7Ci5xW4Ye0Vglea+S+mwxBLjeBUS99kqN8pfAufl/P3O7j+g
         2H1g==
X-Gm-Message-State: AO0yUKX8D34A+m146EmpaQG80GT3jh43ihrtHIgud2pir1sp0f5T0Vg2
	wUy+AbFQyygeyGNXv6fGwfU=
X-Google-Smtp-Source: AK7set+lv6MREH+xhY9F3pPQM1o4AZyWjUb1GmAs5DMF73Tg8FS+X9SZyqtt4uVgLPo4C199/r/QEQ==
X-Received: by 2002:a05:6402:3451:b0:4aa:c685:2937 with SMTP id l17-20020a056402345100b004aac6852937mr6065850edc.13.1676556715172;
        Thu, 16 Feb 2023 06:11:55 -0800 (PST)
Received: from [192.168.1.50] ([79.119.240.25])
        by smtp.gmail.com with ESMTPSA id s24-20020a508d18000000b004acb2c8aeaesm930120eds.85.2023.02.16.06.11.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 06:11:54 -0800 (PST)
Message-ID: <946ac25c-f4ad-8161-f814-c41ed4a99705@gmail.com>
Date: Thu, 16 Feb 2023 16:11:17 +0200
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
 <63e56fe2-d312-4f8a-c9e9-abafada1aa1f@gmail.com>
 <519695cc0eef4dab97ec409debab7867@realtek.com>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <519695cc0eef4dab97ec409debab7867@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/02/2023 02:52, Ping-Ke Shih wrote:
> 
> 
>> -----Original Message-----
>> From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
>> Sent: Wednesday, February 15, 2023 7:30 PM
>> To: Ping-Ke Shih <pkshih@realtek.com>; Dan Carpenter <error27@gmail.com>; oe-kbuild@lists.linux.dev
>> Cc: lkp@intel.com; oe-kbuild-all@lists.linux.dev; Kalle Valo <kvalo@kernel.org>
>> Subject: Re: [linux-next:master 681/12724] drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188e.c:1678
>> rtl8188e_handle_ra_tx_report2() warn: ignoring unreachable code.
>>
>>
>> External mail.
>>
>>
>>
>> On 15/02/2023 02:51, Ping-Ke Shih wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Dan Carpenter <error27@gmail.com>
>>>> Sent: Tuesday, February 14, 2023 9:25 PM
>>>> To: oe-kbuild@lists.linux.dev; Bitterblue Smith <rtl8821cerfe2@gmail.com>
>>>> Cc: lkp@intel.com; oe-kbuild-all@lists.linux.dev; Kalle Valo <kvalo@kernel.org>; Ping-Ke Shih
>>>> <pkshih@realtek.com>
>>>> Subject: [linux-next:master 681/12724] drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188e.c:1678
>>>> rtl8188e_handle_ra_tx_report2() warn: ignoring unreachable code.
>>>>
>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>>> head:   3ebb0ac55efaf1d0fb1b106f852c114e5021f7eb
>>>> commit: 8b9754b28f0f231736667e1751f1fc6f18c80ad4 [681/12724] wifi: rtl8xxxu: Add rate control code for
>>>> RTL8188EU
>>>> config: x86_64-randconfig-m001-20230213
>>>> (https://download.01.org/0day-ci/archive/20230214/202302142135.LCqUTVGY-lkp@intel.com/config)
>>>> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
>>>>
>>>> If you fix the issue, kindly add following tag where applicable
>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>> | Reported-by: Dan Carpenter <error27@gmail.com>
>>>> | Link: https://lore.kernel.org/r/202302142135.LCqUTVGY-lkp@intel.com/
>>>>
>>>> smatch warnings:
>>>> drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188e.c:1678 rtl8188e_handle_ra_tx_report2() warn:
>>>> ignoring unreachable code.
>>>>
>>>> vim +1678 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188e.c
>>>>
>>>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1662  void rtl8188e_handle_ra_tx_report2(struct
>>>> rtl8xxxu_priv *priv, struct sk_buff *skb)
>>>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1663  {
>>>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1664        u32 *_rx_desc = (u32 *)(skb->data -
>> sizeof(struct
>>>> rtl8xxxu_rxdesc16));
>>>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1665        struct rtl8xxxu_rxdesc16 *rx_desc = (struct
>>>> rtl8xxxu_rxdesc16 *)_rx_desc;
>>>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1666        struct device *dev = &priv->udev->dev;
>>>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1667        struct rtl8xxxu_ra_info *ra = &priv->ra_info;
>>>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1668        u32 tx_rpt_len = rx_desc->pktlen & 0x3ff;
>>>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1669        u32 items = tx_rpt_len / TX_RPT2_ITEM_SIZE;
>>>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1670        u64 macid_valid = ((u64)_rx_desc[5] << 32) |
>>>> _rx_desc[4];
>>>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1671        u32 macid;
>>>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1672        u8 *rpt = skb->data;
>>>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1673        bool valid;
>>>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1674        u16 min_rpt_time = 0x927c;
>>>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1675
>>>> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1676        dev_dbg(dev, "%s: len: %d items: %d\n",
>> __func__,
>>>> tx_rpt_len, items);
>>>
>>> I think an alternative way is to add a statement to replace the comment of
>>> the end of loop. Like
>>>
>>> if (!priv->vif ||
>>>     priv->vif->type == NL80211_IFTYPE_STATION)
>>>       items = 1;
>>>
>>> or
>>>
>>> if (priv->vif &&
>>>     priv->vif->type == NL80211_IFTYPE_STATION)
>>>       items = 1;
>>>
>>> Then, we can remove 'break;' of LN1725.
>>> When this driver is going to support AP mode, this logic is still expected.
>>>
>>> How about you, Bitterblue?
>>>
>>> Ping-Ke
>>
>> That sounds good to me.
>>
> 
> I have sent a patch for this report: 
> https://lore.kernel.org/linux-wireless/20230216004654.4642-1-pkshih@realtek.com/T/#u
> 
> Could you give it a try, Bitterblue? 
> Then, post a Tested-by tag there.
> 
> Thank you
> Ping-Ke
> 

Thank you for the patch. It works.
