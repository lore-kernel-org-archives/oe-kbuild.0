Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798B6481235
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Aug 2026 13:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786107961; cv=none; b=aHElupVLjSpDnBqtSShgT8g1A8ihoJ6nYT/IRqeFJ9XFVSbLr8Lq5rXqM4XYUot9a3WCvHJklndYjexv9HWlOe/AlGRdnc/HSNp1fRbOdoNMVvQy0FVMNVQZn4Dj2ZZ+gIuMMTsCeyyXinXKw+xOXnLQSfJOXF3n44kYPCCsxyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786107961; c=relaxed/simple;
	bh=n0Vn19nqj/lB2ugZp0+zOqsjg/7ogGYsadcpngMRmHY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=pLFm7Pq1+OmzpwT6EMSeP1msspTIWm266UHF+AozkuMYLURBPmXWCPiV3BlqJzFOGuLvu75zE2UTT1faPsZ8fuY925niabvQ4gCjdyiUhziBJabALx2eYeYblycCqhvUptGO6+fceK9ZMTSrwq4tv/9Ei3bkrNvsUfg3z69fgAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APNvkXhX; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APNvkXhX"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so2653727f8f.1
        for <oe-kbuild@lists.linux.dev>; Fri, 07 Aug 2026 06:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786107947; x=1786712747; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c1a7P4jiviNU6oOtgbodYFwN4kHdnf0MCA2I2A5Ygzo=;
        b=APNvkXhXNsoORqZUnFvB8Yn3JBJ7tB5V4k37LjD+f2MMnP+ZR6EF9VyWDwx03ycq2u
         cVxJv8Tg6RlD/TUMM/kjeiV1r7j10tSdshs3fEEJHpgDahWprP1s34/Ut/WO9OzHTbxI
         EbUILaLH8I3K+7U5G/+l+Q0SFhgJS/SpkwwYeZTtSQp6aOEq6VWTWRAANOWTD4OT2akp
         I7uHxR7tEWTB6JxCJtc6/PtKo3q2LiLnznGGjfHgu8wscsds4woC/u+t9+ug58aMaeh2
         w4DdL+6wPbfjfb6mH9rNG//cpCCdvCR+B+T1UiN4t5IWCJPEvZhPl45CRKZ+oHAD3pPz
         hi+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786107947; x=1786712747;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c1a7P4jiviNU6oOtgbodYFwN4kHdnf0MCA2I2A5Ygzo=;
        b=d9cSUi30m236DxTvtApirSyIEOoC/rpc/y2dFFsM6m9Lc8NvWzQXFWpCslnCC+7B4o
         ogBpXGrNkFW/FAkX/yaThSx1N35PCVnfHJEIruBcbyKcddtM3dvRMGuC45zXfCISm/kh
         mPnY4yYlnMEK3j5M0VeUrX9OqS2e1zpJ8EPlU+FV/X6pGrHv9JflqAboBnT6ai8DdKFy
         Yy7KNBVPwG7yb7wflP0yBgKVcDla4t+C8aoW65If4ik14/j8jvfrBNCKVayYdBlYJVaR
         LfaBYwcLAOyLyBFjECvTqD7E1nLgLU/eARLqQMn538QFrnPyKAwkbmBml4hveXb+PT48
         uw1g==
X-Gm-Message-State: AOJu0YwuoK8rP20WVudrBMQ7yWl9uxUb4Dfw0c21Xf8w2Dd9lA6PKSYC
	Vx4SetWZiwGXJXh1HbSswrX3op8aAqRsVa0swIyptl+H0f5H5NRxU1ivVjnZQjjEivU=
