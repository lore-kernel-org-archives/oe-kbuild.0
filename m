Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1110BE5D
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Sep 2023 09:19:47 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-31ad779e6b3so4186469f8f.2
        for <oe-kbuild@lists.linux.dev>; Mon, 11 Sep 2023 02:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694423985; x=1695028785; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ZE7dnC4pH3loX1YgIlsYQxEchxcxB2/dXrFFcl1BpI=;
        b=HMLGid0RY8Z1ndP5xyX0ZEzvoBpldlSLkItFF6AabYPFM7n1ILV7HWZjzeE5HpUk/N
         pv6NHdwil/hcxWFitRPrtCDmfEwnizUpJU7uEpZMXs1y7l9TIPaGVhmO4Cg7/05BGjXN
         VkhJYNmummv4KTyqS05zRbFjPYhv3xlCU3o0q7bJlc2ICTuhKpEY5ffHZisT7Sd4fR/Q
         /rAGdQKcGhCdU+fYDwGEiCDIru7ScliS+36ap52DtEPbMV2Jl05cn559JfPgE4w8uzpw
         7S5h+N/D28IiLrmXJC64mraUoLh7GjlI4KEg4aQxk97AMU8uV/92sl2KD1UtsOeOMEVp
         zPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694423985; x=1695028785;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZE7dnC4pH3loX1YgIlsYQxEchxcxB2/dXrFFcl1BpI=;
        b=cfoSVEAGdbm3BcB80/f4lMPGg0wLm0sS6hBRU6hsskO337g9qQC5W6BpeJIbzesgP+
         Z1uZJe8dwCT05Oyuu1h+bctpQ/h+ruCYit4HbeJ5x+nLV+BHxyyJbXZmtLj/g9+Q9ww1
         ITSlQ6CkdTf5blAgAU+SXys4pdNcgZX+3xFmJcq6TsD1UsZMcTHbUoE8PacXYXF/EoHZ
         4iNKDTRRnu9FJBxGq7ZIxkhjrLViwYSohu6uE8oJApF3jI+/Tz/NMP1Qi9uWve9QgBCO
         FdMFlitMlKmAHBQKCPFY7xKr4Gc2yz8D+SqRRNvmtNu4Z0mFA7/Np0fraAjod1YUfwhP
         zfZw==
X-Gm-Message-State: AOJu0Yyx9X9fscqEixHQO25uClDlf0wdqBXSXKX6Qvf8NR2ubJlTTg90
	aVC3EBSxolgT/xSSk2iuMaDsVGYG9ofqkrrVuZE=
X-Google-Smtp-Source: AGHT+IGYUkFJxWZ6Hscm8xGOikeUHIghvhDtfhIl+KftX4nErJ+LK7eaj8NGPS4PBhoIbU4xGUeJqg==
X-Received: by 2002:a05:6000:180b:b0:31a:d450:c513 with SMTP id m11-20020a056000180b00b0031ad450c513mr7705684wrh.26.1694423985540;
        Mon, 11 Sep 2023 02:19:45 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t24-20020a1c7718000000b003fee7b67f67sm9381590wmi.31.2023.09.11.02.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 02:19:45 -0700 (PDT)
Date: Mon, 11 Sep 2023 12:19:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sasha Levin <sashal@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 47/53] mm/memory-failure.c:1926
 soft_offline_page() error: '%pG' must be followed by one of [gpv]
