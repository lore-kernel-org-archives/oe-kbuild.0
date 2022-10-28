Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B28FE817;
	Fri, 28 Oct 2022 01:34:23 +0000 (UTC)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Mz4p01CPdzHvcv;
	Fri, 28 Oct 2022 09:34:00 +0800 (CST)
Received: from dggpeml500003.china.huawei.com (7.185.36.200) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 28 Oct 2022 09:34:14 +0800
Received: from [10.174.177.173] (10.174.177.173) by
 dggpeml500003.china.huawei.com (7.185.36.200) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 28 Oct 2022 09:34:14 +0800
Message-ID: <0b833625-2f8e-b8cf-64ba-ccc4886bde6b@huawei.com>
Date: Fri, 28 Oct 2022 09:34:13 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [RFC PATCH 2/2] rtc: fix race condition in rtc_set_time()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>, <oe-kbuild@lists.linux.dev>
CC: <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
References: <202210272124.80CQQRZ8-lkp@intel.com>
From: Yu Liao <liaoyu15@huawei.com>
In-Reply-To: <202210272124.80CQQRZ8-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.173]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500003.china.huawei.com (7.185.36.200)
X-CFilter-Loop: Reflected

On 2022/10/27 21:43, Dan Carpenter wrote:
> Hi Yu,
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Liao/rtc-fix-race-condition-between-uie-enable-and-rtc-set-time/20221026-113739
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
> patch link:    https://lore.kernel.org/r/20221026033348.1660732-3-liaoyu15%40huawei.com
> patch subject: [RFC PATCH 2/2] rtc: fix race condition in rtc_set_time()
> config: loongarch-randconfig-m041-20221026
> compiler: loongarch64-linux-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> smatch warnings:
> drivers/rtc/interface.c:176 rtc_set_time() warn: inconsistent returns '&rtc->ops_lock'.
> 
Thanks for catching that. I will fix it in v2.
Thanks,
Yu
> vim +176 drivers/rtc/interface.c
> 
> ab6a2d70d18edc David Brownell    2007-05-08  128  int rtc_set_time(struct rtc_device *rtc, struct rtc_time *tm)
> 0c86edc0d49706 Alessandro Zummo  2006-03-27  129  {
> 7e7c005b4b1f1f Alexandre Belloni 2019-10-21  130  	int err, uie;
> 0c86edc0d49706 Alessandro Zummo  2006-03-27  131  
> 0c86edc0d49706 Alessandro Zummo  2006-03-27  132  	err = rtc_valid_tm(tm);
> 0c86edc0d49706 Alessandro Zummo  2006-03-27  133  	if (err != 0)
> 0c86edc0d49706 Alessandro Zummo  2006-03-27  134  		return err;
> 0c86edc0d49706 Alessandro Zummo  2006-03-27  135  
> 4c4e5df1f346f7 Baolin Wang       2018-01-08  136  	err = rtc_valid_range(rtc, tm);
> 4c4e5df1f346f7 Baolin Wang       2018-01-08  137  	if (err)
> 4c4e5df1f346f7 Baolin Wang       2018-01-08  138  		return err;
> 71db049e7355f3 Alexandre Belloni 2018-02-17  139  
> 989515647e7832 Baolin Wang       2018-01-08  140  	rtc_subtract_offset(rtc, tm);
> 989515647e7832 Baolin Wang       2018-01-08  141  
> dfadcce7a196d5 Yu Liao           2022-10-26  142  	err = mutex_lock_interruptible(&rtc->ops_lock);
> dfadcce7a196d5 Yu Liao           2022-10-26  143  	if (err)
> dfadcce7a196d5 Yu Liao           2022-10-26  144  		return err;
> dfadcce7a196d5 Yu Liao           2022-10-26  145  
> 7e7c005b4b1f1f Alexandre Belloni 2019-10-21  146  #ifdef CONFIG_RTC_INTF_DEV_UIE_EMUL
> 7e7c005b4b1f1f Alexandre Belloni 2019-10-21  147  	uie = rtc->uie_rtctimer.enabled || rtc->uie_irq_active;
> 7e7c005b4b1f1f Alexandre Belloni 2019-10-21  148  #else
> 7e7c005b4b1f1f Alexandre Belloni 2019-10-21  149  	uie = rtc->uie_rtctimer.enabled;
> 7e7c005b4b1f1f Alexandre Belloni 2019-10-21  150  #endif
> 7e7c005b4b1f1f Alexandre Belloni 2019-10-21  151  	if (uie) {
> dfadcce7a196d5 Yu Liao           2022-10-26  152  		err = __rtc_update_irq_enable(rtc, 0);
> 7e7c005b4b1f1f Alexandre Belloni 2019-10-21  153  		if (err)
> 7e7c005b4b1f1f Alexandre Belloni 2019-10-21  154  			return err;
> 
> Unlock before returning.
> 
> 7e7c005b4b1f1f Alexandre Belloni 2019-10-21  155  	}
> 7e7c005b4b1f1f Alexandre Belloni 2019-10-21  156  
> 0c86edc0d49706 Alessandro Zummo  2006-03-27  157  	if (!rtc->ops)
> 0c86edc0d49706 Alessandro Zummo  2006-03-27  158  		err = -ENODEV;
> bbccf83f6c4e1a Alessandro Zummo  2009-01-06  159  	else if (rtc->ops->set_time)
> cd9662094edf41 David Brownell    2007-05-08  160  		err = rtc->ops->set_time(rtc->dev.parent, tm);
> 606cc43c720bde Alexandre Belloni 2019-03-20  161  	else
> bbccf83f6c4e1a Alessandro Zummo  2009-01-06  162  		err = -EINVAL;
> 0c86edc0d49706 Alessandro Zummo  2006-03-27  163  
> 14d0e347ea2db5 Zoran Markovic    2013-06-26  164  	pm_stay_awake(rtc->dev.parent);
> 5f9679d29c7959 NeilBrown         2011-12-09  165  	/* A timer might have just expired */
> 5f9679d29c7959 NeilBrown         2011-12-09  166  	schedule_work(&rtc->irqwork);
> 29a1f599c0cc37 Baolin Wang       2017-12-14  167  
> 7e7c005b4b1f1f Alexandre Belloni 2019-10-21  168  	if (uie) {
> dfadcce7a196d5 Yu Liao           2022-10-26  169  		err = __rtc_update_irq_enable(rtc, 1);
> 7e7c005b4b1f1f Alexandre Belloni 2019-10-21  170  		if (err)
> 7e7c005b4b1f1f Alexandre Belloni 2019-10-21  171  			return err;
> 
> Unlock.
> 
> 7e7c005b4b1f1f Alexandre Belloni 2019-10-21  172  	}
> dfadcce7a196d5 Yu Liao           2022-10-26  173  	mutex_unlock(&rtc->ops_lock);
> 7e7c005b4b1f1f Alexandre Belloni 2019-10-21  174  
> 29a1f599c0cc37 Baolin Wang       2017-12-14  175  	trace_rtc_set_time(rtc_tm_to_time64(tm), err);
> 0c86edc0d49706 Alessandro Zummo  2006-03-27 @176  	return err;
> 0c86edc0d49706 Alessandro Zummo  2006-03-27  177  }
> 0c86edc0d49706 Alessandro Zummo  2006-03-27  178  EXPORT_SYMBOL_GPL(rtc_set_time);
> 

