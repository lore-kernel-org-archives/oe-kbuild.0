Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB55D1A5B9D
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Oct 2025 08:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760431189; cv=none; b=iUQ/TFld9H5Q4jf8AtaZGwSFMGwMZsluOmbUXkZ+Ee6uJ2NYejdIvlh/P8C8zhur9r3OqfadYsaOl6YjB6kNhLDikpQmGGGFkcv12rAw+nNofr0oGry2lqdrJMMA795Ckzf/ue/cXAhH2Gz+Laaiab+mfT62bKlP9kLNo3Tqjho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760431189; c=relaxed/simple;
	bh=hoQgCpk0WoxOoFSs/WuXrmbPtqn324Nd1OaXF4bX8iw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=mECtvJ6LyYaqrOiyV4OuXLhAYVjsfCqzoPRrgvxt7LGhltUUX6XekL3xI3i95izP9tine0PCUwb4qgJRJKo7ouXk4rEzmSOHKrTXIy0BcBJFD1DpnHCsmNFdhlsID09bjqSBNYkT1/0RiabD0QzXvcctxsKD/c8ZMpHHtPX69KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mjj64+wl; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mjj64+wl"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e6a6a5e42so21952355e9.0
        for <oe-kbuild@lists.linux.dev>; Tue, 14 Oct 2025 01:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760431186; x=1761035986; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YFWOuvnUfMwybXOtMoOd4svMVvGqzTx63g0iMz9e+aA=;
        b=Mjj64+wlNPKaJn0fMsOFm/WHy7mMDK7O0SuAPiH67OaCIcCZ50YUech8JnE72jsmHB
         KTGLnmhAC6k6/hXR+2DbrYZ7hPm/vT/EDb8ANexq0pRl+LrF+ssGybS7t214gfSE+lhA
         4vxjzdx8DfZ9tE1alvgzVPJJjbysrGMpFHeROS23Nqifb1OGDvSF+iWzaVJAhjs7r9ot
         R8xMZz8uD0ioBudww9nc4avEhq1R6BkhmCc0tOB8DJW8joLhrTOMBWKPRrLQpviWVkUd
         yTBDK/Glzq3oZBsx+Fb4j8uJXa4JQnKou1PjM/FgQzbIUWA+kbSS8hWnvK3ozKDcVdIR
         ++gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760431186; x=1761035986;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YFWOuvnUfMwybXOtMoOd4svMVvGqzTx63g0iMz9e+aA=;
        b=dVP3rw1YJjuyjZ8VwI3tJrfOAQiPeWpMU5P9zntZDMD3kyyWAy4mj1m8mOJ6S5Mxr5
         +smYZpit8WqE6kvNumQVce0wsJSKQkiuC+iVkMKz3g9LDX+qjgl7t8KhNxvffeBgn9sn
         ObzjVVpVmpbvEW+2/DYEAFq0JvAbH/hShEwtYkM+qLv+kyjiZCczXzp9YBcPsBesrQv9
         9NwaY8OmNPA4SGCOZavV4S0q/Wvr/27ccakdx91H7t+lz5UCQSBwTWmuiEYwWKnhWxA2
         0o06dMByrvLVQY/KArmpszw6PyGi6Mgst4IdF4Gm/u6NVCe9CpioTcv0KvFFU99VW9r/
         II2g==
X-Gm-Message-State: AOJu0YywzGZrGuQrxMShb3DihYqsZ+3RSA1GQ9r2pdHiWjSqQ005ovSB
	Iy78qIF00R/9gnuKQVmB3ABJF2L/EMbzQ+iz5TF/14asvmX1J42/N74IsMZ1+yE2hDVpqVJrZ2i
	dwO63
X-Gm-Gg: ASbGncvEaGpNSxwdF6SfibgesJO1ekR/Q8SZSDmPrevzueCse6rK9bCfqo3EqcN3ktZ
	i03bpYBBua+BQuH5iLRQ+GLHlpu5ntBolM57GUCUH8dYyL6jn5pex7TfjvVTvsYoBf6+q2DcqRb
	DG7SpirARVeZSIXLRhZSmZro/fB02sSqi5MOj1FhPfqUUYa1G4QAOr/+G0QkOCAlAlMi0tuBITS
	SMsBUPhkBhzETUw8pvadiKGShnIAP2Dc+kEO4q5jNrP+VqDbDcebGPS9EAJtHKsshxbAjRfHQdl
	II/iCxnJD2Mo7ANXhqAWuehiSJVcqOb81boeFrtRYmvh5KM1dIDY9AZeT+I2Aj7ojMMGfC60uHX
	UAq4wiv+H2bBjQxpgvwaba6SZlOxARoU8AItRN6Ck5Nl38KQ4mW+IwLPQ/hjBLQ==
X-Google-Smtp-Source: AGHT+IFDjuNxGsj9w5KIK44evH4nW82BXa1kd591GncY0F3Cb/1CX97GoQ+hu6emUu0ZcgJJ0c1fpA==
X-Received: by 2002:a05:6000:40da:b0:3f8:8aa7:465d with SMTP id ffacd0b85a97d-4266e7d4580mr13949163f8f.30.1760431185690;
        Tue, 14 Oct 2025 01:39:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-426ce5e8a06sm22476317f8f.55.2025.10.14.01.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 01:39:45 -0700 (PDT)
Date: Tue, 14 Oct 2025 11:39:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Andrew Davis <afd@ti.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 4/7] remoteproc: core: Use cleanup.h macros to
 simplify lock handling
