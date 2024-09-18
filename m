Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7904E13EFFB
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Sep 2024 10:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726655667; cv=none; b=YVrFRW/ZJOlT5NUuFWGWmSC3llo2GexNafa550Ej2cTzBNe+92jdCLyelddsnPENYeYXyg2ItYBYtZ59aLSq7mvAUDC9nRHgoN1O1m0dhuURGUCq+YO3FlAFUIpkoBNeppjVl7BS4WtFFpJgQf2ZgWxGJxbL+i6e67zWeHR+hiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726655667; c=relaxed/simple;
	bh=/O6DlyybLlXWfSWwnwV5RQBtFaKboK8lm6EQb8R2/cw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=V3Okexu7JW3ttPD1YihT6HgMcTH2dCh5EKbfGCkN6iJMuzGnsTiW8fMffh9hCNgSD2D3WzoMh7On6htq/9lC+evs9paOdRQ4KfL1SS9/Ia0umAZeT4f5qg/MINM0toSYSou4XWrmu20S3E+O+wV6U8A+Vigx1XfSlnXpsS9D8T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NyOSO5/b; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NyOSO5/b"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-374c326c638so3152875f8f.2
        for <oe-kbuild@lists.linux.dev>; Wed, 18 Sep 2024 03:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726655664; x=1727260464; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yhv6au6+BMMuSCn4gH7YR+GWvforwWtmSXKV5oKbYG0=;
        b=NyOSO5/bngEwpyBg+eAdki9kHZqjvTk9aMreBkCKQKTMDru5Xncw1DtFRl1EOoU1E9
         8SRKuKBhOC54T6XLTa+2cYcjp9YVss1wENowuPWTJ6fAnSkgh6s3RjPpjO5f7M9VK8um
         8fU5CY5CPo2YcKQK3iV8i/neDOlIa4yqnWe5hxLHtxuzo22/OnaM74/moIt8BYx417bc
         2MWoWJNZZxBHgt8VpTFPIKw8I4v3gtzE5Epw0w2D/WMUR39O3MuPhEkhg8gxVOaRSMFw
         trpbWe0XD2B67Yp2FoiQFeGUGRDMKt4R853Mtaxq1a+of9ZYxNgwEyQ0y3wYAhHq4TkA
         JOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726655664; x=1727260464;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Yhv6au6+BMMuSCn4gH7YR+GWvforwWtmSXKV5oKbYG0=;
        b=li90+RZBKeAEQ5gC1pibtzJGxs/Q7Io/xc7rSD71qZqRKyo/CpXo53N4puagCzWLkj
         LiHk4CAX1nppvS9uHL1rvreI8xRF9Ck7TCHmFmJurGteTTh9LRyXqb2aDFFbLnppcFGd
         0H8/jkjsLayJobNDxu+VWapEPOXQL6H/Up/CsCzyjp+gnK1I1futu1zW7DWXghtcKJNG
         62Wg7Xc1ktRTcC+zOMeny4KpOYAZiQfPmjD+VQn73MAQ+hJlnV7RofV0EPy4TdT+xWAI
         aR7AicVcXT9Ei3jDi0J0xbGnCkYGvROnq8YKPTsNQALqiF9IobnylYmKdgjHqCGXMjFv
         dE7g==
X-Forwarded-Encrypted: i=1; AJvYcCX35gtT1NTI8zKhgwIBoFsdSpGJqJ/yqrYW7nBeCnTBAK1oXxYZ6v670vdwfCrw1QR5/nTJizKSpEc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyuipNu7kFA0gEwhZcEcFAyorM6lc69awjBSGi4COtg1+FzLwMg
	bqvCMbxWkQxyp5ieep6/6ddeyMDUEd8/UE1pfaBbxxYbG7iR/TCx7eSmddsyAac=
