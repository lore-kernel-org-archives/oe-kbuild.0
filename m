Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB08F2C15A3
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Oct 2025 07:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761204710; cv=none; b=ttWu0Dfenxrg4SKaSV/KGgvAmpM8OLLeMlwlt+ykpRjPJOcp2FGoq0kDhezbX1rCofzVoau/m47A3j4AZB2pktCcILjGIbdbCj8duRbV721oKVBNQaHhw73vXYA/LK0iDAuescPHVaKTrQeqBZAlaP2b8gu33VKJFF3szgBrKf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761204710; c=relaxed/simple;
	bh=JggR+4lhgxon5VrrXYFEgHKpnGz2RPpuX3MhDbFS6oA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YdKO9qz3TD/dB/ckAcjbQtzL/VvlnvSwP33d9sJEyCTlBmWhGPnWzfR1GAL5zvDaorXAijNGHwD4094PAQMFtKzJOzd4vcHcivLo1Jx7Vlqmb5WvlGYEcccTfTLO4+cWKZ10tIF0l4o+yPp+tmqzhdocLpwQ6PM8Mwca7gM2Ma4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V2remf0+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V2remf0+"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4711f156326so4034915e9.1
        for <oe-kbuild@lists.linux.dev>; Thu, 23 Oct 2025 00:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761204706; x=1761809506; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j7rh8SJ9gjn1LcIjZxSZPwMUci0AXXC8rNsZtSMot00=;
        b=V2remf0+8a/OrEzstsr0X/tH16QxqGVhdl+SfF9CoBkn9Pa7X391mi/J/rzNkENDyS
         j14Q1rM65KKp/6YMibLM5DII8jVDT48fVRDBNLycjjDShTFwHmOV2prp3TyERcgsuiRz
         5n8gHwN7j0E/ewRtHsVMd+KfgeR/4AP2CMw/whUd3vVlwGNRWHqkUuyywKd1d4IBX92y
         KUdCuov0+gV/5lj1E9rpRoTlVECD42VBHYU7zaY/SRtWE21wYZ3laPHQmtJWjKii3A8T
         guiy4uLysH4zHhwxzESZYhYqE9uWipU2dBL8cOr88Ry6+52ok9gCkkvDVCSpHYlxCI3S
         Irgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761204706; x=1761809506;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j7rh8SJ9gjn1LcIjZxSZPwMUci0AXXC8rNsZtSMot00=;
        b=GvFto1d41FaXU1VhT4PzW+yhQ4wpXSbFsmiQWFbj6VAFy8K0t7CxNMax75+d83XIsO
         trDwH6RC5KNXK4v1UgtMpk6F8a0BxU1hHdYcFjseYrfAYl61WgnrMeVP7m7V45dfU89B
         iA/9jFd4etn+LVcQKgY4py+gG13LVdf9AbJ3qvVBUKL/elI1ORI19NL9UQjU91vR3Ojh
         H9y5MIyoN6/eE5L4bkmrhAC3zXAUulwY0EyZGi4G2ptxoO1Vi7VSBmSTVB8xbRxHaPAg
         vqzP/CTI7XRHDF73kIH+4zhcVRRpUZH3rQ2fCZw/lkvo2gF2rM7eWIb4LlFI9ECohigK
         UKvA==
X-Gm-Message-State: AOJu0YyXTTM/ebVJI2KouyvyCDltr3VdJYP91HdBwFrvQjgxanU1W1y6
	12VRB1AWUvGmhuCnphh/WMwN3qFbGq8qCClne1Zs79wA1v5Sg3aVhw8sXaPyjcil8k/l6Sl1glx
	LKAuj
X-Gm-Gg: ASbGnctcL8WJFU5oicsLH6muwpgJFYkk4HKJoPZfCpjYASt/xjViDSjgYYMxxc+aHWO
	IXFgAiV4ob5j6XCGMvbI9cZHw6SnmP9xYhC1ojjKQ3eC4rKenQ9Q91pInt+T+IoFAG4d3ajlGVk
	HZi6YsuYPFGD0PNam0ALfKjz25U+vVp7GeeZZXbB4TWhLV0h3PPAQpzndKXwh2i7sr6NXfwZW16
	NiQ1eq6rOiAxzOweT3y5e9mpuoInGWOanLhGumpJIMw8+gF49vv1HTyFeE8z6+R2VEZ4Gq30Bzm
	fBpLtBD/WOiHN+hxEa9snZ5qfbKAACg82wsP8uJgMBMleEsg6nkMln5/MpYAmWQJwyoqHPaQ/bt
	NM95lm8Lij53FyLlX+Zs7PzEz0DCH40tgYeETRdcF0Et03XhvqbiSczEM75SqeKScIdz2Qr+Yzk
	81jw7nVxuC8wfo4rYL