Message-ID: <202510121908.7aduLIkw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010-remoteproc-cleanup-v2-4-7cecf1bfd81c@nxp.com>
Message-ID: <20251014083941.m5RAH-ea0vfo1N-YTwGnWTZdirmicEH_03enAEzgazs@z>

Hi Peng,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan/remoteproc-core-Drop-redundant-initialization-of-ret-in-rproc_shutdown/20251010-202737
base:   3b9b1f8df454caa453c7fb07689064edb2eda90a
patch link:    https://lore.kernel.org/r/20251010-remoteproc-cleanup-v2-4-7cecf1bfd81c%40nxp.com
patch subject: [PATCH v2 4/7] remoteproc: core: Use cleanup.h macros to simplify lock handling
config: i386-randconfig-141-20251012 (https://download.01.org/0day-ci/archive/20251012/202510121908.7aduLIkw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510121908.7aduLIkw-lkp@intel.com/

smatch warnings:
drivers/remoteproc/remoteproc_core.c:1841 rproc_trigger_recovery() warn: missing error code? 'ret'
drivers/remoteproc/remoteproc_core.c:1993 rproc_shutdown() warn: missing error code? 'ret'

vim +/ret +1841 drivers/remoteproc/remoteproc_core.c

70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1829  int rproc_trigger_recovery(struct rproc *rproc)
70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1830  {
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1831  	struct device *dev = &rproc->dev;
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1832  	int ret;
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1833  
c42baf6f84c7694 Peng Fan             2025-10-10  1834  	ACQUIRE(mutex_intr, lock)(&rproc->lock);
c42baf6f84c7694 Peng Fan             2025-10-10  1835  	ret = ACQUIRE_ERR(mutex_intr, &lock);
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1836  	if (ret)
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1837  		return ret;
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1838  
0b145574b6cd2b3 Alex Elder           2020-02-28  1839  	/* State could have changed before we got the mutex */
0b145574b6cd2b3 Alex Elder           2020-02-28  1840  	if (rproc->state != RPROC_CRASHED)
c42baf6f84c7694 Peng Fan             2025-10-10 @1841  		return ret;

Please change this to either "return 0;" or "return -ERRORCODE;"

0b145574b6cd2b3 Alex Elder           2020-02-28  1842  
0b145574b6cd2b3 Alex Elder           2020-02-28  1843  	dev_err(dev, "recovering %s\n", rproc->name);
0b145574b6cd2b3 Alex Elder           2020-02-28  1844  
ba194232edc032b Peng Fan             2022-09-28  1845  	if (rproc_has_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY))
ba194232edc032b Peng Fan             2022-09-28  1846  		ret = rproc_attach_recovery(rproc);
ba194232edc032b Peng Fan             2022-09-28  1847  	else
ba194232edc032b Peng Fan             2022-09-28  1848  		ret = rproc_boot_recovery(rproc);
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1849  
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1850  	return ret;
70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1851  }

[ snip ]

c13b780c4597e1e Suman Anna           2022-02-13  1976  int rproc_shutdown(struct rproc *rproc)
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1977  {
b5ab5e24e960b9f Ohad Ben-Cohen       2012-05-30  1978  	struct device *dev = &rproc->dev;
ee3d85da617a065 Peng Fan             2025-10-10  1979  	int ret;
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1980  
c42baf6f84c7694 Peng Fan             2025-10-10  1981  	ACQUIRE(mutex_intr, lock)(&rproc->lock);
c42baf6f84c7694 Peng Fan             2025-10-10  1982  	ret = ACQUIRE_ERR(mutex_intr, &lock);
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1983  	if (ret) {
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1984  		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
c13b780c4597e1e Suman Anna           2022-02-13  1985  		return ret;
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1986  	}
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1987  
c42baf6f84c7694 Peng Fan             2025-10-10  1988  	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED)
c42baf6f84c7694 Peng Fan             2025-10-10  1989  		return -EINVAL;
5e6a0e05270e3a4 Shengjiu Wang        2022-03-28  1990  
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1991  	/* if the remote proc is still needed, bail out */
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1992  	if (!atomic_dec_and_test(&rproc->power))
c42baf6f84c7694 Peng Fan             2025-10-10 @1993  		return ret;

Same.

400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1994  
fcd58037f28bf70 Arnaud Pouliquen     2018-04-10  1995  	ret = rproc_stop(rproc, false);
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1996  	if (ret) {
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1997  		atomic_inc(&rproc->power);
c42baf6f84c7694 Peng Fan             2025-10-10  1998  		return ret;
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1999  	}
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2000  
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2001  	/* clean up all acquired resources */
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2002  	rproc_resource_cleanup(rproc);
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2003  
33467ac3c8dc805 Loic Pallardy        2020-04-16  2004  	/* release HW resources if needed */
33467ac3c8dc805 Loic Pallardy        2020-04-16  2005  	rproc_unprepare_device(rproc);
33467ac3c8dc805 Loic Pallardy        2020-04-16  2006  
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2007  	rproc_disable_iommu(rproc);
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2008  
988d204cdaf604c Bjorn Andersson      2016-08-11  2009  	/* Free the copy of the resource table */
a0c10687ec9506b Bjorn Andersson      2016-12-30  2010  	kfree(rproc->cached_table);
a0c10687ec9506b Bjorn Andersson      2016-12-30  2011  	rproc->cached_table = NULL;
988d204cdaf604c Bjorn Andersson      2016-08-11  2012  	rproc->table_ptr = NULL;
c42baf6f84c7694 Peng Fan             2025-10-10  2013  
c13b780c4597e1e Suman Anna           2022-02-13  2014  	return ret;
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2015  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