X-Google-Smtp-Source: AGHT+IEyqcWtBSDcanJ0r21CbblfIqL9+DPRLgNJ8aBlTro3Q2HnHsyj9xJ3yRk7ecOioh7AK4K7rQ==
X-Received: by 2002:adf:e891:0:b0:366:f8e7:d898 with SMTP id ffacd0b85a97d-378d625a40dmr9932285f8f.50.1726655663507;
        Wed, 18 Sep 2024 03:34:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:2782:e782:f1c:dcad? ([2a01:e0a:982:cbb0:2782:e782:f1c:dcad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780007dsm11989799f8f.82.2024.09.18.03.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 03:34:23 -0700 (PDT)
Message-ID: <d9e0ade6-8a7e-4ba4-974f-142ad246ce5d@linaro.org>
Date: Wed, 18 Sep 2024 12:34:22 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: drivers/spmi/spmi-pmic-arb.c:1782 spmi_pmic_arb_register_buses()
 error: uninitialized symbol 'ret'.
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 Abel Vesa <abel.vesa@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
References: <67cf80cf-d96d-4249-ac34-6085d4b32948@suswa.mountain>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <67cf80cf-d96d-4249-ac34-6085d4b32948@suswa.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/09/2024 12:29, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   adfc3ded5c33d67e822525f95404ef0becb099b8
> commit: 9799873717398e8fa1727482e578b9d777da645e spmi: pmic-arb: Add multi bus support
> config: mips-randconfig-r072-20240916 (https://download.01.org/0day-ci/archive/20240916/202409162313.TnpH4qKB-lkp@intel.com/config)
> compiler: mips64-linux-gcc (GCC) 14.1.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202409162313.TnpH4qKB-lkp@intel.com/
> 
> smatch warnings:
> drivers/spmi/spmi-pmic-arb.c:1782 spmi_pmic_arb_register_buses() error: uninitialized symbol 'ret'.
> 
> vim +/ret +1782 drivers/spmi/spmi-pmic-arb.c
> 
> 9799873717398e8 Abel Vesa 2024-05-07  1762  static int spmi_pmic_arb_register_buses(struct spmi_pmic_arb *pmic_arb,
> 9799873717398e8 Abel Vesa 2024-05-07  1763  					struct platform_device *pdev)
> 9799873717398e8 Abel Vesa 2024-05-07  1764  {
> 9799873717398e8 Abel Vesa 2024-05-07  1765  	struct device *dev = &pdev->dev;
> 9799873717398e8 Abel Vesa 2024-05-07  1766  	struct device_node *node = dev->of_node;
> 9799873717398e8 Abel Vesa 2024-05-07  1767  	struct device_node *child;
> 9799873717398e8 Abel Vesa 2024-05-07  1768  	int ret;
> 9799873717398e8 Abel Vesa 2024-05-07  1769
> 9799873717398e8 Abel Vesa 2024-05-07  1770  	/* legacy mode doesn't provide child node for the bus */
> 9799873717398e8 Abel Vesa 2024-05-07  1771  	if (of_device_is_compatible(node, "qcom,spmi-pmic-arb"))
> 9799873717398e8 Abel Vesa 2024-05-07  1772  		return spmi_pmic_arb_bus_init(pdev, node, pmic_arb);
> 9799873717398e8 Abel Vesa 2024-05-07  1773
> 9799873717398e8 Abel Vesa 2024-05-07  1774  	for_each_available_child_of_node(node, child) {
> 9799873717398e8 Abel Vesa 2024-05-07  1775  		if (of_node_name_eq(child, "spmi")) {
> 9799873717398e8 Abel Vesa 2024-05-07  1776  			ret = spmi_pmic_arb_bus_init(pdev, child, pmic_arb);
> 9799873717398e8 Abel Vesa 2024-05-07  1777  			if (ret)
> 9799873717398e8 Abel Vesa 2024-05-07  1778  				return ret;
> 9799873717398e8 Abel Vesa 2024-05-07  1779  		}
> 9799873717398e8 Abel Vesa 2024-05-07  1780  	}
> 9799873717398e8 Abel Vesa 2024-05-07  1781
> 9799873717398e8 Abel Vesa 2024-05-07 @1782  	return ret;
> 
> Is it possible to not have an spmi node?

It's possible but not allowed per the bindings.

Neil

> 
> 9799873717398e8 Abel Vesa 2024-05-07  1783  }
> 

