Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EFB2D60A
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Nov 2023 07:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pmJ4V6iH"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4083740f92dso22353435e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 23:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700552235; x=1701157035; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cd9Rn1+ErogMloc48Do85CnJ72DAEMXmsJgR783y+jM=;
        b=pmJ4V6iHBFMU1Al5+noaTeUTNd7L9fX1eee7edbVFCtUO+vPlE+zu0e0SLvyB4u49A
         HfwjX4JSDK13s9jPUOCE+LK72G5Hz26v6J7PJobr0iU1oo+bQuudX8EQbliDxfVyO8Jf
         vbhEAxXBm5p3Ow6Xaoe1Fn+YpBVeVJMQYmYNWv8/cvSS/8HRWtjstJLpqoUorFvhVLME
         lGSADuDcEEHh6euId3a/NO2doUdrzsUuTTpNUEr1ojr42/UG4BDB9vUXJvXAFA4SrVI8
         CjaDLrOFWHc1vio7Yr+TV0bVpyFvFrLrOf+6lb/ml6oTdIvx/RNewObDQvbKQckbB+Bo
         T0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700552235; x=1701157035;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cd9Rn1+ErogMloc48Do85CnJ72DAEMXmsJgR783y+jM=;
        b=pkLyNeBXliUsCw8yHVaP+sYx2sM6E4E/JmSYS5RZVijU5ICeEkZzWPJauzVbV5kSEM
         m5PvMJ2IIwhN6VmFh3lnkU2dxoiJehO5LJKD5ce8z2AuL8dppGbp5309Uv6q/gmRADEn
         l4B3oih/wvqWey5jU6vTnxpu2k6br1kBiPyZedYdQ44jZP/VIl6vncTLeFN5GKLpT4yC
         KtUH44Wa+Ko4hxxWaYkLAxevUQlvSTL8alW49MVMYBcuqcZs/EszXak0l1kqNXbkGDCv
         reRMGw5M96jSE4ndSRmg4vonkZTuJL+AOVecjn4b99A+u9RRrt+fyAIj+ZpPxHv0f45P
         tMMA==
X-Gm-Message-State: AOJu0YyDEmuStNe0wUOxxE72e7ZeUprEm0GemHGJ5XF12NqWI6hdIHiK
	oD6L+9wr+BF1GQedlA60O7u3lub6HwrgzTHcboM=
X-Google-Smtp-Source: AGHT+IHjC8M9p2kZJpL32Q2qwTmF42YcRaZvRtIVeyKJa4Yoz0Y0jAiQxSUx4K8v7Yb8AYJBVDII6g==
X-Received: by 2002:a05:600c:1c85:b0:405:39b4:3145 with SMTP id k5-20020a05600c1c8500b0040539b43145mr7952845wms.2.1700552235292;
        Mon, 20 Nov 2023 23:37:15 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q11-20020a05600c46cb00b00403b63e87f2sm16253949wmo.32.2023.11.20.23.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 23:37:15 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 21 Nov 2023 02:37:12 -0500
To: oe-kbuild@lists.linux.dev, SeongJae Park <sj@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 32/42] mm/damon/core.c:1150
 damos_set_effective_quota() error: uninitialized symbol 'esz'.
Message-ID: <473b4c2e-863d-42ec-860a-bf8ec4385240@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   54ffd8ae08121d8cbce1874fe46970cce643a2c7
commit: 28cef0e565adbb4175f12ffffce9d0680979de60 [32/42] mm/damon/core: implement goal-oriented feedback-driven quota auto-tuning
config: x86_64-randconfig-161-20231121 (https://download.01.org/0day-ci/archive/20231121/202311210420.URG3QSAS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231121/202311210420.URG3QSAS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311210420.URG3QSAS-lkp@intel.com/

smatch warnings:
mm/damon/core.c:1150 damos_set_effective_quota() error: uninitialized symbol 'esz'.

vim +/esz +1150 mm/damon/core.c

1cd2430300594a SeongJae Park 2021-11-05  1127  static void damos_set_effective_quota(struct damos_quota *quota)
1cd2430300594a SeongJae Park 2021-11-05  1128  {
1cd2430300594a SeongJae Park 2021-11-05  1129  	unsigned long throughput;
1cd2430300594a SeongJae Park 2021-11-05  1130  	unsigned long esz;
1cd2430300594a SeongJae Park 2021-11-05  1131  
28cef0e565adbb SeongJae Park 2023-10-27  1132  	if (!quota->ms && !quota->get_score) {
1cd2430300594a SeongJae Park 2021-11-05  1133  		quota->esz = quota->sz;
1cd2430300594a SeongJae Park 2021-11-05  1134  		return;
1cd2430300594a SeongJae Park 2021-11-05  1135  	}
1cd2430300594a SeongJae Park 2021-11-05  1136  
28cef0e565adbb SeongJae Park 2023-10-27  1137  	if (quota->get_score) {
28cef0e565adbb SeongJae Park 2023-10-27  1138  		quota->esz_bp = damon_feed_loop_next_input(
28cef0e565adbb SeongJae Park 2023-10-27  1139  				max(quota->esz_bp, 10000UL),
28cef0e565adbb SeongJae Park 2023-10-27  1140  				quota->get_score(quota->get_score_arg));
28cef0e565adbb SeongJae Park 2023-10-27  1141  		esz = quota->esz_bp / 10000;
28cef0e565adbb SeongJae Park 2023-10-27  1142  	}

esz uninitialized on else path.

28cef0e565adbb SeongJae Park 2023-10-27  1143  
28cef0e565adbb SeongJae Park 2023-10-27  1144  	if (quota->ms) {
1cd2430300594a SeongJae Park 2021-11-05  1145  		if (quota->total_charged_ns)
1cd2430300594a SeongJae Park 2021-11-05  1146  			throughput = quota->total_charged_sz * 1000000 /
1cd2430300594a SeongJae Park 2021-11-05  1147  				quota->total_charged_ns;
1cd2430300594a SeongJae Park 2021-11-05  1148  		else
1cd2430300594a SeongJae Park 2021-11-05  1149  			throughput = PAGE_SIZE * 1024;
28cef0e565adbb SeongJae Park 2023-10-27 @1150  		esz = min(throughput * quota->ms, esz);
28cef0e565adbb SeongJae Park 2023-10-27  1151  	}
1cd2430300594a SeongJae Park 2021-11-05  1152  
1cd2430300594a SeongJae Park 2021-11-05  1153  	if (quota->sz && quota->sz < esz)
1cd2430300594a SeongJae Park 2021-11-05  1154  		esz = quota->sz;
28cef0e565adbb SeongJae Park 2023-10-27  1155  
1cd2430300594a SeongJae Park 2021-11-05  1156  	quota->esz = esz;
1cd2430300594a SeongJae Park 2021-11-05  1157  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

