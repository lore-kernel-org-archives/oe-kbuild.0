Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB442185934
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Sep 2024 11:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725276760; cv=none; b=glXOV+ulNRQAKgSDfReF17SYBZY6cIUI32wQnQ24F3xtx1P1QzeE4sV/ghHf/42E9Mzt2DrQIOTAkHo084BFBq6+Uimw/8bdugEE5Suegjo6XH4P0FmXhVS41tzHepQmdkRRL+oz4k+fjj7msiL8fBVJCoJ3pX1eYZSOZQHt9wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725276760; c=relaxed/simple;
	bh=ORpmli+FVv2i+RHT+F99q3bG19xmjOpVDpiQ0Io+Cg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kjpdh48S4PiQugS2WTkIQOjy9TatdUWr17+Rl60dnumIjxIPuC53z+7qAM88T9rOpRH8JohP2TWKUhtDwESAssdxe8JDinb+cMYuObc14+wdeM+BfRC11sG3mR7+98gcDZdbHtKrMCGV11+nYvpcIZQsyOE/E8C/MsM4swegdUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZW3K45ER; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZW3K45ER"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725276755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7XiR/49Pk1yBWAqQwAojDlW2jogofRu0IdtrIYLHINU=;
	b=ZW3K45ERAzPW8ZOay348VzJq+K9bh1LdGsqw/LiuDm4IJPZ0FcGozs0VaITko11g/XjVLA
	P7Fw9dSJ+W85WPPfnTVFfXbnq8pqRoNPlXwbCMjs/9jnTs3lL4LdW6HJcRjQMorJaCaJjg
	C7WlYUWFD3K4Rv/0umeAcnaIxf9bMUY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-qavzTZEANZi-8vTEtJSHgg-1; Mon, 02 Sep 2024 07:32:34 -0400
X-MC-Unique: qavzTZEANZi-8vTEtJSHgg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42bb9fa67c5so29215765e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 02 Sep 2024 04:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725276753; x=1725881553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7XiR/49Pk1yBWAqQwAojDlW2jogofRu0IdtrIYLHINU=;
        b=hENsDw8wYi/ea1CKLgTrgO1eFy5Q8l5tsPaFhjp+zHeBPzUdCGx2FnOMgtam/nC1XG
         NxNMoNBNSGeKcyQeY/fG/zElw9iGxHQDy4di1xMjFcx4SCvPZM18DA+3pL6VDexwGv1Y
         +kyelIN5zbSOzDRFVRS1AvtpokzS0b//xizw0pwmzkutdIHSRPQ82oSgjPSUnt2pub1V
         SltOdt47gYRCLvPpClRWDxsYVb3eJOhMb32WNd5Lpa1LvL7Nk+m9Wk1RzgzDeRVrcwel
         oLO6VLUV3R8s6IOZKBnP7VbQT9aA9ao7sbDqfiNIjtGCNsuLCoAYHDDcfBVKxyehFqkU
         GtGg==
X-Gm-Message-State: AOJu0YxjKK1FfZJ3tG7DWzl2t4YTgtl5z3X2vlPVrg4/8g+atFtFrUAq
	prCXxq6kpBZed+xn/fiXHk5ddXC58szRC+roqErFq3CciUg/i1cB1Qpt1207NhwEymLxZTHXwSo
	fW1s+AahKtmdsWLfNcCLbL7ybX9CIlVp2cSNeYbGgm4frDiZ1jRi1CsDbyw==
X-Received: by 2002:adf:fb11:0:b0:371:8845:a3af with SMTP id ffacd0b85a97d-3749b57f2f1mr8821975f8f.39.1725276753553;
        Mon, 02 Sep 2024 04:32:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSIAleFibg0AjuBBMWFVZJrhOx02h+A1epo6llXeIA5ANk4lTGumX8cxBM2JVgfsN6Db7o8Q==
X-Received: by 2002:adf:fb11:0:b0:371:8845:a3af with SMTP id ffacd0b85a97d-3749b57f2f1mr8821943f8f.39.1725276752965;
        Mon, 02 Sep 2024 04:32:32 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989230a9dsm540663966b.224.2024.09.02.04.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 04:32:32 -0700 (PDT)
Message-ID: <5882a3b1-f99a-4cd4-8eab-42eefdc18eba@redhat.com>
Date: Mon, 2 Sep 2024 13:32:31 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] platform/x86: int3472: Simplify dev_err_probe()
 usage
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild@lists.linux.dev, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Scally <djrscally@gmail.com>
References: <20240822130722.1261891-3-andriy.shevchenko@linux.intel.com>
 <20dd56f0-78ea-4255-86ac-32151160b83d@stanley.mountain>
 <ZtWQzwvo7f0QfeCI@smile.fi.intel.com>
 <6be0acdb-6b4a-4330-929a-2e319075b3c6@stanley.mountain>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <6be0acdb-6b4a-4330-929a-2e319075b3c6@stanley.mountain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/2/24 1:23 PM, Dan Carpenter wrote:
> On Mon, Sep 02, 2024 at 01:17:51PM +0300, Andy Shevchenko wrote:
>> On Sat, Aug 31, 2024 at 11:31:53AM +0300, Dan Carpenter wrote:
>>> Hi Andy,
>>>
>>> kernel test robot noticed the following build warnings:
>>>
>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>
>>> url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/driver-core-Ignore-0-in-dev_err_probe/20240826-113856
>>> base:   driver-core/driver-core-testing
>>> patch link:    https://lore.kernel.org/r/20240822130722.1261891-3-andriy.shevchenko%40linux.intel.com
>>> patch subject: [PATCH v2 2/4] platform/x86: int3472: Simplify dev_err_probe() usage
>>> config: i386-randconfig-141-20240830 (https://download.01.org/0day-ci/archive/20240831/202408310807.sNPe5Mr2-lkp@intel.com/config)
>>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> | Closes: https://lore.kernel.org/r/202408310807.sNPe5Mr2-lkp@intel.com/
>>>
>>> smatch warnings:
>>> drivers/platform/x86/intel/int3472/discrete.c:292 skl_int3472_handle_gpio_resources() error: uninitialized symbol 'err_msg'.
>>> drivers/platform/x86/intel/int3472/discrete.c:292 skl_int3472_handle_gpio_resources() warn: passing zero to 'dev_err_probe'
>>
>> Okay, I might agree on the err_msg, which is good to have to be passed anyway.
>> In such a case it might be good to have a dev_dbg() in the dev_err_probe() to
>> say that it is likely a bug in the code.
>>
>> Would you accept that approach?
> 
> ret is 1.  We have to revert this patch.

Note this was never applied, so no need to revert.

I'll apply patch 3/4 when I get around to it.

If some agreement is reached on patch 1/2 the new version of those can
be applied later.

Regards,

Hans