X-Google-Smtp-Source: AGHT+IESUWagdqnffAAf3bOVzRjniJgfIHxBtYyyZ9IRSdPPeiTfClecTkaGhBF5qh1fVlFvauXFYg==
X-Received: by 2002:a05:600c:3b8d:b0:471:9da:5248 with SMTP id 5b1f17b1804b1-47117917155mr159364105e9.26.1761204705823;
        Thu, 23 Oct 2025 00:31:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475c428e9b2sm82179725e9.5.2025.10.23.00.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 00:31:45 -0700 (PDT)
Date: Thu, 23 Oct 2025 10:31:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jack Pham <jack.pham@oss.qualcomm.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [usb:usb-testing 45/48] drivers/usb/typec/mux/ps883x.c:171
 ps883x_sw_set() warn: inconsistent returns '&retimer->lock'.
Message-ID: <202510231023.aJ09O6pk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251023073142.wuIjcDirNTTH8xqYdnBnm3DTQGFPBieDSb9EwsPhhLI@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   93741bd104ce07a790519ecee3a331ee7cf61ae3
commit: f83cb615cb7a615f9c15787f914a8eee1c6e93d4 [45/48] usb: typec: ps883x: Cache register settings, not Type-C mode
config: i386-randconfig-141-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231023.aJ09O6pk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510231023.aJ09O6pk-lkp@intel.com/

smatch warnings:
drivers/usb/typec/mux/ps883x.c:171 ps883x_sw_set() warn: inconsistent returns '&retimer->lock'.

vim +171 drivers/usb/typec/mux/ps883x.c

257a087c8b5206 Abel Vesa     2025-02-06  145  static int ps883x_sw_set(struct typec_switch_dev *sw,
257a087c8b5206 Abel Vesa     2025-02-06  146  			 enum typec_orientation orientation)
257a087c8b5206 Abel Vesa     2025-02-06  147  {
257a087c8b5206 Abel Vesa     2025-02-06  148  	struct ps883x_retimer *retimer = typec_switch_get_drvdata(sw);
257a087c8b5206 Abel Vesa     2025-02-06  149  	int ret = 0;
257a087c8b5206 Abel Vesa     2025-02-06  150  
257a087c8b5206 Abel Vesa     2025-02-06  151  	ret = typec_switch_set(retimer->typec_switch, orientation);
257a087c8b5206 Abel Vesa     2025-02-06  152  	if (ret)
257a087c8b5206 Abel Vesa     2025-02-06  153  		return ret;
257a087c8b5206 Abel Vesa     2025-02-06  154  
257a087c8b5206 Abel Vesa     2025-02-06  155  	mutex_lock(&retimer->lock);
257a087c8b5206 Abel Vesa     2025-02-06  156  
257a087c8b5206 Abel Vesa     2025-02-06  157  	if (retimer->orientation != orientation) {
257a087c8b5206 Abel Vesa     2025-02-06  158  		retimer->orientation = orientation;
257a087c8b5206 Abel Vesa     2025-02-06  159  
f83cb615cb7a61 Konrad Dybcio 2025-10-14  160  		ret = regmap_assign_bits(retimer->regmap, REG_USB_PORT_CONN_STATUS_0,
f83cb615cb7a61 Konrad Dybcio 2025-10-14  161  					 CONN_STATUS_0_ORIENTATION_REVERSED,
f83cb615cb7a61 Konrad Dybcio 2025-10-14  162  					 orientation == TYPEC_ORIENTATION_REVERSE);
f83cb615cb7a61 Konrad Dybcio 2025-10-14  163  		if (ret) {
f83cb615cb7a61 Konrad Dybcio 2025-10-14  164  			dev_err(&retimer->client->dev, "failed to set orientation: %d\n", ret);
f83cb615cb7a61 Konrad Dybcio 2025-10-14  165  			return ret;

mutex_unlock(&retimer->lock);

f83cb615cb7a61 Konrad Dybcio 2025-10-14  166  		}
257a087c8b5206 Abel Vesa     2025-02-06  167  	}
257a087c8b5206 Abel Vesa     2025-02-06  168  
257a087c8b5206 Abel Vesa     2025-02-06  169  	mutex_unlock(&retimer->lock);
257a087c8b5206 Abel Vesa     2025-02-06  170  
257a087c8b5206 Abel Vesa     2025-02-06 @171  	return ret;
257a087c8b5206 Abel Vesa     2025-02-06  172  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