X-Gm-Gg: AR+sD12XwuV3rQ7ZXRej5Jx2WYLjBdyY2F2Kk4NK9ejxy3mFMfzIeAzALzZyGvjvIZd
	I2aRMKXxWW+JvCbgtkTnZb57w9eIMETKqBkXmN7CP7bxZE7OwdEIFMjpFc/N2RXqdIvC8PC6dTc
	Y9rjaT3uF2skPE2DjbCk2F2Lu9izf/tN0/lc87hZb/wkuLrwVDu3/1nJNPw0LgYajLfY6J/eEWz
	biiwVB7nXBTniGhiL4UYL9qldJadl5DbXsmUNLexYskcXyQxXzyqHdpe3luDBVGMcT4xsazW4XE
	GopiLbIFIyxl/Wjy/BqvVEO0Fd0gg0UwUIdc+nGp45XdqSX4rJ9/nUav8vC7PmHlSA1VOf4PFqX
	KH9eF4S66/riJdZsnQB2odmnKgMcH0Qw7wzRRDclwk5fNqDblNEvKcNU4YqLx8N7OVWdtC9ipKl
	g8/tqEqN4sQht+QFOihLQlP7WdkcrBGZxUyIO4XLh1BzNGStbhXoK1jw2mMAZx+Y2wKLk=
X-Received: by 2002:a05:6000:188f:b0:472:fe1a:1ee9 with SMTP id ffacd0b85a97d-47fec6334aemr37259511f8f.20.1786107947415;
        Fri, 07 Aug 2026 06:05:47 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800220ab04sm5132001f8f.37.2026.08.07.06.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:05:46 -0700 (PDT)
Date: Fri, 7 Aug 2026 16:05:43 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Elad Nachman <enachman@marvell.com>,
	alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, enachman@marvell.com
Subject: Re: [PATCH] drivers: rtc: handle OTF clock changes
Message-ID: <202608072059.hZ2oY5u0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624123103.3523728-1-enachman@marvell.com>
Message-ID: <20260807130543.dOWlzcJ6NEJ4TQPnIrbk_fNQqJA6lke8zRIaaXgq30M@z>

Hi Elad,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Elad-Nachman/drivers-rtc-handle-OTF-clock-changes/20260806-231215
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20260624123103.3523728-1-enachman%40marvell.com
patch subject: [PATCH] drivers: rtc: handle OTF clock changes
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260807/202608072059.hZ2oY5u0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608072059.hZ2oY5u0-lkp@intel.com/

smatch warnings:
drivers/rtc/interface.c:163 rtc_set_time() warn: variable dereferenced before check 'rtc' (see line 135)

vim +/rtc +163 drivers/rtc/interface.c