Message-ID: <4f8a9bc5-9c28-440f-b436-5ba115e29dcc@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   7bc636a9c8ac76445b7aac5ad0636c27711cdd80
commit: c60183ae1a1b4adea62af23fe1f18474a2511759 [47/53] mm,hwpoison: refactor get_any_page
config: i386-randconfig-141-20230831 (https://download.01.org/0day-ci/archive/20230831/202308310845.KU1RWOf6-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230831/202308310845.KU1RWOf6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202308310845.KU1RWOf6-lkp@intel.com/

smatch warnings:
mm/memory-failure.c:1926 soft_offline_page() error: '%pG' must be followed by one of [gpv]

vim +1926 mm/memory-failure.c

feec24a6139d46 Naoya Horiguchi 2019-11-30  1892  int soft_offline_page(unsigned long pfn, int flags)
86e057734bd1c4 Wanpeng Li      2013-09-11  1893  {
86e057734bd1c4 Wanpeng Li      2013-09-11  1894  	int ret;
feec24a6139d46 Naoya Horiguchi 2019-11-30  1895  	struct page *page;
b94e02822debdf Oscar Salvador  2020-10-15  1896  	bool try_again = true;
86e057734bd1c4 Wanpeng Li      2013-09-11  1897  
feec24a6139d46 Naoya Horiguchi 2019-11-30  1898  	if (!pfn_valid(pfn))
feec24a6139d46 Naoya Horiguchi 2019-11-30  1899  		return -ENXIO;
feec24a6139d46 Naoya Horiguchi 2019-11-30  1900  	/* Only online pages can be soft-offlined (esp., not ZONE_DEVICE). */
feec24a6139d46 Naoya Horiguchi 2019-11-30  1901  	page = pfn_to_online_page(pfn);
feec24a6139d46 Naoya Horiguchi 2019-11-30  1902  	if (!page)
86a66810baa87e Dan Williams    2018-07-13  1903  		return -EIO;
86a66810baa87e Dan Williams    2018-07-13  1904  
86e057734bd1c4 Wanpeng Li      2013-09-11  1905  	if (PageHWPoison(page)) {
c60183ae1a1b4a Oscar Salvador  2020-12-14  1906  		pr_info("%s: %#lx page already poisoned\n", __func__, pfn);
1e0e635be82132 Wanpeng Li      2015-09-08  1907  		if (flags & MF_COUNT_INCREASED)
dd6e2402fad966 Oscar Salvador  2020-10-15  1908  			put_page(page);
5a2ffca3c23333 Oscar Salvador  2020-10-15  1909  		return 0;
86e057734bd1c4 Wanpeng Li      2013-09-11  1910  	}
4e41a30c6d506c Naoya Horiguchi 2016-01-15  1911  
b94e02822debdf Oscar Salvador  2020-10-15  1912  retry:
4e41a30c6d506c Naoya Horiguchi 2016-01-15  1913  	get_online_mems();
c60183ae1a1b4a Oscar Salvador  2020-12-14  1914  	ret = get_any_page(page, flags);
4e41a30c6d506c Naoya Horiguchi 2016-01-15  1915  	put_online_mems();
4e41a30c6d506c Naoya Horiguchi 2016-01-15  1916  
c60183ae1a1b4a Oscar Salvador  2020-12-14  1917  	if (ret > 0) {
6b9a217eda4a13 Oscar Salvador  2020-10-15  1918  		ret = soft_offline_in_use_page(page);
c60183ae1a1b4a Oscar Salvador  2020-12-14  1919  	} else if (ret == 0) {
b94e02822debdf Oscar Salvador  2020-10-15  1920  		if (soft_offline_free_page(page) && try_again) {
b94e02822debdf Oscar Salvador  2020-10-15  1921  			try_again = false;
1f207076740101 Liu Shixin      2021-12-24  1922  			flags &= ~MF_COUNT_INCREASED;
b94e02822debdf Oscar Salvador  2020-10-15  1923  			goto retry;
b94e02822debdf Oscar Salvador  2020-10-15  1924  		}
c60183ae1a1b4a Oscar Salvador  2020-12-14  1925  	} else if (ret == -EIO) {
c60183ae1a1b4a Oscar Salvador  2020-12-14 @1926  		pr_info("%s: %#lx: unknown page type: %lx (%pGP)\n",
                                                                                                              ^
This was intended to be lower case 'p' was intended.  Fixed in commit
6696d2a6f38c ("mm,hwpoison: fix printing of page flags").


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