ab6a2d70d18edc David Brownell    2007-05-08  126  int rtc_set_time(struct rtc_device *rtc, struct rtc_time *tm)
0c86edc0d49706 Alessandro Zummo  2006-03-27  127  {
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  128  	int err, uie;
37b82b16c5f104 Elad Nachman      2026-06-24  129  	struct rtc_time new_tm;
0c86edc0d49706 Alessandro Zummo  2006-03-27  130  
0c86edc0d49706 Alessandro Zummo  2006-03-27  131  	err = rtc_valid_tm(tm);
0c86edc0d49706 Alessandro Zummo  2006-03-27  132  	if (err != 0)
0c86edc0d49706 Alessandro Zummo  2006-03-27  133  		return err;
0c86edc0d49706 Alessandro Zummo  2006-03-27  134  
4c4e5df1f346f7 Baolin Wang       2018-01-08 @135  	err = rtc_valid_range(rtc, tm);
4c4e5df1f346f7 Baolin Wang       2018-01-08  136  	if (err)
4c4e5df1f346f7 Baolin Wang       2018-01-08  137  		return err;
71db049e7355f3 Alexandre Belloni 2018-02-17  138  
989515647e7832 Baolin Wang       2018-01-08  139  	rtc_subtract_offset(rtc, tm);
989515647e7832 Baolin Wang       2018-01-08  140  
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  141  #ifdef CONFIG_RTC_INTF_DEV_UIE_EMUL
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  142  	uie = rtc->uie_rtctimer.enabled || rtc->uie_irq_active;
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  143  #else
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  144  	uie = rtc->uie_rtctimer.enabled;
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  145  #endif
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  146  	if (uie) {
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  147  		err = rtc_update_irq_enable(rtc, 0);
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  148  		if (err)
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  149  			return err;
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  150  	}
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  151  
0c86edc0d49706 Alessandro Zummo  2006-03-27  152  	err = mutex_lock_interruptible(&rtc->ops_lock);
0c86edc0d49706 Alessandro Zummo  2006-03-27  153  	if (err)
b68bb2632453a9 David Brownell    2008-07-29  154  		return err;
0c86edc0d49706 Alessandro Zummo  2006-03-27  155  
0c86edc0d49706 Alessandro Zummo  2006-03-27  156  	if (!rtc->ops)
0c86edc0d49706 Alessandro Zummo  2006-03-27  157  		err = -ENODEV;
bbccf83f6c4e1a Alessandro Zummo  2009-01-06  158  	else if (rtc->ops->set_time)
cd9662094edf41 David Brownell    2007-05-08  159  		err = rtc->ops->set_time(rtc->dev.parent, tm);
606cc43c720bde Alexandre Belloni 2019-03-20  160  	else
bbccf83f6c4e1a Alessandro Zummo  2009-01-06  161  		err = -EINVAL;
0c86edc0d49706 Alessandro Zummo  2006-03-27  162  
37b82b16c5f104 Elad Nachman      2026-06-24 @163  	if (rtc && rtc->ops && rtc->ops->read_time) {
                                                            ^^^
There is no point in checking "rtc" after we have already dereferenced
it.

37b82b16c5f104 Elad Nachman      2026-06-24  164  		if (!rtc->ops->read_time(rtc->dev.parent, &new_tm)) {
37b82b16c5f104 Elad Nachman      2026-06-24  165  			pr_debug("new rtc time secs %d mins %d hours %d mday %d mon %d year %d way %d yday %d dst %d\n",
37b82b16c5f104 Elad Nachman      2026-06-24  166  					new_tm.tm_sec, new_tm.tm_min,
37b82b16c5f104 Elad Nachman      2026-06-24  167  					new_tm.tm_hour, new_tm.tm_mday,
37b82b16c5f104 Elad Nachman      2026-06-24  168  					new_tm.tm_mon, new_tm.tm_year,
37b82b16c5f104 Elad Nachman      2026-06-24  169  					new_tm.tm_wday, new_tm.tm_yday,
37b82b16c5f104 Elad Nachman      2026-06-24  170  					new_tm.tm_isdst);
37b82b16c5f104 Elad Nachman      2026-06-24  171  		}
37b82b16c5f104 Elad Nachman      2026-06-24  172  	}
37b82b16c5f104 Elad Nachman      2026-06-24  173  
14d0e347ea2db5 Zoran Markovic    2013-06-26  174  	pm_stay_awake(rtc->dev.parent);
0c86edc0d49706 Alessandro Zummo  2006-03-27  175  	mutex_unlock(&rtc->ops_lock);
5f9679d29c7959 NeilBrown         2011-12-09  176  	/* A timer might have just expired */
5f9679d29c7959 NeilBrown         2011-12-09  177  	schedule_work(&rtc->irqwork);
29a1f599c0cc37 Baolin Wang       2017-12-14  178  
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  179  	if (uie) {
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  180  		err = rtc_update_irq_enable(rtc, 1);
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  181  		if (err)
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  182  			return err;
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  183  	}
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  184  
29a1f599c0cc37 Baolin Wang       2017-12-14  185  	trace_rtc_set_time(rtc_tm_to_time64(tm), err);
0c86edc0d49706 Alessandro Zummo  2006-03-27  186  	return err;
0c86edc0d49706 Alessandro Zummo  2006-03-27  187  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

